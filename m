Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44634EF0F
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023404; cv=none; b=ZzNQL561kuy6hjCB1yK/YJ+wm/Th9kh+8rn7S6A5au4JzQNQETHXT0t/dBlMCTctVkj4EN7Tf5hkSlT8TX+CcMZ6ZrhVl6mbD3DOOWpMeFB5kFTA+KQr2JCQffRV8HF6e+FM4anDiAaiRNhNraW9+v3chsTWjqgk3iJ5nVhA5jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023404; c=relaxed/simple;
	bh=Cjw6/xr9+zb4QpcMMDxy9dloxL9jues8MbkzwJ+qzLs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NgHmWeQUWWmO4/OoN+HPUnQgES9WLTgSjZRMEDTwBKe8DWHtJHiZD35cnULfgpvIDtURnx5tfzBX6UkO3V6FODgDcOxqt/qGTK+ldh+chgu0UJutGEn1UdTIEZXqIeRQIg7mqs27l6eI/j9ShsiSdzz+U8MybeeZOQGVU4pFrfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sum6BDxI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sum6BDxI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F82A1F00A3A;
	Tue, 14 Jul 2026 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784023402;
	bh=3yM6X5ImRpI7LmJuL/Zfmy9fl8hjy0h3JuJHAr9Dqwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sum6BDxI9rWiHkFImL+HziN6jgk5hKvxTpL3KFCbfVemYkEcV0UD997Ds4kOwLFTn
	 rpWQMe2Gfyqw8264t3/MDequID6+oL36AOxdxTLpCekDLZoVw/gOcHKT81224FAOqb
	 5R3FxrXp+X1foXPISxVNKn0FSmUU93ji8Rt3yfzIYbJ3lvLRSpbCidhFZJiHwCEq0/
	 cD8hTtt/mN8F8XIFPkoGjKueQ/23JwPfX2A/VFKwytRWi2LQR6qU3j3G5pgjThDvtS
	 17CbNxoiwCkhlmOrA3uDeZ5Ly+pcS88kUeSIUh4Q+d2x4DPoluWoVjai8xqZjDgw0V
	 sN54ooq2RgDdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 1/8] i3c: master: Add APIs for I3C hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714092053.2461482-2-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 10:03:22 +0000
Message-Id: <20260714100322.7F82A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Asymmetrical cleanup in `i3c_master_direct_detach_i3c_dev_locked` =
leaks resources for unaddressed devices.

Pre-existing issues:
- [High] IDR entry deletion on `i3c_bus_init` failure causes ID corruption =
and sysfs collisions.
- [High] Missing NULL check for `dev->boardinfo` in `i3c_master_get_i3c_add=
rs` leads to kernel panic.
--

--- Patch [1]: [PATCH v14 1/8] i3c: master: Add APIs for I3C hub support ---
commit 1db519c7da22819d977429d77c0d05ba94daedf9
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: master: Add APIs for I3C hub support

Add helpers for attaching and detaching I3C devices and CCC helpers
to check CCC support and send CCC commands, address slot helpers to
query and update I3C bus address slot state, registering virtual
masters with an explicit firmware node, and exposing the bus maintenance
lock helpers.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca1..3b1c342be2bc5 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -1775,6 +1792,83 @@ static int i3c_master_attach_i3c_dev(struct i3c_ma=
ster_controller *master,
>  	return 0;
>  }
> =20
> +/**
> + * i3c_master_direct_attach_i3c_dev_locked() - Attach an I3C device to a=
 master
> + * @master: I3C master controller to attach the device to
> + * @dev: I3C device descriptor representing the device
> + *
> + * Attach an I3C device to its master controller after reserving the dev=
ice
> + * addresses on the bus. The device must belong to @master.
> + *
> + * The master device itself is not passed to the controller driver's
> + * ->attach_i3c_dev() callback.
> + *
> + * Context: Caller must hold @master->bus.lock in write mode.
> + *
> + * Return: 0 on success, or a negative error code if address reservation=
 fails
> + * or if the master controller driver's ->attach_i3c_dev() callback fail=
s.
> + */
> +int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller=
 *master,
> +					    struct i3c_dev_desc *dev)
> +{
> +	int ret;
> +
> +	if (WARN_ON(i3c_dev_get_master(dev) !=3D master))
> +		return -EINVAL;
> +
> +	ret =3D i3c_master_get_i3c_addrs(dev);

[Severity: High]
This is a pre-existing issue, but does exposing this new API introduce a
potential NULL pointer dereference?

If a caller manually constructs a virtual I3C device without an OF node
where dev->boardinfo is NULL, but it has a static_addr, calling this
function will invoke i3c_master_get_i3c_addrs(). Inside that function,
if the static address slot is not free:

i3c_master_get_i3c_addrs() {
    ...
    status =3D i3c_bus_get_addr_slot_status(&master->bus,
                                          dev->info.static_addr);
    if (status !=3D I3C_ADDR_SLOT_FREE &&
        dev->info.static_addr !=3D dev->boardinfo->init_dyn_addr)
        return -EBUSY;
    ...
}

Could this dereference dev->boardinfo without checking if it is NULL, leadi=
ng
to a kernel panic?

> +	if (ret)
> +		return ret;
> +
> +	/* Do not attach the master device itself. */
> +	if (master->this !=3D dev && master->ops->attach_i3c_dev) {
> +		ret =3D master->ops->attach_i3c_dev(dev);

[Severity: High]
Could this cause an asymmetrical resource leak for unaddressed devices?

The original i3c_master_attach_i3c_dev() function includes a check at the
beginning to return early if the device has no static or dynamic address:

if (!dev->info.static_addr && !dev->info.dyn_addr)
    return 0;

This new attach function lacks that check, meaning it invokes the master
controller's attach_i3c_dev() hook even for unaddressed devices.

However, the new i3c_master_direct_detach_i3c_dev_locked() function
explicitly skips detach for unaddressed devices:

if (!dev->info.static_addr && !dev->info.dyn_addr)
    return;

Will any resources allocated by the controller driver during the attach
hook be permanently leaked when the device is detached?

> +		if (ret) {
> +			i3c_master_put_i3c_addrs(dev);
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);

[ ... ]

> @@ -3195,34 +3342,31 @@ static int i3c_master_check_ops(const struct i3c_=
master_controller_ops *ops)

[ ... ]

> +int i3c_master_register_fwnode(struct i3c_master_controller *master,
> +			       struct device *parent,
> +			       struct fwnode_handle *fwnode,
> +			       const struct i3c_master_controller_ops *ops,
> +			       bool secondary)
> +{
> +	unsigned long i2c_scl_rate =3D I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE;
> +	struct i3c_bus *i3cbus =3D i3c_master_get_bus(master);
> +	enum i3c_bus_mode mode =3D I3C_BUS_MODE_PURE;
> +	struct device_node *np =3D NULL;
> +	struct i2c_dev_boardinfo *i2cbi;
> +	int ret;

[ ... ]

> +	ret =3D i3c_bus_init(i3cbus, master->dev.of_node);
> +	if (ret)
> +		goto err_put_dev;

[Severity: High]
This isn't a bug introduced by this patch, but does an error here cause
global IDR corruption?

If i3c_bus_init() fails during idr_alloc(), it returns an error with
i3cbus->id still set to 0. Taking the err_put_dev path calls put_device() on
master->dev, which invokes i3c_masterdev_release().=20

i3c_masterdev_release() unconditionally calls i3c_bus_cleanup(), which runs:

i3c_bus_cleanup() {
    ...
    idr_remove(&i3c_bus_idr, i3cbus->id);
    ...
}

If i3cbus->id is uninitialized (0), does this mistakenly remove ID 0 from
the global i3c_bus_idr? If a valid bus was already registered with ID 0, it
seems it would lose its IDR entry, causing a subsequent bus registration to
be assigned ID 0 again and triggering sysfs collisions (i3c-0).

> +
> +	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> +
> +	ret =3D of_populate_i3c_bus(master);
> +	if (ret)
> +		goto err_put_dev;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714092053.2461=
482-1-lakshay.piplani@nxp.com?part=3D1
