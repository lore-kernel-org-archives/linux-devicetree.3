Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596412;
	b=0PNv3kMnV9XmLZsdTR8/7mbzI4DkUrb5rmhrRmGR4XxwBY4j954+KigybEWGsMGJw62l
	 OU53FukC41eepHwU9k7gNt5HKQS2x8jdr2c2sVJpMJO63VzWKVpMONsSYd+2DZGtI/z4K
	 3/wi4ps9j4oia33AKvt9YDB2D42XT6jm7ETzGH/Sw1Rk1+ecncmoWjcCXSOJ5PFXoW0fg
	 xFY0IE4nA3N1RjoPnm+9/gekJk4Mwri4XHLsCo0mUF/Rsc/cOaZjsR5wP1aNghVhYQKcX
	 kGnfxmL0wgCeavJLFv/mX9nILcja9Vhx+zznTecGiIdqBN5VqmypAdXrYvSuhOkeapA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yxb7EQsbpqO3H4nS3rf4UMq78ALObXEsUz180cnLRB4=;
	b=0iTV9FCuXczD+kWBTZtgVCpu9N1Ros86veWmmW7Cw07AGB8YcOGALHXLGs2+qwLrFp3R
	 1AOuaOclhuM3oQxR28UQE12sql9fmNJyAQ3sEncY0anduXJkxTwjrxYV3t0c+lXaCY6bQ
	 6kyiLrCZDfAPE5iafhANt2FRPtBLZwIefbn70rDxnSGxRNKNpt2VEhq1+NQzDkoonrFPV
	 oznYDWWIDGaEe9LFF5zmKIqq2m9AFhappiz5lKOwB5spWzsjrgxMV0kI11FS+0pVXHYC8
	 wE/zYo7xcKNia6N0KmtZt67kkvMM4GCyQDYbRe4wd29NcBWSVdo87vdllxOE3eV0G4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HCs5D4UO;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ACB606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14ACB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HCs5D4UO
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso3421771f8f.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795596409; x=1796201209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxb7EQsbpqO3H4nS3rf4UMq78ALObXEsUz180cnLRB4=;
        b=HCs5D4UOVsN4uCK96d0/ALHNfx2Pk7+hpvSCNVV9WsdTQ3nOTgOEMWWgKTw9OzyyMz
         fcQYdOS/BgNvF/Kf0u+letqyupQ8rlBfKqhJx7PFLo8/zBrMkgExNMH73IbnA+Tv7h/n
         GrEOPiDiWcfW+aJfHtmEsWiQRCjuix4HUHATexIT4/yhmVC308MIuPUHWht7bPiDB1SP
         mgawjwg8tINKEzk34JZ96qRjTK9m1ih8ruJ65p+DxalOUb78pVed0T+0/ubMHdanGCnW
         0G8bIj3gnhXF49t4qIguye79XvZ8qDt6B05CFUbw8FovjobdHHt9shr1uX8I7Pyzu4ZU
         CzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596409; x=1796201209;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxb7EQsbpqO3H4nS3rf4UMq78ALObXEsUz180cnLRB4=;
        b=tViyg72Lyyo6LFhI3COlxxldv0+Jc2ixNcWhkmfTD7jmcrq0WIW+BtuwhdsgB5KxEu
         Wa2UG1+qzihXo5HWVZ+mgd2dF+/76UeFem3DM1IUtHArDgDOmWciu4yIoRmzQzibDRH6
         YeLZ9LUe5C4uHzwMvB5H7WMKcxxvSPPdkxiMmddsWlWwtVhKa/dSWFsYG2M3h83njSIk
         BFQJyIqOCHVnAJ7OzdH3zDkNFizMo9nneHGfWg+c7pxwwN6bZIF2jezCJ6pYdnYnA9CG
         76+dp+N84t96ypU6Ksl/fIqtFJlZlxqy+lrDADrQfXnxOEjcYq6EeGtLof46KCMzvdCP
         /rCg==
X-Forwarded-Encrypted: i=1; AL+hErFXknHplbfPsnzpXKgYE7pfF25ZZtABg/Ghn4u99yYIvMTqdjIaG1q5pmjzItsFD2RoLR8eAKaWkonZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9ynykmBmsMer4AwmRHrNPHW02V1GY5/n6f4Dg+XAMHgzL2cELZ
	cPmN4/dotYp91akhTqv8rijnFHcTWjD1yJEJy1v8ZyPb5l65/0I84YnexarUQhTkV1g=
X-Gm-Gg: AZFdTZdgrDOcqBjkDMDU3UKWX4FM64KHkRncXPVupc+5H5tVkDGzn3iaOut8SZaVcvj
	SReYEosiEh1L6VF/kpNVFLV/rny0g8nXTngSlmHtZIZMmXWlrDe2wQyvnz9ErqpGnUUzDDTfsfi
	rYRPmJ2tEWYn3fnnldWRNSPmI6Fs7zDE7M3UrDkwzqSdu9m23TUkKwOK6Xy6/zR0PZDnsv5b4GN
	LvuOzfl/I6Fz75MuAkDEQM/A5zfWVa5fNX8mDfITHxxsRA5JrJmSYw9EpUjVghp6IioFVT0nFXi
	vtcaQv0e7JBo2C84vvb54eCYbKd/H2CAxnIAqHjmZAYOb+mPs1KRGH10w4fumAnnlRZ1oDg7CT3
	bzhQxF+VKaYeWyvVMuDXqwBk5viifziHqs5GGlh0SF8dGcKf6qwMCyHZZdooRi2rRDKa0Lj0K/9
	QlRT72QW9FUz7keOqV+YajkRBCig/BYc4S/lYZHSzN6IhnfnyTP+2zEB246AX5yOWo3bnVdiCJF
	Hwbn1IMHv9cTkLumYoaevaCmZKRs48NUTiSqVIAAs3btEifWV3MaITg5a4P5fiL/D6G7FtjDuN/
	YEotw2njJX/UeR139jNNv1YePGhmGV0Zea5wy3+SjHcjJoY4LM38DOL4BfH6D6twDu19KMQrIK1
	H+RK6iXmF
X-Received: by 2002:a05:6000:2586:b0:4b7:760c:70db with SMTP id ffacd0b85a97d-4b7760c713cmr8367241f8f.4.1795596409091;
        Wed, 25 Nov 2026 00:46:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm12637052f8f.9.2026.11.25.00.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:46:48 -0800 (PST)
Message-ID: <59b8701a-22b5-42e9-b94a-4ed3af6f346f@linaro.org>
Date: Wed, 25 Nov 2026 09:46:48 +0100
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
Subject: Re: [PATCH v2 19/19] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-19-174e159f0f69@linaro.org>
 <sashiko-outbox-231759@kernel.org>
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
In-Reply-To: <sashiko-outbox-231759@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: qcom: sc8280xp: missing jack cleanup and link exit on
>    DSP Bypass links
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [High] ASoC: qcom: sc8280xp: missing WCD jack cleanup in
>    sc8280xp_snd_exit() [1]
> --
> 
> commit 30357a271c5bc6a19f163b41e5ab561af21084a8
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu
> 
> This commit adds init and ops callbacks for DSP Bypass DAI links in the
> sc8280xp machine driver and attaches the WCD jack to LPASS CPU TX codec DMA
> DAIs in qcom_snd_wcd_jack_setup().
> 
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index ac4dfb2c2182c..4fcccf7ec4965 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
> 
> [ ... ]
> 
>> @@ -377,6 +378,37 @@ static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	return 0;
>>   }
>>   
>> +static int sc8280xp_lpass_snd_init(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct snd_soc_card *card = rtd->card;
>> +
>> +	switch (cpu_dai->id) {
>> +	case LPASS_CDC_DMA_WSA_RX0:
>> +	case LPASS_CDC_DMA_WSA_RX1:
>> +		/*
>> +		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
>> +		 * to reduce the risk of speaker damage until we have active
>> +		 * speaker protection in place.
>> +		 */
>> +		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
>> +		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
>> +		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
>> +		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
>> +		break;
>> +	case LPASS_DP_RX:
>> +		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack[0], 0);
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (data->priv->wcd_jack)
>> +		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>> +
>> +	return 0;
>> +}
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but sc8280xp_snd_exit() skips
> headset jack cleanup for WCD jack configurations [1].
> 
> Both sc8280xp_snd_init() and sc8280xp_lpass_snd_init() initialize data->jack
> and set data->jack_setup = true for WCD jack configurations, whereas
> sc8280xp_snd_exit() only calls qcom_snd_headset_jack_cleanup() and clears
> data->jack_setup when dai_data->jack_setup is SC8280XP_JACK_SETUP_CODEC:
> 
> sound/soc/qcom/sc8280xp.c:sc8280xp_snd_exit() {
> 	...
> 	dai_data = sc8280xp_get_dai_data(data->priv, cpu_dai->id);
> 	if (dai_data && dai_data->jack_setup == SC8280XP_JACK_SETUP_CODEC) {
> 		qcom_snd_headset_jack_cleanup(rtd);
> 		data->jack_setup = false;
> 	}
> }
> 
> When a card with a WCD jack unbinds, snd_card_free() frees data->jack.jack
> while codec components retain &data->jack and data->jack_setup remains true.
> On rebind, qcom_snd_headset_jack_init() skips creating a new jack and
> re-registers the dangling data->jack with the codec components, causing a
> use-after-free on the next headset jack event.

This will deserve a fix in a separate serie.

> 
> [ ... ]
> 
>> @@ -549,6 +633,10 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   			link->exit = sc8280xp_snd_exit;
>>   			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>>   			link->ops = &sc8280xp_be_ops;
>> +		} else if (!link->dynamic) {
>> +			/* DSP Bypass link, neither a DPCM frontend nor a backend */
>> +			link->init = sc8280xp_lpass_snd_init;
>> +			link->ops = &sc8280xp_lpass_ops;
>>   		}
>>   	}
>>   }
> 
> [Severity: Medium]
> Should DSP Bypass links also wire a link->exit callback to call
> qcom_snd_headset_jack_cleanup() and reset data->jack_setup = false?
> 
> Without an exit callback to pair with sc8280xp_lpass_snd_init(), unbinding and
> rebinding a component on a DSP Bypass card with data->priv->wcd_jack set leaves
> data->jack_setup true after snd_card_free() frees data->jack.jack, leading to
> a use-after-free in snd_soc_jack_report() when a jack event is reported.

The current code doesn't clean the jack on exit, this should be fixed globally
in a separate serie.

> 
> [1] https://sashiko.dev/#/bug/linux-70cecd60-74fd-40f1-95c8-8dc260e646ac
> 

