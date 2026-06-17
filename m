Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BFD282F3A
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695090; cv=none; b=sSmBKXwsuxJ3v6GZxTCjGka/r92kaTPae2wtylIAfKMW3Gnb1y8hRWuj4+DYo4JzOydjGZ4xUjxhDHWp074qooFQEBpww7Dv+/G/UkSm0zLGVzcI9vX3+rEcLn8cUnPPr8Hm3mCnTr3bnuXLOA3J3C1kFXGFGSjTXpBH1x3LE2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695090; c=relaxed/simple;
	bh=aD8dD5p+/44c8fB9QiBdWQ+hcmF5aAlKG34iBDx5a7E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UdEQ8ypUG5d+GJ+OPfVj5icTtndCRs3NDrnFIaszqFCku6HaHWG0XaC3zawXP7QYAXrK12/9eJgLxXgHhJwAAUglfBxqNQFapBa9QAlvt65hJ74IJ4B2Tf4fN/hzOWTYx9mhnZcjwr4t+k9XU34XLHDzGUh4zr9nzFuJeg7J4vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAD/20LJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAD/20LJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFF71F00A3D;
	Wed, 17 Jun 2026 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781695085;
	bh=0O7n1x2uoPuiR0pxuOx+prQXqwOkZgkFZTU+B/41iyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YAD/20LJu29GU0Q+FrjODWS7FbZcojsq1dkBg26694uTX+bWR1Uf+dMl0jT+FdIHy
	 c41y36wWgUpzP5uCDmfmNBHi69pwWJOpzpH0uEry7z9yAGMsESBTclNa5WNNlhREsd
	 SJZCy72y3kmppNUB9MaIpptxTqllhCr/isWkm4cKlKvQ29VFDSyHdVzOg+o5Q4kPkA
	 ldFadGCQkvDXE1g0wNQSxysx1woLnz4y7emoBgMg1D5cKvUlQ8L2Lg/r9aXGDbLHct
	 VOUzxjqoDV5jkUi/oZLS+fOcCwKMoJHOB+IAAUkvu03JNs3AotJEoS0b0t829Lb7tY
	 IoUD+uAVDotug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260617110355.1591844-6-lakshay.piplani@nxp.com>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 11:18:04 +0000
Message-Id: <20260617111804.ABFF71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] Deterministic NULL pointer dereference in `i3c_hub_free_ibi()`=
 due to recursive callback chain.
- [Critical] Memory leak and double-free memory corruption in `i3c_hub_requ=
est_ibi()` error paths.
- [Critical] Critical race condition and parent bus state corruption in `i3=
c_hub_master_priv_xfers()` due to unlocked address mutation.
- [Critical] Unimplemented `i3c_hub_recycle_ibi_slot()` permanently leaks h=
ardware IBI slots.
- [Critical] Architectural bypass in `i3c_hub_do_daa()` attaches dynamicall=
y discovered devices to the parent bus instead of the virtual hub bus.
- [High] Calling `i3c_hub_enable_port()` outside of any locks allows concur=
rent operations to physically enable multiple downstream ports simultaneous=
ly, breaking electrical isolation.
- [High] Silently dropping broadcast RSTDAA commands prevents resetting of =
downstream devices.
- [Medium] Accepting I2C devices while unconditionally rejecting all I2C tr=
ansfers violates the API contract.
--

commit 2a201a9e0e9a55b31467d874340085240b34afc3
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: Add support for the I3C interface in the I3C hub

This patch adds virtual I3C bus support for the hub and provides an
interface to enable or disable downstream ports.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 0000000000000..e8744b5172340
> --- /dev/null
> +++ b/drivers/i3c/hub.c
> @@ -0,0 +1,483 @@

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

[Severity: Critical]
Since `i3c_master_do_daa()` executes the DAA sequence natively on the parent
controller, will the newly discovered devices be allocated and attached
directly to the parent bus instead of this virtual hub's bus?=20

If they are attached to the parent bus, won't subsequent transfers complete=
ly
bypass `i3c_hub_master_priv_xfers()`, causing communication with these
dynamically enumerated devices to fail?

[Severity: High]
Is there a risk of breaking electrical isolation here? `i3c_hub_enable_port=
()`
is called before acquiring any parent bus locks.=20

If multiple threads operate on different virtual controllers concurrently,
could they physically enable multiple downstream ports at the same time
before the bus lock is acquired?

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
Similar to `i3c_hub_do_daa()`, does calling `i3c_hub_enable_port()` without=
 a
lock risk enabling multiple ports concurrently if multiple CCC commands are
issued on different ports?

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

[ ... ]

> +	if (hub_addr !=3D target_addr) {
> +		down_write(&parent->bus.lock);
> +		hub_dev->info.dyn_addr =3D target_addr;
> +
> +		ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev, hub_addr);
> +		up_write(&parent->bus.lock);
> +		if (ret) {
> +			hub_dev->info.dyn_addr =3D hub_addr;
> +			goto disable;
> +		}
> +	}
> +
> +	ret =3D i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);

[Severity: Critical]
Does dropping `parent->bus.lock` before calling `i3c_device_do_xfers()` exp=
ose
a race condition?=20

If multiple downstream ports initiate transfers concurrently, could they
overwrite the shared `hub_dev->info.dyn_addr` before the transfer completes,
causing packets to be routed to the wrong physical device?

> +
> +	if (hub_addr !=3D target_addr) {
> +		down_write(&parent->bus.lock);
> +		hub_dev->info.dyn_addr =3D hub_addr;
> +
> +		xfer_ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev,
> +							      target_addr);

[Severity: Critical]
Could passing `target_addr` as the old address corrupt the parent bus state?

`i3c_master_reattach_i3c_dev_locked()` frees the old address slot in the bus
slot map. Will this erroneously mark `target_addr` as `I3C_ADDR_SLOT_FREE`
on the parent bus?

> +
> +		up_write(&parent->bus.lock);
> +		if (!ret)
> +			ret =3D xfer_ret;
> +	}
> +disable:
> +	i3c_hub_disable_port(controller);
> +	return ret;
> +}
> +
> +static int i3c_hub_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	return 0;
> +}

[ ... ]

> +static int i3c_hub_i2c_xfers(struct i2c_dev_desc *dev,
> +			     struct i2c_msg *xfers, int nxfers)
> +{
> +	return -EOPNOTSUPP;
> +}

[Severity: Medium]
Is it intentional to return `0` from `i3c_hub_attach_i2c_dev()` while rejec=
ting
all I2C transfers with `-EOPNOTSUPP`?=20

Would it be safer to return an error from the attach callback to cleanly
prevent I2C driver binding if the hub does not support I2C forwarding?

[ ... ]

> +static int i3c_hub_master_send_ccc_cmd(struct i3c_master_controller *con=
troller,
> +				       struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller =3D dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub =3D hub_controller->hub;
> +
> +	if (!hub->hub_dev)
> +		return -ENODEV;
> +
> +	if (cmd->id =3D=3D I3C_CCC_RSTDAA(true))
> +		return 0;

[Severity: High]
Does silently dropping the broadcast RSTDAA command prevent downstream devi=
ces
from being correctly reset by the hub?=20

If the command is dropped instead of being forwarded to the downstream port=
s,
will devices retain their old dynamic addresses and fail to re-initialize
during hot-plug recovery?

> +
> +	return i3c_hub_send_ccc_cmd(hub, controller, cmd);
> +}

[ ... ]

> +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> +			       const struct i3c_ibi_setup *req)
> +{

[ ... ]

> +	ret =3D i3c_master_direct_attach_i3c_dev_locked(parent, desc);
> +	if (ret) {
> +		i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +		up_write(&parent->bus.lock);
> +		return ret;
> +	}
> +
> +	kfree(desc->ibi);

[Severity: Critical]
Does freeing `desc->ibi` here leak `desc->ibi->wq`?

When the core function `i3c_dev_request_ibi_locked()` allocates `ibi`, it a=
lso
allocates `ibi->wq`.=20

Also, if the inner call to `i3c_dev_request_ibi_locked()` fails, this funct=
ion
returns an error to the original core caller. Will the outer caller's error
path execute `kfree(ibi)` on its local variable, resulting in a double-free
since it was already freed here?

> +	desc->ibi =3D NULL;
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

[ ... ]

> +	i3c_hub_enable_port(controller);
> +
> +	down_write(&parent->bus.lock);
> +	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
> +	i3c_master_direct_detach_i3c_dev_locked(desc);
> +	i3c_dev_free_ibi_locked(desc);

[Severity: Critical]
Can this recursive call to `i3c_dev_free_ibi_locked(desc)` cause a null
pointer dereference?

When the core initially calls `i3c_dev_free_ibi_locked(desc)`, it invokes
this hub callback. The inner call here successfully frees `desc->ibi` and s=
ets
it to null.=20

When control returns to the outer core function, it unconditionally evaluat=
es:

    if (dev->ibi->wq) {

Will this immediately dereference the null pointer?

> +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> +	up_write(&parent->bus.lock);
> +
> +	i3c_hub_disable_port(controller);
> +}

[ ... ]

> +static void i3c_hub_recycle_ibi_slot(struct i3c_dev_desc *desc,
> +				     struct i3c_ibi_slot *slot)
> +{
> +}

[Severity: Critical]
Does leaving this function empty permanently leak hardware IBI slots?

When the core finishes processing an IBI, it returns the slot to the virtual
controller. Because this doesn't forward the recycle request to the parent
hardware controller, will the parent controller eventually exhaust its hard=
ware
slots and permanently stop processing IBIs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617110355.1591=
844-1-lakshay.piplani@nxp.com?part=3D5
