Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527659;
	b=JSPlPLAAHPxakYVcgY7E604CnuNi0gMt7oQOfSUKY6dkLtbwWDkWBJnSoVWm5IexhxXD
	 i0wd1SqyZU4sC/hMFJGogLUFo5hzFIFFAQn6zVQpL6fgQN1AfkXEU9B5gT0skTY5PUC6O
	 cMZ5akh17vOfjMhOtma/rTFnU+8HOlrOCHFdXPZ5UNkeFYLQ82p3VRHjXTKw5oychqVJF
	 MhRqMx0gJZxKlWQOdNx7zZD5CvABpQV14F1nS4JpcErWEShK24IEgg/oJdxTa8Tif+zZh
	 OAo22blCVHL4wrOT7acjj6NnpxCYf6IaCFpT8zWX5lc92YEPvI3/9Nx8j6rM8vxDAzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=M+Df03Fx4+itYz4J38HagOcF0QG4sU4+kJ8QrdfzfKM=;
	b=VQPDw9xpV8S1+JDFyyeJCqtElOuKR0oM8h3Opt9WmFM4iOVagJPdWqUtPZ2ytgpyPJmZ
	 gklJ4i9DW+a0cbmlKcar5ghK5AS3LxTCt4L0EpVysOTkdYXZ3jyIxy3JdyYbMRqhVky1B
	 XNeCYFcpHAUPBZanZ1/8AN8grHIi2qnJuGox0sSMPMlAbsiCgHFFwq4IF9ZXhtTuMXNvR
	 mFkdt3Bd18wfFob5w3DxnoZzFSpN9YFtTJixt690Dkp57cSpW1nnahrNtCvT9CUknDo2C
	 H4U2q196uTDdW38MgjMcZvil6M1V5uvJ9dnNB8ulABytZ6jC9ZpqIbWPnOHZBKxYXqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QT73COJj;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBD8606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FBD8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QT73COJj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so43698285e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795527657; x=1796132457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+Df03Fx4+itYz4J38HagOcF0QG4sU4+kJ8QrdfzfKM=;
        b=QT73COJjUjEN0cDmUNtGuSh6DXbiOd+LIuDl2tdWJ4Xo+TvUwOV9Wccr49zcIh5Dzx
         glh2FnEXPoM1H0+kQC3+XnBG5m1BZTzSJw1tawEOCDWtwfA3/rl99DSbZO8P02eDe3ji
         PATSkvcN89p82fCbvuZChqe5UjnUFAL2LQ+Do6cz0fgMbq9juU3FfPiHTBoRSpY4pJIo
         DK5dQ+eXVpdkraAPG0OBMM/04rV+qccjDWygJMPazMi21SQldPv3K/6pxaLExByBqRrH
         WthVaY7Nxv1YFZWV3rdRpzUdQmepcSX/H8UgQ3V3shFKkPIWTB7oc0Q13u0FXu6X9x85
         v+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527657; x=1796132457;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+Df03Fx4+itYz4J38HagOcF0QG4sU4+kJ8QrdfzfKM=;
        b=QlPq4sRF1XwbjFlgiEYqMXY6byIRX7TTTcF9Nl7z8NQ0p/KwHAwL3auTQFHTOobULx
         4N4wcJUL7WEsggzPUZbbGYRptMOEFBnnSGp9qGFPl0YGhteQq2r9XjNU1XG/M1Gp94lp
         XxJ2ytmEN1HOxH4m50P4Sut+M22ZJu/q2zCzq4fc/SqgxOvgct0ZqSzsbw5UXbFlyYLF
         aYVYEs+YdkAgME857JRJwFDDOsnOhCMH4dvmVpRfwTOOWv/uSNASLgXdJ99hitwYE0n7
         3KulvgU3tPIZlfdWFaAdPZxwqE7ZH7JDB/x3uSroLzoFBtZzvDW3R27A/dLXXvaJ2eb4
         Lqmg==
X-Forwarded-Encrypted: i=1; AL+hErFzthN6wGgeRbZdCmMdyDZAduA1UokvPWXBhBF8Dk8mN/drLEJ5ol0YBmOPDOMmvZcKYR6ivzlT17Bv@vger.kernel.org
X-Gm-Message-State: APuU4Z9d0uPn/MGve2tZz3jQZ38ThbKtoegbRlVaDbmJXK3SfMhLH7Oc
	V7f/YJE9JWLeTkSxb2orGvaL07A9/fSxEk8L0jbrZDFEeZGRufhXpgC9OlJOafwp6w8=
X-Gm-Gg: AZFdTZdQncfBMBdqAsQhuvKmhsykXPblBB7sm00W5ZAInFAj2yszH/Xaf/wpvHoHfB1
	Wxh7oEDg5hZ6Z1xdQus+vzG/w+WW6sYwvBVVsaInrz67xp2qCGljwV5IrWmliwE39kfDXoPvdAM
	aV96xJ/vvI/MOKnc3JVv9P9a0feQpHrZZgI03p4Q/W4CY/nfdhDgQEeNZ0A5Q0HRHyv3RB3Dx6x
	RQ973uJBZ/jCYjeCoCJ1jq25eyffxztgZLGzFez5tBb9PTHIAgjaXLlzmJ8kswBKSFm/xZXp04O
	ZvxQXYj0y6CruzY1SFwwRc7+7g30c0SsjAJ9uygwKsRwJwLozON8Iz5mBEfuYEP6Sx6Lo6ONOQ9
	N1GS7C68DGiKzEABjNHtFSgGNh3Cuct2YSiWLyVJbvWALGxrxIwWDZWJY7LpPc8cPzr/4rs7uir
	2WeIuIaNlugtiLYggcCbxoc8MXteFD7e7wymwWFtmiLH2R0G4qfokc+5pEsm0hSVWvg4sKBGfJT
	ct2H3zWGqQw2d45i6ZcxA9NLzh8YpGEZ1ZFGiEWVeeDKlcpz2KE4Ecc2SxMQM7+He8pv8EPlHVN
	fZcjzPUeCeRM/Tu4bVOMOWYVj+oPckhTXol5F8GkyxpnDrjeKLHnRYuuCzC5/LNGg3SCmW03NdZ
	gprJrqwBa
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr277520385e9.4.1795527656673;
        Tue, 24 Nov 2026 05:40:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94? ([2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm229886835e9.2.2026.11.24.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:40:56 -0800 (PST)
Message-ID: <9bc15d77-2a56-4e64-8b73-163c44bcf5ea@linaro.org>
Date: Tue, 24 Nov 2026 14:40:55 +0100
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
Subject: Re: [PATCH v2] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash
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
 <20261124111333.33734-1-jnieto.alaber@gmail.com>
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
In-Reply-To: <20261124111333.33734-1-jnieto.alaber@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 12:13, Jose Nieto wrote:
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
> Changes in v2:
> - Keep the original BayLibre copyright and mention the U-Boot
>    meson-khadas-vim3-u-boot.dtsi origin (Neil Armstrong).
> 
>   arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
>   .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 28 +++++++++++++++++++
>   2 files changed, 30 insertions(+)
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
> index 000000000000..9f57d9433ee8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
> + *
> + * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
> + * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
> + * enable the SPI NOR controller, exposing the flash as an MTD device.
> + *
> + * Derived from the U-Boot arch/arm/dts/meson-khadas-vim3-u-boot.dtsi file.
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
