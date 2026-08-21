Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522248EBF3;
	Fri, 21 Aug 2026 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313756; cv=none; b=K2vK1BWltGOtjoRqX5CJzRUvMCPYaWbSvQxH3wC6wFEOHBgSguqRHOHOOxotubcKpOOjaNwHUq3dMycEZdwzuLyA9h2DggSXWAmfq4orL8b1Px5QLKMjcjjdkIOPxqJwljpgDcyjW1fA7wPy6rXVrGmIyebuznZNLJxJSVUrYIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313756; c=relaxed/simple;
	bh=TnI1p+P/50A7HWM9Y8HyRkngg4ldec9pgu0d66QJY5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxHB8Z8etT8omw+KqE/mFBCQmQCGsMWimnj7SEWlpGBT1+23xGABwXaXvhAJ/bkmU/CtztM/NpTig7fJP2+bLSD+xvzHZzc8kyKhcviCVxr8GmHdT5dhvzqyaq2Ojfy1VWPA1p+DUAKaMKmict6nG4DIdlpFiOwWspCHVzRcQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TroQY1et; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TroQY1et"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5A0AC2BCFF;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787313755;
	bh=TnI1p+P/50A7HWM9Y8HyRkngg4ldec9pgu0d66QJY5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TroQY1etFEyAwtSBl2bnHKcPIyWCaSr94DsOSVADzv9hdB1dFykOsP7dpp1oSgljr
	 /41jAxzMxhQav2Pp7GF93hS+bK8Ys59TOPfnVQb/s8cjQV33X3YtrE808HV3QaA8ZV
	 6i6rgrQCg/4A6RpOLBix2Hhq60uGjDloZvPvpvBzTpczayO6MGN8oCUKN3Q23EAh1a
	 kvkF+JryigXrpFKxQz9PKlcIsCRLZ10nSinBNv59hQ4iMKRRIwtwbTpfKZdP0pfENr
	 zGOuP1MyCXkBoYMGwDBgvSabq5A5EfUlMM09ofX/WwjRHE0/sbxvf22Ef/hdUj90qw
	 LGoGUbQRUgZBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AA8C5DF87;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Fri, 21 Aug 2026 20:02:33 +0800
Subject: [PATCH v4 5/7] phy: rockchip-samsung-dcphy: Factor the transmitter
 teardown into a helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-dcphy-rx-v1-v4-5-f1797634233d@gmail.com>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
In-Reply-To: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787313753; l=2267;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=H9C3dBUKHCEqAqQXc3SD6EcAQzNiujpzdtKGk2VKgQE=;
 b=8OIV6ztcFUOG7ZAoX7MY1eISvfkc4VkrqMa6/7vGpV8pyY1fPXRP+0w9sUvq3clP/0n8GrXdG
 gtvDeMyM04IBjhrl25Y471zayq7Zy61zpJBQZYAB+Si2HHJHvA6nygk
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
Reply-To: jason98166@gmail.com

From: Jason Yang <jason98166@gmail.com>

The transmitter's power-on path is in samsung_mipi_dphy_tx_power_on(),
but the power_off callback still does the teardown itself.

Move the teardown into samsung_mipi_dphy_tx_power_off(), so that
power-on and power-off are a matching pair. Both callbacks then have a
type switch whose arms are plain returns. Turn each into an early guard
for the not yet supported C-PHY and drop the unreachable trailing
return.

No functional change intended.

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 31 ++++++++++-------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index f58907dec733..5d9d44a1d6a2 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1361,37 +1361,34 @@ static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
 	return 0;
 }
 
+static int samsung_mipi_dphy_tx_power_off(struct samsung_mipi_dcphy *samsung)
+{
+	samsung_mipi_dphy_tx_lane_disable(samsung);
+	samsung_mipi_dcphy_pll_disable(samsung);
+
+	return 0;
+}
+
 static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_tx_power_on(samsung);
-	default:
-		/* CPHY part to be implemented later */
+	/* CPHY part to be implemented later */
+	if (samsung->type != PHY_TYPE_DPHY)
 		return -EOPNOTSUPP;
-	}
 
-	return 0;
+	return samsung_mipi_dphy_tx_power_on(samsung);
 }
 
 static int samsung_mipi_dcphy_tx_power_off(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		samsung_mipi_dphy_tx_lane_disable(samsung);
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


