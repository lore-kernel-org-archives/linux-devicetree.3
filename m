Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555D3C342D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927880; cv=none; b=ghxoTrmRGuYE4s+YtVkpOPJs59VSgmgS8IeAs4jgi3XFqgf5qTbNwGUsfdNRo6hhX5GbC5h4TW0PXOcA4xq87nJobZf1h+9DAAnxfWFWjWs6LYzd/qujfThBRAoHw3o2US7qXFzY3T+8i/6B5KzpaAIhNwTipvhuS/qfyje2RJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927880; c=relaxed/simple;
	bh=uTKV6IvjJ1GeQko3Bl8mkwJGsqYNN/GIKQopjyHCBRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVzAYVzcTudvwbulKGQhrptN7Y7FiZDtvN6m62clSysvMhAWkpQaq0GUox3sN60rPR/2VbdyD0WTrhXWTBu0Whg4QJkyXQ6C8UOXYoFQ0PZuKrqyXy73+E5jHwkN5W7w4qjssp6IA9Jh5eKxDBdApNytuL2KuPapxNXfvf9jgIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qk4+vd44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXOwCpnJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qk4+vd44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXOwCpnJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DREhb3682194
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 14:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=; b=Qk4+vd4433uTNFtV
	oCiZat1EtNS/KU+LHkc2o12gHeB2kAsJqsNe/q/TJtvOrl3BCkqM9piH0YQbRW9p
	Lciw9X4jmk9dPS11xpiMpVh9ckzhX8ZXNw7BNQEf3BobxzcjXw0cTHQP0/s572Ql
	DrTGi0Ia3bU/QNQfGirm8fAGMNjokrcDyCQspK/Yp0Cklzt9wGhUW1zVJ1vc/vPi
	+PbU6NSaV06gM+p3bGFgm2qyYMWmxDf9yA2KOKd+C7dXrzVUGo66aCCWByVQmGg2
	65ccBHSW/5jQrotU96gkbShajrjTo4o2zVDI8g4bK8jPdOa3wolkwu5fC53Tyf3Q
	bzwUoA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rrdfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:11:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423970cb30so2753696b3a.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927876; x=1781532676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=;
        b=RXOwCpnJSy8zPQI7qQHNk9wh3KuJXWEUzW+VbfBvczfXIJC/rLhLiR7D7oPnFOFRl/
         8890Q6qvVwN5YOSEpf8sqwFRQC28sBs0OBVP15y7jzAqec/++d4drIzlvUStE2PM3JWk
         B4YFQKgP1MpMepkATRcbHPX1BlatomAZEqlTyQ1E+//qHsoD5g61kPp7ewzHxdMb5sHe
         VEzSV7EbjVCX5bL8jPGuyzrS/FPEyYw+OF1WkWOq+YDdXtlnbRwpAGxYd/TV4H4GkLaQ
         atyGivhCjiUeRwareDQSGR3+Ste4Zry1zb57CvREvNSieOF0bVSPTfsMMVzcCgNj33qU
         T4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927876; x=1781532676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=;
        b=pyUaY2zLc2lSqXVV9Dy0siVg0neFx8YLrWBT2o8/irdzOQUKWVFE29iCVHgYMsl5S6
         F/2dA/liXg7RGz6QjyVdUH8mxfmQUQvulIP/mQRugBB3nPFvxpEkp5YNCh66hhXQvScI
         wjPbr5ffs5hOLt2dnoc0GwNreV+ziVR8AA4uJsmMrxPxAFucv5aJ5y7rSMYX20m+xmSI
         /9BnKjCppEGYIn3G1awtphf2EjWcKuk48mjZ5HvhPvvRTvJ+aw7GxAcP7kTRHxhYl4wC
         dZPoxZdLzDk1ajUSIv8si4l0N8NjyAOSjZdNOScL1/Fkj6kjFtEJyCv4B5S0YUaWjtzF
         xdsw==
X-Forwarded-Encrypted: i=1; AFNElJ8KtL83NZu7aMmLK49J2qpDYWdxnO+FACRyhYdoBCjUmFbcAy4rqrDeXZdSRXVwbu3MRgETp1wWlzU3@vger.kernel.org
X-Gm-Message-State: AOJu0YwCcgTxN2SIFeCh563iEjhJm74uwUeW5jy/UiLkS5qrcN1U7ory
	kQYc7BiGYH1ExyiNuVJjWWhQae2jCxuL6lhh9kjS9cdFm2eRcOEZ2BPALORXDemg/d3Oo+zuFWz
	bBP/lLz8W6p+wpC4SXkkUXj0YoDwbyKQUKF1j09PaBuMJcma1+Kk97JP6qz/DhV7w
X-Gm-Gg: Acq92OGe8lJudjQiTwoSCR6HaHbwF8nS8szgm9vzNNo3MNTo7AglKbmOZR71/QGPdck
	FzjzaAz9Zc85U5/F84DRjxoChyEXDtbN336/ah71NHkjVCTHEVh6kTs9QWtVB+waxEjP2IG8UT0
	8Skbjn4hDzR2odlwRdoOiIXTQC1gHWYm/Wnui2U7Q7EevQu9p03p6mQhDlOEj9L1z9wFhW6FE+8
	0xQjBXjbJEjqe+BmLQLR4qnIiZv7+khIBveB8p2M8UFbeoZVSDlIa6nQx+5jwgX7Fgkxp3yq3FZ
	FcVnRp28A0U7YJJ47T4kX/0xFOYGAifIMMsn5PE6AQxUV0ffMo9rsqqtbSlYpink5EwSeFoyP9B
	nkvHzhhiSh9Sy0NYuZqqd3txZPF4xan5BjaMVZF1O+QQqvgR4Ey8RWs29iNBw
X-Received: by 2002:a05:6a00:90a7:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-842b0e835d1mr15041548b3a.19.1780927876561;
        Mon, 08 Jun 2026 07:11:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a7:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-842b0e835d1mr15041493b3a.19.1780927876081;
        Mon, 08 Jun 2026 07:11:16 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428706fa9asm17907958b3a.45.2026.06.08.07.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:11:15 -0700 (PDT)
Message-ID: <b0700a75-7585-4779-85b1-5c9a85958b92@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:41:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <naa4rebf2mpn2uybjgmaidtni5fckbc66t2fx3tv3cfklfsnb5@op3qmkovxz7o>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <naa4rebf2mpn2uybjgmaidtni5fckbc66t2fx3tv3cfklfsnb5@op3qmkovxz7o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BH19mD79qLN5i3iIQtXWkj2m5B2FUW03
X-Proofpoint-ORIG-GUID: BH19mD79qLN5i3iIQtXWkj2m5B2FUW03
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a26cd85 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nHMyhPlvQ-XDY_K2CzoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzNCBTYWx0ZWRfX9dEvlXkxFeK0
 X78Ir6+f0Vh0PbqxsBUOWe8LFAv1AUf5moQzCuPJavj2pHJqwd19PSAPDlusHiTcY5IGI/9DeBU
 dnT3wtLsJSvJ/CfVnMbvdCnBBliEnof2zdFCGm9U1kqg0JPCMchCBPqB7NxMz/LjjlWrabHHnAc
 c0muaBGDaTNDdrUJkohHvU1+qRmwpj5o33N2i9gY3gOZkG42BNHursu1fAcQ8o3loY3JHx4+l28
 Sgxll0hYBNem2vDu9eg+dbjH7KBSZFKWizodVP1BjgA2gJacAGFhPiWmouhimJwZ/Hn6AOF+NmQ
 9M2KhAIZAGmC6DYWf4GTp5Q/Qx5RwmWqo8gbPzEXqumQPe1/fz9qrn78nwF8DMpliwk4Ji9E/X9
 QYfC8oP9YsPPvuWrwDqEn0TZhikuQ3+SNx3a7jHNPRwoGz2h3jYxqRtIY4PMoGK/1M60pRfLRP8
 pesh5Juz9nSRJ7Q2pkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080134



On 6/8/2026 7:18 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:02PM +0530, Bibek Kumar Patro wrote:
>> Some SoC implementations require a bandwidth vote on an interconnect
>> path before the SMMU register space is accessible. Add the optional
>> 'interconnects' property to the binding to allow platform DT nodes
>> to describe this path.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -243,6 +243,13 @@ properties:
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
>> @@ -602,6 +609,26 @@ allOf:
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
> 
> Only these platforms have the interconnect which needs to be voted
> upon?
> 

Apart from these QLI platforms, sm8650 and kaanapali would also need the 
interconnect support as per the SoC documentation, but it hasn't been 
tested yet [1].
So haven't added it as part of the ongoing series, hence as mentioned 
[2] this list might grow to accomodate other platforms.

<The list of non-QLI targets to be evaluated might be extensive>

[1]: 
https://lore.kernel.org/all/a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com/
[2]: 
https://lore.kernel.org/all/0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com/

>> +            - const: qcom,adreno-smmu
>> +            - const: qcom,smmu-500
>> +            - const: arm,mmu-500
>> +    then:
>> +      properties:
>> +        interconnects:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        interconnects: false
>> +
>>     - if:
>>         properties:
>>           compatible:
>>
>> -- 
>> 2.34.1
>>
> 

