Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595895;
	b=qvFZ6yKbXysFBBYHwZKnwX8pyLL4OaAlG7Q3DB2TSeReaDm2qv+IIPvXsyDKAZpRpvLU
	 zUSQtzq4GN6n0idCXKJyWp49UQJy8ujuYMRjcm8nrVaIwvBk2c4YElaVnNoWhwAPZNm58
	 6AE9O1TWqfqdbPB6V5D1InqztbBTjDtSvIhwUv1SRTMWWUwGCQLYjZsQd/iTWwTxCkVQe
	 L8yo1HdXg2KCF+y9Iy0RmxHFK2SDRAILl7e/GT8dc4G5+Jajgh/jsybX/WS3Wm8DQ4JYm
	 h5JtKoQAXwS0DD5dkOz9yjtqW0O76nQOmxILE4ecGiipq/iuKvkmBdt34w/GCX54oFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lzEDVzkjwvhKKOetVTsPS9exn/Qx2MWQ2k2YB/v+e5w=;
	b=ehNV3uBtOQueGUFf01tJiUthAQvzqbdGd/j+xkFNZQzMwW6trxQHzKsI8R0jWbgsvIqJ
	 kzsm+U4TkwpvZggdX9M0XHlx5sl1KFi1opXlwetMc6IKeY/zK//XrsqyrFvtN4Hvht1V+
	 Gf9Kc9IqM4EVS047oyuOo3ZdggaTVyHPaLleoiOi8+iLf4fdMP1YdaZLeQj2mXwYJBFtQ
	 Z0vmiCA+4Nw4kX7gbkRx6MMGqim6CcVAxgVE4oD3+8oLGFktEZt4fcNfRsI7CFVmNaLJv
	 uf2L9uGh/+PyCyU5+M2kNA/x8p4w/R5KzDJ1GND8Yie+BqaQBfvNB5irX/4hHXtZtcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uqmG5gLF;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F490606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F490606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uqmG5gLF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso52013235e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795595894; x=1796200694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzEDVzkjwvhKKOetVTsPS9exn/Qx2MWQ2k2YB/v+e5w=;
        b=uqmG5gLF8I0TPo6PyH22INBuIovjHWxcjCz4zXtb/O3+Ef6X50w/NeQtXdHcVHQs78
         Zc9fjk9TDyWy3RYL+hAR0uvSc12E8jPajwLE/65j4fukJ6BNsGNQ7BzMSgoyFY3lm9MF
         nSa2tzTCKfxSZC3K8ttaSzG6kMfl3Ntfxyhv3uuN6mzzmlHcvh64yLh8FfCd0JY4hoVb
         AsrHt+daCl1VCYMXneJmXIaKJqFxc2Pv2pHZ6/zRosWPkkD3fxEf38ER1KYr2jwZVC9K
         Yr7bNNH/gc6Trz+grtp0BWZQY4NtwRIpzokn0eZFrSRwzBD+MTxl5oqJ6hC89e4j7x0n
         KpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595894; x=1796200694;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lzEDVzkjwvhKKOetVTsPS9exn/Qx2MWQ2k2YB/v+e5w=;
        b=PdT2W/jMWghKscCB0y0tTpVw0kBOAdA5Om6DOchomSM672xC4NsYCqNPnN6K7kWgKU
         CjO5NcqVypuAwtjqADuE2LfBnnf51Gu56TKrayDiVeo2R2WXWmet570KbYVVp+kuJYs2
         ZfgtJv1Xc61hlf8JVAtFXnWSPzhkikqzwPjWfG+7RBhWT7urYzLntYBo3xouIp7vNIwI
         jTBpecL9Zomr26o7Vy/BYNlVhnsIPjQ7VwUCjDavlVouxpI3v9+kex1VWZSUEFEfnI3g
         /uYPuKeCA3Wfj9D2NuHeyCfBb+CSgG10m+sz7cx/IonlHj9wh9EMawT89uAU1E41Xh0O
         3Chg==
X-Forwarded-Encrypted: i=1; AL+hErGhQfI3Apdj28IH+Ir926PgimXznnwYdJxbK7k/NOgrgCghHyuoZaVytnalMXG4BFeq7JzKGqTEA9rG@vger.kernel.org
X-Gm-Message-State: APuU4Z/DLl63C3HH6pW4p4bd4YESNNR/kBeLVjWpOQXu7W8B2f+XvLGn
	nHGYL8o2deGOb/0i9KqxzAcA08arLRfLshRAwNDWTX1MNRdOgJ+w2PrzME09098BMvw=
X-Gm-Gg: AZFdTZfZrrlXOFBwlWKvdwhnGpnWFmo51bqB4AsjdoW27CJbYrdP2ufFjgB02oUkG1F
	mjk0OwCX8Kr16Zyun7O89QOJUb4fEmwlSpVxH0n+XuJpUCvh6stwkXIsfiZWodxK1K5y59zJCQf
	hYRnoTjS4yGNWx0nzKwgOUSKJQ/9TQx2P9SS2eIKcYAmzQeE07zGPputqBByi3+MSsum2EH8VfU
	aCLYH2Wi2ePaiiE9mzg9xolM7bHqaeZeixDv8Y4gpkxks2fG8HaP+xVeNXqgqspc0v7GdN3s4qj
	gS4ArndOGEoBVVJD3jO1FhKIBL7lU2qLZSpm2nMCWrQ32zR/zsyR256Cl2ky6fmxREU0lfpc09b
	dpQTRgM6aG3JvxJtIdMZKGi4vx5PaTfQNvNFekiKII/ZZqOcZ3oIb3YjP2/I979EzHldLjhJjtV
	dvwz7pvaOSm+yox5tffSyv+KPn3zztgNdfT4fdBv2gPGX8xpIdDLM6vaLn2I79Qzd2gb4bPvpvq
	CSyMz/SKkqBqaEnTiUkUZENAMp8+IbIicmol7mSIDhc6hzI4flYB3YTTJWQfTcLPrU5uu4vnDt7
	VsKESe7ygxa2Gk0nHxDJzijbR9oQxCd5sv6upwmM4u1FqX866nMLj5T3EgnbfHoXoJoSPKF2u8B
	OjkKxmf81VbF0AkBdZ7owCCl1ShUJEMU=
X-Received: by 2002:a05:600c:1548:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb88800013mr372756285e9.6.1795595893607;
        Wed, 25 Nov 2026 00:38:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm464599425e9.4.2026.11.25.00.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:38:13 -0800 (PST)
Message-ID: <78f7c95c-be36-4c68-9e5c-b65ca5bcec7b@linaro.org>
Date: Wed, 25 Nov 2026 09:38:12 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 09/19] ASoC: qcom: lpass: add support for optional WSA
 interface
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-9-174e159f0f69@linaro.org>
 <sashiko-outbox-231757@kernel.org>
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
In-Reply-To: <sashiko-outbox-231757@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: qcom: lpass: missing wsa_lpaif_map handling in suspend
>    and resume
> It also noticed 2 related pre-existing issues this patch does not
> introduce:
> - [Critical] ASoC: qcom: out-of-bounds array writes in
>    of_lpass_cpu_parse_dai_data() [1]
> - [High] ASoC: qcom: lpass: unchecked memremap() and missing unmap on
>    PCM free [2]
> --
> 
> commit af2e24041ddb606a271caf973ca3eb7d9100c98e
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass: add support for optional WSA interface
> 
> This commit adds regmap, DMA control, IRQ, and buffer management support for
> the optional WSA LPAIF interface used by the speaker SoundWire bus.
> 
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index 3089107442231..db7a0752edb2f 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
> [ ... ]
>> @@ -984,6 +1076,16 @@ static struct regmap_config lpass_va_regmap_config = {
>>   	.cache_type = REGCACHE_FLAT,
>>   };
>>   
>> +static struct regmap_config lpass_wsa_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.writeable_reg = lpass_wsa_regmap_writeable,
>> +	.readable_reg = lpass_wsa_regmap_readable,
>> +	.volatile_reg = lpass_wsa_regmap_volatile,
>> +	.cache_type = REGCACHE_FLAT,
>> +};
> 
> [Severity: Medium]
> Should lpass_platform_pcmops_suspend() and lpass_platform_pcmops_resume()
> also manage drvdata->wsa_lpaif_map when drvdata->wsa_enable is set?
> 
> lpass_wsa_regmap_config uses REGCACHE_FLAT and lpass_platform_wsa_hardware
> advertises SNDRV_PCM_INFO_RESUME, but suspend and resume only handle
> hdmiif_map and lpaif_map.  If the WSA LPAIF block loses register state across
> system suspend, resuming a stream via SNDRV_PCM_TRIGGER_RESUME skips
> lpass_platform_pcmops_prepare() and never syncs the cached DMA base, buffer,
> and period registers back to hardware, while later regmap_update_bits() and
> regmap_fields_write() calls can skip hardware writes when the new value
> matches the stale flat cache.  Note that later commits in this series
> ("ASoC: qcom: lpass: support mapping I2S ports to multiple LPAIFs" and
> "ASoC: qcom: add SM8650 LPASS CPU driver") do sync the same lpass-wsa-lpaif
> regmap across suspend and resume when it is used for MI2S.

No WSA should be handled like RXTX and VA, with MI2S support it may be necessary.

> 
>> @@ -1046,6 +1148,8 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>>   			data->hdmi_port_enable = 1;
>>   		} else if (is_cdc_dma_port(id)) {
>>   			data->codec_dma_enable = 1;
>> +			if (is_wsa_cdc_dma_port(id))
>> +				data->wsa_enable = 1;
>>   		} else {
>>   			data->mi2s_playback_sd_mode[id] =
>>   				of_lpass_cpu_parse_sd_lines(dev, node,
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can
> of_lpass_cpu_parse_dai_data() write out of bounds on
> data->mi2s_playback_sd_mode[] and data->mi2s_capture_sd_mode[] [1]?
> 
> Both arrays are sized to LPASS_MAX_MI2S_PORTS (8), yet the initialization
> loop at the top of of_lpass_cpu_parse_dai_data() indexes them by
> data->variant->dai_driver[i].id without checking whether the DAI is an MI2S
> port (CDC DMA DAI IDs start at 19), and the else branch above indexes them
> with an unchecked id read from the Device Tree "reg" property, overwriting
> adjacent fields in struct lpass_data.

Fixed when MI2S on other LPAIFs is introduced

> 
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index 9666049ae51b6..99a7ce9ed7695 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
> [ ... ]
>> @@ -1148,6 +1295,14 @@ static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *comp
>>   		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
>>   		buf->addr = drvdata->va_cdc_dma_lpm_buf;
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
>> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +		break;
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
>> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 3;
>> +		break;
>>   	default:
>>   		break;
>>   	}
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but
> lpass_platform_prealloc_cdc_dma_buffer() does not check the memremap() return
> value on buf->area and leaves buf->dev.type set to SNDRV_DMA_TYPE_CONTINUOUS
> with no .pcm_free callback to unmap it [2]:
> 
> sound/soc/qcom/lpass-platform.c:lpass_platform_prealloc_cdc_dma_buffer() {
> 	...
> 	buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
> 	...
> 	buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WC);
> 
> 	return 0;
> }
> 
> If memremap() returns NULL, a subsequent PCM transfer in
> lpass_platform_copy() dereferences rt->dma_area.  When the sound card is
> unbound, snd_pcm_lib_preallocate_free_for_all() -> do_free_pages() treats the
> non-NULL buf->area as SNDRV_DMA_TYPE_CONTINUOUS memory, warns in
> decrease_allocated_size(), leaks the mapping, and passes the remapped address
> to free_pages_exact().

This will probably deserve a follow-up fix as it's not related to this serie.

> 
> [1] https://sashiko.dev/#/bug/linux-ac3b3436-c7ff-4bc4-ac2f-8d1aa0b6ad52
> [2] https://sashiko.dev/#/bug/linux-c4c01ba7-4086-4d0d-b8e1-8b417f2486e3
> 

