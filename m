Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36A83ECBEA;
	Thu, 25 Jun 2026 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409582; cv=none; b=t98R+h2zaxg8z5z93R4WYPxHVpm2EHfTPdfOEJ0q60toPvXolBOOnoOSgh5YCGhVMysIlrwL7KdDgSgDYjvoUhKpEYn+H0L9U+/rx5WD6jjnbYKj29C5MYSywaqeljdAynRgW6lTdTQ66HWG5mnT5/hQ2bLfP5SLjinWUV2/6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409582; c=relaxed/simple;
	bh=pUGZ24TqTzPwd3yw6PbYCwpezRFasO39bd0Rp80MU0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGX9JsljiDdDSJC0yZX4NusZaS3I4m+Zwe8HHpdjB2GnzO69J6F2sjIaDRkIYpMB9PdR7Jw+/M5LKCQMliDGRy08XLqHEf1r+ZbViy2dahjkOJnv1US6zn+itP8f4FTevOlYfsD74WVgXQeff4TeAtfSo4gk6p1RfmET5otM7Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gpcxs7n6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gpcxs7n6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409579;
	bh=pUGZ24TqTzPwd3yw6PbYCwpezRFasO39bd0Rp80MU0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gpcxs7n6icqSZt7apwLSrjj4uuDZ+HrMGlOyD4GEyZHAt7u9DXlJk3OKHYaJzRddt
	 b97mHTdyw/wH6aLpCmvH88IUNKQFDlbkLcEiF021dRPM5tbOtJXcukCm6cbLZYaWXG
	 UovVs4N29lgn6Yyo28fkGQybJTCUZ/SYqfC2NgTByJKw8WAA+LC2eKFl7WIF3USoaj
	 0y0hJMo7fG61Hj1ebQVjxJ5PMeH2bDiulce1VMUqRXDvDYlCFbBl9T/Aphsiqa9/du
	 3VtWs7ilBt62Lpg9rSoPf0F+xWpEBk5kWrGKMyx1oWOLIxD3PZqrZBhs8RZHhFJdjX
	 owBMLnoDPfefQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EC4817E01B6;
	Thu, 25 Jun 2026 19:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 13A36480062; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:45 +0200
Subject: [PATCH v7 18/27] phy: rockchip: usbdp: Drop DP HPD handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-18-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5858;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=pUGZ24TqTzPwd3yw6PbYCwpezRFasO39bd0Rp80MU0Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9sc5f/jT3/vWIOykw/dToHTQeJoJmgu6
 dNh75IZ0hMDlYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaDcAQAKZyqbz6WY65Uw1Dn9q9u3pPfpurdaYQHR0XU8IxLNnFQlSiu7vmrw8In1U7kBUUSea
 cnHTQX19+/NZEKUCg6LiUujAR7oHXQ8+Lf2jCIXvE9bZVM6zQSa4yeDmkJ+MpCIt+W+20rnq+5P
 j+48UsYSPs7uFJvInMenEU38mCTh+RxtcJmgw1STFOPemRHWoWsVBXemD/Fw4BhZYb6FxVZ8aFM
 G3Wmy33wProBuQqD1Sx+dhnLMhf6eqfp+957dFnVrdga7pN77HIEYH71bmwhh+nG04ZzBl2+wUu
 lm6pN4JZ5cIm2H1gwfIx9Rbp+sollPwO0mLZpGNRCpAZphKCfYVWZOnl8zViql9GtUrwxqjHzfn
 ZOKdvljMzLkLJb6zOy9NVEKVDFmTcRChSC6aBDRsADMnnl8UXwjTdxZ5Xbe9rpNftE6AknZBBH0
 C+vl/5SGrOBRug5eDvVF1p1LNEJAeBjcefGBQqBXbD9WcugE2VG5mug+W9Vf4heJItNQqnFbRls
 WAdCkBHJ8SW52Y1Ucoo/GohYAfdzVabk3afxQdnClRcczaVAyMFad22TTt0Gm45XwVylbfUx9rK
 Ylfkn2az6f0lRFbKfpHOw+Uyu93JffvH0jC3DJRRWrI65V3SApn9vI5IwhdzUcbok707dyW39lW
 EebtB4O7r7OwE4D8M6TEzDQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Drop the HPD handling logic from the USBDP PHY. The registers involved
require the display controller power domain being enabled and thus the
HPD signal should be handled by the displayport controller itself.
Apart from that the HPD handling as it is done here is incorrect and
misses hotplug events happening after the USB-C connector (e.g. when
a USB-C to HDMI adapter is involved and the HDMI cable is replugged).

Proper USB-C DP HPD support requires some restructuring of the DP
controller driver, which will happen independent of this patch. The
mainline kernel does not yet support USB-C DP AltMode on RK3588 and
RK3576, so it is fine to drop this code without adding the counterpart
in the DRM in an atomic change.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 85 ++++---------------------------
 1 file changed, 9 insertions(+), 76 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7bac3f14d750..8b5b188fd121 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -128,7 +128,6 @@ struct rk_udphy_grf_cfg {
 
 struct rk_udphy_vogrf_cfg {
 	/* vo-grf */
-	struct rk_udphy_grf_reg hpd_trigger;
 	u32 dp_lane_reg;
 };
 
@@ -186,14 +185,11 @@ struct rk_udphy {
 	u32 dp_lane_sel[4];
 	u32 dp_aux_dout_sel;
 	u32 dp_aux_din_sel;
-	bool dp_sink_hpd_sel;
-	bool dp_sink_hpd_cfg;
 	unsigned int link_rate;
 	unsigned int lanes;
 	u8 bw;
 	int id;
 
-	bool dp_in_use;
 	int dp_lanes;
 
 	/* PHY const config */
@@ -582,19 +578,6 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
-{
-	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-
-	udphy->dp_sink_hpd_sel = true;
-	udphy->dp_sink_hpd_cfg = hpd;
-
-	if (!udphy->dp_in_use)
-		return;
-
-	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
-}
-
 static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 {
 	if (udphy->mode == mode)
@@ -1030,29 +1013,6 @@ static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
 		rk_udphy_disable(udphy);
 }
 
-static int rk_udphy_dp_phy_init(struct phy *phy)
-{
-	struct rk_udphy *udphy = phy_get_drvdata(phy);
-
-	mutex_lock(&udphy->mutex);
-
-	udphy->dp_in_use = true;
-
-	mutex_unlock(&udphy->mutex);
-
-	return 0;
-}
-
-static int rk_udphy_dp_phy_exit(struct phy *phy)
-{
-	struct rk_udphy *udphy = phy_get_drvdata(phy);
-
-	mutex_lock(&udphy->mutex);
-	udphy->dp_in_use = false;
-	mutex_unlock(&udphy->mutex);
-	return 0;
-}
-
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
@@ -1284,8 +1244,6 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 }
 
 static const struct phy_ops rk_udphy_dp_phy_ops = {
-	.init		= rk_udphy_dp_phy_init,
-	.exit		= rk_udphy_dp_phy_exit,
 	.power_on	= rk_udphy_dp_phy_power_on,
 	.power_off	= rk_udphy_dp_phy_power_off,
 	.configure	= rk_udphy_dp_phy_configure,
@@ -1339,6 +1297,14 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 	u8 mode;
 
+	/*
+	 * Ignore mux events not involving DP AltMode, because
+	 * the mode field is being reused, e.g. state->mode == 4
+	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
+	 */
+	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+		return 0;
+
 	mutex_lock(&udphy->mutex);
 
 	switch (state->mode) {
@@ -1370,22 +1336,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 		break;
 	}
 
-	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID) {
-		struct typec_displayport_data *data = state->data;
-
-		if (!data) {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-		} else if (data->status & DP_STATUS_IRQ_HPD) {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-			usleep_range(750, 800);
-			rk_udphy_dp_hpd_event_trigger(udphy, true);
-		} else if (data->status & DP_STATUS_HPD_STATE) {
-			rk_udphy_mode_set(udphy, mode);
-			rk_udphy_dp_hpd_event_trigger(udphy, true);
-		} else {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-		}
-	}
+	rk_udphy_mode_set(udphy, mode);
 
 	mutex_unlock(&udphy->mutex);
 	return 0;
@@ -1541,20 +1492,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused rk_udphy_resume(struct device *dev)
-{
-	struct rk_udphy *udphy = dev_get_drvdata(dev);
-
-	if (udphy->dp_sink_hpd_sel)
-		rk_udphy_dp_hpd_event_trigger(udphy, udphy->dp_sink_hpd_cfg);
-
-	return 0;
-}
-
-static const struct dev_pm_ops rk_udphy_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(NULL, rk_udphy_resume)
-};
-
 static const char * const rk_udphy_rst_list[] = {
 	"init", "cmn", "lane", "pcs_apb", "pma_apb"
 };
@@ -1578,7 +1515,6 @@ static const struct rk_udphy_cfg rk3576_udphy_cfgs = {
 	},
 	.vogrfcfg = {
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0000, 11, 10, 1, 3),
 			.dp_lane_reg    = 0x0000,
 		},
 	},
@@ -1619,11 +1555,9 @@ static const struct rk_udphy_cfg rk3588_udphy_cfgs = {
 	},
 	.vogrfcfg = {
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0000, 11, 10, 1, 3),
 			.dp_lane_reg	= 0x0000,
 		},
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0008, 11, 10, 1, 3),
 			.dp_lane_reg	= 0x0008,
 		},
 	},
@@ -1659,7 +1593,6 @@ static struct platform_driver rk_udphy_driver = {
 	.driver		= {
 		.name	= "rockchip-usbdp-phy",
 		.of_match_table = rk_udphy_dt_match,
-		.pm = &rk_udphy_pm_ops,
 	},
 };
 module_platform_driver(rk_udphy_driver);

-- 
2.53.0

