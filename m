Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF94B95C3
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600868; cv=none; b=kVXS64sii7+JiS+XLwFVG0KGeGKW2XupVerKSzHq/iZRYZlITz91K1ghiL8Cavw9iERx85CbMz+fQtvsRvrzzrn5/mToTjcZLV+qwC7dSW2djx+syf+PL9p3bf+6Pywx4RSIo96fCbMI/CJ1p80dTLzRqys1qjRjdNspAlaabIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600868; c=relaxed/simple;
	bh=fZn/QVDkIbziOeb17GGhD0vpSwDNGdUnulw5vyaVmvA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PuB11DYsZyTTttSPJH6A211opypBWduMULUpUrZt+zZ5Orf2GWLuQ73zHFP/lDbgm+SWAGosuwl6CljPQVsF0sJHB0deSwmOOCGFIl3VVyn3vs1u79bCssYzGPCVHuo3V3FDJlju+or/Z8b44pAGdtmE2EegzzPdqn4Uq0gkQ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrGvxZcr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrGvxZcr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CDF1F000FF;
	Mon, 28 Sep 2026 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600866;
	bh=r4sM0LqBTFO79L7VzFdV70SOxs7eLaglWh/tmeUgHD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FrGvxZcrzgDaXgPgO2tX9u4OZYE0V2IwqfTx7td1nOKzExdEJUmEniYIaXE1rN/Sb
	 Q0auW37F1YscDCkByK+paTaMRMjTZfi8KtCvwj80Cul0rVcB+AA48TcraQZilf/Wg+
	 8pxbW78IvIVQhLANoY3i3E+ifik/IUr2HsvSy5g15d6M0ikGNPu1hu0KjInhicJF3T
	 OoWcQdrdBnhUbHwd3oqPA4A4mZUth1H5zEO2hVLJEm+iQ/Nw/TNoPs22F2t3nW7UPx
	 eCX2/lJx/v2XaDhlcqa98ZpWrbb8ODCIrxCbVGmcRBtoYrbOxLB3UASQIkydEzQoKs
	 ZMSH3QE0tCCkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/10] ASoC: qcom: Add QAIF PCM operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-7-ac618057fe85@oss.qualcomm.com>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-7-ac618057fe85@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 13:07:46 +0000
Message-Id: <20260928130746.89CDF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] QAIF driver fails to restore hardware registers or SHRAM state on =
system resume
- [Low] Mismatch between register constant naming and the register being up=
dated (`QAIF_DMACTL_WM_5` used for `DMACFG`)
--

commit 26a7723ec5d620bcd1ab1da632a18d127c2fe623
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF PCM operations

This commit adds the PCM platform callbacks needed to use QAIF DAIs for
playback and capture. It handles DMA buffer pre-allocation, stream
configuration, and one-time hardware initialization. It also adds support
for mmap on CIF and AIF paths.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> new file mode 100644
> index 0000000000000..e24c4252825e2
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-platform.c

[ ... ]

> @@ -0,0 +1,464 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-platform.c -- ALSA SoC PCM platform driver for the Qualcomm Audi=
o Interface (QAIF)
> + */

[ ... ]

> +static const struct snd_pcm_hardware qaif_platform_hardware =3D {
> +	.info			=3D	SNDRV_PCM_INFO_MMAP |
> +					SNDRV_PCM_INFO_MMAP_VALID |
> +					SNDRV_PCM_INFO_INTERLEAVED |
> +					SNDRV_PCM_INFO_PAUSE |
> +					SNDRV_PCM_INFO_RESUME,
> +	.formats		=3D	SNDRV_PCM_FMTBIT_S16 |

[Severity: High]
This structure advertises the hardware resume capability by setting
SNDRV_PCM_INFO_RESUME. Does this create a regression during system resume
where the hardware state is lost, because the driver does not provide the
required callbacks and state restoration logic to support it?

[ ... ]

> +static int qaif_init(struct snd_soc_component *component)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	int ret;
> +
> +	if (drvdata->qaif_hw_configured)
> +		return 0;
> +
> +	ret =3D qaif_config_shram(drvdata);

[Severity: High]
During system suspend, the hardware typically loses its SHRAM configuration
and EE mapping when the power domain collapses. Since qaif_hw_configured is
never cleared during suspend, will qaif_init() return early without
re-applying the required one-time hardware configuration on resume?

Without restoring these registers, could this lead to a regression where
the hardware remains uninitialized and fails to operate correctly after a
system sleep cycle?

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
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error updating DMA CFG: %d\n", ret);

[Severity: Low]
Is the use of QAIF_DMACTL_WM_5 intentional here? It appears to be a constant
meant for a DMACTL register, but it is being supplied to a DMACFG register
operation (qaif_dmacfg_reg).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-b4-qaif-sh=
ikra-audio-v8-0-ac618057fe85@oss.qualcomm.com?part=3D7
