Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA34E39C623
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776686592; cv=none; b=jvPsld1mftu6jAX92YXTmvMC5LoevOmoAiXPvjEoAWZCINcLrNfdx+j0ZxZ8jotXbAx6L9gtc95odeB4oUDfy2syprtVIqnhRxn0ucqWItC+BQPNPnmkdJ7yvJ2FmZhR2GMjLLGzW8PI+dguCEd4J6b2BHrPs+UH4+SLKAMttRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776686592; c=relaxed/simple;
	bh=3NuVQQh4rf603Lhw90MgxAaoTNHWXMr4GTzIfhfVuYU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UjbgF357gR3nQxVKmRXiGl4P7SiYhYWMt3vEBCDNoNcrRD8HRsu24/r90Q+JiO0CB/TBtHezT4pws432IOjEgbKKNQNW5001zx8ImOIYZ1RLoe0rrQMSRMj/aXQfZFf1ufpt+TbbXsM9P9mTQK2DY1ZVT/pAMN4T+/h3/CcUSKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cxgA2t8t; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cxgA2t8t"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso40022245e9.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776686589; x=1777291389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8fwzwhILo+1C84/3tm8ThN3xB60ifomb9gC9Rp9WVc=;
        b=cxgA2t8t8bMc1XLEq13imeCVW1SznRK9SpBj5gtLPLrfkvywPwfkqn6V4goPktZQOM
         0ENjP0mCi1mQlcULdHOsxHce7L4a5WTJXUnBjMFowcjoCtN8IEHfCazITzJpRlfHK5wT
         vHsbv7rnQTqB9Kz023oG9+2HHUEsi6uvLhg1W8eLX1F5Kw0l28/lKHuDZ1Y6TSGjN3dR
         5662BOFKY8UVmF0A1UBLQzjm356PVqtJFjgbyRLO/xLdl//7jF9BcKlgCzEymEYQK36X
         TUf79sGymhj+cg1twK00pDM3NzzpCYZV5XEPnKIazgGJUK8Y5jtCfVb7ela3bQZdMhJ7
         tI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776686589; x=1777291389;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8fwzwhILo+1C84/3tm8ThN3xB60ifomb9gC9Rp9WVc=;
        b=mop8CQ+saB0uLesPL6j2KYIDYNYqDeWygU+ipkCh7hER7kO6l+2Thhwapc5dBTNT7i
         VkkYv6UamwMQ+A8fU99qcB3bXjI+urRif2STXhapd16YEjrLQo8uREJ2t/79dmiW0GUo
         Zgmmq8as5JOFlkl97q8r6DWJoB+ykVElr+HtjYVR+bNHxWCyz8wacQwzwhveshxBLjuU
         LKPvaRlb9Jpy2QH7CHhd8yBeJRBA2x+U1TgT2aehKaPHqNddE+BwjceNSYUrM1ZIEARh
         c/VTiMY7FhwOF+Vokg0H1gukMIrkCVieOetfzQrVhK2QoECW5Hs7pOR5LSABkQG9OL0H
         fsqg==
X-Forwarded-Encrypted: i=1; AFNElJ+H/DGUzyqaGkrN48c3xcuQFuNR3AgP4N8SP7sboZ6L74gPQodXr0aFgCdfdVgrYxhpga4sYFOL8JQk@vger.kernel.org
X-Gm-Message-State: AOJu0YwpmG6MkhUsgzwT1VREKEvmON9IULe/KHEH8JzlHW5vuNZPlg74
	f1tX3QNQ+3nBq4+V3w//At/HyIpmgDnyadFTCFsaWildg84oQip4haFvvCNu03x9yvM=
X-Gm-Gg: AeBDiesHxUfTK7+avnAwmcab5C9PyDpHRM5qDCVLKpWXLvjVI9EohoAzjTB2nQu2eCu
	copmdwDpj0N9b1jgYHjgaLoBRva+6SzZsioGuQHRxT3xCuE7qXbOyxMzK3B2t77/91a67emKqaU
	oVMw85yw4oh8ed3OBGgC63QXdKLJRzyYUEt/4bPr6txKIcuNTvlJhjN7vcvOlXraU4awkytczho
	jVbdl9sKWafOUxWNFrTlnOFkmUzAfeG8oktbwGkhWOGZfcvlPbUInQXdvTWZfbj9ssbaaToGh22
	obx7ay5w5DziKwWf197SRK4hoagWCIc+iId9XskEJYZeuwgWp2lU7PO0Nq++dbg+kdefL//Jdhu
	2qYpCEslHhsowDNQ6haW02eQBxRmX7vMAbaqP2/Y9iMC0bO6oYSazvH5i0arc1roUxUQXx83Lyi
	b2pyvFuL72BF14WhVuF51tvWVmAoQGqgQhORx3X+oN6oqXHCAKOmBSpF3iSrs71IAav5tZNcW2/
	2h2yMHFUm8aH7fy0A==
X-Received: by 2002:a05:600c:620c:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-488fb7786c2mr199792815e9.14.1776686588896;
        Mon, 20 Apr 2026 05:03:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:851d:cf13:ef26:f254? ([2a01:e0a:106d:1080:851d:cf13:ef26:f254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7aa593sm89632355e9.24.2026.04.20.05.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:03:08 -0700 (PDT)
Message-ID: <11812932-d985-4e4e-ad6f-28e1badee216@linaro.org>
Date: Mon, 20 Apr 2026 14:03:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/4] arm64: dts: amlogic: t7: Add UART controllers
 nodes
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
 <20260420-add-bluetooth-t7-vim4-v3-2-669cd2530ae5@aliel.fr>
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
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-2-669cd2530ae5@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/20/26 13:58, Ronald Claveau wrote:
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
