Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962447;
	b=rn6PYek2jtHtIO6veG7LVbiFHwUWqtxIKEX+W6JDt34mnkEnpmicbozei5g5sSuYhxaF
	 Oa6ZX1peXrVCfhzYnKfAxC9B6SL8QT2iR8bd3jnISF5Xl09bAtMk3z7opp+gpJ5wY2ve5
	 Ojv+pJZfLHi6yuAmy64vm8wh9MZzY2M+4XbkQYbO+t05x9cAoT5cfzdPM/Vt384+Pk+vX
	 ZenOHKD7b6H8Lti2i3YBQpdNmsGVQQF2JSuzliZXUMRO5viWu/VkLzJVFDa2L5YarxdPV
	 ZSwzHm31Oil7G9sCxuPG6zYQUqDs7iiYxtkPhWXcin3XAPvYRxoC1A/1cMh1l4/7K8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
	b=s6WWRM6IPuz/e+pQuI5DhjwOoL6S6GCHFS713eRMIKcmYOWB6Abt2V3YQjPIGTRlF70Z
	 LvVmkY2Zr7BmCryGmaVRVjoDLMQk51avfSyRKCiVaUVaQb9OsgySoNzV5gaLp7FTKV8pa
	 aT36d244jqcg/9dfsDUgsFQ809MgGgNwTqYb0GX0OTSQUNpC6u4ror3Ex/OytQXiY1mPO
	 TOUWnp8VU3er5EOuRCW0kjLl9ZQjBWYe8aNVaImlnlDFFJla+r2JwHPSr1u61nnrGNhn1
	 vZ7Yh/e/0MRJOL1V/z7AkjjBAOdNsA9/Cgh3OZSjXAhPxKE3xwSapP2od/JtIVHjsSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TaNbsC+d;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D2D606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D2D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TaNbsC+d
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso3053665e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962444; x=1794567244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
        b=TaNbsC+dyq0JzLyNjniWU38zx9z5v+s5yYYVPv7vb0i+ViWgxzr66yn/GBP5j2Apxy
         309TgoUbdRYCWGFgMuO0h2aaRvbwphsSzZbgIdR3mZOjbVqI7uJMM5JCUGuVlGkB6WNp
         t6Mz1Z+lInYE9tEGkr69bsUgGJIMVdcva3bUZwS55lgkC5hdH+gafIPuQDN+5lVu6qDN
         ZpEDNl9a1zH4+QvRGgXDl2wp2xnzZJRZBvRWWhVM43Q2rVhdeztfGARNhQCyCpckYjAN
         FWz8W7i1TkqVL6UMWBmDWjZTlSZhbh8gY0j1mTVTQgY2GqVLARyzvWF9ar7TPlnAAC8m
         wO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962444; x=1794567244;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
        b=hSsXgKgpvdpCkgrvuC7Pt5fxpA95gFcnl+Zcy70TKUTp19G3ct9Lk1lUmzVhd4cG3p
         DqIccKpSmyJMVepRqgF2rEVp8kfrkthJ/WPbyzeB3ug4N4uxf13ZAIsQIMGIExkMgrAY
         maYOT4Q3oHXGect4uGPTVNTP7g8vgHp9ww7tdH2WIEM4WzKVxhy0sdMlHrzFGyDxJQ4Q
         1Tg73mq9yZ7hXgyNRH79xiXmksgW2yE2G2XGFI3Cww96p/oEXt/njbLtvcrCjOLH8+CA
         qHL0Dck8uGgm+/U/ve+FcmES8mgDwLl/C4TBKGeeVUfyO+xmI2e4gdP7slrv3bAJPvnx
         Dzjw==
X-Gm-Message-State: APuU4Z+bJvO04kK0DkdooBGMLLWxexwazWgByF/wOf61lotYQ1ZQpgj8
	3FjZwk0zaSy2dHpCW9AXWGZpemvE/UjYB5mtQPowtpPjbpBamK6gdeVeh9UCoOgNbXxWz6s7yZk
	xIoeC
X-Gm-Gg: AYBFou3jNfwtpCvH9yliYcorr4rxgdHEadEuHUpjufDyzjQD8Vnv9bF/ViiGOFk9bww
	h1EzGskardVjwE0nqxQqeUEBXmTnIZdHE9Iz+eH2OCVTgjY0AKZgix/vj5iCwTHd5xIy7DG2uWH
	uwKMO52dzUhdsO1D1gDOqOzKU3J7KaJ6ZRZzBvvFcSy58nkS/tCz5UL5y81gxg1y0pUA730pyzT
	S/OPFpPFhKRw71F7Bq/6Fb5LAj3k8ngnuyWkJ7XIdvGljDdB1RizDFC4uf4AyUprw3OPF+XzN12
	dguA2EYyc6DurkcC5KaBwXetUENHbO7q6TlTw43cyXeRzQrVN5FKiBmP1rcg3xVZv4bOyhnR6OY
	wbIbwRkeoEvWAYugRrgLYxKRmw889euINIipEiH3/zIuvB/u65Ni5SB8evvUd6cm99DSspH083u
	nr2/VOfApgenAaispx8XGEh0Bk1K9HGJPtxL/qiDF80mkK/WL/GahpyYubpv/Fgyw/vLquM3Vq4
	N+fzQOXjhEXJUCkCVutx/c6aY4VjMimj1ud3YTZ1N2152TRkiMHgW5HNykUiHsrIorvmmzKLBVl
	shSEtn9ErINnfa6UHN4fTew1QGvyjTk9PEaIJ9UXCOVuEgSRlO2nDmDGG9qSXekvWAlO6wL22rI
	s1/PEmt1J
X-Received: by 2002:a05:600c:8b33:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4b6e0edffd5mr33716705e9.35.1793962444315;
        Fri, 06 Nov 2026 02:54:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4932901d9c9sm2031660f8f.59.2026.11.06.02.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:54:04 -0800 (PST)
Message-ID: <608dd5f2-4136-4f3e-8546-2242f43cfbaf@linaro.org>
Date: Fri, 6 Nov 2026 11:54:03 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/10] arm64: dts: amlogic: meson-s4: add the PSCI CPU
 idle state
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 11:46, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The firmware implements PSCI 1.0 without OS-initiated mode. Add the
> core power-down state the vendor kernel uses (power state 0x10000).
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 675db02a8d5e..57270fbfb4a7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -22,6 +22,7 @@ cpu0: cpu@0 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -36,6 +37,7 @@ cpu1: cpu@1 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -50,6 +52,7 @@ cpu2: cpu@2 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -64,6 +67,7 @@ cpu3: cpu@3 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -82,6 +86,26 @@ l2: l2-cache0 {
>   			cache-line-size = <64>;
>   			cache-sets = <1024>;
>   		};
> +
> +		/*
> +		 * The firmware reports PSCI 1.0 without OSI, so the platform
> +		 * itself decides how deep to go and the kernel only has this
> +		 * one core state to offer. The suspend parameter is in the
> +		 * original format - bit 16 asks for a power down at affinity
> +		 * level 0 - and matches what the vendor kernel passes.
> +		 */

Drop this comment and move it to the commit message

> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep: cpu-sleep {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x00010000>;
> +				local-timer-stop;
> +				entry-latency-us = <4000>;
> +				exit-latency-us = <5000>;
> +				min-residency-us = <10000>;
> +			};
> +		};
>   	};
>   
>   	timer {

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
