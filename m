Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBD03AB272
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 21:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780436589; cv=none; b=JriIMgcSqglmdAFWmQLGurFS6l9Q0kR21zAA4LRXavD077wnoIjTvPhPYQ8VsxerE9rHfcdcbDXKrrKMzgntZbzHNiWRosMB5LBz57qnfUBhhz6l5u8BAQOxp/j5XtlqA3l0S+UPmBU/kfvOgoyKbTERmNg420aexuHqUhKMMpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780436589; c=relaxed/simple;
	bh=L51jvxoW87RO9rb2CNte3L6d6NBXIkXcFw+yVmy5yWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RIraN5XZH0LO4qc3YfbC4WZUn2ToHavXeo308+vWIMGsVK8bc4AzsMdj3MCuRiQUEDdkRjptewYIPsi8/4tJTE/aWtee2dQedmxde+mCZixERwOzbhrvR8G+CwEpwiH1pk8JSb0m46RcObvXsRloMRqp+WPy6loIXuq/qCCqDis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHcj7yIj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHcj7yIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5537E1F00893;
	Tue,  2 Jun 2026 21:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780436587;
	bh=G5Qb1joAJDtBN75e74Yai5eeclYZZ8dR9P2Oie8v7Cg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EHcj7yIjlVQKfG4IE4ekBlQQOeyl4LjH/IlUtgHHswrl1nFLnSp5LY46aLF/T7IQc
	 v5eAkbJh5bhH0fwl96QVVg7O70pEJnk00mKZs0Pq+zccsLlYIiwn5II2vMfayxcWdR
	 AD62uoDIrpFl8fJNZEHFdm2HMsmfIlNMx7XExfgLcSRCyONiZO0a8GwXSPXk3gk5A/
	 UgcKfASHdYBn5KkhdZZrDf+wCXNSJfUvpxomkdOWYr7KYD/wLgAJR0JovlIRrIDEnL
	 kkqV+mhGS17ITEDiX/+KnsezRuEMZt/9hy9TnWkoEQex0RpyMn2xgyKtA+nX+9tE15
	 O2eJ/GeHLxFNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 2/6] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602212512.418166-3-macroalpha82@gmail.com>
References: <20260602212512.418166-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 21:43:06 +0000
Message-Id: <20260602214307.5537E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The driver fails to enforce the battery's maximum charge current l=
imit (`max_ichg`) when userspace writes to `CONSTANT_CHARGE_CURRENT`.
- [High] Missing `.remove` callback leads to a Use-After-Free on the delaye=
d worktimer when the device is unbound.
- [High] Missing battery properties evaluate to true and override safety de=
faults with `-EINVAL`, causing charge limits to be corrupted.
- [High] Registering the power supply before full initialization exposes un=
initialized structures to sysfs writes, causing kernel panics or hardware d=
amage.
- [Medium] Unbalanced `disable_irq_wake()` calls due to unconditional error=
 handling, and leaked IRQ wake configuration on unbind.
- [Medium] The error code from `devm_power_supply_register` is squashed to =
a hardcoded `-EINVAL`.
--

commit 217e7bc6e3aefce7cb6ef93777df1d2955458981
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

[ ... ]

> +static int sgm4154x_set_ichrg_curr(struct sgm4154x_device *sgm, int cur_=
ua)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	cur_ua =3D clamp(cur_ua, SGM4154X_ICHRG_I_MIN_UA, SGM4154X_ICHRG_I_MAX_=
UA);
> +	reg_val =3D cur_ua / SGM4154X_ICHRG_I_STEP_UA;

[Severity: High]
When userspace writes to CONSTANT_CHARGE_CURRENT, will this bypass the
battery-specific sgm->init_data.max_ichg safety limit?

It appears the requested current is only clamped against the hardware's
absolute physical maximum (3.78A) and ignores the battery's maximum
charge current limit.

Can this inadvertently program the hardware to supply maximum current and
bypass battery safety constraints?

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
> +	reg_val =3D reg_val << 3;

[Severity: High]
If sgm->init_data.max_vreg is negative (e.g., -EINVAL), will this result in
undefined behavior?

The clamp function could produce a negative result here, which is then left
shifted (reg_val << 3).

Could shifting a negative integer invoke undefined behavior and write corru=
pt
data to the hardware configuration?

[ ... ]

> +static int sgm4154x_power_supply_init(struct sgm4154x_device *sgm,
> +				      struct device *dev)
> +{
> +	struct power_supply_config psy_cfg =3D { .drv_data =3D sgm,
> +					       .fwnode =3D dev->fwnode, };
> +
> +	psy_cfg.supplied_to =3D sgm4154x_charger_supplied_to;
> +	psy_cfg.num_supplicants =3D ARRAY_SIZE(sgm4154x_charger_supplied_to);
> +	psy_cfg.fwnode =3D dev->fwnode;
> +	sgm->charger =3D devm_power_supply_register(sgm->dev,
> +						  &sgm4154x_power_supply_desc,
> +						  &psy_cfg);
> +	if (IS_ERR(sgm->charger))
> +		return -EINVAL;

[Severity: Medium]
Should this propagate the actual error code instead of returning -EINVAL?

Squashing the error code from devm_power_supply_register to a hardcoded
-EINVAL suppresses the original failure context.

Would this break deferred probing if the power supply subsystem requests
-EPROBE_DEFER?

[ ... ]

> +	ret =3D power_supply_get_battery_info(sgm->charger, &bat_info);
> +	if (ret)
> +		dev_warn(sgm->dev, "sgm4154x: cannot read battery info\n");
> +	else {
> +		if (bat_info->constant_charge_current_max_ua)
> +			sgm->init_data.max_ichg =3D bat_info->constant_charge_current_max_ua;
> +		if (bat_info->constant_charge_voltage_max_uv)
> +			sgm->init_data.max_vreg =3D bat_info->constant_charge_voltage_max_uv;

[Severity: High]
Are these property checks sufficient to validate the battery info?

Missing battery properties are initialized to -EINVAL (-22) by
power_supply_get_battery_info. Because -22 is non-zero, simple truthiness
checks will evaluate to true.

Will this overwrite the safe hardware defaults with negative values,
corrupting charge limits later on?

[ ... ]

> +	sgm->sgm_monitor_wq =3D devm_alloc_ordered_workqueue(dev, "%s",
> +			WQ_MEM_RECLAIM | WQ_FREEZABLE, "sgm-monitor-wq");
> +	if (!sgm->sgm_monitor_wq)
> +		return -EINVAL;
> +
> +	ret =3D sgm4154x_power_supply_init(sgm, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register power supply\n");
> +
> +	ret =3D sgm4154x_hw_init(sgm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot initialize the chip.\n");

[Severity: High]
Is it safe to register the power supply before the hardware boundaries
and delayed work structures are initialized?

Userspace or udev can immediately write to sysfs attributes like online
as soon as the power supply is registered.

If this happens, could sgm4154x_set_watchdog_timer queue an uninitialized
delayed_work struct, potentially corrupting timer lists and causing a kernel
panic?

[ ... ]

> +	if (client->irq) {
> +		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +						sgm4154x_irq_handler_thread,
> +						IRQF_TRIGGER_FALLING |
> +						IRQF_ONESHOT,
> +						"sgm41542-irq", sgm);
> +		if (ret)
> +			return ret;
> +
> +		enable_irq_wake(client->irq);
> +	}
> +
> +	INIT_DELAYED_WORK(&sgm->sgm_delay_work, sgm_charger_work);

[Severity: High]
Does this driver safely tear down sgm_delay_work on unbind?

The delayed work is initialized here but there appears to be no .remove
callback or devm_delayed_work_autocancel action to cancel it. When the
device is unbound, devres will automatically destroy the workqueue and free
the sgm structure.

If the 5-second timer fires afterward, could this result in a use-after-fre=
e?

> +
> +	ret =3D sgm4154x_vbus_regulator_register(sgm);
> +	if (ret) {
> +		disable_irq_wake(client->irq);
> +		return dev_err_probe(dev, ret,
> +				     "Unable to register VBUS regulator\n");
> +	}

[Severity: Medium]
Will this result in an unbalanced disable_irq_wake call if client->irq is 0?

The enable_irq_wake call is properly gated behind a check for client->irq.
However, if sgm4154x_vbus_regulator_register fails, the error path
unconditionally calls disable_irq_wake.

Additionally, could the driver leak the IRQ wake depth count since it lacks=
 a
.remove callback to disable the wake IRQ upon successful unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602212512.4181=
66-1-macroalpha82@gmail.com?part=3D2
