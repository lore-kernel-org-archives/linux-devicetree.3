Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485525;
	b=kQB+XF1cV9D1IHvDpviEdtfAEdHT+QlhCmVmTMvPmeyae44UTuAWsPpAEtcAER/FeRW5
	 KJWlGw/smKa48lnua0F2//kwvK7pGc2hJk0K9CORYYaEhyKGaVEQjjJtoYb2iUmHitrhX
	 O6h/bPi1S2XxN1iOHv1bOVU0KbyoRtLAyIBHjTYAznJ3/du0RaGTpgHWWJ8KY46gwzG/+
	 hJ/h3ks1PvHV62u3psTb/XDM2+NFEyMyeErEVkGViLfOZcToqCjFoPFGx0TpTiQoqSUbP
	 y4ootG+lLeAUGT+MIFr72gGNsvhOcTb0M7Bm6A3F2QCZ9r0O8SVXcNsfMzFuIVvdiyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hogL549jM3ExbqUca/Ckmvahf2uy1aT58g4/4SYGND4=;
	b=X3BGBcz4eDohctSeNjzbQTyuKI8cs3MvHa9v+a9QKxjOAA4w3McoOmgC51r2jIv5TiOT
	 pVTEIRyU8wZCuyw8ZMS2tM/EclUAwhtOUVckIjsow05gF0TcnTGy4mf/OAux9Tbocaxgg
	 uwgdJZzZHqLRSQBn1jXjZeKDJCL3UyFsCjijLZ5WCrZ+cUNwn+zPMWWCuB1BNgW4HVvBz
	 qq+Bw6xpzDdGstXXQ63+Vw3jOdw+zPuzC7RKJwkwGQ3Gz+OjfBeeIfOkqrFi4+y+0ZLv2
	 W+cuShIXsUP6jEGkYOO1jiTNcXSgeDC9bMa3naJWe2bclRIRf4X29UglO/g86TYS0SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xlBYgdEl;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1BE606A326
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1BE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xlBYgdEl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so20796125e9.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792485523; x=1793090323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hogL549jM3ExbqUca/Ckmvahf2uy1aT58g4/4SYGND4=;
        b=xlBYgdElvsfRXrajPPDKw8ho4L4t/qUulBARMacoY202Xep50AIKTQZfnoFA9tFwBn
         qglQrZ0O9veXrheQg4PMZO8S7Xv9paZW5avbg3+y664JSKciEOEe9JveNBY2MtlOhn4I
         qVaF7XSH1BW9WTfkpRyZ59fvlpttc3V0vjoW6ypWEOLEecmXsUXaFl0uiYyw/XhPeDPd
         AiJmvQsFqyBLNxuzrKgBIbaXSn+tPiLDzcOaiye7xKzj4nDYjg0vENDXxfifJ0lsLy/h
         hhEquvdzuvvV94X34Xd3bydCN7+Y8fH/b4rOPW2+NHqA53f9gyLFVFqOuZLrZd4y3CFe
         71pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485523; x=1793090323;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hogL549jM3ExbqUca/Ckmvahf2uy1aT58g4/4SYGND4=;
        b=oFwPaVFJ+KEdIDXuKFDi7nrde3jf/0cZnhVhKnlTeCzLDpV7KYFVSO8QSvo/LSqBim
         6PmU5bFTQKB2wEhW6Ffevku+9cBfog9MUWYGJR4ulEXLLtWYTz7xppXTlByba5hfdPt1
         4nx3G/9H3Rgr1TUc0ap7eypTIEWTM5NHhsmS9kB1cDOJK/lh5E05zDsfpK4eJI3JTQCr
         RHcFkw3DcWxfY201nEZzYcfuyyr0NvDEx6NRffxWIPekRnm6e+BVN848WqghmMI7oVgM
         /XEGjlIAW4VaWQBLcf5L4B4WlI28s9dM4pIbiuP4wFXvjcqYrYhAy1eJ7Hp4lDbqgf+p
         4egw==
X-Gm-Message-State: AFq9FYIJvO7W+MHyUWY43Qo79URL398oCvAOwjYdZCBJqUmW4KIq4vXm
	d4yTG8sKNs2//yoqsDvynJu/Bz420Lr74IW7Z2JzQbDFOgTWUmBixN+LTjNehj7SFT0=
X-Gm-Gg: AYBFou0xIPD2Pivk5lsiq4z74GrCh8h7lNVAWkY+jWqSVxL+R8NJK+DWCDYhBYD8/pR
	0E06oD9ZsGTdqbSQaLdcrMdnOW6pGuR2X2eq5q4Fb/E3k+7vjDjcOewN/1Li8XlsqzAxQAzcl0O
	bKbkuBxMgUDYpt17BcSfeQ2WyowKVisSO6LEQPnPA2Y8h+AeF4GKVWZvBQfYyYSJo6LIRs3xBh+
	vW/9KVvQujLe4RmuQADbA1OiQofU1FtRom+lnpaAWLVHDRhJdKX90pkJzXBWOlGsohbG5mJmiAB
	0TqcjYOry4xvUH46T3jKOonaZXeA27AyLgL3wQGvqE04MtdPaMLvh2B1sKscu6BNOi1dfg1tzBm
	nykDf1OnKrpp7Cd5A/jMkifo8Bgt6rN/np+In1d0+5uwKT946CbxgF4t89Ok+sqBBcZ47M/jG87
	S1rW/38sNTHDdPJmBqMB57wHDfuY7IjtzTGMVQN+4Ff92MAQbpRBdTTYnb1iO8HfroUBf0iW2uo
	qm5oU4LXqeJbwI18t3WUm+lccHC1s0So5CqMEPEjRx6daAyGWjx3g==
X-Received: by 2002:a05:600c:46cf:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a1f8cb7ecemr12546735e9.24.1792485522235;
        Tue, 20 Oct 2026 01:38:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e3a1:1a65:a394:be54? ([2a01:e0a:106d:1080:e3a1:1a65:a394:be54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df370381sm163461605e9.1.2026.10.20.01.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:38:41 -0700 (PDT)
Message-ID: <7ccd519c-9c45-4a3c-a0d4-2a082c4c0306@linaro.org>
Date: Tue, 20 Oct 2026 10:38:41 +0200
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
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: wire the RTC
 alarm interrupt
To: iav@iav.lv, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv>
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
In-Reply-To: <20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 23:52, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The PCF8563 on the OLED/RTC add-on board drives its interrupt output
> to GPIOX_5, pin 4 of the P1 header, but the rtc node does not describe
> it. The alarm interrupt is therefore never delivered and cannot wake
> the board.
> 
> Describe the line as a level-low interrupt of the GPIO interrupt
> controller.
> 
> Tested on ODROID-HC4: the alarm interrupt fires and wakes the board
> from s2idle.
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> This needs commit 5831f5fef100 ("rtc: pcf8563: pass the driver data to
> the alarm interrupt handler") in the rtc tree: without it the first
> alarm oopses. Waking from s2idle also needs commit 5b6e2a46b80d
> ("irqchip/meson-gpio: Allow the GPIO interrupts to wake the system")
> in tip irq/drivers.
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 5f15c2299509..25a8a60e152c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -105,6 +105,8 @@ rtc: rtc@51 {
>   		status = "okay";
>   		compatible = "nxp,pcf8563";
>   		reg = <0x51>;
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <IRQID_GPIOX_5 IRQ_TYPE_LEVEL_LOW>;
>   		wakeup-source;
>   	};
>   };
> 
> ---
> base-commit: b44e2be772f866985cafdf90355285069ea68495
> change-id: 20261020-hc4-rtc-alarm-irq-b2b8c68d54f5
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
