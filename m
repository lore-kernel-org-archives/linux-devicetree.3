Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922176;
	b=2kIZMHvHev/ON9sVK0cE2+raBd+TKz2P9A791RC/2Y4hFx/57nWEoXX91lQ7scMqik8c
	 FhiZ2oIY6EnHvNAxaLnKt2aF2OZWRnuhoWUGH3dtxx+QhfIsF7pJCaZkPB1TjbB8Zq+Gj
	 NlPQdmK/OHdTK64AyZIobisE8GKOKOS4Bvdw5PCL5Wf4BffhIkPHVjRFzl6mGx6uygVQz
	 yM5naRBcuFkjqRge90m/1JDrb+g+hSbj0VX/gK5olOEL+S1UjGgGxtwsEXVUDtgJEXiGI
	 21rcBe6Bv8Yp+mTYe+fejoQTRgcDRAK0jQBvnnmy/yy3NuioYAgfmTsy5HLxBhk9A1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y4htjm86jKJ9GrPsryQmZp/4HX30ZTQI3Y3SaQZYVdg=;
	b=EGU4MZ1vS6f8VppkCJRn5Oqf1YfAU1nCdxhXBu2Sfy8uu8in1qBR7xudF68hQDd5j4rW
	 ZRFJVX4v4bZ238f7f8uVpyiv7/iUMUiGh3Vb0bkoy2gvHlcI7CyfwEi0283bfeKqvpT0Y
	 li31DRJA2ukJuI5fG0oDRYtT5A82J9vjZNkaloY0aRKioGA+qEc9AjF05KT7mcfWtHTto
	 jfbBlGnZeT0FvtNCe8mGMDijYTbe9MzO2PTD5t/6aPupe1QkynbIDWCFetvp6v8HapaGl
	 BCersb1bczG0HG2mGvyqs6FtWpRuj2IecGOyVuXY9G89FYfuSaKGuN/4zxwPjt1ZDpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOcvQUSL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jmlp7Tfz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027F3606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 027F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOcvQUSL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jmlp7Tfz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1xam4188028
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4htjm86jKJ9GrPsryQmZp/4HX30ZTQI3Y3SaQZYVdg=; b=VOcvQUSLE+9Z9sL/
	5F8C/CKmR7v/+0mlNUGXs9Y7o5SUQXMmTIuDvIsIGQups4r/u5U5csaHIHqlyfLI
	O38nnABIAHeiLwIfkYFbg5MVp9b+mqqWP3ubtPhIqIkSOMYsX00pWKmZVNs7G1E9
	x8PekpA8YYv8TZrZBwugpuduiv7oGaGCeoqaB+swFPhsqKTuCQGY/UkvofILO4RK
	PztaEjAICxdWMrnGO2ApFyilt/jOpHW7T9BFj7mOgT4cW6WANEiIAroIxDzLZzDa
	Qh7BFYlh2xNuLASf2FWpjfL8QAmclpP7VEp31vkFLkZA4icaHQGz8kqzKA0E39IG
	bTTWHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0bah6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:29:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so3152728a91.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922174; x=1795526974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4htjm86jKJ9GrPsryQmZp/4HX30ZTQI3Y3SaQZYVdg=;
        b=jmlp7TfzG8n1t+zD7ffQPxWgfgDX+QfsbQlC1PF9zIgFmEe8SciPSbV6N4IFOm7FQK
         gafQj/nTEfkNgvp0VcMixzFfgAaoqZAbdZfsZEIovujQpOwI7fFlxHK+3Gskwa6GCTnT
         WPfUuJx4U230PnrQmrF6ArihlIdxX0tWEnuNKlSifUoZ6+8pQetwqAG9VF+g2DGsLzt2
         +yuSJpxgU3/RbZIxV4Rns4pzU4kL2n+ErZp+8qF+6LsDSFLaHfeV18iFSHKTgwqYZo0N
         QE0HfarqCokgvDJR/e7ibWWchJcOsjA3E/tsLVxbl8XLIjPhFr8Jpl5tUYrZ8zCM9jce
         eoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922174; x=1795526974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4htjm86jKJ9GrPsryQmZp/4HX30ZTQI3Y3SaQZYVdg=;
        b=ZmfVloy+MF96XWtWoPDmNu33iYFK5pxYVsN67FXun0gNpFPTYvMNVyX0T+HfpwziCJ
         Ks1VLKALII1IR9OaKU7Nxlw49TV+LZTE6lbyZtFBJdO+7ksJpQoKS/Ltcy5pL+XeHDeJ
         R8/i8GUBaDlpxI2hi/E7h6LU9IVhf4AJW8GcpS6Ha3idTyQ9xKvDmb9rI4emXx4ib5/D
         bo8Y+hH8GiRAibHFRKe7Qk3yAMjRCnFB2fyxa8drS4L8A6DIR4z+PYg/4+qQ0tZv6BCq
         HSQQT/uBKKDrhxrgRLBO2B4FW9JaXbC48UEBD88HIX+di/MT/Xj82+phof5izoTvl5wx
         EihQ==
X-Gm-Message-State: APuU4Z+UhxoqIUTlq7bZjNFAE0IN93aa/nCzK+RGGMhEty1Jn9nEoaoJ
	X2RWZ09d7IozJfUBoMyLj1v82Hg1kBBZh5NRXPA6ikOotd80zsVJtVhbImRjfZegQTA6zbuvV/P
	WLND36XV7DHC6BwRt8SiZoZRfC2pITKsK17ugcB+Hp0gkh0njGmqACjLFHvuV1Gh4
X-Gm-Gg: AZFdTZfBD/abRAsoQhHlD7ErMlt673Vz4G5vARGK7MmQJ+HSMXgSJUcLMd33uN19tG1
	jSiC+vzgpVm5bMjTqWGuCd9PWtQ9BPAeaDmtHaFmhkVqhxlmNdAW5NhLQDkCeCoyeXvdo890YsL
	NzGSt0LZ68X3NiImn8KqwhiO5IzF+Jy8lCIqFdcYewNKfU/NxmGQwgALWqhTT/eSIWsJEd4xFD3
	YIflmP9O5VLPzuW7h/O3oeIX/WeUGEhhjA06J/bhbz7JYC3GBzO6i3Jj4bIrKxjm8D8c/J2mlse
	9drK8I4ZyShX9JqndfIOGVQ2KpQaKv1VmlVSVmF22iX9jCT6RMY8MeTuR8SQtan6fzz4W0haJB7
	8xuY3QtSfLUqyLXKN0D76Sk17gtF+gtTA4PmYWbJCNcK26ZIfXSXsLnhlqBg1bdwgcwvznYh+4m
	NMzw==
X-Received: by 2002:a17:90b:2cc3:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b1b0d800e0mr13527071a91.61.1794922174302;
        Tue, 17 Nov 2026 05:29:34 -0800 (PST)
X-Received: by 2002:a17:90b:2cc3:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b1b0d800e0mr13527057a91.61.1794922173900;
        Tue, 17 Nov 2026 05:29:33 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a3866bsm15405945ad.35.2026.11.17.05.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:29:33 -0800 (PST)
Message-ID: <38770f99-aa88-4d35-a389-d35da0450d9d@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 18:59:29 +0530
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
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <sashiko-outbox-213017@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-213017@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MyBTYWx0ZWRfX0G0Xn0KZEmMz
 85OP6IE7QFg3iQ+sOvJ9EXMftZKY78aqpLz4x43xhpRs4L4ke5hSg6+ly8Iz7kYVnHBYS1AGun1
 Y/byb7US1i98EWhMNUna+mrQYwmAw0U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MyBTYWx0ZWRfX6OW03nqTZT26
 b7SKj71f9VmHHzCA36qSb0SEaoYh9clpWyCaN13oau3dkwNQYhE6cxnwdkAHoSj6RzfGw0rFNGV
 px58PbdJgdKcIXI1CHVB2YMwuDoiOiyG79AtdsT+DhBdYJt3YMd/ZUjULhISlHbgOXpqiidzitE
 xTNYfP58MFPOE4iFb9koM85nTkH6dC4vzOWzHODXeFYNNA4iOCcXS8gMkOWS1g6dP1PrLoKLAd9
 xORxMtzRtj+2YeRQh+2VKBJJCFBkT9FFgX/Tyzvz3LYFrndX5aNC+pvQgeyIy0QdZDbpKKp3UEe
 elTQxpU2hTVeB7Yflib7BLh9XbODyvD7H4IeHQBw0ijcrr8Yt4xu9z7iXB7vUAtcfikLU2pRkdz
 9rCYgvgZL931WKVpKTbnQvfC7Q5Z7msjv2ZWcUJ8o7xAKPbJFWvb+17a/ioiINW1YQ5U9G/xBro
 hEopL6+9xyKzHkHb2XQ==
X-Proofpoint-GUID: kyItjl3YOUbkFFChusHtFms-Veylfj_n
X-Proofpoint-ORIG-GUID: kyItjl3YOUbkFFChusHtFms-Veylfj_n
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc56bf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3N5iVQoPfUnDI5swr5gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170053

On 11/13/2026 8:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: remoteproc: iommus defined only in allOf if/then
>    blocks
> --
>
> commit 1ded47577cc7fa6ba7648da8e6df9b5ccd0a3022
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>
> This commit removes the iommus property from the common PAS remoteproc
> binding and adds it to the SoC-specific PAS bindings that use it.
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index f75cab6b4ed95..4662fe4cff62f 100644
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
> [ ... ]
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> index b20780e5e26bd..8aebc785f2126 100644
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
>> +          description: Firmware Stream
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
>> index 5a7c5f8c92d17..5c41c89369605 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
>> @@ -178,6 +178,19 @@ allOf:
>>               - const: lcx
>>               - const: lmx
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,qcs615-adsp-pas
>> +              - qcom,qcs615-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +          description: Firmware Stream
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 99e9aeeb4f62c..f838b98c43f40 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -317,6 +317,21 @@ allOf:
>>               - const: mx
>>               - const: nsp
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,glymur-adsp-pas
>> +              - qcom,glymur-cdsp-pas
>> +              - qcom,x1e80100-adsp-pas
>> +              - qcom,x1e80100-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +          description: Firmware Stream
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
> [Severity: Low]
> As reported by Krzysztof Kozlowski on v4 [1], should iommus also be
> declared in the top-level properties section of qcom,sc7180-pas.yaml,
> qcom,sm8150-pas.yaml, and qcom,sm8550-pas.yaml (or kept with broad bounds
> in qcom,pas-common.yaml)?
>
> With iommus removed from qcom,pas-common.yaml, these three schemas define
> iommus and its description only inside allOf if/then blocks, whereas
> Documentation/devicetree/bindings/writing-schema.rst requires properties to
> be defined in top-level properties with the broadest constraints and then
> narrowed or disallowed in if/then/else blocks.
>
> [1] https://lore.kernel.org/r/20261105-cunning-whippet-of-success-e4fd3d@quoll

iommus is only required when Linux boots at EL2 and this has only been 
tested on sc7280, sa8775p, qcs8300, glymur, x1e80100 and qcs615.
Adding it at top level would allow iommus for all compatibles covered by 
these bindings. Since this has not been tested on other SoCs, so I kept 
it restricted to the tested compatibles only.

Thanks
Komal
>

