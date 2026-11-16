Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815963;
	b=PTWzt+6GAeGcoba0ZJT4imAtfP0GhJOTE0cQ+BpvQC8dzv681aVHURXqjJSP89SapJqX
	 ls7JqD1TXZujkANYeFAHGXm5mm17PqY2p3zkJsX2crF3oE4iCAivsSNclgA8ZTVJTK+yE
	 ESk56jLHyRS5lknae2/9E9KNa9VZzsygqBcUkJe2mEbB36h9jH42kxWBp0JI7UuvY1S6O
	 2gkkfRp52VHVyHMtR+yVmrnJrRaBy9Nr6hv6fp27gn9xz0jOKakgWDQm/8SJ32387bY9i
	 bWrK5xmc/c2qxhXj2eFPTSrV39MPSsYVKUFYvsk8mg0qAF2CNXk97ZEwI6ZATR/a0OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
	b=F4TQ0e+12Oy8+2P4AOCCUUQasZxUaV5UzRDac9+GCcKfi8m1IXB2fFTLiAP8kb/vFZH2
	 grB0jNoFRTRWndKwdFPb2fsYz+7iZ2khAFqyWHgHkfFFvtyROsQg7MIayQ4bW6e3iZCl+
	 1nOoophF21fcnMggZh+GpF0ZrN9VaHxKZ1LLEvJ5qaAs7iqQbfU4Ycwh7/CEphrhd95HI
	 DRvlQw9sCfAmYcwIrJipPrkqIJGsyG/4Txr53APBo0yev87ZVg9hBr0HXKa2w7DK+D0kV
	 3ePp/6L9YKh3tsV4fkM1/1D1HWRLuQ2IkPT2QKtVNTRifV2rISPK8Ul8KNQJz1wjpYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOpUDwoG;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD51A606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD51A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOpUDwoG
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2204169f8f.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815961; x=1795420761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
        b=nOpUDwoGzk/wHg/Bp+Of2YUIaxhFQrZZEVyuZZ89Y6lPT0VGYBaoVPrVXvIZU26D/U
         yBlImfvcXBKEEiBk7wXW0TRWN45cPYMAMaNZgt3gjN0rKvuwijzev03cMfsLdQCRmm9e
         WCYwaYjkWNwvoCPTZnCWV4NIFVJJQljouOD4jbVG6Z6c/Ho8nocRZIIvTUQKKntA8dtQ
         jILjnRi4/thV8WEzDF47rMw4lgjkfaUV/t+uN4W5+m9jFan/uzPUgNZoOPqTEy5dVyQe
         kDp2pd9Hca59jbHV44SXxm2yPySWjxFxovUaW9SIEKbDRlYr26yL/AJAyYOpoitJxeot
         1rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815961; x=1795420761;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
        b=AaRhOHSHDk8eDoEzjUm8ujYny4LNfD7d6ZXyrXSfpil1Tw0e3oeGKTETzafIhA75l2
         Io5XiD5RrOVRZxm4gcaT5cZmzEJ4WkBTVV0mxOHPtH11AdPmi74mJKBL8VNFKYCPhyZC
         kbh0BQEKB7qiKg/HS90Pzk1hBZLtjuGaRXPAJ1+ChMwtHtBdJP+gqkFzt0zWAedBjcES
         AXQTF9cQbxzlhR5iLLfsvOb09BmwsRwi+coniPlnfUXhxueZTRv4Jnuoxu5+PmN7q9ka
         +Y3nTNdpWr5fW05P7WAQLkym+penq3xuZwhIRGFaE5YLIXPKWneNm3b9C1yAaDL687Of
         r0/A==
X-Forwarded-Encrypted: i=1; AL+hErH7KMl2LmMjdAwP+4rqII90wRNmpFVuiGfvzvs3aCPBOkYa8BEpSkkizskB2guF0cvodoXC6SfxDBGr@vger.kernel.org
X-Gm-Message-State: APuU4Z8HxIqVgEEo4f2W83Mn+qljZH/nW33XUP6mzo6IQUaiBl5px0Vg
	B5PVd+9kVp9ft/AbfPLDKmGMnkCWU5pxCf1qN+P8xiZMu2z5NuLEsXy9ILSbA6dSoHgeTSZWtBv
	adYaDcOs=
X-Gm-Gg: AYBFou3oFvL6coy+hYaNsZqZRmvmYKEicwrGOSHc+mDfn0mfW1lg6JEJcCd16YpBE4y
	p1SaszQn7X8DmciPgoEic9zcR06tphd7jaZ94hrqrEPHTJ0UQdBUNzM2xp+P6MoZF8v2+vCgCPs
	1Bgo3qFmstnuIPfkxF2LYHnkdBH09FlcYrp/5UX3i3itXTzP5ecX0bsgo1AIsPLU0CCpRjZn/xk
	FowltHvhE4Ff7ePAFD4n9aGAMAwBhZ+YvJcGU82pvKv8oJiaMh49kYkLri9iYNFXMEA284/IztA
	7thpFVYHN36FI6S20jI8uFALr+XOH22VatCQbQK6TiK752z/vhjAX1/jU43Mgftlb72tNKnwZCm
	8tN3+pfn8WCwtnRXpj6ccOjd+RmAQXFLbXOfzQd9IMR0f4lnA4vLbhEDMC6fKHYPtyo7qiHHXaD
	Tu0vuaazdo3aO8ijuKBCkCK6ffMA3+DZyY23zSYJgm7IydgMAZtfYwNIJTj6q4TRCAC+21/fVif
	W/fKsYAAi2hWY5GIVIfnpNeBmu0/f9Zb5Px1tFmBhPwrhs9Yj33aCcVh7LKi/31ojWI9cBuZsL9
	blgql51RupPpHjM8653EnzXmb2axMhafl/vE7xaMaINMP8yzMrgHYMbJNfqSErUpXvVWhYbyxFj
	lR7wMPoKv
X-Received: by 2002:a05:6000:992:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-49c71e3db14mr19030193f8f.33.1794815960914;
        Sun, 15 Nov 2026 23:59:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm20167439f8f.46.2026.11.15.23.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:59:20 -0800 (PST)
Message-ID: <23f7de38-a5be-4de4-b026-e97deab9535c@linaro.org>
Date: Mon, 16 Nov 2026 08:59:19 +0100
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
Subject: Re: [PATCH RFC 17/23] ASoC: qcom: add SM8650 LPASS CPU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-17-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213544@kernel.org>
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
In-Reply-To: <sashiko-outbox-213544@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ASoC: qcom: wrong lpm_type for lpass-rxtx-lpaif in
>    sm8650_lpaif_mi2s_desc[]
> - [Medium] ASoC: qcom: missing set_bit() for RX channels in
>    sm8650_lpass_alloc_dma_channel()
> --
> 
> commit ee9ae911e7b58d190ad971326ccfe23116c1a06b
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: add SM8650 LPASS CPU driver
> 
> This commit adds the SM8650 LPASS CPU DAI driver variant supporting MI2S,
> DisplayPort, and codec DMA audio interfaces when driven directly by the
> application processor.
> 
>> diff --git a/sound/soc/qcom/lpass-sm8650.c b/sound/soc/qcom/lpass-sm8650.c
>> new file mode 100644
>> index 0000000000000..42050f56a4847
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-sm8650.c
>> @@ -0,0 +1,651 @@
> 
> [ ... ]
> 
>> +static int sm8650_lpass_alloc_dma_channel(struct lpass_data *drvdata,
>> +					  int direction, unsigned int dai_id)
>> +{
> 
> [ ... ]
> 
>> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +		chan = find_first_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
>> +					   v->rxtx_rdma_channels);
>> +		if (chan >= v->rxtx_rdma_channels)
>> +			return -EBUSY;
>> +		break;
>> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +		chan = find_next_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
>> +					  v->rxtx_wrdma_channel_start +
>> +					  v->rxtx_wrdma_channels,
>> +					  v->rxtx_wrdma_channel_start);
>> +		if (chan >= v->rxtx_wrdma_channel_start + v->rxtx_wrdma_channels)
>> +			return -EBUSY;
>> +		set_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
>> +		break;
>> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +		chan = find_next_zero_bit(&drvdata->va_dma_ch_bit_map,
>> +					  v->va_wrdma_channel_start +
>> +					  v->va_wrdma_channels,
>> +					  v->va_wrdma_channel_start);
>> +		if (chan >= v->va_wrdma_channel_start + v->va_wrdma_channels)
>> +			return -EBUSY;
>> +		set_bit(chan, &drvdata->va_dma_ch_bit_map);
>> +		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +		chan = find_first_zero_bit(&drvdata->wsa_dma_ch_bit_map,
>> +					   v->wsa_rdma_channels);
>> +		if (chan >= v->wsa_rdma_channels)
>> +			return -EBUSY;
>> +		break;
> 
> [Severity: Medium]
> Should the LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9 and
> LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9 cases call set_bit() on
> drvdata->rxtx_dma_ch_bit_map and drvdata->wsa_dma_ch_bit_map before
> breaking?
> 
> Without set_bit(), channel 0 is never marked as allocated (even though
> sm8650_lpass_free_dma_channel() clears the bit on close), so subsequent
> allocations from those bitmaps will hand out channel 0 again and overwrite
> drvdata->rxtx_substream[0] or drvdata->wsa_substream[0] in
> lpass_platform_pcmops_open().


Good catch, will fix

> 
> [ ... ]
> 
>> +/* MI2S mapping over LPAIF instances */
>> +static const struct lpaif_mi2s_desc sm8650_lpaif_mi2s_desc[] = {
>> +	{
>> +		.reg_name = "lpass-lpaif",
>> +		.irq_name = "lpass-irq-lpaif",
>> +		.lpm_type = LPASS_LPM_NONE,
>> +		.port_desc = (const struct mi2s_port_desc[]) {
>> +			{ .intf = 0, .id = MI2S_PRIMARY, },
>> +			{ .intf = 1, .id = MI2S_SECONDARY, },
>> +		},
>> +		.port_desc_count = 2,
>> +	},
>> +	{
>> +		.reg_name = "lpass-rxtx-lpaif",
>> +		.irq_name = "lpass-irq-rxtxif",
>> +		.lpm_type = LPASS_VA_CDC_LPM,
>> +		.port_desc = (const struct mi2s_port_desc[]) {
>> +			{ .intf = 0, .id = MI2S_QUATERNARY, },
>> +		},
>> +		.port_desc_count = 1,
>> +	},
> 
> [Severity: High]
> Should the lpass-rxtx-lpaif descriptor use LPASS_RXTX_CDC_LPM instead of
> LPASS_VA_CDC_LPM?
> 
> lpass-rxtx-lpaif is in the Audio CC / RXTX domain (clocked by
> audio_cc_ext_if1_ibit), so setting LPASS_VA_CDC_LPM maps MI2S_QUATERNARY
> DMA buffers from the 12 KiB VA LPM region (va_cdc_dma_lpm_buf) and enables
> va_mem0 in lpass_cpu_daiops_startup() instead of using the 64 KiB RXTX LPM
> region and audio_cc_codec_mem0..3.  If MI2S_QUATERNARY is enabled
> alongside LPASS_CDC_DMA_VA_TX0, lpass_platform_allocate_lpm() also fails
> probe with -EINVAL because VA Codec DMA already consumes all 12 KiB of VA
> LPM, and if MI2S_QUATERNARY is enabled alongside MI2S_QUINARY without VA
> Codec DMA, va_cdc_dma_lpm_remain underflows and assigns an offset past the
> end of the 12 KiB VA LPM buffer.
> 

Good catch, will fix
