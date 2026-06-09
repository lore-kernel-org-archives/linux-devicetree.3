Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC03DD850
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990462; cv=none; b=U8qh5JjRvWhWDhHOMObWBaI8osLtQ6xK6FoUorseUm2GY4W9jiWfF8JppVEV3lefwkN99oLF+wPlDvFyo8qSL231gAmKuboWwhx3iuxCpXd/NR2J+rsC57cDtCqXxK9U5ZsX+4H/2Hq/y90DiACoSUuaETWDAjDEBFyZxBh5GZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990462; c=relaxed/simple;
	bh=ZmI9AW2O3V8qrVXiliMS9DUM/RILyY1t/K1HqWqUqAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aywW2bnJFy49aqSvlK+n4ZofHH8vDKsnCX2AOwgl84YmgjWbrsntHRtxffJNxVZiRwGwxuEl1oD0I+pzXRWc+YRB0W5L4ctK9CqPGohryRgqrSkQJlAkdherAtVZ5h05V4uoOGdY7WnE67pzalpKbLQLuKzFdiQORHk9UANslBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BD30PwzL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BD30PwzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F041F00893;
	Tue,  9 Jun 2026 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990460;
	bh=GKMXiBpjL54krW7Ij3+vSOaYgR+z4B8wc3h+zOk8PiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BD30PwzLcfG31rqzM+qLb6RcLshde+UxruSa0nnzQTmVMjzqK496TP+MDgv2mc4oa
	 pmH4fqB8YojZATjJHasr7CycBq40b9xFwx4KQ3AfqDURUVY9O7VKjufaf389uwHIoc
	 FGEcHGo2IKeOBpL5/QNDh1t0Kwdlg7zsWh2udv9PQeeTYN/PnpDcnIUvWwNAcN8NWb
	 t4QXcew63MwP+wYiO5z98ZhWmZuBWFJkuf3EMZ0vNdJ6iZ7Ac4gcZ1HaXIHi1h7lvv
	 S/VHKWzY+YQiKSV1ynXV+WwEzUsnWfHl+Kf91a0p5JWAbuL1jEsQuIBKfWeyfiU1eh
	 Nl6Lap3wo5RCA==
Date: Tue, 9 Jun 2026 09:34:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, 
	devicetree@vger.kernel.org, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH 2/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
Message-ID: <20260609-visionary-truthful-viper-ceff75@quoll>
References: <20260609030623.17404-1-zhangyi@everest-semi.com>
 <20260609030623.17404-3-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609030623.17404-3-zhangyi@everest-semi.com>

On Tue, Jun 09, 2026 at 11:06:18AM +0800, Zhang Yi wrote:
> Fix the issue with incorrect modifications to mclk_src

What issue? Your commit msgs are really poor - explain nothing. You just
duplicated subject... and anything can be a fix.

> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  sound/soc/codecs/es8389.c | 12 ++++--------
>  sound/soc/codecs/es8389.h |  5 ++---
>  2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 9c8164916..7a9d5d42a 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -36,8 +36,8 @@ struct	es8389_private {
>  	unsigned int sysclk;
>  	int mastermode;
>  
> -	u8 mclk_src;
>  	u8 vddd;
> +	bool mclk_src;
>  	int version;
>  	enum snd_soc_bias_level bias_level;
>  };
> @@ -607,9 +607,9 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
>  	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
>  	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
>  
> -	if (es8389->mclk_src == ES8389_SCLK_PIN) {
> +	if (es8389->mclk_src) {
>  		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
> -					ES8389_MCLK_SOURCE, es8389->mclk_src);
> +					ES8389_MCLK_MASK, ES8389_MCLK_FROM_SCLK);
>  		es8389->sysclk = params_channels(params) * params_width(params) * params_rate(params);
>  	}
>  
> @@ -897,11 +897,7 @@ static int es8389_probe(struct snd_soc_component *component)
>  	int ret, i;
>  	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
>  
> -	ret = device_property_read_u8(component->dev, "everest,mclk-src", &es8389->mclk_src);

Why are you changing implemented ABI?

Best regards,
Krzysztof

