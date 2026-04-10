Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8CE3AF670
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811362; cv=none; b=JO51HZFbvSHuhMngvAYAA5iL1p7ELsnrCNu0fT5tY9pmj2g+tDAMEkvv89/baZvyC02Bk0X+sbTGahDPwPnpu5JoIjz3SemJNr9hhIg68MZe4NVta/kHUjqmJYK1FWWXLVrh3/ecARw4bD5WYW86KPsks3h2BupfF7Pd6X/Km28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811362; c=relaxed/simple;
	bh=GWFjobN/z+q+q6VAzTn83X8tsx2TENHTLcoPabSCniM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4EpNy3k9WenSuEOCRg8ZA97Iy1wRxsdLiVW80OmlGnRDJZKRTh+zSMdyZlDz2sehEAcSLxFXd7ZJwqko6k7hCqraZH0eYl8U2Dw2Eg5e3euTJIqaH9K2cV6x3eIY0uZOqfDMXPMnb4CF4tX8/907Rhyq357mmHGVHhrFr0jrP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1lQV9aA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IieUhSIP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1lQV9aA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IieUhSIP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oM7T4148029
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNlvcLiFn3EPDBnTEP3/OD9nrYq1rMilcUmKdwmcd2s=; b=l1lQV9aAAZB5IWPm
	XPASMvqTU24RYFa7av3+0/B4pKhbqKvF5EZ/80VStWKbf6Cc+mTM1qLGfzzseZMs
	j6p35k0fZSw8d+SBjB0+FMUqTDWMxPfAgEGLxyYkl0jMfbjKjCHNsAWj1i0k6N5g
	Bs06LR0v8PuvhTfo3RklyARL4gRSOaJHsBY4MTeAOQkNx4dTfZCEC1TOAnCdoDhE
	mn6dS9khgo2pdGqhw9eASbrtpw+Bp6CkQgpaiLr+9uisa6k/725ZcwWhUDE20itZ
	kY9zOerW+/gFLLg2DKHtqphkiv5oWITixNzVidn25dC758H12bAhxAgmsbABtZ0Z
	nSoFCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudggmjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:55:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d7128e038so4623981cf.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775811358; x=1776416158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNlvcLiFn3EPDBnTEP3/OD9nrYq1rMilcUmKdwmcd2s=;
        b=IieUhSIPeHdUE3/NKoKFkUMr+cTrl73YBedtmy86PWwvqSdORmrWt476kEPVn3KJDl
         CbtcbM4zOYU5FHgHzW2NFbgn70jMf8xFJzhSNWnV/4zLsSsjtDBbn5C5684GtvQB0C2J
         T7xEI1kk2KwtmuIeAJxApSS3wSR/ekFxsCaxTS+HcxHmcHV37+yn0+mG2GZpBpFAKrjK
         jhXOEdv4eXQCnIqxIbXIagL0kFhkCNIyZKQ9fPhcKwIrFFDIzoFow2A6hWY5ljLwpmKV
         J3LaWrZPm9XiO8TOTKVUm77TE5iKkNyaNxHqeoxWzrIB0egvBpW4Buw7JHmrJc8BkCX/
         99uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811358; x=1776416158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNlvcLiFn3EPDBnTEP3/OD9nrYq1rMilcUmKdwmcd2s=;
        b=p/zC23y5AXk+Buf1PyR0GHmQrktD86+0YgiFqF9U22X0gSQ3rJwZ3jSXmZ341Q4eTR
         BJ3Y/SSzQdnpsFv6cdTFCkCFnV/nwUjovAu1YBGFVSpaDmlva8JbmbhqdOxZoKEhX9yF
         +bVcdmTRSnK/jC8eZmPN8cFFPNuBIedYClkplFJ77KUB9FvwAAytfU2PtIreUwEbcySs
         042T3GYATgE05o7q6fVmFVt0lCM/Z0dHaOrniotoSR3UEpPNtnJoyNtsXEw/L14F4R7Z
         rlm6hMeJH0D6TIA44onLzVTcUkX8DAGb/5hzgUF2c+twcNyRUmiRl4LIhJc6/RL73J/M
         DVSw==
X-Forwarded-Encrypted: i=1; AJvYcCWAUDiWiqoh3hdMj9t/f8Qb/ueYvyZpXCttKcJEN3OTMHEKuvdRHdkjZNprmThbo36h19Btmf/PKzL6@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjb7yh1ZHrq+UoB2vC/rHWT3UWnO8FohyLR9g1p2mQLjp6a1C
	k0wGkEH223v94ev8+44OcVpFyk5a0CVnYMjD1rwjPbuT9Wi/nfvPUXycrxApob+Cuddsmd8Vu8C
	Ks7ZTs4yT9cQ41tO7xpzScPV8eBbcJ2HWwhdS4F45hhOzjle7oncGFjMyN2SxGLec
X-Gm-Gg: AeBDiesA8aRuiDL5DhG+G86bmydYU0IHfSRGCFHOLNDLPoeiojZ/WrluXneFKMf5dit
	Vc5ztLBDJqiJMTxhtdWgPCA76VqrohATl0kVhZ3xN+4NfsIJ1N9xBn+ooqNZ6xUU6lg9cZ7CIJ4
	RdaRgIu1EZ1qk+0A2kJ9RQabmJgUPkqMPM+UmAsBL0W9J0QBAx6Sp+ms4afj+0x9dXmg/2ekSBV
	/kfZ90tW+VA3xFXzcKHuBwTq7zStDdlaJmcwYysBQHuVy8v62xfNne6U+6OpaPaDnqh+JMwTgxv
	vI4UffEKRQnoKzEi0dY7zI96y4JK4RrpzQrKn0h0VEtZcwlS1mkPhl1FcbTOu1fzElNq5WeLaHb
	QotiOVfqKAalVHx78awY3tRiiaf/bNpKGaJkmFnJyPPe0bGkHSbKk5SqDGcjC05JrTskfsdCCAZ
	O0Zdg=
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr22735351cf.6.1775811358539;
        Fri, 10 Apr 2026 01:55:58 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr22735201cf.6.1775811358089;
        Fri, 10 Apr 2026 01:55:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815a1dsm443649a12.22.2026.04.10.01.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:55:57 -0700 (PDT)
Message-ID: <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:55:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
 <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
 <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1dhKj27wtXpjgJVVTUb-q0HffuQArez3
X-Proofpoint-GUID: 1dhKj27wtXpjgJVVTUb-q0HffuQArez3
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8bb1f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=RZ-4Qy_TuwwZI4MMkMAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MSBTYWx0ZWRfX6q6AfdQqs69U
 hqNSvegL2W5EUAeikEImg3v4enkc4BO2J/JLBpuR+jWazu/fg0q6NE/7HQDMFiGElNkjIroAmAk
 9AQ1G8GV4IeTc8TYDYrmAIFdONQOH/xwF21A4YTGrx2qL1EinyQAxQYSGi2TRgqoYniWgdqB9W5
 t2CZolUCJIq5w+syjWPFFQloxsmbh9Pq2Z8ntHv8WZ+yW0H63KL5j2gWXYkyVjIc/oiEbyR019p
 adUvswmeSfxp2Sc+BqIF4qSY7aO+znTeU6m/j1cJ+rjb8CM1xdCDCdNUNTSTPOu2nqANk6kWUDZ
 MUD7n7NDQZKAR0VA7ELnC/HYXhOIASEqz5sw2T/lM+qC14R28cPSnuf1AakXedA/Bp9EXqoylEg
 YFZlEloEtP9uLUgyl8NCYBa4/f5W0e3dC9O3gdRVSRoOgwZxKEsCdXfNMtTvbmFlZOYS5NLZZWy
 s5j1KS38/8dhTny417A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100081

On 4/9/26 11:24 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 09, 2026 at 10:38:15PM +0200, David Heidelberg wrote:
>> On 18/02/2026 16:59, Dmitry Baryshkov wrote:
>>> On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
>>>>> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
>>>>>> On 2/18/26 12:18 PM, David Heidelberg wrote:
>>>>>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
>>>>>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>>>>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>>>>>
>>>>>>>>> If the OS does not support recovering the state left by the
>>>>>>>>> bootloader it needs a way to reset display hardware, so that it can
>>>>>>>>> start from a clean state. Add a reference to the relevant reset.
>>>>>>>>
>>>>>>>> This is not the relevant reset
>>>>>>>>
>>>>>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
>>>>>>>
>>>>>>> Thanks, I prepared the fixes [1].
>>>>>>>
>>>>>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
>>>>>>>
>>>>>>> David
>>>>>>>
>>>>>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
>>>>>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
>>>>>>
>>>>>> Please don't alter the contents of dt-bindings, it really doesn't matter
>>>>>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
>>>>>> place
>>>>>
>>>>> I dpn't think that will pass. Current reset is defined as RSCC, we can't
>>>>> change that to CORE behind the scene. I'd prefer David's approach.
>>>>
>>>> Back when I replied, David had a patch that removed the current RSCC
>>>> reset definition in dt-bindings (at index 0) and re-used that index
>>>> for CORE, putting RSCC at index 1. Perhaps it's better to link to
>>>> specific commits when making comments, note to self :P
>>>
>>> Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
>>> work.
>>
>> So, finally I spent "so much effort" (read throwing it at LLM) looking at:
>>
>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>> iova=0x9d4bb500, fsynr=0x170021, cbfrsynra=0xc88, cb=11
>> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
>> arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
> 
> [...]
> 
>>
>> These (or very similar warnings) are around sdm845 definitely 6.19+ /
>> linux-next kernels for some time, but pretty harmless.
>>
>> LLM suggested multiple fixes, but when presenting possibility of
>> implementing mdss reset it found it as most preferable [1].
>>
>> Adding MDSS reset would most likely solve it. It's not critical, but not
>> nice to see many red lines in the dmesg.
>>
>> Is there something I could experiment with to get closer to have proper MDSS reset?
> 
> I don't have a sensible solution at this point. We tried using the MDSS
> reset on several SDM845 devices, but they just reset. So... I don't have
> any possible solution.

The older context talks about altering the existing dt-bindings values
and now we're at hardware (mis)behaving? What is the issue here?

Konrad
