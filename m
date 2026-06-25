Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4BD3ED124;
	Thu, 25 Jun 2026 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409582; cv=none; b=fby4HMGkqh3VchSCv+nHTHvmqFLuPowM8wGMQRVYRT/s8fG51Ry38ZBHHhAPj6/f5nmq2s9gytNM8FjxKt3ZIeZW2F/Rgp90dBFm/dz1nmr+ggZqN++vlrZJqb1PGjjwwUonJyCGmOzbyNfiur9+XeKAin1Kjy48r7uTCbpI9Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409582; c=relaxed/simple;
	bh=aGmK17+aPencW7ujZOHzen/ajS/PfDiM4kUOW9/55fY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nKkkW/M8EGcs9XkUKf0fIL6lX8Vjg2rh+7Yzp6ji0H4dzcvU5ONxUBHABklPyokg0jzKyYulIzgzgaCo+sk3i401FFNh+6OJM00bdf/7QjSW/9zPQqixcGq8buT335lt/epa6G79k0roE2gpMKKn/VW0LzN1Gj3J6NqEhRK+kb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n9IZB+32; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n9IZB+32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409579;
	bh=aGmK17+aPencW7ujZOHzen/ajS/PfDiM4kUOW9/55fY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n9IZB+32hQVghVS9IPIEg7O0wUdmUIanIp44OcUEKO9onQgCARp3dMcovXz4qqnTi
	 u9SzUnjk8NoUeTZgEUlzJmMzfF0c25ZAXCKJYbKr5rSRPTPQIbfmANbcIMj+ucrBDM
	 wbeJNAex+I3eewHX4YvaSKlCQX0jlfl9gs7Y6IVq/PfMO2Lq26uO6aSubs4Fho9Hy7
	 4FK4xuTGHGQl2k8NL91Oe1u5Ez0u9zKM2+a9NdSzcBVbffeWP/BFf4I+EhV+3Om3Ki
	 Ll6PKmrXRcVGLRZlAQrxVlxC/PU7pe8dj0lAk2m8nFNdzTs8JG2zXeDhcGcdpi2ONU
	 CJdHWjDUTMk3Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1191117E0E48;
	Thu, 25 Jun 2026 19:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1A908480068; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:50 +0200
Subject: [PATCH v7 23/27] phy: rockchip: usbdp: Use guard functions for
 mutex
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-23-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4397;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aGmK17+aPencW7ujZOHzen/ajS/PfDiM4kUOW9/55fY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9sB5NkMaVNopU0ACs0344BJBJzarwe2c
 FnqOULC9DpjG4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaMhcQAIrm+on72tpyKR8k5M8peOUy3hi+1P9+ez/+lWmL5YOQYQ6E9spUN/tHf8AnuPcqLD2
 XNwl+aJdCc9E9J/jEsW81jKkvQPB9o4jFuinJWXSGZTZfrVXycQVvsZnCZswyqvL7S2dS9JyFyh
 GkfrpZuAXPEewINNjGZo2WXlT+JsO4sHdk2YjXRW6rG5vX1HSLQvDIBEq5SBzCQCF5jclzJkNw2
 mHbh5WPvet5lpDH2t+nhuqRTRwLvw6+Px4Lfwz3odUhQkDP55LcPRbhDRW45Jkkfe7YqtzRpAOs
 xS6z8QjX4Q3ZPmRVATip3xFizmip5B01dhBNzvjEvB0sD7rEloAb8U3stV3iH4nB6c1qtM1Sobg
 Da12ZeCBjrg5PMl9WA+iTYu4PTg5PC4rYYtUb1qRB17IlzqVfd/vDpZZ6U/TYIZvVRvzi2jNrNu
 kogp5LL+3HVWhHxpKcyEKt5FhWdUkw5AWKWiloV55tR1nqClDEXRXB2Yo8nNwp0AeCUXs3HQ6dh
 6+9demZViWY0CFwGNU/N3A1RnqRd/by0YNoAQg6fLyuhzGSJKAibheJJ+SgNJZ/+S0GmiVqG2KX
 QcgbaOgpAjE5IKw7n72bUzmfq+x3nyb9546SqtGRyAfE3mY8LydL8g8OLD/TRjhy2vnWRNEwZad
 KYtyJxNeADoO2TRY9Tl8sKg==
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
index 0119b6229b0a..6f3184011e5f 100644
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
@@ -655,14 +656,15 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
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
@@ -672,8 +674,6 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1050,26 +1050,25 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
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
 
@@ -1077,10 +1076,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
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
@@ -1285,35 +1284,30 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
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
 
@@ -1337,12 +1331,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	    state->alt->svid != USB_TYPEC_DP_SID)
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

