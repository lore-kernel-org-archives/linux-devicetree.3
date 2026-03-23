Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69039DBEB
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268282; cv=none; b=TXsrTzGqDx3rlUa0T8KcabCzZTAGJbe6JhgiA2Wa5y5n+ZD+k1R48vBP/GcNN3pwRt1a2zjTEY/q+cCu9dFl+ZyfthchjT4KI58N8svB5PabwGOa50S6MYMC0kUPXhM8sUMdG8syh2juvgRefai3Xib4IQbze5DvM3niVQ0BVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268282; c=relaxed/simple;
	bh=+NIP/QEBfbHgGlgR+4OsAbfezPvxpfUc5R2/1QflK/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fAPMi2ZBOjPvmrXEUYmhxAcniCw9jI6L1jpGVnahVLRaDDUM0nx2FZcoMJGU0kcOxT7FL4oXgM+Vh/fGJB5bljnCbj2012nORzleCzB+x+OZUVgbf/+opVpek8kI/tPO7hTUfFjxJy1YKTq9UKjmD7Q+GlnO9r5PiYhAjHykY8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcUhNLib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiyBDgqM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcUhNLib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiyBDgqM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NA2BY51584129
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQxWWwGHP3smhnCWo5d2Wy5SBQHeT3nOxa6W8LchT0Q=; b=mcUhNLibLfvjaoxl
	jU/IGGiDRwre5ILwv0MZ3/HlIYXKrrVoID/KgoK9De9sG//Tg3jBfKxix4c7gKFd
	oSG4/izB9JfiloIcPMvgkIrKb5D77PkHhcwB03k4b9cIPUvdaPNlyFtYBguzs7uo
	N7Rxrvms2aUsE84tmw7v21GvZRd9IPequNsNgMymXcUp5JZc7W6SDiS0hQV3ijsy
	6h0gq43KsFSOc5I44of60/pzbkKD6PyIs+pZ6fOjxtl02hdIYi8Q/L6zdKzKm9Et
	zmVFjSTWsnPyS6nvMBxb8cDdX6vxd+Jd+U0gGVKs6drfDsbhgg/0QkuCxM0ysRh7
	5g/86g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng5aeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:17:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093245c2d4so18646751cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268276; x=1774873076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQxWWwGHP3smhnCWo5d2Wy5SBQHeT3nOxa6W8LchT0Q=;
        b=OiyBDgqMOHYUkvTb6kW0mwLr/Z7Tf4yUuRapITok7uI1s/IFX9hdyVCJTzJZvm7eqQ
         r6hcDWA9+92DXf+AgWBrx9pumtnFDsSWXKOkU8ceJHhItyyoMc+Oou3rZ0ou4w25XiQ2
         8n26xl2t9tjlxNFsykVarrH+qtNYMwqOVPNKQzxmmW9OiiP/q2LUx22L8WFNYSoeKjK4
         +0G2MArsQEjdlZvrHmxfh9h9sVG7jNBLmU6fL3FG6jti4qBLHFzr4hBB+jisjdkwf3an
         H4Fk7Wamx0STn0DwFW2VykGEC1sAEyy9Ld2v1QGbh2z8GchJfCO8ZeH7XlYB1qPR3i2V
         2Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268276; x=1774873076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQxWWwGHP3smhnCWo5d2Wy5SBQHeT3nOxa6W8LchT0Q=;
        b=ZrieUnou/NmMO2++Yt+L3jXWURcyoXE1x+xzj5SEU+I6OiaW95TdJ0jCysn2/BrHdO
         btytf4htGpcDufMV0p0vT5QXNNaSMBbnKtZJv3xFZCY5Hax1z7U318jVR6FFg7paT/RC
         wAHlpdw+NdC6QR9tOOy4wgkEpr4amONHyxsgl5yWQlfg/d8dB8kQyyy2llOfR+7PbaKf
         Jps7AmNrE7KxH9Eq5bVc7tcGeIVyI41A9ZPWYi2qZ3FOjq1z2ZZZQqazEivEFBylTkJ3
         ZoXAU9TMhgrR0n+Xfg2i2PUA0orrg7YSPFfDWtob36Xy7Xt5SAfe3V4e5totE5PhR+uw
         ijrw==
X-Forwarded-Encrypted: i=1; AJvYcCUKazTeA7A7q3y4OjW51MpjiL2np6IUxAZZYTFeKg+LHwq3AJaH/5gAxTvSLlxM7h7lL0RjZyW388hA@vger.kernel.org
X-Gm-Message-State: AOJu0YxkK4LcSVr2ChJ9CDrctWDVcD3hCc80hXmbZkifuYyhvAxL6YB2
	WHIX77wt9/Kt08IAceGAIhfhUl59Cp3qekju1WPaRe8X/PfFmqlahexAssLqEPpw6kfE4Pu2elR
	ZMinh43q4nZvWRUm9ib9KgbJ5nsmNfek+O7xxWogVV5WVude1FrwCDXs3OLHCBQ2e
X-Gm-Gg: ATEYQzxDsjgLaPyHxnxVUOOGKaYKLj+GdYj9dy1gAG62EcHsILcJ3z/fYykwcxQ/98M
	Fy78UmCKF90XvSDEXolr4lWGhD2GtdVvXztMe99TMbICkegI4GllqjlhrXT0FBMNI3z4jV/n9so
	ojTE5KdA18XCPOYQeVUb31oFpVgjmvShELMwvlNFjH+f6wQ+AfaCvA2ZI/O/2cYsitX2y3JkimY
	CuD0IVwwTbtIhuUlnYJeDGbZ7QF5MenPEG9CNrVXJ5aRO2GNohiGBIG61IFLbZM+MYFR8FRmOqS
	eu1y1ScqPXVSyJhhYrWdb29wAyiP+Bq3pzs7487MPz5SsXsn2uhvU6cYxmmhZaY7A1Pah/5A3/c
	RkQPZCf2FwuINfQwriS3RNffHtS9ZAVHyruURFiQkjpWdCC59eCd1Z9Y/r1J3bYX2ewjnEvmnCl
	buaAo=
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr135242281cf.9.1774268275736;
        Mon, 23 Mar 2026 05:17:55 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr135241951cf.9.1774268275248;
        Mon, 23 Mar 2026 05:17:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43ae8sm489737566b.6.2026.03.23.05.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:17:54 -0700 (PDT)
Message-ID: <881975ea-cc16-4b26-9672-731c146a1ba8@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:17:51 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 DTS/DTSI
To: Maxim Storetvedt <mstoretv@cern.ch>, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: marcus@nazgul.ch, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
        abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
        kirill@korins.ky
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-4-mstoretv@cern.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322160317.424797-4-mstoretv@cern.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -bPrarrWflhtE9HyAmDeWTAqkSt3A1-t
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c12f74 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=jXqzSn9no9U_C95JTX0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -bPrarrWflhtE9HyAmDeWTAqkSt3A1-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NSBTYWx0ZWRfX/lu1HVDlFPKc
 KhQESi9Ko8kChOiK62Hw80RTT5WAeXGpE1+iECA4S/TApMLPsRL57GNEpDXU3sOcVM8lThlqOaN
 B7/hP7/nFsfEyr9KZuNyjDakcyZPhsSFn/MGlyVt9pdCvU7RW90s1xeD3/nIQSuyxtnQhIU13rM
 7tSlqsDMO0uTIvzPMkZ1fFM3nj3eYmiNLRN9+9HQo0bRrpTf9mNUI/nq/K3SowqjW5k/oalYaM6
 YJsEmVIaoP2nFZhDIbRdfFJLJh/LfYC6++Jtui/L136tn5OrGCHbe43Qbf/2S8+7onYwUbqCaQ1
 q+FoL+FK/ci85KxP/yLFaxG5cURhW7xWXu19yd43HsUuaNODjdhZFGRrz5CVNpbGreTjl8uDYnC
 0BXLgEEPX8iDgwM8qpc5tzdwx5FKHCHgjE1hk6vVFbkSbS7NYJjuhwpv4VxiGVVy9z+1j1/1MMj
 nJ7VhlesSKs+qax9zFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230095

On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
> 
> These use a common dtsi derived from nodes that were able to work on Linux
> from the initial Galaxy Book4 Edge DTS by Marcus:
> 
> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
> 
> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
> Valentin Manea, which shares device similarities:

[...]

> +	model = "Samsung Galaxy Book4 Edge";
> +	compatible = "samsung,galaxy-book4-edge", "qcom,x1e80100";
> +	chassis-type = "laptop";
> +
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +	};
> +
> +	wcd938x: audio-codec {
> +		compatible = "qcom,wcd9385-codec";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

property-n
property-names

in this order, file-wide, please

[...]

> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;

You provide 3 orientation-gpios but there's only two ports

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-CRD";

This should reflect the actual machine

> +		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS3",
> +				"VA DMIC1", "MIC BIAS3",
> +				"VA DMIC2", "MIC BIAS1",
> +				"VA DMIC3", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS3",
> +				"VA DMIC1", "VA MIC BIAS3",
> +				"VA DMIC2", "VA MIC BIAS1",
> +				"VA DMIC3", "VA MIC BIAS1",

See:

b49e37de8e70 ("arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC supplies")


> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u, please reorder

[...]

> +&i2c8 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "hid-over-i2c";
> +		reg = <0x5d>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply = <&vreg_misc_3p3>;
> +		/* Lower power supply is not enoug to work. */
> +		// vddl-supply = <&vreg_l15b_1p8>;

How should we interpret that?

[...]

> +/* usb1 covers left side typec ports */
> +
> +/* back(towards the display) typec port */

You already have these comments near the type-c connector definitions
at the top of the file

[...]

> +/* DP-HDMI bridge connected here? */
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	qcom,combo-initial-mode = "dp";

This was used in some previous version of the QMPPHY-DP-only patchset,
see e.g. x1p42100-lenovo-thinkbook-16.dts and align with that to get
it working again

[...]

> +&panel {
> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";

I think it'd make sense to move the compatible from 'common' to the
16in DTS then too

> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;

this matches the common definition

> +	power-supply = <&vreg_edp_3p3>;

ditto

> +	no-hpd;

really??

Konrad
