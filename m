Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586672;
	b=C6ZNItJ5SfJkBQ/zxx80waflXNdVUPopx8uMbTwBf3APxP9cI0T7p3yq6dB+747WGMZ1
	 wgWKx55Gtr2p0jLWnAjpasAjCU6wx0wNnY+hbOnvxViiUv3Y3zsfIFSMYv/cCE0NS6YeD
	 njd4WF45Uvu0t1OHjKLx+x/NsS8N6vw51CeueHVFktJaW7w/OpziKs5aPyajU1WKo9Vbx
	 msFO8g//nwh5kFhf3aKeISu/CxFikp9LtQcrLsaaDwuaPimrcJrOyqjBJiIp0C4a1A453
	 VeG3AlGC+KaI2RtDWfKUS2/Zys4zt6S+3mcmXMZiMJy9zHBPSFtW4xJCrVUKZZZfBsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XGQN4DXGWRGJcgWMfJJBUqOhRGyOmLvxpiD0u4nXOT0=;
	b=GeOtiQ5m0JclrCgcr2kbFPGWARZ3XxXiB0a0uN8+pHBUkjZKSvuAR0CyfcKnrC33APph
	 Z2/tq4IU3MWpn8wg6wROzyaehj3MwkqVzxan92PMKaPE4sEy1G8LRHIJ/8wUpQOstwLJu
	 Sxz0Tg33UzwDw08doFtj0WUkzlgcvOQsOsnhsma3heIwtABX888ixig8iMFR+n7mv5ctd
	 cALKsPkmFA23pSh4Hfor9OVegPElcxp8ci8yHbhmRt2IX4p14jSuv0Mps0j4pkw8Zabco
	 y2jxuBMoRImqaVIaAD4cNOY/ECFlcCY48EDC/JbW1VkK3mXTvPTBS2LpLpmMpwQjwhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G1mYQowl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76078606B2FD
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G1mYQowl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DBB1F000C4;
	Fri, 13 Nov 2026 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586672;
	bh=XGQN4DXGWRGJcgWMfJJBUqOhRGyOmLvxpiD0u4nXOT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G1mYQowl3/5qNGVGgUySrRT8tQzpiJSvqx1xcyef2WlVVo9ZJ08USgnyvUZ2aBQK5
	 wyMezCYpC5gb99J+BhtRg80aGiOZqOm1TBoxUrzkwJl+p4cAN7sUHvIht04NlBXwlG
	 7V7GPvqX7EvMUH3f7APOrBEzI4jy5mfRQWyH+RUA37i5WFfL9tsKR2dn1njp+vOETc
	 Gou3g1zzl+OGQDfVKR7rdaDjupHl7GjKzE3oPIMnCTQt/cHAxBrenJpk7GGppO7NDS
	 kpeZnTbOvQ+vvlyWIeJVfdEszuNv7iVx2mGfFVixASk+c8rGQeB4jlDQGP8DxYsR2Y
	 t2h4Nwi5A5QNw==
Message-ID: <sashiko-outbox-213182@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] iio: adc: qcom-spmi-adc5: Add battery thermal
 channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-bat-temp-adc-v3-1-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
 <20261113-bat-temp-adc-v3-1-743979a8fd90@fairphone.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:17:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] iio: adc: qcom-vadc: unit mismatch in
  qcom_vadc_scale_hw_calib_therm_volt()
--

commit e0ceb603a8d45a55cad2b26a93189eb6391e4af4
Author: Luca Weiss <luca.weiss@fairphone.com>

iio: adc: qcom-spmi-adc5: Add battery thermal channels

This commit adds ADC5_BAT_THERM_30K_PU, ADC5_BAT_THERM_100K_PU, and
ADC5_BAT_THERM_400K_PU voltage channels and the SCALE_HW_CALIB_THERM_VOLT
scaling type for reading battery thermistor voltages.

> diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi=
-adc5.c
> index d57ba8526e0c5..24ac845805705 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5.c
> @@ -542,6 +542,12 @@ static const struct adc5_channels adc5_chans_pmic[AD=
C5_MAX_CHANNEL] =3D {
>  					SCALE_HW_CALIB_DEFAULT)
>  	[ADC5_XO_THERM_100K_PU]	=3D ADC5_CHAN_TEMP("xo_therm", 0,
>  					SCALE_HW_CALIB_XOTHERM)
> +	[ADC5_BAT_THERM_30K_PU]	=3D ADC5_CHAN_VOLT("bat_therm_30k_pu", 0,
> +					SCALE_HW_CALIB_THERM_VOLT)
> +	[ADC5_BAT_THERM_100K_PU] =3D ADC5_CHAN_VOLT("bat_therm_100k_pu", 0,
> +					SCALE_HW_CALIB_THERM_VOLT)
> +	[ADC5_BAT_THERM_400K_PU] =3D ADC5_CHAN_VOLT("bat_therm_400k_pu", 0,
> +					SCALE_HW_CALIB_THERM_VOLT)
>  	[ADC5_BAT_ID_100K_PU]	=3D ADC5_CHAN_TEMP("bat_id", 0,
>  					SCALE_HW_CALIB_DEFAULT)
>  	[ADC5_AMUX_THM1_100K_PU] =3D ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,
> diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-va=
dc-common.c
> index b03cf584b1657..09a13e2b0ef43 100644
> --- a/drivers/iio/adc/qcom-vadc-common.c
> +++ b/drivers/iio/adc/qcom-vadc-common.c
> @@ -309,6 +309,10 @@ static int qcom_vadc_scale_hw_calib_therm(
>  				const struct u32_fract *prescale,
>  				const struct adc5_data *data,
>  				u16 adc_code, int *result_mdec);
> +static int qcom_vadc_scale_hw_calib_therm_volt(
> +				const struct u32_fract *prescale,
> +				const struct adc5_data *data,
> +				u16 adc_code, int *result_mdec);
>  static int qcom_vadc7_scale_hw_calib_therm(
>  				const struct u32_fract *prescale,
>  				const struct adc5_data *data,
> @@ -333,6 +337,7 @@ static int qcom_vadc7_scale_hw_calib_die_temp(
>  static const struct qcom_adc5_scale_type scale_adc5_fn[] =3D {
>  	[SCALE_HW_CALIB_DEFAULT] =3D {qcom_vadc_scale_hw_calib_volt},
>  	[SCALE_HW_CALIB_THERM_100K_PULLUP] =3D {qcom_vadc_scale_hw_calib_therm},
> +	[SCALE_HW_CALIB_THERM_VOLT] =3D {qcom_vadc_scale_hw_calib_therm_volt},
>  	[SCALE_HW_CALIB_XOTHERM] =3D {qcom_vadc_scale_hw_calib_therm},
>  	[SCALE_HW_CALIB_THERM_100K_PU_PM7] =3D {
>  					qcom_vadc7_scale_hw_calib_therm},
> @@ -583,6 +588,17 @@ static int qcom_vadc_scale_hw_calib_therm(
>  				 voltage, result_mdec);
>  }
> =20
> +static int qcom_vadc_scale_hw_calib_therm_volt(
> +				const struct u32_fract *prescale,
> +				const struct adc5_data *data,
> +				u16 adc_code, int *result_uv)
> +{
> +	*result_uv =3D qcom_vadc_scale_code_voltage_factor(adc_code,
> +				prescale, data, 1000);
> +
> +	return 0;
> +}
> +
>  static int qcom_vadc_scale_hw_calib_die_temp(
>  				const struct u32_fract *prescale,
>  				const struct adc5_data *data,
> diff --git a/include/linux/iio/adc/qcom-vadc-common.h b/include/linux/iio=
/adc/qcom-vadc-common.h
> index 3bf4c49726a73..ce037994b0197 100644
> --- a/include/linux/iio/adc/qcom-vadc-common.h
> +++ b/include/linux/iio/adc/qcom-vadc-common.h
> @@ -93,6 +93,8 @@ struct vadc_linear_graph {
>   *	voltage (uV) with hardware applied offset/slope values to adc code.
>   * @SCALE_HW_CALIB_THERM_100K_PULLUP: Returns temperature in millidegC u=
sing
>   *	lookup table. The hardware applies offset/slope to adc code.
> + * @SCALE_HW_CALIB_THERM_VOLT: Returns voltage in uV of a temperature ch=
annel.
> + *	The hardware applies offset/slope to adc code.

[Severity: Low]
Is there a unit mismatch in qcom_vadc_scale_hw_calib_therm_volt() and the
new ADC5_CHAN_VOLT channels?

qcom_vadc_scale_code_voltage_factor() computes microvolts and divides by
factor, so passing factor =3D 1000 returns integer millivolts rather than
microvolts:

drivers/iio/adc/qcom-vadc-common.c:qcom_vadc_scale_code_voltage_factor() {
    ...
	/* (ADC code * vref_vadc (1.875V)) / full_scale_code */
	voltage =3D (s64) adc_code * adc_vdd_ref_mv * 1000;
	voltage =3D div64_s64(voltage, data->full_scale_code_volt);
	if (voltage > 0) {
		voltage *=3D prescale->denominator;
		temp =3D prescale->numerator * factor;
		voltage =3D div64_s64(voltage, temp);
    ...
}

However, the kernel-doc for SCALE_HW_CALIB_THERM_VOLT and the definition of
qcom_vadc_scale_hw_calib_therm_volt() state that the result is in uV
(result_uv), while its forward declaration names the parameter result_mdec.
In addition, all other ADC5_CHAN_VOLT channels in adc5_chans_pmic use
SCALE_HW_CALIB_DEFAULT (qcom_vadc_scale_hw_calib_volt(), which passes
factor =3D 1) and return microvolts, so returning integer millivolts here
creates a 1000x unit inconsistency across ADC5_CHAN_VOLT channels and
truncates sub-millivolt precision.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-bat-temp-a=
dc-v3-0-743979a8fd90@fairphone.com?part=3D1
