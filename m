Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BB14C9566
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657337; cv=none; b=oMihCV1ktD3J89UB0WMr8kfRpCkhiQm+crSpYlrzx5CHz/QMTHJz5Spbb6kwTyD0L/IDZL4UjIKXAX2tisYXtvlu0Ric9AxS3pYYzZVNyKxb6w03V1CIopSD0L9qEfaED3Sj1Ev69UWA//TQRDodgSFCqUBlF2BPwPdmpel1nMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657337; c=relaxed/simple;
	bh=jUYKX5bKaYnbJboRMmj6dc+uujyObWlPSVn+NP0VwyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BrcNIY4mYQcUy+1VIXehXIL3NjHGtrbZ+11Oir1lHhh8J5joL63XU3PyKEEjgElNSfq5Lc5l0c8Q6+j5zar8/Ej8LAR8aC3apROarMaAkXNHCkUf/NehTgkDB7oH+1nPbwW4adNuNUApo0hR82omu7cN+3+Fl2ERD8T1Pv8MYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQFDEOwV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQFDEOwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16C81F00898;
	Fri,  5 Jun 2026 11:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780657333;
	bh=6G24CCuVMK6QRM6vMcEK4wa2dcuKrXEHKmymgF+lN/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQFDEOwVG36SvkoLuv8tFq7O2KBn4v25heu9wkG8SREnS5WmqauS1j7ZFOtr0HWnG
	 FwTYngkFz19M7Y+31Ql41BNPjvKwV/+1JSBrmgp9M3GIwbgLgsMyOrWz6qHI/BT0EZ
	 +/uFmGGiM4L00s6yXnAWzUNbb/BNonKXFFh9UT81HCuyooY2S2PV+bb3Fou7/111gd
	 tfq/q3QD1QGkZy6r41noUx2AFvgEaxqKdM75qvoWYaZ/QpzwctZmnxiCDlmjTG5M2s
	 AqHW29rXLcWM3e2dAmeYcPGJoP/5w7OiV2+XkvrTgZ1yWUm2uBuHSv62YNbmWGCdE5
	 PnTx2IkgQV1tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/13] ASoC: qcom: Add QAIF PCM operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260605103739.3557573-12-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-12-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 11:02:13 +0000
Message-Id: <20260605110213.A16C81F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Incorrect DMA buffer type `SNDRV_DMA_TYPE_CONTINUOUS` for `dma=
_alloc_coherent` memory leads to arbitrary physical memory mappings.
- [High] Missing `free_stream_dma_idx` cleanup in the `qaif_init` failure p=
ath.
- [High] The ALSA pointer callback returns raw negative error codes directl=
y, corrupting the ALSA core pointer math.
- [High] Mismatched device structs between coherent DMA memory allocation a=
nd mapping for CIF streams.
- [High] Missing constraint to enforce period and buffer sizes as multiples=
 of 8 bytes.
- [High] Concurrent `prepare` calls unconditionally overwrite global DMA cl=
ock rates.
- [Medium] Memory leak and uninitialized buffer values used for unrecognize=
d DAIs.
- [Medium] Data race / TOCTOU on `qaif_init_ref_cnt` leading to multiple si=
multaneous hardware initializations.
- [Low] Bitwise OR operations are performed on negative error codes, scramb=
ling the returned error values.
--

commit 282c91bcb4ac4fdd53a4566b6b00d7be3a79bcbc
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: ASoC: qcom: Add QAIF PCM operations

This commit adds PCM operation callbacks for the QAIF platform driver
to manage the DMA stream lifecycle for AIF and CIF DAIs.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> index b298ee9d865ee..beebec55222a5 100644
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c
> @@ -280,3 +280,570 @@ static int qaif_init(struct snd_soc_component *comp=
onent)
[ ... ]
> +static int qaif_platform_pcmops_open(struct snd_soc_component *component,
> +				      struct snd_pcm_substream *substream)
> +{
[ ... ]
> +	buf =3D &substream->dma_buffer;
> +	buf->dev.dev =3D component->dev;
> +	buf->private_data =3D NULL;
> +	buf->dev.type =3D SNDRV_DMA_TYPE_CONTINUOUS;

[Severity: Critical]
Does this code assign the wrong DMA buffer type?

Because the memory is allocated with dma_alloc_coherent() (via
qaif_mem_alloc_attach()), tagging it as SNDRV_DMA_TYPE_CONTINUOUS causes
ALSA's default mmap handler to assume the virtual address is linearly
mapped. The handler then attempts to use virt_to_page() to resolve
physical addresses, which can return incorrect page frames for vmalloc
or IOVA-backed addresses on ARM64. This could potentially allow
unprivileged userspace mapping of arbitrary physical memory.

[ ... ]
> +	ret =3D qaif_init(component);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "qaif_init failed: %d\n", ret);
> +		clk_disable_unprepare(drvdata->aud_dma_mem_clk);
> +		clk_disable_unprepare(drvdata->aud_dma_clk);
> +		qaif_mem_dealloc_detach(component->dev, dma_mem_info);
> +		kfree(data);
> +		return -EINVAL;
> +	}

[Severity: High]
Does this error path leak the DMA stream index?

The stream_dma_idx was dynamically allocated earlier, but it is not
released via v->free_stream_dma_idx() here. A few initialization
failures might exhaust the stream index pool and permanently break the
DAI until module reload.

> +	drvdata->qaif_init_ref_cnt++;

[Severity: Medium]
Could this refcount increment lead to a race condition?

The qaif_init() function checks if qaif_init_ref_cnt is zero before
executing the hardware setup. However, the increment happens here, after
qaif_init() has returned successfully. Since PCM devices have individual
locks, open() might be called simultaneously across different DAIs,
allowing multiple threads to see a zero refcount and simultaneously
execute hardware setup.

[ ... ]
> +	switch (dai_id) {
> +	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
[ ... ]
> +	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
[ ... ]
> +	default:
> +		break;
> +	}
> +
> +	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);

[Severity: Medium]
Does this code proceed with uninitialized buffer values for unrecognized
DAIs?

The switch ignores unrecognized DAIs via the default branch. The function
then proceeds to configure the ALSA runtime buffer with an uninitialized
buf->bytes and buf->addr. The memory allocated for dma_mem_info earlier
in the function also appears to be leaked.

[ ... ]
> +static int qaif_platform_pcmops_prepare(struct snd_soc_component *compon=
ent,
> +					 struct snd_pcm_substream *substream)
> +{
[ ... ]
> +	clk_set_rate(drvdata->aud_dma_clk, rate * bitwidth * channels * QAIF_DM=
A_CLK_RATE_MULTIPLIER);
> +	clk_set_rate(drvdata->aud_dma_mem_clk, rate * bitwidth * channels * QAI=
F_DMA_CLK_RATE_MULTIPLIER);

[Severity: High]
Can concurrent prepare calls break active streams by clobbering these
global clocks?

These global clocks provide the base frequency for the entire QAIF
hardware block. Because they are unconditionally overwritten here based
on the specific rate, channels, and bitwidth of the preparing stream,
concurrent streams with different formats might starve or break streams
that are already running.

[ ... ]
> +	ret =3D regmap_write(map, QAIF_DMABUFF_REG(v, idx, dir, dai_id),
> +			(snd_pcm_lib_buffer_bytes(substream) >> QAIF_DMA_BYTES_TO_WORDS_SHIFT=
) - 1);

[Severity: High]
Can this shift operation truncate buffer sizes and cause data corruption?

Because there is no ALSA constraint (like snd_pcm_hw_constraint_step)
enforcing an 8-byte alignment, userspace might request a size that is
not divisible by 8. QAIF_DMA_BYTES_TO_WORDS_SHIFT is 3, so the right
shift will silently truncate the remaining bytes. This makes the hardware
DMA buffer smaller than ALSA's software tracking expects, leading to
wrap-around mismatches.

[ ... ]
> +static int qaif_platform_irq_clear(struct qaif_drv_data *drvdata,
> +				int dir, enum qaif_irq_type irq_type, int idx)
> +{
> +	int ret =3D 0;
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +	unsigned int val_irqclr =3D BIT(idx);
> +
> +	if (dir =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret |=3D regmap_write(map, QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, irq_typ=
e), val_irqclr);
> +		ret |=3D regmap_write(map, QAIF_EE_RDDMA_UNDERFLOW_IRQ_CLR_REG(v, irq_=
type), val_irqclr);
> +		ret |=3D regmap_write(map, QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, irq_ty=
pe), val_irqclr);

[Severity: Low]
Does this code inadvertently scramble error values?

The regmap_write() functions can return negative error codes. Two's
complement integers combined with bitwise OR operations will produce
incorrect error semantics or completely invalid codes, corrupting the
return value given to the caller.

[ ... ]
> +static snd_pcm_uframes_t qaif_platform_pcmops_pointer(
> +		struct snd_soc_component *component,
> +		struct snd_pcm_substream *substream)
> +{
[ ... ]
> +	idx =3D v->get_dma_idx(dai_id);
> +
> +	if (idx < 0) {
> +		dev_err(soc_runtime->dev, "%s: Invalid DMA index: %d\n", __func__, idx=
);
> +		return -EINVAL;
> +	}

[Severity: High]
Does this pointer callback return raw negative error codes?

The ALSA core pointer callback is defined to return snd_pcm_uframes_t
(unsigned long). A negative error code like -EINVAL will cast to an
enormous frame position, completely breaking ALSA's period math and
stream state. Consider returning SNDRV_PCM_POS_XRUN or 0 on error.

[ ... ]
> +static int qaif_platform_cdc_dma_mmap(struct snd_pcm_substream *substrea=
m,
> +				       struct vm_area_struct *vma)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +
> +	return dma_mmap_coherent(substream->pcm->card->dev, vma,
> +				 runtime->dma_area, runtime->dma_addr,
> +				 runtime->dma_bytes);
> +}

[Severity: High]
Is the wrong device pointer being used for this DMA mapping?

In qaif_mem_alloc_attach(), the memory is allocated using component->dev:

	dma_mem_info->vaddr =3D dma_alloc_coherent(dev, alloc_size,
						 &dma_mem_info->dma_addr,
						 GFP_KERNEL);

However, this mapping operation uses substream->pcm->card->dev. DMA API
constraints require mapping operations to use the exact same device
pointer used for memory allocation. If these devices belong to different
IOMMU domains, this could cause IOMMU faults or failed mmaps.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605103739.3557=
573-1-harendra.gautam@oss.qualcomm.com?part=3D11
