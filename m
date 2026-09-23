Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1FD3AB460
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147028; cv=none; b=aIEitXYm5oxjh4eucGTz6SahtBT6JkwIPxUlQh3mwe0yiy7LF2dvaCr/SfZ9mHDalETSeQBvVTpSQQVpDpX8CrKTDRKSilO3RKIlaomLLP6DR6p8XMJ1mti+23Rzfol6tnrg1yeoHfwQRC0mIQA+uON/A1GBhocgXh1YwxD3fKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147028; c=relaxed/simple;
	bh=o6elBkJ7O0qI58JWmB+4hzCjPEbsjFgNLBsA6EH+vus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YYjDfD6j7RUN3wcneBTbelG1xwJxAxgQ0j3iihvDOIrlpQSOGTvZd2F1FkNlj++TuMrf+PPeXKyvtjTJGRmLldYMzDhgsBu9zoRYqMG0KwG6xlEX99IVpufYHep0duxcEzoTJhjP17lqfmM+nn0Xxds8U2ULGH1ZYApg3i4l1Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhbH/upz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhbH/upz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DBD1F000FF;
	Wed, 23 Sep 2026 07:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790147027;
	bh=JrxQS+klrXb5L2Z5dCpX9qTUXvo1MGagAHIMrCfAKd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RhbH/upzSqGpMOrVEp2pDlqX3c/aJtcrZyFGhcdocsbyl+rrjaFFimqBwdxk8vFS3
	 bOF8IAaqZ5MXuM5RqGOuq/fHAvE5Dddk0vAl3Gpt6T5fm8fkv5Gm8H+21Q2z1julwX
	 eyem7N+QpjI/NAXaOnwFtOmvYdnE2dLQx9DbzHFmEGfsfkLRCJwFltkpN9ztKFqitr
	 jgBtgGVVoRKO+GFEGGw4LsYyLGyK98WZbcQjzzT4oQeDcGtdNuRcApVONTdUAgvHqF
	 xWwFGT0RYu3cdilpOb9bPmPOM64rspIYODrHnSBUgMP3MgCivjvFYYnH6EP9C0VVmF
	 ky0np/Z9+k4wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/10] ASoC: qcom: Add QAIF PCM operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-7-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-7-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:03:46 +0000
Message-Id: <20260923070347.62DBD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mm: double-free of ALSA DMA buffer on open() error path
- [Low] style: misleading DMA control macro used for config register
--

commit 7d59a73e593308e23460f4d9f07a89ab17b26f25
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF PCM operations

Add the PCM platform callbacks needed to use QAIF DAIs for playback
and capture. Allocates DMA buffers in open(), configures in hw_params()
and prepares, and reports current DMA position.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> new file mode 100644
> index 0000000000000..84ce3ad9a1f2d
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-platform.c

[ ... ]

> @@ -279,25 +279,25 @@ static int qaif_platform_pcmops_open(struct snd_soc=
_component *component,
> +	/*
> +	 * The DMA buffer/period length registers are programmed in 64-bit
> +	 * (8-byte) words, so constrain buffer and period sizes to that step
> +	 * to keep the ALSA and hardware sizes identical.
> +	 */
> +	ret =3D snd_pcm_hw_constraint_step(runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> +					 BIT(QAIF_DMA_BYTES_TO_WORDS_SHIFT));
> +	if (ret >=3D 0)
> +		ret =3D snd_pcm_hw_constraint_step(runtime, 0,
> +						 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
> +						 BIT(QAIF_DMA_BYTES_TO_WORDS_SHIFT));
> +	if (ret >=3D 0)
> +		ret =3D snd_pcm_hw_constraint_integer(runtime,
> +						    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(soc_runtime->dev, "setting constraints failed: %d\n", ret);
> +		if (qaif_is_cif_port(dai_id)) {
> +			WRITE_ONCE(drvdata->cif_substream[stream_dma_idx], NULL);
> +			drvdata->cif_dma_heap[stream_dma_idx] =3D NULL;
> +		} else {
> +			WRITE_ONCE(drvdata->aif_substream[stream_dma_idx], NULL);
> +			drvdata->aif_dma_heap[stream_dma_idx] =3D NULL;
> +		}
> +		mutex_lock(&drvdata->stream_lock);
> +		v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
> +		mutex_unlock(&drvdata->stream_lock);
> +		goto err_free_dma;
> +	}
> +	return 0;
> +
> +err_free_dma:
> +	dma_free_coherent(component->dev, dma_mem_info->alloc_size,
> +			  dma_mem_info->vaddr, dma_mem_info->dma_addr);

[Severity: High]
Does this error path leave a dangling pointer in substream->dma_buffer.area?

In qaif_platform_pcmops_open(), if setting the hardware constraints fails
(for example, if snd_pcm_hw_constraint_step() encounters an error), the code
jumps to the err_free_dma label to free the DMA memory.

However, earlier in the function, the substream's DMA buffer fields were
already populated and its type was set to SNDRV_DMA_TYPE_DEV. Because this
error path does not reset substream->dma_buffer.area to NULL, ALSA core's
teardown path (snd_pcm_lib_preallocate_free_for_all()) will find the area
pointer non-NULL and attempt to free it again using snd_dma_free_pages(),
leading to a double-free.

Could we reset the substream->dma_buffer area, bytes, and addr fields to
zero or NULL before returning the error?

> +err_free_mem_info:
> +	kfree(dma_mem_info);
> +err_free_data:
> +	kfree(data);
> +	return ret;
> +}

[ ... ]

> @@ -377,9 +377,9 @@ static int qaif_platform_pcmops_hw_params(struct snd_=
soc_component *component,
> +	ret =3D regmap_update_bits(drvdata->audio_qaif_map,
> +				 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACFG_SHRAM_WM_MASK,
> +				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACTL_WM_5);

[Severity: Low]
Is the use of QAIF_DMACTL_WM_5 intentional here?

We're writing to the Configuration (CFG) register and applying the
QAIF_DMACFG_SHRAM_WM_MASK mask, but the value macro QAIF_DMACTL_WM_5 has a
Control (CTL) prefix. While this may evaluate to the correct value for the
watermark, the mismatched prefix could be misleading.

> +	if (ret)
> +		dev_err(soc_runtime->dev, "error updating DMA CFG: %d\n", ret);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-b4-qaif-sh=
ikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com?part=3D7
