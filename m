Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7499F4E0B94
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617353; cv=none; b=iGSkPmP5OAmsJAjatUk6K0uZD5Fe+v9bVmiNsV/aZ9owCcpSIe8ynMcYyHg/8o6O3GENKKDa3hch4k6U+suBRWzoQgBnwcQMRcmDGS7tnqmHGBe2G/wxoPsQ6qI9tZ8SpdPEv52M4YJp+wB/AKp2zUCC39ExWjIf4BAHxOmZeGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617353; c=relaxed/simple;
	bh=aUUSmgHqQhCtyaUyPVrKNdKUlZbWL0wNpisO5osGGFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s57T/vn13VCzsPrF+R4ZT1U6Vu0kS0OnSKzMMgovUBQW6X7dB09Tmtvf068bdOS1dX3myfwauoVtH3nSenCPWoa2eEx0xHWGagpk/FQJZFe81YGss7x2zSK8u8be1pk7N1IiulTIbcgKiBhMFnWeL5eserOZ+jtGsA3WZvpBZBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL4Wl/Hw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dp6KFr4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL4Wl/Hw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dp6KFr4i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdvub1895320
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/1WfCSunnO65R5rdxWHjPtFptxxB7B5h8x2TWIFRQo=; b=XL4Wl/HwJgVRsuK8
	q3RnyxqVML+kI3u/FS7cNh8W4kkcTRT/kJpRRqY1kQ8ncLkcbMYKvlaGj3AbRhn2
	xoLbu5zbfpa2q9VQVN1u18gKoMa+e195I5YqiqzBWXdv+KkG073OJMFSuuVnOyLQ
	xX1gsBhkUEqHGunvIr8WUUyMc3VAMqVc8/EVT3UxdRKJJf7X8HF9gk+AhWpHs0bO
	dHDbvNGPSujYVT8i8sBYlOQsBEmLSjaPsCkANfb84zBpb9ZVt0jwtlua89+aYNWc
	yKnKL0p0l2UB6eQjRS82Tw1nlZembrYY0Z2DNiGKDg3Q0vEkhvqPXG8YZBiASt6S
	+sDkuQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s2thx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:42:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b4f8ea38f7so1578212137.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790617350; x=1791222150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/1WfCSunnO65R5rdxWHjPtFptxxB7B5h8x2TWIFRQo=;
        b=dp6KFr4i8HVRteFugtB++wTMpaErmh71EAChPC6h+jdGb/yJkSx0pQtabUxRv3DEGF
         o9zTgJgwi91j2Y7tnuvWC2C1ojmwaLdTn8tE1rLJH9IUSX3nOAWO+hXGX0wbhL2805kd
         O8xZ3d/afsQGP/aBEBUppi3Ff++zUCAER3tQ3u2nk3Z6uxqv880pXVDjS8u2RazyHAXb
         FDLG98XVyou24xdbcyZwtmG89BXPGPTZ/SuCosmDUIIx4VI2E5rnp2BRhvYRj6WW6SY0
         K6PBJxrJM2rtM3/ybrQLMLRZuojV9WWaH6js3CNbIy4gT7CBqcdvpeVc9XqFX658ZktI
         E4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617350; x=1791222150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/1WfCSunnO65R5rdxWHjPtFptxxB7B5h8x2TWIFRQo=;
        b=VplPxkmL2+eUaIpq5EyLfDRHsTiacslRrdGlR9Y3NtK0WsF4vdxTa4KNobD9ybkAiT
         4F+GZwme9WBfcTOo0cIIZLLdiFUPObXtvmoli4WgiKg0m8e8m0GbzItq7o9YVgX3ed2H
         3iO53g4QaZ7ThK7RJizoGS3ZgG/n+kk04V3LSw8V/ADD8u+Oi9QK8C3RY9iYj8xn7a2V
         RLfd/ZR3Brlwa/T3njL4qasiIitF07IdcOMC5SAWWNVxPE3vmT88hjGJD2PSCf7ZLt9d
         8gcxhn+knRvU+WIyhVH8wsIPWCpZVYrZM9VdCtJ3vohPk8WIMquYTEEp/ae+/1gfJJFi
         V4kA==
X-Forwarded-Encrypted: i=1; AKwUvBzQrB9ditrN6/ewFuwx5dL8LudB9ctu+SSY/K8tIAtrcbm79X8EzzhepD+ao3I9ofabu518WHanrnma@vger.kernel.org
X-Gm-Message-State: AFq9FYI5TGpfDYqhbBCWTeF7KE+MzSnHz1XJNw9RGfSYf0Vo2gcSRA52
	Im63b/0AIpP8h5WV/dl0gMiG+5Sn1Lpql0xwT1ac9XfW2EaLKU+6TWwG88hIKIHuXa+8g/q7rQt
	eseRXOaM6+VA+BSqOwzyIcCpVSqM9oGZovVKLwvArhOy5c3Ko6wz7iwk4K3Y8rtH8
X-Gm-Gg: AYBFou1iz5ooeYAP4UXDNoPWUztkbym1fmXCIOLZrhBQ2VYbHaB4IXJ5qI8xzeAqQP3
	RCPsGgfJ5nN2M80l+Ocxd4FLLLvM0sDDkBTmuivEZbk4PRUeFxyb2DsPD7HxPYjGxU1YNDea8y8
	ITf0Q7hJ14/OetH/+thZvH+9k4cOx1hz/aE2WTLfuRjCWO/f6GDT08eIPi8LooJBflQDBUTi0jI
	vn/PLyxQYwzZJY/KEn3z20PJnCEzhcDS3RpgHqMzCnfzRgl9WeXQPBDbtZ5rRHOc3lHrqMcjEFf
	q6URUvQAKwpLijJlmDIfE1yKASB6VACWYYAOvx8yUwaRc8zsG7LhoZkHvKy7otOLF+ZmlTBwth+
	kUBSHiiTLFR+5c0i9ukjVJyHbJQ==
X-Received: by 2002:a05:6102:5491:b0:7af:8089:2734 with SMTP id ada2fe7eead31-7b79926dc9fmr1077933137.27.1790617350361;
        Mon, 28 Sep 2026 10:42:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5491:b0:7af:8089:2734 with SMTP id ada2fe7eead31-7b79926dc9fmr1077918137.27.1790617349866;
        Mon, 28 Sep 2026 10:42:29 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a00cf868b5sm15293635e9.1.2026.09.28.10.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:42:29 -0700 (PDT)
Message-ID: <b037133f-3a5f-4957-84b6-6eda14739f5b@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:42:28 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for pm4124-codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <20260928-ancient-boar-of-persistence-629a9e@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260928-ancient-boar-of-persistence-629a9e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX2o2P5T0Ias0Q
 q7JDBUGZDBX9W1nNdRDPFMz25fcUW6tyOJ8U7BhrsWtduO/cVIbWdtBP2gOAvbfaZb7dCM2UIvC
 SwkjQZDdYfGCHqnQ34ab6el7PFDzjwiemExvqsRmaO4JQ3NC+nWURvWQMCbaEtWrwLDyEiEgNa+
 6+DkQ388NwtDdjYOGVty+HkqsmfSb35h4qJW4fwgc/Uo6ALJwlF4UOS+w+AdtlHhXgI16H07jCx
 qSYfLZkI3six1yszjobh/2YSoMki9W+cvwSMCPcFgVROYgu6alcADuuEvxGmOTsH8aZe80xfJya
 dDpugyOw+Mi8e7IbQAnSgPtivX6gVKW+OflEwuqwIYOH5kmPEESAA4digLPT89bq2EfzicO95Cc
 nQsJFo1CUFHLI0RZ5JkE5SxlBlNxS9v0xUQ3YTXMRTxHYWHFl5ReOK/nWoeIBK42e3BFlWe6aDm
 OqkSwcvfgbDhoW9rXKQ==
X-Proofpoint-ORIG-GUID: CIgd6hOMURBadYiQ78N0V3R-8mFq5hhL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX1nhm5WCmRfgu
 sb9Ad/QVoxtreiUgzy//xlQq4vDzBR9UdZnFU7pVedDRJ54T91ZplbV2KQXVk1PyFYKzLxAae9g
 SwvlmHX8Fcfe1gVDgFYHcbXA7rxntVI=
X-Proofpoint-GUID: CIgd6hOMURBadYiQ78N0V3R-8mFq5hhL
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6abaa707 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bMBjfq_dd7qU7rFTbikA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280070

On 9/28/26 11:09 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 11:11:24PM +0100, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
>> Audio codec has TX and RX soundwire slave devices to connect to on-chip
>> soundwire master.
>>
>> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
>> properties in mfd qcom,spmi-pmic schema to complete the audio codec support.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> [Srini: reworked the patch]
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index f6534e9e9912..d750da31ae3f 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -148,7 +148,15 @@ patternProperties:
>>  
>>    "^audio-codec@[0-9a-f]+$":
>>      type: object
>> -    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
> 
> This had three compatibles:

That is true, things have moved under the hood.
Thanks for spotting this, I will fix this and send v4.



> 
>> +    properties:
>> +      compatible:
>> +        contains:
>> +          enum:
>> +            - qcom,pm4125-codec
>> +            - qcom,pm8916-wcd-analog-codec
> 
> This has only one from that list (+a new one).
> 
This model was suggested by Rob in last review, I will add the context
in msg.
> This must have rationale in commit msg.
> 
--srini
> Best regards,
> Krzysztof
> 

