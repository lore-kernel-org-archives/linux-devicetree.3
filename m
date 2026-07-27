Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC1939150B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166066; cv=none; b=HP9QlVayI+4ffg0KsQWQVufR8vGXB4Slg2YcnWdaFa/VBglFWqb69oXtTixNEczSiZ7KJ+VyzTvpJ/H75xOX8A99bJg1XBmEVvT/fS/eQyXFUbZlClkCsm0vvsGDZCKPxJ5jOO8y59LtXUDYwy8ODA5Sb+9guFzOMGbGhbJ+sPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166066; c=relaxed/simple;
	bh=6RUL3RyW9wwNDlc73ptVQejYNxSP0nXhGWXqbrvc1y0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FHwE+ME2mT7DPRXy2RgDRXJgpXlgDbk/zlcIDAcy6Ree67lyZR9ejlkekdwZO8mVx1eor1DHe1BDzvlvj1vOFPOlEF5c0R2m2t8hi3Ynj+1qmR/78Je8hGj35KAfAZXJj55Gs7tKujZw/UrJiTyg1ChZqWu7xns+36DskNZKffc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2/c1xsy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2/c1xsy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04851F000E9;
	Mon, 27 Jul 2026 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785166064;
	bh=PpSu/bKyqVDTYunYuuEXTrk6EQiNuNI8ZplCb8zAY1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V2/c1xsyPm/fB2yGXrgKSMrm1yhJRpsUzVJ+vx6k5VIyV28O3I+ebHyQX+ruW5oQq
	 WuMszZnZKmxo/jObIbWkC7W03X9IlJe6FGAzHgZder21H/wByD90N8zDWTLqMxAV/q
	 QYRA9RV5NSjb0u5wsVhKAHrQZ5iueU567e5PUprj9jO74cxT9k2CrTWOW4wfpV+QB/
	 +1EoJpDVnicgDfKxXG31m6MMfBIayoTszd3p5IwUbZ57vTD7hyOaiwo0Ht7cp/0vBj
	 1WKOKmsDAbh7Ki1+H0nHzYzfNSgqgcmp/FQRIVy54i6ap2pqsUfwAQqs4W+aSF+S6M
	 5wmkiUqlarksg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] ASoC: qcom: sc8280xp: enhance machine driver for
 board-specific config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727151230.408122-4-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260727151230.408122-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 15:27:44 +0000
Message-Id: <20260727152744.A04851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Failure to ignore -ENOTSUPP for codec set_sysclk causes hw_param=
s to fail on MI2S links with dummy codecs if a board enables codec_sysclk_s=
et.
--

--- Patch [3]: [PATCH v8 3/3] ASoC: qcom: sc8280xp: enhance machine driver =
for board-specific config ---
commit 9cac362c036dd5a3de7ece4d5e191a7aa9929dc8
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

This commit enhances the sc8280xp machine driver to support board-specific
configuration for DAPM widgets, routes, and MI2S MCLK programming. This
allows for integration of third-party audio codecs that require specific
configurations.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -96,6 +145,63 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc=
_pcm_runtime *rtd,
[ ... ]
> +static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +	struct sc8280xp_snd_data *data =3D snd_soc_card_get_drvdata(rtd->card);
> +	int mclk_freq =3D sc8280xp_get_mclk_freq(params);
> +	int bclk_freq =3D sc8280xp_get_bclk_freq(params);
> +	int ret;
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> +	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
> +		ret =3D snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		if (ret && ret !=3D -ENOTSUPP)
> +			return ret;
> +
[ ... ]
> +		if (data->snd_soc_common_priv->codec_sysclk_set) {
> +			ret =3D snd_soc_dai_set_sysclk(codec_dai,
> +						     0, mclk_freq,
> +						     SND_SOC_CLOCK_IN);
> +			if (ret)
> +				return ret;

[Severity: Medium]
Should we ignore -ENOTSUPP here just like we do for snd_soc_dai_set_fmt()
above?

If a board enables codec_sysclk_set, this applies to all MI2S links globall=
y.

If any of those links are connected to a dummy codec (which doesn't impleme=
nt
set_sysclk), snd_soc_dai_set_sysclk() will return -ENOTSUPP and cause
hw_params to abort, breaking the audio stream for those dummy links.

> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727151230.4081=
22-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D3
