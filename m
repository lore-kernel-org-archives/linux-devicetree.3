Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE5136998F
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775592286; cv=none; b=QQC0H+24vWPDt0Lk7tIBEc4+m8RakFC1FBV5Gn7SFNqTVYXfpbed5Xy7lWnBOdPCDE3xvqNSJ1cbc4bpdf7/8+umlsXPrYYqQNi9Dmmui1L4Kw6rw6LGVq8MqrWMM4jbVUu+u/2L29JQ2emYNELRR6ZvSp9UMm+iDq3BtkeJZB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775592286; c=relaxed/simple;
	bh=WAa5KQ2KFRDGtldbxEarCerDaWDlFFeHJlgLmLqsxb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+ORZP1zuRgpb9l5H8imPIhsIvPfrjmlQxg/Ewd/am6nE2r1bpdmHtdOstgzt3rDCc9pXM93ercCZBXalJMsY288QZZ47q03dZARoR6odlQxTU1DPJRLi8xFwyQ1UmwLOlxz0qcSmfSAnO0c0+f3tINyOHAB0Nrd3/gzRyIb9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgGlEcP5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHftSYO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgGlEcP5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHftSYO3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D2A5l2580473
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 20:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Vjxvuw/FF1VPBI4n/D+FS0MDHLJtFBAmtaqwcmoPPA=; b=jgGlEcP5NRD1MUzj
	fVQuWsKJMV2SC+hWqG9FVSd/ir552grlW5p0aBLX62duRB3Eic31aWKespOiaJdM
	DzOOINccltoFOqSVh2wkwX3WC4MCuvyHvsgh3uXttgbvmw+1ebmxdHarUOgqbffH
	X8sVInGlKsXOXFfOVP6agwGAsIQufRMAIQIUnabr2MhwTZRKbOW/GG1NsqTEK6DN
	0b82mg1MGsrXiLRgFLOUnAku907W7XnggeWY4fhqpAbVxfvAl7GcBV8ZvX9AkYVq
	Z0byi9yy0Uv8YkCCwRV4PbxqfrY+cTiAY1ajNA7qUtcpk9PhVsH9NQ7a3wfSdVXK
	DZEiMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf4fm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 20:04:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0c30b51bfso118592395ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 13:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775592281; x=1776197081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Vjxvuw/FF1VPBI4n/D+FS0MDHLJtFBAmtaqwcmoPPA=;
        b=jHftSYO3Whq1/gLdpzh1Zd4hVN5sKvWx/o8ycfPGVO28ChJ8DlFL2gt/dKQi+F0HIk
         7d9RmkFH5qKGuy15My9jSMenc19HDcAJeccvlX4TNub7OTkVROIX8Pp5Bdcy7BEs2HWs
         6C29/pZNMPD6UraALJm4i8rxkpyhQlgaBIiZKJ9y2Fk9T0/twk7+FDwHEbNWh6iGmKfh
         snZX5reMdlUUMNFRY/FftiFY/9eB+aSiDh36tzRbUyPQghP2OkCQaADb78Jw3MiKaaCs
         D1AgDXj2awr6Bf00Cp7UWNMCLBghOKGjL6ubIJUt2IXMRdlHnMtOy2bbuUNrmcPi46Q4
         DMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775592281; x=1776197081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Vjxvuw/FF1VPBI4n/D+FS0MDHLJtFBAmtaqwcmoPPA=;
        b=KxeLOxHuS5DH9WOT/s+syEk8CAvrfNka6ZQ8seNPHFWTqKdffpxflp443m6CmAIJmG
         gutgqGLVXqXhNEWqyOoxDR2ZD4WjM9nKjrL+VxfeBD4rnWjBG9nEBZEl3VRWx+stotsI
         st4sgU1mph4JW9kMmxfsm+49xs5N9PeWtKWsEphqO/BpxOlVHqiDxljiUvqKqGmcblgI
         A4EeonucASo1Sa7FqvzJHeMbJSRHP2IUqz69233MKqVM5qyDMGEFiy1bbYi5I0RLZc8Q
         JXDLYQwkxJ+9uYsrBcmKY6UHXHWTGZRZC2bV5BHzRjesWjbmgFcZBQViJL2be0iDmRjf
         Nk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw9Hx3QLoDJ/0zKqirWuryEReHqO0gUEGowRTHRnzEw4CVdLGE4dzvr3bf2CtxRv5rCdBnc2GJin5M@vger.kernel.org
X-Gm-Message-State: AOJu0YwQTIz1v2+cSHan3b8xpR4i0DNAGH8CcqNlr33BSMTuioAcC4tR
	Uq3zAFt0ntFEhPxiwqHmepwBXK3Yuu/6CQzIbGKgbvKJhYsJIUPUUBHJnNCW5LYfZUySlVfrKWu
	kjlBX0joi4I6nwp3yGpNZljl6uTGdAHt0Ya9/RAyenyE+pj9vH3msAvIvTKQdVDab
X-Gm-Gg: AeBDiet5YDxB9D8src0q0S1lw18jCU/gAHYi6moReXqf2+v9jR4zGR4CWHYQvZxpgb8
	LpHrXVHefKsq6KTzdIwRcPakT1QG/KmbVRLLyu9pYSi7RRcNqo3isKCQpQeyyX6Tc9PMqgp44zH
	3RoUHdqxefxHwcfplJ0wJOsh9T71pvTbHciPb66xqhhxpYscn49unQFOQ8fTF6VnzwP/q+nXQVX
	+r8gVHLZ17FjD3OfNrvYHOEmUsjGKeSqw6WigGdvMXudZz9Y/8r874Py58S3EW18/Ux+l5gkOWl
	LqCqA78L9XZW7LTddOhGtwxIXEqXF5/32TNeZsqSnYOTHZyTJrTDQXQ9ZIC2Siz4uhy5gaqZCS2
	r/XQD/rlh8sCtVwBU6EvnpmEegB4C1yselYHqgZ89jrCgVA==
X-Received: by 2002:a17:902:d2c8:b0:2b2:523f:50d with SMTP id d9443c01a7336-2b281802cacmr192447345ad.29.1775592281497;
        Tue, 07 Apr 2026 13:04:41 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2b2:523f:50d with SMTP id d9443c01a7336-2b281802cacmr192446915ad.29.1775592280993;
        Tue, 07 Apr 2026 13:04:40 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbce2sm178975185ad.79.2026.04.07.13.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 13:04:40 -0700 (PDT)
Message-ID: <c9ce392d-d1f8-421c-aff0-ef3b7d737df0@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 01:34:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/6] drm/msm/adreno: set cx_misc_mmio regardless of
 if platform has LLCC
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-3-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-3-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE4MiBTYWx0ZWRfX/4JFiKoOLHnG
 bvz7oGKKC4Czua/qW6I01vkPjEnZ5kabs0dMkiETsrAFkKh5XRrpXRZGvKctlc9EE2RJ1z6/DM9
 45esnJJI+eZ7nTYvR52nimkqZ3wD/nfrL5/uLuzjUSdr+yz5pzcsmKzV1Df6Vo4kGtGKoy3J3nT
 dd34vw855ChynyuFOCLeNgjt6vWERXIniG4vV84Zdze7kw6cq+hwf96lcdYT0Q1qujdwKGQjzjI
 GNXmkB2IqnFW2h6kMGLIBndngltNGAlPZ0K33AU/MWxPEiVP/hyIS0tTryIcos0LoCl0AlXo0Ip
 1NYfEk28WIlSGCZqapqPc/u7KgPxYNZ3bqyH/Z4QTC1UJ234ctmvRSHriMYKprH5ZNKbYLwv6jj
 rJJh+jnEJpOcgZ2CIzIk6VD1NWQxCfsm+PeuLKM2NHuk1xxo69gruCPG5TYOnCWqnkna+T8yrI8
 GFv0hDw5b9PiBTxpasQ==
X-Proofpoint-ORIG-GUID: xqOu8y4p9DfR5ZQoqJRWe_dP3QsAX8re
X-Proofpoint-GUID: xqOu8y4p9DfR5ZQoqJRWe_dP3QsAX8re
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d5635a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zzMsImXSMt5mrjmxLFkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070182

On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
> Platforms without a LLCC (e.g. milos) still need to be able to read and
> write to the cx_mem region. Previously if LLCC slices were unavailable
> the cx_misc_mmio mapping was overwritten with ERR_PTR, causing a crash
> when the GMU later accessed cx_mem.
> 
> Move the cx_misc_mmio mapping out of a6xx_llc_slices_init() into
> a6xx_gpu_init() so that cx_mem mapping is independent of LLCC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 ++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 9847f83b92af..d691ad1f88b3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2039,7 +2039,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	u32 cntl1_regval = 0;
>  
> -	if (IS_ERR(a6xx_gpu->cx_misc_mmio))
> +	if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
>  		return;
>  
>  	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
> @@ -2098,7 +2098,7 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  
> -	if (IS_ERR(a6xx_gpu->cx_misc_mmio))
> +	if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
>  		return;
>  
>  	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
> @@ -2135,31 +2135,12 @@ static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>  static void a6xx_llc_slices_init(struct platform_device *pdev,
>  		struct a6xx_gpu *a6xx_gpu, bool is_a7xx)
>  {
> -	struct device_node *phandle;
> -
>  	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
>  	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
>  		return;
>  
> -	/*
> -	 * There is a different programming path for A6xx targets with an
> -	 * mmu500 attached, so detect if that is the case
> -	 */
> -	phandle = of_parse_phandle(pdev->dev.of_node, "iommus", 0);
> -	a6xx_gpu->have_mmu500 = (phandle &&
> -		of_device_is_compatible(phandle, "arm,mmu-500"));
> -	of_node_put(phandle);
> -
> -	if (is_a7xx || !a6xx_gpu->have_mmu500)
> -		a6xx_gpu->cx_misc_mmio = msm_ioremap(pdev, "cx_mem");
> -	else
> -		a6xx_gpu->cx_misc_mmio = NULL;
> -
>  	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
>  	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
> -
> -	if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> -		a6xx_gpu->cx_misc_mmio = ERR_PTR(-EINVAL);
>  }
>  
>  #define GBIF_CLIENT_HALT_MASK		BIT(0)
> @@ -2621,6 +2602,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
>  	const struct adreno_info *info = config->info;
> +	struct device_node *phandle;
>  	struct device_node *node;
>  	struct a6xx_gpu *a6xx_gpu;
>  	struct adreno_gpu *adreno_gpu;
> @@ -2656,6 +2638,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
>  
> +	/*
> +	 * There is a different programming path for A6xx targets with an
> +	 * mmu500 attached, so detect if that is the case
> +	 */
> +	phandle = of_parse_phandle(pdev->dev.of_node, "iommus", 0);
> +	a6xx_gpu->have_mmu500 = (phandle &&
> +		of_device_is_compatible(phandle, "arm,mmu-500"));
> +	of_node_put(phandle);
> +
> +	if (is_a7xx || !a6xx_gpu->have_mmu500)

Instead of this check, I feel it is better to just add a
WARN_ONCE(a6xx_gpu->cx_misc_mmio) in the a6xx_cx_misc_* io accessors.
Then "a6xx_gpu->have_mmu500" init can be moved to the llc_init(). But
that is outside the scope of this series.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> +		a6xx_gpu->cx_misc_mmio = msm_ioremap(pdev, "cx_mem");
> +	else
> +		a6xx_gpu->cx_misc_mmio = NULL;
> +
>  	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info);
>  	if (ret) {
>  		a6xx_llc_slices_destroy(a6xx_gpu);
> 

