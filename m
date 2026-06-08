Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D13AFD00
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908762; cv=none; b=h374Hu/L5biLXUqp49LiOMKEYQz9yGsl/8P4MrTn7GpyOBsweUpdTj/GiRae/U/HKqcNpmUkD6zZbfAQznjPZlsmJL/AnYd9jpFCJpjXZrzvikL6eXubHBRmTHX3I8XPA5OXZOkmW/imT8r6/nVTjbsgABhaPLcSVvBYcTA0QK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908762; c=relaxed/simple;
	bh=7D56YVzupes1l2eMfafcEDXYnNUkfLa3tMJd9k7Dm6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HPr87++/nyp7tFnxTn69elMmLtzd1cRqvA2Z663h14NPYXN2T9c8BeM3QORjTeExoqPJuhTRIxFZaX1SdyYN6snMWpXUokBylNLuG9X7P1hAvk+sdziH5WO5SPU0utmFlvA5pksvSoyER+2ZjsDVAywnrnMcU9QOPhu3rwN6WZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFyXPG53; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFyXPG53"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04621F00893;
	Mon,  8 Jun 2026 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780908761;
	bh=oxYzuTvd7PrmVR3TrdeVPnHquVAvACj3FjIdSoBEvjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFyXPG53qRl2arIaB3fbAh9wX+hoRje1STbHfvrH3BgZ7XIIAFRLNdKV0KNpSc1iD
	 Mq1AI2h8y3Fl9M+Q5MKFtpKMWW7BJBXoLgsgmRvccHAnCORRNZyQLbg9GfSLGeMGWc
	 vZ+/10oP1tUoUc3pd0+2ck4AxmWclz8LA/SLudQYfxf0h5WALfXKnwk7fvP3FDBiDN
	 5hxb4pP/SvgrJZBQWneoHglwRASN2Sfin32kfjBxPWMve/v3XZjKeZ7o3QwFgrO3LS
	 hGW8txIKis9dl6foXYpnKirW6p1hG2mgUek9uEtqLLtyUQgk8Cz55EqLPhGashSwS+
	 9iMX1KHsn4quw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v0 2/7] ASoC: codecs: ES8389: Fix the issue about
 mclk_src
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Zhang" <zhangyi@everest-semi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608083540.12581-3-zhangyi@everest-semi.com>
References: <20260608083540.12581-3-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 08:52:40 +0000
Message-Id: <20260608085240.F04621F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Devicetree ABI Breakage and Hardware Leak in mclk_src Evaluation
--

commit 901f3e10a3b9643fed9b6bed617589331a04275d
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Fix the issue about mclk_src

This commit addresses an issue with incorrect modifications to the mclk_src
configuration by updating the bitmask logic and hardware register definitio=
ns.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 9c816491648c7..638eb1f0462ea 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -609,7 +609,7 @@ static int es8389_pcm_hw_params(struct snd_pcm_substr=
eam *substream,
> =20
>  	if (es8389->mclk_src =3D=3D ES8389_SCLK_PIN) {

[Severity: High]
Does this change break the devicetree ABI?

In es8389_probe(), the driver reads the "everest,mclk-src" devicetree prope=
rty
directly into the es8389->mclk_src variable:

sound/soc/codecs/es8389.c:es8389_probe() {
    ...
    ret =3D device_property_read_u8(component->dev, "everest,mclk-src",=20
                                  &es8389->mclk_src);
    ...
}

Since ES8389_SCLK_PIN is redefined below as (1 << 6), any existing device
trees using logical values like <0> or <1> will fail this equality check.
This will silently bypass the SCLK configuration and break audio functional=
ity,
unless device tree authors now populate the property with the raw hardware
bitmask <64>.

>  		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
> -					ES8389_MCLK_SOURCE, es8389->mclk_src);
> +					ES8389_MCLK_MASK, es8389->mclk_src);
>  		es8389->sysclk =3D params_channels(params) * params_width(params) * pa=
rams_rate(params);
>  	}

[ ... ]

> diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
> index d21e72f876a60..13ce241774dc8 100644
> --- a/sound/soc/codecs/es8389.h
> +++ b/sound/soc/codecs/es8389.h
> @@ -116,9 +116,10 @@
>  #define ES8389_TDM_SLOT               (0x70 << 0)
>  #define ES8389_TDM_SHIFT              4
> =20
> -#define ES8389_MCLK_SOURCE            (1 << 6)
> -#define ES8389_MCLK_PIN               (1 << 6)
> -#define ES8389_SCLK_PIN               (0 << 6)
> +#define ES8389_MCLK_MASK              (3 << 6)
> +#define ES8389_MCLK_SOURCE            (0 << 6)
> +#define ES8389_MCLK_PIN               (0 << 6)
> +#define ES8389_SCLK_PIN               (1 << 6)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608083540.1258=
1-1-zhangyi@everest-semi.com?part=3D2
