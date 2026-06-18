Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08EF3B3C13
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772318; cv=none; b=tgY62GVdb4JCLu1U52uvwPlg50+AExZn6jZpjNUhy05XVU2UkfE/6qSIijYr8SebTtKc45vt+kKSuFNsVPm4o1AXsl0ZcvKXBiILs1hC5Q19zhZ6CkfgvDWK/8sp7C6NhoP/4rd1GSUWLT8BdaRFE8a1veSoTrdiDcz7MBwmzQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772318; c=relaxed/simple;
	bh=RFDlKG+eyT/oJfKdVmZd4RolBGDEmU5FlJaxE5+xEbo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fuMKs2Mtpvx5mFFFb17VSG92apeuUE7ZAtbeXqsYvMymPfSdbybx2bHLWsTQnbOrlBVi2zKi4X3NZs0E7dDWGgaN1wB8fswtNrvAzH7EmMLLxA18UeUiMtAqLQFYo6uUEWnz49ziKUX8yCYpAbAInpJAr3UBj1GSUu/z7DzzGkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/HIcKA1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/HIcKA1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625BE1F000E9;
	Thu, 18 Jun 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781772316;
	bh=ivGuEaNWAUqr6Gn0tSYH4j7IQ8U9K7mzsdEeUnMQdRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K/HIcKA1GkHmmRYUHW5XdNpW2pT4QhRf4Iwgmf3ct0Ys5Mqe9Ic8CT01wWpuRo4cb
	 b6hvB4zm/YLiEquPMbDpELZhLre/TFXoqHNNd8xSlwkvSdz98W2/G+cec275zven+j
	 jZW2Lx8x6KDtT1h6F3cNEmEtLW3tITCD1xCxQKVHVEeVBQ880+yME1cJ5q07rljjwK
	 nnj23vMyicDxwQwXhzRdT4IIZ5EOvT+6touM1vx4P5vgvVpICwras2+L5xdevJdTJP
	 nm9xt34Arxys+GhYbJDnOMkgwQk+yJSVMIueIuS4msI/mE9JwUgjms4UOMdhMup2rp
	 rRYrGQJ8Ibqow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] ASoC: codecs: ES8389: Modify volatile_register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618082842.2778-3-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
 <20260618082842.2778-3-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 08:45:15 +0000
Message-Id: <20260618084516.625BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The updated `es8389_volatile_register` list misses critical config=
uration registers, causing their state to be permanently lost upon resume.
- [High] Variables passed to `regmap_read` are used without checking for a =
potential error return, which can leave them uninitialized and result in no=
n-deterministic hardware behavior.
- [High] The return value of `es8389_set_bias_level()` is ignored in `es838=
9_resume()`, potentially leading to silent failures.
--

commit d39c101472412561134bb4faff5fe29c9d7f7dfb
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Modify volatile_register

This commit updates the volatile register definitions for the ES8389 codec,
switching to an allowlist approach for cached registers. It also adjusts
the cache bypass logic during the resume sequence.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 3484c87853cb4..10de2143f8d8f 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c

[ ... ]

> @@ -50,10 +50,29 @@ static const char * const es8389_core_supplies[] =3D {
>  static bool es8389_volatile_register(struct device *dev,
>  			unsigned int reg)
>  {
> -	if ((reg  <=3D 0xff))
> -		return true;
> -	else
> +	switch (reg) {
> +	case ES8389_ADCL_VOL:

[ ... ]

> +	case ES8389_ADC_MODE:
> +	case ES8389_DMIC_EN:
>  		return false;
> +	default:
> +		return true;
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but by defaulting to true, do we
miss critical configuration registers like ES8389_MASTER_MODE and
ES8389_ADC_HPF2?

If these are left as volatile, they are bypassed during regcache_sync().
Since ASoC doesn't automatically re-invoke set_fmt on resume, and
es8389_init() overwrites these registers with reset defaults, does this
permanently lose the configuration across a suspend/resume cycle?

>  }
> =20
>  static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
> @@ -861,13 +880,13 @@ static int es8389_resume(struct snd_soc_component *=
component)
>  	regcache_cache_only(es8389->regmap, false);
>  	regcache_cache_bypass(es8389->regmap, true);
>  	regmap_read(es8389->regmap, ES8389_RESET, &regv);

[Severity: High]
This is a pre-existing issue, but should the return value of regmap_read()
be checked here?

If the underlying I2C/SPI read fails, regv remains uninitialized. This
could result in non-deterministic hardware behavior since the resume
sequence would evaluate stack garbage in the if (regv =3D=3D 0xff) check be=
low.

This also appears in other places, for example in es8389_init():

    regmap_read(es8389->regmap, ES8389_MAX_REGISTER, &reg);
    es8389->version =3D reg;

> -	regcache_cache_bypass(es8389->regmap, false);
> =20
>  	if (regv =3D=3D 0xff)
>  		es8389_init(component);
>  	else
>  		es8389_set_bias_level(component, SND_SOC_BIAS_ON);

[Severity: High]
This is also a pre-existing issue, but what happens if es8389_set_bias_leve=
l()
encounters an error?

If clk_prepare_enable() fails inside es8389_set_bias_level(), it returns
an error code. Since that return value is ignored here, will the function
silently proceed to regcache_sync() and return success? This might leave
the hardware unpowered while the system falsely believes it resumed
correctly.

> =20
> +	regcache_cache_bypass(es8389->regmap, false);
>  	regcache_sync(es8389->regmap);
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618082842.2778=
-1-zhangyi@everest-semi.com?part=3D2
