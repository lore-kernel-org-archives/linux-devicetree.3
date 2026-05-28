Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05A4014BB
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983793; cv=none; b=TtAwYOb030yC2mpRVHN3eWRsBVvyxeG/y4mobV9HnwGZWgXHp+qUWE+FfqqYDi+JO4XIBNwhPqoFUcUGkAC9qa/ppp1W8jxOacFh73ZA/ho2ZoBQnfFlzT1sXMwZAVsDtz6kJdRAD21BkZ/cBnSyJ+3YlhGDCGinhz81czUYElk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983793; c=relaxed/simple;
	bh=U7YdXAJ4ITyF6ZKndT3lGcKju51uo1JDSJZg7uAQLkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTCPEVIrWCdVPhPMT8mAhSGJqR7uOJ9DQ2QK60mquTGG5jqj0eAbuXyoluKHLvOJvP+QilywOtLeFK2grCgv6hNcVAABNlM6c5a5fB1gFR1ygW4F0ahqVp7Ii6i5ox2KjedZROakZBd0F5Gjvg1zj0uBLec/8BDKVqrEig/8j1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loCM9+yG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmPFUV97; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loCM9+yG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmPFUV97"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8ve813546066
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJvUVRi0vvfQLNiWak2YMqZx53Wx7cTd4RQlSZ8GwSw=; b=loCM9+yGd73E4j3l
	Oo3ph4qkphPFUXv/aUtrcTG/20IJgjJktbu5r6EQQZ9xK7IK+IATcE6IeG1Vpnjk
	IAEmIioJIdA1oyx+ssIgIFLcw1azNwvJUeKClc6MHa7n/0leFQ5g45pI3rL8uS9A
	xj31Ia1Y1HztysA8G0AzmdEufA2fYdfzjTzacfkJJa0utCg+1uXApw48g5/aPuFa
	GlwfiD/WEAODMKSxy1ekqLSy6JQRg8Nkyq+qdrJKLQUkC1TW2iaZFLELjIIHmJmN
	4NIl4abhhMlIKYz/9PWe4R5aSI36id99n5KIc7uLINXE36ocF18S7+wgEt7jCAcH
	TIXV0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3uhbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:56:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7aba0af02so126950705ad.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779983791; x=1780588591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJvUVRi0vvfQLNiWak2YMqZx53Wx7cTd4RQlSZ8GwSw=;
        b=gmPFUV97VRaDPJYagsnkGFViDwOXpzjPM0SbdJGAq4IS04o4sRL/+Aie7L+rspAWRc
         Q9grU/YTthXaolCmATJj8qg/iT/+6IJyann5PX2m5ZOnGHOls8xQwO9JY9rWXfsIr3rO
         L78AULLK9iiYO7WwyoTvNtrebLl+yQfOUlg8Rz2Qf7s8DB7dxPXdl+9ZSzOsZBpugQx1
         z2af2wCs0IwUoUC5VrmInlx0nYpnshPQh3dczvj4LEGgkOGk04vJiTLMKYAPhau5KbYA
         /mduJh/tWp+MCUl/gyCfUbPo7/y0vfga17Cpw6NAOevnb/GCNquX0Vr5lbnROwMZ7w1h
         4URA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779983791; x=1780588591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJvUVRi0vvfQLNiWak2YMqZx53Wx7cTd4RQlSZ8GwSw=;
        b=ZjNvhAkIaLdQDUKouJ/JmoXy0SRLyoOfWJ9wa/OgIZXW6bPcMwy0nWpEvzAdYtu1O9
         kMX849EeetYE2JeR2xU4DAP0FfAnvrQUjjwE4lQ4q7eYOsA0YILPyaDDuXKVxGV5mgRh
         FW+1U7AeOPrOZDMogGvdEUVTv1TWzQROc/dMB0JrdGq3ijpIMQOZ4qsh26h3HfZeL6mp
         hCX+jFPKg2tCijuObaXx6V9KAu9RiRDqDix1ZZq1//gL/FZ3w5BvdjQFNL8NBPgs2nj/
         NOYUdA89CHFxvjwO7uybDeGaNr+cx5/nhyVwTXCynOqgU5ZHwnL8gUmWMmwOBD/6uill
         Puug==
X-Forwarded-Encrypted: i=1; AFNElJ8yDJk65+j8tXjndo0WCyT4yBay0m3MO3jDKpalHVYDbnphTMR8wU3hS895KnilsCf6ZyWLWGue24TG@vger.kernel.org
X-Gm-Message-State: AOJu0YxkJchnwCadQIu+qRd4dVFDv+/ndZsDX1h82SxJ/UATs8DMNEnG
	r3rUjUxbkZubJ6exnjuY+/B4qZ2JR0YAKsHsshxFdRggUYrLxKeDr3FNBXXP9vrhbxHCFAPoFFA
	vl6VhVE5r+xPvCLk5KcVuQxJMdKpBdsfw8zWpLoej0IRGNANJJsouuUO6yLwNJHdb
X-Gm-Gg: Acq92OESgJoGe11bKK2hRosiYMWc4Tz/CmLsb39SQ8e7ydsL5CaNBqWQbvZwrFwGN6B
	uYvZSQdn/tPkxKA/AmTEWOqHqyVW8NWTA9kjL7MOdmcPpavGWV6uQTFG1EnSfbWw9qHHyFKUuAt
	6WMnjPRsK38bT01TkHz32cd4y0+scGEPqukNvyI97CzGIjo7ppxmcOo4wWGaT41LYq9O3/IivO/
	ZJoiv6mFG/0BYRpXcxKJLLpPa7QkpsoemkpFPvMSmNGkiDTetYkm1DnntH6hIWaJzJccKDoeu0U
	I2AlbVSHv9VNAtkMun1HP5BA2nDldwxdQNcYlatyZVY9qRvlH31hcFhF1SVGjYl+KTNzUR7I57N
	iBvntXnfZ5b68mMldRPUKpvmx0s79ipk/1j4rqYgk62PsW2P3qvF3Rvxcvfz1LAYVVU2+JGEQjt
	WdGkWhbCskQfMqMWmQPyM=
X-Received: by 2002:a17:902:f544:b0:2ba:6ed6:aa35 with SMTP id d9443c01a7336-2beb05e4133mr311390985ad.19.1779983790938;
        Thu, 28 May 2026 08:56:30 -0700 (PDT)
X-Received: by 2002:a17:902:f544:b0:2ba:6ed6:aa35 with SMTP id d9443c01a7336-2beb05e4133mr311390485ad.19.1779983790343;
        Thu, 28 May 2026 08:56:30 -0700 (PDT)
Received: from ?IPV6:2406:b400:28:d1b6:cccf:f0b9:3035:3538? ([2406:b400:28:d1b6:cccf:f0b9:3035:3538])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3085sm181890915ad.53.2026.05.28.08.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 08:56:29 -0700 (PDT)
Message-ID: <d44a3924-f60a-4d41-88a2-280f3d8b71e3@oss.qualcomm.com>
Date: Thu, 28 May 2026 21:25:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] arm64: dts: qcom: shikra: Enable BT support on EVK
 boards
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <ysiddu@qti.qualcomm.com>, hbandi@qti.qualcomm.com,
        rahul.samana@oss.qualcomm.com
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-14-f51a9838dbaa@oss.qualcomm.com>
 <rbu5oub4uc4rubdlfth7undrirlyfwbnst5clgyvm63fde3tcw@fulet3k3a4sf>
 <30a33da1-6424-47f3-9e7e-a09ca61a1234@oss.qualcomm.com>
 <6lkpmjtpozsfrk6ljnzwek7q3kgj7t6cjzre7k5vijx4ta6apu@bdotfbblxpu3>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <6lkpmjtpozsfrk6ljnzwek7q3kgj7t6cjzre7k5vijx4ta6apu@bdotfbblxpu3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nulUz_EuU6n8Wf53Dk2nshkkZk1v87pM
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a1865af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=pS9QfrAiGz98euA4Ec4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: nulUz_EuU6n8Wf53Dk2nshkkZk1v87pM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE2MSBTYWx0ZWRfX4440afli7r+v
 WA2LDp1zLJd/44za+3vAdpBJMz4x835RZSrl9eDvqw9lHfwJrL3ZdSXrW2iHK83F9Zzh3I9jYJG
 T1XKfXd0OnlW06S2TS6zCJk8U68RkPr+kluNP5nZfg4P+EykR/pQGInafiSpwWm/zy85ylgOpG5
 +CddGgyAtuHmg8bQwFAJL7Y7MIaucQvJhkwVcQQfKRaThnlY9bIl/AZrJK0VI4Bb8KLzQmkaKyM
 ASmfKr4eq1CPY57dxYOg08YsS+SJl4cPbC9qpGZt+fA1sFBFHxjbsKHDqHI4IvAxX1HoEVSRiUC
 O76sJhJJVKcjIifMGhgVUim3JJwHDer9o4/LHATTrsBgsxyPiUUu7NFUmRauCOvzvHdTJe8pcyJ
 5hHW6tDaW2isbImIAbDcMrbter0UzdzcFQoNeZTQQXFW1G6ggqWL1d0msUZRGCRKdMsQP/XwDJV
 keyFvb2b+FHI4hwXO3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280161



On 5/28/2026 11:01 AM, Dmitry Baryshkov wrote:
> On Wed, May 27, 2026 at 06:53:30PM +0530, Yepuri Siddu wrote:
>>
>>
>> On 5/25/2026 3:01 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 25, 2026 at 01:19:18AM +0530, Komal Bajaj wrote:
>>>> From: Yepuri Siddu <ysiddu@qti.qualcomm.com>
>>>>
>>>> Enable uart8 and add WCN3988 Bluetooth node with board-specific regulator
>>>> supplies across CQM, CQS and IQS Shikra EVK boards.
>>>>
>>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 12 ++++++++++++
>>>>    arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 12 ++++++++++++
>>>>    arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 20 ++++++++++++++++++++
>>>>    arch/arm64/boot/dts/qcom/shikra.dtsi        |  7 +++++++
>>>>    4 files changed, 51 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>>>> index b112b21b1d79..259032bd20af 100644
>>>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>>>> @@ -16,6 +16,7 @@ / {
>>>>    	aliases {
>>>>    		mmc0 = &sdhc_1;
>>>>    		serial0 = &uart0;
>>>> +		serial1 = &uart8;
>>>>    	};
>>>>    	chosen {
>>>> @@ -57,3 +58,14 @@ &sdhc_1 {
>>>>    	status = "okay";
>>>>    };
>>>> +
>>>> +&uart8 {
>>>> +	status = "okay";
>>>> +
>>>> +	bluetooth {
>>>> +		vddio-supply = <&pm4125_l7>;
>>>> +		vddxo-supply = <&pm4125_l13>;
>>>> +		vddrf-supply = <&pm4125_l10>;
>>>> +		vddch0-supply = <&pm4125_l22>;
>>>
>>> Use the modern (PMU) bindings. Also please add WiFi.
>> The modern PMU support for the WCN39xx family is currently not available in
>> hci qca driver, that is why we have defined the regulators directly within
>> the Bluetooth node.
> 
> Of course it is, see commit 9f168e4de5fd ("Bluetooth: qca: enable pwrseq
> support for WCN39xx devices").

Thanks for pointing out. I see that pwrseq support for WCN39xx was 
indeed added in commit 9f168e4de5fd. I'll update the patches to use the 
modern PMU bindings.



