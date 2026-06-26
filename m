Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC2F3C09E5;
	Fri, 26 Jun 2026 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507309; cv=none; b=lDlC4ocr8SOzJWIYIEobxp3swON+iNWdVFppKAJk5PnDw6w4nbmL9pB+uMqJn0vHDRACJ9A0aO7y5G+hTAT/hsSElrusPCDggXpbytXKRrxGUX+k3+Xvwnu2Uzp3KNT134qRlIEqOcwsfGYI4lXAgWCTEqrsijMk4l8pRYDyqRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507309; c=relaxed/simple;
	bh=bEoQG/Yys4jT28HNaTVApBbEpqOJRZhkpwJKmtLe//I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNTqyn9/Qs8dsPdWFkp5PuHTVW3FNVCg2hEiUHsHV25bmiOpfuGtqHV1RSOPAlkJ7gN1jBOXew+b/a5Et2HG1C8jGQXzBYdXgpJTNMhrG/RvDdKgLNwbpzur4AcUzHYEqQhJVZAc0JL5HlXId6MeX5upXKBtAuD4AyMXs90LrHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gMru2ayO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gMru2ayO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=bEoQG/Yys4jT28HNaTVApBbEpqOJRZhkpwJKmtLe//I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gMru2ayOZH2mdWnJ2ghc67VKsl9W2zrYwCLFhh1hSRljKXw851dXK9XjITsWnFs8i
	 2xqb5FNWWnwMCHFJyoAJOjvZ6ldhSAzZAEc3N6z0OlrfK61mUQG5+STJLbRgOlsFKi
	 bxYML/5j0u/tUXHrbHTXAGkuq8mczY3rqaJ0pz47wwSM3bX7DY1m1EayNkWf+0sXB7
	 25OcFciLCHGC0u0bgM5vltayAVf/A+pHNXWselqSswlsXRbtAoN1MnT2Foc5/7yoTt
	 EeHc7HKi8fv+GOs8IfHPWIYM+xPbCO9aTbwmWPPq+AhY6Z8WOlKKMlFjknUEC92qy6
	 IuFBa6cIxVTGg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D29EB17E1539;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1B6E3480047; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:04 +0200
Subject: [PATCH v8 11/29] phy: rockchip: usbdp: Add missing mode_change
 update
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-11-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=bEoQG/Yys4jT28HNaTVApBbEpqOJRZhkpwJKmtLe//I=;
 b=kA0DAAoB2O7X88g7+poByyZiAGo+5yWjFn5qkTHA+NKIgxeN6GJwNmyjcB+CweDJD6nD6OksH
 4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PIO/qaHDwP/A5U
 umpT1iVFyw3BPM8vth5wSsv+IboQaeZ/G5TS16slev7KLMToIrNrsaaC40r16Qd6gZg52hxOGOx
 pi86Op3NDB2rdRb+FxY4c1YrXDi+09GjBxAA7PF28AnZm68t6X6IXcuiC9TqAc9ARpvaZpjk81n
 PEN8hB3+1+Nj5tbcrhPK2w99I+i0t/KBmxw6wdxWl0+PyuZweajrPG2HhEdVn8G3hRFuYxVbD0n
 yr8Oy2DjYVJgQjWuHWUG5pxFEXpPMQRuq18XZj4zTwC6ZDLGvRXCH8qa26R+kXV1UtEMkB8RhIj
 ceS8KF4a/LXRq05Q4rRRS45BpMSdwS8W3mbyhuxJc9sBXjlaZ3Eo3vKoX0Cdt0sFOcbLylBBIkN
 2CELtwiaQVg0wGeiyBwivN8yucFUPLUcn6f23yGaimzyCZzkLi4kAghDVQINB+qs/y70JgpYEpE
 uss1NvEZeemjiAITWDOStQsocyHut4I9bYgFhj+DgW2/vYG8/dmnjsOG8gc0v0gKwGgtRlDTYN8
 pw+I843s6HuqnyDHgQbb6lQh9cIS6IhFfFp5yN/FHUL+uuwBwneFSJp74exNachATRni1uunZ0D
 cKjf+T+bFm7W0zpTD6kBWaD/Nr4uFn1cBFvlqgFNJmDBG9rQsV2eiAcpDvvUogUAcSw6+0Iu9ue
 usuj/
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c6d24dd3bdef..d091f8007acd 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -622,6 +622,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -652,7 +661,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1394,10 +1403,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0

