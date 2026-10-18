Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7873C6A56
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353881; cv=none; b=q/TS4EfpdO6qBHE6vJSUbEOMuaCBv5kN1PR5/OHtfe6QKKLUvjS3218ZNhj/b+v1EqlWCj94VFvYitabFlI880Qj+Gq79z5cM83Ss1dECHw0bHHT8zjhgjKNwirtfAUSEch0beSfDlLIlv6ftqGU8Lr/kzIyfCQvF3u5KEMe1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353881; c=relaxed/simple;
	bh=0yOh57vuYv3Sg4Ref31Ft+0Scd+sggjs/C0XvZ3LnAA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ar8mHM6EKJy7hWRHbjIUQQnSg4+HrV4jIHXP+pVnnhGei74BH+nM8+n0NqqafyQDASvPuU7gvUyQ81co98T63fjogoVcunFo/oMHlPU4Wpb/NtvnHfLg9x/DsUq/1qduzqHR7W4YgASlUWWfvv46Ov3DR5y+S3TA52deoeZmFoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htzu2quv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htzu2quv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241891F000C4;
	Sun, 18 Oct 2026 20:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792353878;
	bh=m4EezyhvZQrsw/YLbm/KHbIJdR7ZhiZKkBMQ3NK0wqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=htzu2quv4Kvs6euQMJfOyxnpTLrNJxLVt7HOZ/PN96y9wr4ksnB7GZBc8gPLwKBBk
	 rgQBeKyilAEiLGa/dMTvygD2ZOy9rVQ0avER02DA10hGGYS6pVTEQQ5zcHZge4rb+R
	 ci9aTAjicAVA0m1x26VFtzO5pyv7On9BazaQyNdWhm30kS1pLZkpEKI72HksnX/hHC
	 eR9zzUflCFqB6mDcLAv6BYJWGz1SqKJrxoxpvLtVcgxlZESQjHXOvxxWaJ7UQ20w9I
	 Tu+zD5qycgO+RstgnfnaAInzvFgbsXbOYyvHzBs/dtu9fhE0kbUPCcjXom+i2CGL5q
	 15J9y36yLvkKQ==
Message-ID: <sashiko-outbox-176357@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] i2c: add driver for GPIO buses sharing one SCL line
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ross Cawston" <ross@r-sc.ca>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018194315.945-3-ross@r-sc.ca>
References: <20261018194315.945-1-ross@r-sc.ca>
 <20261018194315.945-3-ross@r-sc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 20:04:37 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] i2c: i2c-gpio-shared-scl: sleeping mutex in pre_xfer() breaks atom=
ic xfer
- [Medium] i2c: i2c-gpio-shared-scl: buses registered before all SDA GPIOs =
driven high
- [Medium] i2c: i2c-gpio-shared-scl: duplicates shared-SCL support in i2c-g=
pio
--

commit 79f8386f6a7c7a3c6b945869078cb1a7bbcc4a64
Author: Ross Cawston <ross@r-sc.ca>

i2c: add driver for GPIO buses sharing one SCL line

This commit adds a driver for GPIO-bitbanged I2C buses that share a
single SCL GPIO line across multiple SDA child nodes, serializing
transfers with a mutex in pre_xfer and post_xfer.

>     i2c: add driver for GPIO buses sharing one SCL line
>    =20
>     Some boards bit-bang several I2C buses on GPIOs with one common SCL
>     line and one SDA line per bus. The MokerLink POE-10G07110GSM, an
>     RTL9303 PoE switch, clocks its fan controller, its two PoE controllers
>     and its SFP+ cage this way. i2c-gpio cannot be used, as each instance
>     would request the shared SCL GPIO.
>    =20
>     Request SCL once and register one i2c-algo-bit adapter per SDA child
>     node. A mutex taken in pre_xfer and released in post_xfer serializes
>     the transfers across the buses, so only one bus clocks SCL at a time
>     and the idle SDA lines see clock pulses only without a START.
>    =20
>     Signed-off-by: Ross Cawston <ross@r-sc.ca>

> diff --git a/drivers/i2c/busses/i2c-gpio-shared-scl.c b/drivers/i2c/busse=
s/i2c-gpio-shared-scl.c
> new file mode 100644
> index 0000000000000..6f7ee898392a5
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-gpio-shared-scl.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Bit-banged I2C buses that share one SCL line
> + *
> + * Some boards wire several I2C buses to GPIOs with one common SCL line =
and
> + * a separate SDA line per bus. The vendor firmware bit-bangs them in tu=
rn.
> + * i2c-gpio cannot describe this, because every bus would request the sa=
me
> + * SCL GPIO. This driver requests SCL once and registers one adapter per=
 SDA
> + * line. Transfers on the adapters are serialized, so only one bus drives
> + * SCL at a time; devices on the other buses see SCL toggle while their =
SDA
> + * stays high, which is never a START condition, and ignore it.

[Severity: Medium]
The commit message and file header state that i2c-gpio cannot be used
because each instance would request the shared SCL GPIO. Is a separate
driver needed here given that drivers/i2c/busses/i2c-gpio.c already
supports shared SCL lines since commit 645c3d7d07fa ("i2c: i2c-gpio:
Enhance driver for buses with shared SCL")?

In drivers/i2c/busses/i2c-gpio.c, i2c_gpio_lookup_scl() matches shared
scl-gpios phandles and GPIO cells across multiple i2c-gpio DT nodes via
i2c_gpio_scl_matches(), requests the SCL descriptor once, reference-counts
it across bus instances in i2c_gpio_scl_list, sets bit_data->skip_bit_test,
and serializes transfers across all buses sharing that SCL line via
i2c_gpio_lock_ops:

drivers/i2c/busses/i2c-gpio.c:i2c_gpio_lookup_scl() {
	scoped_guard(mutex, &i2c_gpio_scl_list_lock) {
		list_for_each_entry(scl, &i2c_gpio_scl_list, list) {
			if (!i2c_gpio_scl_matches(scl, new_scl))
				continue;

			i2c_gpio_free_scl(new_scl);
			if (!scl->gpio)
				return ERR_PTR(-EPROBE_DEFER);

			refcount_inc(&scl->ref);
			if (scl->args.fwnode)
				dev_dbg(dev, "reusing shared SCL (%pfwP)\n", scl->args.fwnode);

			return scl;
		}
		list_add(&new_scl->list, &i2c_gpio_scl_list);
	}
}

Can the MokerLink RTL9303 switch use the existing i2c-gpio driver and
binding instead?

[ ... ]

> +static int i2c_gpio_shared_scl_pre_xfer(struct i2c_adapter *adap)
> +{
> +	struct i2c_gpio_shared_scl_bus *bus =3D i2c_get_adapdata(adap);
> +
> +	mutex_lock(&bus->parent->lock);
> +
> +	return 0;
> +}
> +
> +static void i2c_gpio_shared_scl_post_xfer(struct i2c_adapter *adap)
> +{
> +	struct i2c_gpio_shared_scl_bus *bus =3D i2c_get_adapdata(adap);
> +
> +	mutex_unlock(&bus->parent->lock);
> +}

[Severity: High]
Will taking bus->parent->lock in i2c_gpio_shared_scl_pre_xfer() sleep in
atomic context during atomic I2C transfers, and allow sibling buses to
interleave during multi-transfer locked sequences?

i2c_gpio_shared_scl_add_bus() registers each adapter with
i2c_bit_add_bus(), which sets adap->algo to i2c_bit_algo (whose
xfer_atomic callback is bit_xfer_atomic()) while leaving adap->lock_ops
unset.

When i2c_in_atomic_xfer_mode() is true (such as during system shutdown,
reboot, poweroff, or panic), __i2c_lock_bus_helper() calls
i2c_trylock_bus(), which only trylocks the per-adapter adap->bus_lock and
cannot see if a sibling bus holds bus->parent->lock. __i2c_transfer()
then invokes:

bit_xfer_atomic()
  -> bit_xfer()
    -> adap->pre_xfer()
      -> i2c_gpio_shared_scl_pre_xfer()
        -> mutex_lock(&bus->parent->lock)

Even though bit_data->can_do_atomic is false, bit_xfer_atomic() only logs
a warning and still proceeds into bit_xfer():

drivers/i2c/algos/i2c-algo-bit.c:bit_xfer_atomic() {
	struct i2c_algo_bit_data *adap =3D i2c_adap->algo_data;

	if (!adap->can_do_atomic)
		dev_warn(&i2c_adap->dev, "not flagged for atomic transfers\n");

	return bit_xfer(i2c_adap, msgs, num);
}

This unconditionally calls mutex_lock() (followed by
gpiod_set_value_cansleep() and gpiod_get_value_cansleep()) in atomic
context.

In addition, callers that lock an adapter across multiple __i2c_transfer()
calls via i2c_lock_bus() (for example, i2c_transfer_rollball() in
drivers/net/mdio/mdio-i2c.c for SFP+ cages, or i2c-mux operations) only
hold the per-adapter adap->bus_lock while bus->parent->lock is released in
i2c_gpio_shared_scl_post_xfer() after each individual transfer, allowing a
sibling bus to clock the shared SCL line mid-sequence. Normal transfers
also nest struct mutex (bus->parent->lock) inside rt_mutex
(adap->bus_lock).

Should this instead implement struct i2c_lock_operations (lock_bus,
trylock_bus, unlock_bus) on adap->lock_ops backed by an rt_mutex (and set
bit_data->can_do_atomic based on gpiod_cansleep()), similar to how
drivers/i2c/busses/i2c-gpio.c handles shared SCL locking?

[ ... ]

> +static int i2c_gpio_shared_scl_add_bus(struct i2c_gpio_shared_scl *priv,
> +				       struct i2c_gpio_shared_scl_bus *bus,
> +				       struct fwnode_handle *child,
> +				       u32 udelay, u32 timeout_ms)
> +{
> +	struct device *dev =3D priv->dev;
> +	struct i2c_algo_bit_data *bit_data =3D &bus->bit_data;
> +	struct i2c_adapter *adap =3D &bus->adap;
> +	u32 reg;
> +	int ret;
> +
> +	ret =3D fwnode_property_read_u32(child, "reg", &reg);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "%pfwP: missing reg\n", child);
> +
> +	bus->parent =3D priv;
> +	bus->sda =3D devm_fwnode_gpiod_get(dev, child, "sda",
> +					 GPIOD_OUT_HIGH_OPEN_DRAIN,
> +					 fwnode_get_name(child));
> +	if (IS_ERR(bus->sda))
> +		return dev_err_probe(dev, PTR_ERR(bus->sda),
> +				     "%pfwP: cannot get SDA GPIO\n", child);
> +
> +	bit_data->data =3D bus;
> +	bit_data->setsda =3D i2c_gpio_shared_scl_setsda;
> +	bit_data->getsda =3D i2c_gpio_shared_scl_getsda;
> +	bit_data->setscl =3D i2c_gpio_shared_scl_setscl;
> +	bit_data->getscl =3D i2c_gpio_shared_scl_getscl;
> +	bit_data->pre_xfer =3D i2c_gpio_shared_scl_pre_xfer;
> +	bit_data->post_xfer =3D i2c_gpio_shared_scl_post_xfer;
> +	bit_data->udelay =3D udelay;
> +	bit_data->timeout =3D msecs_to_jiffies(timeout_ms);
> +
> +	adap->owner =3D THIS_MODULE;
> +	adap->algo_data =3D bit_data;
> +	adap->dev.parent =3D dev;
> +	device_set_node(&adap->dev, child);
> +	snprintf(adap->name, sizeof(adap->name), "%s SDA%u", dev_name(dev), reg=
);
> +	i2c_set_adapdata(adap, bus);
> +
> +	ret =3D i2c_bit_add_bus(adap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "%pfwP: cannot add bus\n", child);
> +
> +	bus->registered =3D true;
> +
> +	return 0;
> +}
> +
> +static int i2c_gpio_shared_scl_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	device_for_each_child_node_scoped(dev, child) {
> +		ret =3D i2c_gpio_shared_scl_add_bus(priv, &priv->buses[i++], child,
> +						  udelay, timeout_ms);
> +		if (ret) {
> +			i2c_gpio_shared_scl_del_buses(priv);
> +			return ret;
> +		}
> +	}

[Severity: Medium]
Can registering each adapter in the same loop that requests the per-bus
SDA GPIOs cause spurious START or STOP conditions on sibling buses that
have not yet been initialized?

For devices on idle buses to ignore activity on the shared priv->scl line,
their SDA lines must already be driven high (GPIOD_OUT_HIGH_OPEN_DRAIN).
However, i2c_gpio_shared_scl_probe() calls i2c_gpio_shared_scl_add_bus()
in a single pass, which calls i2c_bit_add_bus() for priv->buses[0] before
priv->buses[1..num_buses - 1] have requested their SDA GPIOs.

During i2c_bit_add_bus(&priv->buses[0].adap), the shared SCL line is
clocked immediately if i2c_algo_bit.bit_test is set or when child client
devices on bus 0 probe via of_i2c_register_devices() and perform transfers
while sibling SDA lines are still in their pre-probe state. Furthermore,
once bus 0 is registered, transfers on bus 0 can toggle priv->scl under
priv->lock concurrently while subsequent iterations of the loop call
devm_fwnode_gpiod_get(..., GPIOD_OUT_HIGH_OPEN_DRAIN, ...) for later
buses without holding priv->lock; transitioning a sibling SDA line while
priv->scl happens to be high creates a START or STOP condition on that
sibling bus.

Would it be safer to request and configure all child SDA GPIOs (and
validate DT properties) in a first pass before registering any of the
adapters with i2c_bit_add_bus()?

[ ... ]

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018194315.945-=
1-ross@r-sc.ca?part=3D2
