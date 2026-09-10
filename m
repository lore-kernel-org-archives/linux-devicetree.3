Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED493A6B89
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023997; cv=none; b=rbNIIyz58lZ3FNV6jq8WGTkmCF7UpNCptj7G3PyMCaFq0Atv2CPELorS5YNyqiwVB+9So5M4e9csp5af3ns5D6ZchA5OkNziDPPTfwFqrDMaH/SrKPIufhfUeTuz7VwgNcE3xdPPEGb4+SX7WmQaZgj+4Vz3RaaC00bdniUqoeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023997; c=relaxed/simple;
	bh=/qyqj29fd7U3QUcLilY/sfihMsLctwHbPVo2rM7ihnk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BmyhawhOPPTPGm97ocIyBwLmUomWFwbEHTsXjUaAH1LsGDhCCSIOltgRbjdaBGULAy0FFLqPSVP5fLL9U1y57ls/7JOYOwdFTzfBgJFXOthfTonFrq5t5YhSTpne5OMKqBGUFYJ1C9NQ8Mx1QMY0Q3pGJ5McgqaWbw3LfIDFDb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9PnMdED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9PnMdED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B5F1F000FF;
	Thu, 10 Sep 2026 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789023994;
	bh=6LkwQrB30HLdB2Acy9+37YVsFnfiC2AlT0Hczfl8aOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9PnMdEDWVs3uJoG6sp1vk8j7rxKYSPuKdZNsXrbgVDvcJhklvxxwwY+mRD9l0NR6
	 a79fTplmjSFeabM/bI2b+etCi1u8gWAbVAzZrbs4ptqbj0kFl8MokD2egrGSaMi2uz
	 qKNYjoF4XScb0m+fqQa7GfjJNvSuE13wmmwD7Gu6+Rciu8/S7sKS6o7/X83NUoa/IV
	 FZRX2E6+SVe0cOACtc8ZkLbPPlDvRtbylcyjrtFKM+BetIGDWK5cER3r1N08qcronl
	 F3LCN5Ebe4ByfG11RpZhoIQ/bEqnmBtIXCrd9Qq565430KlzMC4/DV8GWpaV/AeT2p
	 +RAHE95s4H7Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] thermal: amlogic: Add support for A9 thermal
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-a9-thermal-v5-2-892d798723e1@amlogic.com>
References: <20260910-a9-thermal-v5-0-892d798723e1@amlogic.com>
 <20260910-a9-thermal-v5-2-892d798723e1@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 07:06:33 +0000
Message-Id: <20260910070634.60B5F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] The A9-specific hardware over-temperature reset mechanism is e=
nabled unconditionally on all SoCs, causing unclocked MMIO accesses and und=
efined register writes that will crash existing platforms (e.g., G12A) on r=
esume.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the thermal zone=
 and hwmon sysfs interfaces are registered before the hardware and clocks a=
re fully initialized, creating a race condition that leads to unclocked MMI=
O reads.
- [High] This problem wasn't introduced by this patch, but incorrect sign e=
xtension of a bitwise NOT operation on a 32-bit unsigned mask causes massiv=
ely inflated negative trim values on 32-bit architectures, breaking thermal=
 calibration.
- [High] This problem wasn't introduced by this patch, but disabling hardwa=
re clocks in `remove()` before the devres-managed thermal zone is unregiste=
red introduces a use-after-disable race condition that can crash the system.
--

commit c409169ce8a3938d784d6682dd656715a5d6d606
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

thermal: amlogic: Add support for A9 thermal controller

Add support for the Amlogic A9 thermal controller.

The A9 thermal controller uses different calibration parameters, requires
separate core and bus clocks, and supports a hardware over-temperature
reset mechanism. It also restores the hardware reset configuration after
resume.

> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_=
thermal.c
> index a0b530624b60c..e7cedb9443151 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
[ ... ]
> @@ -138,6 +158,51 @@ static int amlogic_thermal_code_to_millicelsius(stru=
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
This is a pre-existing issue, but by copying this logic from
amlogic_thermal_code_to_millicelsius(), the new function inherits a sign
extension bug.

When the hardware provides a negative trim value (bit 15 set in trim_info),
the bitwise NOT operation on the 32-bit unsigned TSENSOR_TRIM_TEMP_MASK mask
evaluates to a large positive value on 32-bit systems (e.g., 0xFFFFFFFF).

When this is assigned to the s64 uefuse variable, C promotion rules
zero-extend it to 4294967295 rather than sign-extending to -1.

This breaks thermal calibration for hardware instances with negative factory
calibration offsets, rendering those devices unusable.

Could we fix this integer conversion so that the negative value is properly
sign-extended into the s64 variable?

[ ... ]
> @@ -346,6 +440,17 @@ static int amlogic_thermal_probe(struct platform_dev=
ice *pdev)
> =20
>  	devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but registering the thermal zone
device here before the hardware clocks are fully initialized creates a race
condition.

The thermal core invokes the .get_temp callback immediately upon registrati=
on
to establish the initial temperature state.

If the driver is built as a loadable module and loaded after boot, when
bootloader-enabled clocks have already been disabled by the clock framework=
's
late init, the .get_temp call will attempt to read from the hardware before
its clock is prepared and enabled.

Will this result in an unclocked MMIO read and subsequent bus fault?

> +	if (pdata->data->reset_temp) {
> +		reset_temp =3D pdata->data->reset_temp;
> +	} else {
> +		dev_dbg(dev, "using default hardware reset temperature\n");
> +		reset_temp =3D TSENSOR_HW_RESET_DEFAULT_TEMP;
> +	}
> +
> +	pdata->temp_code =3D amlogic_thermal_millicelsius_to_code(pdata, reset_=
temp);
> +
> +	amlogic_tsensor_setup_hw_reset(pdata);
> +
>  	ret =3D amlogic_thermal_enable(pdata);

[Severity: Critical]
Does unconditionally applying the A9-specific hardware reset setup here
cause issues for older non-A9 platforms?

For existing SoCs where has_sysclk is false, the peripheral clock (data->cl=
k)
isn't enabled until amlogic_thermal_enable() is called on the next line.

Since the clock is physically off during probe, does this regmap_update_bit=
s()
write inside amlogic_tsensor_setup_hw_reset() trigger a bus fault?

Also, could writing to TSENSOR_CFG_REG2 cause undefined register modificati=
on
on hardware that doesn't support this over-temperature reset mechanism?

[ ... ]
> @@ -370,7 +477,15 @@ static int amlogic_thermal_suspend(struct device *de=
v)
>  static int amlogic_thermal_resume(struct device *dev)
>  {
>  	struct amlogic_thermal *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (data->data->has_sysclk) {
> +		ret =3D clk_prepare_enable(data->sysclk);
> +		if (ret)
> +			return ret;
> +	}
> =20
> +	amlogic_tsensor_setup_hw_reset(data);
>  	return amlogic_thermal_enable(data);

[Severity: Critical]
Similarly, does this execute an MMIO write before the peripheral clock is
enabled during the resume path for non-A9 platforms?

On non-A9 platforms, data->clk is only enabled inside
amlogic_thermal_enable().

If this write occurs while the clock is still physically disabled during
system resume, could this cause a synchronous external abort and break power
management completely?

[Severity: High]
This is a pre-existing issue, but is there a use-after-disable race conditi=
on
in the driver's remove path?

drivers/thermal/amlogic_thermal.c:amlogic_thermal_remove() {
    struct amlogic_thermal *data =3D platform_get_drvdata(pdev);

    amlogic_thermal_disable(data);
}

Disabling the hardware clocks in remove() before the devres-managed thermal
zone is cleanly unregistered could crash the system.

Because pdata->tzd was registered with devm_thermal_of_zone_register(), it
remains fully active and exposed to the thermal core until the devres clean=
up
phase, which executes after remove() returns.

If the thermal core's polling timer fires, or if a user reads the temperatu=
re
sysfs attribute during this window, amlogic_thermal_get_temp() will attempt
to read from the unclocked hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-a9-thermal=
-v5-0-892d798723e1@amlogic.com?part=3D2
