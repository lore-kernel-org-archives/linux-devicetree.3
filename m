Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180BD3ED3A6
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545273; cv=none; b=kZ7iX5y2MVfYYpYZZpb4tS++yAT5E+QZoY8+zPUiFBnYWE6BBivLZf8ng0WvvbaS9XMTDWr8tSTHh+1BkHbGHdzxO2Rnm1BR/uaIlnljO5z5nSa8p8yxb8+JdrtuZu1yftFKBjVAVRzzzQbrvHlKbOtJxIVSsU65EsEzsel4Lbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545273; c=relaxed/simple;
	bh=F0Id2R6D4+6Q+hVuzbFirx8hTiaJFLEnYlVLbqt10Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVG6EAhoyse5QPpb5s65BMdfJJ6g+d7I81bDs5Gcqh9vBW6u0dhcQ6MDMRCpfBCyUm4pVNKTWbntNNTFi3JtxmJ6fapGSPjTyK+NIMdJLbOFlSMoZUeYkYlY2ZHH3yNgF7EZEcscHr7UuUGgiV80rYGXDF0J05d5UnDy5hdv+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYp6F/dK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e11WRajb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYp6F/dK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e11WRajb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvREf2183581
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dm78jN1c7v4bXT5XqpGozBlgkuCf4buZm6eYnX2yRpo=; b=oYp6F/dKMyw1NsTS
	OVyc5jruDmHjTqPawP2hRiY8FNGR/zosydBPSdQSFm0myZH1ykRC3fdJEgrnW5kh
	Oj2QO32yr5dJljXtVF2JEEIxdvdItfxnkU1db1VYPbzC/n4LoULf7lM0Ort7RnSZ
	0eMcYKrUsOFmwgmNjalHdGrPNIRiOnKdKVsJuMPEx8eIy+2CDxvxJqc6FpPGpaSd
	kCaE79JZ9LjtfxDT/laPg4RYhFvucpoQzXmkRESsZ6cbZl2MG08sWRW9k5S5K0+n
	9Dcsjnpubo0t0hUPc3IHQ6en5ISERRmBKHzgdIcEHrF+JkunU5aK9uz6BYxBO8Mk
	C1v96Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg8mux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:01:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737ddaf8c57so242396137.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784545270; x=1785150070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dm78jN1c7v4bXT5XqpGozBlgkuCf4buZm6eYnX2yRpo=;
        b=e11WRajbPYMi3lAJIqabS+eQr5+fLg69NGC3vW5Egs2m2qpZoyIUEmgYAZLxZLcWpu
         dDrON+XOLF6eDygCPXX2fD4pyTB0hGjpAyskbPLdiHgK7dznjckhZmOMPmwBD1b8BUBD
         qAps6w5rSkP5ZWex2WsCtXKCxx7B+143NN2dDayNFCSRoCqxQWPMIJ9sB6B12gDzn7WI
         z7aGsGAGh8B7ETT/ge9ALMmCEkvtNALl741D2hMVDkRmBaI8a5s5inFXDiEbCiJJ+/pB
         ffvoQol3s0wWwFiQtMrCzZN8RWFxWCTQWNIfta0wJ8yqOBV1wTwWKUDtSRmGZjPzQbbc
         5YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784545270; x=1785150070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dm78jN1c7v4bXT5XqpGozBlgkuCf4buZm6eYnX2yRpo=;
        b=TzsXrBqnFe+NnUT2CMJzWfJIXvcxxfbkpxqwGlDaQa29dh0GsbkiQI5IFgI+uZoxF2
         1ox5OJEQZP8X45ZGgyQHhFEjv/xgLIWqN1VkG7TZo0ejoS5xvxJUeamZNCEmxkudFL+Z
         WWs54vvElGW9P0MgZFVZG2W6lBjbQOoWWUa+n+oTErnz/wIv6SKY1trBq+g7Yf19aUW2
         kPNhQ+vtMJsv+la4+hm5UDo3NI6WbKydSY5D/Gl29jruC4/YzqVQmumPz4rcV/ccjgm7
         Eewr8Eq+JkhozOZ5Lq4FD6f7e+kPVOSGUlxiqG1GW4fBd+cJwhPvhtTFraSFaH0kFtHf
         LVtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDrx6swhwvJhF/Xg5J7MpXd/dWBG7PtXVtobo4xu/N6LJZYhdEHypQV7Les9R7YCBzqb2TJuBPw60S@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhrjd/Z3z+aJS203rFCGHoKzbCFJg3bk8lYNSzRF6b+VOpkeJj
	rmX7kBVLcSyxymm/b4dIJGlMC9TTZxVyWZfEEK5QRhM461wvt/mh0tUQfUWwd82Xg5qIcph5B7y
	jodkimY02ZufglFQGb9Qxukx9KjZqD/pcBw6OKjdsZq8oifY4MjUWWS2ElRWGNI3F
X-Gm-Gg: AfdE7clgsVwISXYnNzvF6Ga22JK4vSVdCACGO1SoGtwZVcGs/hX08aDODA+OrEo/pWz
	OFVsR4ef9pefKcccNi1Rcg3G1ZEfBhLmquGtrFOK9AY94V4jga/xAsEIWbT+9K563g7rX/nsRC6
	cezFzJTGtd0nS+PUpts0Ukegj5yttosIHUWMyvoEH/gh9M16/Ucph5ESp1m1/ViWptBZojQInoe
	QVlK6UzWqwZrnPOvjEaHoI9knNMB7QoHwQaBQN1RLsSPmgcxXOKXzZQwEZ2miyGWSAU1BS/Ebgb
	DMBW5QIto2hkPOlz5gF7+xmJeO/lSEVVxd2ST++NGXTTTpczD/Vm2Dvj7MryJymtJQx0bo6JrQ7
	LxAY2kQBt2p+usbhlXHgYYIW5
X-Received: by 2002:a05:6102:3ec9:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74ab474f916mr11096137.3.1784545270130;
        Mon, 20 Jul 2026 04:01:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec9:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74ab474f916mr11083137.3.1784545269637;
        Mon, 20 Jul 2026 04:01:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009add9bsm448168966b.1.2026.07.20.04.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 04:01:08 -0700 (PDT)
Message-ID: <a560a3f6-0bc7-4245-a5c2-b5d0f011e087@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 13:01:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260720-pixel3-camera-v6-0-afe419bef476@ixit.cz>
 <20260720-pixel3-camera-v6-1-afe419bef476@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-pixel3-camera-v6-1-afe419bef476@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1WWe8YDapdJGpE43oK6tW29uH5pSIBEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMiBTYWx0ZWRfX8dfTunAHNo4S
 h4qo6U54oHgieBfO/LLrNL/49Rjp9ZvfDrjYwplBDsElZOgEEDCMN5oUcM7juQpUuCUHhpesC98
 7Eh4jVOYLFX8tvH/4+32x9JJk8sSeJExL8QKVc9RVg3iXeogAXRgc6QU3Nl7q54loeY1bct6hQh
 gQXRuzaBa6+jKJyMNP+xqsFUHpk0VTrBQB4J4VQiw4CXHDcc9NlSbQ+vEPs6ukrrWljQScBWzRE
 BNBXIZfnlxYMqorzo8FRpQrko9OSNcGZJoPTZ053ON/tUIdbmdLncKt3HoKKlQex0WFh8DKAOSZ
 8dloAZmXG7NOSULwzRr0P9bZdKZXQjPnmuVHq8X113wd73onZgM9ZlG1O3pnRBAplcjELQ9bMG7
 TPFbDhzy/R2+XidliIpm/f2QDar/Bl6lZ3aMGiYhEU2nrQIa7EO22rWeLf9XTMHw3sx1A4JEhi3
 zEhDfCCB3ue92gypkKA==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5dfff6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=osP1sAzF5YgUTzrecnkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: 1WWe8YDapdJGpE43oK6tW29uH5pSIBEC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMiBTYWx0ZWRfX+ZZVoUGv03W6
 M/QTkK/ajuxziEDNseMNVVRvfe2MdVxTyaHZsJXAZwwSBISLb+dpiv9ay6RxjX0Ir9ysEPJYdYr
 01XqsKAkNIeCRFtCpZRVD1DY4Gt5Xtw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200122

On 7/20/26 12:53 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).

[...]

> @@ -127,16 +128,48 @@ vreg_s4a_1p8: regulator-vreg-s4a-1p8 {
>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <1800000>;
>  		regulator-always-on;
>  		regulator-boot-on;
>  
>  		vin-supply = <&vph_pwr>;
>  	};
>  
> +	camera_front_avdd: regulator-front-cam-avdd {

This is better, but the regulator nodes still need to be sorted
alphabetically

[...]

> -	/* front camera, imx355 @1a */
> +	front_cam: camera@10 {
> +		compatible = "sony,imx355";
> +		reg = <0x10>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&camera_front_avdd>;
> +		dvdd-supply = <&vreg_s3a_1p35>;
> +		dovdd-supply = <&vreg_lvs1_1p8>;
> +
> +		pinctrl-0 = <&cam_front_reset_default>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;

https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/

Please use that for both cameras

Konrad
