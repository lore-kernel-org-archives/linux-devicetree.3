Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22A26CE05
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863078; cv=none; b=WGRfOCYrxQcT0AEHOdczdYO4OZBHOEJy40KOPYBeahmXnjCE8cjYSFlwDY7wnTXdq7xa/qgM5+7GJv7cDyr0UgXUG2L069SCosykhu5cczCT0aa1kzGBfgZDNGdo3cda1r9gtVBvSVqPkpLZodTHoqgEYNdnBO5I0YBsZTHufDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863078; c=relaxed/simple;
	bh=7H5wBaJe/R/hFrKmXZMsS+c4w56GQfd9rbPbyyNiwfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNL1CSl3AdStNqIrTofwQswG5vjRtQnt4RS2ZurRtYz2TxG83yJYZsBipLTXup8jsCRgDjamgyNokaeXNrYl70USLJm+Ip8DCb4B5iVixBGcaoQMPb8v4tyhWlxSOJHjQqotIKtxfiG8nVVrnrnXrFZqrtaNTD0hSUrTRrbhgls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAROdOi2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcfTdUvN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAROdOi2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcfTdUvN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAsXgm976179
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9eW7q2/yfswm/0EP7ohuo6irtJLMRsFkiVDHy32ekA=; b=OAROdOi2XqNWLjrM
	osntcLVo29SccQ+37V6UNRiSxWdk5HyHgw+Zfk+9MlzOzODfIvkCdP9ClahxPMv2
	5zbqYjRj78JglBtTbVWNCZmEwqSC9Kxu3yXR3zqqEouR5ZxXXbBoaUhtHuVxcRCW
	5GbCWQ5x9/r516wZl3/Oj8DcPeunutM0bnOKUpajNOV8wO4GJugmGCYy8yk/RlnE
	6qQrGCLG10WgbWCSBxt+NRi6WCxH+BaO9oJg4ROc8sE8J4R23hlUHggZqDvgLYdD
	p1oVAwuSpM9kJ2wD2OMR5Kn46uF7sWdEiHOVucp3FEgzFm3yK3Dtv/VZtGhIKWBz
	1pMjdw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenebj95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:04:36 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-42c49c843b9so306316fac.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776863075; x=1777467875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9eW7q2/yfswm/0EP7ohuo6irtJLMRsFkiVDHy32ekA=;
        b=QcfTdUvNT2b2bpxngAJfrlTSU0ITUgh/FAH/1gG2cIdXoLKAyFHasRifV7UfAKIPYy
         +3x0pSPDOb3vRIDx3I48GUYUluiZ0b0IXiaQ/o8x75qzfO7yoJN+J5FFiChf3rFJj2s8
         lmY2E50s+umUoVEf7jdJVF/j32l5PeoL0gmPblDCkPQi2fUCECtZ5wPaEQGzaHS2XMos
         wqi9nmQlqPXwrgHolc8onXC4ueVFUIUpzixlCW6DBCq+i6edW90o5atxDftV3Xgi/b4k
         txdIkcXltimi3inwGc0x6VBYPQtQi8l6PrHwESsEJzTwUOiK2RIj630XMuKltDEzBzm4
         AhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863075; x=1777467875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9eW7q2/yfswm/0EP7ohuo6irtJLMRsFkiVDHy32ekA=;
        b=sf+tskz5MydpVxR4Z9oexfPhkytmXQIz4C7Y3dGu+Yuh8b7ss69iQ1KZ/uCfzlhLD5
         NwTXXnpLlJY1qRst897Jamya6M5VL4W/uR5sMIbdJIwN6QKnpcN7/CRbybZnkOfSadU/
         nIwjG3ohpU47zQ+3LaW0NBh+QOYaZNcRPcz0SJUQqSAMQZtWN0JkpVDq7hfL9LMolI5j
         Uj5vi8pWsq+iIQF+eG9YvHrCP8vmRad+IQVm0Ia5MiHQwjKnq73IVcJOWLJiCeHSjk1N
         KanBw3DhNX7RhHOM3FWiYP2h4aomN7XDx9AcqlPwiYrdp23x4nEOI8K+mt92Gj9ovF7k
         kF1w==
X-Forwarded-Encrypted: i=1; AFNElJ/yYR32yL2AkDGXfLRvOjBJ9WsTPCz7O+l7zFQknDMSGXsdNdsGiWn3kZmdU2xWjXi83tAAePPLxWdu@vger.kernel.org
X-Gm-Message-State: AOJu0YzSQ41JCR0GSrOjW38NNwqDKm1T3PdLt9dG9+5rg74+UMXdrv3J
	c0AgCbJS471CKWqJNpuOuJ7PMjTBfggr5UZbE8ZnFl0vBuYQbLsHYz2OFfHLN9MI6h59dn9uEr+
	0EzxDT0AXbmECG6k3dBcWWhogji0tdLaOQ1GONkk+D+thZPKK9r1Tb9ACIO/l9wu1
X-Gm-Gg: AeBDiesOa94q8gcJ3XtEy2KpO2/EPT7xy++/2+TNRvWZxCoWWqO3XvsvOR2bjuE6LZa
	Xs3d+QpH4r27haXrXupkii58DUJsAsiozm6rY8XlbXueIEnD4VnCPO8LkDtkKzLfwkVNfz3flyt
	RRdLK9rfKWru3jKCK33Htxc7eMn8pTsuTwhg78PUKjcRkGOR3v+8HQYCdHMnxSVbYM53cG8s6N+
	kgJGBXn7DASx6OEDlspQOjAawoFWLKmylo20erh3gHfiJo8k5BZD1t6RITOewHJ998my9si+JHg
	OQMNshVxED+cFAAmwlbD7K3ogpItFOMwYMoVvKSv9kz51sgu3ECh8hhp9Ux7mremL2XY7Kjclh5
	Szy+vlkB/PTvcsk9FVoeFUAb4Opv9ZnEtki7KU339T2JryE9v0V4BQxc2rxS72SNg1b36rUVR5w
	YHKr311LY76fJXmA==
X-Received: by 2002:a05:6870:3269:b0:417:4754:c10e with SMTP id 586e51a60fabf-42abf209f86mr8474883fac.1.1776863075405;
        Wed, 22 Apr 2026 06:04:35 -0700 (PDT)
X-Received: by 2002:a05:6870:3269:b0:417:4754:c10e with SMTP id 586e51a60fabf-42abf209f86mr8474824fac.1.1776863074872;
        Wed, 22 Apr 2026 06:04:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e21fsm3263165a12.8.2026.04.22.06.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:04:33 -0700 (PDT)
Message-ID: <23fbb36e-56b4-4ecf-94e9-4038c6311b31@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 15:04:28 +0200
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyNSBTYWx0ZWRfX1p3oWkgxq9Ih
 FAs4J+SZYs/PYTops9+hMBGnfQG6whc2PC3rBXD/9nSUNQ7o18Au0Ie9FQBbwTzZulLIlUhZyse
 kdK8/FXXy7QoBoJRvKY8eAsU/KoBfSOOhpb6SEPJe/ttYQiybMxmFIOf62DKoF4KvYaoGQ6JFr/
 Dc/dZsXfVubW3Z4NirDvjRvM6Gno4uJDDK1EUjigVsnodp+dqitXQYZh/OIZFVvF/+Y6HGi9DM4
 8ITGagJ+YRe5EtxOv/DiXzStoIMJZslXqn+rLPe0CNBlbt2aDiaU/ty3xqgdDVGV4+WqepQcvbk
 JulVeIY8lDC2vucIGp+S1TDtrJpPbOhj51hP+PLvRf1mG2OekVkw/fza+Hp5j5ft63Fvee+Ct0d
 Ng0l+DZn9tXcewiCEdHrfB8qP3/uBK7kADLueO85rEHgNvhH4j3/ZbTvUMnaooTaMhnR10fcf16
 knyYDZUs70T9G/CIl+w==
X-Proofpoint-GUID: O6bd8RIE9RZP5weNDX2edBCX-sGTyFdN
X-Proofpoint-ORIG-GUID: O6bd8RIE9RZP5weNDX2edBCX-sGTyFdN
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8c764 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=RWVxF5DFbFL-aEys5QMA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220125

On 4/16/26 1:05 PM, Alexander Koskovich wrote:
> Add catalog entry and register configuration for the Adreno 810
> found in Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +static const uint32_t a810_pwrup_reglist_regs[] = {
> +	REG_A6XX_UCHE_MODE_CNTL,
> +	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> +	REG_A8XX_UCHE_GBIF_GX_CONFIG,
> +	REG_A8XX_UCHE_CACHE_WAYS,
> +	REG_A8XX_UCHE_CCHE_MODE_CNTL,
> +	REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> +	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> +	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> +	REG_A8XX_UCHE_CCHE_TRAP_BASE,
> +	REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> +	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> +	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> +	REG_A8XX_UCHE_WRITE_THRU_BASE,
> +	REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> +	REG_A8XX_UCHE_TRAP_BASE,
> +	REG_A8XX_UCHE_TRAP_BASE + 1,
> +	REG_A8XX_UCHE_CLIENT_PF,
> +	REG_A8XX_VSC_BIN_SIZE,

This REG_A8XX_VSC_BIN_SIZE is removed from all lists for all chips
in newer kgsl

> +	REG_A8XX_RB_CMP_NC_MODE_CNTL,
> +	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> +	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> +	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> +	REG_A7XX_SP_READ_SEL,

Somewhat similarly,

TPL1_NC_MODE_CNTL
TPL1_DBG_ECO_CNTL
TPL1_DBG_ECO_CNTL1

should be preempt+ifpc for all targets, it seems

[...]

> +static const u32 a810_ifpc_reglist_regs[] = {
> +	REG_A8XX_RBBM_NC_MODE_CNTL,
> +	REG_A8XX_RBBM_PERFCTR_CNTL,

This list matches the expectations, modulo this RBBM_PERFCTR_CNTL
and the registers I mentioned above that should be moved to the
first list

[...]
> +static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] = {
> +	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },

+ RB_CCU_DBG_ECO_CNTL to BR

[...]

> +		.speedbins = ADRENO_SPEEDBINS(
> +			{ 0,   0 },
> +			{ 242, 1 },
> +			{ 221, 2 },
> +		),

The DTs I have all point to SMEM-based SKU checks. Did you find these 
numbers empirically?

Konrad
