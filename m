Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53403A6B68
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863071; cv=none; b=AYw977bFmeviUnI1zZ6JDlzIsqRNikQnpdHuMGfxBPPrQnCniVLrCqaqxkNjyLz/lQFnFXUEETX7gDLOoNAfpEKa5Psd78xfV8wIXavMBzNaGe0rOoepgcYgcB48adxKbNDXOuChtlaVylZdPq+97ZCRDuJ+o4zHXYEcmpc+GSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863071; c=relaxed/simple;
	bh=jA/dky2vpXumlNM7Yyrg5XJlbHU8FyCOZGZFiulOATM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sskae6lM3eIiZpZ54JXbN5Oawczpe+ZMtTDZOVpBnpuESiek8DbKWa87J8Mf2g7qHPeIjFU8Ltou/u2eZDzmrLg9sy6q5zFt18RYv68iFgiIlYk6k1bvC8zGyzIfoBt6yqXiwy/f9bDiyaqzagRc/7KuH6hZlJ4kJ/vmmtesjfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xos37Opm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLJCMaKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xos37Opm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLJCMaKZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96F29664127
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a04HZhr0fPZ+oBqd4QTLHz07/4oVCHQZauM9ulH5LBY=; b=Xos37OpmqLJC6nZW
	HWsjiyfKQKV9bY5zvS05hojSh6pkPK+qQBaAvEAd0GLqwycdAsy8wezRtp1UOPtD
	yoJO5VbRdToiG95o6RPvJ1g+LwrKdc4zRY1mQxKmWCk0hBE5vya6cJnNfQi4C4rn
	Jj71Kcf7/QTJVOVXFRnKdqH9rGC6gzV78yhFdPJqbdnu1bQu3VnyV6jV2AGaIOPa
	1Kcm/ZpoM3awJKIng48iAOuoVY2thirK8INTQ+PyFqu0fFWR5hLzSCG381jYwnhB
	Wi05yt1QdCPoSPThH1CaF92w/OJ5dO+i82QSGAI/YadFqN2E0jCn1KthNyuTxEVs
	ODD1SQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgrtmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:04:28 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-479dd4bf463so801269b6e.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776863068; x=1777467868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a04HZhr0fPZ+oBqd4QTLHz07/4oVCHQZauM9ulH5LBY=;
        b=XLJCMaKZlMh7INTF4pQ3l4s4y8rAk8vjJAFR/yIhGT6EIDlaxlxVRPaHiXtTTyMU4j
         tKp2WesF11QoyAvmHo3C/daeSmGbRXH/uHCHS67BPr2xiSvxLEQeTA2je+2SskAQ+a/T
         VusR0vTu6OJSBoaEEgaWjKw9ZI98ICsXXM7qInzGbun77pim4FBJP1AvH6U1M3HbP0A5
         BunrMNOp4LJDGp/aiOou4GXJy4ciM1vMPKbwN8O39VDIwG4uk9BuhVQ/iZzeSFUrhD/8
         p01qwqKYo6DqKPk7ojUpY3Oc/25ICW4SkaYfyJcHRZ5oxVJvLGuCaOnLOoAh41Me0+E+
         W9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863068; x=1777467868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a04HZhr0fPZ+oBqd4QTLHz07/4oVCHQZauM9ulH5LBY=;
        b=lIydjbwJc6uBb83sPM7/MB6xPvO3ThJkIpnWdtTfgbZGZg5GUFoC0SbS5mKIljLIze
         ZIE0tJBkX1YnvV9IxPn7PMawYMb3s8aHgUSeGlZEbdVu9/5TttNGlKescUoQEdOEl/CQ
         SYfQEgCZ8zrY/4K4XbvByn6s05KbrKuLG0VyruzMkvt6RfQLuSUXTlCH4yc6mu+Jx3hi
         1jamA6xRyVZWjpYCCug0Bakzejase1c+cpae5TmQcIZ+Zn5+0ZEdVDP1id+xnlRzUnHZ
         Loc1EABegWWijh8MfuULgLeyx2H5jwDeSCLZWF0sz4+BcQXgwrPDuObNMJM5JWBdz4nj
         RuLg==
X-Forwarded-Encrypted: i=1; AFNElJ9dCr4W7+sgOgjpV+tqSaReeXjjvYVcIj5uf8RhAU7i1Yceqdn9cYOwrdIouY9h6EiMBVNGNwoiWFKJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXk4gcQA7xxLNlkrmR4C7D98a7rTfZrdkV6WAgIqj7y+4rn5E
	7O3mafhWc/SDf6XAFMc1yF3zZO34J1RQkEOlNlZE3iNTEuNieLX+T5WqgCA6+RKpuw3YuJ5Y78Q
	EU6ROYsrDuMIT9lFDfE2xRSoAAjUIRsHwMg5wtHo9ZASyU3rTSYGZaqTvuluOqmiY
X-Gm-Gg: AeBDievzMskFHjUQS7vTCUWZjWgrV3eHw4OyIs91HdWzDlzhajSvzmFKymgHa3Ucdv2
	qQAsKW2Vk6qLzkeiLukFUmxQnelLkvJ3xfbtBgH5j2vjxSOS7aVDuwzhGy3EgGtiaxsQcO6zFji
	rR+oR/1h4wVbiOjqpobssAMQfxXVrhMcwIHT8Tdst2UDVOT8HbQMjHeqiHVawrD1L+CiaH96LGM
	nLxrpOmg+DN7SzXwHpcDziQqfAZUMMKype781jcMFsuXvu4NLlNOe9t4xbbulhZEOE2QnRwzg/M
	a90Efjkw+hevckkgQWxa2DqufjP4CBTPr/f01HV2N9BWfJFU7qHt2RXYUV/CrLTz8sUIJlu7Jk7
	G8gBUmhWhOyEGgntOi6fPyrvKSkBEaNu5E4ZwtDMm30zY6ks8BnsguKl62k0XVpp8wnGiZb6kEC
	5uqUWlrWDlhW8tcP4do703fT3k
X-Received: by 2002:a05:6808:181d:b0:467:ed9:ffbf with SMTP id 5614622812f47-4799c9a66acmr7362094b6e.3.1776863067901;
        Wed, 22 Apr 2026 06:04:27 -0700 (PDT)
X-Received: by 2002:a05:6808:181d:b0:467:ed9:ffbf with SMTP id 5614622812f47-4799c9a66acmr7362035b6e.3.1776863067208;
        Wed, 22 Apr 2026 06:04:27 -0700 (PDT)
Received: from [192.168.0.242] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4512115d6sm551798466b.7.2026.04.22.06.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:04:25 -0700 (PDT)
Message-ID: <eccce3f2-01a8-4454-87d2-3a599a15b34f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 15:04:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 6/7] drm/msm/adreno: add Adreno 810 GPU support
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
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
 <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7RW4A4y2_fOBGScu6rnbEVnZPw9Ki3J-
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8c75c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=B4I3uEKCwWxQvTZmuDoA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 7RW4A4y2_fOBGScu6rnbEVnZPw9Ki3J-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyNSBTYWx0ZWRfX9hA1lpYh6GvY
 1R6Q4bdVI2/kNjUECBwCooVVRZ/fFHHRYyKMBCjdZHPEjbF/ATT0kKro68jwYv+/nS+Pn6eYRmO
 eJpaKKBcJGZZk7OmaMatLef0hTPbV+hwfGJNAso/4gNC6d3V9cGEjCLXfjl/mRpSsprXICzeUIV
 i68ToEMVsIh2UVLp8r5/+deg4Om8bh0Ud3ZfpBZMg8+nkulkif4fLEL206uz59OnleLE9cUp1vx
 bVm82MYBV2FHaPEFBq5rhPDRDCN2JSGWvmPDeVVvs7AxFCTnqVNQSq2ycUfujx1DPVmt9GwsaKA
 CrxTuwqRk+VGEe9F1K5oeBCeh6YOQ97KJxZR37BB8eniP2sgBQoHns7faKmFgEN/rrr9bVOHhMl
 wbP/q0SdnQEyzxI+i8tNQVd6N9S8X/hr3HF7vrcrGxvdudS6Obbbd3eiaQtutS3w+nkjf313ZIE
 Rzi+J4xSR3rTTWXzZSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220125



On 16-Apr-26 13:05, Alexander Koskovich wrote:
> Add catalog entry and register configuration for the Adreno 810
> found in Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 296 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
>  2 files changed, 301 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 550ff3a9b82e..1190804632d6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1799,6 +1799,259 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
>  };
>  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
>  
> +static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {

To align with the latest kgsl which includes all the latest
recommendations, remove:

{ REG_A8XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },

{ REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
{ REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x00000724, BIT(PIPE_NONE) },

{ REG_A8XX_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },

{ REG_A8XX_VSC_BIN_SIZE, 0x00010001, BIT(PIPE_NONE) },

and add:

(below RB_CCU_CNTL)
{ REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },

(swap in place)
{ REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
{ REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },

(below UCHE_CCHE_CACHE_WAYS)
{ REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },

(below RB_GC_GMEM_PROTECT)
{ REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },

(The order doesn't actually matter but it'll be easier to diff)

Konrad
