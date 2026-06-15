Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C83ECBEA
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528841; cv=none; b=KoHJrBdceJQo0hltBcNJ+6xJn/GGb00xwx0F6XyX9Uc34/w2m5C70suOdOXmnx6e29BYTJz20nmv176MDaufJjRIv8gj4KycDm1YkN7dRGQl8Sfm9PtJGUKPA/uSwCkZZc2HCHEXP7kIhSgBCrCkgzVwzyubqktPHq5wnTFcD5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528841; c=relaxed/simple;
	bh=mM80Ae8XxnzS51Dw4Pw58HMVr5lZn9bOwL/mMk9poQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQ/taXEHWq7jkfdSica26tgyvaGUgbKIlYcxTmpVFY7XGIIf23n7PuVVMDtrJklTVa+jlL7OvAOtrcsj45enBKokSs74Xx/UPnL7XDiBEbaDWuh+pBtpb9oEeQSz5JAvl31lQcuAkb9CUFv/6JA34cUeLYyPB7AtRNHBAGEBPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2NnFh8O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIyYKKn1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2NnFh8O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIyYKKn1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZvq3530134
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvxVu7ZMj0GrNYVnvEx5o+aB0JEz3pjwUB8+jM1GNAE=; b=k2NnFh8OTE87IxoX
	b/yqlUzI6TGw5uqop0QKf2e8vEKKI3wI9Zf4QbFK6n4wJgBORCv0KyBBZ4kU1GVT
	sj++RiR35ktuXs4SxZ4JGm4gXyGXFn0kZqL7F6wd34eaznVEwTfp5Tcim/UAKlMf
	xth0XqvsvdYNODjm6FgT5cIHw3naQ6IBgZdoE+KMlPvOr2zcP7dAyMsWURP4uArf
	y03G5nwbEuoi0hWdojyAA9buhKBcqPmKwA1stx3KMUwH4pcGleWeCfZMXJLdaLPD
	vnFYhroCkcRegNCDnvd9LJ1eX1BrDYVMoSEVAz1zu5b5s8JJlifQgpldjI0wqGZ2
	cLli9w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter20tp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:07:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842208d5b0eso2696884b3a.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781528838; x=1782133638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvxVu7ZMj0GrNYVnvEx5o+aB0JEz3pjwUB8+jM1GNAE=;
        b=MIyYKKn1uuvQRovecjBFAAInTpAFQ1jjRGI6yGNuGL2G7qT8vURHgvi4y5XNN/MocL
         kZQNvp8D1GvXWbSj/sSLerZ2GLg/rWFCmQAngiIPf5M6YGw9OH6L1HCr7sB+RXc8vEHs
         JoIaw1ogdh3homHL+Bfws113u8APqorm0pwoCWxrCgxklaGA8dFrH8PwpOoiiB0QHAca
         keMwQIvRWwtvt6oDLcRdeHmlGWeSnM8DOuEcs2EenHopZht8H3GfJGN1PJC4MODzTLLp
         V5Clz358uvKRj8lxCm04MAISFB0fg3D31Q3ha69rYk/11xN1tjR8AXz4TdtH7+0kNq/3
         cfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528838; x=1782133638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvxVu7ZMj0GrNYVnvEx5o+aB0JEz3pjwUB8+jM1GNAE=;
        b=XN1ofzeEUs082FGEOlWERCj1z082XbOpvd7lz+0R+vwWOQ/aXuaE+miO3Vd8lK0/Vg
         sEn0q5QWeLaOG5t8GCN7fTU2u2147S13zNfOSFTTI5+1LyLzX3tuFvYn3rg9mpk+A9Sf
         7imLoNGZYNFkfXTWzdnNwKbnVsSAWmY/GWw6EzbLUCgXSFzHBuEWzt6SSNBFQbDmdFVu
         HTERMHnQ9U2oA3XuWFMyX4ViZSSbANKrT5x3X4VOZgFVSelcAxgBkalNM+ytqSQVTmG2
         8qBktyHTa/CaADZAPk13JOMEbeS02hyLCbfCyae90uq6Gf586aBJEH+zYMHKEj+Au+4z
         S5sA==
X-Forwarded-Encrypted: i=1; AFNElJ8kJULg+MPu99hnkP22zdHSJZRnq8/o7Sc/pTJotiZR3v9AIkD+TUkwab0ZSCRVSMGSUZGaRMDDOdVO@vger.kernel.org
X-Gm-Message-State: AOJu0YzLFAyFRRsEsZ056GgLhQL/yVPYPlo++Hv6Q2p0ewjUy7iMqPyO
	17IKq7+jm55haKP9cvTZ4w0Ff32VVgivPxWf4VVHGETwJCAqHPFTRRCVYkJL+MNzq+cTJEleveX
	t2aTOa95NITQAJTFmjB7DflkRUvWhMkqI5MQEUfbq15tjoesk5Gj/mI82Plu0iV0O
X-Gm-Gg: Acq92OGTTuI79cwZteVOmcj//eKqLfk6oQPzE/6x7bDrFv9yYw/1NjwIFlCdYPaKQti
	x99ujKHxjIK3fT2od8XNgD7P4Hd9rS2GHrT9D6M2SzeAjg1JEDWqDdOdXV6dWGYebJA2QSdYTGK
	FMLTN+XC70aobmkr+W10O0OwRXeQiWwFQyH4i/42DXt+kzTXujlS6LPdKvVWxP3+IHBn4Gu580d
	K+DW27wc06K6qTtyDPc+vG6i6MUxarvCwCciIou94Ftb2XYHodalHels0xEnQCoKyKU9FmgYafC
	LiBdpEJBnjjtM/nV0LyI3mV3miieRTAwUxc9A3NMr5Ee5VVZghifJayk4E2GMDanwuyXglY8iUb
	xlmiwgmOBgkFudYZHSxe0Os6sHrY4v/IyB777f5pfJM5f0DEz+w==
X-Received: by 2002:a05:6a00:4fc7:b0:842:54c1:8e15 with SMTP id d2e1a72fcca58-8434ce42058mr15689266b3a.29.1781528837815;
        Mon, 15 Jun 2026 06:07:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fc7:b0:842:54c1:8e15 with SMTP id d2e1a72fcca58-8434ce42058mr15689210b3a.29.1781528837300;
        Mon, 15 Jun 2026 06:07:17 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b04808dsm10116612b3a.52.2026.06.15.06.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:07:16 -0700 (PDT)
Message-ID: <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:36:51 +0530
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
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzOCBTYWx0ZWRfX93uE2SPBjmIS
 I4GGNr87bw3CdZVLZQpF2HXHe7wUSRT6Qcj5vXw00d4J49El91m/sn0jQORctuvv3UsH3Lg123A
 gCSMZrl7CRAf1WW0ni9DvOGJWm7n4i8=
X-Proofpoint-GUID: 0BgtH4EScl24wUxhkaBmwLb9BV6LGtri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzOCBTYWx0ZWRfX0CHYF3OtqYB3
 Y848Q1MkIQCSl9QVc1QiSlZO+dp50EkO97XZS3dVDELDo6VukJBwfQMya1rCt6devfcyyXecVSC
 5VPwfZaDpMG1h5x1HRHIiU+8//EiMvjAjD6E8tZ/64bEE71342TnL4xP6ZI+XfzhcNxsJOZugAB
 irrzu0MwOTd9SN6pCu+87d2l+kZqHZasXUnCxcDG4sCAG08IRXtSLSXDWx2M/AuGAfheCxSbhMy
 87XzQzJlBrZVEkjRIXGvJV1H1eHTjV/Liff2eAe+hcvSj3E/WUthQvvOcDZt5wU9jMMaDYw28If
 ENw01I1ma+/DWfjkCjSmFEfk6UN5+WGQVOgPsGxZOteeEgIRUmannu8jNGSbvLMi/NSJYKShAbZ
 i8CRwwMyqhyO/mK0alAlBKn6b1/8ufmXFry8TomyGky+/i6f4FXFGJeg+GKTUCFp+zjsryghyGN
 GXyGIPvjWv7hvW/zhWA==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a2ff906 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fh4Lr3tRg7ETXUjdBf0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 0BgtH4EScl24wUxhkaBmwLb9BV6LGtri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150138



On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>> On some SoCs the SMMU registers require an active interconnect
>> bandwidth vote to be accessible. While other clients typically
>> satisfy this requirement implicitly, certain corner cases (e.g.
>> during sleep/wakeup transitions) can leave the SMMU without a
>> vote, causing intermittent register access failures.
>>
>> Add support for an optional interconnect path to the arm-smmu
>> driver and vote for bandwidth while the SMMU is active. The path
>> is acquired from DT if present and ignored otherwise.
>>
>> The bandwidth vote is enabled before accessing SMMU registers
>> during probe and runtime resume, and released during runtime
>> suspend and on error paths.
>>
>> Generally, from an architectural perspective, GEM_NOC and DDR are
>> expected to have an active vote whenever the adreno_smmu block is
>> powered on. In most common use cases, this requirement is implicitly
>> satisfied because other GPU-related clients (for example, the GMU
>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>
>> However, there are certain corner cases, such as during sleep/wakeup
>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>> is powered down. If adreno_smmu is then accessed while the interconnect
>> vote is missing, it can lead to the observed failures. Because of the
>> precise ordering involved, this scenario is difficult to reproduce
>> consistently.
>> (also GDSC is involved in adreno usecases can have an independent vote)
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>   2 files changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -53,6 +53,11 @@
>>   #define MSI_IOVA_BASE			0x8000000
>>   #define MSI_IOVA_LENGTH			0x100000
>>   
>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>> +#define ARM_SMMU_ICC_AVG_BW		0
>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> 
> totally random numbers, which might be different for non-Qualcomm platform.
> 

Ideally, any non-zero value would be enough to keep the path active.
Here 1 Would be enough to keep the path active, but might be too small 
to reliably keep the bus active.
Other is UINT_MAX, which will reliably keep the bus active but might 
cause a power penalty.

#define ARM_SMMU_ICC_PEAK_BW_HIGH	UINT_MAX

seems to be suitable here to reliably keep the bus active by BCM
for both Qualcomm and non-Qualcomm platforms (with some power penalty).

LMK, if you feel otherwise.


>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>> +
>>   static int force_stage;
>>   module_param(force_stage, int, S_IRUGO);
>>   MODULE_PARM_DESC(force_stage,
>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>   	}
>>   }
>>   
>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>> +{
>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> 
> Is there always only one bus / path in question?
> 
>> +	if (IS_ERR(smmu->icc_path)) {
> 
> if (!IS_ERR(smmu->icc_path))
> 	return 0;
> 
> int err = PTR_ERR();
> if (err == -ENODEV) {
> 	icc_path = NULL;
> 	return 0;
> }
> 
> return dev_err_probe();
> 
> 
>> +		int err = PTR_ERR(smmu->icc_path);
>> +
>> +		if (err == -ENODEV) {
>> +			smmu->icc_path = NULL;
>> +			return 0;
>> +		}
>> +		return dev_err_probe(smmu->dev, err,
>> +				     "failed to get interconnect path\n");
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
> 
> Drop the if.
> 

Ack, will address it in next revision

>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> 
> WARN_ON_ONCE()?
> 
> Pass the error to the caller.
> 
> 

Ack, would be better to pass. Thanks for pointing this.

>> +}
>> +
>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
> 
> Drop the if.
> 

Ack.

>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> 
> Pass the error to the caller.
> 

Ack.

>> +}
>> +
>>   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>>   {
>>   	/*
>> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	if (err)
>>   		return err;
>>   
>> +	/*
>> +	 * Acquire and vote the interconnect path before accessing any SMMU
>> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
>> +	 */
>> +	err = arm_smmu_icc_get(smmu);
>> +	if (err) {
>> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>> +		return err;
>> +	}
>> +	arm_smmu_icc_enable(smmu);
> 
> Handle the error.
> 

Ack, will address this in next revision. to disable the clocks here as well.

+       err = arm_smmu_icc_enable(smmu);
+       if (err) {
+               clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+               return err;
+       }

>> +
>>   	err = arm_smmu_device_cfg_probe(smmu);
>>   	if (err)
>>   		return err;
>> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>   
>>   	if (pm_runtime_enabled(smmu->dev))
>>   		pm_runtime_force_suspend(smmu->dev);
>> -	else
>> +	else {
>>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
>> +		arm_smmu_icc_disable(smmu);
> 
> Handle the error.
> 
> etc.
> 

Ack, will address the if(), and error handling suggestion in next iteration.

Thanks & regards,
Bibek

>> +	}
>>   
>>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>   }
> 

