Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2909F480954
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100571; cv=none; b=NHV8ex+K8BcWt408iSVw+xPeBLOvOI3z6F1Iw0gzQ39d2dIz79lHwjxz3xKvM3TDMHe2/mM9oDFqgYVnqydj4zDT5cRiwzq2nB0Ej6k3rB0cInltuhNhZnhZZd4pYt/bbq2VwoSkLcBZNWfQEfpPeQzOy1XNDLr7V7AdRrCNI5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100571; c=relaxed/simple;
	bh=VqkBZkDaJiRDdADJ8Lxaecq3PYa0YExXfSjFPd9R/Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttbDe0TkpNlCEpNxbEu8n1IpCIkv7ynqL1uJzxvJvVBrc8cDvyG2R7voMd4NUp+oRLxn6dpk8/YZwTgg+mYPkBVmq7tiTqh7C2FMIHggDEehFfvPaS4pPegaIcMkQyDZspCWKDyWKHTfYYwzWL6LebTWXghyYkzarl6eYv3eaz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqQowyh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLIit7ib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqQowyh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLIit7ib"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7fTD3757247
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUYfzTv8ACTsYRs+CfRzQrQLm7ATPQuahpCau7u+jJY=; b=UqQowyh+tpao22yu
	zk+Hbc1nl42ZY+WUJb/SGORwpESizUkz3N+XG2KEzcX6eaOMt1tJvML51Ko55FOs
	/oOrL7lOStXMJs4yt9b+GQEMSS16oHP05MwmEUn2H7NoiY/bnrJ0SdCrTLm1tq1b
	t7qToka4SmSnFTkNJSzNT3DctekjReYyEOcPcJKGnA3+rpDYSKKorkJEIwxVTdGF
	pOtlIItLEXEvDPqXTikKK3tRek9UqsqTUCmWRwr6dntck5Ki9gBmBoHc2DYJ3OmD
	5xuu9yENPmZ1PEkatFJOZLPYIZnGFRu2JY7Qq1KD9hg3xeR291HxsPmDHm8IwHsY
	5xMuMw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113qsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:09:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-334f782d1abso260095eec.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100569; x=1790705369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUYfzTv8ACTsYRs+CfRzQrQLm7ATPQuahpCau7u+jJY=;
        b=RLIit7ibw/isKb6VFqbxIYXnZwtBVV0WVXBBh9k44AgVRp/3r0g6cQ1XjBmfBsnyze
         IH1p0qkfQBbljTbm0PW1IKY46+IL9T27Eclu6Z0XQAPgO/uQtywh4phWadagU02/WaJr
         zfGA7teaFhHfNzZU6C1ftvIzXcgXkknVAVE+T66E19WBWzLL48t0mhxL679lHGKFJGh1
         IpqsYjFKgYD6u/5NW9uUHJSr772qZRt4Jmnwq5j2Vfn4tMGLLVShAXbZfb+gwctJLPVs
         HXmBGoJYnivlDNa+oGbSdU3k1lgbJw+Oy0uFUsdilC3/CjVtsCYXWVIQ94m3uEyy1tfR
         TqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100569; x=1790705369;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUYfzTv8ACTsYRs+CfRzQrQLm7ATPQuahpCau7u+jJY=;
        b=nvwID1KX2Qq6vhhySEiKcJOJQ9/kqZzYmUInQJaRJOryMLs880XtlAgfiVMzLzLIY5
         3/3ZJr+mgFA2AEJSkaCh5+kNfn1pARCH5mQaB9WYmSHCogHH9fAlY67c+4VvxQ0esXh6
         8vG0A55FiLeFTr6gw8hU6gk9BByjogZt7gCQXDEM2xf3gvZ4t3mbpdxaLmxZYtbOQUz5
         3qzgi8EI7Bojtb8moLZk8CI7BQbXMt3ahaz+PD67c7jJ8iiQcxefkFEjdTR07qsUDrGG
         Ec8EKbG71wtYFmt8+kXO3tabNjNIQP0AdOxXgAVFD340fx6dupEoKQz45Z4IYFDod+cK
         HcuA==
X-Forwarded-Encrypted: i=1; AKwUvBxh9325dJGjrecjETUCcGUBxcpaN3KRYuQp/dhPX83pJ8VeLaO+8ME5SfezcwbMQR/c7ZJjVOFQNMYR@vger.kernel.org
X-Gm-Message-State: AFuF++n3jkUd8s8RRmHWsej1BjHVr95jPZbZzN8G+4geA39tsNL+amt3
	OYyfzIobZLZw+u7aEeYcAkqH/NKvs99V7nZzh9jO/OjePoQ09OaaTq7XXowzUOTul5z1avIl7Xg
	Psb6hiE7NX/qr5nqFKQxV2MceQWAgPrO1IcftIiG5pwFsoLVVy50mWwWzdOsbt0eZ
X-Gm-Gg: AYBFou3iTTJtUnjp+QjvHEvCv1pOuPLqwZ4SJkMGiu8xVHNMYbWHezfLDwP8Sm3oEYa
	e6Wqpr/5myqWzGXNVCqd8/7Rk0axT89oJcE+vvFTJiD97Z+a7KX7StDO2GLo7wrWqpjdVM1wqk5
	P1NKNDqHpFOHehAEom8zETLh26irKRdY5+qxTMVDqqsF9xkef1m/qRBiqeEoZEqFPPd2TYumC3g
	nBs/2XM2egWhgl1Kk2hmAwiagUtWtwXij3Il05zPv3YRuDbGy6P3D8cAKpJe+755Dqq+W2IDUAZ
	2fZ0kw+jiRmTioYpCVLRHYYOl4dA7DjQLHgaCBoZkC4DEdORBhxTz0B4pdBJvtMrlHwgi/6dMWq
	zsSMHa1i/DqodBIG6RthWvfTMuFzN0fYZHQ==
X-Received: by 2002:a05:7301:2e34:b0:33e:6812:29d7 with SMTP id 5a478bee46e88-33e8d9ce170mr70676eec.19.1790100568512;
        Tue, 22 Sep 2026 11:09:28 -0700 (PDT)
X-Received: by 2002:a05:7301:2e34:b0:33e:6812:29d7 with SMTP id 5a478bee46e88-33e8d9ce170mr70631eec.19.1790100567834;
        Tue, 22 Sep 2026 11:09:27 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm7215eec.9.2026.09.22.11.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:09:27 -0700 (PDT)
Message-ID: <0eea448d-da5c-434a-909f-b50cc7c57754@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:39:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/9] media: iris: Replace enum-indexed clock and power
 domain tables with per-block structures
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NhSRO3owSERcS27oVnSkJZIKtD4sksRe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfXxbRxEm8y3dcP
 ACZGYfy61hTa/bExuRhZvUVNKRIWhx+ZyNFDXFXM00CS7Hki9BaDDF+SzZ+RYtFR8g1kN/x8nBD
 NlGWnGCcRaKR4AsNXWogGgilhh6Chuw=
X-Proofpoint-ORIG-GUID: NhSRO3owSERcS27oVnSkJZIKtD4sksRe
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2c459 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cQsnMm6kD37X6GfbhGIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX4jfO/nyPiydw
 QDcJYKyGOrjGVFR0lBoyzTIWtyFD1dnzq6TexbY/7qzW+Lo60c+DzMYfXJ+8eq6h1HjVFoGprU/
 oYfRbwmkn4f18r2U3nf/u1TAPoCzpgeBbkrDS4nx7ss24m3RoZ82DnUsiojpWxSmt9Ug4/vmm13
 fvtvLnypr5YZbEZz32WyAr1w2DjDl8ftJ3NdSog8ZnLtD2XVHaSLdXCuVWgTjf5ygbfd88lPmDy
 Dyg23pAZq/tMeG6siHEBq380PxwGPAonJFPHejYZb+GOLGPqodAryguhEV843wOBuDCdDWqcv0o
 gXeOyfjW3xlMnVNRBTs/6f7bZB/CRpWhSqxYCAC3ZwPVxP1LJQDxI2d6WLPrvcqTm+BIVOsvuHf
 tQGYAy5KU0yKpiRQNGKP3/jEYxvAVhCZks+ikRmcX4zVr9KtAxXNn7cHM+hiAOG8oaVIhS4C/4J
 LNN0BZrgg8gCaG9ZN+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265



On 9/17/2026 10:30 AM, Vishnu Reddy wrote:
> As new platforms are added, the platform_clk_type and
> platform_pm_domain_type enums keep growing. Every new clock or
> power domain requires a new enum entry, and every enable/disable
> path has to loop through the clock table to find the right clock
> by enum value, adding overhead and boilerplate on each path.
> The enum index space is also shared across all hardware blocks.
> On the Glymur platform, the VPP0 index for VPU4x and the VCODEC1
> index clash, making it error-prone to extend support without
> breaking existing platforms.
> Replace the flat tables and enum-based lookups with
> iris_power_domain, which bundles a power domain device and its
> associated clocks together per hardware block. Platform data
> describes each block via iris_power_domain_data, and the enable
> and disable helpers operate directly on an iris_power_domain
> instance, removing the need for any index lookup at runtime.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       |  23 +++-
>   .../platform/qcom/iris/iris_platform_common.h      |  41 ++----
>   .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++++-
>   .../platform/qcom/iris/iris_platform_sm8250.h      |  26 +++-
>   .../platform/qcom/iris/iris_platform_sm8550.h      |  26 +++-
>   .../platform/qcom/iris/iris_platform_sm8750.h      |  29 +++--
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  20 +--
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  32 ++---
>   .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 +++-
>   drivers/media/platform/qcom/iris/iris_probe.c      | 137 +++++++++++++++++++--
>   drivers/media/platform/qcom/iris/iris_resources.c  |  81 ++++++------
>   drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      |  37 +-----
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 +++------------------
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  98 ++-------------
>   15 files changed, 347 insertions(+), 403 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

