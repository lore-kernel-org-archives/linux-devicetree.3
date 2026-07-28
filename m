Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECBD421248;
	Tue, 28 Jul 2026 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233447; cv=none; b=L/bU+Ev34UXcJrKNbZces6s8r0px3UXXqyQOTtLnFsKuCJe7n1OcQIXMiT6pQIhRi0PgyU8jRSfPjA7WIdhG7FPC24JY2xV02mTVhtOJW1vbT1UOjgjGH/jqMLb15FNgqU0e3ivA9HEdx7p1wqYPKDKOI5oDCedIqaH/XamDK2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233447; c=relaxed/simple;
	bh=NvKfW5rMfEHL7Hbxo/pZZSfw1BR08al5DEP4aHzGSj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vjl0OUFjElx6tEzMcWQteTH1IAXSTti5n6B6iyVJTlVzz2hPP6Et51MePvjUCSJaXY3F/ARe5xXSWjr4Xg1jQMfI4vsrOXeRMW/t0nHxd0RUSqrOWFLasvuiVJZ6iiadyOzgpmn9UPU2cISwa3YsIjiiqUT5pB3EbKb33eFSgRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6lbdwYG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6lbdwYG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131E01F000E9;
	Tue, 28 Jul 2026 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785233444;
	bh=eAKkQWUP9dasE3+3Ap/wz9c4lp8FaarMNvjGd+zZeDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S6lbdwYGvmrRRNDJy0TqyWJAs5J3DvzGQVZeoo+vr/fV/n+raVKZKMzvLtf4kkrAg
	 kfvATJZi49JH+Cvu+F6OV7Ja388Q61QZd8iSik/OdUT3I73eUiXUYMgooMeeYI9U18
	 7YGe20uSmXSc1IS9t938W8n38WX/WX0TfkHTeGbB2G+ToXq2yfobMN6Y86Izlr2P9N
	 gsaDlV+n9RqQvL2Y8/53ihLwESldDPT8OPoZ3Wud4J7NwGC89sd7W2ZZSNbWCVQfEr
	 tn64jQf8W13m+S3Mafz+GrJAivNtWaAN1Iv8YC2oZ/+NK1xFyhgchsr1jABfTrI4II
	 n4hB9U4Ema9vQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 28 Jul 2026 12:10:15 +0200
Subject: [PATCH v2 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-usb4phy-v2-4-5d9dd5149ec7@oss.qualcomm.com>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
In-Reply-To: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785233420; l=19961;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XgC8HlvguzMAgZP3zupTgoHitYK/x4zXR9ks3GaXKiw=;
 b=VoVQaCDnG/QNwuqBZTpXM5ZpSG62oD4Oah9cXa/My4kD6B+V82NKQ9stIG6DID3o86jWOk1lc
 qLC33oBYevJCU32XwSuGz+INtxKp/Ix1DQP7QxMb+iplQnbyptXIi74
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the offsets and configuration tables to support USB4 and
Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 200 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h     |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h     |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h |  45 +++++
 4 files changed, 256 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b80eac9d7140..419668e01490 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -235,6 +235,7 @@ static const unsigned int qmp_v6_n4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
 	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V6_PCS_AON_CLAMP_ENABLE,
+	[QPHY_PCS_USB4_CLAMP_ENABLE]	= QPHY_V6_PCS_AON_USB4_CLAMP_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
@@ -1812,7 +1813,85 @@ static const struct qmp_phy_init_tbl sc8280xp_usb43dp_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 };
 
-static const struct qmp_phy_init_tbl x1e80100_usb43dp_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl x1e80100_usb4_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xb2),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x43),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x86),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0xa7),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0xba),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x3c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CORE_CLK_DIV_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x76),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0xb0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO_MODE1, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE0, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE1, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IPTRIM, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SVS_MODE_CLK_SEL, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_MODE, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_VCO_DC_LEVEL_CTRL, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC_2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_INITVAL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAXVAL2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_POST_DIV_MUX, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
+};
+
+static const struct qmp_phy_init_tbl x1e80100_usb4_tb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x54),
+};
+
+static const struct qmp_phy_init_tbl x1e80100_usb4_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_LANE_MODE_1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_LANE_MODE_2, 0x50),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_LANE_MODE_3, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_RX, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH1_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH1_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH2_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH2_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LDO_TIMER_CTRL, 0x03),
+};
+
+static const struct qmp_phy_init_tbl x1e80100_usb3dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
@@ -1873,6 +1952,68 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_RX, 0x0a),
 };
 
+static const struct qmp_phy_init_tbl x1e80100_usb4_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_ENABLES, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE2_B0, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE2_B1, 0xee),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE2_B2, 0x58),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE2_B4, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B0, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B1, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B2, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B3, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B4, 0x6a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B5, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B6, 0xe3),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE3, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_PI_CTRL1, 0xd0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_PI_CTRL2, 0x48),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SB2_THRESH1_RATE3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SB2_GAIN2_RATE2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SB2_GAIN1_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SB2_GAIN2_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_IVCM_CAL_CODE_OVERRIDE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_IVCM_CAL_CTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_SUMMER_CAL_SPD_MODE, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DCC_CMUX_POSTCAL_OFFSET, 0x1d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE2, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE3, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE2, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE3, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_PI_CONTROLS, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_FASTLOCK_FO_GAIN_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_FASTLOCK_SO_GAIN_RATE3, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SO_SATURATION, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_IVCM_POSTCAL_OFFSET, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_VGA_CAL_CNTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_VGA_CAL_MAN_VAL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_DAC_ENABLE1, 0x88),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_DAC_ENABLE2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_3, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP3_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP4_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP5_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_GM_CAL, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_OFFSET_ADAPTOR_CNTRL3, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_EOM_CTRL1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_EOM_CTRL2, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP3_MANVAL_KTAP, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP4_MANVAL_KTAP, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP5_MANVAL_KTAP, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_VTHRESH_CAL_MAN_VAL_RATE3, 0x78),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_Q_PI_INTRINSIC_BIAS_RATE32, 0x27),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_BKUP_CTRL1, 0x14),
+};
+
 static const struct qmp_phy_init_tbl x1e80100_usb43dp_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_CNTRL, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
@@ -1911,6 +2052,23 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_BKUP_CTRL1, 0x14),
 };
 
+static const struct qmp_phy_init_tbl x1e80100_usb4_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_POWER_STATE_CONFIG3, 0x4f),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_LOCK_DETECT_CONFIG1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_LOCK_DETECT_CONFIG2, 0xc0),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_RX_SIGDET_LVL, 0x55),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_PCS_PCS_TX_RX_CONFIG1, 0x51),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_EQ_CONFIG1, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_EQ_CONFIG5, 0x1e),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG1, 0x83),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG3, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG5, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG3, 0x25),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG5, 0x22),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_LPFS_TX_ECSTART, 0x0f),
+};
+
 static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
 	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
@@ -2429,6 +2587,23 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.dp_dp_phy	= 0x2200,
 };
 
+static const struct qmp_combo_offsets qmp_combo_offsets_v6_n4 = {
+	.com		= 0x0000,
+	.usb3_pcs_aon	= 0x0100,
+	.txa		= 0x0400,
+	.rxa		= 0x0600,
+	.txb		= 0x0a00,
+	.rxb		= 0x0c00,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1200,
+	.usb3_pcs	= 0x1400,
+	.usb3_pcs_usb	= 0x1700,
+	.dp_serdes	= 0x2000,
+	.dp_dp_phy	= 0x2200,
+	.usb4_serdes	= 0x3000,
+	.usb4_pcs	= 0x3400,
+};
+
 static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
 	.com		= 0x0000,
 	.txa		= 0x1400,
@@ -2689,11 +2864,11 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.regs			= qmp_v5_5nm_usb3phy_regs_layout,
 };
 
-static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v5,
+static const struct qmp_phy_cfg x1e80100_usb43dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v6_n4,
 
-	.serdes_tbl		= x1e80100_usb43dp_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb43dp_serdes_tbl),
+	.serdes_tbl		= x1e80100_usb3dp_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb3dp_serdes_tbl),
 	.tx_tbl			= x1e80100_usb43dp_tx_tbl,
 	.tx_tbl_num		= ARRAY_SIZE(x1e80100_usb43dp_tx_tbl),
 	.rx_tbl			= x1e80100_usb43dp_rx_tbl,
@@ -2728,6 +2903,19 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
+	.usb4_serdes_tbl	= x1e80100_usb4_serdes_tbl,
+	.usb4_serdes_tbl_num	= ARRAY_SIZE(x1e80100_usb4_serdes_tbl),
+	.usb4_serdes_tb3_ovrd_tbl = x1e80100_usb4_tb3_serdes_tbl,
+	.usb4_serdes_tb3_ovrd_num = ARRAY_SIZE(x1e80100_usb4_tb3_serdes_tbl),
+
+	.usb4_tx_tbl		= x1e80100_usb4_tx_tbl,
+	.usb4_tx_tbl_num	= ARRAY_SIZE(x1e80100_usb4_tx_tbl),
+	.usb4_rx_tbl		= x1e80100_usb4_rx_tbl,
+	.usb4_rx_tbl_num	= ARRAY_SIZE(x1e80100_usb4_rx_tbl),
+
+	.usb4_pcs_tbl		= x1e80100_usb4_pcs_tbl,
+	.usb4_pcs_tbl_num	= ARRAY_SIZE(x1e80100_usb4_pcs_tbl),
+
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -5298,7 +5486,7 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 	},
 	{
 		.compatible = "qcom,x1e80100-qmp-usb3-dp-phy",
-		.data = &x1e80100_usb3dpphy_cfg,
+		.data = &x1e80100_usb43dpphy_cfg,
 	},
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
index 52db31a7cf22..f19f461297b6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
@@ -8,5 +8,7 @@
 
 /* Only for QMP V6 PHY - PCS_AON registers */
 #define QPHY_V6_PCS_AON_CLAMP_ENABLE			0x00
+/* Valid only for USB43DP variants */
+#define QPHY_V6_PCS_AON_USB4_CLAMP_ENABLE		0x04
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index df670143feb1..30fdb437146c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -14,4 +14,19 @@
 #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
 #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
 
+#define QPHY_V6_PCS_USB4_POWER_STATE_CONFIG3		0x98
+#define QPHY_V6_PCS_USB4_LOCK_DETECT_CONFIG1		0xd0
+#define QPHY_V6_PCS_USB4_LOCK_DETECT_CONFIG2		0xd4
+#define QPHY_V6_PCS_USB4_RX_SIGDET_LVL			0x17c
+#define QPHY_V6_PCS_USB4_PCS_PCS_TX_RX_CONFIG1		0x1a8
+#define QPHY_V6_PCS_USB4_EQ_CONFIG1			0x1b8
+#define QPHY_V6_PCS_USB4_G3_EQ_CONFIG1			0x1d8
+#define QPHY_V6_PCS_USB4_G3_EQ_CONFIG5			0x1e8
+#define QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG1		0x1f4
+#define QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG3		0x1fc
+#define QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG5		0x204
+#define QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG3		0x210
+#define QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG5		0x218
+#define QPHY_V6_PCS_USB4_LPFS_TX_ECSTART		0x220
+
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
index d37cc0d4fd36..e72ae2cb460a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
@@ -23,27 +23,63 @@
 #define QSERDES_V6_N4_TX_TRAN_DRVR_EMP_EN		0xac
 #define QSERDES_V6_N4_TX_TX_BAND			0xd8
 #define QSERDES_V6_N4_TX_INTERFACE_SELECT		0xe4
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH1_RATE210	0xe8
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH1_RATE3	0xec
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH2_RATE210	0xf0
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH2_RATE3	0xf4
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE210	0xf8
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE3	0xfc
 #define QSERDES_V6_N4_TX_VMODE_CTRL1			0xb0
+#define QSERDES_V6_TX_LDO_TIMER_CTRL			0x120
 
 #define QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE2		0x8
+#define QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE3		0xc
+#define QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE3		0x1c
 #define QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE2		0x18
 #define QSERDES_V6_N4_RX_UCDR_PI_CONTROLS		0x20
+#define QSERDES_V6_N4_RX_EOM_CTRL1			0x44
+#define QSERDES_V6_N4_RX_EOM_CTRL2			0x48
 #define QSERDES_V6_N4_RX_IVCM_CAL_CODE_OVERRIDE		0x94
 #define QSERDES_V6_N4_RX_RX_IVCM_CAL_CTRL2		0x9c
 #define QSERDES_V6_N4_RX_RX_IVCM_POSTCAL_OFFSET		0xa0
+#define QSERDES_V6_N4_RX_DFE_1				0xac
+#define QSERDES_V6_N4_RX_DFE_2				0xb0
 #define QSERDES_V6_N4_RX_DFE_3				0xb4
+#define QSERDES_V6_N4_RX_DFE_TAP3_CTRL			0xbc
+#define QSERDES_V6_N4_RX_DFE_TAP3_MANVAL_KTAP		0xc0
+#define QSERDES_V6_N4_RX_DFE_TAP4_CTRL			0xc4
+#define QSERDES_V6_N4_RX_DFE_TAP4_MANVAL_KTAP		0xc8
+#define QSERDES_V6_N4_RX_DFE_TAP5_CTRL			0xcc
+#define QSERDES_V6_N4_RX_DFE_TAP5_MANVAL_KTAP		0xd0
 #define QSERDES_V6_N4_RX_VGA_CAL_CNTRL1			0xe0
 #define QSERDES_V6_N4_RX_VGA_CAL_MAN_VAL		0xe8
+#define QSERDES_V6_N4_RX_VTHRESH_CAL_MAN_VAL_RATE3	0x108
 #define QSERDES_V6_N4_RX_GM_CAL				0x10c
+#define QSERDES_V6_N4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x13c
+#define QSERDES_V6_N4_RX_RX_OFFSET_ADAPTOR_CNTRL3	0x144
 #define QSERDES_V6_N4_RX_SIGDET_ENABLES			0x148
 #define QSERDES_V6_N4_RX_SIGDET_CNTRL			0x14c
 #define QSERDES_V6_N4_RX_SIGDET_DEGLITCH_CNTRL		0x154
 #define QSERDES_V6_N4_RX_DFE_CTLE_POST_CAL_OFFSET	0x194
+#define QSERDES_V6_N4_RX_DCC_CMUX_POSTCAL_OFFSET	0x1a8
 #define QSERDES_V6_N4_RX_Q_PI_INTRINSIC_BIAS_RATE32	0x1dc
+#define QSERDES_V6_N4_RX_UCDR_FASTLOCK_FO_GAIN_RATE3	0x200
+#define QSERDES_V6_N4_RX_UCDR_FASTLOCK_SO_GAIN_RATE3	0x210
+#define QSERDES_V6_N4_RX_UCDR_SO_SATURATION		0x214
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE1	0x224
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE1	0x228
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2	0x22c
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2	0x230
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE3	0x234
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE3	0x238
 #define QSERDES_V6_N4_RX_UCDR_PI_CTRL1			0x23c
 #define QSERDES_V6_N4_RX_UCDR_PI_CTRL2			0x240
+#define QSERDES_V6_N4_RX_UCDR_SB2_THRESH1_RATE3		0x250
+#define QSERDES_V6_N4_RX_UCDR_SB2_GAIN1_RATE3		0x270
 #define QSERDES_V6_N4_RX_UCDR_SB2_GAIN2_RATE2		0x27c
+#define QSERDES_V6_N4_RX_UCDR_SB2_GAIN2_RATE3		0x280
 #define QSERDES_V6_N4_RX_DFE_DAC_ENABLE1		0x298
+#define QSERDES_V6_N4_RX_DFE_DAC_ENABLE2		0x29c
 #define QSERDES_V6_N4_RX_MODE_RATE_0_1_B0		0x2b8
 #define QSERDES_V6_N4_RX_MODE_RATE_0_1_B1		0x2bc
 #define QSERDES_V6_N4_RX_MODE_RATE_0_1_B2		0x2c0
@@ -58,6 +94,15 @@
 #define QSERDES_V6_N4_RX_MODE_RATE2_B4			0x2e4
 #define QSERDES_V6_N4_RX_MODE_RATE2_B5			0x2e8
 #define QSERDES_V6_N4_RX_MODE_RATE2_B6			0x2ec
+
+#define QSERDES_V6_N4_RX_MODE_RATE3_B0			0x2f0
+#define QSERDES_V6_N4_RX_MODE_RATE3_B1			0x2f4
+#define QSERDES_V6_N4_RX_MODE_RATE3_B2			0x2f8
+#define QSERDES_V6_N4_RX_MODE_RATE3_B3			0x2fc
+#define QSERDES_V6_N4_RX_MODE_RATE3_B4			0x300
+#define QSERDES_V6_N4_RX_MODE_RATE3_B5			0x304
+#define QSERDES_V6_N4_RX_MODE_RATE3_B6			0x308
+
 #define QSERDES_V6_N4_RX_RX_SUMMER_CAL_SPD_MODE		0x30c
 #define QSERDES_V6_N4_RX_RX_BKUP_CTRL1			0x310
 

-- 
2.55.0

