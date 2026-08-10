Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CFD414A11
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373918; cv=none; b=LouFoNHAwAipWtq8vtgbHZKbRmVKipxEVsBwhVhBIdEf1XtbKutRIArXgw06QcWwjZ3bb1E2xwFWIUinVU/zgHCz73zpYskgAAzGv+savmzEcARkyi9MQx2cPs/EFQhLD/h9xUsCkYF+Qp+f8+8amgEwgOUDpXY1GjYhITLIFZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373918; c=relaxed/simple;
	bh=usng40myqxQ7JUonPgsUO8n4mUM1rRieLBStfKSpukk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pDGBLa8iv5UNRNsk34q6lqw+twk4h8+2rdBBDZpypdvHHMBrBPuxTpgJw+QI2Zc90BJpdfTPBgrMMDuHLWeRI0fikRa+z0WbkSX0JXODk4FX0bgZrjGXrytF8dyfnjJkLphBPAy7rajtlETadAZ2psm+bmO+tlrEDdnm1zq6Wxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRdnjdmY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRdnjdmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457031F000E9;
	Mon, 10 Aug 2026 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786373911;
	bh=IPRVzV9ad4Ky84rrtHKcAKyABZMCGSFx6Ieo6hVnCsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRdnjdmY8xUHyZSuvR1y6amHQfZBjvHa+JRNcq2utj669uu3OIt3r80LxWZyxGhbU
	 gshfF9CSpnEs+8k7/jXOwivazJsPlYxxbqwEt3Ah3sEBr1aqnfA9XQ7zmCveOnsutK
	 CPZqUAk66qEtektcf4+UVkaNySSVgQsMXdh26Eq9X/PhDZhaKbdRv2k8GifhaTjnY1
	 q2IOC6Jp6wX/xF4uWooC/WQ34DzsoHh8npbIjv5dGBcNqRmhL6ecRox0gcxrF/7Kxv
	 Kr7WIJHbVYcyQxg6Hb9Spu3S47t+zoYP9e77gMsMyfGBA0nVc4j+M6mT3H9DimFiA2
	 g9rDmAxzW1oKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: add Axiado SARADC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
References: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
 <20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:58:30 +0000
Message-Id: <20260810145831.457031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The ADC conversion delay calculation ignores the configured samp=
ling time (or oversampling), potentially causing premature reads.
--

--- Patch [2]: [PATCH v5 2/2] iio: adc: add Axiado SARADC driver ---
commit d29fd02ad40c12a8c4f338bf8bdde17a93221079
Author: Petar Stepanovic <pstepanovic@axiado.com>

iio: adc: add Axiado SARADC driver

Add support for the SARADC controller found on Axiado AX3000 and
AX3005 SoCs. The driver supports single-shot voltage reads through
the IIO subsystem.

> diff --git a/drivers/iio/adc/axiado_saradc.c b/drivers/iio/adc/axiado_sar=
adc.c
> new file mode 100644
> index 0000000000000..daa98dd2f1761
> --- /dev/null
> +++ b/drivers/iio/adc/axiado_saradc.c

[ ... ]

> +static int axiado_saradc_conversion(struct axiado_saradc *info,
> +				    struct iio_chan_spec const *chan, int *val)
> +{
> +	unsigned long usecs;
> +	unsigned int regval;
> +	int ret;
> +
> +	guard(mutex)(&info->lock);
> +
> +	/* Select the channel to be used and trigger conversion */
> +	ret =3D regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG,
> +			   AX_SARADC_MANUAL_CTRL_ENABLE |
> +			   FIELD_PREP(AX_SARADC_MANUAL_CTRL_CH_SEL_MASK, chan->channel));
> +	if (ret)
> +		return ret;
> +
> +	/* Hardware requires 13 conversion cycles at clk_rate */
> +	usecs =3D DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC,
> +			     info->clk_rate);
> +	fsleep(usecs + AX_SARADC_CONV_DELAY_MARGIN_US);

[Severity: Medium]
Does this wait time calculation need to account for the configured sampling
time?

In axiado_saradc_probe(), AX_SARADC_GLOBAL_CTRL_SAMPLE_MASK is configured to
AX_SARADC_GLOBAL_CTRL_SAMPLE_16 (which selects 16 samples). Calculating the
wait strictly as 13 conversion cycles seems to ignore the extra time needed
for these 16 samples.

At lower clock rates, could the sleep finish before the conversion actually
completes and lead to premature reads?

> +
> +	ret =3D regmap_read(info->regmap, AX_SARADC_DOUT_REG, &regval);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-axiado-ax3=
000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com?part=3D2
