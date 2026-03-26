Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C31426ED5;
	Thu, 26 Mar 2026 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546307; cv=none; b=m4M3PGtnCr3GDauozvogj4i2mabEXAYkbYpD+XZq50qiM8eRvZvxdHynoN8MtwWPgJYOT+3q/KOpWN6s4EzCc4rE92TN/pVqUmM0fpHC7QxEIEo2GoPVVqL/Fj7c5yRuIx/jHKhybaXm/Ta9SQaoKcmufE3BF3LUPm6gkIvRUfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546307; c=relaxed/simple;
	bh=F8JAjw7zuFpQ0NaM9MjWnMhCvWSZlJX0EsmVnxMtSKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1rvKdY4Ez4AllVeD3QZpBIWDYtvi0GvXCfXRBeL38HO6jUWVO12dtZRcO566UKNmgLWHUdwObJ7Fuh08w8RNEOXE4zQBz8DsAWDtrOcewwHLjccoQ1jtAD2jS+fXXtVNtZNzYLlOChtt4pLdLrSgf6rXR5SaEiWEFZmwL3uuOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RqvAEkDB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RqvAEkDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774546298;
	bh=F8JAjw7zuFpQ0NaM9MjWnMhCvWSZlJX0EsmVnxMtSKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RqvAEkDBBnfVkfv8HZIRJd5sSoFDIicDfbfvbGE2IDHWH9KzCBt7+s+9qlNugDg/h
	 lvx9xJxqazzWqi4+Z1p3zIAFoYDydkb6qCl710bu7kWaVeRju1/e3lLdxun+8zXUcd
	 Ky5WbpjbazNc8nfciWgrSQNsW8vLV1WeVnO4s3i1xW8fvEPNAGpp8TQF9uR/G3/J5u
	 /ddUmdMgNBREosgIJV6ramH0AkPOjH9C6DMV2t0sl845i6VcHOz2tlRqvwlBYfIOzQ
	 5SltSl3scDkAS/T3/eNoCx6CGAA/x4EuI0/6sWrZZLcfC47EIcx4iSjahd97mQpSUE
	 GzH/aXHUjvY3w==
Received: from jupiter.universe (dyndsl-091-248-208-149.ewe-ip-backbone.de [91.248.208.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 880BC17E618F;
	Thu, 26 Mar 2026 18:31:38 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 418EF48002D; Thu, 26 Mar 2026 18:31:38 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Mar 2026 18:31:27 +0100
Subject: [PATCH 03/10] drm/bridge: synopsys: dw-dp: Add follow-up bridge
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-synopsys-dw-dp-improvements-v1-3-501849162290@collabora.com>
References: <20260326-synopsys-dw-dp-improvements-v1-0-501849162290@collabora.com>
In-Reply-To: <20260326-synopsys-dw-dp-improvements-v1-0-501849162290@collabora.com>
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
 Conor Dooley <conor+dt@kernel.org>
Cc: Damon Ding <damon.ding@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=F8JAjw7zuFpQ0NaM9MjWnMhCvWSZlJX0EsmVnxMtSKc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnFbXlSm0BskU2K+eIvRC3EQjnd0YNvceXZS
 Isa6hpg1H8Ta4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpxW15AAoJENju1/PI
 O/qaqhwQAIoD9cmmn+KtfXZ+6pSS5GjMwJRAQDFsDEF2VfUxha3XwrtIoVyNqtmoIy0rBxL69hw
 aa1C9mjlrj0NsWzYbG+9ohoRTxHt4cRlsbSTxU7vq6PwaoNI1Ad2YBhVCL1eABsw5XmPSQ5r3L2
 O2z6dxLmFEimjk0s3ofczG2E0lxw8UvIpna4tP/KosGrudM6yTBKrM88QyWZs+rJ0cBCx5/NZLf
 8DNUMxoxRPhkLIZWOlu9W12bcfmwFLlzlo5lCVXJzEw7nvIp7cJAzrZ1wlkXwG9fTid8m9KuBMI
 A/TAqCgm+XDvXlJDkuQqeW387a6bTY0qgXtny6l+pLb4Pi8C1ETA0VR9I6GMjt+9cmva9AeLTpX
 vIrFQ39RH8NL/pvsORlsJrfvOzy0FP6j6DErCjhweFDOOkaAtWSpGuI915rIRglFJBJ+IH91BOk
 NGN5oDQHGohOpTBibcC1+YkX/3Z3qOboGFYBF8lemwP6s/W1oOnfZaZxlfAwIj4vtIKB98FaNiJ
 Bk9YrdSpXreG9O5L9ZBqkK40xfVQqitsgmAf2sX69cfrEY9NrTw+KYklaqjva7BBAPLAtcTI40C
 bYT+1uLNLcEN+WtCTO8Tahl3euWOhCZE4YX4Dq62CxlHUw0Sp/4gGXQjsq8TanRTzd21T6qouKJ
 88aIEnf6AEtdb46OhdLkn3g==
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
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 222862d962d9..c3a108f1faa9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1978,7 +1978,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dw_dp *dp;
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge, *next_bridge;
 	void __iomem *res;
 	int ret;
 
@@ -2072,6 +2072,20 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 		goto unregister_aux;
 	}
 
+	next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(next_bridge)) {
+		ret = PTR_ERR(next_bridge);
+		dev_err_probe(dev, ret, "failed to get follow-up bridge.\n");
+		goto unregister_aux;
+	}
+
+	ret = drm_bridge_attach(encoder, next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to attach next bridge\n");
+		goto unregister_aux;
+	}
+
 	dw_dp_init_hw(dp);
 
 	ret = phy_init(dp->phy);

-- 
2.53.0

