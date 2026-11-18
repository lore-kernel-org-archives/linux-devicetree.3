Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981369;
	b=kXnIIYz7BujFDLft+TO+aK7IINyCo3tmWQsxzgfIVQ14G0dEY9tbff7bUOtQ7HbdRzxU
	 hlhjNw2WBW7Cke6NE78Ug1Xo4rWKrhBK32xlqRJf/VEdyjz8r0HxQN6lxPYzbJcemBroj
	 645H7TGG6w8p/Dv3sB1wdQLhKSMfm5rRTGuvOOTzD/F3DQFMQxjEoyIwJTvwRV5VbL1Sk
	 ZuY8uOZPXKQTml/WI3signe6Jc2pVCuHqwUBhWt47oG40tY0oFlpxWTzJlWanz+HHp4ch
	 Atto5uNn9fTi73hfUHATTrkPg7SxplDoeT0BcIBEJceHbH+2uU50J8D8/CcDHjNfIdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EIhmNBsounwkOzh9MPAQjE3uM4JPz9g9ngNewODK+ks=;
	b=aPccGCnqPpQ/xOtVs4qd9V9uyN+j+GC+kbnWxNW9a3Ftvxz9cTJdgdsiR16JCVcrMUdC
	 +kDtNLNBQ8XAolmyajk8nZqLOcVfSxALuFPMbSTvqZL5P1PdN2bdwslRFSutt7tq9dVSM
	 LR4T309jei64rmpU/fB+vry+dgehz9zXcnK/67RRK4oFTzHZfluki+sP23bXmk2hkEVLt
	 fpSI2iU2OTIv4a5CbclTMiSItOGz/XrQq2YGeQ/lfXshZTwWMML2TJcCGBT45AdPfWppK
	 /ZJffyiNimUSu1ixFmGBWrOb02fPivRtImq8VH2IXbF4OjmYMnJqJzfe4EWp34rMUmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DwD/rhao";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBBC606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBBC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwD/rhao
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b1bb072438so44294a91.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981369; x=1795586169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIhmNBsounwkOzh9MPAQjE3uM4JPz9g9ngNewODK+ks=;
        b=DwD/rhaoWK3MMm9NNklgWDSy6zR2n8EQghUykMf9UHTH3rwemQcaYwNCnCJRGoXW82
         ywUovB3Lb2n/vOFoPImLxy1LpCSuU7v6lYtIykDCEaw74pKrOAkSfJFUUsGNR339wgwJ
         ZPG1kg7/MwCaAnrrrLEKOsUSjwSgSHwoR55eO4U3PAfwjvwcJdGBj2Z88B9GwVw5xaMn
         1ru7kxSblGWkZqyD7wL7dd3qjYwIDoSmaBDgn3zifzgJflQgcHVDTaxnLILGNbJz3VSo
         kmqrjVcICfF2a8n/wlyYQPNKppYWNJ0psWCR36Xdsb6yReApMhhnJoNaKXm9Qql4SgQr
         Zj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981369; x=1795586169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIhmNBsounwkOzh9MPAQjE3uM4JPz9g9ngNewODK+ks=;
        b=sUx/ezJ4bhPxTHmyF9zXlByPkTFAetiwfRc5+d4czde6WcZFaiQKnsb/Xi6cbOtO3c
         B5NDwSi62/GrwhzL64/1LbQJkLrody4Tz3pRkmTdr4W8oDjfKXbBcE3shwozXPnfdrYt
         cINdcuiWR/KfdJVYgGaE6IcCCIu/ysvOOE5xYCoTs25gxAq1Dlj1KRMLgp27taYHQl0N
         Fpc+3pG2T9Sq8iyc2MIrnoA2dFtyTaLmHq9werKvDcJPXCI5bWJQWnB/1e60CPDfL2xW
         GIHf9G4LviDw6nlLF2LG79qByi6bwTCUOZp5yUNxmRL92jl3OekQyWRudcKPavuIusl+
         +nFg==
X-Forwarded-Encrypted: i=1; AL+hErHafDd4JMLjeUDgaozfvb+rX6DS3NmUShw31CcspUK28inEnFhBQzAtkxeVqSf0RJ5oBzOYugHG+PSn@vger.kernel.org
X-Gm-Message-State: APuU4Z8qCFRAQNLD7Y2zSDQZ6d/Plo6f25uscgNW6uCYww0IaruoatrC
	2qk2vS2R7+kjvtTGXSMkHgR5fQ9U838rdNk6TOR6JHLwMp2Gibga7K+V
X-Gm-Gg: AZFdTZdPXlmABtSDzDnpdul/6JLwuzVkrd9CvoTzA4ORJr901EVUARkaN0UZv77xSRR
	W6Elmk0ol8UnWheOqosptwqHaPkv/45MbXkBy4LcVqf21VZNkkYAvDrYwUXyj89z8t43/iIClYg
	5IvrHRL1z3FKrlrGiIhOoHdeo7VfAUc3Tc/ujYOswXRk9V3WUL93nBQoQWcH8kiNoFXzQGHQ5VM
	V34LLcwZLXWQYfjv9XMj1E+OD89TTXzZLkvQ35tw9MjoOoZLgDcRVolzdE+UfCOiQl0Cc+N3KSg
	xzdIrZwBdReT+DKQQi1CYK0aina/v3I9v6X8NRJep+UNFoWJi09YnZ8++/GIVrMskOd86e1INi7
	nhsZat4LbLzah9F0pzxBFiW7A0ageKzPbJGtjbMc1ZW1VkbozKgIS96fKbqP+bFdjTBNrwl3h8Y
	gfwjdqDINZVnyP6sN5+EqwXsXPgPuHVH22y0BLFeSjKXizYLRV8510m5f1vwQNGU5EhofRazoWo
	266eFx9ZMp2Dn5HzSn82ozhIZRTtAJwb2m71nk8dhR0nQP5VBzliClJdUr2WJ4IfynV04lXuuic
	yKZS+gblEJf36+e/vwt6o/SZZuL3f24hptDOX/BWVlX0kc1i6QFMxCuB5GxNLl0Uq1aOQN9N4FH
	tjTdpg5LJh5a0hIzP3d5Z
X-Received: by 2002:a17:90b:4f8e:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b3d07d8922mr2870392a91.6.1794981367928;
        Tue, 17 Nov 2026 21:56:07 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:56:07 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:19 +0800
Subject: [PATCH v7 6/9] phy: rockchip-samsung-dcphy: Name the transmitter
 helpers and ops
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-dcphy-rx-v1-v7-6-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=16084;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=Zo8+/a6CFxDqnd22X5LZIaPTYR00Q/pHx4xsGGgESLA=;
 b=ac+VRfTPJIV92mOlYharm4EXd9ip8+1o2XDwfeg17xaHu481peBAUgoohXsYxf83tx20IJhZM
 TrwPM3wIWMCD1FKof+gO+Zb+Cc0WHs6x2B1haRnIqPUOgFpiOX5vqfr
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The block is a combo PHY: it exposes a transmitter and a receiver, and a
later change registers one struct phy for each. Prepare for that. Give
every helper that programs the master lanes a tx_ prefix, and move the
phy pointer, the lane count, the master reset and the PLL state, which
only the transmitter uses, into a struct samsung_mipi_phy that the
receiver can have one of too.

Name the phy_ops and its callbacks after the transmitter as well, so
that the receiver can bring its own rather than share these.

No functional change intended.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 193 ++++++++++++----------
 1 file changed, 103 insertions(+), 90 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index d6acc3e2d448..7a62db810d4b 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -280,21 +280,11 @@ struct samsung_mipi_dcphy_plat_data {
 	u32 dphy_tx_max_lane_kbps;
 };
 
-struct samsung_mipi_dcphy {
-	struct device *dev;
-	struct clk *ref_clk;
-	struct clk *pclk;
-	struct regmap *regmap;
-	struct regmap *grf_regmap;
-	struct reset_control *m_phy_rst;
-	struct reset_control *s_phy_rst;
-	struct reset_control *apb_rst;
-	struct reset_control *grf_apb_rst;
-	unsigned int lanes;
+struct samsung_mipi_phy {
 	struct phy *phy;
-	u8 type;
-
-	const struct samsung_mipi_dcphy_plat_data *pdata;
+	unsigned int lanes;
+	struct reset_control *phy_rst;
+	/* TX only */
 	struct {
 		unsigned long long rate;
 		u8 prediv;
@@ -308,6 +298,21 @@ struct samsung_mipi_dcphy {
 	} pll;
 };
 
+struct samsung_mipi_dcphy {
+	struct device *dev;
+	struct clk *ref_clk;
+	struct clk *pclk;
+	struct regmap *regmap;
+	struct regmap *grf_regmap;
+	struct reset_control *s_phy_rst;
+	struct reset_control *apb_rst;
+	struct reset_control *grf_apb_rst;
+	struct samsung_mipi_phy tx;
+	u8 type;
+
+	const struct samsung_mipi_dcphy_plat_data *pdata;
+};
+
 struct samsung_mipi_dphy_timing {
 	unsigned int max_lane_mbps;
 	u8 clk_prepare;
@@ -989,13 +994,13 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
 			   I_MUX_SEL_MASK, I_MUX_400MV);
 }
 
-static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
+static void samsung_mipi_dphy_tx_lane_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON1, T_PHY_READY(0x2000));
 	regmap_update_bits(samsung->regmap, DPHY_MC_GNR_CON0,
 			   PHY_ENABLE, PHY_ENABLE);
 
-	switch (samsung->lanes) {
+	switch (samsung->tx.lanes) {
 	case 4:
 		regmap_write(samsung->regmap, DPHY_MD3_GNR_CON1,
 			     T_PHY_READY(0x2000));
@@ -1024,9 +1029,10 @@ static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
 	}
 }
 
-static void samsung_mipi_dphy_lane_disable(struct samsung_mipi_dcphy *samsung)
+static void
+samsung_mipi_dphy_tx_lane_disable(struct samsung_mipi_dcphy *samsung)
 {
-	switch (samsung->lanes) {
+	switch (samsung->tx.lanes) {
 	case 4:
 		regmap_update_bits(samsung->regmap, DPHY_MD3_GNR_CON0,
 				   PHY_ENABLE, 0);
@@ -1049,29 +1055,32 @@ static void samsung_mipi_dphy_lane_disable(struct samsung_mipi_dcphy *samsung)
 	regmap_update_bits(samsung->regmap, DPHY_MC_GNR_CON0, PHY_ENABLE, 0);
 }
 
-static void samsung_mipi_dcphy_pll_configure(struct samsung_mipi_dcphy *samsung)
+static void
+samsung_mipi_dcphy_tx_pll_configure(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_update_bits(samsung->regmap, PLL_CON0, S_MASK | P_MASK,
-			   S(samsung->pll.scaler) | P(samsung->pll.prediv));
+			   S(samsung->tx.pll.scaler) |
+			   P(samsung->tx.pll.prediv));
 
-	if (samsung->pll.dsm < 0) {
+	if (samsung->tx.pll.dsm < 0) {
 		u16 dsm_tmp;
 
 		/* Using opposite number subtraction to find complement */
-		dsm_tmp = abs(samsung->pll.dsm);
+		dsm_tmp = abs(samsung->tx.pll.dsm);
 		dsm_tmp = dsm_tmp - 1;
 		dsm_tmp ^= 0xffff;
 		regmap_write(samsung->regmap, PLL_CON1, dsm_tmp);
 	} else {
-		regmap_write(samsung->regmap, PLL_CON1, samsung->pll.dsm);
+		regmap_write(samsung->regmap, PLL_CON1, samsung->tx.pll.dsm);
 	}
 
 	regmap_update_bits(samsung->regmap, PLL_CON2,
-			   M_MASK, M(samsung->pll.fbdiv));
+			   M_MASK, M(samsung->tx.pll.fbdiv));
 
-	if (samsung->pll.ssc_en) {
+	if (samsung->tx.pll.ssc_en) {
 		regmap_write(samsung->regmap, PLL_CON3,
-			     MRR(samsung->pll.mrr) | MFR(samsung->pll.mfr));
+			     MRR(samsung->tx.pll.mrr) |
+			     MFR(samsung->tx.pll.mfr));
 		regmap_update_bits(samsung->regmap, PLL_CON4, SSCG_EN, SSCG_EN);
 	}
 
@@ -1080,7 +1089,7 @@ static void samsung_mipi_dcphy_pll_configure(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, PLL_CON8, PLL_STB_CNT(0xf000));
 }
 
-static int samsung_mipi_dcphy_pll_enable(struct samsung_mipi_dcphy *samsung)
+static int samsung_mipi_dcphy_tx_pll_enable(struct samsung_mipi_dcphy *samsung)
 {
 	u32 sts;
 	int ret;
@@ -1095,17 +1104,18 @@ static int samsung_mipi_dcphy_pll_enable(struct samsung_mipi_dcphy *samsung)
 	return ret;
 }
 
-static void samsung_mipi_dcphy_pll_disable(struct samsung_mipi_dcphy *samsung)
+static void
+samsung_mipi_dcphy_tx_pll_disable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_update_bits(samsung->regmap, PLL_CON0, PLL_EN, 0);
 }
 
 static const struct samsung_mipi_dphy_timing *
-samsung_mipi_dphy_get_timing(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_get_timing(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timings;
 	unsigned int num_timings;
-	unsigned int lane_mbps = div64_ul(samsung->pll.rate, USEC_PER_SEC);
+	unsigned int lane_mbps = div64_ul(samsung->tx.pll.rate, USEC_PER_SEC);
 	unsigned int i;
 
 	timings = samsung_mipi_dphy_timing_table;
@@ -1119,9 +1129,9 @@ samsung_mipi_dphy_get_timing(struct samsung_mipi_dcphy *samsung)
 }
 
 static unsigned long
-samsung_mipi_dcphy_pll_round_rate(struct samsung_mipi_dcphy *samsung,
-				  unsigned long prate, unsigned long rate,
-				  u8 *prediv, u16 *fbdiv, int *dsm, u8 *scaler)
+samsung_mipi_dcphy_tx_pll_round_rate(struct samsung_mipi_dcphy *samsung,
+				     unsigned long prate, unsigned long rate,
+				     u8 *prediv, u16 *fbdiv, int *dsm, u8 *scaler)
 {
 	u32 max_fout = samsung->pdata->dphy_tx_max_lane_kbps;
 	u64 best_freq = 0;
@@ -1208,13 +1218,14 @@ samsung_mipi_dcphy_pll_round_rate(struct samsung_mipi_dcphy *samsung,
 }
 
 static void
-samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timing;
-	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
+	unsigned int lane_hs_rate = div64_ul(samsung->tx.pll.rate,
+					     USEC_PER_SEC);
 	u32 val, res_up, res_down;
 
-	timing = samsung_mipi_dphy_get_timing(samsung);
+	timing = samsung_mipi_dphy_tx_get_timing(samsung);
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON0, 0xf000);
 
 	/*
@@ -1269,13 +1280,14 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 }
 
 static void
-samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
+samsung_mipi_dphy_tx_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 {
 	const struct samsung_mipi_dphy_timing *timing;
-	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
+	unsigned int lane_hs_rate = div64_ul(samsung->tx.pll.rate,
+					     USEC_PER_SEC);
 	u32 val, res_up, res_down;
 
-	timing = samsung_mipi_dphy_get_timing(samsung);
+	timing = samsung_mipi_dphy_tx_get_timing(samsung);
 
 	/*
 	 * The Drive-Strength / Voltage-Amplitude is adjusted by adjusting the
@@ -1340,25 +1352,25 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MD3_TIME_CON4, 0x1f4);
 }
 
-static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
+static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
 {
 	int ret;
 
-	reset_control_assert(samsung->m_phy_rst);
+	reset_control_assert(samsung->tx.phy_rst);
 
-	samsung_mipi_dcphy_pll_configure(samsung);
-	samsung_mipi_dphy_clk_lane_timing_init(samsung);
-	samsung_mipi_dphy_data_lane_timing_init(samsung);
-	ret = samsung_mipi_dcphy_pll_enable(samsung);
+	samsung_mipi_dcphy_tx_pll_configure(samsung);
+	samsung_mipi_dphy_tx_clk_lane_timing_init(samsung);
+	samsung_mipi_dphy_tx_data_lane_timing_init(samsung);
+	ret = samsung_mipi_dcphy_tx_pll_enable(samsung);
 	if (ret < 0) {
-		samsung_mipi_dcphy_pll_disable(samsung);
-		reset_control_deassert(samsung->m_phy_rst);
+		samsung_mipi_dcphy_tx_pll_disable(samsung);
+		reset_control_deassert(samsung->tx.phy_rst);
 		return ret;
 	}
 
-	samsung_mipi_dphy_lane_enable(samsung);
+	samsung_mipi_dphy_tx_lane_enable(samsung);
 
-	reset_control_deassert(samsung->m_phy_rst);
+	reset_control_deassert(samsung->tx.phy_rst);
 
 	/* The TSKEWCAL maximum is 100 µsec
 	 * at initial calibration.
@@ -1368,13 +1380,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	return 0;
 }
 
-static int samsung_mipi_dcphy_power_on(struct phy *phy)
+static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_power_on(samsung);
+		return samsung_mipi_dphy_tx_power_on(samsung);
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
@@ -1383,31 +1395,31 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 	return 0;
 }
 
-static int samsung_mipi_dcphy_power_off(struct phy *phy)
+static int samsung_mipi_dcphy_tx_power_off(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_lane_disable(samsung);
+		samsung_mipi_dphy_tx_lane_disable(samsung);
 		break;
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
 	}
 
-	samsung_mipi_dcphy_pll_disable(samsung);
+	samsung_mipi_dcphy_tx_pll_disable(samsung);
 
 	return 0;
 }
 
 static int
-samsung_mipi_dcphy_pll_ssc_modulation_calc(struct samsung_mipi_dcphy *samsung,
-					   u8 *mfr, u8 *mrr)
+samsung_mipi_dcphy_tx_pll_ssc_modulation_calc(struct samsung_mipi_dcphy *samsung,
+					      u8 *mfr, u8 *mrr)
 {
 	unsigned long fin = div64_ul(clk_get_rate(samsung->ref_clk), MSEC_PER_SEC);
-	u16 prediv = samsung->pll.prediv;
-	u16 fbdiv = samsung->pll.fbdiv;
+	u16 prediv = samsung->tx.pll.prediv;
+	u16 fbdiv = samsung->tx.pll.fbdiv;
 	u16 min_mfr, max_mfr;
 	u16 _mfr, best_mfr = 0;
 	u16 mr, _mrr, best_mrr = 0;
@@ -1447,8 +1459,8 @@ samsung_mipi_dcphy_pll_ssc_modulation_calc(struct samsung_mipi_dcphy *samsung,
 }
 
 static void
-samsung_mipi_dcphy_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
-				 unsigned long long rate)
+samsung_mipi_dcphy_tx_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
+				    unsigned long long rate)
 {
 	unsigned long prate = clk_get_rate(samsung->ref_clk);
 	unsigned long fout;
@@ -1458,46 +1470,46 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
 	int dsm = 0;
 	int ret;
 
-	fout = samsung_mipi_dcphy_pll_round_rate(samsung, prate, rate,
-						 &prediv, &fbdiv, &dsm,
-						 &scaler);
+	fout = samsung_mipi_dcphy_tx_pll_round_rate(samsung, prate, rate,
+						    &prediv, &fbdiv, &dsm,
+						    &scaler);
 
 	dev_dbg(samsung->dev, "%s: fin=%lu, req_rate=%llu\n",
 		__func__, prate, rate);
 	dev_dbg(samsung->dev, "%s: fout=%lu, prediv=%u, fbdiv=%u\n",
 		__func__, fout, prediv, fbdiv);
 
-	samsung->pll.prediv = prediv;
-	samsung->pll.fbdiv = fbdiv;
-	samsung->pll.dsm = dsm;
-	samsung->pll.scaler = scaler;
-	samsung->pll.rate = fout;
+	samsung->tx.pll.prediv = prediv;
+	samsung->tx.pll.fbdiv = fbdiv;
+	samsung->tx.pll.dsm = dsm;
+	samsung->tx.pll.scaler = scaler;
+	samsung->tx.pll.rate = fout;
 
 	/*
 	 * All DPHY 2.0 compliant Transmitters shall support SSC operating above
 	 * 2.5 Gbps
 	 */
 	if (fout > 2500000000LL) {
-		ret = samsung_mipi_dcphy_pll_ssc_modulation_calc(samsung,
-								 &mfr, &mrr);
+		ret = samsung_mipi_dcphy_tx_pll_ssc_modulation_calc(samsung,
+								    &mfr, &mrr);
 		if (!ret) {
-			samsung->pll.ssc_en = true;
-			samsung->pll.mfr = mfr;
-			samsung->pll.mrr = mrr;
+			samsung->tx.pll.ssc_en = true;
+			samsung->tx.pll.mfr = mfr;
+			samsung->tx.pll.mrr = mrr;
 		}
 	}
 }
 
-static int samsung_mipi_dcphy_configure(struct phy *phy,
-					union phy_configure_opts *opts)
+static int samsung_mipi_dcphy_tx_configure(struct phy *phy,
+					   union phy_configure_opts *opts)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 	unsigned long long target_rate = opts->mipi_dphy.hs_clk_rate;
 
-	samsung->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
+	samsung->tx.lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
 
-	samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
-	opts->mipi_dphy.hs_clk_rate = samsung->pll.rate;
+	samsung_mipi_dcphy_tx_pll_calc_rate(samsung, target_rate);
+	opts->mipi_dphy.hs_clk_rate = samsung->tx.pll.rate;
 
 	return 0;
 }
@@ -1518,10 +1530,10 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 	return 0;
 }
 
-static const struct phy_ops samsung_mipi_dcphy_ops = {
-	.configure = samsung_mipi_dcphy_configure,
-	.power_on  = samsung_mipi_dcphy_power_on,
-	.power_off = samsung_mipi_dcphy_power_off,
+static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
+	.configure = samsung_mipi_dcphy_tx_configure,
+	.power_on  = samsung_mipi_dcphy_tx_power_on,
+	.power_off = samsung_mipi_dcphy_tx_power_off,
 	.init = samsung_mipi_dcphy_init,
 	.exit = samsung_mipi_dcphy_exit,
 	.owner	   = THIS_MODULE,
@@ -1551,7 +1563,7 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 
 	samsung->type = args->args[0];
 
-	return samsung->phy;
+	return samsung->tx.phy;
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1596,9 +1608,9 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	if (IS_ERR(samsung->pclk))
 		return dev_err_probe(dev, PTR_ERR(samsung->pclk), "Failed to get pclk\n");
 
-	samsung->m_phy_rst = devm_reset_control_get(dev, "m_phy");
-	if (IS_ERR(samsung->m_phy_rst))
-		return dev_err_probe(dev, PTR_ERR(samsung->m_phy_rst),
+	samsung->tx.phy_rst = devm_reset_control_get(dev, "m_phy");
+	if (IS_ERR(samsung->tx.phy_rst))
+		return dev_err_probe(dev, PTR_ERR(samsung->tx.phy_rst),
 				     "Failed to get system m_phy_rst control\n");
 
 	samsung->s_phy_rst = devm_reset_control_get(dev, "s_phy");
@@ -1620,11 +1632,12 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
-	samsung->phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_ops);
-	if (IS_ERR(samsung->phy))
-		return dev_err_probe(dev, PTR_ERR(samsung->phy), "Failed to create MIPI DC-PHY\n");
+	samsung->tx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_tx_ops);
+	if (IS_ERR(samsung->tx.phy))
+		return dev_err_probe(dev, PTR_ERR(samsung->tx.phy),
+				     "Failed to create MIPI DC-PHY transmitter\n");
 
-	phy_set_drvdata(samsung->phy, samsung);
+	phy_set_drvdata(samsung->tx.phy, samsung);
 
 	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
 	if (IS_ERR(phy_provider))

-- 
2.43.0

