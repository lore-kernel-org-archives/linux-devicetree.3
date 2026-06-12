Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58A931064B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251812; cv=none; b=IC2AvOYn8hRxO+1heXuUI+tUOhp5KH++wRaNhUertc9/xS3G3PcoXF2b55o9Utdj7Tu7JRtFD9lJ25ZNyFyLog59vs7U3ZqXtJfZAOihOLGzOf60lz2LxgRwp/3gQ+PfXaZrSWG71mn4g3c0gl/uYYLYN4phiVObDW1BKLJVz5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251812; c=relaxed/simple;
	bh=tlIFSDGimFC4A3TsOlVc1dm/d2ZHPIEkda2SqO3cXYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+ogi2+axEiPa7DtE/sVc/keD3Gcd8m8PvJrXuzHsMgkAmwmaPmXIeJMgVtioGTJ6QlToLDIICRWcxqgK84bIGhCryf7/pKPjPPesNNaeFT3HrskR2ngEIWhVzsuNdL7XBk9yGR6D2p4N9RiZO/70WPI/OMtaVnGTAQ1xWsgC8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s4J6cpCW; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s4J6cpCW"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-396aa835272so367121fa.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251808; x=1781856608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzqd0JGS+LvqWWHcM0Pu7KnmR8I/e+6J9UGxu+nu8iA=;
        b=s4J6cpCWL9+J/ts+XsGbAdn3vO8YyU7Ov9Ni7LPEWXJEEbA2ojahSYgc3CfsrfqPId
         EN/wHJ4v0guU3FrdS0wdj2NZYOi+noTMPZbbCio1Bnv5b6Cx2yME/UThwixIecqgaifj
         OO22hzzY2t9xHWXt1Egs82Rp44+WD6MHIQJbJintei5or8ZooYZ/lRJ1N8TrBdfuQpNU
         JX13NFxlQO8+MK6Ku5W6wv4EQfnl10OrQ/d1idwfiH20pdNlQx4Nwrlu861vBSI89z4F
         X++HBGFstY4A3BCrag8SFqFZiRCr0WvO1uapOlc0Rpi1GPuIHN0+CasPzc4g+mmD9i5/
         Jstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251808; x=1781856608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qzqd0JGS+LvqWWHcM0Pu7KnmR8I/e+6J9UGxu+nu8iA=;
        b=DwpJGg2EBsBwjNZS3XlaQNfq+5InvV8JWSaF/OuOlbu4ZLvC4LuzyCOYc1YrSyn5BO
         49sFOpnLZXB4A85WIkV+5vpiORxopu5YO0V3+hz2jnIVZ0fv7R5nPvzBZ56eJvSI9SyT
         ckA8FoIJ2fmxjTapX1e0XIios9JEJD3CitpPYLAptHqxSgKwuAslR9nZbXoJQiQXXSYS
         swa0OjDFz+vYoyY4E4a1a/OoGzp/aTYrWPduLNA382FEphXIsx5EyoBtC1yFSYVNcph6
         AmMmcBFbQ/sogQ6NoZuy+Rp83hqTZc0C+tV3EQTv2HUsfbZ0N0R14VhKLA4NYDS7IEf1
         l6CA==
X-Forwarded-Encrypted: i=1; AFNElJ/AKfKStsVjmrvn5pf1KIpOVx3Bq3jN3fdSJ1tN3jHXdTL5ymU+KKdDY04+iLHDR2nWFwfNrrxlfAs8@vger.kernel.org
X-Gm-Message-State: AOJu0YzqlhbhHuoQxR80f3i2m6VHkZaxyZaav2aDg87YrAWeVYhNnv3/
	Ao+Hn1pCAcSAL0v9NqeFOEO4d8N7KabD6FNKX9DZ4RwjL/hHE1tjWF3Uhw90NlpA+MM=
X-Gm-Gg: Acq92OEg1E6ux1QeE/s3Krbvm8cTvPz8oxzyV4KzoCNDLXgbtSGv0c5fEceHFtQsZ+i
	omMkNhEP1kjSo9jCmR8nVDvnheKXGgnc9ooWGyBkjSqEmmO0uISl2m5qc3yQCnXjqcuPUXXhx5Z
	AKtxeZK6I16ZC5miW8/eZTuuV+74h7UebTE6NpCoyaEirZ2DhWYGAZxpze/AjjMN+vm3Q+9cgBj
	HHz2qCe8iZJuid5+fKdf71T0E2q5tPsLl4VuzxpBldr7BLFb0dwMpUnVYow74xIGhf+cXWM5g/X
	4OpwhXnQ+hDhd1YgneJKUoBAMFrhPFawZb98UFRgFG9ic0Q07aMqnCq64QjCg8jd1MIquJtVvk8
	0nBz0gRdrRk+Gvn/mgnYZNw0CPu2XpDiV6wYfcYoLjM8Cwj8Q9pFSVQHqjLau1V/KQsToumuUFt
	u7/dxUIt2p8qk9B4lW9uHvKa8FzNr8/RQmZ7nyJCBmFOsodg5M74RGMQvXG2MNNrbCtftWaxJPU
	W/K8Q==
X-Received: by 2002:a05:6512:3b0a:b0:5aa:6ba4:46f2 with SMTP id 2adb3069b0e04-5ad2db189d7mr289426e87.1.1781251807831;
        Fri, 12 Jun 2026 01:10:07 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fc0sm332575e87.51.2026.06.12.01.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:10:07 -0700 (PDT)
Message-ID: <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Date: Fri, 12 Jun 2026 11:10:06 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
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
 <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
>   .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 70 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |  9 +++
>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |  9 +++
>   4 files changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a9e9d829fb962386b3975f345ec006504607130a..76b8f144983827f4905a72935e8d5291a227dc97 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..e3dad7c81e5e8aeb1061c784b5b893965f914a6f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
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
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
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
> +		dovdd-supply = <&pm4125_l15>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;

The numeration of data-lanes shall be started from 1, this has to be fixed.

> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0d5c3e31b1f613157d4d2ec6947c630f1031b73b 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
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

Since it's a mezzanine specific pinctl assignment, it shall go to the
correspondent .dtso file.

It's a concidence that one .dtso file is good enough for describing the
mezzanine for two diffferent boards, but let's exploit it by keeping one
dt overlay file as it is now.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7aed3121ef092df684b19a4de39b497..515af370ca014a668dc035ff944fb82b6e09ceeb 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
