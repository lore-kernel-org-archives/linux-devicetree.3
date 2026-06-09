Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689CB3EFFA6
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995356; cv=none; b=ICTz3SUOM+lbPEJ1SBYRaqTCAyUgy2NSEqhRq215bgF1k6DQRUJevzZPot9M+pHDdMcMsOhdICS+fHO54ZQ+FZnDCL/eTYqUeqmoxD0esuhlbkVFfEZe6AvKGQGbWJiQ2hsMgzOWi78jSNo84JZc7ITIVy9W4mC8jKuZD1uMISA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995356; c=relaxed/simple;
	bh=WEUJDi01qfK1lYTO7fit5r3i6qyzMDV+kRJKNjn0A1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hK9itCPBV2o2AjXcCiVqfHNqeFAl7m/O1BFc0tiYW6DvJd4wmRWPdIVgElfw87d30Il3MBXTUaVXDm3uZ1DSzHVJJJ5tzJ7z/xYqMpqqBoA7Vi3kDJWV0KpFPrOHQmmJ85Rivqa7e3sJPSre7oVKmf7A/Vav3c5lG+oi+xJ0dDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EAXPPhpf; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EAXPPhpf"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so7403850a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995353; x=1781600153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGHDi/EgG5Cp56Yn719wGUCuyzVWJDzp1Ho86cPqGa4=;
        b=EAXPPhpfT/uPQhu7ER+9ec6FCgY6ydkKiDK+PlVdQO/nC77X0lp/KoAiDA6joJWrmW
         tHwM0+HBiP17QHQ5+nmFyCQacpEZBVzVT7k8HWud+nHssLbidQNSBeddFi8pdpUr5cxy
         Gm7Ci2IXLevLVGn53/fol3BLTu+6ViR8oP5UkUlSmZe2Yc29/jplwbwL9sDBpVLcfHqF
         GinmR4Pt56229uWrYjgKtux7Hm4QGOaXtj/P7IO9PsFWqh3L879PKdjNA4Rvq+bOHiUA
         03VfmlPfdDATMZL3dz3RsbYdqCvnqLbEdlYwPGuTu6++eIgNIptoHEYNPfY/BUhINcCh
         PFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995353; x=1781600153;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGHDi/EgG5Cp56Yn719wGUCuyzVWJDzp1Ho86cPqGa4=;
        b=jyEGZFqQTOVDpJV0MmtDUvTFXW8JNRHhYG+WRLYUjMTgMEPeq0JxSGGQE100yPSVoI
         R6oTvJCT0+p5NTs6+ICecV7yknBLGu139zQQ7nitdtJ5h9jGhO4dq0gSgn050LXyZLW8
         yto298JGfv8QPBYBKoW4Se28vT3zhzWA717bQTBLY4HCo+t4w33GBS2NYS+wyUUnlhdM
         uix/ZQgwzl7WttJMi97iJSv+zqX2CUcjpGqjbnTCF+d++iL9NHE7zNjwg+Q8sN6JvvD0
         Bl8EBlG92VuhdigeV2+oRqRTtdbkeaJuNOtaYhxBBO2sulLMfOObkb0i/nNdqRsowDT/
         eMbw==
X-Forwarded-Encrypted: i=1; AFNElJ9dJya+xD1H2cZfTEv1BmSQ0mzmPz2A3oT4sPUpG3skeV418W/oCoD2jHJtWrjVKVTm133wNrEhkoVu@vger.kernel.org
X-Gm-Message-State: AOJu0YzRXfMti61BbEI5rg1LimelpLLruNp7D4w0gsBS84ISx1fgdxiu
	3PEBSC/N0mulJkrIZ+O7VGlXt0Hr51VVrdp/VPgWL2GUsx50aYGQ8rO9ZNewR3Sczak=
X-Gm-Gg: Acq92OFQyXwKNO0b2fbQ3nX8JEYtjzgWy4i7XZkgPt0xnbbu1OC4+gawavac/e3fnqA
	echTRCJpRdzF4SWMyhRbYAaaZCtOVDfhrgDrGB3MstrR7icXeq5iXGMoxGH39EuK654OwweyCfH
	rox7XRXsw0MkthBn5cWlIRvJTO/LrCgWxPry8MoDOcwPZY2DmfW9RZVZXQfn9G2INeKSodcQ1Tj
	By0RbnS/R1HwA33oEUw4eZmgTOKRD8q5yCkOkmuCB3Vc0nmDX1wSTJs2BUfAIkRg4IlFYmuDHyP
	xYqwHsFK/yjzZIXw6mGZgOvV3pvrZnU2nSE+5DSX0TsW/qOTuqa82TFOr06psLLKOOgEic5Btlf
	hsabs+Q8f6YpMRQ+PNBdJYdY3rORy+71eVUUwYNotdDQnKkodukjcm0cxUKprLIV7+q5t2FpL3s
	1WxDHjfCSRqGA6AFDe76LDwxGayr7Y0dHuvn+qqX5pS0j3pxKtQv9bjpg=
X-Received: by 2002:a17:907:da9:b0:bed:8f7e:d84b with SMTP id a640c23a62f3a-bf373902d8bmr939406866b.43.1780995352597;
        Tue, 09 Jun 2026 01:55:52 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517714c5sm1012233266b.2.2026.06.09.01.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:55:52 -0700 (PDT)
Message-ID: <20ea3aef-99af-4185-88c4-0b0d96c865f0@linaro.org>
Date: Tue, 9 Jun 2026 09:55:50 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  2 +
>   .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 70 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |  9 +++
>   3 files changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
>   
>   shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
>   shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..340d6303adc6e1bea55f1bd0598175f0cb269737
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,shikra-gcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm8150_l11>;
> +	vdd-csiphy-1p8-supply = <&pm8150_l12>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		/*
> +		 * avdd and dvdd are supplied by on-board regulators on the
> +		 * IMX577 module from the connector's 3.3 V rail; they are
> +		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
> +		 * level-shifter that translates CCI I2C and reset lines
> +		 * between the SoC and the connector.
> +		 */
> +		dovdd-supply = <&pm8150_l15>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd7594206f0ac54957e0af509fa365f54..811fd5da4af7babd412d70fee84434849846dc2f 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -38,3 +38,12 @@ &sdhc_1 {
>   
>   	status = "okay";
>   };
> +
> +&tlmm {
> +	cam1_reset_default: cam1-reset-default-state {
> +		pins = "gpio33";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> 


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
