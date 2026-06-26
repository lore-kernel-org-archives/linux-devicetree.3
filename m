Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D93BFAEF;
	Fri, 26 Jun 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507314; cv=none; b=i3k+mcEG8DW8S/4KPDsQEBlbYdfdpQSLlE0Jgy2CTW8KkiL4GOy7doDKsSIRiBpsAkMrNiy3H1Hvz7mKB4r3RDJ85Zy/Ud2dTtG/wppR9M1X/ffrhuWZxH8xZpkakpO/tZvxVk9AOENU+xp5mx/4F1mvjd+2TZilwVTcfyO33yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507314; c=relaxed/simple;
	bh=qu9LtuiuRvNa7z4rXJx97qokovwN1mfMhrPchhFBK0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIiwPR16HrcrP16T0JDzuO8EamJq+SG1WyMwbaYYljXYAwNRrf510kaFI4U2WFXrrsCJ/5jXQQzOWgnvUPn52eLLoSgjOd7K8Io6H0VDbzgE7cgMbbL6AE99JYp2C4nqBdBx1k459017GAQ6WmPj1RQ4i9fOGDo470xXzvuPIZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VrNT2naf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VrNT2naf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=qu9LtuiuRvNa7z4rXJx97qokovwN1mfMhrPchhFBK0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VrNT2nafb+Qi03RN0M4x+KrTGQcuAiUVcQ2HnprNg4dV5vJsOSEBiewoxKnIGP2mx
	 iJTILb4F8tZ9hRPIsttz7K1XCWvgnmY3GQaO1Rgq/Nc9us2oPRj/46Xa61hD5BtEpA
	 0hnkAdIE1WJVXaWK3ObL9NMEgFMlggBMmY5Ksqi+uA2rzpCHImp01obh6Bj2yOlJjd
	 MnPj87pmUCgBUguOPszcfsMBjeRjx0DNN2YmDfFMOqHMWxbb5etfzIir7qy7DZHYCx
	 Q12gTIVCEz/fH+jvMpoafRFpCove19yu+Ss0h5Nkew0S+kZDRAEpc8qYhgVPstRrFp
	 MBTxQCQTpiO+g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E2E217E15DA;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2ECD2480069; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:17 +0200
Subject: [PATCH v8 24/29] phy: rockchip: usbdp: Support going from DP-only
 mode to USB mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-24-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qu9LtuiuRvNa7z4rXJx97qokovwN1mfMhrPchhFBK0A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yUAvTwj30RwhrKpMs15+NTuVtXEZV6ee
 vfvWjjOAybgpIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaW2sP/1qLJAXeq91ZmmbupQ/tl7nbDXMlT78WcklSkkUg8spuJgkf8b+NbUQHTNVGZ/FJHDH
 49KeB/XPafvrWSLrx8WeG3srHXuX1Ch9JMeWR3X8/guv6BwBPePfp1BqXVQ60CnmhJJw/dG4PbH
 k1Sg6ypLTFBfvKYLC9nqO5WY7L/RlnBRvJiRrLEl93X9w7pQnHgCLR0ld5vONoZGizvs/yFiNXC
 sUEuwQrx3joEV+i+l4NIpf2dWVjyQk2HWDIC9jo/h+572oDtDdgjErt5jDSgHqv7dS/QKnEWVvX
 9D7Nn6z2f2dV/qA8Seq7SGOK/1s1x9X0tja6aAxhUlNFUYSFgUA548aAJdbKbiXCB5OsVqH919v
 zKI/op0vYIjgFHJYFCPV+Yrlw/jUDK+8MnkOWcF+0S3P7V67EdAQ/ji5n/SDhPcnvmNuMavsPxp
 gfxhy/cKt9gJhemPfWyaqxkovfOVDbqRl+ULmyWW0p2+LBEm2Q3VQi5kv4AJLlpO3CeisB/IHrN
 4Jv3ONcXTG8AUVhePx+mdV6YRLVE4j5JIcy7yR5Wg4CALPZr82hI43TM+DFYXHsPJQsc+H0hZAR
 EOYhf5wU5D3KdwHMycD6W+XX40UFdvyp7lYoY5q0P+rHdX+TaDvGY4fezQkIGpTXwj8nBw0ipmX
 sPR5u3PkK/gLqYqYjBe42nA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a USB-C adapter, which maps all Superspeed lanes to DP is plugged
in, the USB support is disabled in the PHY. When the adapter is
unplugged and a different adapter with USB functionality is plugged in
afterwards, USB functionality is not restored as the USB controller
keeps the PHY enabled for the entire time.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 837a4cb3e4b6..4566822d70c4 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -179,6 +179,7 @@ struct rk_udphy {
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
+	bool usb_in_use;
 
 	/* utilized for DP */
 	struct gpio_desc *sbu1_dc_gpio;
@@ -1025,6 +1026,10 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
+
 		udphy->phy_needs_reinit = false;
 	}
 
@@ -1288,16 +1293,24 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
+		udphy->usb_in_use = true;
 		return 0;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	if (ret)
+		return ret;
+
+	udphy->usb_in_use = true;
+
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1306,6 +1319,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->usb_in_use = false;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
@@ -1347,6 +1362,17 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
+	/*
+	 * If the new mode includes USB, but it has not yet been powered
+	 * (because the previous mode was DP-only) and the USB PHY was
+	 * already initialized by the USB controller, we need to power on
+	 * the USB side now since no subsequent phy_init call will come
+	 * from the controller.
+	 */
+	if ((udphy->mode & UDPHY_MODE_USB) && !(udphy->status & UDPHY_MODE_USB) &&
+	    udphy->usb_in_use && !udphy->hs)
+		return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+
 	return 0;
 }
 

-- 
2.53.0

