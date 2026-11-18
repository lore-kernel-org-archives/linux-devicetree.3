Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985234;
	b=xZlzJ2kOBxK7L80gPldga3NvTd0+v/7i67D48KSYyVMmIKiPgPkMprJMG138yV9EcLoS
	 xmWHRoEhptyAYh6/2tTfjKlCtx5xqexDcV7suVinvI5Op0I+hxwXZPSOKgvV1FDnxH6S9
	 QPEg7AreA2qNSU44D8yRv3L24vf5Zpp7q1NAMdYO7/D+q+R9Og1OSK8uv1RfLdFzyNNGW
	 HUh12eFz8xwWMztzs3CBgcBo41UdzwuNHYvcAUvujmyAEIxfv1gVk7YirSgT0Mq3QE4PE
	 z3yMcVQzA3Mr7reKZWdX8v8vAPNevcOWMfqefqswbI1pTFFBldkvIvdRjvmK85nZtIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=;
	b=UQY82BWMrCpErkfooqW5a0yZIBnf3v84IGTQLmzTLFE5tqmpvjJMDYrzKz0RrOL//EVZ
	 gnGbD/yECtuNpdh4J5eeqax6HPdj3auBvYhjPEEV6LHjRMuy0GVpOya1llddmoHTmVAfw
	 szshELXu2woKAccKq8+ncZ2WxmtNjNbdznLE4pPiYcU5h3I+DdzPdykRp+BloBAGV57dt
	 zickCS6pURo3Gjb1YxvVTYKyUQ6xHEw0MMkjIn2SWiurcnjKRh2HhFyVAje8lXDar2JWL
	 zwepR7w0Umw39LpAWMt2RcMM7xcLsqn8ClKyzwzfdZZgN4q7JK7p0ea9ZRwDLalrdkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIDje7Qr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCJK82BT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157F606A331
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5157F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIDje7Qr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCJK82BT
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uxpo1430528
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=; b=kIDje7QregJFgM/K
	Vlno+kRlQDCQc68TygLDKkCUqpmCkyK0JEtom1fH7nkRtHMZChev8oaayHBZayRo
	mLk7YoXKzDybydjcwSOfykAJV1ScpR5iNP1uakoxbMjKyEOkX1y0FoN7RA005DEv
	hwnePs18MtCjnRbaWbcZkdXEJsZ8N7RnTzhg/Rf45pM2sA1xLyWkkI4Y5icRn79E
	/qrLQU3oT2kF2TzQeth/5xkpYHOUJyfeO4lkJExMAOkTS5for4HAjnhPwm0Osks+
	SQ5UrUTpTy9kuKAbVybppKb2jG5lNsj1UTvsgZ2GPhngytdBnVzAB7WTccxup2Jm
	Rt3TjA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91q0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:00:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1414195b3a.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985232; x=1795590032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=;
        b=LCJK82BTWxikFICBULBc5O3ZLz/gW/tjnFiMd9c6NGB37QYWQw/iJ7d8MC02mVKgIC
         TwUwixXLU/CiETtmVXVyumcwiseGJGZpr9bID1akqFExMvcYEdzEOdSKUZ3Wchhulwy4
         Jtigpqm8PRUuOXnM8blq/6htCq6Y+RRrxwQWpU5+U1t4WLhYZ7AuT1gA4Fygu0Fkff7j
         f6rOkDO/pxUbDon/B+idb2c7n0Fz1x+SsK0/wz+pGoUAGbqbt3JkeVvueMdPFMRSqD27
         uSkUp9qJvV3XIWWGPST18vH07jqv4z+Zy4EnDSSQY99aJmB0KfDScJxhqfrGpOi/JmZA
         wlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985232; x=1795590032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=;
        b=T6i+NVUJuRAsa2EpWnlv3mSvtCw+/+wTmV64GgO5cPyefc/oir/rVX5fPkc/4iGrWd
         CORmsInjvb3ZBtH8EFncxkbuRVJxx3g3GAr9xpRhC5HKv6bgIinlZQoo9sW+otPn2HqV
         pR3ii6NtUtf8acqeYt2/YyVPlLZJAhdJFYU9gM8QJroC1y9FdPNULFYC3g6tzx3H3KbX
         Db7BV6yO8hqG1ai+kKR3ZGRP0qLovmzeIuRdQj2N/Qx+ASnHHnLPmh+c7b57tWYzufFJ
         f+QYyirVTTiR4hcicB2r1zniID4ccv4oT/ab5EnlwZr6PzlTcxXNZSKeWPkYwgZgbL4g
         LxeA==
X-Forwarded-Encrypted: i=1; AL+hErHQI4c7oTekl/uFsCpHA3ZawvMwEfBHOEO1XR7/oWQXrrgyim5Lzd4dp87MO0EBUeianjA7MUvTnmZq@vger.kernel.org
X-Gm-Message-State: APuU4Z9qNXYy0uEXpk3jyTml2l7fogGPqAPZLLDpJrXMGKYG3bOc11+x
	qsjAdUpXpyiPWdVhq8pqNMpzVzs1ZEwMcb17ukI1IfBA7mrZoAJBwZWxqrNCouMNa3axxfsyGOk
	6riPzvAoTtSP8RZ8w9tCl+gA2TWdk37D+MqtNqiXLara5EgzV0gyiHJKw66kqMkXa
X-Gm-Gg: AYBFou0jMygHu8CjJgC4CdICSr9cqg/Vu1/cr8v3DzO4sYfSy7sK3cbDwVfJ6oZC5ag
	PVvy/4Qk6IMqSQuUyBgqshNRrdOF/0DkIXV9Vm4DVp+6JFD/ziyKJQaIhGhEcY9Z0ux8ku5PJYX
	yK6KvOOQLa1SXdAnwTdXSV0MKRGSmUytlXrCQdQBDgiaz5eaSHxK5B3ECTtz+YGuxbf/tLmVtEm
	AgwXLDWn+xJCcDAy7RpbWPO8XnAWxGiP+6i4y1E3XLL0LSJJxElgHGMVe/N6VYkziWUTM+JiCP+
	l5ITjXDnwDgttOkZz9+h2GR0ZrqofV0kuewjj/3J8b/xhLjwAvptyCi4w1e7NxuBqKbt21odexU
	dygOLGCE/GJiNUzh5qieqhDEequmHDhftaxPPIFBLZEfkBJnHmvVlphbkMcGDh4w/YHhrKqg1ef
	jLOw==
X-Received: by 2002:a05:6a21:2c03:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fd2e2bb06bmr4030557637.22.1794985231649;
        Tue, 17 Nov 2026 23:00:31 -0800 (PST)
X-Received: by 2002:a05:6a21:2c03:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fd2e2bb06bmr4030496637.22.1794985230778;
        Tue, 17 Nov 2026 23:00:30 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3bfa898bsm624181a12.17.2026.11.17.23.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:00:30 -0800 (PST)
Message-ID: <761bd59f-4ac2-4e62-896c-57d15fedc6f9@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:30:24 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <20261116-boisterous-ancient-macaw-8cc00e@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261116-boisterous-ancient-macaw-8cc00e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXxCf0iqcwcw4L
 WNQ+Diy40mXb4bdWW7vCvPN6nVnEb8NbptcPYBmM4ZvsLSbA+h+4sMCspTJreIN2NSo0s7k6QH8
 3NHGcjU/I/fzLFmwXFpZ+eTMivvTmSgnVJiUWZ7hfuzfOgZwrS6YH6v268TRaPAh5W6/wxgrocF
 X7AuxmALSXqhfhldRhGJAMYzxBWEWniy4GlCzOedtcFgOemUEM/sABCJY1iG/g8MAe8wm//HcV+
 hBEraMHUZcCbnUvhU9EeRw3sjr7movDuELrMGCPrzSjLn1mJOo4bz+/WVrQFEx8sxiX+bUgtBx3
 VD40Efn1X81uPZy5j+/hg3t0iLByC8kokPsAw8Hes+rvd4hu+SmVO/CirpFvVsluy7f6/o3SGlQ
 zxSfTJHOBV/tTAvcw/6opKniuC+31EBNIJHWlQvQVREQpIcXkrNbaW4vFrocasWmaOlUX6tVhfX
 OizBHpYSuVwo51s5mAg==
X-Proofpoint-GUID: HRXry7u-ZnhXRRwHjn2pcdq0HjoJ13ZE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX0Exj8oepXBpt
 U8XVdMgOLszzEL3lfoYjdDWKIpjsKvW5SyABSBM5H91BaBhieYCyiAwzMkmODWL+umjEJ8FjJQI
 KYLzA/Z+eKEp87hCNDLWtq0vwJLYEQU=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd4d10 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=u9YKjPMZU3T7gHYh_q8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: HRXry7u-ZnhXRRwHjn2pcdq0HjoJ13ZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

On 11/16/2026 4:28 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
>> qcom,pas-common.yaml limits iommus to a single entry for every PAS
>> remoteproc, which is too restrictive for SoCs whose firmware uses
>> multiple IOMMU streams.
>>
>> Drop iommus from common binding and let each SoC-specific binding declare
>> it with its own limits. These bindings set unevaluatedProperties: false,
>> so a compatible that does not declare iommus rejects it. Declare it for
> I do not understand this sentence. Compatible cannot declare iommus, but
> anyway the bindings do not reject it.

Right. Wording was incorrect, compatible does not declare property but 
schema does. I will reword this in next revision.

What I meant was that these bindings set unevaluatedProperties: false. 
Therefore, once iommus is removed from qcom,pas-common.yaml, any schema 
that does not define iommus itself will reject a node containing it with -
"Unevaluated properties are not allowed ('iommus' was unexpected)"

>
>> every compatible whose nodes use it.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,pas-common.yaml   |  3 ---
>>   .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml  |  4 ++++
>>   .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml   | 12 ++++++++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml   | 13 +++++++++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 15 +++++++++++++++
>>   5 files changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index f75cab6b4ed9..4662fe4cff62 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -32,9 +32,6 @@ properties:
>>       minItems: 5
>>       maxItems: 6
>>   
>> -  iommus:
>> -    maxItems: 1
>> -
>>     power-domains:
>>       minItems: 1
>>       maxItems: 3
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> index dda2d144b720..3c35da52204d 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> @@ -38,6 +38,10 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  iommus:
>> +    maxItems: 1
>> +    description: Firmware Stream
>> +
>>     clocks:
>>       items:
>>         - description: XO clock
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> index b20780e5e26b..8aebc785f212 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> @@ -169,6 +169,18 @@ allOf:
>>               - const: cx
>>               - const: mx
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sc7280-adsp-pas
>> +            - qcom,sc7280-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
> Same comments as before - missing property definition. Properties should
> not be defined in conditional blocks. If you remove property from common
> schema, then you remove it from every device referencing it. Nothing in
> commit msg explains such intention and reason why.

I will update this and keep it as a no-functional-change.
> Either iommus is valid or is not. If it is not, then need mentioning in
> commit msg for example and then you drop it from common schema and add
> it to the bindings where it is valid.

I will cover this in a separate commit.

Thanks
Komal

>
>
> Best regards,
> Krzysztof
>

