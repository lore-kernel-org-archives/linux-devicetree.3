Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F793B42FB
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082350; cv=none; b=kpenld8LAh+mqwpo9+OeJYAFBkMc/t+3Qx/J79A/VDa1S9w/EPn6E9LfK8pb/wrUskjM7zY62mPowSiK854lPcbpVDNhDwm7P05MxCtDVap7VnoRK/9fRSKQ5L+ewcMHpXI//qFJR5V/g6SoTiXJ/LEK9WNXiftqLIDHJctlnow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082350; c=relaxed/simple;
	bh=SjbeGkZ14nH3FHoo2Fp8ZC9T+ZmoLwgWWghUJiFESRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSuODVKGjY/51KsqazwHMfFAeBtov6+j4Ytjca6dmZHtj+sAs4CW7H5bYLClGW9b9K/jqDYOjoy9UnIB8TXH6SR0uCRIJMC+itNwTVIDhLApvo8jeUd5DCSoknWGySGtTdtcvWFXYTDQ4/WuDnqIKUInkD3UlX4d7QVcB3xLdzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PcF0+Ijg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCtO86tz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PcF0+Ijg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCtO86tz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i2vm3151943
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2LeGRSc392ydFD5fvgT6QlW6NVIB2YHULelRqvgneF0=; b=PcF0+IjgrhwmQDrM
	HXnNpZ8BlAhTAQc5XQ5X3tRGcEiywVlp/tZ7xrZzlrhMlQb7VWnVZjH/2ntwOXRk
	+QQAxVRGnUVDvp8klb0wGS1RKeaJmerXEHt6QF0dVYIC4EYPNehVeIp2kvst+74a
	tej5La713HR/FvEQIgVVWFjlU2L9ExMtWhSFiGgn5GR2rlyh2WFzwfkF9FcNffmP
	L8ZH7wXY7IOEyWbdO8S0o9mY748pD8RSZ+4V+N0qQPn6/Jx3uD3rE7ndTCmZtOrL
	eFRYO7bRqLAoGJNxerH9KuMOYGwvPZnhYKKOVc7oZ5c+4uLBM1NMWAPiFelPlqRg
	gfYmZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesnfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:05:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517878a92c5so144057431cf.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082347; x=1781687147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2LeGRSc392ydFD5fvgT6QlW6NVIB2YHULelRqvgneF0=;
        b=BCtO86tz0LwyNtVT0uWqpbrjjW9UUrVDaQsUTz5LpuGBpMU3DDkNTb8B21ahSmqLYw
         aFg25Kg0nzx+27XNGhMroCw7xhVM8+RxTXr1cZX8IIiDNGP6ElIs/exTP1HVQLdNxgdY
         JJ8oICkZEjrzXy9Ptg0mKLgdm+SsaADxo2CfgCiLrOroVlViJgHDWE8Mjgy5svH0Lhj0
         7VGbD0XNjP7n1CjXMpWAa+1RKVoNHxHfYw987IdC4/Es/EHcTg18CopOuPs3yRzajJbn
         ouGW6FkNLHA9ypJ908BV48NTVoU2vvyxm5uucmOke6YyQpF2VLtUT8Jh8x7xJmqMaVpB
         OngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082347; x=1781687147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LeGRSc392ydFD5fvgT6QlW6NVIB2YHULelRqvgneF0=;
        b=sCrX1fyVL/kg6aJFvJr3R3Jqk69lkTMlg9t7/lrvIxQWWTSlvp1a8gbVRtv0smUpsS
         aRQYKUYTqPtA4KgkPKJxSxTJSy5CQ0cycP6tqvoaDD77P0eeX/sbxTv0al/fR55s2BDq
         QEahPIdOM/+/5mD9ORpZWSC5XVqbQBYjFCrV/TUkImJqLZ90FErBUJJvoghDl9XJKGHT
         c3Bfy03SDHoTzkrkNAWKwWEah0EGONZvvuwfWbBFEuzHKIDNq/Tey1oBvo9agC9ul50I
         AeBGZzE8obh6705yrchJRioaHYliaovHW3EY4f3SQBXii7XnuBBA8vwMiRGB5smN8P3r
         w6Aw==
X-Forwarded-Encrypted: i=1; AFNElJ91WnzMVZDlo0LB0OQFwUYvWSORa0M8L7gvM1c40aTJ1SggxIWwp5NHs1cFiz9xE7jHWWMEmhKMLu8n@vger.kernel.org
X-Gm-Message-State: AOJu0YyRjehasIWJbXKy/FA0idrf5PJvOFOUWnr6fdoyz+YmgFP/2Qyf
	yk/EUjfnHwVj70720Pu+dFnmZNGhyW1u+vv8u0O2/Yfz4Q1rdmVnUC0d8obxV8/SOKwAIa78mY2
	M8jeM/3Nx5S3U9//YcC3ztvYuERF4kW9Cb8sWNk3lG2pob+itenXGvq+byc8WkU9x
X-Gm-Gg: Acq92OFFIDlZokGw0Gr1ZKhz4ebVcpJ87YuoGFNMzByZOyOoA0F76fb0swUcNS5IVXO
	NJUkF5w/VSAMVYzdXnHuUTjr2+rLJo8DVH4ndkGzCG6Lt9bzBj7JEUv6KKMWsP5cVwH4/7+GXYs
	DHZ7oIkkC5vhqJnae39DujCBKi6kttc34EXX8HGWVZhtAf1pmiD55Y13QlG1pUBs0LX9Hn4pODH
	V8bJWCfQ8MbPjEphy/xa16zgyhqAq2c43w9ErqRtLXBJ4vUtaOHHfQv9mulYmrjjo10nkL4RBoy
	Aeo8sqsOw4bQuQGwXBgdgPAvwvs0nL7Z8jLj8MKztNdqXUBobN6tXSwx36maYfh0NYkUf4vtOOB
	VnrjLTV6AYMZePj77cC6OzhE82Q09bMVnm0WA6SQO+ZTuaQxsTCuWJi3z3FVkIlAURB4=
X-Received: by 2002:a05:622a:30d:b0:516:de71:e21b with SMTP id d75a77b69052e-51795b0a1a7mr339248321cf.9.1781082346506;
        Wed, 10 Jun 2026 02:05:46 -0700 (PDT)
X-Received: by 2002:a05:622a:30d:b0:516:de71:e21b with SMTP id d75a77b69052e-51795b0a1a7mr339247831cf.9.1781082346016;
        Wed, 10 Jun 2026 02:05:46 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553fd86csm1166004366b.46.2026.06.10.02.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:05:44 -0700 (PDT)
Message-ID: <e4f1752c-f4f5-42e3-a2c3-e1f37ea24fc7@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:35:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
 <BMTIFxHuDURlDmZzZJTVeFB6LmfKxZHPKz3t2FEVk2jHRMdO-2_435jcKspeb-fET7XxgnFnsKMBfijBplRx4w==@protonmail.internalid>
 <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
 <3d53b646-d5f2-4ca9-9d69-dc0899165c3d@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3d53b646-d5f2-4ca9-9d69-dc0899165c3d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Dkf81Ck45Al_fY17HYb_dbaC-AWEDSc6
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2928eb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=tTcoO59C9ckK9alVnXkiOA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Lgbjf1kSNvCM8hKjzQ4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Dkf81Ck45Al_fY17HYb_dbaC-AWEDSc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NSBTYWx0ZWRfX9hY6WxLZRN+2
 E1i9ptouQk68OKdic1gaEyNADcMs6j8sWss+hPoPG6lxav1/GBfgDbzDYaPWYOpTmYhpHe/9ayI
 kXwH8GerXvWbiOVkV3rmVoYI/TiKKWg5eUOrIyIHXGkIBb3bkRs46afPmy3QihegR9BIqWfZV/f
 cD9UjoFFFCwFMA+hGDd/3NVaGme4lq1HOdZIziAU0TRCVDUmF5VLzyxyYQdcbe0h5GFBPT53gJE
 ILYyo73TmwzpgLFD2bEXKKEWvlfNqcGGEeXbS1r97IZJKURO2Qh+3pnx4II8VktKmn1EKv5qn/2
 4vbptWC8M2gBLbCVYEnV2hZwnsFUqJLLvfVtkNO/LXGcq7ZiE/G6grEZrZ6N6VxO/wn1+wMk0ts
 iHK66h7LM1EPf6D1xx5WNYAO05/FfE7Mi8Yl34/fqD9pBkrQs3U0huG1RqT1K+x9ieZfH5Kf7iO
 RA1k8nKlvNj9K72ZZbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100085



On 6/10/2026 2:24 PM, Bryan O'Donoghue wrote:
> On 10/06/2026 08:50, Vikash Garodia wrote:
>>
>> On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
>>> On 09/06/2026 17:15, Vikash Garodia wrote:
>>>> Document the iris video accelerator used on shikra platforms by adding
>>>> the qcom,shikra-iris compatible.
>>>>
>>>> Although QCM2290 and shikra share the same video hardware and overall
>>>> integration, their SMMU programming differs. QCM2290 exposes separate
>>>> stream IDs for the video hardware and the Xtensa path, requiring two
>>>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>>>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID 
>>>> layout
>>>> and Xtensa isolation requirements, such SMR masking is not 
>>>> applicable on
>>>> QCM2290 platforms.
>>>> Since shikra uses the same video hardware as QCM2290 and shares the 
>>>> same
>>>> programming model and capabilities, it is added as a fallback 
>>>> compatible
>>>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>>>> two IOMMU entries.
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++
>>>> ++++++----
>>>>    1 file changed, 16 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml
>>>> index
>>>> 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> @@ -15,12 +15,27 @@ description:
>>>>
>>>>    allOf:
>>>>      - $ref: qcom,venus-common.yaml#
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: qcom,shikra-iris
>>>
>>> Should this be "iris" in a venus yaml ?
>>
>> given the vpu core was first enabled on venus and now it same core on a
>> different SOC being enabled on iris. There are 2 ways to do this
>> 1. Add the compat to existing schema which defines the binding for that
>> core i.e existing patch
>> 2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml,
>> but again, the shikra compat would fallback to "qcom,qcm2290-venus"
>> compat. hence even iris yaml would then need to carry the venus *string*.
>>
>> I followed the first option.
>>
> 
> I'm confused here. Your fallback is qcm2290-venus.
> 
> grep qcm2290-venus drivers/* -r
> 
> drivers/media/platform/qcom/venus/core.c:    { .compatible = 
> "qcom,qcm2290-venus", .data = &qcm2290_res, },

As part of migrating soc support from venus to iris [1], the compat 
would be added to iris and shikra would fallback to it.

[1] 
https://lore.kernel.org/linux-media/20260515-iris-ar50lt-v3-12-df3846e74347@oss.qualcomm.com/

> 
> So shouldn't it be shikra-venus ?
> 
> ---
> bod

