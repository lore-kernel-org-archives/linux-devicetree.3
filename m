Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB302FDC27;
	Fri, 12 Jun 2026 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281644; cv=none; b=K+H35X2BhGRXfZvwlJoym9yYJzaD07DZVyMZ98B1W1iqnvq4BSuokRJ9MOlHPcZtC+yzxTKexavDkzrkMZsCKZvmu34/OnIidGXIxQlaYB1quBNQCiIcc1ijmosrOz1wx6G/ykgInMwGMtXZ1dZXIJKHzYImrieuQM91k13pLNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281644; c=relaxed/simple;
	bh=TQjWe30iP+QgilolloWUpNb5d8ldWowCS2RaAcWUC6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DTz97mmYUFg6+c0/PuugXNozSaOBOI8VAxBJDot3leB8c/Dbli6vuVQk9DSBS7VefFsdjjAJb1CoeBXKDg3epAfl4hOrIuX/twQ5Y3YA/+ZK/XyEnceNzEaJZS4zAwp4xO6NwAID+AtGTgI/Tl09DYsC5i1LCeEwOWWS8PZCrIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LAVrbEnk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LAVrbEnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281641;
	bh=TQjWe30iP+QgilolloWUpNb5d8ldWowCS2RaAcWUC6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LAVrbEnkDUxIY8LKDEPOdJcBH13N9KBwlx296+UJiE38sgjszfrGbIhOOkJrJ48Z6
	 E0zlRW5/vn5tNZ4h74AlaBrWQHpRvJc1LWMCCGaPAWus5pZHFvuKwR1fBovTOWjIxM
	 bW6g1E+45a8JRrs3I9+cysmhv+Q3rNU8qkCdiyyPJLNV203LKAUS1lXa4sWk/EE2dx
	 Mb+ZS/Muf5CoUae+HK/wR1TcAPxX7S8ckZVY3xCN/b2VHyx1sGDRX5UwkRn6N4TN6a
	 +pEWLGKkdXyDoLFiXBM4J/mO45PxPs3WdD3EC7MRD2Kyh1xshFN/a5ExWScSLa9wmM
	 iFQcV9tDUFpdA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E8FA17E35E3;
	Fri, 12 Jun 2026 18:27:21 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DC58B480055; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:54 +0200
Subject: [PATCH v5 16/18] phy: rockchip: usbdp: Use guard functions for
 mutex
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-16-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4395;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TQjWe30iP+QgilolloWUpNb5d8ldWowCS2RaAcWUC6Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiHUqM5F6HZgkgIiIkSxb1K9vCxFpnySJ
 bs9QpuH/0FAHIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qaIx0QAIq8Snm6ApF/CEZ7HvZrboecmFwtvq8JUuUo88ZKVBPeiPE2yZj+7NzgWiTA2kcZVoH
 ZwQbJf4DAPFneBj0whnbbVsObRF/GaAyb+1BMnY/kUwpZNKfw1aOpjJ5n5UoHCX+FMCIUd392lW
 zsSy6NKEETH+eZpmoHWeBsy9EknwNIh9NpCNyf2oIQo3xkgBMyNw3yXDcFZt2AcmpwT1p7jT/RF
 VuD0WahVD+TU+AYUOQjffFw4OZXDEULCLPza4pdfqa6GCybGCQltYmux5vzoTx5hmKbDUaI40Rk
 5eYwnsHDzdEnktSUVPHssFiHLRHaZPMWSoPlsse/109HFdWNj2E77gSDIJ5Mjtovw3+qlUwmVys
 PTbffEL3jlfmSCXVjnfeM/yZyCW95+pUnnbgbqcfuAdiQBI16wTJezqq2oa0peK33We4SzCR95+
 YHALvW7l4h235Z4pUgP0ETMaaZtRIUOgck5D8PjgGAJpiVj/QWqTh2S8GaEkcHE2s0Pf98S/bRG
 PXvUj9XzJV9V1Ecmb2YkG/349btjmb7oRf29i2EJMSot2u+51X2EUqufIYlfuWxq5LdIiD3RMjm
 6ZgsIRD+gtNgRJtO0oA1qMJErPh5hwjn6zZHJ2gZJmVmQxi2hbIVeNFBnY02X0hjgKnRzZWdkX1
 jOLtTfOjk9Qiq5TYbLsQmlQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Convert the driver to use guard functions for mutex handling as
a small cleanup. There is a small functional change in the DP PHY
power up function, which no longer sleeps if the internal powerup
code returns an error. This is not a problem as the sleep is only
relevant for successful power-up.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 51 ++++++++++++++-----------------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4ba8b6f0a954..f673c5481d24 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -10,6 +10,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -652,14 +653,15 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
 	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
 
 	if (orien == TYPEC_ORIENTATION_NONE) {
 		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
 		/* unattached */
 		rk_udphy_usb_bvalid_enable(udphy, false);
-		goto unlock_ret;
+
+		return 0;
 	}
 
 	if (udphy->flip != flipped)
@@ -669,8 +671,6 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1043,26 +1043,25 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 	int ret;
 
-	mutex_lock(&udphy->mutex);
+	scoped_guard(mutex, &udphy->mutex) {
+		phy_set_bus_width(phy, udphy->dp_lanes);
 
-	phy_set_bus_width(phy, udphy->dp_lanes);
-
-	ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
-	if (ret)
-		goto unlock;
+		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
+		if (ret)
+			return ret;
 
-	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
+		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dp_lane_select(udphy);
+		rk_udphy_dp_lane_select(udphy);
+	}
 
-unlock:
-	mutex_unlock(&udphy->mutex);
 	/*
 	 * If data send by aux channel too fast after phy power on,
 	 * the aux may be not ready which will cause aux error. Adding
 	 * delay to avoid this issue.
 	 */
 	usleep_range(10000, 11000);
+
 	return ret;
 }
 
@@ -1070,10 +1069,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
-	mutex_unlock(&udphy->mutex);
 
 	return 0;
 }
@@ -1275,19 +1274,18 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
-	int ret = 0;
+	int ret;
+
+	guard(mutex)(&udphy->mutex);
 
-	mutex_lock(&udphy->mutex);
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
-		goto unlock;
+		return 0;
 	}
 
 	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
 
-unlock:
-	mutex_unlock(&udphy->mutex);
 	return ret;
 }
 
@@ -1295,15 +1293,14 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
-		goto unlock;
+		return 0;
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
 
-unlock:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1326,12 +1323,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
 		return 0;
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	mutex_unlock(&udphy->mutex);
-
 	return 0;
 }
 

-- 
2.53.0

