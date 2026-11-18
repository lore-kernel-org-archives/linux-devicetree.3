Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011386;
	b=YThpcwmhSkyU4QvnPKnTcXHYZNfrI9lw1LthXN5yb4grsiMzE+r07hrDmON/w1QljA/N
	 Dj8SkS6TyJZ8hwB2rwmn1SLUBuR2wI5QRm+EIF+uxhQonnE3RIc2iovdot7uMLEO2/+MH
	 WU4vS+HLlXU+Pr35wyVy2UlH7XIv7PrYt+i6Mz0oDRa6DU9X4jZsNiQu3hCmVZLZUevuU
	 iGkzv7FmZ76r9qOmIfFj9BEmepVES++mfaAh0xJMX7UxE1k62Y9qXbi6ic2nvOmnqiRxg
	 X58fadzY/KiCXnCN7b42QXJRJeDxgDf17hJO1EuTC5oo9aa8Kly/qWnhBo4hV/eBzDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011386;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MwwOGXJR7+uyo9aDOmmqQWOoB1xXE2D5FOQ0OvEC4rI=;
	b=SrN4mfXfd/+hHL9/5YW8VO5YWqjHSASrd9HIH23izpqMoDW1/VP9m01RucZHNY1v++am
	 EjLLk/dZ2tB1THX5RkGUwu+D1jewnnvWUYkwa6NQ8KFIxorhrcz5KVLha7hMmyv6QBzIb
	 bqZKEIzaoEsOPIy+MM/kIAA6+7GrORasiNBB8eS00qXxx/SUQa9NCsUsNtAaCdNZDwj0G
	 yltAG5NQVC11/V22K1zq3yn+EEfrEjMIIvtV5Y6NCFLw4O+3/GoEHcbHkTBDgufjCtMIr
	 1lsDjO2y6J5ZZC5VLyxb9GtgWs4XyW/kz7Z90ynIRZZQhwv4tuZxTCXyVWlFKFuxBAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZcPoD8e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A37260A2611
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZcPoD8e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833371F000C6;
	Wed, 18 Nov 2026 14:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795011385;
	bh=MwwOGXJR7+uyo9aDOmmqQWOoB1xXE2D5FOQ0OvEC4rI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GZcPoD8e2RpdyrJmYtqQBCI9lITNzVZjGUJDpTj4cO/pGS7XEtKFZsQmpBOhDwcGI
	 R+zds/gFET/WqMPU0czPcEvMGMXwn6sHecOWB5Nj5Wv5PK5zEL0C32xAaqEEffR/nb
	 Wwcsph5EDGmXFnW2JlGJMWHZVtfdE+5+D3j7BlLrky2iGcfFG5Dcp5421nz9sB67KC
	 pLHF7PMJJaz8qyzTowBI8RFdPpHMUhQNQZVUnj/uD9MxHrfD9tibtXYrATACR1vX7F
	 Icgqgtg2Pvxv8phF3zYezvSWSRY4Ov3WaqOUnIpzII9pvIcDIVadHTpA/Wro77ALZK
	 Wwjn8/0okzMww==
Message-ID: <sashiko-outbox-221177@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] platform/asus: Add driver for ASUS Transformer's
 Dock of Tegra based devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118134555.195479-3-clamor95@gmail.com>
References: <20261118134555.195479-1-clamor95@gmail.com>
 <20261118134555.195479-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:16:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] platform/asus: missing I2C dependency for ASUS_TRANSFORMER_DOCK
  in Kconfig
- [High] platform/asus: NULL dereference in asus_tf_dock_probe() from
  IS_ERR() checks
- [High] platform/asus: module refcount underflow in
  asus_tf_dock_probe()
- [Medium] platform/asus: unchecked gpiod_get_value_cansleep() in
  asus_tf_dock_interrupt()
- [Medium] platform/asus: unchecked gpiod_to_irq() error return in
  asus_tf_dock_probe()
- [Medium] platform/asus: asus-transformer-dock: bypass of
  __i2c_transfer() on parent
--

commit e7bf89be9d43a55643ec7570e3aed3724b7cdbf9
Author: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

platform/asus: Add driver for ASUS Transformer's Dock of Tegra based devices

This commit adds a platform driver for the hot-pluggable I2C bus in the
ASUS Transformer dock on Tegra-based devices, registering or removing a
forwarding I2C adapter based on a detect GPIO interrupt.

> diff --git a/drivers/platform/asus/Kconfig b/drivers/platform/asus/Kconfig
> index 0219418ce3523..af670a3c0d014 100644
> --- a/drivers/platform/asus/Kconfig
> +++ b/drivers/platform/asus/Kconfig
> @@ -113,6 +113,17 @@ config ASUS_ARMOURY
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called asus-armoury.
> =20
> +config ASUS_TRANSFORMER_DOCK
> +	tristate "ASUS Transformer Dock for Tegra based devices"
> +	depends on GPIOLIB
> +	depends on OF

[Severity: High]
Should ASUS_TRANSFORMER_DOCK also depend on I2C?  The driver calls I2C core
helpers such as i2c_add_adapter(), i2c_del_adapter() and i2c_put_adapter(),
which fails to compile when CONFIG_I2C=3Dn and fails to link when
CONFIG_I2C=3Dm and CONFIG_ASUS_TRANSFORMER_DOCK=3Dy.

[ ... ]

> diff --git a/drivers/platform/asus/asus-transformer-dock.c b/drivers/plat=
form/asus/asus-transformer-dock.c
> new file mode 100644
> index 0000000000000..7c9346af5e1f3
> --- /dev/null
> +++ b/drivers/platform/asus/asus-transformer-dock.c
> @@ -0,0 +1,260 @@

[ ... ]

> +static int asus_tf_dock_master_xfer(struct i2c_adapter *adap,
> +				    struct i2c_msg msgs[], int num)
> +{
> +	struct i2c_adapter *parent =3D asus_tf_dock_parent(adap);
> +
> +	return parent->algo->master_xfer(parent, msgs, num);
> +}
> +
> +static int asus_tf_dock_smbus_xfer(struct i2c_adapter *adap, u16 addr,
> +				   unsigned short flags, char read_write,
> +				   u8 command, int protocol,
> +				   union i2c_smbus_data *data)
> +{
> +	struct i2c_adapter *parent =3D asus_tf_dock_parent(adap);
> +
> +	return parent->algo->smbus_xfer(parent, addr, flags, read_write,
> +					command, protocol, data);
> +}

[Severity: Medium]
Should these callbacks use __i2c_transfer(parent, ...) and
__i2c_smbus_xfer(parent, ...) instead of calling parent->algo directly?

Calling parent->algo directly skips __i2c_check_suspended(parent), atomic
transfer dispatch (master_xfer_atomic and smbus_xfer_atomic) and SMBus
emulation fallback on -EOPNOTSUPP.  Because priv->adap.dev.parent is set to
the platform device rather than &parent->dev, a transfer through priv->adap
after tegra_i2c_suspend_noirq() has marked parent suspended and disabled
controller clocks can enter tegra_i2c_xfer() while clocks are off.

[ ... ]

> +static irqreturn_t asus_tf_dock_interrupt(int irq, void *dev_id)
> +{
> +	struct asus_tf_dock_priv *priv =3D dev_id;
> +
> +	/* debounce */
> +	msleep(20);
> +
> +	if (gpiod_get_value_cansleep(priv->gpio))
> +		asus_tf_dock_activate(priv);
> +	else
> +		asus_tf_dock_deactivate(priv);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Can a negative error code from gpiod_get_value_cansleep() cause
asus_tf_dock_interrupt() to falsely activate the dock adapter?
gpiod_get_value_cansleep() returns a negative errno on failure, which
evaluates as true in the if condition.

> +
> +static void wrap_i2c_put_adapter(void *adapter)
> +{
> +	i2c_put_adapter(adapter);
> +}
> +
> +static void wrap_asus_tf_dock_deactivate(void *priv)
> +{
> +	asus_tf_dock_deactivate(priv);
> +}
> +
> +static int asus_tf_dock_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *parent_np;
> +	struct i2c_adapter *parent;
> +	struct asus_tf_dock_priv *priv;
> +	bool is_i2c, is_smbus;
> +	int err;
> +
> +	priv =3D devm_kzalloc_obj(dev, struct asus_tf_dock_priv);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->dev =3D dev;
> +
> +	parent_np =3D of_parse_phandle(dev->of_node, "i2c-parent", 0);
> +	if (IS_ERR(parent_np))
> +		return dev_err_probe(dev, PTR_ERR(parent_np),
> +				     "Failed to parse i2c-parent\n");
> +
> +	parent =3D of_find_i2c_adapter_by_node(parent_np);
> +	of_node_put(parent_np);
> +	if (IS_ERR(parent))
> +		return dev_err_probe(dev, PTR_ERR(parent),
> +				     "Failed to get parent I2C adapter\n");

[Severity: High]
Can this cause a NULL pointer dereference at parent->algo->master_xfer when
the i2c-parent phandle is missing or the parent adapter has not probed yet?
Both of_parse_phandle() and of_find_i2c_adapter_by_node() return NULL on
failure rather than an ERR_PTR, so IS_ERR() evaluates to false and
execution continues with parent =3D=3D NULL.

> +	priv->parent =3D parent;
> +
> +	err =3D devm_add_action_or_reset(dev, wrap_i2c_put_adapter, parent);
> +	if (err)
> +		return err;

[Severity: High]
Does pairing of_find_i2c_adapter_by_node() with i2c_put_adapter() underflow
parent->owner's module reference count on probe failure or unbind?
of_find_i2c_adapter_by_node() only takes a reference on &parent->dev,
whereas i2c_put_adapter() calls both module_put(adap->owner) and
put_device(&adap->dev).  Should this use of_get_i2c_adapter_by_node()
instead?

[ ... ]

> +	err =3D devm_request_threaded_irq(dev, gpiod_to_irq(priv->gpio), NULL,
> +					asus_tf_dock_interrupt,
> +					IRQF_TRIGGER_RISING |
> +					IRQF_TRIGGER_FALLING |
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					"asus-transformer-dock", priv);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to register IRQ %d\n",
> +				     gpiod_to_irq(priv->gpio));
> +
> +	irq_wake_thread(gpiod_to_irq(priv->gpio), priv);

[Severity: Medium]
Should the return value of gpiod_to_irq(priv->gpio) be stored in a signed
int and checked for < 0 before calling devm_request_threaded_irq()?  Passing
a negative errno to the unsigned int irq parameter converts it into a bogus
IRQ number and replaces the actual error code with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118134555.1954=
79-1-clamor95@gmail.com?part=3D2
