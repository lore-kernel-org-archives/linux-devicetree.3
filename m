Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C2542C513;
	Mon,  3 Aug 2026 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780313; cv=none; b=F3jdFT2yQVfmzWIQahMTpieHol1wUPiiRbmoaI8HDRvveSqXnKVCsYOEGdCLckDmP/RoscCoTl627IIBIScw04nhwv5eecyOHvvn5U86yX97a0hJ/ZJfCJb9kJ069IVSWy3+bCwrJprI/JnZh3oBpIRAn5W0HCE63wgLQBnHsBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780313; c=relaxed/simple;
	bh=vWHtus49X0hw1sn+NkpE62a91N52LNCAbMBD695LMik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PK+nTr8aSb8peDLR8G9Rf9ofzS4jigrJEVNi5tIyJQIoZaDfiFqsIonkSeJJW86aCCXM8Gu9Tt8DHK/f2XH/R7bJSM3o5wNg2Xd0TPzG6zAqKOuIUvEUHa4MewNNOrQKmrHfoMTFcSYNxOEMNlBoXloz3qbwHw61JaCVHzY20AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QgldZm3H; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QgldZm3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780304;
	bh=vWHtus49X0hw1sn+NkpE62a91N52LNCAbMBD695LMik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QgldZm3HZ596a7+ZAgIJJ3KGQ39ltqVuo+XHbifbcaGT30m5Bp3AgcNFzBG5UjjzW
	 A3t5xQCsD7SC+XykgOXN2s2WxGhpisxx8e3RdF9Uo/JmKqtoAyIAo1uXf9mZ0tC1qj
	 oHaJqGt/BzsFQPDeUDiqVAEN2z57vKnZpKjBswUvqCHEpxISe5K+IJo76jXLC31R47
	 vGG5LCePCudaPLUQy1DrwxpIFeMUHv/hkHIKgc090EqTwBVQ5y4PepnoeJnBZDvCGp
	 yIYZ+UwxKRLgpWCdTlPOOhOOjGfzYpTxyAlcIIuv8B2OfcOR17JxuKJHRMv9QevLv1
	 fR6F4YNVzr8lA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BD6517E11E4;
	Mon, 03 Aug 2026 20:05:04 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 707A5480048; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:12 +0200
Subject: [PATCH v9 11/22] drm/bridge: synopsys: dw-dp: Add follow-up bridge
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-11-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2515;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vWHtus49X0hw1sn+NkpE62a91N52LNCAbMBD695LMik=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E6snqkjQpQJoi0luDT4tnhQYhv3lMHaf
 msTkh3eVHWWIIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhOAAoJENju1/PI
 O/qaWfYQAI87lpMK3uwNe3zeQu6zC4e7IS7Ze6gpM3Sb0wAdWcSpxAHBGioyqZwT5c4rip0EYnM
 SfUP4Ll7zdO/n48x/BhlZ2r5w+GSKgk5jNc1XmHpDSYvg1DnD4kPcT5wiYTSsURRlvXFnBpEa5M
 JtxB8BytquQfx8PZsEsUjlZ73Kt2l/A+ydrNya3flif2DOe2SEoGDXVkihxUSi4iinjvC7xx4FM
 ffVOnDx4wjluznyMQmOwJyW/RERNSLIJ/GACJfmhnsddcAUbjk+lRonghpOe4oqZR4pEP23yr3H
 FHdvwLJ61BlRQ0h4O+uNz9pFXsgU9XML9/8uRiJNlaEsJf5nAAbDF9qFWBcuQHK4BXXRIEhwY/5
 iOa/NFBB945//Z13Uddz+0V8QEMBPzkLLFy/dI+uPe26Sl7XxUlhW0qwGOqGw+/4jjqXS+tnLIL
 2/c5Q/lsBm02Y4hYoMXsU/h/KMQ8lPmt6y+gKK8YnL8XRS3I7L8sHJP+4Vs3WU208VVDBP3ror0
 ZkY2v3kDG1JIOpOwaMSmxzOpeMlDOzxQ5ftRwXtSeymWjJE0CdTZO+u10CHjY/tOfH8CBKwL2N/
 Lhm8z9GIjT8V7H7EoA4rXi76rmimaIGYLBBZpmjzu5+pJ2VOcbUVDEtkKufuQzAWLigCjUdUFMc
 ZPmbz3BuUD86I1JTEzz4tIw==
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

It's fine to fatally error out when there is no follow-up bridge
as the Rockchip Designware Displayport controller is the only
user of the bridge helper and has the port marked as required
in its binding.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index e60dab0d3b9d..577ec42c94a4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -330,6 +330,8 @@ struct dw_dp {
 	struct dw_dp_plat_data plat_data;
 	u8 pixel_mode;
 
+	struct drm_bridge *next_bridge;
+
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -2049,13 +2051,31 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to attach bridge\n");
 
+	dp->next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		ret = PTR_ERR(dp->next_bridge);
+		return dev_err_probe(dev, ret, "failed to get follow-up bridge.\n");
+	}
+
+	ret = drm_bridge_attach(encoder, dp->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to attach next bridge\n");
+		goto put_next_bridge;
+	}
+
 	return 0;
+
+put_next_bridge:
+	drm_bridge_put(dp->next_bridge);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_dp_bind);
 
 void dw_dp_unbind(struct dw_dp *dp)
 {
-	/* nothing to do */
+	drm_bridge_put(dp->next_bridge);
 }
 EXPORT_SYMBOL_GPL(dw_dp_unbind);
 

-- 
2.53.0

