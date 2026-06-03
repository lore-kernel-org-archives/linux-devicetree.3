Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3774D2ED9
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 23:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528288; cv=none; b=IE+FaW9gCVMqBSj8sQxuwG6Lzl9EjpZHbjFV6o6mbEONMc+2AtQPDRLAEgCNB5mmQ8pI36vk4BMiOuTFQXsXtdHWCXKvdylUWZsdaV3DQQ6Gy16wFqfmkSfg8fdnStuHeeUY40x+gaKViYw4WvS1VCvce2XD3PwUFAtSyaXp5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528288; c=relaxed/simple;
	bh=x4N9gnbtGQ2OElE49epNC6CC8hqDLA7TD/8NDJGc9v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwU8akr1YWOtQpjXIzqoZPwA1JMEG7gs/i/noZg3+OXpeNZ2WP2/axf2+1+6rHIdDJC/fFmxYr4ZZdbDcsK+Qkd9kn2YWQPVuTulBNfsdEqXFMgwJ9Z+dgIqhgrR/2R7JZYlqro14/bQttwFhVsAyKa1vr5CGgJ0KV6acB0cfjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQlAGpWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACMoN1da; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQlAGpWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACMoN1da"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JZ3Sa1039413
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 23:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=; b=PQlAGpWCLoN9iNoO
	/tfLoUmkZP92NidY3Epvt1h04Dvf+S+D9/JqS9E+BgigNus5m3iTZRdZQoI9g1X5
	MiIIC6fbQukvuITzn2r774+rb7L0bAxiA5C+0xZIZjrDrLE3KVI/2XIeDjjPu7s3
	CpZ1xetfksToCsKc4BVbm5gOaDxHjaKJeAPDRbIrhvea/seavCzRr/a9KBn8YjAO
	SzfAoM4kyftsO5bKY3C4nkD2QxtEZcLFYvSJQSz38ix+nmJysZimjp0vFyabYdz0
	3CBHYcgCy84ChAu7d9lst28zXiCUEvnHmdoXo0l4FJr3PND+0MdelNMPdIn/T6Us
	YOQHNA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8gpk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:11:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751c50552dso53787137.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 16:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528285; x=1781133085; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=;
        b=ACMoN1dae1MNVgT4tnsDp7rmhJU1fgBWwMtctMIRoxhnP/zlPgNNHJOtXvk4AHkQPJ
         RlVapJFbQspEOtx2NlRYFTAW7ElyRTaiXbplUswLhWi7yQ0ahLl1FIPG/kophydPyYX8
         zpjS3qaCGY3UCGWZyNFonysp671WJm0zHF+1IAZzj5Zjz/G7UCxJ1Qjvnmi+49GyqPfy
         DoLw0V/ZUR8F0F7XcCLWYi2GrHrebMQp5LzohiFee7jsomPeqFzysDa28LkikkXGFsuL
         EGyRmwB8Bjo9x+DJGjQieog8NojTIEaOC2+CIyqsA7K5I4CdhELYWDcBp6Tk1mzY4MYW
         v38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528285; x=1781133085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=;
        b=DfShrEvorcbkWL2ak1mcmzw37hAsBVqd+8ldkj1+AzQFXr1029ggdhJXMF0PjWnYQ9
         FmXe/ib6fTATUBbMU5+a/1qkGGaFs39pzUyD3gSYOQMNirlmjpG1TB+VXSnDZF5DU9SA
         q4YRFABKyVWqCy1013zzvKIRefN6P3FO3z9O1Uf94PN3HLG7UN6El0ZMIlkNwqNyYadz
         n59sJJV9fx7Iq+IkrZYvJVpy6Joz3ptbM2nBUOp1IBudfIataWSVqu1g8DbfqWWFWvXL
         k0se2WzohMFKgzrvBh3UDLa3DvRujBipVidQtz87E0X2QBdWO0AsU7oXZCKkGRckEq2o
         Nj8A==
X-Forwarded-Encrypted: i=1; AFNElJ+JP1jnmVE+Lm0c/lSB0Jq+EaluFKNdD+b1nH3luwiCFyzoOIPm78dz/F4lVEjrCUok0kNMdFTkn3qh@vger.kernel.org
X-Gm-Message-State: AOJu0YzVOOkRcA9d9ef6Egzd5PuZtGaXTGKe1esDcJNChHstWtEd55bd
	N7P3a8IOvTYm08v6vKJON5KE9PRooB3/evrJWdiUf8A4ar3cjhAot5lkV6xdfIzBXKwW2lv/ZmT
	y9wbyueexj4lpYyTwdpdMEsB2fRrGO2kTgA8D7SqNgzWW5IMvEFcmiazD1kFJgIy7
X-Gm-Gg: Acq92OFHMBgaYIwk4G2SUDZU5mc+mQvhMgZTPJvVabLwWhIFNkz5gIqRuILMEuEEkZa
	kg8LqSjWvdSftGMJAH69iw8p4PFipPgt5c4CzsbyrP15veHdc0l1qCzC0Vn+ne8KZydgaMHsy86
	PmttNwX8HyoDtDUffe/+BYjnNqqLqC1NywJVpHuEZG2EkTaoxxNr0SMQ4975kHIfZ8vHMWN2vK/
	50FeUsEKfhyguqnqYFlKOeuL50J8uGDWylrIamlYfibcQg1xRUgwOp95b4YKsyN7shIv+ze4/Aw
	7r4aWaX3Sdd1WaAFodRt4u3VnJ3S9cJoJ2RgwLOV6HsSu3+iBlvImVTpcI1+Im/BOlLU1h2sRnd
	7xVn2svT1V7NVQeMugfQThYWtKHZMUGCL3R+awwXhfq1rpnRhI15Guz3Q7Oy1sffFSZbnyOIB4Y
	XSiOw3bbODZt2+dXyMhLxwDnyFWUFyRlj8JENld2FxDK0pXw==
X-Received: by 2002:a05:6102:3594:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6ec490c3d34mr2892883137.24.1780528285605;
        Wed, 03 Jun 2026 16:11:25 -0700 (PDT)
X-Received: by 2002:a05:6102:3594:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6ec490c3d34mr2892873137.24.1780528285140;
        Wed, 03 Jun 2026 16:11:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ab61sm888369e87.45.2026.06.03.16.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:11:22 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:11:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm
 SMMU client tables
Message-ID: <sfxhpi5tg5x3mm3twxtafwn4v5tkxeyoyackz4g4agjwhlb7yw@752limezj4m4>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ypvc0N6M-_11HHpkmSdHvv_DActhWxt2
X-Proofpoint-GUID: ypvc0N6M-_11HHpkmSdHvv_DActhWxt2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX4v4dqROGRjrJ
 nkVH3TrD3YmSL8u2BJZEvuUXCHG6JPqvQiK28bWAK9bTr6kOQOC/lndgV6fn7hHnaE2JaiIJX8Z
 rv+BvWeed9rsxOLOiP7bH7tRD2j5n7A7M5KHlyGvbqnPGaDUVZkoHgkObLQJOYVJYhF+6nmmhO9
 Xr5FilDldW2JPIVQfW5BF4ANVIrnsuHyTXlNgvX7KfA5zIZyDn681LTf8qW+wDGfAQdtOgGzMqP
 pDz0RpQjWgHOa65RBV0rDdJN1HszOwxA+UmzViNgqr/XgDNCiZJN78qYIHe9H6rZxq9TxdlmYGP
 Ft8XMMmn7sihrOBFSrY/OPevG/sSd+plUvLuEacGZFnXtPQh9kiKUF+qRhJ9jKh1XsKqtRN9SwW
 p3VfaGShm94SuYhkkmcaeavIrIUIlohP01gjxCF3jQBMJSO4hVbA1R3D02LTEy0YEkAvg+426lz
 cpjfFuqNLLYmIlq4nIQ==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a20b49e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=AKL9z4wCTGGjPT63ffYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030226

On Wed, Jun 03, 2026 at 08:29:30PM +0530, Nabige Aala wrote:
> Register the Shikra MDSS display subsystem in both the SMMU ACTLR
> client table (for TLB prefetch tuning) and the SMMU client match table.
> 
> Shikra MDSS uses qcom,shikra-mdss as its sole compatible string, so
> explicit entries are required — there is no fallback to qcom,qcm2290-mdss
> to fall back on. The prefetch settings mirror qcm2290-mdss
> (PREFETCH_SHALLOW | CPRE | CMTLB) as Shikra shares the same display
> hardware block.
> 
> No entry is needed in qcom_smmu_impl_of_match: Shikra's apps_smmu
> carries qcom,smmu-500 as a fallback and is covered by the catch-all
> entry there.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

NAK, use qcm2290 as a fallback. You won't need this patch.

-- 
With best wishes
Dmitry
