Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C81389116
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674864; cv=none; b=BkpDA2T9oIhZUvol+vOvUx4vTDMdDYpF3UH0er9U7X1F7z5vrM+xM+H+qhkv0L5CiDtvuH0KwJ9SLW6CeIzfZoLTPHD4tx4VTh9waGH+X4qGiG4jgePrbTbhxF40MrtkZQq/QrJQ8NxVmEFNXakOLKBYW8uT62pG8XtOljhgehE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674864; c=relaxed/simple;
	bh=XNaz9AkZvYJdMfgUKEsBozfQCPVgljcFXRA4d8GnHZc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IQW3onvNipatGb7KcbEVlkvF6squf3Xx+vhd+Yy18OWFfPKoCEtrQvIiF6XIXzLPd9tQjng72uH1aRquO8n5Rc59zsYH/BSy2d2tZmyojsdPvkHGy7yJMGCKBYRLXJfg01B65Ec1xGtjRHFzcdI6xyoY32z0fIqjb/4RfD3u77E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S6xmskah; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S6xmskah"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso37937675e9.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776674861; x=1777279661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4gP1X/1RVo+LT2tXlc26R+u2cPe0X8dceny5kiXZXs=;
        b=S6xmskahSLBAAp00IUoxtb7tVHbIObW6RDGLAEUAxm46ECunuU5jUelCTMxfIvT8k1
         wlRT5QySDSfjN87037fosE8tMFDHhL4QusF3HLcI3J72c94rnsoqFh0BzsRPW//FrAzB
         qffOqPfm+dS18qM9yWLhpFBLQ1G8i5x4yQ51DsOODtQfD51Pv/5+xoHFWYAtKqpZRE+X
         XbYatGhmM+6Y874naQ0AfnA7vR+nWordfo8ErXRDAa8GqAj5KT3FsI40+1X4cx9Nax85
         qesn+927k8QCOGy+3As+bt05KrqyLNwfzzmBFl9A2kPeCOSVEvFJ3WODoMjXMyGN6Oke
         A16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674861; x=1777279661;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4gP1X/1RVo+LT2tXlc26R+u2cPe0X8dceny5kiXZXs=;
        b=PcDe5fnGrgCaGwKG22dO9neCBJykL4sgrU8+e8VjLtSeQyeiP1u9sFh+T1zsKEGYbh
         NC9izTrU/dkZMEUoqD2OOGrRl65zELBjX6fE+BTDgARsx0bIf3tM2bMIKLXjHDw6/Hrn
         xw2CKgNEimcKiz/OizlwS8BAsvYfnBQZo0iPi61m7UQArRoEI6C4nzywd3VTW2IwzJ4N
         bTbaH+0OLbvcEW47FwV4C2RNNoVgD49uAQ3M68kzu+y1xBoRWFYdW0ZLO44WjClMEV4f
         CLOTGrRyKvydEX3gD6XKU0XSkF9n/JAxTU/E9MCnnsiKq+G8gkR0MEF+VlYy8B2okwLi
         PyRA==
X-Forwarded-Encrypted: i=1; AFNElJ+VL0d0Q4sH3tf5OYaMBax7gW4029SoL0J/MiQHTQwb1oepJtsQJzPY+98Y/bJmIwn2sgSebU0W2V+g@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ttWu5Pyw0jen/FVSUHV8z5YDoXIMhzvxgDYqWkRpEUvvKW3H
	Ff/H1uqCKPt5iKTSMj0RG+Q+//vKJCAiZHLQx9G2dR/l1xMGJFWNk5OWVG2FRTiM1a8=
X-Gm-Gg: AeBDieuhGem9IVgZf/N5MsTvFZuS1qrwCwJsoExsP9j02RITXm3OgpRvAkoQcbl+U0F
	HZ91ODeRGkmk/Encq4+Q9757ecApXvdW7L8eVVonB0AJnSAspxn3+cDXg9ocesNafQpwPvFHCYb
	Yq5ykWVMAlkNL4oRInL0G4BFVCnvLnRUJ5hBCwkLnYtaRIk73sqgWnO90GAPbhPfam+jIzUBrZr
	PqVbarr/drUbjZEcGKOgVOcxAk/HzBZNMnZdpDdh0qZOxjf8DOFUciqVhL2uiJ7lbRTkyvcpbOY
	XTwql4fmXxeYvgpWPMPgkW2JvDTgozXlRud7Bv1kvdzcXVRf2QgqsD8D2cCCONoL9E4T6zHbjmg
	EBCKSZY1S6Rp6bBo3sZG0r6tO4Xunr+WevoooRjoYQI80DVhgoRkIdDKcNKtndXvpgG9VBp2kXU
	rkEpBPuNFRaQEI58yy+VWPegll7b698vQSbSL0zxf5ZAk/yxkLgnANnFY7bBhy0h2hVTRFMtXTT
	6YSz4ho4FB0tI9289mmAxD4pXS2
X-Received: by 2002:a05:600c:890c:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488fb7389a6mr137523595e9.4.1776674861197;
        Mon, 20 Apr 2026 01:47:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8290:9fd8:8af0:67dc? ([2a01:e0a:106d:1080:8290:9fd8:8af0:67dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm11193695e9.23.2026.04.20.01.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:47:40 -0700 (PDT)
Message-ID: <e055b694-3e3e-42da-af54-586ef180b746@linaro.org>
Date: Mon, 20 Apr 2026 10:47:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: amlogic: t7: Add UART controllers
 nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-2-9a57098fd055@aliel.fr>
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
In-Reply-To: <20260416-add-bluetooth-t7-vim4-v2-2-9a57098fd055@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 10:54, Ronald Claveau wrote:
> Add device tree nodes for UART B through F (serial@7a000 to
> serial@82000), completing the UART controller description for the T7
> SoC. Each node includes the peripheral clock.
> 
> While at it, move the uart_a node to its correct position in the
> bus address order (0x78000) to comply with the DT requirement that
> nodes be sorted by their reg address. Complete the
> uart_a node with its peripheral clock (CLKID_SYS_UART_A) and the
> associated clock-names, matching the vendor default clock assignment,
> consistent with the other UART nodes.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 61 +++++++++++++++++++++++++----
>   1 file changed, 54 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 4a55d9641bc9b..81c26b1e3e7a4 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -577,13 +577,6 @@ gpio_intc: interrupt-controller@4080 {
>   					<10 11 12 13 14 15 16 17 18 19 20 21>;
>   			};
>   
> -			uart_a: serial@78000 {
> -				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> -				reg = <0x0 0x78000 0x0 0x18>;
> -				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> -				status = "disabled";
> -			};
> -
>   			gp0: clock-controller@8080 {
>   				compatible = "amlogic,t7-gp0-pll";
>   				reg = <0x0 0x8080 0x0 0x20>;
> @@ -713,6 +706,60 @@ pwm_ao_cd: pwm@60000 {
>   				status = "disabled";
>   			};
>   
> +			uart_a: serial@78000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x78000 0x0 0x18>;
> +				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_b: serial@7a000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7a000 0x0 0x18>;
> +				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_B>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_c: serial@7c000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7c000 0x0 0x18>;
> +				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_C>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_d: serial@7e000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x7e000 0x0 0x18>;
> +				interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_D>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_e: serial@80000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x80000 0x0 0x18>;
> +				interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_E>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
> +			uart_f: serial@82000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x82000 0x0 0x18>;
> +				interrupts = <GIC_SPI 173 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_F>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +
>   			sd_emmc_a: mmc@88000 {
>   				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>   				reg = <0x0 0x88000 0x0 0x800>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
