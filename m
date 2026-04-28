Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9E7478868;
	Tue, 28 Apr 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392850; cv=none; b=Cbaf6UKiAXLywk7P4BP6h+CB673IPLlEEPT+pDjxbNAdBeFXBlHiV6EaDPxUgUYRPUCRIrcAJzSDT2Vz9iYkwt8/o1T6rBrGiDlRASuhUe6satzHPJ3fMBgcfu22RnRDm/OVS1p/n7Lzye82PpBDyQe4eqz5XS3SmWMdh2Eb1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392850; c=relaxed/simple;
	bh=F+/X9KX/MbPYEGdlL8kpGC62tIqMCkZjsXpPGb1baWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIqV4Xnh2fw+C4okROpSdL4c9G5Svr8zjNavq6JvQ9QE7y+kJD1wrUwA46WsvJAXR387Gb4D84+HqcRLaDzdlwV1Nlx3K5NOQIBiKndqHDYJJrK+V59IfxkEkzVJZb2rPk3lZvODFDlq4ApyI+zCTXGpLkk09FAg18ClNGnJUic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cwk5+PMp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cwk5+PMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=F+/X9KX/MbPYEGdlL8kpGC62tIqMCkZjsXpPGb1baWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cwk5+PMpOR9B73PuUr6E5MisgAfno/toLQMjIEqk9MN5oRYF24GhmZI1ZK8DMzxl8
	 bHarRyuSlw0I5Q0aNdmZLieRKBMgkcFCrYWb9DE6BTB724VF6cL4tKNDZvL+uOnrC9
	 rKe+YmIdkzV2syf1X1X4XthRFCTkARS0d23ELC1THmL1hBeJfItw88GWrdLO+o2hmT
	 smw49iRL86QfmHFkVFiEwMUkjEko5VCY3k+i/kX0mrivzJLnAzTWGhHHqkJtGVlyhF
	 8j9r+c2RXq+fbfI1wK/Txf52qE0lBkBRnDODtIqvvsNWqd1mO84pgqXFrn9499Ftxd
	 yJqcBZUdClgiw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C94617E157E;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 89A2D48003D; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:46 +0200
Subject: [PATCH v4 07/16] phy: rockchip: usbdp: Support single-lane DP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-7-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5209;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=b37g3sREdBGDY7tFDKeV5U/vMOZkhC2Y7QMIV7WXbE0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MnQ2wLMLAm/FnDWS23LSIY9nJ9TCqSdY
 6z/yqiCC1chC4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qas+wQAJt6s6I3BRb6AULYaK7NWIDjQ3mLl68u/xaDeOEn3EfQ2hUo7MIiXANODzw83HWd+Mp
 aRYTXmOmK6NginPw+R5pZpx6O2Y959nFS9Q0/Yl+lYtOg1/k79n5ocypZU96DnJYq7fUL7E2FF8
 I32k029YUUmDN1gf7yT8OxBPiPpaEN6BBfubVZLpgN4kcuYQ122kpKKfpfLBOehjHjyIhyl04Eh
 O3bDQ9Q3Zb2N2a7fyuJhz1XUsjiZpfaRqY2tvXejIWKDRYAy99KkrAhUIUvYAisEeAvzxLTBo3A
 P7IFxdKZAfdo5hUC1Zschxdd2yN/D+CrkBDJgiGBWi3m9rjr2rnNW3GC9XOLrISXFvI8j9URf+h
 vNTrkuj7quceTG+lNQ25ymQeJLpQlLxf2gQS5mkIg5SexNSE9TRQHt/ifAiZBrWHI5YzVVP2GbV
 EWdX4B9r/JBYDNZSLAKm/Lugxxk+AxOGEiQFI+nuBKs6eLE+D/hipMNmt3kNuYBRSiFw3QdS6ik
 fS6KFbNRbTRn8iO/PBW3vHEvJHKqeuW/2OUNxDvNc4ItI3cOeefDZ76I3EJZCVxtUqqdxDdjG8K
 Dh5QAdaFzNkUXIk70si/omihmJtAw+wGAwK98U+kx9FCGEBhxYrFFeZSbE22xC46amjNWyM8AA7
 nyJy5HYGAOldJC17/kScrzg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Zhang Yubing <yubing.zhang@rock-chips.com>

Implement support for using just a single DisplayPort line.

Signed-off-by: Zhang Yubing <yubing.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 61 +++++++++++++------------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index febc148a754e..bf8394174294 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -193,6 +193,7 @@ struct rk_udphy {
 	int id;
 
 	bool dp_in_use;
+	int dp_lanes;
 
 	/* PHY const config */
 	const struct rk_udphy_cfg *cfgs;
@@ -537,6 +538,13 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * <0 1>                  dpln0         dpln1       usbrx         usbtx
  * <2 3>                  usbrx         usbtx       dpln0         dpln1
  * ---------------------------------------------------------------------------
+ * if 1 lane for dp function, 2 lane for usb function, define rockchip,dp-lane-mux = <x>;
+ * sample as follow:
+ * ---------------------------------------------------------------------------
+ *                        B11-B10       A2-A3       A11-A10       B2-B3
+ * rockchip,dp-lane-mux   ln0(tx/rx)    ln1(tx)     ln2(tx/rx)    ln3(tx)
+ * <0>                    dpln0         \           usbrx         usbtx
+ * ---------------------------------------------------------------------------
  */
 
 static void rk_udphy_dplane_select(struct rk_udphy *udphy)
@@ -544,18 +552,18 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
 
-	switch (udphy->mode) {
-	case UDPHY_MODE_DP:
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
+	switch (udphy->dp_lanes) {
+	case 4:
 		value |= 3 << udphy->dp_lane_sel[3] * 2;
+		value |= 2 << udphy->dp_lane_sel[2] * 2;
 		fallthrough;
 
-	case UDPHY_MODE_DP_USB:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
+	case 2:
 		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		break;
+		fallthrough;
 
-	case UDPHY_MODE_USB:
+	case 1:
+		value |= 0 << udphy->dp_lane_sel[0] * 2;
 		break;
 
 	default:
@@ -568,28 +576,6 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static int rk_udphy_dplane_get(struct rk_udphy *udphy)
-{
-	int dp_lanes;
-
-	switch (udphy->mode) {
-	case UDPHY_MODE_DP:
-		dp_lanes = 4;
-		break;
-
-	case UDPHY_MODE_DP_USB:
-		dp_lanes = 2;
-		break;
-
-	case UDPHY_MODE_USB:
-	default:
-		dp_lanes = 0;
-		break;
-	}
-
-	return dp_lanes;
-}
-
 static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
@@ -659,6 +645,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 	}
 
 	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
+	udphy->dp_lanes = 2;
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -897,7 +884,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 		return 0;
 	}
 
-	if (num_lanes != 2 && num_lanes != 4)
+	if (num_lanes != 1 && num_lanes != 2 && num_lanes != 4)
 		return dev_err_probe(udphy->dev, -EINVAL,
 				     "invalid number of lane mux\n");
 
@@ -923,7 +910,8 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	}
 
 	udphy->mode = UDPHY_MODE_DP;
-	if (num_lanes == 2) {
+	udphy->dp_lanes = num_lanes;
+	if (num_lanes == 1 || num_lanes == 2) {
 		udphy->mode |= UDPHY_MODE_USB;
 		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP);
 	}
@@ -1074,18 +1062,17 @@ static int rk_udphy_dp_phy_exit(struct phy *phy)
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
-	int ret, dp_lanes;
+	int ret;
 
 	mutex_lock(&udphy->mutex);
 
-	dp_lanes = rk_udphy_dplane_get(udphy);
-	phy_set_bus_width(phy, dp_lanes);
+	phy_set_bus_width(phy, udphy->dp_lanes);
 
 	ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, dp_lanes);
+	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
 
 	rk_udphy_dplane_select(udphy);
 
@@ -1365,6 +1352,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		mode = UDPHY_MODE_DP;
+		udphy->dp_lanes = 4;
 		break;
 
 	case TYPEC_DP_STATE_D:
@@ -1381,6 +1369,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
 		mode = UDPHY_MODE_DP_USB;
+		udphy->dp_lanes = 2;
 		break;
 	}
 
@@ -1529,7 +1518,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 		ret = PTR_ERR(udphy->phy_dp);
 		return dev_err_probe(dev, ret, "failed to create DP phy\n");
 	}
-	phy_set_bus_width(udphy->phy_dp, rk_udphy_dplane_get(udphy));
+	phy_set_bus_width(udphy->phy_dp, udphy->dp_lanes);
 	udphy->phy_dp->attrs.max_link_rate = 8100;
 	phy_set_drvdata(udphy->phy_dp, udphy);
 

-- 
2.53.0

