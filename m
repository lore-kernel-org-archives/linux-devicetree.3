Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723259;
	b=E0C0ftK5j+EaTFuS7vSXEOwAMRDHLE0+gmA+QA+cFuFl1lT1ZCoRQBb4SL/34XpwjLjg
	 Hlhb9iuIoWKa1zpCpgaV20scvsjw/PZQ7EyTnhwddiZjhm9goF/SMM02+jpQkjGHOOi8O
	 hp6x49JcJm6KopJOn7hYBdxm4tbGX5FmzHSbpXwpwEcXQDK3xP6WHAaK8AB4oGana/NhB
	 xjeW2u9Nu7k9y8aHF6a2+xYvG23Vii/dmLArU2t8Njpr6Lm9o/v+0GLJwV8v8xraUwS2G
	 /YBC5O5t7l61RBX2O44LzV0/om46E4UU/w2lSXk58kacbUkm9L/gagbG8s6c0FvrI7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723259;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c/PP8zYRcBQAvEGxGLzZMIhxqihLTRzlXxj5qbe6Jos=;
	b=jKUjmwcf8SPnInfMYrAqY674kU8kiIFBclilEjFoM+gnjMQXJ+4OqTZ1s83/JlmfiqQa
	 3X8DDVDHpU74vmN7yeGkRUBJY4WXrlDg3urEUh0o2gfDWDsFVtJpdFz1kst6Y5LgWnq+O
	 llrJ1T+nwzxQYmEv19VSIzDpJ0kUmU1poiXJQNxoNiNY+2Xpr5ovPJsEbnIdFx79C/7oV
	 Rp9fSUU/SjTZFGqC2mzAlKm2icgb4U916U+y06+isSYjPaKzzNjS7bQH4xIyZQ4SeKuMZ
	 QONdLQ+YFLksWghhI37aMASwaux9iRhP74tv+v+2wc8LWcW/6R1PrFochYT7OGdKPhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P9R/bLdA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBEA606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9R/bLdA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCEB1F000C1;
	Tue,  3 Nov 2026 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793723259;
	bh=c/PP8zYRcBQAvEGxGLzZMIhxqihLTRzlXxj5qbe6Jos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P9R/bLdAX2hjj57iA/MizbhPD56fWPl7OPFfOd9CZ50XSKVV7pMt5+T+979xQjnYI
	 Q/lkQJGltAYg4kwtO7oGY1iLssnS7jrfu+SEi4Okc4wac2waTFShrXUwrZ/TUw0J1u
	 JO7l1WgPrMMdZ0bWFN/9WY/5+TS1+ZW6mBYsowI7VZGXqTWQyKEIVdbcAO/01eIW5U
	 Jx1O0+GtbrVq5tQTp0w+ZvOqFzK3cXidCaFf1C5gxkzFobNbi3uRDJKsA6z//Xcu3H
	 R93ReEmR1tL+62QzFvAuksubafdtqqQ18eBHftTSgH9iTfBJRCgQG712eXmV5He3w2
	 A4Zrf/TWKZaZQ==
Message-ID: <sashiko-outbox-195723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] block: implement NVMEM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-block-as-nvmem-v12-2-f4a2a681087d@oss.qualcomm.com>
References: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
 <20261102-block-as-nvmem-v12-2-f4a2a681087d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 16:27:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] block: self-deadlock in add_partition() when blk_nvmem_add() probe=
s layout
- [High] block: ABBA deadlock between disk->open_mutex and nvmem->srcu in d=
rop_partition()
- [Medium] block: blk_nvmem_reg_read() uses fput() instead of bdev_fput() o=
n exclusive bdev
--

commit 348ca9207d847db1f952272a2d1ea367e90cb1ca
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

block: implement NVMEM provider

This commit implements a read-only NVMEM provider for block devices and
partitions whose device tree node describes an NVMEM layout. Each NVMEM
read opens the block device with BLK_OPEN_EXCL and reads from it using
kernel_read().

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000..69b69184e1630
> --- /dev/null
> +++ b/block/blk-nvmem.c
> @@ -0,0 +1,112 @@

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
As reported by Sashiko on v5 [1], does calling fput(bdev_file) here and on
the file_bdev(bdev_file) !=3D bdev error path defer releasing the exclusive
claim on bdev past the return of blk_nvmem_reg_read()?

bdev_file_open_by_dev() is called with BLK_OPEN_EXCL and blk_nvmem_reg_read
as the holder, which claims bdev and the whole disk via bd_finish_claiming(=
).
However, fput() defers __fput() -> bdev_release() to task_work (for user
threads) or delayed_fput_work (for kernel threads such as deferred probe
workers).

Until that deferred work runs, bdev_yield_claim() has not been called and
bdev->bd_holder remains set. If another consumer or userspace process tries
to mount or exclusively open the block device (or read another NVMEM cell on
the same disk) immediately after blk_nvmem_reg_read() returns, bd_may_claim=
()
can fail with -EBUSY.

Should blk_nvmem_reg_read() call bdev_fput(bdev_file) instead of
fput(bdev_file) so that bdev_yield_claim() releases the holder claim
synchronously before deferring the file release?

[ ... ]

> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index eee954df1ac6e..c83227710584a 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -289,6 +289,8 @@ void drop_partition(struct block_device *part)
>  	xa_erase(&part->bd_disk->part_tbl, bdev_partno(part));
>  	kobject_put(part->bd_holder_dir);
> =20
> +	blk_nvmem_del(part);
> +
>  	device_del(&part->bd_device);
>  	put_device(&part->bd_device);
>  }

[Severity: High]
As reported by Sashiko on v11 [2], can calling blk_nvmem_del(part) inside
drop_partition() cause an AB-BA deadlock between disk->open_mutex and
nvmem->srcu?

On the NVMEM read path, __nvmem_reg_read() holds srcu_read_lock(&nvmem->src=
u)
(and on sysfs reads, kernfs holds the active reference on the nvmem binary
attribute) and calls:

  __nvmem_reg_read()
    blk_nvmem_reg_read()
      bdev_file_open_by_dev()
        bdev_open()
          bd_prepare_to_claim()
          mutex_lock(&disk->open_mutex)

On the partition removal path (__del_gendisk(), bdev_del_partition(), or
bdev_disk_changed()), drop_partition() is called with disk->open_mutex held
(and in __del_gendisk(), blk_freeze_acquire_lock(q) is also held; in
bdev_disk_changed(), whole->bd_claiming is also held):

  drop_partition()
    blk_nvmem_del()
      nvmem_unregister()
        synchronize_srcu(&nvmem->srcu)
        device_unregister(&nvmem->dev)

If a reader enters __nvmem_reg_read() and looks up the bdev in
blkdev_get_no_open() just before drop_partition() runs, the reader will blo=
ck
waiting for whole->bd_claiming or disk->open_mutex in bdev_open() while
holding nvmem->srcu, while drop_partition() holds disk->open_mutex and waits
in synchronize_srcu(&nvmem->srcu) for the reader to finish.

> @@ -406,6 +408,9 @@ static struct block_device *add_partition(struct gend=
isk *disk, int partno,
>  	/* suppress uevent if the disk suppresses it */
>  	if (!dev_get_uevent_suppress(ddev))
>  		kobject_uevent(&pdev->kobj, KOBJ_ADD);
> +
> +	blk_nvmem_add(bdev);

[Severity: High]
As reported by Sashiko on v11 [3], can calling blk_nvmem_add(bdev) from
add_partition() self-deadlock when the partition uses an nvmem-layout driver
that reads from the NVMEM device during registration?

add_partition() is called with disk->open_mutex held:

  lockdep_assert_held(&disk->open_mutex);

When called from add_disk_final() -> disk_scan_partitions(), the current
task has also claimed disk->part0 via bd_prepare_to_claim(disk->part0,
disk_scan_partitions, NULL), setting whole->bd_claiming.

Inside add_partition(), blk_nvmem_add() calls nvmem_register(), which
synchronously populates the layout child device and fires NVMEM_ADD
notifiers:

  add_partition()
    blk_nvmem_add()
      nvmem_register()
        nvmem_populate_layout()
          device_add()
            ...
              layout->add_cells()
                nvmem_device_read()
                  __nvmem_reg_read()
                    blk_nvmem_reg_read()
                      bdev_file_open_by_dev()
                        bdev_open()
                          bd_prepare_to_claim()
                          mutex_lock(&disk->open_mutex)

When a layout driver (such as u-boot-env, onie-tlv-layout, or
kontron-sl28vpd-layout) or an NVMEM_ADD notifier reads from the NVMEM device
during probe, bdev_open() will either sleep forever in bd_prepare_to_claim()
waiting on whole->bd_claiming owned by the same thread in
disk_scan_partitions(), or deadlock on mutex_lock(&disk->open_mutex) already
held by add_partition().

[1] https://lore.kernel.org/r/20260613132137.D65B51F000E9@smtp.kernel.org
[2] https://lore.kernel.org/r/20261015-block-as-nvmem-v11-3-f890ac74f87d@os=
s.qualcomm.com
[3] https://lore.kernel.org/r/20261015-block-as-nvmem-v11-3-f890ac74f87d@os=
s.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-block-as-n=
vmem-v12-0-f4a2a681087d@oss.qualcomm.com?part=3D2
