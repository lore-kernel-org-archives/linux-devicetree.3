Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6C351DAF2
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778709; cv=none; b=jYDCMsKG/zbJwVmwdlW/IDYxTHvIEDsItaaqoJ3IYtPk+QyarXmBBqNYOG/hQohPyzF0XR4FGCidKqWhLXtjZ6tDe7KG6R0McK4QOm+42BLbYBMa+jmQQadufBB/MioX1Eg662fnEAdZ7ndE1gaSP2HkN421FztQBbxIBGkkePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778709; c=relaxed/simple;
	bh=UmmpQmxfBys/gmiMeAm7dfQlkdgr2SmmjSn7KVP8MTI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X9+zzo46JdRnkvZWhzGf2mHwclUvCYmaoBXZYeRBGM/BvWfiGyqSIvatQntqhBz4pUjvMf2zMySecPVrT/wcoMkH22h3zKteQf+thlt/2POvqhjkFtrNv3LxG5NRQoboFJHpOgfZYqhGPIZkRk/kMrYdYHMYDuP10SfmIEZB3DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPz3pAVp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPz3pAVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601721F000FF;
	Wed, 30 Sep 2026 14:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790778698;
	bh=ZO9gRgwBcFV49FFx7ZZ+FZ+ZMycSBXf6WMovfGr99KM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LPz3pAVpycB0BtOod+Aw84HN9hOsyDr1YQKeKIGzV7WXvEgSZbgdYsi7kqGHFaMGP
	 rv3Pr59EbUOJhMi9xnbXBGr/s7v20jd+FY6KTZVJhl1AF1NffjZkYSMo03Lu9N7MBY
	 wLU3e+gtnk+HjrhUlNohEFptJpi5xY5GeZF88qx5BV/jZRQlaC6t/YcsqKTx8IGFH7
	 OEi51ndp+fC/CmCZczC7F5ZzMyjJf4njmEs3pImHMKlRAGw0dByS0AI1677sOHeKWG
	 Z2MPimXi9bjoSQBstp8Tg1vzhlGxQqix/LNM6CXgQLI1C7L/E+ATnsZOoKN4InlSbr
	 Sv6wfqmYkM7Ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/15] iio: adc: stm32-adc: add support for stm32mp23
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-9-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
 <20260930-adc-stm32mp25-v1-v3-9-406834430d72@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:31:37 +0000
Message-Id: <20260930143138.601721F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: adc: missing const qualifier on trigger arrays
--

commit e6098517cec9404a97ce36281256eb9d77667464
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

iio: adc: stm32-adc: add support for stm32mp23
   =20
Add support for ADC on the STM32MP23 SoC, which has 3 ADCs split into two
blocks. The STM32MP23 trigger list is handled with dedicated compatible data
due to differences from the STM32MP25.

> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 33e41505b2e99..210b76b21d13b 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c

[ ... ]

> @@ -563,6 +563,64 @@ static const struct stm32_adc_regspec stm32h7_adc_re=
gspec =3D {
>  	.smp_bits =3D stm32h7_smp_bits,
>  };
> =20
> +/* STM32MP23 external trigger sources for ADC1 and ADC2 */
> +static struct stm32_adc_trig_info stm32mp23_adc1_adc2_trigs[] =3D {

[Severity: Low]
Should this array be declared as const? The trigs field in struct
stm32_adc_cfg expects a const struct stm32_adc_trig_info *.

> +	{ TIM1_TRGO, STM32_EXT0 },
> +	{ TIM1_TRGO2, STM32_EXT1 },
> +	{ TIM8_TRGO, STM32_EXT2 },

[ ... ]

> +	{ LPTIM4_CH1, STM32_EXT27 },
> +	{ LPTIM5_OUT, STM32_EXT28 },
> +	{ }
> +};
> +
> +/* STM32MP23 external trigger sources for ADC3 */
> +static struct stm32_adc_trig_info stm32mp23_adc3_trigs[] =3D {

[Severity: Low]
Does this array also need a const qualifier?

> +	{ TIM1_TRGO, STM32_EXT0 },
> +	{ TIM1_TRGO2, STM32_EXT1 },
> +	{ TIM8_TRGO, STM32_EXT2 },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-adc-stm32m=
p25-v1-v3-0-406834430d72@foss.st.com?part=3D9
