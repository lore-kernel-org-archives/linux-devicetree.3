Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9638399E
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299296; cv=none; b=B/hMrPYrD9rblRkPA4TVYLps1zZkMsvIJtl6SXZT88XIp+hrbRT17Pm3R5V1JSkKS1tkZrN0far/cX0ctjLw32eF8bB3ZP5IvxxKUpZzdNlx4Y+AJKmdlGbvkV1NjcqF5LuygunbALtQm/8wwYdgX2OrbtxGQbsxzaMn1DsSV20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299296; c=relaxed/simple;
	bh=LI+FbMTcYSaZVKaGSL436lepaMEZbMMVs9BQFRFSYnE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TaVxGHgzD7P41JmU7O/g8dS47/KuEYL8opBWtF30q731OliJaNk/QaOP0FM6Txub+4b+uqjOohuCOyRKg2mJZRrGEDu/AcpcWvPgEhFDTVB/4EPErA9qnUNve2lLxmMYQ6Nd4d9xMPD2rokVZMvDXD6B0qdkf/rc9LgYF0xsVw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrTP+2bN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrTP+2bN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE241F000E9;
	Fri, 21 Aug 2026 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787299295;
	bh=Wxcfc0Xy+0drgrEfKuXXYeAtb2OXgOmyhpjt81d2okI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZrTP+2bNOiUrsEVTMdW45IA+9R18eHAmU7kanVrTAU3pbv/3ZgYFHhHr9VMT64nG+
	 saahe01bwVOKrrX+/fL+9MAaPWFIiW7WyQ5jQD1fGXeOeXiJ6GsS/mL68O8CAgdgX1
	 4x4+4vEYxt/T95h2iH1Y30+jNKuqtMJsGgA//CHdz/ZHQDHTujoAQEUMXZ3cXbu9Km
	 ylgdozUxDSDK/mR8HrwO46tuvbicJwC3TILDgaDq2X34U5bWsdNAWKtSa14voWwFjZ
	 9GE96QTkjOVbvxatmyj8ZePyKpd2zcPVTNE1d6i8A0GeSTcz5wuxBtUnBN0tyIjwzJ
	 +skQWZVJVgmTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] thermal: amlogic: Add support for A9 thermal
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260821-a9-thermal-v3-2-0e7abf3941e3@amlogic.com>
References: <20260821-a9-thermal-v3-0-0e7abf3941e3@amlogic.com>
 <20260821-a9-thermal-v3-2-0e7abf3941e3@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 08:01:34 +0000
Message-Id: <20260821080134.CCE241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] Hardware reset registers are unconditionally accessed before t=
he peripheral clock is enabled, causing a bus fault or system hang on legac=
y SoCs.
- [High] The hardware over-temperature reset mechanism is unconditionally e=
nabled for all SoCs, contradicting the commit message and potentially causi=
ng undefined behavior on unsupported platforms.
- [High] The return value of `clk_prepare_enable()` for `sysclk` is ignored=
 in `amlogic_thermal_resume()`, potentially leading to unclocked hardware a=
ccesses and clock state leaks.
- [High] The fallback logic for a zero divisor (`!uptat`) in temperature ca=
lculation produces a code that overflows the 12-bit hardware register mask,=
 silently setting the reboot threshold to 0.

Pre-existing issues:
- [High] The calculation of `uefuse` incorrectly zero-extends a 32-bit bitw=
ise NOT result on 32-bit platforms, turning a negative calibration offset i=
nto a massive positive value.
- [High] The thermal zone and hwmon sysfs interfaces are exposed to userspa=
ce and the thermal core before hardware initialization completes, allowing =
unclocked register accesses.
--

--- Patch [2]: [PATCH v3 2/2] thermal: amlogic: Add support for A9 thermal =
controller ---
commit a95f34d366c7ca1c65ce5aec6e86688c00a990a8
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

thermal: amlogic: Add support for A9 thermal controller
   =20
Add support for the Amlogic A9 thermal controller. The A9 thermal controller
uses different calibration parameters, requires separate core and bus clock=
s,
and supports a hardware over-temperature reset mechanism, and restore the
hardware reset configuration after resume.

> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_=
thermal.c
> index a0b530624b60c..ff8a8b1525367 100644
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
This is a pre-existing issue that was copied into this new function, but do=
es
this calculation correctly handle negative calibration offsets on 32-bit
platforms?

The expression ~(pdata->trim_info & TSENSOR_TRIM_TEMP_MASK) + 1 evaluates t=
o a
32-bit unsigned integer since TSENSOR_TRIM_TEMP_MASK is generated by GENMAS=
K.
When assigned to the s64 uefuse variable, it is zero-extended instead of
sign-extended, turning a negative offset into a massive positive value.

> +
> +	factor =3D param->B + div_s64(millicelsius, 100);
> +	factor =3D BIT(16) * factor;
> +	factor =3D div_s64(factor, param->A);
> +	factor =3D factor - uefuse;
> +
> +	uptat =3D param->n * factor;
> +	uptat =3D div_s64(uptat, BIT(16));
> +	uptat =3D param->m - uptat;
> +
> +	factor =3D factor * 100;
> +	if (!uptat)
> +		factor =3D TSENSOR_TEMP_MASK << 0x4;
> +	else
> +		factor =3D div_s64(factor, uptat);
> +
> +	temp_code =3D ((factor >> 0x4) & TSENSOR_TEMP_MASK) + TSENSOR_TEMP_CAL;

[Severity: High]
If the division-by-zero fallback (!uptat) triggers, factor is set to 0xFFF0.
Does this result in a temp_code of 0x1000 here, which exceeds the 12-bit
TSENSOR_TEMP_MASK?

Later in amlogic_tsensor_setup_hw_reset(), this 0x1000 is shifted left by 4=
 to
produce 0x10000. When written to TSENSOR_CFG_REG2 with the GENMASK(15, 4) m=
ask,
it truncates to 0. Could this accidentally set the hardware reboot threshol=
d to
0 and cause an unexpected reboot?

> +
> +	return temp_code;
> +}
> +
> +static void amlogic_tsensor_setup_hw_reset(struct amlogic_thermal *data)
> +{
> +	regmap_update_bits(data->regmap, TSENSOR_CFG_REG2, TSENSOR_CFG_REG2_REB=
OOT_CODE,
> +			   data->temp_code << 0x4);
> +	regmap_update_bits(data->regmap, TSENSOR_CFG_REG2,
> +			   TSENSOR_CFG_REG2_ENABLE, TSENSOR_CFG_REG2_ENABLE);
> +}

[ ... ]

> @@ -346,6 +437,17 @@ static int amlogic_thermal_probe(struct platform_dev=
ice *pdev)
> =20
>  	devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);

[Severity: High]
This is a pre-existing issue, but does registering the thermal zone and hwm=
on
sysfs interfaces here expose them to userspace before hardware initializati=
on
completes?

Since devm_thermal_of_zone_register() and devm_thermal_add_hwmon_sysfs() are
called before amlogic_thermal_enable() starts the device clock, a thermal
core or sysfs read could invoke amlogic_thermal_get_temp() concurrently,
accessing TSENSOR_STAT0 while the clock is gated, which could cause a bus
hang.

> +	if (pdata->data->reset_temp) {
> +		reset_temp =3D pdata->data->reset_temp;
> +	} else {
> +		dev_dbg(dev, "using default hardware reset temperature\n");
> +		reset_temp =3D TSENSOR_HW_RESET_DEFAULT_TEMP;
> +	}

[Severity: High]
The commit message states the hardware over-temperature reset is an A9
thermal controller feature.

However, doesn't this unconditionally fall back to the default reset
temperature and enable the hardware reboot feature for all SoCs? Older
platforms might not support this register or the hardware reboot feature.

> +
> +	pdata->temp_code =3D amlogic_thermal_millicelsius_to_code(pdata, reset_=
temp);
> +
> +	amlogic_tsensor_setup_hw_reset(pdata);
> +
> +	ret =3D amlogic_thermal_enable(pdata);

[Severity: Critical]
Does amlogic_tsensor_setup_hw_reset() access TSENSOR_CFG_REG2 before
amlogic_thermal_enable() starts the device clock?

On older SoCs like G12A, there is no separate sysclk, so the hardware is
completely unclocked during this MMIO write. Could this cause a bus fault
or system hang during boot?

>  	return ret;
>  }

[ ... ]

> @@ -371,6 +475,9 @@ static int amlogic_thermal_resume(struct device *dev)
>  {
>  	struct amlogic_thermal *data =3D dev_get_drvdata(dev);
> =20
> +	if (data->data->has_sysclk)
> +		clk_prepare_enable(data->sysclk);

[Severity: High]
Should the return value of clk_prepare_enable() be checked here?

If it fails, the driver continues to access the hardware in
amlogic_tsensor_setup_hw_reset(), causing a bus hang. If it succeeds but the
subsequent amlogic_thermal_enable() fails, the clock reference count could =
be
left imbalanced.

> +	amlogic_tsensor_setup_hw_reset(data);
> +	return amlogic_thermal_enable(data);

[Severity: Critical]
Similar to the issue in amlogic_thermal_probe(), does this perform an
unclocked hardware register access during device resume on legacy platforms?

amlogic_tsensor_setup_hw_reset() accesses TSENSOR_CFG_REG2 before
amlogic_thermal_enable() starts the main device clock, which could cause a
bus hang on older SoCs that lack a separate sysclk.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-a9-thermal=
-v3-0-0e7abf3941e3@amlogic.com?part=3D2
