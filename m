Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490793D0BE9;
	Mon, 10 Aug 2026 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363810; cv=none; b=fVsZDyDlocoLHMApspYxQevdAkd3ZR92EcYWGw64KVhgUjaFGc8Z8zsrULMVbyMgp/vQeNiBDbG2IHY+kVqOKJYj9WbSqW15b6nq3FGxPjOBriL+bBPbAIdw2zjGj72YgAG4VEyuwzXIn85RtA4btq1XKUP7FlmOZc7cQwb64NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363810; c=relaxed/simple;
	bh=4AhIU7paKP+4zIyqwRVCjFlL8baFK0VWf5Xqf9HLh0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7NN3ntUiuLNPLRrxbUuq2Z2l14oImSFl2hIvXIsb9yC6o/wNRna4Zdrp+5PPKlNenWDN96u5G2dZOpy1oZibp8IFGUHJZdJZjTXXR5wWCee4FpZnw8fJBrkjcuPiiLZV3ngZ6IB3MbpLtCCBtg7TSP/Onkbbgokkx76uiPhXGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gt/QYLDq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gt/QYLDq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AE93C2BCFD;
	Mon, 10 Aug 2026 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786363810;
	bh=4AhIU7paKP+4zIyqwRVCjFlL8baFK0VWf5Xqf9HLh0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gt/QYLDq331jEv1E/do6FmNzo9bzHI9rLNsXg76UjbDZfV6+HFgVd361x61Do51L9
	 zr4F1uVmmCD4wyvnquq43zKfPM6F2gYQbSlYCTtv3ydITF75k83upV91fgenpaSP5P
	 yMztYeybrRrKlrNTFDSZUF7dQ+SQHyx6cQWyFQtLOjWrlzEC1bIwL0S3B+3B0ItqVR
	 Q1bKBQnLeB1O+cdmU9s3xYavlvfWfiaDpNOBnntimtAnWm0DHQV5eFjx5fDjLKpc9m
	 Qw983q265c1GFyhVYN1kZ6HRCe7mvn/8NaZQ+6c/WNHmU6y6PuX5D+0SlOwWgwliO+
	 c654AkI/wAxgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1824C5B569;
	Mon, 10 Aug 2026 12:10:09 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:10:11 +0800
Subject: [PATCH v3 3/5] phy: rockchip-samsung-dcphy: factor MIPI D-PHY
 power on/off into helpers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-dcphy-rx-v1-v3-3-a2d25c29adfc@gmail.com>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
In-Reply-To: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786363808; l=2833;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=KTWIu7JKaaQ7XBkf3u7iorhkMyVw5yi2Dq6JGKsEO8E=;
 b=XG6qusYZ28b7SLCI4va8Ob/qRskpAUJSaaJPh1jpmqAmt+ZStqyTC5lbWy1I6AjsbQcV4Ikly
 RF6x7wVog+2BLmGkqjBfYGiymht9evfs5pP7QpT2oJr+37FZWQizWqH
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
Reply-To: jason98166@gmail.com

From: Jason Yang <jason98166@gmail.com>

To prepare for adding a receiver (CSI) PHY next to the existing
transmitter (DSI) one, rename the transmitter power-on helper to
samsung_mipi_dphy_tx_power_on() and gather its teardown into a new
samsung_mipi_dphy_tx_power_off(), so transmitter and receiver can
later be powered on and off through symmetric helpers.

With both arms of the type switch reduced to plain returns, turn it
into an early guard for the not yet supported C-PHY and drop the
unreachable trailing return.

No functional change intended.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-fable-5
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 33 +++++++++++------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index cbd780556da8..99ca0e1cc574 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1332,7 +1332,7 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MD3_TIME_CON4, 0x1f4);
 }
 
-static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
+static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
 {
 	int ret;
 
@@ -1358,6 +1358,14 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	return 0;
 }
 
+static int samsung_mipi_dphy_tx_power_off(struct samsung_mipi_dcphy *samsung)
+{
+	samsung_mipi_dphy_lane_disable(samsung);
+	samsung_mipi_dcphy_pll_disable(samsung);
+
+	return 0;
+}
+
 static int samsung_mipi_dcphy_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
@@ -1366,33 +1374,22 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 	udelay(1);
 	reset_control_deassert(samsung->apb_rst);
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_power_on(samsung);
-	default:
-		/* CPHY part to be implemented later */
+	/* CPHY part to be implemented later */
+	if (samsung->type != PHY_TYPE_DPHY)
 		return -EOPNOTSUPP;
-	}
 
-	return 0;
+	return samsung_mipi_dphy_tx_power_on(samsung);
 }
 
 static int samsung_mipi_dcphy_power_off(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_lane_disable(samsung);
-		break;
-	default:
-		/* CPHY part to be implemented later */
+	/* CPHY part to be implemented later */
+	if (samsung->type != PHY_TYPE_DPHY)
 		return -EOPNOTSUPP;
-	}
 
-	samsung_mipi_dcphy_pll_disable(samsung);
-
-	return 0;
+	return samsung_mipi_dphy_tx_power_off(samsung);
 }
 
 static int

-- 
2.43.0


