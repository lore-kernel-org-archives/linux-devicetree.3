Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CF4207A20
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571422; cv=none; b=lRMtAD16wH+2Jj0H9jAlRasGbNtzcuS94Iowol9oqTUFYIRCgQbOpTqWTAIQAF2Xm5JUqT8OL1B4yrIIGGIEAAtJQrUzIQxTgDrr+1bFTX1LhpXhRH/NVFB37tcV3MzkT+iT1o4p7/Enl7Zqw6NxI/M8rc6n34whmGfRVu9yge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571422; c=relaxed/simple;
	bh=eSV9WPMekMGnDs84RVMY+Sp8QhufZfVIYVV6rqC3r7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pntDztLEeSsJ3VWZdBNRgbbUyythp53siBPHf6xkmNBMdKWtmj5S8ZqRt23QBpnh+Rkkck5PJN8qLKUAWtrNRpdcEDybrf22Kz9+rfPP6pI/FOKw1hstsNmoKz+SvwGKTlg3vW3VgXOhb23KF68m7Jl0UxsfiKk2qFsBvvQ0k/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LA9/oC2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSK099So; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LA9/oC2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSK099So"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0Ohoo2064500
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1kbaM76E9XIMD3rRvXUXjCdg
	vz/AxED9u3Llq8yAVaY=; b=LA9/oC2SG+bp/2vSC+T5fzx9421r2DAAaLl7vYxz
	5gVHBtNNd61dUXxs+P2hgXdQKwhII/PoVX9+LOmFK2TACn0bv3phWGb9O2G1tSFu
	0XKm98eBi5wBxbGMv8NnmJcXsN/FCMmNEKxK9jKd+qjreQJ6IIhL8nRbon8fvdvz
	FWtK6yg1qIIDlB1xOI4IxB0u6/I/Jdjna/QcrjRtOlui2t0vwfV+S429YTzNiiuK
	tGPx/9CgYRamLstltjtBA6crY3Wi+5zdSqF5fDk0OJwD9wEZxer6xX6WR26ZUnDH
	SWkQO5fvFF2aqg/RGrVZXaDVR5kKdPPLVw1GdMniOg+o9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteguuwua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:56:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158f2c4b55so640553285a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571418; x=1782176218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1kbaM76E9XIMD3rRvXUXjCdgvz/AxED9u3Llq8yAVaY=;
        b=JSK099Sou/sSGXzx0lCtyUjiaErAGSnGBztsi7jyOxvA7TNRFp0URpPT9I/dIOGzN2
         Tp6LttvLDTHnOU0gmZ+8eVhjdssHcQNaJD+wc7RKTxgjliNJXWheti9d4Gi4O72khdZw
         8BeRaUKTm2mVaKK0cHQIedBmVYQ2J+/UCyQBV9545NSD+lVntReuQ3Y/0xOoP0AVy7OH
         hFGq167XojUz/BnlQdFsPjxEtIrru9Nk+3zT+dYIcbdRoDgbAhTvNoBAZYvrpZXr/M67
         01LByxgkfLr0M8KkJWC3XrwxknJYy48beyUId1/E/jPPaV0VFYDa+vP+LX7+GRDD0s4u
         QgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571418; x=1782176218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kbaM76E9XIMD3rRvXUXjCdgvz/AxED9u3Llq8yAVaY=;
        b=qiRwD8uueG20ZQ/VFmF7G5HhHDnBQcCb6kMPQ+DMESU8j2N7GDdtRPao4+b9kiMSLU
         XjL2w5bxMjEnjC7GVyhG3x+KzN29VdbfS2umD5Z5RJldhNo5BVva+eGk15oqW5mxyhSj
         hHXpg+0upOO+Ltz4Jayj9tOEn/yPBCcqfoGAnfgpDAYgDBd196Seugyvez8l49c07Il2
         Su/KLJSI8uftzPYLZuS0K2tHN8CkXiU0b3MZDHm+WjHYJ6cnlGBHsCRCUVQrGerJdGzo
         hZ5rVMYPjGYXDGea2co+LHWAnYTxvw4vDTwUIF6trRxe33PTLDVT1FqI/zMYSW4H9EQK
         GOuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/F32MMYDLy8NYZ9dkXzE81G02armvTObuM5on5LDmsoo2mAqarPAFtOZD4ZHg5CoRo6KLyGCOTYXZL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8AW63CjR1438HyHz8i8PfJZV+L5GreDt1Y+epjf51Ms+H9Cdf
	LRfi2SsW8J6xQ6e3Rg/aBJwLR014lNEwuJEhYXF8LxoeapUl/iI+apeQuaCRMGmU4yZPfurBhdU
	EyIMz+GfWb23/M04jcDv053UZAFcvnot2Vh+Z7OytKp8f6zFXvWEVNLlZUzI2p6jK
X-Gm-Gg: Acq92OEXH8JaRY+K+nXci36KR68iRthIrpl6ywyP7LXUFJkZ4dGKMLoHr3N9xoyyq7I
	gEQxOiV5gGmT0GEiLmlYBQQBMkZKPKaEj1yHDk3nSCSLlj06C+7N7Vpwdpj/cHSQbJ2Mmm1I+co
	VRiaeWgHzf84I+LGtso9srYR/tHDTvl+9mpBLgiEw7ZOTZ8zC8PydpNR7VTauT5UBZPCIzFayyK
	e+MM26cRHlBr6pn1WIGRkFVEaZ51msPIzWqImaYmuf/twD5iGOVREl4Dq/x22qUMEKAn3WYZehE
	o3WhywYDb5xTJ6H99Z5pHd/xHOkjUeq4JPHxer9pEkTtRwMLQHDZ1QZbzIFs/9pV1ZaXpKCNjNV
	5YmbHqJD8Y3EYsWx4Es8Hs+YcW5aYqED3kIrtrqsHqGZ81e65WTLI42SW6suud6O/Win0xO7J1n
	xFVMLXnsGH1JrQDXJFlJi71+x7k3DabtLL6QU=
X-Received: by 2002:a05:620a:258f:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-91c24579d0cmr350394485a.20.1781571418327;
        Mon, 15 Jun 2026 17:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:258f:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-91c24579d0cmr350389685a.20.1781571417856;
        Mon, 15 Jun 2026 17:56:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad3d51f20fsm925671e87.61.2026.06.15.17.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:56:55 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:56:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Add support for A704 GPU
Message-ID: <yldxcxtrdgsh7c5s5llnoobdmgnass6spyty6mg6yfvcrype7j@xhgga6vafd7n>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
 <20260615-shikra-gpu-v2-2-2f2d1347c3fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-shikra-gpu-v2-2-2f2d1347c3fb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfXz64TaUMp72xA
 3h/mCt4Q1T5rDvARByJAVSq+7YMLFgxeuIkWlR3Zs6PnViXgM55OZJ8aNWrbAbqHDkXsKxg/a1T
 j3F/lS998B/UkAbe2xvdjsg/6tqq+2QyEU3NPgTBcRg34tWvOOxsYD68BxNxARCVuPIAVz6mw5F
 69o8+2N8q/gTCRuQXrFR747c1ILwsRpusfzl6nMEVeiuZKo2798utCZNoZoqfSMsDPFsI1A1jID
 r81VlQgGQeT1ReYiSvxNYYykpsC692NRa07Ha9kU4nA0oU5A655k2L/wsJla5EX/Img+/7SsZSY
 Rd/NNjLBwoOnqcazi3/y1JUyuRcRLKoBRPcsYwlR1exhlatmuKz/Xn+tzMPvseEG5yexuqu3wy5
 ztSxfiq5aI31PntHvEGzZDWh/XDR6MmfHjba79tMTm4nf2V1hcD6lrAFNnelFx9D/ttUsVCs6sn
 a5jtiQOz/2U+FlXpzGg==
X-Proofpoint-ORIG-GUID: XPfLK8jdoBhYCux--CEN0pcVvgQxeils
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a309f5a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EcFSykfY_HSBU6426B8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX2/5BSefVPSli
 5V3DbGp190IjTGktcgXSdzgZEPZVHlg6RTstAK8IxvLoqRlkpk3T/fLiq8y0mQNe+UHEmbTOibA
 gEEt9PNaL7zYRMVOzKSCpdUki4htDME=
X-Proofpoint-GUID: XPfLK8jdoBhYCux--CEN0pcVvgQxeils
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006

On Mon, Jun 15, 2026 at 03:02:58AM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
> minimal changes. The only KMD facing difference is the chipid and the
> zap firmware which is specified via devicetree.
> 
> Just add the new chipid to enable support for A704 GPU in Shikra.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
