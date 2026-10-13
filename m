Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAFC4E4C5A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892176; cv=none; b=pPBJrOUIheHn1YqUcecslfb38zmqX8gqFCD7Cx06oucM+d+El0V0F38+rFzxaHi47dVmCblVP9uaELyCw0j9zfNR5i9xrbQR9yyX6aMS4K0L9KzLatJxnkPeS3MblrJYD/3lO93zEYAUdNd0KaM82fKs2kXdHRYqEH4oGajgtZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892176; c=relaxed/simple;
	bh=uPem++P5ND2UdG5Rfp/39oIo1piUSvZOSUqNOqUrr6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUqHxleduz0Blhm7tOmnfHdLcE1TAFhvfNAQsaMnWxqCDuEw2L45eywisw7GGGqQrBPFn9f+XpmrmoAJv9cA6onj0BetxU5WtUjJsb6lJpp9lsWTkFM2YKES5ShaCeFc4RT1xAaYyfVrksuYF6q67V4IDGSt25KTzsBtaZ04e1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5e642az; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2LCLKsO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5e642az";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2LCLKsO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xwxx790999
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BzlXRUn6u2bY0KUvJNLoRH9T0Jg5xwYBbgQJM3XPKPg=; b=P5e642azLWVj3iu+
	iN+i8gF8R1uBaMGN8uFWFOa4m46cKuRBLzV/ZmzD6VQNGadMLEY2VlGtYVPeTrbT
	Zd9epKhfcnHDA+xF5dAscAkqNO34USt3cAaeNt87PYFpXXDPmlzQULZGpxLCBCn7
	J13LPjtwi5eTQxXise18XcxRjjtz+weAMN4myDN+io4++8khkk9Mp8cUoFph3kMR
	7CcOjuhLyuOPrDa0lsRzElMlcbXP8Dx3p7YXhOK8/wVd8ztZ9DarKtEmEnWFpmMo
	e65c0GcURel6JZU3dcV1EB/CUj0gZa7GOaZFN55ZVkZlX1/OlNcpBZc0NWGlF04T
	T2RrrA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrpjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:49:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-887c99013edso1834203b3a.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791892173; x=1792496973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzlXRUn6u2bY0KUvJNLoRH9T0Jg5xwYBbgQJM3XPKPg=;
        b=b2LCLKsOIaQmJU/WSHI9bK2AJWoYmQOwaS8FSNXBDguTMyLnSBpWbnFGwm/gWbR0dY
         LXZELn8AkjlpDW2YasZ3byMuoG1Ssd47GblbypbOVpTJOFJ2q4lvAqbpWvTfjjHrx42f
         H3jRbwMFvdc9zbp9zMFlyWVBKdN8Bt2TuMOyDf/WYe+e4YlsMgTUoY8pqm/Hbt10r7Qm
         pcqVwRztGDVMaSL2rhkAO72yIRD3YNM4fQj0BTuPgRM7fueAFZcfNZqDoC2o1JVia2Oy
         wEEDBiYK+BQYw373dloEM0yIeO9Vutr41r/gFMrlgsFZ9rMkLLTGaqjEBmB8dtRTr6/V
         /D3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892173; x=1792496973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzlXRUn6u2bY0KUvJNLoRH9T0Jg5xwYBbgQJM3XPKPg=;
        b=tj4TUxMlZKjOyZMsxsbVQ2789Dl7eSBbh7F2mcAiGse7qsrqFusIAENOgnrlZelS9i
         HIYJqxVnEllEEWqyjm2kUA5YHN3dZc503G8lAKySOsL0vNxdrL1w8pTeuFUPZJQTE3jB
         0vEkEORmgf/+pMMgbiSZ4Lkq+8EvNmsYMomt6MUrac4Gnbm68GaPo3gaIUr6AlkGrb6l
         wzp877Jm9UJhtJylQofBGttuU1ppcKN2Mc0qrUjD2TKvwjy4hALN6glCwcFFRbAy0CYc
         hvolLSD6prFiLOJGuz1OJ7V/WXnJW+boI92xGvSW4ZNpmIn5h8yhG6ye1zqSdjmkhw6k
         2e5g==
X-Forwarded-Encrypted: i=1; AKwUvBxYvijaIdI4AubZOE6gFkBkNp//bY1bPF5ehsTyiLVRcubr4hnXioMmLPdxOXdMVdUkNKGkI9tSvpob@vger.kernel.org
X-Gm-Message-State: AFq9FYISbTYjeg9l1qDF6tR4XpQmxa5s+2t05M8Au1yrGkAgJg4QqMT1
	ZiLUH3+ProsjmaOrIA4hGsZa9rSVX7H9b7XtTxHrzrLaKiBjp3i9g37khZO3wU94Dta1qyK7yL0
	e9M/TVUx0PGbNT9z+J7jKfXnnb/3OQkte3wE6IbPUJz1PWYfaxKBxNOh9tRDqWCyb
X-Gm-Gg: AYBFou3vmNztu1YapJCT8zW3/sDui/fcwfaTnQlMvjx1y6SV045Qnl6+AHHDhAVNfSA
	mUoN19wesHVkgdpMt5vgJa6O2nn/sPpS1MAxm9tfFoqKyVqyNKAl64ogP+g7t4+rBRLcjh1nJ81
	8cu00nTQOHnOFPAcS1KySI8Fu0Xve+vYY7YLxOzKpOpxL1gQRVOUMWWBUMTIHKrTx/HOU0MhdOj
	qSibqd3bE6zaH8TEbNl9EZBGcX4ZWnG0Cmh0N9/pygBYN5mibLEyrj3tZQ4RFpPMbhebb4+A0h4
	oQWyJPoAW+WtY8BTvwa7roZzMcKYezjfbOpeZZUl/9LF3RijJO4RtQyTMVftLqgMQ2KwG52CBMU
	bhhn4zjEwb0NxuCnMJxl1NBqSt1gh
X-Received: by 2002:a05:6a00:7615:b0:897:dda6:ad35 with SMTP id d2e1a72fcca58-897dda6b684mr8132090b3a.41.1791892172929;
        Tue, 13 Oct 2026 04:49:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:7615:b0:897:dda6:ad35 with SMTP id d2e1a72fcca58-897dda6b684mr8132066b3a.41.1791892172464;
        Tue, 13 Oct 2026 04:49:32 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3106de6sm4969602b3a.14.2026.10.13.04.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:49:32 -0700 (PDT)
Message-ID: <7f6839fb-59b0-4f6d-a3f8-7579f6d40857@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 17:19:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: ptp: Document the TSCSS on Qualcomm
 Lemans and Monaco SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-1-beed14e72510@oss.qualcomm.com>
 <02792987-7ad8-4a6b-81ad-559c63174bb0@kernel.org>
 <640acacb-1704-4ee6-aa34-d6be3b30b44b@oss.qualcomm.com>
 <f5aa313d-0e23-41fa-b59b-9388839b2525@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <f5aa313d-0e23-41fa-b59b-9388839b2525@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX/AxjHwJnKGnP
 BtZT/jq8Tu7asv40/sBbyTGvcobypO/CshsbmKyA5GcVqolfreMC7HaRcIq2ilvzL+sYgsyUvkV
 93hhe2dF4+fdelCE+4I6ZQhg4ceGg/A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX1OV0t1JEyJFI
 qXzlXmoWOZcvD1w8BIcjndmOVKfSputdvXDOoDm9ApPfooldc3ugaErJYT9EHC/8GaalpEo2vnM
 AOKJMNAfF2MwmCUa4MsDDWA1vVhJKeubOPvUeFVzJV8ctrZiISlYCXFrcYmqQYSx8JgP0Wkzz30
 OipVldtI9QUhYTiPWnNiTRGGyFsSTSd7vbcNIgpHZqyPZ0P/V5oHvqyHJImT3cetCdjmpC1P1ux
 5HjeucNyIZiJoVIihq5qilN18MEINCKuepEcRnpKdPwzJBu5V/Y4DecfXQN7E8BFmFFFA2rqC7K
 KFReNBOu2ijhV/mMv/0eMStPJRHGUHd805jjMIoMbHO2twFRtdfWRYjAxxYfmAhR9eN2mJ/O1/o
 76Q5w1+GDp+r1XCQnzm2xvrfZWl7AHi+f8+Sj7nHY5YtqMxW1hdML0yKbuqqAMw+niS6bpAXroq
 DS3lchVsPP3ZJnUc8fg==
X-Proofpoint-ORIG-GUID: pBXRGhI2fGO3WQLvs5ZB8pIRG_nsTqAM
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace1acd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=L7LEkksTssx7nc12Xf0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: pBXRGhI2fGO3WQLvs5ZB8pIRG_nsTqAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130046



On 01-09-2026 12:10 pm, Krzysztof Kozlowski wrote:
> On 01/09/2026 08:31, Imran Shaik wrote:
>>>
>>>> +  clocks:
>>>> +    minItems: 2
>>>> +    items:
>>>> +      - description: TSC AHB configuration clock.
>>>> +      - description: TSC global counter clock.
>>>> +      - description: TSC ETU clock.
>>>> +
>>>> +  clock-names:
>>>> +    minItems: 2
>>>
>>> Why is this flexible?
>>>
>>
>> Actually, the TSC block can standalone work without the ETU support as
>> well. This ETU clock is require only when we add the ETU slice sub
>> nodes. Hence, keeping the minItems to 2, excluding the ETU clock.
> 
> Hardware either has them or not. Whether they are necessary to
> prepared/enabled is independent thing and job for the driver.
> 

Sure, will drop that flexible logic.

> 
>>
>>>> +    items:
>>>> +      - const: ahb
>>>> +      - const: cntr
>>>> +      - const: etu
>>>> +
>>>> +  interrupts:
>>>> +    description: Summary interrupt raised based on external event for any of the ETU slices.
>>>
>>> Please follow Linux coding style.
>>>
>>
>> Sure, will update.
>>
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: etu_summary
>>>> +
>>>> +  assigned-clocks: true
>>>> +  assigned-clock-rates: true
>>>
>>> Drop. From where did you take it?
>>>
>>
>> Actually, we need these properties to be present in the DTS to take care
>> of the clock rate requirements.
>>
>> Please suggest on how to handle such requirements.
> 
> Why does this binding has to be different than ALL other bindings in the
> kernel? I am not talking about DTS now.
> 

Sure, will check and drop.

>>
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 2
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 2
>>>> +
>>>> +  ranges: true
>>>> +
>>>> +patternProperties:
>>>> +  "^etu-slice@[0-9a-f]+$":
>>>> +    type: object
>>>> +    description: ETU slice configuration
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +
>>>> +      pinctrl-0: true
>>>> +
>>>> +      pinctrl-names:
>>>> +        items:
>>>> +          - const: default
>>>
>>> Heh? Which code do you copy?
>>>
>>
>> Each ETU slice has its own external event pin config, so kept pinctrl-0
>> and pinctrl-names on the slice subnode. Please suggest if you prefer
>> otherwise.
> 
> No, from where did you get this code? Why are you sending bindings which
> are different then all other bindings?
> 

I was referring to the example in [1] when adding the pinctrl properties
under the etu-slice sub node.

[1] - 
Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml

On checking further, I found that our etu-slice sub node deviates from
that example, since we don't have a compatible string for the sub node.

Please let me know if we should move the pinctrl properties under the
tscss node with per-slice names, or instead keep them under the
etu-slice sub node and add a compatible there.

> 
>>
>>>> +
>>>> +      qcom,etu-event-sel:
>>>> +        description: Event selection value for this slice.
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
>>>> +      qcom,etu-slice:
>>>> +        description: ETU slice identifier.
>>>
>>> You do not get identifiers. Please read writing bindings.
>>>
>>
>> In general, any ETU slice can function with any ETU event sel, and this
>> might not be 1-1 always. Also, these ETU slices can be configured by the
>> vendors based on the requirements of the GPIOs on the board. Hence, this
>> etu-slice identifier will provide the flexibility to configure
>> accordingly.
> 
> 'reg' defines which ETU slice is this, no?
> 

Yes, will drop qcom,etu-slice property.

> 
> Best regards,
> Krzysztof

