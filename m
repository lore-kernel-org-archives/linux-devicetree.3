Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3439E9AD
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854384; cv=none; b=BFTG4JDsSmtZBiHz4fUuhIdhpFVf8ZPWTtKNzGxYKUy/ssdgfhskPqF+Ab9mZg0uvOzVuC4aoS+7GvQQLOBtXGHEG5L0ByiGLJfjvjEz/Y8xlulerd5xNzXL0VLocNBzpfN9/1Jj4w6f/USgobop+4r8qN/P0UbnJM0VYGCBrj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854384; c=relaxed/simple;
	bh=grCWMjlu6AypHVafYge8htUDkNdD/K2UjElEdZiTn28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhOJHVZv9jR4RwKW6mBAmF6PMdobTklb7iwRz9nE/4OL33WIi1lbw7z/bOfRgIHifivKj2rLF68HipR8ZnJ+HgVLoj47lLA+ruPc8aj7STrVsmrQJqY0BN0HCSO71lIQJebl8fH9GX6E0qtgsBWNeUJ+DKMelQQ4eOmKgYpx3dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAEiCbO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqECkqE2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAEiCbO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqECkqE2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LoFX1646044
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpbmmZ1QtShdu/q4PKZ8L0K0xegJNYhOag8VQBO3HSs=; b=YAEiCbO/LI82E+lK
	E/tu8cfQeQ9BJxIYXpSbj9jULhhrfia3qZgIP5fiMdBVp46T4LGvafyY0mcDOD2b
	v/WPrlZTK5cUZ7oRe38qd3cEVrzHF6K9kEOyPmmhgbkEuNKYzt3foruRHyGXLw06
	jFyEfIylRBKVqaaOkcJx+3REByTExfN7moPPuvJsJ3+oom1oPhHzgyoLhrJRvy19
	KOI7Qc+dkA9pi+/KXK1j8JKkyQVNV9Xwdes7LDkJ+Vl4bioPh2yoQnqHmOF840K0
	ooky8E14O1rbhyltuAUUSTtIjEnkPLkI6mpxNGQEYYN7oN+4cfpxdvWsIwScvxFH
	V6m8sg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuge7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:59:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cbaa9bef2so40834241.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788854381; x=1789459181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpbmmZ1QtShdu/q4PKZ8L0K0xegJNYhOag8VQBO3HSs=;
        b=XqECkqE2qCmOLZfFnWQ70Jb9ecMOdBjmjMWTGV5JEYEPV3YbF2FlQxh99yf3Y59WKH
         B3eUExIOhSG9MH4SaF506FvX9DBqe7/HNT8faEIOrihptTKiSBDlHf6GASFdRhiVoXv6
         qLgvSk38GeBrAIBVXBLieZOsdBITn6/xEYEtG1Kuckdcgpmg7+hrBwq2rnMTr1yj7Pju
         2ytw9IG/+A18EDnFYPRTLyaklOFn+hR9E3CD+QcA5DjsoB7buDowNV4RKYFrVR9xQN1T
         IQsD6EAspfvO3sr7XCyb6Ce1g76y4ZQMhzIvpyurYJNVsZYehFRyfjD9M7asPE90rdnB
         uqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854381; x=1789459181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpbmmZ1QtShdu/q4PKZ8L0K0xegJNYhOag8VQBO3HSs=;
        b=gvo76mn523+A5fz+XwTYv7yYAscLZBwCDSKvlzrcNA8qo3U4wKmlUQd7MaN8aY2WOk
         N+SXxVCnrCuyrsy4CmrRuLhhgibmpWsnsyAbE+PZLmNzot+fweIzQV0zW1myfYEqIyBd
         YSiq/yeRJMZCW9f4feZ4ohoyTdN1l0F2LnyENOQIlCJVGRTF02I3tO3Eah1NUXWSbSeV
         dpbt3FqSKqvpwt41EqSmqD+JcNeW47B4xOpEaFX5kc7Ay3soHg5cRYqNjVWvDWNz94MM
         emGYVmh3CkL3DMuBYh7/biqMjSTHbqvFGaEWVzRTozzjOmD4Ew1h+lkmjIeXw9Gh1Zb/
         qrFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS/4YMpkpGf/q9qvcwmPDTN5EVi1ADoVTSKfEDxSPa/alBruqvUmtijpuGopSHG9HfdFg7GItyJjlq@vger.kernel.org
X-Gm-Message-State: AFuF++lbhhhFGmz9ZsbGR1fdX1Z/Lx/FRtdkiInWrBJqVnDrzNvVaWLs
	95Slek1wYgm99tIJl/Y7HDvsV9oidGOr/RbllQCB6fLVlG7N/TShFohGRUlytokYstBoJxaplEe
	aAYlc20KrHumIogEe+oSA25lVJouDAXtLjIOAUKwkAa5dKz2VYKpwZcCk93aVRwOp
X-Gm-Gg: AYBFou1m+ogsaNZyXSRoYY/g0bvJRMmwTo4azrkLnmPRtuTOMBp2r6OSoz77d7sBZ6h
	VcmsgC00qWKXlqt6JAWORCqv8t7VhwORuvGgQMR2B2vkGfy1quVt287YM79dmXLeeLcOlFwvPK8
	PdQ5XzNHzq01dRHmDySVHPuV0MuQtN9QYqFkxGWMgVKOz3EZxIkE3OOMB/svmOsOM7BrbF2JDiB
	zOAXQwI2JaPsVr4s6zzwvvHIPcmzmD4gJJvp7zQ8uXeVp1CQtPh50Z8XSmDMkcmtQTWJPU9jqyq
	NgxGPVTNsXo7WolzDXjwx1xlwv7g8UUJl66dhNLKD+tzKUOXE5wRW4GqiUkRVqezocyaPBFFapq
	Zq17026nXTPcfydeLll+l6w==
X-Received: by 2002:a05:6122:c2d6:10b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c7fbb2e565mr2177832e0c.3.1788854381020;
        Tue, 08 Sep 2026 00:59:41 -0700 (PDT)
X-Received: by 2002:a05:6122:c2d6:10b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c7fbb2e565mr2177812e0c.3.1788854380521;
        Tue, 08 Sep 2026 00:59:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37054a1b0sm32636061fa.14.2026.09.08.00.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:59:39 -0700 (PDT)
Message-ID: <51fceedb-2dbb-483c-8eee-9409ca61b1cc@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:59:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/msm: Properly handle msm_ioremap() without
 name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-5-dcf8956878ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-5-dcf8956878ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fc06e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cvAdRwzt0-5P8qaLRNMA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: N-J4NRdReFth96J6PBawFpRsNSEb-UpT
X-Proofpoint-ORIG-GUID: N-J4NRdReFth96J6PBawFpRsNSEb-UpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX+K08Cna7BwdZ
 xrlQ8tsg6/AeSTRO7rOQC5P7RnxzjKZs4Q/d4xuAtBk9ubgPOHHk7E2P6reIAnFoUbDuRs7ZjY/
 ShoMjMkid5SOm/mAwQB417++dU6bEOApBBykd6utOntDDz2XMHBfxhu8LkSXq3szzgGhmy1oPLJ
 v1+A17cgBrwYjgG/xBfikE7dn+i68jriDNgPEeiA2htLlKvd3GCS6sXd0NEtJi4dFmw88UaABwy
 O38rh4gIXDxn0NrFp23I1fuR5n4qb/3ICgf4sjvrXCpu5GZNRvRfh16oMWRXWIzPPpl/nsPgWp4
 GT+MIGW+qRcvVAUNSFBOaUMrR+2YD76YsON22gtZh7wSKL2O+1IuQATuGKa7GxwXOKhq9op9PNF
 rQaDcB1ux7cfMDeLKIfLwq+pj2mmaDXyh3YoeztUeICp/8NQlod2/QY1I2B43LAHqhMWWeJpRs7
 3CStBsbqWSTnyzsSZFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX8TgVpvNXdRLX
 UbELz0a+WMeMzAKaQBA5a0IlMpyq+bQsKkuRtilX8B4DjX0zN+DlUOJasZtsddAom+5HVnHtLxJ
 63feeplMguyUMDf5LmY2vHVmPQ5rWos=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080082

On 9/8/26 9:10 AM, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index a6efe1eac271..0a4ac0fc5fb5 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>  
>  	if (!res) {
>  		if (!quiet)
> -			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
> +			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
> +				      (name ? name : "#0"));
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> @@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>  	ptr = devm_ioremap(&pdev->dev, res->start, size);
>  	if (!ptr) {
>  		if (!quiet)
> -			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
> +			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
> +				      (name ?: "#0"));
>  		return ERR_PTR(-ENOMEM);

It's odd to see one being ?: and one being open-coded..

Konrad
