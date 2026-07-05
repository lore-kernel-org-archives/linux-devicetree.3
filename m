Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ABC377EBC
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783253306; cv=none; b=qt1Xtd55gg5IlXT9o5nLKoOU/I+dZYEZ6gvroYol6jFalXIxnTd1S9SqbOtmtrIhJah81PVp71IELdhMSfXeurg2XcxyZ+KoBSgcOxo+inlGNceMEGXa4oL/O6aJqi/pqLh3evwjYCDybCvoCWDi/TB2egQrBDALjZ8KVmZbPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783253306; c=relaxed/simple;
	bh=vS+gozlH8xzLoSrlTu45N+1Z/TIoHqnGVzFjee+S87M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhY3jyyRMeayey5Gsadu8CNcItcDUJmeA6T5wsNz5w6LV3qU1IWoaQgrVusxMm+NJ4pVcEUVlRK3oujosLmPGwudDlasPHBKRX3urOXndNV/GK9Csb4WXs6M7por2ByQVLz/CYNPqt5rKvs1O5HoJRAxt8/SioLlxYjO7sXkuUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8gyfHdU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJjnF81v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8gyfHdU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJjnF81v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NKGor4103135
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 12:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=; b=P8gyfHdUAKSYbw5F
	ebPDrmUaIX13Jvn7JpP3n+q2E1UyjZJPvFp1eFAxNT5r9u5//qLxaHYmrmLHJ1QB
	rU6mbCndxiBnsUpoWGzNIxON+uFnzuEJjJiR/vblAOxOhgzg421bfw+xBSUNyN3v
	dECLnkLM9iGPoO0cjONObMCUB3R1zLv5WEXtgnGlOfImdbX24ZtX/2OEsrFZ+s+V
	0hlfG17GbXz4VT/5JNWGKdSV3kvOrYRizXR81CsilZXcgfVSVbmI6i+0VBalQQ7B
	owMYY3wAmNW4t7tV1dMLajYQtYISi2YPKOpvUZGFHG2ONseW1h4n4GVRtwvOiLx1
	D0HV1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgjg23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 12:08:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so1485194a91.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783253303; x=1783858103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=;
        b=YJjnF81vCQ0rRLsTaZ6c3E3kED86BqTSjjNSyfqrQ54i2IawkgOKay5TtiDqgujSsc
         IenVrYqtA+r85HvEUSRHr+aiv6uF/bOOP4zokKN2D2Bkb5VcaklDCABeHbZ0ZIUE1E54
         BgBKbv5vWiJm6Krm6GiLoCD9Sf4FBLbtq4+ysNXqJGhwBwKM4JfN5fuU5TGhpJ2uymf3
         FJJvs3E+SPa92p02/gXOuWcjHG1L1kUD6xv6Gj53doL0noAM2OqMZ2RCuGc766iFI99O
         VRFcDpKk2eTEK+T9QEDXxYJZ+d4iRxcXH/qRY3RYiRF+kmeB0QW2jgbOb0ocTbnJnCvE
         AUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783253303; x=1783858103;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=;
        b=JviubCcBwHNx8Gq3hWWE/H2gzOQqvSVvjuyvGAl2QHmNsMWdeJ/SUHw9OqZvsM2fOz
         +ez93/YroUAmHeBghdlCQ85W7eosNdEG51cq4GFMeLmFS1yLMTXwnUNNN3MNJYMwRGUD
         PtDQEduHf4Pf4Vdck6+bHi9XKarmSCP6/Zod9Fxh2eE9AGZrBAErWaunwF3hDF8J4Eny
         DGHXsUqDUv5eGyTp+kWzr39nt65wqLZT0B4lShWyeLcYdXDKisOH4Y7ZprUZlx83/Lok
         F6ddld5dvVNMnJESjiUcB/rrEG2bxt43fMXQ7EUxaE0xxvmrbpHY/67ZyOg2PxEAutbE
         4rTA==
X-Forwarded-Encrypted: i=1; AHgh+Rqx4oHSiceo04lhwezgM2giKRIDDiyIBr42wQNHkzSmRj7aZCz//PjHYb/U3zZIeBkgbWRCLUUeN6VG@vger.kernel.org
X-Gm-Message-State: AOJu0YwqleQsar93zlPesbglj2v+DNsDO/F05fB0k7ksxdAuxZgGHS7h
	tT3v3nVn2okQZtQQ5hyDOXWFcVVYaau4SGNtOfs18BXcDuT05Tax1IGckjYuq/Qt+5rx8B7+14b
	U/n6eA45VUYhKESYmC3h6GLrw/txLc9nAi/DUgZGTcHn8mIzSy/GZkpikOhkUb/A3
X-Gm-Gg: AfdE7ckMDGzW55hRBXTt5TMz4e4sONQfacpMFB7x4M9KT1cpf776PAgJKNXL11lbJfi
	4ztsdQIoZev9S8r6FUeeukjE6gOTRno941n0inHhUbCP4DpvHQpYR8ygU6kqtimqNR4TPXDr4OS
	9m5G7B4NO5XVccqwac3Bu1kehUT89snLeY9WM7DeI7OZuUn5xmGfxaANCaQw0SP2RFJ+Ud8R+Ji
	C+AYdXPxDJjhUiAF+SqsKcl7/vvPw4WiEmf57rRyUNnR1+Uo3gtKebTNOR/lj3zyaD7L4IuNV91
	kSWu7BwKdkXIpLa9RIzqGNtNhEPBhN47xLyX8kjl3ZCAkxsrDJEgiQLZvi+ZMJgZVourxrEaizy
	TkB+KocMnVjEaMjJJxrIVAbTq6MWf0QxILg==
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr11701439a91.11.1783253303549;
        Sun, 05 Jul 2026 05:08:23 -0700 (PDT)
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr11701402a91.11.1783253303057;
        Sun, 05 Jul 2026 05:08:23 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.234.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31151fff32fsm6354185eec.21.2026.07.05.05.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 05:08:22 -0700 (PDT)
Message-ID: <81c657b0-7e61-4db3-b72c-46c213c707e9@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 17:38:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] drm/msm/a6xx: Increase HFI GX perf level limit to
 24
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-1-6ac53de56314@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260705-kaana-gpu-dt-v2-1-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDEyNyBTYWx0ZWRfX3yjg7k+ZW8Ok
 Pf/aQmiPhWg/Sfah3pOw3lVlvsH7W7CZKARfOKnF/aodOEO2VQup/Tdh9X5GxeN+BbkZxl3EZec
 ya6KOF74wyYd03W4Uc+yaXQLD9UqFks=
X-Proofpoint-ORIG-GUID: ScO5A5MvPpnGyZAbVaMNIKx9vS0kXMEo
X-Proofpoint-GUID: ScO5A5MvPpnGyZAbVaMNIKx9vS0kXMEo
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4a4938 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b2dfFiZiitoj8S2i2yzycg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PFfvJpCOjzcRVZi79uIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDEyNyBTYWx0ZWRfX7b4dySuJis8a
 F5oJhiDxo4gbLcQoSavDVCflVl8aA+633P+tj+9UGGbnyV6mKE3wduFrEWHy8q70HEhDMMErYzp
 acJqSvItYLoSILthYakyD66lhKIcfWMVtX5X5mwc3D+djfpwyzZWt+02OxVTqmu5KXEy32EheCH
 ORZhA9XjsVWI7/AdGknhI9X/Qb7oI1494ajzYyEGFAo/x+DkhL5wNrj+92U1Em70JRXS2YfcY7m
 xOHmlqq1GdwHRmPIV41X4SiA/m0lOiFYapUlZGmaYq6ArkGM96PflQeTQXIJl7PlTsuvEwvrZZU
 ae0zMfMml7rfgnNJNRgI6ozFO/qGQLgORoFTUJYv1Q3YBu9jM2DPk7KPAm2dZiZfL1Ge5H/pGfm
 RiLYor51LRDQxD6n0bw2XNdS2zmVTSi+vmqTAEK3DKMQu35DBuZdUlWUk+zp1Q8hJonEoeKP/yC
 24cAypYqFe01ZYWhrNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050127

On 7/5/2026 1:30 PM, Akhil P Oommen wrote:
> Newer Adreno GPUs expose more than 16 GX frequency levels. Introduce
> HFI_MAX_GX_LEVELS and use it to size the perf-table and bandwidth-table
> GX vote arrays, and to derive GMU_MAX_GX_FREQS, so these levels are not
> truncated.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 3f96b10b5f61..62e3fb230cd3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -20,7 +20,7 @@ struct a6xx_gmu_bo {
>  	u64 iova;
>  };
>  
> -#define GMU_MAX_GX_FREQS	32
> +#define GMU_MAX_GX_FREQS	HFI_MAX_GX_LEVELS
>  #define GMU_MAX_CX_FREQS	6
>  #define GMU_MAX_BCMS		3
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> index e10d32ce93e0..f4da73a555c6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> @@ -5,6 +5,7 @@
>  #define _A6XX_HFI_H_
>  
>  #define HFI_MAX_QUEUES 3
> +#define HFI_MAX_GX_LEVELS 24
>  
>  struct a6xx_hfi_queue_table_header {
>  	u32 version;
> @@ -119,7 +120,7 @@ struct a6xx_hfi_msg_perf_table_v1 {
>  	u32 num_gpu_levels;
>  	u32 num_gmu_levels;
>  
> -	struct perf_level gx_votes[16];
> +	struct perf_level gx_votes[HFI_MAX_GX_LEVELS];

This will break older firmwares (A7x/6x). Luckily, A8x uses
HFI_TABLE_GPU_PERF interface instead of this, which is more flexible.

Will drop this patch.

-Akhil.

>  	struct perf_level cx_votes[4];
>  } __packed;
>  
> @@ -128,7 +129,7 @@ struct a6xx_hfi_msg_perf_table {
>  	u32 num_gpu_levels;
>  	u32 num_gmu_levels;
>  
> -	struct perf_gx_level gx_votes[16];
> +	struct perf_gx_level gx_votes[HFI_MAX_GX_LEVELS];
>  	struct perf_level cx_votes[4];
>  } __packed;
>  
> @@ -144,7 +145,7 @@ struct a6xx_hfi_msg_bw_table {
>  	u32 cnoc_cmds_addrs[6];
>  	u32 cnoc_cmds_data[2][6];
>  	u32 ddr_cmds_addrs[8];
> -	u32 ddr_cmds_data[16][8];
> +	u32 ddr_cmds_data[HFI_MAX_GX_LEVELS][8];
>  } __packed;
>  
>  #define HFI_H2F_MSG_TEST 5
> 

