Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A5F13C9C4
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781356900; cv=none; b=s8fRUomylbx7zgCgaCZ6U5rHr80GbLmScOad2W0k4F2pHRjryppKBFvxOB/hMXJH/1PvMIduZ0rxuw7SK6uD8+nfhHzKcZjeQE55lT7Upz06jTkPoJ5i7awQSetW0wvJsTP4PZiNl+gwXHF86gZ9qAl8yxgvuhBnPlMlRSgCjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781356900; c=relaxed/simple;
	bh=HGK9/hrAgNGUg/aoWdkT0lsKIb7m4cgDtTJ7A5v705U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ep9niFwr3V0T4Dtjl1DQATWgv77UvEjKpPtemyMct7vZRSqg48QOOEzGmjnfSZ2iJw20ZOELGPL7s+lqMgdqG7ThwgOkKX6kr63ar2m6MjRqexULfNUWQitFxfIpTPR30axWqyLUxoM/8OTyRn1L5OP0rR/dQcGYfV384wgMv1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hb70202S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hb70202S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C2F1F00A3A;
	Sat, 13 Jun 2026 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781356899;
	bh=Pz3FJQymnNixVN7w7Cv3R2QLXIU99088cJqcmRm4IU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hb70202SDqvXHNdxoIOZ7YCQ06CndIc9WqyiBVWMusis7NYZGd41MHKNluh/sk7Ec
	 uNQOepH/FH6Hg90Nc2g26QFJW2MZQbBGZXoyyltFvbVJ1nxHhpH2+r1Rk2lbyqEOZu
	 dXQaxfBAxDCuY7pDXnvWaKdKcl/toFxyMCcKMiiSaNsnqPNOtgVPIrPQ6w9KxpgO8r
	 k4eCXsWi5Tj95+X78HyOdg9Jy1EIA6YGMhVA3vLz0EEm5gSMZUJ/iMlGyz9NL8nTQV
	 Fvm35+nsQAe5KLm1ky19/icU9rVfC78k6luWC45Uz20Z7wToLtwC2gCT4qdQCGK7K1
	 qYqIGlo2T+0iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 9/9] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-block-as-nvmem-v5-9-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-9-95e0b30fff90@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 13:21:38 +0000
Message-Id: <20260613132139.06C2F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Confused Deputy / Use-After-Free via dev_t reuse in block NVMEM pr=
ovider.
--

commit 459b659c960efdc8a9e2177c5bc4f832e7ee5730
Author: Daniel Golle <daniel@makrotopia.org>

block: implement NVMEM provider

On embedded devices using an eMMC it is common that one or more partitions
on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
data. Allow referencing the partition in device tree for the kernel and
Wi-Fi drivers accessing it via the NVMEM layer. For now, NVMEM is only
registered for the whole disk block device.

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000..c005f059d9fe5
> --- /dev/null
> +++ b/block/blk-nvmem.c
[ ... ]
> +static int blk_nvmem_reg_read(void *priv, unsigned int from, void *val, =
size_t bytes)
> +{
> +	blk_mode_t mode =3D BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
> +	dev_t devt =3D (dev_t)(uintptr_t)priv;
> +	size_t bytes_left =3D bytes;
> +	loff_t pos =3D from;
> +	int ret =3D 0;
> +
> +	struct file *bdev_file __free(fput) =3D bdev_file_open_by_dev(devt, mod=
e, priv, NULL);

[Severity: High]
Does this code allow for a cross-device data leak if the block device is
removed and its dev_t is reassigned?

If an NVMEM consumer (such as a WiFi driver or a process holding an open
sysfs file) retains an active reference to the NVMEM cell, the nvmem_device
remains alive even after blk_nvmem_del() calls nvmem_unregister() because
nvmem_unregister() only decrements the registration reference count.

If the block layer then frees the removed device's dev_t, it could be
immediately reassigned to a newly plugged block device (e.g. a USB stick).

If the consumer later reads the NVMEM cell, wouldn't bdev_file_open_by_dev()
successfully open the new device using the reused dev_t, allowing the
consumer to unknowingly read data from the unrelated device?

> +	if (IS_ERR(bdev_file))
> +		return PTR_ERR(bdev_file);
> +
[ ... ]
> +void blk_nvmem_add(struct block_device *bdev)
> +{
> +	struct device *dev =3D &bdev->bd_device;
> +	struct nvmem_config config =3D {};
[ ... ]
> +	config.id =3D NVMEM_DEVID_NONE;
> +	config.dev =3D dev;
> +	config.name =3D dev_name(dev);
> +	config.owner =3D THIS_MODULE;
> +	config.priv =3D (void *)(uintptr_t)dev->devt;

[Severity: High]
Is it safe to store the dev_t here as the priv pointer?

Since the dev_t identifier can be reassigned by the block layer once the
device is removed, storing it this way might lead to the isolation issue
mentioned above if an NVMEM consumer holds a reference past the device's
removal.

> +	config.reg_read =3D blk_nvmem_reg_read;
> +	config.size =3D bdev_nr_bytes(bdev);
> +	config.word_size =3D 1;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-block-as-n=
vmem-v5-0-95e0b30fff90@oss.qualcomm.com?part=3D9
