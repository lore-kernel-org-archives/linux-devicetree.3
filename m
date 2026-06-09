Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9223DF008
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990578; cv=none; b=lMJxuKa2dsRsGI7oSfj4VvjLIwR2FRmRS2GewEkZFapWKgg5Z2s8m5tU9m+kI7o0x1jgeXNHAG2Au1S320nLnXP/JT5EGu1/Ht1sDaBFvnfQaRnEijsv+ri8xQd5b6ewrp0SaSaKdmE/w5D9m+zWgCU/87+TGBzcpoFRrNvomKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990578; c=relaxed/simple;
	bh=Iahd8cXBP3DKQWxC1UHQCosX+2G7ZoNuQJt3UBj7dG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q3Xqnuo1gm8TyqYyUU7roPYjstHmyw8VIKcG/Zj3kp9P5ML4FFtrYwj4y4sdxk/3y6J3faVmLpHZREybxvUEF5OG4+H4Gn/er38y2A+lZHYNbRu/778kd3fh3B8f3KzRQQoHtoCXZUQI6p4ajKcqA3O8hD2vueAcGw0BhcUVqr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuLxfhEc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuLxfhEc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1549D1F00893;
	Tue,  9 Jun 2026 07:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990573;
	bh=u/03CKdxnRfWoYLmlVK0Quz+Sws6aAxvOSzLonBrFq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EuLxfhEcJS1HoXaw4xz9wjFi37GxYPyXtScZAn82WKaP0fUrDM2ybAKxOX2yETFr4
	 Re18lt7JR0zxK7Wl5V7Ii81G9VIfApR+qneecQho81NGF4LPD1LuumdeY0MUCe3dc/
	 WL34R+Uk5rk/yCr8IjgE/xNl4Mqfkdscqcf4e+K2aHLJJ3DJjcGmX6kI/O3fu6Z16h
	 N4p3DRbs4VMykAjkWPYQPjm0DAJ/gDDQuqtDN0lS2cfpWfZC8wfKjvcit82xyFt1bw
	 txX0CAkp0JhJj3x6QS1OoqooNnBae1it4o5DGSQ8q+XyudCR7X6xlG5n6RbLXzNUmx
	 bPlO4YVaic7Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609071732.20939-3-zhangyi@everest-semi.com>
References: <20260609071732.20939-3-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 07:36:12 +0000
Message-Id: <20260609073613.1549D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect BCLK calculation for MCLK derivation
- [High] Missing check on the return value of regmap_read() during resume
- [High] Resource Leak: Regulators enabled during component probe are leake=
d on removal
--

commit 81fe94b62642e618ad9d244bb25b737cbe5017dd
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Fix the issue about mclk_src

Fix the issue with incorrect modifications to mclk_src.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index be7a36f17083f..886069be1535f 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
[ ... ]
> @@ -607,9 +607,9 @@ static int es8389_pcm_hw_params(struct snd_pcm_substr=
eam *substream,
>  	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, ES8389_DATA_=
LEN_MASK, state);
>  	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, ES8389_DATA_=
LEN_MASK, state);
> =20
> -	if (es8389->mclk_src =3D=3D ES8389_SCLK_PIN) {
> +	if (es8389->mclk_src) {
>  		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
> -					ES8389_MCLK_SOURCE, es8389->mclk_src);
> +					ES8389_MCLK_MASK, ES8389_MCLK_FROM_SCLK);
>  		es8389->sysclk =3D params_channels(params) * params_width(params) * pa=
rams_rate(params);
                                                           ^^^^^^^^^^^^^^^^=
^^^^

[Severity: High]
This is a pre-existing issue, but does this incorrectly calculate the
physical BCLK frequency?

Using params_width() returns the sample data width instead of the physical
slot width on the wire. When mclk_src is set, es8389->sysclk acts as the MC=
LK
derived from SCLK.

By under-calculating the physical SCLK, the get_coeff() function is provided
with an incorrect MCLK frequency assumption, which can lead to the selection
of wrong internal clock dividers and distorted or missing audio.

Could the physical BCLK be calculated using snd_soc_params_to_bclk(params)
instead?

>  	}

Additionally, I noticed a few other pre-existing issues in this driver:

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing check on =
the
return value of regmap_read() during resume?

In es8389_resume():

static int es8389_resume(struct snd_soc_component *component)
{
	...
	unsigned int regv;

	regcache_cache_only(es8389->regmap, false);
	regcache_cache_bypass(es8389->regmap, true);
	regmap_read(es8389->regmap, ES8389_RESET, &regv);

	if (regv =3D=3D 0xff)
	...
}

If the I2C read fails during resume, the stack variable regv is left
uninitialized and evaluated against 0xff. Could this introduce undefined
behavior and lead to incorrect skipping or triggering of the hardware
re-initialization?


[Severity: High]
This isn't a bug introduced by this patch, but are the regulators enabled
during probe leaked on removal?

es8389_probe() successfully enables core regulators:

static int es8389_probe(struct snd_soc_component *component)
{
	...
	ret =3D regulator_bulk_enable(ARRAY_SIZE(es8389_core_supplies),
				    es8389->core_supply);
	...
}

However, es8389_remove() does not call the corresponding
regulator_bulk_disable().

Since devm_regulator_bulk_get() only automatically frees the handles but do=
es
not implicitly disable the regulators, this leaks the regulator enable
reference count. Could this cause the power domains to remain permanently on
even when the module is unbound or removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609071732.2093=
9-1-zhangyi@everest-semi.com?part=3D2
