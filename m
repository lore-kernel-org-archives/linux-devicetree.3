Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78F49E5F8
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818774; cv=none; b=X0NxpB15EGh7V8Fg3zY0BOzNGfmBwqrevPHlVPgGwBkyLorcYx2JMO7L+Ww8030xxdwUt0LlyrDsyqak8muEzipT0WclVxdyJk7MEz8JFYryAKUrxdYr0Pb7fbyYngPEqwGBUjWXUdha6pGOl7rWpOGCrb3xKpSTjpsJLjoei+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818774; c=relaxed/simple;
	bh=1atmjcdYPcsHwLZJ1A2LHdRDNwoXYR/rrGWn8qUITe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5o7dWnYGxdHxh4a25o+62VTeLwHUvgxT4MWGP3aSsi1AxhbgG300pXpj+5atypRw9lDPw4K7u14piQC6QYZOZQEt5CMdnL7ktJiiIBdOVQA4WStY0byK0wKsWH8Sh+RMbj9kgZaSgW+JchyR40QlfAH+ymxcTacIBUcuMGS/8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pVDVgQPu; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pVDVgQPu"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso1191375f8f.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791818767; x=1792423567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1MniahAvg/Rvn/u502QsbwvNOCgBbmXAK/xR/xwvXg=;
        b=pVDVgQPuGRRZq1Y4uYTbcIrtGhBDExelUBFfAGUuvu8T1NICpqCWTlG2ykZ7nq4Wzd
         9zAvcQB7uYT0Mu9jk5HxBJ38bNYV+uOQfYpVuQFBqW0UfyVhMJii8fpjLBx4CTDXrKbA
         4pwaGLL7uhGQSNDmWuaa2xct9scshMyoHhJ8afhx+c3PC6Yh7OA8iLNzgg9/HRjXgxCn
         45cko6Uf9VV/SPATRglpMWUJolhiH4O0fbZjTHB4XXSgYH2z3pllGhuqvlcWO/djuVCE
         KMy3J8q54AwI4ylnGG02EOzWbNoTKtO/cG3WcR5ZrFLEGvU8swXSoPzmIOrxH+lut02X
         AI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818767; x=1792423567;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1MniahAvg/Rvn/u502QsbwvNOCgBbmXAK/xR/xwvXg=;
        b=KMquzBimdRYSGC0u0JQeUcrPaCvLezb2hoj8/3yqz1AWpP+Oyyuqna/47mHWIPdVpk
         z5daSvzvTzpUjtYt7iU2ZhkvwYioOL+f5V76LKOv+VkSTSvUBmSGbpaXRFU/SrMLCSUG
         Ucx38UmyHA1LGj0m0CPJfl/IZXawYaZMFGEQJd1zvR+u87o2bVUWillVSblFEbZdQ6W3
         3uol6c7ruKggt7q6zcJ1VstdNMmaDe7Yq2AkXX844gdp/hJy8qgq01nKVNvR9vHSG1f2
         ihWrPILU+w16m2J2NCOZw6k8OerOhjA1qZwnKriUAU+0qxadK2a16eQCYrBSJR7eQaV3
         JTug==
X-Forwarded-Encrypted: i=1; AKwUvBwfu5bd+zwCqOWGYvFDFjPiiOnfQjT55tFBOMM4PdNkuS5IIIrZTrurxRtRjKtTnHGfLTyAEUBdIzsd@vger.kernel.org
X-Gm-Message-State: AFq9FYLm3PzGXoSpzaD40ZE0XNyHYOdnYywsqX/wmImvcBIvdEruawaJ
	qFjgPV4G3HZv2+oPVX8HmTgzsULRJw8CzCyV16eWs2KmT50wowQrYjiUDxzlcdAf5JE=
X-Gm-Gg: AYBFou1Kndtsykeodm79KIOG63gjtzQFHNNEamqjoQQviGR7cbDFnvWO9mdgMOdQLvK
	scKjWSFR/ONQSA8i3iDns5fqsHnBk3uOFELI49RfAb2LDqzJ2APjsWzdGzQIKRpTa2OlfLVNboy
	5ecKgj8GRHMSehYj36QrWjCKAWkRBfNYHhl9B52iU/bWqt9HRUvi95JZiIOgd1cq3NR+LMwVz8B
	mp9f186exKTo/BrTDIuDeOHWEXnmPgQ5smUw83CUbiO83zT/LnjUh7Km54cDWTi3xFx8fiY/a17
	Xwsby+7AQ7XAatRIEScQHEmlgwF8JqSI/aMHggWsfOkcxQHz3udr0DDFUr6vyLhu4IdW3wSAYGe
	NlyRlUD5XOY9mb+bzRfaFiQeRqmTEsVTJ6CLP+Jq9FOKsjt/iRWi6kjKuzYxdYEsTfBR8fOX+fG
	V5bqU2593emimhJvdrNi5E9Qk/Mp8rMr7zlm4VafT5bJH+zyT2Ia/8SzQOKC6HqS2q0fI6sOmhr
	zLxse4qghE2
X-Received: by 2002:a05:6000:4553:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48dbaae8703mr13003907f8f.27.1791818766936;
        Mon, 12 Oct 2026 08:26:06 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm45018f8f.28.2026.10.12.08.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:26:06 -0700 (PDT)
Message-ID: <37f751f6-1bf6-4e31-9439-1145d930b746@baylibre.com>
Date: Mon, 12 Oct 2026 17:26:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] ASoC: meson: add AUDIN driver
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-4-2476646118b5@baylibre.com>
 <20261001162313.4333D1F000FF@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20261001162313.4333D1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +static int audin_fifo_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>> +				  struct snd_soc_dai *dai)
>> +{
>> +	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
>> +	struct snd_soc_component *component = dai->component;
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		snd_soc_component_update_bits(component, dai->driver->base + AUDIN_FIFO_CTRL,
>> +					      AUDIN_FIFO_CTRL_EN,
>> +					      AUDIN_FIFO_CTRL_EN);
>> +		WRITE_ONCE(data->running, true);
>> +		hrtimer_start(&data->polling_timer,
>> +			      audin_fifo_bytes_to_ns(data, data->period_bytes),
>> +			      HRTIMER_MODE_REL_SOFT);
> 
> [Severity: High]
> Does this blindly re-enqueue the timer without synchronizing with a potentially
> running callback?
> 
> If a user rapidly toggles SNDRV_PCM_IOCTL_PAUSE, PAUSE_PUSH uses a
> non-blocking hrtimer_try_to_cancel(). If the timer is running and skips
> snd_pcm_period_elapsed() (e.g. because delta < period_bytes), it won't take
> the PCM stream lock and will execute hrtimer_forward_now() concurrently with
> PAUSE_RELEASE.
> 
> PAUSE_RELEASE then blindly calls hrtimer_start(), which enqueues the timer.
> When the running callback in audin_fifo_timer_cb() reads running=true, it
> returns HRTIMER_RESTART, resulting in a double enqueue of the same timer
> which can corrupt the hrtimer rbtree.

This looks correct. I will send an update for this.

>> +static int audin_fifo_dai_remove(struct snd_soc_dai *dai)
>> +{
>> +	kfree(snd_soc_dai_dma_data_get_capture(dai));
>> +
>> +	return 0;
>> +}
> 
> [Severity: High]
> Does this free the DAI data without waiting for the polling timer to finish?
> 
> If the driver is unbound while an audio stream is open, the ALSA core triggers
> a stream stop which uses a non-blocking hrtimer_try_to_cancel(). If the timer
> callback is running concurrently, it will write to this freed memory.
> 

This and the following issue look a bit of corner case to me (i.e. 
unbouding a driver while record is ongoing), but I agree that's a weak 
point so I will fix it.

>> +int audin_fifo_sync_stop(struct snd_soc_component *component, struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
>> +
>> +	hrtimer_cancel(&data->polling_timer);
> 
> [Severity: High]
> Could this deferred callback access the freed data pointer?
> 
> If the driver was unbound and audin_fifo_dai_remove() freed the DAI data,
> when the file descriptor is eventually closed this deferred sync_stop callback
> will access the freed data pointer to cancel the timer.
> 
>> +	WRITE_ONCE(data->running, false);
>> +
>> +	return 0;
>> +}
>> diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
>> new file mode 100644
>> index 0000000000000..808e7d4fd31a2
>> --- /dev/null
>> +++ b/sound/soc/meson/audin.c
> [ ... ]
>> +static const struct regmap_config audin_regmap_cfg = {
>> +	.reg_bits	= 32,
>> +	.val_bits	= 32,
>> +	.reg_stride	= 4,
>> +	.max_register	= 0x148,
>> +};
> 
> [Severity: Medium]
> Will hardware state like the channel mask and endianness be lost across
> system suspend and resume cycles?
> 
> ALSA calls the driver's prepare() callback to recover a suspended stream,
> but not hw_params(). Because this regmap lacks a cache configuration, it
> cannot automatically restore the register state configured during hw_params()
> when the system resumes.

This was already answered by Jerome [1] (thanks!) so that's out of scope 
for this series.

[1]: 
https://lore.kernel.org/all/1jbj95zz8o.fsf@starbuckisacylon.baylibre.com/

-- 
Valerio

