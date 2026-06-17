Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54762C027F
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694163; cv=none; b=skrddW1xT6pq6D2vkPphf5/Fxdh8NrxTOmPy5sTJk4PHTIXF0MxNB/1PjQzs4qLtly6GI9BtoYC3t2Tj3lRx14KmGm7FuudQyyoa419h2yjnguaKDyfEqYpQkrIppY/MPNnOTz+HpPL+0MRXvczxMldGpwxv/SiFQo1pPzA+GPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694163; c=relaxed/simple;
	bh=J0WyCYNudbDkep66LezhAjJxPzWMYml0V4bTjmbw73E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=td/hyWW7U7YUgJYWPon93njtKWru0SGXNRTtRVdVEY49VqSnesGBENTmu1Lp0EfBmg9m9lhiteMNIynuh413x7GXO7ZrmZyV5Lg2Zn2y4tb1qY93Tddv1Rj6dZ6LdjbeSohjzqECYXklf6xEBYomiwX/vN9ynaxJksTUiZoKSTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NafohgMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXV388aY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NafohgMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXV388aY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UF6R1735148
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Guz5UHflJ3DoWFEEdxnqeNFGkLQOQlrubHs+L7C4cYY=; b=NafohgMcIv76F/a4
	5ayEzGKhYHSSwF+qRdbsKELK4A5EP+aDv3wFBmcBIPFKK5RKi9H4OubhkeP00Kuj
	tZdOTUjWbr3mJiRlT/0fYdj8EDNG9i6Z7xDJldWbqEgsb5mvPPvE8LR9LAz/OYJ8
	7qzPx3b093IA06wSGlip0zApHo2e1DwB1KyYPwdRx4suw7qE9U70co8mj5DDUPzI
	f1ccPWH93ki5YIbh5OIomY9uorBD7UN0VytRD0rbxXiNYFP0KCMLM7OS1rNxf3Uy
	u1etMmP1eTFuK2nlefJcTmk0yTD95YRzuRA3Y/jkQaQ99eUz2sEIRSPWZQNt9vEC
	L417uQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemjsqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:02:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422b544a4bso3920147b3a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694161; x=1782298961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Guz5UHflJ3DoWFEEdxnqeNFGkLQOQlrubHs+L7C4cYY=;
        b=LXV388aYiXG4BCwf6n2KpBDlEBjusTm5JTaeNXtr3ieV4WCMmN5Gv18BCqVoDkOU1u
         rfTUVOBeu1yxwmExw2faVWglRYd8k5ORw0j4LA8vjnXnKHPxRtpnVdZdfKwLVicm9lzY
         bQ8HW+iRpCyGXCGYJxABIRPJCguPDcarD4wgD/GyHI9OanrtLHij0NvyDwfVSIpgUZFT
         IvryVQKrAIaXFH4ZvXeEvgIm3micu2xEAOTixMbYE9ugee3RYG9yBpfzFPtSfyxvADNo
         jHEx4UQVOdYPsNmDuvp552kG6tOxEMdUJvs1pF7kENac4Ph2oX3yhWIGK1zeKcW0f5a0
         de8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694161; x=1782298961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Guz5UHflJ3DoWFEEdxnqeNFGkLQOQlrubHs+L7C4cYY=;
        b=FU8WXTw/CQu1OvqYmVv3ZS3MffWwCIraMCOvMlJ5IHD7UKcQ7n8hOy7plHYiiwOUUC
         Iesd+qVIC5/lN30PJBMrwtMiayThXc7ECSag9z9Cuad+EKmT6wMbluX6Bl3GTOuF5xd5
         J4P+CUwViW+R4UP85pvZXrt0qLYrZUR8CVv1cDEWYrS89czKR5jKtXtYK/07AGUbTzOR
         3UsYZJyb4rbbHMPToUF4TLvP8wSCe2fXT9OW/OP1b7vonGNQqbiDQBVBIEv7Lst6M+1Z
         GIJX5c+qMKtDFbiYOxJFBMRc59Lk05D3kaKdKso3stT7o//bh9o9HhIgtOnTHC/sbQsz
         VICQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gqciSH4tDX2JZlyZN30kr3UDfREqSaun8kuFJOWjvePvNPV7kPM8Turl8LubW0UnjXUWwPIeQGMLa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7FEBWyTih8lNlD7e2YZgJ0p6F/Xv8kdWPANnQTIW2iTEX437u
	NL62OqyLyu+iT4dQByW+Zm6EBnglljdNlsaoM1bzdrRexVxJ5h1pBkden9/dK7t9IOhjR2+D6hp
	QJRJgOok746/MDVd+xY0U29dbZbnsrskFGd1UITZHsJ9bA9d60LPHPEZqvTqqw29E
X-Gm-Gg: AfdE7cl+pQxnpvgSnR7EEWbS/CRkxz4x0Txtokv4kBcWkvm+1xZgZHfeGbDeku5Ondy
	ecDKZ+/Jb1/cuhWuBKqIsFECaSUAzZgA+VyncVTPEfG/CanGIM9FZx+RwFXixl9MSNxqtEJgEls
	xQSjLhH+vsOIkBoOvcz+eJ2x5LgxiYbLU3AbPl4lTyVRgJiIBJiWQX+zqJiwKuTcATFIEPAEqyV
	MkHlJrKWR8a5ovINmH5+KeGu1IYIi+fvyuvaPf1tMWaFHLKPb7iH4AWzymsCZwViRaZjyEB7uoZ
	WzT/7b4BGvsWdjPotI3FO9LkJ8q7c543/r48fzzaSLZcMxF+ETOqDc6SerKMV5kEL7o5S1R53KB
	EOI59Tqs9/P/Mdc9LFAy7zR/hXYKjaCy1DFvtiIZVA0Y5kC706M9dOX+EsoDesQeUcr1AaABIhO
	GwsYFq
X-Received: by 2002:a05:6a00:4510:b0:842:2cda:7a9c with SMTP id d2e1a72fcca58-8452454cd14mr3324090b3a.29.1781694161609;
        Wed, 17 Jun 2026 04:02:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:4510:b0:842:2cda:7a9c with SMTP id d2e1a72fcca58-8452454cd14mr3324050b3a.29.1781694161110;
        Wed, 17 Jun 2026 04:02:41 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf2ac9sm15780135b3a.21.2026.06.17.04.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:02:40 -0700 (PDT)
Message-ID: <c7191868-d141-4095-b703-230237721f28@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:02:35 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: input: Add binding for Qualcomm SPMI
 PMIC haptics
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-1-d24e422de6b4@oss.qualcomm.com>
 <20260617-wakeful-gorilla-of-feminism-75287c@quoll>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260617-wakeful-gorilla-of-feminism-75287c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfXzw1rorlqKAoI
 PekE8TgjiwqM23U5OCJeR7vP2InYuO/T3B0QOeQjlFtsumaVNbY6TrPArKerC1+WYXQXRtEozD0
 5YOQdnYGmIri/eOzctmfBQ462WUbQNE=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a327ed2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=SMdS_jwxfo_ZY5qVgdUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 33N21QBirh3ZDpkNi_khIQZbG-wY58QP
X-Proofpoint-ORIG-GUID: 33N21QBirh3ZDpkNi_khIQZbG-wY58QP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX6ILxodQeNzqX
 IDtlWj1tfxpro3a7Zo3II4MhnmpaWYjBhdDXud0KW2SbXCiuysTd5+6YNDIdWsYlWZXCmlfs5pc
 d/1IiXiSb9BPz4vk6YyOU+c16smHpP2eZ32mIXHPgGu53KmE979sRq01oYIQO/ikS4mqqspQHjj
 l7fFr7lIlAa8I5X0qoBF7qcs1JHQJgrO6g6xOZB4mjh9FdLxgiHK2/CrnB4stc7x5JFvio4Bi0p
 mW0DH1GTGfcFQkCrA1f3nIc9mwkg8ZFcbOgkJq3car+jNypnEA2gme/jpbKFKG48D+k4+NtBTS9
 yTQfvdVMEx4tlYJGZnEl918AA27DHYprkz8tLpwaqELMyhICzCBiddkb1E4srvEitUWHSIwfgeP
 KCZ6mm1WBomecV5oYSW1QKufGfyyT/pDksbUG9G97jWClfNOLHOwgldOqaQ+t4S1h152kaBSgj1
 NMVtqzdC1NmuRoG+xmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170104


On 6/17/2026 6:35 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 16, 2026 at 03:08:24AM -0700, Fenglin Wu wrote:
>> ....
>> +
>> +  qcom,lra-period-us:
>> +    description:
>> +      LRA actuator initial resonance period in microseconds
>> +      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
>> +      rates and the auto-resonance zero-crossing window.
> This does not feel like static characteristic. Isn't period depending on
> intensity of vibration you want to have? Why would that be fixed per
> board?

This period is specifically used for playbacks that require 
auto-resonance to be enabled, which I referred to as "T_LRA-based" and 
"auto-resonance zero-crossing window." It plays a key role in the 
"DIRECT_PLAY" mode, which produces a constant vibration effect. To 
adjust the vibration intensity during this constant effect, the hardware 
does it by scaling the peak voltage of the driver signals, rather than 
changing the frequency.

>> +    minimum: 5
>> +    maximum: 20475
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - qcom,vmax-mv
>> +  - qcom,lra-period-us
>> +
> Best regards,
> Krzysztof
>
