Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6705541A51B
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232017; cv=none; b=GGo8S7xRfr6wbXJZIV8fGG3DWPsPuYd6/GcdrZLdJA3KAPCV83kkFOTJ7MA+wtY2DdXvcl/9ahRXqTotXGudZ7NWPjvD9ip1SkGgfKd/KX7lDQIiduDHOfBT/JsOFYgO19JLOGMWDWP5SimWBPWbXNRSWXv4NTjhyqzPOyYitNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232017; c=relaxed/simple;
	bh=kwcjZyJIeB0p6AfBxqzzsJchLPKNWiD9kFR1gcEueoM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n1wgZ36wXgz6UKFKkGwEvqLUjVdp0s/+F1sUr0XpknwhkieIRy4MCofBXbc2ZbgPoG6ZzjmqUwterzwaQcPRxAOEwBMYCPKUGiQf+4N384GRDQMhtp2fJ8n9SHnXdiLaFiaDV+ZwvPonqWh46nEG6Buh72uIq7F2NbT5Xou2S+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZG6gvJih; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZG6gvJih"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so34478515e9.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785232013; x=1785836813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKpYcUd0bLsWfXRy27XLggsB62Hy65MOJiITGQfMwYQ=;
        b=ZG6gvJihWL/diBUEIVLSBZukgRLNwecq103farqj+68Iq1Gm8Zo1wyAgvCx5ja2vgy
         Q7vBhzOX4zJXE6bTYlvaZ0SPjd+esJW0cdbk1dgu/EU7jPVDUCWDRA6f6ZHXu/zSnEiU
         EleXvU4keOv1zgj+Sx78EdtbQ6hmP+1gVE+/irxwT2dR5dEsn89oiSSL+VJAnptCw6+8
         WDdY00zcEzJcxAT6zf+AqimR4a35SziXC9RkMm5XocJihU5T3KNyNPaFFgro1XzEhFR6
         f2fUgQmzZ1WYDJQ7ik9A4aF4z80X73xEemnV6RgM7by12vLjhSeYa5pkKd02ounwjepN
         7WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232013; x=1785836813;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKpYcUd0bLsWfXRy27XLggsB62Hy65MOJiITGQfMwYQ=;
        b=QTixjpDBh/SSvKEc5o+aSOnB4O3NCZHhB1kA1U+1ypYbkMd/m+jx9pOdTTKIXGvl3u
         1MMZwjjsmzSfmeB54eC/sRl+DjNy92vVuDpN5l85FL2NzpO4VKONAQ2KJBHNCGD381nh
         /e8Zj6wEu+P7BaXIoy4jFXzVntfS4kYdVzGON7uJk+PoHhsy1AkUkSRQg2l+pFSgHSsP
         kVNHq99rSs9Cc6G57m8IFXN0Zeo5wnKSyba/n2r6F3Ud1rkzasfWWaGKlmUvr04Kq/wh
         3bq6kK0YdpkNOaMoJUH1NbOqKrtAwpRLQ/DjHbgKq59Q50vjRFs7XnVJtTsxvEvO3mx4
         LDSg==
X-Forwarded-Encrypted: i=1; AHgh+RrU2+40Rl54TcbQZ5FzhinQPgSPrVtYy39/UdZMezo4VmXncVQe8WWSevhMnZwRUD2vCpvp7WGF1UeQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyD5Vx4VqPFwIFP5Rsw4X992a0LKc9KEF1R2zUNEqh5K+LZ1s0C
	O/O/hGNEIkcaq3yoOR0GgWTgsxO8HR/EEsWKjN9f1wfJWuSHfSf3hPTbq3H2n+m1bZY=
X-Gm-Gg: AR+sD12UewItQOhc9KUxYMcuszryX4sDnVOFSYttkmcn4miLtqStCpIkgtHev2lRlGI
	Kt+Ibk9mOvi5jAZl4g9TkIHqEwMbDCq+/HF1vhS+MgtIwaW0SD4KHcp/n8CuDhWpPG7UpmNfq3A
	Zg4aF8jTCoc5+ontNbE7iqQj8rtlMxKfSo+K8Foo4w3gHEOyif9xD8VbIp16eZFAA9tVPgAcTU4
	47D6KJKtgKPiIlY5c2u/5z4jm6cJ00L6oN93iktl4DVvDsDbwE/dCKb8RG7t5ETJtd2s/sZiC0D
	l1qTlnelsCVsTc5/HrLX71/pSbjopsvxlWdsaLqZnjni5VJNflb5Oj7xULw7ZiazoJIvPTX2U2C
	Qz0nCiDiQtX5yaMyCkJ3wXKePqnLGmGGgC8rXJVcT1F6iqLw8Irbst8s75QEVC5FOUcpnCgn57Q
	C1flZ5jvv39/5/f+iNPCK0YSOvXPPxJTgGWDC6blMkGxAiO0vOp0SJh9+ICw==
X-Received: by 2002:a05:600c:19ca:b0:495:67b8:d97e with SMTP id 5b1f17b1804b1-496c6575b9fmr16541375e9.30.1785232013466;
        Tue, 28 Jul 2026 02:46:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfd1a60sm291066435e9.2.2026.07.28.02.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:46:53 -0700 (PDT)
Message-ID: <94110280-c818-4bce-9856-f1e7ec8da055@linaro.org>
Date: Tue, 28 Jul 2026 11:46:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] ASoC: qcom: audioreach: compute active channel
 maps from channel_map
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
 <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-1-b29f44720178@linaro.org>
 <20260728090325.518421F000E9@smtp.kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260728090325.518421F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 11:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] The new `active_channels_mask` computation in `audioreach_codec_dma_set_media_format` introduces regressions by unconditionally iterating over all `AR_PCM_MAX_NUM_CHANNEL` elements.
> 
> Pre-existing issues:
> - [High] Kernel stack memory is leaked to the DSP and evaluated in control logic because `cfg.channel_map` is not zero-initialized.
> --
> 
> --- Patch [1]: [PATCH v3 1/3] ASoC: qcom: audioreach: compute active channel maps from channel_map ---
> commit 893598480a0705f69c55eefe5bf4e2b969edc6d8
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> Subject: ASoC: qcom: audioreach: compute active channel maps from channel_map
> 
> This patch updates the Audioreach DSP code to compute the active channel
> mask and logical channel mappings using the physical channel mapping array
> (channel_map) rather than a simple bitmask derived from the channel count.
> This enables WSA2 speaker usage on specific hardware by correctly setting
> only the upper bits of the channel mask.
> 
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index e6e9eb2e85aa1..0cc840aca69dd 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -741,7 +742,12 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>>   
>>   	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>>   	intf_cfg->cfg.intf_index = module->hw_interface_idx;
>> -	intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
>> +	intf_cfg->cfg.active_channels_mask = 0;
>> +	/* Convert the physical channel mapping into a bit field */
>> +	for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
>> +		if (cfg->channel_map[i])
>> +			intf_cfg->cfg.active_channels_mask |= BIT(i);
>> +
> 
> [Severity: High]
> If a stream is configured with 4 channels and later reconfigured to 2
> channels, audioreach_set_default_channel_mapping() in q6dma_hw_params() only
> overwrites the first 2 entries, leaving the remaining entries intact.

This is a valid issue, will fix.

> 
> Since this loop iterates unconditionally up to AR_PCM_MAX_NUM_CHANNEL, could
> it pick up those stale entries and activate unintended channels in the DSP?
> 
> Additionally, for channel counts greater than 4 (like 6 or 8),
> audioreach_set_default_channel_mapping() can leave the map as all zeros. Could
> this result in an active_channels_mask of 0 and break the DMA configuration?

Yes, the old shift should be kept if the result mask is 0

> 
> [Severity: High]
> This is a pre-existing issue, but struct audioreach_module_config cfg is
> allocated on the stack in q6apm_dai_prepare() without being initialized:
> 
> q6apm_dai_prepare() {
>      ...
>      struct audioreach_module_config cfg;
>      ...
> }
> 
> When an unsupported channel count is used,
> audioreach_set_default_channel_mapping() leaves the array untouched,
> containing stack garbage.
> 
> While the previous code copied this memory blindly, the new loop here branches
> on this uninitialized stack memory to construct the channel mask. Could this
> result in unpredictable DSP configurations and leak stack contents in the IPC
> payload?

Yep the mapping array should be set to 0 in audioreach_set_default_channel_mapping() whatever the channel count

> 
>>   	p += ic_sz;
>>   
>>   	pm_cfg = p;
> 
> [ ... ]
> 
>> @@ -1113,7 +1124,12 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>   	media_cfg->num_channels = mcfg->num_channels;
>>   	media_cfg->q_factor = mcfg->bit_width - 1;
>>   	media_cfg->bits_per_sample = mcfg->bit_width;
>> -	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
>> +	/* Convert the physical mapping to a logical mapping of the channels */
>> +	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
>> +		if (!mcfg->channel_map[i])
>> +			continue;
>> +		media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
>> +	}
> 
> [Severity: High]
> This is a pre-existing issue, but similar to the above concern, could this
> loop branch on uninitialized stack memory if mcfg->channel_map was left
> uninitialized in q6apm_dai_prepare()?
> 
> This would cause the code to evaluate stack garbage in its control flow and
> copy it into the DSP IPC payload.
> 
>>   
>>   	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>   }
> 

