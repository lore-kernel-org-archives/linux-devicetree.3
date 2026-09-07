Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19B548665D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783928; cv=none; b=hNF0QEDPOUvbPDRgcWqGBY41ggImFDkkqY1Oroju/kCK6ZyA0Bb9zr9idBXDNxT0R2SCiYBrx77XQumMNBXsC0JEX9Nf99AzLMvZlxqXCnHSCIrrteK72VdD8ZWQ5PiI2ij+/rQ7rqLjuYIj3YX1Rt7c7O+3Qmij2/cIAv4eGJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783928; c=relaxed/simple;
	bh=CSzLJl24emIaT/ZmshhuzUjOpkvraz1Tk96OGrzyh0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TlnpuH/lJGc/NqCCHHRzXNmHKomarmkITRa8vuPxlj/fvXqtBVwRQB0LjScp7Mw+/cg350J364varxZKiEB2pq+JQaJP5LgOnAb/i0Juu3KKp6Si4lVYxpcT5YoOXVN+OVBhx0KUC2wYexBAv8tlGv7tsF6pWbQ2i6sh1Njw7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQymRxqw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQymRxqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468371F00A3D;
	Mon,  7 Sep 2026 12:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788783926;
	bh=PF4D2jiYBsWOih0IhfGJS3vbJPKMz8tqUb/z3QUtFL4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gQymRxqwuknqFS3NvRfHzZ8jIzu/vrEg88iX0MZ88ju8xoVFeALOc5TCPvnZSEs3A
	 Aej8RKomQ7dXysSn7XcWLrsqOC2ZkF7V7EVWHLEf/zxanMxk50+0xEAW5w7eezMQn1
	 TuBln9UkO3BLWthuaA7C+qKUtrIVppI7zsLlJoE77rhHr+nVxnZ9KAdOQsGTsoE1Du
	 B4MHKr+vLPI3ZVpx/oztte0idDrvmlfhyOobSwbTB0KTRDbnEzi47wIa4yqJhNAao2
	 yO5s5QTnUC861zz0UcV89wr6gyg29OGIGVdtxjcVQVOzo1F51zsyP9L3oLkOMpp9pe
	 nhIQGFCZ4FZ0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-4-6d8ad9ba5c9f@oss.qualcomm.com>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-4-6d8ad9ba5c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:25:25 +0000
Message-Id: <20260907122526.468371F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware configuration registers and shared MI2S bit clock rates a=
re reprogrammed on an active interface without concurrency protection acros=
s separate DAIs.
- [Medium] Stopping one substream clears the shared loopback enable bit, ha=
lting the entire QAIF AIF interface and breaking concurrent active streams.
- [Medium] Device tree parsing of audio format drops crucial inversion prop=
erties and enforces hardcoded settings.
--

commit f1f12015dacd26e0ef5a35ee04272fd9e0c2d320
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform init

This commit adds the QAIF CPU DAI driver to support Qualcomm audio interfac=
e=20
paths used for CDC DMA and serial AIF audio links. It implements DAI operat=
ions,
configures the MMIO regmap, and parses per-interface configuration from the=
=20
devicetree.

> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> new file mode 100644
> index 0000000000000..c75b139ecb2ae
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-cpu.c
[ ... ]
> +static int qaif_aif_cpu_daiops_hw_params(struct snd_pcm_substream *subst=
ream,
> +					 struct snd_pcm_hw_params *params,
> +					 struct snd_soc_dai *dai)
> +{
[ ... ]
> +	/*
> +	 * The sync, lane and frame configuration and the MI2S bit clock are
> +	 * shared by both directions of an AIF. Concurrent playback and
> +	 * capture on the same interface are therefore expected to use a
> +	 * compatible format, rate and slot configuration.
> +	 */
> +	ret =3D regmap_update_bits(map, QAIF_AUD_INTF_SYNC_CFG_REG(idx),
> +				 QAIF_AIF_SYNC_SRC_BIT |
> +				 QAIF_AIF_SYNC_MODE_MASK |
> +				 QAIF_AIF_SYNC_DELAY_MASK |
> +				 QAIF_AIF_SYNC_INV_BIT,
> +				 (cfg->sync_src ? QAIF_AIF_SYNC_SRC_BIT : 0) |
> +				 (cfg->sync_mode << QAIF_AIF_SYNC_MODE_SHIFT) |
> +				 (cfg->sync_delay << QAIF_AIF_SYNC_DELAY_SHIFT) |
> +				 (cfg->invert_sync ? QAIF_AIF_SYNC_INV_BIT : 0));

[Severity: High]
Since playback and capture paths are separate DAIs that share this physical=
=20
interface, what prevents a concurrent stream startup from unconditionally=20
overwriting these shared configuration bits while the other stream is alrea=
dy=20
active? Could this cause hardware lockups or audio corruption for the active
stream?

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
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret =3D regmap_update_bits(drvdata->audio_qaif_map,
> +					 QAIF_AUD_INTF_CTL_REG(idx), enable_bit, enable_bit);
> +		if (ret)
> +			dev_err(dai->dev, "error setting AIF enable bit: %d\n", ret);
> +		return ret;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret =3D regmap_update_bits(drvdata->audio_qaif_map,
> +					 QAIF_AUD_INTF_CTL_REG(idx), enable_bit, 0);

[Severity: Medium]
If both playback and capture streams are active on a loopback-enabled=20
interface, wouldn't stopping just one of the streams blindly clear the shar=
ed=20
QAIF_AIF_CTL_ENABLE_BIT here? It seems this might abruptly halt the entire=
=20
interface and break the remaining concurrent active stream.

[ ... ]
> +static int qaif_aif_cpu_daiops_set_sysclk(struct snd_soc_dai *dai,
> +					  int clk_id, unsigned int freq,
> +					  int dir)
> +{
[ ... ]
> +	/*
> +	 * The bit clock is prepared and enabled for the lifetime of the
> +	 * stream by startup()/shutdown(); only the rate is set here.
> +	 */
> +	return clk_set_rate(drvdata->mi2s_bit_clk[idx], freq);

[Severity: High]
Does this unconditionally set the rate on a shared bit clock that might alr=
eady=20
be actively running for the other stream direction? This appears to be anot=
her=20
place where concurrent streams across separate DAIs could race and overwrit=
e=20
shared hardware state mid-stream.

[ ... ]
> +static int of_qaif_parse_aif_intf_cfg(struct device *dev,
> +				      struct qaif_drv_data *data)
> +{
[ ... ]
> +		switch (snd_soc_daifmt_parse_format(intf_np, NULL) &
> +			SND_SOC_DAIFMT_FORMAT_MASK) {

[Severity: Medium]
Does masking the return value with SND_SOC_DAIFMT_FORMAT_MASK here discard=
=20
crucial inversion properties (like bitclock-inversion or frame-inversion) t=
hat=20
snd_soc_daifmt_parse_format() normally returns?

> +		case SND_SOC_DAIFMT_I2S:
> +			cfg->sync_mode =3D QAIF_AIF_SYNC_MODE_LONG;
> +			cfg->sync_delay =3D QAIF_AIF_SYNC_DELAY_ONE;
> +			cfg->invert_sync =3D true;
> +			break;

Because of the mask above, it looks like users cannot override this hardcod=
ed=20
invert_sync =3D true behavior for I2S via standard devicetree properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-b4-qaif-sh=
ikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com?part=3D4
