Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C283EDAB6;
	Thu, 25 Jun 2026 17:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409187; cv=none; b=YaQFR82wdDf0oePMG7DZpEZVpfBEtQNMFTW22ncPGtjQlIAEuWAjqt36sdOoCvN/4k3xCL5wh6lOrfWwCGfOORntYgCkpo7Dn09Mt+R0HK0N+dn0G9/MHqRQJCPqzW8UQMotCHcqMyKzPJw5GeWj59Qlteh94r3ZAyo4QY6B8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409187; c=relaxed/simple;
	bh=yO2g5drsff/wd2oB9M7mC1hvkRExbjDqUIk6ve2THuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Inl5YCmQa5bpzD7FW3zgSCV6GjGUHdOYMwKNfVbwsUn4UYxhRQhNjAupD4IFj26D92/5+jZK3H+Sxvyo/C7rM8EnuvDbg2RurrBGsmXQ8TmySKP6ju1X2ljjF/0yu8frL6eYfDy6FbfvYwc/Lhe4JTXIpl3eMY3yWbGRrTtQSh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IyD2qyYV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IyD2qyYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=yO2g5drsff/wd2oB9M7mC1hvkRExbjDqUIk6ve2THuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IyD2qyYV7ALxLbUaSglZ08MH3lEehhykANldW2QJGFFQSBdsL08uMr1y5bA6gICXI
	 ZfWYoTnMsshsF41tfSR1DTnATcxab8gWC7vLhOuxLDnNydkSqAJWDkhETmi8ISvJXQ
	 GwvgawTmkrngGQ0j1+wlFRx+n496WMS90kzlrrzaNUgB9UDdAWz/fWzvcw9F2RVPTI
	 bReDpTUl0m+WAGabR7MPy61yGuScIhjmwR8E00M/hmXJLNb/3JuJuqZMEH4/R7sWVZ
	 VpViDxxO32hUylL/Jq32+RZrqMq+8DPh2oljAX5YK0x1IkCcHm2CpLto95XfQxmjO5
	 v71Ph69dGhuXA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D62A917E1553;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0DDA748004E; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:41 +0200
Subject: [PATCH v7 14/27] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-14-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yO2g5drsff/wd2oB9M7mC1hvkRExbjDqUIk6ve2THuY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9txCMTfNoK85Z2pGSn+rV/OxsDUKkiVC
 K/ppdeXxwZXpYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaewgP/1TQ3J8aBYhAaIEm089dz7BjJkt3u2QhBZE14OXeb60ow3b0IHvOldWJPDpD47c+tMw
 yhWrwdNtE5RKALbJL4JgpcbHEDW7CTc1wfavocTzvqjUC39BDc/8lnOADIJUTUhYLBSCJe+F/4l
 B2zlnwFLJdrM9nH3SrqVqsYpkj2tH9tMA8sAoqGNhN61geHoC/KuTxNUThOo2qtBHfdFI40wL3d
 QBV1j8OzyE1cC5imY9ArZhylXEsTz6pfT2xGwToiuTa91Mg+R5HIxH+UVvJs4PCn3V57g9kUfJb
 exkLEagpMERsGJKddpP97EUlueGtNxiKngTRfC49ET+SD80aqghdpLgT9ObSAnflntdCkwEEBqx
 oN67mMhlIEvMr7MK/Wo3baGFcyOUOKYPUzcfZ0361FPr11MGxkbAdQxBQZe+b26wKIvGEp1WaLH
 o4R1S0dvkegDITs9igXSHZgqMSONN2KeprmkhrnmOLEGjrEwlgvGNCf+RsrmwN+OmJWJ+O5EmSb
 tvVsCbYD0NbYBhSjKPMrUj8+diEa5JCzrwl6KXZAeBct8hQdKlxIQbVpkdPSzHiYAmn56TjqDzD
 SPNpsJxH2i+8KVEIh6dVf/6BH7bqEHeOXi69r7mFVkO4xkHHlYVC74Ju+07tC9rTWGhU+lK0tBv
 5APeVBHk0j+e6k9UxzSYumQ==
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
index e9e3f36f9e09..6ec9ab9d1e64 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -550,7 +550,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -579,7 +579,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1079,9 +1079,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1099,7 +1099,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0

