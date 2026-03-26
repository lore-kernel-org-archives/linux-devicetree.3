Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5003B391839
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515227; cv=none; b=KFiStQoFhtpZAO6TV9KWcplZeziYlHlBliyECl1KI6LbyfssLizMR1a21v+kNxuwl16AdzbvNGseKMrgTDCCvU35JmngyV3d+T/j66kFuedMRn4CIpEVrRdvYjnCmew0v9C01pfiDx5dxxe7YnEtbASlyCUk4XIOzi+AJkrkxRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515227; c=relaxed/simple;
	bh=zX48RSGJchyr54fW+7YtsUrM88RsAle7VV0Koiwb6Zw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BLpYyWpeL8ZQj8rsrRg93iWwk3PCBk+Rp7qMhSVmDVF5ZZ02A6QEbmr6HtILXVzeDX0FZkCA+sCQkSJUOvwkjwPC8f0IBB7OO0PLWXBzmC3z0aO310lt9IQMXicqlAseFnyMaPrCu6ZnFG2kQNBriRXLYpduiYrodtaPg6bmZtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tq0a9wEM; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tq0a9wEM"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so452494f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515225; x=1775120025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGIQJBrR4L4A7hNhZYj5yBcsB/y/dygFw0rKvJs4Xdw=;
        b=tq0a9wEMAv5nASRpaUFKOoMcuMS1Ek/Ex8jSqGsKK7H0aHU0WTjoY2yO2b3GGwE8sN
         iWTQDt+pSRRPmwMnb0XI82A+GyXx2Ux8SKKQdPttUvu4aEO5/Mjs9tFT6HtVwW5yQnwy
         /d2SZHv6940VxCzXYYkunFYuE2NQmka3ryxLpmuYy5Vm06Bzuzq+FhMfhOzBV7xQ5g8v
         BGfjZ5LOc250IJu99tRDrPzdMKbiBPPGU8zg2liPIDkGfERmV+jzVLAQh+UuLyJ+G76+
         HMtlkq+iLyhPXMBtSZw/bib9wvVnSJ1h/RaWDFfZQKiaLdpY6In6fPipJA0Pf/EagSr3
         U4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515225; x=1775120025;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGIQJBrR4L4A7hNhZYj5yBcsB/y/dygFw0rKvJs4Xdw=;
        b=mmoatcJyGQXqPS4JOgBNzOtf7C/lK4ESc++n3g+rDHPzKvc037kI8vbyP6pkL+8etM
         6/JeYgATUSRzThTkE4VXM6J2KEDrHDymdEgcpB8yhMr56DtSTxbPES+YnB7ppM+MiDCw
         ERoy3Dz9pUELzKVEbjKMo6YIc5vQXoCcLkWwrj0gJ7vNr6N3xIpA7mhCQdhfd8Vlm8Sv
         bYKkxVcIpNF1X2PDTdebuQEo10BQLOTq4rS3zhMrv7yoaI8CSnnRLaGGHi3nnT40TTqo
         qa1Wg7374Z65Zri5/GMCGqL9TFtvNuICukzppged20mHVr5aFh+Kwz9X21wuRMIG1VY/
         gMig==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1FQg0gvFW0cRG1sYgB8w3MvVcQhlutPTspQAJ1Ttne95iBIqJfLQhiGNn13kQFLTLOxrCRiaslur@vger.kernel.org
X-Gm-Message-State: AOJu0YwLDagymRBopfyvWwMdorGAGVwVpucqeM2P/3nHf008HnQ6ehIT
	DzrCugtA9q4FV5CwRE9GW0IwnMurpRkthz69I1FEs1OcF0P1GK2lThHQButWNhUSKwE5vz6zooI
	xVNNu
X-Gm-Gg: ATEYQzw2bTnIStXhDLkXTUuDGSGUDv7J1T7B+3Y1ZIm9Fl3mk5LjiDBC8ePHadZ/VDk
	huExY2J8dx/5foZG4E4+KiaV8MEkYrZ5urvwj0FxJjhjHzOhlo260a0c1VTBNBzqdVwOrFNohzA
	80Yhy4PD9WPa/f69ivYxgn0pYcadUtgFp6NRk+AW/AuDp8SuF6empnDEtyDl2TOyhqqd43dOYxU
	D3SGS5a/qqu8xyurKZqYRAHtaXNZhcxlyi+e9SSrEOnYqOv4+OXp4uckOkvENzJTGBuBOBzs8v6
	u4QXfOcRtPAw4InlgCZc5ACCAbhdzHij0kmNDCTSa0mM6QZE0ubgHE0Yz5idKShIJMee/2rlJ9a
	XWne+klNn4bgud+WWT0YJ9+0fxEMZdS8uxBCPvO6TwFCT/OKk3tIrAY+aiGWMbD/tS4vFeFlgkk
	LZzbPcZYGYOigy9eYjEpXEV5xUsnrix/hOwgcQ/1c0xbGYdAe+29bcUKsZw/YGCz/COfMxjzFN5
	a/HrUc=
X-Received: by 2002:a05:6000:208a:b0:439:c153:ae3d with SMTP id ffacd0b85a97d-43b979fbc99mr1451530f8f.6.1774515224588;
        Thu, 26 Mar 2026 01:53:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e35esm6035382f8f.6.2026.03.26.01.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:53:44 -0700 (PDT)
Message-ID: <f3bcc782-2bb7-44e6-ba40-92a36648d3f7@linaro.org>
Date: Thu, 26 Mar 2026 09:53:43 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 7/9] arm64: dts: amlogic: t7: khadas-vim4: Add SDIO
 power sequence and WiFi clock
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-7-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-7-44c7b4a5e459@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 10:15, Ronald Claveau wrote:
> Add the SDIO power sequence node using mmc-pwrseq-simple and a
> 32.768kHz PWM-based clock required by the Wi-Fi module.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 2450084d37642..770f06b0b16c7 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -67,6 +67,15 @@ sd_3v3: regulator-sdcard-3v3 {
>   		regulator-always-on;
>   	};
>   
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		post-power-on-delay-ms = <500>;
> +		power-off-delay-us = <200000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
>   	vcc5v: regulator-vcc-5v {
>   		compatible = "regulator-fixed";
>   		regulator-name = "VCC5V";
> @@ -135,6 +144,19 @@ vddio_c: regulator-gpio-c {
>   		states = <1800000 1
>   			  3300000 0>;
>   	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +			pwms = <&pwm_ab 0 30518 0>;
> +	};
> +};
> +
> +&pwm_ab {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_a_pins>;
> +	pinctrl-names = "default";
>   };
>   
>   &uart_a {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
