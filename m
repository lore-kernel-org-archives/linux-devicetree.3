Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1309257435
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828225; cv=none; b=rFNLWuSkeQdT/yD9IfL5cbdYqericVJCWDmJ7aoahJ2rF5iLqbyrKTkW0K4gyWLqRbxpPb7XdUCu0GbIAbFNalX1JLRlyq/311XKnDHF9wU2BW/aKUUX2mBxp2wHVRLGnQlMosz/fH0eMuGCx5keKROVgT1YCflKYAgPQxjVNBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828225; c=relaxed/simple;
	bh=UdpTEIJi6g0+KqdFv49Yy3LwXH28yToVwUh0ntQ7ndw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ji7DRdSFCpXT3uncxP91OnMyJjbBDx6ehtSCSMwsH3IBqwpQ/X37jJUfeBCD4/Lf8jkJx3Z0a44VhL0tXQgv9WTtbmF/TGX343ri8sOikTePDwDS0bQ9SCpWj5jKDz/JTTJ93er0pA2VCJHZIVmL6EFS2zNYVLBryuTFDdAW2ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBjxzuyz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBjxzuyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C701F00A3A;
	Tue,  4 Aug 2026 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785828223;
	bh=2ALnBz5utRtDfz/6ncNiibxRuS9FDr9EW21kTEHzpS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GBjxzuyzf11HQCLbAWXDBntacaTUi5jvV4wSUtuajP23nFfVNBwFJo2P2eIaa5eLF
	 sdDlbGvKzkuLlMa41bgWXOhXm7cErUy5PxLevj9WBoh/ZVWkWQI1ekvFZibhhud7y6
	 UAtSWAI8ikUMLIcXHIQ3ZJBNoIWrB02a3vn5p8L7gC6KoU9d2le289gLs6xkGE9MeJ
	 LH4EWm682ULMyEbSe0ZJH5mC6jpNZSFLmP6QP8Er7veGAFaYgHVRHHH7owifT6rDG6
	 S7KmvBXJtZYnBcZi2kQRk+VDQBXyoPep1O9GVoSuVDzRbSupsEaS9PeriICh/gKhuu
	 vf2s+xfMv++ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/7] ASoC: qcom: sc8280xp: add TDM hw_params support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804070307.117119-8-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-8-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:23:42 +0000
Message-Id: <20260804072343.61C701F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] sc8280xp_tdm_hw_params() fails to ignore -ENOTSUPP errors from snd=
_soc_dai_set_fmt() and snd_soc_dai_set_sysclk(), causing unconditional stre=
am failures for TDM DAIs.
- [Medium] The return value of snd_soc_tdm_params_to_bclk() is incorrectly =
stored in an unsigned integer, causing potential negative error codes to by=
pass the error check and be used as huge clock frequencies.
- [Medium] sc8280xp_tdm_hw_params() sets the audio format for the CPU DAI b=
ut fails to configure the format for the codec DAIs.
--

--- Patch [7]: [PATCH v7 7/7] ASoC: qcom: sc8280xp: add TDM hw_params suppo=
rt ---
commit f81d8adf5e4da9f01c411fd511ee11515191c223
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: sc8280xp: add TDM hw_params support

This commit adds TDM backend handling to the sc8280xp machine driver.
It parses standard DAI TDM slot properties and derives the LPASS backend
bit clock from the runtime parameters.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index c3ce3e05b2608..597c0d887d2f4 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
[ ... ]
> @@ -106,6 +106,63 @@ static inline int sc8280xp_get_bclk_freq(struct snd_=
pcm_hw_params *params)
> +static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params)
> +{
[ ... ]
> +	if (!cpu_cfg.slots)
> +		return 0;
> +
> +	ret =3D snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this strictly require the CPU DAI to support set_fmt? Since the QCOM D=
SP
TDM DAIs (q6tdm_ops) do not implement the set_fmt callback,=20
snd_soc_dai_set_fmt() will return -ENOTSUPP. Should this explicitly ignore
-ENOTSUPP, similar to how it is handled in the MI2S path, to avoid failing
stream initialization unconditionally?

[Severity: Medium]
Additionally, this sets the audio format for the CPU DAI, but does it omit
configuring the format for the codec DAIs? Without setting the format for
the codec DAIs (like data->priv->codec_dai_fmt used in the MI2S path), will
the codec remain in its default format and cause a mismatch with the CPU DA=
I?

> +
> +	ret =3D qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
> +	if (ret)
> +		return ret;
> +
> +	bclk_freq =3D snd_soc_tdm_params_to_bclk(params, cpu_cfg.slot_width, cp=
u_cfg.slots, 1);
> +	if (!bclk_freq)
> +		return -EINVAL;

[Severity: Medium]
Can snd_soc_tdm_params_to_bclk() return a negative error code like -EINVAL
here? Since bclk_freq is an unsigned int, a negative return value would
underflow into a large positive integer. This would bypass the !bclk_freq
check and potentially pass an invalid massive frequency to the system clock
provider.

[ ... ]
> +	if (data->priv->codec_sysclk_set) {
> +		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +			ret =3D snd_soc_dai_set_sysclk(codec_dai, 0, bclk_freq,
> +						     SND_SOC_CLOCK_IN);
> +			if (ret) {
> +				dev_err(rtd->dev, "%s: failed to set codec sysclk on %s: %d\n",
> +					__func__, codec_dai->name, ret);
> +				return ret;
> +			}
> +		}
> +	}

[Severity: High]
Will this codec sysclk setup loop fail stream initialization if any codec in
the link does not support setting sysclk? Similar to the set_fmt call above,
if snd_soc_dai_set_sysclk() returns -ENOTSUPP, should that error be explici=
tly
ignored rather than treated as a fatal error?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804070307.1171=
19-1-prasad.kumpatla@oss.qualcomm.com?part=3D7
