Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6373EF66B;
	Thu, 25 Jun 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409191; cv=none; b=LKH1tN+MPheIzk2n2Ye/PtVe32lDyW7GCpcEqnvqHh/3JuLSUK3m1eFV4LtgQllsxfajaX2K7/G89gSggNZynjeXYp11s1crvQsd2R1xnO5h58hCO2wn8JxuHwfytFQ+It0rkeB0q66g96Ezze+2eUj9VrrzlFIvYAKfFdGSePk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409191; c=relaxed/simple;
	bh=jM/rv0TrZditn8+XllQbfv2J0SjealG0IiArYFUISXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/6kLONGBinTShSRfMyVPyoofRWY14zjbSKnmjaiExJfN017A9Cg51F6EIUSxDU1huszrFVNnW3lg8Tl4a7PuFO/VFJtinDL6kktn9erzd4jdSlI57h/l2HYVkmgkRMsTpqWodHPbYl8SHFAC3PQtoL1L4KJvMghJxTiNRngCG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pKoRTwbe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pKoRTwbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=jM/rv0TrZditn8+XllQbfv2J0SjealG0IiArYFUISXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pKoRTwbeYu1ICmTC2KcKabgKfFN+P9UsrjgdV7BwX8oMMCRf2HyKciDuNfUsLuCRx
	 RD67gZDkm1dhHQRNtQ0Kfu931EIbgQIpFenZoxjBb4kOudbck61MuKTUg4pNKi6e0K
	 yukfr+kqT1Pz9HaA9YDWbU8oJObuYgOEMOgII+KQ5t1d8U/m7e7rbIRHHxQaPVwB5k
	 CPbKif8lkJKTzO4BrfxcJvfllf6CA0RS1EFiv280zF5iI2INMieors5EjOodxqXg9a
	 LHm+3KULHbysL6tsyugsPX2thZvLdO7gGbgeXjzYqYKqzJCbP75hnA/tjNBrb8sYJE
	 2JLmHniQcvTCg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC6EF17E1562;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 10D4A480055; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:43 +0200
Subject: [PATCH v7 16/27] phy: rockchip: usbdp: Cleanup DP lane selection
 function
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-16-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jM/rv0TrZditn8+XllQbfv2J0SjealG0IiArYFUISXQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9sNbjp+3MU/e0kCnk/IQWCfe1zizoLCn
 aoReROrSGTfoIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaqWsP/1DsiVxhHgSEVd6lUi0fqiMwSqm46SfAndayK4iFaqagGfcp2Mgv2O0V24jKJNZb15a
 8R+vDsa6ExF4kgEIJPlqwcmLky5FEXQERvJASDnKFBGxbvQymyoV6OcNyxUbf3ZSJvA7LE+F6G7
 9duXytZnuWeHXwOvKZ0NbA8DYZqpsqyj8IerzTrzENHow/iA6LFmTbWIaQQVK7uxGllvKgEebrz
 JGu5bsYBu+tOKI77JXdOyuzNosptrhIwPP/hjmhb8T5Uruq+YUfgWM8UlLVjn5o7pKwfj/Fwn2a
 4hirZxqFPD+iDiRWN2pgHR1uLCkpxQxNhW9nF1f2mCVhQW7BgXvonjSoUxotjiYN4GvA40wqsk3
 4D/6p9z+oJHe3yWU7G/FaCH8SphnleeS1/bLKuhxnnzEwlj3XQhivLlLJ2dSXmb/oys1m5WL5o0
 IurJDPwA5sbzmTJA/mgG1IsrWNIEKGl+Bw9IuXtovmgYASbbLvD2URL1M3V5XQzMBje1QfXRIfn
 SKKv8MS9NZmR3P7BdG66Wna3JvQHYxfFZxRSvuOZ7KzlSLHmf6NK8yEl2eRG8jT/LLQYG2cxVf/
 O0OSBym2xpiFYm+jl7zLYPmLhHt7skC6F7jjHxGdgKgch3IL6K/CDsAhxghbVKQ7ZwZN/7IUrvg
 18WDlIC7VyfYMJGz+kQEw4g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
logic.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1bae8172d1fe..71ee2f4faf0b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -553,30 +553,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
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

