Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240303B27EF;
	Fri, 19 Jun 2026 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883266; cv=none; b=sU+gp6n3lc4seSmaeeyqjJ49WUztv+cuupYz8RtVDjTIZ8FqXJwBE3Umsg+DFJS5chj+k6yUxZSdVrZ4r5IyzrJFkr4aFk3qJdYC3yMGdxyT3Bu3JutPFW4vYVy/cziA3vR7OQi3A5td172ay1mVSvf2USItRoGhnLHqUOzVKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883266; c=relaxed/simple;
	bh=HaBOFuFe21ffySfCQzje2DlzG/bKoGkSOzwTEV941FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GOM+26OYOUB5dCYNocaw0EHtBFk/J9W3ox2AsBxvfcLhemJZZidSeCxaEZpqeoJGyNCN6Lb0H9NZoMYkcWxLKZJ3I/Pd27/b5lu5dzH8mm8r+/YesP50wRRuKXAxsUAA1l8ToY1DVZbOF7NHPQXRZKQTCPe5SwUPb1OvTWPCXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YaEC2Guw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YaEC2Guw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781883263;
	bh=HaBOFuFe21ffySfCQzje2DlzG/bKoGkSOzwTEV941FI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YaEC2GuwiYt77eXwmqNoMorIjyH9HmV7oifvcda2/2ii4EL0IMkhOKb/VRKYR5D7Y
	 lnnAXASN0lPRcVEDRFQXlHyTKdZHEIfCPpcoP/XLKftIOrLFGvaOmR8JgTz7PmQHLb
	 GyGuQTHoxg3a7GNx0QLjlxUl5mp8ui3/WsONi7+17zAxRvhXduARwJ3JsHGUzTIWFp
	 5dhZGwZXnTSZ1GS6Mgrwlev9GihgBY2yEUk6IDjBiOUO2C61VI5AZl0XbXvvhzZ9GB
	 7PZPx09SKrEs5esjYfAMCsWZt4nCa8BmZpih92fHDKHl6xqgSGJF8/YLoGUrv4VnbS
	 m2Ac0ho60FscA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7637E17E02B5;
	Fri, 19 Jun 2026 17:34:23 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9F968480055; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:07 +0200
Subject: [PATCH v6 16/23] phy: rockchip: usbdp: Drop DP HPD handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-16-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
 bh=HaBOFuFe21ffySfCQzje2DlzG/bKoGkSOzwTEV941FI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDk3lmulfxkAKyl1bB0UefJi8Cjjr1Tpz
 9I0vWktmmc7PIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA5AAoJENju1/PI
 O/qaI50P/20uAXYYQxrGAf+FvUvz0/7b2zrU84vwY0RVN394tPxNDDsJKp+GmW7V2oiKjhVA6GD
 ENk/+ZeU5vwCioWwB+8L/myHTypWWD07CRGUTCxgwIeimwozRSGrZVwhe3oZ2fKbJ3z2IfufJxR
 rKc0KkdgB0wjehZ3w6zz21x0iKZuGx5RLt/ljwWzyk3QTkAHnfF0wuh/+awgJSAL73FOBCTBDnN
 RLyK3TNUeF+/xnI38iFmrfKL4Me3EmwVJcpvc+tXpwM8xSJThwfFcc4b4QoHdMQEwSm+/QNbrab
 vK/iM9ZpOb2uZCa10OM17HbejX5ggDY1RckWe7k03mNo7AmWxPMuBCL/mn7HX5k7S7wEFnMWX9k
 kIy5MnAwK8jFLoSEZuwiXZWvnL2OOmjSbV3fgexOnArpbXtpyuuLL4IWAj+vGHjS/Oxak2YKyS7
 NlbGX9DG2x5UV649swGYRHLIYBHnoSAnmLAUjIiuOl5Ets1CX1Q/Khe0ZBgrLZFLFKcqPIjW/yV
 U5bJEi9DmClQbV6HqWI2/6MEgCpukaH9SK6jPxCCb05FIQy4ENo4rz1jUojI/+Ly7R1662sei97
 fMwl8lLBPMAQNsYFdnJ/BWyLj+9RcD6qirHzmFb34QcTpQZsdStqkNbmT3024EnO+Rl//isRzpz
 dhWnnAupd8iN1VAlhepooHg==
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
index b75c190a4311..383e68b24506 100644
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
@@ -579,19 +575,6 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
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
@@ -1024,29 +1007,6 @@ static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
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
@@ -1278,8 +1238,6 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 }
 
 static const struct phy_ops rk_udphy_dp_phy_ops = {
-	.init		= rk_udphy_dp_phy_init,
-	.exit		= rk_udphy_dp_phy_exit,
 	.power_on	= rk_udphy_dp_phy_power_on,
 	.power_off	= rk_udphy_dp_phy_power_off,
 	.configure	= rk_udphy_dp_phy_configure,
@@ -1333,6 +1291,14 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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
@@ -1364,22 +1330,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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
@@ -1535,20 +1486,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
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
@@ -1572,7 +1509,6 @@ static const struct rk_udphy_cfg rk3576_udphy_cfgs = {
 	},
 	.vogrfcfg = {
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0000, 11, 10, 1, 3),
 			.dp_lane_reg    = 0x0000,
 		},
 	},
@@ -1613,11 +1549,9 @@ static const struct rk_udphy_cfg rk3588_udphy_cfgs = {
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
@@ -1653,7 +1587,6 @@ static struct platform_driver rk_udphy_driver = {
 	.driver		= {
 		.name	= "rockchip-usbdp-phy",
 		.of_match_table = rk_udphy_dt_match,
-		.pm = &rk_udphy_pm_ops,
 	},
 };
 module_platform_driver(rk_udphy_driver);

-- 
2.53.0

