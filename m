Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C4C20010A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908400; cv=none; b=bYPv5r0KW1fJzzqgqk2pG26vHw+EIRH010A9jYLIwb5s7MWPZdXcUnlr5ZrOludCMDy2JfoWPTLIhH+E4gsfPOazgwFuKi+Ns0P+lal656IvLLPXCmJxVpuSBPxDs8fdFrnSia6UYnH3QMizoUj9WjEdyqOsrA3YCx3XBwcHVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908400; c=relaxed/simple;
	bh=gklClafR6IHC8brA0+5LSg3wJVkszkknbsUIGYpPb1Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mflzxhWV3JOaFLmkyXXQAQEzqO9lGgPeR7EFDQqkOYVrrmAHyHn/sni4Idh+WvXMcu8NZd8rQDxvp2475gp3rwneYIym+uL4dkb//xVhx8zruHaxVIw8nPGZAjkSn1p70nCboGaxD1/hsrn/tYeK+Sz4Eyu242DTAR3tbSt/ed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPJHu2sa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPJHu2sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCD51F00893;
	Mon,  8 Jun 2026 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780908398;
	bh=y5+OBfrAd/Jue1c+qrf7gexHvviIjQnRCy1qQqHvKeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HPJHu2saCzlBE+8wf3zdruj0DQU62ip2k1GKAtKta8zYbmrBn4PJgwLCEeNeYQq85
	 5svGSihPIoELn9SgTubsSfuhWJpt26kIyzLRU/dItjGY6Rx+TgJrgWks4BXTjMQ+/p
	 3UHEg/XR/AKg77KFMZLtPa5y+uEqOlVBTmUZvJxz7lylnBsXJFQ1b2c58//YbsLmA4
	 unSDDssrxct2VNGZ33nlZ4M5fqcfqQKKebCLfuVMUv7sfpO55DtKfVdAMDU++1OcvY
	 uDs8tNQj8cPGu3DveXt1/j3kkHM1NqwxDZ1Ch2zylB2gERTSxXg9IeI9AcYxdCvQGS
	 evV5mqzrUFHMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v0 4/7] ASoC: codecs: ES8389: Modify the initial
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Zhang" <zhangyi@everest-semi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608083540.12581-5-zhangyi@everest-semi.com>
References: <20260608083540.12581-5-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 08:46:38 +0000
Message-Id: <20260608084638.8FCD51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Resource leaks due to missing cleanup in component remove callback.
- [High] Uninitialized stack variables are used due to missing `regmap_read=
` error handling.
- [High] Hardware sequencing violation: clock is enabled before power suppl=
ies.
- [High] Hardware sequencing violation and mclk enablement bypass during re=
sume.
--

commit d35264c96a589a7e049b06bc9a887fbec2163074
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Modify the initial configuration

This commit modifies the initial configuration for the ES8389 codec.
It changes the values written to the ES8389_ISO_CTL and ES8389_OSC_CLK
registers during the initialization sequence.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index cd8284da8c62c..ad016c255c773 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -792,7 +792,7 @@ static void es8389_init(struct snd_soc_component *com=
ponent)
> =20
>  	regmap_read(es8389->regmap, ES8389_MAX_REGISTER, &reg);

[Severity: High]
This isn't a bug introduced by this patch, but I noticed that regmap_read()
is called without checking the return value. If the I2C read fails, the
stack variable reg remains uninitialized.

Does this code unintentionally use an uninitialized value for es8389->versi=
on
and in other functions like es8389_pcm_hw_params() or es8389_mute()?

For example, in es8389_resume():

sound/soc/codecs/es8389.c:es8389_resume() {
...
	regmap_read(es8389->regmap, ES8389_RESET, &regv);
	if (regv =3D=3D 0xff)
...
}

If the read fails, regv could be uninitialized stack garbage, potentially
causing it to take the 0xff branch incorrectly.

>  	es8389->version =3D reg;
> -	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x00);
> +	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x56);
>  	regmap_write(es8389->regmap, ES8389_RESET, 0x7E);

[ ... ]

> @@ -844,7 +844,7 @@ static void es8389_init(struct snd_soc_component *com=
ponent)
>  	regmap_write(es8389->regmap, ES8389_SCLK_DIV, 0x04);
>  	regmap_write(es8389->regmap, ES8389_LRCK_DIV1, 0x01);
>  	regmap_write(es8389->regmap, ES8389_LRCK_DIV2, 0x00);
> -	regmap_write(es8389->regmap, ES8389_OSC_CLK, 0x00);
> +	regmap_write(es8389->regmap, ES8389_OSC_CLK, 0x10);
>  	regmap_write(es8389->regmap, ES8389_ADC_OSR, 0x1F);

[Severity: High]
This isn't a bug introduced by this patch, but looking at the component
remove callback, is it possible that we are leaking the clock and regulator
resources?

In es8389_probe(), the clock and regulators are enabled:

sound/soc/codecs/es8389.c:es8389_probe() {
...
	ret =3D clk_prepare_enable(es8389->mclk);
...
	ret =3D regulator_bulk_enable(ARRAY_SIZE(es8389_core_supplies),
				    es8389->core_supply);
...
}

However, es8389_remove() does not seem to call clk_disable_unprepare() or
regulator_bulk_disable(). Could this permanently leak these resources every
time the sound card is bound and unbound?


[Severity: High]
This is a pre-existing issue, but does the power sequencing in es8389_probe=
()
follow standard hardware requirements?

sound/soc/codecs/es8389.c:es8389_probe() {
...
	ret =3D clk_prepare_enable(es8389->mclk);
...
	ret =3D regulator_bulk_enable(ARRAY_SIZE(es8389_core_supplies),
				    es8389->core_supply);
...
}

The clock is enabled before the core power supplies are enabled. Can drivin=
g a
clock signal into an unpowered IC draw power through the clock pin's ESD
protection diodes, potentially causing unpredictable logic states?


[Severity: High]
This is another pre-existing issue, but could we bypass the master clock
enablement during resume?

sound/soc/codecs/es8389.c:es8389_resume() {
...
	regmap_read(es8389->regmap, ES8389_RESET, &regv);
	if (regv =3D=3D 0xff)
		es8389_init(component);
	else
		es8389_set_bias_level(component, SND_SOC_BIAS_ON);
...
}

During es8389_suspend(), the bias level drops to STANDBY, disabling the
master clock. In es8389_resume(), if the register read returns 0xff,
es8389_init() is called instead of es8389_set_bias_level(..., SND_SOC_BIAS_=
ON).

Does this result in writing to the codec registers without the master clock
enabled, and leaving the master clock permanently disabled after the resume
completes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608083540.1258=
1-1-zhangyi@everest-semi.com?part=3D4
