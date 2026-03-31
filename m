Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF58376BFB
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981485; cv=none; b=QpdKm/mhnaj7Tagn5Oa03JDdMkMJD54e1Tdz8LJD5stJpcDpDmX+im43AKMIKFEdEqxmLj42H6gKjwkr0gjDnqEZmQV3igBsf61bMMlXgJT/p1lV5EkAAw2b142BOjQFGtjR+EynalvcFfc4E3L46pa6TvJS7EbZLifhKjAlWyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981485; c=relaxed/simple;
	bh=4Y0QZZf7hx7OxnfngFgck/ptzeCaLWIRizIPuutL2gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRuQ6tZTcDkVT+KjZii3me5wU7KvzG091qGJCWdVYxy6DjbfkuTgacfey+8rrOi4eW5Fgupd7kTZk1CMBzsWNEqVhzXV6TFZSD0xysF/KMCxj30mL0xRLBVUlc3gwSrSZqr7EJoQlymFiJN0LeGyYY+EiV/6pDlm6gB3MqphxQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TY1Ui2sa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YX0UiVTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TY1Ui2sa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YX0UiVTx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdN7M639236
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/CWZbyw95JjqJqWLA6GpFRlU
	U3PYOcL3cCFiiHuW7b4=; b=TY1Ui2salHX+314tX7JZYQH1a9tRAIaDQf0Uedvf
	ccm4DkCqI4CCZyydNqbnVYJKkcc/N93VbofDKGbi5wOH980qSQfV9pgjjMZWplo6
	/lZH0iVFL3Ovw2dOaj/DjwJhD7OZL5MP3wLcXyANt+e/oMba15jtHYAq+PEz+OdP
	DkVtL2RvnNayfv7ewPBpZ/NhkmEX0v42ZjCHx73yMQeNRZvQwSbzhDHeTOir1kxS
	9iDqgoCdZyvFTudQbLUYDL4rxjzxrCiW0uG6/auzveiBqmEmTdS0YRNCRfRd2KEP
	OPUnbgJtcMq/2NCew1NPV9ijncUsNwCXQ1u0UhG04M4JEA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2as62j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:24:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b44f7b7bbso193322341cf.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774981482; x=1775586282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CWZbyw95JjqJqWLA6GpFRlUU3PYOcL3cCFiiHuW7b4=;
        b=YX0UiVTx2cNxZqn1tCLjO3f2XATgCH7GDfzTJsXl/WzBREcFkiOXoyKK1BVwBSK1vi
         cjkYXFXOOd1C1fzeYHGk8oeJ7Zqj7DM2ri7wJnbglCGn/7cNi2aqdQa0RWIYM3gBwH8l
         JDnPxmwennkt6Wg0TIJEcOWEke6iK++ZA5+iteAopd7Oq+aiDJf9uzgMTGFts8qN/OZY
         NNERUsSfwxbVizDJb/7wB5KXLx2u7IR621TqPCHPKrO49J0pTXE4pb3epsHkwYkNQshR
         lnNPmyYmw9oV8zQqblGFT0NKca9Jy2qW9pbKANgiqB4ymg/HXdlBeiMYDIs2NJKayxMA
         dGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774981482; x=1775586282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CWZbyw95JjqJqWLA6GpFRlUU3PYOcL3cCFiiHuW7b4=;
        b=D5lAikHfGkrF0/+9WBtfsCSVj2ZU0+o7ZJen9BKJvuz7Uo8EwtYw4nKJt4Gjpx4mDa
         hAFSbMOTZGTXOLpxjn0emvrk2TSb6dkvzSjEKaIZa/CMzBdQg3POYbveZGt0Ikclu6l7
         o8vPJo2+1bMNW6blridfftKnzyBAzqBVCgIefuJOOc4eKsn0LZZBlreH+kNbxcED4cuZ
         LhuCtlJdXBOhBi4cgzgbu0tVEvXOQdYjDuMLE0p6UZWUXUO/SAxLn50z4ift2h8m0pX5
         +7MN1Lvhel9nqvnY6g+Kihk0nf43Z6QoIJwQM9eLu0LRD+kihYTN4PkbrwmsyViXrNnV
         EUSA==
X-Forwarded-Encrypted: i=1; AJvYcCURDwbPC2cNSDhKAH5lhhHYa09g0IV/heK3RylrpeKrVCg/Cult4ToITWMxlEVAT7ng4TSXhcZEZ6dA@vger.kernel.org
X-Gm-Message-State: AOJu0YxoS0rjXqPVMLpivm/Dx9lh/rHyGNmnAOzi/QYZ+vBlarGRbfHj
	Xk4AxjzpwrtJqB8vSjCtvfFg2aEIQp58ZNMgrAViHb1kiLYlSsFSkeaQLJIpRQdlpY190YdJVyc
	ntBvcQP64jDyKg1IBDaZxeb3vwHuUVGpK/fv+z4X/6zM5fKTzvQJNimKTg9AI8WDE
X-Gm-Gg: ATEYQzz3BOjBkhxJ8kckO4QnlQ9F5uNGR73sORxCZqwp14yNsf9uBofHmtPWnk3Er84
	VxfqcvgBSH3eiB4rUej71LmRgAiYu/uhEnvQFYEwk2SaLn9vcmA5AMTO984X75YQnAoHCWP+w6Z
	PqVwbIiMCvgaRWOi8MY+IxReOiO79AVf9lfKM8YWmPK1F3/tN7mB6ru3qrKQHRqNDBMEN1N8xNs
	GDvsW7muHW09/c98lA4kh2z414FYh4fYpbbtpfpaK/XrmZFYD16ccwj6quTJi4JnNfxbb5PvnhN
	fSDJU5k5iWjfHYr+M36NratfbAyXmR6jDbbNQGI2G5/XFsFHudtOeoREvgEgrbpeDfLNgnDxmGO
	pMXttzxbHBuLZMbC+HHDBC1Rh7MA6NpRH0Ei3Bzb0m0038p+aJeDpNv//+wBOguKZ4r09GTpI7n
	r19wIaI9uNze+Drngvtoz+syhK3fpG0b5EkHE=
X-Received: by 2002:a05:622a:1f99:b0:50b:43b8:d5a5 with SMTP id d75a77b69052e-50d3bca3f3dmr8613051cf.39.1774981482031;
        Tue, 31 Mar 2026 11:24:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1f99:b0:50b:43b8:d5a5 with SMTP id d75a77b69052e-50d3bca3f3dmr8612431cf.39.1774981481522;
        Tue, 31 Mar 2026 11:24:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838daa4bsm25924981fa.32.2026.03.31.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:24:40 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:24:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
Message-ID: <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
 <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3NSBTYWx0ZWRfX1/KUMcOd27bn
 wEZJr6SJFg5yEwff4OOz5WjBQ4sMIyjbs9zhMYGLEdvUtPL9551Za/FzWlbm48xk8+dqna8Wis6
 IMerQ1p/2ZxgaBqMsSrjht12Xl1uDyL26yazKfdhAXllEq8aJSxs+dR1lxrT8N1wk5s1fWjLc8K
 u2RjJrMgm22waSrsK+jWXP0hyfouUU1ewbWFcF8YMXyNIY5Gy8Kx0tDam/BgjXD/+UaBi7bmyhn
 wyzNjIxJAzX1tQyCfexwZ0apvyFY8O4XyOwHMqRVO+D6d7zJOK/880GZCd+HLXX2ABUbXWsqHIk
 o95blAVf47CkfXz/MOmO7OcwXrT/zVtVHN5M/HR/pGTEMrxxVd0M/Ql1c9lprqwXlgP3afmAkYp
 BE5Sll9+G8jt3gsUgtfr06RsnC45hHUNcGbzWjhRAPGYoBKLghDU6GihCo/MQcMHq5c8UIuq9QK
 VvUTj//Tn8i7IGWOGDA==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69cc116b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=OQN141zOAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=34O5YtzfCyVlAbwKECEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: veVRQyWHD4LD-hSKEvn52v640Q19f-b7
X-Proofpoint-ORIG-GUID: veVRQyWHD4LD-hSKEvn52v640Q19f-b7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310175

On Tue, Mar 31, 2026 at 10:08:09AM -0700, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add camera flash support for the Samsung Galaxy Express (expressatt).
> 
> The flash IC uses a one-wire pulse-count protocol on GPIO 3, powered
> by a GPIO-controlled fixed regulator on PMIC MPP 4. The regulator is
> modeled as a regulator-fixed node and supplied to the flash IC via
> vin-supply.
> 
> Downstream references:
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
> 
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> index c4b98af6955d..35514fd53e3d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  
>  #include "qcom-msm8960.dtsi"
> @@ -61,6 +62,32 @@ touchkey_enable: touchkey-enable {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_flash: regulator-flash {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_FLASH_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&flash_led_unlock>;
> +		pinctrl-names = "default";
> +	};
> +
> +	led-controller {

It looks like the nodes are not sorted. Could you please make sure that
they are sorted alphanumerically (if there is no node address)?

> +		compatible = "richtek,rt8515";
> +		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vreg_flash>;
> +		richtek,rfs-ohms = <16000>;
> +		pinctrl-0 = <&cam_flash_en>;
> +		pinctrl-names = "default";
> +
> +		led {
> +			function = LED_FUNCTION_FLASH;
> +			color = <LED_COLOR_ID_WHITE>;
> +			flash-max-timeout-us = <250000>;
> +		};
> +	};
> +
>  	i2c-gpio-touchkey {
>  		compatible = "i2c-gpio";
>  		#address-cells = <1>;
> @@ -172,6 +199,13 @@ touchscreen@4a {
>  };
>  
>  &tlmm {
> +	cam_flash_en: cam-flash-en-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-pull-down;
> +	};
> +
>  	spi1_default: spi1-default-state {
>  		mosi-pins {
>  			pins = "gpio6";
> @@ -572,3 +606,12 @@ magnetometer@2e {
>  		/* TODO: Figure out Mount Matrix */
>  	};
>  };
> +
> +&pm8921_mpps {
> +	flash_led_unlock: flash-led-unlock-state {
> +		pins = "mpp4";
> +		function = "digital";
> +		output-low;
> +		power-source = <PM8921_GPIO_S4>;
> +	};
> +};
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry
