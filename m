Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F438E8BD
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078031; cv=none; b=KQ09OWD/lUP28gUTeq9ZgWG4X/0sN7tEH3HvamtiRWCwgELu5yyXD4k1DdzEavFmjZIhPzvTPbNy3Yve1yCgHr0G11bpJpcJBBNxRWrj2xyGlfWcBKytIPXIe/UCT6gOEA40lfbcyVw7RQE1ORXBY4yFKx3SHzaZqYMye/12RQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078031; c=relaxed/simple;
	bh=duNt+TBIi70gOtV4W22kLh5zbVsdYJjKhKdBOpd5/yw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jMG1yXLNxo9/OSQmPaQikkhZJ5GT2x4zf18y5SRovKlJgbD2Dhhgmt3m97PPhW49d8KPqumzi6cX1dXhKYu7f8FXOQrwc0LXgP9G/wyiD2m1JmG3mj3pK9Y8TDpg/GhpfBsBxiL2O/fHNSt9TdjGVhF6DuwxAoc6Af6mAqNgwyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ek/dWC9P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ek/dWC9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2F51F00893;
	Wed, 10 Jun 2026 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781078029;
	bh=7lbnN85sgS5oknwwODCG6LAuSnA3+en2yvmHmTbXJF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ek/dWC9PzQWpOEziTXuqgCnMZxfF077G083ed1Z0N71jHXVw8FlLANA1EgMeD9A8k
	 tpnESk9UdDe8Cb119GoJiKT2eRQJ8zWFzHXLenFKMNaCV3S5GEqdITkcnoSxXNIMbZ
	 Vy8KVF+kKaWKcUxwkYvzuyX+woVkGwwREhiDXeSRhN6Ttfwy8M/2620NxiUDfz84C4
	 TcakwxAMfUPQahc4fPrfCA8Xz6t096UXRaBosJS4BL3CfdzCtudYzi8knb8pdWUvx0
	 6DzGws7D6kx+VPtIygg+zj0VAPl0YD6KbOluDsGZO/AyN8CLPaxMzM4i4U+aNXHVZ/
	 J/tHhcKg4h+mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/8] block: implement NVMEM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609-block-as-nvmem-v4-4-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-4-45712e6b22c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 07:53:48 +0000
Message-Id: <20260610075349.5B2F51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Assigning the 64-bit block device size to the `int` typed `config.=
size` field causes an integer overflow for partitions between 2GB and 4GB, =
disabling NVMEM bounds checking.
- [High] Opening the block device per-read with `BLK_OPEN_RESTRICT_WRITES` =
and closing it via `__free(fput)` causes unpredictable `-EBUSY` failures fo=
r concurrent writers and floods system workqueues.
- [High] Using `devm_nvmem_register()` on a driverless block device creates=
 an unresolvable reference cycle, permanently leaking both the block device=
 and the NVMEM device on teardown.
- [High] The NVMEM provider stores `devt` as private data, leading to a sil=
ent Wrong Device Access if the original block device is removed and its `de=
vt` is recycled.
--

commit 14c60083ba6e54d749e04b67cf95e61484f8571f
Author: Daniel Golle <daniel@makrotopia.org>

block: implement NVMEM provider
   =20
On embedded devices using an eMMC it is common that one or more partitions
on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
data. Allow referencing the partition in device tree for the kernel and
Wi-Fi drivers accessing it via the NVMEM layer.

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000..a6e62fa98675e
> --- /dev/null
> +++ b/block/blk-nvmem.c
[ ... ]
> +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> +			      void *val, size_t bytes)
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
Does releasing the block device file via standard fput() instead of bdev_fp=
ut()
cause unpredictable -EBUSY failures for concurrent writers?

Since blk_nvmem_reg_read() opens the block device with
BLK_OPEN_RESTRICT_WRITES, it exclusively blocks writers. The standard
__free(fput) defers the release asynchronously to a workqueue.

Because bdev_fput() is bypassed, the write restriction isn't synchronously
yielded, which can spuriously block other system utilities or writers with
-EBUSY. Furthermore, if a driver reads NVMEM data in small chunks, will this
instantiate and defer thousands of file closures, heavily loading system
workqueues?

> +	if (IS_ERR(bdev_file))
> +		return PTR_ERR(bdev_file);
[ ... ]
> +static int blk_nvmem_register(struct device *dev)
> +{
> +	struct block_device *bdev =3D dev_to_bdev(dev);
> +	struct nvmem_config config =3D {};
> +
> +	/* skip devices which do not have a device tree node */
> +	if (!dev_of_node(dev))
> +		return 0;
> +
> +	/* skip devices without an nvmem layout defined */
> +	struct device_node *child __free(device_node) =3D
> +		of_get_child_by_name(dev_of_node(dev), "nvmem-layout");
> +	if (!child)
> +		return 0;
> +
> +	/*
> +	 * skip block device too large to be represented as NVMEM devices,
> +	 * the NVMEM reg_read callback uses an unsigned int offset
> +	 */
> +	if (bdev_nr_bytes(bdev) > UINT_MAX) {
> +		dev_warn(dev, "block device too large to be an NVMEM provider\n");
> +		return -ENODEV;
> +	}
> +
> +	config.id =3D NVMEM_DEVID_NONE;
> +	config.dev =3D dev;
> +	config.name =3D dev_name(dev);
> +	config.owner =3D THIS_MODULE;
> +	config.priv =3D (void *)(uintptr_t)dev->devt;

[Severity: High]
Can using a dynamically recycled device number lead to reading from the wro=
ng
device?

blk_nvmem_register() stores the block device's devt in config.priv, which
is then passed to blk_nvmem_reg_read() to open the device. If the original
block device is removed, its devt is freed and can be reallocated to a newly
plugged block device.

If a kernel consumer still holds a reference to the nvmem_device and perfor=
ms
a read, will bdev_file_open_by_dev() dynamically resolve the recycled devt
and successfully open the new device, potentially exposing arbitrary data
to the driver?

> +	config.reg_read =3D blk_nvmem_reg_read;
> +	config.size =3D bdev_nr_bytes(bdev);

[Severity: High]
Is it possible for the assignment of bdev_nr_bytes() to config.size to cause
an integer overflow that bypasses NVMEM bounds checking?

bdev_nr_bytes() returns a 64-bit loff_t, and the limit check in
blk_nvmem_register() allows block devices up to UINT_MAX. However, the size
field in struct nvmem_config is defined as a signed 32-bit int.

If the block device size is between 2GB and 4GB-1, will assigning it to
config.size result in a negative value (e.g., -1073741824)? When the NVMEM
core later copies this into nvmem->size (which is a 64-bit size_t), this
negative value sign-extends to a massive positive value, potentially allowi=
ng
consumers to read far past the end of the block device.

> +	config.word_size =3D 1;
> +	config.stride =3D 1;
> +	config.read_only =3D true;
> +	config.root_only =3D true;
> +	config.ignore_wp =3D true;
> +	config.of_node =3D to_of_node(dev->fwnode);
> +
> +	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
> +}
> +
> +static struct class_interface blk_nvmem_bus_interface __refdata =3D {
> +	.class =3D &block_class,
> +	.add_dev =3D &blk_nvmem_register,
> +};

[Severity: High]
Will using devm_nvmem_register() on a driverless block device create a
reference cycle that leaks both devices?

Block devices are driverless class devices, so devres_release_all() is only
invoked in device_release() when the device's reference count reaches zero.
However, nvmem_register() creates a child nvmem_device that takes a referen=
ce
on its parent block device.

Since blk_nvmem_bus_interface lacks a .remove_dev callback, the NVMEM device
is never manually unregistered when the block device is removed. Does this =
mean
the NVMEM device perpetually holds its reference to the parent block device,
preventing the parent's reference count from reaching zero and causing an
indefinite memory leak of both devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-block-as-n=
vmem-v4-0-45712e6b22c6@oss.qualcomm.com?part=3D4
