Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894103;
	b=uJ2V+9MXIE4bGXUVtzXdA5QXFQ4sfjeqyWTYR2eHC2JQNC0zhIn96qRX4V4uoCG2+i/y
	 sxjzowT9MqHP16UdP9AEX47x4LGyUMk0tQlmNGyrpVWnQonSsx51DMPfajjr2xunaCQ/m
	 rNwaOv/o48n6way3BLayFyltktm2CXacciODuNEUQSeSGXURtZGwPowQg3oykSR88pMkn
	 myeFb51bK72TXY2MwR3S7Hzg+cJeZv62qQf6XsROan+IGQ49LgR6947/17GYAGZNr8RUq
	 o0Kh/P761cC1TnUDrLEU2B3hyHPr7A3CSlGTaOD32h5ON8h5w4BPQ79wOQRo3Np2yaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4gd5YBbTx7pIL/t9UDrPjuhr3sbKtTJ/cLT8Cj4GQTI=;
	b=ntaDrdOGP04nSEqCaM+wNgsZ4ssjZJdUQlHygjDCwFsjKK0LD81vZgeqSP7bDsOkGqze
	 yDXrVsGPX5CLXgf+oK2cpyRzkv+K6kglOOKpSaq+4zB/SdW8N+0laT8bxZMwWbvS81a4m
	 8xi2cSZOQ0YWsTRAQyk8g60eiDdHOXLpsu62VgBhlf4FNlZiSUp864i18w5BuxEGXIKhJ
	 Qmm/DEGjV5yo/AvPk8IL5HPMdnlwGrYi3OMtq7bFrI95Yi+nT/EHpbyhP2N5NW8yIG4QQ
	 26/SYmCFrzWXtVP1OnmIVT481E55pN1JAYjCTqZsj1eW/wp+0DNIs4c0r4fJfDw1Hew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iClzQah2;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B99360A262C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B99360A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iClzQah2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso19273745e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793894101; x=1794498901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gd5YBbTx7pIL/t9UDrPjuhr3sbKtTJ/cLT8Cj4GQTI=;
        b=iClzQah2ajwLi7VYVW4NdNIgIUvDD+ZdrLoWvGq8RGTZaKFCl02nUIcBqo7ISBioFK
         wzMQQdBMaoHUNeHTdu94KwRSbVH94aM20kP6Doy3/qjEimbT2J8i0ONicN6vCBSSrLQM
         1BZWPhsU4Jlu63t9tEh4TjaRgTMa3ckW4bHzdvkN8H5ceOA/ttWETPfOz4ikLxwpOAVe
         45ZOBtaVvU6obODZYH7cSkplc3oqoXdT+ahh+qStMMzbSDfZyCHC8vyxnmvd775mY0Ru
         mntkQzpi3eBfMVUvQ3ngvWs8+TLIKRSsVxQdtYZhe9cn2z6akGfRg5ZQk4B1PaIWVZSy
         EFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894101; x=1794498901;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4gd5YBbTx7pIL/t9UDrPjuhr3sbKtTJ/cLT8Cj4GQTI=;
        b=SLEI6uUaVKuni6QYSEoO3g0MR/3ynN1OkRi1bMfQ532bVh6B0sfHW/GQy1MyBzmMOF
         UHNR1ZHSiwjOeQ9OlVRhSqazH4qCGN/quQl24pA6h2c9mXWp1sAkeXs4j5z81GFs8JLd
         iCHpdWnZoUsgO7jdzRbTf25VRbQ+3fpXn4dsLiwJpbQVJAl3A6WpxlnpL67kOcsVJqQh
         68JAcsO++/uRCyQvyselPgpO4W6uTVxzV2gz7GGYuc/G9iTWDwubSRbUiALoOVzCTOVu
         5nuXHUFAJo8gcCiavBsaczVV6PUAXHw8b0r/E0In2WSmru8KV/4+bXfQ//K0MbqIgfKO
         Veuw==
X-Forwarded-Encrypted: i=1; AKwUvBx9S0qEvNjry+o6OJXJFAVY06Ivq4QwUGokNmBGhrJVr6YfVAHINeAghkaZ7mQto46g08ayXpo58oU9@vger.kernel.org
X-Gm-Message-State: APuU4Z/eGQqxj0nAUGTYA1i284zUOsyECMIwEFlRaIr1aofimQhSASPC
	AGnalJvsf/KgtztOM/3liif0iHonOLMncay8zRewyg/YQZkocLkxfOcS74SwRzXzV30=
X-Gm-Gg: AYBFou03M3v461HfM1Gk1b48V9lM7WANxqsywZzSQgLRk4gP8dujpHR2y9ggb9x/5HM
	i0luHzG27TbGHjxtT9A0luoIulrM+THK1wenbjs2jo5azH8yCpKJhaxNw4ujiANNCc1vt+29M7y
	YodE+jNCkLHlSFYkdgjK28GqzB1WDtzmh7I5eOQXSSRiS/1wer7JzK536EpNLHtKX/gEz1vypsH
	m7guD+UJE/+L1UVEj1zccXrpjK1OEyfyMfE7JsXnsZjRu4dZsUKuZukDSGXr5T1dPEiif31iZYF
	j+IjtiC9es7S7U6exfX3LmfY5zaZhMwTHNDVBbd9gpYDynLS1j+1Hwpsj700VfZqLmVI4YYCCwx
	RWlaq8Y390y9zz/AwskZ2zhn9r+J/7eq7pVGFWNOKJx1nwni5WCVXtyT+xwgCu59PiRt7H35KZG
	XwyVnhPL5OdonY2X9WOk1ViGGm9AYk/NcaE5mIEE4mgvXedgGC+oaqpzr6bQR8XZhp7c5W+3WUQ
	oXCEd6488kpOIKw33TD4jXIE7pija4FIEUfLcr18F1Yd/XuAaDFq2SvBQXERRarNpLgmjVjqGLv
	PdKPtyDkEFBlDYA5wCY0L7F7L1E5aQiiGKC6+sVxktYzIy1uDdyPGFB3B3CbOk65l7aoqI5QYMh
	4HstEGT0=
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr425955665e9.9.1793894101341;
        Thu, 05 Nov 2026 07:55:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9899:e54b:a2f2:3695? ([2a01:e0a:106d:1080:9899:e54b:a2f2:3695])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11994525f8f.45.2026.11.05.07.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:55:01 -0800 (PST)
Message-ID: <1463c55e-3bcc-4a30-89db-def43c05fe44@linaro.org>
Date: Thu, 5 Nov 2026 16:55:00 +0100
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
Subject: Re: [PATCH] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash
 overlay
To: Jose Nieto <jnieto.alaber@gmail.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261103164730.160593-1-jnieto.alaber@gmail.com>
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
In-Reply-To: <20261103164730.160593-1-jnieto.alaber@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 17:47, Jose Nieto wrote:
> The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
> shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
> 4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
> device.
> 
> The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> nor_hold_wp_pins pinctrl group is intentionally not used.
> 
> Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
>   .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 24 +++++++++++++++++++
>   2 files changed, 26 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55c..3714cbaaa03e 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
> @@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>   # Overlays
>   meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
>   meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
> +meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
>   meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
>   meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> new file mode 100644
> index 000000000000..c70780b11b9b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>

This change comes directly from the U-Boot file arch/arm/dts/meson-khadas-vim3-u-boot.dtsi
so at least keep the Copyright and where the changes comes from.

Neil

> + *
> + * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
> + * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
> + * enable the SPI NOR controller, exposing the flash as an MTD device.
> + *
> + * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> + * nor_hold_wp_pins pinctrl group is intentionally not used.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&sd_emmc_c {
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
> +	bus-width = <4>;
> +};
> +
> +&spifc {
> +	status = "okay";
> +};
> +

