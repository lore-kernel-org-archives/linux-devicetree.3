Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223EB2D7DD4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513686; cv=none; b=jVcw2aZhvjP6owLPJNl67NXVkDJs6Kc/iaC7gapbyH8NISfNuPpcbM0pVZrWgqjsEI/RMEfCdjVorahepactH0UYK7CLLRrwTvfnjdVCUmaGneDEWcBZS46D4YLFmj2a8LqIM5j90p5RF6Phr1Jp3VgpszKWfsxSYToedpC/90E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513686; c=relaxed/simple;
	bh=dpa5P3WC3UFXVytftubOPbYOlK2l34W50Ko669rPPkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bUEtHb1t2pdm8srd+5HZonPQeLLbYvm5QMtdeOTUAuxxFH5dasUNwhxpe6z8GbngiIeyJzxzOrqZWSxVLu1xwHv45FzFHhGRYCoEJkkcgC0JWn9y5KgRBlVqknglt4hb0QyHNPrztSSE494+HFIHnpqi3Isb7ir586HpmZjmvxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=og4g+bE9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="og4g+bE9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148EB1F00ACA;
	Fri, 31 Jul 2026 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785513684;
	bh=gnEYA+2QGnZsRpm7Pr8zvR5i7INZliojsdN4KPpBHIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=og4g+bE9DIN8CLDjWt2JGe3OVYIbL8g/q3bwcAmNEkDiAupRM5Mou0HikTGbInYon
	 3WQn0T63QgK6sxPtVNAF3CpAKDoUZsmO1UFqWSAkkoJieV/+zPdqR8WwzLwJWk9iTN
	 AIyj+SNa3cyFoKECapGAoUvrd/DKPRU+wxtZDCwoRn16N5U6zrMfNintZLgrYXx3gV
	 eY9Q6tQRTilYPKCllb0/0CSm53vxBHT0xXCSUR2/4rHFqFhSns9DzkSNqWq7jWDsAj
	 USl0iBKaKCzp5jbjFd+NjhZYVf0IMwt0jwh/fgBtsAu/YYGnFKERwpINo2wf0ogJUh
	 WA9SaHTuRU6aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/10] block: implement NVMEM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-block-as-nvmem-v9-6-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
 <20260730-block-as-nvmem-v9-6-f72935817dbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:01:23 +0000
Message-Id: <20260731160124.148EB1F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Information Leak and TOCTOU race via dev_t reuse in NVMEM reads.
- [Medium] API Contract Violation: NVMEM reads use BLK_OPEN_EXCL, causing l=
egitimate reads to fail with -EBUSY.
--

--- Patch [6]: [PATCH v9 06/10] block: implement NVMEM provider ---
commit 0a2168c8881ee78cc2df1f1e3f11c57aff14d1fd
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

block: implement NVMEM provider

Allow referencing a partition in device tree for the kernel and Wi-Fi
drivers to access it via the NVMEM layer. The NVMEM device is registered
for a block device whose OF node describes an NVMEM layout.

> The NVMEM device is a read-only side channel: the block device stays
> fully usable, reads are performed with a non-exclusive BLK_OPEN_READ
> open, and no synchronization is done against concurrent writes to the
> same region. This is acceptable for the intended use case of write-once,
> factory-provisioned data.

[Severity: Medium]
The commit message states that reads are performed with a non-exclusive
BLK_OPEN_READ open, but the implementation uses BLK_OPEN_EXCL. Will this
cause legitimate NVMEM reads to fail with -EBUSY if the underlying block
device or any of its partitions are already claimed by a filesystem?

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000..05bc35b9b8f37
> --- /dev/null
> +++ b/block/blk-nvmem.c

[ ... ]

> +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> +			      void *val, size_t bytes)
> +{
> +	struct block_device *bdev =3D priv;
> +	struct file *bdev_file;
> +	loff_t pos =3D from;
> +	ssize_t ret;
> +
> +	/* open and prevent other exclusive openers */
> +	bdev_file =3D bdev_file_open_by_dev(bdev->bd_dev,
> +					  BLK_OPEN_READ | BLK_OPEN_EXCL,
> +					  blk_nvmem_reg_read, NULL);

[Severity: High]
Is there a risk of a TOCTOU race and information leak here via dev_t reuse?

If the original partition is logically deleted, making its dev_t available,
and a new partition is created with the same dev_t, bdev_file_open_by_dev()
could look up and read from the newly created partition instead of the
original NVMEM partition.

Could we verify that file_bdev(bdev_file) =3D=3D bdev after opening to ensu=
re
the dev_t has not been reassigned to a different block device?

> +	if (IS_ERR(bdev_file))
> +		return PTR_ERR(bdev_file);
> +
> +	ret =3D kernel_read(bdev_file, val, bytes, &pos);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-block-as-n=
vmem-v9-0-f72935817dbf@oss.qualcomm.com?part=3D6
