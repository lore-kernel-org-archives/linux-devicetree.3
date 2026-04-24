Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863EF3890F3
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023656; cv=none; b=N/RQZ8qJf3TPpByJDyBhVOG5L4XWtQ72jEZkB2HYCcTVodgGPk9M8oRcJd19VYTzJc8FukcBKiRsbHzZRrt/WUQgh+yT3cPSTqc1Yt4gXlTIttpl3bhXkxO7lOIy0fi+g+JNadc5KlGF947ldvRoN9BzCF6NvqcpU2nflhbY51k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023656; c=relaxed/simple;
	bh=Vf9H2UG05qoKr398eIXjoUC57YQbGM7DmdYxZ9Ef0Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3P99CtFu38zbYdm6mqI+38lz6i+J7x+rO+sZhPcZdBr0P/SzkhUmS2l+Il0dW8fIK5LYT6u9A9qjZ2tYbg0RliIu1ll8G2VNAODQEhd0hqVEjcmAIGzPixG866IEgsmokvVYHm8B+4EZgMIALMExVLde28HDngI7MCajBbHE5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iU68V2J0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQqcNEpR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iU68V2J0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQqcNEpR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O91VRB2709808
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUhERKpJzC7ZYA/PnGzU9lEKyH7Mxyrhg7LHLvtN+QQ=; b=iU68V2J0hud5/fJy
	nuvb94oFVoUDgL7peYgVg3ExtzCV+kGhH/+iaNbTHa4CCtIV2bZxsaxaqriRbh4t
	PJ5BTc3jH7ybihihfQ0fAW7sjC8m94cNisCxHCTPkoQWqEGzNddAMA+3Zjg/Pp0F
	1tghCwRagqdU3BCG8qxjQGxJGbzoMa+h6ZhsLCktXN5uXjj7lBUbQph0vTqHysRr
	1slNLPgbnTDFYeUj6Kc4kMaItlFNy75CT+SFAYrb+negNIf5VrwJAnKxiCnGo9US
	5FV+8Lm2hSwYU+KlA6ct0Ymy7MFXaYkPnbUxlE78qp/3AGE9TtWpRbzixFOOxkkQ
	DD36LA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9ueks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:40:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso69489411cf.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777023654; x=1777628454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TUhERKpJzC7ZYA/PnGzU9lEKyH7Mxyrhg7LHLvtN+QQ=;
        b=YQqcNEpRoItbgZX95Oy4MwWuT60XpuDcklvr+9GNFbJCyP1nO36kc4XzqrTBS3tAAq
         TnzO3AnXo4b65Wb4gmW7vbSNDqwo9GnJy0TVSjDLvKYdqyJ63N3NuWnLRKitk3xWExgf
         8R7BjWZMKITl224fh8T7AZ+158wVPrzgCrPBwjUVOxTT40eqmxzBNKZ4gy1aLW/5NXL/
         NNJX0HuHzZ//G8jUCS5bJOH6yyNJuUWI1f13aeBBegEn9/B3b3STW55ZjSaaV01MQVuF
         oTSVw5u3k0+yeQpJQZYTA9Dfg3peEmiwUu70oO2vBCOQ+Mm970xJbf6U3DKEyOrBVu3m
         FStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023654; x=1777628454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUhERKpJzC7ZYA/PnGzU9lEKyH7Mxyrhg7LHLvtN+QQ=;
        b=sv+H/BpmQOeMEf9LHQqvNUvSjC7AE/V020eV3Mg7M+EEzS0FlfnpDsCUsCkNjyJGzV
         pnNgKxiUmuDaLEMfkMnZmtX9BsV/0ScRLbO/PCc3MzsEQ2+lvJNTSizZwyIq5VCHjzBU
         8E1jh+6jBRcYtZ5HQTcMJgFkgMTMbJEYEy6uEkC7YypenE8h7jVwGAk+xm1tAjmFn053
         VRBwJfRj3P0zk9uPONLGi+8M/8rfD8UjYbknc7YppHVAQpFqDYmSHyNX2+Z39wg7Z/CU
         CauZtQ9FIY0S76d9BtqxeOkzAEyDPmYYnrwwZyfhZpORn2KAkOpF7dX4jqcwemrgXIaX
         vO8A==
X-Forwarded-Encrypted: i=1; AFNElJ+aMJiwmqe5yxjsQMTnby0MOj7XTHFJ3O+wcjedwsA9eAaEgtUhREmMk2GBKoEI2yGgrgX1r7qHRa5/@vger.kernel.org
X-Gm-Message-State: AOJu0YwHkray3KQVGsBPI8akptaKvUD/YjdXuXQQfEJqkvt398F+xjPV
	i44zCftMz1Y1G+f/AjFVI59ZacFnBF6rlT9FlyXl4TZ98OvbVJSKDexHj5gBNqB6H90zNttTWIl
	EzIcfeoWHfobHtgpaXdrodXtb4mssrVtJ+Vo5CrxzHRAyFK3NVEH7EkmoHvpk1oFO
X-Gm-Gg: AeBDieuZm3pIyhshlorJ0Dxu0/xxHyWMdSGQCbMoe5lg4Ia5oSlt7TKePgMjcLBrujI
	BD8D6u/Vz8PWRSAZczY04DGfryhFs+FGKsRq6u+TmSxtv/PnTzGHyyDe3Cre3wxGicsRX6upj4v
	I7+Y3uw+HYC8Wqy09rab094jLLqp97NGgyvtA/dd+FgYFf00gYC+jun8QgOxFLC1CleDcEmznJF
	Fa8URJih4m2ZzfomjOf+8iWXeNuK3Sp7K0g+e0Pg3lCzPkeLpndPPf2WQqlUQsl9xWdQl2Np/Aw
	qNNfHy+SfMUUFypdXESu5EqRYp7pEHsRJIs3gEyHouMNqz298F8PDgUOoCGWufR6yiMgQaJmXTh
	pP1CcdLMWRX2JsL4v7G7YeSPe1eOpRX7lmqJVPH79vOBHFeJei8p2qDpIsIfJ1JbkddiakmVW1Y
	zWhdKyJb1Co4z4+Q==
X-Received: by 2002:a05:620a:4589:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8e78bee4fc9mr2868064885a.0.1777023653804;
        Fri, 24 Apr 2026 02:40:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8e78bee4fc9mr2868063185a.0.1777023653393;
        Fri, 24 Apr 2026 02:40:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d4561fsm5009428a12.16.2026.04.24.02.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:40:52 -0700 (PDT)
Message-ID: <31c1a601-c249-426b-8f0e-30d729907a89@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:40:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 6/7] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
 <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
 <23fbb36e-56b4-4ecf-94e9-4038c6311b31@oss.qualcomm.com>
 <oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GGhAyqTgoCrUaEAywKPmGHCY4cU29kxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MCBTYWx0ZWRfX4xC3FFy2VuI+
 WojqNQ3dMTrJvf2dXlD7zajx99VxJLcTatxcCtEF12czwoMf/bLGlVR7U2BDvBGpUIpD5AwmKRU
 Gm7OrqoYBmADyA35HErVi3A/mmMZTzUoXUmMpXo7YEXcAXvSfeTJPOHvvqkEBeNVA6j0ZWbnmsd
 YvHj7emAgVHOXH1sv2X8BcrZewzr3/liafeCMDaZUfD0ytfqErdPBrz17kqVCqPZ9UYAcS69opu
 KxYuco6OhAAUkSVpStiNL1yVmuWFawo/5pk5fYFVXtCcufc57W6uxcmbueCRT5oANl/cHQ+IYhb
 gJc9o8nRnoEPbHjkkTJxtG9W+o7GY2ytdGAE+JTA4wj0O03QmV0gCa5hvmgb14iHwVWUnSFKKOW
 zXCPT4KQO+S1iCw9QB5QRWXlzZl2+8VtUmZhIVNFllb3uhMOiC5oRQHFnyo6zQ8wqbxQfXAp1aJ
 4HY+sB/uTNesDAatxXw==
X-Proofpoint-ORIG-GUID: GGhAyqTgoCrUaEAywKPmGHCY4cU29kxD
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb3aa6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=aOPa8h4f5WR7Ygev7eEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240090

On 4/23/26 10:34 PM, Alexander Koskovich wrote:
> On Wednesday, April 22nd, 2026 at 9:04 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/16/26 1:05 PM, Alexander Koskovich wrote:
>>> Add catalog entry and register configuration for the Adreno 810
>>> found in Qualcomm SM7635 (Milos) based devices.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---

[...]

>>> +static const u32 a810_ifpc_reglist_regs[] = {
>>> +	REG_A8XX_RBBM_NC_MODE_CNTL,
>>> +	REG_A8XX_RBBM_PERFCTR_CNTL,
>>
>> This list matches the expectations, modulo this RBBM_PERFCTR_CNTL
> 
> Note on this, added this shortly before submitting this series as requested by Akhil:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40613#note_3395308

Yes, I forgot about that bit. So it's OK.

[...]

>>> +		.speedbins = ADRENO_SPEEDBINS(
>>> +			{ 0,   0 },
>>> +			{ 242, 1 },
>>> +			{ 221, 2 },
>>> +		),
>>
>> The DTs I have all point to SMEM-based SKU checks. Did you find these
>> numbers empirically?
> 
> Yes, and I used speedbin instead as upstream doesn't support the SKU checks
> downstream does. Utilizing GPU_CC_FREQ_LIMIT_VAL to serve as speedbin
> on this platform.

Hm, I'm not sure whether it's a stable identifier on this platform, or
whether it just worked by change. Akhil?

Konrad
