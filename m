Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E22644A41F
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983106; cv=none; b=jOTjdI4kgCNANNF59Md9QIFIc87EwEaubN1+H+UPD9b0NUErpxZ6UsXU8/zx/YSK7pW35q5y8hMnxWDzeJE9Y5deWsYbAK2F0s/u5/57od5P1mmvqFPVIpREBwqlHOT/Q5ozj+jz9i/dOQSiGA1APXQYT+HVUzkdn26PzzlVWKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983106; c=relaxed/simple;
	bh=ZCnRDs54/RzAn3CW/87vEuwpMWxe0AAr9tAqd8iWrtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Na5EEXeHLemt/yW3AWatpHAl2/EpwgS2KZxHXar5Wzdo9UW4E+JRaN2L9D4q9xAlBw2sVaKIxXrMT1Cphw/ls6ExDtRQ2YMAsRs70DkQWIdpKvw/jMP/naUJKrzAGEmvb7mHl8pcxeM8ooELTE2wrKjN6+XtD8XIismJugVPoas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYMJ9+5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kST4Hi7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYMJ9+5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kST4Hi7d"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYcan3271885
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hCEW9PijxcxcfDGLUs2wXu9FVF2tflvW7F00ZTIwITo=; b=SYMJ9+5/prvFR9FU
	Nc+9hX0jILZbtwJJq8R2OPfvgvxrmVy9buPD0VzoMy67kazD5AyccBWfcxu3g2Y6
	ag1hpPVQJx8hUd0/Z+6S6EmA+W9x8OLLcUUSrQVr6zEA294y8ZIE7QGKRiwsV/mp
	eml3FFsZa5OKBjCl5InoRlZqPZNtnhl1EhPQqrLoSul52jiExCljRLrdaYHUeYN8
	vkcj+8QBNUMpbmrX5nsWo/1wiUaV7jTJM1rjEXxwbinxv4dY6cF7bo0cCEgGBuoi
	eNmz9X3E/ACF8qy4zz6MKfCP3twfMgV3/K0WGadU2bAecXoTU0uN024liqYdxk5W
	RaTUhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7t4p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:11:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so12960261cf.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786983101; x=1787587901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCEW9PijxcxcfDGLUs2wXu9FVF2tflvW7F00ZTIwITo=;
        b=kST4Hi7devsxlU83ausblihnjrfHyYS7Ir324ULTqGCfvkWhDu6BCmPsFPOo4+e3y/
         kL2keGOIy+dlhmnpmxS0CSJLEU7wodzncZQgyh5bWwRSqfHgbFISL0prQgEkoRFwX0lo
         4uLTYBF2nq3UguIP7RpBtcPIFVFGMA9uz1cyuC0gdbZq7u1/tFJmEQ+Znup8knQZgsn7
         F7EpN/ahIGVd2vee+/6P7qBM4UgNRCQh7U5tygf7lWE1kGoySD1n/g4bW24rV8CZ1Cpi
         G0aZ9G0L61edNMBhXxZN2MFftuQxIele5vaV7V2KjWA4teDrdl3wfasXE9UFyrRxW/v3
         YuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983101; x=1787587901;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCEW9PijxcxcfDGLUs2wXu9FVF2tflvW7F00ZTIwITo=;
        b=S1Go4H7mA6eaS5fQt+Tuxr1Bmp6QPca9Ds9XyYY9nej6Wtr7PcYutG13nK1e3taVza
         vijUq5av957q1sZ2P7Nr33h/2wukNl3s4JQgBxtrbfI6pny7dzcyAGmTMDQ97OlGuFwn
         LZXVLM5U7cmDSRzFbE6hLWHwICIrQlVJva6es3DDD2bm7QIgQC7QvBbs8h11fWLw3H5c
         f3IYAI9Rmc88bWJ3jEAoVDNaYEnaprzXv2O2v8+Z0z2isTeBJPpgIq8lzPWgfijfPkFn
         K0vn2DuqrOZ+S+5DgZSEa/uo/L1Adwk5rQnF1iK1QZdzpdOeqYwLiKYTEZxXIbkiuHiN
         /EuA==
X-Gm-Message-State: AOJu0Yy9qJg89sEyaM0n/c5H9PHa+AWZUJYitQqVIEsu55SRIVRvMgQf
	mPVohAL97FQLSQZq3vGJxezWeDLQIzgTjYMDVFGOkMFtkNPMUiVM3WIJhZp5xcSV1kPMHrR03cF
	WR92149zYlSWZJM/8v0TI9vCAqwcsjxz/XKQUKD0NgU6pDapjaVxhG0afBk0/Zgmb
X-Gm-Gg: AR+sD13d0avh1UyRDHpLi/HOXKJhw+vaTICh/DINBRRTNs9QYp4lJXyW/2TtTKZ7jaK
	JNSP4Ylj/StPe8Ox6Ahz/l92QZJt9T+YdLuCoLmnyFRZdxFKjNWeNNA1HjuzfZvNUMZp0CU7zF5
	PFXv6+AtfOsUpLH6CPuminJBAOJsavyjeou41hFUL29lY0RqS3P9Omo7XK1cBnPTkW81RuCXlKW
	aMpr5uYy5eKzc5P/Vcdh/PHSTvlbPirdPxFLBGKdLIC7Anyw/OR6iwn0vIHbCRDZUCkUyndxdB1
	r26a1dBR5W/Tj3torLnAmCtSNojAC0hkMI0p20GIcNdgnfShTHjXn83Wwzq1ECrhBA/WSmnkFfY
	IApZzrsz/D9pcnDS+wLRezyu2
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr180860241cf.1.1786983101416;
        Mon, 17 Aug 2026 09:11:41 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr180859571cf.1.1786983100874;
        Mon, 17 Aug 2026 09:11:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b74059sm46995666b.38.2026.08.17.09.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 09:11:40 -0700 (PDT)
Message-ID: <bcb5ff23-cbcf-48ec-85c8-613a7d2dc515@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 18:11:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Retroid Pocket 6
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U5GWT4NRUeFdXQU4e4gt9rO48iex6xWJ
X-Proofpoint-ORIG-GUID: U5GWT4NRUeFdXQU4e4gt9rO48iex6xWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyNCBTYWx0ZWRfX9qsp0OsqE0PI
 esbuRRieBWxgcowxnYThs+alIeE9VMXxsjkICNNF6R0IX2uBa2Xh3gu47sMVsseWEOKweTNAf5n
 SB0x2U/NRVU9Xd95cxAo6Pr40wXiFmvMakboo1S4gw8nm1ccPPCFllBPqBsbbKpVbTL2Ggy6cqU
 oAKr4z6OZxaXvzU9DjpxTYO5O2o4OunfDtLO9DKfFxOICMbbbpZVhiA+6Yib/d8wjNGjWhqibQb
 ZQ9H96DVa8M2+EcpMEdLBDeO0gjTV3xAYH3XBJXBYXmedxazQ+/yGjLsQqjHbvca0qP5xgXlFqd
 2n2i3Xv7PN8WWXkQNu7DvjGaaJ7H5N26fAtAGbFBzA2rYhCkKyPn8m2EgVzkPx2wRv3ojbqhlRq
 k8rhKN7/zeJIAcSIdryfaxpOSuHqT2Z4Wk6+Fs5zo5r398GuWqiCseaSOTHsXjffkmdmYfGls0o
 Jpgp+1W1lFAWQJSwZSg==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a8332be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=A2ZNOjL2m-qR9UimgZsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyNCBTYWx0ZWRfX3cRxvdee+Rmk
 GGYMTRHbRghx+WH2aBKHdUDSHe4QHrq8PcTYbJPjtMsQtO8h2dr0zeSe2MEo1dNTQ4dDkzSg81z
 9QPqeCc/dpU0sJ6tK6KqRUQ+IBYZbKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170124

On 8/8/26 7:37 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5.5-inch AMOLED touchscreen.

[...]

> +&{/} {
> +	model = "Retroid Pocket 6";
> +	compatible = "retroidpocket,rp6", "qcom,qcs8550", "qcom,sm8550";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 860000>;
> +		brightness-levels = <1023 0>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <600>;
> +		power-supply = <&vph_pwr>;
> +		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm_backlight_default>;

property-n
property-names

in this order please


> +&i2c_hub_3 {
> +	clock-frequency = <100000>;
> +
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "focaltech,ft5426";
> +		reg = <0x38>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 14 GPIO_ACTIVE_LOW>;
> +
> +		vcc-supply = <&ts_avdd_3v0>;
> +		iovcc-supply = <&ts_vddio_1v8>;
> +
> +		pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;

<&foo>, <&bar> preferably (dtc treats it all the same unforunately..)

otherwise largely lgtm

Konrad
