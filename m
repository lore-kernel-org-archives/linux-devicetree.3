Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A087C221FCD
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650287; cv=none; b=k7cWUbf04H1QQUUgmoISTBPwu96UktiOJQDfbVamPzoM368bsCuLdCo89UCDLhBe7v/JUhjOrt6O+SRH1Tq2Fv9sr782xjfNLtDZI9Oajgsa/oXlnG950tyYSo5CDCAXODhlU51cPD5RMa/D9ZY9ZCx5nXtiyJBd0O5+zeR9pR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650287; c=relaxed/simple;
	bh=yz++YvvFynwf10mUVCyVXaLp61l1CvG+8T9djnRbXIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo92QxokfFuA8Ehjv4F5kSbqIjzGnrPObiXb7o9cXzcJlLhps90SwoUorFd1znkTpmaslkkEuowvqy3fFxinHHWqfWo8peZMypuVkm5zvj6vTDR3LqvhUSi+EN7B1DId6TDyZj2M5Cve81whwb4AMVoZkndfvtdPJ7Vce9Zd+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9Z9snRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1UC/owj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9Z9snRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1UC/owj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9P2FP3591271
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zc/j1QLWvpn2G0HkthyPFZLZ
	K2+orSup3skrIePvboM=; b=m9Z9snRZUSYj4rviCbXfBb7+ripczoXZYXqOzMsl
	XcO0aBYuhRZ40sl9CBw53kxaL1wQhhumOUoBtgUYZ2pNVhKKZFZmFcyOn0o70NqY
	YwTpKW3j7mVgQT7FDWW19GldpX2vhy4MhGb7Y4WqLPuzOmZ3eUFhKnbM+kf4xXrx
	qrQEN+pe1Tj+JwqMp9Hng/QaP4rBk3uEIQ3KCwHdGGc88K6gSLvsSnm690K6ZDlK
	VL0N+8Hxb0tduvSNMcf2A07G0KZEvH64e9JsXYiJNgtL9CQtppY2mFpMMtyfRZOm
	an8J2eVKYcD0Y8jMQOH6k/ce+0KdTF2Z0RypStAIemg8vA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf2rys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:38:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5740so81347085a.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782650285; x=1783255085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc/j1QLWvpn2G0HkthyPFZLZK2+orSup3skrIePvboM=;
        b=F1UC/owjXOGQKBrNbGNJe/ElRtZVTgO15nO4Ay/tMpGc2+ZAcAMjViZw8wKkeKntP3
         JA2MJ9C6wkArd2BOgqwz9pli8cHSh7/u02adsCFfcq78jxJx4n5oTjimqYB2KCwOOAiO
         VH/XgjUwWSZuBfWtBkyzdADGT2nz+rvCaOvOEUNwrFITAtcJefLeKxWbV4dQV4xQkFrA
         kSMAY1GOXOWplDzw3uOKrRzwUMz/AjmpIjSM2eRhNXEZFUCb7rKlQ4Ocaq3DuG2UzPR6
         J7v9P+P/fDoRz0bL5SVtSmmsQ7TqDww7zaPvOV2QRGlXayZXYKDKd7MngB1k5M94B28w
         9Q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650285; x=1783255085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc/j1QLWvpn2G0HkthyPFZLZK2+orSup3skrIePvboM=;
        b=F9mkg38WtYMv+cyH4tcUGp6+Sr2iXRmNLsm5UJCdDa72qHrx0LCtNQIqMLC0rcpyqA
         8L4ruGkqdESNPkgjo4BAlSt+xeJbzc12vksjUERUaQjWMNbvVuRkv4vXuROgxWt7Zn0F
         +OMPh6qNmqTtaV1HzBaBY6x1CIJcpvaPsfBw1fw5ISD9jqFei6ySBpbuk/dT2YX5yq0w
         XYPJnydrC3BILFnkLDtsnUKRXJOTQciBygNcVQIydnHKDpcgjnPstsSZgTEAwHmKwMn+
         JNi5Ri9Xn2fXawAHJuMjn6zD2thKm7D69Q7J5f2tAoAOYl2eIR7mvwSuZ6S4FvVKOFVD
         OjZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/szWiaZxu+urNJFzj0KVRelsBzRmgigZ4X807acMG5p63UPH0DvNVqeNOPHu3eRN4YXOFLJjXxVKVt@vger.kernel.org
X-Gm-Message-State: AOJu0YwQeciEuWhcnpfOVPn/1NEnPb258S40FtfI2dEj/7+B8qFQ/kJ0
	OQXyiEMuUKsYwKNfmhbrlBbAhP5mhvKxnkJMkn/uLWrHMxwB9fzXO1XyQQ7/rQ4ABfxUnM9Ykc9
	Y8pwuMloHAPb1bMmd/JPlhbkKFCxnx1O/PVQ8Bga69cHpGLCQQVvt+dtgUGkQ4LB3
X-Gm-Gg: AfdE7cmJqSl9cCYsX004SVvU6L1dPWavIXghhJqauLFGwE0yH3uN7ggND+UxhwVra9o
	mwuwEHs5TAH+SfkYh+WyJAzJA3kFFq3II3yJ6MEa/OaEuLpRtQmUY509MAEIMYWtDhXPYKt/ykw
	UqNw4sPSk5+XrieIlHcpAoak7NpArUOwE5/1JFxlfVBJWdfpVRLyE1lRK05Aje22NA8sNTZQZsK
	Sm4yC2bcuVJRXdXR7gJaZ06cWM8qyP1qmu/XK4VaHwNEeSYjdwF8jPq43kLMZRqx3raUuKMovJk
	NzexpUc/946zplB5fqYvFoDOzmXrVqmOdjop+5PjugmkW69pWMHGsdtax1I1InizDDejmjkPful
	dx09pK2db1qbTagDt3vhxG+4k5mvfPCbrW552KZfCzlf9eU6EIFNKOUKsXo//43MaeHmNa7ckE+
	ppqtginvYIAcct+W1wZULBW8z7
X-Received: by 2002:a05:620a:40cc:b0:92b:67e6:8aca with SMTP id af79cd13be357-92b67e68d46mr1043024285a.68.1782650284766;
        Sun, 28 Jun 2026 05:38:04 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:92b:67e6:8aca with SMTP id af79cd13be357-92b67e68d46mr1043020985a.68.1782650284174;
        Sun, 28 Jun 2026 05:38:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb8822720sm129700e87.5.2026.06.28.05.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:38:01 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:38:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Shikra LT9611UXD support
Message-ID: <dlozejklrptk6itth2znyfklonwemgnbwxzn67t2dvy5ig2g24@3g6nnvmqw5ja>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfX+X7NHR3l4Y1O
 h02nOLQL2QXIk/kV6iGlHC0nZjgt7F4OfLRkhINAnEbXmuhJjAGpjd3eEqS1d1kENySBStjHWB7
 CpAZpsFHzcafp78KhPtFWCjiT/4v0bc=
X-Proofpoint-GUID: vXT5qJOSlh3qdfql4mzOAs_BNOwEyhEp
X-Proofpoint-ORIG-GUID: vXT5qJOSlh3qdfql4mzOAs_BNOwEyhEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfX6Fgg4jK0A/0p
 mtg5DZ3IWGmR6K6Nr031dESJCyhgPKfTVVripyuJBJvvpTCwP9k9JmjoLgqh6/lVtCkv2WIejKQ
 Hpj0cWfQajWNgIvmIlfxYegiLOEvW7TfOxUKTC/ar3e9H86RXRfI3bY+c8nTUHaz7bJdl0BR87g
 pbLkkEtPV6QYHctlUieAUMwWV9tCiYTgWLNe3P0LUBmXim1dIeQOoCcymBJkcHdU7G4cwD0QZFy
 GNfaw3K5s3sNXLgIwyp7Vts8tiTo2yPAozs1e4Tq7YrL2PbQ9wbcpas/CjYG4vGrWQj7mp48I90
 3iewKwX7p/rsVbeNLrGninVfYDoiNxJREh82uw7+dI83ZoY5LylGStgbUTLgKtoRyHYUuqJrNhl
 IklS+b1vDMQ8TnmI5PeNJZ3DKrbrFrcaNQQ+vGLLKpPX9erdrC1xWwAkEzeBUyKdbDc9BCGscbb
 MpYkdmnnu+RNHcgv31Q==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a4115ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Jsedhb4udUXVVV5JfpgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280111

On Sat, Jun 27, 2026 at 03:31:39PM +0530, Nabige Aala wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Device tree changes to support lt9611uxd hdmi-dsi driver.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 ++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index fd691d53a0fa..9cc4a1c6e4ed 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -23,6 +23,36 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
> +	vreg_lt9611_vcc: regulator-lt9611-vcc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lt9611_vcc";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hdmi_reg_en>;
> +	};
> +
> +	vreg_lt9611_vdd: regulator-lt9611-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lt9611_vdd";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
>  	vreg_wcn_3p3: regulator-wcn-3p3 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "wcn_3p3";
> @@ -68,6 +98,78 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
>  
> +&i2c4 {
> +	status = "okay";
> +
> +	lt9611uxd: lt9611uxd@41 {
> +		compatible = "lontium,lt9611uxd";
> +		reg = <0x41>;
> +		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
> +		vcc-supply = <&vreg_lt9611_vcc>;
> +		vdd-supply = <&vreg_lt9611_vdd>;
> +		lontium,port-select = <1>; /* PORT_SELECT_B */

Nope, NAK.

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;

port@1 { reg = <1>; };

> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm8150_l11>;
> +	status = "okay";
> +
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9611_a>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +};
> +
> +&pm8150_gpios {
> +	hdmi_reg_en: hdmi-reg-en-state {
> +		pins = "gpio4";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		bias-disable;
> +	};
> +};
> +
> +&pm8150_l11 {
> +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */

I see this being set for all EVK boards. Why is not a part of the base
DTSI?

> +	regulator-min-microvolt = <1232000>;
> +	regulator-max-microvolt = <1232000>;
> +	regulator-allow-set-load;
> +};
> +
>  &remoteproc_cdsp {
>  	firmware-name = "qcom/shikra/cdsp.mbn";
>  
> @@ -103,6 +205,26 @@ &sdhc_1 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio76";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		output-high;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
>  &uart8 {
>  	status = "okay";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
