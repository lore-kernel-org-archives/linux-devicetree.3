Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011365;
	b=1i9pHSuEOQHmPI7Pd5ykEVYSHnXyRFB6wo5D4VoFIzVdIyZibMsLe8tNqBA2UyaAXbPw
	 YZJrvWrZKWk/4Ef5iclYHpjySTeran+wb8yJ/6Nqj/bbohXWWZTSEcpwFx/lkrSHBYO49
	 IpnIrQNA71gacT8I4gCDeJQiov69VUppP7+9c8Sgjax9/SHuCHVOT3I/Uplq5Td5DDimy
	 nrZGFEv/T7GY4UVglKUGbL3phvNjzc51JI/BwPCGmixk5YV442FHx/Abyrz2/kZSPiBy7
	 JNhdqs579IFQqhMFfqUM2Og1du5tuFofe/j/JwynNLAvrzFEOt+nRfpyJ7fyHHycj4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011365;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bkf7PJBjbm1DRTPFHGTmhJ7h4suHTfNTgn4IGz4yvkQ=;
	b=1/hbb6609d6ZGeUHefkaW5nHbxUCQso8nREyOoyOCVuFt43Ldj/yN+Fud7lNMyYj+P0X
	 QphVELEyIIrxqlrgTt/PsbYj1n3+BJ3iIxKqszRFapTiE8mW6FsSrvfVByJSmigYDHxav
	 GznW0/O2xbqgepCWPE+SnEHmcmzY0rTppCDxwtPlAZlDobnR2u/YYXaoCet7CVAdDq7Sh
	 Eun94CxbhUvd5IUji4tEzU+4iGVzm7oXIj274PJI4Z9wWvNfdcvdP23l0lyMcgMwJ3oyW
	 CYgjrdHlirAzRPgn0Jau5kYzePuKdbbwMhxJRQFlWg9F8wPMH9nE43VM91FsNrK3oVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrQgoat4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E38A606A338
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrQgoat4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90EB1F000C4;
	Wed, 18 Nov 2026 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795011365;
	bh=bkf7PJBjbm1DRTPFHGTmhJ7h4suHTfNTgn4IGz4yvkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JrQgoat4lEoOcNzxwsooox7QYmB4yrFIHdGCOKd1V1rLSchFdtFuysprQ1Zf99z3x
	 DI60dePSIvn5AejjCq4tWpw3fJwqvSmjKPLTNp0hF/bza+zkROuhX+vEJPFYkb0VuX
	 nd6HuOXrUQ20fUd89lkpZ1u+F0jDmmA7moUuSOHbcpDXX3ao2GOtBocBOoHzZkrnEP
	 +IGi1orurZxhdB4/5mC4XzAO0MKu+V++mJuTM9qDQJs4nqANKE0KuZqhep6KkmBrNm
	 U1lT1V3yRpFMavV4z8qOCrBqouLAB4LE+xIvaHlEaQhk5+G/RlTfv1FWyWg1+mS7BN
	 ROhTOYbmn+2iw==
Message-ID: <sashiko-outbox-221175@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] thermal: samsung: acpm-tmu: add Exynos850
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-3-19848c0d97e5@linaro.org>
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
 <20261118-acpm-tmu-e850-support-v2-3-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:16:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] thermal: samsung: acpm-tmu: uncoordinated global CORE_EN in
  exynos850_tz_control()
- [Medium] thermal: samsung: acpm-tmu: zero temp_error2 fallback in
  exynos850_tmu_read_trim_info()
- [Low] thermal: samsung: acpm-tmu: guard() mixed with goto in
  exynos850_tmu_update_thresholds()
--

commit 4f3f530f809e63acf5e867e3d286ccbbbdd52053
Author: Alexey Klimov <alexey.klimov@linaro.org>

thermal: samsung: acpm-tmu: add Exynos850 support

This commit adds Exynos850 SoC support to the ACPM TMU driver using a mix of
ACPM IPC commands and direct MMIO register access for initialization,
threshold configuration, interrupt handling, and thermal zone control.

> diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung=
/acpm-tmu.c
> index 0def0ec090841..054c99dc8250c 100644
> --- a/drivers/thermal/samsung/acpm-tmu.c
> +++ b/drivers/thermal/samsung/acpm-tmu.c
> @@ -27,6 +28,120 @@
>  #define EXYNOS_TMU_SENSOR(i)		BIT(i)
>  #define EXYNOS_TMU_SENSORS_MAX_COUNT	16
> =20
> +/*
> + * Exynos850 TMU calibration type stored in the TRIMINFO CALIB_SEL field.
> + * Only two-point calibration needs special handling; anything else is
> + * treated as one-point calibration.
> + */
> +#define EXYNOS850_TMU_CAL_TWO_POINT	1
> +
> +#define EXYNOS850_TMU_TRIM_TEMP_25C	25
> +#define EXYNOS850_TMU_TRIM_TEMP_85C	85
> +#define EXYNOS850_TMU_EFUSE_VALUE	55

[ ... ]

> +/* TRIMINFO fields */
> +#define EXYNOS850_TMU_TRIMINFO_CALIB_SEL	BIT(23)
> +#define EXYNOS850_TMU_TRIMINFO_25C_MASK		GENMASK(8, 0)
> +#define EXYNOS850_TMU_TRIMINFO_85C_MASK		GENMASK(17, 9)

[ ... ]

> @@ -158,6 +311,190 @@ static int gs101_tmu_init(struct acpm_tmu_priv *pri=
v)
>  	return handle->ops->tmu.init(handle, priv->mbox_chan_id);
>  }
> =20
> +static int exynos850_tz_control(struct acpm_tmu_sensor *sensor, bool on)
> +{
> +	struct acpm_tmu_priv *priv =3D sensor->priv;
> +
> +	return regmap_update_bits(priv->regmap, EXYNOS850_TMU_REG_CONTROL,
> +				  EXYNOS850_TMU_CONTROL_CORE_EN,
> +				  on ? EXYNOS850_TMU_CONTROL_CORE_EN : 0);
> +}

[Severity: High]
Does toggling EXYNOS850_TMU_CONTROL_CORE_EN per sensor without controller-w=
ide
coordination disable the shared TMU core across all three Exynos850 thermal
zones?

All three groups in exynos850_sensor_groups share the single global
EXYNOS850_TMU_CONTROL_CORE_EN bit, while sensor->enabled and sensor->lock a=
re
per-sensor.  Disabling one thermal zone via acpm_tmu_change_mode() clears
EXYNOS850_TMU_CONTROL_CORE_EN globally and stops temperature sensing and
interrupts for the remaining active zones.

In addition, exynos850_tmu_update_thresholds() only checks sensor->enabled =
and
holds sensor->lock before toggling EXYNOS850_TMU_CONTROL_CORE_EN.  During
acpm_tmu_probe(), registering sensor 1 after sensor 0 is already enabled
updates EXYNOS850_TMU_REG_THD and EXYNOS850_TMU_REG_INTEN while
EXYNOS850_TMU_CONTROL_CORE_EN is active, and concurrent trip updates on two
enabled zones race on CORE_EN:

CPU0 (sensor 0)                   CPU1 (sensor 1)
exynos850_tmu_update_thresholds()
  lock(&sensor0->lock)
  acpm_tmu_op_tz_control(false)
    /* clears global CORE_EN */
                                  exynos850_tmu_update_thresholds()
                                    lock(&sensor1->lock)
                                    acpm_tmu_op_tz_control(false)
  ...
  acpm_tmu_op_tz_control(true)
    /* sets global CORE_EN */
                                    regmap_update_bits(..., REG_THD, ...)
                                      <-- programs thresholds with CORE_EN =
set

> +
> +static int exynos850_tmu_read_trim_info(struct acpm_tmu_priv *priv)
> +{
> +	struct regmap *regmap =3D priv->regmap;
> +	unsigned int trim_info;
> +	int i, ret;
> +
> +	ret =3D regmap_read(regmap, EXYNOS850_TMU_TRIMINFO_OFFSET(0), &trim_inf=
o);
> +	if (ret)
> +		return ret;
> +
> +	priv->cal_type =3D FIELD_GET(EXYNOS850_TMU_TRIMINFO_CALIB_SEL, trim_inf=
o);
> +
> +	for (i =3D 0; i < priv->num_sensors; i++) {
> +		struct acpm_tmu_sensor *sensor =3D &priv->sensors[i];
> +		unsigned long mask =3D sensor->group->mask;
> +		int t;
> +
> +		for_each_set_bit(t, &mask, EXYNOS_TMU_SENSORS_MAX_COUNT) {
> +			u16 temp_error1, temp_error2;
> +
> +			ret =3D regmap_read(regmap, EXYNOS850_TMU_TRIMINFO_OFFSET(t),
> +					  &trim_info);
> +			if (ret)
> +				return ret;
> +
> +			temp_error1 =3D FIELD_GET(EXYNOS850_TMU_TRIMINFO_25C_MASK,
> +						trim_info);
> +			temp_error2 =3D FIELD_GET(EXYNOS850_TMU_TRIMINFO_85C_MASK,
> +						trim_info);
> +
> +			if (temp_error1)
> +				sensor->temp_error1 =3D temp_error1;
> +			else
> +				sensor->temp_error1 =3D
> +					FIELD_GET(EXYNOS850_TMU_TRIMINFO_25C_MASK,
> +						  priv->data->efuse_value);
> +
> +			if (priv->cal_type !=3D EXYNOS850_TMU_CAL_TWO_POINT)
> +				continue;
> +
> +			if (temp_error2)
> +				sensor->temp_error2 =3D temp_error2;
> +			else
> +				sensor->temp_error2 =3D
> +					FIELD_GET(EXYNOS850_TMU_TRIMINFO_85C_MASK,
> +						  priv->data->efuse_value);
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does the fallback for sensor->temp_error2 always evaluate to 0?

priv->data->efuse_value is EXYNOS850_TMU_EFUSE_VALUE (55, or 0x37), so
extracting EXYNOS850_TMU_TRIMINFO_85C_MASK (GENMASK(17, 9)) yields 0.  When
two-point calibration is selected and the 85C trim field in TRIMINFO is 0,
sensor->temp_error2 becomes 0 and exynos850_temp_to_code() computes
(sensor->temp_error2 - sensor->temp_error1) with a negative slope, producing
bogus threshold codes in exynos850_tmu_update_thresholds().

[ ... ]

> @@ -246,6 +583,90 @@ static int acpm_tmu_get_temp(struct thermal_zone_dev=
ice *tz, int *temp)
>  	return 0;
>  }

[ ... ]

> +static int exynos850_tmu_update_thresholds(struct acpm_tmu_sensor *senso=
r,
> +					   u8 thresholds[2], u8 inten)
> +{
> +	struct acpm_tmu_priv *priv =3D sensor->priv;
> +	unsigned long mask =3D sensor->group->mask;
> +	bool was_enabled;
> +	int ret =3D 0, restore_ret, i, trip_code, trip_code_low;
> +	u32 addr;
> +
> +	guard(mutex)(&sensor->lock);
> +
> +	was_enabled =3D sensor->enabled;
> +
> +	if (was_enabled) {
> +		ret =3D acpm_tmu_op_tz_control(sensor, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	trip_code =3D exynos850_temp_to_code(sensor, thresholds[1]);
> +	trip_code_low =3D exynos850_temp_to_code(sensor, thresholds[0]);
> +
> +	for_each_set_bit(i, &mask, EXYNOS_TMU_SENSORS_MAX_COUNT) {
> +		u32 irq_en =3D 0;
> +
> +		if (inten & BIT(0)) {
> +			addr =3D EXYNOS850_TMU_REG_THD(i) +
> +			       EXYNOS850_TMU_THD_FALL1_OFFSET;
> +			ret =3D regmap_update_bits(priv->regmap, addr,
> +						 EXYNOS850_TMU_THD_LEVEL1_MASK,
> +						 FIELD_PREP(EXYNOS850_TMU_THD_LEVEL1_MASK,
> +							    trip_code_low));
> +			if (ret)
> +				goto out_restore;
> +			irq_en =3D EXYNOS850_TMU_INTEN_FALL1;
> +		}
> +
> +		if (inten & BIT(1)) {
> +			addr =3D EXYNOS850_TMU_REG_THD(i) +
> +			       EXYNOS850_TMU_THD_RISE1_OFFSET;
> +			ret =3D regmap_update_bits(priv->regmap, addr,
> +						 EXYNOS850_TMU_THD_LEVEL1_MASK,
> +						 FIELD_PREP(EXYNOS850_TMU_THD_LEVEL1_MASK,
> +							    trip_code));
> +			if (ret)
> +				goto out_restore;
> +			irq_en |=3D EXYNOS850_TMU_INTEN_RISE1;
> +		}
> +
> +		ret =3D regmap_update_bits(priv->regmap, EXYNOS850_TMU_REG_INTEN(i),
> +					 EXYNOS850_TMU_INTEN_FALL1 |
> +					 EXYNOS850_TMU_INTEN_RISE1, irq_en);
> +		if (ret)
> +			goto out_restore;
> +	}
> +
> +out_restore:
> +	if (was_enabled) {
> +		restore_ret =3D acpm_tmu_op_tz_control(sensor, true);
> +		if (restore_ret) {
> +			dev_err(priv->dev, "Failed to restore sensor state: %d\n",
> +				restore_ret);
> +			if (!ret)
> +				ret =3D restore_ret;
> +		}
> +	}
> +
> +	return ret;
> +}

[Severity: Low]
This isn't a bug, but exynos850_tmu_update_thresholds() mixes
guard(mutex)(&sensor->lock) with goto out_restore.  Using break inside the
for_each_set_bit() loop would avoid mixing scope-based cleanup with goto
error handling.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-acpm-tmu-e=
850-support-v2-0-19848c0d97e5@linaro.org?part=3D3
