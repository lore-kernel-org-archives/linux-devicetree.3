Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404673AEB2B;
	Fri, 12 Jun 2026 16:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281329; cv=none; b=k5wC7xIE16FIbhwZzg1+f/wReCB8fcHQajGuVftGx1rpcFvQW0Cr54qbQB1HvRnFqe7UsK6cpUwfHqILAZFQgYaYA8r50SlMCGrsKUUnOUJTngv5j6wTHco2nptxDHk/gCS3DzgZ68jALbIASyPoMdiddcEc1SCcXKuDYoFkS0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281329; c=relaxed/simple;
	bh=MVMfIZtkk4nAgZ22KBPvUU3n0MroH7NTfE4TBkpE844=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4V2Gysr7x7Mf8670udTNrZpkYMpXv7j6thHlS7iKRud2ebFpI8D9yqSZjSdFywKWf/5nxLLWxxU6BKE4ktPvcvDy+AFV0zJt45iMpgPKjyDP66Z56LAu4csCoO8fseFMtWyngODzeGSm6A+MCIzOF/ciq0FDxBvTk/PsHbzcS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jT6xJVhJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jT6xJVhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=MVMfIZtkk4nAgZ22KBPvUU3n0MroH7NTfE4TBkpE844=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jT6xJVhJAy/eKWGJessVl79D4cB+aC1bzK0qV9+7VuT0fcPJHl4Bnv77kOkT0WrHk
	 87bZUof+75K+JnfEPzyZoBGXNm/B65NenZm5gxfaiaOnm1xlCc03nMH8KC/xe5s6lm
	 yyVr22KTKnGtyhieBGKRnDzEQIy75Rp2bGFfSGYr00ujEqkzaWEkKMMG1X2g4doVkV
	 SZYhbrLmFFbX/ykSZfs7Qu+OPZsiYpxWAE0xQ1h+TLDk7Ln8lu2S3ujODfo5QCFFEt
	 lVa/K97hXxwgC9NlzDiY4aQjIn9ojf9pJg4zojL7o4m+/4CbcHV1wEmBB3t9KSl3iv
	 iSL3ZicNQK/lg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 95ADF17E1168;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D480C480047; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:49 +0200
Subject: [PATCH v5 11/18] phy: rockchip: usbdp: Register DP aux bridge
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-11-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=MVMfIZtkk4nAgZ22KBPvUU3n0MroH7NTfE4TBkpE844=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEBh1Hv2z2PV3IUqtx8Z1QVAAEat7Z1N
 22sWyo3+nESvIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qaaeoP/1rpWuqOCJqRpDtJqa7F7B4nvZgWvrdIbFQIkvo0zJUoasW31mtcMZH3vJh/oOb7oqF
 5GnI7yxSPaeOc9xeKLsNi3PLw8zD2Hm9WbGIQe/ymVJLLMhggnEiSo490vOH1DnyRXylp6sjz9M
 HjBbOyzjIYmg/w9wXRD97dIdYUL7G/P465SCK7VIlgJxpcEFEOHTnZPZuq6OdEFc7Ly1LyFUj3y
 h9XiXpKni3rMH6OhGwbhwmRaqS7vLiXVJfmE8NVd4QuE/MIBWTKsR9N6qG1gKRxg1ifxZG4r/7q
 noOnu0bn86C+AAKiuEt9x+4Cn9482ZmS+dfXUV4adoy1ij0nAGvTRpPyRoiQ6ARyO+yJtbxcjaP
 kymue1NctR69n4AHUpeypkIfVJyjb7XbEKkFlyMJtsdNCRtRxhnCFnPgTsb/cLPyR9xH4DSlWBJ
 1Ts+TyvuXwTF9N3Yb1QLp2Dq8s5UWLzOZN+NCaSLWnZSaEcEd5mO6nty+jn0FJxlqgJrO8QNR/A
 7ztvRCfQ0zuzW7jGiNNxFCxGe/oMTl4sAY+x9t9FRvMdD4k7fERUJnVdqTbx/CcDi6jBpzc5PT/
 TWtm/iY1DEFdXJw0o7k3Ela8lGmj7vkKBPsTTwCe9NG8HjP2/e1cb7jVO9I+favrs4SYljzRYCj
 NSb8ZAQsMhQMsrBfTORk2aw==
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

