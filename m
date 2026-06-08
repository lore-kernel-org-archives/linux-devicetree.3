Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A5933065C
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780886503; cv=none; b=qqbN9xozqTWVczUvN+eQiiVXH/9de7cBP9c3S1AamID3tOkTbU83WNqZRWS1Xg/Crn2vwagCa3KLqqGUONyWUp73dI0c7Rz4vbApDPASbPX1I9sMDFK2tDmYVRim4Dc0A70mSW8wn9U6W2C6UZrsAwasf2Fa+pTsW0nkZ0Y+bug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780886503; c=relaxed/simple;
	bh=HMDr7ZCj94N3RIOsHsK1MtJ+boDz90q3TjKjqMYwbE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=md/8oJrAGfdzOjEu2Vg/ULXy1/hxZaDeeGRvuysqvgceZQskKfi8zKaZNi7LjTESC0zfW3Pef/fWwDEnZo4Tlxz1wL//r60eWDDaOFrJI2eK9BOMAXIeaE1oV8oqyatImiaObNOmlxKYex/4SBRA00m57hkJd7KZ4Y5sC49SIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ee2INdxZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ee2INdxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F311F00893;
	Mon,  8 Jun 2026 02:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780886500;
	bh=lZ9cnG9EKe/mDlntUChcJcRK6uMkuMUWSKl9Qx10V0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ee2INdxZ0MTM7osHdv/eU7TXVHAzAfG7F8QxICPF1KuI3BhxPF9CFmQdyAtVhecXF
	 dgvMyxWii6K+QazX4VrI/3i2if1ldLwpYLY2cRCLREtXEMS7AMT8WgMnAjXdegiq9Y
	 H5qMDvL10tykhgDXY3q/iIx1CHXGrLNfLVfIfoMUd5BEA7nExkv5myCtzjQsym8Hlm
	 0hKzeCKieON0LRjLyDfnQJCH0hOh+PIV5UUQKOvpwta+WO+fck9BdddcXckGfIIm3m
	 BE5VvoCzyOhTT2jguQ5ZTequf50IRP1hxbqZ8pzHYX5ic2dLFjOFYq4ECaJys/vMzh
	 HwnD4XVyAZZ2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp:
 enhance machine driver for board-specific config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608023011.942228-4-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608023011.942228-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 02:41:39 +0000
Message-Id: <20260608024139.E7F311F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `sc8280xp_get_mclk_freq()` incorrectly compares integer sample rat=
e values in Hz with ALSA `SNDRV_PCM_RATE_*` bitmask constants.
- [Medium] The `codec_sysclk_set` flag incorrectly applies the sysclk confi=
guration to the CPU DAI instead of the CODEC DAI.
- [Low] Returning `-ENOMEM` when `of_device_get_match_data()` returns NULL.
--

commit 66516d9230e47a6cd893799b841db83183cc7051
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for boar=
d-specific config

This commit enhances the sc8280xp machine driver to support board-specific
configurations. It allows each board variant to provide its own DAPM widgets
and routes, and enables MI2S MCLK programming for external codecs that
require a stable master clock.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 7925aa3f63ba0..1f3afc6d015cf 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
[ ... ]
> @@ -12,17 +12,77 @@
[ ... ]
> +static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *param=
s)
> +{
> +	int rate =3D params_rate(params);
> +
> +	switch (rate) {
> +	case SNDRV_PCM_RATE_11025:
> +	case SNDRV_PCM_RATE_44100:
> +	case SNDRV_PCM_RATE_88200:

[Severity: High]
Does this switch statement compare integer frequencies in Hz against ALSA r=
ate
bitmask macros?

The function params_rate(params) returns the actual sample rate in Hz
(e.g., 44100), but macros like SNDRV_PCM_RATE_44100 evaluate to bitmasks
(e.g., 1U << 6, or 64). Because an integer frequency will never equal its
bitmask value, it seems this switch will always fall through to the default
case.

This will accidentally yield the correct multiplier for 44100 Hz streams, b=
ut
will incorrectly calculate the MCLK rate for 11025 Hz and 88200 Hz streams.

> +		return I2S_MCLK_RATE(44100);
> +	default:
> +		break;
> +	}
> +
> +	return I2S_MCLK_RATE(rate);
> +}
[ ... ]
> @@ -96,6 +152,47 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc=
_pcm_runtime *rtd,
[ ... ]
> +static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
[ ... ]
> +		if (data->snd_soc_common_priv->codec_sysclk_set)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       0, mclk_freq,
> +					       SND_SOC_CLOCK_IN);

[Severity: Medium]
Should this call configure the system clock for the codec_dai instead of the
cpu_dai?

When the codec_sysclk_set flag is true, it appears the intent is to configu=
re
the external codec's clock. However, applying it to the cpu_dai pointer mig=
ht
leave the external codec unconfigured while inadvertently assigning an
unintended clock configuration to the CPU DAI.

> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> @@ -145,37 +243,116 @@ static int sc8280xp_platform_probe(struct platform=
_device *pdev)
[ ... ]
> +	data->snd_soc_common_priv =3D (struct snd_soc_common *)of_device_get_ma=
tch_data(dev);
> +	if (!data->snd_soc_common_priv)
> +		return -ENOMEM;

[Severity: Low]
Would it be better to return -EINVAL or -ENODEV here instead of -ENOMEM?

A missing device tree match or absent platform data does not seem like a me=
mory
allocation failure, and returning -ENOMEM might create confusing kernel logs
during debugging.

> +
> +	card->owner =3D THIS_MODULE;
>  	card->dev =3D dev;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608023011.9422=
28-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D3
