Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D13F0ABE
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781706439; cv=none; b=LaGkni8CPtzcgIlC3SKR+otS0/SefRh9wWhRK8dSA/v6cI7hAfq6rKyBRTskz0uS+rFMwMbF4PnIFFNodrshJkWHh9Od8mqq9TkawPKjwoP5/l38taOk6qMWlQ4/3ixtRBgNReuh5RupOC+Qwh5Y31qj6C85PQQ2blWJilGS1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781706439; c=relaxed/simple;
	bh=EFS4n9bsWshz3xpJubMewbsLXsLLgJQrJAAdzYyeyBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kx6Qcxfd8VRtbbs7NLOsH2Zn/yrywhPIQRZp0UDcUfkCZ3B2zFJTZo/fZ6RPoLAiBWUDf+VoEQ5a0LzsUn5s2f2/8j8m0evRQBDHSjxZts7WnrNTwYTQ0sSNnl9Zr9IRRtQKWfQ845Ypop6D8NznAa603ViFv3sHfFAgnTWeBNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYZpfHLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ll0sdbdf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYZpfHLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ll0sdbdf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEMjF24074502
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 14:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=; b=pYZpfHLf8lAVSEK5
	oidekzpgaXG+tKHMKtwM4AywhOMkdMed2gpUy819AdhqlKGdmiwOOGDWNkm+WCaH
	BiI8Qsrnz+jMNq/0XNVobb307i89lGEBr7EaJhwLT8E614PEYN/jmyFheXY+BwWR
	MhpWfczEBmrZhZOxlB0Ylj2jMD2N6LuItHe7PPxr5odRCxfi5ihi7d/V1LVI+QP3
	Wgyt6abp7B2FzbjQnzYP8CdTCpD4g8JwjeG9IWWRRMhdBanLCUJx8YX+vhIv99rS
	2djDPxN5P7bfZEltrHtk1W6dQj3cgTTmsZOT3GpmGQ0P0QiBj5jKoKpBQbGf4Qu7
	5JDAxg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vg0q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 14:27:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37cc07f3e36so630578a91.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781706436; x=1782311236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=;
        b=Ll0sdbdf+2eIdgSe/w6ijFWOXKKtirtdQAu5iEgRhPW43r++Ml4dAyXYL6I0rczUc/
         iNRCg2bprMo1GCuGRorxswmcz1gvJowQvE46gGw3Yh5dxfg0Q21rS1Tp3lajUAjYHS4G
         zhXRPHtZPTplaX2iOgLKfzHSJaDyCRnSuNHPRfBcv7JB9uWIglB5PACY3AoutHuAnmyz
         q943wtBG+3N10By12vmUZjSNajFmI6GuQJGCsO3ST68mxmVPoND4ozPEvVl8fGMxXZ8K
         2io8qDMKnyu75BW7pkL8QO0z9g+AqYFVJzQ+hiRhuZA1SjqRT/NQbPCbSGO2r2pQxBHZ
         cgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706436; x=1782311236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=;
        b=gj6ToaNMVSwOr98WqWi7y/XaIhh2jub+OogEb1QyBpN5qdwU/4S4NupEvtHoNUQVXl
         CAYQYeaPgpyuXOawagjb/yI94+XT8uK4G8OYyYR3bfUmYbSN6bh86N+mFRU2QT/d71PV
         Cm5RFtRkIgljYazbeGKc/lrUw24l4VdxVKI7mfrhGpBIcOj8WGe7FTr/eM7NfswGkwyI
         srdlrRftz9aIOWehPNL5zQHECtmVd6QL9i/2S9SzEv0r6EtkTiBvHyhA/EPKSnztx0lv
         86sVtc37WYKOk5Nv96Ojvrzb/hBc3fo42JJunn7uv9jum+UUMRvc7exOrbv9yBounu6H
         JeTA==
X-Forwarded-Encrypted: i=1; AFNElJ+zwdC2Z4V2NioGVAjdXYsXkNuMkTT0kWhZojgi6I/55UVjd/k+/8925xMMfgJkR5/TXWTxajhcnth9@vger.kernel.org
X-Gm-Message-State: AOJu0YxuwRKbb6QXJ5QrzFr4If6tWnk9MYofCaVL1VTJXZ9l3+IcWQQa
	HFP2TTovMopdZ6vsS0Xl1GQghnokoH15xMUP0hJh02iCagHauePhVFo/v/7nJYxi67Zwcx/pzqf
	wH4TMCGuHkFDMfot8yS0//gV+5BwFbfrcl2m2K4PvFgKl0/B/7tTPiUb5xW4s3JeF
X-Gm-Gg: AfdE7cke/1/YXQ3rUtzoz8J+PLwjZDSOvEWmSU+k+U08ElpdskVOM6C7vqjtivcyoNU
	aM3YDhxHje7/maRg5y3IJ2eumvRKglRvumy6IrrwHlw9By95gtquUYmhiqvGmIihCyuzg0dbXyk
	dACMNxLBLs47741anZ+N8wOMuKCeFfq4l7kb+5O8Z8njCH/8FA7AIJM7yAVKj2BqtPjs1VIoCaK
	7LYoQ67vzL460wzHcChuTXLVA738y1uMMhrc2E1ftt17Od9aIPvS2uzIJl3HwdsdOhICDJVvT5m
	wTvmrGS2MjKj3JBRkVMx1Qr0XHIoHSlSTOCDJVAGfIm332N3VMdMcO4drfltw5p4NHtgAm+lxo+
	cY2+jJp1yo35ry5L1bKMlakGSgkb3H0rt8ulRCj4=
X-Received: by 2002:a17:90b:2c8c:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-37c94cfcb5amr3893317a91.25.1781706435943;
        Wed, 17 Jun 2026 07:27:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8c:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-37c94cfcb5amr3893275a91.25.1781706435350;
        Wed, 17 Jun 2026 07:27:15 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186aefsm14340442a12.15.2026.06.17.07.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 07:27:14 -0700 (PDT)
Message-ID: <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:56:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
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
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: khqMbGckMzhCzem4VJ6QELDb66mxMZPc
X-Proofpoint-GUID: khqMbGckMzhCzem4VJ6QELDb66mxMZPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzNyBTYWx0ZWRfXxCucFWdJAj9m
 ZlyQa8vJgaE+9p5ruoyslA9J2tTItXOzUKGGPrRgRRzX33hnpjO2gb0YhOafBT0oycDpYikLyx1
 uBaEmGkzDmPKr2+fo0Yt1hhwp9jMeSHZfmxLZaewW9ty6Tyn5A+cEl9DUuPoD38OM82EwCAo8gK
 /KZ4nx0NYgjNWqbjdwxjgVZ+5/hAK3kXRwezYy47FW8jVQ+CyjXO+tXkxlDmfgpYLYAzZjdCIRI
 DDJhfiqw3qLdJkx8K5A4fM504aaY7tVFGi3eE7fHhTP376z9CSbbvgiM+xq+0Mu4HectXcvefHl
 B9I2qz2TZwWXE4WA9fm+gh+WmI6p3czP7zWm6hyFxF8baNjHn7IuON2DIvl9aSIILVFXWo1Vne5
 qhHhGFNRg2cggQRaZDd4v1TkykshnlD7vlP7xgbmFXGQ97QMIsnJjZNgOYjAF7LJeHyUfWs0vLh
 4g0AuFB5IwKEXF9hI/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzNyBTYWx0ZWRfXwqy2BmZ9IU3O
 V0mRpgdxEWe8x9LONSJiVsm1u7Ac+8O8mJ0Nmif4+rsneSzNtxEDtFsT4UI4n2V8Uw7LDVMM07Y
 FHzVuKMXdFvY6AAKtmEU1qCtcxqAHxo=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a32aec4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=C6ffOseXIbhiAUGq2Q0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170137



On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>> On some SoCs the SMMU registers require an active interconnect
>>>> bandwidth vote to be accessible. While other clients typically
>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>> vote, causing intermittent register access failures.
>>>>
>>>> Add support for an optional interconnect path to the arm-smmu
>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>> is acquired from DT if present and ignored otherwise.
>>>>
>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>> during probe and runtime resume, and released during runtime
>>>> suspend and on error paths.
>>>>
>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>> expected to have an active vote whenever the adreno_smmu block is
>>>> powered on. In most common use cases, this requirement is implicitly
>>>> satisfied because other GPU-related clients (for example, the GMU
>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>
>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>> vote is missing, it can lead to the observed failures. Because of the
>>>> precise ordering involved, this scenario is difficult to reproduce
>>>> consistently.
>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> @@ -53,6 +53,11 @@
>>>>    #define MSI_IOVA_BASE			0x8000000
>>>>    #define MSI_IOVA_LENGTH			0x100000
>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>> +#define ARM_SMMU_ICC_AVG_BW		0
>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
>>>
>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>
>>
>> Ideally, any non-zero value would be enough to keep the path active.
> 
> This is true for Qualcomm devices. However, you are adding this to a
> generic code.
> 
>> Here 1 Would be enough to keep the path active, but might be too small to
>> reliably keep the bus active.
>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>> power penalty.
>>
>> #define ARM_SMMU_ICC_PEAK_BW_HIGH	UINT_MAX
>>
>> seems to be suitable here to reliably keep the bus active by BCM
>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>
>> LMK, if you feel otherwise.
> 
> Shift it to the qcom instance or provide platform-specific values? (My
> preference would be towards the first solution).
> 


To support platform-specific values, we may need to introduce a 
LUT-based approach in the driver. (Bandwidth voting values cannot be 
placed in device-tree property IIRC ?)

Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
can evaluate if this could be moved to a Qualcomm-specific
implementation.

To clarify, this applies only to the bandwidth values.
Since the ICC path itself can remain part of struct arm_smmu_device, 
similar to clocks and IRQs, as it represents common infrastructure 
required for the SMMU device.

Thanks & regards,
Bibek


>>
>>
>>>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>>>> +
>>>>    static int force_stage;
>>>>    module_param(force_stage, int, S_IRUGO);
>>>>    MODULE_PARM_DESC(force_stage,
> 

