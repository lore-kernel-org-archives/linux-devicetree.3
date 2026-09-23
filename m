Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE3414413
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178683; cv=none; b=ZxNuPY9lhfcuVUX/P510MrN3AauzabYmFFsb7NG8GYwxHWhKHeq+oLr4nrW6LlguR27bV06LBnSMOkxXpC6caOc4KDxsZ3haPLsY8cGDE911ZVqmP7s4mu10sN+UXwWV1qkbOrX+4QXZtzhvuPhMmMlQPD9nTFU+ExykYnS7HPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178683; c=relaxed/simple;
	bh=RMy6OM3v/cMKl/JBskB4Sh5vb3YDJJxBTAnaN4q8J5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q+GdzFzLRVCpKwgNksQSDVuTVgQgZcT8cevIQNndU/RVZEay/t0zuHVk3+2NMwwVStAbnXM86wiQJF6Pdv4UEhqDCTjgSFacV4OGrPgfSKw77QYKHkujmSvJy590Gg+1sLSsR3Ne+bE4E1B5Rewqw5RKP2D47R48CeLcRQxIQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EE3xpyNh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EE3xpyNh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E4E1F00893;
	Wed, 23 Sep 2026 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178675;
	bh=IyjPtnjR8UV7gtk4OprDadNL0CLpUcEgO/d/gSB+Wh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EE3xpyNhnHYdDwdNcKj0mj6mXHCVzvMQbJ3p8Cz+n1t/ij9echV2101kwVybgIeDr
	 zLsG+mvJYdM559VTw8IZhUNkaoubchm+gdqjAaeijn/aoJl0VAPC9ASrxUl+27bd3C
	 sGAT3nrTAxpeiYvEswC4rAlR25g/DHbYIq3RDcdZeScRs/qPy6swKeFwNXy0GBHjct
	 ZG8Iyu0b9s5F+wZI+UFv3bLCxw/Mbhl5ifohUxTVhVjh5rZwMPLeVAVVeVqCWcQAZy
	 hlcb+F30jZg4r7vuf6mFr9Mop/bOSt6BzkW+wy6W+26dTY3E4lD6fTaTxOAWxpvG0C
	 OWVFZyO/CxLAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/14] iio: adc: stm32-adc: rework internal channels
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-adc-stm32mp25-v1-v2-5-46bc019537c6@foss.st.com>
References: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
 <20260923-adc-stm32mp25-v1-v2-5-46bc019537c6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 15:51:14 +0000
Message-Id: <20260923155115.20E4E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: adc: unintended functional change in stm32 internal channel=
 delays
--

commit 1797bf77d1751b7e9502bd851d9e50359e42d644
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

iio: adc: stm32-adc: rework internal channels data

This commit reworks the internal channel data structures for STM32 ADCs by
using designated initializers mapped to explicit channel enumerations. This
removes zeroed data entries and the need for static assertions.

> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index ddf74c674da6f..ac60c31de7a5b 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c

[ ... ]

> @@ -2737,8 +2730,11 @@ static const struct stm32_adc_cfg stm32h7_adc_cfg =
=3D {
>  	.vref_charac_mv =3D 3300,
>  };
> =20
> -static const unsigned int stm32_adc_min_ts_mp1[] =3D { 100, 100, 100, 43=
00, 9800 };
> -static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp1) =3D=3D STM32_ADC_INT_CH_N=
B);
> +static const unsigned int stm32_adc_min_ts_mp1[STM32_ADC_INT_CH_NB] =3D {
> +	[STM32_ADC_INT_CH_VDDCORE] =3D 100,
> +	[STM32_ADC_INT_CH_VREFINT] =3D 4300,
> +	[STM32_ADC_INT_CH_VBAT] =3D 9800
> +};

[Severity: Medium]
Does this unintentionally alter the minimum sampling times for the VDDCPU a=
nd
VDDQ_DDR channels? The commit message states "No functional change intended=
",
but the previous array initialized these values to 100, whereas omitting
them from the designated initializer will now implicitly set them to 0.

> =20
>  static const struct stm32_adc_cfg stm32mp1_adc_cfg =3D {
>  	.regs =3D &stm32mp1_adc_regspec,

[ ... ]

> @@ -2760,8 +2756,13 @@ static const struct stm32_adc_cfg stm32mp1_adc_cfg=
 =3D {
>  	.vref_charac_mv =3D 3300,
>  };
> =20
> -static const unsigned int stm32_adc_min_ts_mp13[] =3D { 100, 0, 0, 4300,=
 9800 };
> -static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp13) =3D=3D STM32_ADC_INT_CH_=
NB);
> +static const unsigned int stm32_adc_min_ts_mp13[STM32_ADC_INT_CH_NB] =3D=
 {
> +	[STM32_ADC_INT_CH_VDDCORE] =3D 1000,
> +	[STM32_ADC_INT_CH_VDDCPU] =3D 1000,
> +	[STM32_ADC_INT_CH_VDDQ_DDR] =3D 1000,
> +	[STM32_ADC_INT_CH_VREFINT] =3D 4300,
> +	[STM32_ADC_INT_CH_VBAT] =3D 9800
> +};

[Severity: Medium]
Is the minimum sampling time increase for the VDD channels intended? The
previous array initialized VDDCORE to 100, and VDDCPU and VDDQ_DDR to 0.
The new designated initializer explicitly sets all three to 1000. This
seems to conflict with the note in the commit message that no functional
change is intended.

> =20
>  static const struct stm32_adc_cfg stm32mp13_adc_cfg =3D {
>  	.regs =3D &stm32mp13_adc_regspec,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-adc-stm32m=
p25-v1-v2-0-46bc019537c6@foss.st.com?part=3D5
