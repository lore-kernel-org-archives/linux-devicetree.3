Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65610434E3E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509594; cv=none; b=BXlDyVB9/ASJuC/6n9s/+3k8LDmJilu/saqtiFFS1RDvYIOgk8VY/F/sJpWuh0dnwtnu97yGrWFpjr59gl1OdzoNZfMz6enTvkCnFgHppWrxCrQO9F1iYJ5quUMYXzRP1m02j9lQJP+w+yGi7gn2HgsReS0oKOWKjEni9GDXMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509594; c=relaxed/simple;
	bh=r/sZhonGWHV/OHpXFFvuNCqs54uSF0jXIm4ELTvu/1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oW5OfR+POHyUKKsLr6zOn7MH6Wy7LMDVKNeFwJLnKkBqA/96eUeNdTvUbze91kJ0ktAALBDLu4VDqT/8PEdU9UToQQSjXZnGm24nCDXkbUmnagiSEMStMiP8z5g+LhQCAg8Lpv2TZ+wpFKYjnHbPleWshP8DSYLvSmLowQoXQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzyVrtth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNjBDBtR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzyVrtth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNjBDBtR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668895V12070465
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXHpkWaDOa2HwVkvOauKBx6LUJNK4axtkDnUUzFrBws=; b=NzyVrtthERY8C6/4
	g8eosxowzO7/aH4DYu07cNpjN9ZTLMZhwUtgAz8vkNBLutc+5sFxoRVey4omQe4I
	OXLPojkDmPW588QoEVf9GgYTzQfq3ZX6Ou3ujWo5fIx38Nf6WcaetygHEJnqN+aP
	MdQ6fGUqQ3ejiQWSVLNwS/wx6fQztmLTWwWKjQwirKS8Ik4dFYE6oMjYPhCgbgII
	+r/O3mISp8E4oFB935RQ+RrGb+3OVz2GPDuNfpHcvYxUsoCzyQxJzoRri0a7/TRn
	XbQfhsNkFz6lcnaE0db+c7Z7sMjMUs5kxwL60HQT56Yo5AiOKly/HMnBfOlAupXy
	cekXGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5acjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:19:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3881937456bso975927a91.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509590; x=1784114390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXHpkWaDOa2HwVkvOauKBx6LUJNK4axtkDnUUzFrBws=;
        b=GNjBDBtRLwAuO+CdOR7jWfettfGny1qdUaR5xZR/64c6BcYWa7XJC3nVGv0w8I/OU1
         DkgN3jgnbDKyNgUkjZL74slJR5t4ddz1PkfE/oReYV4jPxp8e9lnrjOFLJGjDvLUHNQu
         EvXbLgTkB8jj30aL1zJijKh/6F+5NbSzSvIgq1fCcAmkOcBSHgwEEeb+gLMRY5Bn7Pm8
         J+rtycYS5BzFXyaf3LZov9ucITizQg3bGBqNE2/Z0C8gzC/Clufqku3yoi/J5Bt1Mzx0
         wEwKx1lYtBvpxtUAXibx9kmNJQ6599Pz5l7hAAaBVKQHkXsc15067mStLoznZYgSKZoC
         Reug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509590; x=1784114390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXHpkWaDOa2HwVkvOauKBx6LUJNK4axtkDnUUzFrBws=;
        b=m+9AhypD8Zknrc2Jsxvfm1kzDMTEmQIvxsKksH3R12Vwwpno7iLcnAIQ3rzPP1eFY7
         jSQcM9G7Uz/f12hU5Xjy1fSbb7H30nL4svyvuDbu2CIOljwJ11I4DgrHDdAT6/jN+msm
         Zm26vuTN00d9JzoaqMcqwcXHJUOzfTy4Ptt5RbwFQK8A3hEvAAdbEMfz3CF2jEcslSzu
         aU0RpHGbR4QDRZ0X1xdJD7NDMWLUC7ocPUlZ0Du+97QeiT2vMOdTaW3p2OyCllB4FMU2
         sIrC4gxOGupmc71pOLiRQT8duXNmSmv20qpDfmRMqGSPVm2LPxAiRqxjSpzAxKKtzho+
         n/4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpoIVoUm4kcxvkd3BUYD3TaWrcCJoZ6nsU7SocnuetHTLNPWB2M2L6/DNscBoRZH6MIVbfeJeRL09Gk@vger.kernel.org
X-Gm-Message-State: AOJu0YwGPtWrkCMOpA9jyKRy5fRFGb53+CgxvdubgaTSRFKzIMoj2gXY
	G4ENDOL1p5Z/Nv+v/SM8p3l80AaBu48PIfYKc6h+nyuzTuXY75S+c+hwXLNfFE/7Mts8pSGxI+m
	YS3kYdCpESGw6rcCXKgvkNM+XydW0+v47aS0RRT6JZmTbcmkF3dugG7KHkHdKzZZn
X-Gm-Gg: AfdE7cnSM4ySzQWx2c40sgTAtK7Uo+7ft+KA6FO6Vk7pxlebL6qJFFpMhAT6YougXsr
	UIiHZUvu5td1Axw/ZQm4GRTJUx6sntWOn4K+fVsLZSIrppmAo4t9RtNhP20WoieanDEFLpHfJYD
	abXuxYjYT0QLNxs/fssOMvzNyNvnbDzTl7zkqSoGPrnw9ovMt/s7eLsNFRoWGq+xjzKdCEFY3h8
	xcfajG2VQhnxgHfSURlC/+QwImLrugrq3JmYz6Hjjk78nqplcp+5IK89yTG7JqkGBw2dtxdqOBl
	pJtvNVfz9EB+XYTPDhgKEbhY5X0//mw38tvjaQmC2wdJihU2BAU1b9fZvoftlIUZuZia4NZ5/qa
	6ARUj3aOJQaR/VdaSyA7n3p5SjRguWnlbEA/DkFM=
X-Received: by 2002:a17:90b:258f:b0:37f:bfcf:fdfb with SMTP id 98e67ed59e1d1-3892db5376emr1958272a91.8.1783509590031;
        Wed, 08 Jul 2026 04:19:50 -0700 (PDT)
X-Received: by 2002:a17:90b:258f:b0:37f:bfcf:fdfb with SMTP id 98e67ed59e1d1-3892db5376emr1958242a91.8.1783509589584;
        Wed, 08 Jul 2026 04:19:49 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d2585f34sm2632880a91.17.2026.07.08.04.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:19:49 -0700 (PDT)
Message-ID: <87c50f60-23d5-4987-a521-347614b2f596@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:49:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
 <e3s42sg5lxb6e54dbd5wyvdgtcakolt5assoa4ukqtgkgus366@4uzp27sftrkm>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <e3s42sg5lxb6e54dbd5wyvdgtcakolt5assoa4ukqtgkgus366@4uzp27sftrkm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e3256 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Nhb7zu4WCAlJpChbyQcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX3rPLun7RxyjD
 2Ysk3rg4BNtGwYGt+AW6fxW6xQjUNBtxiBOKZJPGUyQA/a1cYyPArL+9Qjs5IXWGjF8SjEA8Xjw
 R3CYP75DXiWm7paLAyb46iRrO4frMRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXyuZtOQXZLb7i
 VCyUvvjnRFjAlUb1YcEz7UqzM9IuBMzURSQDFk7PxS/J+oW43X10tPjgHubOmQECU4DZGJWr4zZ
 57oiMdUU78vc02usvIjszzQTkF5PKaOuk/JTGdY5cU41kb+4niqm4B3SmfvAvzbHbG/poXRtf41
 A2f2HDgM36pdoObkOL0y2pjuYCWnsUgM8u2DSYyFGmPa2b44U8DDIspqZ0qCcg13z3rjB0+PEa9
 szMRpFeJZQhYuhBshZz/4pUnlFlX1S5pYwF2f/xhxXqCQi+FI7nEh/E1F7dP5zMUx+8JsLvPoic
 UWZfHCD4oNfRcqP68sDv026uYNMYCOYQb4bqBfxKKV2QtyY/YKzOzXCwlrCxVCNDUJfgA6tHqq+
 08wqNEKYv5O8FOzCf2EBMVRg4CHOVkAiXcrB8LgaUzAlNxaMFadjCXBRaQazvwh6vzJs93DDLBU
 Xyn7+OcB0TVoNR/Jz5A==
X-Proofpoint-ORIG-GUID: -N1jOhc9uga-VWujs66fM7knRyGOF0Bt
X-Proofpoint-GUID: -N1jOhc9uga-VWujs66fM7knRyGOF0Bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110



On 04-07-2026 05:48 am, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 12:01:31AM +0530, Imran Shaik wrote:
>> On some targets, the GDSCR status bit may not reflect the actual state of
> 
> Which targets? This is all about Agatti.
> 

This is applicable to the latest targets. I will update the commit text 
here to mention Agatti specifically.

Thanks,
Imran

>> the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
>> determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
>> MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
>> applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>>   drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 89a6cdd26217381cd44a515766363cf94d0aaeeb..6ee074555099ab72106cfae7c21adbd1b4a0fdac 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL_TRIGGER,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>   };
>>   
>>   static struct gdsc *disp_cc_qcm2290_gdscs[] = {
>> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
>> index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
>> --- a/drivers/clk/qcom/gpucc-qcm2290.c
>> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
>> @@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
>>   	},
>>   	.parent = &gpu_cx_gdsc.pd,
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = CLAMP_IO | AON_RESET | SW_RESET,
>> +	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
>>   };
>>   
>>   static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
>>
>> -- 
>> 2.34.1
>>
> 

