Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280D3E51C6
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701508; cv=none; b=R3BdlgcO5T/oSEVmoA3kb+px2qdJ9rAVrxTep0gbXbJvWIqH0F4GZYlM0os7fc+dXH+lEsC0UbnRQ5wAHsZDUojslRF8F7gDOv7QRZBfuTW2BAmlSdwrZF9OZ3Yj2GKaNDPHWnPFGZac7UCFnTxkImqt4UVJ8hf3CSQpPrTm7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701508; c=relaxed/simple;
	bh=hI4IsAPP6xRaE5/KkrwSJJuWpVi5D+NdQjpmBtWOY4k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g74X6mYeE1iw2kaPmDFyO+0gKtzbnQHzuBMX4pfvaCaUOEe7jelsEybgUgRwc3aG9bT+jRQEGj/WlYcF2gwLOxGEG5ESCpW+3hpElliXrbyQhimzr7w1fRJD/IL29v6vT+Sl47Vymzq8bZ2qmKCP+VekSSy2/oo/nzpYutHAAcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lllmDNYY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lllmDNYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6391F000E9;
	Mon, 25 May 2026 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779701506;
	bh=B8rdrOJoD9epMP6lrQZWjEbcruh8srZb3iG4inU1p6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lllmDNYYOYfvfrDdbUOEAnJxA3pYzS+5hQi+zbbQX9GorCwFNA6jYFbR/h6KAc7TO
	 NTFt/PeP7jOv1B/IiRUbO5biCgt+Z5Oc2db2JqXKIMu1zpypc6X0Q6FOpXEVnaeRe2
	 bw/N/iX/AM8iSL8jv4yoqVgA416/UQMC+2z637a+c67f4QUMeiGarLTqZeiA+OGkHp
	 k1AftiSP98hAQ1yOqBOCMHlHEntR1+EDN6UJ6IE2D58Iio9HUCYOPYupzj74iVHvjc
	 uM9d2gaOucUzclUBPlofemCI+l7qrQ833qWzV7XS6HstU5E86Hb98ag7vVcYcKelfv
	 gc6Big3enNkyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 7/9] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260525064209.2263045-8-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:31:46 +0000
Message-Id: <20260525093146.9E6391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

New issues:
- [Critical] Unconditional NULL pointer dereference in `i3c_dev_free_ibi_lo=
cked()` via recursive `i3c_hub_free_ibi()`.
- [High] Missing `up_write(&parent->bus.lock)` release on the error path in=
 `i3c_hub_request_ibi()`.
- [High] Double free of `desc->ibi` and leaked workqueue on the error path =
in `i3c_hub_request_ibi()`.
- [High] `i3c_hub_master_priv_xfers()` modifies shared hub device state and=
 parent bus topology without holding the parent controller's bus lock.
- [High] Bus address slot tracking is bypassed in `i3c_hub_master_priv_xfer=
s()` due to identical address arguments.
- [High] Failure to restore the hub device's dynamic address (`hub_dev->inf=
o.dyn_addr`) on the reattach error path in `i3c_hub_master_priv_xfers()`.
- [High] Architectural flaw: DAA logic incorrectly delegates directly to th=
e parent controller, permanently bypassing the virtual hub.
- [High] Missing `i3c_master_direct_detach_i3c_dev_locked()` on the error p=
ath in `i3c_hub_request_ibi()`.
- [Medium] Bitwise OR incorrectly used to combine signed error codes, resul=
ting in corrupted errno values.

Pre-existing issues:
- [High] Leaked workqueue on the error path of IBI requests in the I3C mast=
er core.
--

commit 75489fdfdbca4c7d1708dfb61bdd09e7018b9a0b
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: Add support for the I3C interface in the I3C hub

Add virtual I3C bus support for the hub by creating virtual master controll=
ers
for downstream ports and forwarding bus operations through the hub device. =
It
also provides an interface used by hub drivers to enable or disable downstr=
eam
ports during bus transactions.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 0000000000000..da0e209ee5b79
> --- /dev/null
> +++ b/drivers/i3c/hub.c
[ ... ]
> @@ -54,26 +54,26 @@ static void i3c_hub_detach_i3c_dev(struct i3c_dev_des=
c *dev)
>   */
>  static int i3c_hub_do_daa(struct i3c_hub *hub,
>  			  struct i3c_master_controller *controller)
>  {
>  	struct i3c_master_controller *parent;
>  	int ret;
> =20
>  	if (!hub || !hub->hub_dev)
>  		return -ENODEV;
> =20
>  	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
>  	if (!parent)
>  		return -ENODEV;
> =20
>  	i3c_hub_enable_port(controller);
>  	ret =3D i3c_master_do_daa(parent);
>  	i3c_hub_disable_port(controller);

[Severity: High]
Does this discovery logic bypass the virtual hub permanently?

When calling i3c_master_do_daa(parent), newly discovered downstream devices
are attached directly to the parent controller's bus. Future transfers or
IBI requests targeting these devices will use the parent controller directly
instead of i3c_hub_master_priv_xfers().

Because of this, will i3c_hub_enable_port() never be invoked for these
devices, leaving them unreachable?

[ ... ]
> @@ -126,45 +126,45 @@ static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
>   */
>  static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
>  				     struct i3c_xfer *xfers,
>  				     int nxfers,
>  				     enum i3c_xfer_mode mode)
>  {
>  	struct i3c_master_controller *controller =3D i3c_dev_get_master(dev);
>  	struct i3c_hub_controller *hub_controller;
>  	struct i3c_dev_desc *hub_dev;
>  	u8 hub_addr, target_addr;
>  	struct i3c_hub *hub;
>  	int ret;
> =20
>  	hub_controller =3D dev_get_drvdata(&controller->dev);
>  	if (!hub_controller || !hub_controller->hub)
>  		return -ENODEV;
> =20
>  	hub =3D hub_controller->hub;
> =20
>  	if (!hub->hub_dev)
>  		return -ENODEV;
> =20
>  	hub_dev =3D hub->hub_dev->desc;
> =20
>  	i3c_hub_enable_port(controller);
> =20
>  	hub_addr =3D hub_dev->info.dyn_addr ?
>  		   hub_dev->info.dyn_addr : hub_dev->info.static_addr;
> =20
>  	target_addr =3D dev->info.dyn_addr ?
>  		      dev->info.dyn_addr : dev->info.static_addr;
> =20
>  	if (hub_addr !=3D target_addr) {
>  		hub_dev->info.dyn_addr =3D target_addr;
>  		ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev, target_addr);

[Severity: High]
Can this sequence cause a race condition when modifying shared hub state?

This code modifies hub_dev->info.dyn_addr and invokes
i3c_master_reattach_i3c_dev_locked() without holding parent->bus.lock for
writing.

If multiple virtual master controllers (hub ports) initiate transfers
concurrently, might threads race to manipulate these shared hardware address
tables and enable multiple downstream ports simultaneously without
arbitration, leading to physical bus collisions?

[Severity: High]
Will bus address slot tracking be bypassed here?

The code sets hub_dev->info.dyn_addr =3D target_addr and then passes
target_addr as the old_dyn_addr argument to
i3c_master_reattach_i3c_dev_locked().

Inside the core function, the condition (dev->info.dyn_addr !=3D old_dyn_ad=
dr)
will evaluate to false, which skips updating the addr_slot_status tracking
array. Could this permanently corrupt the parent controller's view of free
and used bus addresses?

>  		if (ret)
>  			goto disable;

[Severity: High]
Should the dynamic address be restored on this error path?

If i3c_master_reattach_i3c_dev_locked() fails, the code jumps to the disable
label and returns. Since hub_dev->info.dyn_addr is not restored to hub_addr,
does this leave the software descriptor desynchronized from the actual
hardware state?

>  	}
> =20
>  	ret =3D i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);
> =20
>  	if (hub_addr !=3D target_addr) {
>  		hub_dev->info.dyn_addr =3D hub_addr;
>  		ret |=3D i3c_master_reattach_i3c_dev_locked(hub_dev, hub_addr);
>  	}
> =20
>  disable:

[Severity: Medium]
Is it safe to use a bitwise OR to combine these error codes?

Both i3c_device_do_xfers() and i3c_master_reattach_i3c_dev_locked() can
return negative error codes like -EAGAIN or -EBUSY. Performing a bitwise OR
combines these signed values, which can corrupt the resulting error code
and return a nonsensical status to the caller.

[ ... ]
> @@ -250,45 +250,45 @@ static bool i3c_hub_master_supports_ccc_cmd(struct =
i3c_master_controller *contro
>   */
>  static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
>  			       const struct i3c_ibi_setup *req)
>  {
>  	struct i3c_master_controller *controller =3D i3c_dev_get_master(desc);
>  	struct i3c_hub_controller *hub_controller;
>  	struct i3c_master_controller *orig_parent;
>  	struct i3c_master_controller *parent;
>  	struct i3c_hub *hub;
>  	int ret;
> =20
>  	hub_controller =3D dev_get_drvdata(&controller->dev);
>  	if (!hub_controller || !hub_controller->hub)
>  		return -ENODEV;
> =20
>  	hub =3D hub_controller->hub;
> =20
>  	if (!hub->hub_dev)
>  		return -ENODEV;
> =20
>  	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> =20
>  	down_write(&parent->bus.lock);
> =20
>  	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
> =20
>  	ret =3D i3c_master_direct_attach_i3c_dev_locked(parent, desc);
>  	if (ret) {
>  		i3c_hub_update_desc_parent(&desc->common, orig_parent);
>  		return ret;

[Severity: High]
Is a lock release missing on this error path?

A write lock is acquired on parent->bus.lock, but if the attachment fails,
the function returns immediately. Should up_write(&parent->bus.lock) be
called here to prevent a system deadlock on future parent bus operations?

>  	}
> =20
>  	kfree(desc->ibi);
>  	desc->ibi =3D NULL;

[Severity: High]
Could this lead to a double free and a resource leak?

When i3c_dev_request_ibi_locked() is called, it allocates desc->ibi and a
workqueue. This code blindly calls kfree(desc->ibi), which leaves the
workqueue memory leaked.

Furthermore, if the inner call to i3c_dev_request_ibi_locked() fails, it
sets desc->ibi to NULL. The outer i3c_dev_request_ibi_locked() will then
receive the error and execute kfree(ibi) on the original pointer that was
already freed, leading to a double free.

>  	ret =3D i3c_dev_request_ibi_locked(desc, req);

[Severity: High]
If this recursive call fails, should the device be detached?

The downstream device is directly attached to the parent hardware controlle=
r.
If i3c_dev_request_ibi_locked() fails, the function restores the descriptor
and returns without detaching the device from the parent. Since free_ibi
will never be called to clean up a failed request, does this permanently
leak the hardware attachment resources in the parent controller?

[Severity: High]
This isn't a bug introduced by this patch, but does the core I3C code leak a
workqueue on this error path?

In drivers/i3c/master.c:i3c_dev_request_ibi_locked(), an ordered workqueue
is allocated and assigned to ibi->wq. If the controller's request_ibi
callback fails, the code frees the ibi context but does not destroy the
workqueue, leading to a memory and kernel resource leak.

> =20
>  	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> =20
>  	up_write(&parent->bus.lock);
> =20
>  	return ret;
>  }
> =20
>  static void i3c_hub_free_ibi(struct i3c_dev_desc *desc)
>  {
>  	struct i3c_master_controller *controller =3D i3c_dev_get_master(desc);
>  	struct i3c_hub_controller *hub_controller;
>  	struct i3c_master_controller *orig_parent;
>  	struct i3c_master_controller *parent;
>  	struct i3c_hub *hub;
> =20
>  	hub_controller =3D dev_get_drvdata(&controller->dev);
>  	if (!hub_controller || !hub_controller->hub)
>  		return;
> =20
>  	hub =3D hub_controller->hub;
> =20
>  	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> =20
>  	i3c_hub_enable_port(controller);
> =20
>  	down_write(&parent->bus.lock);
>  	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
>  	i3c_master_direct_detach_i3c_dev_locked(desc);
>  	i3c_dev_free_ibi_locked(desc);

[Severity: Critical]
Does this recursive call result in a guaranteed NULL pointer dereference?

When the core invokes the hub's free_ibi callback, this function recursively
calls i3c_dev_free_ibi_locked() using the parent context. The inner call
frees dev->ibi and sets dev->ibi =3D NULL.

Upon returning to the outer i3c_dev_free_ibi_locked(), the core immediately
evaluates if (dev->ibi->wq). Since dev->ibi was just set to NULL, won't this
trigger a NULL pointer dereference on the success path?

>  	i3c_hub_update_desc_parent(&desc->common, orig_parent);
>  	up_write(&parent->bus.lock);
> =20
>  	i3c_hub_disable_port(controller);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525064209.2263=
045-1-lakshay.piplani@nxp.com?part=3D7
