Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2433B3B27F0;
	Fri, 19 Jun 2026 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883266; cv=none; b=nCWhtHDEDeMnxoVhhQcJFiz+4wbV8O80zW89cPoZRa6OrxK9HTjNRhksyA9jgDIStShSOBF2C/eep0xP6dFmeTAxZNrnMui+z0Wg+ljhbJNHheStMtHgCOQCj84/Qqzn5+qyVu2cOIzGsaccu59nqPsImCv925NXwWwesSmHlJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883266; c=relaxed/simple;
	bh=Z/LdeXSUssiy8jEYkeBPrfksk8Z5qtIxmZ8LzHUPTgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZB3+58ax08ZNLrQx6LkSo3+gp10rkKjDdeHV6mj68Twc9GmoV3A1myuNSxOF8kAyEQWIZcDmyVKckHeo2eSKrBinGE2odNWyh92mOp+w8Zgu7Ira57JY6MZJDrBnrLVzBHV01m5Xxr1nu0TO8w91E0cBwf5aar57pV3bPOHl7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W/H9pP80; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W/H9pP80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781883263;
	bh=Z/LdeXSUssiy8jEYkeBPrfksk8Z5qtIxmZ8LzHUPTgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W/H9pP80cmRZz/arTVG5OlSgAJQvhH8L84XneURugJy4ziYcINkBIGe+LWnYJThqE
	 gFD1MJIPELbuqHpXtZ1MM9t1nOcMHqVzeWkxgCfCtskt8bQLCyTxo68kbe36FILbwW
	 o+1acIFPRJflWp+AwxLzNxUkTDLwyu6D1t+uKCTAY/tbEXTdUP/+bDc5I3kuarXWb+
	 7yVdFPt6+L45MvrvfwhXJh6VU+24+hwji7BJC7XjvSGiEwiTiooUClRAquoKQDpXb9
	 pIjjF/lhke3vbEoyOCLzxpfyvNP5C19KJCKWKbav5oG9P4YKQFTdpnuOcdMTP3Cz5k
	 juc1hAZZx9r9g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7963717E0CD4;
	Fri, 19 Jun 2026 17:34:23 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A6F5B480066; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:12 +0200
Subject: [PATCH v6 21/23] phy: rockchip: usbdp: Support going from DP-only
 mode to USB mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-21-3bb1f54b3f35@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Z/LdeXSUssiy8jEYkeBPrfksk8Z5qtIxmZ8LzHUPTgU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDnpPon/ct8GoOHH5a3CZZXhiPN1GuEQH
 j7lVODRfYvseIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA5AAoJENju1/PI
 O/qaVncP/jwKBPqMOXxTuIixNy6Qcm4mw1QpC2qkP44wYlaTlHC+lTWpY+NoRerIvMkboyYPx1f
 XcD1rI6nk5i+JRtG46qY6mkL+gX9vJxV05H/2y86nVTEkTQEuS0IMntBfxQ8FQMbk3feEWblrqI
 HGtawGdU2MRbLlSJyifeKzUJldwAbTyp8NyeqWaBSNtsMnybplw7VoWZXj/gd5U/yuJcADbgr6E
 SsjZE09qXDF6ZRVtUuyQgD+5n5inIIAdqetEtDJulcndCspQBT5gRDhMoak4bGdOIjaSZn7zTic
 teosHaK7/ps2PA+anGOMBleqQcvbqSyV5O/vJ/SyaBBCH+7t5DW/KpnxfetvBmwFZNy53vgX+tK
 If8y5qND45IDsVJMs8r/jsvyBjBk5e1y0sxBBmdVrUcSQqKzXwuxlHLLwnY3AtBQQyXipwO/Xig
 WugF1CUELpYi3Da37iCG0NTciWe6KrztTL0fXW6yD7Dac/sJmOCxVXmEs0FkOv9lZ241K6TuEOq
 W3goWFcdPE4bgd0xAk258Mk7BiI2Xe6yWoXZlvSDbN+d00/soA4JQxRtCRXPa+4hqzmCFTJPKLX
 23m6tNh27OAiVN4SCFuXtsOYD9SU03Uzy1D5+QLXSuUdMJ3OLJN7uEUBUX9OOwn0Zy2nOJ7zpx3
 EI5E7JfGTZNmPKLstTw43Kg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a USB-C adapter, which maps all Superspeed lanes to DP is plugged
in, the USB support is disabled in the PHY. When the adapter is
unplugged and a different adapter with USB functionality is plugged in
afterwards, USB functionality is not restored as the USB controller
keeps the PHY enabled for the entire time.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 81aae3bc5747..7f26b74cb515 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -178,6 +178,7 @@ struct rk_udphy {
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
+	bool usb_in_use;
 
 	/* utilized for DP */
 	struct gpio_desc *sbu1_dc_gpio;
@@ -1015,6 +1016,10 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
+
 		udphy->phy_needs_reinit = false;
 	}
 
@@ -1278,6 +1283,7 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
@@ -1287,7 +1293,13 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 		return 0;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	if (ret)
+		return ret;
+
+	udphy->usb_in_use = true;
+
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1296,6 +1308,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->usb_in_use = false;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
@@ -1315,6 +1329,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
+	u8 old_mode;
 
 	/*
 	 * Ignore mux events not involving DP AltMode, because
@@ -1326,8 +1341,20 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	guard(mutex)(&udphy->mutex);
 
+	old_mode = udphy->mode;
+
 	rk_udphy_set_typec_state(udphy, state->mode);
 
+	/*
+	 * If the new mode includes USB but the old one didn't (e.g. leaving
+	 * DP-only), and the USB PHY was already initialized by the USB
+	 * controller, we need to power on the USB side now since no
+	 * subsequent phy_init call will come from the controller.
+	 */
+	if ((udphy->mode & UDPHY_MODE_USB) && !(old_mode & UDPHY_MODE_USB) &&
+	    udphy->usb_in_use && !udphy->hs)
+		return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+
 	return 0;
 }
 

-- 
2.53.0

