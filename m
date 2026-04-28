Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690947885F;
	Tue, 28 Apr 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392851; cv=none; b=sYYopOhQNnlW2BeOSDS5zJTwHQ+GKt4JZeLwScRqsXaZNjG7NGD372hB6qjuVFlKCIDGDR7z0OHUMGogOABroGGUoN/ZvKeJu1i5JVhn84CxpX2rZCE2zcy5WjY2LXst0N1Ii0fFFHz2WpoSi/MVt7YW7X5j5trWwTuIAB/4ZRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392851; c=relaxed/simple;
	bh=R0XOPqv8eiGOecv3syiCrtkuFgE7i0W5yOkkzmXW81o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnppT6netG6mSlkebRgh2WhittiH4wDdzdyyEOFYBtltpPl2MIKkiWS8irXRmzyNMuMdmqTlbpVkpkgXYmpub9wuaK3CmUOrz88NJqNWXRG6kZiMT/q7IW3Q0y6NKlHsAwk/semb1BJOU25TnB7nIQMJqNPNIwm4eDlUklDgeqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G/h+70jd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G/h+70jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=R0XOPqv8eiGOecv3syiCrtkuFgE7i0W5yOkkzmXW81o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G/h+70jdn6Ul1cBNr1qYdBgAsoVur3WzJqhtJRImIhyZJ5tT6+V5JMj9Qg1O7M560
	 CFj5PVla0gedIYVD4d51xw+JBwjwPlwoAesP7eYrnSObHZTF0LRHAC6Y8irlE0sxMY
	 H3WLk1qQxcqblhfBLChv7IMU9P8QQUuX4rbkN+nTU0tKrO4ySgShlBa5N/S+yS1hup
	 LN6CBqpwBY8he5HA7Gh8Wvu+N+1OKZqsuK7VGbnrh9o5lkZW/loCsTkqELCYEkLS13
	 DWzowdyoukdJBoRMA6wNMidAJicttiC2SyMJuGseGx+EMlJj1yhXPw95AxxKL+vsCx
	 ELcuUSkAHfPNg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40A0017E1584;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8E8FB48004E; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:49 +0200
Subject: [PATCH v4 10/16] phy: rockchip: usbdp: Cleanup DP lane selection
 function
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-10-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=R0XOPqv8eiGOecv3syiCrtkuFgE7i0W5yOkkzmXW81o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MnMoM2ETRknEAFMzdGLUCkYpjQ0JeJnU
 cGBq/Rlx/v0CIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qaMSAP/1v8tDrHW5gPY6ZZd1M8Iw5rOtpMS8VAr4znEpcRNzlJpToFT2yIkzqUnj4TqMVRRlr
 RllfdRzVEIVByqTF1OvSlP3nFGAvZvlIT35uQvF6r/wh1W+2VlWCTJhYQh7xZmAGQ9yPpY3BQcF
 i5FVxqwn9VxLGD1UHQnnY8TgyaW1sYTJS7SMSAHHGAeye04ma1AX8JhTgRQeOSB04/4gEHsyBbj
 utVrMPxkRUlwX4dyecx8JnZdJmfmGtv24OgUc6gD1Liml/hNgGN90WOawy5K0/JHW3+1Gb78ZGy
 o7X/79YvjFisc9tqzmiU4/IrTr8ywdSr6sZMkKZ2iAnn2jCcQ+oPF0e0ps1rRkLIKX0rmZSZD39
 RaLtrdW1F+x6c+5/EGNBrEdQIU/PXJjZRfOnGXcW6yjkRHLLZsptayCd6pXnd9+8Ts+GAuAvhrs
 h455Pjz2pu8H/b5+Z90DGjviG2Zvy/pRY39R6a7cXEro4BzG0QeMDuscRtsN6Ihb0rmq22I7XRF
 Ttqf/u43eeVRB0+PmlUtuIl6Ps9++86ot8FmaxVQTNUjnFryijO/VROwaWoCU5vj4O53CVDueYT
 OBbbtGmuRK/6sOQkdWtxZTo4POTD9oEm+GZw9kGBg8MpGlBkNsvhzrwnU1sIREy6Cc6dbHh+Q+S
 In8ic3A/GgNG+H5eG45Y1GQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
logic.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1bfc365e2b2c..beab20e4c512 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -550,30 +550,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
 static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-	u32 value = 0;
-
-	switch (udphy->dp_lanes) {
-	case 4:
-		value |= 3 << udphy->dp_lane_sel[3] * 2;
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
-		fallthrough;
-
-	case 2:
-		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		fallthrough;
+	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
+	int i;
 
-	case 1:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
-		break;
+	for (i = 0; i < udphy->dp_lanes; i++)
+		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
 
-	default:
-		break;
-	}
+	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
+	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
 
-	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
-		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
-		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
-		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
+	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
 }
 
 static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)

-- 
2.53.0

