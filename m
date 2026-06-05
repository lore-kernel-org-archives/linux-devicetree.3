Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D34F41361B
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656768; cv=none; b=p7jmj4/ks4e9XfrMkaIOsrKGKPWd5+OWiG8D+3XHB/ANgVOlEdg3YYJGGRWCUYaOlhp3cFHcM8u7qaKwdijorjhz3yLBdOAytaFolodNtwEW9CT4aTrhtuBDWayotmHAqQ2u46K+4F53MV4c5wNkKmxNrlhj+5zsuGjAz0cSE0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656768; c=relaxed/simple;
	bh=ZAluHVmi2wN4D3vOnccGmupFOlWhQSS3tGUfr6rE5oc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VMxy4gT+QmIMTDpsx7o0T8+NhN5FkjwFSOe9CB9QA/bURKifDDSpjGV+NMH3uwuDLdbOROhO+HFNkP2CW4Zix8Zeq6wYbjLo7Ls0GgC5gxAOjDOj2ViC3G0Zw9zGwSxz1WMQcct3p1YlG9XcefnTwJ/3EJ9U6M/oAH0WU9gtIJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjCvxUfD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjCvxUfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB1C1F00893;
	Fri,  5 Jun 2026 10:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780656767;
	bh=nWJXIMEuPH0kspEWuAkMZzyzJYOshIjd/EaXP2f1Au4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jjCvxUfD3mknLBcxRKnUkL8bi+as8AVTFiA71MYo/VJGLvm5l7BhaHeLZe19hUxaT
	 ZzOaBGz0yJUwJ5Mr7Uej1U7kseGXRlZ2FZBEFj3knPkK7+A61VQBP7dHtkIHqic9g9
	 6GTXS6zTpUVqceWckJBFXSA9t+AK5rFa5DeOt7p+YilFR2MKR9fjpn7d83X24tZxD9
	 pRMdhsT5e3QRzEAG/XH+4Uc3O5jUUz3WaHmWMRyLBE37J7dvU6iUUBGvGcTXsIbpGE
	 mNEoJVcCz1bxnG/G3kEHfHnf1c/QNVtA/BOYl1vPYN5m8RTA/JPQ7zpXMF8JyfwiLE
	 9bcee69dlI/oA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/13] ASoC: qcom: Add QAIF AIF DAI ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260605103739.3557573-8-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-8-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 10:52:46 +0000
Message-Id: <20260605105246.BBB1C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Trigger error handling masks hardware enable failures and lacks ro=
llback for clock enable failures.
- [High] Shared AIF enable bit in loopback mode breaks concurrent streams.
- [Medium] The CPU DAI improperly configures the CODEC DAI directly with ha=
rdcoded TDM masks, ignoring dynamic configurations.
- [Medium] The MI2S bit clock is left enabled during system suspend and idl=
e periods due to unbalanced clock management.
- [Low] The pointer `aif_intf_cfg` is assigned the address of an inline arr=
ay element and will never be NULL, rendering the subsequent NULL check usel=
ess.
--

commit d50489b023d0ced9ef2bb2d6c594bbd9cf3884e8
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: ASoC: qcom: Add QAIF AIF DAI ops

Add the CPU DAI operations and regmap field setup needed to use the QAIF
AIF (MI2S) path. This allows QAIF to route playback through RDDMA channels
and capture through WRDMA channels to external serial audio devices.

> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> --- a/sound/soc/qcom/qaif-cpu.c
> +++ b/sound/soc/qcom/qaif-cpu.c

[ ... ]

> @@ -495,12 +495,12 @@ static int qaif_aif_cpu_daiops_hw_params(struct snd=
_pcm_substream *substream,
> =20
>  	idx =3D v->get_dma_idx(dai->driver->id);
> =20
>  	if (idx < 0) {
>  		dev_err(dai->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
>  		return -EINVAL;
>  	}
> =20
>  	aif_intf_cfg =3D &drvdata->aif_intf_cfg[idx];
> =20
>  	if (!aif_intf_cfg) {
>  		dev_err(dai->dev, "AIF interface config not found\n");
>  		return -EINVAL;
>  	}

[Severity: Low]
Does this code assign the address of an inline array element? Since it takes
the address directly from the drvdata structure, won't this pointer never be
NULL, making the following check dead code?

[ ... ]

> @@ -603,17 +603,17 @@ static int qaif_aif_cpu_daiops_hw_params(struct snd=
_pcm_substream *substream,
>  	ret =3D clk_set_rate(drvdata->mi2s_bit_clk[idx],
>  			   rate * slot_width * aif_intf_cfg->bits_per_lane);
>  	if (ret) {
>  		dev_err(dai->dev, "error setting mi2s bitclk to %u: %d\n",
>  			rate * slot_width * aif_intf_cfg->bits_per_lane, ret);
>  		return ret;
>  	}
>  	dev_dbg(dai->dev, "setting IBIT clock to %u\n",
>  		rate * slot_width * aif_intf_cfg->bits_per_lane);
> =20
>  	ret =3D clk_enable(drvdata->mi2s_bit_clk[idx]);

[Severity: Medium]
Since this clock is enabled here and also in the trigger callback for
SNDRV_PCM_TRIGGER_START, does this double enable sequence mean the reference
count stays elevated during system suspend? ALSA does not call hw_free on
suspend, so it seems the clock might physically remain active.

>  	if (ret) {
>  		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
>  		return ret;
>  	}
>  	snd_soc_dai_set_tdm_slot(codec_dai, 0x0f, 0b11, aif_intf_cfg->bits_per_=
lane, slot_width);
>  	snd_soc_dai_set_sysclk(codec_dai, 0, rate * aif_intf_cfg->bits_per_lane=
 * slot_width, 0);

[Severity: Medium]
Is it intentional for a CPU DAI's hw_params to configure the codec DAI
directly with hardcoded values? This seems to force a mismatch by overriding
dynamic configurations like slot_en_tx_mask and tightly couples the CPU
driver to a specific codec.

[ ... ]

> @@ -638,28 +638,28 @@ static int qaif_aif_cpu_daiops_trigger(struct snd_p=
cm_substream *substream,
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>  		if (aif_intf_cfg->loopback_en)
>  			ret =3D regmap_fields_write(drvdata->aif_intfctl->enable, idx, QAIF_A=
IF_CTL_ENABLE_ON);
>  		else if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>  			ret =3D regmap_fields_write(drvdata->aif_intfctl->enable_tx, idx, QAI=
F_AIF_CTL_ENABLE_ON);
>  		else
>  			ret =3D regmap_fields_write(drvdata->aif_intfctl->enable_rx, idx, QAI=
F_AIF_CTL_ENABLE_ON);
>  		if (ret)
>  			dev_err(dai->dev, "error writing to AIF CTL reg: %d\n", ret);
> =20
>  		ret =3D clk_enable(drvdata->mi2s_bit_clk[idx]);

[Severity: High]
If the regmap_fields_write call fails, won't the error code in ret be
overwritten by clk_enable here? Also, if clk_enable fails, it looks like
the function returns an error but leaves the AIF interface active without
rolling back the hardware state.

>  		if (ret) {
>  			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
>  			return ret;
>  		}
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> =20
>  		if (aif_intf_cfg->loopback_en)
>  			ret =3D regmap_fields_write(drvdata->aif_intfctl->enable, idx, QAIF_A=
IF_CTL_ENABLE_OFF);

[Severity: High]
If loopback is enabled and a user stops one substream during full-duplex
operation, won't writing QAIF_AIF_CTL_ENABLE_OFF to the global enable
register disrupt the other running stream? Should this global register state
be reference-counted to support concurrent streams?

>  		else if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>  			ret =3D regmap_fields_write(drvdata->aif_intfctl->enable_tx, idx, QAI=
F_AIF_CTL_ENABLE_OFF);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605103739.3557=
573-1-harendra.gautam@oss.qualcomm.com?part=3D7
