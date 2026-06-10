Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F7F33F377
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103546; cv=none; b=Yeti7mWk/meSaTAlmCabOIq8BibnmOtznxwxmFibp2FNJVuR7TfELDRu6U2HO5MqaJNTylJoirmu2nUbkuIuRgxFyOGs4W4lLXxPVlNh33mblvT4aEgj5WBo45SE6uOoNpjUEp1ooeS7+buH73FM0pf7wYBhnmbl4/Vbw4lL2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103546; c=relaxed/simple;
	bh=n9dxlQ3LcINawosWnt4jK2ZRJhMXiYniqG6cs/SBF8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RJyd17w8HulWK8ea5Y0emNAPAhNyxrBlaVh32IQafSbGcOupf18PebefPVHD+wQ2XYyqn98SAaeZBWmXzSUYdSVj6bLewGkomGwd+jSqwmIGLv534UUbF7q5eL7/vK2CkGDSy80cMyY2I9RjC5nef2U96qha2V1OcfBxtGlQHIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MghIbWgk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MghIbWgk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AE01F00898;
	Wed, 10 Jun 2026 14:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781103545;
	bh=uPOhNkcPtcMo2Iahiv4oaZ+4UisfUk03T5TXSKhFXHo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MghIbWgk2BXKm1c4tdn1+GPdUlr9PXUVMSK8r2EcQ/YD6MiYCMv/7lBckLlwGnThb
	 RnSzhWPivmB586lZXgdBO6XuLBbQUZLK1nhsnsaaQnRkeCDpRJ6eTKfduc8PZGnMCg
	 gld6/FQWmlT2XJfYFcaURDW9CXJrFyFV/e+sDPUGbXG/sX0YS3WAbgBNRt9tgaQzmu
	 eT9hJNludktFCcOuUrYIamiWqtdedBz1qkikfmqFdq6BIhqkYcv+DAnxv0DKCGTaQD
	 Hss/NZ6BPhfo/bceG4VUUai2oVOAi5qN9r1W1oqsDo5KKun4M/jdtnmyEWPRNFVB4g
	 gHc9nLqZsCzlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V7 2/6] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610144407.438846-3-macroalpha82@gmail.com>
References: <20260610144407.438846-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 14:59:04 +0000
Message-Id: <20260610145904.B4AE01F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware watchdog resets charger configuration during system suspe=
nd due to missing PM suspend/resume handlers.
- [High] The IRQ handler unconditionally overwrites the input current limit=
 whenever VBUS is present, silently destroying userspace-configured limits.
- [Medium] Missing cleanup for device_init_wakeup() on driver unbind and pr=
obe error paths.
- [Medium] Lack of synchronization in the sysfs property setter for ONLINE =
state allows hardware/software state desynchronization.
- [Medium] The IRQ handler returns early on an I2C failure, skipping the cr=
itical `power_supply_changed()` uevent notification.
--

commit 518a06e67b4771b8e50e9e0705ace20eca6acede
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: sgm41542: Add SG Micro sgm41542 charger

Add support for the SG Micro SGM41542 charger/boost converter.
Driver was adapted from Rockchip BSP driver [1] and confirmed
with vendor datasheet [2].

Link: https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/pow=
er/supply/sgm41542_charger.c
Link: https://www.sg-micro.de/rect/assets/1e8de70b-657e-4156-be68-a64fdbe8e=
418/SGM41541_SGM41542.pdf

> diff --git a/drivers/power/supply/sgm41542_charger.c b/drivers/power/supp=
ly/sgm41542_charger.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/power/supply/sgm41542_charger.c

[ ... ]

> +static int sgm4154x_charger_set_property(struct power_supply *psy,
> +					 enum power_supply_property prop,
> +					 const union power_supply_propval *val)
> +{
> +	struct sgm4154x_device *sgm =3D power_supply_get_drvdata(psy);
> +	int ret =3D -EINVAL;
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_ONLINE:
> +		if (val->intval) {
> +			ret =3D sgm4154x_enable_charger(sgm);
> +			sgm4154x_set_watchdog_timer(sgm, SGM4154X_WDT_TIMER_40S);
> +		} else {
> +			sgm4154x_set_watchdog_timer(sgm, SGM4154X_WDT_TIMER_DISABLE);
> +			ret =3D sgm4154x_disable_charger(sgm);
> +		}
> +		break;

[Severity: Medium]
Is there a need for a mutex in this sysfs property setter?

When modifying POWER_SUPPLY_PROP_ONLINE, the code performs multiple
operations without holding any locks.

Could concurrent sysfs writes interleave these operations? This might lead
to the hardware charger being disabled while the watchdog timer remains
enabled, causing the software sgm->watchdog_enable flag to become
desynchronized with the actual hardware state.

[ ... ]

> +static irqreturn_t sgm4154x_irq_handler_thread(int irq, void *private)
> +{
> +	struct sgm4154x_device *sgm4154x =3D private;
> +	struct sgm4154x_state state;
> +	int ret;
> +
> +	ret =3D sgm4154x_get_state(sgm4154x, &state);
> +	if (ret) {
> +		dev_err(sgm4154x->dev, "get state error!\n");
> +		return IRQ_NONE;
> +	}
> +	sgm4154x->state =3D state;
> +	if (state.vbus_gd) {
> +		if (sgm4154x->init_data.ilim >=3D SGM4154X_DEFAULT_INPUT_CUR) {
> +			ret =3D sgm4154x_set_input_curr_lim(sgm4154x, sgm4154x->init_data.ili=
m);

[Severity: High]
Will this unconditionally overwrite the input current limit configured
by userspace?

This checks if VBUS is good, but doesn't check if VBUS just transitioned
to being good.

Since it unconditionally applies init_data.ilim, won't any subsequent
interrupt while VBUS is present (such as a battery thermal event) silently
overwrite custom limits previously set via sysfs?

> +			if (ret) {
> +				dev_err(sgm4154x->dev, "set input current error!\n");
> +				/* Reading IRQ clears interrupt, so return handled */
> +				return IRQ_HANDLED;
> +			}
> +		}
> +	}
> +	power_supply_changed(sgm4154x->charger);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Should this early return be avoided so that power_supply_changed()
is still called?

If the I2C write for the input current limit fails, the code immediately
returns.

Will this cause userspace to silently miss important hardware state changes,
like cable insertion or fault conditions, that triggered the interrupt?

[ ... ]

> +static int sgm4154x_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct sgm4154x_device *sgm;
> +	int ret;
> +
> +	sgm =3D devm_kzalloc(dev, sizeof(*sgm), GFP_KERNEL);
> +	if (!sgm)
> +		return -ENOMEM;
> +
> +	sgm->dev =3D dev;
> +
> +	sgm->regmap =3D devm_regmap_init_i2c(client, &sgm4154x_regmap_config);
> +	if (IS_ERR(sgm->regmap))
> +		return dev_err_probe(dev, PTR_ERR(sgm->regmap),
> +				     "Failed to allocate register map\n");
> +
> +	i2c_set_clientdata(client, sgm);
> +
> +	ret =3D sgm4154x_hw_chipid_detect(sgm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Unable to read HW ID\n");
> +
> +	device_init_wakeup(dev, 1);

[Severity: Medium]
Is there a missing cleanup step for device_init_wakeup()?

The device is marked as wakeup-capable here, but there doesn't seem to be
a corresponding device_init_wakeup(dev, 0) during probe error paths or in
a driver remove callback.

Could this leave the system PM subsystem in an inconsistent state if the
driver unbinds or the probe fails later?

> +
> +	sgm->sgm_monitor_wq =3D devm_alloc_ordered_workqueue(dev, "sgm-monitor-=
wq",
> +			WQ_MEM_RECLAIM | WQ_FREEZABLE);

[Severity: High]
How is the hardware watchdog handled during system suspend?

The workqueue feeding the hardware watchdog is allocated with WQ_FREEZABLE,
meaning it stops feeding the watchdog during suspend.

[ ... ]

> +static struct i2c_driver sgm4154x_driver =3D {
> +	.driver =3D {
> +		.name =3D "sgm4154x-charger",
> +		.of_match_table =3D sgm4154x_of_match,
> +	},
> +	.probe =3D sgm4154x_probe,
> +	.id_table =3D sgm4154x_i2c_ids,
> +};

Because there are no PM suspend/resume handlers defined in the driver, the
hardware watchdog is never disabled before sleep.

If the system sleeps longer than the 40-second watchdog timeout, will the
charger IC expire the watchdog and reset all registers (such as charge
current and voltage limits) to their hardware defaults?

Upon resume, the frozen workqueue thaws and continues resetting the
watchdog, but the custom charging parameters are never re-applied.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610144407.4388=
46-1-macroalpha82@gmail.com?part=3D2
