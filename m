Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FBB3E5EEA
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776938343; cv=none; b=hUrZpZV8m626GQuch3wdQuJPDj4t8VuyduXIAZYkN//sUnzP/Itxb7FmCTbgWMRrVrqHvRf34uh493OPenM1ceaZFV59aDR8WCgc0GQSXA+r0k7jscIxLqfT05lj13nsBmqMubA0j7oq1baUzR8xGYQ5QPQJoo6DGu9gqjiTLGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776938343; c=relaxed/simple;
	bh=IMnzqB1YowleuSkvqgO+9Pi4sJKmxQTYl3iRWwhgAa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImzsufayQSOahIXlrt+nODBTEUCcpP3U98eC8TwC3My4hbRi7E1/Ud4HkeqC0hBDMnVYplZ5iqTprY4HFUm0mLFhS3wFe0vnRzqBzYWE7R6uEaDKp70RA9oKx6NsGg3bP/FQvADiYWS2AiZRLtUtaNYzc7JzOmsxRgqy44TH7VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNpOaVSN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEf5ZqI6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNpOaVSN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEf5ZqI6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uEEv3044055
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IOf68G2YKk2F4dtcwU6A7Avk0OBQ1QvXguPWR08X8f0=; b=HNpOaVSNpLq667iW
	fnTY+KZSZnBfaxP6pAbEMz5rkSaxC1i63N4sHioPYORIYbinQC9zjZtTj8tAgsaV
	PgpZldHhYu0/lhc8NKfRePKm1IXWSo7oKZBLVEhFjtbbBAfXFN0qYKHJAEwx8eSL
	4zVWaaO9TBPszpGNYLafC90IIbWwWKRbw8y0WtNK4CIcKX/vtTt89yyi8aPO9KZ0
	Fxu4cHuW6VdoHvKNJD5i9oL0Su2FThsndwWyWQVcpWJVGvHg7nvk8g5oyCSp1dz0
	yzfis0elPaYS2nObFT0Yw5kMGDc7ltihF/kyjl290jk7E0Vzh66lNoPpHrpEUQyB
	LlIIMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3a9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:59:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso58285925ad.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776938340; x=1777543140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOf68G2YKk2F4dtcwU6A7Avk0OBQ1QvXguPWR08X8f0=;
        b=QEf5ZqI6f8QyscHo9Kr6K0IHL1Hep/JAFzakvKJrK9t2DKJGxLwRE+CZT/7yaYEhH/
         mcRD/tDLGzotstngbjEOV5kF+j6s5/W+mg4LSdrzMg2g+Jig4U9VR3a8p240PHo5ddgG
         iFiHF9/e2TjLAo72eYIqBMTKGt/q+DY+WUKLxGLgynnwR8HdIZpfoonWKC/kRqWqO2jD
         3Tp0QwUeIY7BT98UtAYh157avIyMevwcWIldoqsGiYLBTS/nlS7tuQ1kJPqRUsZKLhGB
         C05teQD1fHzPjgCD0KQMpa7f7iugPtpy8RcbXv/a33etcfG+uWqwJuhJHx/Z8uQX6Qne
         izdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938340; x=1777543140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOf68G2YKk2F4dtcwU6A7Avk0OBQ1QvXguPWR08X8f0=;
        b=hsqS9UvsiPL66LdnVluxXqIbCF9wpo2EKUQvF3EAgw1wcnvM1U4BKJSBDP/VYJUDCu
         VKg023dOaVwWbW+2jlC56Da6CJrJfAEWK2GcVL5VhG4V+XRtt1o9gG0RG4iN4TeH8RAx
         UMo+niq+Ua8IgaBhlvbzvSDDrWKFZ1bKNHdjTK2oCUrQ8e9IecRKJ1lXXkRXKK0wlFGr
         84zHSbMmWyxjsGxOM4cyP6zzbq9vTngDxipnaNPptuhSnd0Qpvx86+zEwxq2rqcr7x5Q
         f+eEQ0aJf5I7ksX7BgXwKSgppCuC/m3XL2uQhsiugRCVyFI4UEnrK8flve1QAlodoTrn
         68WA==
X-Forwarded-Encrypted: i=1; AFNElJ/s30fchLIHU9wSYxNg15mInwFIrUTqFoiMqeuP9yedK3RK9PSlDySmJP73SNaoP0Zb94Dmz+1Q6GVQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzjP1V25laebR0NfnWfQaozLDjWLFgKV27FhCoqu2UFmtIfeLtc
	+mqtJZcmPTluU/W4ih2A/93HUDfP3tFfA8UZ14sOJ4L3kPNV1EGBESq8jD+Ykqc91iAeYn96PtQ
	Vt2G+hrvz7InP41kgzVsgDf+fuC7OpAc1Pj4mgeqvuTjRelQxqW76hJgdbbsnKk47
X-Gm-Gg: AeBDietX4YSdZggqIMpsfIjvFYWJsVAJrwlUdh0c4k2qSIUQuySwTsuHYgKoAbknn23
	U+Ms6gY0SbFhcoR4eXcDDazcQCl4CuqSnzioqs8mU/K38gYdVWXwac4mQFEmtezORVWPM2RKCpq
	5gWgrrriDDXy041PkvXqopAyqi8s2YxAH+yGVkwWgcvKOpsaRlgAzerRrzkQAGrUcrQKL+2ZBnf
	jw2P2nY8MOYpT+REpsmQCit5LmpT1z9B0ZsJ3GM+GNMJMc+9jR1BR7js4oJ3h/ZW0dCMmPwNmqr
	FGtVIfxRa+5aPv7TtRmKexsA2Kp8Km3e1LBwOVKka68YrZYwQjlCzTibT9+yYnqAyhnd5brFkCD
	qlORrfi4TGJctvZiFZRZgQ7GyzoeWmgK/sxsk+h7YDrjNEw/qqmdXYZHJdvpS
X-Received: by 2002:a17:903:1663:b0:2b2:dca5:101b with SMTP id d9443c01a7336-2b5f9efc3b7mr300413435ad.12.1776938339791;
        Thu, 23 Apr 2026 02:58:59 -0700 (PDT)
X-Received: by 2002:a17:903:1663:b0:2b2:dca5:101b with SMTP id d9443c01a7336-2b5f9efc3b7mr300413265ad.12.1776938339324;
        Thu, 23 Apr 2026 02:58:59 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3ac1fsm201512955ad.70.2026.04.23.02.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:58:58 -0700 (PDT)
Message-ID: <9d2ba2ba-e560-44ba-98de-fc3d410f9b94@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 15:28:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
 <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
 <49a3cee4-fcdf-4653-bd54-72db73f80bf0@oss.qualcomm.com>
 <fd49a3be-bc15-49c8-b006-d0c34048fa32@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <fd49a3be-bc15-49c8-b006-d0c34048fa32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5NyBTYWx0ZWRfX0t748FLMTvrc
 xM2HzaPJYa0JBMjcfxPPhFArfc4FoyUtdUZdVZ6qpQdr6hGv9OZ9jpz9c2zbufnV6h7rVwckqfU
 6qIE3jPqWJpBVoZcWCVCe3H/33U2E3+qZWs3Ey5DAYxYdJWqiMLInUt80EMQOQo7jI3sdxYkdN0
 hL5zBglLMo7Yflsmzho6/HWxBumOVgS5vkGjPcs0oQEr2nVfGW1VO/eLoUB6h04znDcPJQVaaN9
 BifbzAdQjIEsXe4p2rI5Z7hJtCf7Rqli2K07ir1gn39EaoGV1z9Ags7L+xu/SVk4b90jByehdSf
 1iQblWIOm2E5DtNPKaNtD/WiuJIA04dZiNsqTTFKC8N/HzTC+yDWlzQ/4YHLgA8od7Kf/IU3ymD
 GeL8HqdDdQY5P23zOAI1hlt6jWd2uhE+vYtassfI3PutFLH5KYfZL9Tq9Ze14mY0QuHm+SdJXfr
 1AAjt53G8f41maqyNow==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9ed64 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uz4NEalOebycq88qK4YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0Olqy7l7w6WghxMNIes67zBn0quto9An
X-Proofpoint-ORIG-GUID: 0Olqy7l7w6WghxMNIes67zBn0quto9An
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230097

On 23-04-2026 14:58, Konrad Dybcio wrote:
> On 4/23/26 11:19 AM, Ekansh Gupta wrote:
>> On 23-04-2026 14:20, Konrad Dybcio wrote:
>>> On 4/23/26 8:35 AM, Jianping Li wrote:
>>>> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
>>>> reserved-memory region overlaps with firmware allocations (UEFI/EFI
>>>> runtime). The kernel then reports failure to reserve the region and
>>>> subsequent EFI runtime activity may trigger aborts.
>>>>
>>>> The remote heap node was described as a fixed "no-map" region, which
>>>> turns it into a hard carveout. Replace it with a "shared-dma-pool"
>>>> reserved memory region with reusable CMA-backed allocation, specifying
>>>> alignment and size.
>>>>
>>>> This avoids hard carveouts and reduces the chance of conflicting with
>>>> firmware memory maps while keeping an explicit pool for ADSP remote
>>>> heap usage.
>>>>
>>>> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index 988ca5f7c8a0..420219823496 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
>>>>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>>>>  		};
>>>>  
>>>> -		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
>>>> -			reg = <0x0 0x9cb80000 0x0 0x800000>;
>>>> -			no-map;
>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>>> +			compatible = "shared-dma-pool";
>>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>>
>>> Since DRAM starts at 0x8000_0000, is it intended to only allow this
>>> region to be in the lower 2 gigs?
>>>
>>> (it may very well be for some historical reasons)
>> yes, this is intentional. ADSP supports 32-bit address.
> 
> Okay, so I think this should be one of:
> 
> <0x0 0x80000000 0x0 0x80000000>;
SGTM.
> 
> (where we directly specify the DRAM start, which may just be form
> over function)
> 
> or:
> 
> <0x0 0x00000000 0x1 0x00000000>;
> 
> to cover 0x0000_0000 - 0xffff_ffff
> 
> Konrad

