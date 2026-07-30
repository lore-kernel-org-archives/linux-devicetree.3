Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5253D88E0
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401206; cv=none; b=tPKhbzEFAGVapusFXCwIKUf9+jEz4F2ZYtwVsVRfTDUVM2+ZrODmCN/5mnJXE/+JBf76mAadNdxykztASZv2VjnneTi5cs5ON+MUSIdtjDFwNy8gY056ZIScT/Np9XcvD55H4YKR1gmT19GavfpO8zcf8Rgj9PIwWwmub4Lzky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401206; c=relaxed/simple;
	bh=XzkDPmY1lZO66uxM7070JB5N1jIMpEyGrDQdBAIPBzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dd+GY6PnU2tGJKx6X85GF3q96KoUWVR8gWq4IqeLQKB4VFgQY6Wl+NyW+Ua4XXxkkDj9rPta5HYLVzl73hqdHsuZdad9ZJUHVO7KDboqyxV4YZsHSo4rj2yqzYlD6rUqtu/PpL0M6Rlefzvy70vaTGvPlP5oL30Bwl/Jx+6Lun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b15F1vbg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b15F1vbg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D571F00A3A;
	Thu, 30 Jul 2026 08:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785401204;
	bh=m/+KrNuhA+A+ZOh6F582ZCwLN6e2tGauHu77pAiPndE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b15F1vbgQHhETmG4BrRkc+H5+RvIkX3xV/BG/lRXix3BUGkWCnY6ocIYfTfTq2Nc1
	 PKFgJB5VmZ+VjQ19SAzBqRSTCCavUVrIwOGcpcFOak9mn6ZM2XLoVFIGj5sg+0odP9
	 ai7WGzQyYKlbBl3tuvpMW1/xrHuV8pyGw+o0uYBhyJJWWbmZj0TwrNWknjhLMsL0Os
	 +S3gZrf6r4L9XYJqqoJpLXHLkKR4s3yy7/6GFK/V8Ujb8nAHgsP0rjUYl1BWzrc4kb
	 TlkuDM6txITtkbztrB2FZD7LgSMJEELdJGul+czjb7yBufQItkJWw35S9j6H2lwjUU
	 zi0lmg2vhYx0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] thermal: amlogic: Add support for A9 thermal
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-a9-thermal-v1-2-d786d37cba58@amlogic.com>
References: <20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com>
 <20260730-a9-thermal-v1-2-d786d37cba58@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 08:46:43 +0000
Message-Id: <20260730084644.44D571F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Double disable of 'sysclk' due to manual disable of devm-managed c=
lock in remove callback.
- [High] Peripheral hardware registers are accessed via MMIO before their b=
acking clocks are enabled.
- [High] Incorrect hardware reset temperature calculation for negative cali=
bration trims due to flawed bitwise masking.
- [High] A9-specific hardware over-temperature reset configuration is appli=
ed unconditionally to all legacy SoCs.
- [High] The return value of `clk_prepare_enable(data->sysclk)` is ignored =
in the resume path.
- [High] An unvalidated device tree property can cause a divide-by-zero ker=
nel panic during probe.
- [Medium] Possible truncation of `temp_code` during hardware reset configu=
ration due to out-of-bounds bitwise masking.

Pre-existing issues:
- [High] The thermal zone is registered and unregistered in an unsafe order=
 relative to hardware clock state.
--

--- Patch [2]: [PATCH 2/2] thermal: amlogic: Add support for A9 thermal con=
troller ---
commit 0d417d06a989692f70ed92067eec1c72408bd3da
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

thermal: amlogic: Add support for A9 thermal controller

Add support for the Amlogic A9 thermal controller, utilizing different
calibration parameters, separate core and bus clocks, and a hardware
over-temperature reset mechanism. The hardware reset configuration is
also restored after resume.

> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_=
thermal.c
> index a0b530624b60c..c9c3514966533 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
[ ... ]
> @@ -138,6 +154,46 @@ static int amlogic_thermal_code_to_millicelsius(stru=
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
> +
> +	factor =3D param->B + div_s64(millicelsius, 100);
> +	factor =3D BIT(16) * factor;
> +	factor =3D div_s64(factor, param->A);
> +	factor =3D factor - (uefuse & TSENSOR_TRIM_TEMP_MASK);

[Severity: High]
Does this bitwise mask strip the negative sign extension?

The uefuse variable can hold a negative calibration trim, but applying
TSENSOR_TRIM_TEMP_MASK here seems to destroy the negative offset, which
could cause extreme positive values and corrupt the reset temperature logic.

> +
> +	uptat =3D param->n * factor;
> +	uptat =3D div_s64(uptat, BIT(16));
> +	uptat =3D param->m - uptat;
> +
> +	factor =3D factor * 100;
> +	factor =3D div_s64(factor, uptat);

[Severity: High]
Is there a risk of a divide-by-zero kernel panic here?

If the 'amlogic,hw-reset-temp' device tree property is set to a value around
981,000 mC, it looks like uptat can evaluate to zero. Should we validate the
reset temperature bounds before using it as a divisor?

> +
> +	temp_code =3D ((factor >> 0x4) & TSENSOR_TEMP_MASK) + TSENSOR_TEMP_CAL;

[Severity: Medium]
Could this bitwise mask truncate valid temperature codes?

If temp_code evaluates to 13 bits, it would exceed the 12-bit bounds of
TSENSOR_TEMP_MASK. This might lead to a zeroed reset configuration at high
temperatures.

> +
> +	return temp_code;
> +}
[ ... ]
> @@ -323,9 +398,24 @@ static int amlogic_thermal_probe(struct platform_dev=
ice *pdev)
[ ... ]
>  	pdata->tzd =3D devm_thermal_of_zone_register(&pdev->dev,
>  						   0,
>  						   pdata,
>  						   &amlogic_thermal_ops);

[Severity: High]
This isn't a bug introduced by this patch, but does registering the thermal
zone here expose it prematurely?

Using devm_thermal_of_zone_register() before clocks are fully enabled allows
the core to poll the device immediately, which could cause a bus hang on
unclocked hardware access. Cleanup will also happen after clocks are disabl=
ed.

>  	if (IS_ERR(pdata->tzd)) {
>  		ret =3D PTR_ERR(pdata->tzd);
>  		dev_err(dev, "Failed to register tsensor: %d\n", ret);
>  		return ret;
>  	}
> =20
>  	devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);
> =20
> +	pdata->temp_code =3D amlogic_thermal_millicelsius_to_code(pdata, reset_=
temp);
> +
> +	amlogic_tsensor_setup_hw_reset(pdata);

[Severity: High]
Does this unconditionally apply A9-specific hardware over-temperature
configuration to all legacy SoCs?

Since this function writes to TSENSOR_CFG_REG2, which appears to be
A9-specific, applying it across all platforms without checking the SoC type
might cause undefined behavior on legacy hardware.

> +
>  	ret =3D amlogic_thermal_enable(pdata);
[ ... ]
> @@ -355,6 +449,8 @@ static void amlogic_thermal_remove(struct platform_de=
vice *pdev)
>  {
>  	struct amlogic_thermal *data =3D platform_get_drvdata(pdev);
> =20
> +	if (data->data->has_sysclk)
> +		clk_disable_unprepare(data->sysclk);

[Severity: High]
Can this cause a reference count underflow for sysclk?

The sysclk was acquired in amlogic_thermal_probe() using
devm_clk_get_enabled(). Manually disabling a devm-managed clock here in the
remove callback could cause a double disable when the devm cleanup runs.

>  	amlogic_thermal_disable(data);
>  }
[ ... ]
> @@ -371,6 +469,9 @@ static int amlogic_thermal_resume(struct device *dev)
>  {
>  	struct amlogic_thermal *data =3D dev_get_drvdata(dev);
> =20
> +	amlogic_tsensor_setup_hw_reset(data);

[Severity: High]
Will this cause a bus fault on unclocked MMIO access?

amlogic_tsensor_setup_hw_reset() accesses peripheral hardware registers via
regmap, but the backing clocks haven't been enabled yet. The clock enabling
seems to happen on the next line.

> +	if (data->data->has_sysclk)
> +		clk_prepare_enable(data->sysclk);

[Severity: High]
Should the return value of clk_prepare_enable() be checked here?

Ignoring the return value could lead to unbalanced clock references or
hardware access failures if enabling the sysclk fails during resume.

>  	return amlogic_thermal_enable(data);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-a9-thermal=
-v1-0-d786d37cba58@amlogic.com?part=3D2
