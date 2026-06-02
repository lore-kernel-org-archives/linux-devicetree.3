Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F4C3A9D93
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384489; cv=none; b=uAKpAC328U2/B+PWaPzJ9DM3RqFM/wAR05TjsBtijp4gpcbgbcbOQDD6Crp88tvBA710I+qeMH1pPsBzWeRXXHBiBa2i+S3sYweXpM++qitrsLJqMl8z/LcjIlcMNjIU7y6KDEHNUPaogUfoLlr3gQivJrgvzDit+3y6O8Itin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384489; c=relaxed/simple;
	bh=/j3tUE96SWNcssK1W0+tgZ3yAQFjlQnsP+UqszEXnBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuQOg8cMmhdbjVpD2KoadpPiThGPmYvHf1ul8KcgPQWMmgfEQU2lwNW5jk2/yrnKvHLZJz9MQG+zT0jyuKizWhgZsnVxgNENWdvPEBeqeMGteRdNjQVPi1GxJGHz/urPjt89HO2FTLR9TJbQV0KHFUqeihRXF9ZlfzihcZws5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POZ9TU+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jR4r1p8d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POZ9TU+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jR4r1p8d"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245nAO2692286
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 07:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvCpwazJQ2nTUZ1sqyJxYIEvDZyEIgujJHDTUjeRRd4=; b=POZ9TU+bSG7DH6qN
	Bx/hryOXvWFFiU4vS7/jC7v3mAYKIl6csb3Vu4MOTmosABCXLuEtcYgZWKWejJpG
	4ygErMorQiLbXmtd7Z7oU+TnfJBn5bochf2RJLp7KMj6Pu0VN9S9TdP5yjQPI5/g
	dNbfobI9I+BdMFNiW7YMN1UfEQzm9mta1nb9sCpjKOeCVPeTW3OLFXomDD/DTwm0
	PnZFA+7ryGl8FFbD8oEjSIazHMn73+FSwqK71vL+5OQeWHzbwGLvQZo5Og/XANrU
	TCW47cuE0EdnnrfDDK8ZOyNPnAcZsbDK5/Z1obRiu5437DpOc9Xqn5gmhU4P4c6L
	VzEhYg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumgpg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:14:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b9d265308so3877799a91.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384483; x=1780989283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qvCpwazJQ2nTUZ1sqyJxYIEvDZyEIgujJHDTUjeRRd4=;
        b=jR4r1p8dHqvrRXARvCya/U1QwKkJEcAcPoCQ3/RdosKO6+I97SIUEsC2w84RgP5+bq
         A617gqDi7uwmXq8AUDsMCtoDwxChgzH8KFhhls03xHfDb8ZGikSQ2pHn5FbVoh4War0i
         9UwDEbVl/UDCp06mgrggPOIrD7k4l618ojPOBsZjlft95WfDCP7FQ8R9icRZ/wvkee9O
         vCL/yhHNFnyZucOa8uwevctCUmvZO8W+PHNbbvjRGC8x4IP40fLDUu0Y/cw5nF/xvlWs
         tswnMVMCEQS/I0R1HpiAmiTRCeSFu2iPtVD1Sq9TGaVvgwLB4gkh7nOzLJmBp/zlkwpr
         ciXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384483; x=1780989283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvCpwazJQ2nTUZ1sqyJxYIEvDZyEIgujJHDTUjeRRd4=;
        b=NQIE7SihpPlHMk5KqNsX7y6pvvIHc0bEauBuLFXpAdZKAytbcQDzNQ2zilJUVUdy9N
         fpZV38C86xgCIF3b4LrSAjNqJmr0duGFWKsquOICDOwND+SrI6FzmnjIVXnlpx8PA61b
         N8WEcpXz1mk7IoMUS9imNoDnHJ/mJnb6Yt5Sqpo8saYgxN8SUm50NDwNKK/sKSwSOfJr
         5TkM/LR15ZomGFLkR3G+u9PR81GgXd+P20+LcR8kZrWMo1Q8At8XfKCsyxViFTyCbqs8
         JZ9r2xfGW0rwq9hNXgIq4ABjJlfhWuLehQB3fKvypnOut7uBNW3kHPYxoFH/By34ArZV
         e6Kw==
X-Forwarded-Encrypted: i=1; AFNElJ9ikB/DfsK1YIiRFPkiH8ztai7K4VGj8fe/yjDJVYo3NQICZiWbHTpvMuJ+KxbKGSJ8NiZUJIm3Kr2R@vger.kernel.org
X-Gm-Message-State: AOJu0YxesKWvq9+7eCiL5n3DpMila2BB8PRWaZ5gkbbGiZxIEKNdD0xJ
	An/K95GopMj4J/OC2laL9VayEoBOt+7l5MtBFoJ5Mp8U2CdPLUrjcFVwUAwu+kwZDTnpY+keMXy
	8EUc9WibyDO6E2fp7FoX53nWxm9x27vz1i2BWLf1zT3JSIK0QvWgi+1g+SIFgeU/S
X-Gm-Gg: Acq92OENI/GyHO5ygOcnTY/FKdbQeWIaKPjjNmz/WwWAJIh2BVgFiTWT4WDvubEL87T
	ZsULpoPNqL9tqy0q6sNo9+uFJvT1N9R1lpLTx0U0TIRw214qsrRSr0WhWyefhGS7PX+K2rvNK6Y
	C0RRYZ0aRfWJw1uDlzNKN11+SBfdzTzCa/EAig6SR5vsdxPge924zcue5DLVic192Z4B0wK7nQy
	SRs50BsuZIkbyPIRttaRrUE2QdoB3NbpXIKFQlWXpuCZUmad+IFOIONpHQoHmyT/HvCMjeGnn0s
	XshBlKglRqLh6/Lw7CPxGR9Yfr+C1+nCSHi4Em544yQaGZn0z6FgDUrLeFOHg4ehaO+XLfCTxWa
	114m8H2IaQ2wKyQ0iz2QejVqta9f7AR4WAlEFl5dqS+RFjer8Q7Ary2qaHQ==
X-Received: by 2002:a17:90b:5286:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-36c59abd658mr14694344a91.19.1780384482760;
        Tue, 02 Jun 2026 00:14:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5286:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-36c59abd658mr14694298a91.19.1780384482243;
        Tue, 02 Jun 2026 00:14:42 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm1892437a91.1.2026.06.02.00.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:14:41 -0700 (PDT)
Message-ID: <1972e522-018b-4a14-ad7f-53c5dfdc860a@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 15:14:34 +0800
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
 <158920bf-3b52-4772-9305-18afcd5807e3@oss.qualcomm.com>
 <d764694f-0cb6-4488-8ee8-ec4ce658ebd4@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <d764694f-0cb6-4488-8ee8-ec4ce658ebd4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NCBTYWx0ZWRfX0YLxL/bWV+gC
 7ho/ss57mAv0Q6FE/1voArwSJaSaHmay9mvtj2j3ANG749PGs/+pEW9KTjFogy0guwuXx8Tf5bm
 ElsnOaaENk1onttO8M/tGXLWohG3Hd9bu3NTeIPb3opXlxboXMQ31sAKemjnWx2JCh761jqK76k
 65qKruuosEcWKZcBayuPHNJzpIlPeuDR9BBDZSYfuoGpjK37Gw8bY7cMw/TLhChGtirhl0e+GdJ
 83NHJ6k8CC4r0bL2cis0PIZH4xgUDcijjQpUcQgwXUm8PbkiEl158W8TdNdrM6XaItRSjp8NNum
 tXcReX3qIuGPEFkk1tXbXdJH4wdlek/NySk695558r5lSIGIc4DSIL6xodkbvLOIRzybpxO470c
 gOFOjZq1wpoDed7Cb6HsBwb6tSXE13Hi7QXg/fXJO/wVqXZAYl1Xljk4UejbziwCCc+8i41Dpcz
 amg1xEF78x9vGNsnmQg==
X-Proofpoint-ORIG-GUID: _I3tsL7DDIR3DxV18MU4wLw43DEyMXfl
X-Proofpoint-GUID: _I3tsL7DDIR3DxV18MU4wLw43DEyMXfl
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1e82e3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w2ocTiTeffrdLUDDFYsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020064


On 6/1/2026 7:30 PM, Krzysztof Kozlowski wrote:
> On 01/06/2026 07:00, Fenglin Wu wrote:
>> On 5/30/2026 6:29 PM, Krzysztof Kozlowski wrote:
>>> On Thu, May 28, 2026 at 06:05:36PM -0700, Fenglin Wu wrote:
>>>> Add the "level-shifter" function and add the required DT properties to
>>>> allow RPMh firmware to control the level-shifter. Introduce a custom
>>>> pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
>>>> level-shifter function.
>>> I don't get how PMIC, which is not a child of RPMh at all or not
>>> talking with RPMh RSC, needs to configure its pin via RPMh. It feels it
>>> is misrepresented.
>> The control for enabling or disabling the bi-directional level shifter
>> has been centralized in AOP, similar to how regulator resources are
>> managed. This allows it to be used on a serial bus shared by multiple
>> clients from different subsystems. Each subsystem can vote for its
>> enable state through RPMh commands, and AOP determines the final status
>> to turn the BIDIR_LVL_SHIFTER PMIC modules on or off. Additionally, each
>> bi-directional level shifter shares its physical pins with a pair of
>> PMIC GPIO modules and is mutually exclusive with other PMIC GPIO
>> functions, which means those PMIC GPIO functions must be disabled.
> So two completely independent hardware devices - PMIC and RPMh -
> configure the same hardware - level shifter and pin function?

Yes if we consider level shifter as a mux function of the GPIO pairs.

>
>> For these reasons, adding bi-directional level shifter software support
>> to the pinctrl-spmi-gpio driver is considered the best approach. Let me
>> know if you have a better suggestion.
>>
>>>> Additionally, add the "groups" property with the allowed group names
>>>> that can be used to control the level-shifter function on pmh0101.
>>>>
>>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
>>>>    include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
>>>>    2 files changed, 64 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>>> index b8109e6c2a10..19dc61ddff2d 100644
>>>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>>> @@ -119,6 +119,21 @@ properties:
>>>>          The first cell will be used to define gpio number and the
>>>>          second denotes the flags for this gpio
>>>>    
>>>> +  qcom,rpmh:
>>>> +    description:
>>>> +      Phandle to the RPMh controller device. Required for PMICs when the
>>>> +      bidirectional level shifters is used (e.g., pmh0101), to enable
>>>> +      communication with RPMh firmware for level shifter control.
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +
>>>> +  qcom,pmic-id:
>>>> +    description:
>>>> +      The ID of the PMIC which supports bidirectional level shifter function.
>>>> +      It is used as the RPMh resource name suffix to request control of the
>>>> +      level shifter to the RPMh firmware.
>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>> +    pattern: "^[A-N]_E[0-3]+$"
>>> You do not get instance IDs (it's explcitly documented in docs).
>> Okay. This is primarily for creating the resource names used to obtain
>> the rpmh addresses from the cmd-db for the level-shifter.
>>
>> I can change it to a different name if you still agree to add the
>> support in the pinctrl driver.
> ID or name, same thing. Still not allowed.

Okay. Then I don't know how could the driver be able to get the rpmh 
address from the cmd-db.

Maybe just like what Dmitry suggested, register a separate, RPMh-based 
GPIO driver for those GPIOs associated with the level shifter function, 
would be a better approach?

Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue 
write commands - Dmitry Baryshkov 
<https://lore.kernel.org/linux-arm-msm/4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt/>

>
>>>> +
>>>>    additionalProperties: false
>>>>    
>>>>    required:
>>>> @@ -330,6 +345,22 @@ allOf:
>>>>              contains:
>>>>                enum:
>>>>                  - qcom,pmh0101-gpio
>>>> +    then:
>>>> +      properties:
>>>> +        gpio-line-names:
>>>> +          minItems: 18
>>>> +          maxItems: 18
>>>> +        gpio-reserved-ranges:
>>>> +          minItems: 1
>>>> +          maxItems: 9
>>>> +        qcom,rpmh: true
>>>> +        qcom,pmic-id: true
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>>                  - qcom,pmih0108-gpio
>>>>        then:
>>>>          properties:
>>>> @@ -523,6 +554,19 @@ $defs:
>>>>            items:
>>>>              pattern: '^gpio([0-9]+)$'
>>>>    
>>>> +      groups:
>>>> +        $ref: /schemas/types.yaml#/definitions/string-array
>>>> +        description:
>>>> +          List of GPIO groups to apply properties to. Only valid for
>>>> +          function "level-shifter" on pmh0101. Valid groups are
>>>> +          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
>>>> +        items:
>>>> +          enum:
>>>> +            - gpio11, gpio12
>>>> +            - gpio13, gpio14
>>>> +            - gpio15, gpio16
>>>> +            - gpio17, gpio18
>>>> +
>>>>          function:
>>>>            items:
>>>>              - enum:
>>>> @@ -536,6 +580,7 @@ $defs:
>>>>                  - dtest4
>>>>                  - func3  # supported by LV/MV GPIO subtypes
>>>>                  - func4  # supported by LV/MV GPIO subtypes
>>>> +              - level-shifter  # supported only by pmh0101
>>>>    
>>>>          bias-disable: true
>>>>          bias-pull-down: true
>>>> @@ -592,9 +637,24 @@ $defs:
>>>>              configured as digital input.
>>>>            enum: [1, 2, 3, 4]
>>>>    
>>>> -    required:
>>>> -      - pins
>>>> -      - function
>>>> +      qcom,1p2v-1p8v-ls-en:
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +        description:
>>>> +          Enable or disable the bidirectional 1.2V/1.8V level shifter
>>>> +          associated with the specified GPIO group. When set to 1, an RPMh
>>>> +          vote is sent to AOP to enable the level shifter. When set to 0,
>>>> +          the vote is withdrawn. Only valid when function is "level-shifter"
>>>> +          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
>>>> +          on pmh0101).
>>> And there are no generic pinconf properties defining the voltage?
>> The 1.2V and 1.8V voltages on each side of the bidirectional level
>> shifter are not configurable. They are fixed in the hardware with
>> built-in reference voltages at each side of the pins. I am adding this
>> custom pinconf parameter mainly to control its enabling status. Also, I
>> am adding "1p2v-1p8v" in the parameter name to provide additional
>> clarity for users about the "level-shifter" function.
> So there are or there are not?

There is not such generic pinconf parameter based what I saw here:

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/tree/drivers/pinctrl/pinconf-generic.c#n173

>
> Best regards,
> Krzysztof
