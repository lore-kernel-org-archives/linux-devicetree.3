Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B00175A6D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344058; cv=none; b=BPozlIj3bIJuhccgAqOuww+Qg/r+kuV/ET8BFhlZXNSaaYEKelD5L4QfS4gp6bKObc6Otg5xSiHDfUOseG8evZ7+9P5P4Cx0iLGRQIP5YQfhb7SAP326x7QCSKkTYqXOns886t/cYXgZtgzTMdyrUJCpJkgAZFaEcxm/1j63kyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344058; c=relaxed/simple;
	bh=X5HXwLu9t1UwOwcHmCYNUZYuQjycJISbv868z5ah7Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYLnjmMkjr6w6axNR0VB/8UnoQlFuti7I2gC26a2X+sJcyxelGtsmRBl8nBl9tWLVDR8Yq83kE9gc1fjoQIaFy8qAhJUQgYVGPzNUK8Ia+kcx6KcPqFtr//DJ0i7fSp7T3gcJNTGifC+smUaToxDl7uhyNerDcFa+WM2iEFIHxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csTbHLDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIReZ4UZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csTbHLDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIReZ4UZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNZ2lb2598180
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fU+lghccay3l1YWQR2/TeQBg
	Cl7YEhDXjCfG/4VrNcI=; b=csTbHLDmRcWjzPz7H2hA8nEsq5UI96VBpJnRgJnf
	nXjIfexOeAwW5G86SoKx5p8ESVoAHQJHy96cbGQ7DEO2+hschSsiyZpnd4aZ0WB5
	Dg5L5fTjbVWBWynlhDMnrRpE9wZfqncsCl4mG57V1qN3P1WoS6YJYyLFrPy1HYTv
	M19EjO44YwpE8y7D0+fiIiR200LT/TlTj+9llC6dBHK7Zzt95HzuLhCsbXbL325r
	JkYkyWAyX9YrNUv0yMlGlZoq/SBAd0jP57NVZC+tETczp9JQ8XSQnlely7cFT3Qx
	oD+iYJTBJC0AJ+hAtGiaxO2z5+1MT2IXWihruGGVhDjPaw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd4dr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:54 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8337b12d0so828663e0c.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789344054; x=1789948854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fU+lghccay3l1YWQR2/TeQBgCl7YEhDXjCfG/4VrNcI=;
        b=IIReZ4UZrPx4PGn8b12/Jp5LJpbEzi6vX7SH3qcPkYK+ODRT7TvhPtFnQBM6+V7Zrm
         rNnQ1Biy+HZBVXMv5JjwsRPv2Z990EQU9+ajSR6cccmwHxe5vhDphMYD2ssp5qAXzSek
         eKhrZ8hnL6q8VOfGuQuO43QtqcvXT2WdEIm7qCkWnQO/yJ7HvaSLE7x8Ri3BXBfTj8HC
         mYKNyOOmD4XRkYa+4rAq/cP9dso+Gwcm1ob2c/NwNbYi1s3Gu7GI2vB/dWGzrYhMVOrY
         zkK2gAca0NNUWzBUOZ4q/VG8y5gxcwg/90rtBgtIWzO9eSvkKfvLJRlHPBgsq8lr2EzA
         cw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344054; x=1789948854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU+lghccay3l1YWQR2/TeQBgCl7YEhDXjCfG/4VrNcI=;
        b=chjb9TXSl17JIRvw5HCgq2wILwaAG46R2DdYGherWSEwzt579cR+8YANOOanfHgRGy
         2S07HMrFHQBhOjt6a7gyhedw4R4D86csiMwe+nxLXIxpT9zp+SnRycD+PcwxNVIFd73f
         D8LQXDToPJJBIWxIYAvcuUCGi2qpgN8X7OdyYyN1WraLPuzfdOK2mZuVtgETHeEjvtRd
         rkkyctGp71K6StvqjRlaP71Vq3p6SXEWDiK+VYtHNS6J/e4OfW7/qzvHArfYHjU15Hqk
         K7Qwupz+y12HMPO6GBnEzq07wy7nDDsRs6EGxhxGT05M6npQFWYve7PsxRPEO1yWTL3R
         1UTg==
X-Forwarded-Encrypted: i=1; AKwUvBxbqO5HpeVICe0NaaGmHcOcKG5eOej17i6ShZrJNj31xstwlf+N7HOpP+li9xrKPbJEY0963T6vWHp9@vger.kernel.org
X-Gm-Message-State: AFuF++mAIy06qPSH1EvWEd3+4MXOWENQbnyoCxRXjgcz7Ah0oS6GR2ch
	+jsWI6D1idvsx83v7coi0PRHpmuO946BUInv2ACrliGV4fxRqGsxNpGFI+23UwRCx+B/b39BdCi
	nvRRScGe5f7xNI2bJwSa5NbmMtrzkN6F+SBDbTRqgrzdwnqR1KlOEG/uIM+O4j7iZ
X-Gm-Gg: AYBFou3i5IgltRT8x28UmGh+0GNqZrXP3IlPBidF0/IyEr4hC06yDjiaDrpWlm7nlqb
	2fuvklE7qyH1sDHmh2Y8e0V/sfpaCVf1uuBK/LacEwBBdM2t/GvQvQFibQXRhhv2R1i6LN/ypoi
	jTtLqm0l4lb/Ufn3ALyX1cIkakGstvsW4vjNcVgTAKbN47Pvl4aUpBr7+4y9Q3MXTloTKs5ABnH
	RFLn/Fb5P4S9zV7VysVYvA1oDJCO8JzqrFhqm8jAZxpF8rK4MiscMjCax7MAdCyEPZfi80gBwN7
	p2xtrBaiyI+TCB2zKJjV1VxVYB1lKVs5QE9ME+GZvyEwTGrmjtVgRpLyHoBWMRWnHTHZIxJ/pJl
	aD2X8lHGd2gV6XMHI/Osg1EyzLBxOpisMkDQyFVC2aXaxJVSw1szqfKJOZpPwSLvuQPs4yf0FeF
	1FojI4Lz5ry44N
X-Received: by 2002:a05:6102:f13:b0:79a:21f6:20fc with SMTP id ada2fe7eead31-79b5abbb41fmr37347137.10.1789344053618;
        Sun, 13 Sep 2026 17:00:53 -0700 (PDT)
X-Received: by 2002:a05:6102:f13:b0:79a:21f6:20fc with SMTP id ada2fe7eead31-79b5abbb41fmr37319137.10.1789344053173;
        Sun, 13 Sep 2026 17:00:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0464430sm2051683e87.42.2026.09.13.17.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:00:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:00:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 08/17] phy: qcom: edp: Generalize power-on path to
 support per-SoC overrides
Message-ID: <mpkoztwm2ts4pb3m4t6347wfes4yeua5a5uxrn66dgmn6b6gpq@syu2fxzfmvp7>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-8-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-8-e25c073cf1b6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa73936 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tuu3QHpEyBHuk3RROvYA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0NCBTYWx0ZWRfX+kF5+jeRyzyW
 T4zZwJLEFRp4qiaGHg2iRYPp5BV2zWFYZhZ8NrarphI8VhNS3xrm3iaCkMx9yrWi9LcS70EV5Ia
 3B80pqL977dG03U6t19AcwQgsMXEkYvA7iPghtiyxj7pdnNmpuu48rKasIKhOCb8VGsLidSfl6g
 RZiEEQfQmQ2B8DU7ZD6Y27zkfRiCuKmnCgMcAbOGAphVZ8eSBh+BWTHZDMyP+2Wslkj4/7dGgO6
 sIx9JgEewP5KNc/Sbw2Hfm/TVCZ06ZxieZWr0nHmaYi0FtQ5OxmvoiuojL8XtVmnLyzXDZNNrIa
 PzNo582NHcclqunsfSdTYl44qHDhQeVCAB4JCkNlGuPpaF5JybveqFxGpbjo29I1A7dFYdiwnXg
 cdcaRQNCpejmqDT7Wos4r8Pe4KKC6+CYFHzu0DqKFfeT5zsQ/FInPLPKyuu45ffqCX8M/gtDFhQ
 mg22GiYG9OegAnjtg+g==
X-Proofpoint-ORIG-GUID: cBEKYXWt7M6RWir_VUgU64QPVtfnuiHK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0NCBTYWx0ZWRfX7uclr+kLoTGV
 YwJpwUCpEpnzNL/r/PJeVkz+At3qTOMg7ihrr1/76d35hm4qQADQ27Z/7dmmyjQOeAR5sScL83Q
 QEKFZ7wKn+eiLnZqj7KUgnTKQERyfzs=
X-Proofpoint-GUID: cBEKYXWt7M6RWir_VUgU64QPVtfnuiHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130344

On Fri, Sep 11, 2026 at 09:06:39PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord has a different register layout and power-on sequence that the
> existing hard-coded paths cannot accommodate.  Make com_clk_fwd_cfg
> optional,

Why?

> add phy_tx_lane_cfg and phy_tx_res_cfg callbacks to
> phy_ver_ops, and add phy_status_reg and bias1_en_2lane fields to
> qcom_edp_phy_cfg so each SoC can override the defaults.  No
> functional change for existing SoCs; new fields default to zero/NULL.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 43 ++++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index bf8a17336c7e..373f13b3d6d5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -92,6 +92,8 @@ struct phy_ver_ops {
>  	int (*com_configure_pll)(const struct qcom_edp *edp);
>  	int (*com_configure_ssc)(const struct qcom_edp *edp);
>  	int (*com_ldo_config)(const struct qcom_edp *edp);
> +	int (*phy_tx_lane_cfg)(const struct qcom_edp *edp);
> +	int (*phy_tx_res_cfg)(const struct qcom_edp *edp);
>  };
>  
>  struct qcom_edp_phy_cfg {
> @@ -101,6 +103,8 @@ struct qcom_edp_phy_cfg {
>  	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
>  	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
> +	u32 phy_status_reg;
> +	u8 bias1_en_2lane;
>  };
>  
>  struct qcom_edp {
> @@ -316,9 +320,11 @@ static int qcom_edp_phy_init(struct phy *phy)
>  
>  	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
>  
> -	ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
> -	if (ret)
> -		return ret;
> +	if (edp->cfg->ver_ops->com_clk_fwd_cfg) {

Why?

> +		ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>  	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> @@ -1131,7 +1137,13 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  
>  	/* TX Lane configuration */
>  	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
> -	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
> +	if (edp->cfg->ver_ops->phy_tx_lane_cfg) {
> +		ret = edp->cfg->ver_ops->phy_tx_lane_cfg(edp);
> +		if (ret)
> +			return ret;
> +	} else {
> +		writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);

if it's about a single register, add a register to the map instead.

> +	}
>  
>  	/* TX-0 register configuration */
>  	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
> @@ -1169,13 +1181,18 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
>  	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
>  	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> -
> -	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> -	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
> +	if (edp->cfg->ver_ops->phy_tx_res_cfg) {
> +		ret = edp->cfg->ver_ops->phy_tx_res_cfg(edp);
> +		if (ret)
> +			return ret;
> +	} else {
> +		writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +		writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +		writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +		writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +		writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> +		writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);

Either use a register map or move defaults to the callback too. My
preference is towards the former option.

> +	}
>  	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
>  	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
>  
> @@ -1187,7 +1204,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  		cfg1 = 0x1;
>  	} else if (edp->dp_opts.lanes == 2) {
>  		bias0_en = 0x03;
> -		bias1_en = 0x00;
> +		bias1_en = edp->cfg->bias1_en_2lane;
>  		drvr0_en = 0x04;
>  		drvr1_en = 0x07;
>  		cfg1 = 0x3;
> @@ -1210,7 +1227,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  
>  	writel(0x19, edp->edp + DP_PHY_CFG);
>  
> -	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS,
> +	ret = readl_poll_timeout(edp->edp + (edp->cfg->phy_status_reg ?: DP_PHY_STATUS),

No hidden defaults, thank you.

>  				 val, val & BIT(1), 500, 10000);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
