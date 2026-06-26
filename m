Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5B83C4154;
	Fri, 26 Jun 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507312; cv=none; b=lf0QydVdh/vYRfEWGyCrCBP/hMZ4QSGnnY0QvAl0axf3t2yTrnscESA07L0kPe/LfKIAoPeZNINw1R6dboiD7qCQMMXUML/NpHUnW+9Ox/jixQmTsqOSAv2RSyKNN2+cyGCrP/bbjozXKPU4BeNwT+lbq7E0zShqlEeboXls6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507312; c=relaxed/simple;
	bh=02cWmZKqMiGVzTf6KCwNSEtw9FxI9yd0x+toVf8lKs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4MwxABt+BketInVTJkM2n7FiV1/bHXIgVH+fg02DvcrSTTzrNnpRa+KO7gqUC1KAR6xXUAxiZYUN+AkOPLBs2wFAzXtStu2yXDFcr/FOQEt2wX9omqpK+Yd4nU+PIlc7f7sxBhp/DFjcDNnOq1dpFlHXUVHuh6azRiWSFdLIpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NP51eDSE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NP51eDSE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=02cWmZKqMiGVzTf6KCwNSEtw9FxI9yd0x+toVf8lKs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NP51eDSELG97sfUmjaGk3COMRpX/n9NZ6FQ0ihf5p8z9daryETmnl3Wks3+rBgNE3
	 Scsbhp/fIqfVwC7lrGENqlpLu6GQyRkInBu5zoQClqDGXirwF44hAb81h8O9/q7mO+
	 Q6h3RpoDrTah9IQjGf5mbSu7pykl2UMZmEIg0npP37VMJaOaP4UyxKdOkTh2V6S84t
	 8IE5DG+BDQN8KRPfyq+ZmxGN543cA2zXupYaKBAV8x0PxrhQfkK/V0pXsQ0H9OJ9Oy
	 /7SYAZjkYLPPlJE7tieluefZ1c27sQ0L7WxW0+rH4pWMbAB+/XbxShAlMhEmzi8jH9
	 +fexNdbnf/yNQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65ACD17E35C9;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 334CC48006D; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:20 +0200
Subject: [PATCH v8 27/29] phy: rockchip: usbdp: Add some extra debug
 messages
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-27-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=02cWmZKqMiGVzTf6KCwNSEtw9FxI9yd0x+toVf8lKs8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yU5RsDpaDtfaNAkaLh4aGivFwksfIYPe
 I0/PBd2Q4C3aIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaw/0P/3xhOrg4qtnk2v/FV4hYfnJQ0sqLxg9GxWLinVZSD62AMwQTW7yCU8+0FGxAU+NHG1H
 f83vNrQRO1aWK06v7agXDnTTfHL9aUgaPPMWrSRQY5Bk6vM5av+9r+/NGKMZuUDse0omULaUjVO
 3aU6McrEquSrujPqjZvO1+ElvoTWORfwF9ZFU/yUZxRt5BvgFGDc90SbiLu9/xBMnqCZ3AISC5T
 A+Pud8n2J8lvwu3nkHzBtZeOxGxYMXF/kC8sc3q1WztFd8bWpNNPd64LSstyMCEidGtpgGS6MbL
 dJtUdU+2hT+FG2ANvQuTilOX/pZnTS5OraWc2WKi0edFo+5zrq9L/Cy4lJNm/DwvHxaoJQei87v
 ClmqrYvdgs1Nte/CxdesFq/gFF3sMzArmOWFoFGkbPNfEx16DnoQtrkrfaF/6US0TdncV4IAKaK
 6cm8KVij2mVshhZ4zhD7wt8T0eLDttlgxpbtP/6SmPQSrOm+NclRMSyjwS8NPP8Jt/ce6OdgG8N
 H890qYQbPyZUqbv5MOkR8DpNCd62o586xchxF5/l9fsrKOw2fzZnt6avSFMqhOpzzkGZ8QduXSf
 KkTvyGNYaW+P5wDgiqKZGyFE5W9yMTnkoRzs/4Ny+sDbNI9KaQc5hLa7KEkvldNebqN8aQHsJDI
 yFm3fpmfze2is6gxycMowOA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2681610d10d5..dc166392ba19 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -24,6 +24,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
@@ -469,6 +470,8 @@ static int rk_udphy_reset_deassert(struct rk_udphy *udphy, char *name)
 			return reset_control_deassert(list[idx].rstc);
 	}
 
+	dev_err(udphy->dev, "failed to de-assert missing reset line: %s\n", name);
+
 	return -EINVAL;
 }
 
@@ -495,6 +498,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy *udphy, u8 disable)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	const struct rk_udphy_grf_reg *preg;
 
+	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));
+
 	preg = udphy->id ? &cfg->grfcfg.usb3otg1_cfg : &cfg->grfcfg.usb3otg0_cfg;
 	rk_udphy_grfreg_write(udphy->usbgrf, preg, disable);
 }
@@ -788,6 +793,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
+	dev_dbg(udphy->dev, "(re-)init PHY with USB=%s and DP=%s (%u lanes) flipped=%s\n",
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_USB),
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_DP),
+		udphy->dp_lanes, str_yes_no(udphy->flip));
+
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
@@ -858,6 +868,8 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 {
 	int ret;
 
+	dev_dbg(udphy->dev, "enable PHY\n");
+
 	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
 	if (ret) {
 		dev_err(udphy->dev, "failed to enable clk\n");
@@ -876,6 +888,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 
 static void rk_udphy_disable(struct rk_udphy *udphy)
 {
+	dev_dbg(udphy->dev, "disable PHY\n");
 	clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
 	rk_udphy_reset_assert_all(udphy);
 }
@@ -1359,8 +1372,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
 	/* Ignore mux events not involving USB or DP */
-	if (!rk_udphy_is_supported_mode(state))
+	if (!rk_udphy_is_supported_mode(state)) {
+		dev_dbg(udphy->dev, "ignore mux event with mode=%lu\n", state->mode);
 		return 0;
+	}
 
 	guard(mutex)(&udphy->mutex);
 

-- 
2.53.0

