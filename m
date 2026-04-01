Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F84E372B4B
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037777; cv=none; b=h3D3Zko3Fz9lo3vf5a8NN47cpyRQukWTIY/stT4hwYq9hjpuiwmkb08CjLF2dtUmb6m76VZhALjuUcviOUUYkkp16EEA3eepg6N2YJLonCMzLVP9tn5eQYInE9ySnUzLi0/ELwbY5oMu6C0MlweKc//WULrp1/PMU1+ffqHHD2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037777; c=relaxed/simple;
	bh=a12Rcd9bB5uPDc0EJ5hYGJjTz2sCsfAxYkLl4XcsBOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0s5QyMlQLsLO/A50MzncQZOnedBC3s1wzmwuZ2wJcnMf5+cTAxT1XdHTyYYHL9BAhevYcR4uT3a9mT45SBXBXOAjhUy2SjECwSJE1f6aAm2cn6LJWMzb+yzShjQrI7CMO+XSGmBnvtI2ArxaoowMOeLkjmD8eXe5Ihdi9tf4rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDexLiIe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqFHKymK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDexLiIe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqFHKymK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63182BoN1004296
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eS40vc51JlECGN/gZPmIK/gLtGZq9a75bp6sZnyVgUk=; b=cDexLiIeLbjHatZ+
	bkAYrPQJmCLck7Kwj5I54BHOw5AplIwWGckzdKJM2drGcLU7SaqHAW7llq8vaHWK
	4T4KcZeaNlsHHolv7hfsXBzC61fvEaMV9kng1mfbJeaijsp+fUrmSzrCHKeBIihI
	Zq58a4WoRPdi7XjU6cvWDn/kefFaqqmoEs0jJhkmRyIGMNhmSo5eXjK/jtn1OqY6
	Vn8j4Z6CbF/0aNHPTolXUzsFVvb8JTKE8pMphhuGZ120EQvDR6cBfTA+r8Iboc4R
	KfHLOFrB12TgnFb58K2fWAeIZ0CSgrnKAiq0prfeowRII2yMCJWVsLEagbbbO3Rn
	5PVI5A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhrbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:02:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-604ea7bd707so470308137.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775037774; x=1775642574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eS40vc51JlECGN/gZPmIK/gLtGZq9a75bp6sZnyVgUk=;
        b=fqFHKymKzm8tzJzgoTUDyHtQLQOoKlgRf0+i/zyLDhRZzDHpf0BF+MSCcgOTx+tt7I
         5DYNRjnTqUmIxhUFh6XsEHfoA9yyeSF8sK6avL5uODBYUl/aKX4E2mpuW2iRSaaRM/PT
         pKHMwTFMZryY9oca/Vz2en79OtLoWzOOoMS7jL67ZS3ZYuOuP4uu/kiudg5/3G4l/v0a
         42CnDxPvxnvJAqPFm+0jS6qT9Xa388w+eVEvpsUXj/fdlOumnN+IHlmnHAqb4ABR9CCx
         ulkV7OpdMLmW5z57/7FsDo9hltllbWrACRE8YOwcH0S6JBddkAj1fAHvb9XqCb2dB3iN
         kBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037774; x=1775642574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eS40vc51JlECGN/gZPmIK/gLtGZq9a75bp6sZnyVgUk=;
        b=aV0ket/xic5p3fVFlExXE69g9KzdxgSjuJFoIEA2tVQ0WCW7PJf6MsCW6A7LlbVecp
         tdVR9Wgfgwkvl1Ht9G+DCYDjGV1ZJNt+xR/CohJ0vK4qMNUWUI43lnZIrjOZjWx8QvYr
         qCJPbxM2/E7Bm5NAa8aLz4I780Dpk1PDsZMwJaQAUzcf9GGKZY13cMUkIfhU3ycn9ka6
         dApohGKo/CluKHDDf7DFGHmp0f43TeNw7dwIeeCvTfvei5T4rPvIUTNcSfLEH01lKpsi
         0LwOsE/m++iJTBLQh1eF4Ex/vWaIaMTEeXDilaggjGmmTJq8hxLkYnq9yiyPDMDoLwzQ
         V6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWtq7lwmghuwfPi6VzBvw4pnS4kw86MTCkHLc6LH3+IqnsfIzteLI06oue85qIyAUnu7x3udQk2lrVk@vger.kernel.org
X-Gm-Message-State: AOJu0YwDZ4byA5gNdJ6bjGI026AEcbTDyYMqwaIW6msNNQvnL0B9o4Bq
	1vEupk0PrfhJIY+RwU/XhEPn+oaJI2cqacF2ED3lSE4i7JKaDovEPtO2fp3VlzHuOgZ59+kRtIZ
	L9z3AYvAKbXb9Ffak6nvFgiSsa7ssrquLFt/QG915zANBUuDIQIcyd1uz9NqzaJJl
X-Gm-Gg: ATEYQzx3Iergw3kKgcAYGp3vvbD6SwkraDtdOrHv5rhQwcLR1GPzK4avkx6Ltyr8EXG
	2o7rrf370dudYMvvezByl9LjZ+acsFSc8bEuFwIyw+HlUS1Y3wOpX+VW/vs2Qx1daJrntFYmQcD
	5oU4fPZ8TlfkqzzNHNt6Bm5Lry6757JgUG592g1Ex7ns5x5S9yVdv6mHjoOL2nkABW2OApA36xz
	3gT3Z+Npsy718t2Odx8s+UrI6ERYvPyfAispwSSTriO9EkO+jMUO+YzPCLSN6Ax3qUroQIoelQ2
	enbP531dlJoIbKsPfKjko+VzbbFyYx1AuKcO+egE7B0BoJviS41dxAfGkXYO5JHc78dyl+CQBpu
	E8jfJOhyVnd9KCWwldcCQmUSr0zsL/mmb4ol/KBOpPRMW++MmEgd5XUniBbgrsz5J42rzyXemmg
	6OMJ0=
X-Received: by 2002:a05:6102:30aa:b0:5ff:2425:a0e7 with SMTP id ada2fe7eead31-60568225cdamr336229137.6.1775037774336;
        Wed, 01 Apr 2026 03:02:54 -0700 (PDT)
X-Received: by 2002:a05:6102:30aa:b0:5ff:2425:a0e7 with SMTP id ada2fe7eead31-60568225cdamr336207137.6.1775037773868;
        Wed, 01 Apr 2026 03:02:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7275ff49sm3976479a12.6.2026.04.01.03.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:02:52 -0700 (PDT)
Message-ID: <6da36e75-effb-4e3e-a2f9-c0f3ebdbcc21@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:02:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/adreno: add Adreno 810 GPU support
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-5-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-5-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UJCGFIlP-SJ4idaLEKhxSHRKnoM4lfSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MSBTYWx0ZWRfX5oL2WwhzLcq8
 smnAoLN+MA4xE9SrjdwkXq2Ddk10LAIXse97m0iiThlDFvOa6RRKy/u70HGEq8OzqGoLyLTdqoG
 Z18wRalUHu5Alu6dRnBdIm7igLWIpaHnkFfWUHLBnEAdP7AnuuGIdfyTB3enFTc5Mf1/3RjKT1C
 HQeUt12ZDZ62w30K8TNq/tYp+aKekedCWioJR3PiU4hfzU0cqJEyBtDzDfQCl4wj3i3nKtESIVl
 nJMYGAwYlNhjR9ot0lgaeCUasc284nCs9UB/d44L0Oq6iTshz2Vyejf7uupuTKCs/P3e0Mym7rm
 gWLuXshtHgXxRf+8crIJeRdfRqRUTHDO2itgRA33nk5aWu1NfEW7dtBBuj6j5nHn5EFEhaApj4N
 OQ4ivZqKevxmgSikpw5TEG095RU/O49Gvg961LztMD9T32mXJRremRX/rqGV//FVqOOX3tzc9y+
 A21tBpzYj0n5bXZIusw==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cced4f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=N7jHRINKHDCQWMt9xiQA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: UJCGFIlP-SJ4idaLEKhxSHRKnoM4lfSe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010091

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> Add catalog entry and register configuration for the Adreno 810
> found in Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 271 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
>  2 files changed, 276 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 550ff3a9b82e..0d7d9c86205e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1799,6 +1799,240 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
>  };
>  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
>  
> +static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
> +	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> +	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00f80800, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000023, BIT(PIPE_BV) }, /* Avoid partial waves at VFD */
> +	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> +	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> +	/*
> +	 * BIT(22): Disable PS out of order retire
> +	 * BIT(23): Enable half wave mode and MM instruction src&dst is half precision
> +	 */
> +	{ REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) },
> +	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> +	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> +	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
> +	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
> +	/* BIT(26): Disable final clamp for bicubic filtering */
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> +	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
> +	{ },

I may be on an older tag or something, but:

$ diff /tmp/downstream.txt /tmp/upstream.txt
24a25
> { GEN7_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
27,28c28,29
< { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
< { GEN8_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
---
> { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> { GEN8_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
31,32c32
< /* Disable write slow pointer in data phase queue */
< { GEN8_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
---
> { GEN8_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },


> +};
> +
> +static const u32 a810_protect_regs[] = {

$ diff /tmp/downstream.txt /tmp/upstream.txt

< A6XX_PROTECT_NORDWR(0x0ae00, 0x0),
< A6XX_PROTECT_NORDWR(0x0ae02, 0x4),
---
> A6XX_PROTECT_NORDWR(0x0ae00, 0x6),

-> the difference is that

SP_DBG_ECO_CNTL and SP_ADDR_MODE_CNTL are not protected

that might have been a part of the ^ difference

Also it may be that the better name for this table is a830_protect_regs[]


The other tables, I'm lost. Akhil, please take a look.


Konrad
