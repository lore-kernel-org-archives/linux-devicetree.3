Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453741;
	b=yy509gDu/CR+0Mn6JCAkn3cK/1uCQq6mYGKG9T9iD51lgZ8zWJLf80DsfOOXZLNho++c
	 VSDy1Piyy532dwfVe7cDUE+TLDVDWHk5NVZdTv3MlF1nIz+iEkz1ZffvEXjzq4svG0tJK
	 2Tz0UTXP2eHOxMmOBqzyAJq67BqVD4EwjlC9NgKkERc94NsEHs15OI9BqmLytm/N2ygmW
	 pxDaeHWrt97oRi38QI+BDQeD8MIhRUwLv/7epVG/tCJ3Bx3T3aj9MCZlleuJ05P5EXk8e
	 W3eMBt1SPJmlWGAcj5D8LWIQbUvJqgyrPdFunPnP2+JQWke4/tVvPYuSTjcycv7yQTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453741;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6jMMT5s58OCjPOPDsQNnRcRQdZeXJaEM+jOpiOc7Mj0=;
	b=l9lsJxz5Qq3QFoFKcp5po19GXE+VyQTZr74BUnU7PG7NaF+fi5yncMovH0hYc4earDHg
	 E/lj86sIFRQdOQzL9KI6l0kbDcExWb5X0QQb56OGuhMLLZZ1iqut4Q9nR29R51m2vzNKh
	 AeuUoRSAcXAMQrHi1d6CoJq0I3kWb8H8yThuBZVTsVD8p0KJxqrfxnFEY45mxfCGOtQGJ
	 hYyxskcmXwxnxLliXMmJ8hErPBpjOEkwihh6KUv4K4uWI906s2Yc2CxhP0XRvMBNIBQb1
	 PbJEN2BY3u2KboSgxzYpzzP6AqLems68PHZf9bT+Ami5p91yMpyyx/7CRg14rJy5zcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=epNdFhcv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAE606A319
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=epNdFhcv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FA71F000C4;
	Mon, 19 Oct 2026 23:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792453740;
	bh=6jMMT5s58OCjPOPDsQNnRcRQdZeXJaEM+jOpiOc7Mj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=epNdFhcvSc+RZ4Xgs1ujJwNky5kgz6emrD99WbnL4pmk3fNIALpUvNNuDPCES0l7i
	 XXJFwHd9+Z3HcmAbX5LNw+4DR1o/jiTXPGsJLBMHlGNVEUndlhjA9h/TB88aXny1jk
	 51bVsgQ7ZgBt1UJvZy0E60eDanrpPZX6quQI5zSojjvM6XPHqtsNvpb2OU/AQAxqms
	 NKBZEs2rQrLLyqQm36mfRhIWVpu+W7DSv71UgP/kflO+AuuBiDq4IyzwkAzUsebqTy
	 0rQyeGVvUPR3yiL8nrZn2zXInTYIbwdEzOEcpQsojdMGqKS9H2KcI7BWfJ4Uztb0mG
	 k/xjKCHpxOlAQ==
Message-ID: <sashiko-outbox-178365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] ASoC: airoha: Add support for AN7581 PCM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019232412.516028-3-ansuelsmth@gmail.com>
References: <20261019232412.516028-1-ansuelsmth@gmail.com>
 <20261019232412.516028-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 23:49:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] ASoC: airoha: broken full-duplex state tracking in an7581_pcm_fe_h=
w_params()
- [High] ASoC: airoha: early exit in an7581_pcm_irq_handler() skips DMA pol=
l write
- [High] ASoC: airoha: premature devm_request_irq() in an7581_pcm_probe()
- [High] ASoC: airoha: unsynchronized substream lifetime in an7581_pcm_irq_=
handler()
- [Medium] ASoC: airoha: tx_pos/rx_pos overflow and wrap jump in an7581_pcm=
_pointer()
- [Medium] ASoC: airoha: missing check for 0 from of_irq_get() in an7581_pc=
m_probe()
- [Medium] ASoC: airoha: an7581-pcm: return 0 on success in an7581_pcm_fe_s=
tartup()
- [Medium] ASoC: airoha: an7581-pcm: race on DMA descriptors and ring state=
 in IRQ handler
- [Low] ASoC: airoha: missing select REGMAP_MMIO in SND_SOC_AN7581_PCM Kcon=
fig
--

commit dbab87e2089692341b1aa76c1a7743b78829fd82
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: airoha: Add support for AN7581 PCM driver

This commit adds an ASoC platform driver for the Airoha AN7581 PCM
controller supporting playback and capture at 8 kHz and 16 kHz with up to
32 channels.

> diff --git a/sound/soc/airoha/Kconfig b/sound/soc/airoha/Kconfig
> new file mode 100644
> index 0000000000000..20c9211430c95
> --- /dev/null
> +++ b/sound/soc/airoha/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config SND_SOC_AN7581_PCM
> +	tristate "PCM support for Airoha AN7581 chip"
> +	depends on ARCH_AIROHA || COMPILE_TEST

[Severity: Low]
Since an7581_pcm_probe() calls devm_regmap_init_mmio(), should
SND_SOC_AN7581_PCM select REGMAP_MMIO here to avoid link errors when
CONFIG_REGMAP_MMIO is not enabled?

> +	help
> +	  This adds PCM driver for Airoha AN7581 boards
> +	  that can be used with other codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".

[ ... ]

> diff --git a/sound/soc/airoha/an7581-pcm.c b/sound/soc/airoha/an7581-pcm.c
> new file mode 100644
> index 0000000000000..803b1dda26a0e
> --- /dev/null
> +++ b/sound/soc/airoha/an7581-pcm.c

[ ... ]

> +static int an7581_pcm_fe_startup(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct an7581_pcm_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	int ret;
> +
> +	snd_soc_set_runtime_hwparams(substream, &an7581_pcm_hardware);
> +
> +	ret =3D snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIOD=
_SIZE,
> +					   AN7581_PCM_FRAMES_PER_DESC,
> +					   AN7581_PCM_FRAMES_PER_DESC);
> +	if (ret < 0) {
> +		dev_err(rtd->card->dev, "failed to constrain period to 80 frames\n");
> +		return ret;
> +	}
> +
> +	ret =3D snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIO=
DS);
> +	if (ret < 0) {
> +		dev_err(rtd->card->dev, "snd_pcm_hw_constraint_integer failed\n");
> +		return ret;
> +	}
> +
> +	/* Cache stream substream for IRQ handling */
> +	priv->stream[substream->stream] =3D substream;
> +
> +	/* On open mask interrupt and disable DMA */
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_TDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_TXDMA_ENABLE);
> +	} else {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_RDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_RXDMA_ENABLE);
> +	}
> +
> +	usleep_range(10000, 20000);
> +
> +	mutex_lock(&priv->user_lock);
> +
> +	if (!priv->users) {
> +		regmap_clear_bits(priv->map, AN7581_PCM_PICR,
> +				  AN7581_PCM_CFG_VALID);
> +
> +		usleep_range(5000, 10000);
> +	}
> +
> +	priv->users++;
> +
> +	mutex_unlock(&priv->user_lock);
> +
> +	return ret;
> +}

[Severity: Medium]
In an7581_pcm_fe_startup(), snd_pcm_hw_constraint_integer() returns 1 when
the constraint is applied, which is then returned at the end of the
function.

In sound/soc/soc-dai.c:snd_soc_dai_startup():

	/* mark substream if succeeded */
	if (ret =3D=3D 0)
		soc_dai_mark_push(dai, substream, startup);

Because ret is 1 rather than 0, snd_soc_dai_startup() skips
soc_dai_mark_push(). If a later step in __soc_pcm_open() fails and triggers
rollback via soc_pcm_clean() -> snd_soc_dai_shutdown(),
soc_dai_mark_match() will not match and an7581_pcm_fe_shutdown() will be
skipped, leaking priv->users and leaving priv->stream[substream->stream]
set to the closed substream.

Should an7581_pcm_fe_startup() return 0 on success?

> +
> +static void an7581_pcm_fe_shutdown(struct snd_pcm_substream *substream,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct an7581_pcm_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
> +
> +	/* On close mask interrupt and disable DMA */
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_TDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_TXDMA_ENABLE);
> +	} else {
> +		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
> +				  AN7581_PCM_IMR_RDESC_UPDATE_INT);
> +		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
> +				  AN7581_PCM_RXDMA_ENABLE);
> +	}
> +
> +	priv->stream[substream->stream] =3D NULL;

[Severity: High]
Can an7581_pcm_irq_handler() race with stream startup, stop, and shutdown
when accessing priv->stream[] and substream->runtime?

1. Neither card->snd_card->sync_irq nor a component .sync_stop callback is
configured, and an7581_pcm_fe_shutdown() clears
priv->stream[substream->stream] without lock serialization or
synchronize_irq(). If an7581_pcm_irq_handler() is already running on
another CPU (or preempted as a threaded handler under IRQF_COND_ONESHOT)
and has loaded substream =3D priv->stream[...], snd_pcm_release_substream()
can proceed into snd_pcm_detach_substream() and free substream->runtime
while the IRQ handler is still dereferencing runtime in frames_to_bytes(),
snd_pcm_period_elapsed(), and snd_pcm_*_hw_avail().

2. When snd_pcm_drop() holds pcm_stream_lock_irq(substream) and invokes
an7581_pcm_fe_trigger(SNDRV_PCM_TRIGGER_STOP), a concurrent
an7581_pcm_irq_handler() waiting on pcm_stream_lock_irqsave(substream)
inside snd_pcm_period_elapsed() will resume once snd_pcm_drop() drops the
lock, set desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA, and write
AN7581_PCM_TPDR / AN7581_PCM_RPDR after the stream was stopped.

3. In an7581_pcm_fe_startup(), priv->stream[substream->stream] =3D substream
is published at open time before hw_params() or prepare() has initialized
runtime->frame_bits, runtime->period_size, or descriptor ownership (which
starts zero-initialized as AN7581_PCM_DESC_STATUS_OWNERSHIP_CPU). Since
an7581_pcm_irq_handler() checks AN7581_PCM_ISR without masking by
AN7581_PCM_IMR, an interrupt from the other active direction when a stale
ISR bit is set can walk the newly opened stream's CPU-owned descriptors
before prepare() has run.

> +
> +	usleep_range(10000, 20000);
> +
> +	mutex_lock(&priv->user_lock);
> +
> +	if (priv->users)
> +		priv->users--;
> +
> +	if (!priv->users)
> +		regmap_clear_bits(priv->map, AN7581_PCM_PICR,
> +				  AN7581_PCM_CFG_VALID);
> +
> +	mutex_unlock(&priv->user_lock);
> +}
> +
> +static int an7581_pcm_fe_prepare(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct an7581_pcm_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct an7581_pcm_desc *desc;
> +	unsigned int period_bytes;
> +	unsigned long flags;
> +	int num_desc, i;
> +
> +	spin_lock_irqsave(&priv->desc_lock, flags);
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		priv->tx_pos =3D 0;
> +		priv->tx_desc_idx =3D 0;
> +		desc =3D priv->tx_descs;
> +		num_desc =3D AN7581_PCM_TX_DESCRIPTORS;
> +	} else {
> +		priv->rx_pos =3D 0;
> +		priv->rx_desc_idx =3D 0;
> +		desc =3D priv->rx_descs;
> +		num_desc =3D AN7581_PCM_RX_DESCRIPTORS;
> +	}
> +	spin_unlock_irqrestore(&priv->desc_lock, flags);
> +
> +	period_bytes =3D frames_to_bytes(runtime, AN7581_PCM_FRAMES_PER_DESC);
> +	for (i =3D 0; i < num_desc; i++) {
> +		desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
> +		desc->dma_addr =3D runtime->dma_addr + i * period_bytes;
> +		desc++;
> +	}

[Severity: Medium]
In an7581_pcm_fe_prepare() and an7581_pcm_fe_hw_params(), the descriptor
rings are updated outside priv->desc_lock, while in
an7581_pcm_irq_handler(), priv->desc_lock is dropped before calling
snd_pcm_period_elapsed() and setting
desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA.

If snd_pcm_period_elapsed() triggers an XRUN stop (or userspace calls
SNDRV_PCM_IOCTL_DROP) and userspace immediately calls prepare() or
hw_params() on another CPU while an7581_pcm_irq_handler() is still in its
descriptor loop, can the concurrent descriptor and index updates corrupt
desc->status, tx_desc_idx / rx_desc_idx, and tx_pos / rx_pos?

Also, in an7581_pcm_irq_handler(), snd_pcm_capture_hw_avail(runtime) and
snd_pcm_playback_hw_avail(runtime) read runtime->status->hw_ptr and
runtime->control->appl_ptr without holding the PCM substream lock.

> +
> +	return 0;
> +}
> +
> +static int an7581_pcm_fe_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct an7581_pcm_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
> +	unsigned int channels =3D params_channels(params);
> +	unsigned int rate =3D params_rate(params);
> +	int bit_width =3D params_width(params);
> +	struct an7581_pcm_desc *desc;
> +	int num_desc, i;
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		desc =3D priv->tx_descs;
> +		num_desc =3D AN7581_PCM_TX_DESCRIPTORS;
> +	} else {
> +		desc =3D priv->rx_descs;
> +		num_desc =3D AN7581_PCM_RX_DESCRIPTORS;
> +	}
> +
> +	mutex_lock(&priv->user_lock);
> +	if (priv->users > 1 &&
> +	    (priv->current_rate !=3D rate ||
> +	     priv->current_channels !=3D channels)) {
> +		dev_err(rtd->card->dev, "playback/capture rates/channels must match in=
 full-duplex mode\n");
> +		mutex_unlock(&priv->user_lock);
> +		return -EBUSY;
> +	}
> +
> +	if (priv->users <=3D 1) {
> +		/* one bit delay for ZSI */
> +		regmap_set_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_ONE_BIT_DELAY);
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_PICR,
> +				   AN7581_PCM_BIT_MSTSLV_MODE,
> +				   AN7581_PCM_BIT_MSTSLV_MODE_MASTER);
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_PICR,
> +				   AN7581_PCM_BIT_CLK,
> +				   AN7581_PCM_BIT_CLK_2048HZ);
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_PICR,
> +				   AN7581_PCM_SAMPLE_CLK,
> +				   (rate =3D=3D 16000 ? AN7581_PCM_SAMPLE_CLK_16KHZ :
> +				   AN7581_PCM_SAMPLE_CLK_8KHZ));
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_PICR,
> +				   AN7581_PCM_FS_LEN,
> +				   AN7581_PCM_FS_LEN_16);
> +
> +		regmap_set_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_BIT_ORDER);
> +
> +		regmap_clear_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_FS_EDGE);
> +	}
> +
> +	/* Setup timeslot */
> +	an7581_pcm_setup_time_slot(priv, substream->stream, bit_width);
> +
> +	if (priv->users <=3D 1) {
> +		/* Setup Descriptor size and number */
> +		regmap_update_bits(priv->map, AN7581_PCM_TRDRSR,
> +				   AN7581_DESC_OFFSET | AN7581_DESC_SIZE,
> +				   FIELD_PREP(AN7581_DESC_OFFSET, sizeof(*desc) / sizeof(u32)) |
> +				   FIELD_PREP(AN7581_DESC_SIZE, num_desc));
> +
> +		regmap_update_bits(priv->map, AN7581_PCM_CHBFOSR,
> +				   AN7581_PCM_DESC_CHBF_OFFSET,
> +				   FIELD_PREP(AN7581_PCM_DESC_CHBF_OFFSET,
> +					      AN7581_PCM_FRAMES_PER_DESC * bit_width / 8));
> +	}
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		regmap_write(priv->map, AN7581_PCM_TDRBAR, priv->tx_dma);
> +	else
> +		regmap_write(priv->map, AN7581_PCM_RDRBAR, priv->rx_dma);
> +
> +	/* Configure descriptors for DMA ownership and sample size */
> +	for (i =3D 0; i < num_desc; i++) {
> +		/* Assign to each descriptor the dma_addr + offset of period bytes */
> +		desc[i].status =3D FIELD_PREP(AN7581_PCM_DESC_STATUS_SAMPLE_SIZE,
> +					    AN7581_PCM_FRAMES_PER_DESC);
> +
> +		desc[i].channel_mask =3D GENMASK(channels - 1, 0);
> +	}
> +
> +	if (priv->users <=3D 1) {
> +		/* Enable channels */
> +		regmap_update_bits(priv->map, AN7581_PCM_DCHENR,
> +				   AN7581_PCM_CHAN_EN,
> +				   FIELD_PREP(AN7581_PCM_CHAN_EN, GENMASK(channels - 1, 0)));
> +
> +		/* Signal PCM configuration is now valid */
> +		regmap_set_bits(priv->map, AN7581_PCM_PICR,
> +				AN7581_PCM_CFG_VALID);
> +	}
> +
> +	priv->current_rate =3D rate;
> +	priv->current_channels =3D channels;
> +
> +	mutex_unlock(&priv->user_lock);
> +
> +	return 0;
> +}

[Severity: High]
What happens in an7581_pcm_fe_hw_params() when a full-duplex application
opens both playback and capture substreams before calling hw_params() on
either of them?

Because priv->users is incremented in an7581_pcm_fe_startup(), priv->users
is already 2 when the first an7581_pcm_fe_hw_params() call runs:

1. On the first session after probe, priv->current_rate and
priv->current_channels are 0, so the priv->users > 1 check fails with
-EBUSY on the very first hw_params() call.

2. On subsequent sessions after both streams were closed,
priv->current_rate and priv->current_channels retain stale values from the
previous session. If the new session uses a different rate or channel
count, hw_params() fails with -EBUSY; if they happen to match the stale
values, all three `if (priv->users <=3D 1)` blocks are skipped for both
streams, leaving AN7581_PCM_PICR (including AN7581_PCM_CFG_VALID, which was
cleared on startup/shutdown), AN7581_PCM_TRDRSR, AN7581_PCM_CHBFOSR, and
AN7581_PCM_DCHENR unconfigured.

Additionally, AN7581_PCM_CHBFOSR is a single shared register programmed to
AN7581_PCM_FRAMES_PER_DESC * bit_width / 8 when priv->users <=3D 1, but
an7581_pcm_fe_hw_params() does not check that bit_width matches between
playback and capture.

[ ... ]

> +static snd_pcm_uframes_t an7581_pcm_pointer(struct snd_soc_component *co=
mponent,
> +					    struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_card *card =3D component->card;
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct an7581_pcm_priv *priv;
> +	unsigned long flags;
> +	unsigned int pos;
> +
> +	priv =3D snd_soc_card_get_drvdata(card);
> +
> +	spin_lock_irqsave(&priv->desc_lock, flags);
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		pos =3D bytes_to_frames(runtime, priv->tx_pos);
> +	else
> +		pos =3D bytes_to_frames(runtime, priv->rx_pos);
> +	spin_unlock_irqrestore(&priv->desc_lock, flags);
> +
> +	return pos % runtime->buffer_size;
> +}

[Severity: Medium]
In an7581_pcm_irq_handler(), priv->tx_pos and priv->rx_pos are incremented
on every descriptor without wrapping modulo the buffer byte size, and
an7581_pcm_pointer() passes them to bytes_to_frames() before taking
pos % runtime->buffer_size.

In include/sound/pcm.h:bytes_to_frames():

static inline snd_pcm_sframes_t bytes_to_frames(struct snd_pcm_runtime *run=
time, ssize_t size)
{
	return size * 8 / runtime->frame_bits;
}

On 32-bit architectures, ssize_t is 32-bit signed, so size * 8 overflows
once tx_pos or rx_pos reaches 256 MiB (around 4.3 minutes at 16 kHz,
32 channels, 16-bit). Even on 64-bit architectures, when the 32-bit
unsigned int tx_pos or rx_pos wraps around 2^32, because
runtime->buffer_size is 1200 frames (15 * 80) and 2^32 is not a multiple of
1200, pos % runtime->buffer_size will jump discontinuously across the wrap
boundary.

Should tx_pos and rx_pos be wrapped modulo snd_pcm_lib_buffer_bytes(substre=
am)
when updated (or tracked in frames modulo runtime->buffer_size)?

[ ... ]

> +static irqreturn_t an7581_pcm_irq_handler(int irq, void *data)
> +{
> +	struct snd_pcm_substream *substream;
> +	struct an7581_pcm_priv *priv =3D data;
> +	unsigned long flags;
> +	u32 status, isr =3D 0;
> +
> +	regmap_read(priv->map, AN7581_PCM_ISR, &isr);
> +
> +	/* Scan descriptor on receiving RX desc update interrupt */
> +	if (isr & AN7581_PCM_IMR_RDESC_UPDATE_INT) {
> +		struct snd_pcm_runtime *runtime;
> +		struct an7581_pcm_desc *desc;
> +		unsigned int sample_size;
> +		bool rx_poll =3D false;
> +		int i;
> +
> +		substream =3D priv->stream[SNDRV_PCM_STREAM_CAPTURE];
> +		if (!substream)
> +			goto handle_tx;
> +
> +		runtime =3D substream->runtime;
> +
> +		for (i =3D 0; i < AN7581_PCM_RX_DESCRIPTORS; i++) {
> +			spin_lock_irqsave(&priv->desc_lock, flags);
> +
> +			desc =3D &priv->rx_descs[priv->rx_desc_idx];
> +			status =3D desc->status;
> +			if ((status & AN7581_PCM_DESC_STATUS_OWNERSHIP) =3D=3D
> +			    AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA) {
> +				spin_unlock_irqrestore(&priv->desc_lock,
> +						       flags);
> +				break;
> +			}
> +
> +			sample_size =3D FIELD_GET(AN7581_PCM_DESC_STATUS_SAMPLE_SIZE,
> +						status);
> +
> +			priv->rx_pos +=3D frames_to_bytes(runtime, sample_size);
> +			priv->rx_desc_idx++;
> +			if (priv->rx_desc_idx =3D=3D AN7581_PCM_RX_DESCRIPTORS)
> +				priv->rx_desc_idx =3D 0;
> +
> +			spin_unlock_irqrestore(&priv->desc_lock, flags);
> +
> +			snd_pcm_period_elapsed(substream);
> +
> +			desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
> +
> +			if (snd_pcm_capture_hw_avail(runtime) < runtime->period_size)
> +				goto handle_tx;
> +
> +			rx_poll =3D true;
> +		}
> +
> +		if (rx_poll)
> +			regmap_write(priv->map, AN7581_PCM_RPDR, AN7581_PCM_RX_POLLING);
> +	}
> +
> +handle_tx:
> +	/* Scan descriptor on receiving TX desc update interrupt */
> +	if (isr & AN7581_PCM_IMR_TDESC_UPDATE_INT) {
> +		struct snd_pcm_runtime *runtime;
> +		struct an7581_pcm_desc *desc;
> +		unsigned int sample_size;
> +		bool tx_poll =3D false;
> +		int i;
> +
> +		substream =3D priv->stream[SNDRV_PCM_STREAM_PLAYBACK];
> +		if (!substream)
> +			return IRQ_HANDLED;
> +
> +		runtime =3D substream->runtime;
> +
> +		for (i =3D 0; i < AN7581_PCM_TX_DESCRIPTORS; i++) {
> +			spin_lock_irqsave(&priv->desc_lock, flags);
> +
> +			desc =3D &priv->tx_descs[priv->tx_desc_idx];
> +			status =3D desc->status;
> +			if ((status & AN7581_PCM_DESC_STATUS_OWNERSHIP) =3D=3D
> +			    AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA) {
> +				spin_unlock_irqrestore(&priv->desc_lock,
> +						       flags);
> +				break;
> +			}
> +
> +			sample_size =3D FIELD_GET(AN7581_PCM_DESC_STATUS_SAMPLE_SIZE,
> +						status);
> +
> +			priv->tx_pos +=3D frames_to_bytes(runtime, sample_size);
> +			priv->tx_desc_idx++;
> +			if (priv->tx_desc_idx =3D=3D AN7581_PCM_TX_DESCRIPTORS)
> +				priv->tx_desc_idx =3D 0;
> +
> +			spin_unlock_irqrestore(&priv->desc_lock, flags);
> +
> +			snd_pcm_period_elapsed(substream);
> +
> +			desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
> +
> +			if (snd_pcm_playback_hw_avail(runtime) < runtime->period_size)
> +				return IRQ_HANDLED;
> +
> +			tx_poll =3D true;
> +		}
> +
> +		if (tx_poll)
> +			regmap_write(priv->map, AN7581_PCM_TPDR,
> +				     AN7581_PCM_TX_POLLING);
> +	}

[Severity: High]
In an7581_pcm_irq_handler(), when snd_pcm_capture_hw_avail(runtime) <
runtime->period_size or snd_pcm_playback_hw_avail(runtime) <
runtime->period_size, the code jumps out via goto handle_tx or
return IRQ_HANDLED after already setting
desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA:

1. If an earlier iteration in the same loop already processed a descriptor
and set rx_poll =3D true or tx_poll =3D true, jumping past the loop skips t=
he
regmap_write() to AN7581_PCM_RPDR or AN7581_PCM_TPDR for the earlier
descriptor(s).

2. Even on the first descriptor in the loop, if hw_avail drops below one
period while the stream remains in SNDRV_PCM_STATE_RUNNING (for example,
before userspace writes the next period or when stop_threshold >
buffer_size), skipping the AN7581_PCM_TPDR / AN7581_PCM_RPDR write leaves
DMA polling halted with no .ack callback to restart polling once userspace
supplies or consumes more frames.

Could this stall playback or capture?

> +
> +	return IRQ_HANDLED;
> +}

[ ... ]

> +static int an7581_pcm_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card =3D &an7581_pcm_card;
> +	struct snd_soc_dai_link *dai_link;
> +	struct device *dev =3D &pdev->dev;
> +	struct an7581_pcm_priv *priv;
> +	struct reset_control *reset;
> +	void __iomem *base;
> +	int irq;
> +	int ret;
> +	int i;
> +
> +	card->dev =3D dev;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	snd_soc_card_set_drvdata(card, priv);
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv->map =3D devm_regmap_init_mmio(dev, base,
> +					  &an7581_pcm_regmap_config);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +
> +	reset =3D devm_reset_control_get_exclusive(dev, "pcm1");
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);
> +
> +	irq =3D of_irq_get(dev_of_node(dev), 0);
> +	if (irq < 0)
> +		return irq;

[Severity: Medium]
of_irq_get() returns 0 on IRQ mapping failure (and when CONFIG_OF_IRQ is
disabled). Should this check `if (irq <=3D 0)` or use platform_get_irq(pdev=
, 0)
instead so irq =3D=3D 0 is not passed to devm_request_irq()?

> +
> +	ret =3D devm_request_irq(dev, irq, an7581_pcm_irq_handler,
> +			       0, dev_name(dev), priv);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_init(&priv->desc_lock);
> +	mutex_init(&priv->user_lock);
> +
> +	/* Reset the PCM interface */
> +	reset_control_assert(reset);
> +	usleep_range(5000, 10000);
> +	reset_control_deassert(reset);
> +	usleep_range(5000, 10000);
> +
> +	ret =3D dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return ret;
> +
> +	priv->tx_descs =3D dmam_alloc_coherent(dev, sizeof(struct an7581_pcm_de=
sc) *
> +					     AN7581_PCM_TX_DESCRIPTORS, &priv->tx_dma,
> +					     GFP_KERNEL);
> +	if (!priv->tx_descs)
> +		return -ENOMEM;
> +
> +	priv->rx_descs =3D dmam_alloc_coherent(dev, sizeof(struct an7581_pcm_de=
sc) *
> +					     AN7581_PCM_RX_DESCRIPTORS, &priv->rx_dma,
> +					     GFP_KERNEL);
> +	if (!priv->rx_descs)
> +		return -ENOMEM;

[Severity: High]
Is devm_request_irq() called too early in an7581_pcm_probe()?

Requesting the IRQ before spin_lock_init(&priv->desc_lock), hardware reset,
and dmam_alloc_coherent() means a pending interrupt can fire while the
controller is held in reset (reading AN7581_PCM_ISR across
reset_control_assert() / usleep_range()) or before priv->desc_lock and the
descriptor rings are initialized.

It also reverses the devres teardown order on driver unbind:
an7581_pcm_remove() runs before devm_snd_soc_register_card() unregisters
the card, and devres will free priv->rx_descs and priv->tx_descs before
devm_irq_release() frees and synchronizes the IRQ.

Should devm_request_irq() be moved after the hardware reset and DMA
descriptor allocations?

[ ... ]

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019232412.5160=
28-1-ansuelsmth@gmail.com?part=3D2
