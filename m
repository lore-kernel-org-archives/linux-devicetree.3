Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101127;
	b=UFE7JNAb4+cjhsTEGqldWyOsDq/ILAFXoSw+4nT3vct8xmPN2Ep8QnQYcLzhFdwz04eN
	 PfnVfS2yz/xE+eRgEDfyDU7zKlLRAduTXNaJn2THNQz40lHOqAmWwJPq0o3wS3OdJJPqJ
	 ghSi+uX9GNI+P9WmrlI9DDBls5FcvPaqysw16Mgv7srEDkaN//cWnqXamwxVaZOCORY6Q
	 iTMRRHtXyFc4pQ3Bn/MFDhAWmyo0QedtxlcjVnIpeDdwFEf9WeI1tfgjDR6dYejHrsE3x
	 eb2ZvFhY+TMEbWmOsn1OkfESwZigC/YnWDFxODC618ISr3nHj33NBtHrnjL0tHPgDsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
	b=HA/HHGKyEEcTUuhNnVZM3g72DNZsF94Kg64MLI5zyVuz72q8bXNUl/BkQU1iY0KXG+qW
	 V+A0VNvDqq9LL1XOtRV+KYEaRGQvpJTUlhrMz1k1Fzc+4oNEm5XH8M9cmj7AoceQBQwz8
	 ntAaoYqOmRBdXKTocct5i2Zlj+oIGpQ4w93mD9bO4b/xMUp1cv4lnq72ipRxg57nYbhPc
	 KkuQqyi+EBOPO94+B0Vqm14de3O2mUeIK6Rk6YU40tlQHEymEoclavgtjgrIJFNVsCG0g
	 HIMWzRCONRaJ0H71EOQeOQjm73vlnRjq7HLAU5iFXkDSNAvu3Msq8v+83Ib/T4v8xVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d8A1SGU/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2l3y2gl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB4760A3818
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB4760A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d8A1SGU/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2l3y2gl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwLv2458098
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t8KeJqXYQPr8zutUgjnJ6yEQ
	LnjHNNZkSiiSYzj+XfU=; b=d8A1SGU/3lNieXhNKzh78QX8sIvtyhoggCDvkjo2
	ZooNqFjFtRxIPsA+xBHGhEwUfOys1kTG07Iff1x+bBTZFVWToPjzxT9N8EnOkrNx
	IEGxQb2KI8RaKfi6IZ19cdymyNOTdoCHQeQYQLCMNTK9oZwDvYY148nlQMyElYrH
	nDvOEUPoI5cM1gKNxhj7N7mZKOPMRLIrN6j0HBwaYQi86++6BI0mVQNoQLmdXzQ9
	wKMW0uM4oJNn608zdT4wH+3YUkoQIer3xZf8YVZLZru2N3Hx6hdqAnijFoHnd9sT
	w6PcNVLoGn9P/kyfRan8jZasQplHO5ZXeiRXOVeR9WFG9Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta2f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:38:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98bcae867a1so1202811241.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101125; x=1793705925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
        b=Z2l3y2gl8efDAcKPmx9asGDaPwrkEVgMxaadFXzkcQ29PiAAQ33AYJIFNUpZ7pfna6
         bPA7/SmpEQ6e5JgFXQVokPSAn72P4zixpAiV7eidruSoAyE32tFIqVU+2Q/KCwz7vryt
         1KSe5VQxCrNDjMBU4GAYDIV5uq8V+0Lw6puWV9D4e7VCChWMPskJ1YrDEuS1UNt1RIf9
         aUcpb7Sin+YwYVS4+/5Y3PkL68D4oyZMtM0C+DTT2TaPQhU2dk+lyN0FrB2EzLCoaHhn
         bMAC+UCpC6E9CNRPStjZNGb2zkL/TcDwYczV0COzyn/9+/bEKQlzQCWLqYgqB0DPNUHx
         JCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101125; x=1793705925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
        b=hZanpQoYGb8gi+a6cO/VFwqN5EzXysamS+uManHfIsKUVqxoR+19c+1D3fMq4ojEbZ
         ZpD7S6Ni3B/m9fK2eoxM44s77Xzl0NxTlAXTiPtJRESrPtFSZCzZPV3M/Y2w64hAuUu4
         KhcJRAlkgXB7twVKXVL7x5qJWY1zlQsCKY7XR+pln1hT9fCiTBf0nDIf8D82xdiEkJ3x
         mK583GLtd+AS3j4da9u6rrDF2g0FlqtlkrDVRZlcVxst/4Di8EEBvRxU8Z0UR7Dgo57v
         H1g7HDEDJoZKbj6D+6NgSwevWkg2OBGhfIbuS1MzQh2//6345CLZt2+f5KAHyEH6BtiD
         viEw==
X-Forwarded-Encrypted: i=1; AKwUvBz7oF89fESQn0jWE4lb9XL9vZblCaMNGdOsiwbYgBuFiv0lYWsTEUY50vDXvgDtYbE0fBlj4sLQJxNw@vger.kernel.org
X-Gm-Message-State: AFq9FYKQMqdDDleyU4y0qwIEl17QYivtW7nE9N5DDSAvWR04i1ekqB+F
	/nA2VmcbmkM4BFqydfPq0/5gJ/Ii64pASnfbniVu9G9x194vfgf1RKxgZRkWnXscGtQlbN18g9y
	26UFq6Q/YDZegVzN3AQXwnTeKdWepgR2k9quPCY37lGEcXWHxjq2Ym+bKKxASwFBR
X-Gm-Gg: AYBFou2sCWcSCkqG7j+Ptht2k5oqNmE50HdW6yjY5KtC+I7VXbOFE31HOGztf6cSmiQ
	I0eU0T+y9mIiZtht13DRQrXDmXWUMr6HLTEHcn1z26Er6pfXFN6kMOiJfGlXJ7tv8WyO/AK2p4D
	r2TKkPigBUDeUE33uQlcvCOK6bj/+1CX9q5Qu8XWMRjqkg/7XbNhcB2Vxi0ReIrdk8ZLF0CkAt6
	4UWtIdvJ33T6p8rGUjwjaVKwxw2MOBAKiwbK5mn/G23KpN1imOAtWG/HFT1v04YSAjEQ2RTjscl
	psUJTHaQzmfe45xQE4rWgJjUZ7wwt/x0hQEdcOdJkpuzJJH4d3t1Dirms6Gm0oqJ32jNmvLyxl5
	XMcDVjwScEgzqeOw1QpWWZWkOkMtP+lCZHVEHbIPeb+wfh2SMDjPFXpHabCPJLjMnhKlsizHHkO
	fyneFqDXjapAAh
X-Received: by 2002:a05:6102:ca:b0:7ce:6474:7216 with SMTP id ada2fe7eead31-7ce647480demr2158214137.36.1793101124454;
        Tue, 27 Oct 2026 04:38:44 -0700 (PDT)
X-Received: by 2002:a05:6102:ca:b0:7ce:6474:7216 with SMTP id ada2fe7eead31-7ce647480demr2158168137.36.1793101123899;
        Tue, 27 Oct 2026 04:38:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a27a03sm24389741fa.29.2026.10.27.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:38:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:38:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
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
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 22/23] drm/msm: Register the DCP backend
Message-ID: <m7zuu3txmzw4xemqrdtemccmvc4g6l3fsqk6xyxz5zzdbltptd@oqubuxwbukeg>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfXz0wjMTm3dD4e
 oROBR7ksOxucDFch5RZtCdRqjYie2x5RypR2WDUwbLt15typiGbrY6xb8uv+d8CT6FCgHmyUXKe
 Us85Fzi+/2uc74ufN/axp/xh2ZY3cYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX9l1vpw8alp7b
 8AFE498zW0bBXwITc0C0MCHhUiB6aVxMgcXBrlD7f5iCmEX5zluHVHLEmKdSE+MR0LnPC0WMWb4
 7VveqROBwwJG/1NoELk0cAmQbZYlAP3gfa7orn7gDWlMY1LJUdFxd58eRoe2f4IyhFmylEIkeJc
 WHrxw9Fn1KzLCdiYCBaIP+Zu+TIIOsuX/dpcd8+wjrcmaTS6pA0bvLW5wt6p84n0Q4/Ts/QcKjJ
 yPEK+pscrZ/doch4XK91kAMBENA1U7XRcmJrx8e3bFgWZLa6FlR1LqHSpiAHmNWJerBuVTc4i8j
 blIKy/NDuR9KTzIniHY7HboQaJym6NL2VJK9A+sUUDAVJU2k4Ji0rBMgHzzYKbMPnZDJ+pWfLHs
 GIoOZbG9R8LWeLPo0ymX50RTLNqtXx3VF9RfXO4T2ezU9tz6H7n+nXR4VTyjKTKAt1Y2ylJUkvX
 se239uRNyyIozrZMWEg==
X-Proofpoint-ORIG-GUID: l8QXUvJiiDOaXwnEw3DUL5iCWDir_XTV
X-Proofpoint-GUID: l8QXUvJiiDOaXwnEw3DUL5iCWDir_XTV
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae08d45 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5ffiRAJw0Nfj9fulafYA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270046

On Mon, Oct 26, 2026 at 11:51:32AM +0530, Jayant Shekhar wrote:
> The DCP platform driver provides an MSM KMS backend. Register it from the
> MSM DRM driver init and exit paths so the VirtIO driver can use the backend
> when the DCP function is discovered.
> 
> Add DCP registration hooks with no-op stubs when CONFIG_DRM_MSM_DCP is
> disabled. This keeps backend registration consistent with the other MSM
> display backends while allowing DCP support to remain optional.

There is no need to describe patch contents. Please update the prompts
you pass to your AI.

> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 ++
>  drivers/gpu/drm/msm/msm_drv.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 5816c64d7ce7..d413c361c442 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1208,6 +1208,7 @@ static int __init msm_drm_register(void)
>  	DBG("init");
>  	msm_mdp_register();
>  	msm_dpu_register();
> +	msm_dcp_register();
>  	msm_dsi_register();
>  	msm_hdmi_register();
>  	msm_dp_register();
> @@ -1229,6 +1230,7 @@ static void __exit msm_drm_unregister(void)
>  	msm_dsi_unregister();
>  	msm_mdp_unregister();
>  	msm_dpu_unregister();
> +	msm_dcp_unregister();
>  }
>  
>  module_init(msm_drm_register);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index aa5dfd82ac6f..befaa9f2cb5c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -417,6 +417,14 @@ static inline void msm_dpu_register(void) {}
>  static inline void msm_dpu_unregister(void) {}
>  #endif
>  
> +#ifdef CONFIG_DRM_MSM_DCP
> +void msm_dcp_register(void);
> +void msm_dcp_unregister(void);

This means that the earlier patches generate "function without
prototype" warnings. Please fix that. The prototypes must come together
with the function definition.

> +#else
> +static inline void msm_dcp_register(void) {}
> +static inline void msm_dcp_unregister(void) {}
> +#endif
> +
>  #ifdef CONFIG_DRM_MSM_MDSS
>  void msm_mdss_register(void);
>  void msm_mdss_unregister(void);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
