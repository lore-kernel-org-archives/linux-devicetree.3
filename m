Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A8C3845CB
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362933; cv=none; b=E/h8NlbG7OQURq7oYmmoDOjjajebX+FSD6ntg8QucqZEOh5dVPlCzdgRNY/ZBEe6PtQnhfd+c75oHvvs2V6sJ/gMvkdrb1V4ndfRjkaNi3Ow7ehHDlPw9Mr0T2ztZkPR05qbCvDC6rHOUJ5oPqCocpnTwzjQGNN+cNm8YPdiU9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362933; c=relaxed/simple;
	bh=tvHMtWvu0zmrav+lw/jlCu2bboPKX/L6uOXISQ/b0RA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c73ysorVtGkv+Gh3CT8sPJWwIg5hw4V/xnWiQpKJJcOkx/WK4IVroAhNX6100YuCYNyndD1ut0TJrAqAcH7gcm1r0ARDPK/WmtlvIfCgCTzSJqrstg/dU3DLL9PKbK34mAc0ssRMdbnG2kNZs4vIJgVTho0n4pfKmHpOFxkvg1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AfrAUEb+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AfrAUEb+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so36346685e9.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362929; x=1791967729; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3WmTcY7Cx2LB7n34xA1mszrSAOkEucT8groA+9/JLE=;
        b=AfrAUEb+0bmnxLbMxPSFLDRXtKdHdCVIpPxSMZwdPbo7L6KPc5mdCQKAFHskqAEf/N
         9OZbT4VNG60HmQxW7owGfjDNpyV2xGg2UocGj6y4SwMrIS6KAanCKiP/K/pnqcDRGpBx
         WnVGA+jC30NyfJNPbeED/nmj6YdUPGZNoq3JhrOWlHooYmBu7TGxynCpIFT7NW09AyRB
         WGokmM8L1cgt6eTspDEb/itFAYMBO1JCuQYd5ZY9eF6/WRRPXGnmCUcGcCosMHsya1Jt
         MxwOgiOfZq+3WZm0ElOMRzZ3tyOcxta5BacU6qUJX8tcnTIOTUy2qrgxnS+6oql5p4QK
         l9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362929; x=1791967729;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3WmTcY7Cx2LB7n34xA1mszrSAOkEucT8groA+9/JLE=;
        b=CW65h4MsUp+ytD7HbOKP/6BEt68vrUkdYfe+/ywGz0vDG58OPVUU14BAHHDT7oQfzP
         1kgfUMKaLmfwbv5+BDFO667T9NWYZi2KsLmN4pkLrtBcqmcd0KbnI2kK16PYgW1ifmb3
         bRI8rK4gM3d7dL3XiPiHisg4PbTk+4tQMM+Ol5/y+tq9FpqsRRbqNn+jDe7Pq+WOCSRR
         ag0TgbBF4XirFTrYAmU2Livv4J2vlvNCCUl0H9JTW32UeaZgIyRRDw+zjVcmhWkDhy8Q
         dHIvb/4BCbfIFDR4JZgnbeWKOrdzRbzTifuiKRBq71jk7bz7nT5jPEVAir1GxJNCvYxS
         YABw==
X-Forwarded-Encrypted: i=1; AKwUvBxLCG29yybt6hhT/1SpSmC27vFa5ka0Ym7BI93CF77dSlsHPf5tDKamm2ZQ48Avsd/D9vsBYcK8VP0y@vger.kernel.org
X-Gm-Message-State: AFuF++mbdXiLMCrKl3wjr1ROFbLjznDhJjq55LfCY98M9F9u3YU8p0+J
	hEnmlL+I8biPSdzcgXbWf/JFAurGzmM8WbaIsmbezpp912P+/lg7tMQ1xzzkcaLn+04=
X-Gm-Gg: AYBFou03XvwHjd4O4zBO+N1zb9NLeeNxsd4Gun0I5MPZgVqqebThs5R/MRlffIgvqlg
	uZGN52xC4YAJzEwumB16YhO+qdhJ9V5HzSPARUInDxLQZ7fFDaWuqr9x8Agi4uEBn9gztWNEm1P
	uvwKHPoysfplMPmsMXnVWyHJmtEFZuzEHXlY7cMKd09z++cQ8G0YY72U5gPOmwfxQEF+Vljo9BD
	f9R76TIAWx2I7h0Js5cpPjC5hThs71xBmbLUviMkNCCQjKbXx7VEt+WmD3QCUXhxSIqsrDQA3Wx
	SIH3T3WC1LTQD9CToJJxvoC5zd1aHOG99O17yw8vcv0z5jXIcWZJxqfUyzXoUxM/blLfg2HaXHX
	iiJytc4h8CmbsYwG7Os8M/l4tMx3NLjdptJ9iUebWwS4wYPbBNxP86XC4BwLJJ3RHCQc1vGwUE3
	Vox935HiCpVUzIS3jECsaaJYXoXyeY3aTp0ntQ2/ISN2SY07O9QwGOSvFm1d1FZRkSJNGJi9VcM
	pdLIkMMJkFzzKc=
X-Received: by 2002:a05:600c:4687:b0:4a1:7811:6cc4 with SMTP id 5b1f17b1804b1-4a180650943mr24592905e9.34.1791362929425;
        Wed, 07 Oct 2026 01:48:49 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f558028sm58745425e9.10.2026.10.07.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:48:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 5/7] ASoC: meson: aiu: add I2S Capture DAI
In-Reply-To: <20261001-audin-v4-5-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-5-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:48:46 +0200
Message-ID: <1j33uhzyj5.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Add capture stream to CPU_I2S_ENCODER making it able to handle both
> playback and capture streams. Captured data is formatted from
> "audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
> FIFO and then bulk transmitted into RAM when the FIFO is full.
>
> As for the naming of the stream "I2S Encoder" is kept as base following
> the same pattern used for the playback stream and with the goal to minimize
> changes.
>
> Supported format for capture is currently limited to S16_LE because it's
> the only one that has been tested. According to the manual also S24_LE
> should be supported, but this is kept as follow-up.

---

>
> This capture support also takes advantage of the following commits that
> has recently been merged:
>
> commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
> commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")
>
> They ensure bs_quirk and rate symmetry across playback and capture streams.
>

I don't think this part of the description is necessary.

Apart from that

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>


> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  sound/soc/meson/aiu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 535fbf7c1639..14d0e20a4bd6 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
>  			.rates = SNDRV_PCM_RATE_8000_192000,
>  			.formats = AIU_FORMATS,
>  		},
> +		.capture = {
> +			.stream_name = "I2S Encoder Capture",
> +			.channels_min = 2,
> +			.channels_max = 2,
> +			.rates = SNDRV_PCM_RATE_8000_192000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		},
>  		.ops = &aiu_encoder_i2s_dai_ops,
>  		.symmetric_rate = 1,
>  	},
>
> -- 
> 2.47.3
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
