Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B2940A942
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227647; cv=none; b=eN/l+20oYZ1bJRHUBrosHz00EdiM7hC+oTRk7Vrw3ziha3O33HUnMfAmn5UMONxtlTgRz72iS2On2YIkCEWBQ4xV+TtGCCU/kTcjljZics/zwqSlRxX1ttn/m1dwzJGHLL0JZkWTq7cJFB+CjBbDWb1oYE9y+7zd6E7gTGzmUiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227647; c=relaxed/simple;
	bh=2ujiZP8xAWlwNE7pj8FHBsSfWyFZ4r/pbEfk9AmrRZo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EVtJ3StkZCa27lS8FhKK2KAEiNWR13bHBl8Q+mLagfxx8Y6EhUgwKE/nQZLN0ugNLrZ0GNQqV4Tk7kg6DjncYr+CX2GQGCzQH+HY8huoMdspp+nQ4+gMx3H2TzPN24LDUITx0xH6nFjR2WcNzsZ1mYhBdb2M14ZwH0Z1Gs4Rlzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7geFbtl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7geFbtl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f6de72faso5306535e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785227641; x=1785832441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhUcXStbQHEQGgrql9pf04utNrK9UGJvJvDDzUdzIwk=;
        b=y7geFbtl4Bva5ihFvoipNev/0hDJLsgHr3GIKaCzoRT5ve6lYOx/fWhiqrGS6JPfH2
         hzHufbwYDUniWP2Vp2JXtgR2vUdsa0YIRU6MerF0hNmAsQpHrrw30mfvvQz9awmDIPh1
         PfMCaQ03EGvVfx2bEVQTqpALStCTMvfCublIsoCkSE4BODX2kDo+zHz7ILXKHndQSXOf
         kjLfv+nk2m0jJU5KvL6Bp9/o+Hki8L45Ukk8eWie2rE3D+fzZqLsOOSYLTjGDDEiuBd7
         Adp2DHdoaCRpkn+7z3Ag5n2NESvXL05X/b8stLVZ7mynsW+cHAwmixcB5OnNicQ6nnHX
         15Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227641; x=1785832441;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhUcXStbQHEQGgrql9pf04utNrK9UGJvJvDDzUdzIwk=;
        b=eHSYLW4c7L/Y/rS4qgTRtN0WEi17wQ3V6lwBQEJKXEse5la4sQLTl3LlFoWzxS4ALZ
         +pT+hqTtFUAaNhu4Z0laTN78R3cmGNyVwpkvDDwT5ls9JMDYQ2OQfYwjbWYpzP3JmQPE
         W0l3FUG7kq1hOZbZ3cv9wIebyRqeKYkkeIbtWkE3O/yCEsjMXGPd1QXqbYaTsFf0ViDz
         EFlJDzqppP11Gaxd5kRf/bSw04ZSVVcUHREwHOy5Dyyo/67nj6ltC2cuwZbk7GrIDOY6
         e+04J7z2pXiaYAiIpwR1nfBh8pkNCjYoNBH90zUvJEs6xSNMV2hSNFxeOZFui7cw916+
         3mlA==
X-Forwarded-Encrypted: i=1; AHgh+RowQ9izoP1NRA9AWdyk4ywxW8xfBb69DulC3TTJxVoJMtkQ44wb7racInqyh7quQJx1U33ME6ZqW/2H@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJf5tCDgjj9gkOciU2xB+ouD9a7phph29VlFoU/hdwV6r2VAj
	OuY1UfVwfKHvdhBJb4SwEarXzeIS0RhuEpSUOKwsI6H0scWQ+qUu+Vy/04P3rB1YYeA=
X-Gm-Gg: AR+sD10yObAr5uPOC8z2tJ8p8hc6z8odFSB8i/LCDgy7R4gSSV5PAOSuP8EVbW3JX3Z
	Wq0AniejFWU5rp54nwv/cnAAA7JAevgA4+BAobs3noz3dPnRk01NoMF0PcLe5r4ot7r9KMJ++PR
	EwZxhM29ZbUTRUjU1kzilWeZ1LgdrwxQsOnoRv9n8X1szYGq67XBFd+TYwQs1DNaVgR/TJ1T3fZ
	wXQILW1Ytmm1pVGwQnWjMaPnjZfRGqnl0PqpPk0NluJFXePn+f4D4fTdYCai9YPRZKppiDfAxPx
	sO6NU6cMB5eBdFwfSP8harNrTq3C/3qFdrlyP0b+I2/mPTrbzqSfeVuCKgFRkm5uyBZ2zbhZj5B
	Tcawgn+46tj0ntJ4A/tWqPNdfHP3bwEiJB9esjDYzg93sI7yrcvf8XLbE6QVSswQLp1rqSCW2xh
	rUu7G20HSz29nWfrOZYV+K/7XID0miahbvVfy6Y75CivSW2A4esRox3gg4wA==
X-Received: by 2002:a05:600c:4f92:b0:495:6b4c:fccc with SMTP id 5b1f17b1804b1-496c6575c2fmr12813725e9.10.1785227640542;
        Tue, 28 Jul 2026 01:34:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f99fa7asm325811625e9.2.2026.07.28.01.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:34:00 -0700 (PDT)
Message-ID: <55e28633-d71e-4cc5-a682-341c329054f6@linaro.org>
Date: Tue, 28 Jul 2026 10:33:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
To: robazza.alberto@proton.me, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20260726201647.264108-1-robazzalberto@gmail.com>
 <20260726201647.264108-4-robazzalberto@gmail.com>
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
In-Reply-To: <20260726201647.264108-4-robazzalberto@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/26 22:16, Alberto Robazza wrote:
> The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
> an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
> BCM4345C5 Bluetooth over UART_A), HDMI audio output.
> 
> According to the original Linux dts, the board is a modded version
> of the ODROID-N2, with Amlogic A311D instead of the original S922X
> and WiFi and Bluetooth support.
> So the device tree builds on meson-g12b-a311d.dtsi and
> meson-g12b-odroid-n2.dtsi (using same vddcpu values of N2+),
> extended with the board-specific GPIO wiring for the AP6256 handling,
> and some modifications for the led, GPIO_ACTIVE_LOW instead of
> GPIO_ACTIVE_HIGH and different label (it is a green led, not blue as
> in the Odroid N2).
> 
> Add the "orbbec,zora-p1" compatible to the amlogic.yaml board binding
> (the "orbbec" vendor prefix is already registered) and the new DTB to
> the Makefile.
> 
> Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
>   2 files changed, 104 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa..83fb38b94 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-zora-p1.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> new file mode 100644
> index 000000000..fe20d39a8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Alberto Robazza <robazza.alberto@proton.me>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-a311d.dtsi"
> +#include "meson-g12b-odroid-n2.dtsi"
> +
> +/ {
> +	compatible = "orbbec,zora-p1", "amlogic,a311d", "amlogic,g12b";
> +	model = "Orbbec Zora P1";
> +
> +	leds {
> +		//The status led on Zora is actually green, same pin as N2, but reversed polarity

Use proper comment with /* and */

> +		led-blue {
> +			label = "p1:green";
> +			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
> +		};

Please use the new bindings with function and color properties instead if label.

> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>;
> +	};
> +
> +	sound {
> +		model = "ZORA-P1";
> +	};
> +};
> +
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +/* AP6256 Wi-Fi: Broadcom BCM43456 over SDIO. */
> +&sd_emmc_a {
> +	status = "okay";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <100000000>;
> +	non-removable;
> +	disable-wp;
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	vmmc-supply = <&tflash_vdd>;
> +	vqmmc-supply = <&vddao_1v8>;
> +
> +	wifi@1 {
> +		compatible = "brcm,bcm4329-fmac";
> +		reg = <1>;
> +	};
> +};
> +
> +/* AP6256 Bluetooth: Broadcom BCM4345C5 over UART_A. */
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm4345c5";
> +		shutdown-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
> +		max-speed = <2000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
> +	};
> +};
> +
> +//vddcpu regulators same as Odroid N2+

Use proper comment with /* and */

> +&vddcpu_a {
> +	regulator-min-microvolt = <680000>;
> +	regulator-max-microvolt = <1040000>;
> +
> +	pwms = <&pwm_ab 0 1500 0>;
> +};
> +
> +&vddcpu_b {
> +	regulator-min-microvolt = <680000>;
> +	regulator-max-microvolt = <1040000>;
> +
> +	pwms = <&pwm_AO_cd 1 1500 0>;
> +};

Thanks,
Neil
