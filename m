Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806F43F0A8
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141107; cv=none; b=JJ8D7Ctf/mqpSOnewEZwEOeyH6q8IFzpjqyyilaoYTh4eizrareCb7lAJ0SkTPouyWE902jVOLv8yr0EUH7iKVMbUVaNRgOmQD1DIzwcX1NYKsYjCqke5CGe3i+yGuygVQgiYoU8vqGHjcKufOqJK4ZAq8RfGPYicOyYAU/5XEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141107; c=relaxed/simple;
	bh=WMUZz+wBK0ekQjfrSw4DTz+YIGRNypkDnTaUbv8BSbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXv7/fe8qjRBjsR+TbiGqUd675Bif6oM3BD9T2AmmtwVpKgphCJwbgLkZFWeXXGPX8e5WAYYxDN4rVT/59b9DdhzdmwyjQEoiY+FZJaEXw0f+51AHrIhKIr+ZSWGk0fJDySxK8vveAQm0zCtQsiJWlEkgz0UxjCXZal1PREKBME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FN7b2rgO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRfkb5A6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FN7b2rgO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRfkb5A6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm32x1371197
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DROZeLrjFsEoOpdq3MSx8VXdFphleILDmRHCwOjsEHw=; b=FN7b2rgOGLRdbXwq
	yelWNls1Gb0ILWw0J2KIPsxiglGGu52Xfln9X+oiDJ1HHRe36QAoR59emDKLFXJA
	FpZzaSXUGzVDfAleSASezVAVIOx3HYDc7ENWV1hVmnJ93rclu1wMY5GG0sGOupbm
	JZX0tKWvY2YsRRK9n0LbjIsgwbA+43dgv4oJGVgWJ3gf8wWj+DIdQLO1lFvkLyEx
	xlH2HGJKnshX9PlmBx7UDDLiEb1V4KHzmwd7NH3A5sSWrgGO/nUzLiPEaRzKAvRj
	wQtA68+iGNeFY1UtnoqWqas5kXXS+pkwBEVeWR7sl8elLUQnIKPvcH8/NGv0oOIW
	1zSezA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8jj0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:18 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-448d51840c4so909394fac.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141098; x=1789745898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DROZeLrjFsEoOpdq3MSx8VXdFphleILDmRHCwOjsEHw=;
        b=PRfkb5A68aHx436vSHqFBBg21BqCDzl2NxCo+mnFOVp2jxEFH5woUmVLYSrCuGnEyG
         qcf7b+ukSsZ/fHVuJogL1HwhLVU9PRFS9E8OXATkKDY6FR7jR1ZszB1emmZxCimt/RZq
         FPSTxSwssV33MrWuGmmkdGS2fvIHLVcKhoC+kisAYcZeurQnWVGR8BTdOcnSKvppaB4L
         n4ERqKUse/C2aGBaAYyZ7dq941+2tI9IhKOQwNU1bK+/50KmKh0boVcejAzdFVXISqtC
         gxEIYfraw5cAIpnxHgFxEuuOR/i9mEpyTZjREHWn8btmSzFH9Ryhm1k6lYXjdLDJawN9
         6Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141098; x=1789745898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DROZeLrjFsEoOpdq3MSx8VXdFphleILDmRHCwOjsEHw=;
        b=F4GCbR7msjiVFz84leUlmWj1gAFdj+quz21IvMOMpWmh/c9gceBgUG8RjCLtJicrkT
         A+QcwUGhsyTElE1OkaYic8QFWXBA/N6c8yDvxNaQjP31h82ORYl+8AheZ3Yf4FhbkvH5
         ceFLdnrnn4ZbnjanVsKLdHZ7DXWRLDsM+YKyJGHBfwdKJ/DR0Ekhz9LPPvWo23Lydzle
         3u51v74z6NOQvFTnYwopDERBBy5xER21YMGqisx3uc3pcdZLXBZYUjenAnKjxVTHlC8M
         XXp6plT6qmfw9FGDdT/7TTYX3EKLa/moQ8fMt/pUS2XedGXIsObFZ7WjflbiQFUfM0YJ
         FlXg==
X-Forwarded-Encrypted: i=1; AKwUvBxq7V5I+QiRkMTt7DgZEyYuIZ414UJe3Qy+RFuM9panVNyvAy00PDz+DSNiJRiUBU3RHHgfO7AWOU/0@vger.kernel.org
X-Gm-Message-State: AFuF++kX16zGr5xO3Y4jkeGo5elwtqB4a2ZgNcq5Tq5pu4/PMp61D/gk
	I2snb7O7g0lIKFj+p9AwR6jsZ5lQ1DVP1JwDUNAx3MW+Wv39cDXfT1ImWXoiq7FkjRHXZTkY0q7
	YAZBk7WF/1c0K6dOI64jG4tIzLdtpsVYnGBblTd5eWp6JYqcR/JLO6hRHKh6YcYTt
X-Gm-Gg: AYBFou1KnSHoqtfAUJ0g7jiqp54BfG9MNGGZVYclxDqHZ5UkT8uMonwW3H6MllqfOwo
	gtj/lG61JEjJy9ciHdUzLPI7uWzIYySpIiRKt6CwZhVSREH3yFCHOo/E5HsnG46FPFXeJOQXDhu
	RI5nhpYcIabz+6nrCt4goOms/3zazsqpXWaT6+rIDAgGq1Kx6mLKMB6Uuh1ePV76bShSZJCtHRF
	vkVprZUKiKG/Q7fdKQ6fgcNnG7oyXGynDQPKVKZH9YVWUQ4bKY4a+A6qEfV+hoQ53Ye4AkWUJ4L
	pLa5Q74eMJv7AqFQdNBH264N+BuO+BmsxqvO4OHgXIT/mWo7/8rHe1XujSloD//WtGBYeU++ywW
	+WedZ/jYL/RXF5XICEKWOyT1rFBg=
X-Received: by 2002:a05:6871:340e:b0:448:7667:2e96 with SMTP id 586e51a60fabf-47de7836203mr3346170fac.9.1789141097922;
        Fri, 11 Sep 2026 08:38:17 -0700 (PDT)
X-Received: by 2002:a05:6871:340e:b0:448:7667:2e96 with SMTP id 586e51a60fabf-47de7836203mr3346126fac.9.1789141097479;
        Fri, 11 Sep 2026 08:38:17 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:38:16 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:39 +0530
Subject: [PATCH 08/17] phy: qcom: edp: Generalize power-on path to support
 per-SoC overrides
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-8-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=4227;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=FpM14k9zoSvyybc0wXfwBuVOIjzNap9teV8zKiWlGF8=;
 b=OkS2dOi9eVbTtaegQB8+t+tTY6ndETEabUOuASZ8N3o8BfzK9ic4LBhA3pKKmOE/ajPo8An6m
 OFfAMW/PCzQCVB2CItOWlNTb9ivgJYLkJXRucx0rmEQl1trjPbQxkGV
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: Bpd-M1i8YST8St7NzgxRBsVCROgLLo58
X-Proofpoint-ORIG-GUID: Bpd-M1i8YST8St7NzgxRBsVCROgLLo58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX+kmKYy3PxmBc
 yq2FROqqKILkKR5olltMykfQvrTI9IkY9k0HQwpfon8JKV3mlaJn5mu77gTrUUWCKqPdXZpQS7k
 Dm8o6YPujUIu9k4jNVl/EDYLo8DNESmgiVwZQgN9AjwN30zo8Ify8uT22Xsdsq/Ue+wfK4OkYme
 /xFnBm5UFoGYrx7Aan153ZC8QoaPZ1JT9cN4HFRoIxqerxsu5IQO1ir0B3OG0Z1ID/ibWIDkKQS
 Mx+b4f7+tmmB0+O4trcc4elprW+H/q31VD7ZsbBsETsllYhLohISq3BkTXilAK4tlG9bOSDllEq
 8Lu6xi17iSFoAqYnCoVL/B0k+jD9pjvyGMk9oM50qyByRJzh7S1veiJRZj1rO922IUoa+5JdT15
 v2YSoSL07QBJvFYXApXgOJBl9c1LFDVaUr0zgnz/1BA7G/Dr0KPJlZYwf0p3gsq4OhuBedbtpMB
 RodG3b5qA/7/wuSGrAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXzsq09IM8KeAd
 BUveqa24HCjIPsnsPgiSeyhqnlOJSE7Vwe1IS8yhKdacN2TDuieV8OgHegWslNWfbsRMx5pW1ul
 qsJCZGkMRWKt9sSxXj+KiSEMwQA51ZU=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa4206a cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=v4S7s_oVI5aw80GBEmEA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord has a different register layout and power-on sequence that the
existing hard-coded paths cannot accommodate.  Make com_clk_fwd_cfg
optional, add phy_tx_lane_cfg and phy_tx_res_cfg callbacks to
phy_ver_ops, and add phy_status_reg and bias1_en_2lane fields to
qcom_edp_phy_cfg so each SoC can override the defaults.  No
functional change for existing SoCs; new fields default to zero/NULL.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 43 ++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index bf8a17336c7e..373f13b3d6d5 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -92,6 +92,8 @@ struct phy_ver_ops {
 	int (*com_configure_pll)(const struct qcom_edp *edp);
 	int (*com_configure_ssc)(const struct qcom_edp *edp);
 	int (*com_ldo_config)(const struct qcom_edp *edp);
+	int (*phy_tx_lane_cfg)(const struct qcom_edp *edp);
+	int (*phy_tx_res_cfg)(const struct qcom_edp *edp);
 };
 
 struct qcom_edp_phy_cfg {
@@ -101,6 +103,8 @@ struct qcom_edp_phy_cfg {
 	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
 	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
+	u32 phy_status_reg;
+	u8 bias1_en_2lane;
 };
 
 struct qcom_edp {
@@ -316,9 +320,11 @@ static int qcom_edp_phy_init(struct phy *phy)
 
 	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
 
-	ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
-	if (ret)
-		return ret;
+	if (edp->cfg->ver_ops->com_clk_fwd_cfg) {
+		ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
+		if (ret)
+			return ret;
+	}
 
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
@@ -1131,7 +1137,13 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 
 	/* TX Lane configuration */
 	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
-	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
+	if (edp->cfg->ver_ops->phy_tx_lane_cfg) {
+		ret = edp->cfg->ver_ops->phy_tx_lane_cfg(edp);
+		if (ret)
+			return ret;
+	} else {
+		writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
+	}
 
 	/* TX-0 register configuration */
 	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
@@ -1169,13 +1181,18 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
 	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
 	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
-	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
-	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
-	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
-	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
-
-	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
-	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+	if (edp->cfg->ver_ops->phy_tx_res_cfg) {
+		ret = edp->cfg->ver_ops->phy_tx_res_cfg(edp);
+		if (ret)
+			return ret;
+	} else {
+		writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
+		writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
+		writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
+		writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
+		writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
+		writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+	}
 	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
 	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
 
@@ -1187,7 +1204,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 		cfg1 = 0x1;
 	} else if (edp->dp_opts.lanes == 2) {
 		bias0_en = 0x03;
-		bias1_en = 0x00;
+		bias1_en = edp->cfg->bias1_en_2lane;
 		drvr0_en = 0x04;
 		drvr1_en = 0x07;
 		cfg1 = 0x3;
@@ -1210,7 +1227,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 
 	writel(0x19, edp->edp + DP_PHY_CFG);
 
-	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS,
+	ret = readl_poll_timeout(edp->edp + (edp->cfg->phy_status_reg ?: DP_PHY_STATUS),
 				 val, val & BIT(1), 500, 10000);
 	if (ret)
 		return ret;

-- 
2.34.1

