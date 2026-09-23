Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FD953445D
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180048; cv=none; b=M0CASG/dSVA42wXC64WJRo9pGRsIY4QY0gyeVIGBqmNxo+acFW5KL62Zm2Yvg4Du4cdkwExdqx1c4Z6wYdRu2zDHB2hdD31pKh0QGAoaKR1wtKnkQ9OL4Cvq7xI6xNJFD8mqoV1/iX3u/c+kwAOKXrCOghToeXHFMNAZk86mFBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180048; c=relaxed/simple;
	bh=LA+TZNcsxNoCaHmurQJZgkQulZFuien0k1bbk5sj178=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hKfak1j5BxvydRvjPoHvk5lZnJu0Jy68V7xreoendLjNnzCOISmNLrUpIQRcxRJb5cksNItcKtybnnnMid/ANsADgyiHrflZ5KVIl9V6x+4CMgx8xKT9Uw+TrzpKBXSl2DyKD19Tdetbr3lUaVVPk3LesX5RIBjJZaQl5l21VTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HY4oPiQe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HY4oPiQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD371F000FF;
	Wed, 23 Sep 2026 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790180046;
	bh=El7IfjDsY7EkJNmDY1uH2K89jVJIYBj4hOg/J3OexzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HY4oPiQe6Wf54Rr0tj6JsYBB/vAAYka0jv56mtziesdLgj/bB0wPDYa5MV2dP2RPy
	 btV+i/NaEb0eWONwTC4RP/yPleaJ1PJpGnRYTGoQGcco9jdIxjvV7StNom5WuOHuwv
	 aPD2NbSNDrHMxxtakOCu1sy/KvfgqwauT5Vg2Ax4ZAlzQvY+4w9ee+bA1Lf3PRgQF4
	 oT3l0HNGRYIxlVlsar/nK7xujKUuE8ewVYDz43KrHHcSdPGw58TFqDFqtoPehjPNRI
	 4GwQmkY9u4OtFqZWa0fg1XZ+GDw38MxC7dWFYS3maKedGouL5sjKx665hFhK2efWYe
	 TyQ9dlGL6vmrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/14] iio: adc: stm32-adc: add support for stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923-adc-stm32mp25-v1-v2-7-46bc019537c6@foss.st.com>
References: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
 <20260923-adc-stm32mp25-v1-v2-7-46bc019537c6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 16:14:05 +0000
Message-Id: <20260923161405.CFD371F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: adc: stm32-adc: DIFSEL and CFGR writes fail silently when ADE=
N=3D1
--

commit 100a3f1abe7bc0887c43d25f1c79c051b323c2a8
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

iio: adc: stm32-adc: add support for stm32mp25

This commit adds support for the ADC on the STM32MP25 SoC. It introduces new
hardware configurations, trigger lists, and a dedicated software calibration
procedure for the new SoC.

> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index eecdc4cce1b4b..a5bffc09898ba 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c

[ ... ]

> @@ -1304,6 +1437,184 @@ static void stm32h7_adc_unprepare(struct iio_dev =
*indio_dev)
>  	stm32h7_adc_enter_pwr_down(adc);
>  }
> =20
> +/*
> + * STM32MP25 offset calibration software procedure. Basically the calibr=
ation routine is

[ ... ]

> +static int stm32mp25_adc_calib(struct iio_dev *indio_dev)
> +{
> +	struct stm32_adc *adc =3D iio_priv(indio_dev);
> +	bool add_offset =3D false;
> +	bool diff_below_zero;
> +	u32 average, calfact;
> +	int ret;
> +
> +	stm32_adc_set_bits(adc, STM32H7_ADC_CR, STM32H7_ADCAL);
> +	/* Use default resolution (e.g. 12 bits) */
> +	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR, STM32MP25_RES_MASK);

[Severity: High]
Does this clear the resolution bits correctly?

Since stm32h7_adc_enable() was already called in stm32mp25_adc_prepare(), A=
DEN
is set to 1. On STM32 ADCs, configuration registers like CFGR are locked by
hardware when the ADC is enabled, so this write might be silently ignored.

This could cause calibration to run at the wrong resolution if a non-default
resolution was configured by the user.

[ ... ]

> +static int stm32mp25_adc_prepare(struct iio_dev *indio_dev)
> +{
> +	struct stm32_adc *adc =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D stm32h7_adc_exit_pwr_down(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Must enable the ADC before running software-assisted calibration */
> +	ret =3D stm32h7_adc_enable(indio_dev);
> +	if (ret)
> +		goto pwr_dwn;
> +
> +	/* Always run offset calibration */
> +	ret =3D stm32mp25_adc_calib(indio_dev);
> +	if (ret)
> +		goto adc_dis;
> +
> +	stm32_adc_int_ch_enable(indio_dev);
> +
> +	stm32_adc_writel(adc, adc->cfg->regs->difsel.reg, adc->difsel);

[Severity: High]
Will this configuration of differential channels be silently ignored?

The ADC is already enabled (ADEN=3D1) from the earlier call to
stm32h7_adc_enable(). Hardware locking prevents writes to DIFSEL while the
ADC is enabled, which would leave the channels configured as single-ended.

> +
> +	if (adc->cfg->has_presel)
> +		stm32_adc_writel(adc, STM32H7_ADC_PCSEL, adc->pcsel);
> +
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-adc-stm32m=
p25-v1-v2-0-46bc019537c6@foss.st.com?part=3D7
