Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBEF3382C3
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 03:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783567151; cv=none; b=sIC85oQyym6Qe7naJASiDd4zdp/3DfOQ4zNVUmmz8GhRXQKvdknpND0tdKZScoDVdqsnHi9G8PIAvJwd0xrx9X42ujX5zSXmSQK1OiSSqXFx/OQw+Bh2fq7BPV5ig0Qw6JLQivDKS7/+bgcQ2E4+zb8rLdGzrDZUMk0MjxS6odE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783567151; c=relaxed/simple;
	bh=/b3ftKccdWGjLomvIuP8o+/t+cUoFe0gmgQ5X6EKPMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B14Qa3AmpyBf54RIwybPZMS81U890lCXgTnbmxiWhji6wCZFgr4iHweiaaL4HsxR6CpClng10VxYhdPgjblMhOYkB0w5j1i8EH0nc+QgviyNgXLt8eaoeEZKpgNv6eS2wafRP12OBxOMTC0kPJgFUTi9eDcG37/5YWXsGcc4xug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUmLOdcI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKkKNjBO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUmLOdcI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKkKNjBO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8OSo4087825
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 03:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/Q06J8Rc4ahTkKljNWzcF6BEHKnh4z2W5qhHZ7eU9Q=; b=fUmLOdcIENlr01y8
	HwmujH9OD6FplkZ7Ri/FgXbhFCwUWCIU9n/v7FeY46JPpeGpeGtuudc6pZAREC2o
	n//bCgp3c5xWPDoZO4X4OmQAdo95/WLQIh6I0WEv3pk7C6KUtw7vYexSXJvc8+mW
	1pKzY92lXc26xLIvRLj+vdQGC0zBCSQTd55bsPetWZ24ob7Q2TABn1V3RNP0WwyX
	Sw2Nz6Glq+K/VFLOg5rWx3VKmtZtPNYha3CSJ7m90AvKTgm0zWIshXWC36NA5BQ/
	3xtRB7rkXVhgcg3+zZumKbewCZiyO2F7z/ikVnjQA5Ij9qA3aNJ2DCKjH41C3JNX
	KSNwBA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u1jg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:19:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so1043364a12.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 20:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783567149; x=1784171949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/Q06J8Rc4ahTkKljNWzcF6BEHKnh4z2W5qhHZ7eU9Q=;
        b=gKkKNjBO5w04aFdD1nB8aRYAAvCLlRm6meQZU/5pmNdgO7EdRgG2zg6r9jGN0MmnlW
         NXwLlNRyKYjcSMiPTzJ7Vn5WHCcwU9pUZHQ65FmKvluklWm8ZwsVWJdd8S+Xh6oOftqe
         uOdgRbbMCR7JmtWSoGaok6CdWTjL3/r8FI0MjpwWKBTFDtshfH9fXyD0wzsQUNMRbASx
         5Y7ZwmZDotDVmVX8ugPbM+d9tuBzLZYFF2xmXZo8xOxtnQojHJHHFr1CvLm7mIIKCfys
         bO0AL+B/tWObo/JEsiiFczOPtEBAxNjUPe+t4/tCQAIkyD3H1WCZ3eBC5qbF9EdLmJrl
         RGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783567149; x=1784171949;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/Q06J8Rc4ahTkKljNWzcF6BEHKnh4z2W5qhHZ7eU9Q=;
        b=fpTbUq3kr0XuBw2aor36t0abobs/Va7pxRLwX1By7wEKIUJMa13D8blRUFSvh/85Un
         TvO0yXEJlQwvlB3pHrUCB3Gzx38lcq8kJbUDG5reaWFueOMkudzdOF1HMDAt2DFNuuz/
         Icj/nOyXtFycZ3HBgeN5kY2ui+iOAy0oL+dSrZesOfqyqE2CRhWCap1ziO+l3TvBRxgh
         BtDBmKlQtDnWd/fTY2cMuxhn6MY1bkz0Bab9loDGdl6Tfobt6rDQWXkpbeHvfJEyjM43
         W4qc2qbhYsQG5/7EdsutAbJqwmmNyeILRL2mEofw0APycfwmiQLFffoFqIPhYHQUBYtZ
         PCQA==
X-Forwarded-Encrypted: i=1; AHgh+RoGkYRUz8dJrkaHnAd0rIbwiiDLqpEJJFUk3W7UNIvirXwibTxxoRC7w6/KUnP1A2zVWY6BOqJhrp5O@vger.kernel.org
X-Gm-Message-State: AOJu0YzeNuCQhLQtQB4r/i3zMmxceM4+l87mmDAiotpOVBs/4IbPknkG
	zJN3NGoQb5IT7s87QBHzfqAcOOE8k6lO5d0+FvMvV/Q2AlRRMWAJFCclyKbwIhdt+7BmUsCWGP1
	qX2qlwVFlCS0gkm0QWVn/i+QRnqUgA/BY4zpj0Eo0Qo/1S4zQp92BzPouC1pF7VtL
X-Gm-Gg: AfdE7clY7aHl0LmbNrFPQWKKnYNZQz6ADgfVZSKPPlDoV/mMwS6aVAr70GXt8CaBbJL
	MYCJH2fporTdljxI7p7aS8i5YnJt4LOgMYLg+BbuvSMg6qxcU/Bc9ZKWkqncl+N2S3prfui1a2Y
	FIZgBvrG1EdlzC0hA8jEVZSMOWeKuFS1TAm8+LMUk5n4uw77wGKZX7r44gRNSdbrHnTDqTylhDf
	u6xqfBmCSGU4/Fv4VvCTbBe0VWPn0RXixRPFlEsEqTBubJqZWl4stgSc9w5FcmTOIvgBfog9lls
	FY9XKH/uKcx7Gpcn/ETbBxx/RNCQp6XGuVnPciBJU1lzQx+WNxWdp3nHnt8v+gc8rWwI8qQYOlO
	r4TUjXCokFZxsVDq7MmFyKUmHzxKf5+j/UEmLpQicww==
X-Received: by 2002:a05:6a20:6a06:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c0bcbe9525mr6421042637.11.1783567149309;
        Wed, 08 Jul 2026 20:19:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a06:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c0bcbe9525mr6421016637.11.1783567148864;
        Wed, 08 Jul 2026 20:19:08 -0700 (PDT)
Received: from [192.168.50.84] ([76.176.60.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm26144876c88.5.2026.07.08.20.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 20:19:08 -0700 (PDT)
Message-ID: <e4a4088a-89a8-4234-8469-a5f4ee0b9d6e@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:19:06 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
 <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
 <bdb6ea4a-9536-4b4e-9849-2ebf2d26fd60@quicinc.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <bdb6ea4a-9536-4b4e-9849-2ebf2d26fd60@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAyOSBTYWx0ZWRfX+HLAUl8tBZSc
 9/lyWteiS4vyhViRqbHeFfeKqCprjMpxN0IYjcHDMeDO6/0cW52sWo9eGiAub49vDEaFyOFmC3D
 UVHwoMPEh/dg8ncBaRQllwsl2zeg/iE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAyOSBTYWx0ZWRfX3wAMoed4jgcj
 mJ77gVXjbTfpzDBPg3wgvsKJlZZk4xiwj6OkExGvIIfhDi/bb5kIDkZ5hT8AMaTCoD+g75GpnBw
 O7Ss06q8sPHJ8RyxAYSz9m8U93Mc2bL50YNInFc0gKFjcvhq3so6X8ThRwaXiyioIGdiaII8cdP
 rtUwRIG7wf/vpZ67Qqfev0/xMhG7CuYoxyToPZ7ml86QamZnLJEfmCbbUVGdkjxUvk+US6tX2Yw
 Zp6St2kK6NErCLJNzosQrWmmdIX/gu7Dv61JpxAO6Z14+MDKS8lV81lmbcANSjnBf2mdYzi1OK7
 Qg1nlkmaMLyMjZaOdn56sgnNu2puJow5kQk0ZpgFOIh2tzvxr16eCX6m/frlEogfA943zV+cfiu
 uPpehboJW6uQF/KGuWkFvnTJ+c7naJXC6MS82yQbDxHcg0owwDHSAQVyB7GO5uKGXm1tL4sAap8
 jZEiWtDc5vFWaDiuKKg==
X-Proofpoint-GUID: tm2en2KJOI7swEcN51_4guga8JUIYvs6
X-Proofpoint-ORIG-GUID: tm2en2KJOI7swEcN51_4guga8JUIYvs6
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f132e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=0ISbvMpsx/t7i6H15JfNAA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ZcQJt_r4axFxopQkEsUA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090029



On 7/6/2026 8:38 PM, Pavan Kondeti wrote:
> On Mon, Jul 06, 2026 at 07:15:15PM -0700, Deepti Jaggi wrote:
>>
>>
>> On 7/6/2026 6:57 AM, Pavan Kondeti wrote:
>>> On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
>>>> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
>>>> new file mode 100644
>>>> index 000000000000..0c7ffe9e415c
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
>>>> @@ -0,0 +1,1918 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +
>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +
>>>> +&firmware {
>>>> +	scmi0: scmi-0 {
>>>> +		compatible = "qcom,scmi-smc";
>>>> +		arm,smc-id = <0xc6008012>;
>>>> +		shmem = <&shmem0>;
>>>> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
>>>> +		interrupt-names = "a2p";
>>>
>>> I believe this interrupt source is GearVM firmware via Gunyah's
>>> doorbell, correct? How do we know that scmi0 instance's interrupt 
>>> is GIC_SPI#963? Are these assumed to be constant/fixed through out
>>> the life time of this SoC?
>>
>> Yes, this interrupt is a Gunyah Rx doorbell VIRQ for SCMI a2p completion
>> from GearVM to Linux. It is allocated by Gunyah RM from the platform's virtual
>> IRQ range and patched into the DTB by Linux bootloader at boot stage.
>>  
>>>
> 
> Thanks Deepti. IIUC, GIC_SPI#963 may be overridden by bootloader and
> potentially this IRQ can change across runs or when firmware is changed
> etc. The interrupt property is a place holder. can you confirm please?
>

IRQ will not change across runs , it may change with firmware updates.
 > Thanks,
> Pavan

