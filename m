Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD7B478868
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577676; cv=none; b=ZcDPbbXdOHBIX3AnSDK0MIEUqlA9Ht3ngZ8z7t3Mn3IlO1kcSMYuj+/kEakVRInAQcn2iTMXpW0OgPxB5IhyYohe/ACM/FPPFzbzj2/yi4mlEqBGTZAheg0eVCziQ/M0U9KqBpRwypgaaT5ZDtTMkaHyLHA29p/Fe6upVbO3KgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577676; c=relaxed/simple;
	bh=OwWhwAotVQH3rsSdXQRsQBZTEa3eqgdHd5bY8AdLu44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=du3V0yOit7ATdyehO/You8fN/PVCBEwZ7eNdO1owSpopgF8nSdZQA+ZuEv2FEPXexKltGLJm/NLAb9QoTJ3nZaXDKWK1ADTdIedwVcwCqi9rrQtnr+laPcbRu6sy62ce+ky6NXluuQLwnvGuQAvkZKyMg8mz4Mdjh3Si+C9q23w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nydNX8LJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fk2UEK/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nydNX8LJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fk2UEK/G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548UJ4G313926
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 12:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y1M+AD0HzgLHXiH1WXXCQCSg
	tLsSzH+qDPseKkIaoiE=; b=nydNX8LJLy0aABXqeGgQ/D/uwwN5k/oQ5EQpOyWA
	rHV0yg6xamAmp8Xiu7C/tWRX0AUPrPeVD5w2tzaJQ85lKH/jGZ3BOH4oD25DpxJU
	7xCkntxHLwbMQx0KDXdSeDVi6uPRq3ChwAzq3OAj8HcV7aNzQKipF/uFcHZt2um/
	1k5mguRhB2LaVYXGfhvv9jPK0C2Wi5L64R5wd/Bck+8FjsxCWT1wzjdi0MVF32SP
	dIvxb/7pLRmUjCZqOZKD56zUG9Y1IfTdVWUhSCcLh/lMf7d5Qo60Tu60lP6oH+st
	rmcwapviYznuh+b+4RgRwUU3uWEeszhkZHDtcFmMOza8DQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v2ex7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 12:54:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751db2792dso345176137.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577673; x=1781182473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1M+AD0HzgLHXiH1WXXCQCSgtLsSzH+qDPseKkIaoiE=;
        b=Fk2UEK/GxgNvkGauZwgKXUAp7+bJEEBwq1Hc4c9DJs+gpWpaL4LyaV23F0czhhMpNA
         sqHXOHtYrgRMyMOhpT846ZVBFkRnQl/vCF/kv+YMwidADYpQOggXNy3Wz7jSUXBf/7ju
         WY2F7gyxXbwrwYLzwn/WlLPIyeMzRwHdDHH2dxndNQuBpRRcW6x+wGpri6Q7XZK60XYa
         u0rVH+Pbh8KVw7FeMfm0oRL3xEsalEyYnes6CAyXkXTy0xWP2bgmKQGsvZVH446Oq8Fc
         /F7JV0weSptwxSCPGNX37dHqAlTVuQOV1eD1q9Bt+HeM6QQj3p2zYb4NswgdhO5Waozb
         a03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577673; x=1781182473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1M+AD0HzgLHXiH1WXXCQCSgtLsSzH+qDPseKkIaoiE=;
        b=ohNdjYIw2f23Ro53ZZ7xm0lHF77pPOVc03nEV/kXa2rRhPdYHkjPWY/4fpssmlYFUy
         ySv+w6lBJaTBjDKzKPqOYk8FdYZPIhubpxZHt/oe9Hm54RkurGrc9eiqnoBHrlaihgoz
         OOtEmTRM/N6mwhLMk2tOsLbl61SHjfakHhBcZrLrFay0gSs+pNm3eBdEtmmu9GHJKueR
         kPeVAho5lZccDVqdKWNqDQG9GiEHdliSm5b+nEyjS/LmhSGVGsoq0dO8kMq/wnQe1iUM
         a4aV/6Bwqp323QwUAWy6GoxKtCv6b0HuKzGc0J80ZdpmdRSNwKU4ErrwE86aAIv81r/B
         +6xg==
X-Forwarded-Encrypted: i=1; AFNElJ9253XFitDQvzcyffxxvpQTCmFZnuQh9/sUDzBXaPGa0fMNBRuKu7pwtu3BEarolRsYyBFaZ/VRx/U4@vger.kernel.org
X-Gm-Message-State: AOJu0YwZDE/3d1oEVEHVDTy2LEA0+OYxf7HnuOzfh5tJ4dtUqKqLU64I
	U9LClFjqM2BGYCH9yA+dJPY5LSKoQULC8NPVEtmgUq97njEodUcaQ4f0RGVp4f63akrIddPJtTV
	1MDDtPIrOgTnz6o79wnI/cICeatPmwmCotr7CA1OCF8qsV5Rcm2MfllTk7OS0Krl+
X-Gm-Gg: Acq92OGIZzm86Idx2YkMNP5eOlz89Su3B05afNo/X7T9BeXG13UUcj6TfqlN86Evywq
	3Hu6VJmLtqcpFXn7rUeMFCY0do7QqU7e6mfiHGCzVbP3VM+lxvpcDxgfhRBhCt4sNrEWF5NvKQR
	Bzw65TPB6/+KRr4V3eGsXRpwzydoTbtY9+/RjB8Thd41DSD9xAN5uJ3tdaESStknwyHbJVK8mGu
	2as/U/iEpskd/yyff2xzwpFdJAnH9QmCE6R5A6Wnc5yfkeubdiVr/zmuhZfg52kYtCut/tR9/wb
	arzrMNhCb/m89hukIN+v0LzbNEbXpZesb232o4t4nUfrtHgIqfiNCSexmSinoWZ1CSKPK8HiS2M
	aNzHpddJ8fq+b4J5MANT8/Txv2xqD6oDz0PxxzHrr6Enbo1ILmKF6VwDyHf5zShrkhzgQ3ahyuE
	8HzF3QaEP1kx7iGnj9//Qf5E2XCdenu90nc/bB2aIJ5vN6Ig==
X-Received: by 2002:a05:6102:554c:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6ec2a218ccemr4587379137.6.1780577673394;
        Thu, 04 Jun 2026 05:54:33 -0700 (PDT)
X-Received: by 2002:a05:6102:554c:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6ec2a218ccemr4587359137.6.1780577672874;
        Thu, 04 Jun 2026 05:54:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed9eesm16343671fa.40.2026.06.04.05.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:54:31 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <wn2tfhmskrlf6ewusqt3uv7xg62fl6h2qz4qz5dyf2az3vumxd@dhphx5seowr5>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX264o6we+lxPy
 ipjM5VnQhZ0CcS7du1po4/uFjyfpRUqNjzpMc+aphJcBSNEuDErAXxPQNnvBeid+U9uQyr3IUoh
 dYM/JYOif6LBoOLrNfc4Cd/PfYwpMZpTJ7r9IHtyPo8idTvFfieO5hi93L5mWkrOPioEv83uHhw
 r4Ts1FhQDbNMZ22EX3nGJp3uIiVQM1cm1ETYcaN/5FiWK827UBOo6O1QHdkgiO+lf+ArxnZaenE
 QYvllU1AFQpMc19K/FwXapQScDsZdybhmBcG8Si0pcRQkJJkmhicdNtEmxgqTdyvgdDXg7B0CWp
 akUWfa6z9jJG4OWVRDbYSaBbQIJxoGjUMKEzKSXbxIp58IaVfHeE4Hj989/wbPAS4PRzs/9cKG1
 FBUyDCsRpkBt65Bbz0iQ0reJa9ikpgeESD7yxAY/CBYRSBCozSqZNy9IwG1ezHxnh+SUKlBraB7
 HPrg0lR5A7Mmm1tbZmA==
X-Proofpoint-ORIG-GUID: tr-xUKahgMqbvPBrJLKQgDPZ3YRbRX9Y
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a217589 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: tr-xUKahgMqbvPBrJLKQgDPZ3YRbRX9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124

On Thu, Jun 04, 2026 at 06:00:48PM +0530, Nabige Aala wrote:
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Move it to the series adding corresponding panel driver.

-- 
With best wishes
Dmitry
