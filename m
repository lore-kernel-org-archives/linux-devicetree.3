Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0913CEB9D
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555711; cv=none; b=SlSj7npjye3rjb1PdSqPNKcgnBEDdPnuhsGEvRUWzy+nQB2LMhp2cd7cd/Q+ixQHhj9Kbp4+vBfHAZQDqqoYiXkHr1BzcH7ZQT4LG5PPV9TEDzviFETB0+Nyp8/ItQJRcSKIJLH5MS+wR0E73HRYwM5jeJluF5bIc2IEc65drLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555711; c=relaxed/simple;
	bh=N8HVvQX69Dd9kIE774kAzOwhhXdFQYNCUF0qIO2ez5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSdVngSUvRIezFCocnpRvaMDUXfUvbb2U8NAfz0AAElskNOAbcKC8nZOErTvSrByaw3nMUFEGbcC3BQ8Y2xJu/p13oHASjUKCmmuEXsuOkvIKl39baqAZ1ooVBXQX9RUCsiCYFEoXhzFVUmiLsy5+hzek2bOQqXZmXRXOV2jB44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfWSO7Mx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EfmVP5jl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfWSO7Mx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EfmVP5jl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65452SmW1039343
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	In9fMxK9sgmXOfGMrrhhU0mQcsR1HH4zN2aSpSTzRZk=; b=UfWSO7MxVhWvv284
	c95iqUQLZP9hBH4gDptPODASNAx1Zs6n/iXSuUXvoAh4P9QrM/9P38X/HRIMENf9
	9PgtrzW0YVrJhohUUykx9CdfSthoJBa+UfBD95f9apbQErjAYAEAZw7gW0Ofw9XM
	DrpgvvhuMictYeLxeECOehNUyTG5/wqXKeFxdYtXLkSlPtHPCUq3pMzlFs055Yll
	aSdwfJYobfM6IUW1LHjpJWc/Ayk1BbOZbOW2ZNhiMnVVn0qX9D2yBBdg7UJW71Dv
	x6+Xi/4+UXjxjxdl7jdtTmKlQrAumxsXBxONl+mdJ1NghZOaz9kbaT+emt1gTzOe
	mtGpFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8j195-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:48:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175a1e32e3so11261511cf.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555708; x=1781160508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=In9fMxK9sgmXOfGMrrhhU0mQcsR1HH4zN2aSpSTzRZk=;
        b=EfmVP5jlSlGUvzTZ3bVlkten7EmoUweLdQXFGmNjhskjWGc6z0oCSEorFDgYpQxpGU
         /2gtqDwAOJ18EnzHu2O92Z6RlTXr9nn4AwP7JCtvMD5u+Ja2RBZ8bNUzoU68EAeQHwsZ
         q6SXiJz2L+6XxkQ/bt7bU+gDhGKjLcuNjg1U7sd0RWDpBsLhkhkTDAJina2vF5TQqzRN
         +M0ibld3ZoFf0MrCxaoiKbhE3GcYXlhMUL3lk+ieDGy+arvYjbszVgnYSFccGRTIQUAP
         kw9WzKxqMwr27tfwcSxIxnbyofxgIq7nGuqJvpmLLhXXSLmWHg/wba+i3V1bidbtMgpF
         Smnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555708; x=1781160508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=In9fMxK9sgmXOfGMrrhhU0mQcsR1HH4zN2aSpSTzRZk=;
        b=OMRM+KgPgrxUisTdmztk081A4PfWg7TNPjsxmND+bU7PL3IysN36919ERXX4qb4Yqh
         7pLN0qhP2eo7OtaagV6V9PlSM2W/XewwoLIho24q1+xkPuonpXgxrkd1LpEsrZDXsy2g
         NIbpAkw90D8+17JL3G486e6uf8F4o81tlyVumv4OVChisAUyVGkdBkxNRzlmk2YWfeQd
         rB6asuYBKMmZmXB63h2w1T9gilJZyZWwRWDLXaqxyBE5/VjUx7WfEVyBdBDSQfz092/n
         9GhE6gd1c3vPue7SVk13CuD7TMkVb036wlZs6nMPFsKg+OkpPm/dqGvtJMbgUNIUPoh5
         e6Qg==
X-Forwarded-Encrypted: i=1; AFNElJ/gZwdV9RogIF7qJVQad6eRCbEgw9/Z72Pkn4I2pesrVhJ92c8mIvooHvYyHN5e+53PzTO9i3mwoW6q@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe9x+YbMnl4RuAmxh3OIbnz6LaAIv/AKfHOi3bx30tvQUsL290
	Q0FYuFaMDQ14IT5qjv9SLUwlJ3SRulm0NbkjS/de+FYgLEUBYw2Fx1i2dahAZxamlo6J2QKPyBC
	tX1rh8alNCc1FDbTycEBM8/GfcwQBLjuRdkY0bY2vDPcf3STyh3UZ+dZnqGTB6jXQ
X-Gm-Gg: Acq92OF0GJOxSV9Hq8nXmVRdeVeuFXjXLz0g3inrq4D1ky52d3zNDmW6oiRQZS+NKCm
	Zl4OoXL6Mo9A5wO2S5I6Zdav8HVsHRRnzHILds7Bfg2Tz1n0jm18xVPoAqNKmAWEaI/UiOARkaX
	lgt8jzrH37ePcx0sWxAP1Opl29rdxujrypcZw850drs/UcnU/SS6iIY6qiuB+2o70GtAAPX/Ep0
	wAX2pP5eyOF2+XUv0t5ODzQqRVSdtF98C3mluqD8pf+2OKZzq0RSJW/BtQ7vDlOAiJhGw6Hx70N
	ICsbuHZzMqMmsnaWL07C9q8qHL/Oe73+1aE+7yPZyvSSFhp2pJ3/RnTWTgL1lhf9KLgpaus4LGl
	FyCELSVEAL1J3wZ49IScC8ho9yYt/2YavhEMqY99WzL4qKH/An8g9rtxyf6wui0jAjJA=
X-Received: by 2002:ac8:5d43:0:b0:517:6464:640e with SMTP id d75a77b69052e-517787ea5e5mr99750321cf.60.1780555708080;
        Wed, 03 Jun 2026 23:48:28 -0700 (PDT)
X-Received: by 2002:ac8:5d43:0:b0:517:6464:640e with SMTP id d75a77b69052e-517787ea5e5mr99749891cf.60.1780555707631;
        Wed, 03 Jun 2026 23:48:27 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm257631466b.50.2026.06.03.23.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:48:26 -0700 (PDT)
Message-ID: <82834dc4-14da-4a92-a1bf-4b8e744094c7@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 12:18:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ai0K9uv1YLJVpiyKmRmC1WqT4MxT33Ek
X-Proofpoint-GUID: Ai0K9uv1YLJVpiyKmRmC1WqT4MxT33Ek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NCBTYWx0ZWRfX2wQkoIanz/S0
 rUnViBSpa0ZbcDJRmNRj3qTmMwMsjZInMhAmqUG5y1hVioh+b8OTa34X00gWCloNW0vIBNk9Bu1
 8ehp9JC26ma66uXQBc2LFooeS5PF3eJhKDLRW4XHFWhTWkQLlyyZxRU+MriU8mSDFxpHc8aH3Z5
 XT4t+yzkisdgue/l3HskD+JlWmUYviyI4DzQRmRJj65X+xE3kpKronMwL1heP6KO9EjorQm/lWy
 Ail0C3CK8YTFiuVOCWhmaMTqc10l7lhSZJx3xWyYTDV0tZZzUhupNMeIQyVa/kpSCzlMwdlvEZH
 pBSnwZLzQAJGFWFguaiuYGOPr+4kHc0l4eIK31gz6FWOFVnHSlDWAzqPUTrbrzsbIHHW7J6faNI
 s5a0OTCWkAbnCTmSkpWgkTyQG2DqtKG+X7dTPX7lsOE9nMVHQVAenUlw7+V2V6jg6rN5WRG5Kp/
 yh3jMdTzA29aRnPwHOA==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a211fbd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=QLLTW4K7kuvKcNWOCmVsWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WTPBrf-vshRjUhDs8QcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040064

Hi Bjorn,

On 5/29/2026 1:04 PM, Wangao Wang wrote:
> This series enables the Iris video codec on purwa, allowing purwa to
> use hardware‑accelerated video encoding and decoding.
> 
> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
> except that it requires one additional clock and uses a different OPP
> table.
> 
> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
> and OPP table need to be redefined.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> purwa. And it does not affect existing targets.
> 
> Dependencies:
> https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
>

<snip>
> 
> ---
> Wangao Wang (5):
>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>        media: iris: Add hardware power on/off ops for X1P42100
>        media: iris: Add platform data for X1P42100
>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>        arm64: dts: qcom: purwa-iot-som: enable video
> 

Media patches in this series are now applied. Do you plan to apply the 
DTS ones ?

Regards,
Vikash

