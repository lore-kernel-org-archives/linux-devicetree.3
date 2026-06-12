Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5E3E9286
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264464; cv=none; b=Y+SNsnPbhXi+rHFmlCGbixNwSsaUfeymAQNvEv6c8Lc/asF1fZCy2QlnbK5UkGvAlLz6LKEp6ieCWofiAoKpjz50ChulkfLqQq5L/NOSzUaXjSez3X5hEPbsh2IgC79/++mW0i/N3bI5kct8ti9GrdMy08nvTpo/HHkkVrwW8ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264464; c=relaxed/simple;
	bh=X97mIUZ7UhjQclOnU6xCpqKbWmfsZLkKeUyaI0wuz9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BRfp9d0X2GsZ/yA6SG00zUY+7ZX/qLcvxtFfbzC/zUP8fkh+639pplEYI7BGLCd1YChGMO5RG1+ZxgmVWLJuJTOITrPJ3/565RSKg5C2inptl/n6pgqUlKph4ArKylUIn1QOzvtxFuzu2+Md2vgJHrYmZRZszbAdRgHI3AbjTtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyJdI8CL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyJdI8CL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11B21F00A3D;
	Fri, 12 Jun 2026 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264463;
	bh=GpabS/WAwtiIF8UdCveMYZHpjy8NlBJScIZFIxuZHts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyJdI8CLvginDrQ7E7IsK/DUK+1TbF7VXm8W0W5U7i8KlQ1J2mASAznUPEYb1LcJd
	 AF9P3Z173Vv9g6HEBt60EbkqTwz9MObk8/nCecTOXSoNLWGf73EhqycXQy64UnVzz+
	 Pwh/aXgr3c5ZgEV9z8hPpPGYEGYDbr7TzMUQXhDoDDxje2vw0/rfuLzTjFhNpM798e
	 jrlCKdZD7Lihm5Jz9M4bDaqjsktswL/brE1ul2wRC2aQAngrpKH0Tdn9UVlMJQ3cQc
	 72aLRj3w/mjYUfFeugCYVeKwndowd3sN1ow9x6fsn9326oQAyPfpvvK0H7CNekCHgC
	 Yzf3FhjtMNLOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 7/9] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260612111816.3688240-8-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 11:41:02 +0000
Message-Id: <20260612114102.C11B21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Concurrent private transfers through the hub race on `hub_dev-=
>info.dyn_addr`, causing data corruption.
- [Critical] Delegating DAA to the parent controller incorrectly attaches d=
ownstream devices to the parent bus.
- [Critical] Unsynchronized hub port enablement breaks virtual bus isolatio=
n, causing bus collisions.
- [Critical] `i3c_hub_master_priv_xfers` corrupts the parent bus address sl=
ots by freeing slots that belong to unrelated physical devices.
- [High] Double free and memory leak of the IBI workqueue in `i3c_hub_reque=
st_ibi` error path.
- [High] Deterministic NULL pointer dereference in `i3c_dev_free_ibi_locked=
` after hub recursive call.
- [High] Unlocked write to `hub_dev->info.dyn_addr` introduces a data race =
on the error path.
- [High] Failure in `priv_xfers` address reattachment permanently orphans t=
he hub device.
- [High] IBI support for downstream hub devices is broken because devices a=
re never added to the physical parent's bus list.
- [High] Lockdep splat due to nested acquisition of `bus.lock` without subc=
lass annotations.
- [Medium] I2C transfers silently succeed without performing any communicat=
ion, masking failures.
--

commit f3f90aaf2c0040d96007fed285ccd49e4c6e8e7a
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: Add support for the I3C interface in the I3C hub

Add virtual I3C bus support for the hub and provide interface to enable
or disable downstream ports.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 0000000000000..c37b01fddcb4c
> --- /dev/null
> +++ b/drivers/i3c/hub.c

[ ... ]

> +static int i3c_hub_do_daa(struct i3c_hub *hub,
> +			  struct i3c_master_controller *controller)
> +{
> +	struct i3c_master_controller *parent;
> +	int ret;
> +
> +	if (!hub || !hub->hub_dev)
> +		return -ENODEV;
> +
> +	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	i3c_hub_enable_port(controller);

[Severity: Critical]
Does enabling the port outside of the parent controller's bus lock break
virtual bus isolation? If multiple virtual ports execute global broadcasts
concurrently, they might both enable their respective hardware ports before
blocking on parent->bus.lock. This could cause the parent to execute the
broadcast across all enabled ports simultaneously, potentially resulting in
severe bus collisions.

> +	ret =3D i3c_master_do_daa(parent);

[Severity: Critical]
Could delegating the Dynamic Address Assignment procedure to the physical
parent controller incorrectly attach downstream devices to the parent bus?

Since i3c_master_do_daa() natively creates and attaches devices to the
physical parent bus, any transfers targeting these devices would bypass the
hub's virtual controller callbacks. As a result, i3c_hub_enable_port()
would never be invoked prior to communication, potentially causing I3C
transfers to the downstream devices to fail.

> +	i3c_hub_disable_port(controller);
> +
> +	return ret;
> +}

[ ... ]

> +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> +				struct i3c_master_controller *controller,
> +				struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_master_controller *parent;
> +	int ret;
> +
> +	if (!hub || !hub->hub_dev)
> +		return -ENODEV;
> +
> +	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	i3c_hub_enable_port(controller);

[Severity: Critical]
Is it possible for concurrent CCC broadcasts to cause bus collisions here?
Similar to i3c_hub_do_daa(), enabling the port outside of parent->bus.lock
could allow multiple ports to be enabled simultaneously if they execute
broadcasts concurrently.

> +	ret =3D i3c_master_send_ccc_cmd(parent, cmd);
> +	i3c_hub_disable_port(controller);
> +
> +	return ret;
> +}

[ ... ]

> +static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
> +				     struct i3c_xfer *xfers,
> +				     int nxfers,
> +				     enum i3c_xfer_mode mode)
> +{
> +	struct i3c_master_controller *controller =3D i3c_dev_get_master(dev);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_dev_desc *hub_dev;
> +	struct i3c_master_controller *parent;
> +	u8 hub_addr, target_addr;
> +	struct i3c_hub *hub;
> +	int ret, xfer_ret;

[ ... ]

> +	if (hub_addr !=3D target_addr) {
> +		down_write(&parent->bus.lock);

[Severity: High]
Does acquiring this lock cause a lockdep splat?

This function is invoked from contexts where the core framework has already
locked the virtual downstream controller's bus.lock (e.g., via
i3c_bus_normaluse_lock() which takes a down_read). Acquiring a second lock
of the same class without using down_write_nested() might violate lock
nesting rules.

> +		hub_dev->info.dyn_addr =3D target_addr;
> +
> +		ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev, hub_addr);
> +		up_write(&parent->bus.lock);
> +		if (ret) {
> +			hub_dev->info.dyn_addr =3D hub_addr;

[Severity: High]
Is it safe to modify hub_dev->info.dyn_addr outside of the bus write lock?
Modifying this shared bus state variable after up_write(&parent->bus.lock)
appears to introduce a data race with concurrent bus operations.

[Severity: High]
If i3c_master_reattach_i3c_dev_locked() fails, are we permanently orphaning
the hub device?

When it fails, the core code automatically marks both the new and old addre=
ss
slots as I3C_ADDR_SLOT_FREE via i3c_master_put_i3c_addrs(). Because this
error path restores dyn_addr but fails to reinstate the address allocation
on the parent bus, the parent controller might re-assign the hub's legitima=
te
address to new hot-joined devices.

> +			goto disable;
> +		}
> +	}
> +
> +	ret =3D i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);

[Severity: Critical]
Could concurrent private transfers through the hub race on
hub_dev->info.dyn_addr?

This function drops the write lock before calling i3c_device_do_xfers(),
which only acquires the lock in read mode. If multiple threads concurrently
initiate transfers to different downstream ports, they might take the read
lock simultaneously and race to overwrite hub_dev->info.dyn_addr, potential=
ly
causing transfers to be misrouted.

> +
> +	if (hub_addr !=3D target_addr) {
> +		down_write(&parent->bus.lock);
> +		hub_dev->info.dyn_addr =3D hub_addr;
> +
> +		xfer_ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev,
> +							      target_addr);

[Severity: Critical]
Does passing target_addr as the old dynamic address corrupt the parent bus
address slots?

When the core function interprets target_addr as the old dynamic address of
the device on the parent bus:

drivers/i3c/master.c:i3c_master_reattach_i3c_dev_locked() {
    ...
    if (old_dyn_addr)
        i3c_bus_set_addr_slot_status(&master->bus, old_dyn_addr,
                                     I3C_ADDR_SLOT_FREE);
    ...
}

Because target_addr is a downstream address independently assigned by the
virtual controller, this might blindly free an in-use address slot on the
parent bus that belongs to an unrelated physical device.

> +
> +		up_write(&parent->bus.lock);
> +		if (!ret)
> +			ret =3D xfer_ret;
> +	}
> +disable:
> +	i3c_hub_disable_port(controller);
> +	return ret;
> +}

[ ... ]

> +static int i3c_hub_i2c_xfers(struct i2c_dev_desc *dev,
> +			     struct i2c_msg *xfers, int nxfers)
> +{
> +	return 0;
> +}

[Severity: Medium]
Should this callback attempt to forward the I2C transfers through the hub to
the parent bus, or return an error like -EOPNOTSUPP? Unconditionally
returning 0 might lead the kernel and userspace applications to falsely
assume that I2C transactions to downstream devices were successful when no
actual hardware communication occurred.

[ ... ]

> +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> +			       const struct i3c_ibi_setup *req)
> +{
> +	struct i3c_master_controller *controller =3D i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *orig_parent;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub *hub;
> +	int ret;

[ ... ]

> +	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> +
> +	down_write(&parent->bus.lock);

[Severity: High]
Does acquiring parent->bus.lock here cause a lockdep splat? As with
i3c_hub_master_priv_xfers(), this might acquire a second lock of the
same class without using down_write_nested().

> +
> +	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
> +
> +	ret =3D i3c_master_direct_attach_i3c_dev_locked(parent, desc);

[Severity: High]
Are downstream devices missing from the physical parent's bus list?

i3c_master_direct_attach_i3c_dev_locked() explicitly skips adding the device
to the parent's bus.devs.i3c list. When the hardware subsequently receives =
an
IBI, the core framework (i3c_master_handle_ibi) might look up the source
device by matching the IBI address against its bus.devs.i3c list. Since the
downstream device is missing from the list, the lookup would predictably
fail, causing IBIs to be ignored.

> +	if (ret) {
> +		i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +		up_write(&parent->bus.lock);
> +		return ret;
> +	}
> +
> +	kfree(desc->ibi);
> +	desc->ibi =3D NULL;

[Severity: High]
Are we leaking the IBI workqueue here?

When i3c_dev_request_ibi_locked() handles an IBI request, it allocates a
new ibi structure and a workqueue (ibi->wq). Freeing desc->ibi without
destroying ibi->wq seems to leak the workqueue.

Furthermore, if the nested i3c_dev_request_ibi_locked() call fails, this
hub callback will return an error to the outer caller. The outer caller's
error handling path might then unconditionally execute kfree(ibi) using its
original local pointer:

drivers/i3c/master.c:i3c_dev_request_ibi_locked() {
    ...
    ret =3D master->ops->request_ibi(dev, req);
    if (ret) {
        kfree(ibi);
        dev->ibi =3D NULL;
    }
    ...
}

Since the hub callback already freed it, wouldn't this result in a
double-free?

> +	ret =3D i3c_dev_request_ibi_locked(desc, req);
> +	if (ret)
> +		i3c_master_direct_detach_i3c_dev_locked(desc);
> +
> +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +
> +	up_write(&parent->bus.lock);
> +
> +	return ret;
> +}
> +
> +static void i3c_hub_free_ibi(struct i3c_dev_desc *desc)
> +{
> +	struct i3c_master_controller *controller =3D i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *orig_parent;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub *hub;

[ ... ]

> +	down_write(&parent->bus.lock);
> +	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
> +	i3c_master_direct_detach_i3c_dev_locked(desc);
> +	i3c_dev_free_ibi_locked(desc);

[Severity: High]
Does this nested call to i3c_dev_free_ibi_locked() cause a NULL pointer
dereference upon returning to the outer caller?

The inner call tears down the IBI state and sets desc->ibi =3D NULL.
When control returns to the outer i3c_dev_free_ibi_locked():

drivers/i3c/master.c:i3c_dev_free_ibi_locked() {
    ...
    master->ops->free_ibi(dev);

    if (dev->ibi->wq) {
    ...
}

It seems to unconditionally evaluate dev->ibi->wq immediately after the
callback returns, which would blindly dereference the newly nullified
pointer.

> +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +	up_write(&parent->bus.lock);
> +
> +	i3c_hub_disable_port(controller);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612111816.3688=
240-1-lakshay.piplani@nxp.com?part=3D7
