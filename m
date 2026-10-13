Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E44718CB
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891103; cv=none; b=Rym770/2AgchtKTygjWUupgc8MlghEKB/ohAatNOYfloSIToLVzucADV8Lfn0f41iR/yRzkeUXLLy1xKOs8FeRpWgMyhcrKxrHgyt6fdEIADPesn03ENI/RCYpB98RjG9qroPYRHCgIOw2XSQBZq35zBG40YoYxX4M9wprZ5dmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891103; c=relaxed/simple;
	bh=7NsHArgFmE3BMlV1pM1VMX2el5m5Gtov/rVUNKdeqGs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=D8/5TJU7La+2qlQ0wx7SkUFCcE3Q6+GPytD71Vjaogwfb4vXDhqC0iff+NePXdEfyCH74VAjMY/GHmiKJ9Dfrr+fOT2y0QGfnEwmVmdLd5yWnV0OYhTVFhMyb+DvM8ZDeGSsORHn6va91wF0Xn4aTdHIvPKqr2aNjF4NxhYOJnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WF78K9JA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WF78K9JA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936031F000FF;
	Tue, 13 Oct 2026 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791891101;
	bh=YR6264L1PFY3XqmuCd7bttm+axnsdzPMLpoU48cjqbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WF78K9JA87Hbd46+E9DcxR4HxvejUIr1HfYVVR7PnVXYmMkoicNE+LAa1ZukTrX7K
	 J/8eCgPoluAjwlMk3KVWZmSkJpUu0ivsGxSYOxkq9Tc5mXo5YGjUJCX5e6u1q0WLPc
	 IKw7XFX4hvOFuhbUJOKhFi//9lU1loLb7J5IlLrx7Z/09fEbJFU/9IiiS3SAvR+Zgj
	 ixDfvwztE0+DCgpeEd4abW3qm/NaFQK1c4hzhFa+traoCDf06lb6o1fc0tJl+Jb+Lz
	 Muq3bKtHShudk1yYnx8xlkE8CAg/0Pf9+KzKAiVEW3S3YcnqNhjWsTtMtnNIDtTKJM
	 9X5TYdHe9Z9jA==
Message-ID: <sashiko-outbox-169628@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/10] ASoC: qcom: Add QAIF PCM operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-7-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-7-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:31:41 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: qcom: qaif: Undefined behavior in GENMASK due to unchecked z=
ero channel counts
- [High] ASoC: qcom: qaif: HW register state loss on suspend/resume
- [Medium] ASoC: qcom: qaif: Typo in DMA configuration writes DMACTL consta=
nt to DMACFG register
--

commit 19722e0c0803b48feb5e66f22dfc7dca7c2d611e
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF PCM operations

This commit adds the PCM platform callbacks needed to use QAIF DAIs for
playback and capture. It handles pre-allocating the DMA buffer, reserving
DMA stream indices, one-time hardware initialization, and programming DMA
clocks and registers.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-platform.c

[ ... ]

> +static const struct snd_pcm_hardware qaif_platform_hardware =3D {
> +	.info			=3D	SNDRV_PCM_INFO_MMAP |
> +					SNDRV_PCM_INFO_MMAP_VALID |
> +					SNDRV_PCM_INFO_INTERLEAVED |
> +					SNDRV_PCM_INFO_PAUSE |
> +					SNDRV_PCM_INFO_RESUME,

[Severity: High]
When the system suspends and the LPASS power domain is turned off, will the
QAIF hardware registers (SHRAM mappings, EE resources, AIF/CIF interface
configs, and DMA base/lengths) lose their state?

If the hardware loses power context, advertising SNDRV_PCM_INFO_RESUME
instructs ALSA not to call the prepare function on resume, leaving DMA base
and period lengths unprogrammed.

Additionally, because the qaif-cpu regmap uses REGCACHE_NONE, it will not
automatically restore state during pm_runtime_force_resume.=20

[ ... ]

> +static int qaif_map_ee_resource(struct qaif_drv_data *drvdata)
> +{
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +	int ret;
> +
> +	ret =3D regmap_write(map, QAIF_EE_RDDMA_MAP_REG(v), GENMASK(v->num_rddm=
a - 1, 0));

[Severity: High]
Is it possible for v->num_rddma to be 0 if a SoC variant lacks a specific D=
MA
path?

If v->num_rddma is 0, v->num_rddma - 1 underflows to -1. Passing a negative
upper bound to GENMASK results in an out-of-bounds shift operation, which is
undefined behavior and can generate a corrupted bitmask that will corrupt t=
he
hardware's EE map registers.

Could we add boundary checks for the DMA channel counts similar to the check
done for v->num_intf?

> +	if (ret)
> +		return ret;
> +	ret =3D regmap_write(map, QAIF_EE_WRDMA_MAP_REG(v), GENMASK(v->num_wrdm=
a - 1, 0));
> +	if (ret)
> +		return ret;
> +	if (v->num_intf > 0) {
> +		ret =3D regmap_write(map, QAIF_EE_INTF_MAP_REG(v), GENMASK(v->num_intf=
 - 1, 0));
> +		if (ret)
> +			return ret;
> +	}
> +	ret =3D regmap_write(map, QAIF_EE_CODEC_RDDMA_MAP_REG(v),
> +			   GENMASK(v->num_codec_rddma - 1, 0));
> +	if (ret)
> +		return ret;
> +	return regmap_write(map, QAIF_EE_CODEC_WRDMA_MAP_REG(v),
> +			    GENMASK(v->num_codec_wrdma - 1, 0));

[Severity: High]
Does this code have the same GENMASK underflow risk if v->num_codec_wrdma
is 0?

[ ... ]

> +static int qaif_init(struct snd_soc_component *component)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	int ret;
> +
> +	if (drvdata->qaif_hw_configured)
> +		return 0;

[Severity: High]
If the system resumes and attempts to open a new stream, will this prevent
the SHRAM and EE resource maps from being reprogrammed after they were wiped
during suspend?

[ ... ]

> +static int qaif_platform_pcmops_hw_params(struct snd_soc_component *comp=
onent,
> +					  struct snd_pcm_substream *substream,
> +					  struct snd_pcm_hw_params *params)
> +{
[ ... ]
> +	ret =3D regmap_update_bits(drvdata->audio_qaif_map,
> +				 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACFG_SHRAM_WM_MASK,
> +				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACTL_WM_5);

[Severity: Medium]
Is QAIF_DMACTL_WM_5 the correct constant to use here?

The code is updating the DMA Configuration (DMACFG) register, but
QAIF_DMACTL_WM_5 appears to be a constant intended for the DMA Control
(DMACTL) register namespace. Should this use a QAIF_DMACFG_ prefixed consta=
nt
instead to avoid misconfiguring the hardware watermark?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-b4-qaif-sh=
ikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com?part=3D7
