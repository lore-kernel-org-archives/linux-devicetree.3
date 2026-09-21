Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC644372ECB
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986312; cv=none; b=Wm+nXW1NUDvAQuNlqqpco8C9DPjEpP0IkTcOQXJBbNz/qjiA84/b9Ch57c+//BrV8Jwa69jH/CNtrOSKZoVGyUvCztCFZpJCJHBpAaKVhduDUrkjLz6lXXZc7KFOEFzt0CiZNi5ZmEejdXECRJSNbeizsqU1OvI1kpmAtAZqcIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986312; c=relaxed/simple;
	bh=A9VR3QUYxO8a8WtMIjDeSYcnYqwK2kfzsUc9Oj5gFlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1flftQUO8+QwDwS7edMaBfGSVFypoQXn6T9YvZlz081a7FUEjdOaFlo2lDDuGgSwJUbagBrUr2xiiobhAyrq/ppqIj6wPArc9h0GXDn+KW0Xeo+s4MOOdaWZgUPQY3ty4u1LXdDSZ5a0LTUWF3ZcPcsom2cAkUorEne8Jluqxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3WKk4N3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfkhNSBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3WKk4N3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfkhNSBF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F3Qe956949
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMlRpuOOZRw+5X/aE9SiwBx1LBnvOHHcciAEnGUOJpw=; b=h3WKk4N3ol++VPvS
	jAFlkLTU8+lwwlMnqx4pYZm9Q3g37XemhYwj0hpQub5K2DcWP0Vu5oVjGN50b7+D
	XwG6EnKBhAY53txhWuP06uq1kX58cXpv7eXthfWdMwYd464wFwmXZEo9zDkrJZOi
	zfdYnP1EThVWye66aY9h4UqPXuXCETUGpQOn0ixIpIzmYmaOyhlkYxt4/GL3TrTr
	LVBmJzO4TG6k+K0ka+a48D/5OwkCjy/QKIMxnoC7wB0ldBi89KkyZUmtIvCh7sG7
	9J1iztpRnzmJaA6j+3sscviuigia87akKKpPUQ51mN1yWpPKAdWFUHM1uOiTMNxD
	2tVZsA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0r6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:25:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso4738267a91.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789986308; x=1790591108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMlRpuOOZRw+5X/aE9SiwBx1LBnvOHHcciAEnGUOJpw=;
        b=dfkhNSBFAGnpKkEr5JuyNyVI987FSBoacHcWvcSVhiSEkdBpVR2s5deTV3AEavg3KJ
         w5d72+28uXEuCTn0m2QriGHINWxa+RC0vDx7fSU6YHzrIlt2zl58X8x1TcM9mEZFZ/LH
         PR9oD5Bn4Dy1pPM8+EpF/ctDo/uYm19JUWezaNDFIk9uK3wfgj5QYunJbItHQIEtuUw3
         KBBSeR0/Ki8zyN2JKAJi3YPtmvmFpqBxV4UP0aJeGd9zGLkzOTv9L5JyywG1EwCZk+Lj
         0x9Os/pnRtIRVPwnp72C/0PaVLGjvmfP/WPOww1dtgQNtGFNhexDbXGRCd7XZho+p+QR
         pEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986308; x=1790591108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMlRpuOOZRw+5X/aE9SiwBx1LBnvOHHcciAEnGUOJpw=;
        b=TZrig/4DasKq8OImX/lZ5ceh2bWzJ3xHg4qu8Od7uBJcjDvlv2sKlRkoK5kuye3QGE
         oZenSdgeROlHt2mdWn9mmLoUdgH3dlrptcp2X4x83wca6+HjCufRMW0qb0Xga8qmTP/d
         WA2djGn8lM5XW6VBDLzQmkVRKP5lN0CDEd47oy2fMlYOR1DNk2H2hCWnQ6cu7BIeGtpC
         uglXXtvEbrk5JcMel5HVITFfJsichgogAu1lxWbAbb73X9FPwJu3uGL7yQ0tIlX6Zmmc
         LHAL52bM2E9fWMeLD9zZzm0UAUzEXsRwQKsjsfigG1HkC+htv7/5aLO8xL/KkukwqJNX
         Mm0w==
X-Forwarded-Encrypted: i=1; AKwUvBxJZX+C+U+ztdI9PPaHw1JL4pVQT1higzLkhNFPAq9Sm2lSfy9f6cIMxEUp+Hn9ZlrkFCGEzzOIzmHB@vger.kernel.org
X-Gm-Message-State: AFuF++lczUVJ+/+2fg+lwRs6fZ4LQ2q+Lan1QM991MbkdDh9Y19UnYQV
	eCo8UjCKc5IbzQkUxPcU5guf5tIqhcVzcgkGaVpavQiaap3VZIqDxyppzK+vEQXdlv8puOIJxKR
	dXC8cN2QG1vspKlll67BTdgKXWPLZxL6yUhDxbaPhw8I2rYYxQ1cyGpJoayw3DV9D
X-Gm-Gg: AYBFou0lRJPzsIo31N/FrO0nl5gdgrHPvCuhPZ68yA1NaoV5bl0tUlLgbwlamFocDHp
	U1YSvhKUenQGUDLHNyHV7xiKI4KUk+7B4kLW96beo5lG04/Fc2YWR91OrPM8y3JgAWdDCLK/w8x
	UyOP/131RzZM0HutGJAmk9GW+BRY9em1ZBautIuxWnT8IpTDEjabXFS5IA9BeLEvg73jfz8D8LW
	FoN9O/cPdGwChj8ZVxvwwCkMFmpt2xCK/QLvwBhwKP6V/Kkv2hwVZ4zDKa6ZsXwVs5yyLRZJCQb
	IGCBTKUfyKVTgYrubIqcZ0Usm4XPLG9AAMumBDomWDBwOUcX0fJoOd8z7xaoDHotcBf28sVUDA9
	D4gTg/NooM0y2nsFTqXtd15v1hcnHS7uR2A==
X-Received: by 2002:a17:90b:4b03:b0:3a0:49c5:d3c3 with SMTP id 98e67ed59e1d1-3a049c5da86mr3087980a91.53.1789986307720;
        Mon, 21 Sep 2026 03:25:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4b03:b0:3a0:49c5:d3c3 with SMTP id 98e67ed59e1d1-3a049c5da86mr3087950a91.53.1789986307252;
        Mon, 21 Sep 2026 03:25:07 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17dbdsm19788324eec.1.2026.09.21.03.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 03:25:06 -0700 (PDT)
Message-ID: <1c43227d-6666-42d0-a916-a7a621de97fe@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:55:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com>
 <20260920-girlish-acoustic-raven-d0f8a2@quoll>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260920-girlish-acoustic-raven-d0f8a2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1MFLvcfeZ_H0I91nZr-vg_4vp4E-tP3i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1MCBTYWx0ZWRfXyGT5EjfV2aAY
 xabfIFWypXn0U8QvtiBBy+XVhnOU+mEf1QPVb7b3DdlivMQz2bPLpGhYrOpKvjtnNOgs4mff1KT
 iNrPW7JiHqFPNBc0PgsO2YSXscAlWA4=
X-Proofpoint-GUID: 1MFLvcfeZ_H0I91nZr-vg_4vp4E-tP3i
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab10604 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cLYOH8n3fWJfz7Cjof4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1MCBTYWx0ZWRfX22n9rCelEfKS
 K5v+BdTHlyNmTBfedWiGOqezhLaSLTFhiBP9C7NuYg/eW5Wz/i3Gxrrp+s8/PLKSXOspRztX5aL
 VqVqg6CQ476ry/fxjEkwwsd+UysBxwuZWZwuVGuT6Jm/pTXe+jtzROSVEXwAEXkh+orNsE6BJzC
 rLAGEe651xKDBra8nUHVlz/ubKwATyRQI3pKERjvG2QAGYmsrPQ5apj8Db1cZKTFIZmhyZRwNlA
 rKqEJdxhpWXdcb+ErNTRkcGmlMJeK8Qaj4YDtFp0n2hbzRGPo0limFJIQOVQaRVgZXWuCzyqR7o
 TXmUkXG6UsSkC4iB8lockwA/xQXhRPMRxPpGUOGiVHREYXLjQxcU8wIFfk8N9xDAWiaV6Z/iJmM
 En+kK39is119Hw23YvINdajkKSthYdxaDzEFXnpENrWbc0Vgbi/8iIo9jdVmlXdujGnQoD+53aZ
 jfsAHtopEac3sAEnHCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210150


On 20-09-2026 04:02 pm, Krzysztof Kozlowski wrote:
> On Sun, Sep 20, 2026 at 08:03:05AM +0530, Vishnu Santhosh wrote:
>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>> domain, preventing it from accessing BAM descriptor FIFOs allocated from
>> arbitrary host memory.
>>
>> Add an optional memory-region property to constrain DMA allocations made
>> by the BAM DMA controller to a restricted DMA pool. Access permissions
>> for the remote execution environment are managed separately.
>>
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Replace the qcom,vmid property and BAM DMA driver SCM assignment with
>>    the standard memory-region restricted DMA pool mechanism.
>> - Rely on generic DMA handling to constrain descriptor FIFO allocations
>>    to the restricted pool.
>> - Drop the Shikra-specific BAM compatible and all BAM DMA driver changes.
>> - Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com
> And a reason to drop review?

The binding was substantially redesigned in v2, so I did not carry Rob's Reviewed-by.
I will explicitly mention that in the v2 changelog in next revision.

>
>> ---
>>   .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>> index e72adc172af102d8f400044ea0dc32db6b2365be..1e4324799f2b3b8a9ebf9f084e457e66aad20d28 100644
>> --- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>> +++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>> @@ -50,6 +50,13 @@ properties:
>>       minItems: 1
>>       maxItems: 7
>>   
>> +  memory-region:
>> +    maxItems: 1
>> +    description:
>> +      Phandle to a reserved-memory node compatible with restricted-dma-pool.
>> +      The BAM DMA controller uses the pool for DMA allocations, including
>> +      channel descriptor FIFOs.
>> +
>>     num-channels:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:
>> @@ -137,6 +144,20 @@ examples:
>>               qcom,num-ees = <4>;
>>               num-channels = <20>;
>>               qcom,controlled-remotely;
>> +            memory-region = <&bam_dmux_pool>;
>> +        };
>> +    };
>> +
>> +    reserved-memory {
> No need for this.
>
> Best regards,
> Krzysztof

Agreed. I will drop the changes to the example in v3.

Thanks,
Vishnu

