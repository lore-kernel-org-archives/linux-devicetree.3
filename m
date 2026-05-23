Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C92DF13E
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779547283; cv=none; b=V9hfZmfM9y6OGH2SfMyrOeUyrng9QDpAdwGUv1XfGe2EHf0Q2EllBhYDntUjefdOcgtej/w0jhjgwOvbv4knzmOdD/G8wEWy7/V4hcjhDRou38oedk9yj2TV6+1ShRHKQHkyeiHw/XMOsyDA4L6KSKPBURXZdzccgYUKuv79TY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779547283; c=relaxed/simple;
	bh=+BkeoBaipQBBJt0lJ/JSFDjPNnCrS3L369h22Ot3r6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmFwtw9Iks29ZpuxRCQv7RT+qLtGRDcAkUFnvRz4uGNF1k9+FVkmTEuE7U+C88/9RQJbnXfQK5AOF0CsNWALsMBmqealTO0KlcEmeL+QIAyNaHD1iX9xY+vtWht1FT1TPaZXKECN59YscKNgv0VntXd4+lJlzVqLJkomxV2FWgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lS33Uu+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ap4xW/LH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lS33Uu+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ap4xW/LH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N7seL11280623
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 14:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnO/sXJdMaQSW5DY5kS69t8JL5v3+00rHQWHLmqTJoE=; b=lS33Uu+ENsVwRNYM
	HKrwa6Zvau5jrFUjwIACV7fSrHWnqEwLvrakANH8LAW14gJXIRWn8VGiIGaHvKyM
	bbi1khbb5lUkoT5AvSMwMtvbvjJ+jc7lGasqt6sMNopyGHd5LjG/Cde+Yn/n8liB
	Xjj0Gb9K77pwdWVsLjcWYgo/ZigQ8a5szXea4SVg4LyHQB4dmuosbDwqcVr0hQi2
	VQEO8QpV5CA9u3MDsI4Mj8p3P8nNHwhCQji5taOk4+1sOgIafwYRHfhR9wTOeNnB
	oMRo+Q3nvLGuxyZrw/uTvMzwWNMsniyP6NjCV1TPWIfPZXFGDIBvpUPKnNxHOs/V
	5d+SaQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w0pmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 14:41:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c828ab3b033so11117080a12.3
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 07:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779547280; x=1780152080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnO/sXJdMaQSW5DY5kS69t8JL5v3+00rHQWHLmqTJoE=;
        b=Ap4xW/LHSr1V43vCNGlpXEGgwkKxzV7OdDUFRPn5vRhgrZfPOiNcV80MjpNPPu0BXT
         6SVS97ARyKSkqAt3s0bpjG5I2lbN7S4OwNIfXaWqmEAIgO2c2GHMXuK3JD4bSlIBpin+
         aQdqXEgqRtj6ZSQmfV4cS+kzci8vsSv+MKAsAL2wFYy8SpLBd/l5Yn6Cv0OWQlraIFOs
         wp8sIRpldt6od/7Lmqsm3XAXZPWgnNSQ9a5Ck2us7F1EWaU0fF7UUHsyGsI5sX8fA6Ze
         ncZVts/09dgllwk02Xvmah90p2Bk6cK47PD6xVouTu0M2jiUbHHFyE3aGRY+cxki6Z3U
         wguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779547280; x=1780152080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnO/sXJdMaQSW5DY5kS69t8JL5v3+00rHQWHLmqTJoE=;
        b=dPdXhz3xFMFGWnlrazH8EIhISjTdUT9QL+K23jIhQxOgvhmZ6zyL509ENSR75G8Mb7
         cd5Kpamll2mn4fFik3jUgMzzM5g6cz98dyxgqxEGZojUgiD+MTyv1FubEf2FT7fr2rFS
         YzZJj77xEMaM/zOVFTiKQK5QL9BLwBsjmBqPGUINtG+HklJ6D+/xeoYufFj8fy+WW4QU
         LUiR3EVlNk5r/l+e+A8hdRFTFCjYSukVu49lHcTv/e6NePQbPrOMmRgzPhID6dy62xf8
         Wxi1GivHAz4BrP6h0PTCDfS28yLt+aJ58uSgtVbt62wrSuQJwW7NUzUaGlvf1tPmGPqY
         f99Q==
X-Forwarded-Encrypted: i=1; AFNElJ9LgO3FKJBJbrx7dad/NBzkzoecZnC/CZo+86gqxmxKiDkeUGOVss1pyPqykqtxFEsxN7slR6nCtbbE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxon4oJx/tXBqlxlbiVh82Jk1CIM/ZM2foP5AezxQD5sWjxiVpD
	DAjHt/FEOZiTuPN5i7YGDQD9SXlSxytMM9cdYDShM5m/nQX7oi609OYj/439xln8xwNch967vyf
	rTwEhxKYXuHB68cG3LnMN4ox9X0rB2va1KZTX6cCV1om2nfPGoIO7N7HBw21QgnoR
X-Gm-Gg: Acq92OGTrYlWsaWLQfETwhicKqnd+WyGALPn+XFs5d1LVU/FvGfjanOIJ2FQMbRxZzK
	GW/aV/DJxzIdAZb7mimQY6qR3+xElYrBs43Wqw09u/8pXX5UR3IjrGhJ9zBs+NwpMm/OedABdB/
	qibledU8tQs2olOe1XljbDIFGK/zwEikLodlBpn9Rk70d9I+Nlevu/9DTK+iHI3X0bhhVo6ght3
	kWGuaHAI9xeqdNGbiTJPb5+s3NQMKFyRExg/t3WJPDR/bZ64f8DuFrewRq+z0e0lYsoZVxDG1EF
	FV9qpbBfAUY/JoL/azkZPzBRwK7OwZwxc4WEQBnhTFN0RNPZMeaM808iXjVVBJp9CcT4mMz1yZK
	POKSBM937tFTLVaAdkn85XTZF0or2Adimzd/mMqG4N0bhviTL
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr8015921b3a.21.1779547280488;
        Sat, 23 May 2026 07:41:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr8015902b3a.21.1779547279948;
        Sat, 23 May 2026 07:41:19 -0700 (PDT)
Received: from [10.219.56.98] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af0506sm4845416b3a.16.2026.05.23.07.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 07:41:19 -0700 (PDT)
Message-ID: <72a2dc38-bfaa-4027-9871-0fb387242de2@oss.qualcomm.com>
Date: Sat, 23 May 2026 20:11:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260516-smmu_interconnect_addition-v1-2-f889d933f5c1@oss.qualcomm.com>
 <20260516130251.DED6AC2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20260516130251.DED6AC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a11bc91 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SlpPlKqkm7dTB969m5wA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDE1MCBTYWx0ZWRfXwS0Agayb7ynp
 GAuuCKY0b6OVQu4AQNbhHJ0Jv/40scvLoYLlaCKnr4+M/hIxK2puQHxEmd8MdGO64kYbVuh3thv
 Q4u6Dc891vPq7Iz1J5cVGxIfbEwWyfWX/Xo2w5uT9BXlbnaP+wphUctbrsPplxnFCyzM0/Z7A2Q
 12R4awoXZfpXa+wzSJTyV9/BLoW43nWaljHHp8rYzExHRMoDXZGk3ofvj4TzaXXXjyOElLuXu0X
 1CgWvD2iEbgJgnTCCepLQWqZwJ5hU+nNfKivqMj6wvG/4SfQB2gRg+lN0Oe/esW+GfSTT37uho3
 jBHMUkj3RGG3qyE2HRde57afnRxs7xPEefkM8ZFhmx9E9cWHMD125KJdSsehWMHInSKR8zPo8UI
 9W9X5GdPDiAkZFqGi1sjfhauer9YvKQsK2tF8ViGzlHUwvBSUKIQgGXYYPziY4NEjdNaD/MA6qQ
 nlywt75iz6DPHZXMeqw==
X-Proofpoint-ORIG-GUID: 6t1Plty4YABB--P0Nyw1sy5E9Hkq0tsU
X-Proofpoint-GUID: 6t1Plty4YABB--P0Nyw1sy5E9Hkq0tsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230150



On 5/16/2026 6:32 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Dead code `-ENODATA` check in `arm_smmu_icc_get()` causes probe failure on platforms without interconnects.
> - [High] Shared IRQ handlers access SMMU hardware registers while the device might be runtime suspended.
> - [Medium] Interconnect bandwidth vote is not released during system shutdown if Runtime PM is disabled.
> --
> 
> commit efe802bf0c93309aa584a5eb41c34c9788a6e837
> Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> iommu/arm-smmu: Add interconnect bandwidth voting support
> 
> This commit adds support for an optional interconnect path to the arm-smmu
> driver. It votes for bandwidth while the SMMU is active to prevent register
> access failures during transitions. The bandwidth vote is enabled during
> probe and runtime resume, and released during runtime suspend and errors.
> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0bd21d206eb3e..aedf5edf8f9b2 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> [ ... ]
>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>   	}
>>   }
>>   
>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>> +{
>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>> +	if (IS_ERR(smmu->icc_path)) {
>> +		int err = PTR_ERR(smmu->icc_path);
>> +
>> +		if (err == -ENODATA) {
> 
> Is this -ENODATA check correct for handling missing interconnects?
> 
> Looking at devm_of_icc_get(), it relies on of_icc_get(), which returns
> -ENOENT when the interconnects DT property is missing, or -ENODEV on ACPI
> platforms where dev->of_node is NULL. It appears it never returns -ENODATA.
> 
> Will this cause the driver to unconditionally call dev_err_probe() and fail
> to probe on all ACPI platforms and DT platforms that do not define
> interconnect properties?
> 

ACK, good catch.
I will fix this in the next revision. Instead of checking for -ENODATA, 
the code should handle -ENODEV to correctly cover the case where the 
interconnect path is not available, and emit a non-fatal warning 
accordingly.

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
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
>> +}
>> +
>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
>> +}
> 
> Should arm_smmu_icc_disable() also be called during system shutdown?
> 
> In arm_smmu_device_shutdown(), if pm_runtime_enabled(smmu->dev) is false,
> the driver manually disables the SMMU clocks via clk_bulk_disable().
> However, a corresponding call to drop the interconnect vote doesn't appear
> to be added to that branch.
> 
> Could this leave the bandwidth vote permanently held at
> ARM_SMMU_ICC_PEAK_BW_HIGH during system halt or kexec?
> 

ACK, adding this in the shutdown path would be safer.
It should also be includes alongside clk_bulk_disable() in the "non-RPM" 
else {} path of arm_smmu_device_shutdown().

> [ ... ]
>> @@ -2308,6 +2358,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>   
>>   	clk_bulk_disable(smmu->num_clks, smmu->clks);
>> +	arm_smmu_icc_disable(smmu);
>>   
>>   	return 0;
>>   }
> 
> With the clocks disabled and the interconnect vote dropped here, is there a
> risk of a bus hang if a shared IRQ fires while the device is suspended?
> 
> The driver registers its global_fault and context_fault handlers as
> IRQF_SHARED. If another device on the same IRQ line triggers an interrupt
> while the SMMU is in RPM_SUSPENDED, the handler might attempt to read
> hardware registers (such as calling arm_smmu_gr0_read()) while the SMMU is
> powered down without an active clock or interconnect vote.
> 
> Should the interrupt handlers use pm_runtime_get_if_active() before
> accessing registers, and should this suspend callback use synchronize_irq()?
> 

Seems like this issue predates the interconnect voting patch and is not 
introduced by this series.

The clk_bulk_disable() call in arm_smmu_runtime_suspend() was already 
present prior to this change. Introducing arm_smmu_icc_disable() does 
not alter the risk of the race condition mentioned above.

So as per my understanding this comment can be ignored for the series,
Will raise a separate patch with the proposed fix on this suspected race 
condition.

Thanks & regards,
Bibek
