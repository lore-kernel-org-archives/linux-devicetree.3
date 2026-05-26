Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4666C3E009D
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797318; cv=none; b=bkl0B3J3mU9I2Fn5yxV/P/GHRu95FFSCeFy5DjcnMxTC6WnsBZKKmtrDKd3WjHVdAHcxViXxpLyJ8yu4dEWhLNE9+Q2OgWAWvZtd8JUN6lYsV5YxYPSeTIu1qkhIZ1IwkERa6G4oOJdvPEW1gXeAE2ud4woC1i1jTEgAa18s0V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797318; c=relaxed/simple;
	bh=J9GlkG8GT5J/NLnjVaOtJKJFRf56bS6AEy0RSL8EVSU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=s14nBPv/sGja0DFKqfCwpxxySmy6Z4V8wxCTg8BxtLM4SMZgQF32oah76oB+ahm7+T5ay+CarmF/tN5L9+kT5QNlTA/Ym2WAwh1iNt2kUzuIqPoFBvKCremXXuNjPpH1kEN/95PAwQfG3GLRHpTIDQvTeB+Q1UXUgBmwO/FlZqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XASqwVqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfltuTrv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XASqwVqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfltuTrv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QAbho5004519
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ck93GVFMvnl1I3EtxCbDK/JyBfi+pqukNpdtkiLrZ7Q=; b=XASqwVqr0EqSlH9D
	N71d+vV6ha02i5xif4DgimnuLSRgiBfN/T4ONB0vUNZduTO1Y4OfHJVLlfciaGfs
	6oEDDLJIxhrc5lj6MMLDih4Za83VonHXIWZzSvJjvRmOJvyjGxCAG1wyHI2NUh0N
	5IDt/qmKRl0aUFT+ajepz5RC8ja5Li7x5sWaBWVIe19jMCXpT1UiYjivyTA1WOkM
	SFNaY8Y9FSqj0UMuQ8xOTnCwL1fTCW/AuMYal81aT071KxBE8eV1o2QI4jI+aepZ
	LL0I5wA+cD4RMPrLVtoBO0ckIQ/d5G/dBg0pjMu3cvhbEupF1+9UfQpR1+vKJp3V
	s0eVqQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm03f8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:08:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so10224479a91.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779797316; x=1780402116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ck93GVFMvnl1I3EtxCbDK/JyBfi+pqukNpdtkiLrZ7Q=;
        b=IfltuTrvQsdoT58C4qKFIrBVyklEMYd5p83Ng8auKRd0i/pNoCPJH+xk6gxng1dURR
         /dxMtmAqzBQP/agJbr+YfpuPjMyKkPpa7+b2g/TaRAqbRkIM+8aTDBw6YWYLvq7SHo9y
         4JxI+7ICk+TKmC2LVq4umRk7aTqaLX9wzhJrP94PCFHZPyF1VGJ71aYJ2InIDLeNzmd0
         jTCmf3gtU2BXtoPG3W+2UbTAr9d7y+rYUl10KhOxUvqXEbR53yrIg6foFkllvx4iEJbL
         3d4LeZB2RR5x/2vPp+Fh87hI3MESDdgcDOYWrpdJxR3JMMrkW+BigTp6OP4YRe5GWP7q
         lxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779797316; x=1780402116;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck93GVFMvnl1I3EtxCbDK/JyBfi+pqukNpdtkiLrZ7Q=;
        b=arjNCt5zChnjBYdS/EsKmPkYb7PU+6ax7NL/+De5IO0NM1pxV9A8zL5X209WaebEKm
         labcxd0Mdw1/5yFXHKsD+harJfQK/NqIaoep3q8qkTHHf4QIa1chjZIGxm6TEQXUbmJq
         DThxLh8k3q+kSUmfV4YgTQ7nwUmuw77XaY+WyXNkWcW3DeMEYRcQjFDXB7eskYPYUg+L
         RfeoZ7p7bqY9poFdOtQ8eNW7N2XGNNk8rB+y8rnlSsLjRxxWh8zz0thcZoanj9eZk3Cd
         Sq6+rZySeGtP3i78Jf43Xj9uccxwRdocFYX3ANQUMNfOVorniN+UPV8FJknJ5iCcc/Lb
         d47g==
X-Forwarded-Encrypted: i=1; AFNElJ+CRLKJOCFFXI5k6IZJi/KRJ+tVDxg1sQIj021WpQJzGZrA27NILWxnnyuuER14JwevPOHd8eEWY1XT@vger.kernel.org
X-Gm-Message-State: AOJu0YwAR5ChGmk8Mtfy+AfxlOxIMKTlNN6Kg2JX3VUMHm9Hpra6O6j/
	2m6b/g9fvSUgQe+xj48rpyX5Go/x/BjHLR+BtgVHpEqqbQ/nc2mIH21BRT334DaqIxUYtEKJf9e
	0bdiYOYGTn8im9D3AMiZiKQ6M/fKRiyRXGOlnqkPjR9eOxOLt2eez//f9U6P78E1/NqHguRwU
X-Gm-Gg: Acq92OHPyctcBTwPsF401hdUqdXmmPgnSaHj6lzYqlXFT1ogOcXEgOwD1Tmi4XJxEwh
	98brhEi4ACxrFboNdCPa/+5ij5mkQdiAjemF4EseqPGLpUSHZqkyhcDyaPFNTPxm110N7bE65OK
	PuoJOUqKqlQD8azloC4wGJrIraTHhQGz1H5vxxBDItsIZWAv3GHveRp7VtoHCeknczu0Wf7ZUN6
	Fs2P2c0kC/jpo/ZWJGCBk5ludd2lsbE0RriifpTOdgOv/zONRFU99/qJnAPNEtoatb2uwNBsHjT
	r48ia3aLyWso7gvTsRF37gwPYFu5d3G5Bh48mOaa2ie1B5+VZbE7M/7XNDJEcyUOl9JddHdONOf
	CHa0igCQbqq46MyXxZcH/aYMe11Yh1KRGEzeYSV1l5iEcdb6B
X-Received: by 2002:a17:90b:1a84:b0:368:6998:b49e with SMTP id 98e67ed59e1d1-36a6745ccccmr17923473a91.9.1779797315522;
        Tue, 26 May 2026 05:08:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1a84:b0:368:6998:b49e with SMTP id 98e67ed59e1d1-36a6745ccccmr17923444a91.9.1779797314922;
        Tue, 26 May 2026 05:08:34 -0700 (PDT)
Received: from [10.219.56.98] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7b92sm12314353a91.12.2026.05.26.05.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:08:34 -0700 (PDT)
Message-ID: <13632cba-507b-42c2-9754-21dace0c60be@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:38:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Add interconnect bandwidth voting
 support
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260516-smmu_interconnect_addition-v1-2-f889d933f5c1@oss.qualcomm.com>
 <20260516130251.DED6AC2BCB3@smtp.kernel.org>
 <72a2dc38-bfaa-4027-9871-0fb387242de2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <72a2dc38-bfaa-4027-9871-0fb387242de2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a158d44 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dVmKxVKBsDr991kcCGAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gKnWswZwT_d7PmynBHD9D_bGVqcvqOfZ
X-Proofpoint-ORIG-GUID: gKnWswZwT_d7PmynBHD9D_bGVqcvqOfZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwNiBTYWx0ZWRfX8VlTC9Zd2E1j
 RUL9qovV0VWErUk0JVAjqEpxlcK6DgPddRY+xouCqfIj8NunnB5BkERUtT+ol8PX7w2FW3PSa3o
 pjUH3jU+BUlvO+OVxolovctu23hnDp2GNHmuniAzE2ZAlDQ8YwpZ6DFV7mHS9Vvbh6mNY0miwzo
 4WGs3PCQJp8jcYs92ngIbJjxiPIqcAffP/9or2PfNt1W2vPgvsleJWNe1rhvP937N8aPRXPKkrg
 6g/XTsQ7f6QtFY3Agh5EHImCW6bNXg2Qgz1tr2HRFvsuJw78xumoYSLFewBNKollOztfBKxbvnl
 BoMAAX8LgP+suG3uymv4jlynlSpEdmA0d5iyWVAqEK1VI1dj2FNVdtiQcIn2UFHLuO8FlL68/SC
 dVWXFRyFjxAR4UiV4esWvQCF2Y7ZtsMCF7WAiAgNKG+3K49GzU6b48RH6tNWPQQVQNswmfHkHEw
 0Mx2eY2n2t1/0u3cSMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260106



On 5/23/2026 8:11 PM, Bibek Kumar Patro wrote:
> 
> 
> On 5/16/2026 6:32 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential 
>> issue(s) to consider:
>> - [High] Dead code `-ENODATA` check in `arm_smmu_icc_get()` causes 
>> probe failure on platforms without interconnects.
>> - [High] Shared IRQ handlers access SMMU hardware registers while the 
>> device might be runtime suspended.
>> - [Medium] Interconnect bandwidth vote is not released during system 
>> shutdown if Runtime PM is disabled.
>> -- 
>>
>> commit efe802bf0c93309aa584a5eb41c34c9788a6e837
>> Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> iommu/arm-smmu: Add interconnect bandwidth voting support
>>
>> This commit adds support for an optional interconnect path to the arm- 
>> smmu
>> driver. It votes for bandwidth while the SMMU is active to prevent 
>> register
>> access failures during transitions. The bandwidth vote is enabled during
>> probe and runtime resume, and released during runtime suspend and errors.
>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/ 
>>> arm/arm-smmu/arm-smmu.c
>>> index 0bd21d206eb3e..aedf5edf8f9b2 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> [ ... ]
>>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct 
>>> arm_smmu_device *smmu)
>>>       }
>>>   }
>>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>>> +{
>>> +    smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>>> +    if (IS_ERR(smmu->icc_path)) {
>>> +        int err = PTR_ERR(smmu->icc_path);
>>> +
>>> +        if (err == -ENODATA) {
>>
>> Is this -ENODATA check correct for handling missing interconnects?
>>
>> Looking at devm_of_icc_get(), it relies on of_icc_get(), which returns
>> -ENOENT when the interconnects DT property is missing, or -ENODEV on ACPI
>> platforms where dev->of_node is NULL. It appears it never returns - 
>> ENODATA.
>>
>> Will this cause the driver to unconditionally call dev_err_probe() and 
>> fail
>> to probe on all ACPI platforms and DT platforms that do not define
>> interconnect properties?
>>
> 
> ACK, good catch.
> I will fix this in the next revision. Instead of checking for -ENODATA, 
> the code should handle -ENODEV to correctly cover the case where the 
> interconnect path is not available, and emit a non-fatal warning 
> accordingly.
> 
>>> +            smmu->icc_path = NULL;
>>> +            return 0;
>>> +        }
>>> +        return dev_err_probe(smmu->dev, err,
>>> +                     "failed to get interconnect path\n");
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>>> +{
>>> +    if (smmu->icc_path)
>>> +        WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +                   ARM_SMMU_ICC_PEAK_BW_HIGH));
>>> +}
>>> +
>>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>>> +{
>>> +    if (smmu->icc_path)
>>> +        WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +                   ARM_SMMU_ICC_PEAK_BW_LOW));
>>> +}
>>
>> Should arm_smmu_icc_disable() also be called during system shutdown?
>>
>> In arm_smmu_device_shutdown(), if pm_runtime_enabled(smmu->dev) is false,
>> the driver manually disables the SMMU clocks via clk_bulk_disable().
>> However, a corresponding call to drop the interconnect vote doesn't 
>> appear
>> to be added to that branch.
>>
>> Could this leave the bandwidth vote permanently held at
>> ARM_SMMU_ICC_PEAK_BW_HIGH during system halt or kexec?
>>
> 
> ACK, adding this in the shutdown path would be safer.
> It should also be includes alongside clk_bulk_disable() in the "non-RPM" 
> else {} path of arm_smmu_device_shutdown().
> 
>> [ ... ]
>>> @@ -2308,6 +2358,7 @@ static int __maybe_unused 
>>> arm_smmu_runtime_suspend(struct device *dev)
>>>       struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>>       clk_bulk_disable(smmu->num_clks, smmu->clks);
>>> +    arm_smmu_icc_disable(smmu);
>>>       return 0;
>>>   }
>>
>> With the clocks disabled and the interconnect vote dropped here, is 
>> there a
>> risk of a bus hang if a shared IRQ fires while the device is suspended?
>>
>> The driver registers its global_fault and context_fault handlers as
>> IRQF_SHARED. If another device on the same IRQ line triggers an interrupt
>> while the SMMU is in RPM_SUSPENDED, the handler might attempt to read
>> hardware registers (such as calling arm_smmu_gr0_read()) while the 
>> SMMU is
>> powered down without an active clock or interconnect vote.
>>
>> Should the interrupt handlers use pm_runtime_get_if_active() before
>> accessing registers, and should this suspend callback use 
>> synchronize_irq()?
>>
> 
> Seems like this issue predates the interconnect voting patch and is not 
> introduced by this series.
> 
> The clk_bulk_disable() call in arm_smmu_runtime_suspend() was already 
> present prior to this change. Introducing arm_smmu_icc_disable() does 
> not alter the risk of the race condition mentioned above.
> 
> So as per my understanding this comment can be ignored for the series,
> Will raise a separate patch with the proposed fix on this suspected race 
> condition.
> 

There's a separate thread already ongoing over this issue [1].

This bot warning can be ignored for this series and let the discussion 
continue over the mentioned thread [1].

[1]: 
https://lore.kernel.org/all/20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com/

Thanks & regards,
Bibek

> Thanks & regards,
> Bibek

