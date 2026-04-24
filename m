Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5091D32D0F5
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024367; cv=none; b=cVExFoS0OiDGiIRD+Jrp0uHiLSrFcH2V77LCjlRta8+BgSHEZ/vvDY9wilq4+gDiITAc1la5REb80I0q7JQa1UnwQaxx6CHmm0V7QpgIY9nVVGynzzRUpAxTdmq9fuRiGe9fyWAWpF/WXjvxUNgd5BPz4iNQR2/lnhRgZG59xgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024367; c=relaxed/simple;
	bh=5bYaiZfMdKnvObHoH0/u5S0m6lVRbfeApzAjflJzhco=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V9gfOgkV/puRy/Eu+UMTad4tXNOxLUT4kwhcoaEW85FjnGJ+dbaLY2t4supjHxweYeMVzG+ygM3qvrxR5oxJ3mldl8Yqo/EYQ8TCIC7QdTvzNvvd6F+k1QYePyUN4A6yP7KYiUub742hsM3As6oglhxvEaXOEQn//14usxdS6gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=edt3Wv98; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="edt3Wv98"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso34720515e9.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024365; x=1777629165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsX8mB8kXzV2ktDRmOdWBbgr/FAAsBVBHTUYMUDzRZI=;
        b=edt3Wv98Sch0Et6/oXREplspanzLoNkAJ58HwKwwNV/DruaWOn1BUx6wQ4D0P2gtOI
         /ShCV6ZZbYe7IMYezdc5z0bAkUF8zjCOxid6SG7Qr3JJ2ZUl6a6tltA5DngP7ddb9/Et
         /d0vmF5GZW+YUT+onyWKhxyN8hKaJxqvtLcf3/DwDC+lwk3rjQ9S2Ae0N+VSV8Kcce93
         ZVKpBcx+k0kT5CxevOEgNgRhIQ7H6o1rQciHwErTrxfQu/Y9mLXcixxJSMgvuKMaau8U
         SzOd4xVpC9AJIQ3gFTEA4bllZL+57tvNGuKoXQcW2GDU5SqWtLi341cLEzqyiAoeGSFD
         Z0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024365; x=1777629165;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsX8mB8kXzV2ktDRmOdWBbgr/FAAsBVBHTUYMUDzRZI=;
        b=ODqS8nAthvVCm7T3gVxLQ164tw1lFe0DyrJ4tm2or54bTjoelEpteAlW72hMBr2Vqv
         IrRJ5TFrYfegchIdv6pjScKj07iybYhX8ZJnqnmwy+/aUnnf+vgCtPhDv58IF0eihwBP
         eUoJ/ihhUVrTDpK5FNOeoWNgYCnRIjIR/A4KAFk1a8NJKRY9b5wpQh37bHrNIvQBa9cG
         /aYnS5SAsMc0EWndcQr6YVfu+hm1FEuHfmtpxpGXBCeed5QaBGuqDRn4oFFCfmhc/qrG
         FFpxyKnaAOflJF1TBWg7QgoFqUDE2LjltwwiI+Cv7LIpvBJ5NxqHoHhFg4ixpQx2u8IO
         Pv9w==
X-Forwarded-Encrypted: i=1; AFNElJ9HyCqrhrq2by15SQ/0aTPG+FiawbPu8YAGCp9NnQ9oNa3pJQVfGwuvmDFpS5VKMT/E3wDJA2OrDRxX@vger.kernel.org
X-Gm-Message-State: AOJu0Yza1M/Wd+VLV6VKKEAd0qkIvAX5NAXIoKSI7Njd4MlljhvP3dWm
	UYdcgGWyGqZDxsakxG9dHpovh9Ezg9cNnQpSJunIkUIiIinEDVxTOfEh0oKv0AdS75s=
X-Gm-Gg: AeBDietwzC0tio7JaRBLnnj1et/IPmMaLmM+v8V3rb0ibSE/q26WN4fy9GRQ7Na3s7M
	QYoph2Umws2K46SALtpKaELSMKv8AYSkoWyArH81BUBjYvy6W/VkrzN4qMJrm0gYt3Epeehs4fO
	QOE5eZmzat82Jqa1qXsnWaD9SWmBIpL0E3KaEEo0P9QpwJXWM25Ro34kauCX4DUV7N2gRylhhbK
	m6Dqk6B9c+/pD38i4GIhmtKCUOdW2GB4inmXrtfAiyItTuGbRUtPSzmy7avJ7RxyXvK/9l/3AWi
	apGWFsmKceMJw84mkHCMHK4hrYIzVvBCnqMwcqxI7yKVkHAtQHvl4cr6oxHeeE2S5AhnmcoNqND
	IkiCfXwBrzaVUfWCq4uPP7UYB0kxSRNoOjHkoaPl4SOc7pHgeIBFaUXDDQrw6c0t4ime+ZTJ9LA
	uUVFUpHsiIj7BUyp65PLS9qGBIHEwwWrraZktcSME55e818aXk78f7uoGOqlusU3RtLhVXjiVMX
	ibCUPZkM0i/m1h+og==
X-Received: by 2002:a05:600c:a108:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488fb78ba6fmr374022025e9.24.1777024364611;
        Fri, 24 Apr 2026 02:52:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cc84a1bsm141108575e9.0.2026.04.24.02.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:52:44 -0700 (PDT)
Message-ID: <80f93779-17fd-4fab-a887-b5f88e82b2d7@linaro.org>
Date: Fri, 24 Apr 2026 11:52:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 6/8] arm64: dts: amlogic: t7: Add thermal sensor nodes
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-6-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-6-d4c1528d5044@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add six temperature sensor nodes using the amlogic,t7-thermal compatible:
> a73, a53, gpu, nna, vpu, and hevc. Each sensor retrieves its calibration
> data from the secure monitor via the amlogic,secure-monitor phandle with
> the corresponding tsensor_id argument.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7aec65f036a9c..62f259b2b17d2 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -656,6 +656,24 @@ sec_ao: ao-secure@10220 {
>   				amlogic,has-chip-id;
>   			};
>   
> +			a73_tsensor: temperature-sensor@20000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x20000 0x0 0x50>;
> +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 1>;
> +			};
> +
> +			a53_tsensor: temperature-sensor@22000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x22000 0x0 0x50>;
> +				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 2>;
> +			};
> +
>   			pwm_ao_ef: pwm@30000 {
>   				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>   				reg = <0x0 0x30000 0x0 0x24>;
> @@ -770,6 +788,46 @@ sd_emmc_c: mmc@8c000 {
>   				assigned-clock-parents = <&xtal>;
>   				status = "disabled";
>   			};
> +
> +			gpu_tsensor: temperature-sensor@94000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x94000 0x0 0x50>;
> +				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_MALI_TOP_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 3>;
> +			};
> +
> +			nna_tsensor: temperature-sensor@96000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x96000 0x0 0x50>;
> +				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_NNA_TOP_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 4>;
> +			};
> +
> +			vpu_tsensor: temperature-sensor@98000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x98000 0x0 0x50>;
> +				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_VPU_HDMI_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 6>;
> +			};
> +
> +			hevc_tsensor: temperature-sensor@9a000 {
> +				compatible = "amlogic,t7-thermal";
> +				reg = <0x0 0x9a000 0x0 0x50>;
> +				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_TS>;
> +				power-domains = <&pwrc PWRC_T7_DOS_HEVC_ID>;
> +				#thermal-sensor-cells = <0>;
> +				amlogic,secure-monitor = <&sm 5>;
> +			};
>   		};
>   
>   	};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
