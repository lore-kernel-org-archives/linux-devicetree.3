Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA5E378D98
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775596463; cv=none; b=KJVRhxPuluZZayX2UYspKMzAtu7E6wjrRhwdaMhjb5M9SpNRw8oM6J5j4MJn616Psj54yu2DT3WMqeBENoZ8QoFuOpw6HY/B8C3jIeGUqNQGR7O+1F/UIffWdZW90gGshd8fEHQ+JimzIyR+9hsuCmI5D0mvHNJO/HuTweRUt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775596463; c=relaxed/simple;
	bh=qYIk0cEiLICphXq8rqf1DCIt1hLJBQAnyEeh6cGtG20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgLpAMVk4/6a+9XxaoKQI5Gm24Cr9L2rhvtZ5wtaI1iveo0WZeyE85ayTQMWP/wog9zejUQGugMpL0JGUoV+yb4VnzBacNcDybfUnnTSPxKwAW9J/SC8Qh2ZGTWW8Fd1vLIHxLWLnuAh206hgi3Slo88V9eXY4qjUo7gy13cTH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOFsKHBp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDqkarUU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOFsKHBp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDqkarUU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J6DUp2580035
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 21:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1Kutq6gg7YsIbs7+s2mX6Bpa2oe9QoQec3Qm6sEQPs=; b=LOFsKHBpQitMeY9c
	aojgScYXyCWOxcgZhyCgBYPSQEixwd/0kB+woNggVOUIfgfIL50JFG+Y01acYsfE
	cVxrR0HR+OsnVgZKe7bks1CM6IBVFrir8JKsz7y5relci/Za9HBGkspO4tgeHTkm
	miXRmFcjgqrFYwuXEhOIVgffdGpagyFSN0ArsqcUYgekaU4lIzodYcBhW4q1znWQ
	nKEHtAaFnrfuvUJgW0GEDR0VqO1kL9aseXIxjW9gMTN6v8bL34UHg2ndO9Ra7WDm
	fDvfV8cNxOaFFAasjDtHTuJ0Itf3yqaOXYsfsIIaW7gciUfIHSTs3iPiJP/z3HbX
	R8zeJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf4nwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 21:14:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b258636d16so56481575ad.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775596460; x=1776201260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1Kutq6gg7YsIbs7+s2mX6Bpa2oe9QoQec3Qm6sEQPs=;
        b=XDqkarUUn7dcjmvNvYtwVl97jyP1nh1Yrax2RDNaH1+4yZ0OXQR9jUMsSnJ4VPn5Ga
         JJlOGZ4qJ02KCW7MvnRzeJ7t0ZWRJ0DZRx49hD8am9ntOr8Z/1hr9R6JDHhW/S5BzED9
         /4541fCt/8CJcgwdjmO+nXau5HmOReE2GMUjgFKIIDNNSxz4iwOHxbl2mxM99cMAQcQr
         u598XUjVtwnEgWeHMBsvKqB50TNeDWS7BH4HXRWUaF0mn3uyETDlBd0RCWcuKM+qxCpx
         16RHfS2Mb4FTO9qmYFdr8E0umQ5D09HAwb9/qphlSrSBZNXH4Tj7k/Wd7sanxFPFUsb1
         pQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775596460; x=1776201260;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1Kutq6gg7YsIbs7+s2mX6Bpa2oe9QoQec3Qm6sEQPs=;
        b=AkvGDFMraGdAHXLrtbLOzYjsMFWe1KRzccIcCTnm6YvLFkuNpclM49kgh1w52UXH5x
         7gsXbDf4+pvpLjTG9Ja88ksLKgq8XqcI7rvOIjek+pMbkPsz5mfujyHG5+aUT0s9q/Im
         IiWbFWD/qh37nD/BpAOKst2pELxRbkugilGlCm9NcAiQR5/triboa4QI8z+gxWieiTMl
         4tEeSF/oFBCplXoz+dWrCHqXz7+YpQv7gyBeIKmbg9VHeqXxU1HXTC6KjOCPjhh0iwk7
         rX+rddthtllfYsr1JJifQmaNx667g4W7nhv+AzrQ/qK3eXC8NUOauGbWzo9qEsOopiqJ
         L7ag==
X-Forwarded-Encrypted: i=1; AJvYcCWjABcahce9nH1iwDFVNez70SkMZcJUfsxJAoVdfggx/341TB1Mk22tl3RoqzlScGUtoexA8mgg1vfS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27zw77wifPCk9XjmplCzNxNSjacm1jAxeBXmB8S4DQM7ZM18t
	VMQMcCS1eX88tKom4RAf//+ZNwIBdLY081hY0sTT9W26OV/KtRSQO9h99wF2G/U24X0F8M2oqzt
	68du3/MXwnN7ifBq60JwQzvED47dIJcCkZYps2BcnOWcpA2q1spQhdc/4KSk4ijwv
X-Gm-Gg: AeBDiev1+6carVpKJbvxglFz+Ce5hXu0/MjLCZXLmNmiLEHNKHIZMcIMiWcF/Hyuw4A
	ba+tDIJtatVPITdIB0DgzrwiNXjtMUUaGf3IHMgqkexjVXvdBeeaBL4m+X84adCoX6mipM3oYbN
	LBtvJLGqhIZjrSQ4ZA9WxQ5yxK8/EJaCGll3Rv4UvA+nCn4pBnZG8+yY4riRgRi+7EOf9oQbwaB
	ulLYFMVKZyYGIusMIbqMxK+7iBimBUH23HCaUhRWCBLPCgKieXOfQlnZDgAwLVjHznFsR4a+xFn
	tnRsWWE30lQpYJn46KGy/8kWBsxI5VQkdQ4lJPikvgmLTbmzy3rzz8C2PfcW/YoHtieJLHLOwRX
	sn3ptm2wGKqrAtcslmy2NW1AI1/TKOuvE1L2nQlBE5ssA7Q==
X-Received: by 2002:a17:902:f78f:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2b281821ca2mr197860715ad.18.1775596459662;
        Tue, 07 Apr 2026 14:14:19 -0700 (PDT)
X-Received: by 2002:a17:902:f78f:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2b281821ca2mr197860515ad.18.1775596459201;
        Tue, 07 Apr 2026 14:14:19 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d233sm186754435ad.2.2026.04.07.14.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 14:14:18 -0700 (PDT)
Message-ID: <f85253a3-e03b-4f33-a7ae-df18ba01fd8b@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 02:44:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/6] drm/msm/a8xx: use pipe protect slot 15 for
 last-span-unbound feature
To: Alexander Koskovich <akoskovich@pm.me>,
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
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-4-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-4-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE5MyBTYWx0ZWRfX7mOj568eWsep
 gPWWk14V/L0RPzmu+SZ74NUMXpfDUqaWvmJyAFiX0wdyAZIwltqlV7LOoIP7C7UOB5fg4DP5Wnm
 gouifNXqzcKtaUwHlLj5RkU1X5Rcgr1AzN5ABoCaBeyXUIrDp/12SKPUHwHwXcJ2Qf7jGPn/MgW
 h9BcZAvJVJrG6ZcfoqK34xNMrtfGQuy4iHTi1dpvOSkRnqEM+xgLkxbmDeExSDhtzgKPOoy5uja
 p/WvlJCt4qHyX2MmDP0UQUUDE6qxpRFtKXMLJ/GzFDi07jWdZQuhREqgc+5gTP1LeRVz6tkNs3Y
 Yuxqhkn8GfG++xBVaD5SP4t3AAxRZDgMrJd/2eDWLJB75uf1Aom5L7gGRIAO1JSh6/YMAz+3qNi
 9zIuKXxPgonUYdeN3KuN0kjkT+s/3ZeNE8i+sylwY7hQsIfoDmm+zi5+kh/3cLSvVddzjE/zdVE
 GW9vRJwaK967/VFiywg==
X-Proofpoint-ORIG-GUID: ex1nPGMUG4aZEUsPwit9vnQoO1bocCbb
X-Proofpoint-GUID: ex1nPGMUG4aZEUsPwit9vnQoO1bocCbb
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d573ac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bYgO6XzdekrPMLAnqt8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070193

On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
> A8XX GPUs have two sets of protect registers: 64 global slots and 16
> pipe specific slots. The last-span-unbound feature is only available
> on pipe protect registers, and should always target pipe slot 15.
> 
> This matches the downstream driver which hardcodes pipe slot 15 for
> all A8XX GPUs (GRAPHICS.LA.15.0.r1) and resolves protect errors on
> A810.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 8b4b022d9a6b..102d5e751536 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -252,11 +252,12 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
>  	}
>  
>  	/*
> -	 * Last span feature is only supported on PIPE specific register.
> -	 * So update those here
> +	 * Last span setting is only being applied to the last pipe specific
> +	 * register. Hence duplicate the last span from protect reg into the
> +	 * BR and BV protect reg pipe 15.
>  	 */
> -	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
> -	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
> +	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
> +	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
>  
>  	a8xx_aperture_clear(gpu);
>  }
> 

