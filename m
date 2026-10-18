Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B53A0E93
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792319978; cv=none; b=HL6mwXQHpdPg5Q85Kf8T7Ab2Uw44EpvSSgDYSPPi5tAjwH4ZNiDYLGshfQMClyHB/eb2NvN4FvaKSvmTUGCgmt8rhlGb1NQDs/1K9SBlPyDf2sGnrtRxy5T5WiTIK/qt0VQV0dWIWYbp/HcidQ23hnmU4aUkAEbwDGadZHIZmgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792319978; c=relaxed/simple;
	bh=KncDa51mZ5NDZ5BtP4vBIW1oT/C/lwnfJvClh3k3/Fc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=N+GmcqfV4AMS/rpSUmPm6rxcrdxqcnkgQHYJ5mLg6elkNbV7QpWCkLffTzMCbTYN5PiSyLo5yP9CRcCAtoMKmid2IL7H+Ld5Rg6XQR9Hw7P7llAPQHTMA9bmGq6RlfURTPNpH+t98ZFsfvOLHJtb30sF4WTjwCypmEj+cmIiHe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+WSMpkh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+WSMpkh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C301F000C4;
	Sun, 18 Oct 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792319975;
	bh=cEdhNIWomkxO2MGN6UH2nfqM93X14f0/OkWbLgko1hs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K+WSMpkhm+cGeSGzEbfkv0VK4EgULBbg+0nOyexjemK4k6EAijJ/rR1sEp4+jJ5Y0
	 DQ3eF3OTAUU46p9M+nv+mGmm3AF3Ho21ss5Z80Z+PPlpRrGCUWFID9or/yGDFm2Idx
	 eo9BT2C37LRqF+H9eNPsQVGuZpFtRv88yGgxjJFjPCXY2wlrzBukHL8cF13D5EAye1
	 Xt0NLStZXEmrTxwke8QmXZzxgq7jn6E2f1zn6/XEJ1QP/Ik8HS0sGcu2+mtq8Kk8p2
	 L/h7aWYOHwL8J4Io0wkSdPxeToI+zS5weBDP5lA9GQZGvVb9AAALlE+FApTcxQAAmQ
	 CSa0t99CpZBOg==
Message-ID: <sashiko-outbox-176054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 10:39:34 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: meson: audin: sleeping mutex_lock() in atomic trigger and so=
ftirq timer context
--

commit f3bd154de23b0a57bb8257b40dc479a985fa6c9a
Author: Valerio Setti <vsetti@baylibre.com>

ASoC: meson: add AUDIN driver

This commit adds the AUDIN audio input driver for Amlogic GX platforms
(GXBB/GXL), including FIFO capture DAIs and an I2S data formatter widget.

> diff --git a/sound/soc/meson/audin-fifo.c b/sound/soc/meson/audin-fifo.c
> new file mode 100644
> index 0000000000000..5b254c90c7100
> --- /dev/null
> +++ b/sound/soc/meson/audin-fifo.c
[ ... ]
> +static enum hrtimer_restart audin_fifo_timer_cb(struct hrtimer *timer)
> +{
> +	struct audin_fifo_dai_data *data =3D
> +		container_of(timer, struct audin_fifo_dai_data, polling_timer);
> +	struct snd_pcm_substream *substream =3D data->substream;
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	unsigned int curr_pos;
> +	unsigned int delta, elapsed_periods_bytes, extra_bytes, sleep_bytes;
> +
> +	/*
> +	 * Take the stream lock to prevent userspace from issuing a quick
> +	 * PAUSE_PUSH -> PAUSE_RELEASE transition while we're running this
> +	 * callback. Doing so would cause "hrtimer_forward_now()" to be called
> +	 * (see below) while the timer is already enqueued.
> +	 */
> +	guard(pcm_stream_lock_irqsave)(substream);
> +
> +	/* Stopped, or a trigger already re-armed the timer while we waited. */
> +	if (!READ_ONCE(data->running) || hrtimer_is_queued(timer))
> +		return HRTIMER_NORESTART;
> +
> +	curr_pos =3D audin_fifo_pos(data->dai, runtime);
> +	delta =3D (curr_pos >=3D data->last_pos) ?
> +		curr_pos - data->last_pos :
> +		(runtime->dma_bytes - data->last_pos) + curr_pos;
> +	extra_bytes =3D delta % data->period_bytes;
> +	elapsed_periods_bytes =3D delta - extra_bytes;
> +
> +	/* Report only when the period is completed. */
> +	if (delta >=3D data->period_bytes) {
> +		data->last_pos =3D data->last_pos + elapsed_periods_bytes;
> +		if (data->last_pos >=3D runtime->dma_bytes)
> +			data->last_pos %=3D runtime->dma_bytes;
> +		snd_pcm_period_elapsed_under_stream_lock(substream);
> +	}
[ ... ]
> diff --git a/sound/soc/meson/audin-formatter-i2s.c b/sound/soc/meson/audi=
n-formatter-i2s.c
> new file mode 100644
> index 0000000000000..8bbb5cdb52dc8
> --- /dev/null
> +++ b/sound/soc/meson/audin-formatter-i2s.c
[ ... ]
> +static struct gx_stream *
> +audin_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_dai *be =3D audin_formatter_i2s_get_be(w);
> +
> +	if (!be)
> +		return NULL;
> +
> +	return snd_soc_dai_dma_data_get_capture(be);
> +}

[Severity: High]
Does binding the AUDIN formatter to gx_stream lead to sleeping in atomic and
softirq contexts during PCM trigger operations?

In audin_fifo_dai_probe(), polling_timer is set up with HRTIMER_MODE_REL_SO=
FT,
so audin_fifo_timer_cb() runs in softirq context and acquires
guard(pcm_stream_lock_irqsave)(substream). This requires substream->pcm->no=
natomic
to be false, otherwise _snd_pcm_stream_lock_irqsave() would attempt to acqu=
ire
substream->self_group.mutex from softirq context.

However, with nonatomic set to false on the FE and BE substreams, PCM trigg=
er
operations hold spin_lock_irqsave on the PCM stream locks (for example via
dpcm_be_dai_trigger()). This also occurs in softirq context when an XRUN is
detected:

audin_fifo_timer_cb()
  -> snd_pcm_period_elapsed_under_stream_lock()
    -> snd_pcm_update_hw_ptr0()
      -> snd_pcm_stop()
        -> dpcm_fe_dai_trigger()
          -> dpcm_be_dai_trigger()
            -> aiu_encoder_i2s_trigger()
              -> gx_stream_stop()

Because audin_formatter_i2s_get_stream() attaches the AUDIN formatter to the
backend DAI's struct gx_stream, starting or stopping the capture stream cal=
ls
aiu_encoder_i2s_trigger() -> gx_stream_start() or gx_stream_stop(), both of
which acquire the sleeping mutex ts->lock:

sound/soc/meson/gx-formatter.c:gx_stream_start() {
	mutex_lock(&ts->lock);

	/* Start all the formatters attached to the stream */
	list_for_each_entry(formatter, &ts->formatter_list, list) {
		ret =3D gx_formatter_enable(formatter);
...
}

sound/soc/meson/gx-formatter.c:gx_stream_stop() {
	mutex_lock(&ts->lock);
	ts->ready =3D false;

	/* Stop all the formatters attached to the stream */
	list_for_each_entry(formatter, &ts->formatter_list, list) {
		gx_formatter_disable(formatter);
	}

	mutex_unlock(&ts->lock);
}

Won't calling mutex_lock(&ts->lock) while holding the PCM stream spinlocks =
with
interrupts disabled (and from softirq context on XRUN) trigger a sleeping in
atomic context bug?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-audin-v5-0=
-4b8cc13a1b22@baylibre.com?part=3D4
