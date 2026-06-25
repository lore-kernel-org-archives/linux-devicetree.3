Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3992E3EFD10;
	Thu, 25 Jun 2026 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409190; cv=none; b=rKuETbxbVYDHJYiL/IRnVILAp3z9sO/Ah3uigsuYcEIQlUVyI0MW/Uxf1wqtEypWyKdx+AVRaXIFLdwNgRuN40dUMS21LvRjnyD+fAMAsXLTpl0dSRvulcGOUHtVmttDvy9WooeX/47wFwVlYtAmE1H6WPTl8OyZOQt9jE4esck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409190; c=relaxed/simple;
	bh=jL6EGfVAkl39iYFqWeesiDXL+z+JZr8ncJYla5iaccY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2jOplk70zx1/xCsqOrhBhl2jrYh7DSUgDaluJjVa3oBJVkLtZA7UOSM52JiWFT1S3G/mOVRlJDhzy+tE/HehDzSr7KfsL97j3cDiUlWR18o45RTXJUdxB8zXXvcYTjWub/C7fuakTt7FA6dQYlvAYF82wPtPBTAhtLDz2zfCo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cmpsjloB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cmpsjloB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=jL6EGfVAkl39iYFqWeesiDXL+z+JZr8ncJYla5iaccY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cmpsjloB85Bq/5X4nbXsu7zRlA2VUu5hke9W0vob2a+Nw4GNc9YrCi8SJVCvSu1Aq
	 uKheUSKwFawlFWS41ieBA8iTao3190ZhxgxD9bKDQfiylQipykttTMXZZkK1t3rajM
	 teJKWyK6i0bu8lVy6YZBAVIuHbWoB320SIKLwlqw4YJWe7ITWBpGmR84jMQUWONGMM
	 6EfqELQ/X2Tb40Ncy3vYiFB7ynhnV4Y69mLM/iZPwFMNB73t3rZzmhslPjkHjJp/AN
	 BufPLii76vEKSLmayEkELV4gn6+3Bn9rUgIYxgn5kAF6+2yTBrxhZuAUBtMED5d1Xe
	 D2dQPCcWUUNBQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 479B017E15D0;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1EEE748006B; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:53 +0200
Subject: [PATCH v7 26/27] phy: rockchip: usbdp: Add some extra debug
 messages
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-26-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jL6EGfVAkl39iYFqWeesiDXL+z+JZr8ncJYla5iaccY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9tPjAkqsm1AOaQV/ET9R5n/YEkXwQQ3B
 5+gw/DC2CBos4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaN5AP+gLP9xPzRMsDnaWPseA0gnHs4Pyigl08euTQwg6BFFY2rHG871VT9Od2nmQaq7+aEwG
 JUcBVIS137GkHEeDU+5S4RE+ylhKmcCsmUE8+s12Tn/ieIKMRsqXrLeVLHi+IINS3ccfu0x4iDO
 7N+ph7YO+c09QSWqEPQcNNc5qXDzNp5NiN59QGlTG6MReBBMMP3+vvCbv2R2zkmU0CSMXjU0CxJ
 aT8OdmZVB4b4BYCDt30HsLF9snI16dtUPtXkNcQzfj83Gcx1fJR+9tTT4Q2gYGOwBNOxYdJ7yLv
 LV/O4UnCR8zsoUljwb4GUjYfgqXAmkgd2AlUto0EhGm4MfZFPprZq0HZbxPQSIHz5nyOUTs0EXy
 Hq1S3rPD1ddL/6OUhS0XCnO2LQkp9XB/JENgBvmelkIFpIOjah0aPr8apX7x6HBVBQhVRSLdFpo
 /T+ICwgnf1Q1K/sr60DaeGnPfDNcdG9Z/3CUeFQa3vXreMVssRkWC4J1W0/tDwnkQqYtYFG+Cdj
 gkCCjSZYY+vnvMrR5nGxSKH0TFaub6BFfexfVMrIElM13XUgYBdP7gSRHYDbO3+gzV9yx9jyg1P
 u+Nq7lbOPoFF4vKKhe82xEkUVkGuEN6PvWN2GJhngu/mivhLILkexK1/sQMIa99FtoaRylySXpi
 43QZXTEhNo2UUSqTJbgA0Xw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fc788f2bf5fb..8c5d6b8595e2 100644
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
@@ -494,6 +495,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy *udphy, u8 disable)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	const struct rk_udphy_grf_reg *preg;
 
+	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));
+
 	preg = udphy->id ? &cfg->grfcfg.usb3otg1_cfg : &cfg->grfcfg.usb3otg0_cfg;
 	rk_udphy_grfreg_write(udphy->usbgrf, preg, disable);
 }
@@ -787,6 +790,10 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
+	dev_dbg(udphy->dev, "(re-)init PHY with USB=%s and DP=%s\n",
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_USB),
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_DP));
+
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
@@ -857,6 +864,8 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 {
 	int ret;
 
+	dev_dbg(udphy->dev, "enable PHY\n");
+
 	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
 	if (ret) {
 		dev_err(udphy->dev, "failed to enable clk\n");
@@ -875,6 +884,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 
 static void rk_udphy_disable(struct rk_udphy *udphy)
 {
+	dev_dbg(udphy->dev, "disable PHY\n");
 	clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
 	rk_udphy_reset_assert_all(udphy);
 }

-- 
2.53.0

