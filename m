Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49CF3B776A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359659; cv=none; b=gSHvUOKXsktrYcXtFEAQhZ5E4el8PjCeWiYqhAlQ/5bsL4VzjeSRgRpescfmGuydWT55rbOb4jlfy2VCHTAvlD5+ZiT9TV3TqalW6HfXb0t6kKbTgJZmv9VmwwLV7e2XsU1/aE8W4Igkxg8nB0Agr0Uh+SDVLfmCe8GP0z5KukU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359659; c=relaxed/simple;
	bh=OvFx/BHGByNlAvrPh8fCXX9atTRj8VFlDgNhze5sYFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4vBlqWHIh/CnJUY/tAmxjNnDtYa0IHwz/OBqqkMETrZvWh0CLJ2+SwNIfdV54J1RS7KvdFu83YvMxcSVG0PMKVJxXAO+Gdu91V15kt+YaACGFfFrjVW89hNs7FgN7wygakO/aYgfpkPxJ0S3yrmZ1RDddNy9sjJvLRABHj/nGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJA8k54f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxNpl3IL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJA8k54f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxNpl3IL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFJZF982778
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 17:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0/FW7h8IeS6yPhuHUmuiZkT7
	rFpwulK/foFKldJ+TkE=; b=AJA8k54f42eEHtLlS9U0tCuyF/lDpgaSm+Ph4dmL
	Y2+d16UStpZXeA6xw+t04DTWYM1lPGWJS1vh32jfCSssCaWqILlhyoyoZZab5r41
	xETAO87nna0gkmQq+4267kO+4tA3scnBM3oLyAk90E6a3eEtslEWIKmtJLpTbu0b
	+vE1FPNjA6M30cDXwr3mud4Ka3zuTTqlAIIATG/FuWsUA/W0woPzhYIWat2oeiEf
	D/ttXsQMlP+OCX4GlkK2qcJD3UDGAasvlS4h/azxnaVUcIkWuvZZRhnG/aDR1z59
	m8IHLwrFWnx382/z2E38jDHAd5khSFiE6BeDiKkxp9SQzA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpj7pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 17:40:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a787be4ee9so5015744e0c.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359656; x=1783964456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/FW7h8IeS6yPhuHUmuiZkT7rFpwulK/foFKldJ+TkE=;
        b=BxNpl3ILBR4sxKB6QcFRvsk85VNWjZveWG1wO+8PxZwpnvrAWFvnT1OO2RUZte3ZuP
         hh/IJGz9EbaGMWeCfowmeklY10z1PP2z6+Mz/toi3g2OSYFrjAFB8XivDbq8fp555Gz0
         oBrnPLHl2X/oOuOVlQm8OrB2RjZDxeuo7mu/fuuRbR8V8PkQx+kbNAql6ySvIzOZ+eab
         +l4hNUhc7u2VWf5q+6kYAyjjcoM8amh9ToOI0E7StEh26ZCCYtqBCTuGeNcPhO0CHM44
         jQymxFhsKC/v82s6xkFSLW5BZL36VjW3t9jljALO0ExUDe7a7PNPNdFGfqspg9ljPeVN
         y3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359656; x=1783964456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/FW7h8IeS6yPhuHUmuiZkT7rFpwulK/foFKldJ+TkE=;
        b=e8np9yeB1LO+b5HN1JyNZe41dBDzRhMLt6Z5njzNjIDE5a5U9/jycpflSnNpi0YTbi
         uIVy5k5aHRKpAw4EQMT9EJmoluFKIBeT6dC6jlvPm0B5WjxYb8C6R1YeEWWVnEhLZ8dZ
         ziszlXbLl1X8RJeeLUmbrNlnL2t0gfu0sJmZ+A9rzpcgfS8YzhcMNlNQU1p61jpRizRS
         XPD5ug0i5qf1iJ453FhyNjEBMsAlLTsQ+CLz0XQRGARjuppmESIbzpr/0SkYeWOAzkUF
         gMiEH97JZvmm7gxIrMv1RlulhksDaP5eChWtSPD2Bv+KOvyYTb9Nc+O0JP6NX8Yn02oa
         5vfw==
X-Forwarded-Encrypted: i=1; AHgh+RqZqyuyc8wPTr3mmNTcM+1014Gnqu70VaG8BZYIfUA0kzIJ8SIEE/iyMqOzrjNo/kxEqM+rXmdub7hp@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVOQC2jPtEiTl5OD+V7i7Xz5VvJSH8EOhB5Z4MpJj9TsiUGRG
	CaNgXjXTvmd9/421paO1wiRdATFzA7NTbnpz3DU5QCBIhcCFxElUL16aZ7vsiMvyT3/+FyRKD0B
	o2QN0TZGDHt03XAV41sWGviIXqFDwgFt9psGS3EixxLHK9eAt2Ojer1RNwyW9vLpN
X-Gm-Gg: AfdE7cl6dgQqMcgPIhHKlCBup1iokWghy41xRKbjYZGJ4Nblj0LCZ2gxocb6w4aFFcK
	sCqFzUu9td9R4QtZ9wOQunZxzSAYeOMn30ioSkHGZL9GZpk7RxV+X4DCH1wuD+MIbTZOe8t3a4z
	zFs33kRkSKBtC8GAiGdtFBNuwJm+GN+k1AHMy7n2BROPOXJfiRScrZSWKnG7uYpBbU8GoJqeSPf
	nrcohyYJjblUw3k8RaS7QDWLfRd277qeP2+1vjFlOJh58ZV+5kWcupVXAv7dSa3+C+EHkgv1/B7
	+EUNZlwFbwsNbnVOf9yOqYz4/qRsDFVCChMqQTMLgT/M8F447Sth3bu7zpmD/bQBchsf7c/8AKr
	TfWyPkyY4LmdFMCEshW4AcILVXkWH+Ph4Z8SkWi5ZsywutrlA6QZF4MNtvIqjBZg6ZnQEQiN7d3
	GyYW3YyTf4DVMxsjWtnjvPzpME
X-Received: by 2002:a05:6122:a0c:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5be90860c25mr995161e0c.11.1783359655788;
        Mon, 06 Jul 2026 10:40:55 -0700 (PDT)
X-Received: by 2002:a05:6122:a0c:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5be90860c25mr995141e0c.11.1783359655331;
        Mon, 06 Jul 2026 10:40:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1383a29sm3034362e87.36.2026.07.06.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:40:54 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:40:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <lltyynsswbeqdgpl4bqbil5ohgs6v25pvd5cqfuh36nrzgwv7o@u54exappwjes>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4be8a8 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=y9Wl6y6DRnsaoLG14jUA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: XmoUh6MMf0BU2OSWWtGGcL0CwGzGI8s8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX72XBsbUjZ3+b
 2miURFanzZx+M1tBlMZwSmwGo9k2SYxF5LVY/plBFEZyx5ZLM60VGGiNYz/yDEMX9G5p4xRdnUc
 shzwjMbBHKGn0gwuUeyOiBBVFea1BNOeaB8RCCLKK8hzkvhLUzTRhtHa9cb6FgAakDJuVv5PCDR
 477+0ieso6rDK9r40wBu7OtflN91+ovKEIwYHeS6nvEQUqAfNnkkt8oAguEidA8BnkNumT9WDNi
 A/wQ+UVd1XA5h5wqpdP5nP90h6QVZK9LBzoQnDLJo+D5CYbBhZJi0pRx9RQG4q0zfXslQIylqiH
 H3rmX6Ew22IrSKYijFNv6B/6q0LwbEfGlxywelA8UHJ0/WEeLNHhHQ4GQeGy+3+JYu22ILmUOVq
 de2BmeL/U8ZpRP+FrWomc6CPg4BLSPRCqtoAD31HxMf3ij8akN9WxAtlYnQyYpX/m2F2pZ1wdYV
 tELY24FvmQu1213Pn8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX5kVvg3AKsUh7
 AgMI5HYbWN0s7gum2w60iprkpwToAV+w7ysPl6tRIYln7BiUUxT+vmjSGp4xraErrCK9hTGqsUE
 47OzXPYNCgTYxLUExoPGNceT9txepIo=
X-Proofpoint-GUID: XmoUh6MMf0BU2OSWWtGGcL0CwGzGI8s8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060178

On Mon, Jul 06, 2026 at 10:26:35PM +0530, Bibek Kumar Patro wrote:
> On some SoCs the SMMU registers require an active interconnect
> bandwidth vote to be accessible. While other clients typically
> satisfy this requirement implicitly, certain corner cases (e.g.
> during sleep/wakeup transitions) can leave the SMMU without a
> vote, causing intermittent register access failures.
> 
> Add support for an optional interconnect path to the arm-smmu
> driver and vote for bandwidth while the SMMU is active. The path
> is acquired from DT if present and ignored otherwise.
> 
> The bandwidth vote is enabled before accessing SMMU registers
> during probe and runtime resume, and released during runtime
> suspend and on error paths.
> 
> Generally, from an architectural perspective, GEM_NOC and DDR are
> expected to have an active vote whenever the adreno_smmu block is
> powered on. In most common use cases, this requirement is implicitly
> satisfied because other GPU-related clients (for example, the GMU
> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> 
> However, there are certain corner cases, such as during sleep/wakeup
> transitions, where the GEM_NOC vote can be removed before adreno_smmu
> is powered down. If adreno_smmu is then accessed while the interconnect
> vote is missing, it can lead to the observed failures. Because of the
> precise ordering involved, this scenario is difficult to reproduce
> consistently.
> (also GDSC is involved in adreno usecases can have an independent vote)
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  3 ++
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 27 +++++++++++++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  4 files changed, 84 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index e2c914fccd6f..5133d3ab023a 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -6,6 +6,7 @@
>  #include <linux/acpi.h>
>  #include <linux/adreno-smmu-priv.h>
>  #include <linux/delay.h>
> +#include <linux/interconnect.h>
>  #include <linux/of_device.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/platform_device.h>
> @@ -607,6 +608,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>  	return ret;
>  }
>  
> +static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
> +	int err;
> +
> +	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> +	if (!IS_ERR(qsmmu->icc_path))
> +		return 0;
> +
> +	err = PTR_ERR(qsmmu->icc_path);
> +
> +	if (err == -ENODEV) {
> +		qsmmu->icc_path = NULL;
> +		return 0;
> +	}
> +	return dev_err_probe(smmu->dev, err,
> +			     "failed to get interconnect path\n");
> +}
> +
> +static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
> +	int ret;
> +
> +	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
> +	WARN_ON_ONCE(ret);
> +	return ret;
> +}
> +
> +static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
> +	int ret;
> +
> +	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
> +	WARN_ON_ONCE(ret);
> +	return ret;
> +}
> +
>  static const struct arm_smmu_impl qcom_smmu_v2_impl = {
>  	.init_context = qcom_smmu_init_context,
>  	.cfg_probe = qcom_smmu_cfg_probe,
> @@ -648,6 +688,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>  	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>  	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>  	.tlb_sync = qcom_smmu_tlb_sync,
> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>  	.context_fault_needs_threaded_irq = true,
>  };
>  
> @@ -658,6 +700,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
>  	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>  	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>  	.tlb_sync = qcom_smmu_tlb_sync,
> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>  	.context_fault_needs_threaded_irq = true,
>  };
>  
> @@ -667,11 +711,14 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>  	const struct device_node *np = smmu->dev->of_node;
>  	const struct arm_smmu_impl *impl;
>  	struct qcom_smmu *qsmmu;
> +	bool is_adreno_smmu;
> +	int ret;
>  
>  	if (!data)
>  		return ERR_PTR(-EINVAL);
>  
> -	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
> +	is_adreno_smmu = np && of_device_is_compatible(np, "qcom,adreno-smmu");
> +	if (is_adreno_smmu)
>  		impl = data->adreno_impl;
>  	else
>  		impl = data->impl;
> @@ -691,6 +738,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>  	qsmmu->smmu.impl = impl;
>  	qsmmu->data = data;
>  
> +	if (is_adreno_smmu) {
> +		ret = qcom_adreno_smmu_icc_init(&qsmmu->smmu);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}

Move this to a runtime hook to be declared in *data.

> +
>  	return &qsmmu->smmu;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> index 8addd453f5f1..6835b40339ce 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -6,12 +6,15 @@
>  #ifndef _ARM_SMMU_QCOM_H
>  #define _ARM_SMMU_QCOM_H
>  
> +#include <linux/interconnect.h>

Not necessary here. Just forward-declare the struct.

> +
>  struct qcom_smmu {
>  	struct arm_smmu_device smmu;
>  	const struct qcom_smmu_match_data *data;
>  	bool bypass_quirk;
>  	u8 bypass_cbndx;
>  	u32 stall_enabled;
> +	struct icc_path *icc_path;
>  };
>  
>  enum qcom_smmu_impl_reg_offset {
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3..a27804e15738 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2189,6 +2189,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> +	if (smmu->impl && smmu->impl->runtime_resume) {
> +		err = smmu->impl->runtime_resume(smmu);
> +		if (err) {
> +			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> +			return err;
> +		}
> +	}
> +
>  	err = arm_smmu_device_cfg_probe(smmu);
>  	if (err)
>  		return err;
> @@ -2273,8 +2281,11 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>  
>  	if (pm_runtime_enabled(smmu->dev))
>  		pm_runtime_force_suspend(smmu->dev);
> -	else
> +	else {
>  		clk_bulk_disable(smmu->num_clks, smmu->clks);
> +		if (smmu->impl && smmu->impl->runtime_suspend)
> +			smmu->impl->runtime_suspend(smmu);
> +	}
>  
>  	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>  }
> @@ -2294,9 +2305,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (smmu->impl && smmu->impl->runtime_resume) {
> +		ret = smmu->impl->runtime_resume(smmu);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
> -	if (ret)
> +	if (ret) {
> +		if (smmu->impl && smmu->impl->runtime_suspend)
> +			smmu->impl->runtime_suspend(smmu);
>  		return ret;
> +	}
>  
>  	arm_smmu_device_reset(smmu);
>  
> @@ -2309,6 +2329,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>  
>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
>  
> +	if (smmu->impl && smmu->impl->runtime_suspend)
> +		return smmu->impl->runtime_suspend(smmu);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 26d2e33cd328..ed08f86cf99d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -455,6 +455,8 @@ struct arm_smmu_impl {
>  	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>  	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
>  	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
> +	int (*runtime_resume)(struct arm_smmu_device *smmu);
> +	int (*runtime_suspend)(struct arm_smmu_device *smmu);
>  };
>  
>  #define INVALID_SMENDX			-1
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
