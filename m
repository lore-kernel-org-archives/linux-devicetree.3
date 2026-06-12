Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66F3E16AD;
	Fri, 12 Jun 2026 16:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281327; cv=none; b=lsqJ3EYk8hLFKXGmp4WkwwdTlUxD5plKNEbCwTS8MDVVE4yFDXCxTpV1+f4lhPlFIpzkxoIdjs09GO283baosSzvQevL7Hvs5dnAvafSesGX8KTwg/uHpEgNV47NJL0feDDkTtY5zi8DkELaFQgOsLH+ptMBPT2whkBogyW14EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281327; c=relaxed/simple;
	bh=frOx2yDmZqlirMA+vcUvkHvM/HP9+QN12zeTTm/vWGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlbYFf2v60D2ZHvoD9i7las4NEExpVtsFWHSPvpZUsPG6CL5l6il1mKg2XmDfnUmD7MDOoEV3OfY7/3VowtsUfAb1Upee78pLcGdGZiVjBr4uak+F+ANpvvoTDRLP2DaqNmD62VcEB34hFPxYhNmw6gwe2KUxBbCDsh9VFjln3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OA1i9p4Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OA1i9p4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=frOx2yDmZqlirMA+vcUvkHvM/HP9+QN12zeTTm/vWGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OA1i9p4Q101Dxrq09+ZhZmkqHzUqKQ4ei2eRnzXPCXKR0/KQ5uW+z2Oq588P7uotY
	 ffu7DMSn4AyFGc5LoC+KTkpvJK3IIlF6AjyC5hKlDV9Vi5s9s1vx5Z14bjBtwIaZAy
	 Dneo0qO6kUanCQXDPHjKqtIPZbfboVHf00KNqpOK9PneovavrTnKIw2X8Sk6MiZFSz
	 i9q09q7D2zdWgqzLAahNO5GAIBWAsc4c/QDtI5bV/6DzplXFAtvo4EWaUSS+gVMp7p
	 Uh9qy03qFCTd8JiZwGbduJwGODzyVrwJhJoYlt1l0UvT+YhG5gpNa9LfwRzSXTMLXb
	 AU/hRe3m9+qbw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CEA117E140E;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D6130480048; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:50 +0200
Subject: [PATCH v5 12/18] phy: rockchip: usbdp: Drop DP HPD handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-12-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
 bh=frOx2yDmZqlirMA+vcUvkHvM/HP9+QN12zeTTm/vWGQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiE0a8zusIQssYY7o/Oz/fsB4STs2YpDt
 ieqRShfFfev8IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qao5gQAIM+wvGb4QTUi79uj1jQpBbUx6Wl3uM67gHyFsvMhdLwjdztSCTVaLjB3WEPbUzvPhi
 hIrPuRTMlmgz8fMiIte9sST9pSEykyzaDAja6cn8I6yweEeD/yh4rWdW6iRZEUkj+opi/lNoPVA
 +bbyoLHKkv+DMsF8alv9U41iC/3r6T063TyaNEQBzihfwRAwUDOL7d9B1i86hUpyU2EFRlUr0Sp
 pCjHSkfGeCEGNS8JQuC1voAmL5DSBkN2U0AlW6/Tgx1w05R+l62tY/Hd7EAvt+Kr4BtpnsIAWp/
 +iOq4b4h70lGblPTyFC5qS6owHHyQ2Ntj2AxnqPEM9SeEoNcfxhD1F8htRMQ8EHcJAjJhML9JPj
 oX92sF/8Xabz5SS+b46HjiBAVHiq6vFhLuPGSa2FbWSrxupy1UeO/Ui8rOuRH2Ad0+13exG5LA4
 NN/u1+cJqtNTujtHa4N/49irZtCano/pxcgBa0eQuPh7vWueKI+/N1rpgP/ZHtcRSFidIiwdiIS
 +n7EgaBe2tdtZ5s4/cimbJ1YhCwa7WLpdOeijDGKqzknrwOfDrie76yVgtfIHBN2YAVDUo2dQl3
 gey910n2MEUhUByCSyOEI+8bNdRlrR0FX4imOBoOVAxb/HdsUkxCgRVxFVnj5ZHxyDhk10YVu/w
 5hZ6QSTTD9upPNPLf+rEt2Q==
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
index 77ad2a89d4f2..7255c80e0fe2 100644
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
@@ -1023,29 +1006,6 @@ static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
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
@@ -1274,8 +1234,6 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 }
 
 static const struct phy_ops rk_udphy_dp_phy_ops = {
-	.init		= rk_udphy_dp_phy_init,
-	.exit		= rk_udphy_dp_phy_exit,
 	.power_on	= rk_udphy_dp_phy_power_on,
 	.power_off	= rk_udphy_dp_phy_power_off,
 	.configure	= rk_udphy_dp_phy_configure,
@@ -1329,6 +1287,14 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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
@@ -1360,22 +1326,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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
@@ -1531,20 +1482,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
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
@@ -1568,7 +1505,6 @@ static const struct rk_udphy_cfg rk3576_udphy_cfgs = {
 	},
 	.vogrfcfg = {
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0000, 11, 10, 1, 3),
 			.dp_lane_reg    = 0x0000,
 		},
 	},
@@ -1609,11 +1545,9 @@ static const struct rk_udphy_cfg rk3588_udphy_cfgs = {
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
@@ -1649,7 +1583,6 @@ static struct platform_driver rk_udphy_driver = {
 	.driver		= {
 		.name	= "rockchip-usbdp-phy",
 		.of_match_table = rk_udphy_dt_match,
-		.pm = &rk_udphy_pm_ops,
 	},
 };
 module_platform_driver(rk_udphy_driver);

-- 
2.53.0

