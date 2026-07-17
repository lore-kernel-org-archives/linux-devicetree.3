Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F62A3F12FC
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288420; cv=none; b=nXtrCWHr4EnyHMXnDvpuzYGgge9e2++2pzYeR0ENzQxVVyC+fZLrXLsFBkM1nBTSgadaU2aKOKxBzvwKp4UUHoFVTjUdY9bwYrG+hkIOk/kjh0tYzldwt4Hcb0K4AfNdIVpRpwr76hCzf2ccUNLMN5jZEvJOBZg9jzRY6UwhR8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288420; c=relaxed/simple;
	bh=0M54LK+e+ZsqutDKWxmQf1vKliGbRxbhOcJFvzG1A0g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oZ9UDU9ugSV4/mJPEUfKX14YikVop7tCYYFK0cvbC6aI2yRr9T0wsq5lGPMhwHe4JPQfy767FiEvA6cszh3ojeVIGuKulomg8xSpmcRa68tOgL5CXUrTUmsYh70DoYIfME9LA5b2yrmKG5FksnhHejl1ed1qTIF0nxY1DMDwkww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2v8hqQK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZsPZuv1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2v8hqQK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZsPZuv1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASuTW1632079
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXuugUouKlB/CUW4LY6w9L6J1o6zPDA0wz2TTB2Kat4=; b=a2v8hqQK+5NFF89D
	97D6u2gu1GhLs3KiOzhJ9ucraCDlBeBTtrCFilTzkcsuq9OcGN9kl9X0Up4NKBW0
	k8plGKaONU2Bzc6E1gTHBP91QyRnTHCCKPUs7Eocnr7Lw/AYnrWS8mWgabM3brTf
	zNzQfLgUss/CGIKIpFSeoxa5zrxGstJ0SuHwOhNKlxP+dS73z/EQae0t3glkeB9f
	2yO4euksQGEzVf/SST7/9nJAgB6TdMC6y1iWmS/hunc/ene9xhV9+RTFBFHUlYqd
	cLZIT408D4tIFli89y1czok8b1kU2nzfSKyDjgwSyDMlN1joZXxW9XCuCDxt+qvJ
	rrlsCw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0usebg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:40:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484ba00601so5609127b3a.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784288416; x=1784893216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXuugUouKlB/CUW4LY6w9L6J1o6zPDA0wz2TTB2Kat4=;
        b=DZsPZuv11/DzLlnEauAkeWSg+vK0mkzgPVZBn6OU47LqEDVmlL2fzMZlPIKHHcLL4e
         xQ96W7527hEuh9o/QT8rNpd7FnamiLVmI3eKt446cv+duJZlm+d3tqQ5DEAOjSCDhG2a
         G81dpVP93ZT98Uj1FUnjHLM9U8CNJzwERuiBIFRBHzPXjkFtqCdA3UUJrZBizI6ACMAz
         lAMEYIq6TyWQvVGBm5zAdpVyLT7Ewo/lbgrFPRMicrTv/dM3TsIyYD4l0y0E4+YQGEmf
         8hjtbHqY5Pc4yvaFoPbYvJyOBlYBTsbtDELXuAtW9hZ2rcNnTUP//Xo1TXplqf0Lqlk9
         IxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784288416; x=1784893216;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXuugUouKlB/CUW4LY6w9L6J1o6zPDA0wz2TTB2Kat4=;
        b=KbYd0ynFOjOMsC9uQSAe8tkZ7J/LGd0SrxHZGHfZBRpUSPSVEJS1B3aZB6gA3B1CAP
         LW6flEFsaXZcB+aoZXkDMH7iJaVG9zESrKd01MZ6D4lpMKpVsYGxKE62HPiaPlBhVsAH
         3Tej6vNcDoi3stYD+TcmJISdMEwj7axBW1mM3wdpPyE+8p4m8E385QZu8sPJMDAj5MM3
         5J7erE3sAf+/NgTNK5LA5D3dslYgquH14WCgQ8nl4sEhSDH1XqgDiMQQ7k4VJUYIdK6m
         eA48KJ66YT3HWaXN0kGuFo7WnzSJRC9RmWsY4HJ2FfvSXrUOXGj1kF6zr5ahL1UDSSut
         poZA==
X-Forwarded-Encrypted: i=1; AHgh+RqOUGAjYa9LvcIfpB+00B3Gf65XeFFLFyB4CK4hp/ElQh94LbgQJY7UygqQUF9N2MhgKcPdfKUYPAMp@vger.kernel.org
X-Gm-Message-State: AOJu0YxeqWfqr1NhPe/3kedzK1ZekobuQ2oLT+q7Y3A2rN79duiD/cB4
	xyoKV33w9Wal7DwHtQoqeaK9sKz8yHcuM5y+xK6xZBU7OKJCYSOGk7Q/l4l7uoeooTQGrWDDC+p
	tzMyZEo/QSx1uvt1AN4nL7JGhj37QDLqNVUtCJMflZNT1O+nHKcoCQQYh5DNK5B0S
X-Gm-Gg: AfdE7ck7iiNuitImvSGP8JJB2ltovwb6fozYbpN0fr1lKXDsgAB7gk1ZdAjwuSCzPW+
	PPUfxAj1Dw6cgG96RLxhOWBNzqRirppXkYVW03fpEFqKnCuLbkVxEcwBnJ6BQvyP//M4jWZUDRi
	CdOTsxQa3N2VUM5bmr0iH7ZuAAFwPn6pqdHR3f/H0eveUx17F7vhjZfZJE/RkTfT82f2bU8cfb1
	6C3r2IRgMoyI0yutUC9pTnOApVe8FjygoohgTzQtmsmXbDA7Tse0Y+eqkMYo/p/gmroN1H0S3Re
	v7ZtOwMu3C/btPdjM1D94cCn0YlLfzIR2TZAqhLpPX8bbfLKSbu0yp/q8w/Un8hypVGQg6SXkCU
	XGP77hmvFax9V/+US3a0ANKmpVXrW
X-Received: by 2002:a05:6a00:80a:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84c2922630cmr2362989b3a.16.1784288415357;
        Fri, 17 Jul 2026 04:40:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:80a:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84c2922630cmr2362945b3a.16.1784288414707;
        Fri, 17 Jul 2026 04:40:14 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af317c8sm859795b3a.30.2026.07.17.04.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:40:14 -0700 (PDT)
Message-ID: <2c21041d-f84c-4fa7-a977-555f9203d8b5@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:10:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
 <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
 <4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com>
 <ak5qkRKk2eHHLYmo@baldur>
Content-Language: en-US
In-Reply-To: <ak5qkRKk2eHHLYmo@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a5a14a0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qc56rwwszmrP7wb0vM8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOCBTYWx0ZWRfX143MtDFluzSJ
 Z8WVFudyFmXHmd3DHGrJfsjXAP5rOcMzcQvquKqzcsS9OHzTJydytTA8IFmwCU5OFNFNMT5Woq9
 wm7lf66eRn3kmS1QGhPO0GoZY6gSKbTdTq/tityL+1oU1aM2+mlx/TQad2jEJgdx/OQ4Ld4C0TZ
 hqkhXo4LBSVojArZJ4SWcDTYUn3FdzM1iP3H1k2JlEvFneBWBXwSGtjg8FFHcd6jgqWl1UDk1I4
 N65LfZSrDujAmvVLZi2NEjrwO6qSYy6/sbki0Tj6mml1xJ3lr49KY4DxowErti/VxTPfJ3kv5N2
 1oSBpymGJUrj1Gh6GNe3BMHPzd6NpCwGmH6VPCToJKJdKtKFCiboy6w2/LjvFUZ94bG47chYsdM
 3GJ/I82q9XqUqnNvEd5UCfNbJIuAUGwLx9rprA162Ob+hUy26jbWNKy66ROG+nDwTDsu5HPa3Jb
 b1wMbE7mmSExtZhT0uQ==
X-Proofpoint-ORIG-GUID: wVETMq2KLzgVMUk53qeq-HpSsvL7KEpA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOCBTYWx0ZWRfX2e6eszzgu71Y
 Jf5hUvxeyqcjSptcrDDf0ZA8+ZqVoAohhZ06TUCEBYpt4dnfA/8Hj4hp9o8sB3ID76lLFJtUWen
 Lmx+oZ2jmz2KiYKkStIxXLllKo+rOoM=
X-Proofpoint-GUID: wVETMq2KLzgVMUk53qeq-HpSsvL7KEpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170118



On 7/8/2026 8:56 PM, Bjorn Andersson wrote:
> On Wed, Jul 08, 2026 at 03:31:07PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/7/2026 10:14 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
>>>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>>>> leading to intermittent probe failures and runtime issues.
>>>>>>
>>>>>> Add the required interconnect to ensure reliable register access.
>>>>>>
>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>>> index 90e50c245c0c..721526f023dd 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>>> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>>>>>>     			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>>>     			dma-coherent;
>>>>>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>>
>>>>> Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
>>>>
>>>> Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
>>>> preventing gem_noc going to sleep when icc_set_bw is being called.
>>>
>>> _why_?
>>>
>>
>> Now when i think of where we implemented the hooks, ALWAYS is not needed. We
>> should keep it ACTIVE_ONLY since we are already voting it
>> back in resume pah. I'll fix it in next revision.
>>
> 
> The path is between the SMMU and DDR, so clearly it has to do with the
> TCU's ability to fetch things from DDR.
> 

Yes as you rightly mentioned, this series is helping to resolve the race 
in TCU DDR clink

> ACTIVE_ONLY states that the vote should only be applied when the
> application subsystem (CPUSS) is not in low-power mode (CPU is active).
> 
> So, are you saying that in all cases that cpuidle might select such
> low-power state the GPU TCU is "stopped", and does not need to perform
> any memory transactions?
> 

I rechecked the architectural block diagram, GPU TCU is
independent of the CPUSS, unlike system TCU.

This means CPUSS can be powered down while the GPU TCU remains voted up. 
While this series was intended to avoid a DDR voting race between the
GPU TCU and its clients, using ACTIVE_ONLY could have possibly
introduced a race between CPUSS and the GPU TCU itself.

Thanks for catching this in my reply Bjorn.

ACTIVE_ONLY would have been suitable for system TCU (apps_smmu)
for which the interconnect field is anyways not needed, but
unsuitable for GPU TCU.

> 
> To me these two are orthogonal and TAG_ALWAYS is logically correct, but
> perhaps there's some practical dependency that I'm missing?
> 

We can ignore my acknowledgment [1] on previous response, Dmitry.
ALWAYS TAG is correct here instead of ACTIVE_ONLY in the interconnect 
field for adreno SMMU.

[1]: 
https://lore.kernel.org/all/4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com/#:~:text=Yes%2C%20I%20think%20we%20should%20go%20with%20the%20ACTIVE_ONLY%20flag

Thanks & regards,
Bibek

> Regards,
> Bjorn
> 
>>>>
>>>>> then drop the extra suspend/resume play?
>>>>
>>>> Not sure if I understood it correctly.
>>>> Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
>>>> or in arm_smmu_device_shutdown() path?
>>>
>>> runtime_suspend/resume. I might be incorrect here, but I think it is
>>> exactly what you need.
>>>
>>
>> Yes, I think we should go with the ACTIVE_ONLY flag and we would need
>> this voting in suspend resume path (For the same reason mentioned in commit
>> description and cover letter of the series).
>>
>> ALWAYS would avoid the need for this handling, it would keep the vote active
>> unnecessarily, but still that would have been nondeterministic.
>>
>> Thanks & regards,
>> Bibek
>>
>>>>
>>>> Thanks & regards,
>>>> Bibek
>>>>
>>>>>
>>>>>>     		};
>>>>>>     		gfx_0_tbu: tbu@3dd9000 {
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>
>>>
>>

