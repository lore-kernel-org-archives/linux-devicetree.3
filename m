Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35CD348866
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024422; cv=none; b=GfHB2Hqei5Uz9N4y8gOf2YBhhKrPs5K4F5R1t/cpOYPVBrUVWsRNXX0Mk1QOoE4hpd8ultr9wAY56lGf7QgKUC8Bq9ilb6q2GBl+UQX+sgSbtxiTLquOO3JfDd9BiHcgQAsnC+HfU2HTj9IbZgNV2ZA/onCbVDq6tNIuKPdvGDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024422; c=relaxed/simple;
	bh=z06h0nqocNM7sZknm/YONX4yR5TxkAybPymaBetnRdA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OhZiMu6+l4qiDeTQ6s6MkDbm+gwkbK98T7lQRSdlLkRLx1woJnpQnOLxQ3Q5gIax6NCBXqxJsAADmEiRqYFaJQXyaSymZqpMY4K2sRx44skEbhBvspoarmqDKuiDuQtZWc9H7k8a3PS4D6pAxQUVFuwQXpnYBrBLPDAk+PLETxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MaNMwHt9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MaNMwHt9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so38019545e9.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024419; x=1777629219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEAIB1gXAkAlj/KMWcgqb/qT0IRmtE0X48MG1aGhroA=;
        b=MaNMwHt9bUXLv64/p5MkJe0jULR8j+97XKkov+siIJlvmL+e6+xYgs0DoxzktZkCfz
         h/fADekA0H2+zTZpRCEqldoS96pmvSRvlma+InMJ6pvcLdmI6lLROBcJl3TQ0rXNakwW
         EyTFfoNCHa4jssa+BZwGmj5hmS6elma5LLhm6SN8uS080D0Z0E7pe9zIw8bLMa+DBO4+
         UBo0vSLwvteTGDNPG4hFJ2aW4ZebCm8WTvHhhcE4TSs0Vn6DV7Zje/WMsFCHjlY+L1+o
         VuretOTeza6LS9sEZwqk5xWBWqJWtjuDpEpMrpXTYR4TQSJr7AcWXzfEriRxaBijo6WC
         mrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024419; x=1777629219;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEAIB1gXAkAlj/KMWcgqb/qT0IRmtE0X48MG1aGhroA=;
        b=g/Up12z/2/3mRq4BLJFat3cLxEffzFkFRkyd/AoK3eS2euongT4FxpfCV7PB8/rOCv
         QPFIY1Gc0nFRfnHUVEM75w+ZY54TRSS8bnfqqPBiZH9S68GHI/2XhpC2kjSDQi8zK83h
         O5u8c1qaFi6Jaj219kLwHPR+d4innPa9RMi6XHcbsrtzOmCTCdnXnRFQ4yRx7idyQFXE
         ni9WA/6xyDcx160ONu7Dzw5ZfVVKclITuB+tRbvDRjoPegzipMbaJtU/h2EWlEGZ33Tm
         1kzuXCVWO5meDxZjpCkOGN5ptAm08seeOklFQ2bccXnAZPumBVQaX7ZccOfBgQCbKOzz
         fQVg==
X-Forwarded-Encrypted: i=1; AFNElJ9c2JAH6TfxcZKNl7hj+EMA37MQh6FeU7dc74q/qa11/PMapSozHX4dB6a3XvZrEE5g/U8NdPgACibf@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJLaGSe1Ugsr0FdtDR7p9NeHNhgvUyPm0SudNJwBrkmrKWQR/
	6N1WMHNVFqzZbMc7KC9uoKujT2E4SK9sFvs/3TBm+yjw4LCLP8p5NHMczIc5a3HUwdU=
X-Gm-Gg: AeBDieub2rcdFycDuk2T1qn8I0ZhlAgOICdrJDdMEIRXQ5uT+uZ+Opc1Z02BYOpgOAZ
	JgpbnR1l2I1qkR+xIi3AOZRt0IauqSu46VidCb3F+PHsmgOyCdpKT03CAkqG2aUbo6lFd+j86eX
	sytwGVqNuiSplCSBmvro0pWHyk/l42MPiEXWYoqeroMPTeEnnkrCdILNLn5LTvxnwHFVX0hVOf3
	o6995X1fdTAF796EZPV9epQgDndcyyvoiWFee2u/NN5yAjm17VS/0m0/VUdwLoxlxQlyzkCJYd4
	qyZ6d2b89t1v9wRLv2zpL9tBdCdmvimJ+95TGJKYVMGCALXgQc41uaetAsgCTgDJouXLNhKsej7
	1Kk3epUE4VZkKglKrSJk3Fk+cT2nzl31KkAq1tG8zDs2xyOZUEIYAs6VAdUoG+s5Oay/P8NhpS9
	RPS2Z2LJWuIbJekpCj1rFb+eEMjMa2gcTkrAUIqK100nbnZp8ZzmgwnKraJ2DRPMsqdewVemK+5
	OpkfiCm9frNzhtOuw==
X-Received: by 2002:a05:600c:3055:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-489032bae49mr216070105e9.6.1777024419012;
        Fri, 24 Apr 2026 02:53:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm364827355e9.9.2026.04.24.02.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:53:38 -0700 (PDT)
Message-ID: <c26122b2-b5c7-4a5f-8d42-c691ff992937@linaro.org>
Date: Fri, 24 Apr 2026 11:53:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add fan
 cooling to thermal zones
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
 <20260423-add-thermal-t7-vim4-v4-8-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-8-d4c1528d5044@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add an active trip at 50°C to all six thermal zones and map it to the
> khadas_mcu fan controller, using cooling states 30 to 100.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 102 +++++++++++++++++++++
>   1 file changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 5d7f5390f3a66..ba9219073dd0a 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -157,6 +157,74 @@ wifi32k: wifi32k {
>   	};
>   };
>   
> +&a53_thermal {
> +	trips {
> +		a53_active: a53-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&a53_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
> +&a73_thermal {
> +	trips {
> +		a73_active: a73-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&a73_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
> +&gpu_thermal {
> +	trips {
> +		gpu_active: gpu-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&gpu_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
> +&hevc_thermal {
> +	trips {
> +		hevc_active: hevc-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&hevc_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
>   &i2c_m_ao_a {
>   	status = "okay";
>   	pinctrl-0 = <&i2c0_ao_d_pins>;
> @@ -170,6 +238,23 @@ khadas_mcu: system-controller@18 {
>   	};
>   };
>   
> +&nna_thermal {
> +	trips {
> +		nna_active: nna-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&nna_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> +
>   &pwm_ab {
>   	status = "okay";
>   	pinctrl-0 = <&pwm_a_pins>;
> @@ -266,3 +351,20 @@ &uart_a {
>   	clocks = <&xtal>, <&xtal>, <&xtal>;
>   	clock-names = "xtal", "pclk", "baud";
>   };
> +
> +&vpu_thermal {
> +	trips {
> +		vpu_active: vpu-active {
> +			temperature = <50000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&vpu_active>;
> +			cooling-device = <&khadas_mcu 30 100>;
> +		};
> +	};
> +};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
