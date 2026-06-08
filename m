Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E96F407CF9
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929826; cv=none; b=p50K86NWwuUUwXC49EM/nztvE878G2VvMbPJsS8s1YYU0FATAN+t/AUiyZ31EjeWv+6KRjzHLkaRJX0BgVEH4OSvNE57q0+SX+CegV+5js2QqramsQHXVJM3ufn1DzkUao2zYW/L7qZxoPiLiT8QxxyMSIRAbV61Sgz1H9BZTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929826; c=relaxed/simple;
	bh=0Ks124g6UDmOjYuZFGg5VXudv4ts64373wIMh9BAh8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2kDq5sCIZ6YNFdEeoubegAVFUS67DLGZQQ+AzbLSexVPKIBuhsV074Mm2Kq7cVefAMrXR3yUPMtquws9LQfgcYAcgGyJvd/0aCzbgzuhnwVq3a7DUnFLcYacVBFTnZp+rQvFbfhAl4o6UdWXY+MRUsUjNN/1J2SzPGkEk5KTwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7L5qxQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKIlHfXt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7L5qxQH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKIlHfXt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EXmrZ3425477
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 14:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=; b=F7L5qxQHsRm61SUJ
	NnokikmxUR5WaZizasytm9Lk8FXczfnV9dL/1b+eK9d/fss9KWtNfJxcRAePv/QT
	Vv/jSMPZRYTIgh52JeXt8uSA8cQVP8zJVECmJOja+c/rdUKnjEfxK3d536KwTp8v
	yTYPj1GpdAYfoNzeowmlMGMhcnqBVGz4chAtpiLQ0IzztKGWacd8CH4I14DlhiTm
	8BZcUB0iGsX6Ov4WYECyNBxGj2BAZmLT+9/x0XF0ykCr/wUlD3qiUWkPPOiqv+kf
	1t0X5wj0wobR/nqvIb9pJleTVnGQ8tNxubAMj5BTinBkn0rMReFBhQ6fABUkMpOV
	xPRrQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkshja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:43:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso3228006a91.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780929823; x=1781534623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=;
        b=YKIlHfXt69db29ePeZsD+W0at4AcZmAub07E7wWKvkEvcIJx1WIFjKyXWwB+CKIt+2
         Ytg8PCDhTolO5xTtsXtEJ4ikyzpPEk0Kthkukilt4N1SFo9Ee2tE/vgdOYRAKAQx7DGL
         w3g+TvxAGlvYpjfkV/59AgXF7FONxwr9afJffYF1GPVFaPtMt83NpHF2c62MjdOiPqEr
         lBVJPptTA+kUUKP8SiiSPC/wO382C9uwhSVw5fJlAANJ63oN1zSBYFngv7llbj/BxdsG
         oeiDSnB1oCMkiOed8L4ZY06dyodooYOi10kEWNnP8+tIY3urby1W5b36EzzaSG0UlIfq
         aTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929823; x=1781534623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=;
        b=cXK0t73Gti68PtAqS8N2EThB7i7EFwgHDAPMpgAZ2CLa1rm7q3hlfWAS+gL/QODzgI
         +gELfa5UAoVxFaOP/Fev56XOhR2hjC86mfN+rVCTY6m57LoNCXQd3a/2joJTtQx9Pibj
         hKi+lKqarNWPepKPpsa2mxmQQGcUcLfb6tFZgX0Jzw/+jFM1TKbBHZl0POoDQ1gd7BK+
         bVOLItG6egfG2X4UT+FSq9OYbFOzkatjZNNnj6wszD7gPhvRDlAQleIPaKlnOcMkhYnQ
         5YgBtS5YU5P7b7GX0tE9XMa/MQsVkSsAsQT9tKpEBU9ePBLXkyXblvJZ39IPTSrMLHLP
         heVw==
X-Forwarded-Encrypted: i=1; AFNElJ/RrqKMjVHbJ2wzJ0ltvj3kLC0SMoeRU4OFycWj1NxxgR3h3sej7THbjjTvh9J2TYv0oEoLJ/ZPh3E0@vger.kernel.org
X-Gm-Message-State: AOJu0YylVkK0762rdOR0Dhgl8Cw4uUhsCri+D8KAMKKqddzh7IseroIT
	I1Rr3xYJEY/yb4u7SsWvONaWt/yAUDuYlJxv9kmHaKTPqnYUSYIvPJ853TOyePxnZs6FvoxiEhC
	C6La6d86mIEBMo2pNgETwenMyxWcxjH7bFjKe8Xfn3OOlm/ZksrRADKPAGNflQtHR
X-Gm-Gg: Acq92OHR9Qsdaut1cMzxYu+ZjeHuxopIempwZXiZ4UYPt6ZRqVO6pB6rfxBe1uQJubZ
	mju+XEEFMuEK7azqZ2b+zYfU7WvF2TjCoLa0pL1uCDQNi91rKkEsV2Hy8h8pF91i9HXSKeC+rA5
	F28eOq1kvgqnw4WCdc9MChdQNU1MYxDX0NWmS0N6oFeBJ4iAzp3CwHvBNYwlhvg58S5AhZqHWOn
	h/HRYhxNhvz1v5lqAQ0hzMDHtWV+ZTKwq7eRujOq1vfS1P4fYfCTqFEEuwQ9vPFnp7S4F9ptjEK
	ePh9mvjTPimQIY1KX3dpdmold5lFbT0vkfRWYenAFo/FVoHQtCwHCzhWZ173YxQlycP4DLhfzRS
	7b8nzqHRcQ3aNjWuWr4XaMx0KpGAXEK0D8b7pedBCNmeeieDCyO+RyIE9zRV8
X-Received: by 2002:a17:90b:180a:b0:36a:7da3:266b with SMTP id 98e67ed59e1d1-370f0c54d08mr16715127a91.21.1780929822997;
        Mon, 08 Jun 2026 07:43:42 -0700 (PDT)
X-Received: by 2002:a17:90b:180a:b0:36a:7da3:266b with SMTP id 98e67ed59e1d1-370f0c54d08mr16715093a91.21.1780929822496;
        Mon, 08 Jun 2026 07:43:42 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827f1sm19620137a91.3.2026.06.08.07.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:43:42 -0700 (PDT)
Message-ID: <a3523574-8eaf-452f-8126-db17892d5b40@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 20:13:36 +0530
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
 <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
 <bkve3vmokuyrn4agsqyzxlqr5wuy5y6urnliqypac3h6lb32hy@tfkjstevqv2y>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <bkve3vmokuyrn4agsqyzxlqr5wuy5y6urnliqypac3h6lb32hy@tfkjstevqv2y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2t-CrPPw-Cnkembk6neJYFWMq9GJOM1g
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26d51f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=ow02GMYoO05H5sz-MT4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 2t-CrPPw-Cnkembk6neJYFWMq9GJOM1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MCBTYWx0ZWRfX67KxrE7dfT3q
 7eCbQ+TnT0O3+/6WU+P97CKcDUtBCTnZrN0AZp7fOMXqyTDbUNFUnm4ubK45Pj4r1w+pxowc3sq
 fGRNDlCYIK+cvvt4RC5Q94KQy8W3BAZZcy8xV8hFK0hIkBCn+b+2n58BiEUl2GCLDNz5mBkiUft
 ayM8QlPwHYxh1zh9+Gc5Vipo+S5l2s4s8h20hXbD7ZTra3s47ji51xEU4bOS5xrKE7iWqJGrfJg
 IX5ayDN40fehWkxFnqXmn26LKG3OZt/W+RVl3mU1G7gACeygiIdUI9P20GHGdK3tFlEHepilgOj
 +073bACPNpz5uQtjNlCO7zki6Rzra/VH+TGFruGv4q48LAg9lREYiowGAsgAPnlptqT/jTNfYSf
 Zewr1AYfBucuBz3S9Xr6BMspTa/x6/6AMGvg3NGRy2rDqyXtBDprU9hvYun0vAKIahFOgMhL0ui
 b6fdXkUkB4SYGrer4Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080140



On 6/8/2026 7:20 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 06:59:34PM +0530, Bibek Kumar Patro wrote:
>>
>> ...
>>
>>> ---
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -53,6 +53,11 @@
>>>    #define MSI_IOVA_BASE			0x8000000
>>>    #define MSI_IOVA_LENGTH			0x100000
>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>> +#define ARM_SMMU_ICC_AVG_BW		0
>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
>>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>>> +
>>>    static int force_stage;
>>>    module_param(force_stage, int, S_IRUGO);
>>>    MODULE_PARM_DESC(force_stage,
>>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>>    	}
>>>    }
>>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>>> +{
>>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>>> +	if (IS_ERR(smmu->icc_path)) {
>>> +		int err = PTR_ERR(smmu->icc_path);
>>> +
>>> +		if (err == -ENODEV) {
>>> +			smmu->icc_path = NULL;
>>> +			return 0;
>>> +		}
>>> +		return dev_err_probe(smmu->dev, err,
>>> +				     "failed to get interconnect path\n");
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>>> +{
>>> +	if (smmu->icc_path)
>>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
>>> +}
>>> +
>>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>>> +{
>>> +	if (smmu->icc_path)
>>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
>>> +}
>>> +
>>>    static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>>>    {
>>>    	/*
>>> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>>    	if (err)
>>>    		return err;
>>> +	/*
>>> +	 * Acquire and vote the interconnect path before accessing any SMMU
>>> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
>>> +	 */
>>> +	err = arm_smmu_icc_get(smmu);
>>> +	if (err) {
>>> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>>> +		return err;
>>> +	}
>>> +	arm_smmu_icc_enable(smmu);
>>> +
>>>    	err = arm_smmu_device_cfg_probe(smmu);
>>>    	if (err)
>>>    		return err;
>>> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>>    	if (pm_runtime_enabled(smmu->dev))
>>>    		pm_runtime_force_suspend(smmu->dev);
>>> -	else
>>> +	else {
>>>    		clk_bulk_disable(smmu->num_clks, smmu->clks);
>>> +		arm_smmu_icc_disable(smmu);
>>> +	}
>>>    	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>>    }
>>> @@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>>>    	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>>    	int ret;
>>> +	arm_smmu_icc_enable(smmu);
>>> +
>>>    	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
>>> -	if (ret)
>>> +	if (ret) {
>>> +		arm_smmu_icc_disable(smmu);
>>>    		return ret;
>>> +	}
>>>    	arm_smmu_device_reset(smmu);
>>> @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>>    	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>>    	clk_bulk_disable(smmu->num_clks, smmu->clks);
>>> +	arm_smmu_icc_disable(smmu);
>>>    	return 0;
>>>    }
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/bits.h>
>>>    #include <linux/clk.h>
>>>    #include <linux/device.h>
>>> +#include <linux/interconnect.h>
>>>    #include <linux/io-64-nonatomic-hi-lo.h>
>>>    #include <linux/io-pgtable.h>
>>>    #include <linux/iommu.h>
>>> @@ -335,6 +336,7 @@ struct arm_smmu_device {
>>>    	int				num_clks;
>>>    	unsigned int			*irqs;
>>>    	struct clk_bulk_data		*clks;
>>> +	struct icc_path			*icc_path;
>>>    	spinlock_t			global_sync_lock;
>>>
>>
>> Any feedback or concerns on the interconnect voting approach proposed here?
>>
>> This helps to address the kernel panic issue [1] reported for one of
>> Qualcomm platforms.
> 
> Please respond or tend the issues, pointed out by Sashiko.
> 

Sure, I have addressed and replied to the Sashiko warnings on v1,
I'll check on the fresh warnings on V2 along with your suggestions on 
this patch.
< I was wondering if it's needed to respond to Sashiko comments earlier 
or silently address the relevant ones,
so thanks for confirming this as well :) >

Thanks,
Bibek

>>
>> [1]: https://github.com/qualcomm-linux/kernel/issues/297
>>
>> Thanks,
>> Bibek
> 

