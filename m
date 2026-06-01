Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8FD33AD8B
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332859; cv=none; b=WrRj+TUWggoTPBCZtArSQxQSKdFOAwScRLKwKcHo8Kd2/ESj1vC44L3nPt2msVsHexoxsd2NDkOveoLd9IvQ1Bv9vCdhqYt3b80m/XeNbSzVLmsKCaKOZ66ZRbPHDxIrpgwy83ZFEcWay8F0KQHs/cNs95gk72JdxRcp5FHO9PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332859; c=relaxed/simple;
	bh=U5R0pwnLIoWRg1TXMPMcCCFkp7j6ENxwl3R7My9M3gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UaYjLKYlwjMNxMXmdC+V30BQ0Ex/wF85jVAxNC4HW36zYcjShb94AfmTbcgDEGxNMRdL0mCxM2UQIxEMVlv1TmD65v94QihP3kBodvYIWt3XrmILdZb7C0sA6hly6883K5+0UGrW2lzHLUep1OAjUoIln7Mv6EDpjCuA3bK1jso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2YRwTK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2YRwTK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6717C1F00893;
	Mon,  1 Jun 2026 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780332857;
	bh=HdDesWDWnxjz5J+D+9bPn4ejHmlN2aUOR0o3Xyqg7Ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E2YRwTK/AtX4dpOrHl5Fk/b+9ibqY5CqNvck7Wg/chfXmip0lKrG5BURX3bOA+TPO
	 hPdvqgkGmvUL34pyeomDovpnDElubxCCn2Oujra6/rTbFS5x/upI7eIJ7mJKYlj5H8
	 Lwst6kMPXp+cNBv/13V5cFxC2bEIfiCQoHdRjhlq9y0rqlsrJW5AWB+PW5RkW/96ot
	 qhZMTS8PRShz92+DmFMe4DcaO/pBTlzwsSUfhwWRj820YqIKtrKLM+Htf9zvYaRFA+
	 6/oeO61vIuUN5vJf0J/CzhN+vy3aar9lUpmT4/oXW1VTGxQOdVSvYAaJW/Us2F5/nb
	 g3jYgWb66se7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 2/6] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601162951.254968-3-macroalpha82@gmail.com>
References: <20260601162951.254968-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 16:54:16 +0000
Message-Id: <20260601165417.6717C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Uninitialized pointer dereference causes kernel panic if batte=
ry info is not found.
- [High] Missing `.remove` callback and incorrect devres initialization ord=
er leads to Use-After-Free.
- [High] Missing `return` statement before `dev_err_probe()` allows probe t=
o succeed despite hardware absence.
- [High] Race condition exposing the power supply to sysfs before workqueue=
 allocation triggers NULL pointer dereference.
- [High] Unrepresentable voltage ranges silently truncate and apply dangero=
usly low input voltage limits.
- [High] Requesting 4.336V charge voltage silently triggers a special regis=
ter state that outputs 4.352V.
- [High] Ignoring the return value of regulator registration breaks `-EPROB=
E_DEFER`.
- [Medium] Requesting 3.8A maximum input current truncates to 600mA.
- [Medium] Negative error codes from I2C reads are exposed directly as vali=
d userspace property values.
- [Medium] Unbalanced `enable_irq_wake()` call leaks the wake source config=
uration.
--

commit 5856e5a64dc4e00506a609cdda925513920c53e5
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: sgm41542: Add SG Micro sgm41542 charger

Add support for the SG Micro SGM41542 charger/boost converter. Driver
was adapted from Rockchip BSP driver and confirmed with vendor datasheet.

Link: https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/pow=
er/supply/sgm41542_charger.c
Link: https://www.sg-micro.de/rect/assets/1e8de70b-657e-4156-be68-a64fdbe8e=
418/SGM41541_SGM41542.pdf

> diff --git a/drivers/power/supply/sgm41542_charger.c b/drivers/power/supp=
ly/sgm41542_charger.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/power/supply/sgm41542_charger.c
> @@ -0,0 +1,1035 @@
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
> +	 * per the datasheet. All other values are as expected.
> +	 */
> +	chrg_volt =3D clamp(chrg_volt, SGM4154X_VREG_V_MIN_UV, sgm->init_data.m=
ax_vreg);
> +	reg_val =3D (chrg_volt - SGM4154X_VREG_V_MIN_UV) / SGM4154X_VREG_V_STEP=
_UV;

[Severity: High]
Does this code silently apply an overvoltage condition? If 4.336V is
requested, the calculation generates a reg_val of 0x0F, which as noted in
the comment configures the hardware to 4.352V instead of 4.336V. Is there a
way to clamp or shift this value to a safe voltage to prevent applying a
higher voltage than requested?

[ ... ]
> +static int sgm4154x_set_input_volt_lim(struct sgm4154x_device *sgm,
> +				       unsigned int vindpm)
> +{
> +	enum SGM4154X_VINDPM_OS os_val;
> +	unsigned int offset;
> +	u8 reg_val;
> +	int ret;
> +
> +
> +	if (vindpm < SGM4154X_VINDPM_V_MIN_UV ||
> +	    vindpm > SGM4154X_VINDPM_V_MAX_UV) {
> +		dev_err(sgm->dev, "input voltage limit %u outside range\n", vindpm);
> +		return -EINVAL;
> +	}
> +
> +	if (vindpm < 5900000) {
> +		os_val =3D VINDPM_OS_3900MV;
> +		offset =3D 3900000;
> +	} else if (vindpm >=3D 5900000 && vindpm < 7500000) {
> +		os_val =3D VINDPM_OS_5900MV;
> +		offset =3D 5900000;
> +	} else if (vindpm >=3D 7500000 && vindpm < 10500000) {
> +		os_val =3D VINDPM_OS_7500MV;
> +		offset =3D 7500000;
> +	} else {
> +		os_val =3D VINDPM_OS_10500MV;
> +		offset =3D 10500000;
> +	}
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_F,
> +				 SGM4154X_VINDPM_OS_MASK,
> +				 os_val);
> +	if (ret) {
> +		dev_err(sgm->dev, "set vin dpm error!\n");
> +		return ret;
> +	}
> +
> +	reg_val =3D (vindpm - offset) / SGM4154X_VINDPM_STEP_UV;
> +
> +	ret =3D regmap_update_bits(sgm->regmap, SGM4154X_CHRG_CTRL_6,
> +				 SGM4154X_VINDPM_V_MASK, reg_val);

[Severity: High]
Does this calculation truncate values that fall outside the 4-bit limit of
the hardware mask? For instance, assigning a voltage of 5.5V to the 3.9V
bucket will yield a reg_val of 16, which will be bitwise truncated to 0 when
masked by SGM4154X_VINDPM_V_MASK (max value 15), applying 3.9V instead of
5.5V.

[ ... ]
> +static int sgm4154x_set_input_curr_lim(struct sgm4154x_device *sgm, int =
iindpm)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	if (iindpm < SGM4154X_IINDPM_I_MIN_UA)
> +		return -EINVAL;
> +
> +	/*
> +	 * Per the datasheet, values between 100000uA and 3100000uA work
> +	 * as expected with the register defined as having a step of
> +	 * 100000 and a min/max of 100000 (0x00) through 3100000 (0x1e).
> +	 * The register value of 0x1f however corresponds to 3800000uA not
> +	 * 3200000uA as one would expect.
> +	 */
> +
> +	if (iindpm > 3100000 && iindpm < SGM4154X_IINDPM_I_MAX_UA)
> +		iindpm =3D 3100000;
> +	if ((iindpm > SGM4154X_IINDPM_I_MAX_UA) || (iindpm > sgm->init_data.ili=
m))
> +		iindpm =3D min(SGM4154X_IINDPM_I_MAX_UA, sgm->init_data.ilim);
> +
> +	reg_val =3D (iindpm - SGM4154X_IINDPM_I_MIN_UA) / SGM4154X_IINDPM_STEP_=
UA;
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_0,
> +				 SGM4154X_IINDPM_I_MASK,
> +				 reg_val);

[Severity: Medium]
When requesting 3.8A maximum input current, does this get truncated to 600m=
A?
Requesting 3.8A gives a reg_val of 37 (0x25), but since
SGM4154X_IINDPM_I_MASK is only a 5-bit mask (0x1F), the value will be
truncated during the bitwise operation (0x25 & 0x1F =3D 0x05), which transl=
ates
to 600mA instead of the intended 3.8A.

[ ... ]
> +static int sgm4154x_charger_get_property(struct power_supply *psy,
> +					 enum power_supply_property psp,
> +					 union power_supply_propval *val)
> +{
> +	struct sgm4154x_device *sgm =3D power_supply_get_drvdata(psy);
> +	struct sgm4154x_state state;
> +	int ret;
> +
> +	ret =3D sgm4154x_get_state(sgm, &state);
> +	if (ret) {
> +		dev_err(sgm->dev, "get state error!\n");
> +		return ret;
> +	}
> +	sgm->state =3D state;
> +
> +	switch (psp) {
[ ... ]
> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
> +		val->intval =3D sgm4154x_get_chrg_volt(sgm);
> +		break;

[Severity: Medium]
Are negative error codes from I2C reads exposed directly as valid userspace
property values here? If a function like sgm4154x_get_chrg_volt() fails, it
returns an error code like -EIO, which is assigned to val->intval while
sgm4154x_charger_get_property() returns 0 for success.

[ ... ]
> +static int sgm4154x_hw_init(struct sgm4154x_device *sgm)
> +{
> +	struct power_supply_battery_info *bat_info;
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * If unable to read devicetree info, use default/reset
> +	 * values from hardware.
> +	 */
> +	sgm->init_data.iprechg =3D SGM4154X_PRECHRG_I_DEF_UA;
> +	sgm->init_data.iterm =3D SGM4154X_TERMCHRG_I_DEF_UA;
> +	sgm->init_data.max_ichg =3D SGM4154X_ICHRG_I_DEF_UA;
> +	sgm->init_data.max_vreg =3D SGM4154X_VREG_V_DEF_UV;
> +	sgm->init_data.vlim =3D SGM4154X_VINDPM_DEF_UV;
> +	sgm->init_data.ilim =3D SGM4154X_IINDPM_DEF_UA;
> +
> +	ret =3D power_supply_get_battery_info(sgm->charger, &bat_info);
> +	if (ret)
> +		dev_warn(sgm->dev, "sgm4154x: cannot read battery info\n");
> +	else {
> +		if (bat_info->constant_charge_current_max_ua)
> +			sgm->init_data.max_ichg =3D bat_info->constant_charge_current_max_ua;
> +		if (bat_info->constant_charge_voltage_max_uv)
> +			sgm->init_data.max_vreg =3D bat_info->constant_charge_voltage_max_uv;
> +		if (bat_info->charge_term_current_ua)
> +			sgm->init_data.iterm =3D bat_info->charge_term_current_ua;
> +		if (bat_info->precharge_current_ua)
> +			sgm->init_data.iprechg =3D bat_info->precharge_current_ua;
> +	}
> +
> +	power_supply_put_battery_info(sgm->charger, bat_info);

[Severity: Critical]
Can this code crash by dereferencing an uninitialized pointer?

If power_supply_get_battery_info() fails (e.g., the devicetree node is
missing), bat_info remains uninitialized on the stack. The error is logged
but execution continues, and the uninitialized bat_info pointer is passed to
power_supply_put_battery_info() which will try to free internal structures =
at
random memory addresses.

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
> +		dev_err_probe(dev, ret, "Unable to read HW ID\n");

[Severity: High]
Should there be a return statement here? Execution currently falls through
and registers the driver despite a hardware detection failure.

> +
> +	device_init_wakeup(dev, 1);
> +
> +	ret =3D sgm4154x_power_supply_init(sgm, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register power supply\n");

[Severity: High]
Does registering the power supply here create a race condition with the
workqueue initialization?

If userspace reads or modifies the sysfs properties (like setting ONLINE=3D=
1)
right after the power supply is registered but before sgm_monitor_wq is
allocated below, the driver will call queue_delayed_work() with a NULL
workqueue, triggering a NULL pointer dereference.

> +
> +	ret =3D sgm4154x_hw_init(sgm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot initialize the chip.\n");
> +
> +	if (client->irq) {
> +		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +						sgm4154x_irq_handler_thread,
> +						IRQF_TRIGGER_FALLING |
> +						IRQF_ONESHOT,
> +						"sgm41542-irq", sgm);
> +		if (ret)
> +			return ret;
> +		enable_irq_wake(client->irq);

[Severity: Medium]
Will this leak the wake source configuration? The wake IRQ is enabled here,
but there is no corresponding disable_irq_wake() call on probe error paths
(such as a workqueue allocation failure below) or when the driver is unboun=
d.

> +	}
> +
> +	sgm->sgm_monitor_wq =3D devm_alloc_ordered_workqueue(dev, "%s",
> +			WQ_MEM_RECLAIM | WQ_FREEZABLE, "sgm-monitor-wq");
> +	if (!sgm->sgm_monitor_wq)
> +		return -EINVAL;
> +
> +	INIT_DELAYED_WORK(&sgm->sgm_delay_work, sgm_charger_work);
> +
> +	sgm4154x_vbus_regulator_register(sgm);

[Severity: High]
Should the return value of sgm4154x_vbus_regulator_register() be checked?
If the regulator subsystem returns -EPROBE_DEFER or another error code, the
error is swallowed and probe succeeds, leaving the OTG regulator
non-functional and breaking probe deferral.

[ ... ]
> +static struct i2c_driver sgm4154x_driver =3D {
> +	.driver =3D {
> +		.name =3D "sgm4154x-charger",
> +		.of_match_table =3D sgm4154x_of_match,
> +	},
> +	.probe =3D sgm4154x_probe,
> +	.shutdown =3D sgm4154x_charger_shutdown,
> +	.id_table =3D sgm4154x_i2c_ids,
> +};

[Severity: High]
Does this missing .remove callback lead to a Use-After-Free?

Because there is no .remove callback, the sgm_delay_work delayed work is
never explicitly canceled when the module is unbound. Since the work
re-arms itself, the timer will fire after the sgm structure is freed.
Additionally, because devres destroys resources in reverse order, the
workqueue will be destroyed while the power supply is still exposed to
sysfs, allowing queue_delayed_work() to be called on a freed workqueue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601162951.2549=
68-1-macroalpha82@gmail.com?part=3D2
