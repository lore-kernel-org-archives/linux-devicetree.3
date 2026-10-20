Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488002;
	b=nwzoWRoLzUCkO1UjCIKh2GZH1vduUM4a7HIMOM91v7hNbWhdR2pcBGqbAbeF1IPsXWuH
	 qu7pEdie+2Def7Kh9unsnctzH7Mi+tCp48E2YIg1qAUVztcYayWimhdGChOC6JAMNVkzL
	 7T4XE5xRo5D3nSKfp+21dLJKWXgTv6OaqwO4qjhITvOGM+KLX6bjo+E32SQ62U2SKPzDD
	 OmGUg8Qg+JY3tjyI6klGewZ+NAcdTqF5jPJWApN5XQ9ZRGqVzavYZByyNHjafqocZqMdP
	 NCxd6HXlRp20NxcgoxusJzwQgm6mhnBsCFuhX6Y/edt7GC3WEEG0yjEqroIX4h0WNrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VvtetNybFvpR2bcqOeI5rfwt1MRTMkbqxUE2U+5+8c0=;
	b=narTUz+OGzvmoZBTsicxbxmwbc/m1ml4NfFNS0YVsOABkcKTD6/kVxCD869MXdQyAYEW
	 Oc1B/0OG1oWElXz8fshekPQBMRm4lDPCAYXY3YCuwpxQZwWXMMPHxvBLJDsKHZ69jF5jS
	 2yL3/Dgd4jiAUmT+1GPbmxF3BtCxOMgI3gxiHlQpGA4TJaybJ9bQCxfqlWVx+F4qPY0cH
	 tBB+M/rMQ6zpYFecY4rJVBH7Aspd80vZ+Xh/39mCWYjf9thEFWEhPcb/K8niLH1Tzdi8X
	 OvhMjrjpVekl9SBlgOaucJsCv0avdGPIJ2DwQq/WWFk3tAkpN3EPejmnLfZjAW8j94g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="rI/aYFEJ";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B5606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E62B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rI/aYFEJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so22415585e9.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792488000; x=1793092800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvtetNybFvpR2bcqOeI5rfwt1MRTMkbqxUE2U+5+8c0=;
        b=rI/aYFEJvfYmrkEMAwT9ZLOtYYvsIN2RzloIRTCc8l7swAy7LLLpN28HihTkCBXvPh
         +Mdgk4fDkZuQjt391FMat60ZEYACOcoDWDSMUjaw+qaC4HDH5HQFk5sVcn5jUw/PynfR
         Twms6EMcr+RogweQ8HSfe9JMTjYkbT2LMlDy5SLmwMXGoSL6gNQsx+fAdcF7cvb2kdc8
         rhxKkmz2Z5iS1pubznLpIKpbGZgl9HijlQhMzUGiKb7zJTm4dL/QtbS/wNwthIHQDNOF
         CETV9wgcrIYx/yefAXaNGs1jI+Zbyk6nAsqpoPVN7Ym9fmeVfgx71/KL3HR3lPw3kuR8
         8gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488000; x=1793092800;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvtetNybFvpR2bcqOeI5rfwt1MRTMkbqxUE2U+5+8c0=;
        b=snFBLCSjZvz/J4golaXZ5BVwXeWiDjmlW1eNqn//W3MlBVeHaF33iYtVvTulcL2002
         vG44/EbeSEJw/HXXzGc2YSnQHmVxY4ysWSoj86Rt709CXVPepWh1Fc5bNPrpF0NChwxj
         xrrQnx06S6MhutRbhRbXytpbx/8YgXQvts/o2fogpITWtcfVPOm6OJk9eW4zsud6GjmN
         V4V0c9C24N3mnUDENMr0LYe8Pxl4bTHPvJ4Egv6nW3omeM5QTldrAmlScxtMhgOIhgI1
         CFP17HvtlNnfGQHn7+WNVpEweiU8fTybHp2Brd7aInprAI22LlfEX8Xe757YpM7IUSBJ
         X+PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxZovQuWwt/stJhElgLOoAkdsL9gY8pC34s0TqEyvMKnpKxBBVgHe7q6ATrk0euWpMS9oLTswl7HwJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLHhDAgdCtrJF3qJ9aoGMtDyIZtFrKQdsV/gy/SZzOGAcLIC+yI
	FTS33SejOtr8EP0xFG0ctQdAtDE5uiZXwcm8ohRQNSkpwF1jFhaPG98TuJm6mwZ0FEI=
X-Gm-Gg: AYBFou1ENczRAHIfBkf2jV6JQCVcXToS2yEZbON2PXmAi+lnL8NCCH+neaC94OrX7Ki
	2ZkUZ7wi2Trzct3V9UT0ZPrFtmK5AuRWrd4rVGrIbQsgRKtuF4RsxWM2zApuIb/g54nbfEgq3dA
	q4U9UjUayBvKHpCvBJmwh0ijz9gfUnKUAIw8QNY+rXHWyW414g8daTdMAys4fqGCGhEwu2aJKFd
	5hUiRoxf5Grs9IhcBXsCgn5oXWQiUMhGPEMv/CHRBAt2MhkTWAoh/tZOLgYxwNDNgyb7kApn0wc
	s7F6RBcbJ5VnfdvVusWIhGoiDojvfMShvNYO9EdLjEYgomnxdPLhDSdeqxvqlSMceTnIWDP5ij2
	81c+dEJ67UZJFVTm1696V5Cl3IZA78skD0YLgZmNK/E78RGxQmyvsCXhWgSR+mUVqLFSYxNNryK
	rp4+qeHvV5DftmRNUPNRf1zbzHrdKTYyG/hVLPNXBV7q1zcN+O2ECRui1dl3inCFykzDpyfusIi
	S8YQ6/niLu5Bmm3MalTqkKfY4wpckc8Yw3mhvx7fb3rT1Bj3UJAByQ=
X-Received: by 2002:a05:600c:3baa:b0:4a1:e586:6328 with SMTP id 5b1f17b1804b1-4a1e5866352mr167712225e9.12.1792488000132;
        Tue, 20 Oct 2026 02:20:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e3a1:1a65:a394:be54? ([2a01:e0a:106d:1080:e3a1:1a65:a394:be54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbbb0sm4872571f8f.5.2026.10.20.02.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:19:59 -0700 (PDT)
Message-ID: <fbb6c91e-cf8d-4bba-82cd-57f0d1b2c698@linaro.org>
Date: Tue, 20 Oct 2026 11:19:58 +0200
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
Subject: Re: [PATCH v2 3/4] ASoC: codecs: wcd-mbhc: guard against NULL cfg in
 typec_report_(un)plug
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261020082631.1509275-1-val@packett.cool>
 <20261020082631.1509275-4-val@packett.cool>
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
In-Reply-To: <20261020082631.1509275-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 10:26, Val Packett wrote:
> mbhc->cfg is only set by wcd_mbhc_start() which is called by the codec's
> set_jack op. wcd_mbhc_typec_report_plug/unplug are called by the platform
> device's typec callbacks, which are not synchronized with codec ops, so
> a hotplug could be reported before set_jack was called. Though unlikely
> to happen in practice, add a check to be safe.
> 
> Found by sashiko-bot via review of wcd937x Type-C integration patches.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0c105997eefd ("ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   sound/soc/codecs/wcd-mbhc-v2.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 850be84d65ce..fd40c1686d66 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -594,7 +594,7 @@ static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int irq, void *data)
>   int wcd_mbhc_typec_report_unplug(struct wcd_mbhc *mbhc)
>   {
>   
> -	if (!mbhc || !mbhc->cfg->typec_analog_mux)
> +	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
>   		return -EINVAL;
>   
>   	if (mbhc->mbhc_cb->clk_setup)
> @@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(wcd_mbhc_typec_report_unplug);
>   
>   int wcd_mbhc_typec_report_plug(struct wcd_mbhc *mbhc)
>   {
> -	if (!mbhc || !mbhc->cfg->typec_analog_mux)
> +	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
>   		return -EINVAL;
>   
>   	if (mbhc->mbhc_cb->clk_setup)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
