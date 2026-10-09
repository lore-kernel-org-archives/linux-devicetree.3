Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F704C2240
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545642; cv=none; b=a7OlAra42uUM6dXZoiWr5GESEyfxcbuVOSSaG6opKZ06GEi1ylafI7VhUl2FnfHGScAZDpcdEm4FiRbkCmlBmBVMwQ1bHfYwhno55EdWAv9DS+dgu/Z2I9SnkAk9xeyOKx1oXFJoP4+acgARDtS+lqexNWfBssNj54a0+fZMiMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545642; c=relaxed/simple;
	bh=21yUsg+LIgAijtBiw5kVTxUAdInSZ81lx7vB87QL2WI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Cw4OqIGpYuzC34uGZbUAbSxobSls85sQMANKbSOwhRABUogFOS1d2CtBL7Dg46KYumGVhapKz1Sgo/nq7Z2Ze0rsWbCnyrAKIVGRWOcVWT8p0EPDngqcVzRHmjaMnwCNudbgICmfRrmwquLg4mG4K5qxnGWpQY7a5pAfFMub/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7DE+tJV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7DE+tJV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD0D1F000FF;
	Fri,  9 Oct 2026 11:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791545630;
	bh=qXtq6/jeaXCRTZrtQy+HyDUXVp+xmm//GkZXX+LzMeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S7DE+tJV5/wPVDroafudINfpIXcEpawU3UZ2Lt/UiN7nS+kaHVLIjQgtxDh1QWq/j
	 0IbCiN6lhEjf3mqSNXJ6k+Dl4J13KTwBvNnJvc/rzPhsKcnfeOjt0+IGarj+nrhPj5
	 fZlEUdeCaVGLXyXtbdw/yXxwSYsoO/ASscFEKZqoHkEjLckv0Xx4aeRuePf1mCNxve
	 c35E29yFLD+RsTvXZ8C4rKswhRK5HnUYc9OH5ZXAHE9WibN87EBOc0skXM8j2c5GT6
	 VdXQuB0tHiyH/C4QCgc1OwcB7x2V3mo/YSVBZygy1e6BJV9lqrXUhiJWXxmMDAPT42
	 gOUcpMgH+sIJA==
Message-ID: <sashiko-outbox-165389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: airoha: Add support for AN7581 PCM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009111334.23522-3-ansuelsmth@gmail.com>
References: <20261009111334.23522-1-ansuelsmth@gmail.com>
 <20261009111334.23522-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:33:49 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [High] sound: airoha: UAF of DMA descriptors due to devm cleanup ordering
- [High] sound: airoha: probe fails due to IRQF_ONESHOT without thread_fn
- [High] soc: airoha: stream hangs and skips descriptors on underrun/overrun
- [High] sound: airoha: missing interrupt acknowledgement causes IRQ storm
- [High] ASoC: airoha: missing dma_set_coherent_mask() causes DMA address t=
runcation
- [High] sound: airoha: hardware and software pointers desync after XRUN
- [High] alsa: airoha: PCM hardware is configured for non-interleaved data =
but advertises interleaved
- [High] sound: an7581-pcm: premature IRQ handler exit hangs stream on over=
run/underrun
- [High] an7581-pcm: use-after-free of runtime in IRQ handler due to missin=
g synchronize_irq()
- [Medium] sound: airoha: priv->users refcount leak locks hardware configur=
ation
- [Medium] sound: airoha: unbounded tx_pos/rx_pos causes ALSA pointer disco=
ntinuity
- [Medium] sound: airoha: data race on tx_pos and tx_desc_idx in prepare()
- [Medium] sound: airoha: device_node_to_regmap() on non-syscon node leaks =
memory
- [Medium] sound: airoha: missing DMA memory barriers for descriptor status
- [Medium] irq: unconditional IRQ_HANDLED breaks spurious interrupt detecti=
on
--

commit 89efa182514eefdcd30c073a692953c0c449d4d3
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: ASoC: airoha: Add support for AN7581 PCM driver

This commit adds a new ALSA SoC platform driver for the Airoha AN7581 PCM
controller, supporting playback and capture at sample rates of 8 kHz and
16 kHz with up to 32 channels.

> diff --git a/sound/soc/airoha/an7581-pcm.c b/sound/soc/airoha/an7581-pcm.c
> index 0000000000000..51e5264fe801a
> --- /dev/null
> +++ b/sound/soc/airoha/an7581-pcm.c
> @@ -189,11 +189,9 @@ struct an7581_pcm_priv {
>  	unsigned int rx_pos;
>  };
> =20
>  static const struct snd_pcm_hardware an7581_pcm_hardware =3D {
>  	.info			=3D SNDRV_PCM_INFO_MMAP |
>  				  SNDRV_PCM_INFO_MMAP_VALID |
>  				  SNDRV_PCM_INFO_INTERLEAVED,

[Severity: High]
Does advertising SNDRV_PCM_INFO_INTERLEAVED conflict with the hardware
configuration? In hw_params, the driver sets AN7581_PCM_DESC_CHBF_OFFSET to
the size of a single channel's period, matching a non-interleaved memory
layout. ALSA applications will supply interleaved data, which the hardware
DMA may misinterpret, outputting the wrong samples to the wrong channels.

>  	.formats		=3D SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_U16_LE,

[ ... ]

> @@ -259,10 +259,9 @@ static void an7581_pcm_fe_shutdown(struct snd_pcm_su=
bstream *substream,
>  		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
>  				  AN7581_PCM_RXDMA_ENABLE);
>  	}
> =20
>  	priv->stream[substream->stream] =3D NULL;
> =20
>  	usleep_range(10000, 20000);

[Severity: High]
Is it possible for a delayed IRQ handler to access a freed runtime? The
driver detaches the stream pointer here but does not wait for concurrent
handlers to finish with synchronize_irq(). A handler executing on another
CPU could have cached the substream pointer and might dereference
substream->runtime after the ALSA core has freed it.

>  	mutex_lock(&priv->user_lock);
> =20
>  	if (priv->users)
>  		priv->users--;

[Severity: Medium]
Is there a reference leak for priv->users if userspace calls hw_params
multiple times for the same stream before it starts? Each call to hw_params
increments priv->users, but shutdown only decrements it once. This can lock
the stream configuration by preventing AN7581_PCM_CFG_VALID from clearing,
causing subsequent hw_params calls to fail full-duplex constraints.

[ ... ]

> @@ -274,10 +273,8 @@ static int an7581_pcm_fe_prepare(struct snd_pcm_subs=
tream *substream,
>  				 struct snd_soc_dai *dai)
>  {
>  	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
>  	struct an7581_pcm_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_pcm_runtime *runtime =3D substream->runtime;
>  	struct an7581_pcm_desc *desc;
>  	unsigned int period_bytes;
>  	int num_desc, i;
> =20
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>  		priv->tx_pos =3D 0;
>  		priv->tx_desc_idx =3D 0;

[Severity: Medium]
Is there a data race when resetting tx_pos and tx_desc_idx here? These
variables are modified without acquiring priv->desc_lock. Because ALSA
trigger(STOP) does not call synchronize_irq(), an IRQ handler might still be
executing on another CPU when prepare is called, leading to state corruptio=
n.

[Severity: High]
Could the hardware and software pointers desync after an XRUN? During stream
prepare, the software index is reset to 0, but the hardware DMA base address
is only written in hw_params. If prepare is called to recover from an XRUN,
the hardware will resume from its previous descriptor index while the
software handler expects it at index 0, potentially causing a stall.

>  		desc =3D priv->tx_descs;
>  		num_desc =3D AN7581_PCM_TX_DESCRIPTORS;

[ ... ]

> @@ -291,10 +288,8 @@ static int an7581_pcm_fe_prepare(struct snd_pcm_subs=
tream *substream,
>  	period_bytes =3D frames_to_bytes(runtime, AN7581_PCM_FRAMES_PER_DESC);
>  	for (i =3D 0; i < num_desc; i++) {
>  		desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
>  		desc->dma_addr =3D runtime->dma_addr + i * period_bytes;

[Severity: High]
Will runtime->dma_addr be truncated on 64-bit systems? Since
dma_set_coherent_mask() is not called in probe, coherent allocations might
return a 64-bit physical address on ARM64, which would be silently truncated
when assigned to the 32-bit desc->dma_addr field here.

>  		desc++;
>  	}

[ ... ]

> @@ -455,10 +450,8 @@ static int an7581_pcm_fe_hw_params(struct snd_pcm_su=
bstream *substream,
>  	}
> =20
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>  		regmap_write(priv->map, AN7581_PCM_TDRBAR, priv->tx_dma);
>  	else
>  		regmap_write(priv->map, AN7581_PCM_RDRBAR, priv->rx_dma);

[Severity: High]
Could priv->tx_dma and priv->rx_dma be truncated when written? regmap_write
expects an unsigned int value, which will truncate a 64-bit dma_addr_t to
32 bits on a 64-bit platform.

[ ... ]

> @@ -546,12 +539,9 @@ static snd_pcm_uframes_t an7581_pcm_pointer(struct s=
nd_soc_component *component,
> =20
>  	spin_lock_irqsave(&priv->desc_lock, flags);
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>  		pos =3D bytes_to_frames(runtime, priv->tx_pos);
>  	else
>  		pos =3D bytes_to_frames(runtime, priv->rx_pos);
>  	spin_unlock_irqrestore(&priv->desc_lock, flags);
> =20
>  	return pos % runtime->buffer_size;

[Severity: Medium]
Will this modulo operation produce a discontinuous jump when the counters
overflow? tx_pos and rx_pos indefinitely increment by the period size in
bytes. When the 32-bit counter wraps around UINT_MAX to 0, the modulo
operation produces a jump because UINT_MAX + 1 is not typically a multiple
of buffer_size. This can confuse the ALSA core and lead to an XRUN.

[ ... ]

> @@ -661,10 +651,8 @@ static irqreturn_t an7581_pcm_irq_handler(int irq, v=
oid *data)
>  	struct an7581_pcm_priv *priv =3D data;
>  	unsigned long flags;
>  	u32 status, isr =3D 0;
> =20
>  	regmap_read(priv->map, AN7581_PCM_ISR, &isr);

[Severity: High]
Are pending interrupts left active here? The interrupt status is read to
identify the source, but it is never explicitly written back to clear the
status in AN7581_PCM_ISR. Since the DT binding specifies a level-triggered
interrupt, omitting the write-back can cause a severe interrupt storm.

> =20
>  	/* Scan descriptor on receiving RX desc update interrupt */
>  	if (isr & AN7581_PCM_IMR_RDESC_UPDATE_INT) {

[ ... ]

> @@ -681,10 +669,8 @@ static irqreturn_t an7581_pcm_irq_handler(int irq, v=
oid *data)
>  		for (i =3D 0; i < AN7581_PCM_RX_DESCRIPTORS; i++) {
>  			spin_lock_irqsave(&priv->desc_lock, flags);
> =20
>  			desc =3D &priv->rx_descs[priv->rx_desc_idx];
>  			status =3D desc->status;

[Severity: Medium]
Are DMA memory barriers missing here? The CPU checks descriptor ownership
without a subsequent dma_rmb(), which might allow speculative reads of stale
buffer data.

>  			if ((status & AN7581_PCM_DESC_STATUS_OWNERSHIP) =3D=3D
>  			    AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA) {

[ ... ]

> @@ -704,10 +690,8 @@ static irqreturn_t an7581_pcm_irq_handler(int irq, v=
oid *data)
>  			spin_unlock_irqrestore(&priv->desc_lock, flags);
> =20
>  			snd_pcm_period_elapsed(substream);
> =20
>  			desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;

[Severity: Medium]
Is a dma_wmb() missing before handing ownership back to the DMA? Without it,
the CPU might write the ownership status back to RAM before earlier writes
are visible to the device.

> =20
>  			if (snd_pcm_capture_hw_avail(runtime) < runtime->period_size)
>  				goto handle_tx;

[Severity: High]
Does exiting early here stall the stream on underrun or overrun? If the
hardware available frames drop below period_size, this early exit aborts
the loop. Remaining completed descriptors are abandoned with CPU ownership,
and the DMA polling demand register is not written, permanently hanging the
DMA engine.

> =20
>  			rx_poll =3D true;

[ ... ]

> @@ -767,11 +751,9 @@ static irqreturn_t an7581_pcm_irq_handler(int irq, v=
oid *data)
>  			snd_pcm_period_elapsed(substream);
> =20
>  			desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
> =20
>  			if (snd_pcm_playback_hw_avail(runtime) < runtime->period_size)
>  				return IRQ_HANDLED;

[Severity: Medium]
Is it safe to return IRQ_HANDLED unconditionally on early exit paths? The
kernel's spurious interrupt detection mechanism relies on handlers returning
IRQ_NONE when they did not service any interrupt. Blindly returning
IRQ_HANDLED prevents the core from disabling a stuck interrupt line.

> =20
>  			tx_poll =3D true;
>  		}

[ ... ]

> @@ -787,14 +769,11 @@ static int an7581_pcm_probe(struct platform_device =
*pdev)
>  		return -ENOMEM;
>  	snd_soc_card_set_drvdata(card, priv);
> =20
>  	priv->map =3D device_node_to_regmap(dev->of_node);
>  	if (IS_ERR(priv->map))
>  		return PTR_ERR(priv->map);

[Severity: Medium]
Does calling device_node_to_regmap on a non-syscon node leak memory? This
API is intended for persistent syscon devices, registering the regmap in a
global static list without a cleanup function. If the driver is unloaded,
the regmap structure and MMIO mapping will remain allocated forever.

> =20
>  	priv->reset =3D devm_reset_control_get_exclusive(dev, "pcm1");
>  	if (IS_ERR(priv->reset))
>  		return PTR_ERR(priv->reset);
> =20
>  	irq =3D of_irq_get(dev_of_node(dev), 0);
>  	if (irq < 0)
>  		return irq;
> =20
>  	ret =3D devm_request_threaded_irq(dev, irq, an7581_pcm_irq_handler,
>  					NULL, IRQF_ONESHOT, dev_name(dev), priv);

[Severity: High]
Will this probe fail unconditionally? devm_request_threaded_irq is called
with IRQF_ONESHOT and a NULL thread_fn. According to core IRQ management,
IRQF_ONESHOT requires a threaded handler, and omitting it causes
request_threaded_irq to return -EINVAL and trigger a WARN_ON_ONCE.

>  	if (ret)
>  		return ret;

[ ... ]

> @@ -814,11 +793,8 @@ static int an7581_pcm_probe(struct platform_device *=
pdev)
>  	reset_control_deassert(priv->reset);
>  	usleep_range(5000, 10000);
> =20
>  	ret =3D dma_set_mask(dev, DMA_BIT_MASK(32));

[Severity: High]
Should this use dma_set_mask_and_coherent instead? The streaming mask is
restricted to 32 bits, but the coherent mask retains its default. On 64-bit
platforms, dma_alloc_coherent might return addresses above 4GB, which are
then silently truncated when assigned to the 32-bit dma_addr fields.

>  	if (ret)
>  		return ret;

[ ... ]

> @@ -862,11 +838,8 @@ static void an7581_pcm_remove(struct platform_device=
 *pdev)
>  			  AN7581_PCM_IMR_RDESC_UPDATE_INT);
>  	regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
>  			  AN7581_PCM_TXDMA_ENABLE |
>  			  AN7581_PCM_RXDMA_ENABLE);
> =20
>  	dma_free_coherent(dev, sizeof(struct an7581_pcm_desc) *
>  			  AN7581_PCM_RX_DESCRIPTORS, priv->rx_descs, priv->rx_dma);
>  	dma_free_coherent(dev, sizeof(struct an7581_pcm_desc) *
>  			  AN7581_PCM_TX_DESCRIPTORS, priv->tx_descs, priv->tx_dma);
>  }

[Severity: High]
Does freeing the DMA descriptors explicitly here cause a use-after-free?
The driver registers its ALSA components and sound card using managed
devm_snd_soc_register_component and devm_snd_soc_register_card in probe.
Because devres callbacks execute after remove returns, the ALSA components
remain registered and accessible to user-space while and immediately after
this memory is freed. A concurrent ALSA callback or an in-flight IRQ could
dereference the freed descriptor arrays.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009111334.2352=
2-1-ansuelsmth@gmail.com?part=3D2
