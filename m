Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809FC4DD6D2
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 23:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528123; cv=none; b=YT3aw7hvwt59ZzNz5Icw3+SJ3oyAs0y1kBU2DFXAuE/OypDBCsbhykat6GZhQCqPltkRG1ydoMdgC35Y9vVX+pliPV+mYEv/4ythiqNRtz0sUEZihmwAd3RPWCV2BLWD/EypIno/WbelEDTXV93RN3PcVfiny4KvmzuoOtHF6AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528123; c=relaxed/simple;
	bh=k9gdvfbRT5hx/HtCyubxxV4VnEf9J4znusxRO8Eh0lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ex/XlLxrhr1reklm8UCdPD7sbLeeeaAuPv/9+5rDg2QBUnEYrBORhANuKr7jk95e3Rps35UzWGBEHbMOz9HEzdCcNdH0/x3tqOlopQFDvTH6ZGDjD5mUkqZkIMS7UwduOXCEfxoO1aGzwdLkubYBai2x5yIRStt4inakT7vk/d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHI8Cmfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHvGr01M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHI8Cmfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHvGr01M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653GV35w2368039
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 23:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=03rptgprQ5ZgED7iO7IjtRFg
	pfYYqtbYZq3I8MdIhm8=; b=OHI8CmfynVWzzqxqL+5SSZMLwT0jlY38Fwr9GT35
	BuJqId4zl17zWmew6vwc4rVG6ZbUo8rMNlmNMOUsyNrpqC6DsV3q8b/6SaF1r5jF
	R3AImzs30KGY9dkdDnY3XNjsFlL2nxy98N+BIb2vOtRNC4YBzUj5CP3EVtHAul6/
	8RPh0EiC8DriiySDx/E6l7nuWB/z+ot4+jNJxXKzYhgODIX8ULfs4XsVKDjS+vb+
	rgQ+YOcOMeWd3/GS6+JZgWDuZp+bj0nyVYl+/mpnmhmUhXk4KCOAI0ngOVoUCbsa
	qMr5DIo+w+En1jPiAQ5ZO01Sg3YsqPIQ+8pWZpguO1mvbQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gk2xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:08:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96395e5f46cso121197241.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 16:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528121; x=1781132921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03rptgprQ5ZgED7iO7IjtRFgpfYYqtbYZq3I8MdIhm8=;
        b=YHvGr01Me83Ljb4oaNl/BwF1OzeezJB/13WraJsnFm7knRh5hdlA3M7RiJThlvUH4O
         4rdbjsWmdLii43f5CTqs/0hdCpZVj6sbPLWb+Ehp4by3WymDyz0ySrEwuCUq9oJ5Kt8W
         i5On5AbIlvG/cInwTVPlL8VJXRAkRqHfPNB03VWn40f/YhAMDv8Yd1Y+vAhgZSbmZyMF
         8esKjWhHhe1PocUc+upk7OfaVarMZ8VpeL03fbXiCcyxwxQChXzur3KQAtPBaUxPmUEL
         NG62r5Cq4uUyguvwr01KN4pFpXn6eKlVNBnOozjfWINoGbIL3/nxZejCLWNlRyxD6oQ0
         b41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528121; x=1781132921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03rptgprQ5ZgED7iO7IjtRFgpfYYqtbYZq3I8MdIhm8=;
        b=UL3WeA5ffhCXMGAIQzMjuvwbHgtfAg6I+o876Fl4VOf0ShUMZ3Q4C9vT6MQ9ZTmJyw
         OpZ/c8EcFrN+/QsoNwgBfEZl1QPhtbpBFigcY5lUGafNqWN10Nn0SiUglNLLVd0ZV4jV
         kd7NldlzX+VDccRMuGkRwKT6+qIaET6Rp66EzBKXEnlJQgXHyJaUGoOxrN+fn7LeV8VR
         KwFh9UHl+ynRDvxIPk/THpbu2ufx4SqgJF/lJNhW8J5mcQ5plT67sU/VtFs2SRyUJ9ZM
         dYvqi6K76yrw38/PdWieOkgXl+haF1Sl5AJy7l/C0tGVi7QPLs85pmui65wnHzoLB88A
         57/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9FoVzgKGnAhSzfw4+x8NWO8XWPYzqRU6j4KKBxzsQlj5NyLU3KWJyC57bJibPGXQ8GO5GXEd4Ry/hR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+18p4K5YeCYfGHWG5YxMr0RZXqLQSkP8DRVanoqsfKY7lKUEj
	mxcymbNiWbaCC6bbh5d4z60/9kBZ6tmFN73GT+jAQIHyr34P1PBi2BdyUkjxNlVVEHJVflvLWuu
	b4pyaUdoux8aRNggEifdJiVN+nMQGWqO7tOy7nWQKHxYBp2+eveD2LopYjbrx//iY
X-Gm-Gg: Acq92OF8zva9gWMIZ/xC4/IusRlXS86U1rfBZXa4BUQkykyL94jrit1OnkDl5D0ek8c
	NV+RfPvCyp0fix78ZhCQ9JJ1i36h5scqvZW/AhkG/cGYtSUil4ZSL68pDQQliwDaXVHRQoGmZGl
	vHUUFJ/aBaTUTA8S/OA2lVmUH4gKlOqoa0fpMMI4w5sHlo9tCzESF/0NyJpbOnDcYdSc+fFgaI6
	0OmgR8y2UlSpnpUOVgqh0SUWznSNCQMY3tRXStpSXT79UrdWxq84xMF69+1dpBSvl8JQu73Q2k6
	Bwo75vYfZIsYX5pTa8L/6eXAKjcxIhgzhdVg8UGYOSHFcQSxXDQ2Thl8to/7XA2cdSDpgYOitgW
	NPYgMtgPR3f1fCHf6I9UIVyEDX9tMvHr3+1EAXxqPz3wUKlZ08y/OQiX0XVtb0kTxwe9rTx6gcl
	6C4ttsGv5gYlaMjLeQTOS8MAKCRC9vcsYlhmYeZaxQXlkBjA==
X-Received: by 2002:a05:6102:6f0d:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-6f03c5be1bdmr2262003137.17.1780528120952;
        Wed, 03 Jun 2026 16:08:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6f0d:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-6f03c5be1bdmr2261971137.17.1780528120532;
        Wed, 03 Jun 2026 16:08:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac07e243sm12553661fa.12.2026.06.03.16.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:08:39 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:08:37 +0300
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
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
Message-ID: <4lozntipmx246uojyh5qso5kdplzyun4jzr6a6qdck7hfwoygh@tupqmauuswvg>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-1-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-1-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfXzQI4bpqF3XlJ
 LOEPKznrA3aXKt3cnojVgPoVA/TgHMRIdkuG8uwNKUIwf0R/TragWhcrzqhgTCUXX1Wu3dNyDDf
 6PAbY2UQs9ej3bfj9ZZYEyByhDGppowuOHFIqP7c+nkTXjUKSHHz9kl1jmBqBPDULJRE8ssIpMM
 0XtS79lXfe06QFrTWoTPMJob8KVsaWhUrbKvjquoV6x2NqSOEh7KaGBwnkfy7BX9CodvdJwuql3
 KNkSudn4rj0QKZ6KcePsKg6AAePi8Bcpt+y0+gLW+ySMx/pIcBSJJuOH8skFp03q6399jIOuW8W
 9odOqkpiqe/JDGGFhPdc3YdlkAJdDvSJ3kHGf4mu6RmdwiZvidy0oErZdexii2vwmPx4Q8OvzEH
 8dPWM1GfvQ+mAAdWfbs5oZU4FsCXVswRMOn9V74aw6EkVSVNPy579/QimFhIeuej8WhMJaMtAYf
 WkRxdllqHqvPIrhMfBw==
X-Proofpoint-GUID: zYLDo3dY9huDkzb-4_jvYjDbNwZZNHIO
X-Proofpoint-ORIG-GUID: zYLDo3dY9huDkzb-4_jvYjDbNwZZNHIO
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20b3f9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=irWgbQPqOsrm4l6MN8AA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030226

On Wed, Jun 03, 2026 at 08:29:26PM +0530, Nabige Aala wrote:
> Shikra SoC uses the same MDSS/DPU/DSI hardware as QCM2290 (DPU 6.5),
> sharing the same register layout, DSI controller and 14nm DSI PHY.
> Add qcom,shikra-mdss to the qcm2290-mdss binding compatible enum
> rather than introducing a separate binding file.

Why are you introducing the sole compat string instead of using Agatti
one as a fallback?

> 
> Register qcom,shikra-dsi-ctrl in dsi-controller-main.yaml alongside
> qcom,qcm2290-dsi-ctrl, and update the qcm2290-mdss patternProperties
> to accept both SoC-specific DPU and DSI controller compatibles.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  4 ++-
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 34 +++++++++++++++++-----
>  3 files changed, 31 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry
