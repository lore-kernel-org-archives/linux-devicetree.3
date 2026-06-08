Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1610376466
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925420; cv=none; b=AgBnKhgqfX/xl2D9XLF0+0KK2FNLF+339TvjgBaPDcMQLWqt8IUpNNgw9u/1XJ42Djes66PYFCtoDutKm3MQyFVZFOwo18sNMeEAW7K2DlX8fI19ppVLvKwDQ5G7TZTNJExqubLX9UzSbokpmVa6q5ytcBmxTJzJJxotd/zwugI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925420; c=relaxed/simple;
	bh=wU51h2i1j+P7tyeaRqLj4SLZat3sAhChv+NIMaleJU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6AGvmj7i0ZefNImORjTWsv8iwdrnbLigqrgc8V/JfQr3ibC/6OUvKUKn7vU3/s/QRqRLfL+u/rEnDIJ/X5fzrzZ2XKMjkMOkiG6HkC00ZFl+AMbQu1scKaKe1+Rs3Um6WxuyQl3DGoNFpWCDL0kPX/9ck+djQnXUdJhHGLQZPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tu0SSTOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dkb1+eoj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tu0SSTOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dkb1+eoj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR7qZ3789200
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=; b=Tu0SSTOgpab62mLt
	zXHYwS1KMRhkkQcivFAU7zeMEHWG8wEN3pnTkOZf5NOf9a/nZr0jw+0+zS3g3xYR
	B7CQK9r92546i2qalbMEZpXS9V/qvPIgWBpHQdH2FYiga0tmQUnarEjiLj2y7o/e
	le4RQiwFKmZ0Kv0W8V7vJH5lZHrNK4eIi3l9P8qBWgNywdOenY6n5KluNyn5L3im
	1d8/6oPW5SM+mAuIePMOB3wmK/FsmgNKdOydY0OSqtw4Ldpv+X7KmpJs3f6F/4zz
	6k4op9tSj/HEGycK98Y0DZ3Z4ozx/+g17T5gMgJIV5xeT52SMCsCaK/QPGygzzVu
	n9T5qA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv8amc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:30:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso3180492a91.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780925416; x=1781530216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=;
        b=Dkb1+eojjPm8NweGDEPR8d5VFhwQ7SqcqmQA5S/RZlQJDTlA6mL4UrMmKxIv+LI67A
         VLOfkEE98pabi7EhjhUN6ABoNm32eX7QJz3ns886TQqqSi3p6rCaXvZ2Rutn4D7YjVUV
         4hs1qHIUPDUqY5n6gZWnrVKYMSUY0mn2lpydqdCVJr0ICKz8ky4D7NDkh6TSPCqtR9UR
         fZBvgspdisFD+vB5RSoUG1SNlmJ+PfJjC35V2NDi7uarD3hMX31K30oYETyqtoR6Npns
         ai8C5ewz6HF5RY6PYrBtvoSv58esvFpctkBBFWjsbAVfzCBV/zGsVvwTYGvfbO83Nw/J
         5Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925416; x=1781530216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=;
        b=VqnjN/8yKsHdgy5kI8qD6B2vpSBlT/KE7Yh4xno+3qcANIkkn1IjK0CnpVBT36dhQo
         wRHEAeZskCcMbgQan3r/imQkMgYhCZyH8EOI3da2rPSeRu68k2mrEm+5S5dGX+5RiMSt
         M0MQKCl6vnHwkkVl43lYTKQ50ArcFVGcY/jeO2dj7RuArp8mWB5ZWhhMj4HBA4l+cWY/
         VbItU98zPzvN2yyHYjk3pIisRCnX5cqnLdV3kB8usZw5N4DSjuzgnHqLeDh9Cotw2ke2
         FHyi7PzZ4Gf/d4Mq+zRdxbJG1yG/hxaCf0bCGI6u6fZVS1Wn8cPOJZlg1G4FKI4kSFCO
         9alg==
X-Forwarded-Encrypted: i=1; AFNElJ+K+uhayJpZAE2QHbplNFGlspXax4u9/I62+YmOwFU9KjgQP87dqtZQMxZQK7uoR44HeXA65maEIVX0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy73rt29Pr8uxaiQ+3MiKZa4vdt8l44DRbcaNIAzhpa1fNTCrec
	keM8x+PiwuxdCe48BVdiiQ6a4XhV41TV45106O6mAApRqaLDyBDXKVhUIe9zUclBfGyMW0sXg7M
	aL6WOFD0lwre/UlLEMZ8WNgFl7MnA6nKcJHTU5lyVSci7UM6hUXs3bExxTwyfkoFS
X-Gm-Gg: Acq92OHIz6f83Wy2t3eAx1cbAU39YCOGHMsh17C+KXFX0g4DoX+FEi7FCwuBSFuUK6l
	ig6Fjq0ElsUqyVa+/VxEI3jijn100t3WNwO26gPK8vVBv7ctj6JE+30h3anNumeZpwnh5TDgSkl
	LP4WVXCY01Zn2nIGkeGxqJG0l3J18OJcVdK4cRtWuIwgmF8KQPsHPnIdVwU1BAjw2wnp9i7V7Fa
	Nb+agT2zU+tyAGhT49yKjzUli9Z34hEQjF8qXw4zda+n1dmj34ey9zzqcBj0ef1FDpf+Z6OFZ/8
	6kBuxf2CFNFlutuhEQIT9of8G9Khn9shKLSzOU1Jh0olAxCnCaWNxrZcPWRev6x0hLX2amXXmh2
	DvS9XebJyxtkYFdIki9HJOvNRGCEm1q9vl5B7LxVYALS9fE/dx5KtRkC1rhuN
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr15489645a91.8.1780925415618;
        Mon, 08 Jun 2026 06:30:15 -0700 (PDT)
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr15489584a91.8.1780925414897;
        Mon, 08 Jun 2026 06:30:14 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm19173198a91.4.2026.06.08.06.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:30:14 -0700 (PDT)
Message-ID: <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 18:59:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KoKVxnemCDndTaxw40W-cfYvWpV2E_-X
X-Proofpoint-ORIG-GUID: KoKVxnemCDndTaxw40W-cfYvWpV2E_-X
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26c3e8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=vPN-sUkGHC-xCyVeAx8A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNyBTYWx0ZWRfX1Y/1WzbCmkkG
 vgQdH70Byf8gEvI/j1T+0z3haP+EqiF3AtIIbzEyOveK4bpmkHi9yb7yckK3s78T6wpCGOT/H7F
 m7eGBSqhlXJjS5RuNARtTCRARjZmhHTLHyUNw52zXxg7NfSF7IubnJKlSYL+Bs4QKIQRehUhwp1
 OpPCDfaVApLaoNKoI2NeTBfy7iL8CMnlCN/lrlcy1gJ5Pc4UcSl/q7JNwzGz5AF0gtAi4ARc2TO
 6ZUbnFexbKn9D1w7XBQJS++NuNzcJt2cXX7E5AmuRyUENMC2YW5b/4Alqon3GCWa94ZEYfE4PsH
 BLrdrmZawnQ4Dbun2dZH2x6Za2UN3BdPOKTW1zGVndzqEgpqodJXhNdtuUKcaABPzysx8yu05xH
 Q2OVh58NtIXkPmU/SAZGCG+IXBVFElPxdS05+V2XxSF5shMkkBQir+vQ/pF0f1e9glRqaslTg5U
 Mt9lOxwAz3+UYlvfPKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080127


...

> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>   2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -53,6 +53,11 @@
>   #define MSI_IOVA_BASE			0x8000000
>   #define MSI_IOVA_LENGTH			0x100000
>   
> +/* Interconnect bandwidth vote values for the SMMU register access path */
> +#define ARM_SMMU_ICC_AVG_BW		0
> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> +
>   static int force_stage;
>   module_param(force_stage, int, S_IRUGO);
>   MODULE_PARM_DESC(force_stage,
> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>   	}
>   }
>   
> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> +{
> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> +	if (IS_ERR(smmu->icc_path)) {
> +		int err = PTR_ERR(smmu->icc_path);
> +
> +		if (err == -ENODEV) {
> +			smmu->icc_path = NULL;
> +			return 0;
> +		}
> +		return dev_err_probe(smmu->dev, err,
> +				     "failed to get interconnect path\n");
> +	}
> +	return 0;
> +}
> +
> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)
> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> +}
> +
> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)
> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> +}
> +
>   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>   {
>   	/*
> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	if (err)
>   		return err;
>   
> +	/*
> +	 * Acquire and vote the interconnect path before accessing any SMMU
> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
> +	 */
> +	err = arm_smmu_icc_get(smmu);
> +	if (err) {
> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> +		return err;
> +	}
> +	arm_smmu_icc_enable(smmu);
> +
>   	err = arm_smmu_device_cfg_probe(smmu);
>   	if (err)
>   		return err;
> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>   
>   	if (pm_runtime_enabled(smmu->dev))
>   		pm_runtime_force_suspend(smmu->dev);
> -	else
> +	else {
>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
> +		arm_smmu_icc_disable(smmu);
> +	}
>   
>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>   }
> @@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>   	int ret;
>   
> +	arm_smmu_icc_enable(smmu);
> +
>   	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
> -	if (ret)
> +	if (ret) {
> +		arm_smmu_icc_disable(smmu);
>   		return ret;
> +	}
>   
>   	arm_smmu_device_reset(smmu);
>   
> @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>   
>   	clk_bulk_disable(smmu->num_clks, smmu->clks);
> +	arm_smmu_icc_disable(smmu);
>   
>   	return 0;
>   }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -15,6 +15,7 @@
>   #include <linux/bits.h>
>   #include <linux/clk.h>
>   #include <linux/device.h>
> +#include <linux/interconnect.h>
>   #include <linux/io-64-nonatomic-hi-lo.h>
>   #include <linux/io-pgtable.h>
>   #include <linux/iommu.h>
> @@ -335,6 +336,7 @@ struct arm_smmu_device {
>   	int				num_clks;
>   	unsigned int			*irqs;
>   	struct clk_bulk_data		*clks;
> +	struct icc_path			*icc_path;
>   
>   	spinlock_t			global_sync_lock;
>   
> 

Any feedback or concerns on the interconnect voting approach proposed here?

This helps to address the kernel panic issue [1] reported for one of 
Qualcomm platforms.

[1]: https://github.com/qualcomm-linux/kernel/issues/297

Thanks,
Bibek
