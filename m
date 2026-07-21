Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6A37B030;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630122; cv=none; b=msOoGAGxStZ8YGk9kylMzUbrFhtl+rrB8syVFsOCns38jMpIpw13BNVeLL4QwmG3aaC0RIctImy7p2Ebptf+TEmuTWQ+JHLwnKmz746Dbtu+vUe3uZ9HzGm42rBUtXFwolgOTR040rKCmgPJ8hiTU1K4qVld+2yj413flg1FRf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630122; c=relaxed/simple;
	bh=AhRTLnCcwo6Mxg5rxROPb+PhKIVmCT4avAH9ngSVIfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QkAzPtjEwBpiKjhAsxHZjaC1iVwKrBv2ApgMhN82Ryh+W6aDKGWJy+XMB1kFLSR7HIuHeizaRCC2CixxUGRygB/eCBPyc7xlzdbep3Z4Cz1pZTFln4Hgk3H4KCX6qQZgaQRcrwmXemL1eLJKa2qZjIE0IEHSwWujpXz3nGdhqwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcXaowgV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcXaowgV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84B51C2BCFB;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784630122;
	bh=AhRTLnCcwo6Mxg5rxROPb+PhKIVmCT4avAH9ngSVIfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lcXaowgVVDEmx1GchFtINXI6E6M7xDabymranzZPjF81F0I4h+2PUyfn81YjInh6r
	 IwkGKjajFdomMOsOiCY0reCctIelfPAPNV0WagBV9Fr1dJ5ai5x1fUufMzP7GhPJIn
	 FOy9xEXkP6CvqnnqfUIorRyJRJv5UZv+AIzDb2LAEN2CjJUyeFIT6IX0n5Bl0UkowH
	 KfiAFPFwpZGkdMTR6GimFawNKv5wHfhNJ5HF8lxNhb5kDqh+qm1pbQZP7reN70nydY
	 IQ6y/faq1PvGBMvNYF74fVOmrQPWfLmM0y80C8860ENPYV6FtuyoK0/Wd/PeZBhNei
	 KZ9JD5ahiVkiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E5CC44529;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Tue, 21 Jul 2026 18:35:20 +0800
Subject: [PATCH 2/4] phy: rockchip-samsung-dcphy: factor MIPI D-PHY power
 on/off into helpers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dcphy-rx-v1-v1-2-4fc83c0ccac9@gmail.com>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
In-Reply-To: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784630121; l=2365;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=4GcNX0JppuDhi+PdI+Mfy3wrN0LmkfCuqWcPPnXARtM=;
 b=WyxM8NMEq4WZ7Ic0mfu0q9LQ7+49eB9EWcUg16azkFqHpHAFyZA/o9RvVzdZ+BT8wBxYDPhV+
 oG2R5dmESqPClHCersw+Wwrvfe7joPZxI6oS5eJSMXh5jKL235KWGVR
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


