Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBE148CD7F
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679859; cv=none; b=kH9EG7nzIeX4EzT3N3huu9p8FmhRdrSUT1VgTS4zSC6nWfOe8N21jCpYvGei+YWQFyfCefCv3md+O62+S0KY4jhS6cBONoVjn4rzPT7FQmeefBp4t1962IhZ1us/ogWrOJqgQVuq/DjVCUS6DXf5Xmz2hx3Nwg/h4/rhtYW9gpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679859; c=relaxed/simple;
	bh=UgqexmTq/6AOgsstydSAjImIjoS8+5ll+h+0LseqBSI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IosBhFQuiyBxI88u4u+xeV9S/64mPej9RiPS2aEGV1p+tItShLZPR51P68yWmY9uEcWHYi7unYYHmqXQe/LtCG3c5SR4TtxPUj2UhcmgaxHZtbAe3De1jdj9lVf2V7HQrcS2H1bKKsTZedmm+ojRUGhrHpsh/WKxNjR1dzYkoaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiXtU79z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiXtU79z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C071F000FF;
	Thu, 17 Sep 2026 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679858;
	bh=iTBEy9S2EkfppEx41Jq8Ho2yXuKqkukNTzmGN6IIuSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BiXtU79zRtFRCw/k9EkCui5E8qE7PkT8hM3lt6dWc6VvMGXLUwmmZgHyCZTFp2cTn
	 K5QteXrHUi5y9/PPwmvUgGHuGrS5GuoNqt0k6kImWg7TXbKS2DXZQxTSz8/g9kZx68
	 UAkqLlvZS3W55q52/w+tYDfCBm2zbWdbQDYIYCwtT1aWpscVBGBwohP/sr/M7tHNrD
	 itRqoU2kEdRbJqV3bl/3a8RVKdGyC3tDVXim/9c4cYT9AE5qHez3lkzaQ8x1qhy0TG
	 J1XHMj/jSX9j2XG/Fcqn7KdZ3ugwx1sO28L6JqBv4+DgZ6Qq/L9ktGtUwPFYwrMIO3
	 GTvRO2BEdPPOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] ASoC: meson: add AUDIN driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917-audin-v2-3-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
 <20260917-audin-v2-3-38de4bc1de34@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 21:17:37 +0000
Message-Id: <20260917211737.93C071F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] sound/soc/meson: period drift in timer callback due to incorrect=
 last_pos update
- [Medium] sound/soc/meson: global state pollution due to mutating static w=
idget array
- [Medium] sound/soc/meson: stack overflow in recursive DAPM graph traversa=
l without cycle detection
--

commit cc303f24603b3290227ada8353fd36a74cf1a83e
Author: Valerio Setti <vsetti@baylibre.com>

ASoC: meson: add AUDIN driver

AUDIN provides audio input support to the Amlogic GX based platforms
(GXBB/GXL). It adds support for I2S data formatter through a widget
and instantiates each of the FIFOs as component's DAI.

> diff --git a/sound/soc/meson/audin-fifo.c b/sound/soc/meson/audin-fifo.c
> new file mode 100644
> index 0000000000000..39ca65e3cee9b
> --- /dev/null
> +++ b/sound/soc/meson/audin-fifo.c

[ ... ]

> +static enum hrtimer_restart audin_fifo_timer_cb(struct hrtimer *timer)
> +{
> +	struct audin_fifo_dai_data *data =3D
> +		container_of(timer, struct audin_fifo_dai_data, polling_timer);
> +	struct snd_pcm_runtime *runtime =3D data->substream->runtime;
> +	unsigned int curr_pos, delta, sleep_time;
> +
> +	if (!READ_ONCE(data->running))
> +		return HRTIMER_NORESTART;
> +
> +	curr_pos =3D audin_fifo_pos(data->dai, runtime);
> +	delta =3D (curr_pos >=3D data->last_pos) ?
> +		curr_pos - data->last_pos :
> +		(runtime->dma_bytes - data->last_pos) + curr_pos;
> +
> +	/* Report only when the period is completed. */
> +	if (delta >=3D data->period_bytes) {
> +		data->last_pos =3D curr_pos;

[Severity: Medium]
Does setting data->last_pos directly to curr_pos introduce cumulative perio=
d=20
drift?=20

Because the hrtimer callback might be delayed, curr_pos might be past the
exact period boundary. Updating the base to curr_pos locks in these=20
scheduling delays, which could cause the reported hw_ptr to desynchronize=20
from actual hardware DMA and lead to audio stuttering or xruns.

Should data->last_pos be incremented by exact multiples of data->period_byt=
es=20
instead?

> +		delta =3D delta % data->period_bytes;
> +		snd_pcm_period_elapsed(data->substream);
> +	}

[ ... ]

> diff --git a/sound/soc/meson/audin-formatter-i2s.c b/sound/soc/meson/audi=
n-formatter-i2s.c
> new file mode 100644
> index 0000000000000..8bbb5cdb52dc8
> --- /dev/null
> +++ b/sound/soc/meson/audin-formatter-i2s.c

[ ... ]

> +static struct snd_soc_dai *
> +audin_formatter_i2s_get_be(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_dapm_path *p;
> +	struct snd_soc_dai *be;
> +
> +	snd_soc_dapm_widget_for_each_source_path(w, p) {
> +		if (!p->connect)
> +			continue;
> +
> +		if (p->source->id =3D=3D snd_soc_dapm_dai_out)
> +			return (struct snd_soc_dai *)p->source->priv;
> +
> +		be =3D audin_formatter_i2s_get_be(p->source);

[Severity: Medium]
Can this recursive call lead to a kernel stack overflow if there is a cycle=
=20
in the DAPM graph?

The traversal using snd_soc_dapm_widget_for_each_source_path() does not=20
appear to track visited nodes or limit the recursion depth. A malformed=20
device tree audio-routing or an unexpected userspace mixer configuration th=
at=20
creates a cycle could trigger infinite recursion when evaluating the graph.

> +		if (be)
> +			return be;
> +	}
> +
> +	return NULL;
> +}

[ ... ]

> diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
> new file mode 100644
> index 0000000000000..ec024267ac29c
> --- /dev/null
> +++ b/sound/soc/meson/audin.c

[ ... ]

> +static struct snd_soc_dapm_widget audin_dapm_widgets[] =3D {
> +	[AUDIN_WIDGET_I2S_FORMATTER] =3D
> +		SND_SOC_DAPM_PGA_E("I2S Formatter", SND_SOC_NOPM, 0, 0, NULL, 0,
> +				   gx_formatter_event,
> +				   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),

[ ... ]

> +static int audin_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *mmio;
> +	struct regmap *regmap;
> +	struct clk *clk;
> +	int ret;

[ ... ]

> +	ret =3D gx_formatter_create(dev, &audin_dapm_widgets[AUDIN_WIDGET_I2S_F=
ORMATTER],
> +				  &audin_formatter_i2s_drv, regmap);

[Severity: Medium]
Is it safe to mutate the static global audin_dapm_widgets array during=20
device probe?

Looking at gx_formatter_create(), it allocates memory with devm_kzalloc()=20
and assigns it to the widget's priv pointer. If the probe defers, fails=20
later, or if the device is unbound, the devm-managed memory is freed but=20
the static global template retains a dangling pointer.

This could lead to a use-after-free or memory corruption if multiple device=
=20
instances are probed, as they would be sharing and overwriting the same=20
static widget state.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to allocate formatter\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-audin-v2-0=
-38de4bc1de34@baylibre.com?part=3D3
