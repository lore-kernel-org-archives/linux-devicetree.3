Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2B372ED5
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866481; cv=none; b=lVnLs84XpRvFBHNnXZ2XbrI6eKMLE80EGmcpWAGAvzBRZRnDxB37AlJv+p5mDUvEQ55eV6EC2h3GErz2E1zBCy11i7w/8qdtHVvvHRyUhU5/MVBpfFGi0LnuXBVAjE/6H07iT86bR0ldq/JSA48rBPIFYTgzSEfOUsjxv3cwFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866481; c=relaxed/simple;
	bh=cijrwQ9O5Wsy7Ns7ARoiPJFl63dkmQm9dPwVhuUPxvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4yo1w7EeS2KK34+cl6bwVriiD4bg27zsRXt+Op5o+xu83Ml2wjQF1SYwQ8MJUw8WlXHBd8ofU/K9+cqmYN7sVV80gRopHp+08lQSkvw5fhwxX+BW9Ftt1/ZpcpyYVPWmNSBO6rHTrxCwvxBsr4mTHgWU88ObEYNk7a9jyRudLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhNHN0bi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csg/tHiX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhNHN0bi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csg/tHiX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JAofVF520111
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJASCICmhbYbPbzCDWKXXIRnLLMfhiemH7GJWmQ/H1Q=; b=OhNHN0biDYyFQwgk
	nXOC7uj4+hu8ejH3kmNt1s+lrUg4ZL23JpqdrV/OMVC+JLAuBLfE+xPm8V78s9iQ
	IF1mOiz1CV6CNDvSWeOueLa/qfC3FSSmq3Sk5+jbseiurHfL7elTbL+aX8zcQja/
	rDCmev4XPuahHfjOj/pDvSk4eXqC9a4WyYRwiD0MBk1RRNXmUXy5eWUudBDff8vp
	IaBJVLBpM2FBEPicbmK6K9qtCNsOlaQRO/HBzQ4qcICcRHme43QtTpf2XhAIqjaO
	FUCW16qOUCJnr4sifm6l+WTi8bbLHcVZil3qZQUudtHxiiVFW4A0sVMWm60wTmuW
	P9ZVgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm22bmyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:54:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6cf1126cbso19360035ad.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781866478; x=1782471278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJASCICmhbYbPbzCDWKXXIRnLLMfhiemH7GJWmQ/H1Q=;
        b=csg/tHiX3AVJ7SSgoBZvTOAR/GPkbHBvyEvSH2AD8w/4vJg44/U3ppzch1umV5J3At
         pYkOTQEb534TgSPqcANlf3+cX0hRIk1Xw7dosF05yP+kZKa5fHYglQydxHJAcH2TPPAT
         o6aVq1iWd5861mpqJub0HJ5Q51kMK3vyJiAedJYxJBn8Y221qHKWI29V1YAkEd7zPC9J
         vcgGCYEv+QCwalHoqFmQUZWtn7PPLp6JLP2Ek9gJUFT1fKC4ajvlWtrv7hkyOzNJ9590
         2Zh1TLVrJcqm8BH5wUU4tStDoSkdTSr6UXBIuPcz5dz8yWudk9fHBcy6DgUuQwkvZbRx
         xaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866478; x=1782471278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJASCICmhbYbPbzCDWKXXIRnLLMfhiemH7GJWmQ/H1Q=;
        b=OVSlwFwGa2RYEWvozfhj50e3NdXAvg4hHbbbuYvFnRlxz7t69pyhxgAb+BA0Ze/AuX
         yr3NwY2Da4fCd/N61P/9I7aQsDANtOU/vbe/+N7+NK7RdJwWP0D0KAFhCqQeJBWY4a49
         Ctni/tHD4g+SM5I/f6xfn1u9hnrQ0F5iLv8aDSgoUCGu9ryhNo/jZ/vlyAtFryvdQxg1
         YdTzIM/IOIkZlmLRzN2w/Q+ZNWDaqzcBg6wQGMJ0S2lq+6HXrn8AvxdUuS1YNx7JSga8
         TybPdr/c7yCyjwt5zWM1COpNUYofvBS5+pFAe+6X+Qql1pY5WX0zp8u3FPV9I18Jl0cJ
         pDuQ==
X-Forwarded-Encrypted: i=1; AFNElJ86jxUrt3ZZEJj85sYm+g16RKQYTyvBTiEPk4L3ku/v/LkcQjxjemqFCFvl2jxJPB/Gpi9Enz1exiLP@vger.kernel.org
X-Gm-Message-State: AOJu0YxYIp9Yc+xLQaSH9NYt/Dl7Go2DqK8UWMkv9Dmwmtz3GeBuC0Zy
	pf+DKIX59mgDViW6R8CmN2zsD3U9WSmWeLqlaTkbYbv/UVrI+gO7QTYCtv+GJdZ/PP1s5Xip+3Q
	4Ghte3dvFGR5lhQdWWgkqSPJrygBTyg4tc9UbWzbaUiJcqPhHFdOjRJtqqpg+lDcV
X-Gm-Gg: AfdE7cm+ihQrCIbOHsG6HcGR6/fXZ4R+Ryuom4qz3GsMEtVn9eIdHAdN2I2W0s5tBRy
	Hp9RKDU/00Rff5pam3vC4f4BrQHL0429l5MTEP22SrIMy9l7kaDMpS1UpgM7XJiFcxqTTq6Uy7R
	U7HguSlSUjLNVFceQv/zuxh2IhHwcHRiIwAC3B4pbU8CRM3NQvb3gijgQhuG5+WrH4aNXCvv4ZF
	TiotoV3X8Zm8dtfDXJNuc+BEznrJLxtO03KSBATQfrowMmIMZndv+qXBTA8LRef/24Hj2+2uZeS
	LzDkAdoFQZrlX0S0NA4Q/o86MUbRJvuIdY2rs5MjtXd8XZ/4jXCtYw51JRLwPPButGQPICRK1VI
	vnc7oxlM6jmHddPJHvBaoJZVlFDkPeSeBl9U4mQ==
X-Received: by 2002:a17:903:32c7:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c718f1f000mr33930655ad.6.1781866477612;
        Fri, 19 Jun 2026 03:54:37 -0700 (PDT)
X-Received: by 2002:a17:903:32c7:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c718f1f000mr33930485ad.6.1781866477173;
        Fri, 19 Jun 2026 03:54:37 -0700 (PDT)
Received: from [10.219.56.41] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c73663cc3bsm4044435ad.76.2026.06.19.03.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 03:54:36 -0700 (PDT)
Message-ID: <aaf4daee-4886-4214-a761-80545d2565ee@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 16:24:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
 <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
 <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a351fee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5sB-xfgw_plGXbDTPmIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tUR3shQSU5h9eMirC-qB6_M50lmwJbYw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEwMSBTYWx0ZWRfXwszdT7obN4te
 oo2JtpOwCskMyq936yWMErMaBviO9JJu5b+wJVmw+7XNWRtzllyH8y0YJpfwWzUriwP1huxB/8l
 q69RXsTcASdaYydU04RvJTg8MKNogbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEwMSBTYWx0ZWRfX/aZBZf3c1/BQ
 9c+7Xdwp/YEI++NRp64sP7rhPowN7H9btiVgEhabTa6AMkBUbSAUse3TFGX2pHxdOcxuYmsq+k7
 7r/GWbn8CPmE77T+vgFsc1wdVQmZ4mSNGudd1dGCMmo8oc2IMxks2esXYEaLgPJxxWoPDIreIZW
 GbGIg37UWjGQu+KPcO/KngsfXE+gcissajUS29quGdHno2nTxcpL5chHWI+3ONWEGA02Yj9C54i
 KPzXEEyUCryLNlbwL1Evo3Zkc0nxp8OXUhdIY1X0EGeFdxgHLnXyfoDmw2oKA0s4qxEodK+/GHV
 mDOjjAr4IzhfwKq81G/QjPy70sOj+AoCQtQzK6v7Mdq3JB10ZbQePxwP1F9gKfZ6ZrklMLub3DM
 PZjEHnbsVr4ueroWVxkvgvWYgD97SycI6idl86eMPeDsVf7JAk+7iUcwftwU7RSwwOGHM+bXukU
 SAA6UcSfNgqwbM51fsg==
X-Proofpoint-ORIG-GUID: tUR3shQSU5h9eMirC-qB6_M50lmwJbYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190101



On 6/18/2026 2:58 PM, Konrad Dybcio wrote:
> On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
>>
>>
>> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>>> bandwidth vote to be accessible. While other clients typically
>>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>>> vote, causing intermittent register access failures.
>>>>>>
>>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>>> is acquired from DT if present and ignored otherwise.
>>>>>>
>>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>>> during probe and runtime resume, and released during runtime
>>>>>> suspend and on error paths.
>>>>>>
>>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>>
>>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>>> consistently.
>>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>>
>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>>     2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>> @@ -53,6 +53,11 @@
>>>>>>     #define MSI_IOVA_BASE            0x8000000
>>>>>>     #define MSI_IOVA_LENGTH            0x100000
>>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>>
>>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>>
>>>>
>>>> Ideally, any non-zero value would be enough to keep the path active.
>>>
>>> This is true for Qualcomm devices. However, you are adding this to a
>>> generic code.
>>>
>>>> Here 1 Would be enough to keep the path active, but might be too small to
>>>> reliably keep the bus active.
>>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>>> power penalty.
>>>>
>>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>>
>>>> seems to be suitable here to reliably keep the bus active by BCM
>>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>>
>>>> LMK, if you feel otherwise.
>>>
>>> Shift it to the qcom instance or provide platform-specific values? (My
>>> preference would be towards the first solution).
>>>
>>
>>
>> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
>>
>> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
> 
> (you used decimal 1000)
> 

It's my bad, i meant 1000 only
(I'll check on the icc_bw calculation to get clarity on the values)

>> can evaluate if this could be moved to a Qualcomm-specific
>> implementation.
> 
> Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
> the QC driver
> 

Just curious, wouldn't this apply for all the arm-smmu users in addition 
to Qualcomm devices as i mentioned here [1].
Vendor hook would make it Qualcomm specific.

[1]: 
https://lore.kernel.org/all/984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com/

Thanks & regards,
Bibek

> Konrad

