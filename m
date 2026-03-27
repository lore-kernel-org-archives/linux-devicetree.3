Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD422773DA
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625675; cv=none; b=qkqa9b6tXvVfZbcITZbbczd4xpPu5FCd4/PFVXKhMZRD0GbyPCLaFeab/FBzXtRWQWBzgcr5TUXHwK4JZiVOGqnVJKIxPEbJLbLI1B99f8/VFqrXniXh/2rVzlanQ/RezKMJFzDnuIIEtRGKlkXxt/JzEFmaUUQKNXwxzel3yRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625675; c=relaxed/simple;
	bh=2rhsUzsvBZW65mXgJBNb7WehLrGo2ROWFaoH0WiTlpA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TbatX2IJ2YKvEcm2eNfCVvfqfYsvE+mTwnKZJ2+Xfb/90vWbS7SAmTMFSbZYBcmM4CurVY2y7Zypdh7j+NFgj6uaky+f88+4XBtrw1enUqN1E8n9VIKpy20JIa/zXKHxaX2TzUKhtf09LtrhbiFd8q7yFXKZMSgbLX+0VyjSVwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BbfQzrfr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BbfQzrfr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so28344305e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774625672; x=1775230472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BtdFcTynAN33HZsmTUqdTq2Imp2W6r28pnCsYrsANI=;
        b=BbfQzrfrZAQSl8YjiXLaYmnoh2kwwmdWuNm6pP5Ksaht2M5pebVKXWuG3/eIbi0FvJ
         tjlKGvkQdlIiR+Dz+gUZ9z/xzD8bcJ91gBop5z2ocCNTCsRET02h1xazM2Qoi1XxI7eQ
         igKasLkMwa+k0TKtkSsiaY+Y6ltGRcELyDLV8+9Ls21Y9J7YRlS5KnvUXyNZpADxPWQH
         guznFjOZSV/QADTihmQScYUXtlVNge3FQCjrrXkgPtZ7p4NOAR7dnkkNbzF7igQhWj7A
         GzFolarpOHo0fpADSyqQyf1xzpmW9JaX34+W6rf73SUjZuxNHhhgJjqwY+18GYIZKm5V
         UVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625672; x=1775230472;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BtdFcTynAN33HZsmTUqdTq2Imp2W6r28pnCsYrsANI=;
        b=WRNrt6rvkBkkiU/rV/NoCLympi0WyL+4PFywpoEYt2MuCOrBvuE/U0duTpDG0bZn84
         FHL8YJYMN81PCP3NF0KJM6qV6aa3mq7fikxW8C5zGtSmeRpiDno17p/BRriq4NlCjVnA
         haofir0bskF0ImE1il1PQ8zj6x+HsPlluCTQ2fgKraI/P9fE6RlCfXMCMITNCWRK/hYJ
         OPiaEf0hhXIJ/hcMU3OD3RhYSktH1C/8BejD01PPLwzT8SvFz3Cr6BEXIkhPfmzzYPjw
         BSAkSpHm7vKrIQ1CLydO/1tOZiXc7iDT9/uO2vyj+RtnQXlI7+FkiRmzU7OhCBCeXdym
         rvlw==
X-Forwarded-Encrypted: i=1; AJvYcCVh4WJuHpy8Yb7xeofVv1Q2o/kHD/JgBCxYGEn3yrz060TUaWmoLAxfBgfcDEFSkqzwR2gCG0aX4hqq@vger.kernel.org
X-Gm-Message-State: AOJu0YwsNUR1AuGdc8Xr+ftzWnyg1GzbOE2EST0NqEtryozCHpyw1/wy
	4lVmRMnXEOtzP2VbpUt83kbzimNJihdQ4Ul1T+9IrloKwSNDI2w6X48uaUe+5eA8wEk=
X-Gm-Gg: ATEYQzyqjw/MlOW2wb1ETGrXG/tWscMdpIljUm262TFMc0L2iFA3FEeT5qJNy/rn2O8
	fjFzNGdt1YU0ltCqyt3I9l0REVFcrPZZQn86Td8Q3dX7h1m1b4kRh9mqcbiMY0XzRd3rWWdYxEb
	K5WSnd5GDhjHQb0oDu3d7d+3ph4r0+rG8S+oOqqVnYFuCP8xdLU9xsYjA6/J7EDv7YVcl/NvgiN
	TErf/xLExXpV4WrJGrROKVOeBV0QbzuKhQjI66zKCNyYW5E2uU6DbPs9tgV3v4q9jdDMjLAEFEU
	wRrmEGz5Ydhh/7hz1DTWPG1kbDX8gYnrh80jaM8v85iD9ScE5wyg/qjqNHAhCP+kbHPukqNyzRA
	SmGGCv5KbZb2SfS64sqT8r3Dac5cFym7IUPArGe9Bh5PEETm5lr8V7yNKj3gDHKcH3Hxu1rZbyi
	6Ca5N1fIZP0vSBoeKg+ln3tZKHjGt1llVIyX8Ep5kWEKqg9Md/BskAR+nh5FU5PP6Rse4KKvaeq
	7OX03w=
X-Received: by 2002:a05:600c:c109:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-48727ec776bmr37759315e9.18.1774625671956;
        Fri, 27 Mar 2026 08:34:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:39df:9101:d239:f5dc? ([2a01:e0a:106d:1080:39df:9101:d239:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712acb7sm17860855e9.18.2026.03.27.08.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:34:31 -0700 (PDT)
Message-ID: <9d56c5e0-7434-4a5d-8429-f19cc5faf00d@linaro.org>
Date: Fri, 27 Mar 2026 16:34:30 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 2/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable HYM8563 RTC
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327093016.722095-1-nick@khadas.com>
 <20260327093016.722095-3-nick@khadas.com>
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
In-Reply-To: <20260327093016.722095-3-nick@khadas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/26 10:30, Nick Xie wrote:
> The Khadas VIM1S board has an on-board Haoyu Micro HYM8563 Real Time
> Clock (RTC) connected to the I2C1 bus.
> 
> Enable the I2C1 controller and add the RTC child node to support
> hardware clock persistence.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> index 792ab45c4c944..7314e0ab81da3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> @@ -20,6 +20,8 @@ aliases {
>   		mmc0 = &emmc; /* eMMC */
>   		mmc1 = &sd; /* SD card */
>   		mmc2 = &sdio; /* SDIO */
> +		rtc0 = &rtc;
> +		rtc1 = &vrtc;
>   		serial0 = &uart_b;
>   	};
>   
> @@ -223,6 +225,19 @@ &ethmac {
>   	phy-mode = "rmii";
>   };
>   
> +&i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins2>;
> +	clock-frequency = <100000>;
> +
> +	rtc: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +	};
> +};
> +
>   &ir {
>   	status = "okay";
>   	pinctrl-0 = <&remote_pins>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
