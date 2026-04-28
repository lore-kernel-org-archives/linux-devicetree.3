Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9D47AF4D;
	Tue, 28 Apr 2026 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392856; cv=none; b=hRsC75FbLVd3bnpdo52+xRdOmhziGiAnSJtiZnGYiVCFr1DVicVYu40VGKYLjKKoEJ/+cC+8+eqpApbja5sikk6KuqllJvUMhghZJlnbGroEL844SeQKtcgW8UB0M9MGzsTImwVKHzc1Bg4BgynTsT+uzCIsmqtfWDpcUsZNfSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392856; c=relaxed/simple;
	bh=j+6x+8s6738EmRpRIupyM/POjV2O++ynEfGyro+dtXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLzL3J8P2rIimrGLOHcORJsSF+GimOsvouXXrAOfq05l4FWPJprnLAxhS7Pgqe6If4GGBOq+jN0grQrBsg9hXVgd3bNWSRvlnKhFIwX3gFTX8eRpU8OHx7YI9NsQztf+E6vJmEQf4nuAuYZ/a6dbbrkwcUc6gsTGMPRGRN5oMHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EIqiwl1j; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EIqiwl1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=j+6x+8s6738EmRpRIupyM/POjV2O++ynEfGyro+dtXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EIqiwl1j+qjXrY/cdmeB4UyzP/SG4u7auHEUNCIY9elZhBrVZ8pVbZmk5DZUi21cq
	 /v8UJ3ks69CHlBW9D3uTmfBU9cl60UugLeBY6V03HQfYRQggP8XbEgVVT8gXoN7odd
	 Sp4iHQfLpPDQwq//MHxw63i1nMasqxMHgP7oie25RAz3R7BWd5VZfAY3vye6SDWx2F
	 gov5EUQc40cwnff3J6RyOPnAYQB/syyCXMtj99SeuLnhK4OncWdCuGRW2BW5YR+ff4
	 /F/LA5okO8eFAH612/8fHlQzz7Jzyw6qIEqva4LCtRH87XA4nWiA0ZneH55mff41dp
	 aGbiKsibo0ACw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7302C17E15A8;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 96C2D480064; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:54 +0200
Subject: [PATCH v4 15/16] phy: rockchip: usbdp: Factor out lane_mux_sel
 setup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-15-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4429;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=j+6x+8s6738EmRpRIupyM/POjV2O++ynEfGyro+dtXo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MnrsnIhG01blRm2ATakQyUc52Dx9pAgz
 7TkpQs9cQvKM4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qaxisQAIxL5/YGANWVf/5yyKZ7fYeBYRSuc9LaEmSuR/XQfrgP/ExLHMfB42z1zvwA1jQ54RU
 tCBiEyDqv8EPk59zweDgoLTfd6lxiB33PKIU0vSD4GNJ0YDrJx2ad9ye4C58Y1n647te/lTlUPL
 nXXM49NZySt9kPf7/VNsjgFQ4hddtqt62Vkz/z4z6X3HB0s0GAm10c37lmok586eAN8NW6umwP9
 xZ7nbk2oZTWOOSttpT1MP+vmLynURknWvW3qDW54scJuVj9NGrjRIPhfE16L/0WFMeOEdY4cz1J
 Jp7TZceiscRjLUCQi/EqWoegoybQMOrDu5jDtKGvwFPIYK5N7hFy/6iO5CGgjvdaGVhmYgf5sV7
 hJ3YUC6mitQVQUX0wIh90WOvGbNrvIXmdlEcE8BlKZOySK4EbuFx9uq9DZ9qulvMPzQ5If+XWPQ
 WUmUpAEzu+pu6lXJpSp2jxGDsYWoqJ3vtiH9x6oXB5ljtkRyJjDALswtWQVfthxPIjhGwbwEzGm
 EAXS3RjJtozsni22NAaHu9gbqWauQqWDcCcsi74O5cDddS3/0eO600SzuFijj9N9WJpxLOrJPf9
 sD6yvQ4W/Cu4fFnhj7iva5VAZaT8YPDjUTuA8sfirI/ukbcxsctE8vG7HdyQ0Uuh5+w3KSSv8MB
 v3CdrM0+wnrCUVkljNJ07lQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Avoid describing the USB+DP lane_mux_sel logic twice by introducing
a helper function to reduce code duplication.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 81 +++++++++++++++----------------
 1 file changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 80fe5993c6c7..17637d92cf9b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -586,6 +586,42 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	udphy->mode = mode;
 }
 
+static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
+{
+	u8 mode;
+
+	switch (state) {
+	case TYPEC_DP_STATE_C:
+	case TYPEC_DP_STATE_E:
+		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
+		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
+		mode = UDPHY_MODE_DP;
+		udphy->dp_lanes = 4;
+		break;
+
+	case TYPEC_DP_STATE_D:
+	default:
+		if (udphy->flip) {
+			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
+			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
+			udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
+			udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
+		} else {
+			udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
+			udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
+			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
+			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
+		}
+		mode = UDPHY_MODE_DP_USB;
+		udphy->dp_lanes = 2;
+		break;
+	}
+
+	rk_udphy_mode_set(udphy, mode);
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -593,10 +629,6 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		udphy->dp_lane_sel[1] = 1;
 		udphy->dp_lane_sel[2] = 3;
 		udphy->dp_lane_sel[3] = 2;
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
 		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_INVERT;
 		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_INVERT;
 		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 1);
@@ -606,18 +638,14 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		udphy->dp_lane_sel[1] = 3;
 		udphy->dp_lane_sel[2] = 1;
 		udphy->dp_lane_sel[3] = 0;
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_NORMAL;
 		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_NORMAL;
 		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
-	udphy->dp_lanes = 2;
+	/* default to USB3 + DP as 4 lane USB is not supported */
+	rk_udphy_set_typec_state(udphy, TYPEC_DP_STATE_D);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1316,42 +1344,13 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
-	u8 mode;
 
 	mutex_lock(&udphy->mutex);
 
-	switch (state->mode) {
-	case TYPEC_DP_STATE_C:
-	case TYPEC_DP_STATE_E:
-		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		mode = UDPHY_MODE_DP;
-		udphy->dp_lanes = 4;
-		break;
-
-	case TYPEC_DP_STATE_D:
-	default:
-		if (udphy->flip) {
-			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
-			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
-			udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
-			udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
-		} else {
-			udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
-			udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
-			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
-			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		}
-		mode = UDPHY_MODE_DP_USB;
-		udphy->dp_lanes = 2;
-		break;
-	}
-
-	rk_udphy_mode_set(udphy, mode);
+	rk_udphy_set_typec_state(udphy, state->mode);
 
 	mutex_unlock(&udphy->mutex);
+
 	return 0;
 }
 

-- 
2.53.0

