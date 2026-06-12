Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDAD3E16B4;
	Fri, 12 Jun 2026 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281332; cv=none; b=VqiU5S20ryLFTYRhJjoVvlyMHbm7dDfsnv7Uebxykr3WtrXR9/tre6IOlHM8dSwQUVDLGKrjRYn19cOTmHJEukrMj8/QG//ElDMTYq2HfLoo5lncJa8oLGBk5MSr+cD+agYGTFkXWEy8pcubCx7xL/zx/mOJUR/pPa7AxDN70K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281332; c=relaxed/simple;
	bh=92Mv1yzhLSYbLsOgazamE7Q+5BG1RVIB3041BamknIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EB6EVrg+aSYANV1aqVRPzGx946m6eFt/pvEzL+zq52mkcMRnndcuZXNhwEC8cdjL92NTrfLCE/Dq70p0awRR/VOV5+SOklSIdabHcliNIxZLflzjigIl3dA6tdXcg9c8hYegYWKAYvU/RFOs/125FC0u+Wg2hKYxUbBwF1osZCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O2DZU3f1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O2DZU3f1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281315;
	bh=92Mv1yzhLSYbLsOgazamE7Q+5BG1RVIB3041BamknIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O2DZU3f1GfH+AewhvXI3KWqZmeXVSDCJSgCtFyCfLxp4dRNq5htKgBA0BT5qYnlIQ
	 CKoMaZSadt6fHeZkMG9EVhRop4RKaKvxDIbyiif6ygqunOvJuKY6SU10GPM++qghX5
	 S1lDDZ67BD1LnPT+P8yye2+j7gY+jpRiHmIba62abpbTZRz4dAPCPFkVC6aYGHKeT2
	 ZOKGXDqJXISSRjx8+cuJ+8sqSqU2/1waziZHi2S3DkjuIcHbcbovp3Bpl6izM6KFC3
	 ywl/97qO7f+knKF0eSOnCmwCysC6eGe5fw3nuJ9Alx3dfKTUfSREDsALe2aYv24x+V
	 jBTqSn+Qpp7rg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD93617E155B;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DDD6C480061; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:55 +0200
Subject: [PATCH v5 17/18] phy: rockchip: usbdp: Support going from DP-only
 mode to USB mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-17-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=92Mv1yzhLSYbLsOgazamE7Q+5BG1RVIB3041BamknIc=;
 b=kA0DAAoB2O7X88g7+poByyZiAGosMiGhZvmXEexMKc3rOFXaq1BtAo1pqrNEeadLsShg0Qpom
 okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PIO/qazVAP/07U
 KfAWJu7NyAgqrgqhUobGRlP8b2rGX8s6E1RYF7kpeJ1XF5SzdMRn+kas7cB3GYvOMnTriSZhHCr
 qOTTAx/flGjjTYYvV+w+oK0U6fQij8UHqhJq4Mw4BDVzRWHu98rAKCV21v+ctxqAgNg4fzHM3Zy
 GsxGgtylnizK+D5c3T8evyFwxNNq8MZ2dJtgqFHWqT7QEaXt9/hFkeX2bQwenHynghRmwo5+OZf
 hgcPmAl71j2SB9ZKann64SWSyi4QV5PyNkHoPNPeY3aUTkH0f9Z1CtlY5TJry7K5fN1Fk3zrTeU
 O37w8EYIQC+/RE8sBADmkJAe/ZCTw0LrEQU8qozaUVM+Eav76h1RHoYckzeykjoem4s7vyUAguv
 F2HzdAwDcz5tI4UT8WJSRqEmFaXkNTg46iqkSjwjWZGZa5fSQkI9HoDINfpxfGYSkIItC4KjwoH
 GcWtaR7J1JDGOZCRSrFj/WnYAcK+DvUPqU1SvOZDVPwjsT/BTEe3HaLf7QBfGt1PpV/rXqDQt4D
 bpElkG2Qqk9WZy8wczsxS77todBPm2dt50pWNqDgBGe9/lWmYdO6EEX3zWrHDzJaJKbHobk8MyX
 KTO3DBGcQVZG0EdJS+Qmz77nL44IAlJcsknU40VO96tfOdxyZaC3GwdceDWH0m9UfiwqURXjsyK
 72IOU
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a USB-C adapter, which maps all Superspeed lanes to DP is plugged
in, the USB support is disabled in the PHY. When the adapter is
unplugged and a different adapter with USB functionality is plugged in
afterwards, USB functionality is not restored as the USB controller
keeps the PHY enabled for the entire time.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index f673c5481d24..236331cc0d13 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -178,6 +178,7 @@ struct rk_udphy {
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
+	bool usb_in_use;
 
 	/* utilized for DP */
 	struct gpio_desc *sbu1_dc_gpio;
@@ -1015,6 +1016,9 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
 	}
 
 	udphy->status |= mode;
@@ -1278,6 +1282,8 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->usb_in_use = true;
+
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
@@ -1295,6 +1301,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->usb_in_use = false;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
@@ -1314,6 +1322,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
+	u8 old_mode;
 
 	/*
 	 * Ignore mux events not involving DP AltMode, because
@@ -1325,8 +1334,20 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	guard(mutex)(&udphy->mutex);
 
+	old_mode = udphy->mode;
+
 	rk_udphy_set_typec_state(udphy, state->mode);
 
+	/*
+	 * If the new mode includes USB but the old one didn't (e.g. leaving
+	 * DP-only), and the USB PHY was already initialized by the USB
+	 * controller, we need to power on the USB side now since no
+	 * subsequent phy_init call will come from the controller.
+	 */
+	if ((udphy->mode & UDPHY_MODE_USB) && !(old_mode & UDPHY_MODE_USB) &&
+	    udphy->usb_in_use && !udphy->hs)
+		rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+
 	return 0;
 }
 

-- 
2.53.0

