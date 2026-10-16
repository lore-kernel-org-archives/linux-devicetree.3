Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93984364EB8
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160805; cv=none; b=j7jUEccLiDh0q/g95IblLG1LLNIn1Rt0ez3u7qJ7vjaZdH0NE2JloBHOwbB2cPr3ZtVVwdL/YIwcs8ThY/rh7e4aObbOfHMBAO7g42asQ4vGwGIviHWxfd1NveNssV77ipf9duNHUm6m1RHb6b06pO6hJj4MH2kd317Gb/MHAus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160805; c=relaxed/simple;
	bh=gQqko+EDshz9Fqg/Ax/1tF7PAxkb1UrhLIcAGnpW4aI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=W5S+//wqPxW8E47zFPG/3vYOxlDZH1YBxAiXYYOeN+MXBfsN3AgqbNMIySTljl3GbB+PaAJ5gxcCYygNkdiWz4HIUhr6ytCdKUWzkvOZuXUJbZooMiGihEZwVQXCpqpAbXMbyXQjl9QVYz/7S4QvDsZJaa5XNEoFX8Aq49WrdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/P+g62H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/P+g62H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA4B1F000C5;
	Fri, 16 Oct 2026 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792160804;
	bh=CP8V4tdAJkK1lPxXBd+TUPb0i3qJZMDghsBtk0pvr88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e/P+g62H1ECewBJs9ANHC5f26N/rMdBaT7xC43Ei4yNKk/CdRCvG04VD9gd8GCW6J
	 t0mJW2c74CQ5pHkgiQoqbm6uqx2kW6yv6nU4usswPNXT28fl68uX28x0fdxjzGmH6A
	 6as57Xn+tPcIqMNJ76furAAfSTCBxgyXeAlPKcYkoxUDLSAGiMPNz+SSs/kYKL/9AV
	 CSZvb13PSxDKuVWZhBQ5JpBh1bswJ5jvDYP0gSmDtpvhCBnflLCvAh6m7GCcjQD5Kt
	 l+rCDseueRZavDW5USX4X6q/FgcbaukFPU+hrPdgLBqjFYrxZ6vuKYYLVY0u5r/Y6g
	 tkkjgDbvJs0tw==
Message-ID: <sashiko-outbox-174445@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/7] block: implement NVMEM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-block-as-nvmem-v11-3-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
 <20261015-block-as-nvmem-v11-3-f890ac74f87d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:26:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] block: AB-BA deadlock and self-deadlock due to disk->open_mutex an=
d NVMEM SRCU
- [Medium] block: delayed release of exclusive claim causes spurious -EBUSY=
 on open
--

commit 163603c5c331585f01bddc0cceeabc4bb95a5455
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

block: implement NVMEM provider

This commit implements a block device NVMEM provider, allowing partitions
to expose factory-provisioned data like MAC addresses to consuming drivers.
The NVMEM accesses use BLK_OPEN_EXCL to keep other exclusive openers away
during the reads.

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000..69b69184e1630
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
> +	if (IS_ERR(bdev_file))
> +		return PTR_ERR(bdev_file);
> +
> +	if (file_bdev(bdev_file) !=3D bdev) {
> +		fput(bdev_file);
> +		return -ENODEV;
> +	}
> +
> +	ret =3D kernel_read(bdev_file, val, bytes, &pos);
> +	fput(bdev_file);

[Severity: Medium]
Will using fput() here and in the error path above defer the release of the
block device's exclusive claim?

Because fput() delegates the file release to task work or a workqueue, the
exclusive claim won't be yielded synchronously. If a process or script reads
the NVMEM cell and immediately tries to open the same block device
exclusively (e.g., to mount it), could it spuriously fail with -EBUSY?

Should this use bdev_fput() instead, which calls bdev_yield_claim()
synchronously before fput()?

> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index eee954df1ac6e..c83227710584a 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
[ ... ]
> @@ -289,6 +289,8 @@ void drop_partition(struct block_device *part)
>  	xa_erase(&part->bd_disk->part_tbl, bdev_partno(part));
>  	kobject_put(part->bd_holder_dir);
> =20
> +	blk_nvmem_del(part);

[Severity: High]
Can this create an AB-BA deadlock with concurrent NVMEM readers?

drop_partition() is called with disk->open_mutex held. blk_nvmem_del() calls
nvmem_unregister(), which waits for active readers via
synchronize_srcu(&nvmem->srcu).

If an untrusted user space process is reading the NVMEM sysfs file while
the block device is being removed, the concurrent reader executing
__nvmem_reg_read() holds srcu_read_lock(&nvmem->srcu) and calls
bdev_file_open_by_dev(), which blocks on disk->open_mutex.

Won't the teardown thread and the reader thread deadlock waiting for
each other's locks?

[ ... ]
> @@ -406,6 +408,9 @@ static struct block_device *add_partition(struct gend=
isk *disk, int partno,
>  	/* suppress uevent if the disk suppresses it */
>  	if (!dev_get_uevent_suppress(ddev))
>  		kobject_uevent(&pdev->kobj, KOBJ_ADD);
> +
> +	blk_nvmem_add(bdev);

[Severity: High]
Could this result in a self-deadlock during partition creation?

add_partition() executes with disk->open_mutex held. If the NVMEM device
requires layout parsing (e.g., reading ONIE TLV data), the NVMEM core
will read from the device during nvmem_register() via __nvmem_reg_read().

This invokes blk_nvmem_reg_read(), which opens the block device via
bdev_file_open_by_dev() and blocks attempting to acquire the already held
disk->open_mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-block-as-n=
vmem-v11-0-f890ac74f87d@oss.qualcomm.com?part=3D3
