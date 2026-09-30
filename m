Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36508502545
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779145; cv=none; b=knPVaiRTn2/ky3JVPtVg4TNZLI27AwVAEye3SSr1PEC5i5rU6K6PrWGWfxuLkGNbZUPZcuUOlkUA3IvsuhRZy729et4+imU9QcLGQ1ZhiDkofpIL37cZROPyDv4aJeVi7zi9r5mG05DLpzVkZ7Dpizi/Yl+JFwOT1PnNp1hkuNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779145; c=relaxed/simple;
	bh=9gUqcW2c9c+76/Sf7YFeX4UVAhhMJUdhfOJdgJUwfdg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G6wvStOe07FNL+J8K14VOPTIzC4J/D76WdliVJLPZdROccfehmkuhl7OVNH7HvTsmY3S/FUsIkUxl//Rg7iDrmiQPa3iCHZGW4KEOe23//BJ4fUgFzrQK4d3NES4RkxESKksZgpC4AGWdQ+wF9Vf+LGxSJ3ye7X+uohyKsgideA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzialCLH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzialCLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EF51F000FF;
	Wed, 30 Sep 2026 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790779130;
	bh=zds4mjSOCUMcViNbGJZLTTnoFgHVa14R1H0caecLDPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KzialCLHu0ToKgnqg+u4aZ2z4MamPvETMVIaKvpAnAatQzw75p69wLc5lS1zmFLtl
	 alTiCDw2+0rA9bMutf5IMiNlb4MVI97F50fhp1K4QLIbVdzjkVLOyrZbSNuwy9sQav
	 u840mK8+xyxnWSPfKgD4fNv5MopNI5i7VCfrqOncd+RfSuqz1lxy6OtV3h1AWKsxO/
	 3ir0Ux5ls76v0KORhVwhdDiDPAXn3c6qRdTp5KlHRBFizYbLrV3JSZUXFrRCYArs/e
	 cpMnEJlFsL1+mlda+S3zFdd6p3KMXV1F5Q6M1L4R4hRxwynNlG1hOHhYKn0NW50g5w
	 g9msJndIjIcqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/15] iio: adc: stm32-adc: add support for stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-8-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
 <20260930-adc-stm32mp25-v1-v3-8-406834430d72@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:38:49 +0000
Message-Id: <20260930143850.42EF51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] iio: adc: stm32-adc: DIFSEL write ignored while ADC is enabled
- [Medium] iio: adc: stm32-adc: incorrect internal channel sampling time fo=
r mp25
- [Medium] iio: adc: stm32-adc: missing ADSTP before ADDIS on calibration t=
imeout
- [Low] iio: adc: stm32-adc: implicit subtraction via mask truncation in ca=
libration
--

commit 58980c1da40c7a3d68e78bec0a436a1487c49820
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: iio: adc: stm32-adc: add support for stm32mp25

This commit adds support for the ADC on the STM32MP25 SoC, which features
three ADCs split into two blocks. It introduces diversity regarding IRQs,
clocks, software calibration, internal voltage channels, sampling time,
and trigger lists. A dedicated compatible is used to handle these
differences relative to other STM32 ADCs.

> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index c1979f1f17385..33e41505b2e99 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
[ ... ]
> +static int stm32mp25_adc_calib_get_average_data(struct iio_dev *indio_de=
v, u32 *average)
> +{
[ ... ]
> +	for (unsigned int i =3D 0; i < STM32MP25_CALIB_LOOP; i++) {
> +		int ret;
> +		u32 val;
> +
> +		stm32_adc_set_bits(adc, STM32H7_ADC_CR, STM32H7_ADSTART);
> +		ret =3D stm32_adc_readl_poll_timeout(STM32H7_ADC_CR, val,
> +						   !(val & (STM32H7_ADSTART)),
> +						   100, STM32_ADC_TIMEOUT_US);
> +		if (ret) {
> +			dev_err(&indio_dev->dev, "calibration average error %d\n", ret);
> +			return ret;
> +		}

[Severity: Medium]
If the hardware takes too long and triggers the polling timeout here,
will the ADC become permanently wedged?

When this times out, ADSTART remains 1. The error path bubbles up to
stm32mp25_adc_prepare() and branches to the adc_dis label, calling
stm32h7_adc_disable(). Since ADSTART is still set, attempting to set ADDIS
without first stopping the conversion (by setting ADSTP) causes the hardware
to ignore the ADDIS command.

The polling loop in stm32h7_adc_disable() will then time out as well,
leaving the hardware stuck and unable to be re-enabled later.

[ ... ]
> +static int stm32mp25_adc_calib_differential(struct iio_dev *indio_dev, u=
32 *calfact)
> +{
[ ... ]
> +	if (!diff_below_zero) {
> +		*calfact |=3D FIELD_PREP(STM32MP25_CALFACT_D_MASK, average);
> +		stm32_adc_writel(adc, STM32MP25_ADC_CALFACT, *calfact);

[Severity: Low]
Can passing the raw average into FIELD_PREP here result in silent data
corruption?

The average could be >=3D 0x800. This relies on the 9-bit mask
STM32MP25_CALFACT_D_MASK to implicitly truncate the 12-bit half-scale
offset out of the value.

While functionally this might achieve the expected subtraction for small
offsets, does this violate FIELD_PREP's assumptions and risk static analysis
warnings or runtime assertions?

[ ... ]
> +static int stm32mp25_adc_prepare(struct iio_dev *indio_dev)
> +{
[ ... ]
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
Will writing to the DIFSEL register be ignored by the hardware at this poin=
t?

stm32h7_adc_enable() sets ADEN=3D1, enabling the ADC. The STM32 hardware
write-protects the DIFSEL register while the ADC is enabled.

Does writing DIFSEL after enabling the ADC cause the configuration to be
silently dropped, forcing differential channels to fall back to
single-ended mode and corrupting measurements?

[ ... ]
> +static const unsigned int stm32_adc_min_ts_mp25[STM32_ADC_INT_CH_NB] =3D=
 {
> +	[STM32_ADC_INT_CH_VDDCORE] =3D 34,
> +	[STM32_ADC_INT_CH_VDDCPU] =3D 34,
> +	[STM32_ADC_INT_CH_VREFINT] =3D 34,
> +	[STM32_ADC_INT_CH_VBAT] =3D 34,
> +};

[Severity: Medium]
Are these stabilization time values correctly specified in nanoseconds?

This array specifies 34 ns, which causes the driver to select the absolute
minimum sampling time (e.g. 2 clock cycles). Internal channels like VREFINT
and VBAT usually require multiple microseconds to stabilize due to high
source impedance.

Were these values accidentally provided in clock cycles (e.g., 3.4 us at
10 MHz) instead of nanoseconds, leading to highly inaccurate internal volta=
ge
readings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-adc-stm32m=
p25-v1-v3-0-406834430d72@foss.st.com?part=3D8
