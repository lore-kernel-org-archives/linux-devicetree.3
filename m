Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298732;
	b=hMDXTQZo768KxnHy7xDVqEs0nhsVYRRYxyyCDibxIGebEcXmbESeUTtGjBOrQ47MsxPP
	 TBkZ9BQslNEu2QAHoKj1LGxKaGTkKx7V/KvcwTO9MiKz1sFldCtbi3XXAI2IY53HPJQ+Z
	 J+MfpH4WCr8le0KIrgzmGb4IN9SEGS2QkUKbrCTVcT8x7BblBQisCdyzT7A5pqch4e2Fp
	 g7A9LW+FvAmEQF7YyFFZcWRJsHhIpCTc4FODoI8pPRq5sw2nio22HzlbasMOm+6qZbbx1
	 HpaKcIVGBC6zG01W1GZoJw0nuaDuNr9xb6rnW6h0BV0Sc4t3BqBYWcwRLM7HaDKrsQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KksRLA2XZ7rZHalLnCTvlThdsh3WTjIi3HD3KsIhyCY=;
	b=4zu++izfXkCcWfI/qG4cCMJmFAbHW9AM5ZEP3zfQYvwt4ior8SHmNfb/8iqA3ZlD/qC2
	 wCV4zgPpus1Ipv8+JeGWGBe7oDwKlRl8rUheUWK8yes926DLw2bQUSrfSwGIya9pcCBvH
	 k16LmJwrsU0LE6XK7t8Ru76WZ76ETShsUqxsUjpkx5h4/z7AEA2TRGEe4tBtS/zE/GHup
	 VS7vVfGVtb2vY2AuQTpStRL8oAq9FLGtL4i0nY2nA4Z6C180lc+1+9Jq/M5lKOeLz8IiI
	 B2nW/l0Kn/W9zSjODruc5M2WM9X5gTGk9LnIWSPSX/IwWHTPVCEvmf93jz2IlfHePHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2gp6uvC;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5F60A3833
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E5F60A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2gp6uvC
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so222296eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298731; x=1794903531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KksRLA2XZ7rZHalLnCTvlThdsh3WTjIi3HD3KsIhyCY=;
        b=m2gp6uvCSXejhHsjvl32DltbXBd96Sa/6KBW1MDLuJG3TSyzK4ErOUXtrY2ufg0Hso
         7R7snVH3x4S+Tcgnh0JkQbhnad0ZznVzi2hygAPFI9wmH9OCWdMpc9odkktN4M8yg1TN
         FznbNrUJt2ksbXNPWCaQDXOsPn9NG81BrazgOtQFYCcIxHOpN7tf8hXtrX/dOWfv8jZe
         dARlRy1BrFbiuYemmfGbCNil9XwMVB08mjhhv/5kcJsVkPIeplexCfax7KJv946COyfS
         Hsxi5G8t2ZgqmnAWbEtE2LS63red+/ofO5j+wC5blTUD7pqgGL+rs6qVcRdJn8X3EnNV
         Euig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298731; x=1794903531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KksRLA2XZ7rZHalLnCTvlThdsh3WTjIi3HD3KsIhyCY=;
        b=DkF/+qyE3Jsz83N32j/dniD6EnNsRUzaSghre1HvKrj+CMVX0ddMchwoC8LRQiLsL7
         Nn74gOfGUO5yDHHzYP/OfSxO/6rVgdRcDOKRvMewgs8lzpgaUYOSKD56ZdEPh5tR4UEQ
         JofxcZR/EQrM7lkCW/WY/zYsRTIQjeYqX7FLCVoHpvIc1H1KodXoZtUNZxOdmOef40wc
         7gkw2ILvsUQL1TDujfV9Em4X/XlS0yJiRwiUahe581WSnJvaa2HYNZ33sxGD5EvCwGKR
         RqquOVsxLVOrPhr3YIZaE76FDIzS8lRhYtcgyCs2+dqxizg5N53C84zKtrVkxfBSrtmz
         RbaA==
X-Forwarded-Encrypted: i=1; AL+hErH0kEwZnnPHbzfLxAxnKp9X9uj7PrZegiUHjzU9dK7phVR9nHcw+Uksi9sCoWt0wcd4psV5zJim78qM@vger.kernel.org
X-Gm-Message-State: APuU4Z/ECcCkUnbwQPGxo0ZqaVdYoV7C1+u/mfasODldBGV1E0/9S0DN
	YIAlvtc2BpVg1dWXvfRoPD0fhcnqw91librSrWj74prn6iL4614MyN3KE3QJlhk2HPs=
X-Gm-Gg: AYBFou2Rii5XhtRDy2sq1DaGphzYki06kiL4jYz9w2YoHyKHuDWh3xNjmJ6M3loul/5
	wtrqTeEUPpiSLPy3FFDZwDLCYa2E5TLaEx/nvo72Sz8lZRzuQGJ/Va2lvVt6VdqcP7fWO40qheA
	xSPFFlHHVwYJ7YYJdEUd1RM9QP07sqtqnD3jmzB/S9Mp537tBfGAiFkU3rrBP+EmfdzuY6g9xVY
	5nAd5pGuN7/y7SUC9conQW8jza103k+8d19bp6OiKS9MexYHwjy59W/koAdVQLREyEdaZ8+/+Rw
	ichIMfCsEG6rItYPyWQgOmRxPRKzAyDmaSsfROmiS64spy/ta3YabavCIoozAxNLChrTbfh5U+A
	BzpeMpH6xHXLGglnLdnsEUXeHTXXCSoKJlQLGebYp2+0h/Pxj/Pbfug7XelRtKfXOCIwZHlj8Oo
	dpA5RT6dkyeWti2ilM67PvNfUsnCi7i3cNaB4aVMSNhk95mSatI9E9kltqF7czVgRI6lOHV0461
	e2qxPSXEIG5tx8MxdQD628/JtNs99uQBS6t6L9KTDUU4Mp8NK5oXzs0ZO8SmQQE5xgD1legUchY
	Qe+4Rsz4/+cX7duc5WuUov4dxzIQpyePdyl1589nmavSzvmg3O2V5QrTuUHM
X-Received: by 2002:a05:701b:4558:10b0:165:be2f:c56e with SMTP id a92af1059eb24-1b3b6046a9dmr4022590c88.2.1794298730340;
        Tue, 10 Nov 2026 00:18:50 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:49 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:11 +0800
Subject: [PATCH v6 8/9] phy: rockchip-samsung-dcphy: Add MIPI D-PHY
 receiver support
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dcphy-rx-v1-v6-8-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298692; l=16904;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=inhiJI5a706M17IHSg/P0ZGkaw4c0DAWT/EkjKNOF6I=;
 b=Ba/nkNaGz3aj0QnFK0xnRN22i33ynGa2eenmP0NghwXFN3voEg9Yj1uDGUzHP6nxbhCF/9fdA
 0I6LXkUGStVCe43SjE57C1QvHaeCPxB7u87k8O+M/2bDoZoPOqR1ER5
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

Add the receiver half of the block, so a MIPI CSI-2 camera can use the
same PHY that already drives a MIPI DSI output on RK3588. It follows the
receiver start-up sequence in the RK3588 TRM [1]. The HS-RX settle values
come from the RK3588 vendor kernel.

The initial deskew calibration that the D-PHY specification asks for
above 1.5 Gbps is not implemented; the vendor kernel programs it from
RK3576 onwards only. Data rates above 4.5 Gbps, the end of the settle
table, are rejected at configure time.

Tested on RK3588 with an IMX219 on the receiver and a DSI panel on the
transmitter of the same PHY.

[1] RK3588 TRM: sections 22.6.3 (start-up sequence, step 3 for
    slave-only use) and 22.6.4.3 (worked receiver example)

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 388 ++++++++++++++++++++++
 1 file changed, 388 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index e8e229fc4856..ee72bc397628 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -244,6 +244,70 @@
 #define T_TA_GET(x)		FIELD_PREP(GENMASK(7, 4), x)
 #define T_TA_GO(x)		FIELD_PREP(GENMASK(3, 0), x)
 
+#define DPHY_SC_GNR_CON0	0x0b00
+#define DPHY_SC_GNR_CON1	0x0b04
+#define DPHY_SC_ANA_CON1	0x0b0c
+#define HS_RX_LS_650UA		BIT(15)
+#define HS_RX_AMP2_500UA	FIELD_PREP(GENMASK(14, 13), 0)
+#define HS_RX_AMP1_700UA	FIELD_PREP(GENMASK(12, 11), 0)
+#define DPHY_SC_ANA_CON2	0x0b10
+#define HS_TERM_SW(x)		FIELD_PREP(GENMASK(2, 0), x)
+#define HS_TERM_96_6OHM		HS_TERM_SW(2)
+#define DPHY_SC_ANA_CON3	0x0b14
+#define ULPS_HYS_SW_DPHY(x)	FIELD_PREP(GENMASK(10, 8), x)
+#define ULPS_HYS_104MV		ULPS_HYS_SW_DPHY(6)
+#define DPHY_SC_TIME_CON0	0x0b30
+#define T_CLK_SETTLE(x)		FIELD_PREP(GENMASK(7, 0), x)
+#define T_CLK_MISS(x)		FIELD_PREP(GENMASK(11, 8), x)
+#define COMBO_SD0_GNR_CON0	0x0c00
+#define COMBO_SD0_GNR_CON1	0x0c04
+#define COMBO_SD0_ANA_CON1	0x0c0c
+#define COMBO_SD0_ANA_CON2	0x0c10
+#define SKEW_DLYSEL(x)		FIELD_PREP(GENMASK(9, 8), x)
+#define RX_TERM_SW(x)		FIELD_PREP(GENMASK(2, 0), x)
+#define RX_TERM_96_6OHM		RX_TERM_SW(2)
+#define COMBO_SD0_ANA_CON3	0x0c14
+#define SEL_ESCPOL		BIT(11)
+#define LP_HYS_SW(x)		FIELD_PREP(GENMASK(5, 4), x)
+#define LP_HYS_100MV		LP_HYS_SW(3)
+#define COMBO_SD0_ANA_CON7	0x0c24
+#define CLK_DBL_CTRL(x)		FIELD_PREP(GENMASK(7, 6), x)
+#define COMBO_SD0_TIME_CON0	0x0c30
+#define T_HS_SETTLE_MASK	GENMASK(7, 0)
+#define T_HS_SETTLE(x)		FIELD_PREP(T_HS_SETTLE_MASK, x)
+#define SETTLE_CLK_SEL		BIT(8)
+#define COMBO_SD0_TIME_CON1	0x0c34
+#define T_ERR_SOT_SYNC_MASK	GENMASK(7, 0)
+#define T_ERR_SOT_SYNC(x)	FIELD_PREP(T_ERR_SOT_SYNC_MASK, x)
+#define COMBO_SD0_DESKEW_CON2	0x0c48
+#define SKEW_CAL_CLK_COARSE_SET(x) FIELD_PREP(GENMASK(4, 0), x)
+#define COMBO_SD1_GNR_CON0	0x0d00
+#define COMBO_SD1_GNR_CON1	0x0d04
+#define COMBO_SD1_ANA_CON1	0x0d0c
+#define COMBO_SD1_ANA_CON2	0x0d10
+#define COMBO_SD1_ANA_CON3	0x0d14
+#define COMBO_SD1_ANA_CON7	0x0d24
+#define COMBO_SD1_TIME_CON0	0x0d30
+#define COMBO_SD1_TIME_CON1	0x0d34
+#define COMBO_SD1_DESKEW_CON2	0x0d48
+#define COMBO_SD2_GNR_CON0	0x0e00
+#define COMBO_SD2_GNR_CON1	0x0e04
+#define COMBO_SD2_ANA_CON1	0x0e0c
+#define COMBO_SD2_ANA_CON2	0x0e10
+#define COMBO_SD2_ANA_CON3	0x0e14
+#define COMBO_SD2_ANA_CON7	0x0e24
+#define COMBO_SD2_TIME_CON0	0x0e30
+#define COMBO_SD2_TIME_CON1	0x0e34
+#define COMBO_SD2_DESKEW_CON2	0x0e48
+#define DPHY_SD3_GNR_CON0	0x0f00
+#define DPHY_SD3_GNR_CON1	0x0f04
+#define DPHY_SD3_ANA_CON1	0x0f0c
+#define DPHY_SD3_ANA_CON2	0x0f10
+#define DPHY_SD3_ANA_CON3	0x0f14
+#define DPHY_SD3_TIME_CON0	0x0f30
+#define DPHY_SD3_TIME_CON1	0x0f34
+#define DPHY_SD3_DESKEW_CON2	0x0f48
+
 /* MIPI_CDPHY_GRF registers */
 #define MIPI_DCPHY_GRF_CON0		0x0000
 #define S_CPHY_MODE			FIELD_PREP_WM16(BIT(3), 1)
@@ -283,6 +347,8 @@ struct samsung_mipi_dcphy_plat_data {
 struct samsung_mipi_phy {
 	struct phy *phy;
 	unsigned int lanes;
+	unsigned long long hs_clk_rate;
+	u16 hsfreq_cfg;
 };
 
 struct samsung_mipi_dcphy {
@@ -296,6 +362,7 @@ struct samsung_mipi_dcphy {
 	struct reset_control *apb_rst;
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
+	struct samsung_mipi_phy rx;
 	u8 type;
 	bool legacy_mismatch;
 
@@ -978,6 +1045,228 @@ struct samsung_mipi_dphy_timing samsung_mipi_dphy_timing_table[] = {
 	{  80,  2,   0,  0, 28,  5,  0, 22,  2,  0,  5},
 };
 
+struct samsung_mipi_dphy_rx_hsfreq_range {
+	u32 range_h_mbps;
+	u16 cfg_bit;
+};
+
+/*
+ * HS-RX settle values taken from the rk3588 vendor kernel; the TRM
+ * defers the per-rate values to its Supplement Guide. SETTLE_CLK_SEL
+ * is read-only in the TRM but the vendor kernel has always written it.
+ */
+static const struct samsung_mipi_dphy_rx_hsfreq_range
+samsung_mipi_dphy_rx_hsfreq_ranges[] = {
+	{   80, 0x105 }, {  100, 0x106 }, {  120, 0x107 }, {  140, 0x108 },
+	{  160, 0x109 }, {  180, 0x10a }, {  200, 0x10b }, {  220, 0x10c },
+	{  240, 0x10d }, {  270, 0x10e }, {  290, 0x10f }, {  310, 0x110 },
+	{  330, 0x111 }, {  350, 0x112 }, {  370, 0x113 }, {  390, 0x114 },
+	{  410, 0x115 }, {  430, 0x116 }, {  450, 0x117 }, {  470, 0x118 },
+	{  490, 0x119 }, {  510, 0x11a }, {  540, 0x11b }, {  560, 0x11c },
+	{  580, 0x11d }, {  600, 0x11e }, {  620, 0x11f }, {  640, 0x120 },
+	{  660, 0x121 }, {  680, 0x122 }, {  700, 0x123 }, {  720, 0x124 },
+	{  740, 0x125 }, {  760, 0x126 }, {  790, 0x127 }, {  810, 0x128 },
+	{  830, 0x129 }, {  850, 0x12a }, {  870, 0x12b }, {  890, 0x12c },
+	{  910, 0x12d }, {  930, 0x12e }, {  950, 0x12f }, {  970, 0x130 },
+	{  990, 0x131 }, { 1010, 0x132 }, { 1030, 0x133 }, { 1060, 0x134 },
+	{ 1080, 0x135 }, { 1100, 0x136 }, { 1120, 0x137 }, { 1140, 0x138 },
+	{ 1160, 0x139 }, { 1180, 0x13a }, { 1200, 0x13b }, { 1220, 0x13c },
+	{ 1240, 0x13d }, { 1260, 0x13e }, { 1280, 0x13f }, { 1310, 0x140 },
+	{ 1330, 0x141 }, { 1350, 0x142 }, { 1370, 0x143 }, { 1390, 0x144 },
+	{ 1410, 0x145 }, { 1430, 0x146 }, { 1450, 0x147 }, { 1470, 0x148 },
+	{ 1490, 0x149 }, { 1580, 0x007 }, { 1740, 0x008 }, { 1910, 0x009 },
+	{ 2070, 0x00a }, { 2240, 0x00b }, { 2410, 0x00c }, { 2570, 0x00d },
+	{ 2740, 0x00e }, { 2910, 0x00f }, { 3070, 0x010 }, { 3240, 0x011 },
+	{ 3410, 0x012 }, { 3570, 0x013 }, { 3740, 0x014 }, { 3890, 0x015 },
+	{ 4070, 0x016 }, { 4240, 0x017 }, { 4400, 0x018 }, { 4500, 0x019 },
+};
+
+static const u32 rx_data_lane_gnr_con0[] = {
+	COMBO_SD0_GNR_CON0, COMBO_SD1_GNR_CON0,
+	COMBO_SD2_GNR_CON0, DPHY_SD3_GNR_CON0,
+};
+
+static const u32 rx_data_lane_gnr_con1[] = {
+	COMBO_SD0_GNR_CON1, COMBO_SD1_GNR_CON1,
+	COMBO_SD2_GNR_CON1, DPHY_SD3_GNR_CON1,
+};
+
+static const u32 rx_lane_time_con0[] = {
+	COMBO_SD0_TIME_CON0, COMBO_SD1_TIME_CON0,
+	COMBO_SD2_TIME_CON0, DPHY_SD3_TIME_CON0,
+};
+
+static const u32 rx_lane_time_con1[] = {
+	COMBO_SD0_TIME_CON1, COMBO_SD1_TIME_CON1,
+	COMBO_SD2_TIME_CON1, DPHY_SD3_TIME_CON1,
+};
+
+static int samsung_mipi_dphy_rx_lookup_hsfreq(u32 lane_mbps, u16 *cfg_bit)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(samsung_mipi_dphy_rx_hsfreq_ranges); i++) {
+		if (lane_mbps <= samsung_mipi_dphy_rx_hsfreq_ranges[i].range_h_mbps) {
+			*cfg_bit = samsung_mipi_dphy_rx_hsfreq_ranges[i].cfg_bit;
+			return 0;
+		}
+	}
+
+	return -ERANGE;
+}
+
+static u32 samsung_mipi_dphy_rx_data_lane_dlysel(u32 lane_mbps)
+{
+	if (lane_mbps < 1500)
+		return 0;
+	if (lane_mbps < 2000)
+		return SKEW_DLYSEL(3);
+	if (lane_mbps < 3000)
+		return SKEW_DLYSEL(2);
+	if (lane_mbps < 4000)
+		return SKEW_DLYSEL(1);
+	return 0;
+}
+
+/*
+ * RX analog tuning values from the vendor kernel; data lane 0 differs
+ * from the other lanes on purpose, as in the vendor receive profile.
+ */
+static void samsung_mipi_dphy_rx_config_common(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	u32 lane_mbps = div64_ul(rx->hs_clk_rate, USEC_PER_SEC);
+	u32 dlysel = samsung_mipi_dphy_rx_data_lane_dlysel(lane_mbps);
+	u32 ana_con1_common = HS_RX_LS_650UA | HS_RX_AMP2_500UA |
+			      HS_RX_AMP1_700UA;
+	u32 ana_con2_common = dlysel | RX_TERM_96_6OHM;
+
+	regmap_write(samsung->regmap, DPHY_SC_ANA_CON1, ana_con1_common);
+	regmap_write(samsung->regmap, DPHY_SC_ANA_CON2, HS_TERM_96_6OHM);
+	regmap_write(samsung->regmap, DPHY_SC_ANA_CON3, ULPS_HYS_104MV);
+
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON1, ana_con1_common);
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON2, ana_con2_common);
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON3,
+		     ULPS_HYS_104MV | LP_HYS_100MV | SEL_ESCPOL);
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON7, CLK_DBL_CTRL(1));
+	regmap_write(samsung->regmap, COMBO_SD0_DESKEW_CON2,
+		     SKEW_CAL_CLK_COARSE_SET(0));
+
+	if (rx->lanes > 1) {
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON1,
+			     ana_con1_common);
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON2,
+			     ana_con2_common);
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON3,
+			     ULPS_HYS_104MV);
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON7,
+			     CLK_DBL_CTRL(1));
+		regmap_write(samsung->regmap, COMBO_SD1_DESKEW_CON2,
+			     SKEW_CAL_CLK_COARSE_SET(3));
+	}
+
+	if (rx->lanes > 2) {
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON1,
+			     ana_con1_common);
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON2,
+			     ana_con2_common);
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON3,
+			     ULPS_HYS_104MV);
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON7,
+			     CLK_DBL_CTRL(1));
+		regmap_write(samsung->regmap, COMBO_SD2_DESKEW_CON2,
+			     SKEW_CAL_CLK_COARSE_SET(3));
+	}
+
+	if (rx->lanes > 3) {
+		regmap_write(samsung->regmap, DPHY_SD3_ANA_CON1,
+			     ana_con1_common);
+		regmap_write(samsung->regmap, DPHY_SD3_ANA_CON2,
+			     ana_con2_common);
+		regmap_write(samsung->regmap, DPHY_SD3_ANA_CON3,
+			     ULPS_HYS_104MV);
+		regmap_write(samsung->regmap, DPHY_SD3_DESKEW_CON2,
+			     SKEW_CAL_CLK_COARSE_SET(3));
+	}
+}
+
+static void samsung_mipi_dphy_rx_config_settle(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	u16 cfg_bit = rx->hsfreq_cfg;
+	unsigned int i;
+
+	/*
+	 * Clock-lane settle keeps the value of the TRM 2.5 Gbps receiver
+	 * example at every rate, as Samsung's own Exynos driver for this
+	 * PHY does.
+	 */
+	regmap_write(samsung->regmap, DPHY_SC_TIME_CON0,
+		     T_CLK_SETTLE(0x01) | T_CLK_MISS(0x03));
+
+	for (i = 0; i < rx->lanes; i++) {
+		regmap_update_bits(samsung->regmap, rx_lane_time_con0[i],
+				   T_HS_SETTLE_MASK | SETTLE_CLK_SEL, cfg_bit);
+		regmap_update_bits(samsung->regmap, rx_lane_time_con1[i],
+				   T_ERR_SOT_SYNC_MASK, T_ERR_SOT_SYNC(0x03));
+	}
+}
+
+static void samsung_mipi_dphy_rx_lane_disable(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	unsigned int i;
+
+	regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0, PHY_ENABLE, 0);
+	for (i = 0; i < rx->lanes; i++)
+		regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0[i],
+				   PHY_ENABLE, 0);
+}
+
+static int samsung_mipi_dphy_rx_lane_enable(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	unsigned int i;
+	u32 sts;
+	int ret;
+
+	regmap_write(samsung->regmap, DPHY_SC_GNR_CON1, T_PHY_READY(0x1450));
+	regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0,
+			   PHY_ENABLE, PHY_ENABLE);
+
+	for (i = 0; i < rx->lanes; i++) {
+		regmap_write(samsung->regmap, rx_data_lane_gnr_con1[i],
+			     T_PHY_READY(0x1450));
+		regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0[i],
+				   PHY_ENABLE, PHY_ENABLE);
+	}
+
+	ret = regmap_read_poll_timeout(samsung->regmap, DPHY_SC_GNR_CON0,
+				       sts, sts & PHY_READY, 200, 4000);
+	if (ret) {
+		dev_err(samsung->dev, "RX clock lane not ready\n");
+		goto err_lane_disable;
+	}
+
+	for (i = 0; i < rx->lanes; i++) {
+		ret = regmap_read_poll_timeout(samsung->regmap,
+					       rx_data_lane_gnr_con0[i],
+					       sts, sts & PHY_READY,
+					       200, 2000);
+		if (ret) {
+			dev_err(samsung->dev, "RX data lane %u not ready\n", i);
+			goto err_lane_disable;
+		}
+	}
+
+	return 0;
+
+err_lane_disable:
+	samsung_mipi_dphy_rx_lane_disable(samsung);
+	return ret;
+}
+
 static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, BIAS_CON0, I_DEV_DIV_6 | I_RES_100_2UA);
@@ -994,6 +1283,40 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
 			   I_MUX_SEL_MASK, I_MUX_400MV);
 }
 
+static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	int ret;
+
+	if (!rx->hs_clk_rate || !rx->lanes)
+		return -EINVAL;
+
+	reset_control_assert(samsung->s_phy_rst);
+
+	samsung_mipi_dphy_rx_config_common(samsung);
+	samsung_mipi_dphy_rx_config_settle(samsung);
+
+	ret = samsung_mipi_dphy_rx_lane_enable(samsung);
+
+	reset_control_deassert(samsung->s_phy_rst);
+
+	return ret;
+}
+
+static int samsung_mipi_dphy_rx_power_off(struct samsung_mipi_dcphy *samsung)
+{
+	reset_control_assert(samsung->s_phy_rst);
+
+	samsung_mipi_dphy_rx_lane_disable(samsung);
+
+	reset_control_deassert(samsung->s_phy_rst);
+
+	/* Delay from the vendor kernel; the TRM has no teardown sequence. */
+	usleep_range(500, 1000);
+
+	return 0;
+}
+
 static void samsung_mipi_dphy_tx_lane_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON1, T_PHY_READY(0x2000));
@@ -1526,6 +1849,53 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 	return 0;
 }
 
+static int samsung_mipi_dcphy_rx_configure(struct phy *phy,
+					   union phy_configure_opts *opts)
+{
+	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	u32 lane_mbps = div64_ul(opts->mipi_dphy.hs_clk_rate, USEC_PER_SEC);
+	int ret;
+
+	ret = samsung_mipi_dphy_rx_lookup_hsfreq(lane_mbps, &rx->hsfreq_cfg);
+	if (ret) {
+		dev_err(samsung->dev, "unsupported RX data rate %u Mbps\n",
+			lane_mbps);
+		return ret;
+	}
+
+	rx->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
+	rx->hs_clk_rate = opts->mipi_dphy.hs_clk_rate;
+
+	return 0;
+}
+
+static int samsung_mipi_dcphy_rx_power_on(struct phy *phy)
+{
+	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+
+	switch (samsung->type) {
+	case PHY_TYPE_DPHY:
+		return samsung_mipi_dphy_rx_power_on(samsung);
+	default:
+		/* CPHY part to be implemented later */
+		return -EOPNOTSUPP;
+	}
+}
+
+static int samsung_mipi_dcphy_rx_power_off(struct phy *phy)
+{
+	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+
+	switch (samsung->type) {
+	case PHY_TYPE_DPHY:
+		return samsung_mipi_dphy_rx_power_off(samsung);
+	default:
+		/* CPHY part to be implemented later */
+		return -EOPNOTSUPP;
+	}
+}
+
 static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.configure = samsung_mipi_dcphy_tx_configure,
 	.power_on  = samsung_mipi_dcphy_tx_power_on,
@@ -1535,6 +1905,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
 	.owner	   = THIS_MODULE,
 };
 
+static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
+	.configure = samsung_mipi_dcphy_rx_configure,
+	.power_on  = samsung_mipi_dcphy_rx_power_on,
+	.power_off = samsung_mipi_dcphy_rx_power_off,
+	.init = samsung_mipi_dcphy_init,
+	.exit = samsung_mipi_dcphy_exit,
+	.owner	   = THIS_MODULE,
+};
+
 static const struct regmap_config samsung_mipi_dcphy_regmap_config = {
 	.name = "dcphy",
 	.reg_bits = 32,
@@ -1556,6 +1935,8 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 	switch (args->args[0]) {
 	case PHY_DIRECTION_TX:
 		return samsung->tx.phy;
+	case PHY_DIRECTION_RX:
+		return samsung->rx.phy;
 	case PHY_TYPE_DPHY:
 	case PHY_TYPE_CPHY:
 		if (args->args[0] != samsung->type) {
@@ -1649,6 +2030,13 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(samsung->tx.phy, samsung);
 
+	samsung->rx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_rx_ops);
+	if (IS_ERR(samsung->rx.phy))
+		return dev_err_probe(dev, PTR_ERR(samsung->rx.phy),
+				     "Failed to create MIPI DC-PHY receiver\n");
+
+	phy_set_drvdata(samsung->rx.phy, samsung);
+
 	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
 	if (IS_ERR(phy_provider))
 		return dev_err_probe(dev, PTR_ERR(phy_provider),

-- 
2.43.0

