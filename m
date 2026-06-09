Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412A63FBB4E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023402; cv=none; b=qnJvsSYfhlwHgEaoQ3vFQRQHfKNXgU4zeugZ0R0TddkZmGxL8o9p3dqBeOE4elNpdnHDrhSWAo7q3nBpEV1OkaERNEvLOngrwdd9YpCiaWy5Ala7IPoYJn9rogonS7bWH6n3Gy0e1D9J1OPnXDdBax5dXWFYa2t2dPupYf6L7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023402; c=relaxed/simple;
	bh=s4b6LKTDbBvwZ8cPN/Mr22GRS1I7mat/njKu7GutF0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kqeNhaK9gKPMbZOWYNZC+3XG/+qZ7JDH5UVKpv28Y6tDqxOxoqoBIX1NWGpmVmzsuVAMoipxGxmrOt7U2bo/eI4cOWLPAAHgTrlKMSqJ/P6dlpC2lN4KEvaG6xphpsMK7F5ilN13CkgAu6vB3pvGD2VQ0xB4Em3x6+b8rj9iOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDhDi4K3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDhDi4K3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BAD1F00893;
	Tue,  9 Jun 2026 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023400;
	bh=FVh4/SMEcltsFEymo5lmzo6gXUb6OmXfL6j1CKXyR/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JDhDi4K3MvHorPOe6uR79qJb+K2nPFReJTbmxnFbDxE7tjRKxNHpxV650LyI9QpnF
	 QW0Hs85eFLknnpOk6COJTu+vkb2unu2nKnWvAWeGrb6pc1IAe95WnO5u2Wo56hpEuX
	 259HG0saYjoaJO5icXSpaH5TLjfSnePmZ8kNJ4OlKgYcHD3yT6e2jvwhM8vv7nzAuX
	 7STAND3iqvASz7NIoDR1Jq7lGGIDdA5tLsT/0t0FPQ1VJRFl18W0GR3GbdwjLfgBZE
	 HOA2M/+0VLAt9ff7SCuQgKwyjkCX85wQmqurFWYpASTp8HfwHMcbLYbnfQiEH534BC
	 zxtXKvbdzooiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/15] ASoC: qcom: sm8250: add support for
 LPI_MI2S_RX_0 and LPI_MI2S_TX_3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260609162255.31074-12-mailingradian@gmail.com>
References: <20260609162255.31074-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 16:43:20 +0000
Message-Id: <20260609164320.B0BAD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware clock leak: MI2S sysclks are enabled on startup but never=
 disabled on shutdown
--

commit d56ecb81f1a498d069991569b37a6e2d484e4d23
Author: Richard Acayan <mailingradian@gmail.com>

ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3

This commit adds support for the LPI_MI2S_RX_0 and LPI_MI2S_TX_3 ports to
the sm8250 machine driver. It configures the DAI formats and sets the
sysclk for these new ports in the startup callback.

> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f193d0ba63d00..1952c599e004f 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substre=
am *substream)
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
> +	case LPI_MI2S_RX_0:
> +		codec_dai_fmt |=3D SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);

[Severity: High]
This is a pre-existing issue, but does this code leak the hardware clock?

The machine driver enables the DSP MI2S IBIT clocks via
snd_soc_dai_set_sysclk() during stream startup, which sends an
AFE_PARAM_ID_CLOCK_SET command to the DSP.

However, looking at the rest of the driver, the associated .shutdown
callback (qcom_snd_sdw_shutdown) is specific to SoundWire and ignores
MI2S DAIs.

Because there is no matching logic to call snd_soc_dai_set_sysclk() with
a 0 frequency on stream close, will the DSP clock remain permanently
enabled after the first playback and prevent the DSP and SoC from
entering deep sleep states?

> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609162255.3107=
4-1-mailingradian@gmail.com?part=3D11
