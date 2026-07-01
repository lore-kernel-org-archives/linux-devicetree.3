Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435093B7778
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904359; cv=none; b=N6k4XV5K5xu+M+gpV1Py84JM3LQcvopkXMC4CI93wuq2/R/b3a1MY84ugkAsxrLC/4aE5o1+CorQ0ySHecFE7OP6fA5RK9c9RVsTzd1W67TO1C3umsMcvB0hjmzT9Vvu1OHURPjQvXPm+PjYfUNFexzBJLMbvTKBLKtz/s63FEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904359; c=relaxed/simple;
	bh=+kvr8x+pL6vl6t0T7b7pwUv+aMlCHNCzqcz0efA1L1c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QyhEg6+Hqshrhmt7EPKolPyJSjvPU0/NFezrSkQNNOqtfg36nW+9gyytyCenDiTYOd8hRg2q+rll63lV4tf7AZ5ReG1chJbmPHNfyEKJHSB9Nfi0Vns0PS8CUjhOHxMMPTXpF5Fw8/LduokKw/oXxXxj1Dg6MLpqa5pYZ20e/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6G35/uE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6G35/uE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9097D1F00A3A;
	Wed,  1 Jul 2026 11:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782904357;
	bh=qSHDPi3aK1CgpOdVR1b7aECyT0sYajSoAYPUStATpkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k6G35/uEDEsVin7ap12dilSM5pc93/XFbjOlZyAHpTT7CmqEKztQwhTgi4qSFU0JR
	 DcKb0p1RaMuqwipaH6NwJsLLO5D+jaN1kTBCbipLiZi+ze+5OKhq4sHsidY3oo8JrL
	 TRkwh1VFSVqTlKaSzjkD9omVYIZyKeKw+MjqnEHoDg2JsK8KmV6DreEekND3BEm4df
	 a5NnqUefgH8d0lghe/Hf5nDFqLRUN6FRWmg6IOmLLp0yCUrtagrKyxvM+UoMaoX/Y3
	 XcjPDBg7EimdSqEu7Af+f8+sH6RoYPmOWD15KEe0XBM6xaJDrzhcfvSOgEiuhut7go
	 ecMS0/W8vZWgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] ASoC: qcom: Add QAIF PCM operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701105757.2779738-9-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-9-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 11:12:36 +0000
Message-Id: <20260701111237.9097D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Setting ALSA DMA buffer type to SNDRV_DMA_TYPE_CONTINUOUS for dma_=
alloc_coherent() memory breaks mmap cache coherency.
- [High] qaif_platform_cdc_dma_mmap() uses the wrong device pointer, bypass=
ing IOMMU translation.
- [High] The pointer callback returns negative error codes directly, corrup=
ting the ALSA ring buffer state.
- [High] The close callback frees the DMA buffer and clears substream point=
ers without synchronizing against in-flight IRQ handlers.
- [Medium] Missing ALSA hardware step constraint for period and buffer byte=
s causes truncated DMA lengths.
- [Medium] The DMA engine is started before pending interrupts are cleared =
and enabled, and lacks error rollback.
- [Medium] Unhandled default case for unsupported dai_id in qaif_platform_p=
cmops_open() leads to leaked memory and uninitialized stream usage.
- [Low] Bitwise accumulation of negative error codes in IRQ configuration h=
elpers corrupts the returned errno.
--

commit 58474411dd21afab7ec8d7878e3b69a5a008fbfb
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF PCM operations
   =20
Adds PCM operation callbacks for the QAIF platform driver so AIF and CIF
DAIs can manage the DMA stream lifecycle.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c

[ ... ]

> @@ -291,3 +291,630 @@ static int qaif_platform_pcmops_open(struct snd_soc=
_component *component,
>  				     struct snd_pcm_substream *substream)
>  {
[ ... ]
>  	buf =3D &substream->dma_buffer;
>  	buf->dev.dev =3D component->dev;
>  	buf->private_data =3D NULL;
>  	buf->dev.type =3D SNDRV_DMA_TYPE_CONTINUOUS;
> =20
>  	dma_mem_info =3D qaif_mem_alloc_attach(component,

[Severity: High]
Does setting the buffer type to SNDRV_DMA_TYPE_CONTINUOUS for memory
allocated via dma_alloc_coherent() break mmap cache coherency in the
fallback snd_pcm_lib_default_mmap() handler?

[ ... ]

>  	switch (dai_id) {
>  	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
[ ... ]
>  	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
[ ... ]
>  		snd_soc_set_runtime_hwparams(substream, &qaif_platform_cif_hardware);
>  		runtime->dma_bytes =3D qaif_platform_cif_hardware.buffer_bytes_max;
>  		break;
>  	default:
>  		break;
>  	}
> =20
>  	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);

[Severity: Medium]
Does this unhandled default case leak the allocated dma_mem_info and leave
the stream data uninitialized instead of returning an error for an
unsupported dai_id?

[ ... ]

>  static int qaif_platform_pcmops_close(struct snd_soc_component *componen=
t,
>  				      struct snd_pcm_substream *substream)
>  {
[ ... ]
>  	switch (dai_id) {
>  	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
>  		drvdata->aif_substream[data->stream_dma_idx] =3D NULL;
>  		qaif_mem_dealloc_detach(component->dev,
>  					drvdata->aif_dma_heap[data->stream_dma_idx]);
>  		drvdata->aif_dma_heap[data->stream_dma_idx] =3D NULL;
>  		break;

[Severity: High]
Can this free the DMA buffer and clear the substream pointers while an
in-flight IRQ handler is still executing on another CPU, since there is no
synchronize_irq() or sync_stop callback used here?

[ ... ]

>  static int qaif_platform_pcmops_prepare(struct snd_soc_component *compon=
ent,
>  					struct snd_pcm_substream *substream)
>  {
[ ... ]
>  	ret =3D regmap_write(map, QAIF_DMABUFF_REG(v, idx, dir, dai_id),
>  			   (snd_pcm_lib_buffer_bytes(substream) >>
>  			    QAIF_DMA_BYTES_TO_WORDS_SHIFT) - 1);

[Severity: Medium]
Can this bit-shift truncate the DMA length if userspace requests a buffer
size that isn't a multiple of 8 bytes, since there is no
snd_pcm_hw_constraint_step() enforced in qaif_platform_pcmops_open()?

[ ... ]

>  static int qaif_platform_irq_enable(struct qaif_drv_data *drvdata,
>  				    int dir,
>  				    enum qaif_irq_type irq_type,
>  				    int idx)
>  {
>  	int ret =3D 0;
[ ... ]
>  	if (dir =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>  		ret |=3D regmap_write_bits(map,
>  					 QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, irq_type),
>  					 val_irqen, val_irqen);
>  		ret |=3D regmap_write_bits(map,
>  					 QAIF_EE_RDDMA_UNDERFLOW_IRQ_EN_REG(v, irq_type),
>  					 val_irqen, val_irqen);

[Severity: Low]
Does accumulating negative error codes with a bitwise OR corrupt the
returned errno?

[ ... ]

>  static int qaif_platform_pcmops_trigger(struct snd_soc_component *compon=
ent,
>  					struct snd_pcm_substream *substream,
>  					int cmd)
>  {
[ ... ]
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>  		ret =3D regmap_fields_write(dmactl->dma_dyncclk, idx, QAIF_DMACTL_DYNC=
LK_ON);
>  		if (ret) {
[ ... ]
>  		}
>  		ret =3D regmap_fields_write(dmactl->enable, idx, QAIF_DMACTL_ENABLE_ON=
);
>  		if (ret) {
[ ... ]
>  		}
>  		switch (dai_id) {
>  		case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
>  			ret =3D qaif_platform_irq_clear(drvdata,
>  						      substream->stream,
>  						      QAIF_AIF_IRQ, idx);

[Severity: Medium]
Does enabling the DMA engine before clearing and enabling interrupts open a
race window where the first period interrupt can be lost? Also, if the IRQ
setup fails, should the error path roll back the DMA engine state?

[ ... ]

>  static snd_pcm_uframes_t qaif_platform_pcmops_pointer(struct snd_soc_com=
ponent *component,
>  						      struct snd_pcm_substream *substream)
>  {
[ ... ]
>  	ret =3D regmap_read(map,
>  			  QAIF_DMABASE_REG(v, idx, dir, dai_id),
>  			  &base_addr);
>  	if (ret) {
>  		dev_err(soc_runtime->dev,
>  			"error reading from rdmabase reg: %d\n", ret);
>  		return ret;
>  	}

[Severity: High]
Can returning a negative error code from regmap_read() as an unsigned
snd_pcm_uframes_t corrupt the ALSA ring buffer state?

[ ... ]

>  static int qaif_platform_cdc_dma_mmap(struct snd_pcm_substream *substrea=
m,
>  				      struct vm_area_struct *vma)
>  {
>  	struct snd_pcm_runtime *runtime =3D substream->runtime;
> =20
>  	return dma_mmap_coherent(substream->pcm->card->dev, vma,
>  				 runtime->dma_area, runtime->dma_addr,
>  				 runtime->dma_bytes);
>  }

[Severity: High]
Should this use the component device that was used during allocation instead
of the card device to avoid bypassing IOMMU translation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701105757.2779=
738-1-harendra.gautam@oss.qualcomm.com?part=3D8
