Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5393E7BC7
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427859; cv=none; b=BcARaOWLVNbClqz1c/dWnFEkEV0IIn81gUcKAiN0TZnYy9zAVDsIruX7R13v/uXXOrEyItdlYp/Jnnkdc5MG8A0uu1X43n+OiKfxwG8vEdRgUsM1J/rKm+43AEIdRXwZnlqIs1KF6EumOtdc8ZTlZP5BqwjGkf5yzm9aVdl1uOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427859; c=relaxed/simple;
	bh=vhGncwJZ9wKzKg6h4u79wj/q2EUUFPEE7blDTnJndOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbEcEG1NcXmcv7gm4ny3ZkQbbclrpq/yVhAQLVHyjbLNDUDM0H0p45Bp/Zld3mMq5eVkHwvsMktQS3thxa80yWwKPqREWtGYB3olcTOem1kQZ7cl1ns2us/loUbGcE2sFb+HUUQ/Fh1+mwf0CIK9IQcFEHYb2MnDzuTZi3OdIuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqMqG54h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pja59epV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqMqG54h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pja59epV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8wVR3768976
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 12:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=; b=hqMqG54h4QbHLTUR
	JtWmWqM6Hv3A88fG31J0Y/jNV34Az/XYukWTcC13ffIGypAt7KNDBRSv1vOi1Eo6
	vEbBerzrxKLD/h9Gxf35aPAAj4jvCv4luuQ9zyTSoiPlwbGol9xBUJS+vkJ7Yxst
	wvQqSJxNMnvV2COl0PtRMXSZ0vsrKgp20H5Q01lF0dRWDcA7g0j2ZEII1sc06Czy
	ZkPS4rbFVAZAlSMWg3ouagoAfa4//+6NUj27Yhv86gIjoOvTEWfsp18WwFo6VZLx
	diV/l0zJY6rmlz9GuAiAibKg39nZ37lhBSbX4ujVZ4DNLf/qqoFTPGuUbXjWBE0S
	Bli5FA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7ae3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:37:36 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e741693bso2229935a34.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427855; x=1784032655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=;
        b=Pja59epVDglW6sa9qOOllefe51YsG9SAR92eXU81TGHfZAR5/kIYoNzDPRqZ1VbApB
         13gTAylwnYKFAbsdhilmK/E+RI4adgnuIap6C9vGt84THQy/R4Y2s/62O6cn5Xp1lX2u
         gGJUwQ326sCUhe/P71jbv2hl+jU4W20gzZb8kJoLDbeD8S4I/nAhpxCj0ba3ci1aw8gd
         2LSSPKMjaBokK50kGthoPRFwuhk1q1MCPxF8onO8oWuYHGOCgfefVukH1g6eQ3JPhmVm
         R9P6LYGPizbwLUgSq0ZYJqDt/hvBOexnO91nDPGMP1de0HnHfzT+RxmwnItXv/zL7Uf7
         LVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427855; x=1784032655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=;
        b=b8jqOvggF13X8YSOEIDBH3EKV1UfXA2x36o3f5ANCysWcaQwzMejRmqNo1AZgVpbvW
         I7+0ZtI31wI+9w4mhkNxvAjnBNV5Z5+zBIATZ+gOUIavspxhD8OY7b9cb5Hm1wdyDjaq
         BpFohw6rzmuBPNgMEbvBmVoGxY+5UNmCUjFhyLDSiknDgJ4ej7/k9Siu67VjDCbCGGbS
         slE31qwL9PFvqtfSIs+lr8toRRP9rXGtoaLSRqGcvzPCqFWh+rBrpMsWC/ORYvgH7HE0
         ULhWVdET8vhBAoO+35Hvk5EV3Wf4OMpLTFAi8cYQBaOwE6iu5xCiTAmz5tY2lAfcV3Vj
         IaLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cweZ02rOFXDCauE0J2J+FAG7+j2srW+tQHOQ7kIoknuX3zq9ijFqPiZOMckPdA9G0wrOh017Rqo1u@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7R1EYc75hjjc5qXhasL+p7XepM/UKUmU0IPF/x4dYW+lbn7Ty
	Cj9e5IG141879dz/oRn9T/CFCiCkhbr1YgO0VciW5pLiV2FbdHpbhX28NIgf++wXbX0ZWZPtn5u
	2TsdTqj+lK47XoCousSceCHEkXxDyHPl5ptMoU8ZkDII5q/x/QlPFzffYoe71McVRA+O4X41l
X-Gm-Gg: AfdE7cmlmDtyZpA79b3wrmvbZtZQIuUVWSml0n9kX3zGF0YWZY/b0lfiicG6h/W0L/A
	/oMlbWpK6fO4rqF3nXQ6Hw4mwOTc2+6h+xeZurB+zfpA98fgD49UehkVtmKWQr7+ePJ/AQHWv8B
	fs+Nm9JLPPXB1NizBHHGMUvO96ffS9haJ/16CD68IUh1nBe5OpsbxwBKg1hafu3MDJG2N8fUx7Q
	tol2/yeI66pxBfUfT2Eke2DEu57KtuAA4SmfIPhCrfYSSQPyRUMc9gvz/bOpwUkkIq4yQDFdWrG
	CBxQqIISi6amg2FijfPMQA0S+QCHYRdn/1aauaCeL+RArJrA8sXnJ7WTO/gOwFphDPbl5YPVOZP
	mUwon/iF8717ZVrlOtlc6ceo2mUt4Vedo2mhEHAI=
X-Received: by 2002:a05:6830:67da:b0:7e7:76f:3ec0 with SMTP id 46e09a7af769-7ebb233a1c7mr3266293a34.15.1783427855371;
        Tue, 07 Jul 2026 05:37:35 -0700 (PDT)
X-Received: by 2002:a05:6830:67da:b0:7e7:76f:3ec0 with SMTP id 46e09a7af769-7ebb233a1c7mr3266269a34.15.1783427854922;
        Tue, 07 Jul 2026 05:37:34 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542ebf72sm15010628a34.9.2026.07.07.05.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:37:34 -0700 (PDT)
Message-ID: <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:06:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mIwuB-2bLQ8JpCu7xJmUlA1ZDADwFnFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMiBTYWx0ZWRfX/5ZcHEUT1+s5
 pQFc5jQVZZDQbjW7iW2W9Pn/lASNcUvQlvGre5rbQe4qKnWzhUkR5mruO0C7gbI+RnwlSUG7Ytj
 BmrOdct1W0oO01C98mYh8Kd/r60cViUDaNZ/WmgLbLeNDnFj0jWwYqJyoG4DeUO2H6NKOA4Lm52
 3k+sVOhLtDAQh7EdYH6l9IqrfpWn3OzT1SUF5qBgTsuXoxNd3+C6oq00UGCKrlTeck5bm5FRmy0
 wl2Mx/lju7B70UWfvUqCDXwUkXDVpOk2NcDl3yoWJRmNoG4fNyI3Oufcyn/5nDgeG4I4fmjEhqX
 O1f9+kgdScKiJTimz9kFNYgYN5g8cSXaRboIi0B7HQYoNGxZAWHs+fkHLNLXPuM9sJRkbrGM2YQ
 yP3oEjkSiViETRK9UWKD7X3CuvqZ06T6kcEt4by/cZWvUoxVfLlPkECTf0roSWzNji5jEdueJKl
 RcqGRfOa6bvsc7pctrA==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cf310 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1xpCzd4iWPYukUP1q-QA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMiBTYWx0ZWRfX/oKRWjsBBZsp
 RCyLYLFyc8MNrVYcbAl6xeLErJ0bC7hsJXG2q9LRk8/NEaDXkUFAcVz+xPRq3WZACcQAu9Oy13d
 hhHPAkU4A9rsHP4kprcUln31b2pMMHI=
X-Proofpoint-GUID: mIwuB-2bLQ8JpCu7xJmUlA1ZDADwFnFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070122



On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
>> Some SoC implementations require a bandwidth vote on an interconnect
>> path before the SMMU register space is accessible. Add the optional
> 
> Why is it limited only to those SoCs? Is it also applicable to other
> Qualcomm SoCs?
> 

I was hoping to keep this series focused on the core infrastructure
changes: the bindings, base ICC bandwidth-voting support, and DT
interconnect properties for the platforms currently supported on
Qualcomm Linux and have been validated so far.

The additional targets have not been tested yet, so I'd prefer
to add their support in a separate follow-up series once validation
is complete, rather than growing this series further. WDYT?

>> 'interconnects' property to the binding to allow platform DT nodes
>> to describe this path.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index a701dec2fa0a..fab8944d7b63 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -246,6 +246,13 @@ properties:
>>       minItems: 1
>>       maxItems: 3
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +    description:
>> +      Interconnect path to the SMMU register space. Required on SoCs
>> +      where the SMMU registers are only accessible after a bandwidth
>> +      vote has been placed on the interconnect fabric.
>> +
>>     nvidia,memory-controller:
>>       description: |
>>         A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
>> @@ -644,6 +651,26 @@ allOf:
>>           clock-names: false
>>           clocks: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - enum:
>> +                - qcom,qcs615-smmu-500
>> +                - qcom,qcs8300-smmu-500
>> +                - qcom,sa8775p-smmu-500
>> +                - qcom,sc7280-smmu-500
>> +            - const: qcom,adreno-smmu
>> +            - const: qcom,smmu-500
>> +            - const: arm,mmu-500
> 
> Can we be more idiomatic here?
> Something like:
> 
> if:
>    allOf:
>      - properties:
>          compatible:
>            contains:
>              enum:
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
>                - qcom,sa8775p-smmu-500
>                - qcom,sc7280-smmu-500
>      - properties:
>          compatible:
>            contains:
>              const: qcom,adreno-smmu
> 
> In the end, we don't need to list the full list of compats. We need to
> specify that it's Adreno SMMU on one of the listed platforms.
> 

Agreed.
We need the interconnect property for any of the listed platform using
the adreno-smmu only.

Additionally in following e.g.

compatible = "qcom,adreno-smmu",
              "qcom,sc7280-smmu-500",
              "qcom,smmu-500",
              "arm,mmu-500",
              "qcom,new-string";

The current schema could miss enforcing the interconnect property
when new compatible strings are introduced, whereas the approach you
suggested continues to handle such cases correctly.

I'll update the binding accordingly in the next revision.

Thanks & regards,
Bibek


> 

