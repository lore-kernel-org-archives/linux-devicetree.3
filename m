Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD23C3C03;
	Fri, 26 Jun 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507312; cv=none; b=ipwR6sI8m1mZzGQeiWw2NF3KgRGKoaCkVnj9ccMsbw/jdpagRCczyZRBKYcORbKkmkH9OQW8MItiupiGrxMuxARGCdIs4a2wFmaBWi5Z8JhoYrqnE1RcjxArDVBd7n7IPkAQcX0VDtIUWCU3y1IhDZ7zrg81o8JDE4jCEfgDPuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507312; c=relaxed/simple;
	bh=fqqKHWWJWK0Jwe9QDoHljQzJ9sYc9Ql0wDdygpL54/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNVNiRM71q4+3DkT0ChXdIFNpKaiChlrhZ/NePf4V8RTB0B66/GSxkj0ki8W8EFe+s0hs1NmY7q1B/z8HycVLSOuppca+yE8fxr1WJmyG+n4LsfpTuNtB1tOrxHAo1gzcf+Pnf+Zp2bBWVYXca02JXC8tDavHNTnUNBDb7/5O3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j8Jf1CZg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j8Jf1CZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=fqqKHWWJWK0Jwe9QDoHljQzJ9sYc9Ql0wDdygpL54/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j8Jf1CZgARgF4PTEfBTrrAuNfHMel3cE+pT4BEd66aUcfZrKtfGKgMgSo+oudZfL7
	 kRcxzwPUX0ifn2OdkAOHwyf07Bp+v0MdH+0rXV4leikCysivSXh/JUuwGljRs+j6bI
	 pyAZdyUDNJz8HNWZAvU8GWu1JunDmxN3fjWfdhW31G4dnbC3NZJclgwDZ0PRD/y0Vx
	 rnmmgJlIPn7KF/yJoOVu1ri6aRvSj4fJPrQi6qJbFI8g4VzjrXJgJ+O1GMkyrUmFBO
	 PUZ3FpYmpGUblOXWjL54lVuwdvK+0r8uIMmR1B6sV9SEBoB73SMWSz6nogA0zJ4pG3
	 a3IdIo+PT26Qg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4470A17E15D0;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2D314480068; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:16 +0200
Subject: [PATCH v8 23/29] phy: rockchip: usbdp: Use guard functions for
 mutex
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-23-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
 bh=fqqKHWWJWK0Jwe9QDoHljQzJ9sYc9Ql0wDdygpL54/8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yXCi7eOMvOKh3ADi1+8NNLiOsDFgRiSE
 xLH22W8hnoPRokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qa+rMQAIHuzLB+KXc9X7Hqk5+BYSURN+FrKXlzhzMfHjcXH5HzyK2PRtd+WBWXonFdzhJh7oU
 kgNVdTlwVn/l9Qp9/CwNSU7FIkQkW+C/fQner8SiBG39DpKpGhHJxfD6uOnQ4WTaTqI58E3KA8Y
 tcKRyFV8oEJpqqdSR0JXWn/C+KgaL0C/u0QBGzO0mCfGOlK+jiKIMoWTnSnf1gLYpu3Yvg9xeig
 HPfeQ/kv8iyrDjJXdQFHCcOpMDdO0Souwu5YcWWaflDescZaMd2CaUfp5dIPkgB9H3Fsp+N1wqK
 ugnw4zTds13nOTnSzYYzdO7zO1U+45pzaTgkPZHkNhPgfiEzcgrg0C/h6vORBHugmgFYPUwbLXP
 YHDUumKSBOzj6W5jIl301+0FKyvVN0xr1jrF1Qif81qnC6Mp5TgTnPn6FlOaSW9ytQhzFL3qKPe
 kNrBgbRq7HRRS+UCHRL9dxG+ib1+Obc0pVWEOUBCTZwsF+YcDOWaxrXq6zEk2vCPF1R98BzyunI
 eMxaO1LkoQTBTzvgdDx/Ci154fCP4yIUQ5ZYCftLGX94PKqz8M+v1mAm+TBZsYFEX4iiyd1+9DG
 pqLa502k67lqQLG1zjjRnRZCNAP1hLD/lwtxhfU3aCM2vKGrfLhMN1mBKa76/uqnd+npvJfSKTa
 5AzwhNiZwuQTegwIM7/cqUQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Convert the driver to use guard functions for mutex handling as
a small cleanup. There is a small functional change in the DP PHY
power up function, which no longer sleeps if the internal powerup
code returns an error. This is not a problem as the sleep is only
relevant for successful power-up.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 54 +++++++++++++------------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 63fb41ad0199..837a4cb3e4b6 100644
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
@@ -656,14 +657,15 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
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
@@ -673,8 +675,6 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1054,26 +1054,25 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
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
 
@@ -1081,10 +1080,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
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
@@ -1289,35 +1288,30 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
-	int ret = 0;
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
-		goto unlock;
+		return 0;
 	}
 
-	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
-
-unlock:
-	mutex_unlock(&udphy->mutex);
-	return ret;
+	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
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
 
@@ -1349,12 +1343,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	if (!rk_udphy_is_supported_mode(state))
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

