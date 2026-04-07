Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032E16FF37
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 04:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775536585; cv=none; b=hU4cHzMfdJjJavLOEXm0TKyYZs/l+2o2JR1L7v6rj8Sr0t2awoaC2s3bs/7n70dNjgNp46Pkdb+NG0DvusBMGShvD8ZiTF+rwjgN4Ck8O05n+6PLH0htm+ySImb1QZtrA6BKDrC8Pre/lRFUmo4fJQ2UaQ/5ghqOkxFrEMQNj7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775536585; c=relaxed/simple;
	bh=JgDKTasJUayLCHD+Kc/rGxSiOf8rZ8VEd4Sv851vOr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVZAwYcyqOEcCrizQVT5g3OaqbGEu4GNDd1SMv1qblxkLCL3Jwn7uh6GSdHWxvThi5yb6MfKSAJaqj4Zo4sFR8u8tzUbezho4piOMWIvYsddlklL2/w7gsopOUOwChKpxayBoO/k5vWnw5ABP7F54FuC9xAXAYzAlzVju7/sRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lf0FvsxA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ozj6roag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lf0FvsxA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ozj6roag"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ2ax492497
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 04:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J94ZVuzwu9K2fbOoqhqmXlR+x27Ar5N3kXchAi9R2to=; b=Lf0FvsxAlVdOcsKz
	sF0Sq3+l3YNb6Mvm1IVITwmD0DWFI8Bsq/j+zXulyiuQK4O1xbuIHsLrPOAy1IBG
	2c+JWW7Fl14WpvIyd3mzyci1y/c0LXMLMhDlV1u/AgSnkh2AJmIbcUEj65G7CP32
	b9+WUuofJV+kwMEqJFziUAdJ535tsLvS4rxjWFjvBMJ9T7rNC0/egsif/+IBIoEk
	0lkN3h/a8mrRFUiyBHFwTW84KiI9JkQidDd0ta5MNojQ9ToCFyCoWCE2wRaBcPax
	SDVjZA32ssIBfvM6uF1Pb1HOcxWNTr5s/MIkWiojdDm9mVtU17MXNKNykikoJdOC
	LI0LhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8s0qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:36:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c12a3bbb9so4791458a91.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 21:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775536582; x=1776141382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J94ZVuzwu9K2fbOoqhqmXlR+x27Ar5N3kXchAi9R2to=;
        b=Ozj6roagpXV1cA0sjfoj1KAYtOixg6/IG4SckWWkQNHXtKnRP8192NvjG3t3BOL3zB
         wIt54FaD5Dmui2aCKP/b6CzG1+KoqZlV4vbZs7RJf/Ez63PRbSWT+IEGUmXOXNk5vyhl
         xUo2wQ+uu6kmqjVUWFXVHIKg22eNZCYCpUaU+TVzeuCqigbFacHUL+6cAu4/Ny7yfAoz
         6NU5qfDbXaZYkliNzEKwVHta7sCgLCMB3c21RTFx2fvZM4NutqVJXo3rYudu0Fbwmm+6
         oSAm/yQB/eiyX3u40Li5i6SFnnKVvg+xuVjgbxDJXHNOEVHfC51uPvXOI2p0Dn5d/sz7
         zG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775536582; x=1776141382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J94ZVuzwu9K2fbOoqhqmXlR+x27Ar5N3kXchAi9R2to=;
        b=aA62K2HGE2kUTpJ+DLlbtpdCBXUynCrR7IL0CYLla/xebTjA1AXbid8qLvMYprXtgV
         OqtQTot1WUuJaweObDsBoU4ZMGRfqbv62KpxET7AJLwm6rzuIMdIyGDWBMrBfU2nqM0R
         1wzd3a8W7jOgupAY7n9v0l9D5sTxSrxIyDjc8gEX8W4RbaGeEh3xAFTM/zT8Zplx23Ga
         Yjw/iCaigje7C1NdGhXgFYmRc5WMiQwgxsNED/gPtjlaMIGFQ28xHSE6+7/yvC0fDpAu
         k92Xpi/YZwJzz7isXc5gYzXBA1VwErsVt18nfowZTQZoSYwswJ4COP8B4pwZM4wyIaEN
         a/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/HWoZdSkjztvJOuRV0M4k9LZfHjdJMmflJlM7w6vuSgx1xHT74KS0lSYBupXm5L8fhCM3mIrwADLT@vger.kernel.org
X-Gm-Message-State: AOJu0YxlaPFlL4SLHzJxMB57HWgtxhbkzpDG8W3M5gyTAz78Da3voumh
	yGazEf5LLlgQICp5w8aLZoFiYpH2LO7GV5kZCNA2PJFIwSooE8y6la/yfM0EViSH+Pl01VhzimB
	ER5ABiYico0alNtlWVuY0+2pTI+tG9yVQgmn9q77r79HE4BVGQcY5Oy0XJ701M+8o
X-Gm-Gg: AeBDiesOmaptLhvELYCtuWhjYjwZ6WFZfhd+fPkiZOP5KYTWx2jhO/cNGuEm9s5LxjU
	tcX7ofUdSBF5B36yN3KaUS23RjjclqSPBGmmc0hV6yzMAX9Op+J41UHKM3R85LxkMJaTlSyuTn7
	yKdt1XyY4mt6+rME2+trFbSaCsjoXybCI/WKJQ4Z1O0q0IXva14hGhLXcSrtM5LENoZwv6EhSVV
	BAZ8ZbjkevfV2TfiC35Y9OFQS8zIGBIc8d7PLkY4shKINu+iy5BD2ZDBhX+kObWhnJqzNsRaxQ2
	6yIBsBV6GzYZVL7y7zzZ9KGpqr/Xj6gZhQLsOE3yshlKoK0Y4kuV96rxcLEb9Pnd/WErHiCd7wG
	AVY+Y1peCtBpNZf/ACb8di3vmQPqSsvke3BZT0aDSJfdQ+CquMqhL
X-Received: by 2002:a05:6a20:3d05:b0:39b:fad0:6edc with SMTP id adf61e73a8af0-39f2edaab1emr16119211637.6.1775536581791;
        Mon, 06 Apr 2026 21:36:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d05:b0:39b:fad0:6edc with SMTP id adf61e73a8af0-39f2edaab1emr16119185637.6.1775536581336;
        Mon, 06 Apr 2026 21:36:21 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76cffd9611sm11404687a12.17.2026.04.06.21.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 21:36:20 -0700 (PDT)
Message-ID: <f05ac643-1ec4-4700-aace-c1a9d0cd9e07@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:06:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
 <ggkj63sjoeqedsahze423723qs6tvcgmlnxqn2usqipve2yktp@45aas5zypfzr>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <ggkj63sjoeqedsahze423723qs6tvcgmlnxqn2usqipve2yktp@45aas5zypfzr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Bga8KasazUeAAHdvYCZUagaM6AgmoZZ0
X-Proofpoint-ORIG-GUID: Bga8KasazUeAAHdvYCZUagaM6AgmoZZ0
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d489c6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gBggw25WdKopFYHr0XkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MSBTYWx0ZWRfX93/0EnJNYdal
 hwDqlMrdLRLG8sLB0xiNloDnMPH4tVO3ZpWUTFkCTtIveCB4aQOoInmusZXFD2bJwD1nQHlmMGE
 2CkztYz2GJSk8qTuS7ImxJlodXm9xx2HOGIJ6Wh6RHCE4rUoFxPtBOKf2JA00iysaewMSlNHFXU
 KHRL5nHDwJ32To9l4jhlw2HODDwtF6o0/sqEL6WCQP/1Uc9KjPJwBhLtvJSgPC4mKrnp4pqu7Zg
 9sCnfJuFDDlqpXkPFf/3+G2XT9sveujUWdikDZeISOKP8lQHYMS92rRXXcNiQ4C10nP6F7RATph
 LXR92Ot50lbUxs1SSwhKyuWA5Ym/VLn6gV0Qx9zqhfrn/eB37zJ73P/8469wyOCYuLG2YvtUMhN
 LCrqXv4FjLyuH/E5nSEeaNlKg4fUllFkbGOG5IIhdwycZkTMZqIL8Acmbn48UHtV0m/wNYk+IHu
 7BnRNiesLWsjZLwa8EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070041

On 4/7/2026 12:43 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 06, 2026 at 10:00:36PM +0530, Kuldeep Singh wrote:
>> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
>> for its own resources. Before accessing ICE hardware during probe, to
>> avoid potential unclocked register access issues (when clk_ignore_unused
>> is not passed on the kernel command line), in addition to the 'core'
>> clock the 'iface' clock should also be turned on by the driver.
>>
>> As bindings allow to specify 2 clocks, add iface clock now.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index dda4697a61b7..5e6b659e8719 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>>  			compatible = "qcom,sc7280-inline-crypto-engine",
>>  				     "qcom,inline-crypto-engine";
>>  			reg = <0x0 0x007c8000 0x0 0x18000>;
>> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>> +			clock-names = "core", "iface";
> 
> Inside the schema the clocks have maxItems:1. Please update the schema:
> Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml

Thanks for review Dmitry.

Clocks maxItems are already 2 as per below dependent patch.
Kindly check cover letter for dependency to understand more.

https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com/T/#m885402f4d828804501a3982ae8b8a5a028e15a89

-- 
Regards
Kuldeep

