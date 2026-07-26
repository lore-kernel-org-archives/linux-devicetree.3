Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD302931D5;
	Sun, 26 Jul 2026 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785077746; cv=none; b=dGAjYn2UC6M5Jfcg/wcHM4AvpJiIS4D+HP69K9YQbotPxwpAtIfgKVdydkS8D+aHwW/wWoN1S35Yr5S+WLLz7koya47JK/S6eA+BYBwfbEPCc6M8EKXDFc3HHqMQ84vDzEtpVheLb90p5hUdGqVWiDaFECd1FvrUuDbRHQDWBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785077746; c=relaxed/simple;
	bh=AhRTLnCcwo6Mxg5rxROPb+PhKIVmCT4avAH9ngSVIfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRy3xe72b8P3bQL4IURAVQnuwk5vPvcfqOkPCmZ0C1IvxDNUgLHwa5oeVC3AViim5WkFmiNV2Izt4+lUlY+gka7Bb6EJ81EKFZmvYtgFHqGU8xfhArYQCY12vmaPvyauptn3QsPwWDsvglzc+hcU11NxWMTA6hg+iPZWYXQYBeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKHYPPtq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKHYPPtq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F33AC2BCF6;
	Sun, 26 Jul 2026 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785077746;
	bh=AhRTLnCcwo6Mxg5rxROPb+PhKIVmCT4avAH9ngSVIfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OKHYPPtqw8C+Eoebl5eQLaq/mx7M70v9x1xoRHbH690G6zRCla9eTihVrl+8KW7aX
	 DbFworl7mT9Wh16GVcElaC00xS9JKPxoyPx/AftwEMEzIElZpahEbAUtweLQ4uRt0s
	 1jC20zNj6Uj4roMzjFvnqy6jsqaPPUJQjoSJPV+K3xtA8Ks0ITkqacpGp2X9rb8/yC
	 fP06y+7hh3wB9OpSmueb8Rgnp2VY7FF/8L6RD180GtDJGCsoeMRrpdWu4C53UOOZDv
	 22BtVrYFNOXjTrDwCfHDDYKA8jPGkAWyeVSdLN4aCpIfkjyt+EcGpEMAP//5jvMW3Y
	 zxW3Zd1dWNfWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAE0C53200;
	Sun, 26 Jul 2026 14:55:46 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Sun, 26 Jul 2026 22:55:45 +0800
Subject: [PATCH v2 2/4] phy: rockchip-samsung-dcphy: factor MIPI D-PHY
 power on/off into helpers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-dcphy-rx-v1-v2-2-cf9cc34a412a@gmail.com>
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
In-Reply-To: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785077744; l=2365;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=4GcNX0JppuDhi+PdI+Mfy3wrN0LmkfCuqWcPPnXARtM=;
 b=7RTRyehFkYV6XDnAq1vZCWfliIir2dDF6JR+64MZh8F5RlFqylgM2AClZEZ2AlJz2rgtvDzBx
 goTqpE8OBPPDIQ5x3sT/qO9Tq5A5vaCthFli7QwdKlKoKFcfUhTZkdQ
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
Reply-To: jason98166@gmail.com

From: Jason Yang <jason98166@gmail.com>

To prepare for adding a receiver (CSI) direction next to the existing
transmitter (DSI) one, rename the transmitter power-on helper to
samsung_mipi_dphy_tx_power_on() and gather its teardown into a new
samsung_mipi_dphy_tx_power_off(), so both directions can later be
powered on and off through symmetric helpers.

No functional change intended.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index cbd780556da8..d0d77421bd4b 100644
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
@@ -1368,7 +1376,7 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_power_on(samsung);
+		return samsung_mipi_dphy_tx_power_on(samsung);
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
@@ -1383,16 +1391,11 @@ static int samsung_mipi_dcphy_power_off(struct phy *phy)
 
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_lane_disable(samsung);
-		break;
+		return samsung_mipi_dphy_tx_power_off(samsung);
 	default:
 		/* CPHY part to be implemented later */
 		return -EOPNOTSUPP;
 	}
-
-	samsung_mipi_dcphy_pll_disable(samsung);
-
-	return 0;
 }
 
 static int

-- 
2.43.0


