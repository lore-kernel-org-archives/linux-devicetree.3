Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7C818CBE1
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783172756; cv=none; b=hEBGJU9RC7AiYrCmqbg8jlNvgovw4V3YtaboBRAbkrqBZp7spwmgV+NW3Js/Lp2Pbh+22nppmXTvudsVLbgcoZwWD9ixW8OndpjTr0rgXUm1ZyIEwAds0eUjUO877wlshaD/mr5PcYIcUxDLoLq5dzQF2gtxT2780Qu4DOlsZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783172756; c=relaxed/simple;
	bh=kSthDrIXrReK1MfGsq01Wtaa3DGE0VwYJK0uulYPb8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oohg2vVJ7L+wCWqJxZWv6W298hz3mwXzG7eChLEFVhdUFxqsrkEBOXDHpsVPWDmaipuWvsRb0SaNhiZIC54oQgPxx2G9/J2J5e4zJ8v0VxXAcAzftE2O0Uf+gc+8cgL1iRNfHBCyuLqo9Rrxz9oJBRhx5P653yBKjnVKutsJTUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNcCSe6g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNcCSe6g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C411F00A3A;
	Sat,  4 Jul 2026 13:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783172755;
	bh=iEXkopEP0tWEhbQetPuqbMtb3JPmDFgZ4d4nL/HF1t8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QNcCSe6guRYkwImmGmEqkQhMe55P5DL0bzcbSVnyymD5DwFxcx5Pm1KSJkDaqsnhl
	 g8bqhC7puT6uFm/Ptedmq6H/0UuzmUkCayEhEPL/zwKfyZjSwz8cNrtF03ro8jyuVV
	 8d8aymhUFUoXkDD9TueahlMTb2P2UiY/CkO0jVkOQGw1rCJeb2kW1jJpiUYPJpQ3/9
	 97GEwm/osHPMUZgyDpyFATtFHIV+B4hnHcDRjprYuBCxhaU0yL7VveScg/fzoCQzyM
	 N6gEQL3HkQSaqc4Ge7c2zab7H0u9WWcPWNJbTFwrbdEgS5v8Z6AetL3Ru/CUFU2+sY
	 AlRscvw9YFfjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/9] block: implement NVMEM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 13:45:54 +0000
Message-Id: <20260704134554.D6C411F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The NVMEM provider incorrectly sets `config.owner =3D THIS_MODULE`=
, failing to pin the underlying block device driver module and causing a Us=
e-After-Free if the driver module is unloaded while a consumer holds an NVM=
EM cell.
--

commit 658c388a96462e54e252d777f2fc96dcf4f36d59
Author: Daniel Golle <daniel@makrotopia.org>

block: implement NVMEM provider

This patch allows block devices or partitions to act as NVMEM providers,
exposing factory-provisioned data such as MAC addresses or Wi-Fi calibration
blobs. It introduces blk_nvmem_add to register the block device with the
NVMEM framework when the appropriate device tree nodes are present.

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000..642a12f8a8b1c
> --- /dev/null
> +++ b/block/blk-nvmem.c

[ ... ]

> +int blk_nvmem_add(struct block_device *bdev)
> +{
> +	struct device *dev =3D &bdev->bd_device;
> +	struct nvmem_config config =3D {};
> +	struct nvmem_device *nvmem;

[ ... ]

> +	config.id =3D NVMEM_DEVID_NONE;
> +	config.dev =3D dev;
> +	config.name =3D dev_name(dev);
> +	config.owner =3D THIS_MODULE;

[Severity: High]
Should this owner be set to the block device driver's module, such as
bdev->bd_disk->fops->owner, instead of THIS_MODULE?

By setting config.owner to THIS_MODULE, it seems we pin the block core
module but fail to protect the actual block device driver (like mmc_block)
from being unloaded while a consumer still holds a reference to the NVMEM
cell.=20

If the driver module is unloaded, its module memory is freed. When the
consumer later releases the cell and the bd_device refcount drops to zero,
could disk_release() end up calling disk->fops->free_disk on a now-unmapped
driver module pointer and cause a crash?

> +	config.priv =3D (void *)(uintptr_t)dev->devt;
> +	config.reg_read =3D blk_nvmem_reg_read;
> +	config.size =3D bdev_nr_bytes(bdev);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-block-as-n=
vmem-v8-0-98ae32bfc49a@oss.qualcomm.com?part=3D5
