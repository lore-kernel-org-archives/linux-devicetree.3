Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9C43AAF65
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434580; cv=none; b=BuoKHUdfQWFWAg/NALYnVEI1l+upRwNiCIexyzFDn/bP5n90e965dw6HTrhivhu8w7ikFsDEFxo/wWunmNwwXtR/WrxI2OQXLL7RMg3HHnNnR8pSHTodyy3st7dSAffGJboxITrrISsC4obNusMZ+mDxOV05s/Qb9DgDdKgK+NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434580; c=relaxed/simple;
	bh=Y685lCDcZB8/IR6WrgStA2/ieUMBcz3dBtiiXxOgyH8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jJResCULlkycoIQRR1UWXAGqN3uDRrWZpPdc0w473Mw0yg1Cyt/rwvF1SMHe8Fm4EScZ78JWXKgBWf+PFmTij7BaLxKL19E0BetrkFC4doAPQQfkrjtPLS/n+j+3pO+XzUiE/V80l9hGnyh2Y6ScH+vN87I0j+oZk6Ij0IIRZmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSjmfKII; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSjmfKII"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B911F000E9;
	Thu, 30 Jul 2026 18:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785434579;
	bh=OkJOZ/Y1GIjerGYQfzLgXyWaNHOMurhEjMlSYGMonCY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aSjmfKIImeA9ZrN3cUi/+x7TRYnyczjWwvrmVO0w4bKyMUPlqehuVU3itrq72m6T9
	 ROJKYteIYc0CfaTzaiarx2INUbl1faCqnXX8+xSkh5oO4VQetQY2kYeq+p0s8zJV4B
	 0BM4jybrM09pcQovV5GvGb+JkPKQVWJJCdkjQRHDIzpsoOUlulwtjoXwmRjhVLdukt
	 fqPehK/cov1BFrSHMvwfLtzS2wPVHTB5CgaZHbDVnUZLru3fJAkNpYz3hivRu/bkcQ
	 lQlbYs4NZTC6M1h0ooV3GF34bOvJiatvxympZm4F0pLpjxKUKcBaVKGi0gGw0UMalC
	 eVXIkkqMD+EJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/15] ASoC: qcom: sm8250: add support for
 LPI_MI2S_RX_0 and LPI_MI2S_TX_3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260730174353.108023-12-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 18:02:58 +0000
Message-Id: <20260730180258.92B911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The machine driver enables sysclk on startup for the new LPI_MI2S =
DAIs but fails to disable it on shutdown, resulting in a clock and power le=
ak.
- [Medium] Ignored return values from hardware configuration functions `snd=
_soc_dai_set_sysclk` and `snd_soc_dai_set_fmt`.
--

--- Patch [11]: [PATCH v6 11/15] ASoC: qcom: sm8250: add support for LPI_MI=
2S_RX_0 and LPI_MI2S_TX_3 ---
commit ed124256581921c49604c5e5d63d1989a91f17c4
Author: Richard Acayan <mailingradian@gmail.com>

ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3

This commit adds support for the LPI_MI2S_RX_0 and LPI_MI2S_TX_3 ports
on SDM660. The new ports are connected to digital and analog WCD codecs
and are initialized using the same logic as the existing ports.

> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
[ ... ]
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
Does this code leak the DSP clock reference? The sysclk is enabled for the
new LPI_MI2S DAIs on stream startup by passing a positive frequency, but
there does not appear to be a corresponding shutdown handler to set the
frequency back to 0.=20

This might leave the clock running and prevent the SoC from entering deeper
sleep states.

> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);

[Severity: Medium]
Should the return values of snd_soc_dai_set_sysclk() and
snd_soc_dai_set_fmt() be evaluated?=20

Hardware initialization errors in sm8250_snd_startup() will be silently
ignored, which could cause cryptic audio playback or capture failures rather
than a clean initialization error.

> +		break;
> +	case LPI_MI2S_TX_3:
> +		codec_dai_fmt |=3D SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_CAPTURE);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>  	default:
>  		break;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730174353.1080=
23-1-mailingradian@gmail.com?part=3D11
