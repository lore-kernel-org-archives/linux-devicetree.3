Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A4F175A9D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344756; cv=none; b=hAgeb8mGUTDh15qor+AA7UW+V7twNtRGmykWkUnuD+xeev7GvZ1gs6IEOhEWsklLmxbMYatLRudlvaGrRnlx/q/feKfVrXqNdUkKTET0/LihnNLM6R55dpuojoW3YNARgxpYxlfaHVMQWcx2xOcQYncZ2ZYIG2zFtz2L+ysHDRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344756; c=relaxed/simple;
	bh=z1S32XWP7jC8lPOo1+4cGo0acfHdRdOY9hgIWbMGNr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7cnpk5lJpdxrB8sxgbXhn+N2kY6pWzq1PF2kPI0PAEBDdFjG72JSNJv6iSqIne5L10+aqo5JBXg1scRHE46gnly542vErMV7KZzB9D5TVCLzL/mGxgjeWuaS3CMMRrsZ00pcwZOy/sNM+aoc7yM7AqFVX0B6ipHfGEHieq5EEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4I1IM2R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rw4g9QUH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4I1IM2R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rw4g9QUH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E062qt4020759
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iBqYeqzlYtNhEASxOYthivbr
	ArLVaXRL5F5mIYJzUbE=; b=a4I1IM2R4U1J5p/cgW5v53ft0l+3aKuGkhoaeN6W
	1V9Gl1Df1TLWWTdLzhdo2d5PdVooU1TZDJya2FsJ2PaP6lAcHGGl6Od/u7hqaLlk
	FX277kySkhVlq8yo7l8ML++ln1b5Pe5+2ErKWm4Ij0cwj8UXKQSHTilzfh3Y3hAt
	8utdbXlR0jMwfFa9ffmkalPODTEXx29fXgs0lfoIvT3xAAqSbgXY5r5s795dSjhq
	bFoaVofgasBu4yN7QU1lPwZkEenBfP4ccUgpHXNn+qE37e+SOk0VDqkNmWD+0F3N
	EeWnjVbYKznK0YpQQx/E9MoktyAu0rGSVZFIagq98Vq9ZQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0886v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:12:34 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c3796d17dso308850241.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789344753; x=1789949553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBqYeqzlYtNhEASxOYthivbrArLVaXRL5F5mIYJzUbE=;
        b=Rw4g9QUH8pSg36dXk9AjwdhI6icEQgsMlNNprTISptL962j3DsFt/cxkxoPTUjlAdp
         9ekjR35uOeocLhO8QopPk4qasL2L9h6aAdN1mVYBEUSipcJjT3U+khYx3KCaPPlN83bR
         K/l7ATbuJaTuKwmw6ZmSMCWYXVwClXkLUkC2BJJWx6yMo9O8B0q8q6T6A9QWkunAcOs0
         /6AkocaW2v9h8gZZXYXYfufrt4aYngJYVlipBtCVO2jfi19HAc8n/nXYALIZjS9GNruT
         I0NB9h2teszXYOttWXilO+OcfR9PZV60VOrK6QBF/Ibwu23iFa/sfveFOarimHZQYBGP
         PGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344753; x=1789949553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBqYeqzlYtNhEASxOYthivbrArLVaXRL5F5mIYJzUbE=;
        b=KsfMQ7/P/uJQOwONOQ+rnhSEjcdHgU438lINXeH6FNYAABrNpEgNRUV2TjvhhGLOfs
         s69PTiSXliX5+ayhCtPMJbhDsD4wO1vcC6FtgPRWNkzU25WfPRDRSoW8rdFpKPjnfF7W
         7LcPU+3nskQXLOyND6EnL/uJtI/7NKDFFjFx7PTtNYF8XpVxMkpbLSbEFz7bFi3ROVhZ
         JS7ufzRC0s6n05bYWbgNqixv0u5Jiu+kuS7AfIiSKN8Mta38FzA+b7smZ4BziQqnr49d
         L3TR09cuAjIw3Q/eTSa+sMnJqiIoZ3MYvNpaTnbJCFaH2zSx074T5VoVe84Kei3zL2z3
         u0VA==
X-Forwarded-Encrypted: i=1; AKwUvBydYwZB1rOra8Erlpyg7Cq0AI33UTfDo4XDBqYg+Y88S7doK1jPEvLGOpEl4DqPD0ng5dDBGbX2XPZM@vger.kernel.org
X-Gm-Message-State: AFuF++n7E6do5WU8TN0TGDgBvNtNN1kV5EqiAKIo8fv06Taw80Trgv3D
	ZwlxAXVfsDvW8xAHeG5+Ny7CYzTupvrNFRUjs56A8eR1RqqbPvzuSpkVq1enQYvy5arGEWDRl2o
	LYu/bhmDj+oK7caHKWtifgwtpVQYJjAUI2c+wazphMtNNEV9geoSbLpBmtI9g7XLD
X-Gm-Gg: AYBFou0JRHt9O0bHFpFN2qpHFTduvcZ6swbBwphaDvJ6PVLZgYxrtMBubd8mnh0wqhQ
	zO990ohLE3SgXg1wqKalK5FWneEiV/KlYDwfoN3H9NZTm+uTJ+Hwn373wh3OmeVcdQSCU3xFsnu
	nY5UFY3SU5asChxsEPbe/qpMZystKuPNuNeU3T5yhgPx2mTqkEpWOdgpgXqzax8x61aMurrdqmY
	rpoQSE6WymuM4Ks6Hq9vJmzlMnDw9JLp+2ujauGX548tcRflhaP9B45BHz8tD4bBU4wo5bZKdB8
	rULKSuQXHFNEqO+VgDF9x/W6Cyp2IyFttjJw+BRTDrEL0TjASmSbc1T737bQ9gHDFB9hOo3pJD1
	YhVPohQOXE/OLOJhWU7YbxRy7ZhHVP30q9hmgxX6Fl7uAKG8qsAjXAfDRerW04FdauZ1tatNMD/
	bbRXV4qVAmPLkF
X-Received: by 2002:a05:6102:6886:b0:790:fd7:cf36 with SMTP id ada2fe7eead31-79b5b95efa9mr63918137.11.1789344753404;
        Sun, 13 Sep 2026 17:12:33 -0700 (PDT)
X-Received: by 2002:a05:6102:6886:b0:790:fd7:cf36 with SMTP id ada2fe7eead31-79b5b95efa9mr63899137.11.1789344752966;
        Sun, 13 Sep 2026 17:12:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d3cbsm1975589e87.81.2026.09.13.17.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:12:31 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:12:29 +0300
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
Subject: Re: [PATCH 15/17] phy: qcom: edp: Add Nord LDO, TX lane and TX
 resistor calibration callbacks
Message-ID: <ezvhdreygsfihvqsg66cp4s3jvkj5efhzpsoqmjedutn2giuad@fx734ykvkzwp>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-15-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-15-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwMSBTYWx0ZWRfX0kpsAX8ckNIP
 NV5pT3yItcSbGt9A5I+qlCvzNTPPsPzU5bwukvg9tpsEClsftQWK25gSVWvwNBII8ksqYKcpa0K
 KpTwovqmm0wm/FzmNPg22qqh5FcZVFY=
X-Proofpoint-GUID: 8rQuNQszvqIDKbPNpIbpu8bFGgPxQit_
X-Proofpoint-ORIG-GUID: 8rQuNQszvqIDKbPNpIbpu8bFGgPxQit_
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa73bf2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=DE_EJvfAnEflg5IDAsIA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwMSBTYWx0ZWRfX6NUQ8XgFbDD+
 +19I40Ax0HgL4bUTszHKgEu5bIyrhFLDmRP/zxQ8AAMURcAeWK2M+meykWx9ToQcGBt9nn6t4l6
 NOx3ISGgvDLQe9Zv23qa94OF5rfIuFAspz21bFzpjCvM95t9yVpn54M4LpM0URsVNHUuTCTiQPl
 ipmnYyeL86v6QwSxjy0AhSV2JTOM2+GOtvA2cxuSaJmkBvB1DesfBBDJVQ/3JZyoCoylAi90Vuz
 X3BzbxZdnSffReq3tWtrNlxXblMmmcCCBOqGapYiFlrmWClWMXAIlR55xolajPJpAr9U7pVEMOc
 WKBCz7hREnSCg2kMrHVT2Hk/g1vOxWUnn7nv4HyRailjcQRhR/vNdXvEabSSVEyV2Koomg53+PX
 pvNnRSuJbSO0AOmGsGITs8lwL1VjRGdhkJBYZBVN7tND4QdCH1tw6VuLzftH/X++a1Fb9jpN4Mo
 5DYC4E3Ul9NeSuGKyig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140001

On Fri, Sep 11, 2026 at 09:06:46PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different LDO levels, TX lane control offsets and TX
> resistor calibration codes compared to existing SoCs.  Add
> qcom_edp_ldo_config_nord(), qcom_edp_phy_tx_lane_cfg_nord() and
> qcom_edp_phy_tx_res_cfg_nord() with values per HPG Table 2-1-d.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 47 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 4d1b2c81d956..361f4e467351 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1800,6 +1800,53 @@ static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
>  }
>  
>  
> +/*
> + * nord LDO configuration.
> + * From HPG Table 2-1-d: LDO Configuration section.
> + * eDP mode: 0xD1 for rates <= 8.1 Gbps, 0x00 for UHBR (>8.1 Gbps).
> + * DP mode: always 0x00.
> + * Also programs EDP2_DP_PHY_LDO_CFG: 0x03 for eDP rates <= 8.1G, 0x00 otherwise.
> + */
> +static int qcom_edp_ldo_config_nord(const struct qcom_edp *edp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +	u32 ldo_config;
> +	u32 phy_ldo_cfg;
> +
> +	ldo_config = 0xd0;
> +	phy_ldo_cfg = 0x03;

You don't need those variables.

> +
> +	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
> +	writel(dp_opts->lanes > 2 ? ldo_config : 0x00, edp->tx1 + TXn_LDO_CONFIG);
> +	writel(phy_ldo_cfg, edp->edp + DP_PHY_LDO_CFG);
> +
> +	return 0;
> +}
> +
> +static int qcom_edp_phy_tx_lane_cfg_nord(const struct qcom_edp *edp)
> +{
> +	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL_NORD);
> +	writel(0x12, edp->edp + DP_PHY_TX_LN0_DRV_LVL_NORD);
> +	writel(0x12, edp->edp + DP_PHY_TX_LN1_DRV_LVL_NORD);
> +	writel(0x05, edp->tx0 + TXn_TX_BAND_NORD);
> +	writel(0x05, edp->tx1 + TXn_TX_BAND_NORD);
> +
> +	return 0;
> +}
> +
> +static int qcom_edp_phy_tx_res_cfg_nord(const struct qcom_edp *edp)
> +{
> +	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +	writel(0x06, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> +	writel(0x06, edp->tx1 + TXn_TX_EMP_POST1_LVL);
> +
> +	return 0;
> +}
> +
> +
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
>  	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>  	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
> 
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
