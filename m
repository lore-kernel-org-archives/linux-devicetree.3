Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D391F0E25
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890601; cv=none; b=QE1CqmUTzSULzxkyaBOq/SgxTGlREGy0fGe9OqahWtP0ddS0Pt7prm5me6WR7a96XD5hOUGzpyZw/qHZuPmKYuEGkQV6Nnc0yjOelWOZqinDhoagvOrocDUv3nKq24BdCjpkkH+E1OkaPhivajYMkXn4YjmsTUdMNGcVKJpiPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890601; c=relaxed/simple;
	bh=M8GTPhS5KDTydLB3emXiO+e+Hk6UMiZitAI4lwY9M4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F+gE9d4Z712rR45I2G5EBTQJpVW/KQDqf26Sit+SwM43wEUiAtH1/HnV3l/piijqc49J3msipOPAdmsD9R2D5w1hddbQnoUiGJYdVQ8o5lU72YAel+AqtUfUsvCZo3l+AyUZXPJGaDsmSZ0gh0Bp+3CQl6e3ULmwNsYb6x9h5vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDejbA76; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDejbA76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165A41F000E9;
	Wed,  1 Jul 2026 07:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890600;
	bh=lKDSZqrNyc22qyxi6uNVTHql3X+zn18X14YoKohXkdg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dDejbA76UZEXbANWP+SEpZ33XNjVSxv8gyCDf8JtxyvJNQbmSBoJPIxGYEhqKnc/D
	 ylfOzJ1NgyuoGCdCb+sOuZeNIqtkf9Je12PbJxJ0TSmaKHzTbvt22zc5+5iZPRFbtA
	 zmVEqbHOzn+z4uL23XGrY386G+3uNPfc7d3/ietfl2x8tu6jIvnShqYH4iZt0g28d4
	 z7LHmCInWV2GZwerYNLjB17zTENZ5XtNirhc/Btmml4RUXTPXAagICzB58beA5xV94
	 1w4bxJoAIQ09m/yTeRPZ/6CVSi6txA1/ipL3PMO9K7l4Z6rvgmV1IbJi2wsEcRK4Ov
	 43JwkJZtN5C/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 5/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260701065755.2067793-6-lakshay.piplani@nxp.com>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:23:18 +0000
Message-Id: <20260701072319.165A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] `i3c_hub_request_ibi()` intentionally frees `desc->ibi` out fr=
om under its caller without cleaning up its workqueue, causing a memory lea=
k and a double-free on failure.
- [High] `i3c_hub_free_ibi()` causes a guaranteed NULL pointer dereference =
in the core IBI free path by recursively clearing `dev->ibi`.
- [High] Address spoofing in `i3c_hub_master_priv_xfers` corrupts parent bu=
s address reservations and suffers from an unprotected race window.
- [High] Missing `xfer_lock` in several hub operations allows concurrent po=
rt enabling, breaking virtual bus isolation.
- [High] `i3c_hub_free_ibi()` permanently destroys downstream device addres=
s reservations on the parent bus.
- [High] `i3c_hub_do_daa` delegates DAA entirely to the parent controller, =
breaking boardinfo matching and DT topology for downstream devices.
- [Medium] Acquiring `parent->bus.lock` while holding `child->bus.lock` tri=
ggers a lockdep splat due to unannotated same-class lock nesting.
--

commit 22c2a31197952a434777498d93a1ed925009d6de
Author: Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: i3c: hub: Add support for the I3C interface in the I3C hub

This patch adds virtual I3C bus support for the hub and provides an
interface to enable or disable downstream ports. Virtual master controllers
are created for the downstream ports, and bus operations are forwarded
through the hub device.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 0000000000000..d29ed40b6f735
> --- /dev/null
> +++ b/drivers/i3c/hub.c
> @@ -0,0 +1,566 @@

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
> +	ret =3D i3c_master_do_daa(parent);

[Severity: High]
Does delegating DAA directly to the parent controller bypass the virtual hub
bus entirely?

By calling i3c_master_do_daa(parent), it appears the parent discovers and
attaches downstream devices to the physical bus instead of the virtual
controller. Does this cause boardinfo matching to fail since the devices
are defined under the hub's device tree node?

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
> +	ret =3D i3c_master_send_ccc_cmd(parent, cmd);

[Severity: High]
Could the omission of hub->xfer_lock in this function allow concurrent port
enabling?

The lock is used to serialize private transfers, but callbacks like
i3c_hub_send_ccc_cmd(), i3c_hub_do_daa(), and i3c_hub_enable_ibi() do not
acquire it. If a private transfer runs concurrently with a CCC command,
could multiple downstream ports be enabled simultaneously and cause the hub
to broadcast traffic incorrectly?

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

[Severity: Medium]
Will acquiring parent->bus.lock here trigger a lockdep warning?

Since virtual hub operations are invoked by the I3C core with the child
bus's lock already held, acquiring the parent bus's lock (which belongs to
the same lock class) without nesting annotations might produce a false
positive lockdep splat. This also happens in i3c_hub_enable_ibi() and
i3c_hub_disable_ibi().

> +		hub_dev->info.dyn_addr =3D target_addr;
> +
> +		ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev, hub_addr);
> +		if (ret) {
> +			up_write(&parent->bus.lock);
> +			hub_dev->info.dyn_addr =3D hub_addr;
> +			goto disable;
> +		}
> +		up_write(&parent->bus.lock);
> +	}
> +
> +	ret =3D i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);
> +
> +	if (hub_addr !=3D target_addr) {
> +		down_write(&parent->bus.lock);
> +		hub_dev->info.dyn_addr =3D hub_addr;
> +
> +		xfer_ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev,
> +							      target_addr);

[Severity: High]
Does this sequence permanently destroy device tree static address
reservations?

When the hub's dynamic address is altered via
i3c_master_reattach_i3c_dev_locked(), the hub's original address slot is
set to free on the parent bus, leaving it vulnerable to DAA theft since the
parent write-lock is dropped during the transfer. When the address is
restored later by passing target_addr to i3c_master_reattach_i3c_dev_locked,
this marks the downstream device's address as free, which seems to wipe out
its reservation.

> +
> +		up_write(&parent->bus.lock);
> +		if (!ret)
> +			ret =3D xfer_ret;
> +	}
> +disable:
> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->xfer_lock);
> +	return ret;
> +}

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

> +	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
> +
> +	ret =3D i3c_master_direct_attach_i3c_dev_locked(parent, desc);
> +	if (ret) {
> +		i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +		up_write(&parent->bus.lock);
> +		return ret;
> +	}
> +
> +	kfree(desc->ibi);
> +	desc->ibi =3D NULL;
> +	ret =3D i3c_dev_request_ibi_locked(desc, req);

[Severity: Critical]
Can freeing desc->ibi here cause a memory leak and a double-free?

If a downstream device requests an IBI, the core i3c_dev_request_ibi_locked=
()
allocates ibi and ibi->wq before calling this hub operation. By calling
kfree(desc->ibi) here, the outer workqueue is leaked.

Furthermore, if the recursive call to i3c_dev_request_ibi_locked() fails,
the outer caller will execute:

    if (ret) {
            kfree(ibi);
            dev->ibi =3D NULL;
    }

Could this result in a double-free on the original allocation?

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

> +	i3c_hub_enable_port(controller);
> +
> +	down_write(&parent->bus.lock);
> +	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
> +	i3c_dev_free_ibi_locked(desc);
> +	i3c_master_direct_detach_i3c_dev_locked(desc);

[Severity: High]
Does reparenting the device to the upstream master before detaching it
destroy its address reservations?

The detach logic calls i3c_master_put_i3c_addrs(), which resets the device's
static and dynamic address slots to free. Because the device is temporarily
parented to the upstream master, this frees the addresses on the parent bus.

[Severity: High]
Also, does the recursive call to i3c_dev_free_ibi_locked(desc) guarantee a
NULL pointer dereference?

The core i3c_dev_free_ibi_locked() function calls master->ops->free_ibi(dev=
).
When this hub implementation recursively calls i3c_dev_free_ibi_locked(), it
frees the IBI and sets desc->ibi =3D NULL. Upon returning to the outer func=
tion,
it executes:

    if (dev->ibi->wq) {
            destroy_workqueue(dev->ibi->wq);
   =20
which unconditionally dereferences the newly set NULL pointer.

> +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +	up_write(&parent->bus.lock);
> +
> +	i3c_hub_disable_port(controller);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701065755.2067=
793-1-lakshay.piplani@nxp.com?part=3D5
