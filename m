Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D343DCD8D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887174; cv=none; b=tpSwiJzCn/gsL7RdVhOM9C3EkAdmgM5wC7aeyvoRfYzQFD1RnntP/TazEleTwq9j/qGGFNso/YKHK/87AnG0I3+X5NHSTnGvGefPAN/XYCjEjhCmlRo8DcF9L3eekBkfyuwl5VRLhqsBtaoUeUDXToxHUSOcZxyLjW2m/xqSbLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887174; c=relaxed/simple;
	bh=7PWO/rmOMB/INrcy7L02xPLVPSTg5CtiuHCwAe7/WBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZkkGfvCcUAlC6wBqoxPWdHHLLKbqrp1PmGprOhr+75DdMOp8AP18tB0r0eHDIoZIE9OCab1t3eqzkR7d72HmEmu2yU5Aq18fcu/WcWpmNGnzDEZfj2xlgd8ZzfAMkeJbZXIIx6IjUMPG1bMjWtCbrqURf+2Hq2qjBBpAljiJb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX9DqWwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4PaIuo2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX9DqWwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4PaIuo2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9SYIB3476214
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XFUwTfQDkVnqeA/tF6NFKAol
	awlux0KkzVVWyuMzsqc=; b=GX9DqWwH+E/919mEvs0RhmiLoecGAC768fDrT/sO
	IkRtgNHxo/mWWGvL87dS0gk56l+Xq4Rxq6J+SGFvTUV8UBVRjvsbcXIOOuxU77ZO
	izHpUyd22ulUGhNp1C49mYak2O96vfFV6Rz/7HY96nW+TJgdQsUPpmSLPioSgJ/T
	WVKHuM+zuwr4KWsgoMA4oJEc+kZ85azti/CDznStH+xwI0lBZ4Q1ZdnXf1vHx41+
	D43ObdnskSLTwofeDI/qTKviiJSoWpM/rhJz7Is1mWl7n3bjwpA/qVJRXWBIrWnC
	LEGB/LTdJIdevg1W0enyQwk9D9gBj5hpXwwCJMunxtikWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9hj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:26:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e46c120dfso293157085a.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887171; x=1792491971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFUwTfQDkVnqeA/tF6NFKAolawlux0KkzVVWyuMzsqc=;
        b=V4PaIuo2zUXwXlpVjSZTnT9OYYPJtVRkhzv2BKrPu75BJkdmGXtcQxTlwypZOpUhe2
         dPrU+sSsRp4UbvHYozN6B3mEvQHxIQ3dsNY8tfDQ9bxkg5tUInNQlxoBq4dP+ynux5cP
         q2OlpbJOy7wARqToSzy5zps7+LoSSIloGKUx2ZF4xZ3kf2wpyU7Vyu7pdJDXcRb2kal3
         y0ghTz4VDyxVIpB7mMwTS4PypE/a/8q4sm2Lozcs5dbd5ckWcDnY+ZCHzti4rDdj14kr
         vtNOj6LiO+IXug08ioiZFf0Z21RFlTE/ZrNG/RwzXZrUPGmDE1tJ1fqwYPb4Yjm2T5+s
         Jrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887171; x=1792491971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFUwTfQDkVnqeA/tF6NFKAolawlux0KkzVVWyuMzsqc=;
        b=BkYTCvwOkZAXI/loZRWr2n9gzvfsHRmRUw/GD2dDmvjKXZapCWdcz/6VJtRUJO5HSA
         yaGSHs/vJVZJey6ntDvfd8tJJBss1C0w9GVszLNVoXRIRVuv5ip/p8JeVCPl5mFYHbEG
         P4/8sXHvryifdtlwRgI+OFCWi5TWpmmjySROCajPwS2jNrwPWUN4wLeLiDrwVKYyTpq2
         lURMTGfnyJ/XCbroALxK2eoliwcfm0QcfEzwvPx1yN08KXVLKgjvI3OswQYTPBOO2Evu
         vloUjNTD0adGzuw9XbWEFT80yysKV61vQXmIaG1uAT1UM5AFS10rmgkISMKOqjgodNb0
         bPsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuw5B6W9EkO9yT41OecCM1rZb4vMPebTQVakll7clxPb2pUNvwICgSF6DvQjZNeVkDPneYimeKLfLR@vger.kernel.org
X-Gm-Message-State: AFq9FYKcrzfq5yJt1+aCv7aonmMfREQqUUlHDom5tRC7UVouJB/qA2wh
	O52cFLcQ7MhOm5qDwbxltbQ4u8JTptnpefQPhH68TDUE0NZlfUuvuSu0t3u4Zm/l9iXu5WUc5RR
	jbnkyCoznNIGiBrY9cVH1EPeHZIUOTfEkR+QHq/wNPrZdeLY4A7aH6YBznm6peby7
X-Gm-Gg: AYBFou3bklRraeghRcMGYxRmNw+oSn3fNv4TDJbZE0T+kPp0F8nH92vEqI5/FqDsXJV
	jTCgh1CUHMKe8s0/EU0MS4KhPErys/L3AF68sN4xSYOvZwHQbI8q7iuPQbvtB1nA2mGgjIHTHhC
	FRdc67tAo7173Ivcz+p37ApomiXs2c3UZHmWn4fF96vipGZqFXABuHNmrdHtOKU48CbW0+JYVsp
	7sAQDvF3tSrljop9weRMuZPIqWodXTdINiT+0lWJq+btVoVQdnBZXwGrBgwZJHCyx/SB+d2h8tH
	VmmbILOZTZHz9A9ShDey4ukrfwkwHszhmywaX1B0spuB7xFlP0cvDCt5UsmRpQnGpbOddSqSU3a
	gAeLL5TF+lGvuUm1wjLsMa2rM2pSDDnRjHVcV0N/20MkZv9SY/UabDPgnKVuRVO4ZgysZ3nvJwA
	Xk4VVy7WvPF1lv
X-Received: by 2002:a05:620a:2b8b:b0:93e:bbda:dd06 with SMTP id af79cd13be357-93ebcc0f86emr1896452185a.0.1791887171104;
        Tue, 13 Oct 2026 03:26:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8b:b0:93e:bbda:dd06 with SMTP id af79cd13be357-93ebcc0f86emr1896447685a.0.1791887170357;
        Tue, 13 Oct 2026 03:26:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81c7sm3490792e87.49.2026.10.13.03.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:26:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:26:07 +0300
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 08/13] phy: qcom: edp: Generalize power-on path for
 per-SoC overrides
Message-ID: <y5yofnl3x5jg7yxwzlpl543yir6uos3c3tj45u4ocjvy7u6sgz@2c5u5szohx2i>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-8-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-8-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-GUID: qNxFWwq05QVv4hcD0j56PSsAS6udLs3Y
X-Proofpoint-ORIG-GUID: qNxFWwq05QVv4hcD0j56PSsAS6udLs3Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX5VocH6TWFnTv
 LK+WuQHqOpPZyndNbfXiZ2myTDnFTJOxWn8oEv7g7mYnz64aZBR8B7ApoveBOy4H2ld6b8xTZsI
 7emgpLwA7zkYlfEIP2Nk6VUR04tl+mI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX7nwRBYssu6/j
 Q6VZjfcWorCJCA/M8qAHE0S+Lqex7dVeI7ANXCFGxmGR7fi7uLvGiJWGGX0qWqzb555XEDLges1
 +KljraeyEi3H5r6ebMyv+fQeRUFDSeDd3EZm9UiARbyxKk+YsD52REuNHQuAvJH2+klwM+OCAp5
 mPkQfOkxO2LMXxKJb9X1rNTj+mG1ekCig/hrov4O4OxJGDCZ5sfmXRS3BjY7pHlkp2uzdeXcTpc
 53PNkPVhQYUtUPgv/0j27S+qoBVp5ddZULtXLBSSib6BT0ADrguK/9j1Z2njxpa51iDZ4V13+au
 czdYlq/DMZXTbcMt0naoIBxfSccqMyWo+FyBzm/C0O3q/y4rNG9FQcWGnOAe/y8zOOTq9z/cvKt
 nPwVbBruQJV9uswBpVlA5Z4BxPvygKE0+7x5HoXrsL7QwlTVbep2ws7XAwK78ThgY52xrpjlJO/
 wpmUJxPkuWCCEsiRHGg==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace0744 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=x5eWZYghlK0YOYNvIKQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130041

On Mon, Oct 12, 2026 at 07:02:18PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord has a different register layout that the existing hard-coded
> power-on path cannot accommodate.  Introduce qcom_edp_tx_res_entry
> and replace open-coded TX resistor writes with a data-driven loop
> that also handles base=2 (PHY/edp base) for Nord.  Add
> phy_status_reg, bias1_en_2lane, tx2_tx3_lane_ctl, tx_res_cfg,
> cmn_status_reg and c_ready_status_reg to qcom_edp_phy_cfg, and
> make com_clk_fwd_cfg optional.  No functional change for existing
> SoCs.

This becomes too much table-driven, while the edp driver preferred the
code-driven approach.

> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 82 +++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index d5c6835b6c70..c5df1086607f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -81,6 +81,15 @@ struct qcom_edp_swing_pre_emph_cfg {
>  
>  struct qcom_edp;
>  
> +struct qcom_edp_tx_res_entry {
> +	u8  base;
> +	u32 offset;
> +	u32 val;
> +};
> +
> +#define QCOM_EDP_TX_RES_ENTRY_END { .offset = 0, .val = 0, .base = 0xff }
> +#define qcom_edp_tx_res_entry_is_end(e) ((e)->base == 0xff)
> +
>  struct phy_ver_ops {
>  	int (*com_power_on)(const struct qcom_edp *edp);
>  	int (*com_resetsm_cntrl)(const struct qcom_edp *edp);
> @@ -98,6 +107,12 @@ struct qcom_edp_phy_cfg {
>  	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
>  	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
> +	u32 phy_status_reg;
> +	u8 bias1_en_2lane;
> +	u32 tx2_tx3_lane_ctl;
> +	const struct qcom_edp_tx_res_entry *tx_res_cfg;
> +	u32 cmn_status_reg;
> +	u32 c_ready_status_reg;

If anything, it should become a part of the ver_ops. But, I think, it's
better if you add callbacks to ver_ops instead of just describing regs.

>  };
>  
>  struct qcom_edp {
> @@ -313,9 +328,11 @@ static int qcom_edp_phy_init(struct phy *phy)
>  
>  	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
>  
> -	ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
> -	if (ret)
> -		return ret;
> +	if (edp->cfg->ver_ops->com_clk_fwd_cfg) {
> +		ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
> +		if (ret)
> +			return ret;
> +	}

This is fine, but why?

>  
>  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>  	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> @@ -672,6 +689,16 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>  	.com_ldo_config		= qcom_edp_ldo_config_v4,
>  };
>  
> +static const struct qcom_edp_tx_res_entry tx_res_cfg_default[] = {
> +	{ 0, TXn_RES_CODE_LANE_OFFSET_TX0, 0x11 },
> +	{ 0, TXn_RES_CODE_LANE_OFFSET_TX1, 0x11 },
> +	{ 1, TXn_RES_CODE_LANE_OFFSET_TX0, 0x11 },
> +	{ 1, TXn_RES_CODE_LANE_OFFSET_TX1, 0x11 },
> +	{ 0, TXn_TX_EMP_POST1_LVL,         0x10 },
> +	{ 1, TXn_TX_EMP_POST1_LVL,         0x10 },
> +	QCOM_EDP_TX_RES_ENTRY_END,
> +};

This becomes hard to manage. Please use ops instead.

> +
>  static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  	.is_edp = false,
>  	.aux_cfg = edp_phy_aux_cfg_v5,
> @@ -679,6 +706,9 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
> @@ -687,6 +717,9 @@ static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
>  	.ver_ops = &qcom_edp_phy_ops_v3,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
> @@ -695,6 +728,9 @@ static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v2,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v2,
>  	.ver_ops = &qcom_edp_phy_ops_v3,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
> @@ -703,6 +739,9 @@ static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
> @@ -712,6 +751,9 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static int qcom_edp_phy_power_on_v6(const struct qcom_edp *edp)
> @@ -913,6 +955,9 @@ static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v6,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static int qcom_edp_com_configure_ssc_v8(const struct qcom_edp *edp)
> @@ -1045,8 +1090,8 @@ static int qcom_edp_phy_com_resetsm_cntrl_v8(const struct qcom_edp *edp)
>  
>  	writel(0x20, edp->pll + DP_QSERDES_V8_COM_RESETSM_CNTRL);
>  
> -	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_C_READY_STATUS,
> -				     val, val & BIT(0), 500, 10000);
> +	return readl_poll_timeout(edp->pll + edp->cfg->c_ready_status_reg,
> +				  val, val & BIT(0), 500, 10000);

This is already a version-specific callback. Can't you just add one for
Nord?

>  }
>  
>  static int qcom_edp_com_clk_fwd_cfg_v8(const struct qcom_edp *edp)
> @@ -1074,8 +1119,8 @@ static int qcom_edp_phy_power_on_v8(const struct qcom_edp *edp)
>  	       edp->edp + DP_PHY_PD_CTL);
>  	writel(0xfc, edp->edp + DP_PHY_MODE);
>  
> -	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_CMN_STATUS,
> -				     val, val & BIT(7), 5, 200);
> +	return readl_poll_timeout(edp->pll + edp->cfg->cmn_status_reg,
> +				  val, val & BIT(7), 5, 200);

The same.

>  }
>  
>  static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
> @@ -1094,6 +1139,11 @@ static struct qcom_edp_phy_cfg glymur_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v8,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
> +	.cmn_status_reg = DP_QSERDES_V8_COM_CMN_STATUS,
> +	.c_ready_status_reg = DP_QSERDES_V8_COM_C_READY_STATUS,
>  };
>  
>  static int qcom_edp_phy_power_on(struct phy *phy)
> @@ -1128,7 +1178,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  
>  	/* TX Lane configuration */
>  	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
> -	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
> +	writel(0x05, edp->edp + edp->cfg->tx2_tx3_lane_ctl);

This one is almost fine.

>  
>  	/* TX-0 register configuration */
>  	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
> @@ -1166,13 +1216,13 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
>  	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
>  	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +	for (const struct qcom_edp_tx_res_entry *e = edp->cfg->tx_res_cfg;
> +	     !qcom_edp_tx_res_entry_is_end(e); e++) {
> +		void __iomem *base = e->base == 2 ? edp->edp :
> +				    e->base ? edp->tx1 : edp->tx0;
>  
> -	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> -	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
> +		writel(e->val, base + e->offset);
> +	}

Unreadable. Once we move on, these regs can be used to write anything.
If it's a really one-off for Nord, just check for the compatible string
or do something similar. I'll check the other patch.

>  	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
>  	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
>  
> @@ -1184,7 +1234,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  		cfg1 = 0x1;
>  	} else if (edp->dp_opts.lanes == 2) {
>  		bias0_en = 0x03;
> -		bias1_en = 0x00;
> +		bias1_en = edp->cfg->bias1_en_2lane;
>  		drvr0_en = 0x04;
>  		drvr1_en = 0x07;
>  		cfg1 = 0x3;
> @@ -1207,7 +1257,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  
>  	writel(0x19, edp->edp + DP_PHY_CFG);
>  
> -	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS,
> +	ret = readl_poll_timeout(edp->edp + edp->cfg->phy_status_reg,
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
