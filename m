Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F823B27E8
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165807; cv=none; b=VJnNM3FirtOn8iio5aRv3bZ8Ax0et9DYFrgDLkCw5E15BgRc/z/ypE/P0hnS9ExHwIrAMG1IYMXkvF3UECL1Z0+1UT4CEHb252bl2JZm/4GFeK7ARr9t+kpsKEbt8qlCtzv4VGcgWeetwplHljOteSYS3upqkKWq35miG+gAqPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165807; c=relaxed/simple;
	bh=neCdZJXKsarmXEuFP6u7QLgk9Z47HgwsrReWuor4qBw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CAXKHWpao3qQVI9qWGZlhNrQjylwVz5YEN87Rk0gQx0WU2JwuGXHrdkxpOwFl0vRaKp3vUHZoNxTIdc1XdfMKafk9RHKeDBRtnXlqiU9QkGf7DMh3/tVuOypDWnt6YBXnWN74fF6QqXycqWUVThweM8sUN8JqyuPm88cHzmsrD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2aoK9R+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2aoK9R+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF661F000FF;
	Fri, 11 Sep 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789165805;
	bh=KD8JinR+dOn+manyn3rI12mXQtCa15+ChZzIrnki8sk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2aoK9R+r10ahlJZz6n+JDm+NfMsYS0meLD4N1FQcPfTR3bt5QgwZmgFDyNRYJ91d
	 ksEXvl2Yhhf5OD/p4MyzvnxIiPpm9/hyssJu/SF+2aaV6SgP7Z7UzDDAT6ykhrPpy1
	 sGy4vcNf2poNLmoz0g04aa8F194+X1lwhvNgtEnFxFMebaLYJ+6wvlYwVkMF7Bcr8w
	 kvmhjf2Nf2G7xUJkDJinAqW+LV+AxwiKKpfhAliJsWWSJ7YjEIc+Z2JBjplc4rLjoa
	 qvHCUZfjhs4q085ye/y9I3uDwKI61yUKeVr2uOPikEJlRF3i7LiusQNJ1i7JZoFRFj
	 vbry23+XA7rlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] ASoC: meson: add audin FIFO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260912-audin-v1-3-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-3-7fbefe928711@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 22:30:04 +0000
Message-Id: <20260911223005.0FF661F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Calling a sleeping function from atomic and hardirq contexts.
--

commit 44499e80857bb0a40e090af263ae83ec007e6008
Author: Valerio Setti <vsetti@baylibre.com>

ASoC: meson: add audin FIFO driver

Add support for the frontend DAI of the capture interface which is in
charge of receiving decoded data from "audin-formatter-i2s" and move them
to an internal FIFO before they are block-transferred to RAM.

> diff --git a/sound/soc/meson/audin-fifo.c b/sound/soc/meson/audin-fifo.c
> new file mode 100644
> index 0000000000000..7029bd6a464ab
> --- /dev/null
> +++ b/sound/soc/meson/audin-fifo.c

[ ... ]

> +static unsigned int audin_fifo_pos(struct snd_soc_component *component,
> +				   struct snd_pcm_runtime *runtime)
> +{
> +	unsigned int ptr =3D snd_soc_component_read(component, AUDIN_FIFO_PTR);

[Severity: High]
Can this call into a sleeping function from atomic and hardirq contexts?

The audin_fifo_pos() function calls snd_soc_component_read(), which
explicitly acquires a sleeping mutex. However, this is called by
audin_fifo_timer_cb() (an hrtimer callback executing in hardirq context)
and by audin_fifo_component_pointer() (an ALSA PCM pointer callback that
executes while holding a spinlock).

Acquiring a sleeping lock from either of these contexts can trigger a
kernel panic during audio capture.

> +
> +	return ptr - lower_32_bits(runtime->dma_addr);
> +}

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
> +	curr_pos =3D audin_fifo_pos(data->component, runtime);

[ ... ]

> +static snd_pcm_uframes_t
> +audin_fifo_component_pointer(struct snd_soc_component *component,
> +			     struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +
> +	return bytes_to_frames(runtime, audin_fifo_pos(component, runtime));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-audin-v1-0=
-7fbefe928711@baylibre.com?part=3D3
