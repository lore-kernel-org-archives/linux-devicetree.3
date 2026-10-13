Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CEF40DB47
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889538; cv=none; b=Zp8ntqV2ANN3vVjMFZPsPQnPfZqi7A2hloIzaf1HeC0ZJc1kdQcoGlzwVIFKBthmDU9mj9CUYkP0xvp0Dt4Ve+nKkGJ4qkOiLL3BoFagZ7w1CQa4dwZid0lqsxmrsbuV97BYZ4WWdgdB4htmbdxkleiQewG7kTpSRo3LF4cK0mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889538; c=relaxed/simple;
	bh=d6yDGv7YYl48ATPn29lWvYTliUwiIWlNztByuC58jkA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nGxsCo1xFyFva20b5al6btfiviP+lDlfKZ2iK2ebd3mZoKIdGhaCnp/Sn69w7900tme5UTP6edSWjvj5XB8u7gnAd8Jay8Gpf9/Ak4heNkryTJ/eezyF9F5tieSlGzRd5n5MWD27dDkmj9BfXPdqSDeuzTE6BeB5gwoZ2ETFhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZ3XT3/q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZ3XT3/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575C41F00893;
	Tue, 13 Oct 2026 11:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791889537;
	bh=eFTsJHJIDVsDLV1acgn+WLJ2NIqArGQy9kJCELoB7PI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZ3XT3/qSt7Q4hPgO3qNYSsiEh1ZU1Uq1qLm5DFemlg8QhNqnyvx7WJ+jQ7czb4fa
	 yGItqSvcjS0vI8wHsqNe03veAdLVzPrrJBOY4All/2LP9KvS73CF3JGWpxJ5X/e60R
	 8RUmpHE1h1wSK4EH3vPunlrHZpqrWmN9WIWj7T41i6+4zOvsb9TLeormVb+NIKruWI
	 f37Lclg51mxcBwYvFdWxm6Cc/jWzlLmZvfHlt0jvCwRPMzjmLDFXnNbLTyrEmoTzyk
	 zPQVAZ2TE+ARMbqSWRT0431fTHSqjm6T20Gk1OEw4Ll9PnsVcORW0ru2IRDjRnA7bt
	 fb6YN/xAsC0Kg==
Message-ID: <sashiko-outbox-169578@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-4-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-4-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:05:35 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt: missing upper bounds validation for TDM slot configuration f=
rom device tree
- [Medium] asoc: stopping one substream clears shared AIF loopback enable b=
it
- [Medium] asoc: silently ignores unsupported clock inversion requests for =
I2S format
--

commit 149e10572aefd12876aee55c367d4fb0489f0eeb
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform init

Add the QAIF CPU DAI driver to support Qualcomm audio interface paths
used for CDC DMA and serial AIF audio links.

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
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret =3D regmap_update_bits(map, QAIF_AUD_INTF_BIT_WIDTH_CFG_REG(idx),
> +					 QAIF_AIF_SLOT_WIDTH_TX_MASK |
> +					 QAIF_AIF_SAMPLE_WIDTH_TX_MASK,
> +					 QAIF_AIF_SLOT_WIDTH(slot_width) |

[Severity: Medium]
What happens here if an invalid device tree provides oversized values for
slot width (e.g., > 32) or frame bits (e.g., > 1024)?

It appears they are not validated against maximums in
of_qaif_parse_aif_intf_cfg() when reading dai-tdm-slot-width and
dai-tdm-slot-num.

Could this cause the unvalidated values to silently overflow the 5-bit
QAIF_AIF_SLOT_WIDTH_TX_MASK and 10-bit QAIF_AIF_BITS_PER_LANE_MASK?

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
[ ... ]
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret =3D regmap_update_bits(drvdata->audio_qaif_map,
> +					 QAIF_AUD_INTF_CTL_REG(idx), enable_bit, 0);

[Severity: Medium]
If two streams are running concurrently in loopback mode (full-duplex)
and one stream stops, will this unconditionally clear the shared master
QAIF_AIF_CTL_ENABLE_BIT and accidentally break the remaining active stream?

[ ... ]
> +static int qaif_aif_cpu_daiops_set_fmt(struct snd_soc_dai *dai,
> +				       unsigned int fmt)
> +{
[ ... ]
> +	/*
> +	 * For DSP_A/DSP_B (TDM/PCM) modes, sync inversion is board-configurable
> +	 * via the NB_IF flag.  For I2S, invert_sync is fixed above and must
> +	 * not be overridden here.
> +	 */
> +	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) !=3D SND_SOC_DAIFMT_I2S) {
> +		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +		case SND_SOC_DAIFMT_NB_NF:
> +		case SND_SOC_DAIFMT_NB_IF:
> +			cfg->invert_sync =3D (fmt & SND_SOC_DAIFMT_INV_MASK) =3D=3D
> +					   SND_SOC_DAIFMT_NB_IF;
> +			break;
> +		default:
> +			dev_err(dai->dev, "bit clock inversion is not supported\n");
> +			return -EINVAL;
> +		}
> +	}

[Severity: Medium]
Does bypassing this validation block for I2S formats allow unsupported
clock inversions to be silently ignored?

If a machine driver requests an unsupported format inversion alongside
SND_SOC_DAIFMT_I2S, qaif_aif_cpu_daiops_set_fmt() will return success (0)
instead of -EINVAL.

Could this lead the machine driver to proceed with a mismatched hardware
state and corrupted audio?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-b4-qaif-sh=
ikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com?part=3D4
