Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB213B1029
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871799; cv=none; b=eMlCWuPCqYOqKEjAbO1NdS6VX6NTfyGfCWY8ofQFP8CtoEmdpq7Ymj5ZPjtbkTKRNEEluRDWXKypWV13itJyd1eMjKaxh59At7wBQrkHRjuimjesNoOMQBSPUtOLqEuKs/oIGnfJnX+afUCOqu1QsVO5u5UyIumKYolAx8LlQLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871799; c=relaxed/simple;
	bh=OCFcslysMXQR6Ws5BeRBa3GmSH6TfKN3SAwMUTl6AVs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rXdAdO1kvw1f85ZsOO01cmzwW1d3TBsudOGlCFz0PFS9T58PFB0jBEEk9YAPHcyRwGR8bAW/gfSBRMjhWxJYI4m10HkJ89uz33BFGRqS6JxfC38Z2rgmiA/ducUYKvhjAuZFXjVa35uk8HC2vq/CHrbZAP4nDCpEmJc+JuEnYMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSNq7/33; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSNq7/33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4333D1F000FF;
	Thu,  1 Oct 2026 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871793;
	bh=xjLL8eIMBdqQBls2GcjRMykfQnKUzce9QHNWWrZ5vxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FSNq7/333rSM8BPAXFGbT7FTQ/sd16UxmAXiIcbM1UsMzKl9kCwaFlIq4SEHSlwCa
	 4RPcUfpUjZU88Ku5fK1yttzVuEZX3AzuOfmn6pHozImdoYnKjKPixpUtmyFHRybyPV
	 l+1YAqzztk050t8Ytnl9A5r2n1037jHZFgv1VB8DdV/jMp8uwJ1FPfUDxj/GTJc2FH
	 MkZKZW8qKyHB/Pa9IQtlTFcX9hAMBYOm+bKrd134MPR+tEcIcML9ShDJAPtDJqxIWO
	 Ov2d0Mupx6MEKlYhwmj0WsGI7b2DPshUuo6JSCuKiZ5WWvS4cyO1RWWMtjEi7tFoq6
	 aJ3D2yC0Ym5CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] ASoC: meson: add AUDIN driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001-audin-v4-4-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-4-2476646118b5@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 16:23:12 +0000
Message-Id: <20261001162313.4333D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Race condition in PAUSE_RELEASE corrupts hrtimer state
- [High] Use-after-free of hrtimer data during device unbind
- [Medium] Hardware state loss in AUDIN FIFO during system suspend
--

commit 3526087ac379aa85de8aca3b698b812a10b5da4e
Author: Valerio Setti <vsetti@baylibre.com>

ASoC: meson: add AUDIN driver

AUDIN provides audio input support to the Amlogic GX based platforms
(GXBB/GXL). It is the counterpart of AIU for capture and instantiates each =
of
the FIFOs as a component DAI.

> diff --git a/sound/soc/meson/audin-fifo.c b/sound/soc/meson/audin-fifo.c
> new file mode 100644
> index 0000000000000..cb59bb267e845
> --- /dev/null
> +++ b/sound/soc/meson/audin-fifo.c
[ ... ]
> +static int audin_fifo_dai_trigger(struct snd_pcm_substream *substream, i=
nt cmd,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct audin_fifo_dai_data *data =3D snd_soc_dai_dma_data_get_capture(d=
ai);
> +	struct snd_soc_component *component =3D dai->component;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		snd_soc_component_update_bits(component, dai->driver->base + AUDIN_FIF=
O_CTRL,
> +					      AUDIN_FIFO_CTRL_EN,
> +					      AUDIN_FIFO_CTRL_EN);
> +		WRITE_ONCE(data->running, true);
> +		hrtimer_start(&data->polling_timer,
> +			      audin_fifo_bytes_to_ns(data, data->period_bytes),
> +			      HRTIMER_MODE_REL_SOFT);

[Severity: High]
Does this blindly re-enqueue the timer without synchronizing with a potenti=
ally
running callback?

If a user rapidly toggles SNDRV_PCM_IOCTL_PAUSE, PAUSE_PUSH uses a
non-blocking hrtimer_try_to_cancel(). If the timer is running and skips
snd_pcm_period_elapsed() (e.g. because delta < period_bytes), it won't take
the PCM stream lock and will execute hrtimer_forward_now() concurrently with
PAUSE_RELEASE.

PAUSE_RELEASE then blindly calls hrtimer_start(), which enqueues the timer.
When the running callback in audin_fifo_timer_cb() reads running=3Dtrue, it
returns HRTIMER_RESTART, resulting in a double enqueue of the same timer
which can corrupt the hrtimer rbtree.

> +		break;
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		WRITE_ONCE(data->running, false);
> +		/*
> +		 * PCM stream lock is held here. If the timer callback is running
> +		 * (i.e. it cannot be stopped) there is also hrtimer_cancel()
> +		 * in hw_free().
> +		 */
> +		hrtimer_try_to_cancel(&data->polling_timer);
> +		snd_soc_component_update_bits(component, dai->driver->base + AUDIN_FIF=
O_CTRL,
> +					      AUDIN_FIFO_CTRL_EN, 0);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int audin_fifo_dai_remove(struct snd_soc_dai *dai)
> +{
> +	kfree(snd_soc_dai_dma_data_get_capture(dai));
> +
> +	return 0;
> +}

[Severity: High]
Does this free the DAI data without waiting for the polling timer to finish?

If the driver is unbound while an audio stream is open, the ALSA core trigg=
ers
a stream stop which uses a non-blocking hrtimer_try_to_cancel(). If the tim=
er
callback is running concurrently, it will write to this freed memory.

[ ... ]
> +int audin_fifo_sync_stop(struct snd_soc_component *component, struct snd=
_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +	struct audin_fifo_dai_data *data =3D snd_soc_dai_dma_data_get_capture(d=
ai);
> +
> +	hrtimer_cancel(&data->polling_timer);

[Severity: High]
Could this deferred callback access the freed data pointer?

If the driver was unbound and audin_fifo_dai_remove() freed the DAI data,
when the file descriptor is eventually closed this deferred sync_stop callb=
ack
will access the freed data pointer to cancel the timer.

> +	WRITE_ONCE(data->running, false);
> +
> +	return 0;
> +}
> diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
> new file mode 100644
> index 0000000000000..808e7d4fd31a2
> --- /dev/null
> +++ b/sound/soc/meson/audin.c
[ ... ]
> +static const struct regmap_config audin_regmap_cfg =3D {
> +	.reg_bits	=3D 32,
> +	.val_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.max_register	=3D 0x148,
> +};

[Severity: Medium]
Will hardware state like the channel mask and endianness be lost across
system suspend and resume cycles?

ALSA calls the driver's prepare() callback to recover a suspended stream,
but not hw_params(). Because this regmap lacks a cache configuration, it
cannot automatically restore the register state configured during hw_params=
()
when the system resumes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-audin-v4-0=
-2476646118b5@baylibre.com?part=3D4
