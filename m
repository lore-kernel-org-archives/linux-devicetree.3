Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B4A36212C
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812078; cv=none; b=X0HVvnKtW0FUcNQTBGcVdfJjtPMgwjEm6+QDoM5BT6hflb8vLRSiRrobEkYgNawZpRVh3N34oLvTbG1TtW059t/u8BYVFaz8e03WCiyIOGOCod87jt/sFBnfipJ9gtZKtNHnk4j7gltK+kQpbkiAHmZdUfGze9SKUOkYawqT1pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812078; c=relaxed/simple;
	bh=4wBfSL/vgt9Nv77W7dodUjwfp6/m3fUKGozL49BmHz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1blJbTREh/Oq4bU5eXxMRaqXUEeTxqkHKbzrkgHJms3Mj9t2IXWXsDi9DacTix+ycXB0AEKRpWEXCyYiw8ormjKt0B9PODgZ2PxzpwkS24VRqzaXIqA2MJClZyU03cBVaaOP/WGM3LDSZDZuG9I9RZ3uZ/hX/2pUBDfzD2KyXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kecer+CP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdBigT5+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kecer+CP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdBigT5+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08UW3292295
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MH8WUhN/uk47zXTtBziw108eq20eC3q5Tm23CfZZvYk=; b=Kecer+CPGi5EW48l
	CUbVCVIAcHqQf9LzC1kzPQyKKOtTBOBRgoEzU7SnsI8tZBXTxBOL6BgZoyo7Ybwo
	Bszi8xFwdosh69R2Apl1BjozI7fAkKSqeqsfLxv05A9yZuABl1rpiOoh3XYcSLys
	1TSB/+RaiN00/lqPtZs5Fgp3plGv7g/cGCgqotqXOl0oU2dnahcF6bRynNUx0R0a
	iAb2E0+LbZXVUNruoIJfp36gLJ5w7sZuqZRuNzq/jDlhB5hlVsnFXzZOqlfBCtau
	+8bQ+qdsx/3EtTMWJfG2+Ur1GojvDkYKoS/yMYJIt/KeHO2VtN+rfk2P1c/a34/e
	TE4RlQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hhu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:34:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a0c25def6so2283713eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812075; x=1792416875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MH8WUhN/uk47zXTtBziw108eq20eC3q5Tm23CfZZvYk=;
        b=LdBigT5+sYAeyHdg+TvHwHWScwXYgiTR3NqKdU38peHAO7nouLjboAerYnwMshWgaW
         vX+YJz6IKiEqQS0KPM+EX3gLvGUP/jAeDxcSfWTBwwWi0kBos/NPb3lwwbHzsy7FQ2Ea
         +ZkcCU+f3uVAhCiTITkFTcktJFYpv4D7DRm1qxV5t2a9UuFxkKuvtK6IXmGlSKoQuyzX
         tpLGT5/aj0dSil7Kot1dGLG5L1dtz+Ygowfl+j7SMaQcAd2yK0KXlB0QMOFfL3veuDNi
         QvfI1uB7ZeVQwqDYUJWRQ6qxI7Y3sm0Ldl7QMhJVhEQk2yr2kCr5wP951BPNSxj1uDX1
         a0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812075; x=1792416875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MH8WUhN/uk47zXTtBziw108eq20eC3q5Tm23CfZZvYk=;
        b=yla1OXGbYX3KXtploLVaUtTxD5sC3CADo+tC617nYnNRhvwSEdCX/wqAdSgoNQA3KM
         jlOdGMI1XVrnt33DNKoPV+qRV/WQasCChSUVc+vwOOjmC51BGPo5k0myiSGru6pLbgff
         BoHVgRdNnhajCEOjUbbkJ11/hXfSFhqq1kPxMmfnXikumOgQGLK13toQndr4mpsNDaqm
         ABjUeLkAr1yCI68o8ZDU6vsFHmw4A42hICxtfsKlhi3ZlQBMxDvQu9w5uXIIrzvG+v8V
         3dA5ZUdtVbkm6Ko3wLe+Gdduwbut4gdenS0teXIZzo9YAF62cCTI1u9E3lRN1gdE4ohF
         4BsA==
X-Forwarded-Encrypted: i=1; AKwUvBzSt3rLDCSXwDTUZ8gs2bRrnsJLRlzKe09DWSjFm5kb9aR1h0MhSKRGEFml1dPDMfvj2cYRsukhArsx@vger.kernel.org
X-Gm-Message-State: AFq9FYKhl+EMJhehxR2Y5dqc+CJEJY/tz0sCXe55/vcfWjVKbupi6qRn
	6pB+HHzSvri1nXk8BhnzdDl/taaGa8cTcx913CPIkdmjkSYtcYgq0TTldMElRKxo7fsAxvsFMTJ
	6GUBoxFF/5sLD54tQKdABezhfBIPcvg1WE3TKkiLIvoHA4qLKWiBhFWQTsdaKEum9
X-Gm-Gg: AYBFou2apGlSMBhEPbhdvSq4YGBhQ6KQldk/ZAOahshRZEm3M6wlFmBWUr0YTLk+lyD
	iT4xMz4FCEG1eWYoKrpvzLIuYdaGWQY9ns10yTvS3yyDwe1eY4Jw2zZYbS1Gj3NH7RqmM3r6sAY
	u0k7cjHSLuIlOaGJMZg1tT5KJ1UdLON1Tr4mgtJ0AqumpIp6Is4sb8sCtTPJkx8+fy3iGBJjAi6
	G7yiak13FLdHczMZ9KZ0C/5fiv0WcTWSFO0NGWvSOTczdbMI0yfHbL/9Kl+/myO/PbUSzxn+wcM
	4PhNmkFDclSOmxppdT1mdhRxnbg7ovnzgY3A+9ssiEqsy+dquwX/dTkdql3FtCh5717CWbN72Fg
	QjKCCoaXkfy3WJQRbvQeQluKxkoc=
X-Received: by 2002:a05:7301:1a04:b0:359:3460:bc1c with SMTP id 5a478bee46e88-3593460bce0mr7259935eec.12.1791812075359;
        Mon, 12 Oct 2026 06:34:35 -0700 (PDT)
X-Received: by 2002:a05:7301:1a04:b0:359:3460:bc1c with SMTP id 5a478bee46e88-3593460bce0mr7259889eec.12.1791812074536;
        Mon, 12 Oct 2026 06:34:34 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:34:33 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:23 +0530
Subject: [PATCH v2 13/13] phy: qcom: edp: Add Nord phy_cfg, ops and OF
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-13-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=2577;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=WRyL8CMWIhLtCVdKv+p4xo6VqSv7gN1Tojlh5IqU2kM=;
 b=0iT/5hPFnYhWK4aFKy2lRGhmL8bjiXZ0Y13HRMcmL7Zsnt9guI5XnKjtZJfIfkIcxaZhw0kw3
 a2RCqqMd8QbBy5CU5aVOPVbdlRqdGrY/tTvGdFnNF6qXVkIU6L6jCwu
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXzX1HeIVLVLWd
 o9GeJ2n8JQV0v5IdCH95znBR+JOllK/WNc+LRIeUvGiPEU52eEi0Xxz9+d6fq0BTioCTpDe8lx8
 9f1l4rcOZKS0CeypdBEZ9/wmZkvMQc0lVNAdeFz09kMsLgmhZfSWNxk1PDwpqydXJQ68xLcUwP6
 xaS80kDgycVqOTe7UOekHMATE6qn2yTC4Yj5JNauxrI1lEkoQSNRXCqu6/BPDyaWoVyIfbqTQqi
 HgFLslYkCm5CZ4LIVjP3vsfCppOWAFbhwe2JxOZOULcRAy6fLENit0SppcvUqqWldt616m3q5J3
 SuojFkc/pLfQOkFH+hXEzv3031QWOk7/CgGMjAF8l9ZOkBQj+DtA1IHgJCpTkLRr6lb6OuIF4S9
 yBJyrP9/ZOOLDCURNozDR8hlqsL8zEw66cmUoIIlKzmx3CFmVpvWwRA1dGw8NJ2WmmfUaGkDTux
 PMpivPxRr1iZge8xkBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX7d8uaiTuFXNI
 Hmp1duTFv35jo9MO2lan4unwLDw4HbcxTSTOpp9fy/pqtSdiAxe2/bk9sIDTnh/EloLPpWItaJI
 iiiTskNfGVXgZ2J9yGGuwBSFB3v6efA=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acce1ec cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EQFMWDaH4iPFUakZLHgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: BBSWPiGJkvJkY0sTfj96coJ1qaNL73p0
X-Proofpoint-GUID: BBSWPiGJkvJkY0sTfj96coJ1qaNL73p0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Wire up Nord-specific callbacks into qcom_edp_phy_ops_nord and
assemble nord_edp_phy_cfg with all Nord-specific values: AUX/VCO
tables, swing/pre-emphasis tables, relocated status register offsets
and TX lane control.  Register "qcom,nord-dp-phy" in the OF match
table so the driver binds to Nord DP PHY device-tree nodes.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index cb5f6e0ae607..87400d61323a 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1774,6 +1774,30 @@ static const struct qcom_edp_tx_res_entry tx_res_cfg_nord[] = {
 	QCOM_EDP_TX_RES_ENTRY_END,
 };
 
+static const struct phy_ver_ops qcom_edp_phy_ops_nord = {
+	.com_power_on		= qcom_edp_phy_power_on_v8,
+	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v8,
+	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v8,
+	.com_configure_pll	= qcom_edp_com_configure_pll_nord,
+	.com_configure_ssc	= qcom_edp_com_configure_ssc_nord,
+	.com_ldo_config		= qcom_edp_ldo_config_nord,
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
+	.tx2_tx3_lane_ctl	= DP_PHY_TX2_TX3_LANE_CTL_NORD,
+	.tx_res_cfg		= tx_res_cfg_nord,
+	.cmn_status_reg		= DP_QSERDES_V8_COM_CMN_STATUS_NORD,
+	.c_ready_status_reg	= DP_QSERDES_V8_COM_C_READY_STATUS_NORD,
+};
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
@@ -1782,6 +1806,7 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,sc8280xp-dp-phy", .data = &sc8280xp_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8280xp-edp-phy", .data = &sc8280xp_edp_phy_cfg, },
 	{ .compatible = "qcom,x1e80100-dp-phy", .data = &x1e80100_phy_cfg, },
+	{ .compatible = "qcom,nord-dp-phy", .data = &nord_edp_phy_cfg, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);

-- 
2.34.1

