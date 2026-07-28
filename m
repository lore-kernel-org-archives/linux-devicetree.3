Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E715D40F8D0
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229407; cv=none; b=SbV3wrRbaWI2d2NH8HeqQQ8tzCwAvE92PZAoDCl75AWlDWEhp+mQVeKQkdB9d1QQVByWG/zd1Y8eQqzepvNkf24gVCINN8S0h5Uc4Zjw+MPRuZ/0hFsD5YCNEB0JugyU0G6bHXKtcP+Wv51ZptfgXAZN0HKh5qWH4PrmpyKEan4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229407; c=relaxed/simple;
	bh=Y/NFf74wgB2gN0ve33jL7rNXztpLe2dCvyfMUbcm+og=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CFilVqHirYgUBxLO0GQ84fsqpomSuy1XGoBGPz7pP2GtOt4RDKywQJK26+xCFtlTUMCG8pvVoA+7yAw+4PMBR+qm3Rak1TubZK6xRm7tjgP8tMarXWvuC5L1t5Qpcpf95qcHd+KHdvmLhkDnWg8HtuGI1hVo8iY5CayWO+k8RCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UegsFLPl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UegsFLPl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518421F000E9;
	Tue, 28 Jul 2026 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785229405;
	bh=WUuOGLToE/AUuaLce72T+I2Wjx3Mr52O16dW0QyzMpU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UegsFLPl3ZI08q23zXyOmUCgd4kkE9cwjy7oPDWVvYTSF2+Pz3Bf8KTdnc2bfLfSy
	 G6TDTv1uoPfjkgK1CR10ORwJx7v7g/uRWKfiNOMj+PiHsozI9B9GyUms69ijFGtwQq
	 4DckiOCCR8apYtZPg2EYE0+ltCQs9VNbt9QZqJjr9BXWeBUz+bWCsoEppiTuGxPKmz
	 VZ/EF4ZSn27cNEDI0aOg8H1Y+oBiWjWAEHthu6OdWevWav5/7bmL4R+E500qSj0bIF
	 8zjUq5QFXMXUWtPKpA8t85kOCcTXfyfHs/Fs7kY3GZBwSHP0rtT0neH+Aa4i/Cycy7
	 5jtD/bKdVCUJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] ASoC: qcom: audioreach: compute active channel
 maps from channel_map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-1-b29f44720178@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
 <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-1-b29f44720178@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:03:24 +0000
Message-Id: <20260728090325.518421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The new `active_channels_mask` computation in `audioreach_codec_dm=
a_set_media_format` introduces regressions by unconditionally iterating ove=
r all `AR_PCM_MAX_NUM_CHANNEL` elements.

Pre-existing issues:
- [High] Kernel stack memory is leaked to the DSP and evaluated in control =
logic because `cfg.channel_map` is not zero-initialized.
--

--- Patch [1]: [PATCH v3 1/3] ASoC: qcom: audioreach: compute active channe=
l maps from channel_map ---
commit 893598480a0705f69c55eefe5bf4e2b969edc6d8
Author: Neil Armstrong <neil.armstrong@linaro.org>
Subject: ASoC: qcom: audioreach: compute active channel maps from channel_m=
ap

This patch updates the Audioreach DSP code to compute the active channel
mask and logical channel mappings using the physical channel mapping array
(channel_map) rather than a simple bitmask derived from the channel count.
This enables WSA2 speaker usage on specific hardware by correctly setting
only the upper bits of the channel mask.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index e6e9eb2e85aa1..0cc840aca69dd 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -741,7 +742,12 @@ static int audioreach_codec_dma_set_media_format(str=
uct q6apm_graph *graph,
> =20
>  	intf_cfg->cfg.lpaif_type =3D module->hw_interface_type;
>  	intf_cfg->cfg.intf_index =3D module->hw_interface_idx;
> -	intf_cfg->cfg.active_channels_mask =3D (1 << cfg->num_channels) - 1;
> +	intf_cfg->cfg.active_channels_mask =3D 0;
> +	/* Convert the physical channel mapping into a bit field */
> +	for (i =3D 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
> +		if (cfg->channel_map[i])
> +			intf_cfg->cfg.active_channels_mask |=3D BIT(i);
> +

[Severity: High]
If a stream is configured with 4 channels and later reconfigured to 2
channels, audioreach_set_default_channel_mapping() in q6dma_hw_params() only
overwrites the first 2 entries, leaving the remaining entries intact.

Since this loop iterates unconditionally up to AR_PCM_MAX_NUM_CHANNEL, could
it pick up those stale entries and activate unintended channels in the DSP?

Additionally, for channel counts greater than 4 (like 6 or 8),
audioreach_set_default_channel_mapping() can leave the map as all zeros. Co=
uld
this result in an active_channels_mask of 0 and break the DMA configuration?

[Severity: High]
This is a pre-existing issue, but struct audioreach_module_config cfg is
allocated on the stack in q6apm_dai_prepare() without being initialized:

q6apm_dai_prepare() {
    ...
    struct audioreach_module_config cfg;
    ...
}

When an unsupported channel count is used,
audioreach_set_default_channel_mapping() leaves the array untouched,
containing stack garbage.

While the previous code copied this memory blindly, the new loop here branc=
hes
on this uninitialized stack memory to construct the channel mask. Could this
result in unpredictable DSP configurations and leak stack contents in the I=
PC
payload?

>  	p +=3D ic_sz;
> =20
>  	pm_cfg =3D p;

[ ... ]

> @@ -1113,7 +1124,12 @@ static int audioreach_pcm_set_media_format(struct =
q6apm_graph *graph,
>  	media_cfg->num_channels =3D mcfg->num_channels;
>  	media_cfg->q_factor =3D mcfg->bit_width - 1;
>  	media_cfg->bits_per_sample =3D mcfg->bit_width;
> -	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channel=
s);
> +	/* Convert the physical mapping to a logical mapping of the channels */
> +	for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_chan=
nels; i++) {
> +		if (!mcfg->channel_map[i])
> +			continue;
> +		media_cfg->channel_mapping[j++] =3D mcfg->channel_map[i];
> +	}

[Severity: High]
This is a pre-existing issue, but similar to the above concern, could this
loop branch on uninitialized stack memory if mcfg->channel_map was left
uninitialized in q6apm_dai_prepare()?

This would cause the code to evaluate stack garbage in its control flow and
copy it into the DSP IPC payload.

> =20
>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-sm86=
50-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org?part=3D1
