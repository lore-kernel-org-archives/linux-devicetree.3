Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62767350A05
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672582; cv=none; b=ML4QDI/CVwsBP66HRnIri9dxVR2yK/ElCunX/+bb9Kk8xGlfnZw8ekYdp0dOWoAekdfwtY2pGRLpobabsyUOLHNPyGkC+ijwhr4Pgi2I+7sf77xawBV1ZgjcvnMGK6ySlUJEsHzkMNkennzV+Fz/trOI5SkheCCSlqX9dnkuPfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672582; c=relaxed/simple;
	bh=ED3u1XAd2ot59S60y5+AinqaepMD446p1yXJsrYbEd0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CZ9lpWlOcX8+I87xV0hnuPnkviqoInqLz7Gv/GxvnCWAH8C6GWW/qrmCTaSjGBxOW85vOl65dVUuiQR6CGEhr+ZsbsWAlYgQ9wwTtPPl0ojKlaU058yPSAnAyjlqrHCwxjFt+RxuwuCVeI9gKX8crb3UPmyFlr+p836AcL2h5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QY70Pa0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QY70Pa0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2A71F000E9;
	Fri, 10 Jul 2026 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783672581;
	bh=4a/tbZ6CsnvCYicgjPp50OJp1XSxP2ax0SKKZ2bC1YQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QY70Pa0u05qchZ+gOKPBGYMfALv+q6z8hEiqHo/xI9Hyivvqbzr9Z5EdOAPZ/vsVL
	 sx1488zfjY5FqEHHR1l4Wxe2/Itotc93hP0FocMDE5BLJFF58YzojKMf6tCDVLQ5Uh
	 MPHVNPp06EfgDJx9cusMxLmy+eMLYbZ9GXrpayb/a0ETrR7T1iuPYeefEkfnIuR11N
	 x6O7sO/C4GZZAq2Ydhg2F7O6LtJraqUFIabv8rLe+xjGb+wH40r2PlcdB3RVh/2eER
	 +jTvVfPGHqZaJEpJk79P+UZSWhX2mz0rGF6ckdNzW1ctdNn7mGsjtzP/3FbkYKqm2k
	 bRsjzd6VFyJkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] thermal/drivers/loongson2: Add thermal driver
 support for Loongson-2K0300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <e5a574b2ae0e5e0ec32fe81c0ccd03eb3ad5a164.1783670011.git.zhoubinbin@loongson.cn>
References: <cover.1783670011.git.zhoubinbin@loongson.cn>
 <e5a574b2ae0e5e0ec32fe81c0ccd03eb3ad5a164.1783670011.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 08:36:20 +0000
Message-Id: <20260710083620.CB2A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Incorrect extraction mask and sign-evaluation for `chip_id0` calib=
ration data breaks negative temperature calibration.
- [High] The loongson2_thermal_set_trips function programs invalid Celsius =
thresholds into the raw ADC comparator for the LS2K0300 sensor.
- [High] Dynamic 'old fuse' detection dangerously masks legitimate critical=
 thermal events during a real thermal runaway.

Pre-existing issues:
- [High] Inverted error handling in the thermal zone registration loop pass=
es an `ERR_PTR` to subsequent IRQ and sysfs setup.
--

--- Patch [2]: [PATCH 2/2] thermal/drivers/loongson2: Add thermal driver su=
pport for Loongson-2K0300 ---
commit 95ad3fc965f2e0fee5a82b9e68fbe20931624b5a
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Add thermal driver support for Loongson-2K0300

This commit adds support for the Loongson-2K0300 thermal sensor, introducin=
g a
new temperature calculation formula based on a hardware version compensation
value read from a chip ID register. It also includes a fallback mechanism
for early chips with invalid fuses.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index ea4dd2fb1f473..a7eb87070aa9f 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c

[ ... ]

> +#define LS2K0300_ID0_VAL_MASK		GENMASK(31, 20)
> +#define LS2K0300_ID1_VAL_MASK		GENMASK(15, 0)
> +
> +#define LS2K0300_COMP_VAL_MASK		GENMASK(14, 0)
> +#define LS2K0300_COMP_SIGN_BIT		BIT(15)

[ ... ]

> +static int loongson2_2k0300_get_temp(struct thermal_zone_device *tz, int=
 *temp)
> +{

[ ... ]

> +	if (chip_id0 & LS2K0300_EXTERN_ID)
> +		calib_data =3D FIELD_GET(LS2K0300_ID1_VAL_MASK, chip_id1);
> +	else
> +		calib_data =3D FIELD_GET(LS2K0300_ID0_VAL_MASK, chip_id0);
> +
> +	calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +	if (calib_data & LS2K0300_COMP_SIGN_BIT)
> +		calib_offset =3D -calib_offset;

[Severity: High]
Is this sign check mathematically possible for chip_id0?

LS2K0300_ID0_VAL_MASK extracts a 12-bit value using GENMASK(31, 20). If
calib_data is populated from chip_id0, checking against BIT(15) will always
evaluate to false. Does this mean negative calibration offsets will never be
applied for this case?

> +
> +	temp_mc =3D (raw_adc + calib_offset) * 570 - 394700;
> +
> +	/* For old fuse which can not read right thermal data */
> +	if (temp_mc < LS2K0300_LOWEST_VALID_TEMP || temp_mc > LS2K0300_HIGHEST_=
VALID_TEMP) {
> +		dev_warn_once(tdata->dev, "It's an old fuse, thermal %d is not right\n=
", temp_mc);
> +		temp_mc =3D raw_adc * 569 - 394700;
> +	}

[Severity: High]
Could this dynamic bounds check mask a legitimate thermal runaway?

If the system genuinely overheats and exceeds LS2K0300_HIGHEST_VALID_TEMP
(125 C), this check assumes an old fuse and discards the calib_offset. If
that offset was positive, discarding it will suddenly drop the reported
temperature during severe heating. Might this hide the true severity from t=
he
OS and prevent the system from reaching the critical trip points needed for=
 an
emergency shutdown?

> +	*temp =3D temp_mc;
> +
> +	return 0;
> +}

[ ... ]

> +static const struct thermal_zone_device_ops loongson2_2k0300_of_thermal_=
ops =3D {
> +	.get_temp =3D loongson2_2k0300_get_temp,
> +	.set_trips =3D loongson2_thermal_set_trips,
> +};

[Severity: High]
Does loongson2_thermal_set_trips write invalid threshold data for this new
sensor?

That function adds 100 to the Celsius threshold via loongson2_set_ctrl_regs,
which matches the older LS2K1000 scale. Since the LS2K0300 uses an 11-bit A=
DC
format and a completely different calculation formula, wouldn't writing
Celsius + 100 into its hardware comparator cause an immediate threshold
mismatch and a potential interrupt storm?

[ ... ]

> @@ -160,7 +219,7 @@ static int loongson2_thermal_probe(struct platform_de=
vice *pdev)
>  	loongson2_thermal_set(data, 0, 0, false);
> =20
>  	for (i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
> -		tzd =3D devm_thermal_of_zone_register(dev, i, data, thermal_ops);
> +		tzd =3D devm_thermal_of_zone_register(dev, i, data, data->chip_data->t=
hermal_ops);
> =20
>  		if (!IS_ERR(tzd))
>  			break;
> =20
>  		if (PTR_ERR(tzd) !=3D -ENODEV)
>  			continue;
> =20
>  		return dev_err_probe(dev, PTR_ERR(tzd), "failed to register");
>  	}

[Severity: High]
This is a pre-existing issue, but does this error handling logic inadverten=
tly
pass an error pointer on fatal errors?

By continuing the loop when PTR_ERR(tzd) !=3D -ENODEV, critical errors like
-ENOMEM are ignored. If all sensors fail to register, the loop terminates
with tzd holding an error pointer. This pointer is then blindly passed to
devm_request_threaded_irq and devm_thermal_add_hwmon_sysfs right after the
loop, potentially causing a kernel oops when dereferenced.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783670011.gi=
t.zhoubinbin@loongson.cn?part=3D2
