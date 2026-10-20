Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501381;
	b=ET5WMHOS2DONiqZEWm6g+WOgaHKve+dZkQN7eby/OHK4zT8JUcFXGZhVK34QbkNnGGux
	 bKbsmq5hjduaBH0ZTY6/A7G2EwLyxI5AkAX1/c1Rqmhj7ecV1A6yhdQqYvFQL+qBHZi4z
	 7LCwG0MtRHPQGDLfAvvaJUr4XrCE9erGz3YNds4HUketU9XoMz9kaLUN+J9COA2xmMBAI
	 GUi7Fzny7h3+VziQxHM8HtcGsgZ1tcmLE5BmPsAxWqLvNV9CWjTwgITc3vW5JzRhaZ0Jd
	 mDjqg8pjglUtQsKypi7DRNLPzWBg3VpOu3rYNVYvitiM8+fMJ0SmIY9yT3Mxi6+HClQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=o0a4Pwd8R1+O9SK5iUfsvWfZnTNOS5ycC0m0fIp9lm0=;
	b=Y3P9TdAUirrFNZwR4LUo/qneQOs7Y4QwVXGGYlHvfPdKPxQ5bjN2rhof46ky56d64aYO
	 UicTBL3+CBJf1Tdjx2K2TU27CcgntiALEpmxoGu3ARMzF5CR9sL3kg2gSx6xAS+vCl2kz
	 OZkqPEohhn5sChqS1tYhBvtAG44JlA1rIvAHmDuC4jsBM1Uy3X4VudUJ0faNaOVQF5QbF
	 hc29oWbJl3oaoZvNlxfhdveq3S8iYBJbCs7No2+OGMgZNfadsxbbDmvnRvqsI2+asMP0g
	 DnJ6V0oH4dmnXPSjN5ZE0ekHeJOW4Dn54ifkd/Mujlqk2o8wMn3sLKQQCoZg8UwdTKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O4gN8wL+;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1C60A3827
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA1C60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O4gN8wL+
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso22697215e9.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792501378; x=1793106178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0a4Pwd8R1+O9SK5iUfsvWfZnTNOS5ycC0m0fIp9lm0=;
        b=O4gN8wL+/og35tr+D5OsbNcMwc48//NCS7a2iGCJG/ZWGc9Qwya8nwubfRtyHquIO+
         wyWcGbNFhSs46RfEayJwiy5w724z/anacsUH68ry/FAqJ8gQhnWEnMZJRFa09IBZeLGm
         FI/MYaZ1ACAIDoEGTyZvOEZcYVJz8auuA8EOqiwUEILLxhqRULnHJnkkqi39ar3FyMyk
         wG+UCRZpdE9e+/QQPXbJhEW6RmAsARmpmJwLKSz+CAEhaY/mZOUpNuVTNQKzYgNwuJzH
         ryVCSy0k/jb5FOtJTvBe7APz4H8qU9YNXfjcNS11pmz6LyyziCobouwiYe6kMmusDTxi
         i+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501378; x=1793106178;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0a4Pwd8R1+O9SK5iUfsvWfZnTNOS5ycC0m0fIp9lm0=;
        b=fBJPM8rny6WEO0npLksUXcoQ1VlQjOGwdvEYdiQiwQps97y9wQZdcIuQu71g1ZF/0j
         ZAM+sQEDTXFqG/R/Xnjq3pO5VIEtnR4WZzwkSGSu5gzNRkgt4SGyH0cTdoQeMQtcuH3A
         jiLhFmKCx/5WGFAw2qN6YO8Y/e6DcC658ZJaoNdGuHJITBXB9FVEYB76VfJui5d9imwO
         OyFZPK5RE7z57OubQ0c6Bt4K+kGQ7G9Jv727PQyrJcIot/CCP+yPtPpFC5eb2Uf0BsG8
         HjnfyTfKCdLBj9ECVo6WDb9xPSv8SfY96DMSwusv2BSj9Fie82qBYPJElr1AKJKik26c
         NWrw==
X-Gm-Message-State: AFq9FYIzAF2wl4pNU55wEulp3q5prk6B+x9mLmntZX1yvDUORia2oQw0
	Qi95neuxcMV42pJeDBHONA7k/OTl57YmKRFgzNqhrZdVqaPP3WgpR6vDLC/BrGROTsM=
X-Gm-Gg: AYBFou2nHl3Y0fBDbimdAtlKnQMEgBqTK17ePm39FU/z+Warg3Onygtn5yN4/GUY+Nh
	a9emkg9NAl0eNM6lyiy/lqU02/F3vGgnAKsbGVOGGAno5fzTLtZFCMYhCZ2tefDZpjiuKYLCyv/
	H9H4LunfN0NyPwAM71TynO+s24oxpgVN3XsBbwpphwiLn+XVk3NcuQpOaUlTT58l3Dswh+M/kdH
	kyStFJ1yehRWz4xK7F/4FJoMSDBWBDFN3kn/v7iwgFRFE1W3RAntg2OjEWNPIA+fq7WdVI+NOh+
	f/7pFHpLPRzR2jIUaw8ZrwOS4gaq4a0ReJxSScMbe9qEEiaAETSxflRgDBySVlLUQC77kby5LEu
	c0ujn1lL3ccjGdNBCcVERdgvzPXZ1HfSAbzkYDvzNVdOgUK6lKSSFUzMH+t2WXLRczcYEcuBdXq
	yDUKDtXrctNz9q+4Dlpqd/bjYq/aR/PYBzm6QZtivZFOKhHvCvlUGKf/9L2hBEMlCHbQ9Pvs2uS
	A==
X-Received: by 2002:a05:600c:3b22:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a1d7615cb9mr232401775e9.17.1792501377669;
        Tue, 20 Oct 2026 06:02:57 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm65821575e9.3.2026.10.20.06.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:02:56 -0700 (PDT)
Message-ID: <257ab6d8-4990-4e58-9eaf-9cac3cb29b01@baylibre.com>
Date: Tue, 20 Oct 2026 15:02:56 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
 <sashiko-outbox-176054@kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <sashiko-outbox-176054@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +static enum hrtimer_restart audin_fifo_timer_cb(struct hrtimer *timer)
>> +{
>> +	struct audin_fifo_dai_data *data =
>> +		container_of(timer, struct audin_fifo_dai_data, polling_timer);
>> +	struct snd_pcm_substream *substream = data->substream;
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	unsigned int curr_pos;
>> +	unsigned int delta, elapsed_periods_bytes, extra_bytes, sleep_bytes;
>> +
>> +	/*
>> +	 * Take the stream lock to prevent userspace from issuing a quick
>> +	 * PAUSE_PUSH -> PAUSE_RELEASE transition while we're running this
>> +	 * callback. Doing so would cause "hrtimer_forward_now()" to be called
>> +	 * (see below) while the timer is already enqueued.
>> +	 */
>> +	guard(pcm_stream_lock_irqsave)(substream);
>> +
>> +	/* Stopped, or a trigger already re-armed the timer while we waited. */
>> +	if (!READ_ONCE(data->running) || hrtimer_is_queued(timer))
>> +		return HRTIMER_NORESTART;
>> +
>> +	curr_pos = audin_fifo_pos(data->dai, runtime);
>> +	delta = (curr_pos >= data->last_pos) ?
>> +		curr_pos - data->last_pos :
>> +		(runtime->dma_bytes - data->last_pos) + curr_pos;
>> +	extra_bytes = delta % data->period_bytes;
>> +	elapsed_periods_bytes = delta - extra_bytes;
>> +
>> +	/* Report only when the period is completed. */
>> +	if (delta >= data->period_bytes) {
>> +		data->last_pos = data->last_pos + elapsed_periods_bytes;
>> +		if (data->last_pos >= runtime->dma_bytes)
>> +			data->last_pos %= runtime->dma_bytes;
>> +		snd_pcm_period_elapsed_under_stream_lock(substream);
>> +	}
> [ ... ]
>> diff --git a/sound/soc/meson/audin-formatter-i2s.c b/sound/soc/meson/audin-formatter-i2s.c
>> new file mode 100644
>> index 0000000000000..8bbb5cdb52dc8
>> --- /dev/null
>> +++ b/sound/soc/meson/audin-formatter-i2s.c
> [ ... ]
>> +static struct gx_stream *
>> +audin_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
>> +{
>> +	struct snd_soc_dai *be = audin_formatter_i2s_get_be(w);
>> +
>> +	if (!be)
>> +		return NULL;
>> +
>> +	return snd_soc_dai_dma_data_get_capture(be);
>> +}
> 
> [Severity: High]
> Does binding the AUDIN formatter to gx_stream lead to sleeping in atomic and
> softirq contexts during PCM trigger operations?
> 
> In audin_fifo_dai_probe(), polling_timer is set up with HRTIMER_MODE_REL_SOFT,
> so audin_fifo_timer_cb() runs in softirq context and acquires
> guard(pcm_stream_lock_irqsave)(substream). This requires substream->pcm->nonatomic
> to be false, otherwise _snd_pcm_stream_lock_irqsave() would attempt to acquire
> substream->self_group.mutex from softirq context.
> 
> However, with nonatomic set to false on the FE and BE substreams, PCM trigger
> operations hold spin_lock_irqsave on the PCM stream locks (for example via
> dpcm_be_dai_trigger()). This also occurs in softirq context when an XRUN is
> detected:
> 
> audin_fifo_timer_cb()
>    -> snd_pcm_period_elapsed_under_stream_lock()
>      -> snd_pcm_update_hw_ptr0()
>        -> snd_pcm_stop()
>          -> dpcm_fe_dai_trigger()
>            -> dpcm_be_dai_trigger()
>              -> aiu_encoder_i2s_trigger()
>                -> gx_stream_stop()
> 
> Because audin_formatter_i2s_get_stream() attaches the AUDIN formatter to the
> backend DAI's struct gx_stream, starting or stopping the capture stream calls
> aiu_encoder_i2s_trigger() -> gx_stream_start() or gx_stream_stop(), both of
> which acquire the sleeping mutex ts->lock:
> 
> sound/soc/meson/gx-formatter.c:gx_stream_start() {
> 	mutex_lock(&ts->lock);
> 
> 	/* Start all the formatters attached to the stream */
> 	list_for_each_entry(formatter, &ts->formatter_list, list) {
> 		ret = gx_formatter_enable(formatter);
> ...
> }
> 
> sound/soc/meson/gx-formatter.c:gx_stream_stop() {
> 	mutex_lock(&ts->lock);
> 	ts->ready = false;
> 
> 	/* Stop all the formatters attached to the stream */
> 	list_for_each_entry(formatter, &ts->formatter_list, list) {
> 		gx_formatter_disable(formatter);
> 	}
> 
> 	mutex_unlock(&ts->lock);
> }
> 
> Won't calling mutex_lock(&ts->lock) while holding the PCM stream spinlocks with
> interrupts disabled (and from softirq context on XRUN) trigger a sleeping in
> atomic context bug?
> 

The analysis is technically correct, but let me share my analysis first
and then gather some feedback.

The issue is not introduced by this series. gx_stream_start() and
gx_stream_stop() have been called from aiu_encoder_i2s_trigger() since
commit 9335117a221a ("ASoC: meson: aiu-encoder-i2s: prepare for
multiple streams"), which is already upstream. GX links are atomic, so
the playback path already takes the 'gx_stream->lock' mutex with the PCM
stream spinlock held. This patch only extends the same pattern to the
capture path.

Now back to the issue. Taking 'gx_stream->lock' mutex in trigger means
taking a sleeping lock in atomic context which, of course, cannot sleep.
For the sleep to happen it requires the mutex to be contended:
- trigger vs. trigger cannot contend, since dpcm_be_dai_trigger() holds
   the BE substream lock around the BE trigger, which serializes all
   calls on the same gx_stream (even with multiple AUDIN FIFOs sharing
   the BE);
- the formatter attach/detach from the DAPM widget events also takes
   the mutex. This normally happens in prepare/hw_free, when the stream
   is not running, but a mixer change (e.g. "FIFOx Input Source" moved
   away from I2S) powers the formatter down under the DAPM mutex only,
   while the BE is still running. A trigger on another CPU at that
   moment (userspace or XRUN) would find the mutex held.
   However since AUDIN FIFO only supports I2S for now, I don't see a real
   reason for this switch to happen in practice.

Now the solution. Moving the gx-card links to be nonatomic seems a bit too
much intrusive to me. I think the best solution is to change
'gx_stream->lock' to be a spinlock. This is fine for GX formatter because
all ops are pure MMIO regmap accesses, so they shouldn't sleep.

Finally the question. As I said, since the issue described by Sashiko
seems a bit hard to hit, I think the fix can be postponed to a quick
follow-up series. However if reviewers deem that it's absolutely mandatory
to fix the issue before this series lands, I will either prepare a small
pre-requisite series or add a new commit to this one (I would like to
know what's the reviewers preference on this case).

Thanks in advance for the replies! :)

-- 
Valerio

