Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFEE334685
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303354; cv=none; b=OywqAOh36KXZ1UcP93XDwNDWY9FqGPBhAIcP48L58PEJ9fFVVXhSQc1Z2/TrQLgRM9s9hmLSQVsh0L3AgiIq0rKe9Bg3WAMvP/Y38wdkQm/HU+IgZiEz5eCO2CzXXXvtVOdRkMz0iXqNYc7rqeJuNngZ1RpYvB1F5zJb7jBNQvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303354; c=relaxed/simple;
	bh=c/GUjtFdMpaXGSx7flx2uMuqCQ7tz/ZYDJJJvOysAMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/vwB9PqVYEthjg++ESUyPhhQ7HtgZGOHo5FZfV4Tw3hrfGZUsIXiy5YtgCOuZZuqWHVLNZKMcp0Aoj27PB6OI0G87ATbKc05uK1V/fZR//R7VzyoVOYpYAA8BX8IGvKsWL6QT4S6cU+9aE/MNVbn31KHJ1sYAhLL6TFpF9tKjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=aFkAH6od; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="aFkAH6od"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so129024525e9.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777303351; x=1777908151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pie8QbWldg5VNEJDsI0ovz0KroQYVuPXc4fMQ9N0ZIk=;
        b=aFkAH6odWsEWeAGk54eknFnbNnw2rLBc4HXi8yvH/eULkCS1ZWCKWIjly2PhbMIjYr
         OYSCxyYAB3aqHuGHXc4Isi+UgDkStE0qntyeONzaZmBCCPnLjMRsfJrOaB8Phak3Tw55
         +1OZqhDDBUdJjJ1DblCL3DrEsPNUZQRBKE0qHW8u4jZaZZEQJMAouSdtbGzr9hKYEJsc
         Ndt1Fec8YoXR1kDuprqd+zlRRJpY11OvVh14cAYRsA26Ow+pZ/iEKgzjrC9uIdDbEmvW
         jlIdBJhqeKgLsga0EHGIiAtE+4VUx7kYZXCX1Z9PtP9Zll9qkKt0sFRR6pLMkOddg3GG
         TRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303351; x=1777908151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pie8QbWldg5VNEJDsI0ovz0KroQYVuPXc4fMQ9N0ZIk=;
        b=raeaiYL2GKPNoyJsCFg+t17YTz8eclRgMUKqVjIk257Nw5UNJUCsOb6MkNaVat4w8B
         K8ZpGKTt1Qju9ycPhyLytzlXKdgMm3JLs/ZOK5zgtO0GjfGOPjBKNMidEAH1GI9h6Gz3
         9fRW7XLsexWd6/pT7EatYnHwv1wdMQAbNxjEpODimIWVP58+oGGkLgc1z5WF4V/hQ0Tl
         L5dNBUr3kYeQjh5M4BWKlJnqCvFNgicCCMizL2r9YOMdcG2DCaEf0pMHQF/CVo34S91m
         d6LJB1VyxoGLw3QScmswJZqIIf26LEeRDsJW+utGW6vKmk4nT+bU04rzbh7sT9PqXCeZ
         soXQ==
X-Forwarded-Encrypted: i=1; AFNElJ97TqfttaglYmUUJE5oCEhuEmMk1nCPrg8Rlk7nRVcC0dYufpFouICaIGsFuGyFoJPnbuju7oIbf4E/@vger.kernel.org
X-Gm-Message-State: AOJu0YzCHaElqVvgD+CmS6oXvqvOArNPCfHtq81Zy4N4Ur6DxBwPtbP3
	GFbNLAi3d1k9qvFKo3eW5bmHj+hNVTlTWv4igPHhbrpJXOw55xb8oaRfqmCg8qGx34o=
X-Gm-Gg: AeBDievjJseOX3NqHiMeZLLbES5LniXvHvggG0BXD29LbaPQxmn8xUPhfzs4B2MJD5Q
	2NoGR5JpRLGF6I4z+ryiowZ2UcvsDj5fzt3A/Hpww2eCIqtfBVqKBNUQJA4ElgvQSWXgN6NDuFI
	xUZj4TcIU9X6hRvGty6H3ocpueRSmA44E0sTsJTEKxZ84EQsSUWKzr+ZzO9lFc1E1i0+O+w5u65
	ZZcPztlXSvG7ur2LCeVeb1zXvvD3pSxWAxQauZTXsGMVOPOs2JpJo7YQOz1MDSWuhfFA9T4Jlh3
	XlGhYC5MwcBJBE8RXQ5IxVwMxC2zcgY8ueaLF1NCQLAkJhDun3YcYHUaDDuPsilMYAO3YlwBCVY
	qopaLsVJxCKTUZBaaKOUA4+lUFeXZYpMr8C5DScPAK91/CZmUZMlgfGzr+D83M32CjWBguG+x2i
	FUtqn/KZYBrfB85UfEXXAstagBStyZDbSAbUYMNlxfzplWSrZ5iQBH+AUJ2ohDSsMNrzhVzTgTa
	VDbmS5B85cLFE4gFDgsk+YB3BLSaw==
X-Received: by 2002:a05:600c:4509:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-489e126ba91mr422703385e9.25.1777303350864;
        Mon, 27 Apr 2026 08:22:30 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm861247695e9.2.2026.04.27.08.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:22:30 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 27 Apr 2026 16:21:10 +0100
Subject: [PATCH 2/2] drm/panel: Add TSD TST070WSBE-196C 7" DSI panel driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-imdt-dsi-display-v1-2-bb2768de120b@imd-tec.com>
References: <20260427-imdt-dsi-display-v1-0-bb2768de120b@imd-tec.com>
In-Reply-To: <20260427-imdt-dsi-display-v1-0-bb2768de120b@imd-tec.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add a dedicated panel driver for the TSD TST070WSBE-196C, a 7" 1024x600
MIPI-DSI TFT LCD panel using an EK79007AD controller.

The driver supports power supply control, reset and enable GPIOs, and
the backlight framework.

The initial driver was built mostly using
"linux-mdss-dsi-panel-driver-generator" [1], reading the downstream
file "dsi-panel-imdt-tst070wsbe165c-video.dtsi" [2].

[1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
[2] https://raw.githubusercontent.com/imd-tec/meta-imdt-qcom/refs/heads/kirkstone/recipes-display/displaydevicetree/displaydevicetree/0001-Initial-bringup-of-IMDT-Display-3.patch

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 MAINTAINERS                                       |   6 +
 drivers/gpu/drm/panel/Kconfig                     |   9 ++
 drivers/gpu/drm/panel/Makefile                    |   1 +
 drivers/gpu/drm/panel/panel-tsd-tst070wsbe-196c.c | 168 ++++++++++++++++++++++
 4 files changed, 184 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ae8a01f30ff4..6e80d9916a10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8414,6 +8414,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
 F:	drivers/gpu/drm/panel/panel-tpo-tpg110.c
 
+DRM DRIVER FOR TSD TST070WSBE-196C PANEL
+M:	William Bright <william.bright@imd-tec.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/tsd,tst070wsbe-196c.yaml
+F:	drivers/gpu/drm/panel/panel-tsd-tst070wsbe-196c.c
+
 DRM DRIVER FOR USB DISPLAYLINK VIDEO ADAPTERS
 M:	Dave Airlie <airlied@redhat.com>
 R:	Sean Paul <sean@poorly.run>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d6863b28ddc5..aef00b43c1f1 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1227,6 +1227,15 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
 	  Video Mode panel
 
+config DRM_PANEL_TSD_TST070WSBE_196C
+	tristate "TSD TST070WSBE-196C DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the TSD TST070WSBE-196C
+	  1024x600 7" MIPI DSI panel with an EK79007AD controller.
+
 config DRM_PANEL_VISIONOX_G2647FB105
 	tristate "Visionox G2647FB105"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index a4291dc3905b..1653fe7b45c5 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -121,6 +121,7 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
+obj-$(CONFIG_DRM_PANEL_TSD_TST070WSBE_196C) += panel-tsd-tst070wsbe-196c.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_G2647FB105) += panel-visionox-g2647fb105.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_RM692E5) += panel-visionox-rm692e5.o
diff --git a/drivers/gpu/drm/panel/panel-tsd-tst070wsbe-196c.c b/drivers/gpu/drm/panel/panel-tsd-tst070wsbe-196c.c
new file mode 100644
index 000000000000..7b639728b3bf
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-tsd-tst070wsbe-196c.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
+ * Copyright (c) 2026 IMD Technologies Ltd <william.bright@imd-tec.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct tst070wsbe_196c {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct tst070wsbe_196c *to_tst070wsbe_196c(struct drm_panel *panel)
+{
+	return container_of_const(panel, struct tst070wsbe_196c, panel);
+}
+
+static void tst070wsbe_196c_reset(struct tst070wsbe_196c *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	msleep(200);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	msleep(20);
+}
+
+static int tst070wsbe_196c_prepare(struct drm_panel *panel)
+{
+	struct tst070wsbe_196c *ctx = to_tst070wsbe_196c(panel);
+	int ret;
+
+	ret = regulator_enable(ctx->supply);
+	if (ret < 0)
+		return ret;
+
+	msleep(20);
+
+	tst070wsbe_196c_reset(ctx);
+
+	return 0;
+}
+
+static int tst070wsbe_196c_unprepare(struct drm_panel *panel)
+{
+	struct tst070wsbe_196c *ctx = to_tst070wsbe_196c(panel);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_disable(ctx->supply);
+
+	return 0;
+}
+
+static const struct drm_display_mode tst070wsbe_196c_mode = {
+	.clock = (1024 + 160 + 12 + 160) * (600 + 12 + 10 + 23) * 60 / 1000,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 160,
+	.hsync_end = 1024 + 160 + 12,
+	.htotal = 1024 + 160 + 12 + 160,
+	.vdisplay = 600,
+	.vsync_start = 600 + 12,
+	.vsync_end = 600 + 12 + 10,
+	.vtotal = 600 + 12 + 10 + 23,
+	.width_mm = 190,
+	.height_mm = 121,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int tst070wsbe_196c_get_modes(struct drm_panel *panel,
+				   struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector,
+						    &tst070wsbe_196c_mode);
+}
+
+static const struct drm_panel_funcs tst070wsbe_196c_panel_funcs = {
+	.prepare = tst070wsbe_196c_prepare,
+	.unprepare = tst070wsbe_196c_unprepare,
+	.get_modes = tst070wsbe_196c_get_modes,
+};
+
+static int tst070wsbe_196c_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct tst070wsbe_196c *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct tst070wsbe_196c, panel,
+				   &tst070wsbe_196c_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ctx->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(ctx->supply))
+		return dev_err_probe(dev, PTR_ERR(ctx->supply),
+				     "Failed to get power regulator\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void tst070wsbe_196c_remove(struct mipi_dsi_device *dsi)
+{
+	struct tst070wsbe_196c *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id tst070wsbe_196c_of_match[] = {
+	{ .compatible = "tsd,tst070wsbe-196c" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tst070wsbe_196c_of_match);
+
+static struct mipi_dsi_driver tst070wsbe_196c_driver = {
+	.probe = tst070wsbe_196c_probe,
+	.remove = tst070wsbe_196c_remove,
+	.driver = {
+		.name = "panel-tsd-tst070wsbe-196c",
+		.of_match_table = tst070wsbe_196c_of_match,
+	},
+};
+module_mipi_dsi_driver(tst070wsbe_196c_driver);
+
+MODULE_AUTHOR("William Bright <william.bright@imd-tec.com>");
+MODULE_DESCRIPTION("DRM driver for TSD TST070WSBE-196C 7\" MIPI-DSI panel");
+MODULE_LICENSE("GPL");

-- 
2.43.0

