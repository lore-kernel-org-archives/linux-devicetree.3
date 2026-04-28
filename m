Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA904478E25;
	Tue, 28 Apr 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392852; cv=none; b=vBHDxjhe+9t023WlGJfRrOlZIaxoTHZ03BsxvWUJAOrt4APkKdTQCWmkuLnSCLu8dM/EtHNyiWjTVT9Xl13nrXmUfLVW63ynZsbp/Uk8SBkx7O1nenoR/m0S7oyOGf5d1Vpu9D1m+AAN4fy1PMtw8x3GVVrZBzjBz4hS71AQ/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392852; c=relaxed/simple;
	bh=2RDTD3i97hvqpAcQDq/HnQnUMc4wftjxgYkOHKmJn4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+8LeZw6XqwUTXWdezgMW5Eb1ysr7ocedRv/+ISfhbmIYWV+V8QwXARtfCz0CChc38RszBcXmZLmutyu5zULQEPdauKkpHY57XMZfgeQ4e2pHtPPWms+I0dQvz2Xs4ocfrr2GQFFgwsFdjgupWgU1vYUVVpHCPWs73Ke9NreqvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qYTwRCvV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qYTwRCvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=2RDTD3i97hvqpAcQDq/HnQnUMc4wftjxgYkOHKmJn4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qYTwRCvVxitM2Pnu8Km8cp6ScTYqD4RSacdYSxr/PbVX4M1yw8egMkOxU7YEOoBzL
	 byApT/yjPttVKFK9DBXahCesoPQPYJNHxF8C+H2C8pcPWLmJa2kD6UYQ4pe1pTdBzZ
	 i7htOZClsGbBC6/DXpa5fh66XcT/S/fcnUa7R+TpOgZBa3bO8yRnvheStoRf4QbaKL
	 j3jyDB+vn2TXb8IzWfzgJnhYZP6j+XuiC++ujaiURrZMG5q882jmilC58hmftyzdR4
	 PCv6G01d5kDG0qBgK2Ph/7iqKRwcPWdbaT5HJKy7yujdYO/ywLoZvoi32yiS9PYOb4
	 WCNGeNpKHCIgw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BF0617E15A3;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 90311480052; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:50 +0200
Subject: [PATCH v4 11/16] phy: rockchip: usbdp: Register DP aux bridge
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-11-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2934;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2RDTD3i97hvqpAcQDq/HnQnUMc4wftjxgYkOHKmJn4U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MmQSSSwrcFXLHqHG6CyyOtH5uQtKKZOz
 +82bfniCOEglYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qam/4P/3vhs4uoTFTRp6OFin+UhI0KhjUsLWVjRF/uTJlIifjNAzP2AceepnakSsVbiFn3A7D
 e89Gq8BgbKfSlf/KrK/x411ZBfKWrjHDc0ks7sFKNW+l5U9df9bXvHhhZeNWvCzCfaRL0ZzRSlQ
 WuqZ4iDT1tfzLdGMugPWGCH57gYAyvZZMFRS7q7+SoKplmPNYXKUY1bvNHAwCQFbp46bk/1P1IY
 MH3zN5g7MUqkKv2VKUbPVandQEDtwvpS+F8+kKvLoaXAJdcNMf2n3fzgHsWJ4ovfDhYUS+FkK4I
 YhBJrJc5EzKymDNIq8omudVQDwy4jjE3KmeUbY3R68ySqPTdXNtN6fEb1Wz4ozQNrGMdDXWRSpZ
 0P9t4l1egmQBY+2iSJ/v66BQxMV4pc4sMi4BSxSy0tQ75y7Dl9/Soce6Df9Y7Jv3+Vki7LANPDQ
 3pZr5spNYsTeqFQpC407taDkjMIURi0tQPrJ1rM9CkWQai/0D8hJM/NT4qCETLzq3/hsQV062dI
 WHd+go/xyBuxsqkj2lOKtl8xn8ogAGwkzpZFtoBw+bQUdIRkSiZMLKXQ9hjKFKt9LacwUnQEo3F
 VsvxxTmyhGPr/U4USlal6mjkms172FRzxxb93wqaygfBqHeSgPlsD3NPMoAVx8AZYEsU01E5114
 dmUpA6ncUrKq3JrInpeUyAQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support to use USB-C connectors with the DP altmode helper code on
devicetree based platforms. To get this working there must be a DRM
bridge chain from the DisplayPort controller to the USB-C connector.
E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
        refcount: 7
        type: [10] DP
        OF: /soc/dp@27e40000:rockchip,rk3576-dp
        ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
        refcount: 4
        type: [0] Unknown
        OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
        ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
        refcount: 5
        type: [10] DP
        OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
        ops: [0x4] hpd

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/Kconfig              |  2 ++
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607..39759bb2fa1d 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -136,8 +136,10 @@ config PHY_ROCKCHIP_USBDP
 	tristate "Rockchip USBDP COMBO PHY Driver"
 	depends on ARCH_ROCKCHIP && OF
 	depends on TYPEC
+	depends on DRM || DRM=n
 	select GENERIC_PHY
 	select USB_COMMON
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	help
 	  Enable this to support the Rockchip USB3.0/DP combo PHY with
 	  Samsung IP block. This is required for USB3 support on RK3588.
diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index beab20e4c512..77ad2a89d4f2 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1434,6 +1435,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1492,6 +1494,18 @@ static int rk_udphy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/*
+	 * Only register the DRM bridge, if the DP aux channel is connected.
+	 * Some boards use the USBDP PHY only for its USB3 capabilities.
+	 */
+	dp_aux_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 3, 0, 0);
+	if (dp_aux_ep) {
+		ret = drm_aux_bridge_register(dev);
+		fwnode_handle_put(dp_aux_ep);
+		if (ret)
+			return ret;
+	}
+
 	udphy->phy_u3 = devm_phy_create(dev, dev->of_node, &rk_udphy_usb3_phy_ops);
 	if (IS_ERR(udphy->phy_u3)) {
 		ret = PTR_ERR(udphy->phy_u3);

-- 
2.53.0

