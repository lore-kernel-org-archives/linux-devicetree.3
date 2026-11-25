Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595927;
	b=vjwRlYubdVUW2IC8RPoeCivDDisQX9ohQuh+ZDWHGYYPz1qTBedKUXzoDzNrErKEDQwj
	 UF7tg3BaZLQgNVua0Vn+ICdzMVhdugKvOv2f92PJWo/o5LdKd5Y6YWEn2GsPKscbXCUMq
	 enMA7A+XPR4EeIbaCQ3O8ckDo7nNds+PmJYSrWLjiaSdRmHW+3l1HyXY/Nm5xErbE5oES
	 oAmWJ1iK5Cu2opPjL0Hb+gFKwyuAhy2Qb7v7wMgYRnnzULnTigV13lWJAfuPVrtYyvcAY
	 QbMWM1t0GmM3Vj3//AGXhBYBV6TnCwWWyDrwqWBu1UlxFcnJEX8OexQROmZ8B/W2ZLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=50VR4Bii4r0x40VxRkLIljzh8fTduZtxHSfKIR3mJdA=;
	b=3NKhJo6pCcRnH8l57dXy9xI8wZ4UfLEqWb6NMussX0jKWbUO7Lm4cGeclDVYDxIzFfad
	 TBOYKezaeeEF4a7r/lxk++aSBQRWV2mapOGFEJizQTVDJNKKBcXML1koYeZJyw5CxBeUM
	 2FuqZPo0zA9szR41igli9pDEA7dNps/ATvkA2XvK4kckzw/iVDMxkug19CHmEcxidjdnq
	 d+nmWJSL/2fysaA1jccdBT+0QREF3IoKjZ8W7UUN6IAGgvD9mr5tINoC9inAEJJ3phb/q
	 395u5jxhor/Wrfsc3J12G+ogTxRmSRgdiELRKTKQymTMWIKbBTmDYruenRUZR2ZyhUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uXB0uB9r;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28485606A33F
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28485606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uXB0uB9r
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a9be758734so3410917f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795595925; x=1796200725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50VR4Bii4r0x40VxRkLIljzh8fTduZtxHSfKIR3mJdA=;
        b=uXB0uB9rBS61mYCE8m6Y2IuifItmaCmqaGyCD6s5PyydPTNRjrKOswJNpKzWAjGCbL
         WebE5b7ecGwKmy3Jiq48lG2n1vuAbv1fo/sJlA+L3pfdRHxPevEpW8YiRsqMGfsin9HP
         VBfjbaCKfaba6qlxsuy4ZNT2PFo7N8t/o4qFngaEsXTyptDqbU4snsbxibcizetBohGO
         hJqKr12mT1tzTQbKlOYzKAgGEr8kiRsjMHvnvASSUWbFiVnT6pVZAdwAoA9+6GYuupgP
         sDozzWJwML8Gp5MNPdRBDz4hO5/X1XHuskXggAbPUC+5LHEq+zJwq0zPyY5ytMbal+0E
         I4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595925; x=1796200725;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=50VR4Bii4r0x40VxRkLIljzh8fTduZtxHSfKIR3mJdA=;
        b=dWSM+VC2MbuA6yLvMUgtiwCJCgHl8c72p0Y9uZNv3p2U0bnrNA0cw57yIW6bxhN6SU
         Z9DOdXkCIZ0/AVK/ljc7T9SOSh+kThlo+S9lHms4/G+e/OEohplqmh5HBCmUMi25aOgq
         De/b50EWWqY6j1mwcnfcibhWg1+GoFyqoOBa0GmMW9qVs2sDKKjPDWmKEGkA6DkPiqDk
         HVIP27FYvV1ciWcuGYzFkhC97NZ0HEj25UMIkyiDoISpLze5N65r3dpG3wVZJXHkmmoy
         Vrq14066HYyg7yDtRqWqU6I2N0BrlV1eP4uZS5w7NWzSJdczjP31DPPmQ4uprxbNr90N
         sDzg==
X-Forwarded-Encrypted: i=1; AL+hErGI/9MMFrUczawJagH3nhJGcLzodl44H0w8vhIVIRX+WAnbBZ64tR7V8i9JKTv9kY+TzCgiyxjaM3QV@vger.kernel.org
X-Gm-Message-State: APuU4Z8R91fw8u0IdoeXDZUSgDu1EDzzguHCZTIzfreCEXSV5mkd2kXc
	+2aXbAo1NOcBmd83Eu1LGPOzO4BFQv5gDToG2TxxAnV3mpzpGPhD9BTQSFl9CgIo1iQq7CkDJbW
	7KedRe0GIYg==
X-Gm-Gg: AZFdTZeW5MycMD6h9KHbqhqXXA1ra/Qet+i1cuG+LED25fH1ZOW9LZ0dway0hYuBXvy
	wOaSTYoqD6L3FaVoxDpdOpXgZWwNjjEtt2JurBKbbL067kXJyqUOwsKmFI+uHGbI7AqoMSdBTpa
	YRFMvt7aVDs+mp6fapRcTiXmIAFJw/gg3SyutNLGNrvZ3/7UKh33xo7bhsHiw+Hq6SIme1OW5sO
	Cmin83Mi5Re4CzWtoH6tgSwRPhmADoYP7BX+kUUTzkL0FX6KjOHesInG9L14K4jHa0tvIhQI2bK
	AoUtx7uL51rGdCFSZ7UIuS8yZgMck1npqEjw5FSoiOhRVP3my7Q5VlbY1I8q28lAgfJQClud809
	wpyQZqqderB174dq3JnrHgiFo9J6cNISoCBkvBEpy4VTm0KWxzMKatnkfhRltLA1mkrhItn+bZj
	JGbibAYWNs9uI3q/ty+wn6lP4XAbrAmYYy6aMQAsvWWsbhIolBhG9Qsxva2xWQdk9Rj+QjxwTgc
	tbk8s/+2oWIqg1eWEW3/sR9i2AOM3i5OGIoS8Mq0kBL47cFSS+CKtZCQqa1fgPcCEJFrFF0qtkR
	njpKCM8WKAvUxVETzsOa8GwcpTqz/zBEg6L2c6mfjJVrrxwAFr3IXqBVXjHafOjPpQ7SmnQuao7
	00BV8LHsh2g==
X-Received: by 2002:a05:6000:200f:b0:4b7:6dcb:e906 with SMTP id ffacd0b85a97d-4b76dcbea3emr7646897f8f.43.1795595925303;
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm31544013f8f.0.2026.11.25.00.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
Message-ID: <0144c378-919d-4c44-a306-dfadea6a7617@linaro.org>
Date: Wed, 25 Nov 2026 09:38:44 +0100
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
Subject: Re: [PATCH v2 10/19] ASoC: qcom: lpass-cdc-dma: add support for WSA
 codec DMA
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-10-174e159f0f69@linaro.org>
 <sashiko-outbox-231736@kernel.org>
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
In-Reply-To: <sashiko-outbox-231736@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: qcom: unchecked clk_prepare_enable() in
>    lpass_cdc_dma_daiops_startup()
> --
> 
> commit b77682a3d9ba3fc802985eb7a7f2cb05c5db3350
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA
> 
> This commit adds WSA codec DMA interface handling to the LPASS codec DMA
> driver, wiring up the WSA DMA control handles, interface types, and
> codec_mem1 clock in DAI startup and shutdown.
> 
>> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
>> index 2dc8c75c4bf08..d7f85a4f9d999 100644
>> --- a/sound/soc/qcom/lpass-cdc-dma.c
>> +++ b/sound/soc/qcom/lpass-cdc-dma.c
> 
> [ ... ]
> 
>> @@ -184,6 +211,11 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
>>   		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
>>   		clk_prepare_enable(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);
>> +		clk_prepare_enable(drvdata->codec_mem1);
>> +		break;
>>   	default:
>>   		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
>>   		break;
>> @@ -205,6 +237,10 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
>>   	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
>>   		clk_disable_unprepare(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_disable_unprepare(drvdata->codec_mem1);
>> +		break;
>>   	default:
>>   		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
>>   		break;
> 
> [Severity: Medium]
> Should lpass_cdc_dma_daiops_startup() check and return errors from
> clk_set_rate() and clk_prepare_enable() on drvdata->codec_mem1?
> 
> If clk_prepare_enable() fails and startup returns 0, the substream opens
> with an unclocked LPM memory bank, and lpass_cdc_dma_daiops_shutdown() will
> later call clk_disable_unprepare(drvdata->codec_mem1) on close, either
> underflowing the clock refcounts or disabling the shared clock while
> another WSA stream is using it.
> 

Ultimately yes, but the actual code doesn't, so this will probably deserve a follow-up fix as it's not related to this serie.
