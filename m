Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3153352030
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275715; cv=none; b=m3P6lRbIo9dBXNot+jxSjPS6ZXGw/KfFN6PxzFX+C/GIUtgD1Rc3Ppc6KViLUDcv7BZUAhURM0MvI4vTv/jaRRGCtktetr5gxFi8sYks+8mzAkHShvNa2AkibnMkJH9IELfcqNqi1n2ZMdy3UXPZM+R88zNDiqifqCNDEu9V+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275715; c=relaxed/simple;
	bh=DQn5wkZ5evtF2xsA7fVKvrXRFubdEbruQnpuwMWCwRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBaPRowuNpNE91KwwGlWz6KTz+4Ze/xqyxvCVPY9003QkkJydonrzVz2vamYmAOMafwnebzzuMtahsymIrJSr08X6vyKMWbPyq0emL5Qtaliac1YaMGCZfzgiP1syqwcEqiOT/n4xjoafQF3Gud7nZbUodzRTKMRYdW0bJKnEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQKhyyiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRfPS8Wn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQKhyyiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRfPS8Wn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7733Y1238657
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9ZCGpGKO/dzQP/sIYxBMZ+crs2O49Dfxdra2zpXf84=; b=kQKhyyiHYYxQwA0R
	6MxcmvLCW+wrwyNunAi95JsgsmC/yskTyq8Fc4ndmWBPZTftQci91VJYUANrZxoh
	DoDGwxI+aRyuZSqtuolycTVrvhxBhsSwjB3SEhRkE7fH+ywAN90XlNZAMiPqHwoQ
	5tjGyFaT7ooXp+Xpe/Md/YV0wjITc807WSyFvIhmLYgucXTSaLW7ytG9aLV8xOWE
	6PQf1CsfXHUnFGvVg0gSDSV0OqI86Sn9ORUaRf1nsMEKZTMpjIYXCyA8yDKZFUS6
	weJ3hiqFCuoChdQcDO0mfC11lG/Bv9ycsoNjlqubR8cljrFA7UFZP6SL4W6ou7TZ
	PvnfMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3svgw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:15:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90f6e66879eso111134185a.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779275712; x=1779880512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K9ZCGpGKO/dzQP/sIYxBMZ+crs2O49Dfxdra2zpXf84=;
        b=hRfPS8Wnkl0IW12xTK0Ctgzo5CV8WUjgBFEf4G6TQSjOyFakUWA8ngs/2YXrjNyd0P
         8bAjPvJCOTfh36mW0+dBXGNcnBWw/4xjSjhtO+/tuBgfhCd33oVGk6dJ5+5rGspRmxYM
         Z9LqKE9mhNWBeqYP9wJttjpGLWQuqG9Lfs9lm1k0/6XZzytpuC6J1jOozyVQ1DMC3URF
         sE/DpLdYqi2IZZOzl8sihGVlaJKxb7wTa0GFanAfTqZYth1xN5YEsZLHhrwWpE+/vhnk
         i8fGCbjUxkoxap5+DKV1qCJkwHWe+phOrmZoH54QYjGZnlBCD1E3fHvKnoQ+GPnXzOZ7
         IY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275712; x=1779880512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9ZCGpGKO/dzQP/sIYxBMZ+crs2O49Dfxdra2zpXf84=;
        b=U6zsQsoS28hCUngo8LpDm6cEes9wFPUbkxt2BAKIyUgw3Mi2NWMmHrv3MSE3Z2EdFY
         VNujsWEph6mRlsqOvSVitdNGBReZiF9BYRWPCl8PaqM7ZHk7UKVUtOgzXUFVLwbKctUW
         v/qo4HqAiP5RNiEWe4nt/DVYP4opsgSgdHXFoCop66slmqcawFL4uBongaTxml4O9zyc
         j6c4nb8a3nscQ2HfdLtSajDrWo7vcgSTIc+hPNGihMFRxUZkDSeCPdK6D61tEz9SMktB
         9v6x7PH6TTL+n9g07j2l61XgmjGJ1u04LmvPhZfS7hOtTpDmSDD0QNkrRPT6ozU30+UO
         TtEw==
X-Forwarded-Encrypted: i=1; AFNElJ+Pi5j+7xtgmeI0oPZCR2adf2EN4Pg8KM6AzTRRJW1IYQoX1ZH3DorDIeVz3twJUKwAg4cpeDZc7G37@vger.kernel.org
X-Gm-Message-State: AOJu0YwJYpJJquwFbaz/7qG9hDX9ehoSZadfmmz+B25wwDv9UNUZ/xIv
	01B8UHhFtlSDjFeb2rjnO4tgy/UWTijxtQwazK8Ya0JF2dHFeyvPUELlsA5SkxdeISOEzGyT1fW
	pZQhyvrf362ScA4klfG7nJmCMqOyuxUzBjjGUhBZE/ZqaekWdoKi7YzJef61SmDbY
X-Gm-Gg: Acq92OE954a5IukrCabMnwp8QakewyqR6mDf4fb9U1QGudV82a25X9LRiGsm6DziBry
	ghhps+6lMOcmYhe51cM61aDq3w0qFFUjhIQZ/zPvfHhCORApV1YaQodYfadIUlpFxIrxoW9j+3m
	KPFaLbpSBkJ6pwFKpEpYHgV7HAl63INmJsFlQCW7zfIEJ7QKAQN3OU6qRszV++mR0RbMVsNJ57X
	XM4cd0vfd5iIpMrdOV7Zfu+D4gbmyLnmkiLMBnPKtwPBRkUiN7bvx1u4I9pJx9N7GX05mjkEPTy
	MYCXKuhcOnp+Wy7cwUEv0BHJBas/3pSuE3Ci1nYjrdaTkC9O4KB3M/p8x70LjwPla+fi6UezEuC
	dvKr7VRagBH5+DQG/TNsmOSYcaIfTv/MJdnZy9j2sL3rmE4MrLGNLQUER2aAxt3C/1U8pvucpgj
	dF11MXC11oGlVrAw==
X-Received: by 2002:a05:620a:17a3:b0:8d7:a89d:958a with SMTP id af79cd13be357-911d05967b6mr2361727085a.6.1779275712013;
        Wed, 20 May 2026 04:15:12 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:8d7:a89d:958a with SMTP id af79cd13be357-911d05967b6mr2361721785a.6.1779275711450;
        Wed, 20 May 2026 04:15:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm850249666b.1.2026.05.20.04.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 04:15:10 -0700 (PDT)
Message-ID: <d20ed9b8-18aa-4901-ba49-f24e3c79e36d@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:15:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD
 mode
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 31WsXgmbw1VSOah8dQZT5ese6uAKrzqI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwOCBTYWx0ZWRfX1U4mVKEAW0Wb
 UC3ENUzINpileg7WBCTAM0s89JoQsDo3Rav2qFcecvuDKzf0b24Ocsc/3d/agc0DIO6buPocHRO
 V2dtvXQslpUDHA/CjjWpdmXn1moK+VXrOGxQ8rMyYO+LEPj30uJAAVjwN/ZgIobo3+cTUnI4Y3q
 HSd2Swwh/pium2pGD+TwYtTNOnkZof14VMbgtJBJvt7CU6kpuAwBSxJQuzdwRBrNBHoFk2KcRik
 VI2iwaixQW6mVccVhllC8ofRSRiQHRspEQKiwXVfMNZzHmINXDCAky/a8c5J7I2LMjHs0M1hvYA
 3Yl7q2xNRYdSIa3MWkAQRjSIDivXhwvgEmitUSRPLYDlWBG50rb8WAff7dJIhmcZVejIZgrB5MI
 6R/PtgJaK7HdUSk4bcA1UnwMHN44Tgp4DxJClGC/TEYSKsOUfHjqudNokezDg0ngpCUAeqHUjDn
 UWZSgtR/gOsda7wg/1g==
X-Proofpoint-ORIG-GUID: 31WsXgmbw1VSOah8dQZT5ese6uAKrzqI
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d97c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=028NdSF9W1XUqDdDnWcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200108

On 5/20/26 11:37 AM, Akash Kumar wrote:
> Enable USB0 dual-role mode on monza SOM using the Cypress CYPD6129 UCSI
> controller.
> 
> Switch the controller node to I2C12, configure the required pinctrl and
> interrupt settings, and wire the USB2/USB3 endpoints for the USB-C
> connector.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> index 9b5ed55939b8..8e3af6018dfc 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> @@ -194,6 +194,52 @@ &iris {
>  	status = "okay";
>  };
>  
> +&i2c12 {
> +	pinctrl-0 = <&qup_i2c12_data_clk>, <&usb0_intr_state>;
> +	pinctrl-names = "default";
> +	status = "okay";

Let's keep a \n before 'status'

> +
> +	typec@8 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x08>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = < 3 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 3 IRQ..>

> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "okay";

This is unnecessary, nodes are enabled by default

Konrad
