Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC593244687
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 20:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368548; cv=none; b=c0C2OVApJ9kvakuIVxBWIiDSIJubNM6Ai5GskNAtLDW8hSlz/fCYDtMAUZGsIK3JLyA8NuFgqYBh4acYIwb/P1Hk6HQCBgiwOAOsHSBgdXW6KoRFCynlzSeVGhiksFWatxML202ObUCTyqkUY77vm8mW7AbDSZWBvlpIJwatC4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368548; c=relaxed/simple;
	bh=JSLtS992gzEGa7aY5efNv4vm87rHU61wMC1Pm4bVtYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0i0TmhT3Jph1Yq2YfMne8oB7n4Sb+I2VtzAc3IBj09BhKUDmlEOp1XneVkKfM0REGAZpEcvbaehqG22/pBI1K0eD/kgLHZKngGeSmy3hisCyZEsT/BxQ1kKCmWLdFnqY3MiAe4VNHEWPqncYv9x7KjqD9xdPkyzOCnIJDg5Wxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGfDl3Bm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5oYenQF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGfDl3Bm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5oYenQF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIoAva1164045
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 20:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A78khGmA9qUjc85WT541K4/S4eJFRAYnFuzWGW94HHc=; b=QGfDl3BmFP6eS54p
	VdvF6CjQXuQ6nYZOAfMU6xfFfMPTZVSTYW1YJ5JgLqZH75KtmnCQOt9lOLVE/j3E
	5gJdAqeA14u1Azw+7KSArq/UO2map/B1Z6nvXTgfWtQU9CxeAO+QzZQMqpQXkxGV
	t5pEdnuyYyyX2hwRzFYBd+EqRMRp9asqnu0zk1J3tEfnnF7wF3H5oqo3CfSvqIT5
	JNBHfbgqo3lXuc4fBCDOXrUoQZ2WvL0GU8Q/MXo46yUMrPtkJWkkLwpHkpLaPaO2
	3swkjvvcY4j7PyG74TeVfLr58Zdj1se8tlhbtuaHTTyfSnzOiseT/7y+p6rtlvvb
	ToxmFw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwv57h13n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 20:35:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3282d5302ffso1662459eec.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790368545; x=1790973345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A78khGmA9qUjc85WT541K4/S4eJFRAYnFuzWGW94HHc=;
        b=D5oYenQFQ8Eaw/+p4/K1QCgvUIe3kJusUWlPc2Q6XYpXLEIXTHPPgJ35dfexU8Ia5X
         +q/X7K3+Ubpw7XyRRAWnHc263eJEa/9uGVjJSJYKyWgC82MhkDeG2tqXUgPgUzwiodmp
         Tymqy4an0QayTArjiifw2UgrNwjm145XbQ/ZpcmFYBsvhcv6TMf16PPcHsodEQNw0dQm
         aHALUVTs/JiZsfOCR5jvgPoxsarOyvmfeh4tpHJCjavBdvZQSSG1TKX3Xkadrw04wNuu
         XbD6wQtP4ZUH+9GsVwQGU0QbD4QW1Sv+9PvDRfmCv2OhPxIQ6s0kdgwoQK2E/Dlqkaj3
         s/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790368545; x=1790973345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A78khGmA9qUjc85WT541K4/S4eJFRAYnFuzWGW94HHc=;
        b=SKBJmN8LvUbTfOiekKMNgmjBVz3YomKa/ArJtOwQhV5G3wW++JITvpMRRBIe5aRiKw
         8994F3nmNJBo3WkszAXA5X4uxxwAgrPKpGIlj2Ix1rHP1RwE9gqOKz4nafjc58Lh7vRu
         8YmWgrI/KRtc1jXAXaYr7HVJrxmv1E+i7t3F7fLcvbgIXkb2GRyg6/6pXid1PpGIqUPP
         aKY/7bvxqPwGeLcoJEolM5j1LNHtTc6/feC7+0xFjc7IjIITcD47oZNvfDz5yqgK+A6a
         2LHRK3JSsDFL6kMM1dYWTAFSLIsw8cSx9N8jBHAO9mAMcK+W88VHGx5EVk0uXWQJScNi
         pH9g==
X-Forwarded-Encrypted: i=1; AKwUvBxmbYVPGWG3xb6uqTERZIbCrGmoPE9jqkhubHiHh2P5bO2/lzD9WoSuQWfOVpnKi8uxN+Dogldbvb46@vger.kernel.org
X-Gm-Message-State: AFuF++l3lYDT8olj4BMd0Vdhs+8PLG5G4y9yM2D/8yJAC6pLxWSicEbm
	MzzBUDtpsuYjr2Zcd7nBj0ZOWSaR0EUi4yWSQUnfoDjrkyaLv7IRW1/WMMHqZlTCKGxadQ+WHb2
	OH837CjMp4fIBRFeqBchXQOVTDQnsoVNf8oqJFjY/4j6CwWz21k+4TApPquGV+Tcr
X-Gm-Gg: AYBFou30SsKnJEgbZeH3c7Wc+c0ZndYjvrJJPch+bmM9C2zZYvVFI+OjDc8OpzJIqY3
	Mq1k2IIOwX2cF7XhbGMiDHM9wYRumCuU7q0Mwzbcsq8YIJSqnWjkxO9hQ5OhVriL4EcAzWQ7kY2
	eZND2mLcliQP36/VW98SytDt8Q3eKGrfLSpQN8mymlVSC0LouedlHBJCq4g/JNq6s+8y1bUKwF9
	1AkrMwOBplQkU9P+irs4f6nPmlabpuNK9aeebxJmtZrDJN1ueCfxe5g8GmM2Y9Awdf5ScqT+1GS
	iYOLhyctA85U16gsYQb4eolpG7+wq3TM+4XqCImCjb5cz2gkYogQn5s1AHHNPgeVqAc9/yAzLJr
	FiS6LBH26XYmN/QS9/CEsCjlz
X-Received: by 2002:a05:7301:7183:b0:33c:34b4:85d4 with SMTP id 5a478bee46e88-34270ab91a3mr949101eec.10.1790368545250;
        Fri, 25 Sep 2026 13:35:45 -0700 (PDT)
X-Received: by 2002:a05:7301:7183:b0:33c:34b4:85d4 with SMTP id 5a478bee46e88-34270ab91a3mr949065eec.10.1790368544367;
        Fri, 25 Sep 2026 13:35:44 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341451457d0sm8858485eec.21.2026.09.25.13.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 13:35:43 -0700 (PDT)
Message-ID: <680e632b-c919-4c25-8f25-a6bd9550ba6c@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 02:05:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] dt-bindings: display/msm: Document A850 GPU and GMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-10-0c3c79a1a470@oss.qualcomm.com>
 <6c8aa567-6ad9-4aed-a7ec-5d2cb6979384@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <6c8aa567-6ad9-4aed-a7ec-5d2cb6979384@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4MiBTYWx0ZWRfX2l6Wi7aOr9Of
 NylKwveBO9QvW8I4mKWfbEsyAL/0rlWG163PZ1+SuQaIkpt+XdyRjO8eyvv2XOYdzw4cTXpJyGw
 cdi89vv3Qh90PGnFj4I46HCmimpYHxmQ4jXhVMFac9jOh39aFCUYff4FlBbN9Dm3EynGkVz0bM0
 rbERUEwH4sg3E7C2r99r8DsXYOhrX/QJyBLniQ0luDkBne81u54ESDFU5C35Hf3Hy599NftoOW6
 oHPcRThbvRzr1PW3q5pZdOj0odqjZe5OGPPk+ZAf5pWdPahMOT2fTGgOhJkL4jI2t8Ax+g4FmsN
 G64GrshfD+ZS2f6IDSyi6Iz4RWUG0Xuwa7VvnAuJFIPzV/IHzdTvHuD5bq1xyxJ2k2a+8HuKxpK
 JP2z9Uw2NikoIgfbL8O5iTVujDFCaRLmSn7A78rFgYlWaumb6vA+nCDIRPuPRkmFm8eu3r1BEBO
 zCMsNCePh4iDtWg4pvw==
X-Proofpoint-GUID: -jUJ3jpDguddEqWdIWmHYp8ChuI9lvv_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4MiBTYWx0ZWRfX19q/i+dvTf0z
 Ihmgv0rvWvcjNMpJLM7szGx63WQ1DV8RiLJxzEo9jnq4K+x7gJFZAyy+dxWkmjqklwla7c5/SMi
 XLOcUjpDQN/G2+nlKMLUbGYi44WJbJE=
X-Authority-Analysis: v=2.4 cv=S4dMU4sP c=1 sm=1 tr=0 ts=6ab6db22 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SG-BlJrJjKrpKyBIS-0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: -jUJ3jpDguddEqWdIWmHYp8ChuI9lvv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250082



On 9/23/2026 6:30 PM, Krzysztof Kozlowski wrote:
> On 23/09/2026 12:25, Akhil P Oommen wrote:
>> Adreno A850 GPU found in Hawi SoC belongs to the A8x family and is
>> the successor to A840. Like A840, its clocks are described in the GMU
>> node and it has the following power related updates:
>>   1. GMU is now powered via a dedicated GDSC connected to MxG rail
>>   2. An additional power rail called Bx
> 
> I don't see the updated related to (2) above

This rail is voted and managed by the GMU HW directly. I will update the commit
text there to make it more clear.
> 
>>
>> Describe this GPU/GMU along with the new compatible strings.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/gmu.yaml       | 44 ++++++++++++++++++++++
>>  .../devicetree/bindings/display/msm/gpu.yaml       |  2 +
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index 9e459f12ce3f..875fd1242528 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -55,14 +55,18 @@ properties:
>>        - const: gmu
>>  
>>    power-domains:
>> +    minItems: 2
>>      items:
>>        - description: CX power domain
>>        - description: GX power domain
>> +      - description: GMU MX power domain
>>  
>>    power-domain-names:
>> +    minItems: 2
>>      items:
>>        - const: cx
>>        - const: gx
>> +      - const: gmu_mx
> 
> Your commit msg said mxg. Or mx, because this is GMU, so saying that
> it's power domain is GMU is redundant.

This is a GDSC that sits between GMU and the MxG rail. On a second
thought, I think we can call it just 'mxg'.
> 
>>  
>>    iommus:
>>      maxItems: 1
>> @@ -359,6 +363,46 @@ allOf:
>>              - const: memnoc
>>              - const: hub
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-gmu-850.1
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: Core GMU registers
>> +        reg-names:
>> +          items:
>> +            - const: gmu
>> +        clocks:
>> +          items:
>> +            - description: GMU clock
>> +            - description: GPU CX clock
>> +            - description: GPU MEMNOC clock
>> +            - description: GPU AHB clock
>> +            - description: GPU MXG AHB clock
>> +            - description: GMU HUB clock
>> +        clock-names:
>> +          items:
>> +            - const: gmu
>> +            - const: cxo
>> +            - const: memnoc
>> +            - const: ahb
> 
> Keep existing order. ahb is first.

Ack.

> 
>> +            - const: mxg_ahb
>> +            - const: hub
>> +        power-domains:
> 
> Just minItems

Ack

> 
>> +          items:
>> +            - description: CX power domain
>> +            - description: GX power domain
>> +            - description: GMU MX power domain
>> +        power-domain-names:
> 
> minItems
> 
> But OTOH you need to restrict power domains for every other variant

Okay. For every other entries here, will add the following:

power-domains:
  minItems: 2
  maxItems: 2

power-domain-names:
  items:
    - const: cx
    - const: gx

-Akhil

>> +          items:
>> +            - const: cx
>> +            - const: gx
>> +            - const: gmu_mx
>> +
>>    - if:
> Best regards,
> Krzysztof

