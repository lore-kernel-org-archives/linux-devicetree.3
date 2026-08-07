Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF7332EA2
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113584; cv=none; b=d0iUB9n5zxY+Zfu4QVlk9abEyZ2SYnb56TrNZTIlVHHqJQo1117l/CpqzVf84GvVPPp8X9ftrnsOLxKoVZ9A1quEa/cIFsf1Fa4SM+75dwIyG9dILxecrirl62PgKNgvc//XhsCloCy/AwPYTraujmrKCbO8EBeq16x2I87HXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113584; c=relaxed/simple;
	bh=4TwUaZW8FUKbrWjFTdGjMeQYdjBuT8ngkwReGbPh7Mg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bz665jZRS80kUsJEKFH3A1X8m/8wgg0osbSS0CWUAHbslwf28sDomTgZUDFiCuc1t0va8iwmrEdv1tadFq6Ejg9OZpoKqTFtxVvf1dY6R0kSlrFXQSe+HVo2aQ3E/n4bx8dBtS1/HxEqvsXQ6xLU6nPn0zo6RygMxYhkKgcgcHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGDveTXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGDveTXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBF41F00A3D;
	Fri,  7 Aug 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786113569;
	bh=cBRI2TyiBI/oSithU2Vo6MmTt5p2qj08reDjknq6i3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oGDveTXlotZ6W4jZrCCzBdg9lyY4qAgJXXUnkZG1fP/8TVOptAkxmuGlv5lbXP+SB
	 5/sLDExR/CTXtNtTcGmnE+rR0ufso6mJdFCayZva0RpQ2YUOOGoi4A8ZkdLrWMiB1/
	 kx8PhYuF+SACuBkNzzOsJJLncA51ng3yWUZ87/RGIum4ySuZsfAY96WCRod8cfZBdI
	 oYQa4hvwrlKDDREPaIlLrxttxbPkZ550lOCWCQlwllBHILD6W3V0bPVV4XxciWX6Yd
	 1I8TWW8FUyIu8o2tJvQrS6hXc/S9AkgPgCUWRyhorkCLMvh4E/81AptI6H4F7GBT5k
	 Ak4NONoiWo/QQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 06/10] block: implement NVMEM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-block-as-nvmem-v10-6-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <20260806-block-as-nvmem-v10-6-be598b2a5606@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:39:29 +0000
Message-Id: <20260807143929.8EBF41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Registering an NVMEM device for a partition deadlocks on `disk->op=
en_mutex` if the NVMEM layout driver reads data during probe.
- [High] ABBA deadlock between `disk->open_mutex` and `kernfs` active refer=
ence during NVMEM sysfs read and partition deletion.
- [High] Using `fput()` instead of `bdev_fput()` defers yielding the block =
device's exclusive claim, causing spurious `-EBUSY` errors.
--

--- Patch [6]: [PATCH v10 06/10] block: implement NVMEM provider ---
commit d9c54a3ae2929addc2c718f29f9c8b9fa41ca7c3
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

block: implement NVMEM provider
   =20
On embedded devices using an eMMC it is common that one or more partitions
on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
data. Allow referencing the partition in device tree for the kernel and
Wi-Fi drivers accessing it via the NVMEM layer.

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> --- /dev/null
> +++ b/block/blk-nvmem.c
[ ... ]
> @@ -0,0 +1,112 @@
> +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> +			      void *val, size_t bytes)
> +{
[ ... ]
> +	if (file_bdev(bdev_file) !=3D bdev) {
> +		fput(bdev_file);
> +		return -ENODEV;
> +	}
> +
> +	ret =3D kernel_read(bdev_file, val, bytes, &pos);
> +	fput(bdev_file);

[Severity: High]
Since this opens the block device with BLK_OPEN_EXCL, will using fput()
instead of bdev_fput() defer yielding the exclusive claim?

Calling fput() defers the file release callback to an asynchronous task_work
or delayed_fput workqueue. Could this cause other system services like mount
or blkid to spuriously fail with -EBUSY while waiting for the deferred
release?

> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index eee954df1ac6e..c83227710584a 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -289,6 +289,8 @@ void drop_partition(struct block_device *part)
>  	xa_erase(&part->bd_disk->part_tbl, bdev_partno(part));
>  	kobject_put(part->bd_holder_dir);
> =20
> +	blk_nvmem_del(part);

[Severity: High]
Is there a potential ABBA deadlock here between disk->open_mutex and the
kernfs active reference?

If a user reads the NVMEM sysfs attribute, the read acquires a kernfs active
reference and calls blk_nvmem_reg_read(), which then blocks waiting on
disk->open_mutex.

Concurrently, if the partition is being removed, the teardown path in
__del_gendisk() holds disk->open_mutex and calls drop_partition(). This
calls blk_nvmem_del() and unregisters the NVMEM device. Device
unregistration removes sysfs attributes and invokes kernfs_drain(), which
will wait indefinitely for the kernfs active reference held by the read.

>  	device_del(&part->bd_device);
>  	put_device(&part->bd_device);
>  }
[ ... ]
> @@ -406,6 +408,9 @@ static struct block_device *add_partition(struct gend=
isk *disk, int partno,
>  	/* suppress uevent if the disk suppresses it */
>  	if (!dev_get_uevent_suppress(ddev))
>  		kobject_uevent(&pdev->kobj, KOBJ_ADD);
> +
> +	blk_nvmem_add(bdev);

[Severity: High]
Will this cause a recursive deadlock on disk->open_mutex if the NVMEM
layout driver reads data during probe?

The add_partition() function holds disk->open_mutex while executing. If the
partition has an nvmem-layout, nvmem_register() will synchronously probe
the layout driver.

If the layout driver reads the partition data via nvmem_device_read(), it
triggers blk_nvmem_reg_read(). This function calls bdev_file_open_by_dev(),
which attempts to acquire the exact same disk->open_mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-block-as-n=
vmem-v10-0-be598b2a5606@oss.qualcomm.com?part=3D6
