Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FB835E1D1
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778885325; cv=none; b=BoKboju9WjeGAWeDBvyV/yGdF0FuJ9cjD0GuIyITgKoLdQ66j5Uc62hw3tSCP8LXfIexZWlM5QaL8LiXXgrbvboxtA+rex1mjhawYTIRGCnvT09E1AQCXSHoUop0w+aqyieSdPVFuUT4nkr77Jy9ulnlSm/LUAN/WZdBFsIDW7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778885325; c=relaxed/simple;
	bh=ylAu2tp+rcKWYqkme9nrO1MsI+YZf/1a6McWmXRo0s8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B+AWTKo/lEPZ5d26e8+LcWNsY6E5k88h93mlAFriTEkzQesgGdA8NhUGE7JPOL65spFzV10pUwS6eRW/D5u6Sfj+94EqhhjIaQ71IiMREpBgmQIxlPwA2YF+7LyI+G+PJeupWzm1Pd9qvxEJ1KcpwtyL2AxHsTxbmtlINy6l6Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d45R4nHK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d45R4nHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5403AC2BCB7;
	Fri, 15 May 2026 22:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778885325;
	bh=ylAu2tp+rcKWYqkme9nrO1MsI+YZf/1a6McWmXRo0s8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=d45R4nHK2WJpc05/JPhTkXzCu7q3r4xA8R7+ygl6ht3+DqUun3Yg5+64WhNBL+Lcm
	 bca/1t83BCMk7Frybvgle53i/1MbQTv46t/fYV/q6/w1WLq66SjfQW/+X9FnWfacFU
	 HB/fo84j5rqwK256UAstkEZZ/lBo3/AO9LRvA5249u8zG2yxc7nowgePj3kuRgEc+E
	 YDOdabpuUeu2TODM8jO98UNjYzrb7hsyAupk77MoK+lWqDAkt57J58tWfy06R/7bVM
	 yWNd+q5cbA/jAkCi22w4KjXOoC1p8uZbCrJpKyfrj/91NNb4btBpJdca9Am6yZjLHw
	 XsqEOMCeVrdpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 2/6] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515221947.299229-3-macroalpha82@gmail.com>
References: <20260515221947.299229-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:48:39 +0000
Message-Id: <20260515224845.5403AC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] Uninitialized pointer dereference causes kernel panic on missi=
ng battery info
- [High] Missing `.remove` callback leads to delayed work timer Use-After-F=
ree
- [High] Race condition exposing uninitialized structures to userspace
- [High] Input current limit configuration truncates 3.8A to 600mA
- [High] Input voltage limit calculation wrap-around incorrectly applies lo=
w voltage bounds
- [High] Charge voltage calculation maps 4.336V request to 4.352V, risking =
battery overcharge
- [Medium] Watchdog timer logic applies incorrect bitmask instead of intege=
r duration
- [Low] Ignored devm_regulator_register return value masks initialization f=
ailures
--

commit 974520d45c64c2d48e4b5e84a0082620a313d9d4
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
> index 0000000000000..1bc2eab554065
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
> +	 * per the datasheet. All other values are as expected.
> +	 */
> +	chrg_volt =3D clamp(chrg_volt, SGM4154X_VREG_V_MIN_UV, sgm->init_data.m=
ax_vreg);
> +	reg_val =3D (chrg_volt - SGM4154X_VREG_V_MIN_UV) / SGM4154X_VREG_V_STEP=
_UV;
> +	reg_val =3D reg_val << 3;

Could this apply a charge voltage higher than requested?

If chrg_volt is exactly 4336000, reg_val becomes 15 (0x0f). According to the
comment and sgm4154x_get_chrg_volt(), 0x0f maps to 4352000uV. Might this
overcharge the battery by 16mV?

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

Is it possible for reg_val to wrap around the register mask here?

If vindpm is 5800000, it falls into the first range (vindpm < 5900000). The
calculation yields a reg_val of 19 (0x13). Since SGM4154X_VINDPM_V_MASK is
only 4 bits (GENMASK(3, 0)), updating the bits will truncate it to 3. This
would set the limit to 4.2V instead of clamping it to the highest supported
value in this range.

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

Could this calculation truncate for the 3.8A setting?

If iindpm is exactly 3800000, reg_val evaluates to 37 (0x25). Since
SGM4154X_IINDPM_I_MASK is GENMASK(4, 0) (0x1f), this truncates to 0x05.
Might this configure the charger to 600mA instead of the intended 3.8A?

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

Will this pass the correct duration to sgm4154x_set_watchdog_timer()?

SGM4154X_WDT_TIMER_40S is defined as a bitmask (BIT(4), which is 16).
Since the check inside sgm4154x_set_watchdog_timer() looks for exactly 40,
might passing 16 fall through to the else branch and unintentionally set
a 160-second watchdog?

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

Does this code dereference an uninitialized pointer?

If power_supply_get_battery_info() returns an error, bat_info remains
uninitialized. Calling power_supply_put_battery_info() with that pointer
outside of the success block will try to free its internal tables using
garbage data.

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
> +
> +	device_init_wakeup(dev, 1);
> +
> +	ret =3D sgm4154x_power_supply_init(sgm, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register power supply\n");
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
> +	}
> +
> +	sgm->sgm_monitor_wq =3D devm_alloc_ordered_workqueue(dev, "%s",
> +			WQ_MEM_RECLAIM | WQ_FREEZABLE, "sgm-monitor-wq");

Could this result in a race condition exposing uninitialized structures?

sgm4154x_power_supply_init() makes the sysfs interface available before the
workqueue or sgm_delay_work are initialized here. If userspace writes to the
ONLINE property in this small window, it triggers sgm4154x_set_watchdog_tim=
er()
which queues the uninitialized work to a NULL workqueue.

[ ... ]

> +	sgm4154x_vbus_regulator_register(sgm);
> +
> +	return 0;
> +}

Does this silently ignore regulator registration failures?

If sgm4154x_vbus_regulator_register() fails and returns an error code
(like -EPROBE_DEFER), the return value is dropped and the function returns =
0.

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

Is it possible for the delayed work timer to cause a Use-After-Free?

Since there is no .remove callback and the driver uses devm allocation for
struct sgm4154x_device and the workqueue, devres will automatically free
them when the module unbinds. However, the driver does not explicitly cancel
the delayed work item (sgm->sgm_delay_work). If the timer fires after the
driver structures are freed, it will dereference freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515221947.2992=
29-1-macroalpha82@gmail.com?part=3D2
