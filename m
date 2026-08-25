Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA773B14D6
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640015; cv=none; b=q7bFFUopb/hU3Q9aEkAwUJmw7Eux1VOtq2z+aGOBYyXJPfElRKXoncFdlby6zp9Cvj6IeN6VGitdGMo3sBWZDY7GkC5Ae46tiI1r9lnPL5UOmIP+plNusjRjxCGSZVv0u/7WPFqYvX2PQJQ86b9GirquUBEgTuRBokKnsazdkDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640015; c=relaxed/simple;
	bh=VF7go5NZsaeGgVUh3uPxDnzKW6+R+r4JQK4xM5MMKDo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MzdZotALiNueGYX5ISJJxnWCV+ZcRDibpJ4mNTWy2BC2c5Nr3Hka2Clbn89OujVkA3CdfMW9c4pVzrM8cNq5A6GPZxCna4rBXk9j7MqAJIWfJjXe0MnqzY4qALHFaZFpJdxElc/3ZbvnmknKHUigvFE3uHc0OaawFzqr33xU+MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+e4uzIS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+e4uzIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A947A1F00A3A;
	Tue, 25 Aug 2026 06:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787640014;
	bh=M3NjYycN+95OBqSxLqumIRHruH6w68KyZ68gw7fmfy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h+e4uzIS3Sm+EtPs/8FoT6Bpql/0TwZj3K/+tgtWfbZjBguvoxnM03My3VFkE4ame
	 1nDVr8lLHlBdO5W3f4oz8GJFrbm9LiWs1UsKsOJNKa5tgBsBnMUxjCO3g4mR628pQz
	 hsT5xUgh55CAzsLUk+qsFykLfEocgDnIOrNbyEfPFMkYmwyTc8694yQxTykpIgGSKo
	 xPBli21iEUQ4vqcCO1KSZkQzDwpKEFP6PabUZzP3qIvu/X5EwUlsA1cd88PJQDGNMM
	 HHYNm3Lz3zOvaUyqIU6dFNNCvIlzVKi8hSTzz5j7ACtseudl+FENfpDV5ygH/d1kbs
	 cycRGzCehKd9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] thermal: amlogic: Add support for A9 thermal
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260825-a9-thermal-v4-2-d8fc9859cf22@amlogic.com>
References: <20260825-a9-thermal-v4-0-d8fc9859cf22@amlogic.com>
 <20260825-a9-thermal-v4-2-d8fc9859cf22@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:40:13 +0000
Message-Id: <20260825064013.A947A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Unclocked MMIO register access in probe and resume causes bus =
faults on legacy SoCs.
- [High] A9-specific hardware over-temperature reset is unconditionally ena=
bled on all legacy SoCs with incorrect bitmask.
- [Medium] Missing error check for `clk_prepare_enable()` and missing clock=
 unwind in `amlogic_thermal_resume()`.

Pre-existing issues:
- [High] Invalid manual two's complement on unsigned type breaks negative t=
emperature calculations on 32-bit systems.
- [High] Thermal zone registered and polled before hardware clocks are enab=
led.
--

--- Patch [2]: [PATCH v4 2/2] thermal: amlogic: Add support for A9 thermal =
controller ---
commit 722761d3d79caeb86bd5f0b65fa45692c9e109e1
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

thermal: amlogic: Add support for A9 thermal controller

Add support for the Amlogic A9 thermal controller with different
calibration parameters, separate core/bus clocks, and hardware reset
capabilities.

> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_=
thermal.c
> index a0b530624b60c..74f0bc49c737b 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c

[ ... ]

> @@ -138,6 +157,49 @@ static int amlogic_thermal_code_to_millicelsius(stru=
ct amlogic_thermal *pdata,
>  	return temp;
>  }
> =20
> +/*
> + * Calculate a temperature code from a temperature value .
> + * The unit of the temperature is degree milliCelsius.
> + */
> +static u32 amlogic_thermal_millicelsius_to_code(struct amlogic_thermal *=
pdata, int millicelsius)
> +{
> +	const struct amlogic_thermal_soc_calib_data *param =3D
> +					pdata->data->calibration_parameters;
> +	s64 factor, uptat, uefuse;
> +	u32 temp_code;
> +
> +	uefuse =3D pdata->trim_info & TSENSOR_TRIM_SIGN_MASK ?
> +			     ~(pdata->trim_info & TSENSOR_TRIM_TEMP_MASK) + 1 :
> +			     (pdata->trim_info & TSENSOR_TRIM_TEMP_MASK);

[Severity: High]
This is a pre-existing issue, but could this manual two's complement logic
break negative temperature calculations on 32-bit systems?

Because TSENSOR_TRIM_TEMP_MASK is derived from GENMASK (an unsigned long),
the bitwise NOT results in an unsigned 32-bit integer (e.g., 0xFFFFFFFB
for -5). When assigned to the 64-bit signed integer uefuse, it gets
zero-extended to 4294967291 instead of sign-extended to -5.

Since this bug was duplicated into the new amlogic_thermal_millicelsius_to_=
code
function from amlogic_thermal_code_to_millicelsius, should both locations
be fixed to prevent over-temperature protection from miscalculating?

> +
> +	factor =3D param->B + div_s64(millicelsius, 100);

[ ... ]

> +static void amlogic_tsensor_setup_hw_reset(struct amlogic_thermal *data)
> +{
> +	regmap_update_bits(data->regmap, TSENSOR_CFG_REG2, TSENSOR_CFG_REG2_REB=
OOT_CODE,
> +			   data->temp_code << 0x4);
> +	regmap_update_bits(data->regmap, TSENSOR_CFG_REG2,
> +			   TSENSOR_CFG_REG2_ENABLE, TSENSOR_CFG_REG2_ENABLE);

[Severity: High]
Does this write an incorrect bitmask into the TSENSOR_CFG_REG2 register?

The macro TSENSOR_CFG_REG2_ENABLE includes TSENSOR_CFG_REG2_REBOOT_TIME,
which is defined as GENMASK(23, 16). Passing this macro as both the mask
and the value to regmap_update_bits() sets all bits of GENMASK(23, 16)
to 1, hardcoding the maximum reboot time (0xFF) instead of leaving it as
a configured value.

> +}
> +

[ ... ]

> @@ -346,6 +437,17 @@ static int amlogic_thermal_probe(struct platform_dev=
ice *pdev)
> =20
>  	devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);

[Severity: High]
This is a pre-existing issue, but does registering the thermal zone slightly
earlier in this probe function trigger a synchronous external abort?

Calling devm_thermal_of_zone_register() causes the thermal core to
synchronously invoke the .get_temp callback to initialize trip points. This
attempts an MMIO read via regmap_read(pdata->regmap, TSENSOR_STAT0) before
amlogic_thermal_enable() is called to enable the clocks.

> +	if (pdata->data->reset_temp) {
> +		reset_temp =3D pdata->data->reset_temp;
> +	} else {
> +		dev_dbg(dev, "using default hardware reset temperature\n");
> +		reset_temp =3D TSENSOR_HW_RESET_DEFAULT_TEMP;
> +	}

[Severity: High]
Does this apply an A9-specific hardware over-temperature reset configuration
unconditionally to all legacy SoCs (G12A, A1, T7)?

Older platforms may not support the TSENSOR_CFG_REG2 register, which could
lead to hardware misconfiguration or unintended reboots.

> +
> +	pdata->temp_code =3D amlogic_thermal_millicelsius_to_code(pdata, reset_=
temp);
> +
> +	amlogic_tsensor_setup_hw_reset(pdata);
> +
>  	ret =3D amlogic_thermal_enable(pdata);

[Severity: Critical]
Will calling amlogic_tsensor_setup_hw_reset() before amlogic_thermal_enable=
()
trigger a synchronous external abort (bus hang) on legacy SoCs?

amlogic_tsensor_setup_hw_reset() performs an MMIO regmap write to
TSENSOR_CFG_REG2. On platforms where the thermal IP relies entirely on
pdata->clk, this clock is left disabled until amlogic_thermal_enable()
is called on the very next line, which means we are writing to hardware
registers while the IP's clock is gated.

> =20
>  	return ret;

[ ... ]

> @@ -371,6 +475,9 @@ static int amlogic_thermal_resume(struct device *dev)
>  {
>  	struct amlogic_thermal *data =3D dev_get_drvdata(dev);
> =20
> +	if (data->data->has_sysclk)
> +		clk_prepare_enable(data->sysclk);

[Severity: Medium]
Is an error check missing for clk_prepare_enable() here?

If it fails, the driver will proceed to access hardware, resulting in a bus
fault.

Additionally, if sysclk is enabled successfully but the subsequent
amlogic_thermal_enable() fails, the function returns the error code without
disabling sysclk, which leaks the clock enable count.

> +	amlogic_tsensor_setup_hw_reset(data);
>  	return amlogic_thermal_enable(data);

[Severity: Critical]
Similar to the probe function, does amlogic_tsensor_setup_hw_reset()
perform an unclocked MMIO write here?

amlogic_thermal_enable() prepares and enables the core thermal clock, but
it is called after the hardware reset configuration is written.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-a9-thermal=
-v4-0-d8fc9859cf22@amlogic.com?part=3D2
