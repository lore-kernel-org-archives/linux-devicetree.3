Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6521A35F185
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250142; cv=none; b=MnScYGxb8jOhsGz6LZwLLf+fp8GUuwJndzd4DQBIkzU01W0j1e1LF5yzv0uNq09oH2+Abg+T3qftgHM9G3lfGnET3dnjBOiSARr6wr+c1nCdVBWfF6Y9/jX8Sbw6CHwal+hG6LIOZVNTJ/MCEQURkJoWhvDSa6NubVELJN/Prmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250142; c=relaxed/simple;
	bh=ZiGLm9+oSWgzXrpOJ1svwFM4yASEfqBDxFjXKTyaJxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NSBCjicY3QTdImIze5raVa5qJg3d6r0UV9V/Bv0P+sUtfdrewfrUTCCuWa3EvUcKHnignVNT9aPdkocK5JERSiXuQIri6XKoM7PAlz5VQoM2apdZpdSBAWgq8VPqrGe2ExAyiCISyiztpYSHDWBHzvxQXWqf+5BRcRF5pqyuz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vq/EmhE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvDxF7wP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vq/EmhE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvDxF7wP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4kP863090776
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyA2/GBUswWyqK7lPIZi5AAheFIz9RV+IBewUuyeNsw=; b=Vq/EmhE2LRIB61V2
	F5AXE/rSeLSImj0Ig6gi+rjKWyS5wp6RWsi824KFlUoD6wj9jMd8LlFjNU13OnPA
	qcrJytO4lzhEGuWDv/VEzWsYrlEOtZzea0vQWQqnTTkoFIpFDOuysvmZ9G9yPZao
	i0ZhQKT16sin3GX51GQM+EzitEcbp0nAS3cxOEwRrQyH4xjO+Wz8QzP35MZUz9Sl
	2oNdaKU58OgkIbAcTNSitxK793jIxIR287FqFNWmhdMa9eis+lfvOiTW94WOansG
	46cS1boyd2FlMODwh8eg+LYVmDp/iwAch95RXdP7o3HLUd+hflHu/gO/PG/PRAkr
	IBw/vw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvm8gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0e264d802so8185113eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 00:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774250138; x=1774854938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyA2/GBUswWyqK7lPIZi5AAheFIz9RV+IBewUuyeNsw=;
        b=EvDxF7wP5uy423aHRbqXsuNUB9SGcSV6Buf5xlWhHAgnzvIzKxtQJ1yp6Ep4qOUk/E
         vn+evJaSUg0O9zn0HsoK5P2lKWVFql4QvabsFwCXFh7vpKLBrFwfPHMWybDuk2wBbJjK
         e1Nyys5kwUT54xl7umpMLKCFFQutTzU7TR/WOZi8C+cHV3zdWpX8wGKxSOAGQh239r8e
         NET6hWdoroG/0PQrH0KDR7NBOMeWZwdmVltSh72M0XAqCG6m0b4Dhftjl14fqglKOUDI
         eCWHy+7CBTkT3lEEEt9d23Y8G222vGieF9JC+fPYYpxzn5FalPGAKyHGx0UEnL5tx8i0
         Ej+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774250138; x=1774854938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DyA2/GBUswWyqK7lPIZi5AAheFIz9RV+IBewUuyeNsw=;
        b=c+8mXCrg+8AxKBSMjxUaUV/vh878D2lMtqGi/0M0FQa0Gj9Rtzw/odxTlrj4bJe0dY
         ijxSRoh6A4XGkNoPs0uV7AsMKyXPTRsffDHl0t7XXykZEn40hKWqq6yLZSVWp1RT4PGp
         4Gcfsb3TIUTimXRcRxveLZzdN1g4FcIrJocuTCGaRKX+Gr0jASxCJIjmBonxyWkvBiqE
         Sj13LeNmffNBC9f7UWsrEfc2g6t02NiDXddBWnLB21rHFrEI7Ke797u6+H88E4YhlIpG
         FZeTej3M3ia3tD2253lMHM3HYEVfOz5MNiPWKpIUrREloObztGeLfF/Q8qp8rCqNKCA9
         jDIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCfDq9N+p2t6jkwdhBm5kgwkeeyIBJcTJFC2b3J/5g7HYFSkwU1y7cFdsWXakEtOEzAZ0wEixGshRW@vger.kernel.org
X-Gm-Message-State: AOJu0YwB66GFhXRiqX4QomRYKSmFM4za86Au/7zqPRO3Mu6sFfWpoOcf
	cmrmfIUC+YpHayTz1X94dfh8NDPozQV2DI+WelX5suyS8Je9qIkCwY1LeNRxPvBa9A5ViwwjKfi
	C9sDHjpTcjMe0WmGVoKy053KcV0ayVnThl9oL7oSK8H6ZL/kLAxfTHSwAFrDd2QlVkLhDmH+dyT
	w=
X-Gm-Gg: ATEYQzwmhuhWLkeNqn/JoxcQzdg8jLfBeJXndcqZVP5MHyiPeXCMGGDPsMf8zhOsLGh
	2f7Ck6MXSJubvQd5htpAd3C0vJqaf3i8ALaLocZ9LCReCpeKFshKjIUmV8yx2Jaja6Wt7IUq2sc
	Vq8Xrfy94KB8mueuLeAQ/yL8dF1nBYBeLX0j4piQKu5yWi1VBC8XkPiPqBuzerN572Rpa5thdVa
	mHEA6p2fomj58Q/kfVp8v1v6mESzjg/dBvZ9SNHY8Jk1JeN4G1dPQ7d879jdMRBqGu3kz+gkYHM
	v0U+UfYlReWT+OpY5DwDLALryN6JA5BQsk7gQpy/3ZS/qntObAcEmQTzW3uw42s3e97sgrV0y8N
	LTOAmNYPwhAOl2Ts+jV4VlSzBZ8beueSU8tIfMLKuAWFQpSxaZHawNbwpIB5/cWZCeDW+
X-Received: by 2002:a05:7300:d50f:b0:2c1:23d:c73b with SMTP id 5a478bee46e88-2c1097c1a67mr5306458eec.34.1774250138276;
        Mon, 23 Mar 2026 00:15:38 -0700 (PDT)
X-Received: by 2002:a05:7300:d50f:b0:2c1:23d:c73b with SMTP id 5a478bee46e88-2c1097c1a67mr5306444eec.34.1774250137709;
        Mon, 23 Mar 2026 00:15:37 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm13997886eec.3.2026.03.23.00.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:15:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 00:15:31 -0700
Subject: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774250130; l=2780;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ZiGLm9+oSWgzXrpOJ1svwFM4yASEfqBDxFjXKTyaJxM=;
 b=PcRacB6pSJVxw7Koy22WvzFFIvGHWro7XrJ2AhxlvVYDiL1LNVZe0Fb0bYO2I6mXQ8K2jMqXy
 vshQ/rNhhaEDJQn0pLSr6qO9UJeUM2FjYeKORjWxlxiDmaA3U/f29UR
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1MyBTYWx0ZWRfX3g325JRqo5WK
 SYV5wd+ndMz9VbhIxudiZX/ogR0li/Am8Ak1yQFE034WyarPlbAlh+PrZb2y8kWgO8DVPv/sBny
 6CXjD/vIV09eiF24o3lBRhX+CuJHjde67BSVDr1uP6hcM62HZD2pL5U5QvgQ6XNZGtuu3FN+ggU
 NthG499i2uKRoafsy8JjECsIlzHbZcRHtNr474Bj0HgStmn6+PL2yyGWWFfafC/AFHUQFQB8uNA
 6BegS7oYxj3cDOEsOrUDol2a3jiYeaasoX13BPiS9mXzjEtxvVW+973Y/B506qIjyiCYT4XJjOQ
 og7352QRR57KV6xLJROTll4BqEB/B6CdPhA3F6ien4/P3uXjMGwFLToaX8WeAfymOOfPrbFTdrW
 WkBpi6fiQbDOMOCJka3svaKO5EEZUeUbry9VaegcKdATQIjKmaRhNungExJTgqMn6GahK/ySeit
 rrGbY1MobpCFqdLQnyg==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c0e89b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OKc3O2-h_waFBcwqEmQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: A82vNlPPHPuYtMEFjFxdwyThhs14moqX
X-Proofpoint-GUID: A82vNlPPHPuYtMEFjFxdwyThhs14moqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230053

The third PCIe controller on Glymur SoC supports 8-lane operation via
bifurcation of two PHYs (each requires separate power domian, resets and
aux clk).

Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
clock ("phy_b_aux") required for 8-lane operation. Introduce new
glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 51db9eea41255bad0034bbcfbfdc36894c2bc95f..e872b50b11da50e6317ce7e1acf6385925f92cdb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3376,7 +3376,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /* list of clocks required by phy */
 static const char * const qmp_pciephy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
+	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux", "phy_b_aux",
 };
 
 /* list of regulators */
@@ -3401,6 +3401,14 @@ static const char * const sm8550_pciephy_nocsr_reset_l[] = {
 	"phy_nocsr",
 };
 
+static const char * const glymur_pciephy_reset_l[] = {
+	"phy", "phy_b"
+};
+
+static const char * const glymur_pciephy_nocsr_reset_l[] = {
+	"phy_nocsr", "phy_b_nocsr",
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_qhp = {
 	.serdes		= 0,
 	.pcs		= 0x1800,
@@ -4705,6 +4713,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
+	.lanes = 8,
+
+	.offsets		= &qmp_pcie_offsets_v8_50,
+
+	.reset_list		= glymur_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(glymur_pciephy_reset_l),
+	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+
+	.regs			= pciephy_v8_50_regs_layout,
+
+	.phy_status		= PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5483,6 +5508,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
+		.data = &glymur_qmp_gen5x8_pciephy_cfg,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,

-- 
2.34.1

