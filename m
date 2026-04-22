Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460332D2483
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822752; cv=none; b=KNLsGiiO2rzOLx3tzJb8FIzaJcswn/9lP9fPEV0acKxmgLa4BqIsEdS0goaytXXvBg0pHNjsWmCPy5d5E8MKujuD70y5cvdOzAl/ckty3Krna6O+EWA4RxoiL77A6k3Z/zArQDqm+hTzFN6rn97wiaiuifmqEDeSbGeheEKZpQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822752; c=relaxed/simple;
	bh=i2BoUeBiaBN5BhTYVusWVsTRIANEkj7qt4bG5qmvTfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETfzHFKUON8SW5twXYIhbcqtfFdHtcNZByqP8lCcaXatQXnCREY1IqeqYtAwQyTtP+qgCTV5RuoINj704DT4pUVmMuUEfDo7pK/f/vBegoouBn143kv+0Yenf2KLBXxsGTylJgQtn+1G/AvgTvqDwbe6psmitoe7V41vuEZRHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBpf+8bf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiAdsRU1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBpf+8bf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiAdsRU1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZlx34051049
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C8AfVkpjz5uA/yuNgUlEQ8Vv
	m91nbKA2JeN2OZf9jbg=; b=dBpf+8bfQYwThnxsaLcGS9nW4PuPLP683Aj4Hbas
	D7BxH58zRTFaJ1ctDXswlDwgYKjhpYTV4jEQ410Vq7HV1kMVmTPCbUBTo4Menmih
	N30NGC/VMT2of57nM27ERCyW9WHXW5XscDdWtn3WcMyvBJTTfU5+dffrl4ZNO327
	1X+m9yU7Nc+eTmFUNxyU/9akomfYHKE1oyfR3fBTggB4X87CAhkwPSAXah0cfMjn
	SZQ8M9k23DNaCOX9WZF3/7hvQlz24lgJmLZe+52UY/TDQPdYi60K2ka/G1IVTXdp
	zNRyeWWdUw+aLWum+n35mo4+GPRLR+Q0hZEkebS1KZTmYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfh6tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:52:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e2592ea3bso54254311cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 18:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822749; x=1777427549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C8AfVkpjz5uA/yuNgUlEQ8Vvm91nbKA2JeN2OZf9jbg=;
        b=BiAdsRU1uIdt8D6zzrFSxvP5FXoqAGhfDelFTjmEAtlZJlI2WEDLZtPMSLGVkihWCY
         aTw/s9Rr+kUJR6Z0I8ioYhlr1rU9hVAY9ynuMSr8xZcEwoZQInHBj/yD979UARz5qLUT
         zWTjm7JD25TJETQt4K2m/m4JCgvhTEiOkX1kIdLzJK57bCuVRbK/b+tcb68J3JMbYj8F
         Q9bIGY1WAHVAzukaVUbmigB8l413Z6omUhGcUb19hwmqGsMID0Q2pL1G+JFZHxGJRixI
         ysmJ/9LBWqBGvGu74bxB2WKW3qxTa/PoHpI+V3CfgBX/roJpnv9EXVLd2HqTZ/fWR4c4
         ZYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822749; x=1777427549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8AfVkpjz5uA/yuNgUlEQ8Vvm91nbKA2JeN2OZf9jbg=;
        b=ZUZroXlavQ3kat+4YuuSrI4R+r8Ecr7gXoRQPFGYVtChEhusp/90FCLWcWBrbLeHnV
         FxeHGxle/UMRoW5LLovf5uwKercRTHCzikMDUc6tKtdPg4bAagq180lny+wYHBObXCU5
         t46n7chWFV3Zd/cjK9uN+Yh645vGKvx5YxHR9RULpFc+Exi0a4L2LF0QCEVgnnKvf0k5
         XJVcIUXapUhlu3XTEA5tbEktGvp8UPrHuoaf33DXI40mbxX64wLt/TZ0ZzSe8oGgG8gS
         wBluVg/vBHUN0uvPGptDpk0lzlpMi+KzWpTthQeEXui4ClZ0fFOmzvZr4l7GhpzrO/Tw
         DfRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nlq34qrPR2MtBMeeNCmijyTlE4P4PIF0A30m9M9vGLXbuKaDeaL8HX3wYk+XCZbticRUO5NIQLECr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yn//5RJ54URchgMllM4NFH15LBqwB84uinjwOau0D4D8ExLS
	cSvEUu6zp/vVSjqfof0IE07A+9i40BLa2E467iAv9b2Q1KVfxqKsfFMdz+3rnBe8VHryhyU/gsy
	RdSAWnAwr6xTqL7vcSbD4vyQvZXUP/7wb0gcMS659IUA3yUtSdbLvAfBs3EvDDcDP
X-Gm-Gg: AeBDievJ67T+DG+DxyrXKgWHWmxaGV5XclQPegBXT6gwJl5cE29EevnYONydC9s2H5H
	6fdd657KaGwdBA/Jm36/FYvHJHdkhNthL1OEolLqp8M+oqI65/wT2gP8Ool2cn+n2Ah865fviT8
	CAW5Kn/CLbJzVWbMWMbih/NeyOmOoP+KnyKDhGvLxb23IZh0WOvPJQaB6nGUdCYsQXbJhX+OW8k
	LXKQXgAQ3Rpx0DoCxPzJ2K7NeYUWcxCgIJv7thDiTT2A6ZRJ+/z4weXIGh6K6MNNZqJ7zZrbiFH
	4JoPyIZc2W+Ieaq+AEqtemwa4RhOaPOtr+GJvYxjGQAodBUxe5tTI99CQAWceA+vvjoxMTJU+Hf
	CEMtLzD7uLK11Ab/9RxaAzw6f6a/KNcCn3OP7Lge2ac9RtaGJI6YrsoeDoYk4eInzjinjt2q+Ba
	3WpxU2sW0TZiLigk/j87l9OzuqZhomtFTZLVmt02kGV7KT4Q==
X-Received: by 2002:a05:622a:1b24:b0:50f:c26d:f31f with SMTP id d75a77b69052e-50fc26e284fmr4058011cf.19.1776822749549;
        Tue, 21 Apr 2026 18:52:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1b24:b0:50f:c26d:f31f with SMTP id d75a77b69052e-50fc26e284fmr4057751cf.19.1776822749072;
        Tue, 21 Apr 2026 18:52:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm4116785e87.36.2026.04.21.18.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:52:26 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:52:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
Message-ID: <7vknnza4kjylf7djlykq5ytzyjvk3nsrhpn52bvnb33edzg6hb@ufrlygkis6o6>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNiBTYWx0ZWRfXx/wOjM5McVAW
 bjAiOV2Vc4P5AzY9TUrKyJX/m9RgKsY5FpQZMzMllkW2ArIw1JNTHiwYfBGRoJ0S9YabkHctOl3
 9VT5154esiF5/qLj0y/iNBB+13W9SaArNPhtXartaKSOWv4xZcZ1FBWn3HoqW+gUb2kxbAxxjXx
 KQoEOnhZFueTHC9eG3q2AFlx6el2H6ZRP7b90enHYd6iRV0+ZjKNc6QtxuGcIeKFCqROJ7kyDHM
 jNcXzIi3R+w8ubiuOqfzIszRLrOdJYgMQFv4oWxUlA3O/ryxlP5mOreqfcO2TZ28xSgtC3oFUGt
 V4jyivaq6F0U7WE9nptfaw0J5rkEDc+DmMANzchEnuATh2bGSRnU2/lzZZj2dw6wMt58vIcHvqz
 NN3nbHrI6RH0Vj0RZ27H6rovygRYchFjDRL+3SavClPUZL+oSsIUdvZGZBdTfBqv/z4HLyKrsVD
 HDLEs4NcXr/Hxp+XeCw==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e829de cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NUSM9a-ApLgp72EsCKoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: B2LSN0mZCL_TFt6THnhDG6muBE133-zR
X-Proofpoint-ORIG-GUID: B2LSN0mZCL_TFt6THnhDG6muBE133-zR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220016

On Tue, Apr 21, 2026 at 11:45:14AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../boot/dts/qcom/qcom-apq8064-samsung-jflte.dts   | 484 +++++++++++++++++++++
>  2 files changed, 485 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 32a44b02d2fa..c23c961f79e3 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-apq8064-ifc6410.dtb \
>  	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
>  	qcom-apq8064-asus-nexus7-flo.dtb \
> +	qcom-apq8064-samsung-jflte.dtb \
>  	qcom-apq8064-lg-nexus4-mako.dtb \
>  	qcom-apq8074-dragonboard.dtb \
>  	qcom-ipq4018-ap120c-ac.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts
> new file mode 100644
> index 000000000000..9e5faf7c086f
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts
> @@ -0,0 +1,484 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/mfd/qcom-rpm.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +#include "qcom-apq8064-v2.0.dtsi"
> +#include "pm8821.dtsi"
> +#include "pm8921.dtsi"
> +
> +/ {
> +	model = "Samsung Galaxy S4 (jflte)";
> +	compatible = "samsung,jflte", "qcom,apq8064";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		serial0 = &gsbi7_serial;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		ramoops@88d00000 {
> +			compatible = "ramoops";
> +			reg = <0x88d00000 0x100000>;
> +			record-size = <0x20000>;
> +			console-size = <0x20000>;
> +			ftrace-size = <0x20000>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_default>;
> +
> +		key-home {
> +			label = "Home";
> +			gpios = <&pm8921_gpio 30 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <5>;
> +			linux,code = <KEY_HOME>;
> +			wakeup-source;
> +		};
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			gpios = <&pm8921_gpio 35 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <5>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			wakeup-source;
> +		};
> +
> +		key-volume-down {
> +			label = "Volume Down";
> +			gpios = <&pm8921_gpio 37 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <5>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	i2c-muic {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 22 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&tlmm_pinmux 23 GPIO_ACTIVE_HIGH>;
> +		i2c-gpio,delay-us = <2>;

[...]

> +	};
> +
> +	i2c-led {

i2c-led should be before i2c-muic

> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm_pinmux 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <2>;

[...]

> +};
> +

-- 
With best wishes
Dmitry
