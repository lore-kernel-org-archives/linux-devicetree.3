Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D27033FE36
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974443; cv=none; b=UzP1TBbhQcTySMs9Q9KJ1D15R5JA17hUTl1OVcVzP2fK7Nw+URtTYax+hgf1nwwCvvVCvg7N5hI98yoxXQG/lgj25fe32cfDvJsJC81XecKc48c6FpS+mJ9FX5CT/tRBNWHQ9gEGeH0epXaUFssyqrmZRw2GR1CjPu31lBlJl38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974443; c=relaxed/simple;
	bh=St3S8TwVPIaayTrwYmH3XvCW1HYeIfzPLoE6eyejG2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jj1CrqPTCONakfZRiDhiS+SBc7YbfkU2aMhtbrOSx9R8l0hry/CbZ1rFCamFNfQX7qbZTHqOxaxk1eDjxjk0Cp9RArEG2d8rIX+PSYZODPXfOoB40kMR+Py63zjyIeaTVZk228q3gL3rV4rtRVLj3xnC6PgU5R/HGTI+k19kLio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahqHt8zh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahqHt8zh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228B71F00893;
	Tue,  9 Jun 2026 03:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780974441;
	bh=9ch4hD6OpyUOiBoOp2o2Xhyyk5Hvr9mitjEmhS+oz2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ahqHt8zhv4a4LlnVAmBD1aJe2mnf38ItnwCwiT5YEorHWVOEpQI5prBhXrC1sne4m
	 wf1/o3VFkoZM6EG/h1iR8U9j5PF25AY+KHoe7Ti8NOCgVFgJ5qQFRaLU352ZslPzsV
	 aI0IJgz9m6FS/rs1FExbkGdyI9CBQHraW+RetCpsd5M75i/5MKjuAmLR5SvKDc7sbv
	 iwS5L9xTMxxUkcAscS8L/hs15QHNDQgf6bWNVADDavrrY6lqDJAUOU1RfE+6oP/VPD
	 8DUz8swPIZ/mf65TM8+G7F8tk+dvUs8DvU+Ry+RuOXwKpQcXj/eIipGAD2kL7DtYrr
	 xcpMemHWSsctg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] ASoC: codecs: ES8389: Add private members related
 to HPF
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609025605.16945-6-zhangyi@everest-semi.com>
References: <20260609025605.16945-6-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 03:07:20 +0000
Message-Id: <20260609030721.228B71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] User-configured ALSA controls are silently clobbered with hardcode=
d defaults during resume from suspend, leading to state desynchronization.
--

commit d29ddfc11e992ae97d64b61eda8c618e717e58ba
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Add private members related to HPF
   =20
Add private members related to HPF.
And defines ES8389_HPF_DEFAULT

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 8e47b4e3214e0..d1bcbbfcd4754 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c

[ ... ]

> @@ -742,8 +744,8 @@ static int es8389_mute(struct snd_soc_dai *dai, int m=
ute, int direction)
>  			regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE,
>  						0x03, 0x00);
>  		} else {
> -			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x0a);
> -			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x0a);
> +			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, es8389->hpf=
l);
> +			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, es8389->hpf=
r);

[Severity: High]
Does this interact safely with the resume path?

If the "ASoC: codecs: ES8389: Modify volatile_register" patch in this series
marks control registers (like ES8389_ADC_HPF2, ES8389_DAC_INV, and
ES8389_ADC_MUTE) as non-volatile, they are placed into the regmap cache for
restoration across suspend/resume.

However, in es8389_resume(), regcache_cache_bypass() is disabled before
calling es8389_init():

sound/soc/codecs/es8389.c:es8389_resume() {
    ...
	regcache_cache_bypass(es8389->regmap, false);

	if (regv =3D=3D 0xff)
		es8389_init(component);
    ...
}

es8389_init() then uses regmap_write() to forcefully initialize these
registers with hardcoded defaults. Because the cache is active, these writes
will overwrite the user's previously set values in the regcache:

sound/soc/codecs/es8389.c:es8389_init() {
    ...
	regmap_write(es8389->regmap, ES8389_ADC_HPF2, 0x04);
	regmap_write(es8389->regmap, ES8389_DAC_INV, 0x03);
    ...
	regmap_write(es8389->regmap, ES8389_ADC_MUTE, 0xC0);
    ...
}

When regcache_sync() executes immediately afterward in es8389_resume(), it
syncs this clobbered cache to the hardware.

Could this cause user-configured ALSA controls (such as silent unmute of the
ADC OSR Volume Switch, clearing output inversions) to be permanently lost on
resume without any ALSA events being generated?

>  			regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE,
>  						0x03, 0x00);
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609025605.1694=
5-1-zhangyi@everest-semi.com?part=3D5
