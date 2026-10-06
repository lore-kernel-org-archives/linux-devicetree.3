Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6561D54FA
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274297; cv=none; b=DFo+/iM40q9mXsrtNk2n1XWZY3I3Vg3AbYFJtO3FZNesgI/Uv12j3vs93r+/SybxlmFKNIgVZEG8uhvt+Nw6ibVTPg5STyONxqeWyLCygxhqtC1kg0dv5Xwqi8WFl0L7lSTw+rJTH070ab167ejeyCXyiYr0DRBwGw9HuP79aFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274297; c=relaxed/simple;
	bh=OZN/rB8YhxQcjdrty6iHV5AyVsA35Rk4roNdrk92dZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lz+bmoLjxxfxSA3QncuHY80tU61xpgi/Ych5PnR3qxX8BziYK9x2o0Xm+n77YjCzQu01mA7MLQNJRt9YVVyUouwob9yq2JmjwZQCKptRRIX1EVC/HVc+o3olF132pJ0RHdIRUgQneeAlTHDvG8N+cUuqqTowlDUHzbzMwcE0NNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzR7IyZU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzR7IyZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCF31F000FF;
	Tue,  6 Oct 2026 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791274295;
	bh=4aoGDtYo1iPDKa2zL2RujqoO9bdCR+QU0spAFWm9FO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BzR7IyZUGPqa6W8x6s11Jq82Mnx7ViNVIo3qcthgLKBtWR+8w1yyHBff+jjE8ELNX
	 F7ZIxI1xOWT6biL6ioog9twoP5TPn6QUxzPdq7mpt2oNIxSQ9ItWNRccp568gp9l3n
	 NCxWjILEcIkwbAcn9cmsd3Zon0mJzyT3NcGQYMHguFQ5u3VhqHBgzBUpDYQNKlZs+M
	 9KGY/Y/tyL6uZSiLuCE3kuR0zDGkJoRJ5cZiambY35ETTQMv4XcFB9Sj2E/BehUdDb
	 RlCJZWzD8UjfgkKbKILy9V3v6Nv6/OY25KBReVumjtSC4AfYzAiNEN9GnlwWGPSm25
	 nkMdQfmIAE/Sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/15] iio: adc: stm32-adc: add support for stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261006-adc-stm32mp25-v1-v4-8-d31ec75aecf3@foss.st.com>
References: <20261006-adc-stm32mp25-v1-v4-0-d31ec75aecf3@foss.st.com>
 <20261006-adc-stm32mp25-v1-v4-8-d31ec75aecf3@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 08:11:35 +0000
Message-Id: <20261006081135.7FCF31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: adc: stm32: missing wait for ADSTART clear after ADSTP
--

commit a66fdb4df492a7cd737ae8e8fbfa41958a5d15b4
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

    iio: adc: stm32-adc: add support for stm32mp25
   =20
    Add support for ADC on STM32MP25 SoC. It has 3 ADCs, split into two blo=
cks:
    - ADC1 & ADC2 are tightly coupled.
    - ADC3 is managed independently.

[ ... ]

> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index e3719b29dcb1e..e7c927d1a73b3 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c

[ ... ]

> @@ -1304,6 +1440,211 @@ static void stm32h7_adc_unprepare(struct iio_dev =
*indio_dev)
>  	stm32h7_adc_enter_pwr_down(adc);
>  }
> =20
> +/*
> + * STM32MP25 offset calibration software procedure. Basically the calibr=
ation routine is
> + * expected to average (for example) 8 samples in calibration mode, for =
single-ended  and
> + * differential channels, to calibrate the zero offset. In case offset i=
s "negative", an
> + * additional offset can be added, to determine calibration factor. It m=
ust be kept later
> + * for all conversions.
> + */
> +static int stm32mp25_adc_calib_get_average_data(struct iio_dev *indio_de=
v, u32 *average)
> +{
> +	struct stm32_adc *adc =3D iio_priv(indio_dev);
> +	u32 avg =3D 0;
> +
> +	/* Repeat several conversions in calibration mode, average the results =
*/
> +	for (unsigned int i =3D 0; i < STM32MP25_CALIB_LOOP; i++) {
> +		int ret;
> +		u32 val;
> +
> +		stm32_adc_set_bits(adc, STM32H7_ADC_CR, STM32H7_ADSTART);
> +		ret =3D stm32_adc_readl_poll_timeout(STM32H7_ADC_CR, val,
> +						   !(val & (STM32H7_ADSTART)),
> +						   100, STM32_ADC_TIMEOUT_US);
> +		if (ret) {
> +			stm32_adc_set_bits(adc, STM32H7_ADC_CR, STM32H7_ADSTP);
> +			dev_err(&indio_dev->dev, "calibration average error %d\n", ret);
> +			return ret;

[Severity: Medium]
When setting ADSTP to abort the conversion, do we need to wait for ADSTART =
to
clear before returning?

If a calibration conversion times out in stm32mp25_adc_calib_get_average_da=
ta(),
the code sets ADSTP but does not wait for the hardware to clear ADSTART.
When the error is returned, stm32h7_adc_disable() is invoked on the cleanup
path.

Because ADSTART may still be active, the hardware might ignore the ADDIS
command. The disable routine can time out, and the device is subsequently s=
ent
a power-down command (DEEPPWD) while still enabled. This could violate the
documented power-down sequence and permanently wedge the IP block.

> +		}
> +
> +		val =3D stm32_adc_readl(adc, adc->cfg->regs->dr);
> +		dev_vdbg(&indio_dev->dev, "dr[%d]=3D0x%08x\n", i, val);
> +		avg +=3D val;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-adc-stm32m=
p25-v1-v4-0-d31ec75aecf3@foss.st.com?part=3D8
