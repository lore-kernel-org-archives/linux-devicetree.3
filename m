Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322B3E1D05
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554389; cv=none; b=JBr4qfRcFmRWNLbCh4sPbcuHJNamVp8JCvUMGHiAJe/309lnRToZwWtHwnXXcZe7DHuP2PebgEp5CoA2GjxBmcSWamcEplHiErx9j2ui90U6u1dM6gu3QRT285oevE0FLonnNOew0NoTe+qOtC71xxfuG4H2mOOSOT8Ltte76GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554389; c=relaxed/simple;
	bh=Qe7sTSPFlGXniqLyrFJZypc8ae13WXpbkAk+u+6sgDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pb3yQcyGCh8qYVZBZNS+/AG82SgooD3YGWqOk97dLRBvwhBgbhhAy3tvMkHx5bvIBmIUcpMLQ0TRNePhdjs4OGWzspRijEEKZ+J0IKBr6bWIlYkHvj2dCIMxrK76c+zisgXIOS35EZeMguRZ80tev4LPELH7oGkvIZNH/wBqagQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCeKTT2C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCeKTT2C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE511F000E9;
	Mon, 24 Aug 2026 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787554387;
	bh=Cf11HhlMb+96FZwBBRIaieV3Cj8VZlUgxd2W/NHLOT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JCeKTT2ClblLF/EyoDa9Qs+dbQL5Xo10oePT7FqpRRWVndXiDEjdasU/zZS66n2oN
	 y68yS4PnSATA4wyhAtxcvOeLnwafmqiYTmKiEsinozxFFRYXR4UbWcVZkncu8E9yYj
	 4dHQrqDhnntpkjp2D5C0wjN4NGR8SBaTQAsHCNjCSpMEY4UG1gtW6qHAMSIG1VyFmC
	 orG6alJYd1rUX1yQATltaOmnGP+ROHQzz8TXGsgBXxSYqZuCQId3wqmMJjdeE+eDxA
	 kh9rd6SkyPv6gOVgAtJeix2OBUc/I0lBFQmnoGEoCPPelLA6pfs48GRDNIrqzVWoQX
	 r3Me4zANMICsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/9] ASoC: qcom: Add QAIF PCM operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260824063627.3595610-7-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-7-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 06:53:06 +0000
Message-Id: <20260824065307.1AE511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The `.pointer` callback can underflow and return garbage if called=
 before the hardware DMA is started.
- [High] High-order contiguous DMA memory allocation in `.open()` is suscep=
tible to runtime fragmentation failures.
- [High] Double free of DMA buffer memory due to orphaned `substream->dma_b=
uffer` pointer.
- [Medium] Using `GENMASK` with an upper bound of `-1` for variants with ze=
ro channels causes undefined behavior.
- [Low] A DMA Control (DMACTL) macro is written to the DMA Configuration (D=
MACFG) register.
--

--- Patch [6]: [PATCH v3 6/9] ASoC: qcom: Add QAIF PCM operations ---
commit 7b414074bdf8efca30967e8f81371a7469f1980b
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: ASoC: qcom: Add QAIF PCM operations

This commit adds the ALSA SoC PCM platform driver for the Qualcomm Audio
Interface (QAIF). It allocates and maps DMA buffers, initializes the QAIF
hardware, and handles the stream operations like open, prepare, pointer,
and close. It also supports mmap and custom copy operations for transferring
data.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> new file mode 100644
> index 0000000000000..4b4647641d113
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-platform.c
[ ... ]
> +static int qaif_map_ee_resource(struct qaif_drv_data *drvdata)
> +{
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +	int ret;
> +
> +	ret =3D regmap_write(map, QAIF_EE_RDDMA_MAP_REG(v), GENMASK(v->num_rddm=
a - 1, 0));

[Severity: Medium]
What happens if a variant has num_rddma or num_wrdma equal to 0?

Using GENMASK(v->num_rddma - 1, 0) without guarding against zero counts cau=
ses
undefined behavior, potentially leading to a negative bitwise shift and
garbage mask values.

> +	if (ret)
> +		return ret;
[ ... ]
> +static int qaif_platform_pcmops_open(struct snd_soc_component *component,
> +				     struct snd_pcm_substream *substream)
> +{
[ ... ]
> +	dma_mem_info->alloc_size =3D qaif_platform_hardware.buffer_bytes_max;
> +	dma_mem_info->vaddr =3D dma_alloc_coherent(component->dev,
> +						 dma_mem_info->alloc_size,
> +						 &dma_mem_info->dma_addr,
> +						 GFP_KERNEL);

[Severity: High]
Is it safe to dynamically allocate an order-5 contiguous block (~122 KB) via
dma_alloc_coherent() each time the PCM stream is opened?

Over time, memory fragmentation could make this allocation highly unreliabl=
e,
causing random stream failures on systems with high uptime. Should this use
preallocated managed buffers in probe instead?

> +	if (!dma_mem_info->vaddr) {
> +		ret =3D -ENOMEM;
> +		goto err_free_mem_info;
> +	}
[ ... ]
> +	buf->bytes =3D qaif_platform_hardware.buffer_bytes_max;
> +	buf->addr =3D dma_mem_info->dma_addr;
> +	buf->area =3D (unsigned char *)dma_mem_info->vaddr;

[Severity: High]
Does this create a double-free risk?

The open callback stores dynamically allocated memory directly into the
core's substream->dma_buffer.area. The close callback frees this memory
using dma_free_coherent() but fails to set substream->dma_buffer.area
to NULL.

If the driver is unloaded or unbound, the ALSA core's teardown path
snd_pcm_lib_preallocate_free_for_all() could blindly call
snd_dma_free_pages() on this non-NULL area pointer.

> +
> +	if (qaif_is_cif_dma_port(dai_id)) {
> +		WRITE_ONCE(drvdata->cif_substream[stream_dma_idx], substream);
[ ... ]
> +static int qaif_platform_pcmops_close(struct snd_soc_component *componen=
t,
> +				      struct snd_pcm_substream *substream)
> +{
[ ... ]
> +	if (dma_mem_info) {
> +		dma_free_coherent(component->dev, dma_mem_info->alloc_size,
> +				  dma_mem_info->vaddr, dma_mem_info->dma_addr);
> +		kfree(dma_mem_info);
> +	}
> +
> +	snd_pcm_set_runtime_buffer(substream, NULL);
> +	substream->runtime->private_data =3D NULL;
> +
> +	kfree(data);
> +	return 0;
> +}
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

[Severity: Low]
Is this using the wrong macro prefix?

QAIF_DMACTL_WM_5 is used to populate the QAIF_DMACFG_SHRAM_WM_MASK bitfield.
The prefix is DMACTL instead of DMACFG, which creates a naming mismatch her=
e.

> +	if (ret)
> +		dev_err(soc_runtime->dev, "error updating DMA CFG: %d\n", ret);
> +	return ret;
> +}
[ ... ]
> +static snd_pcm_uframes_t qaif_platform_pcmops_pointer(struct snd_soc_com=
ponent *component,
> +						      struct snd_pcm_substream *substream)
> +{
[ ... ]
> +	return bytes_to_frames(substream->runtime,
> +			       (curr_addr - base_addr) %
> +			       snd_pcm_lib_buffer_bytes(substream));

[Severity: High]
Could this underflow if ALSA queries the pointer before the DMA is running
and curr_addr reads as 0?

Since base_addr is the physical IOVA, 0 - base_addr underflows, and modulo
buffer_bytes yields a massive random offset which causes immediate XRUN err=
ors.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824063627.3595=
610-1-harendra.gautam@oss.qualcomm.com?part=3D6
