Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EE42D0C98
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178618; cv=none; b=mx/ZkvQGKAfEimHkNdE1gu+kpyjgb78dXFxKw4O/w7Gt9lsunvAwxrBn8glBf+Lu87FE4Px/KZYzOaqJjaqc+rPJ8K40+s9DNK+7lgILt4xsyvTRBLH3Pb3f4lHKjwtC2cE+KG4adDbkI9mnlUWRcDrP6ZrSjg/Iu5uuyIIreEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178618; c=relaxed/simple;
	bh=Dc/dH87FaaKFZbkFPX2Jhws2CfMpwxHvksPrUUTw0Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rb7nXmC29GcaVBWmBYleyLxGfWTpZWansNnhl1dPBbajFwT4Fxki9D7kuHxz1LhHduqKzKjtFGNTydu8JDNvY2kHiSYLrUBfoC72xcRQoOt++7+QkMyS3FX3OYIQch+an2aNXvQ92bEfKH/LQ5vu3Zp62Zlv2I7XsT0VeM2qqtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWNMBsZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1aVQxpV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWNMBsZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1aVQxpV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBNj8r3681355
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EV4OhUsmq2J/1la/uJRmT9Yg
	y7Ki///dw82PupHbJiA=; b=JWNMBsZ0hdSbRCMnxXpwW9rKKfnSwtiZUAxkBMpy
	cmn312SrjxEXmGi4TM3RbW5EwviW53N3Ey1JDo/0VpTxwqz6qnuVuvih9p45oBMI
	Y0KGO8sgsrAH1TmtmrBgGA6eJxCencJ2nXZyd0/1Ojugngsyt4biSfgpjCJXgupM
	3uo8cli2bkLg3N68M9cAfbtGTk5g4GRVDXIUNoNunSrEDIr6Ge6pwW5Z6cdgFsvK
	2CXsxb5fkHOohzsjUSfk01DtpfiqNMoKDnKTK1CpCRWLok9TlZKAzSqK5oZ8CDFZ
	6VLL8v3vli8efGEbVjB7r5helUleeNcqn1TbK6IWkupREQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d35yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:56:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e0534a7b1so20833211cf.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178613; x=1776783413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EV4OhUsmq2J/1la/uJRmT9Ygy7Ki///dw82PupHbJiA=;
        b=V1aVQxpVbonNiz5CRgkc0Hz8jke0p/hRMf0xrUIekJglsw3uazW892VcsoMh5aO9wT
         CAEBpTerKw6OrhzQzFWTklUCUTRFd9LyXgy4MOCeQ+VAlMCTMmLK2LV3P9b04XG2q4Y+
         Y3dcHGa/8M+g8mtaBLH1epOqKaeKc8z20IQ8oJYpztzEWJBp6hmGqBuaJzSXfKow0p0o
         rGKxtXohuaFEp8vK4XmpYz3RYyrTMT5nmwpxUZ/Ziv2veQAp5js/5Ko3vtINMzYUfX0Y
         YfVor3uFODqITCcPojbisFDQL9dVCtpkCR767NUJfPtgOypliRhBSM6aC4wOz+3atP2q
         gY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178613; x=1776783413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EV4OhUsmq2J/1la/uJRmT9Ygy7Ki///dw82PupHbJiA=;
        b=Wl416z7BxfPRp3cORmwTOgFbwofA5TcGYye3LLWfs9Z3lFvlHq8HSkhs3FdDcm2tWQ
         L0G36df3K4GeG8pQqYihtmsFmf23I86rjm4QB/SG8y7nZYKUCUIVBtDr47rTZbxK254F
         OuEv87z4S8t246+M6+DsZX7MmXj6gDHcKCwpTFJbPqsEPFp5/JUJshtV8/BVb44CAfVK
         M9J409Bzs6TVllni47OYp2xHrGzXuxEigfNHAl02YnPjPjEeYKVN970a9BjJNv8X84Yr
         qUl2hkj9DZCdF1Wss+6L6buA+MakhU5Dq/MAsbPSxmRhF7ScyqpmoxvSfh9VagfJTpSg
         vV1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Pbk897PxyCDeL64MSrqkqrZMV6TubD+brKpLMarhoGL8ikTZ9OC1TiBP9PvlP8znJWQJdnvbSWaEi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp21ovKaEGppD1izYQRjizL+x883spiGSDmW2oAQzcsZpHCxTq
	H4+bP7gCQahqGXWI8vhpnQe4h1UPjWH64r+20VTTSmg8pEgO8VZeKLKlTWqklGby6tlIoA4zQ/7
	hIo8DhRpzvMyilu9lIbZtW25EowzArSFUgWwnKMxL6ygn/PqONx4yGVmspiA0P5Su
X-Gm-Gg: AeBDietJoCqifkR6jmvnsea4P16ZBUOBTR5TFGQNm35jS54J5T90A4+d6i8mfqtfGjv
	99MQQUHwbRmBwQvNAeCUsTDiUudqZoQ3vOLMjHuxrNGRXNedT1U9xdgq5PCGFJ0euUR0CX9KRg8
	fg4BcMnrde4mXEV4H9R76q+CgM/2wtqbaNqGs1LhPMF/SRJZu3FVarCZ7zCbF2sSfKXiMie2CkK
	ygczhlV98aZOfGrBeKK1zI3cGhJAncF1O62lrrAzQT+lGmnVaxITHUjYkmhpPjzAF7hwS0tP9ox
	qCiO0BxcD4F0hbuy51eLVR5nOxGT5FmRcXWngymKO/XHZy1TWmHk67GjMlYGILwpRvLJ2ebzJN9
	dJ/rSlbovJVJa7PIcPVY5bufCXrZRaoGoVfDOwxeCmrCayHbHZAnCumkWNC9r4CKMd586PftJUA
	mFCIzqLE977ELmRmXXIaAbXcjhjF1tTFnd9RU8qc6K1gw78A==
X-Received: by 2002:ac8:5d89:0:b0:50d:a8f5:1bf8 with SMTP id d75a77b69052e-50dd5b98c01mr271723141cf.37.1776178613061;
        Tue, 14 Apr 2026 07:56:53 -0700 (PDT)
X-Received: by 2002:ac8:5d89:0:b0:50d:a8f5:1bf8 with SMTP id d75a77b69052e-50dd5b98c01mr271722541cf.37.1776178612497;
        Tue, 14 Apr 2026 07:56:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee120csm3285702e87.48.2026.04.14.07.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:56:51 -0700 (PDT)
Date: Tue, 14 Apr 2026 17:56:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: Enable secondary mi2s
Message-ID: <whwq3rkttoot4phwbmeixhbtd7nxqoy5lsu2vjwj53mribwllx@umagtwlwnbef>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MCBTYWx0ZWRfX/71dT0RcDMQ2
 UZk0SE0e8hWzjaIuCH9Wy5G1Npa+JUSixsKVnvQ9WaCVTdmrHQd5kcjPr1H48ORFnJiIWWpfOp3
 DrKl4OPHo4jFoP/+PuGh/ExAUzUBseQAxsy1Dq1g33KZsf2sZFPw68r3eoxkVcM3HuVD5L1xhbx
 La+D1ZaaCIuQPz2Zn3CjCXVidtWOnvGvTvUGoUaPSTYKDUramQceUk15VgPSaMfF5GeSeXxacFL
 uWnb4up4YxTwRvVHZsDZuLhHLTspYLK32LDVjVnF+Hz+VLcZTzp8hpGp3WESKqcd12z4UB2HwlY
 Tn5g10CxBsrsFyteKEvWdT7V+77ywlP/rnTgkt8XdNKmW/ayM/2k9E/xYZ2u6LtaRUtQ6GZd1MI
 N9Fos8IayCY7gkKdgd7PEhigg3euRkmnJB5XuT9KSgJ5s+hQ32FL3Q+h5LxHqqyA+9OP+x66UKf
 MtPH1zBok8viMQAsFGw==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de55b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mRBC4_JaD_57cIq7-mMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: im4yi9AfeCPgcVpER_E57jfWvfT07Zq_
X-Proofpoint-ORIG-GUID: im4yi9AfeCPgcVpER_E57jfWvfT07Zq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140140

On Mon, Apr 13, 2026 at 02:19:34AM -0700, Kumar Anurag wrote:
> Enable secondary mi2s to support HDMI audio.

Please also correct subject line to mention kodiak.

> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 +++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 43 ++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..d1009debc12b 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5827,6 +5827,11 @@ mi2s1_ws: mi2s1-ws-state {
>  				function = "mi2s1_ws";
>  			};
>  
> +			mi2s1_mclk: mi2s1-mclk-state {
> +				pins = "gpio105";
> +				function = "sec_mi2s";
> +			};
> +
>  			pcie0_clkreq_n: pcie0-clkreq-n-state {
>  				pins = "gpio88";
>  				function = "pcie0_clkreqn";
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index e3d2f01881ae..2e4062052828 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -672,6 +672,7 @@ &i2c0 {
>  	lt9611_codec: hdmi-bridge@2b {
>  		compatible = "lontium,lt9611uxc";
>  		reg = <0x2b>;
> +		#sound-dai-cells = <1>;

Separate patch.

>  
>  		interrupts-extended = <&tlmm 24 IRQ_TYPE_EDGE_FALLING>;
>  		reset-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
> @@ -1110,6 +1111,9 @@ &sound {
>  	compatible = "qcom,qcs6490-rb3gen2-sndcard";
>  	model = "QCS6490-RB3Gen2";
>  
> +	pinctrl-0 = <&mi2s1_data0>, <&mi2s1_mclk>, <&mi2s1_sclk>, <&mi2s1_ws>;
> +	pinctrl-names = "default";
> +
>  	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>  			"SpkrRight IN", "WSA_SPK2 OUT",
>  			"VA DMIC0", "vdd-micb",
> @@ -1149,6 +1153,22 @@ platform {
>  			sound-dai = <&q6apm>;
>  		};
>  	};
> +
> +	mi2s1-playback-dai-link {

Keep the entries sorted. mi2s1 < va

> +		link-name = "Secondary MI2S Playback";
> +
> +		codec {
> +			sound-dai = <&lt9611_codec 0>;
> +		};
> +
> +		cpu {
> +			sound-dai = <&q6apmbedai SECONDARY_MI2S_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
>  };
>  
>  &swr2 {
> @@ -1437,3 +1457,26 @@ &lpass_audiocc {
>  	compatible = "qcom,qcm6490-lpassaudiocc";
>  	/delete-property/ power-domains;
>  };
> +
> +&mi2s1_data0 {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&mi2s1_mclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_sclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_ws {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
