Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D6741C303
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431083; cv=none; b=UTk89BJImKV82Queqwr5Mh5M66PJiI1jJ7fnwGJOQBBa5VJPtoAtHefJcFciQQNrLLipxTIp2QvwgPsLJXsPspsCClYHfAQkc569pzlw2OwfjB+qNdQy6zLTqNF0jYxKN5D1ojoNEX1U69d3UgwjULOOh7TZ++Dk7Z2YVqRpOl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431083; c=relaxed/simple;
	bh=M+ZrPoiW6rlYRXjSW1gpoBUCFx+W1q0N97Q00cc4x1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDIn7Lj4F9W2azNMEBXqrmNpgTq0Mdh3YEgAPDI4r9NHtJ3DWEIw/xtGRMJ/MkQ+1I781Vq5FtmiwFVo9Fu/5cCPeQNfWLDGfVTk+hAgbaGMmfEEEm+daVY8hck7mIFXm0mNnqq1AWPH1p2mAY4WDogRzCxPjZczpwUccCU6JWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WN8s/Amn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVAvEsdu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WN8s/Amn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVAvEsdu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8YYg3783370
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4AYMjNCcKL/iIFYSfunYwZHGVVPbQuKrOjygxjVtYs=; b=WN8s/Amn7HSYv6ix
	XxXG+U988E4Ibnqsw48cD4m7wz1B66Q73LbW4efotby8SmN32dTXy41j+rr8GKem
	fo3rLRpdOEyKSosgHiNro6mlo6VpGKHOqNeUAW5rcqNk5LoDh85h3bBbm/hSm3W6
	f8gkV+ULrvCiMQAPIvbjlFQ2pz03SC1Cl31yfJOUUS8UTmwQGASQo7e1ht5fSjQ/
	UNYIwXlgcsPPD5LyE02iGEMnx0YfBuyVDjxw+wyYZET0xQufGTQ9YaAYog3vwwb4
	4T7ISC/MpkCiXhdqncQ21NTLVpQSRUJpywZF2aK+ppGGn4NInW8C44latQGFxZRC
	79Vq9Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11sdya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:31:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84777e9b51bso10578871b3a.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431081; x=1784035881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4AYMjNCcKL/iIFYSfunYwZHGVVPbQuKrOjygxjVtYs=;
        b=DVAvEsduFtjaOX2SWfgR6mleY6nX2LbRw+k7PVQmDf3dCyqkVGDlQugRHiDDPlLhZd
         U+ZKWYl5+FhiN2x+oGcBd1i6sbLxX8J1QTAvI/7qZNf3rUNY8nbuX+09boosPri2mYyg
         lOqIPluE1QHW3xvGyyDiMrcA27NIZGYkveb2NwhdtZZJ5XGlX23UxENuo7cj1oVyRESC
         yqGAse17bFxYdMRKUzEcqEGIomFwJBVOc5I5HaxClJFFINvRN/YOyKCVfZfSJaQOCsxR
         strPEWuOY+sNcaY0cIxSk9hwURZEqk5aSplEawXaq0OHhONH3N+ADrYJ1FJpD/3jn4eQ
         HdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431081; x=1784035881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4AYMjNCcKL/iIFYSfunYwZHGVVPbQuKrOjygxjVtYs=;
        b=KUx0TJsYNX0ZOHGBAlR9zNl0D1TLL0NWlK8qZ40OfhOUQdwt08ddMbdSHTtkXGb7Lx
         3dt90eFR901xU9T1OLhTVnsqYhX09UFTooDK224klPR8/r/Rn2l4BN3Gwgk+NGKXtRJ2
         LJkjG8vfcQxOntj6p2h9aGRudFxmHC6lfgNfGoVa1zS1Zt6bDGlF2gr49mkp1Q0WNWrk
         E+0PSmxYZlrCCOTywRQOSCEFOmZLzbUFVS9/nljaGCf2Yiy7MX56jyMc505AsPdGmXBT
         KeGwJf+fHJ9QA964t7SLoVy90ZtFuCMhZv1eUHhgEQCui2BhTSiV1Q8WHpDrpeRfzBbb
         gI0g==
X-Forwarded-Encrypted: i=1; AHgh+RqGYmQ1f7OKmexj38QyIPRmwNUYUYWbQdIlCSNcGT4NWzK+d8Y0YpC+d0fym4df7+YH+YXC086DDJPK@vger.kernel.org
X-Gm-Message-State: AOJu0YyEasVEauNL7AwMhxwNcishcdJwluOAIJpQykhpdLoM7n0TJflA
	J7eJYRQ2n6yiMQPEws/NSkixb/Hz9KYcpwG9r8lDEAfTVRLvzmCzODnnd8A4qSbDauhinYX1q/w
	Ju9J6BWYCJiA/FGW8X/jd1daKNzwZhOuTM+qC30UYnKzUnSa1Z++GGeMjcc/RGK6s
X-Gm-Gg: AfdE7ckX9NVCpBgdTZQ0oVwRmg9VfhJoQ9vTSjLooYrFg50nfm2Xage7R6xrF9gNdFs
	2DXG9w4Q7sZHXxyVJeOgd3HbQKslvdRBxAF8AK98NbYWd5fVZfsGW++pYUic5dI4B5PUcJpwTy6
	OetN/M48kLSciXGU0JcApXQUuoHRWL9RYRxPHqgrbBjgyPT0MBJNb2fxjqyIZ/V40l4NMuabp5j
	E9pToM4jHtaqHfxA0MdZmSp0vi6T7rHEgrB9AlSDKZPLbboPw6zhAJQ20cjb272a/cVDy89mvVb
	TUgAT/fvl747RZ8YeJ1vXtXr0Cdai6/5LLHTTkTvsUFgZgroJSQGGrNr1y2U5QS/4XISy+DwD0V
	WZ3cprBdsT5Uy11g+tVeRyqKrbkOavRyqXc9MsVnNGRE=
X-Received: by 2002:a05:6a00:2301:b0:845:c6c3:5e75 with SMTP id d2e1a72fcca58-84826e13ba3mr5007791b3a.42.1783431080620;
        Tue, 07 Jul 2026 06:31:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2301:b0:845:c6c3:5e75 with SMTP id d2e1a72fcca58-84826e13ba3mr5007745b3a.42.1783431080083;
        Tue, 07 Jul 2026 06:31:20 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b96c0fsm5451255b3a.20.2026.07.07.06.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:31:19 -0700 (PDT)
Message-ID: <6e343fb1-5192-4a5d-b6d2-635f9adcfe9e@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:01:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
 <20260614081743.5E1141F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260614081743.5E1141F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cffa9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wJasU89hPeDluGEzl60A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: rItjQvTqe8P4QWH_izKpaxE1Qhnm4Uu2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX8VfSVAUp3Nu3
 zL75pw4ki5Z2KmuvIq+bs2qLm6D6xiULLO7bkhG+x5YR1PwAhriVKry0x3LrMIIPIpxBPf6G1WO
 GGhZaRVMzKaZkRNve0fsUqcxqo1Z3lU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX732Xfddu6Y0J
 ndUGxLGXX8nEcGLsk0zmr4ixfNsw6kemonPEZNA+JGc7BldURF2dCEtB6e7EQdPTaKqOrHshetb
 u+0kXZIFxt89Y5j16SVUhQHzMQ5UwaSLerVr70qnhHbmSapSSZme3RX9TLwYvqsD8CDMuh8T0ll
 a85sZYqip3OlUD4hfVSDjTyz/OuHRwDMIJdZb1B9HwyGnVY91aSLyT4nEojl3cFbQnUXP8Xx9ki
 2w17k4+/x4AyynbDh0cMmktBEu1H8SAhwupccbsy+jXa7dhHvv8RrIrYE2z6eipC0u5JfLNXevp
 PASltgMiTk451HmTi5FbiLARDEny/W4V+h1SDMa8/QVslswyUo8ASMw0P/Kg52mZt8COwWpk2UC
 e26m2psOOCKVykv4dzJStMXNRN+Gx7jpF4Ng6PvmRRC4TtR9lKNf9k8T12LMruExgVUmPGfawjV
 Zsvv/tmn1zCYuIdl29g==
X-Proofpoint-ORIG-GUID: rItjQvTqe8P4QWH_izKpaxE1Qhnm4Uu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

On 6/14/2026 1:47 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing Thermal Sensor Provider for VADC causing thermal zones to indefinitely defer
> - [Low] Devicetree Naming Violation: Underscore in node name
> --
> 
> commit 7b5021a0220835eeee60f0b85faf679ed9b09977
> Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> arm64: dts: qcom: hamoa-pmics: Add ADC support
> 
> This commit adds the ADC node and defines channels for die temperature,
> VPH power, and system thermistors for PMK8550, PM8550VE*, and PMC8380*
> PMICs. It also defines several thermal zones corresponding to the off-PMIC
> system thermistors.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> index 6a31a0adf8be4..2e746ede850f8 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> [ ... ]
>> @@ -189,6 +191,90 @@ trip1 {
>>  				};
>>  			};
>>  		};
>> +
>> +		sys-0-thermal {
>> +			polling-delay-passive = <0>;
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> [ ... ]
>> @@ -277,6 +363,142 @@ pmk8550_pwm: pwm {
>>  
>>  			status = "disabled";
>>  		};
>> +
>> +		pmk8550_vadc: adc@9000 {
>> +			compatible = "qcom,spmi-adc5-gen3";
>> +			reg = <0x9000>, <0x9100>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
>> +			#thermal-sensor-cells = <1>;
> 
> [Severity: Medium]
> Does the driver for pmk8550_vadc (qcom-spmi-adc5-gen3.c) actually register a
> thermal zone provider?
> 
> It looks like the driver currently registers IIO channels but delegates
> thermal monitor capabilities to an auxiliary device named adc5_tm_gen3,
> which currently has no driver in the kernel to bind to it.
> 
> Without a driver registering the thermal zones via
> devm_thermal_of_zone_register(), will the generic thermal framework
> indefinitely defer probing for these thermal zones, leaving the system
> thermistor monitoring uninitialized?

It is true that the auxiliary driver is not yet present in the code, so
the thermistor monitoring functionality would not work yet. The main
ADC driver functionality should still work.

I have this patch series for adding the auxiliary driver:
https://lore.kernel.org/all/20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com/.
I can make this DT series dependent on that one when pushing the next version.


> 
> [ ... ]
>> @@ -301,6 +525,18 @@ pm8550_gpios: gpio@8800 {
>>  			#gpio-cells = <2>;
>>  			interrupt-controller;
>>  			#interrupt-cells = <2>;
>> +
>> +			sys_therm_0_gpio3: sys-therm_0-gpio3-state {
> 
> [Severity: Low]
> This isn't a bug, but does this node name violate devicetree conventions?
> 
> Devicetree specifications strongly discourage underscores in node names,
> recommending hyphens instead. While the node label (sys_therm_0_gpio3)
> can use underscores, should the node name be sys-therm-0-gpio3-state?

I'll update the names to use hyphens instead of underscores.

Thanks,
Jishnu

> 
> The sibling node sys-therm-1-gpio4-state correctly uses hyphens. Leaving
> the underscore might trigger a node_name_chars warning in dtc when compiled
> with W=1.
> 
>> +				pins = "gpio3";
>> +				function = PMIC_GPIO_FUNC_NORMAL;
>> +				bias-high-impedance;
>> +			};
> 

