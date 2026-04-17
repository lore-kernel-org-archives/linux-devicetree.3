Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F019133DED1
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776441886; cv=none; b=i8xDvrEg2tbX0PwDms7mXJmTW1ECxbjGJ+OsyQ/Dqb0r6HRWosG5EJxZ/pAyJYw4MA0ziNiikFq5p1AKQ0FL4VDMopMXZkOdO1fUNPruevaUUohxT46YfbaS8kZeN7WLdusq4WsDpcK4NL2/xjGPQ7Czv8gF24fMlQY8yJy+yj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776441886; c=relaxed/simple;
	bh=6V7eVC2GxmE1K8IKhduq2aNH59vZ52IZmutAvqabAiw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WvxLagBVtj4WRCY4JoNTZQ9mSuXcz+d3vI+YKfPitF56hl8ymXZijui+R1nHfXa54MwP09dhD/91d8fhbAhdtAmW61I5Aq3dJ/4skTXnf/D4yZHrxxXAJz//nPPqgNcYTLJj4zUpW/ba6zJlt5HlZmxunVthdMJh+WOnOmOG/Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKxIZaTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/gDPaPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKxIZaTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/gDPaPf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4hOF2669960
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+mn50hNqMsGQm0c8Bz+ul01zBPQIvWzZ6FGvv2HQAc=; b=WKxIZaTR5dM64kxL
	79L0Kn1ziGBMmaSnHOG3HGYiMoAguzNrAl6L/uzqfdri7edxsdEHi9PqgGzI5DrN
	KwLYUmyC1C+jN4MFvCI7uJki0R5Hozgq9bqMl3AT6G1jmS8iP/fKMFKiLNry9QoX
	EQkSh/axW7N18S90IjUmW2qiPxj86tX2BX7VBUJ8NERcazTfxMhoaHNH42zZDBvJ
	cOyFq1utGzIdV4pVhDDAuOLUrR767Rh/Vn0A74+glpkouB6m1n4zdVuA4L29uFK4
	foAsF1uTwKnVbS4ojlZg+L+g9SsLo2NFCoHjsNOTrTi0Ga2ndXwOL5gXUiVl8z5r
	kZjnVQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxctwc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:04:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7948640854so477727a12.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776441861; x=1777046661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o+mn50hNqMsGQm0c8Bz+ul01zBPQIvWzZ6FGvv2HQAc=;
        b=I/gDPaPf5IXwWZq1mDMA2jdr7fFy47OarzIZ2euTcS1kEEhV0AQhFLlrAO/zeXTqqc
         M1xW5qV9usJxHagw7yuB1rv+tJmoNYWZFk12B7p5F/Ma+gNbIPM2l4pjRFEqvWZ6T6gU
         6TT4/kdrZP3PRuwF8Qvc/RROwJFggTaD29ZmXmBasH+DzTF4p2PsDx8Ime0ZEiRdd0GT
         khh0ztZ8EpymJEIE/NkIvwWTol7yphS4/laIzGB4sjhbxGdlidtnJzR3R5lrtx5YaZLN
         JUomXHrsOMr4hBz6BJt4Yz4/SdtPpMrlZOYVYCmns2+J6ITvo2d3myVga2gNOU8opJRV
         CFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776441861; x=1777046661;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+mn50hNqMsGQm0c8Bz+ul01zBPQIvWzZ6FGvv2HQAc=;
        b=TCEYTtlYjCFAuZ8wbhHjTm6FI6bfB+wIaocwfmdAdbAXbTMwD1Z8HJPNSGVxjx9qOR
         oODiZ/MnarmO72et/TXDtFBZfWsPclwhI6aEpMgfyDmoKIyRfPFpXC1DXGh2XoPJ4ZFw
         XRoeXCRiz3LLb7VO/5F24YoVWuo39wJg9/PD3uJi3kDz4HQfUIhDi9RYCtF57asXHBGy
         uhDUTxyIpYTHaGcpMVKRC8mPsarkQZuLU6rwH0/MIqhGJCsS3eOM3w35Snyp6rUK5SNT
         MTs+g4pLAQ1gFF4DIzweKpBUfCw5IFa0OvLR3MYzuGzOSSTsdF1SKcx1Wv5JhL+bDR7q
         WJIg==
X-Forwarded-Encrypted: i=1; AFNElJ/R/slx5SWN/NxyI/yuaJXDR8L/HfdZCWvTJYcCt4UYPSAhf3OJepRsHy/Ze1TBjCAM43zxVvEbqPN0@vger.kernel.org
X-Gm-Message-State: AOJu0YyJA8ZK4LYkb3fvcTGl8sqZTVMVPKkNW1dX8nFcX6c2lR1hIS2X
	+sFk/PUNXXXqPhsOqOzoyAjFlSy839EeBw1eLrJuUbgRM/EkIws1gq83pco+wYN14NeShzOtItl
	JnArwHHGAbuP43rVDUpPCiEElzmM6Dp4bf1UHB38yRkJRzjTm1HwzFKEPsizqd9p5
X-Gm-Gg: AeBDiesd+OX3tjPO1sYx6PHCtlwRlCEQRhrEmPZkNLrGuIFwzBKgz5ewiHNQxOj5SYG
	+J/Cae2QGQbLQHxSpFxQOYgWN9wif3HQWAuv6WYBYqaoFRM+2mfgPk4zQU8XPdORcXhcebKc2Ob
	GEOjXWF6D67iiaOSi/u4MILjs9nMU+cjLY3lMTxFFoQQw0psFRmzMJIR+bMZdelJ9xsDERuiz6j
	N1zukDgMoxkel2i3H0IuqfWF7ilIX4i5COWSJqWCS7gdB0KGoJQ2Ek4Ldmln7tsyZeJChEsu74E
	0BZ83UODNqB83RCjDLmkRwo7gYWlmi5cHy3kD4UlnERBzfwg+Ul27T93hZuJ5omIoi8D4wd5meU
	kFtIJQHSY55j7Xpz1OlIzFCqrOZ7VabWLQ8DA65Dnv4MW39bv6fm9fbzjwaGfQunW
X-Received: by 2002:a05:6a00:4b01:b0:82f:390a:69df with SMTP id d2e1a72fcca58-82f8c8d616emr3650554b3a.35.1776441860909;
        Fri, 17 Apr 2026 09:04:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b01:b0:82f:390a:69df with SMTP id d2e1a72fcca58-82f8c8d616emr3650474b3a.35.1776441860173;
        Fri, 17 Apr 2026 09:04:20 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d6adbsm3256264b3a.18.2026.04.17.09.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 09:04:19 -0700 (PDT)
Message-ID: <54a670dc-4792-13eb-4240-29bc3dcdb33a@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 21:34:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 08/11] media: iris: Add power sequence for Glymur
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
 <1de1a366-a325-428e-9dcc-1333bb85ed82@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1de1a366-a325-428e-9dcc-1333bb85ed82@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e25a1b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bWAOSzAfB_7jWjvagxkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE2MSBTYWx0ZWRfX9ITJ7fw90HOs
 h3BRoD2kMEgfPwdY6nE3IpOZxRQU6Zh19Me0hN04+1ALHhzB/4Ri0nNG7YCZtBv/IkR4MJ7kaVw
 KTtKsmTvzrct4UBfh9t3cp0TgRjdXYiRzYC29Xs25L3306tj/LJ+vqhYfkFagvjTw6pf9DJT2Bz
 260xh9g0IhRzb0YpfN0LOYun8kZhEWqSa3SZyvrfo2pZu5dMEbHRliioapXmgand59VA23CnqMr
 Z7teGcEO4swLz+XH5OvpFVBUYvGrP0F3CiXsbuzkrUGD/ZExpCo9OmA5DJvjZy7gxAC8qQ65h0r
 buu8sl0pZdTKYatuNIpbD9uLU4cdJcJ40U2H7PLnxq8kOVzR5baQKIq8HoLVF08hHEzZbQr34s4
 zPfA43uXFrRbd7wm2XO2e8dw79UDecm7dtGP3iFux9HTz9xoxdEMdBIf7tKsJyn/oMSgbgtpINl
 KslviWi90uFJTSLtE9A==
X-Proofpoint-GUID: 0cPIPHyWcx6-jF3lEEXMF9KzDdotld35
X-Proofpoint-ORIG-GUID: 0cPIPHyWcx6-jF3lEEXMF9KzDdotld35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170161


On 4/14/2026 3:19 PM, Konrad Dybcio wrote:
> On 4/14/26 7:00 AM, Vishnu Reddy wrote:
>> Add power sequence hooks for controller, vcodec and vcodec1. reuse the
>> existing code where ever is possible. add vcodec1 power on and off code
>> separately which has different power domains and clocks.
>>
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |   9 ++
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 123 +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>   .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>>   4 files changed, 140 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 30e9d4d288c6..e3c1aff770dd 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -61,6 +61,9 @@ enum platform_clk_type {
>>   	IRIS_VPP0_HW_CLK,
>>   	IRIS_VPP1_HW_CLK,
>>   	IRIS_APV_HW_CLK,
>> +	IRIS_AXI_VCODEC1_CLK,
>> +	IRIS_VCODEC1_CLK,
>> +	IRIS_VCODEC1_FREERUN_CLK,
>>   };
>>   
>>   struct platform_clk_data {
>> @@ -208,6 +211,12 @@ enum platform_pm_domain_type {
>>   	IRIS_CTRL_POWER_DOMAIN,
>>   	IRIS_VCODEC_POWER_DOMAIN,
>>   	IRIS_VPP0_HW_POWER_DOMAIN,
>> +	/*
>> +	 * On Glymur, vcodec1 power domain is at the same index in pd_devs[]
>> +	 * as IRIS_VPP0_HW_POWER_DOMAIN. Alias it so that the Glymur power
>> +	 * domain table is indexed correctly.
>> +	 */
>> +	IRIS_VCODEC1_POWER_DOMAIN = IRIS_VPP0_HW_POWER_DOMAIN,
> This feels really fragile..

I'm thinking to add wrapper and use the power domain name to find the 
index from the
platform data instead of using the enum values. I'll try this if that works.

> [...]
>
>> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
>> +{
>> +	u32 value, pwr_status;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> +	pwr_status = value & BIT(4);
>> +
>> +	return pwr_status ? false : true;
> return !pwr_status

Ack.

Thanks,
Vishnu Reddy.

> Konrad
