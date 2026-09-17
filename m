Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1E84D90C6
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644747; cv=none; b=imFncRobr3vPyKuUmH9kWE/4ZPw7p2y/m3mfaXpuT17KxUGeU/Ygv/OQMiKCwplXWtO1uEtHePR2XcEqTbRcNJIHvk77S24db1CGtecVKMDCvGCJUHkU/s45SnPbNlJPaleL3RrdGNVvHZpVq7Qc7quJ1jWhne8blxVqAb28KfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644747; c=relaxed/simple;
	bh=CKNxaXjkyjlv5u4Kasr3YJC78Eyo1wEidp4qljKME48=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rvrx8L8HbxxhAWeHo7Ool2AtIz+zPEbanCicgx9Qp4K5eseWiOTWyw1APSOkCJfKqZBGb7QgXy1DCFf5EpwmJ89qCOI2t/TSND0Zyt/8hjy21Mb/5X2RoAwzUWqmeqGSYIgMFcjKd7mGLj/KDhuCUGR5lrOqef+NvQpy8ZzHH0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J92p+wo1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J92p+wo1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB061F00893;
	Thu, 17 Sep 2026 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644745;
	bh=ZZEMVr40wTvg6agt0Hiw22s5r/w811NlWUgn8/Q9Qa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J92p+wo1t48wL4n4GyYvL15G42QyuK4j1dlkX8wQZ7NW1pvP7OU5P03xLxMBIUCRY
	 DVBUEUdbq1OcRm25OKp9rrCisxtLEJmiViBS6MIPOe6fn19vHQmdmRQSNIIuvVECxk
	 VG+yp1YMpWQWyCYi255Uz8mLb8bS7kQEuuT6On5slBy1AyHV6d4bYk9N9s/u6sPnFE
	 +sVQSkuqu63T6SEqhZm/VkvrTcXtEiLUjWInv2aIT9H4G4PA3QrKwba/SyughowA1J
	 GLQzou4NiKf0Zp31wkaP5E+XxasiufrMzxqOacqBK8vqJzAAxGKvUJNk8qNV9IYgIs
	 SqBb7xTABpK3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] thermal/drivers/loongson2: Add support for
 Loongson-2K0300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <6985dce54bb5b87bb232c714d236b7cb82eeb58c.1789546118.git.zhoubinbin@loongson.cn>
References: <cover.1789546118.git.zhoubinbin@loongson.cn>
 <6985dce54bb5b87bb232c714d236b7cb82eeb58c.1789546118.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:32:24 +0000
Message-Id: <20260917113225.3FB061F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] thermal: loongson2: invalid thermal trip thresholds written for 2K=
0300
- [Medium] thermal: loongson2: missing regmap_read error check and ineffici=
ent static data polling
- [Medium] thermal: loongson2: transient ADC errors permanently latch old f=
use state
--

commit b926fbbb617cddc0a0e12efb6da240071ce01710
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Add support for Loongson-2K0300

The Loongson-2K0300 thermal sensor uses a 10-bit ADC and requires
per-chip calibration. The calibration offset is stored in the CHIP ID
registers, which are accessed via syscon. The driver reads this offset
and applies it when converting the raw ADC value to millicelsius.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index fb4793a9bc554..8930a8a75da78 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c

[ ... ]

> @@ -71,13 +95,54 @@ static int loongson2_thermal_set(struct loongson2_the=
rmal_data *data,
>  	return 0;
>  }
> =20
> +static int loongson2_2k0300_get_temp(struct thermal_zone_device *tz, int=
 *temp)
> +{
> +	struct loongson2_thermal_data *tdata =3D thermal_zone_device_priv(tz);
> +	int calib_data, calib_offset, temp_mc, raw_adc;
> +	u32 chip_id0 =3D 0, chip_id1 =3D 0;
> +
> +	writel(0xff03, tdata->ctrl_reg + LOONGSON2_THSENS_CFG_REG);
> +	raw_adc =3D FIELD_GET(LOONGSON2_THSENS_OUT_11B_MASK,
> +			    readl(tdata->ctrl_reg + LOONGSON2_THSENS_OUT_REG));
> +
> +	if (tdata->flags & LS2K0300_OLD_FUSE_FLAG) {
> +		*temp =3D raw_adc * 569 - 394700;
> +		return 0;
> +	}
> +
> +	regmap_read(tdata->regmap_cfg, LS2K0300_CHIP_ID0, &chip_id0);
> +	regmap_read(tdata->regmap_cfg, LS2K0300_CHIP_ID1, &chip_id1);

[Severity: Medium]
Should we check the return value of regmap_read() here?

If the read fails, chip_id0 and chip_id1 will remain uninitialized (zero),
which leads to a silent incorrect calibration offset and corrupts the
temperature output.

Also, since this is static calibration data, could we read it just once dur=
ing
probe() instead of repeatedly polling it in the hot path?

> +
> +	if (chip_id0 & LS2K0300_EXTERN_ID) {
> +		calib_data =3D FIELD_GET(LS2K0300_ID1_VAL_MASK, chip_id1);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +		if (calib_data & LS2K0300_COMP_SIGN_BIT)
> +			calib_offset =3D -calib_offset;
> +	} else {
> +		calib_data =3D FIELD_GET(LS2K0300_ID0_VAL_MASK, chip_id0);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +	}
> +
> +	temp_mc =3D (raw_adc + calib_offset) * 570 - 394700;
> +
> +	/* For old fuse which can not read right thermal data */
> +	if (temp_mc < LS2K0300_LOWEST_VALID_TEMP || temp_mc > LS2K0300_HIGHEST_=
VALID_TEMP) {
> +		dev_warn_once(tdata->dev, "It's an old fuse, thermal %d is not right\n=
", temp_mc);
> +		tdata->flags |=3D LS2K0300_OLD_FUSE_FLAG;
> +		temp_mc =3D raw_adc * 569 - 394700;
> +	}

[Severity: Medium]
Is it safe to permanently latch the LS2K0300_OLD_FUSE_FLAG here based on a
dynamic reading?

If a single anomalous or transient ADC reading causes temp_mc to fall out of
bounds, the driver will permanently downgrade the sensor to the uncalibrated
fallback formula for all future reads until the system reboots.

Should the old fuse detection be strictly based on static fuse register data
instead?

> +	*temp =3D temp_mc;
> +
> +	return 0;
> +}
> +

[ ... ]

> @@ -112,6 +177,11 @@ static int loongson2_thermal_set_trips(struct therma=
l_zone_device *tz, int low,
>  	return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
>  }
> =20
> +static const struct thermal_zone_device_ops loongson2_2k0300_of_thermal_=
ops =3D {
> +	.get_temp =3D loongson2_2k0300_get_temp,
> +	.set_trips =3D loongson2_thermal_set_trips,
> +};

[Severity: High]
Does loongson2_thermal_set_trips() work correctly for the 2K0300 device?

The 2K1000 ADC outputs directly in Celsius + 100 (8-bit), which is what
loongson2_set_ctrl_regs() expects and writes to the threshold registers.

However, the new 2K0300 ADC outputs an 11-bit raw value mapped via
(raw_adc + offset) * 570 - 394700. By reusing the legacy .set_trips callbac=
k,
the 2K0300 writes the 8-bit Celsius + 100 value to hardware, fundamentally
mismatching the 11-bit raw scale the comparator requires.

Could this cause incorrect hardware thermal limits or missed interrupts for
the 2K0300?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789546118.gi=
t.zhoubinbin@loongson.cn?part=3D4
