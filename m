Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280C738D3EA;
	Fri, 12 Jun 2026 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281325; cv=none; b=ADWTEZMo050OlLnf0T+cwqIWkNbc1ZZHXe2N/Z5jSSYgVq+xVr0U3O7bDfAtpTfFaA0qJMVuL7vVzqDzctjnPrF/4vZQjk2NgXsBeQ21QrC0yQ/vn+Xh8ku+Fx2/QuWpOCsaGt1Ym6D6+brwlRISSzYl7TXmahjPArxhGB7IVmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281325; c=relaxed/simple;
	bh=Llc5oNOs5fL0NA/jBwIwMrc+QvV2dJg2k0ue+PtI3dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOkvWzF2NETsDflDA8B5d4UHZIHVCpNH2u2lB1+Ag+rKohgPOth3nQYy519edJSyPGY9f53kKNsArpShOcYVshksQYRwWEG9rBt98Q8KeAYp9rcH+jVHxSlz2+L0s+R2XqcNnBmm5IlK8DDl1hiJ0kbHbH1xOOYMQ9BQBaDgZE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FnQKFhJB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FnQKFhJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=Llc5oNOs5fL0NA/jBwIwMrc+QvV2dJg2k0ue+PtI3dg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FnQKFhJB5jMpH2dxnYBwNWadJiEP9+KwZ7MIpabq0ux00DzfnLdwynLdINpPqngjG
	 FbLbEzDc5T5k35XWajjAEeMjKQ66e6tkj0vFG0TTlUIW8mgjvAls+m5rFUmPZldumB
	 PQv/tPIcY3IYRo25JLM2T80nL0goMdXT05uIcN13m7Dud0iHMkWUB4AUCZibv8Jriz
	 c74+kCZz5+4XAqGdqcxtk6hkn3gDO0ZZiEK3lPlH7wok+NoxcvsftwIlSEf6+VqkVO
	 CvjM/7Dr+NiQAa1Q7h4bPgzCrXvDJjEGR6F4ytEKt8OAYyi2iFSA6PTfZXxl41/Xuv
	 vloeED/VWpjUw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 831FA17E0FD0;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CFD03480038; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:46 +0200
Subject: [PATCH v5 08/18] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-8-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Llc5oNOs5fL0NA/jBwIwMrc+QvV2dJg2k0ue+PtI3dg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEAJFRuuHMFMwK/sfeqQAnhZ+8Lh5uT8
 WesgYdzyjB9/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qarm0P/0PrTgVH4Lf0GpBOy7EMGCebhVpgzt3CZdSYGqUJ4BLdNRUWDatDFyevEdZpW9yTAx1
 XuG4x1JXbi5xRuw5RmLxWRN6Pv0uI7v9Fxw8gbg940/IV5/60utCqQABztHs5YPuiOQ3nFGEMWB
 iuhI43bLMG9Qx9pVleHLska3KejHM7+3nQ0NVyTmiNk/VUoPY9R/aAR6uYdu3gO5ZQFtEx8tUzu
 6O08RW2VP4ardvvQG/YELRA7rs59tRzJli2H1S/E6Al393FJ/U40+fzHXuLIKhge8Rly8LP2vbs
 htmzMvSUG7POuYpZR7CyPUpX/KdGGnaT3X+NC+eC8EBfSuf57cM3+tKMBELu9J40n9BQu+oFrfB
 0aVSdAACMdC2Z0Jyf2+S4Jzc+Ig9hW5xE975zEuKY4NRLflKlyqBcWBjnI4S1vLYUT3wZZ6JlfG
 h87IMSbcIY34+DSK35WM1+zmXu9I9okL2HcNRNzMzH1bNwWognVQc3zeeyd8bncpnClrvDzHHbP
 g6lwDqyQo3zoubMGkYukgXGB8rntdCvRKSGTmfFH2FYNYxMJtPuyinv3YyovSi0vpamn8mNcoIr
 LNnJlE3YU3akkntz+IRvAH1xwretkVILCYMjReGnZMCGRM81Uc22jBK4KsonLNbL0rbwXZlqxz3
 WY24mefigQtu8Z25qlDw6FA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index bf8394174294..6d7ca11b308e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -547,7 +547,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -576,7 +576,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1072,9 +1072,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1092,7 +1092,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0

