Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524298;
	b=15WGxntz67Vo+eMYKP8Yhf+EkgoWV4hccViOGARajHKacfm2T1nd8d6kk65sW/I7yJCV
	 IIS0vQHhaAkHY/pGgI+6Jr6YRxgREUlaUwz9LnUMWNQyNPA/EuBonlqRRGVrbQbpPiOxr
	 1sKzT0px1ZoR/9l/hdnhueqpIcMoqq5fkMJdY6sonjGXcuox7ozx/vmOWrUO0PMmRB6Qg
	 XmlYZGzR6XugqnCTDFn2Y/bFMtTGIlQihFafP8eN6rSP81KSvzYym4+Onz72VuKtZCGOt
	 X8/LC2ZF7hpPIbhij/Gf+9iA/XBNTalGAPHi8iOMYajpGJ4p1X0guhZVZwk5lngKEPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524298;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sGnf5ECwK2CMfucMR8upkwpozMGoDZCEz/Q+VSQ1gIc=;
	b=cMTQaRB3vXcpTHRlCCY+e0TyPkM8XGNAo07UuhEcmwV1ZwhJUkJPmPgTfNwb6xl17lWz
	 69MLZq6TF4HofrABJGmzgv25kErXW+/enI6GZZHMldCURDoV2bK/eXUWbyoup41BlKlm4
	 UtSGEoPqrJJcZJfUVruziOZjS6We9l02d4e0cVaMrVbk8Yb+uXdBENxNmShWCD2v0UPye
	 A2mXKLWLk07mRm33sSqlx7Pyvn+mzqR9dqgEKE5lGbF1FRdd3GcrQXKdfP7opAyy5R3t4
	 1HQVK4ePX81igg0lld17G7B70cBS/v3PRSrVMqSgus64Vtp37P25rWx0tS/M2i8dYMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWeN5yoe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EAA606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWeN5yoe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF5E1F000C0;
	Tue, 24 Nov 2026 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795524297;
	bh=sGnf5ECwK2CMfucMR8upkwpozMGoDZCEz/Q+VSQ1gIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JWeN5yoenJFeGftAg9qcF/maJ0LPX7ahKvH88ZYMRLdUcC3KBPVolKX+F4iSERmR5
	 AFdhT0CQ/R9Tyi/3Y6eX30JBO8B2/4MfYDtb2LW+XK2+2SmQer7xtJjDoeS8pUZ/ii
	 +CPOBmlf4kgvYab1ymDEcZGYyk7nS0nunDP6hzEMMJMFmfMYnf8DnIc9BLHfbpvlFI
	 Y8l8WUICvgh+MBEiDDGrmfJKTh/auUBkZC9c5Au28BQX7p7BLYWnjpPbCl2koA5dmC
	 ofamxw3drYTQz1DBxmfDRrlOe28TU+2wvlTrSiSkAGZkpzZxDiJPFmQbT2cJEmtt7v
	 brt6REVEyDzmQ==
Message-ID: <sashiko-outbox-231171@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] block: implement NVMEM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-block-as-nvmem-v13-2-96ffe1f59332@oss.qualcomm.com>
References: <20261123-block-as-nvmem-v13-0-96ffe1f59332@oss.qualcomm.com>
 <20261123-block-as-nvmem-v13-2-96ffe1f59332@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:44:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] block: async blk_nvmem_wq work races with synchronous parent
  device_del()
- [High] block: bdev claiming fwnode->dev on fixed-layout node blocks
  nvmem consumers
--

commit 0e36d62b71ee050cb34dcd10f5cbdc451589e7c4
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

block: implement NVMEM provider

This commit adds an NVMEM provider for block devices and partitions whose
device tree node describes an NVMEM layout, deferring NVMEM registration
and unregistration to an ordered workqueue.

> diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> new file mode 100644
> index 0000000000000..628681f6b747b
> --- /dev/null
> +++ b/block/blk-nvmem.c
[ ... ]
> +void blk_nvmem_add(struct block_device *bdev)
> +{
> +	struct device *dev =3D &bdev->bd_device;
> +	struct device_node *np =3D dev_of_node(dev);
> +	struct blk_nvmem *bn;
> +	struct device_node *child;
> +	loff_t size;
> +
> +	/* skip devices which do not have a device tree node */
> +	if (!np)
> +		return;
> +
> +	/*
> +	 * The layout is described either by an "nvmem-layout" child node or
> +	 * by the device node itself being a "fixed-layout" container.
> +	 */
> +	child =3D of_get_child_by_name(np, "nvmem-layout");
> +	if (child)
> +		of_node_put(child);
> +	else if (!of_device_is_compatible(np, "fixed-layout"))
> +		return;

[Severity: High]
When np is a "fixed-layout" node itself, does &bdev->bd_device claiming
np->fwnode.dev prevent consumers of its NVMEM cells from probing under
fw_devlink?

__add_disk() and add_partition() call device_set_node() and device_add()
on &bdev->bd_device before blk_nvmem_add(), so device_add() sets
np->fwnode.dev =3D &bdev->bd_device.  Because &bdev->bd_device has no bus
and never binds to a driver, device_links_driver_bound() never runs on it.

When nvmem_register() later creates layout->dev with the same OF node np,
device_add(&layout->dev) leaves np->fwnode.dev pointing at
&bdev->bd_device.  When layout->dev binds to fixed_layout_layout,
device_links_driver_bound(&layout->dev) skips
fw_devlink_pickup_dangling_consumers():

drivers/base/core.c:device_links_driver_bound() {
	...
	if (dev->fwnode && dev->fwnode->dev =3D=3D dev) {
		fwnode_links_purge_suppliers(dev->fwnode);
		fw_devlink_pickup_dangling_consumers(dev);
	}
	...
}

The child NVMEM cell fwnodes never get FWNODE_FLAG_NOT_DEVICE set and
their consumer fwnode_links are never converted to available device links,
leaving consumers stuck in -EPROBE_DEFER.

[ ... ]
> +void blk_nvmem_del(struct block_device *bdev)
> +{
> +	struct blk_nvmem *bn =3D bdev->bd_nvmem;
> +
> +	if (!bn)
> +		return;
> +
> +	bdev->bd_nvmem =3D NULL;
> +
> +	queue_work(blk_nvmem_wq, &bn->del_work);
> +}

[Severity: High]
Can deferring nvmem_register() and nvmem_unregister() to blk_nvmem_wq race
with the synchronous device_del(&bdev->bd_device) in drop_partition() and
__del_gendisk()?

drop_partition() and __del_gendisk() call blk_nvmem_del() and then
synchronously run device_del(&bdev->bd_device) while bn->add_work and
bn->del_work are still queued or running on blk_nvmem_wq:

CPU0                              kworker (blk_nvmem_wq)
drop_partition(part)
  blk_nvmem_del(part)
    queue_work(..., &bn->del_work)
                                  blk_nvmem_add_work()
                                    nvmem_register()
                                      device_add(&nvmem->dev)
                                        kobject_add_internal()
                                          sysfs_create_dir_ns()
                                            parent =3D kobj->parent->sd;
  device_del(&part->bd_device)
    kobject_del(&part->bd_device.kobj)
      __kobject_del()
        sysfs_remove_dir()
        sysfs_put(sd)  <-- frees parent sd
                                            kernfs_create_dir_ns(parent, ..=
.)
                                              <-- use-after-free on parent

sysfs_create_dir_ns() reads kobj->parent->sd without a reference before
sleeping in __kernfs_new_node(), so concurrent __kobject_del() on
&bdev->bd_device can drop the parent kernfs_node refcount to 0 and free it
via RCU while nvmem_register() is still using it.

Even when blk_nvmem_add_work() finishes before removal starts,
device_del(&bdev->bd_device) runs before blk_nvmem_del_work() calls
nvmem_unregister(), deleting the parent device while its child nvmem->dev
(and grandchild layout->dev) is still registered.  That removes the parent
from dpm_list ahead of its children and clears bdev->bd_device.kobj.parent
before nvmem_unregister() emits KOBJ_REMOVE uevents.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-block-as-n=
vmem-v13-0-96ffe1f59332@oss.qualcomm.com?part=3D2
