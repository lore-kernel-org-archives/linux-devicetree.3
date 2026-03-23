Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC135DA59
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250141; cv=none; b=kzWVeLiPbNs3KrkXBaTHfUG2+a0QxE2FTbYCVt/8NMH6oGclZ/PijSY9wmX5PBpzq+8QNaUBtsNzM65NSEB0+rNwyq+wGKL7GENd86Cs2bfeGde/40VdyLMGH/KTQDbRQtJyjzcYvoqMjOfHJFJgOmyitunYdl3wx/eeRQ0f4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250141; c=relaxed/simple;
	bh=DxC/gzVZbMcfvTcP9R5APmqYjCaKSVBVLpWXzTTw9Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTS+qpDqs5/Yt+dOTvugYYzFvX3gx+7CEcn4LSI6DidKUBFoklLzHqVgEQ4sMIVt66yOdnVhviCZ7J0/DFyDiRcsEAvDLAgLDdC8FyakA/B0N3jCKEeSy/PCjl9frZRUtCdObJGV3x13HC7HAyukuKWdTvxzOX7BQVG9P4vdh8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGaBtv4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvc3Vlc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGaBtv4h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvc3Vlc+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72ASI2508391
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAjmJXPhlt6Zci48E3mL+6SgK0euCberT+LTCSR0TNw=; b=EGaBtv4hEl6T7Vc/
	VtjH+KlUlyzOdk/5F9XPZgnQL+rt8WKC3t9CV3sD+zeDDPLfDlyBI4ZUWdubHo1c
	/CAiDNLIySAxb7LjkyXfZv+2niNQEejvzNjovH4xf3PajwFDrRkvTv/zOm1i30wZ
	SGpeL1W7lamjFOL7o85FMEID/Sqqn405bsdvAHHAmkR9jbUqPJG/V/pRcLUVQVnB
	kYVDBNsLeFRTfDYQT/GhPKJqO+tPeymf9BIYn4bUxluNiOlW4AL3STUmLJplHl6F
	vBoBq7xvuwJKs2c2Lt0rEZUfe1ZUrkmcoLyso62AtPg9SDpsLwx9+Ys2PZKPc6Gf
	JtRGug==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5mb2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:15:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0ba59a830so2923426eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 00:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774250137; x=1774854937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAjmJXPhlt6Zci48E3mL+6SgK0euCberT+LTCSR0TNw=;
        b=fvc3Vlc+o7APdcEtW8YmI7tS/VZEDTieGiyP8mK2Otd1TG6tBYJR/ieK7rG3SagM4B
         TXO0xNXI1wcLVxpgFp4fIWJnkbsDe1mNArt1NJesODNXAC4YL2Ntj+uU/zAoBNNDdlje
         51iSsByqNQmOoYBmOECReZjiQFkZK9Al7mSakw0GjLcbpvIncz1MTZckc+fMJ5Xvi7t6
         yzttWZVebHxK0ELRrCDSHpPR4pEVzWqq+WjasAp5FRxF0HMBO8x3w3wsLUzKXHk4U98Z
         fMhLI6otiJH4peStbAHOcJfuqB/mQf2sifHXJ1qlR7nDA5CDKhFd/n/NaE7vrVaL0wB2
         5EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774250137; x=1774854937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hAjmJXPhlt6Zci48E3mL+6SgK0euCberT+LTCSR0TNw=;
        b=RmCYrq7qpbjEDOG1cO0ckLV/R67LNLokTjaNzWtTbE1O5lhTtpNwEX1zILII/kP5if
         YTsAAYyvJRYiONJJq1R0dylB7TebbR/mAvyVj15mmNCcYsJJ88HJ7V/0pQps2brq9wiu
         m/HCbMEjvUqHSRvOHsjLlZyujD5tuxkRBoIF5qTr3PnIuJ+QcgWPgBBlSo5rh0aNsDRx
         7aHreZvXeGLTPrx6/Y45uygqW2ZZyhGqKZ0ARPmZbhp74ImoEPYvciINy8+NLlmWO1af
         M91ioCSWEixcn4eyf+QoLDnAcqgbTXNvEG+VpN+n8Z1C5QbjtwcRTig9Q1RroWRdmOh0
         JDtg==
X-Forwarded-Encrypted: i=1; AJvYcCXJmdDsv2l4DPnJJyFR3KVmg8ccUaJyk8Jqa/6J8umQG4c5S40CstvBayyPCtWX2bgZvyMT3rE6yZQL@vger.kernel.org
X-Gm-Message-State: AOJu0YzPoUG5WtuyQsqPxWW7j2YYJdFtK3uCGHQujX2NEsD49aiWHcX8
	yqRIXmU7VeOeb4u3md8wgFBE938Xz9oM1dxsgj2aLjLoBs/KPRf0lRX2d4q36cfF42tw6+Ia/M7
	MOftPvb56p3YQbBnHW4Gfup0IQ9QscNTWNDdQAK3QJq1Ws/MJp6wQJfOvdVz0+pI9FicHveC/l4
	U=
X-Gm-Gg: ATEYQzzA7nr6CH0eXfBrzb3DqnDjthYAHik0kAUvFoHAhYCvRAnoUcSObxVQRorhKfL
	4E+y8BdoPcleT9fAxRtciI0DEfJXtToBBQAUKfyoYNiIoQjAYl990M5+ftRZPuDraEuM7yRUv2g
	EG1aFA3soEcgq9mdV3SAWoYLBsD3ey1p2Gv6G0FG5momVUS9HQSl9kp/7fSrgZ+stE7fc4VmGBd
	YLrzP2jXfcINUG/zlx/i3bCs/Icvy3s/CyH00P4LZh2pzvcmWceQFgviNi8puOhW/jl+j60IvJj
	/t8SytJl8sFO9waFhKzJaLwX76ZNId2BJJk+3RDmzxwsK/K3GTCUP9bP8vGZ18akNxFPmu0lkT5
	9Y44RmQKd29uSxZM3WFep//lK98TJeiGWdH3gjhrpswJ5n5AWESNtUwUng8Ko77MPOxk9
X-Received: by 2002:a05:7022:160b:b0:119:e56b:91ec with SMTP id a92af1059eb24-12a726f5b6fmr4673515c88.29.1774250136986;
        Mon, 23 Mar 2026 00:15:36 -0700 (PDT)
X-Received: by 2002:a05:7022:160b:b0:119:e56b:91ec with SMTP id a92af1059eb24-12a726f5b6fmr4673492c88.29.1774250136236;
        Mon, 23 Mar 2026 00:15:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm13997886eec.3.2026.03.23.00.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:15:35 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 00:15:30 -0700
Subject: [PATCH v2 3/5] phy: qcom: qmp-pcie: Support multiple nocsr resets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-glymur_gen5x8_phy_0323-v2-3-ce0fc07f0e52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774250130; l=10138;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=DxC/gzVZbMcfvTcP9R5APmqYjCaKSVBVLpWXzTTw9Eo=;
 b=hQ0y5v1WwDFOAQr/O8x+Dz+1lSYukKZ5z8dc9CwzbaREjpcD6ua+3b8IT6L34UXwpKX17gbNM
 rKVMqYsLNtRC5B4Uy5XkDV3idQtD2aJK6tWS8FP0elDb/XJNqm5+RfZ
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c0e89a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wBkCwaD4edhj46uzH8YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: ioh03UDFXp7cDO3Sjo2bcO6iyU5zIyVy
X-Proofpoint-ORIG-GUID: ioh03UDFXp7cDO3Sjo2bcO6iyU5zIyVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfX+3iI3rCh2MRU
 JPOoubE7WoUi8DraGbTP69isYo7Bog36ZTz2ObOZf/VhOTkYd4rSRUyWh7AM20l2VnVhrrIAKe5
 iLfQU3CxpAJ9b0tVjAS+eN6jWMoIhqy4bnk29okZ24khnR9hcyb+ttKYz/iN+pUj/4sOWTkEIgs
 M5ybqaCp/DNT2S+lbM0vt3yfZPbQsuApDC8n7KW5/Qu94ofwDXC9EfzY5EBR0XqlNenPjSHiRe4
 WHkM/YJer3oEiq5g8BfPUbRh2h71FTG5RuIqer+DeKw7RiARcHQyOmwWzfJve6/lVXjFkVzO50P
 hyBK7kxMIazUF0HwruIiD1f45HJD7XfFVXbOtotOIMb9urmMxQ3HDHGM5PYoKG6jKnv4wCbIP2c
 UMhbAmLWZFZ1cu5OZeZfeWPI5lPSBWdPurIjDCDD+lEI2bscFNJ3yyUCULMx5fwzxpAJ70xDJBb
 UE1qCzJfbjeItk73/Mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230054

Refactor nocsr reset handling to support multiple nocsr resets required
for PHY configurations with bifurcated operation modes.

The Glymur SoC's 3rd PCIe instance supports 8-lane mode using two PHYs
in bifurcation, where each PHY requires its own nocsr reset to be
controlled simultaneously. The current implementation only supports a
single nocsr reset per PHY configuration.

Add num_nocsr and nocsr_list fields to struct qmp_phy_cfg to represent the
number and names of a group of nocsr reset names. Initialize these fields
for all PHYs that have nocsr resets, allowing the driver to correctly
acquire multiple nocsr resets during probe and control them as an array
by using reset_control_bulk APIs.

The refactoring maintains backward compatibility for existing single
nocsr reset configurations while enabling support for multi-PHY
scenarios like Glymur's 8-lane bifurcation mode.

Additionally, introduces x1e80100_qmp_gen3x2_pciephy_cfg as a separate
configuration from sm8550_qmp_gen3x2_pciephy_cfg since the x1e80100 Gen3x2
PHY requires nocsr reset support while the sm8550 Gen3x2 PHY does not.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 87 ++++++++++++++++++++++++++++----
 1 file changed, 77 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 424c935e27a8766e1e26762bd3d7df527c1520e3..51db9eea41255bad0034bbcfbfdc36894c2bc95f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3281,6 +3281,11 @@ struct qmp_phy_cfg {
 	/* resets to be requested */
 	const char * const *reset_list;
 	int num_resets;
+
+	/* nocsr resets to be requested */
+	const char * const *nocsr_reset_list;
+	int num_nocsr_resets;
+
 	/* regulators to be requested */
 	const char * const *vreg_list;
 	int num_vregs;
@@ -3327,7 +3332,7 @@ struct qmp_pcie {
 	int num_pipe_clks;
 
 	struct reset_control_bulk_data *resets;
-	struct reset_control *nocsr_reset;
+	struct reset_control_bulk_data *nocsr_reset;
 	struct regulator_bulk_data *vregs;
 
 	struct phy *phy;
@@ -3392,6 +3397,10 @@ static const char * const sdm845_pciephy_reset_l[] = {
 	"phy",
 };
 
+static const char * const sm8550_pciephy_nocsr_reset_l[] = {
+	"phy_nocsr",
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_qhp = {
 	.serdes		= 0,
 	.pcs		= 0x1800,
@@ -4348,6 +4357,8 @@ static const struct qmp_phy_cfg sm8550_qmp_gen4x2_pciephy_cfg = {
 	},
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
 	.vreg_list		= sm8550_qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
@@ -4380,6 +4391,8 @@ static const struct qmp_phy_cfg sm8650_qmp_gen4x2_pciephy_cfg = {
 	},
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
 	.vreg_list		= sm8550_qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
@@ -4480,6 +4493,35 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg x1e80100_qmp_gen3x2_pciephy_cfg = {
+	.lanes = 2,
+
+	.offsets		= &qmp_pcie_offsets_v5,
+
+	.tbls = {
+		.serdes		= sm8550_qmp_gen3x2_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_serdes_tbl),
+		.tx		= sm8550_qmp_gen3x2_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_tx_tbl),
+		.rx		= sm8550_qmp_gen3x2_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_rx_tbl),
+		.pcs		= sm8550_qmp_gen3x2_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_pcs_tbl),
+		.pcs_misc	= sm8550_qmp_gen3x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v5_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
 static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
 	.lanes = 2,
 
@@ -4502,6 +4544,8 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
@@ -4535,6 +4579,8 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
@@ -4566,6 +4612,8 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
@@ -4581,6 +4629,8 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
 
 	.reset_list             = sdm845_pciephy_reset_l,
 	.num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
 	.vreg_list              = qmp_phy_vreg_l,
 	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs                   = pciephy_v6_regs_layout,
@@ -4609,6 +4659,8 @@ static const struct qmp_phy_cfg qmp_v8_gen3x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= pciephy_v8_regs_layout,
@@ -4624,6 +4676,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 
@@ -4640,6 +4694,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.nocsr_reset_list	= sm8550_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(sm8550_pciephy_nocsr_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 
@@ -4768,7 +4824,7 @@ static int qmp_pcie_init(struct phy *phy)
 		}
 	}
 
-	ret = reset_control_assert(qmp->nocsr_reset);
+	ret = reset_control_bulk_assert(cfg->num_nocsr_resets, qmp->nocsr_reset);
 	if (ret) {
 		dev_err(qmp->dev, "no-csr reset assert failed\n");
 		goto err_assert_reset;
@@ -4805,7 +4861,7 @@ static int qmp_pcie_exit(struct phy *phy)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	if (qmp->nocsr_reset)
-		reset_control_assert(qmp->nocsr_reset);
+		reset_control_bulk_assert(cfg->num_nocsr_resets, qmp->nocsr_reset);
 	else
 		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
@@ -4849,7 +4905,7 @@ static int qmp_pcie_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(qmp->nocsr_reset);
+	ret = reset_control_bulk_deassert(cfg->num_nocsr_resets, qmp->nocsr_reset);
 	if (ret) {
 		dev_err(qmp->dev, "no-csr reset deassert failed\n");
 		goto err_disable_pipe_clk;
@@ -4998,14 +5054,25 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
 	for (i = 0; i < cfg->num_resets; i++)
 		qmp->resets[i].id = cfg->reset_list[i];
 
-	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
+	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets,
+						    qmp->resets);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get resets\n");
 
-	qmp->nocsr_reset = devm_reset_control_get_optional_exclusive(dev, "phy_nocsr");
-	if (IS_ERR(qmp->nocsr_reset))
-		return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
-							"failed to get no-csr reset\n");
+	if (!cfg->num_nocsr_resets)
+		return 0;
+	qmp->nocsr_reset = devm_kcalloc(dev, cfg->num_nocsr_resets,
+				   sizeof(*qmp->nocsr_reset), GFP_KERNEL);
+	if (!qmp->nocsr_reset)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg->num_nocsr_resets; i++)
+		qmp->nocsr_reset[i].id = cfg->nocsr_reset_list[i];
+
+	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_nocsr_resets,
+						    qmp->nocsr_reset);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get no-csr reset\n");
 
 	return 0;
 }
@@ -5520,7 +5587,7 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 		.data = &sm8750_qmp_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,x1e80100-qmp-gen3x2-pcie-phy",
-		.data = &sm8550_qmp_gen3x2_pciephy_cfg,
+		.data = &x1e80100_qmp_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,x1e80100-qmp-gen4x2-pcie-phy",
 		.data = &x1e80100_qmp_gen4x2_pciephy_cfg,

-- 
2.34.1

