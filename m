Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5EF3803DC
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264425; cv=none; b=X49YkrOLOR5iC7tid6IGOJMJv6cRdQ3Yt71IN8J3Iev9UjVzPbLsCTDUyhYMqVyIDFvoxo5+S1yPu1jLMv8sIqx9sHfYDjDFi4P5+xzYZGDSIAjvmaM+w/AfULtKF3wHJccxefsSM0bHLwChLIDki2SsQCCBzn20OsJFt3HfeQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264425; c=relaxed/simple;
	bh=8lgQe8BPngeJ3VkYyhwGLxxVMtBdrn3kGR5R60j/Vig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KldPrTfw1ND8hRDPZYQAVe7jHsLwBPChaw8XzregCrYj+U/aR0DZ2QPnNGTvzAMygLI/vnkqDNoEZRkRzFszkEkzR8ngDOdbrTjvQ4tpJILTRep1DmwydYwNEl7sbebPssJjHOLH3XiuNeXyHHHN70yWKFmJblptWpUlw+Say7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g65ptYkn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g65ptYkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58ED8C2BCF5;
	Fri,  8 May 2026 18:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778264425;
	bh=8lgQe8BPngeJ3VkYyhwGLxxVMtBdrn3kGR5R60j/Vig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=g65ptYknFivkVS9/fTKvZ0j7fCiWuTr2Mtp18nSeWujT/y0uqGbXhrhXXqJ+COS6I
	 hvkVzjsF1UA7ylZY1/qv7wdSm8ffX31CgIAqVnCAhAIkkfdzjaq+1TMyECwJc1thEu
	 r/ItYOVMOxn9wQY2cZXeeMPn6+aG8LhKYq145ZLyKqWdIY7i3IORgbOTdyYv4B1SFP
	 yNdpIBqmQxPOY2xGG3IWIU0xkoA8NamZZZyeejh6qsd1W/aUFKifgI/rCezu6LlAlx
	 CmGFJanwHQcLwooeaQ3K/e6XMGwshxgUscVnajpCI3dsIX2HiDuV+v2OOd5HyLO7iT
	 +vc0ikXeVR+qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] block: implement NVMEM provider
Reply-To: sashiko@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260507-block-as-nvmem-v2-4-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-4-bf17edd5134e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 18:20:24 +0000
Message-Id: <20260508182025.58ED8C2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect page offset calculation and iteration logic for large fo=
lios causes severe data corruption.
- [High] Dereferencing NULL when reading from a block device page cache all=
ocated in high memory.
- [High] Use-after-free of provider private data `bnv` on the `devm_add_act=
ion` error path.
- [Medium] Leaked device node reference in `blk_nvmem_register` when checki=
ng for the layout node.
- [Medium] A Time-of-Check to Time-of-Use (TOCTOU) race allows cross-device=
 arbitrary data reads due to `devt` reallocation.
--

commit a3bbd821536b45bed34dfa8815ddf9b55f9bb8b9
Author: Daniel Golle <daniel@makrotopia.org>
Subject: block: implement NVMEM provider

This commit adds an NVMEM provider for block devices, allowing partitions on
embedded devices to be accessed via the NVMEM layer. It introduces an
nvmem_dev() accessor to safely defer freeing provider private data by adding
a devm action to the nvmem device.

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000..96c0ffc51b186
> --- /dev/null
> +++ b/block/blk-nvmem.c
> @@ -0,0 +1,188 @@
[ ... ]
> +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> +			      void *val, size_t bytes)
> +{
> +	blk_mode_t mode =3D BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
> +	unsigned long offs =3D from & ~PAGE_MASK, to_read;
> +	pgoff_t f_index =3D from >> PAGE_SHIFT;
> +	struct blk_nvmem *bnv =3D priv;
> +	size_t bytes_left =3D bytes;
> +	struct file *bdev_file;
> +	struct folio *folio;
> +	void *p;
> +	int ret =3D 0;
> +
> +	if (bnv->removed)
> +		return -ENODEV;
> +
> +	bdev_file =3D bdev_file_open_by_dev(bnv->devt, mode, priv, NULL);

Is there a race condition between the removed check and opening the device?

The check for bnv->removed is performed without locks. If
blk_nvmem_unregister() runs concurrently and the original block device is
hot-removed, its devt identifier could be freed and reassigned to a newly
plugged-in, unrelated block device.

If this thread is preempted after the lockless check, it could open the new
block device using the recycled devt and read data from the wrong disk.

> +	if (!bdev_file)
> +		return -ENODEV;
> +
> +	if (IS_ERR(bdev_file))
> +		return PTR_ERR(bdev_file);
> +
> +	while (bytes_left) {
> +		folio =3D read_mapping_folio(bdev_file->f_mapping, f_index++, NULL);
> +		if (IS_ERR(folio)) {
> +			ret =3D PTR_ERR(folio);
> +			goto err_release_bdev;
> +		}
> +		to_read =3D min_t(unsigned long, bytes_left, PAGE_SIZE - offs);
> +		p =3D folio_address(folio) + offset_in_folio(folio, offs);

Does this logic handle large folios correctly?

If read_mapping_folio() returns a large folio, it will return the same head
folio for multiple sequential f_index values.

Because offs is repeatedly reset to 0 in subsequent loop iterations,
offset_in_folio(folio, 0) will evaluate to 0, causing p to repeatedly point
to the start of the head page instead of advancing through the subpages of
the large folio.

Additionally, can this cause a NULL pointer dereference on 32-bit platforms
with HIGHMEM?

Block device page cache mappings can allocate folios from the HIGHMEM zone,
and folio_address() relies on page_address(), which returns NULL for
unmapped high memory pages.

Adding an offset to this NULL pointer and attempting to read from it might
crash the kernel. Mapping the folio safely with kmap_local_folio() or
memcpy_from_folio() might be needed here.

> +		memcpy(val, p, to_read);
> +		offs =3D 0;
> +		bytes_left -=3D to_read;
> +		val +=3D to_read;
> +		folio_put(folio);
> +	}
> +
> +err_release_bdev:
> +	fput(bdev_file);
> +
> +	return ret;
> +}
> +
> +static int blk_nvmem_register(struct device *dev)
> +{
> +	struct device_node *np =3D dev_of_node(dev);
> +	struct block_device *bdev =3D dev_to_bdev(dev);
> +	struct nvmem_config config =3D {};
> +	struct blk_nvmem *bnv;
> +
> +	/* skip devices which do not have a device tree node */
> +	if (!np)
> +		return 0;
> +
> +	/* skip devices without an nvmem layout defined */
> +	if (!of_get_child_by_name(np, "nvmem-layout"))
> +		return 0;

Does this leak the device node reference? of_get_child_by_name() increments
the reference count of the returned child device node, but since the pointer
is not saved, of_node_put() can never be called to release it.

> +
> +	/*
> +	 * skip block device too large to be represented as NVMEM devices
> +	 * which are using an 'int' as address
> +	 */
> +	if (bdev_nr_bytes(bdev) > INT_MAX)
> +		return -EFBIG;
> +
> +	bnv =3D kzalloc_obj(*bnv);
> +	if (!bnv)
> +		return -ENOMEM;
> +
> +	config.id =3D NVMEM_DEVID_NONE;
> +	config.dev =3D &bdev->bd_device;
> +	config.name =3D dev_name(&bdev->bd_device);
> +	config.owner =3D THIS_MODULE;
> +	config.priv =3D bnv;
> +	config.reg_read =3D blk_nvmem_reg_read;
> +	config.size =3D bdev_nr_bytes(bdev);
> +	config.word_size =3D 1;
> +	config.stride =3D 1;
> +	config.read_only =3D true;
> +	config.root_only =3D true;
> +	config.ignore_wp =3D true;
> +	config.of_node =3D to_of_node(dev->fwnode);
> +
> +	bnv->devt =3D bdev->bd_device.devt;
> +	bnv->nvmem =3D nvmem_register(&config);
> +	if (IS_ERR(bnv->nvmem)) {
> +		dev_err_probe(&bdev->bd_device, PTR_ERR(bnv->nvmem),
> +			      "Failed to register NVMEM device\n");
> +
> +		kfree(bnv);
> +		return PTR_ERR(bnv->nvmem);
> +	}
> +
> +	/*
> +	 * Free bnv only when the nvmem device is fully released (i.e. when
> +	 * its kref hits zero), not at unregister time. This prevents a
> +	 * use-after-free if a consumer still holds an nvmem_cell reference
> +	 * when the block device is removed: nvmem_unregister() only does a
> +	 * kref_put(), so reg_read could still be called with bnv as priv
> +	 * until the last consumer drops its cell.
> +	 */
> +	if (devm_add_action(nvmem_dev(bnv->nvmem), blk_nvmem_free, bnv)) {
> +		nvmem_unregister(bnv->nvmem);
> +		kfree(bnv);

Could this result in a use-after-free if a consumer acquires a reference
before devm_add_action() fails?

nvmem_register() makes the NVMEM device globally visible. If
nvmem_unregister() is called on the error path, it only drops the
provider's reference.

If a consumer has already obtained a reference, calling kfree(bnv)
immediately will free the provider data while the consumer might still
invoke blk_nvmem_reg_read().

> +		return -ENOMEM;
> +	}
> +
> +	mutex_lock(&devices_mutex);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507-block-as-n=
vmem-v2-0-bf17edd5134e@oss.qualcomm.com?part=3D4
