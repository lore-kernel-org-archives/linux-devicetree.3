Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4320480974
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041570; cv=none; b=AqW/Pqg3efxuyGADaoK3ctmjvm0lXNLdZUFAWBb7wwLLgvSuOhCTQPuJ5e+BiwCcJO1mpS8NSpFyNEembOkogpYldE2wT9kS1HYWa6zPVctN/bzUjKLwcMAfx97IuxG73q1lePfizdzdmB6T903rBet1lC8WEf4T0Le/xLDDKFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041570; c=relaxed/simple;
	bh=TtLceFX4AL3CnSI+zVU/POpvnjgwTiKWKX/ffcEBbWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eJwBXcC3TJRK8uc612stRFhEgpZF5A4VW7q9ElZBsgIJCfrneSUNDu/y7AOU8IM2C2M5BiRKliLILmpOSoeyTAsZpCh2p9oYwJKqSMIzjtBUSfKQiIZAfBOJWlZBxRLWoFOdMA5cUU6boANQsk3phtBhyTRMgvFccdMXI012eAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MD3L8DKn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MD3L8DKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1288E1F000E9;
	Tue, 14 Jul 2026 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784041569;
	bh=yggJnRqcQF/oCmJ1iEyumLXSBO69z6g86yfGnMc72Yk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MD3L8DKnhfMallK9/yzxj4ZFZ94H6ZU7rlrrNeKnP6V0n1ElSoxNIKJxrdJVDmSeE
	 tK/9xZY91EUWc3PkjitMd4mssmPp5Psm9SxW4gfaZVp3nzlA3l1fW8uolCSo7uOWI8
	 DwRkUKN9UKLwCDCzVgcnnc03d4v4lDKckcksG/g7UnraZLTzsZsQlvHCDWsoL8IXJo
	 zUVImKiWZhfl4oF2+gduONElB6FUaKlvnd1P2khNqqlMrk78pBe1D3+ZoHWnei8aBW
	 3YESfCoZYXQDHu3AVNog2E8sNs5025QiAy8sZlNuCik0i8rd0XkT18r770ZIORwjhb
	 XVXTy+LYaDZQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] ASoC: qcom: sc8280xp: enhance machine driver for
 board-specific config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714145250.2473461-4-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260714145250.2473461-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 15:06:08 +0000
Message-Id: <20260714150609.1288E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect error code check for unsupported DAI format operations=
 in `sc8280xp_snd_hw_params`.
--

--- Patch [3]: [PATCH v5 3/3] ASoC: qcom: sc8280xp: enhance machine driver =
for board-specific config ---
commit c24a266f369f96e073e2a8a89d27c04935c6d52d
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

This commit enhances the sc8280xp machine driver to support board-specific
configuration. It allows each board variant to provide its own DAPM widgets
and routes, and enables MI2S MCLK programming.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 98b15a527e37e..109e39b93b2dd 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c

[ ... ]

> @@ -96,6 +156,63 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc=
_pcm_runtime *rtd,
>  	return 0;
>  }
> =20
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
> +		if (ret && ret !=3D -EOPNOTSUPP)
> +			return ret;

[Severity: Medium]
Should this error check evaluate against -ENOTSUPP instead of -EOPNOTSUPP?

Looking at snd_soc_dai_set_fmt() in sound/soc/soc-dai.c, it initializes ret
to -ENOTSUPP (524) and returns that if the DAI driver doesn't implement the
set_fmt operation. Since -EOPNOTSUPP is a different value (95), will this
inadvertently propagate the error and fail ALSA PCM stream setup on hardware
where the CPU DAI does not implement .set_fmt?

> +
> +		if (data->snd_soc_common_priv->codec_dai_fmt) {
> +			ret =3D snd_soc_dai_set_fmt(codec_dai,
> +						  data->snd_soc_common_priv->codec_dai_fmt);
> +			if (ret && ret !=3D -EOPNOTSUPP)
> +				return ret;

[Severity: Medium]
Similarly, could this cause stream setup failures for codecs that don't
support set_fmt?=20

If the target codec DAI is missing .set_fmt, snd_soc_dai_set_fmt() will
return -ENOTSUPP rather than -EOPNOTSUPP.

> +		}
> +
> +		if (data->snd_soc_common_priv->mi2s_mclk_enable) {
> +			ret =3D snd_soc_dai_set_sysclk(cpu_dai,
> +						     LPAIF_MI2S_MCLK, mclk_freq,
> +						     SND_SOC_CLOCK_OUT);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714145250.2473=
461-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D3
