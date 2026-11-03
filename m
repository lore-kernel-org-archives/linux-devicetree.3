Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691796;
	b=AOXZ8mXNgtRwnAUZyb4rzwux1u3OmjSh9zqiH89GCV2yfExIOc94czqLtMmuRCb+qCXc
	 ogQmNNVtTV/MTp31Jpd3YDIl13s+jbSL+H8LZAjDlpNbfRSE3Tx09Gx3qiTVoYBeOvNnb
	 fyP4EhWOr3n4W0fmm1eYfoL3N481olojlOmc6Dq28Sfu64IonpvHrAQuEy/lOcnJr15F5
	 R+dGOBvQ+ubPzPztpUX5DkZxftvzXK+mNyW6ybC/qWjMWTKvwifS0mE/Erqp0S9MJf82j
	 qB2L9YVW3yh4G+8hWjgwN/JSa0uL+a/3ys1KiU6GL2IVDthuMyC2Qm64h8J9fu7XzCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691796;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G6SxuhRmek6l6SMS2NrKxZ9uvRsXUAnWLaSUDEjxtJ8=;
	b=ktcN1LHvixPXwJBzum5dmhBcXZkn0NYaQqK6ktSq51qa5oH9FfHgmJsj6ax8KffNcviF
	 gyjU/TPTkeIDUEnw/jVnlzfWkfP+KVNuWQqRosU4XHJfA0LUvZbytygVeIFLqvQH1/y5I
	 hX1OLfSQR7l/Psdv7FXokG7sV1xlWI28eyiOUg2D4STK+45i8h8KnkfKcp0se9x8MEoSw
	 jbjOc/xw5IUVNiAOVYS9lFsnsg1wpGBVceaC/Jzbp9PAGvZ0StbR74EThHHnyO1V21oTd
	 AvZss8p7MXc1+EoZsWVc9JZBdu2leH1lDxTc+ZF2TFswJYxkitPw4VqGiWvLJrvvnnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBLsG6l3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF907606A33B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBLsG6l3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2981F00A1B;
	Tue,  3 Nov 2026 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691795;
	bh=G6SxuhRmek6l6SMS2NrKxZ9uvRsXUAnWLaSUDEjxtJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IBLsG6l3oQzumIhcdWJM86Y0RKSR36FdsL3RT2pQWkIty+eI2hOk7sCR3T8LAlKPH
	 GMgnWL1x4SW5mFUtYfG+VhKBasWaUJPdEXojKqD5Y7agr6WFZkvro01oI6EPa1P8XA
	 ASxbx5b6oSUEL1orHN3rDjva2xcKy0O9sXmRpxYKFzJbfGtFZjPgchs4RqUexQFy6Z
	 5ZVosxIsYbBPEbAKEmxYxEwiR2XtM+l4xmLbP7U5L7bPGpwIks+leSq+UD53NOGgj5
	 Ms1BDvxSzHPsl9jV9Jqkb0D8shPF2/jcotxXDHq7Ut5vWdHw83Pjdwi5WDoXY59NVf
	 omgx2m2c9b1aA==
Message-ID: <sashiko-outbox-194729@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/7] thermal/drivers/loongson2: Add Loongson-2K0300
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <b36f79d7d130f5068620ceb224fcdfb4cde49b16.1793690276.git.zhoubinbin@loongson.cn>
References: <cover.1793690276.git.zhoubinbin@loongson.cn>
 <b36f79d7d130f5068620ceb224fcdfb4cde49b16.1793690276.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 07:43:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] thermal/drivers/loongson2: missing MFD_SYSCON dependency in Kcon=
fig
- [Medium] thermal: loongson2: missing ADC delay in ls2k0300_thermal_hw_ini=
t()
--

commit 10dff186e720aacd669123374d9a7f0a467f16da
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Add Loongson-2K0300 support

This commit adds thermal sensor support for the Loongson-2K0300 SoC, reading
calibration offsets from the CHIP ID syscon registers and falling back to an
old-fuse slope when the calibrated temperature falls outside the valid rang=
e.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index d83aaa588c485..0a9d039c9ab8c 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c

[ ... ]

> @@ -83,6 +118,101 @@ static int loongson2_thermal_set_trips(struct therma=
l_zone_device *tz, int low,
>  	return 0;
>  }
> =20
> +static int ls2k0300_thermal_adc_to_temp_mc(struct loongson2_thermal_data=
 *data, int slope)
> +{
> +	int raw_adc;
> +
> +	raw_adc =3D FIELD_GET(LOONGSON2_THSENS_OUT_11B_MASK,
> +			    readl(data->ctrl_reg + LOONGSON2_THSENS_OUT_REG));
> +
> +	return (raw_adc + data->calib_offset) * slope - LS2K0300_TEMP_OFFSET;
> +}

[ ... ]

> +static void ls2k0300_thermal_detect_old_fuse(struct device *dev,
> +					     struct loongson2_thermal_data *data)
> +{
> +	int temp;
> +
> +	temp =3D ls2k0300_thermal_adc_to_temp_mc(data, LS2K0300_TEMP_SLOPE);
> +
> +	if (temp < LOONGSON2_LOWEST_VALID_TEMP ||
> +	    temp > LOONGSON2_HIGHEST_VALID_TEMP) {
> +		dev_warn(dev, "calibrated temperature %d mC out of range [%d, %d], usi=
ng old fuse formula",
> +			 temp, LOONGSON2_LOWEST_VALID_TEMP, LOONGSON2_HIGHEST_VALID_TEMP);
> +		data->flags =3D LS2K0300_UNCALIBRATED_FLAG;
> +		data->calib_offset =3D 0;
> +	}
> +}

[ ... ]

> +static int ls2k0300_thermal_hw_init(struct platform_device *pdev,
> +				    struct loongson2_thermal_data *data)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	data->regmap_cfg =3D syscon_regmap_lookup_by_phandle(dev->of_node, "loo=
ngson,chipid");
> +	if (IS_ERR(data->regmap_cfg))
> +		return PTR_ERR(data->regmap_cfg);

[Severity: Medium]
In drivers/thermal/loongson2_thermal.c, ls2k0300_thermal_hw_init()
unconditionally calls syscon_regmap_lookup_by_phandle(). When
CONFIG_MFD_SYSCON is not enabled, the stub in include/linux/mfd/syscon.h
returns ERR_PTR(-ENOTSUPP), causing loongson2_thermal_probe() to fail at
runtime on Loongson-2K0300.

Neither LOONGSON2_THERMAL in drivers/thermal/Kconfig nor LOONGARCH in
arch/loongarch/Kconfig selects or depends on MFD_SYSCON:

drivers/thermal/Kconfig:
    config LOONGSON2_THERMAL
        tristate "Loongson-2 SoC series thermal driver"
        depends on LOONGARCH || COMPILE_TEST
        depends on OF

Should LOONGSON2_THERMAL select MFD_SYSCON in Kconfig?

> +
> +	ret =3D ls2k0300_thermal_read_calib(data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read calibration data");
> +
> +	writel(LS2K0300_THSENS_INIT_MASK, data->ctrl_reg + LS2K0300_THSENS_CFG_=
REG);
> +
> +	ls2k0300_thermal_detect_old_fuse(dev, data);

[Severity: Medium]
As reported by Sashiko on v7 [1], in drivers/thermal/loongson2_thermal.c,
ls2k0300_thermal_hw_init() writes LS2K0300_THSENS_INIT_MASK to
LS2K0300_THSENS_CFG_REG and immediately calls
ls2k0300_thermal_detect_old_fuse() without waiting for the sensor ADC to
finish its initial conversion.

If the sensor was not already enabled prior to probe,
ls2k0300_thermal_detect_old_fuse() -> ls2k0300_thermal_adc_to_temp_mc() can
read a reset or stale value of 0 from LOONGSON2_THSENS_OUT_REG. With
raw_adc =3D=3D 0, any calibration offset of 622 or less produces a temperat=
ure
below LOONGSON2_LOWEST_VALID_TEMP (-40000 mC), permanently setting
LS2K0300_UNCALIBRATED_FLAG and clearing data->calib_offset.

Should there be a delay or readiness check after writing
LS2K0300_THSENS_CFG_REG before reading LOONGSON2_THSENS_OUT_REG?

[1] https://lore.kernel.org/r/93002842dcf01ec651a9711075f5967026b95987.1791=
512067.git.zhoubinbin@loongson.cn

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793690276.gi=
t.zhoubinbin@loongson.cn?part=3D7
