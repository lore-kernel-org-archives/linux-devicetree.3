Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A612367CF
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781148678; cv=none; b=IRo7pzm06coLvG1eWK1M3iKnlJ3Ql1oO6njQQtFshkSY/wZ1IvfXPYNCSpGXvwdFyTOiGSGGma1porzvqpBwHtakzFs7m+VZuhnKV4e84nAP2tonv5gFU2KEA2ty8NsPY2+Gz7BJoz/qnEXhiVKqGx//hc9Y8NauFZJxfQr0ZX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781148678; c=relaxed/simple;
	bh=nb3Q/o7AAeaB1SUje27opaWAay5vmqzoSc/7N/pM6Ss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sQxRjLxCyxji5jqFRrhT2IltlmppMtT76iA69MZebWFMfPcbskYXRVl+67/zQr6cDlRkWJPo1cmERoTCBwH62HGNuuXEHXxpmop/9O5wV2RCO1Sbr8Bf6Oivm/DUHdf1GFyaLAurZ/SJp35FU4LSMCtqRFuws51SyQcPQExJjtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8NV1dzY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8NV1dzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20D31F00893;
	Thu, 11 Jun 2026 03:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781148677;
	bh=btM86w7BzBsNmefeNVmBKNx5bUOYsUKGaDE5+FAxTqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J8NV1dzYreWmVuVBeG4sTXbbLYHHeQwkV14mC6oC54RPjfFw60D6UXgN0TpxYtg7Z
	 PF0os7Cc4NXLNDGkwyR4p/WH/8+5JcjFaKgpKKyFQKRziOxV0sP/quoxgc/yp6OdGb
	 P9xef/jxA6eVz6+vrNpGfQDFO3ElxLT2Q1UXOtsPrA9kHxwhKaN7mpoBD3F1/M9GsZ
	 6wes3xRHQlLr4R5neBkcHgYo5w23Guyx40weFD6gyjhE0AnTz8RSG+C8GHTcyy2m5K
	 Kh6vtPyXB6x3uEIcBl2+D/bUG+Epn3n/TvwohtryHBhnvp3TkK/ivkzt15yWaJlnj3
	 EkUa1P9t2nUrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/7] ASoC: codecs: ES8389: Modify volatile_register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611031824.4628-3-zhangyi@everest-semi.com>
References: <20260611031824.4628-3-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:31:16 +0000
Message-Id: <20260611033116.C20D31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete volatile register whitelist causes state loss on suspen=
d/resume.
- [High] Ignored `regmap_read()` return values lead to the use of uninitial=
ized stack variables.
- [High] Unbalanced clock prepare/enable and disable/unprepare calls due to=
 manual bias level manipulation.
--

commit 13fa26be72cc2a7540f3f86a2ef766aae985561e
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Modify volatile_register

Mark some registers that are not volatile as false
And modified the logic for cache_bypass during 8389_resume.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 449d9574b03a8..be7a36f17083f 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -50,10 +50,29 @@ static const char * const es8389_core_supplies[] =3D {
>  static bool es8389_volatile_register(struct device *dev,
>  			unsigned int reg)
>  {
> -	if ((reg  <=3D 0xff))
> -		return true;
> -	else
> +	switch (reg) {
> +	case ES8389_ADCL_VOL:
> +	case ES8389_ADCR_VOL:
> +	case ES8389_MIC1_GAIN:
> +	case ES8389_MIC2_GAIN:
> +	case ES8389_DACL_VOL:
> +	case ES8389_DACR_VOL:
> +	case ES8389_ALC_ON:
> +	case ES8389_ALC_CTL:
> +	case ES8389_ALC_TARGET:
> +	case ES8389_ALC_GAIN:
> +	case ES8389_ADC_MUTE:
> +	case ES8389_OSR_VOL:
> +	case ES8389_DAC_INV:
> +	case ES8389_MIX_VOL:
> +	case ES8389_DAC_MIX:
> +	case ES8389_ADC_RESET:
> +	case ES8389_ADC_MODE:
> +	case ES8389_DMIC_EN:
>  		return false;
> +	default:
> +		return true;
> +	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but will this incomplete whiteli=
st
cause state loss across suspend/resume cycles?

Because the default case marks all unlisted registers as volatile, critical
configuration registers like ES8389_ADC_HPF2, ES8389_MASTER_MODE, and
ES8389_CLK_DIV1 are omitted from the cache.

Since regcache_sync() skips volatile registers, won't es8389_init() just
overwrite these with default values during resume, discarding any active
user configurations?

[ ... ]

> @@ -861,13 +880,13 @@ static int es8389_resume(struct snd_soc_component *=
component)
>  	regcache_cache_only(es8389->regmap, false);
>  	regcache_cache_bypass(es8389->regmap, true);
>  	regmap_read(es8389->regmap, ES8389_RESET, &regv);

[Severity: High]
This is a pre-existing issue, but does this code risk branching on an
uninitialized variable?

If regmap_read() fails during early resume, regv will contain uninitialized
stack memory. The subsequent check against 0xff will yield unpredictable
results, potentially skipping the required initialization.

The same issue appears to exist in es8389_init() when reading
ES8389_MAX_REGISTER into the local variable reg before assigning it to
es8389->version. Could we check the return values of these reads?

> -	regcache_cache_bypass(es8389->regmap, false);
> =20
>  	if (regv =3D=3D 0xff)
>  		es8389_init(component);
>  	else
>  		es8389_set_bias_level(component, SND_SOC_BIAS_ON);

[Severity: High]
This is a pre-existing issue, but does calling es8389_set_bias_level()
directly from the resume and suspend handlers conflict with the ASoC DAPM
framework?

Since DAPM independently transitions bias levels and triggers the
registered set_bias_level callback, it seems this direct call would cause
clk_prepare_enable() to run multiple times on resume, leaking the clock
reference count.

Similarly, during suspend, wouldn't redundant calls to
clk_disable_unprepare() cause a clock underflow warning?

> =20
> +	regcache_cache_bypass(es8389->regmap, false);
>  	regcache_sync(es8389->regmap);
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611031824.4628=
-1-zhangyi@everest-semi.com?part=3D2
