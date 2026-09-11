Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3378E47126B
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141183; cv=none; b=AEwL8iT1AwQ24i983O3oS2Vy5sVjQAiFEnsckDHQSU3PB263G/OnMEmpb3RZiyZ1SYLXwcPMQrBU1z6nFVH3QZ59MAXM5BEzGu1aa9kxAXrDUefCPZeMlY+dcrQ9QT2kruqQOF649Xb8j7glIft7iXDuEyz3vqlvz8orQaX6BH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141183; c=relaxed/simple;
	bh=RyzijeQOzFCR4BUqwVap4hBjD3WwtYW4cP4P/BfFqns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWHBwXXI2ZOBzc8bqRSfAa/xEkIeCD9Q8/QqSdgWY3cX033gt8ZbCKhypGYIX85sJg/uWOdONUmm6G+gRv2ag8AJAxjgal2ZE4ekjUmwkCClKdoibf6REesOLOvgMQEJj2+DIcdB0iJ+MXPoXgHFKmAIJCuqfwRZUreZXaFkIRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUfMlGKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SktGTB1M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUfMlGKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SktGTB1M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAcd1090943
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYKeXTa8aTR0bTBB6X/4VXQLUl7NXF2imUYHRSL6L6Y=; b=KUfMlGKDCYJUkNK9
	krs5AoW76Ydwk168/8HaKacxnVBbJwBkxOnwJbZLFnOqGLRigS/emZ85a9bHCdMj
	k0fuvdHDWf2T6JDb67KoF58rpj/dm9q6rsGX9WwcRmSUeBJ5mPvFFmGfFcwq/Z5l
	lNCitP0sZucMOzBzOlZyeIkbHK4iedThKhW8Dcb03G6n15biYDgVnDX6ZV5fRpPp
	e2mY8MowwTmW4yjJ5XX+yMUt/xDMX95c7YtmnigDMUn8uciuinlr1AOpzYsWrmkj
	4Bw5MaZ75BX+keYvX83+ZcKSyaWrVJGd8QTRLrVrtkF2IaZ4/o7cqW/RGqFeVNvq
	DFWZ8g==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3ak4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:36 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-455cf15f8b5so1717086fac.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141175; x=1789745975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYKeXTa8aTR0bTBB6X/4VXQLUl7NXF2imUYHRSL6L6Y=;
        b=SktGTB1MA8iTyDA7Ww+2L1xlWqbmn8BlN5ahRGJPrjkhW4lQsEOcyBmg1fDxW7tt5/
         4xWc9c14t6xxrNR6z0ydPA12wya2OK+qggT7Hcuy0EG6b3E17xn2/seYYVzu2g9Mrom2
         FCv1UsrWzCu0Yt5wgIFeyaiXibtRv5Fdre6mDZK8tCrJrAbTWXFkIWxiPwmEEVXCPo0C
         L3AJ+SP7hnK4M0KrBzHMjWfjvIoCz6vgvV5xQBOPnr0QVYpaUAxctp6iKh3qftjgFs05
         rpUx2GsOX7wzKQhreF4coExbPGPcTuEh9+W4rME6bc2N+/wO5R1PlkMfr+gGwDZGb93O
         zszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141175; x=1789745975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYKeXTa8aTR0bTBB6X/4VXQLUl7NXF2imUYHRSL6L6Y=;
        b=pMj0t1yGzqNyT3k7X9JpKWeXo0G4++lgMKTG5P2h2pr8kBeVEVSfLDqhb7cdKxmEs9
         PMScxz1dN2jFQyQ8FbaI2G5Y6jgsvb72tOij6QR0dMhwshWNI/IuKSREghT5bEIFcXED
         hMIZVCe+bANZ+qre8JUgXY7S32O82NkEUrxxjAJfWrtcSMcpbUEecik1ooEzOXvrYoB6
         MCuv4f+I5AgVmgpgTbe660OtoT5tabSwU5eMD9nEPkvrcr+WFXYav+1PgW4fobTCBhxw
         j8JB9x5mN1Wd87d7c4UqHPoBXhHjvgr8vgq4oJvuzETPdMTO4aHpXi7S0pS2459MhXGT
         4yeg==
X-Forwarded-Encrypted: i=1; AKwUvBxKMyYCp93z9a/G8EeZXkwx5XLKTAM5mwA+kGHy5DBNZxHRum8mXKHecyXKpC9puj8LtVC6I444mDQH@vger.kernel.org
X-Gm-Message-State: AFuF++n/WAkOsQ0XiNMhnbzZq954VKD7lrYCYhtOQqrW5K1Oo5syWKKP
	1gjAHeezJoJlV6nqWM2TleXclgNtWl26qFE8wWbQxDCwPAWVQLgoR05EO4ZCEO1BhDHDlafHg6D
	ozGmCtAT7zZHKHVjjZbgxqAoSjJE+I2eN7DZAfZlmyM44l75a8UcU8mbCxXRhICn1
X-Gm-Gg: AYBFou3Z134HxgxYTcDaRzEXw/gsEe29qL9EgjEpGOJeAQeHxsU7OsmXhpUCe1ZdbA1
	snWks22JPNhyF9lZH6T5U17To8YG7D3QiwHfcRTFHO1UjYuFjVlRKqiR8W88L59fFSWuyA0cTke
	ZWQmCPEXf3dKPoBwOI1rgS0NDWfvrRUr02YVnmthNg1ioH4Q2XIM12ZmUK7iYTFw581eslFUdHo
	/VdGEZKxPGcDiSipsg3QDml7fpwkjBbNcG0rTQwXeIuEay6HMaC5xh8bLTxeYxfyaf4DGiouOPT
	HxCja1cVtJT4LtYXOUsPWJEmQBOfa5JpDbybFjBIdWmWAl8FK4duCMggdbbBkQjyuB/xslGlQIN
	miYxiMWU437W3WD/xMQ8pjKfPB9U=
X-Received: by 2002:a05:6870:180b:b0:42f:f3b2:e2c9 with SMTP id 586e51a60fabf-47dcdbbb17emr2893619fac.0.1789141175314;
        Fri, 11 Sep 2026 08:39:35 -0700 (PDT)
X-Received: by 2002:a05:6870:180b:b0:42f:f3b2:e2c9 with SMTP id 586e51a60fabf-47dcdbbb17emr2893597fac.0.1789141174947;
        Fri, 11 Sep 2026 08:39:34 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:34 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:47 +0530
Subject: [PATCH 16/17] phy: qcom: edp: Introduce Nord phy_ver_ops and
 phy_cfg descriptor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-16-e25c073cf1b6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1972;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=94rmdeySxa5fJHfAGld0di57h9zUDb4Ov4YG7k/0YKI=;
 b=6FCW2hLlHDUGqMX0JBT6HvN4i3iC42y74fuKbeKZlV000G80lciwX8BRZBP8TXys2iqxrET60
 2aPAk+8qpgFBX7hOiipgM7AllTxJBIHmy2S9y05wfDnVnAl+d3FZOnR
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa420b8 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hnKCH8YYcLMkF2FFhooA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: TJZCejA5q2_EVluZjnIKXtWYU3v9aYDd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXwLxce+XGobN5
 Yxw1Bz0fKd35v4yIW7ohqI+PKxyOhPo8U7nv2KCQLzpzPxXASOjwSi/z3eXW3l7qnxWG7kUPpF3
 5hBdG7lgbgoyq4iMYY6yiPu1k+XnFhU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX7mKuUrTUG/gA
 FhWpdBruTkoNpNakoq80EJwIsZhKRjl9aDz9sUmRFa9LHOpMZCWN2dkJIGUEioyBW0I4iIkI0kd
 Vphc/JvpvNX5RpqrFmqVmI1U4nXwmeW1lev4EcHOQBpEF7lzhMB10vHe0Qg6b6aNE2IZl99Q94W
 KI6XZGRH7HZSrnxESK6XYLmENZ6s2HSp80yoBcDW9Ud6v6Kxv8PhjdEjNhMiBQN+ubJ1uyxhhzl
 JRZP4u1OKvr0kIurYowiVJyZMFLUUKugjto60lSw2knE9Xl+n2GUoZ/d/Zv4dhw37e5VMFG/k3B
 nShbq7Hx7TYtE7Rqxyd2LMY3Q0QzWXZzJX0QC64XvA8gPErN8/eUudrGKIeCrA2aFCp5BtboUVe
 kYMHNKUFOFJTwjZFgaZ5EkWroJgYcuSmnASxJv5s90EEQwWzOS5QpribM5IOl6mCfntX8ZepDCD
 eg2gGeVsm1IQnugxPuw==
X-Proofpoint-ORIG-GUID: TJZCejA5q2_EVluZjnIKXtWYU3v9aYDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add qcom_edp_phy_ops_nord wiring all eight Nord-specific callbacks and
nord_edp_phy_cfg collecting the Nord AUX, VCO divider, swing/pre-emphasis
tables and ver_ops, with phy_status_reg overridden to DP_PHY_STATUS_NORD
(0x0110) and bias1_en_2lane set to 0x03 for correct 2-lane operation.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 361f4e467351..338f28cb404f 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1847,6 +1847,29 @@ static int qcom_edp_phy_tx_res_cfg_nord(const struct qcom_edp *edp)
 }
 
 
+static const struct phy_ver_ops qcom_edp_phy_ops_nord = {
+	.com_power_on		= qcom_edp_phy_power_on_nord,
+	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_nord,
+	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_nord,
+	.com_configure_pll	= qcom_edp_com_configure_pll_nord,
+	.com_configure_ssc	= qcom_edp_com_configure_ssc_nord,
+	.com_ldo_config		= qcom_edp_ldo_config_nord,
+	.phy_tx_lane_cfg	= qcom_edp_phy_tx_lane_cfg_nord,
+	.phy_tx_res_cfg		= qcom_edp_phy_tx_res_cfg_nord,
+};
+
+static const struct qcom_edp_phy_cfg nord_edp_phy_cfg = {
+	.is_edp			= false,
+	.aux_cfg		= edp_phy_aux_cfg_nord,
+	.vco_div_cfg		= edp_phy_vco_div_cfg_nord,
+	.dp_swing_pre_emph_cfg	= &nord_dp_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg	= &nord_edp_swing_pre_emph_cfg,
+	.ver_ops		= &qcom_edp_phy_ops_nord,
+	.phy_status_reg		= DP_PHY_STATUS_NORD,
+	.bias1_en_2lane		= 0x03,
+};
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

