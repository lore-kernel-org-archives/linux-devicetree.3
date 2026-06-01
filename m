Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6CD82899
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 05:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780290023; cv=none; b=g0w1isE54eKQECPWbKprffVT/Sd5u9IneZTzEq2XdH3aI71m1MBCxeyYglyorW486TWmsOfC1J7sCRUzv1rMDdafl5mCxc4ShcKXYcsSILol+j9JxHe4+kVneSEQWREy7cZSRara35ko+CuHVoQeInijETg61U/+I3w5aPXZ1x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780290023; c=relaxed/simple;
	bh=ug4iZG3DBQRIsEmP09XeLOwfiOfE4JIhtUb0GN3srg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctr7ZOo9hxmF742ZvFuyu576qHz+99mzpulrqODiMxtC5W2AdraG9M4cVaqYTb0RQNYIJBk52Z/GE9jv9UnWZo/sJ9jZtStRcm2gwBuQmVn2nc88em2EUNMeXiHWDjxUHyqy/sGJ1fo1oVZ5e7dzAV9jXQNRD/oVXl4Y8anQT20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVMXca/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8Vtdi5p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVMXca/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8Vtdi5p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VM23ZL2734613
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 05:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+ECELM/2EfAespls9MjkwYM/yAnjOkOfePZc4bASiM=; b=bVMXca/gSjeC2d/m
	Yq62wyC6vUDiRo0zHlnx+JfIQL4Hf9AE9bxbOZaTLAK++3mFfEfVj9EzxKpr3fod
	bA6Ta3LhUDCI+3VTRrpoNZXENsIpfXyfIo2Cj+CWh8ZLLk+6MW8Wj1I6/Rr75kDC
	te+f0h3o+M/zF75g+D9pVstldGe1VqLzSxukPxPXF0q1Gl+ciCrkpHcGlmsZ7TGy
	52vqVihyD3yHbcTOVFtTgAMPmoqMCtMOjO5g31kSaTnWxlebH4QpSP125BIVPhlb
	s/VpXSrrhiKuapPsKdYR9N6SZyXX6HvnVb0aRiEzvJdCR7NC0HMAuQwPmLl/GDQb
	BKCE+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7vypd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:00:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bbdcf36f0so1987285a91.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 22:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780290020; x=1780894820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L+ECELM/2EfAespls9MjkwYM/yAnjOkOfePZc4bASiM=;
        b=b8Vtdi5pWheL60mVf5VYicF4d+NzyAHxvF3fpTQQ/J4l0Rkmv5TtLiLkzI3l3GBN+d
         ZXVRvYmeNnFHyo7BPUii2+b2XKQKF2m4yoPVf4KTEZ00KgKKllLGffXDBdqLa1u0j/G+
         ggoO4hoqGtQ47vBCei8KqhKvjnoRXX8wlrciXolXGt1+4tOWE1KAzKrH2OHQh3KQe/Z6
         UdCwkGEGc+GmJjSuXwb6bgllymImhOxZYhP1P0+tOUQytJsI7tkN/oCKgxxwL6kwE0w+
         tcJoJqy74wbdKBWJ2yvbjJCtWII6mYwXMP6j9fJxBbBJAQCHozLLTXEcb9bJWzvmAPTO
         3zBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780290020; x=1780894820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+ECELM/2EfAespls9MjkwYM/yAnjOkOfePZc4bASiM=;
        b=cpwMNS8InbR/VPeowhxJmKtcveBoEOzk7qLZn1Z4sQ6PCzuJn8jgGuG6oI3biM4P8P
         lueE7KB/PGoyW4RKpiK+Tjaa8pWHFgI2Xq6E9v3Zu58L/O3Yp4QX7VvOD4qo8NXYZh2v
         ndEZPmQXRRvhsmjwN3IUEohOiO3FLln8sycxPQeJJO3Ymmo3BzZyuUilb/Y7C+Xn6bbi
         POkn+PxhxrtJHltss70FymAw6D+g+pgwTf6xZxlHg25wtIEe50qQ8SuiGABIyIJjcMUP
         CPVclEHDOpL6mG4RgRANXiQ+7E3xRZgNdf8WEzsUIsTyZIMoRy0lI6J+qpTnLgu66ymi
         NPTA==
X-Forwarded-Encrypted: i=1; AFNElJ/kgNL8RkO/71knqNeJCVYlwbyfmGthmSkfZCbnji1cpZu0Nptr0G1ANWEdMKzEalkMGYsrBLAAkiod@vger.kernel.org
X-Gm-Message-State: AOJu0Yxerrle8aZ3NKq0W8y0PQ8IxTFwf98wt+bNmZQGjynnxi5U4Ldv
	f/TZEpUbzDjCtgmqsg8ONTZILn8EBGV5rRZCoFTEIhP8gPR8RPt5q3YMT9VrYJ/BOQOyIo/limx
	lyhD9SC95/NklWxoAxGUTajDT7oa6Qu104MtnFXSGJwfrRZdUy69d7zAkYxFv+63g
X-Gm-Gg: Acq92OELJaFVtZPTuXiqM9vV+bn39OnmZDKfgA2ZVlNmuW/wnsTKJDpu2l4A/tFRUf/
	bvn5n9+hElHoDyZ2accPcIvHCUf/hmXCOPUt6h/zvsI9TmY9eU31huK8LhsfwSDytmQHsOdtB38
	jdLLrqTlnQ/WnyD4edRQY5emM9VniCbLS0p5juqWCd+QNh0ZBsSEhIxGkt5eq1MbTpG/wJU+pop
	egMoUPSsTXtcub8fYn9AOjqmVsxHhXNmRp4e47yMdNT90Sfxp5kCqLIwXK9YNyEpB9iATA13km4
	D71iRQyEjS4xudIYbcNLN9oMcLpeA8d42rloUNaVX+s13hfPc95YK0WjB2D3edCbuJT6ZTT96U1
	HOEuRjtKEWiSwJyjyPAJdJVgx36gcoSE9qIH2WX2tcciCaSG1j7XTgRT2WA==
X-Received: by 2002:a17:90b:1d51:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-36bbe0b5b21mr10537283a91.7.1780290019961;
        Sun, 31 May 2026 22:00:19 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-36bbe0b5b21mr10537229a91.7.1780290019308;
        Sun, 31 May 2026 22:00:19 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c857729930esm8606486a12.16.2026.05.31.22.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:00:18 -0700 (PDT)
Message-ID: <158920bf-3b52-4772-9305-18afcd5807e3@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:00:12 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
 <20260530-thankful-maroon-boar-be86f8@quoll>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260530-thankful-maroon-boar-be86f8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1d11e4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gdqNYIvkPTOCW3xLoh8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA0NiBTYWx0ZWRfXzU4pbqJpk2kg
 TtscftGHnrXt3UZPV1OQnNieeq7xAiKjFUOIbPRP+dssJhLs42oxpWph9aEJHuDuVD+jQbQHzfr
 5poaa7NrL5399tJfKi7rQTxPEDuYLMKLCN0rCuEB9TSU0xOfJWYw8XPOlRQ6MmUQiFPKo+LmmpJ
 /x3I8NSVnIz9VjCracWV04G+mv/TnOq4atnhk0H9oApr4vCvkk96aj+Q9bfLWZpZ+S79DL0OzEj
 Fx9s9GjhAMagQIdxFAA2V4KV8+2zgOnrx6hwgEVqqUk40ZuAkAWTaOtQ6o65Ehtqj1VrC49mCoa
 oXzpZA/MsK5IJPVW4/Ph0jFA5l5n3XM0+UQhMLjmWMv5T44E6rSI66olQEVVOjqlZgSny3yGGOf
 gwJwvtkqSn1FdNKtX9UUl60G+3ngvUul9bBLd7ey7rNzhjzsMQUqvcqfYHRpzAlG4Mh3Z1mqbWC
 p+1k2I9kemylMoYlu9A==
X-Proofpoint-ORIG-GUID: ZhRwszbbZLQTQn6eWpYDgbYLCTtIPVIh
X-Proofpoint-GUID: ZhRwszbbZLQTQn6eWpYDgbYLCTtIPVIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010046


On 5/30/2026 6:29 PM, Krzysztof Kozlowski wrote:
> On Thu, May 28, 2026 at 06:05:36PM -0700, Fenglin Wu wrote:
>> Add the "level-shifter" function and add the required DT properties to
>> allow RPMh firmware to control the level-shifter. Introduce a custom
>> pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
>> level-shifter function.
> I don't get how PMIC, which is not a child of RPMh at all or not
> talking with RPMh RSC, needs to configure its pin via RPMh. It feels it
> is misrepresented.

The control for enabling or disabling the bi-directional level shifter 
has been centralized in AOP, similar to how regulator resources are 
managed. This allows it to be used on a serial bus shared by multiple 
clients from different subsystems. Each subsystem can vote for its 
enable state through RPMh commands, and AOP determines the final status 
to turn the BIDIR_LVL_SHIFTER PMIC modules on or off. Additionally, each 
bi-directional level shifter shares its physical pins with a pair of 
PMIC GPIO modules and is mutually exclusive with other PMIC GPIO 
functions, which means those PMIC GPIO functions must be disabled.

For these reasons, adding bi-directional level shifter software support 
to the pinctrl-spmi-gpio driver is considered the best approach. Let me 
know if you have a better suggestion.

>> Additionally, add the "groups" property with the allowed group names
>> that can be used to control the level-shifter function on pmh0101.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
>>   include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
>>   2 files changed, 64 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> index b8109e6c2a10..19dc61ddff2d 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> @@ -119,6 +119,21 @@ properties:
>>         The first cell will be used to define gpio number and the
>>         second denotes the flags for this gpio
>>   
>> +  qcom,rpmh:
>> +    description:
>> +      Phandle to the RPMh controller device. Required for PMICs when the
>> +      bidirectional level shifters is used (e.g., pmh0101), to enable
>> +      communication with RPMh firmware for level shifter control.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  qcom,pmic-id:
>> +    description:
>> +      The ID of the PMIC which supports bidirectional level shifter function.
>> +      It is used as the RPMh resource name suffix to request control of the
>> +      level shifter to the RPMh firmware.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    pattern: "^[A-N]_E[0-3]+$"
> You do not get instance IDs (it's explcitly documented in docs).

Okay. This is primarily for creating the resource names used to obtain 
the rpmh addresses from the cmd-db for the level-shifter.

I can change it to a different name if you still agree to add the 
support in the pinctrl driver.

>> +
>>   additionalProperties: false
>>   
>>   required:
>> @@ -330,6 +345,22 @@ allOf:
>>             contains:
>>               enum:
>>                 - qcom,pmh0101-gpio
>> +    then:
>> +      properties:
>> +        gpio-line-names:
>> +          minItems: 18
>> +          maxItems: 18
>> +        gpio-reserved-ranges:
>> +          minItems: 1
>> +          maxItems: 9
>> +        qcom,rpmh: true
>> +        qcom,pmic-id: true
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>>                 - qcom,pmih0108-gpio
>>       then:
>>         properties:
>> @@ -523,6 +554,19 @@ $defs:
>>           items:
>>             pattern: '^gpio([0-9]+)$'
>>   
>> +      groups:
>> +        $ref: /schemas/types.yaml#/definitions/string-array
>> +        description:
>> +          List of GPIO groups to apply properties to. Only valid for
>> +          function "level-shifter" on pmh0101. Valid groups are
>> +          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
>> +        items:
>> +          enum:
>> +            - gpio11, gpio12
>> +            - gpio13, gpio14
>> +            - gpio15, gpio16
>> +            - gpio17, gpio18
>> +
>>         function:
>>           items:
>>             - enum:
>> @@ -536,6 +580,7 @@ $defs:
>>                 - dtest4
>>                 - func3  # supported by LV/MV GPIO subtypes
>>                 - func4  # supported by LV/MV GPIO subtypes
>> +              - level-shifter  # supported only by pmh0101
>>   
>>         bias-disable: true
>>         bias-pull-down: true
>> @@ -592,9 +637,24 @@ $defs:
>>             configured as digital input.
>>           enum: [1, 2, 3, 4]
>>   
>> -    required:
>> -      - pins
>> -      - function
>> +      qcom,1p2v-1p8v-ls-en:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          Enable or disable the bidirectional 1.2V/1.8V level shifter
>> +          associated with the specified GPIO group. When set to 1, an RPMh
>> +          vote is sent to AOP to enable the level shifter. When set to 0,
>> +          the vote is withdrawn. Only valid when function is "level-shifter"
>> +          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
>> +          on pmh0101).
> And there are no generic pinconf properties defining the voltage?

The 1.2V and 1.8V voltages on each side of the bidirectional level 
shifter are not configurable. They are fixed in the hardware with 
built-in reference voltages at each side of the pins. I am adding this 
custom pinconf parameter mainly to control its enabling status. Also, I 
am adding "1p2v-1p8v" in the parameter name to provide additional 
clarity for users about the "level-shifter" function.

>
> Best regards,
> Krzysztof
>
