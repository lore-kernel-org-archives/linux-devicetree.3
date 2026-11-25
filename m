Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596324;
	b=iODuguPmKHTqciuL59WjhZSLlInmObDvmS3acoyl0dv4nIaFcAdyIt7FkhH0kEN/rZZw
	 POoDII4vm4TbIFQoNRb/jm/VtljClkEK7+nUMbTCDDbxZCAELIKoWcDaQwBjonVHL/ANM
	 lMxZgd5DDGC6zmhzUdlQ6RmYGP2vRD1yoikrWREYhC+n5HDFLeUBGaWbn25f6QsIhChlS
	 d4qLkLUFUKgbNVFqPYwYD0/GiDPzDvIoIfwQQGo8yAbA6AaYlh1GzR78rGRMpImXBbOj/
	 D5NLDbHJcu5JWmAm6h2cpwSHcbAZcM0ylZXuekJEyOkt8z0sETqpvxLzlIaN7tFAzmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8hnA+onLUda1A0zp7SeLbz5gSaOIOH6AU5jguSzKjPk=;
	b=E1tmzDB0EaYxi077FA4YfxZ/ijNO2Oq3nkZrgQt9StsSEhcbeEpppd+VwGDCpVDIgjO5
	 f7DIXhI4lQ1cKM84lXgcBtBE6S0R3TK5iG1BclPDIj/iYika65WVFXTZQW2qox5zXLhpT
	 a7tyVbf0u7e/iPaAW0oS3h95hKeVhJj4TMDk8sXc324d7uVXs8BA3sUi6fV1I7MAivq5g
	 EUm6u7vaNh1K+OK+JDZ8EFKpLi2BTiA8Qh5uSyj3NrnSvKjpC+nDxHadMQS5QAYK0kiXZ
	 EqTI3reE85CgUjSuaVjDNylKWf9BM7nzbk/hj2AhShuEVlW5zPbB7xl1eLY9+R35pIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PmLGyL5f;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB7B606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB7B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PmLGyL5f
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so43735575e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795596323; x=1796201123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hnA+onLUda1A0zp7SeLbz5gSaOIOH6AU5jguSzKjPk=;
        b=PmLGyL5fv1es97y0x9Nr6/Xs+qINe30vLqDMczAde/ep+a1PZSCJp8DqdYjTLWi9aY
         TxJ0keMyAZ6N+Cj2y+7DUUsWm3pwrbNCjlqm6vc/LbgS3TX/OI9320Oi/od5uAnViDCb
         982ZjQyG6x1Ukmk+6JjiOvcPPQvuGOAsezWvVnc+AyGUlwgqogQ8Ju1LIH0kMYxoorSF
         XFtiinup+o7iNpUbpMJLZ9ZBq6qAmwUWnmzA0oX8X0dnSWavXi55LA2YXHVJnJuPdI/+
         RuhqYL/uUD5iTdTize8vq583sPG3nf/pMyWYUBeAmGKgYVobGkGud6TKi8RyRYGNt5gE
         7cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596323; x=1796201123;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hnA+onLUda1A0zp7SeLbz5gSaOIOH6AU5jguSzKjPk=;
        b=wVPzrSzBetIuxsebY6PUIjPntkTiPxyAB8bPy9j4KXG80V8/mMYqTUAjMyENtWChtT
         2Jn3RVb1eTaMYlT9bnKVi8kXfqOQ9qSntSXqVW+ofY2sVdYpoc8SuhWvSIaC2gTYWh/o
         LSLNo4ZMMnqtAXaLQgCnTYk8NN2gyJX1kQv+ob73Y+ETFSieGz8HwSOn0EfowvFfa85d
         bxWMilW21PhyZSSxhqLoX/aVm8LL46salyXcuERJxxaGeUENUKGa6Y69138OX8e9h8wi
         BnOJhJ2UlMdw3rBD2yxUE+uBHleF3GolcBrD8/dTLnKqrYkwEnCYidcJBnxGVtnvM97t
         GxaQ==
X-Forwarded-Encrypted: i=1; AL+hErGk29vWhxqIGQlz00a7XmfYtTO1iIuEqAYxwrcgX2PvQ7lr+Z5cW0p8aHMJ0RORa3KWZxcoZ+Becqk5@vger.kernel.org
X-Gm-Message-State: APuU4Z94TM/4J6D/t6RBsufiaka7IJg/Nj9jRadeaNbFnchgmU65eh/1
	+hhO3/xfDCn/zLHq39WpFxBQt+3Y+OiUHXC3UUCM6W2Zh9bMBzb/bb1VIBs3CC9sDU94YeYau2Z
	nWKK6SMPYIA==
X-Gm-Gg: AZFdTZdSHgsKuCQzRNpVdOxD/5HSACGpXcVeg4XKs3/fILVvvIKn9LSn34H2Vivgg48
	1imiamlEaQiv/rdJIV6Hq3WSlbq9w82/cAJ/Z0byRHcWXN7f0z4zHd2r7p7aUc6CA5ZXq1DW5k8
	NOLRvH90lH2AytoMs8uflm5tavyo066uYhyQ3/92z2wy+jPPTVuyrxxd4AzLD5yJl6wyho7S1FH
	R3FJZiKzblzE6tIah0KcBqbVyjF0R7nRu2mutaSw9baAejn/1OOyentdR/dc8+KNTDZ7+ftU7GW
	YbKvin7c00dckW9X4HekuvGjPchWP8P0ign78Hm4e0iHfr8pKbJoTBxNNQ6NEeb3s4LsDVfUhaC
	fuMD0szs49v0MGc2rizR96r/xZv+AtLEzd9QEf6E+1N4L/7kCBnRGf3aE/rwmfzjn2R2ruY3B5I
	gwQbTU/wsU6zy6uRHPdIofCa0u6mN4XEWzamp/nCP4LDNO0/uMfrhpFZXRljk/CwshCBwknKuSz
	Lqs2+UO2EimX3iAJTCtYXlZDXxJOFzIoMw+H4TcrXkqXLKaDuDYNiMmZtdOw3raPh5kaOvybssw
	/feX3nvHTYjbw02IVJ1i6sNZQRgFMU5qtmmLKahR7o6awtYRNfscr0+DICf+7aO0x8JTOPed1mC
	TChP4Ei2k
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr351422185e9.22.1795596322739;
        Wed, 25 Nov 2026 00:45:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm27677872f8f.27.2026.11.25.00.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:45:22 -0800 (PST)
Message-ID: <5d181d25-53ac-479b-8966-82096c53cb5f@linaro.org>
Date: Wed, 25 Nov 2026 09:45:21 +0100
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
Subject: Re: [PATCH v2 18/19] ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as
 soundwire dai
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-18-174e159f0f69@linaro.org>
 <sashiko-outbox-231744@kernel.org>
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
In-Reply-To: <sashiko-outbox-231744@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] ASoC: qcom: use-after-free in qcom_snd_sdw_startup() [1]
> --
> 
> commit 7f273de8112390d0dc0ac3f44c88e5ff3276352c
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as soundwire dai
> 
> This commit allows LPASS_CDC_DMA_WSA_RX0 to be initialized as a SoundWire
> DAI and restricts LPASS CPU DAI ID matching to DSP bypass links so that
> overlapping DSP DAI IDs are not matched.
> 
>> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
>> index 6576b47a4c8c3..669fb63207c91 100644
>> --- a/sound/soc/qcom/sdw.c
>> +++ b/sound/soc/qcom/sdw.c
> [ ... ]
>> @@ -71,7 +74,7 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>>   	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
>>   	int ret, i, j;
>>   
>> -	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
>> +	if (!qcom_snd_is_sdw_dai(rtd))
>>   		return 0;
>>   
>>   	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can [1]
> qcom_snd_sdw_startup() leave dangling sruntime pointers in already
> configured codec DAIs on error?
> 
> The loop below calls snd_soc_dai_set_stream() on each codec_dai, and if
> snd_soc_dai_get_channel_map(), a later codec_dai, or
> snd_soc_dai_set_channel_map() fails, the err_set_stream path releases
> sruntime without clearing the stream pointers on the codecs that were
> already set up:
> 
> sound/soc/qcom/sdw.c:qcom_snd_sdw_startup() {
> 	...
> 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> 		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
> 					     substream->stream);
> 		if (ret < 0 && ret != -ENOTSUPP) {
> 			...
> 			goto err_set_stream;
> 		} else if (ret == -ENOTSUPP) {
> 			continue;
> 		}
> 
> 		ret = snd_soc_dai_get_channel_map(codec_dai, &tx_ch_cnt, tx_ch,
> 						  &rx_ch_cnt, rx_ch);
> 		if (ret != 0 && ret != -ENOTSUPP) {
> 			...
> 			goto err_set_stream;
> 		}
> 		...
> 	}
> 	...
> err_set_stream:
> 	sdw_release_stream(sruntime);
> 
> 	return ret;
> }
> 
> Subsequent stream accesses or teardown on those codecs will then trigger a
> use-after-free on the freed sruntime.

It's not related to this serie, it deserves a separate fix.

> 
> [1] https://sashiko.dev/#/bug/linux-3eb5665f-b54d-4f37-aa26-a95e56e5e77e
> 

