Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82637757D
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111739; cv=none; b=l/RIcqeV77i8nphrs9shyVB1paCOJq+Hpnr3xxuughPmni7N52B+c574a6J92NH+G8VhrHDK7HowbLE08+HYj+/BazYcsloNdGcMrr7UEzKMRPgktC3ZF5k9cn044rdZ3oaUNT2/AjFydYC+gMu6BC58LVGzXddui42dA/jIqQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111739; c=relaxed/simple;
	bh=phicAUtLwfBEBApbvqLfhBVzebPJnXcW5f7izh+9EyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/ix0YobDfCNfKwBbKwx0+43x58L+U+jT8BTxnBSPKooIuz/aGKP3ANku9Ov6a/pcpn4H0PfTDy80OjKWY05vNtkDnBhgo6RrZrQbr0xUjela8luIn4k8ae2r8eqlz+8Da8wrtnItyaytDk6Jxuh2qMlgMXjIPaAcPxFG7JomsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RAzIwqGz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RAzIwqGz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so34616535e9.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779111732; x=1779716532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrl7X6LWp+Kwsf0LGx75Q3m3WXWBZnBJCVNbzcnpWzM=;
        b=RAzIwqGz8gpb1/5THhI4UZVFL8mw91OhGcwSuLGDMsI3Qc/lIGDh4YCZC95yc5hBUI
         2p9RbxVj4BteytuknJfsz3ZLac6IguWd4z/CSpvjnjFO5cQZHvk32dZmQoYs9p2Wz/Cy
         X+i5xZpi9LvwkprtxTlD8AL6waUVVSgCyDRIvNjmelQ40lXqBqzlZ2MS/tC7fKcjTPYh
         pMQVbMc9Ir77mP36P0PoMAisRUZP/fup91z74AD0M21Z6Rr5XRe3ot0CBFzSzfjHSNaW
         ZRR+wwomGYRacFjURL4BlFfROOlpmk8oZarDXyf+hTVPXFncsThpaTVCGW/ELejEgshi
         Z97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111732; x=1779716532;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrl7X6LWp+Kwsf0LGx75Q3m3WXWBZnBJCVNbzcnpWzM=;
        b=AmaMDG1QnozH5mM4VAURpK51Q96AmDzZ9LCcKach620TVLBLHYh4WPM3jwZ6jCJJxF
         cY9rNndTA5taJYhoYVuyUjThsmVvZd8H07NgHuDmWjz018nmMzqW9pC4YpJfkC2lTGr5
         6whErbnf6M2DrUsQGlh8KesESKJLKd8lkCqLPYmpO0dkw+dMGA3ayjWizDs593ogH5q0
         IdTRjO/lOvwMgtQZT1zuH3KdKqR5P0GYDpCbphamjPJgwDE1bLUcChUg7Rd3hPMX7TYH
         +LSzF/dGcWrY68HwL2MHsquPbdR1rL+7V49HkaU0YZ12i+MfJHdtFqkWm8xmfPi9Y3kZ
         ZUqA==
X-Forwarded-Encrypted: i=1; AFNElJ9DS8TM0Z5s1OPZCLsiChwDkRW/vpDV9Ifp4NAhInoZ20Mgq/WhFCb8/Ltq1wZnJ/mdORf5Vftx+NZa@vger.kernel.org
X-Gm-Message-State: AOJu0YzkvzCmUvD7KkYKBlOmHM7rZnn5KU74N38tjE/AgzkhFarZcLKE
	wviUxrj6g+fwebuKSqhp75gyRoKh3No9Zc7sxV9i+sl2+kSQjO8Km1yEaRLUyqFdc1Y=
X-Gm-Gg: Acq92OHnuLR+KW7WoJXCejZqITt5jwT+xjNJoLj/PEENNkf9WWkQk75H7qkXfapgeUl
	F3pat6P0buwpZAixllRiNGwLDuU3jhRTk3bC7ml/flkFgb/H9fl83piLh6z0T9Icp7x/O66cltN
	CAMxn0kL9pCyvjtIeZ/cWj0bSfi1C9ol1ByiZbnJu29BXB1Kw1iuJx/ULrDlAANNFkmSH/rfw9h
	MBWtun/EStjO/GTwdIhZEMUz5IeT+i1tcVwWDsoVid8ktC5D62o4Lb8ZYzLUbVDVcB4G4EXdH4y
	0xuPxSqavCYAASTkwDOAKZ6YavA94JF+iCPZYYp+QmJ7OVuX+c8q6oTBTtZDL4YpJCEHbHX6NVO
	fO3VWvHaHWTzQl3vnsYaEaEhRZuBjrV0ho+xOvb9XUyJfQEykLCg38cYWiZDT9ju/mkX2ajzEdo
	aQ4BogZ1ufjXdEj8UCKCOpELse7Lx0pv/du0mmkB4O+8qlgeWQjINmOLCsZVw511+wGErbbg43U
	BH8Ty0=
X-Received: by 2002:a05:600c:c10e:b0:48a:65a5:750f with SMTP id 5b1f17b1804b1-48fe63265ddmr176315985e9.21.1779111732344;
        Mon, 18 May 2026 06:42:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm151219645e9.4.2026.05.18.06.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:42:11 -0700 (PDT)
Message-ID: <6fca9806-3707-468d-b4ef-12e92d9480a5@linaro.org>
Date: Mon, 18 May 2026 15:42:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
 <20260517-pocketds-v3-3-d5910c801756@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260517-pocketds-v3-3-d5910c801756@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/26 15:14, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial Device Tree for the Ayaneo Pocket DS gaming console based
> on the Qualcomm QCS8550 platform.
> 
> The design is similar to a phone without the modem, the game control
> is handled via a standalone controller connected to a Renesas uPD720201
> PCIe USB 3.0 host controller. DisplayPort is muxed over the USB-C
> connector with all four lanes wired.
> 
> Display panel support will be added in a second time.
> 
> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   .../boot/dts/qcom/qcs8550-ayaneo-pocketds.dts      | 1883 ++++++++++++++++++++
>   2 files changed, 1884 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cc42829f92eb..45859e977bc9 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -185,6 +185,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayaneo-pocketds.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>   
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> new file mode 100644
> index 000000000000..416399a4179b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> @@ -0,0 +1,1883 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Teguh Sobirin.
> + * Copyright (c) 2025, ROCKNIX (https://github.com/ROCKNIX)
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "qcs8550.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550b.dtsi"
> +#define PMK8550VE_SID 5
> +#include "pm8550ve.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/delete-node/ &aop_image_mem;
> +/delete-node/ &aop_config_mem;
> +/delete-node/ &camera_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +/delete-node/ &mpss_dsm_mem;
> +/delete-node/ &mpss_mem;
> +/delete-node/ &q6_mpss_dtb_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &q6_cdsp_dtb_mem;
> +
> +/delete-node/ &remoteproc_mpss;
> +/delete-node/ &remoteproc_cdsp;
> +
> +/ {
> +	model = "AYANEO Pocket DS";
> +	compatible = "ayaneo,pocketds", "qcom,qcs8550", "qcom,sm8550";
> +	rocknix-u-boot-dt-id = "u-boot-pocket-ds";

Seems you completely ignored Sahisko & my comments on top:
https://lore.kernel.org/all/1d04c00d-ee66-4467-b60e-f36326b90f11@linaro.org/

> +
> +	aliases {
> +		serial0 = &uart7;
> +		serial1 = &uart14;
> +		hsuart0 = &uart11;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&redriver_ss_out>;
> +					};
> +				};

Ditto

> +			};
> +		};
> +	};
> +
> +	pwm_fan: pwm-fan {
> +		compatible = "pwm-fan";
> +
> +		pinctrl-0 = <&fan_pwm_active>, <&fan_int>;
> +		pinctrl-names = "default", "sleep";
> +
> +		fan-supply = <&vdd_fan_5v0>;
> +		pwms = <&pm8550_pwm 3 40000>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <64 IRQ_TYPE_EDGE_FALLING>;
> +
> +		#cooling-cells = <2>;
> +		cooling-levels = <0 30 45 60 70 90 120 150>;
> +	};
> +

<snip>

> +
> +	sound {
> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8550-APS";
> +
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";

Ditto

> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&spk_amp_l>,
> +					    <&spk_amp_r>,
> +					    <&swr0 0>,
> +					    <&lpass_wsamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
> +

<snip>

> +};
> +
> +&cpu7_top_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpu7_top_fan0: trip-point2 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};

Ditto

> +
> +		cpu7_top_fan1: trip-point3 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpu7_top_fan2: trip-point4 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss0_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss0_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss1_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss1_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss2_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss2_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss3_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss3_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&gpi_dma2 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_opp_table {
> +	opp-719000000 {
> +		opp-hz = /bits/ 64 <719000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +		opp-peak-kBps = <10687500>;
> +		qcom,opp-acd-level = <0x882e5ffd>;
> +	};
> +
> +	opp-746000000 {
> +		opp-hz = /bits/ 64 <746000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +		opp-peak-kBps = <10687500>;
> +		qcom,opp-acd-level = <0x882e5ffd>;
> +	};
> +
> +	opp-794000000 {
> +		opp-hz = /bits/ 64 <794000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +		opp-peak-kBps = <14398438>;
> +		qcom,opp-acd-level = <0xa82d5ffd>;
> +	};
> +
> +	opp-827000000 {
> +		opp-hz = /bits/ 64 <827000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +		opp-peak-kBps = <16500000>;
> +		qcom,opp-acd-level = <0xa82d5ffd>;
> +	};
> +
> +	opp-860000000 {
> +		opp-hz = /bits/ 64 <860000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +		opp-peak-kBps = <16500000>;
> +		qcom,opp-acd-level = <0x882d5ffd>;
> +	};
> +
> +	opp-1000000000 {
> +		opp-hz = /bits/ 64 <1000000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
> +		opp-peak-kBps = <16500000>;
> +		qcom,opp-acd-level = <0x882d5ffd>;
> +	};
> +};

Please drop this until we properly implement support for detecting those dynamically

> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	remote-endpoint = <&panel0_in>;
> +
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +
> +		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
> +		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
> +		pinctrl-names = "default", "sleep";
> +	};

Ditto, again, drop all Display related nodes until the display bindings are
reviewed, don't keep a node without compatible.

> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1e_0p88>;
> +
> +	status = "okay";
> +};
> +

<snip>

> 

And again, don't submit v4 _without_ testing the DT against the bindings so it returns 0 errors:

arch/arm64/boot/dts/qcom/sm8550.dtsi:3878.30-3881.9: ERROR (phandle_references): /soc@0/display-subsystem@ae00000/displayport-controller@ae90000/ports/port@1/endpoint: Reference to non-existent node or label "panel0_in"

   also defined at arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts:1381.15-1385.3
arch/arm64/boot/dts/qcom/sm8550.dtsi:4056.31-4057.9: ERROR (phandle_references): /soc@0/display-subsystem@ae00000/dsi@ae96000/ports/port@1/endpoint: Reference to non-existent node or label "panel1_in"

Neil
