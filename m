Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124D4DC548
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 23:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528370; cv=none; b=cyV6TedFy9oCliARJ10/XMfYC1Cj++C/qbYyLShkWFyRv2h6Xw8CC2hi9ZtBxoI//da9boOqyPvvK/nVNgmWADGc8PFT1/EdwInwuGcffQT7qgpnqQm+KuQbZ38vtQjlkHj2NQdrQhuYRepn+8SgUyyXrIochMfDFlupEdhgyR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528370; c=relaxed/simple;
	bh=ik6qRM1b+GSOzYVmRNftG+yVTmBox6vYkCB/RLM8Lso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdLdRXYGXDDBzRUj8NpQOnU02MtOAj3M7rg/YtE/Sefcl1mneKAWRXmE7B/v/qN/baITBrkwMDTv04firSBU4LF8MX+Dis8fMq9jtTILeWgIzANnOF5aN7s1/NRnkWfhK3XmcoEp+g4FHowB2eHxrR01q/mMn9QPMgZ24xgTMx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKO0kRCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLgiLP0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKO0kRCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLgiLP0W"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JZCal1039548
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 23:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m/Ok5eZP2WT5DjxR3Pgcz9Pv
	ezqkWw2q1gsOHrEJ7Lw=; b=AKO0kRCc4FDL0Exl+w9EmkRmbCgOCv8JV7dF5sf4
	Xzk6TaJzPOo2cmh6tnW6DzwFGBFmYwhKOZ1i2RbCBHE3PmpCueZa2uBNjAdt1M/M
	uUsP17oebLptspUQmUra8ebiwLAr3hLP0ixLkCk8WQD7c0t9DZ5Q66KduzYXG04/
	zSLCshI8fbZVbNFTjuXbBN32KGDnDMGk5D6NZkwJ+tE+pkasYogjvtHeRNQmzJMv
	SXJi0xul8oDXT5Lvdu2Sm3mmo3oWZXWoSZW1XkYefTtY4OFWNMoj109gmU9SHehb
	uhdY+JZpifSrRvdm+leYkLjqNHWy8La89tMIaZLGmyRbZg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8gpq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:12:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d7670e38so125296241.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528366; x=1781133166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/Ok5eZP2WT5DjxR3Pgcz9PvezqkWw2q1gsOHrEJ7Lw=;
        b=NLgiLP0WyDX+MbJbDcYB7talpPrCRiVqMe8aqClf5f8x5e2OvNcgAGskgDDLDPtf8h
         /0IIyYFarQNUmdgUNtvN8ha4cvVdwW7AZ2w3HOl8HMHNELCwRR9V8biJYwqgNMPOIpqs
         fXGg8DCzLITqH0lTxIXXqFmyn6AzZP+KuMV0A66I/ZpUnJpxEBFg+LJ4KSoXc9tAk2xi
         MZyF6g7x8cmbT7tqd19uyJd2i+4F9djLQj4A6g1F0U/l6uoo6SkYdqw3bBMyxh8eikmz
         3vD8DNy1IAZ+r9E97kOW1Vd1mzPTKPEIFznhOYXPhuflVWrc8MzERhQHg38Ttbu61OMe
         5zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528366; x=1781133166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Ok5eZP2WT5DjxR3Pgcz9PvezqkWw2q1gsOHrEJ7Lw=;
        b=Xo2a5WYtPvgSObdMsKW2r+z1UHlcIHuprQ8ouq+twr8RrbyAMZYtLmDVpMOqePdo6v
         GeJWYqrv4ZUVhteyYssT8to51Geq8VDGbz6+M5QAG9yoY5UpmEB/qaVg2LP45p+1WouQ
         T6feeMLe86m47kULkL21xQ+DuyAnHDsISxaYW74qx7yPaUgD4iSbBPhA5v3l0+WV5uzq
         38DPyOvFGqHwsiBF9vOarkwa7dsrznD8XX2mWxHKFMvvs762iN44Xf84OmAp5JVfBbsE
         b2oJvCZJFW6mZr8cF3QkqFG0dndoWAszv2vgQ+UdZlpwFuDwNZB3RT4bnu1ECvgnxp6F
         TPHQ==
X-Forwarded-Encrypted: i=1; AFNElJ90otBoOfMerRoBx7b1KdPxGZmoU1J5g09xGPbwwwNh0lViM/PBLCM6ObXdj+vwIexQ5VR62x1ykdeZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4r00diMFi1DyzatPVNZkJtfjRTw26WzMyvsyJyP6XWKtD5FX
	BaEUTDJ+wFj+jFN7UVC1rgSvLEqECxes4rWaqotcoDCeop1+e1kpNaACTgrYrIOZToKt0ajCApI
	9Y0cjmx25r8A2DZ3KyTdP2LcXphsCPnWg9OAIAdlKFYDll1vbVq+ZGF0/3SrZRIWL
X-Gm-Gg: Acq92OGvA3eWdLXCbGRPz1uis34dF6zIP9JcITDyAOe13gxP4qmx5GV7upIk2M5W8zl
	AVrpmveFg3KHSK2uHhdkiaRqwbNmXbfkrtgGDXy41Dw4OIySB0+ycMLPJ92W/ChHyUWyPcttfpL
	9deuH8ZcPC6KBX5TXMnQmCkmONvVTg42DoREHtgHk2DuOT1w/AoTAUO3QMmlTACspi3MZcpodbv
	EvKvuszk0d2ugXvmDkvgczsZc/S6IZqoM4GX332/49ZrE08wrKOjqJpfgiAH0AjEMC9GXw893ug
	EduwwiV8prO+0rOpio/IPATyR/3mSTG5NVgeHWCBLezmi5+aK+bjydzqI2FzXT32BohYH2d+RjF
	yRMAUz5tQLhk73au/jxpz0n4FQcFa0vrmKPYwMGTHEgnZC6J6oeppdvilHXJogkjg6P0fuB4xo9
	5pOHdi8WG4cIgatdTvD/NJUkogUvDvoDxPRV4qV4UM/kLbnw==
X-Received: by 2002:a67:fd88:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-6f552a06f87mr522634137.20.1780528366040;
        Wed, 03 Jun 2026 16:12:46 -0700 (PDT)
X-Received: by 2002:a67:fd88:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-6f552a06f87mr522622137.20.1780528365620;
        Wed, 03 Jun 2026 16:12:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm870868e87.30.2026.06.03.16.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:12:44 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:12:41 +0300
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
Subject: Re: [PATCH 4/5] soc: qcom: ubwc: Add Shikra UBWC config
Message-ID: <2idag2lmgvmsqjixrjr4y32jfaa673h7jrei6pjjn7gm7ybppj@n5zycvdpmw24>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4dauQxEyH7bLBaAQDza5q_1qR3SEigBm
X-Proofpoint-GUID: 4dauQxEyH7bLBaAQDza5q_1qR3SEigBm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfXzKkkyrFJXmJJ
 Z9ldgBoRTHXrbOneOlVX9W15q9vywTRkvD8z5OsahdIVazw7YFYSmf0ixKa8DbWaHB0KZ1uBbDf
 Jsgo07UUTNIVQkZHw5g8LA/VlQW04ne1e+rgEodbF8l0GN1L1V48hMDygjGq/NYoCyAoYk7qMR9
 KwpzvrY4IMicTziMb7IlCcFpke20IvCq2fQ0v4S6zbPM296Gs8kGwxRBEu+u2fBDdrM74IS+FNK
 DgxugaFRdzEEJR1aHzSnbVhSR5RPASPOrSg9IhKheUPm3cx779zKRMMt53UTX8Jh1FGhT7+PBL4
 yWQqEWUMCGt3JtZX+Fle9SN//FBqtkBQGDatfQXhISAsz/r2N0ML0EeA1X/SD69lKU/mBQpYi7T
 LW4lZo5lP1jXhbc8LDLXEp99z1fQVkL0VzM7nAglIJMLXVOEiauCA4ywEKoCwyEJo5NyskPM+/s
 EZV5pdv/YwKo4Px8yAw==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a20b4ef cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Y4AeZ4K9FrMMlEv3RhwA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030226

On Wed, Jun 03, 2026 at 08:29:29PM +0530, Nabige Aala wrote:
> Add UBWC configuration for the Shikra platform. Shikra has no UBWC
> support and no highest_bank_bit setting, so use no_ubwc_data.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 3fe47d8f0f63..01dca97e2671 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
>  	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
>  	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
> +	{ .compatible = "qcom,shikra", .data = &no_ubwc_data, },

qcm2290_data

>  	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
>  	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
>  	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
