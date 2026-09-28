Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD7B3D47D4
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600692; cv=none; b=Mf9THJacqBAa8qevEtDrKHeTNLfw11iJNqr+vOEMkayJqmKdiYZGo64IQhXSmS1/liwos4s52ZNB5QtX1xnrRa2pzE9gqMvz+CkQyM7OErllPnTmgtD4YYkpa9KFTeIapkTpgkiVMwoaWvO1FDDIeI9e5ndTQcmmQNKo9XtQfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600692; c=relaxed/simple;
	bh=DZNYNVW0kTrOdZtdf/tZT9OtoDYky/1/EnKP90xlo9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nsxL0Oe8UgDDTpIXXwRZ4l5FrrIpYP1NA9Y6yaw5YPC/9pntxYVs07X857UtBR0Xw5MUxu1aT7k/7c6Kf1bbWMptT+yMK9Ca/nCFdRJK3ED54yBXncltYbqhSqw4YzcD/xzo05EtVVlmtD7qZCNUvWf4DG9lOJEmjAr1cbJPmY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZY0VLvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZY0VLvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8911F000FF;
	Mon, 28 Sep 2026 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600690;
	bh=QrFgaC2qMW5VOpL6TWvegIwNCUIixU9oZ4+TjwL/ZBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZY0VLvyaEPh3eG894tpDmgFREpANCGgNC2VeoaNh1y2eM7SlTVb1/LUHymgZBa1B
	 NBAbDVF+rBh6B4sbeVX3bKYioGdJsJh3+J4B0Loi9g77CiE/oCDFkfekzUX8pgyoXx
	 BDeUl2ud/jmw5CWe1R+/AwHobUPsW9r47yqHjkoURwvmgGSKjS9tydL4RATnxNyBK2
	 Qin1oxvtyTxR4rP6ob1rzyJ/+vX5pLwFzif1NUOJ1WGU+WKyfkQBiM06ZOwYDXOz5z
	 GexSy3rp85msi/+jGFMlWQfarsnGgw/aCwAjE++90OsIA6daIEpwfSJ5CZN1vLY+97
	 QmSnu04V1on1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-4-ac618057fe85@oss.qualcomm.com>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-4-ac618057fe85@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 13:04:49 +0000
Message-Id: <20260928130450.1D8911F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: qaif-cpu: concurrent MI2S hw_params clobbers shared frame co=
nfig
- [Medium] ASoC: qaif-cpu: stopping stream in loopback mode breaks concurre=
nt stream
- [Low] ASoC: qaif-cpu: integer underflow in max_register calculation bypas=
ses bounds
--

commit 96b925c5161486efa5953d5523b45fed9502f610
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform init

This commit adds the QAIF CPU DAI driver to support Qualcomm audio
interface paths for CDC DMA and serial AIF audio links. It implements
CIF and AIF DAI operations, including channel mask programming, dynamic
clock control, and format setup.

> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-cpu.c

[ ... ]

> +static int qaif_aif_cpu_daiops_hw_params(struct snd_pcm_substream *subst=
ream,
> +					 struct snd_pcm_hw_params *params,
> +					 struct snd_soc_dai *dai)
> +{

[ ... ]

> +	if (qaif_is_aif_mi2s_port(dai->driver->id) && !cfg->slot_width) {
> +		slot_width =3D bitwidth;
> +		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +			drvdata->aif_intf_cfg[idx].slot_en_tx_mask =3D
> +						GENMASK(channels - 1, 0);
> +		else
> +			drvdata->aif_intf_cfg[idx].slot_en_rx_mask =3D
> +						GENMASK(channels - 1, 0);
> +		drvdata->aif_intf_cfg[idx].slot_num =3D QAIF_MI2S_SLOTS;
> +	} else {

[ ... ]

> +	ret =3D regmap_update_bits(map, QAIF_AUD_INTF_FRAME_CFG_REG(idx),
> +				 QAIF_AIF_BITS_PER_LANE_MASK,
> +				 (slot_width * cfg->slot_num) - 1);

[Severity: High]
Does this dynamically derived slot_width risk clobbering the shared frame
configuration register when concurrent playback and capture streams on the
same MI2S port use different formats?

Since ALSA exposes these as separate DAIs without enforcing
symmetric_sample_bits, an active playback stream could be disrupted by a
capture hw_params call that overwrites the physical frame size here.

[ ... ]

> +static int qaif_aif_cpu_daiops_trigger(struct snd_pcm_substream *substre=
am,
> +				       int cmd, struct snd_soc_dai *dai)
> +{

[ ... ]

> +	cfg =3D &drvdata->aif_intf_cfg[idx];
> +	if (cfg->loopback_en)
> +		enable_bit =3D QAIF_AIF_CTL_ENABLE_BIT;
> +	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		enable_bit =3D QAIF_AIF_CTL_ENABLE_TX_BIT;
> +	else
> +		enable_bit =3D QAIF_AIF_CTL_ENABLE_RX_BIT;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:

[ ... ]

> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret =3D regmap_update_bits(drvdata->audio_qaif_map,
> +					 QAIF_AUD_INTF_CTL_REG(idx), enable_bit, 0);

[Severity: Medium]
When stopping a stream in loopback mode, does unconditionally clearing this
global enable bit prematurely disable the shared interface?

Loopback requires both directions to run concurrently, so stopping one
stream might cause hardware DMA stalls for the other active stream.

[ ... ]

> +int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get MMIO resource\n");
> +
> +	regmap_cfg.max_register =3D resource_size(res) - regmap_cfg.reg_stride;

[Severity: Low]
Can this calculation underflow if a malformed device tree provides a memory
region smaller than regmap_cfg.reg_stride (4 bytes)?

An underflow would wrap max_register to a massive 32-bit unsigned value,
bypassing regmap's bounds checking protections.

> +	drvdata->audio_qaif_map =3D devm_regmap_init_mmio(dev, drvdata->audio_q=
aif,
> +							&regmap_cfg);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-b4-qaif-sh=
ikra-audio-v8-0-ac618057fe85@oss.qualcomm.com?part=3D4
