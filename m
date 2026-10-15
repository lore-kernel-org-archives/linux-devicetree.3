Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656F850B42F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060202; cv=none; b=Gb2ww9LREyQtTsYrACHWhgxFfeLlL5jqbiZ6rUYXdzlINJ5x7UNXSE/H3Ir9L7IvQFnbNYETTsYNTRyyAyIuWBhLIQCPlz9qLMHQIua4gbgxHpbO2LQiClmLKnkPvQj0CwZQc3+s4cS8dBvlqHLItKZAoGGRESv5YKUjAGqi5v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060202; c=relaxed/simple;
	bh=EEMyodNYyojqUKJ05/pjKpNEGStpNn+ckLnAWXOb6Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MI8EfOG6nfNqnJoM0WltkTjCauQ4pJqWeuuW3zo3TlGZewhe5Lpxi9cPhUpXXQTdZ/YVBRB5Po6vojvUVMS7NN0tR1+Xl6EGlhIxMqLFKWerRZPvevgEUn4KbZUEUOqE1BwFChshElHSWXPsxO1qQMQgUS0C2axiqKsfXx+rzxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYQksjDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7jNKUIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYQksjDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7jNKUIg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jW064078195
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KplVd/YKYqENYMOmHIFo9y+PVYEEVdQEm3m9itaMaCE=; b=UYQksjDkUbOQufaB
	+7pgiELkyXGXOFV7uBU91E3rHdJtvmf7pIrrr7p+h7AJ7b0gtLEjZlvOz7XX2BnU
	oVdjPQUh8uNtY6kr0pwt4rBUbAJtixSCISI90BGxewMN5XKnYRdDlwvOg7FvCHss
	QZ6y5c4xh3sDeeZZUUOr5pKxda0u76aatzFwvN3n6F3NV27604z/d8l6pL1RyHT+
	vLrhcZ2gMJJA2nBY5qgUWKjkVRvTqTEdksSxd+3LFJuE0ToRvDLN4XuLa6TUrtvU
	cnemjFTi3ZvD9qjCXUmeho00a2sWD+XLpkbeukgb8NmeIqNUgL8YGEqgzIb3hzDe
	846OpQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc07t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:30:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd633da24f8so1294293a12.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060200; x=1792665000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KplVd/YKYqENYMOmHIFo9y+PVYEEVdQEm3m9itaMaCE=;
        b=J7jNKUIg+pfnKJzoklmo3A+CgXmcC3GSzj4EvU7fWLwJh128rvveDCkyMTawWN4xs8
         ksKGe486Gm19UBOYef3z225I1wdyOHwfq2yzu/L76K1ZV5avLxJZRq4Ebptjg/2f1+Bp
         bKI21bJWhwSxMc8W/T5HpOKYxXX9leL1A8onf4L2JEpiX+g+4VaJ7nV/Zdd6YM7Rypy5
         4bErgifdQSWtzODkLpd8x2n6+5cTTDLWgPBmBVbPXIGPZR9fAcSD47iBBt+lhChXPm/M
         e8t1z6Vhh0rcYDQltjFKKYZtfONBfw4LgDAIrbfhWUBf4mpLexBQy1R1JXj3Vsbstrbg
         F1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060200; x=1792665000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KplVd/YKYqENYMOmHIFo9y+PVYEEVdQEm3m9itaMaCE=;
        b=hOqQuYxY+trkoXJaKjcOn9Z14iHOrlkmvKVFXDViI/6v68aC/lAIkfNqwhDC0q57op
         2/dlVa3c8BanmHWcOfLYrrIDw9lqCUxgUFK4MQeb6PDckASzNRTzn7LHiVY1oCuiH4qA
         ZoyBvejtzjMUT1I3qdsNQInt7uUskksO/BDWS0v5Aom6/LVIbjUN8PQRdWrJdSLieCXo
         xzz894Wj/98pnWDc3GQWfvAm9BYvAJr5FNBzy356Kkyv5sTIWgrN1JUZvn8H/2ADBNjD
         ATctFFo87gma52dW8swZPLKtq5gbZ6aXX8CjgN6JIEndMZzsoWB8zdJtof3nzEojScB/
         jJPg==
X-Forwarded-Encrypted: i=1; AKwUvBw7VPMxsRlDjs4JvFSGWQHEHIYHaTG2GgTX8dPa/AwBpnTWaa/+SzcCYALMQNopK1lmHqx2PAv/Mw8I@vger.kernel.org
X-Gm-Message-State: AFq9FYIPcMYcO53CMbd3gQLmxJHdOkk3cOTEt2moVKH2/h5oHe4kLWOO
	qYAuJogTWEObrKfNxRaeTLJ+jixcCUkqS/6v4dLwu1GLAxvuPWrv4XBYUV6ePCdoDDNyfgWy3ID
	sJIiz6Q6uOrEuI5gSCN3OuE/G/tF3Dj0SCcf/6fC4n6Ie1AWblCOGJXEQXJPMlzNN
X-Gm-Gg: AYBFou2zn9zRDHU1UGDOQWrxs44yY/iydsF22Q+qaS/X8c4roJ6l/+MaxTA2kj0D6hh
	wqeaIZqvso8rBOfXB+nVK/PcIgFgCUn5hH3QAoR76BHKsXMRgRtxom8oFm6zm7rJ0Uk4eNXtwcP
	T2X7oMtGBqMjD/UxS3p5RAMrHjLQlVegyL67ygocY8Fs4Ef+/OSiuVQOxYEKInD9eEiNCRWn65C
	gi4snQia29O5PVQBtCeochdUtMffBNMYfE8ZfELLanaYzs9BU+6oo4P33xYcUjNFZM2nZ33gGck
	kJRKwqFqJxib32QfgT57HiH/l29xvfQp0jXrl7bi3H4qgCyrbAFROf2rc5IYoYc2Z6wdCCvXsXO
	K+56RjqCy2xKUKvFW1Q2ogKaA14w=
X-Received: by 2002:a17:90b:224c:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ab3a9a8d66mr19929520a91.26.1792060199864;
        Thu, 15 Oct 2026 03:29:59 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ab3a9a8d66mr19929491a91.26.1792060199340;
        Thu, 15 Oct 2026 03:29:59 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm4093439a91.10.2026.10.15.03.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:29:58 -0700 (PDT)
Message-ID: <6ac22076-073b-407e-b6e5-1f4d0a229121@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:29:50 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
 <20261014-msm_gdsc2-v3-1-f1ed69014416@oss.qualcomm.com>
 <20261014-elated-hasty-coot-ae3485@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261014-elated-hasty-coot-ae3485@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0ab28 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4m8bAy1w6SXghX4ugIsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXzmYmxgXpT/Yd
 ebXocAiqNEaL4ad45HHc29hN339tL7g/zk8ygDMXH1rPJ2MWPKA3aR1Z8V75OomuVcWrywqfd83
 16kBGFQI64Y0kaLwVuqGs5U0xEN/Qv0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX8+zqvDjJwVhc
 4BHmASGQ7oVlylIWFrlxIZCEe/Fh8VrXfJEz2bugYzFkMTSAF2FkUXdb82HjZQz6udZloTN1hV0
 eHJYwt72fScQGzN/NiUaHDDLib2xlc5vOJQgfXpdg17OScQoMnmt/9G4q6fWEBM0DdrQqy3Qnfc
 0MBy8GONXAKztnw0Fxl5D1mYY2faZowUbTN87SmBnXJ5cbjZHiF5qlohgp56m+RKMx/I98NAmuo
 k7yjAOP7GSTgc9Ye9scqOgRRYNmDVUwdbgixh50qLnVYCzmajRJIkxNIO+S1dZnJcCf7XzUFKGb
 8qrWPqU4vj6a1C5CQzmpAtAgww81yRDCUrRVsxLZGx7pc2PAXDCbKiOuSOQ8OHnw7anxkk5VE4Z
 PXwo2LhNygsXEulJG3fmjneSyOGDaekp5h7rRMI7WXT6XfdZ20OJM/JtvnhNAYy++c4IrZWJLaO
 FgrHlV9jWW/WG5LbSnw==
X-Proofpoint-ORIG-GUID: uJkUy3GVScDRhLN7o1o_JGh-I-fQTtub
X-Proofpoint-GUID: uJkUy3GVScDRhLN7o1o_JGh-I-fQTtub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150041



On 10/14/2026 7:31 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 12:38:16PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
>> MDSS hardware and most of the DPU, while INT2 GDSC supplies the
>> VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
>> remain inaccessible.
>>
>> Describe CORE and INT2 as power domains of the DPU device, matching
>> the hardware partitioning. INT2 only supplies DPU-local source pipes,
>> while CORE also remains attached to the parent MDSS device because it
>> supplies shared MDSS hardware. DPU performance-state votes on CORE are
>> propagated through the genpd hierarchy to its parent MMCX domain.
>>
>> Restrict the two-domain schema to the Kaanapali DPU compatible, so other
>> platforms sharing qcom,sm8650-dpu.yaml retain the existing single
>> power-domain constraint.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/dpu-common.yaml | 19 +++++++++++++++++--
>>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml   |  4 +++-
>>   .../bindings/display/msm/qcom,sm8650-dpu.yaml       | 21 +++++++++++++++++++++
>>   3 files changed, 41 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> index 3f953aa5e694..19b791a857b5 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> @@ -25,8 +25,7 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> -  power-domains:
>> -    maxItems: 1
>> +  power-domains: true
> 
> No, widest constraints always stay here. Look at other bindings.
> 
Got it. Thanks. So here mean allowing up to two power domains in 
dpu-common.yaml, requiring two for Kaanapali in qcom,sm8650-dpu.yaml, 
and adding maxItems: 1 to the other DPU bindings to preserve their 
existing constraints?>>
>>     operating-points-v2: true
>>     opp-table:
>> @@ -53,4 +52,20 @@ required:
>>     - operating-points-v2
>>     - ports
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,kaanapali-dpu
> 
> There is no such compatible. Open this file and point me to it. Why are
> you adding this compatible to common schema? Is there any prior art
> doing something like this?
> 
  Thanks for pointing this out. I will move the Kaanapali-specific 
constraint to qcom,sm8650-dpu.yaml, where qcom,kaanapali-dpu is defined.
> Best regards,
> Krzysztof
> 

