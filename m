Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B2435838A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169652; cv=none; b=ld86g6OL2yYcrn8Kz79v8MTkDwJSN4oKrEGx6mylEXXnkhTIV3OI5arpfICFETqllnjnzUgsFkblWeOWuHk/KxHtGa5HTD6fivwpO4aPPTXkfQi1aQM/mgIFIdnniOeLS6bIcHnzge8jYEOHGFVPQ/6iz3cHNuju1Ax/BVdikgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169652; c=relaxed/simple;
	bh=e+ge6SFVDXSZrp9sZxMLj4iJXXQDEqpoi4+iUcg4R2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UG1gWuoLr5SrV1RVHDsmJm940QbB43AVx0OumTU+yVSg+Kp1S8pkVDnHNO21EvGOL9JYl/6P741JOuXshqJuT/MJj9w5COEZLXtnAya2fIL/Hn/TmWAdc6aSo28+LGtNXvstTzKBJOb2AiA1hAVpVAgIZSC+jrxccZ5naPM+yPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqs38DJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGJ3L0Jf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqs38DJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGJ3L0Jf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5WGjx4130965
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0GSTBL64LgRqeP391F8PGtCzro2cCQhAPnIDXVHDdk=; b=oqs38DJXyTSw93BZ
	EbEaCCLfC12gFHVmKLvkvbWmmOpe8suAJbK3mxC09bw4re1IJFyhZcDVCgQRX1J6
	xsqATNXqVRkOIgRJSrm+fS7VL2RDpE+f3pqRyhPcI4hp9h7RJTlfwNMRf5hs63Yy
	3pHJM4uwfMg0F3dE9UhmY3WbrKraeni2zdgnM4pTBBlLqMDjmnJnez1CBMrYKjXo
	TTmKnnBBsV+HHj57chjmlrPAiUd1fBhaj1uv2AEpOdZukdDeGirBnpIIFF6Gg7L7
	0doke5M1hjTUJYqF2xvMDZw/REHOqDSBa5CVBIZ1ApLFuuC2wef5TXACNw/lyprX
	DHMHxg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1g1tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee34588671so3657332eec.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169649; x=1779774449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0GSTBL64LgRqeP391F8PGtCzro2cCQhAPnIDXVHDdk=;
        b=iGJ3L0JfmSWUejuRhxftYAiCq0nToX1KQUzy/vaWgBdt+bJPNk+PT/43R6hNbqYqkq
         r9+FHngz1EYqqvxd8pQTrbTB/xwivKLiHvbbCuBfX/j/ujz7xASneE3CfhPiafLyHqkS
         e5wwkZUIIqdhESEQyjN//AWUfKFd+f2m752cb7lehurUDjG+rPcPo9gEfCuKH0jDuRGx
         HUK196JqDiEoB+wfD/IQs7+vC+hh0E6DKzDmVGA0KmxTC6ngDmtD6KxeWKKudqvFuov5
         aeGqM9z/JAVa7g0Q1bD5FVqFm43IOOFW8AUWUO/VbbeyfsNnuqEG3g2X33rrOnRxpsXt
         iHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169649; x=1779774449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C0GSTBL64LgRqeP391F8PGtCzro2cCQhAPnIDXVHDdk=;
        b=HBGnDT5cfsHITtcrISHwYYkOFv/Du6ZQuhD1WM3+SMY005SlcwSNrq7KYR0tKUEaT2
         p53K8onc5tZcVtSFL2YKtXTKLvWzOv8xnNWVh8VG9yt01O/Qf6o4t6TRQsVPigX17YNf
         w0Kcu9aHWgl3rcIHQ/nboC3PXDm3IUrFVd4tkaKP1LHEwInsfCBMFGi5Qiok28w5ccMw
         0FX5zPY47O5wo4Kwixv/M6WLhf8+MkVaKe853UaLv0cJJKfgc0+cL3EUWj9i1pl2OYpr
         3DjywCEUdck/5Qdb9DJYCbOJ9gCwuqRKpd3PebgWOp7wa88RMEFi3XRg/n5kfhYuDs4U
         sQwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/V68pTSfkl6c6AcUbXGO/bsHDrNMVy/tKKjUwBCPQjD0lsVRsixpc8/qKwwNPMJMkGk4wv52e5Zk5W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb0ndNuaDid9otvFaC/wUjBdX+6EH25z14f1INdQBa/chYle90
	hgQhqWJ5mtvubcGpxH7sJa9me5OcCWPrtOqRQGEUIGKVucHaXp47Yl379wyMK0W3CVsV0WrCzMu
	da9WK6Wq3q8cggEPxDwVz796HN0PBbB3lwK5r0xMYIS+94BCclE5il799X3M8xjtV
X-Gm-Gg: Acq92OE+rqbSTNaI6lAJ8Gtv7gO82Zx6IPzbk6TaGcjcXEGP/YnTbPYnm/7ynlEF1qN
	yokauEdEWA/87WdrgK/4LihwD1xyga1aAWv+vtokDH7JFBhzvr5JDGnsdiXF59MOkRfbmOsU1ft
	SfW2LpEDpS0AYIo69+HG9E+jNx1q5Eeo43vLgp2U6AJGKwhs9lhZVCmW3NX0C0esMnFSiS5Po8e
	7x9TOh13j8dQOulDSare0Lm0EVzVH/3D5B7gKTkVcNPZFs+Umt1uxn2Bd7aAWlapi5N3ecsTiYU
	0+WjSLyrZlwqQI7A5Ixnk4Wy9HR2gvmMX2X8suenCYERe4iFUij5I7NkbkCnXjR60++3V/Gzatv
	4wov//fvHgm7i/g0yIeLuoXwOuBfWn95U8HXFYq7dC/PDXWbCGG7j01iWP7zoTT7x6kXGrR/yKf
	+ynNY=
X-Received: by 2002:a05:7301:198e:b0:2dd:144b:6c2 with SMTP id 5a478bee46e88-303986a03b9mr7271846eec.27.1779169649089;
        Mon, 18 May 2026 22:47:29 -0700 (PDT)
X-Received: by 2002:a05:7301:198e:b0:2dd:144b:6c2 with SMTP id 5a478bee46e88-303986a03b9mr7271826eec.27.1779169648521;
        Mon, 18 May 2026 22:47:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:28 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:19 -0700
Subject: [PATCH RFC v4 8/9] phy: qcom: qmp-pcie: Add Glymur Gen5x8 PHY
 config and match data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-8-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=4238;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=e+ge6SFVDXSZrp9sZxMLj4iJXXQDEqpoi4+iUcg4R2M=;
 b=mPxErfRhw0SH57/BJgIP8D86VgsLj1bdZiVnh04jQhF6OAk+fnKRRhEMolsLD2qde6UVaDqBo
 SkCs2S9qWw1CzU1HreTkO/PN8p+uPl5URL/DPRfsbUMGdNFK/BnPWqv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0bf971 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=O3x3ihak103vsextEXgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: RmDTnppcnsusEa5jX-lP9PeVI_d43uhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX8UR8RMYOlBd2
 pwtFyJOcLwk0kWiATDZ5L3NjuW9qxr+zBhNhadIfA6esOhZGEU3rst3oXheYVu0LfoQvjiN/PBl
 uVpFQAhoksiEEgsYAi2HSu/VD77kHHWh5n60z0U0WLPdnOLY+ZwEQy0fMnh0r+SGq2HlocXQM62
 dcHwTY2A0f/GjwymCCYQqMYI6ouiLUJGVjDuL6odvuP9rAgmzcZbRC1Kbb7S1v1kejChg07TJDe
 Rq9Ik3rx497sfykz7VYzhju1Ul/n1Yvo01rX/9EVK9vKcIY+Ghwe+cqu9runYj8n3x4wZ6ZjZdB
 PvLLGnlAY7OGP/sxh6JuhySUwiSKXuQUMCCn2m8Fp47cy84Gxm/bIXsFOMU2spgiK3ox1qsxkf3
 zCFjVy64Q6qfVQ6/7vERCaLyAwHvYqzBFbCFOlh/R6trVWZ5bpUCy/MMUuC3BHZWdF0BQvDR2BW
 Jox2+U7fki7bO7XrWXQ==
X-Proofpoint-ORIG-GUID: RmDTnppcnsusEa5jX-lP9PeVI_d43uhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053

On Glymur, PCIe3 uses a single Gen5x8 QMP PHY hardware block that can
operate in two link topologies: x8 as one 8-lane PHY, or x4+x4 as two
independent 4-lane PHYs. Both topologies are served by the same DT node
since they share the same hardware block and TCSR mode register.

Per-topology reset and clock lists are introduced alongside the PHY
configs to reflect the different resource ownership in each mode. The
per-mode PHY configurations and match data are then added to wire the
two topologies into the link-mode infrastructure introduced in the
previous patch.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 80 +++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d78d57fb64d6..d4aeb3e00955 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3399,7 +3399,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /* list of clocks required by phy */
 static const char * const qmp_pciephy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
+	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux", "phy_b_aux",
 };
 
 static const char * const qmp_pciephy_secondary_clk_l[] = {
@@ -4746,6 +4746,81 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const char * const qmp_pciephy_secondary_reset_l[] = {
+	"phy_b",
+};
+
+static const char * const qmp_pciephy_secondary_nocsr_reset_l[] = {
+	"phy_b_nocsr",
+};
+
+static const char * const glymur_pciephy_reset_l[] = {
+	"phy", "phy_b"
+};
+
+static const char * const glymur_pciephy_nocsr_reset_l[] = {
+	"phy_nocsr", "phy_b_nocsr",
+};
+
+static const struct qmp_phy_cfg glymur_qmp_gen5x4_secondary_pciephy_cfg = {
+	.lanes			= 4,
+
+	.offsets		= &qmp_pcie_offsets_v8_50,
+
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.reset_list		= qmp_pciephy_secondary_reset_l,
+	.num_resets		= ARRAY_SIZE(qmp_pciephy_secondary_reset_l),
+	.nocsr_reset_list	= qmp_pciephy_secondary_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(qmp_pciephy_secondary_nocsr_reset_l),
+
+	.regs			= pciephy_v8_50_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
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
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
+static const struct qmp_pcie_link_mode_cfg glymur_qmp_gen5x8_mode_cfgs[] = {
+	[QMP_PCIE_GLYMUR_MODE_X8] = {
+		/* x8 */
+		.cfgs = {
+			[QMP_PHY_SELECTOR_0] = &glymur_qmp_gen5x8_pciephy_cfg,
+		},
+		.num_phys = 1,
+	},
+	[QMP_PCIE_GLYMUR_MODE_X4X4] = {
+		/* x4 + x4 */
+		.cfgs = {
+			[QMP_PHY_SELECTOR_0] = &glymur_qmp_gen5x4_pciephy_cfg,
+			[QMP_PHY_SELECTOR_1] = &glymur_qmp_gen5x4_secondary_pciephy_cfg,
+		},
+		.num_phys = 2,
+	},
+};
+
+static const struct qmp_pcie_match_data glymur_qmp_gen5x8_match_data = {
+	.mode_cfgs = glymur_qmp_gen5x8_mode_cfgs,
+	.num_modes = ARRAY_SIZE(glymur_qmp_gen5x8_mode_cfgs),
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5797,6 +5872,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
+		.data = &glymur_qmp_gen5x8_match_data,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,

-- 
2.34.1

