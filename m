Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFABF44C65C
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920790; cv=none; b=mYtkCHhCmjvUAZJZDLgP46j/XF+vm3NCxAH0Hu/MiaTLOygXX7V8Oy5chP2ERJOIEwhrQNmnByvp0HCrgFFo20rse7TAsDw4F7yjJ0BtK76pyeylNqO0SnOdU/MgqKnKfEtEs4f69wb2f0LTEfdcp1W4D4omR2N0aYoY7qju/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920790; c=relaxed/simple;
	bh=GbCh6eqZ9HrFe37M2GSH/nNFR1ZlvKuGIP9fskUmykU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yt1MCqJI05PSwgv0IQ/58T33MayW6Codfoux9UniISYJnZQ0FcOiw+RNuHk8uukcrsrMmQ/qYDX9uEo7VfJRntPJmGzCgvNANue/mY2/SrirfOZ1sPOcBC8s0nJQYhe7zkqjRAlbtrDHqAXoEVFPQ6Av3XS4kybVTyb/ncWgLrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjoT5Gu3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjoT5Gu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49C41F000E9;
	Fri, 28 Aug 2026 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787920773;
	bh=aQFEqBy13FAsWTLkwSmedmXAps3i9ZYYjq1s/Napc1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bjoT5Gu3vXc8Prmq3xB0viqd9H2hVcThj4uk8hM6Q8BEal/HwTwaP/cX/FpJPv7NY
	 7CFbrpqazaD8Mzz3wElffXpQqwqcV8GlkpAKobthuELNpDeD54vCLK5aXf1MhFAZu1
	 eHMsbSnADSIrjAX18ufb805JZqq16ZI2DyPzDjDN/lvzKt0cjzKX9hrpaSfFIbg6Uu
	 /gMPqXOft6bE00OA11OYzRJ1H5fEQxplSmsoNu2bzqMFKgEjU3jbls7uVSJoMsU3gJ
	 vigOm/fuG8Gc7BeaF6bwn8hz+8O7ZmwDO7a6QbCKrUmSZ30MXD9jaavFcPcOZyksGJ
	 Liq7DTwe+I+TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] iio: adc: add Axiado SARADC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828-axiado-ax3000-ax3005-saradc-v6-2-4cea467e4167@axiado.com>
References: <20260828-axiado-ax3000-ax3005-saradc-v6-0-4cea467e4167@axiado.com>
 <20260828-axiado-ax3000-ax3005-saradc-v6-2-4cea467e4167@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 12:39:32 +0000
Message-Id: <20260828123932.E49C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The conversion delay calculation does not wait long enough because=
 it ignores the 16 hardware samples configured.
--

commit 266b1b7c1e54b1e96b8a907b30e2e13101402f9d
Author: Petar Stepanovic <pstepanovic@axiado.com>

iio: adc: add Axiado SARADC driver

This commit adds support for the SARADC controller found on Axiado AX3000
and AX3005 SoCs. The driver supports single-shot voltage reads through the
IIO subsystem.

> diff --git a/drivers/iio/adc/axiado_saradc.c b/drivers/iio/adc/axiado_sar=
adc.c
> new file mode 100644
> index 0000000000000..699ee31616fcd
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
> +	/* Select the channel to be used and trigger conversion. */
> +	ret =3D regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG,
> +			   AX_SARADC_MANUAL_CTRL_ENABLE |
> +			   FIELD_PREP(AX_SARADC_MANUAL_CTRL_CH_SEL_MASK, chan->channel));
> +	if (ret)
> +		return ret;
> +
> +	/* Hardware requires 13 conversion cycles at clk_rate. */
> +	usecs =3D DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC, info->clk_=
rate);
> +	fsleep(usecs + AX_SARADC_CONV_DELAY_MARGIN_US);

[Severity: High]
Will this delay wait long enough for the hardware to finish the conversion?

The delay calculation here only accounts for a single sample (13 conversion
cycles). However, looking at axiado_saradc_probe(), the hardware is
configured to average 16 samples by setting AX_SARADC_GLOBAL_CTRL_SAMPLE_16
in the global control register:

	regval =3D FIELD_PREP(AX_SARADC_GLOBAL_CTRL_CH_EN_MASK,
			    GENMASK(soc_data->num_channels - 1, 0)) |
		 FIELD_PREP(AX_SARADC_GLOBAL_CTRL_SAMPLE_MASK,
			    AX_SARADC_GLOBAL_CTRL_SAMPLE_16) |
		 ...

Since the hardware actually takes 16 samples (requiring 208 cycles total),
could reading AX_SARADC_DOUT_REG right after this shorter delay return stale
or incomplete data?

> +
> +	ret =3D regmap_read(info->regmap, AX_SARADC_DOUT_REG, &regval);
> +
> +	/* Best effort to stop manual conversion. */
> +	regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-axiado-ax3=
000-ax3005-saradc-v6-0-4cea467e4167@axiado.com?part=3D2
