Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC438E119
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002278; cv=none; b=PbpWhNWNp450pcWVnm25q+fK8q/92gT2cliJpelaz32ix/8FP/20QhyUbmvd8/ngpO0RHEP6DkM6sMG5XZ3G3M7YiDxaHu10yf3hasyYo2RRaSdrM/09wbJN9kK9H9QBVHS/33FhkakhuuZnp156jpcEDinnWngZdxFvEl/+piM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002278; c=relaxed/simple;
	bh=2z4qBauu0xnJR8ySEm4ythKWLc8aVDwOhx8UEBoM5fY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jp60mykjO9m5QoPpYo1Vmq+eFkI8Cl1Aw3gAPedcgz/jn27kHrNbl2ubn+KZdyjMxa3DQnl5NKe4YrY368FDA0+n3nGjJKE9jPyq/FrblulWg3mY7QUfaqWWlZWc9ro7hiWVow5W69jZSnuMx7qwfQUdeWlHfcjSrtsF+JQeLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2CG/Oe/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2CG/Oe/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D851F00898;
	Tue,  9 Jun 2026 10:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002277;
	bh=nxOY5UkLbBq+7IbDHHab4lgAVEtQZ3OOgI/SZDF8xnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X2CG/Oe/g21nFfSPcw+RwyiSTy5paqoI6uMcgaxJXGQFYQoDihruypFozX5S+kbCV
	 kudY4m9Wh7fweGoZ44buPc7fwUUH65ymozwbfXJbPDA67aPCBoZ3ZGBwdZ/1+uAdzP
	 jRNGjMt125M9giFi0VE3luw45mMsz8f/x+uDGgav/wwETlP4uVSeSZHIbhBUJlhS3+
	 eMquDExBluFuEW2UQoRFtp7R7M3NoF7jDslmciAyCKgcOFmXmFP5fQouTfOSijGP2Q
	 0ei/sAn+f2xCpbSD5f3FrhOv6IUGKHWgqUJv9WUphz13XFddyGKW66+CmCgsY9IC2A
	 AOyee1mU4wc/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] block: implement NVMEM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608-block-as-nvmem-v3-4-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-4-82681f50aa35@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:51:16 +0000
Message-Id: <20260609105116.C9D851F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Provider private data `bnv` is freed prematurely in `blk_nvmem_unr=
egister`, leading to a Use-After-Free if consumers still hold an NVMEM cell=
 reference.
- [High] Block device size check against `UINT_MAX` causes a sign-extension=
 bug because `config.size` is a signed `int`.
- [Medium] Re-opening the block device by `devt` on every read allows NVMEM=
 consumers to read from the wrong device if the original block device is ho=
t-unplugged and its `devt` is reused.
--

commit 4b9cd41ee844820238b2e460a15697cc94e57c3f
Author: Daniel Golle <daniel@makrotopia.org>

block: implement NVMEM provider

This commit adds an NVMEM provider for block devices, allowing partitions
such as eMMC hardware partitions to expose MAC addresses and calibration
data to the NVMEM subsystem. It also adds an accessor to the core subsystem
to retrieve the underlying device.

> To safely defer the freeing of the provider private data until all
> consumers have released their cells, a nvmem_dev() accessor is added to
> the NVMEM core to expose the struct device embedded in struct nvmem_devic=
e.
> This allows registering a devm action on the nvmem device itself, ensuring
> the private data outlives any active cell references.

The commit message mentions registering a devm action to defer freeing
the private data. Does the code actually implement this action?

Looking at blk_nvmem_register(), there does not appear to be any devm
action registered to ensure the private data outlives active cell reference=
s.

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000..99c7728fb7bcc
> --- /dev/null
> +++ b/block/blk-nvmem.c
> @@ -0,0 +1,171 @@

[ ... ]

> +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> +			      void *val, size_t bytes)
> +{
> +	blk_mode_t mode =3D BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
> +	struct blk_nvmem *bnv =3D priv;
> +	size_t bytes_left =3D bytes;
> +	struct file *bdev_file;
> +	loff_t pos =3D from;
> +	int ret =3D 0;
> +
> +	bdev_file =3D bdev_file_open_by_dev(bnv->devt, mode, priv, NULL);

[Severity: Medium]
Could this open an unrelated block device if the original device is
hot-unplugged?

Since bdev_file_open_by_dev() looks up the current device associated with
bnv->devt, an unplug and subsequent reallocation of the same devt to a new
device might cause this read to access the wrong hardware.

blk_nvmem_unregister() does not mark the provider's bnv as dead or
invalidate the devt, which would allow a subsequent consumer read to
silently leak data from the newly plugged block device.

[ ... ]

> +static int blk_nvmem_register(struct device *dev)
> +{
> +	struct device_node *child, *np =3D dev_of_node(dev);
> +	struct block_device *bdev =3D dev_to_bdev(dev);
> +	struct nvmem_config config =3D {};
> +	struct blk_nvmem *bnv;
> +
> +	/* skip devices which do not have a device tree node */
> +	if (!np)
> +		return 0;
> +
> +	/* skip devices without an nvmem layout defined */
> +	child =3D of_get_child_by_name(np, "nvmem-layout");
> +	if (!child)
> +		return 0;
> +	of_node_put(child);
> +
> +	/*
> +	 * skip block device too large to be represented as NVMEM devices,
> +	 * the NVMEM reg_read callback uses an unsigned int offset
> +	 */
> +	if (bdev_nr_bytes(bdev) > UINT_MAX)
> +		return -EFBIG;

[Severity: High]
Does this check adequately protect config.size?

Because struct nvmem_config defines size as a signed int, a block device
capacity between 2GB and 4GB will pass this check but overflow into a
negative integer.

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

When the nvmem core later assigns this to nvmem->size (which is size_t),
the negative integer will sign-extend to a large 64-bit value,
potentially breaking bounds checks.

[ ... ]

> +static void blk_nvmem_unregister(struct device *dev)
> +{
> +	struct blk_nvmem *bnv_c, *bnv_t, *bnv =3D NULL;
> +
> +	scoped_guard(mutex, &devices_mutex) {
> +		list_for_each_entry_safe(bnv_c, bnv_t, &nvmem_devices, list) {
> +			if (bnv_c->devt =3D=3D dev_to_bdev(dev)->bd_device.devt) {
> +				bnv =3D bnv_c;
> +				list_del(&bnv->list);
> +				break;
> +			}
> +		}
> +
> +		if (!bnv)
> +			return;
> +	}
> +
> +	nvmem_unregister(bnv->nvmem);
> +	kfree(bnv);

[Severity: High]
Can this kfree() result in a use-after-free of bnv?

nvmem_unregister() only decrements the device reference count and
does not synchronously wait for consumers to release their cell references.

If a consumer subsequently reads from its cell, the core will invoke
blk_nvmem_reg_read() with the freed bnv pointer as the priv argument,
dereferencing bnv->devt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-block-as-n=
vmem-v3-0-82681f50aa35@oss.qualcomm.com?part=3D4
