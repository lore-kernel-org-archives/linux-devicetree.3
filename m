Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E332D9ECD
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922589; cv=none; b=B03SrPT2ScB6vkJ6dCo8fLbDbpYxE9wxx9/dd5cFfrceIsl8u/iVvG6J/cfF00I/VxOuJVaY3z9OEKoLVld9iRu6uJSCiEIRtPIvHCOAq0n0PTDLPUYHO7nLQAYyaOfWC0SYqwcSx3EN5v3UA7qED4FVkmKycXCciWvNXUcR/Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922589; c=relaxed/simple;
	bh=o/cYIypQg/YyC59IxDV/wB+yUdR9cQMVsaZlE6Z40lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWQzxWg1zyk3Wl9IR7ZOrIpTZKSfAFLmHo6RRBf4q2CsIEVg0Gr4ffnNVVr3YdWwXzc8AHueurndHPV3Q6sCwHbUAcj+6hqpkp2De5nBvbr1J1LCIxLvNdPcBHYExdODTqwTPV+IbW9D+avq76FiG8XKER2YDjes9zLnF3SNIm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lt/bEIRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bt6gAOJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lt/bEIRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bt6gAOJ8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AVCU137033
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rx+o5Yj3X86o+vcScF6U5wIbLWITlQ1ZlQ2rgoymQk8=; b=lt/bEIRyA2d1Zlp/
	4UJB5iIrJ5ALQftNQDN3ZwE20relAwc+jBUsVDyBH6NrHklVYth5fnczXZEINWKk
	4TuWjkEM64gryhA+wR7Cq2Pp29zkUwO0sK4kAZiN2Gu3FZ+fCAesygQqFbVdyYx9
	1KpaORZM/XB+dFqtPdKIl1FI6Pc14IVTp1F3L++xIKToY15htVMApzVTZZmXXfHM
	aScsjiiWATuOz5/vf+vOs6aKizlUrU+MPRoY2fUGthjEa6LDMEyFSwwMH+Onc1vz
	nFwjh4Zsjw1IefgBkG2zVsBl9n3wjY88gjgAA3jNX3AKiEiePRBNCy7V45qdBJJ3
	LmzFDA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe914jbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:03:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so2451092a12.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 23:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922584; x=1784527384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rx+o5Yj3X86o+vcScF6U5wIbLWITlQ1ZlQ2rgoymQk8=;
        b=bt6gAOJ8eij1P9xUcwQ8K/0cGILE+vHIbkecBefZgmpf/D/GcJCMEw/KplNKignTGl
         wOODY/oEe8O1oIqKsgCZ9E6N+E1gWlexK9J/4T4d1dkud2OqHo+EfwXxH7iRUy8NGpR/
         IQcQl8+BBl0I76oqhsEXP+0g1fdL7W+mf/EYkgjmqgTrDOuG+8pmAhngTu+wGek3HYQZ
         tVhTvBWllp+XzKFBpeC1JxnLPhZgUVEviO9DcUfwGHvIKkN1ilLUhB7B5NweDbqfmj+X
         iIur0ThWc/sXdn0cSuttNWF7XFN20E8zWJrOlsaggIT35NcWk1uXggiW3JmtFpaXRzcW
         46Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922584; x=1784527384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rx+o5Yj3X86o+vcScF6U5wIbLWITlQ1ZlQ2rgoymQk8=;
        b=LOVj2W1c01pcjHNWXZGnbGkO2+/E1cmK91H+Hj3KR2CG8SHBQ6E7Cu7/ccwnQGE8c6
         EyWjrLrzkQKFvzHuYk4RKZPtELZIn+K6sfkUBROUOtS1n5dXanB4IiK5XP/ybwLrNbdB
         13hMLSF7fPUCo0P6yO4U5CodafWEyTGoLCuKZHgiYe77LxZYeMYoAnumYT6PhVKKGfV1
         dGiwk94lu6k0ldr8FWtWv7VWCH61VzFpd4qpFSuDsPS0056x999IsF2H6uB1iMr6ZR5k
         TF5cl7prwTG29D63/3Ps4K8BIu/8GlgUe58j2K4a3x8wzJhRFlkg2CrZFtrsiRUORFto
         qWOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rofxep2hsMJoqYiBd8ryOwDiqbSMMu0P0277QvkMvjyt0yM5/Un8Y5EMbOYjSQHLEitXiA6Lh/mA2L8@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBUsrv9YQQAFozIjbYHPrKVStMVLvxQqLkRTTTBIZ/CWe4G6e
	wJnIHVHWGYNGmq+w9EToupNTwRXquKTUUT0OuXJBfMi7xZGkwgyZoj77ZC7zt8dl/dxv4xxYD5v
	RUNaGoHony+yaFYwmTVziXUsFYn3KELhBLzDi6Z8DRbSgOc+YBHYbpyxsP0cXIRTp
X-Gm-Gg: AfdE7cm40yL1H7SLAtSEeiv3mtldHiVT0STSQjLbgavQLxRuUTIyGPNOCtHuRABvOuv
	zZiCJmQlzQEFwNl72kPdrWrnzMCc1m9N9cJg0bC0QXyUha+YnfKbbC2CdXnOTa0BnVbXI3bBqeK
	M3pWT8B69kIoJGS66QXMABLn6/c9h/P5ocVklAZoj8cT+UxQ8my/jbK1qY8U5sTZ/fSDDvtImqn
	i5eB2la2NAayrIpab62w4XPcnnl9+wfK3QOMFFupJcRIOAwo8n5wx0ht7aeznUfStdlIjD5V9AX
	ZjaUUEeAdimypdR+OnRvEg121HGEwJuNS9EaHf+3xm7nfcMNfzevByOzk8z2yK9ANuDzDGmMqPQ
	+62apeU3sGDDxKU1E/ePLXKxwDI3sFwnjJnjKxRju1iPH
X-Received: by 2002:a05:6a21:9e0f:b0:3bf:baed:c797 with SMTP id adf61e73a8af0-3c110b2d84dmr8341094637.49.1783922584554;
        Sun, 12 Jul 2026 23:03:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:9e0f:b0:3bf:baed:c797 with SMTP id adf61e73a8af0-3c110b2d84dmr8341067637.49.1783922584098;
        Sun, 12 Jul 2026 23:03:04 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8a5992c9sm22568953c88.4.2026.07.12.23.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 23:03:03 -0700 (PDT)
Message-ID: <00df448b-b492-4c85-bba9-84753825c265@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:32:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <63t_fLehIKEom4-JPN9kAGFEjUG4_yFoHMhB2aEAppwPHb2oPbK666eGkGgXxEAHRJnfTRRUwuf2EqNRYe_gjA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
 <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a547f99 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=769wdsGJOBCleK3k260A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2MCBTYWx0ZWRfX3JBmIo1ESAcY
 AWq9doY506fqAu/+chX35TJ5iVV7HHyT2U4Xin6vKbNnIgxhb6NARVaXxOVVaxKqSt521Vqcawi
 tzmdPCtgJmKi6HgFX3Xbe6sx+adeY/Q=
X-Proofpoint-GUID: _ug0qAtdGMyeFAq_qn_2wwifIq-at0If
X-Proofpoint-ORIG-GUID: _ug0qAtdGMyeFAq_qn_2wwifIq-at0If
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2MCBTYWx0ZWRfXyR7BFV8477vM
 nwHpnA4HHgYzxLknMAioUVMXQgAECH8jv/m34uiB2FfEIvgVDM9+c8rTsupXcbAf5rk5fnikS/S
 kg/6LSxzMMRNJlaJvxaIGlZlGI+SwYkPOPbQt4w1WJAqqZ9aHN/dsZAgA+Dqb3EITxu/m4C0DNj
 7lhmVEuhEO8cADzKIFb9gFVTQogDKJblq6MX42q5yiS01gcBySRDbNBTdRDM6w6Ti9cCbAkxSmD
 xYfq8ZJUvoqRZKbrh/6O6LVmPdH+86u8mqnujzllIrLS/pWF8p/as0JCv550Qn/Nw1PG9bAvOGd
 DrQ+l1pHKmdo8a0KaiSgIFa2Psj3f5bFk4x2QiXgi4pDq8B1Idtl0uBNAAKHjEO8FqSctwyx/Is
 Krrsgu8H0aT68FN1gGbdBU4/ox5xdzGlG13IuoHEPTZnQT2zZCulru/9z1uiodfqgfWx6V7XEAO
 ua2tDz+JzGCi8azfOSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130060


On 7/12/2026 5:49 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 11:46:58PM +0100, Bryan O'Donoghue wrote:
>> On 09/07/2026 13:35, Vikash Garodia wrote:
>>> The Iris VPU has separate streams with different IOVA constraints. The
>>> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
>>> pixel stream can use the full IOVA space.
>>
>>
>>> Using a single set of IOMMU entries for the Iris node does not describe
>>> these per-stream limits and can allow accesses outside the supported
>>> range, which may lead to device crashes. One such issue was reported at:
>>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>>
>>> Add non-pixel and pixel child nodes, move each stream ID to its
>>> corresponding child node, and add a reserved IOVA range for the
>>> non-pixel stream.
>>>
>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> The thing of it is, this _is_ a bugfix - perhaps its not one that can be
>> backported, actually scratch that, this isn't possible to land in -stable
>> realistically.
>>
>> So what is needed here is a strategy for fixing -stable.
> 
> I think, we need to start with defining, which platforms are affected.
> sm8150+? SM8250+? SDM845+? MSM8996+?

All platforms, including venus.

> 
>>
>> That could be apply Daniel's patch and backport it with Fixes: - with
>> mainline then say applying this change and reverting Daniel's patch
>>
>> or
>>
>> That could mean some other solution for -stable - up for debate - what's not
>> up for debate is this series needs to _address_ what happens to stable for
>> all of the target platforms - and then transition mainline to the new and
>> shiny way.
>>
>> That could mean
>>
>> - Applying Daniel's fix with Fixes: and cc-stable
>> - That patch needs to be extended to _each_ Iris platform containing
>>    this bug... all of them I think.
>> - Updating bindings
>> - Updating DT with new method simultaneously reverting Daniel's fix
>>

Ack. The proposal seems a good way to me addressing stable, i can work 
towards this.

Will wait for couple of days if there are any alternate suggestion on this.

>> And I do mean doing that in one progressive series - a fixup for mainline
>> alone isn't enough.
> 

Regards,
Vikash
