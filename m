Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6893C196F
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926648; cv=none; b=HLW83qR8Q1vBYJjJDIXFAPE6WHCZyuVDGu9wa1IEKlr8kILmfbnOeBAjisZ1Cao056owU3lhToMnX71CL7YyUfYhbwMnG7Saq5qTO100Q5lC/mUMW1sziW1/us3bq7CvjKV4/QOcxq8HWog1cVOzYkuHNF+obMHuuoaqJml/ys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926648; c=relaxed/simple;
	bh=GQZZ6qdQz5fA+bwrpkuSQu6zpYvLdcO3MGlrQ5xFR78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dozdRJeo6OZ9c48QFFoGZj1VrhGdnR8iaXox9VxpayF0yjIlaliClBkmWSu1gMgaY6wooHV72neOP4kQlmZNff1gM64RZz1t1vZhPdly72Q3tzZyTrG2z605/N3yzusgGICrmjh41Bs5VLqTlBKIblX8Mpgt6N4wY2aeVVG740U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2qhAemj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUZ9w04z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2qhAemj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUZ9w04z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRBOO3721236
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cNnrFzM56GPx5J4+UEj8Qmmk
	dW/VSFOOyJZ8mOuFa/A=; b=i2qhAemjb10Ek3piQZv/D7JanNvtT9Y0eVk/grdV
	mi+rXCZcEZkSCtzhsFjeJ96cXCIIYR4b0rsP4pP+e8tqD9h1mSVli5DiRBrjLkly
	DAF8g9AyVWvSWDs46Ema/G8l9dI8ZZA+VQkFlSw//hJTG5mXHLRSuw2sVs55Ar27
	LHPTuYgfWUxXc9MMylJfRAjQQetNTIR9em6n1Zlfz+fGZ8P2c+ZRis7wl4PpP423
	6NZPIMKe4q1pMMQ8m23u1ZYTCTU2cQS9aBSMUlZ6AXomUGOEByyBAD83HzBVX0xy
	ETYyG8M7dbvmoYixs4WPBaRfAicH1/r7FP+nRjENsvGWRg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enupth078-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:50:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963b099b539so6447558241.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926643; x=1781531443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNnrFzM56GPx5J4+UEj8QmmkdW/VSFOOyJZ8mOuFa/A=;
        b=YUZ9w04zVDxfA7xxL0ZKFbtM09c9svMu2DaEELAXrSpZF++6WkAmigA4SKqaJKloXx
         PTpSSa+yVWV5Y4W78zkAArWgqsAG98t4YAmpxst8j+xBHaXLpvfBdtJif3aCExjTMTDk
         90Ycj+QHLmHyxdwZOO+vtoYiuANjJJ7q+2ArEQ6hnK5iPsrLKNxsyTGVwHrSVu6yZDb+
         xebR7ACD5jjrW8JaK6Q8PQosCBuUgAKv3fYcfCAKibAHibiOGhrqapcpxxQRIqf4jpEU
         JbDs9HHyQ0jSHeryYKqa0RFe0aBRjixaviCQjUh0oJrvbvdJ3U6hnAHxisRVM1JJ6gM8
         3K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926643; x=1781531443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNnrFzM56GPx5J4+UEj8QmmkdW/VSFOOyJZ8mOuFa/A=;
        b=QD+Eej9wY3DcqZrazGvo+AzyYh8vBu2gYgDjfo0gCoavfyPQ0JTxzrjPGZQqtWzn69
         1ra2tdQdMTWAp0sjB4Koseru9Fsv+oPcJI9kRdG14qj/9hBDjjcz9P6joooAzMHnEOtk
         o3F15t2o4cVF5bNe+qHHFX/Ext1RQmJm6jZRXGKyhfhTRLOh0dFj6EMEqW19zFs/ZqKw
         UXxEI9grFi+Uf2F0pPBNQXcdAzJ2L2eKESTezroR6ymLhIIx2hVVTF3EI/PqN/FJ/FjW
         gQ7hBNCM7L2x6SHCtZesie6kaJ4HymfAB1XC0v7nGVCgjhd63hVNsJTe/yZz4gUQsH/s
         Fi5w==
X-Forwarded-Encrypted: i=1; AFNElJ/CA79lCLbV8HwUTHq0F73vRbedeaTECv71WPKZYxBxD0qzgxBfCD+2y0yam5qy7Y5CsSJCc4bS8il3@vger.kernel.org
X-Gm-Message-State: AOJu0YzYton2OuW1Tovofz52XXRGJmlaaYBa6stxJ0mM1hXo2EfaTSCP
	1X4sNaMpA+mYmF9CBhkK/c+xclWWn2Z2z/5075P5zquWiwpnoaonS8RLkHe9Zy6qh29uu7MbrTs
	rZv0PxGGzFem+dzHYe4U8gsYf6YUbe1MLIH4wMMuYoU95t4oylA1HQw6hdmHE473w
X-Gm-Gg: Acq92OH86T2rkN8V2+ALTolctnc0zRqT2ECPOCeM1swNZm/+fvv7IKvj3JYzi7h4YvN
	OH2axwBf9hwIt5+x0h/y9uO/8ToSH2wKhDrSJcQ4r6X9flKayvBys436sEopBneNkbYjzQnOquB
	sLBNYednZqfYBBfPk/CbENKakxfzgtIiewu+AD6Fby6ogDgbug0kdKe6/yGkHcuzNuVRnhM07GA
	xrYtK8WefiEYzewIajODedwJqawSRA4ri32lSRLCeuLcih8qXvuB2x4m0dZ8AH0z8yEJfJqwl+E
	W7J1CRnLqKPEOwkNcjOG2ez62J33YLxzxjwqB/uAK31Xw79zJROaSFY19LCH/vFLzZVbig9a9Sn
	UcoU/BUG7dY2SifEnkHFkRhiU+6ctSSRwDJ5M83FkgSde2RYib9mlSrHkOmw0f5WYKm1F0mvumL
	p4o9veZJ6B2ZvxwqoMoXwBr8noUeu4bXAJ24hxfwy39KH1WA==
X-Received: by 2002:a67:fb92:0:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-700392f5baemr3677220137.19.1780926642680;
        Mon, 08 Jun 2026 06:50:42 -0700 (PDT)
X-Received: by 2002:a67:fb92:0:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-700392f5baemr3677206137.19.1780926642269;
        Mon, 08 Jun 2026 06:50:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm3827701e87.30.2026.06.08.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:50:41 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:50:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <bkve3vmokuyrn4agsqyzxlqr5wuy5y6urnliqypac3h6lb32hy@tfkjstevqv2y>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QL3u2y1LoX-BD9JyQhoB0L0Gozmsg6av
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMSBTYWx0ZWRfX2ALP2QNt92rz
 MTzuDkoMXCMAvxNA0i9/rk0fpcVx/qgUPDYtsL9XNwn3RLOw+E/sI0GmsZP8KHHd9TtDoe/EnFy
 WVL4paxLA9I1jpYLNaT4idrV012NuqM8u6zNfEEvMMmPU6P3VNOHODH37483VY67ioYh+5oqIgS
 kgEYfxgKZlVyIthnR+pZsoWWY5wrwJzB59tSUslvm2wivSf2DsL3D08j4ArbVAyJTTUJqdxlhq6
 Vvd3De2e3B5SVw8b+6CEvsbIJlKjsv+J33jHbx63KD+jIuPK9uu/C/QXcJlSL+OVH3Vj07MK+gp
 DufqegAiwUNKozSeHjtEbqYGF1nxfUyX6Uzr6hwK2v3fIUnqMOw3I4asOdGtORLCGfjS98VEldW
 MNE4IWIoTtcrC6GkPYO3nJTMn32LLxJRqtOO3s4+kNVds7foDSHDmpmww+wOthAG6T9h6ke1NFw
 87xOZYtKilBo4WagWow==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26c8b3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=dk3LCUOL6mBsUDzKOqAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: QL3u2y1LoX-BD9JyQhoB0L0Gozmsg6av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080131

On Mon, Jun 08, 2026 at 06:59:34PM +0530, Bibek Kumar Patro wrote:
> 
> ...
> 
> > ---
> >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
> >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> >   2 files changed, 57 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -53,6 +53,11 @@
> >   #define MSI_IOVA_BASE			0x8000000
> >   #define MSI_IOVA_LENGTH			0x100000
> > +/* Interconnect bandwidth vote values for the SMMU register access path */
> > +#define ARM_SMMU_ICC_AVG_BW		0
> > +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> > +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> > +
> >   static int force_stage;
> >   module_param(force_stage, int, S_IRUGO);
> >   MODULE_PARM_DESC(force_stage,
> > @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> >   	}
> >   }
> > +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> > +{
> > +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> > +	if (IS_ERR(smmu->icc_path)) {
> > +		int err = PTR_ERR(smmu->icc_path);
> > +
> > +		if (err == -ENODEV) {
> > +			smmu->icc_path = NULL;
> > +			return 0;
> > +		}
> > +		return dev_err_probe(smmu->dev, err,
> > +				     "failed to get interconnect path\n");
> > +	}
> > +	return 0;
> > +}
> > +
> > +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
> > +{
> > +	if (smmu->icc_path)
> > +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> > +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> > +}
> > +
> > +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
> > +{
> > +	if (smmu->icc_path)
> > +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> > +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> > +}
> > +
> >   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
> >   {
> >   	/*
> > @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
> >   	if (err)
> >   		return err;
> > +	/*
> > +	 * Acquire and vote the interconnect path before accessing any SMMU
> > +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
> > +	 */
> > +	err = arm_smmu_icc_get(smmu);
> > +	if (err) {
> > +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> > +		return err;
> > +	}
> > +	arm_smmu_icc_enable(smmu);
> > +
> >   	err = arm_smmu_device_cfg_probe(smmu);
> >   	if (err)
> >   		return err;
> > @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
> >   	if (pm_runtime_enabled(smmu->dev))
> >   		pm_runtime_force_suspend(smmu->dev);
> > -	else
> > +	else {
> >   		clk_bulk_disable(smmu->num_clks, smmu->clks);
> > +		arm_smmu_icc_disable(smmu);
> > +	}
> >   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
> >   }
> > @@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
> >   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> >   	int ret;
> > +	arm_smmu_icc_enable(smmu);
> > +
> >   	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
> > -	if (ret)
> > +	if (ret) {
> > +		arm_smmu_icc_disable(smmu);
> >   		return ret;
> > +	}
> >   	arm_smmu_device_reset(smmu);
> > @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
> >   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> >   	clk_bulk_disable(smmu->num_clks, smmu->clks);
> > +	arm_smmu_icc_disable(smmu);
> >   	return 0;
> >   }
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -15,6 +15,7 @@
> >   #include <linux/bits.h>
> >   #include <linux/clk.h>
> >   #include <linux/device.h>
> > +#include <linux/interconnect.h>
> >   #include <linux/io-64-nonatomic-hi-lo.h>
> >   #include <linux/io-pgtable.h>
> >   #include <linux/iommu.h>
> > @@ -335,6 +336,7 @@ struct arm_smmu_device {
> >   	int				num_clks;
> >   	unsigned int			*irqs;
> >   	struct clk_bulk_data		*clks;
> > +	struct icc_path			*icc_path;
> >   	spinlock_t			global_sync_lock;
> > 
> 
> Any feedback or concerns on the interconnect voting approach proposed here?
> 
> This helps to address the kernel panic issue [1] reported for one of
> Qualcomm platforms.

Please respond or tend the issues, pointed out by Sashiko.

> 
> [1]: https://github.com/qualcomm-linux/kernel/issues/297
> 
> Thanks,
> Bibek

-- 
With best wishes
Dmitry
