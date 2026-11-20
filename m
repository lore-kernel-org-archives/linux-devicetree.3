Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167318;
	b=i7QYRAce+Pr3yhwZ1dktR7dRrfHJjPpkjFSjS7smvgEYwyDHkL9D5HzSKzM9HjoJjV9e
	 x3Iuri0wApHboi+SdStv89psp7smEj90GrAYiSYOn70CMIoCkKuLFuYm3gE1+5qwBBtxO
	 zzzq+wrzOGN/Q9yJnHWRtX0lI43WB6HagxSz+PXvTKS3ISYZD6ukVvpxM1+/twGqAgef5
	 rVi4az2qNTiUc1IyJZhU24I2a04pwOTBXuCEFX8vG2CfTzEvvnKohudNMq1mJfOBuilBP
	 3xaxxOAKLZaKxiIBiCqAoJquu6imHP/XSvW4ZxCMshgwGch2U4jywuvDmece7BSWMWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167318;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t5cTg1tdM50qiW2AeimmxqsuB8uLI2nbdilEGqZ239g=;
	b=09b1AJ37d7jsS3CjPB0U8ibeD6oQhq0MtVlkpY1xKLCgu9bOcyYr0KOXo1voYiNx0lZ/
	 dPdKt+KtwFIHQYVLdxrSytZkk5OIQ6wS231wbORHSFGo2beWljKi2QmXcQYPlcTrYvmXI
	 6/3fm8XgZd2JS4lpRjcZiMTbN3HRpGrV2bK5lcqSWSnfWBrNTF3CTfmlNHSUeYcN1UmGR
	 7LXjg/SyW3kl3sG4efepXjf7vO1vbEvZg7/0fCgkSe4YGk4y4EB0N0Ye8VKVjx9ezOucO
	 SZ9VWlzmiJgpVLtXW0QEeN0CxHTlHzfH0iYHvAlaSvr/47fjpfc0O2abqaJNCONIaEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ds01z1IV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF51606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ds01z1IV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3CB1F000C4;
	Fri, 20 Nov 2026 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167318;
	bh=t5cTg1tdM50qiW2AeimmxqsuB8uLI2nbdilEGqZ239g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ds01z1IVvQNF3LH8MJIJD+hbGjo4l2dlYjcbNU2eiauDofyObr0LwJLqMJnDf6cXR
	 EveTPItfdMD3VsVDuCpBA0BX2R21tDVOLhm24ZGLTJ5RCVESEb9QM24iX0pXrfoiz9
	 NI4TVG7BEEVuwmJbV1ZxTLf6Ou30akHUIfiDIcgiSblh8QWFozbz7zgKjiap9SFZbf
	 mbwYhoSCc1BlLy4vwaFDMYv+yyL1rD5KXOjOrmRZGinihmFgUKc4dyX+fYzoVU6wAY
	 L5v2mK5en6Hvq+z6epYR/bn1ij411FuZd8b09Ql7IrwieFAKpapVWwRPMoopoXR6Jj
	 DrvuUugMBMWPQ==
Message-ID: <sashiko-outbox-224862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] iio: adc: qcom-spmi-adc5-gen3: Add support for
 QCOM PMIC5 Gen4 ADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-pmic5_gen4_adc-v2-3-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
 <20261120-pmic5_gen4_adc-v2-3-94d0e1fd6847@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:35:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] iio: adc: 32-bit overflow in
  qcom_adc5_gen4_scale_hw_calib_therm()
- [Medium] iio: adc: missing DIV20 channel entries in
  adc5_gen4_chans_pmic
--

commit d8180ae08a5ad388d0cacd9d70b18ca28f1e95bb
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

iio: adc: qcom-spmi-adc5-gen3: Add support for QCOM PMIC5 Gen4 ADC

This commit adds support for PMIC5 Gen4 ADC channels, including 16-bit
ratiometric thermistor scaling, a per-channel qcom,adc5-gen4 DT property,
and extended SPMI bus index and SID addressing.

> diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom=
-spmi-adc5-gen3.c
> index be12bb6781cb3..aa06d4d1083ad 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
[ ... ]
> @@ -433,15 +438,60 @@ static const struct adc5_channels adc5_gen3_chans_p=
mic[ADC5_MAX_CHANNEL] =3D {
>  					SCALE_HW_CALIB_THERM_100K_PU_PM7)
>  };
> =20
> +static const struct adc5_channels adc5_gen4_chans_pmic[ADC5_MAX_CHANNEL]=
 =3D {
> +	[ADC5_GEN4_OFFSET_REF]		=3D ADC5_CHAN_VOLT(0, SCALE_HW_CALIB_DEFAULT)
> +	[ADC5_GEN4_1P25VREF]		=3D ADC5_CHAN_VOLT(0, SCALE_HW_CALIB_DEFAULT)
> +	[ADC5_GEN4_VPH_PWR]		=3D ADC5_CHAN_VOLT(1, SCALE_HW_CALIB_DEFAULT)
> +	[ADC5_GEN4_VBAT_SNS_QBG]	=3D ADC5_CHAN_VOLT(1, SCALE_HW_CALIB_DEFAULT)
> +	[ADC5_GEN4_DIE_TEMP]		=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_PMIC_THERM_P=
M7)
> +	[ADC5_GEN4_AMUX1_THM_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THER=
M_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX2_THM_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THER=
M_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX3_THM_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THER=
M_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX4_THM_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THER=
M_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX5_THM_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THER=
M_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX6_THM_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THER=
M_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX1_GPIO_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THE=
RM_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX2_GPIO_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THE=
RM_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX3_GPIO_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THE=
RM_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX4_GPIO_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THE=
RM_100K_PU_GEN4)
> +	[ADC5_GEN4_AMUX5_GPIO_100K_PU]	=3D ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THE=
RM_100K_PU_GEN4)
> +};

[Severity: Medium]
Should adc5_gen4_chans_pmic[] include entries for ADC5_GEN4_USB_SNS_DIV20
(0x11) and ADC5_GEN4_VIN_DIV20_MUX (0x12)?

Both macros are added in include/linux/iio/adc/qcom-adc5-gen3-common.h
(matching ADC5_GEN3_USB_SNS_V_16 and ADC5_GEN3_VIN_DIV16_MUX in
adc5_gen3_chans_pmic[]), but without entries here their info_mask remains
0 and adc5_gen3_get_fw_channel_data() rejects those channels with -EINVAL,
failing probe.

[ ... ]

> diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-va=
dc-common.c
> index b03cf584b1657..5c4052f6f24fd 100644
> --- a/drivers/iio/adc/qcom-vadc-common.c
> +++ b/drivers/iio/adc/qcom-vadc-common.c
[ ... ]
> @@ -556,6 +561,31 @@ static int qcom_vadc7_scale_hw_calib_therm(
>  	return 0;
>  }
> =20
> +static int qcom_adc5_gen4_scale_hw_calib_therm(
> +				const struct u32_fract *prescale,
> +				const struct adc5_data *data,
> +				u16 adc_code, int *result_mdec)
> +{
> +	s64 resistance =3D adc_code;
> +	int ret, result;
> +
> +	if (adc_code >=3D RATIO_MAX_ADC5_GEN4)
> +		return -EINVAL;
> +
> +	/* (ADC code * R_PULLUP (100Kohm)) / (full_scale_code - ADC code)*/
> +	resistance *=3D R_PU_100K;
> +	resistance =3D div64_s64(resistance, RATIO_MAX_ADC5_GEN4 - adc_code);
> +
> +	ret =3D qcom_vadc_map_voltage_temp(adcmap7_100k, ARRAY_SIZE(adcmap7_100=
k),
> +					 resistance, &result);

[Severity: Medium]
Can resistance overflow the s32 input parameter of
qcom_vadc_map_voltage_temp() when adc_code is between 0xfffc and 0xfffe?

With 16-bit RATIO_MAX_ADC5_GEN4 (0xffff), adc_code values in 65532..65534
yield a 64-bit resistance between 2,184,400,000 and 6,553,400,000, which
exceeds S32_MAX and wraps negative when passed to
qcom_vadc_map_voltage_temp():

drivers/iio/adc/qcom-vadc-common.c:qcom_vadc_map_voltage_temp() {
	...
	while (i < tablesize && pts[i].x > input)
		i++;

	if (i =3D=3D 0) {
		*output =3D pts[0].y;
	} else if (i =3D=3D tablesize) {
		*output =3D pts[tablesize - 1].y;
	...
}

Because every table entry's x is positive, a wrapped negative input
advances i to tablesize and reports the hottest temperature in the table
(+130.048 degC) instead of the coldest (-40.960 degC) on a very cold or
open-circuit thermistor reading, which can trigger false critical thermal
trips.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-pmic5_gen4=
_adc-v2-0-94d0e1fd6847@oss.qualcomm.com?part=3D3
