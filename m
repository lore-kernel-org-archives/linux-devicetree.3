Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950D230D3F8
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 22:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780611812; cv=none; b=BTLlZ74mJHIPmRohmZMCIc/Jkd0KjUS7JTOGZxJiO2Czm3bUNCbs4kbpSjCr3eZL/aVlggSj8F5ju7+ufexgxLGeAKsj57tZe+QyyleRgdASgnHN3ZE4KpFBhrjHzUu6/FKw0Wg2ncAkdC325gkL9jwuUzDv0PSceCwy2Bmc7A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780611812; c=relaxed/simple;
	bh=06Fm57W/HxLpYwUNsVO9Bk3YiW4+o4fqX7YV4Lf93bw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z40uqzGxeKLiCdoKfn6tVEO31GHNDg8d+Pkd5A9Tv1/7+4vK0AVnF0mQLSM24etC6PpsQxF+7Nm9iED7bEl3uEhWyvq71UQZ+YjyoznQRdE7clU/lXPipxUzPazBG/GTG1acEGDeIl5/fZTL/BII0FUIdsiYyzGcx21rrqEPzPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoRC77LX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoRC77LX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EB91F00893;
	Thu,  4 Jun 2026 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780611811;
	bh=dTeOZce+xqNcqljmLolHTwhS8zsQP4Qd/QeVtrGKYz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PoRC77LXNj3pCiFeDcnkvk39rtxDf1inDUZ38C2ASmRuRHfqF8vmXPKGEh6NiOoA4
	 llAK19KT+hTeiBLG74Kxzd/Uoko/5TpQ2Ut3z0sRwF7cwmXlMiob96Xit7wrGJGPkV
	 Jymj+ozh/q2y44xG78Ocvg6H+dG5xtvjOfyEdfm1ZYV6dIjYS30CKDFxdxdbMGqZYy
	 3SPGS3oJ6/wJt31aS/Pj9QmrdjA+XqaaS+8eZ5eCnh0BnGbalD8PGYFGoBL1jH6VYB
	 jqNtpkJBF/K3WFZSHxRBbaIGBvXRaVxfAIwwLk2BSzckRfAjQ6x+P2zFyeLG1Bd99B
	 u0AWaGgN/1kIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 2/6] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604220802.119107-3-macroalpha82@gmail.com>
References: <20260604220802.119107-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 22:23:30 +0000
Message-Id: <20260604222331.00EB91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Registration of power supply prior to initializing limits causes i=
nvalid sysfs clamping.
- [High] Missing cancellation of delayed watchdog work in the shutdown call=
back.
- [High] NULL pointer dereference when accessing `i2c_client_get_device_id(=
)` result.
- [High] Optional battery info properties mistakenly initialized to -EINVAL=
 causing undefined behavior.
- [Medium] Incorrect clamp ordering causes the charger voltage to exceed th=
e configured safety maximum.
- [Medium] Bitmask macro used instead of integer time value for watchdog ti=
mer.
- [Medium] Unconditional calls to `disable_irq_wake()` trigger kernel warni=
ngs if IRQ wake was never enabled.
- [Medium] Incorrect return of `IRQ_NONE` after hardware interrupt has alre=
ady been serviced.
- [Medium] Concurrent sysfs writes can desynchronize software and hardware =
watchdog states.
--

commit d54feec760f967942102292d8970099c3b72fb53
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: sgm41542: Add SG Micro sgm41542 charger

Add support for the SG Micro SGM41542 charger/boost converter.
Driver was adapted from Rockchip BSP driver and confirmed
with vendor datasheet.

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

> +static int sgm4154x_set_chrg_volt(struct sgm4154x_device *sgm, int chrg_=
volt)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	/*
> +	 * Note that the value of 0x01111 represents a "special value"
> +	 * corresponding to 4352000uV instead of the expected 4336000uV,
> +	 * per the datasheet. All other values are as expected. So not
> +	 * only do we need to clamp between max and min values, but
> +	 * also clamp anything below 4352000uv to 4304000uv to prevent
> +	 * overcharging.
> +	 */
> +	if (chrg_volt < 4352000)
> +		chrg_volt =3D clamp(chrg_volt, SGM4154X_VREG_V_MIN_UV, 4304000);
> +	chrg_volt =3D clamp(chrg_volt, SGM4154X_VREG_V_MIN_UV, sgm->init_data.m=
ax_vreg);
> +	reg_val =3D (chrg_volt - SGM4154X_VREG_V_MIN_UV) / SGM4154X_VREG_V_STEP=
_UV;

[Severity: Medium]
Is there a risk of bypassing the max_vreg limit here? If a user requests
4.5V and the DT max_vreg limit is 4.336V, the first check evaluates to
false, skipping the gap clamp. The second clamp reduces the requested
voltage to 4.336V, producing reg_val =3D 15.

The hardware defines this as a special configuration for 4.352V, bypassing
the intended limit. Should max_vreg be enforced before applying
hardware-specific gap limits?

[ ... ]

> +static int sgm4154x_set_watchdog_timer(struct sgm4154x_device *sgm, int =
time)
> +{
> +	u8 reg_val;
> +	int ret;
> +
> +	if (time =3D=3D 0)
> +		reg_val =3D SGM4154X_WDT_TIMER_DISABLE;
> +	else if (time =3D=3D 40)
> +		reg_val =3D SGM4154X_WDT_TIMER_40S;
> +	else if (time =3D=3D 80)
> +		reg_val =3D SGM4154X_WDT_TIMER_80S;
> +	else
> +		reg_val =3D SGM4154X_WDT_TIMER_160S;

[ ... ]

> +	if (time) {
> +		if (!sgm->watchdog_enable)
> +			queue_delayed_work(sgm->sgm_monitor_wq,
> +					   &sgm->sgm_delay_work,
> +					   msecs_to_jiffies(1000 * 5));
> +		sgm->watchdog_enable =3D true;
> +	} else {
> +		sgm->watchdog_enable =3D false;
> +		sgm4154x_watchdog_timer_reset(sgm);
> +	}

[Severity: Medium]
Could concurrent sysfs writes to the online property cause a desynchronizat=
ion
here?=20

Because there is no locking in this function, race conditions might leave
the hardware watchdog armed while the software state reads false. This could
prevent the delayed work from re-arming the watchdog, resulting in unintend=
ed
device resets.

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

[Severity: Medium]
Does this pass the correct value to the watchdog configuration?=20

SGM4154X_WDT_TIMER_40S is a bitmask (BIT(4), which is 16). The=20
sgm4154x_set_watchdog_timer() function expects an integer time value like
40 or 80. Passing 16 causes it to fall through to the else block, silently
configuring a 160s timeout instead.

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
> +			if (ret) {
> +				dev_err(sgm4154x->dev, "set input current error!\n");
> +				return IRQ_NONE;

[Severity: Medium]
Is it safe to return IRQ_NONE here?

Reading the state via sgm4154x_get_state() effectively clears the interrupt
on the hardware. If sgm4154x_set_input_curr_lim() subsequently fails,
returning IRQ_NONE will cause the kernel's spurious interrupt detector to
erroneously count the interrupt as unhandled, which might lead to the IRQ
line being permanently disabled.

[ ... ]

> +static int sgm4154x_hw_init(struct sgm4154x_device *sgm)
> +{
> +	struct power_supply_battery_info *bat_info;
> +	int ret;
> +	u32 val;

[ ... ]

> +	ret =3D power_supply_get_battery_info(sgm->charger, &bat_info);
> +	if (!ret) {
> +		if (bat_info->constant_charge_current_max_ua)
> +			sgm->init_data.max_ichg =3D bat_info->constant_charge_current_max_ua;
> +		if (bat_info->constant_charge_voltage_max_uv)
> +			sgm->init_data.max_vreg =3D bat_info->constant_charge_voltage_max_uv;

[Severity: High]
Could this initialize the limits to negative values?

Optional battery parameters default to -EINVAL (-22) when not defined in
the device tree. Because -22 is truthy, this block will assign -22 to
max_vreg. When clamping chrg_volt later, it can produce a negative result
that gets bitwise left-shifted, triggering undefined behavior and corrupting
hardware registers. Should this verify that the values are non-negative?

[ ... ]

> +static int sgm4154x_probe(struct i2c_client *client)
> +{
> +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
> +	struct device *dev =3D &client->dev;
> +	struct sgm4154x_device *sgm;
> +	int ret;
> +
> +	sgm =3D devm_kzalloc(dev, sizeof(*sgm), GFP_KERNEL);
> +	if (!sgm)
> +		return -ENOMEM;
> +
> +	sgm->client =3D client;
> +	sgm->dev =3D dev;
> +
> +	strscpy(sgm->model_name, id->name, I2C_NAME_SIZE);

[Severity: High]
Is there a risk of a NULL pointer dereference here?

If the driver is bound via sysfs or dynamically instantiated without an
explicit match in sgm4154x_i2c_ids, i2c_client_get_device_id() returns NULL,
leading to a crash on id->name.

[ ... ]

> +	sgm->sgm_monitor_wq =3D devm_alloc_ordered_workqueue(dev, "%s",
> +			WQ_MEM_RECLAIM | WQ_FREEZABLE, "sgm-monitor-wq");
> +	if (!sgm->sgm_monitor_wq)
> +		return -EINVAL;
> +
> +	ret =3D devm_delayed_work_autocancel(dev, &sgm->sgm_delay_work,
> +					   sgm_charger_work);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Unable to register delayed work\n");
> +
> +	ret =3D sgm4154x_power_supply_init(sgm, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register power supply\n");
> +
> +	ret =3D sgm4154x_hw_init(sgm);

[Severity: High]
Does registering the power supply before initializing the hardware limits
expose uninitialized sysfs attributes?

The sgm->init_data is zero-initialized at this point. If userspace writes to
a property like CONSTANT_CHARGE_VOLTAGE during this window, it will clamp
against a max_vreg of 0. Subtracting the minimum limit from 0 yields a
negative number that gets bitwise left-shifted, causing undefined behavior.

[ ... ]

> +	ret =3D sgm4154x_vbus_regulator_register(sgm);
> +	if (ret) {
> +		disable_irq_wake(client->irq);
> +		return dev_err_probe(dev, ret,
> +				     "Unable to register VBUS regulator\n");
> +	}

[Severity: Medium]
Can this trigger a WARN_ON if the irq was never provided?=20

The enable_irq_wake() call earlier is guarded by checking if client->irq is
non-zero, but this disable_irq_wake() call is unconditional. If the device
probes without an IRQ, this will drop the wake depth below zero.

[ ... ]

> +static void sgm4154x_charger_shutdown(struct i2c_client *client)
> +{
> +	struct sgm4154x_device *sgm =3D i2c_get_clientdata(client);
> +
> +	sgm4154x_set_prechrg_curr(sgm, SGM4154X_PRECHRG_I_DEF_UA);
> +	sgm4154x_disable_charger(sgm);
> +}

[Severity: High]
Does the shutdown sequence need to cancel the delayed work?

Since devres teardown is not called on shutdown, sgm_delay_work remains
active. If it fires after the I2C controller has suspended, it could attempt
transactions on an inactive bus, causing timeouts or hangs during system ha=
lt.

> +
> +static void sgm4154x_charger_remove(struct i2c_client *client)
> +{
> +	disable_irq_wake(client->irq);
> +}

[Severity: Medium]
Similar to the probe error path, is it safe to unconditionally call
disable_irq_wake() here? If the device was instantiated without an IRQ, this
could trigger a WARN_ON in the IRQ core.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604220802.1191=
07-1-macroalpha82@gmail.com?part=3D2
