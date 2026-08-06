Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C3386566;
	Thu,  6 Aug 2026 00:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785976759; cv=none; b=mF/BWx2KLOpQawXcklF2+1FY2A0mIwdibtgkPdL24k5lOm42+EeCJQC2D9+E3wuqRXdayrdbdLt15HOsFpPuGFOIgxY40c6ndnzCFK8xB8TflzCuHUccapp6asMF0SaOwfZPv/Vb2nVxBKuQXJLDzjej+xWZloMZ5UrUZHbkow8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785976759; c=relaxed/simple;
	bh=AuKS5pQ+7scVhYQSjD3cnZTP+tgPt5ol6hiWlnneAu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p63/KTPWAwnjMqK7nEqmANhfwsNqWwRMcmMpUf1pFMhaaaJqriuO++3ffNCpg0Atb+hvnEvlkPige5NKvd52rFXXfMycTrxV7znvtThgWnX8H8mwIlGwg3e3C2dprCvJOhjZ0SdUxMqpKTzoptddbnHXIoghiW7d7SngAGqkctE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Idv5+evr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Idv5+evr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=AuKS5pQ+7scVhYQSjD3cnZTP+tgPt5ol6hiWlnneAu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Idv5+evrUgWE2gYPKzAYSJuMMGt0fK2fGa0YVzmusmjn/mi9w694ZXEYM1sZ1iMif
	 TMOmWcSsWfy4Jzqmtm5ch+9M+RnVvuC2XS/QmjgsOJFue7zv5hYM/cUYxyMgkF9oOC
	 ilSZEXZ1VmYk1nfO+Va1+njoU1l0fGP2ERKy99FU1qZmCWOM3t4d6EMa9sjwHYv7TX
	 vN7mp+/oCncStwb1cL/Y8FS2w1bcNATp66kXiNcdInjzsDXrnBfBd28oM6i77LAgo/
	 2c1gUVFyiCbEsPupzRYXPSJMXwdjoPITMhKC3PRw1fbG0ZFfmA8DwnaCrlvA9orQW9
	 yXlRH4Xy2/AzA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 51DCF17E07FC;
	Thu, 06 Aug 2026 02:39:11 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 986E548004C; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:18 +0200
Subject: [PATCH v10 12/21] drm/bridge: synopsys: dw-dp: Support software
 triggered OOB HPD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-12-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3723;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AuKS5pQ+7scVhYQSjD3cnZTP+tgPt5ol6hiWlnneAu8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz164VeC57ES0o/LtiVdALS5O3Qp0Wj8R5d
 +UKuYsy6/N/Y4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9euAAoJENju1/PI
 O/qaNPYP/Rg23VSK5NmLVnF47H/K36zOrgUR9wh+Osc8IBdV37U/XxNmJ+s4SYoqyQcunC+lspg
 HSELnO2W2cetE4CGkwRS7L1KaEdMNROb/XmAGfNtEMY5i/UNXzYLjKsRlVvmmQgiPjsnLn0Mjvx
 Qa6jdPbdinA490MZeL1Hb35VZ5XAPacdw7f/UPZq6vX8It6tdW1fPjJs9Xio+qJLKWlFc90Butt
 r+kQaXyB9Q7cKV3YA4D3tbrfIqTM0KmRWkG/s0bHGQIVqdWKH9GZRO2LVf3D+5ADE0DLC7ld5Ri
 52HJO12ogf9cKFBCfKor3Q4AITkINMU/8nUm8FBZMmdrNxWiYNk8a6ipWlUXu7g4xxDUgTnvp6h
 pfh0J2QFErznXptWb9IISwpHnbz57vB0A6VVkJ3HhoyLtc7RfVDN0//NV4+c+bpPhrlNpXjfMwa
 in4YUXuLBWf6I57yzD1+4+tRnvCxDk8/zLoIzVk4hF1cP/euVA9+e8FH5ZpDyOecYbxWerEldkv
 KeE1k6O9LrXdq+p2hpEygpfUEP01Wn1GE5jqhiOI0m5W23qayml5/M1EpWEQejc7Kf3fiYCfB/I
 ZoGHluyNYDu+tl8FBn7BZH4S1Y6gwamwx9KF96O0SUokIxfZ4AHza8t+dZKqSNSuJwKYsFin1hg
 qtu8OevlXwNEME5dmEUkujA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for USB-C DP AltMode out-of-band hotplug handling. The
handling itself is implemented in the platform specific driver as the
registers to force HPD state are not part of the Designware DisplayPort
IP itself. Instead the platform integration might provide the necessary
functionality to mux the HPD signal.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 38 +++++++++++++++++++++++++++++++++
 include/drm/bridge/dw_dp.h              |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index ce5bf9f107cd..d0538e60ac5c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1874,6 +1874,19 @@ static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struct drm_b
 	return &state->base;
 }
 
+static bool dw_dp_is_routed_to_usb_c(struct drm_encoder *encoder)
+{
+	struct drm_bridge *last_bridge __free(drm_bridge_put) = NULL;
+	struct fwnode_handle *fwnode;
+
+	last_bridge = drm_bridge_chain_get_last_bridge(encoder);
+	if (!last_bridge)
+		return false;
+
+	fwnode = of_fwnode_handle(last_bridge->of_node);
+	return fwnode_device_is_compatible(fwnode, "usb-c-connector");
+}
+
 static int dw_dp_bridge_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -1909,6 +1922,13 @@ static int dw_dp_bridge_attach(struct drm_bridge *bridge,
 		goto err_put_next_bridge;
 	}
 
+	if (dw_dp_is_routed_to_usb_c(encoder)) {
+		dev_dbg(dev, "USB-C mode\n");
+
+		if (dp->plat_data.hpd_sw_sel)
+			dp->plat_data.hpd_sw_sel(dp->plat_data.data, 1);
+	}
+
 	return 0;
 
 err_put_next_bridge:
@@ -1933,6 +1953,19 @@ static void dw_dp_bridge_detach(struct drm_bridge *bridge)
 	cancel_work_sync(&dp->hpd_work);
 }
 
+static void dw_dp_bridge_oob_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
+				    enum drm_connector_status status)
+{
+	bool hpd_high = status != connector_status_disconnected;
+	struct dw_dp *dp = bridge_to_dp(bridge);
+
+	if (dp->plat_data.hpd_sw_cfg)
+		dp->plat_data.hpd_sw_cfg(dp->plat_data.data, hpd_high);
+	else
+		dev_err_once(dp->dev, "Missing platform handler for OOB HPD handling\n");
+}
+
 static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.attach = dw_dp_bridge_attach,
 	.detach = dw_dp_bridge_detach,
@@ -1947,6 +1980,7 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_disable = dw_dp_bridge_atomic_disable,
 	.detect = dw_dp_bridge_detect,
 	.edid_read = dw_dp_bridge_edid_read,
+	.oob_notify = dw_dp_bridge_oob_notify,
 };
 
 static int dw_dp_link_retrain(struct dw_dp *dp)
@@ -2108,6 +2142,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 
 	dp->dev = dev;
 	dp->pixel_mode = plat_data->pixel_mode;
+
+	dp->plat_data.hpd_sw_sel = plat_data->hpd_sw_sel;
+	dp->plat_data.hpd_sw_cfg = plat_data->hpd_sw_cfg;
+	dp->plat_data.data = plat_data->data;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
 	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index a82412a9e769..79b2cdf0df99 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -20,6 +20,9 @@ enum {
 struct dw_dp_plat_data {
 	u32 max_link_rate;
 	u8 pixel_mode;
+	void *data;
+	void (*hpd_sw_sel)(void *data, bool hpd);
+	void (*hpd_sw_cfg)(void *data, bool hpd);
 };
 
 int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder);

-- 
2.53.0

