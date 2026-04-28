Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B385F3DA7CA;
	Tue, 28 Apr 2026 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392852; cv=none; b=GZxDoBv4kL5hiI6MU0XQjnVTio3vejYs81+atH04gEeB1fR1U5MDDfQMv1cEYDLeyrHoi7HYa6RCCtMDevr+zdZ9e3optStzRngNnJqbmr3cM7Cy4lsOBtyB9tLpjsuxunaNHZLhlFSlkfKJOL2Q1y9MMidDnwuzxBB241sPF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392852; c=relaxed/simple;
	bh=+pleStZDe9MkxPKCrTUKOzh1pFK+HK0JKxesNBRI1vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nenl0YMCwnDdy/OVBWcULMTfsTU61SzngJoCkKDcuhsWRYE9nHkE8B79hhntD1/e/4FV7YX2JCwinwkDTYWfODsKOX23C90B4nlmZpjg8tzw+uLTbxBGROAbw4HfaXfwtP7rUqemEsVP6D/gqUNj5Ob/CDFHR3fYzHlrnOfvMbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MnhLaPet; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MnhLaPet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=+pleStZDe9MkxPKCrTUKOzh1pFK+HK0JKxesNBRI1vY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MnhLaPet0sS0Y2E3U8iS27k2fMzcjOxKAIXK4BYMgNhHW63YEtr4YbXqE5hUYzOz9
	 JTlvIG+PjIMbL5BLRGNku4+WvNJK2Dvy22vMAVmJCjbVaMjpZAkyyVgZdEJV88alBM
	 U/MsAa4EePZJjQNmNbMe5ivTf0vcMyeiMXHmpGiJxCuJTa9oJ6hbFSAlubsrQG0Txx
	 h+Nj9QFVNHKxkfmH698fwQi6jasMJi15Uez/Ad9XUkSt+mHpBWgrxMqWcMf/2EcGRj
	 sObhkMDGGFwigVLHCuartcun9DMuIV+qU5Eaf4UvGViFok2WdjeR4yvFwoLQ1cFsGc
	 1MkgOQwGqWJIA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EEE717E15A5;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 91BB6480055; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:51 +0200
Subject: [PATCH v4 12/16] phy: rockchip: usbdp: Drop DP HPD handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-12-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3585;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=+pleStZDe9MkxPKCrTUKOzh1pFK+HK0JKxesNBRI1vY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MkcEEmJWVj/HJ6gFmDHXCdp3xH0Fq/nt
 1m9ttBgIc4FE4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qaFUoP/is9eYWtBs37ZIECMcAQbCv0VCBuQR+En53eonuQcYpzczNhPZwM6BOVW/oQXmldkll
 EA+820mLllRzx6fXaQmLMG2Epmgxj70q2dUGvmCMymncbJxpdfPHu1N+TplDjAAsM2Gh/Mzv1rL
 xR7RJimwYyNX1ftS79nUwWkwLxycveAOMaVhAIqBT4f8g+5tBrN0kHiHjGR6RsRARVdyz3sewUQ
 0+AoqZp2iintmS1l1J9MkHDm+rm2jftpSr6/dm34z91jCRZ4CzgjJ55qQVg8dETYOLdG6jDgjVJ
 zHJFGtfY/MZUftluxz7CLLNQbMv2OgcUM/nEijTywiXgN0NDgrpcFTPEjXyYCR3tJRpootqMale
 PIgiQqItA/g81QJE2GRrnjTJzRcbidjT2MRXAGOV8X5fMehdZCMxCI2+k4IFyyeV42nLdXXYExS
 KmWuxzodBCeMqXWtqEZq17O690+KttKgnW0Pm6DJVGBxM1fBtH8AYFbP43Srz4wIFcxR3M5zhOp
 rE6a3wKZmHCodyjsVJpcw17KBMHyinAEWRLokajbFgpuxNv9OJqQf27LMhgQeR1P0WHzmhvi6fc
 6LAxXNjYm3JZfwqw2RrgpLY5hvgkIQvfT0nM93y6ZJrJSKlxN24lh2V9/u8san1BSfPIrWwV+LY
 SUg1sOiTJVpOmX5hRPJUn+g==
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
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 47 +------------------------------
 1 file changed, 1 insertion(+), 46 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 77ad2a89d4f2..3f1233f50686 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -186,8 +186,6 @@ struct rk_udphy {
 	u32 dp_lane_sel[4];
 	u32 dp_aux_dout_sel;
 	u32 dp_aux_din_sel;
-	bool dp_sink_hpd_sel;
-	bool dp_sink_hpd_cfg;
 	unsigned int link_rate;
 	unsigned int lanes;
 	u8 bw;
@@ -579,19 +577,6 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
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
@@ -1360,22 +1345,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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
@@ -1531,20 +1501,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
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
@@ -1649,7 +1605,6 @@ static struct platform_driver rk_udphy_driver = {
 	.driver		= {
 		.name	= "rockchip-usbdp-phy",
 		.of_match_table = rk_udphy_dt_match,
-		.pm = &rk_udphy_pm_ops,
 	},
 };
 module_platform_driver(rk_udphy_driver);

-- 
2.53.0

