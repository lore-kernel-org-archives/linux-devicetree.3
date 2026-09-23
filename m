Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45F54A5EDD
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165568; cv=none; b=scLT0KswomHnTv5goF4BeiOG/+gQmOHlAWm7Oxvz+3+nDFtdH3wG9OjfIdRwmepFNjqbbuRUGh3C151khcaY01Tq9noSW/968ZWD2YY0NsXzitPHAW3j0sykbrdYpqdlRJWOgmzkD/prfkgpH3MN3F6QFtNHhRvcXNsTSb/GltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165568; c=relaxed/simple;
	bh=0VO+6la6VVXKr2WM+/hRiCJTp8YOwR0hvpsSzIUTMys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o99ceOHK/S0rR22n75XPYMw7O/cBM4M9V6VTFuHfKbq1hDstiVoGHoe1GHpCqs6jlCV7BeIIBnU+DoZtk7tjuqJspPIkOejsWqgL4FONiRHk0E1ZlqvaNs0N9Q9zTlxh6ScdHpXWn2Cw/0pzqFuYbrx2hk/PIlU3Cpk8mrVgmU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkikkWFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UIzFsGTh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkikkWFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UIzFsGTh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUSI3772089
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IWCAXdbt9MLQNW2dNVZ65g2U
	h0XJcuHhkEaIaIxj6KQ=; b=fkikkWFkCfrIuMPYgFh2PBG0gzBE2HOtEcoC+PGJ
	Xz45tVKP/N79jRR1xwzXlaTVy+NjjBRoi6zcCwBya66nbyDkVMwv5SN8+45qUZJN
	1Q+XNHr7fp4qZW1SkUrkLH//xHydwBGioJUfZvfMWi5z+ORSJy8l2o25GfD8rxHJ
	nRFkTwG5NtgqtBEaPiZAleicFL4PcZ6ApOMYnalbs16cQJSTamBJ4pge5iUiSvMd
	ls+Iubb5WH8MjbqIXKLP/XJZSWW2Y7SyhxxDpqYDsFHjQSrDVnr7BVaIaMtUmCW7
	mGNz+gNavws8fXLmW6d68KXgAmsiPT8Ixnzt670lOuU8uw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb60afw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:12:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c93c294214so367980e0c.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165564; x=1790770364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IWCAXdbt9MLQNW2dNVZ65g2Uh0XJcuHhkEaIaIxj6KQ=;
        b=UIzFsGThAP4+KXIYErK6A77XB8fcf45xJ+jjxiRHOBvWdoyDOiAUlJ7HQF2ez6beR7
         s/wWRc1X6LVw0aX+krCPdbgpMjB1lb+tauCMxxeKisA/hSeDm/KTtMR/WBTtae2+sTvj
         FXj9pvduREx/0U3ZFlmIKdKedRBmJn4YQ5jdrZqIXIHS6/0NwPKxjFyoYLPwfVKlXVgH
         ap2c+qMZzHqXmVTJA2bYt3hc426qOY8b+gfXpZjvGGrDUa3uuzRu4CZi4d4IoxLpq0t8
         HFbKFpXqAt9z6cW+bJE+kWAgC2MGYuyU76LPwq2oZGFRgfDoqaZjVq3Tx1B79Y+P1lnA
         jdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165564; x=1790770364;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWCAXdbt9MLQNW2dNVZ65g2Uh0XJcuHhkEaIaIxj6KQ=;
        b=hhmN4R8T2jbxY0bUsgnblsLYzQpmzNe85IroxpfdhUvHi2TZjMXwzR6Mb7ccGtRBbZ
         f33g9aCJx+HU8aKWbRTXu24GkxFYdRxVHIjZouVNNw+NRienOVOoR4GVozHxu+vKBW9j
         ttrUcCXJJ9azp+z4rRiSGOql9zzzZl/UQkq0iobkWTiDQu9rWp7w9oQcgSNn0YbYF2u/
         kHRI/TFtvet/z+Bt2dGAucdTZv3VEdujXn/htdbLFlrIwDi7+I4Lruaip+rQer0WPOqY
         Ik7/LPoRX3/84gq/RnNduQgMyxHJkOHe6qbW2rbZw7wwMqxF3O2YeDDeSRo4JDNvOaaV
         Lk4w==
X-Forwarded-Encrypted: i=1; AKwUvBzOtU3pPwRZPyw6r6s8O7DSV8mpF0X2/LfJf2KBJ1PmVW/k5rhuVhsuMrFggIv5aKFc70p/8NHK5hYY@vger.kernel.org
X-Gm-Message-State: AFuF++mo0Jqehxzq24Wi4WLfAE8zs97xCHSdw9Q+aLMj84er8Q5iG1Zy
	laRIxIE2tlZ62ZyaDxYEMP8ApEkK/69Ha7f+pueU+SSwJnqxDy8Sx4z41ytyVt+k2/XXIdv1Lw5
	XzbkVW8vvYHOrTUm5DGrEyEPlWoSMdzzCUq32bdJ6dlIQx7AZKyanG473TrP/FP3y
X-Gm-Gg: AYBFou2wXyuadROIYjsB090g3sxxVIWF6Smjjz7N094Wzy3V1QEsF/CdxpUNdB5DOx+
	TrObSnqPwmX9MjxtrsPJlqjNIG+oCVgjhGSYmxpo/lvUXvKawIj9yG3i/O95NamwMtwGT8WXwsL
	fSqnW9450si+SBjt/7tyP1vThkt/Z6Kb9TprSSJWdMZcKRyfuA1gcixZzUvmmhHGLwl1Hp2twRx
	89HyBeCpZYR/2VB2h/TBT1bjm1982tHyPK/QY+sEIoauAmllZ4K3N0bMDMJUPGVDG/5OGCcNXle
	JgwYTbMhHo8NXQZ/4oRc++nZEa+oc8JLOuGMIrY1acO0TspWUaD9KnanWZpJmdyMx7nCuZlMZfg
	EH9fDUsc4rmkBgRQH/XKk5WfqXLP19NOUgzZnnwRi0QvNKAeTsmXPChBZ1xnYBzM2QPWjzBItDJ
	9+Vgyqs1jgVs4/
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id ada2fe7eead31-7ac1bb45468mr2060906137.12.1790165563571;
        Wed, 23 Sep 2026 05:12:43 -0700 (PDT)
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id ada2fe7eead31-7ac1bb45468mr2060883137.12.1790165563151;
        Wed, 23 Sep 2026 05:12:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857877fsm547327e87.28.2026.09.23.05.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:12:40 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:12:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/15] drm/msm/a6xx: Fix RPMH dependency votes
Message-ID: <tdjlbzqqpjmpdpkwylsxz5z62zaxceaqnmmi5rqishdnefcfed@qqxd4b5e7ift>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-3-0c3c79a1a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-hawi-gpu-v1-3-0c3c79a1a470@oss.qualcomm.com>
X-Proofpoint-GUID: XtgIWTsDpupVOmJrUkw9nW_qggwmcoO8
X-Proofpoint-ORIG-GUID: XtgIWTsDpupVOmJrUkw9nW_qggwmcoO8
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3c23c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6T55iVGf85rzv7ZivO8A:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXxhHXCuU8Mh2n
 5/YXHF+tW0F0ughtItXOT+s+a1Zn2PzEVyKsOr3TC96DpHW+awIlF78uo6xU/wQeLHkhS7ZtBQe
 RHu0KwbUFwvjWo30dVqZUsQV192XQsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXzO39jnepuCVe
 uRwBCAe+3vzoVX1z6JxbWvzUXxtc7tPGvmr2b1upROmGlgEDEVZLNiHCoCxYnVyY9ziJMURcf1r
 DVtZ5iQDaIlvKxMHJTN/felPhwC6HiK4w9IKK0JrUYFxrWpODO15Z0zQCyDdAImHDkNsyaU3jy2
 TGGJarNqSnx+QpREhWxH2w/HQq5XT9t3oBXeJcZEjnN6Cd4u6ljqOKQiyItbIQFmMYAXyPX4/Kt
 Tb4ZHUAW/pVXxbgnahWsX09p0V0Cj0pVKhF6De0A+Ca6oXBrDUFtEdzed7224N+H0DnciodUvWP
 ges4gvKwHe3p63fucn+0O/H/CPGD02lPBLD8cvX00DVbXJehJNZXcDKACFO25PlSLMnGwjU+RmL
 BTycAdXjm1Z4xgbZI03uVsyLjyUYNEl7SuuHqycZjuVTLwMmDk1yPE/mx9lG7B2qw+gwDqDGGxs
 0d/L22o6mYKtSXQ9C4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 03:55:43PM +0530, Akhil P Oommen wrote:
> a6xx_gmu_rpmh_dep_votes_init() iterates the GPU frequency list
> (gmu->gpu_freqs) but was passed gmu->dev to resolve each frequency to an
> arc level. This results in generation of incorrect dependency votes
> table. To fix this, pass gpu->pdev->dev, which owns the GPU OPP table.
> 
> Also, reorder the dependency vote init to improve clarity.
> 
> Fixes: 06cfbca0e1c6 ("drm/msm/a6xx: Share dependency vote table with GMU")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
