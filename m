Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754A21A680B
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275527; cv=none; b=sGVTWeMnUhnW73yeA13cwdCYieXMoGdOvGoGyhf8LpaVSMVx8yh6NTGVmcYX5Ga0WDw240r05HQQu3myV7deMWiY3+lQ8kjkh+GqEQ8VjYaaqNVu4ZQApgZ0vwOKQSwGIFmd2E/J7dLr0bdznsC2HmqKRY3RZftY0sMIHoeNNTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275527; c=relaxed/simple;
	bh=4pJ5vtbkOdwfvHYelgkp86SMhQ1DS8/JkJaKzY6Cfs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+Hx0vHvJcJbl9VwRH9oW1rFP8NNwAaWuMTorgZSk4mbb4zvf4MBEVIVIVxDuU1g7yvQoApdiCo+RMTdptZAaPRjNRJsFOh06DVO0PEeruMvtPjP2qaeCjNrT7b4yumFJq6UvIkc+NH2h5QQQX2VvGR9k4TQCJFmsfbI4ffFvb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3fBvCUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKGwUH7l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3fBvCUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKGwUH7l"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBgI4C123193
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kplTETujYsicfTISPD+Y0TxBbeNRe8EKpDvZR0VPp9U=; b=l3fBvCUFxRzWls4q
	US5zzSBnulhtUiYSI6XLdXDvbResiL+19tC0jfo5m5xoTvCFwR+cMmXrxt5CjcFK
	8p8jwF13iXko6cFxtx7FBoDO4Yd6tXHOEYLlBryXnt1OfIB2OuRQB2zkxsT2+iQi
	dpFVwi+tk/Fynlh5FzGydjjiKCCYvLxtM1Uu/RkbPGKR9nyxp0FAC4i7S3q1Yn2P
	tYfT/1/rcNvHxYPG/cxEV9xW/TLCIBLsu7kIUlCVs0VJXN67R9l5PriSpo+6JOPm
	RUiGAIadwW/l4ewTlSGMMMVs7X8AppiRIAUsIN0JIgg5QRJkNXBQ4BkH4BIIBMWZ
	FLsd5Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkrhxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:18:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62da7602a0so2143001a12.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275524; x=1774880324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kplTETujYsicfTISPD+Y0TxBbeNRe8EKpDvZR0VPp9U=;
        b=eKGwUH7lifnGm0k+D91c1M7SZpXMxFNxqDHhViaZ9RLRGr9MWCmUvcubevCsxh+wJj
         TTRriT/19T4SI8T3+583aru97iO2k9Ms4/iqqcwcU9CDTHxpuXbAZOvBpQt9ddodER9X
         1ESAFsIsoxz2MGgLbhhgmokazlmJBrXzrTKO4Eq+QxFNtedBf7YqclJTmXFWr8w7/Qub
         mwJWpMR3HEUjLhEYjrXYze2mezosq0XFDGCco72FVAYXOEzP3WnZgldrfONIF4fJ10RK
         9mliOB4HjmTIJbdIx4UlL0AW9wXG0VHJF2CoRPpBqhyTMgssJoe3pt9F6PBOURGPfSlw
         hnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275524; x=1774880324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kplTETujYsicfTISPD+Y0TxBbeNRe8EKpDvZR0VPp9U=;
        b=d0r6ZlivLfRhbEWq2uSr3gpC2FWwRcS7Keft8Kl8Aqjx+SFc7kpsBlaJuoDIA2GysG
         KOZEdxu3xTeMsoEpMxH2NmCx/mNjk5DNYDGJwIfq3eNgO90gj0cNyKKdOSUMqb9nW+Js
         h1rYBYWGmVAHkdgczULRuuJMh1dADoOmL+lKbaQ6MWekOG2VAg8XbsIEgQtdQ8P5aplj
         Y9nI6BLx1K5VdTSGAyWlQiuCDjCxnXXUBwTM4imottX7MncocbLMyLufLtzAgStnkX7j
         A5ypCGNSf4czgJi54hU8wdugRT3/R052Lgdqmdn0r1jCB2DAeSgPReeJXevlJNgUlps3
         wPSw==
X-Forwarded-Encrypted: i=1; AJvYcCUVAv706sjXMPrnjQsVpd7uMfjiqMUZ/kt//veXpsR+V+iWPNxZtHaGpj1L2mylMoPLTiGeWPcdfx4L@vger.kernel.org
X-Gm-Message-State: AOJu0YywXO4+V1zdXzj4vUTAps/jr6cZLAr+R9+M78N3Ub+F7QqyV0Ix
	vemkkfbGQW4Uz1QhQIdP0MfVrTIQ3o5YvZ46kOwNpD+KesDqnQGYecp1+/u9Inges30Hydd6ls+
	+xQ2pvgEuDVukV/EuAwnabuISjnCOAiAyHeCPLYwb7XBQk/S85fVbVUQv/bpsXJKx
X-Gm-Gg: ATEYQzy4u8Us89f3Iz19tz7ntkqMD7S7mLjuvNzLifwb/P6TAIUGMoTZKpUidTey9X3
	qECsPvjmPPt6WruD9zzNGxKCFxeUPV7sH8x+WdIVFM0tGvWVA9u4CHPkjkcjRoNgwBqwE+0v575
	DmXnPwjQFVD94BMJXXrr6pm5IdLFiZQY88Cans60OSbReQC6qHL8ZCrp/jntXIFF5tpPzcZk/KE
	7QbIt7tFF0ar2V98GC0h/EosQ4iMCYhaCww3daelaue0erJ5u7Tz6qyMquO+88JCgSiOkqS4EhH
	m5rA49XWiuslpaDFWlezgpXzzpCjgUWHpQ4Lsbs/JqlzjkIrOI80j56oDVQs9XL1IX1BI97YzR5
	A22UkN33G2iPefsSgCRh71GAqgK0y3yAmXslMlKafe3zZiXYet89lvbPsJ2t8DeTPJceeoS5a1u
	6uqwBKNrAF
X-Received: by 2002:a05:6a00:8017:b0:82c:24a6:2e41 with SMTP id d2e1a72fcca58-82c24a6300emr8008698b3a.21.1774275524048;
        Mon, 23 Mar 2026 07:18:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:8017:b0:82c:24a6:2e41 with SMTP id d2e1a72fcca58-82c24a6300emr8008656b3a.21.1774275523410;
        Mon, 23 Mar 2026 07:18:43 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbeff2sm9798291b3a.20.2026.03.23.07.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:18:42 -0700 (PDT)
Message-ID: <8529bd5e-0a93-4d53-b6b3-e7dd2135cfb1@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 22:18:35 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
 <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
 <acFGhpVWaHZtiyTq@baldur>
 <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
 <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMCBTYWx0ZWRfX0bXR7Ixa5X1I
 O1S9B/Jbeaqd6eS6yweum24mv4u9eiAbwk6VOlSM4x00thsBDEOFmpZ+j5RjnVAXhu/ilbRJSbs
 qu2rbpNxPXlmo5WZn4bv0o9tEf3FnK3IQi15/Czoye8b2C1QbhRQAHvTyCsm4qMLdL0khTcoTba
 pqHjWieHBegxMzbhGtAVAFNTtR0BORV2xqYEaueyuVN/xdpY6cu1WLVAa6uL0PEcR8fZNzT4IIC
 r1e8PjO1NiFSFZC7P9HouTARYECvVwhsOAhsUOMSExnFuQqHVQF5culBOIUtzWi5g5vSHlfppIL
 AjoaO9x/V9iwDhc2bbQDQkqmrurAh4EcvGNvziexY6TXc1qV1XPYxHX5wsHJBBN2RjKhcW9a8Z5
 u7ODO9bvhiryAxhQJ2yLN/1Enr/jrH5ki/IO4m4pNq/HOvfH+PGBJ433gNDkXr2aXaLGyaR96WF
 ZWm45/MwJlJRGB2JDOg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c14bc5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=25pNCHLBOcfxwS3ibeIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: RGBdAoBnOM_K5Bl6nDda8dzbUqRyPH1Y
X-Proofpoint-ORIG-GUID: RGBdAoBnOM_K5Bl6nDda8dzbUqRyPH1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230110



On 3/23/2026 10:12 PM, Konrad Dybcio wrote:
> On 3/23/26 3:09 PM, Jie Gan wrote:
>>
>>
>> On 3/23/2026 10:03 PM, Bjorn Andersson wrote:
>>> On Mon, Mar 23, 2026 at 09:27:41PM +0800, Jie Gan wrote:
>>>>
>>>>
>>>> On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
>>>>> On 3/23/26 1:30 PM, Jie Gan wrote:
>>>>>>
>>>>>>
>>>>>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>>>>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>>>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>>>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>>>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>>>>>
>>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>> Changes in V2:
>>>>>>>> 1. removed two cti devices due to GFX block is down
>>>>>>>
>>>>>>> i.e. "because GPU is not yet enabled"?
>>>>>>
>>>>>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
>>>>>
>>>>> Do they need the GPU to be online, or a clock from GPU_CC, or
>>>>> maybe something else?
>>>>
>>>> We need a specific debug clock inside the GPU block. The debug clock only
>>>> can be enabled while GPU is online.
>>>
>>> What happens once GPU has been delivered, but for some reason is
>>> inactive and we try to use this CTI device?
>>
>> We will check these devices again once GPU is available. We also will cross check with AOP team if there is a clock enable/disable requirement with the specific debug clock.
> 
> +Akhil for awareness, this is probably a solved problem downstream, but
> I suppose this may be non-trivial with IFPC at play

BTW, the debug team is working with the hardware/AOP team to enable 
certain TPDM devices that have clock-related issues. Typically, we do 
not enable devices with known issues on platforms until those issues are 
resolved (e.g., TPDM DCC).

Thanks,
Jie

> 
> Konrad

