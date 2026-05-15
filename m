Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17EF3A9618
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883740; cv=none; b=CdSqxX9MzKDRMIhTYyrgkCIozqXzeTfWf36jbnm2E+y1syNKHbjFXCPe6fnG12ixO4yZIzMCYFVQSKzg8kbSCgGDPyLcXyphcKtBU+3Sk/f8Fk7GWBNbeBLl9VyzKObY3mqYvffJq3tzj/CXD2NUvzuotTsYPNcyKDtjVvox7rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883740; c=relaxed/simple;
	bh=TquKKR9UcVTMpkFtOj/I3nSEnHBfRmzWKqYVu2y2pcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/txdljurzkuYsbQA10Eo0zTeOxPZ+2cQyYSMs21cC46HivEg/TZIc+uJI2NNVNEkbPuL0lpKrg2cKFS07TIEoR3QJcXQ85ioIyWlyV045so33jloex3w6iSs7L6O8jgVLNt8yjjdAIA7/DnvryJp4PDlWxPUib14bfUlzQl6oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkntIw5V; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkntIw5V"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-479e4835e26so264115b6e.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778883738; x=1779488538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wtvOcai69XcWF/Ct6xFuI8j0ECWde3gbDf9/gqtZgw=;
        b=IkntIw5VRJ5M7pbRLWl4wzBPcppNPAADzXZC/Y9c/+aouKhWrp8yPAhy6nNGC9RVKZ
         DAuyGLiHWkkQGZqnNiokwbDkTq5hr6l0l80itVTFVY9BTMNKItesFUQpXnZQpy18dB91
         7W1SJ/46Gw5gcE7Ig5dOnRdlzDLFw2SfdMx/2qIkE6r3jo+kIe8tFqf8EZ+pygqumVda
         sZBG5REJsd+Y1u6VOv5iPAcnPLzxiEfQYieObpfWIuinfW2e7/ghdx4u7C6iBVHGd2dU
         Yw7mz9KvQgx/V0LGSvThVw+G6G365hELuE85WEjWi4Ru+4wi0frLnN7xR35zlf8tMIko
         2iHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883738; x=1779488538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wtvOcai69XcWF/Ct6xFuI8j0ECWde3gbDf9/gqtZgw=;
        b=r5t9esp3uHHegAbenPHXgNv1a1Q66Z7ieoEHiPmtnSmd+1wtKpFKxuwASJRyZG755x
         jNnyIXf6WaGNJg+rVTT2kANZBzFhWRujOjHVlpgo18sg/209CS+/fO4UWc+3OaSrQ/Cw
         XwWtLLT6aTpMQtV+3e5waMYNNAPcMprKsjw5StUorgKVw0PMLHPUc5hVWi6fV3QhoRY+
         Gbj2zFH9nvAEJ7btvPc0TeNLxm7hqi/EtfT20xIFFjvaD7iXoAY2UHS5aPO9kb5XMRXQ
         VdFSDtQ1jg94BLtGZ8ulUdxkdAQRgSYQEzUAnBOqseh6IJfJW0eT3FG8aqQnDVn6YWPp
         xX3w==
X-Gm-Message-State: AOJu0YwfvU2dsfJiEG2651NIFYYnr1f3HbpdIh0h0+i8/OaogGDKtx6N
	OGMeSBtzQnZFoOSzgJRaAL0FN1NvuMBq9NMxzsSaZH2dYXpaVB6pS4XG
X-Gm-Gg: Acq92OHer/tjAkOX5M6vhvexTgVoFJDzGr4W16ImJp2C0lh1ZPXmxncDa/rEj3Hw5zr
	k1opjNTAHmfhDelcixDlbbxw9BYWHZFdLS8SLcjXUqigxVoAugMlFq185ym0Zk3rfOAtCkfdTWs
	/lHuTp6Bv9IVWIUyG+mvLCw9lm0lErs2Q2e5M0tvOu7G8Wk/dZgJeH9IEPS8xJMsUEI6zUDVQ/c
	hB7V2qtqPSSPTqCNXV87qyJzqcuUvgczeSVsHo4ti4Iw8bNBVK7db5eovzY5cYg+hTnkNM/mbWV
	+/pfq19d5cfHsxuCaM225z3kKRUOzUCBc4ZxSL9OdmXKGyCxnQNeE2R/AvbVyecWF1eEtzOOPKs
	P1MevIjOsVKMgTps7CSWLzI56IA2OPpeYPuyaB5QyNItCTXqupXs8mWh69I0Yd5DvtYQNu8L/jz
	B+4OsA4eg8BDv2hRw/s6Cl2uu1uH10z6HMLx/ZixfgfQ==
X-Received: by 2002:a05:6808:e3ca:b0:467:27d2:96a7 with SMTP id 5614622812f47-482e5613d70mr3034283b6e.15.1778883737642;
        Fri, 15 May 2026 15:22:17 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:8c2e:6a8e:445a:9169])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e568c0d889sm980764a34.9.2026.05.15.15.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:22:17 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 4/6] drm/panel: anbernic-td4310: Add RG Vita Pro panel
Date: Fri, 15 May 2026 17:19:45 -0500
Message-ID: <20260515221947.299229-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515221947.299229-1-macroalpha82@gmail.com>
References: <20260515221947.299229-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The panel used by Anbernic in the RG Vita-Pro is a DSI panel based
on the TD4310 controller IC. It measures approximately 5.5 inches
diagonally and is 1080x1920 in resolution.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-anbernic-td4310.c | 291 ++++++++++++++++++
 3 files changed, 302 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d592f4f4b939..61dd00297ecc 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -17,6 +17,16 @@ config DRM_PANEL_ABT_Y030XX067A
 	  Y030XX067A 320x480 3.0" panel as found in the YLM RG-280M, RG-300
 	  and RG-99 handheld gaming consoles.
 
+config DRM_PANEL_ANBERNIC_TD4310
+	tristate "Anbernic TD4310 LCD panel"
+	depends on GPIOLIB && OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here to enable support for Anbernic designed panels with the
+	  TD4310 panel controller such as the ones used on the Anbernic RG
+	  Vita Pro.
+
 config DRM_PANEL_ARM_VERSATILE
 	tristate "ARM Versatile panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index a4291dc3905b..9d8f70c9de3e 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_PANEL_ABT_Y030XX067A) += panel-abt-y030xx067a.o
+obj-$(CONFIG_DRM_PANEL_ANBERNIC_TD4310) += panel-anbernic-td4310.o
 obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
 obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.o
 obj-$(CONFIG_DRM_PANEL_AUO_A030JTN01) += panel-auo-a030jtn01.o
diff --git a/drivers/gpu/drm/panel/panel-anbernic-td4310.c b/drivers/gpu/drm/panel/panel-anbernic-td4310.c
new file mode 100644
index 000000000000..733c68ff9771
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-anbernic-td4310.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Anbernic panels with TD4310 panel controller.
+ *
+ * Copyright (C) 2026 Chris Morgan <macromorgan@hotmail.com>
+ *
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+struct anbernic_panel_td4310_info {
+	const struct drm_display_mode *display_modes;
+	unsigned int num_modes;
+	u16 width_mm;
+	u16 height_mm;
+	u32 bus_flags;
+	unsigned long mode_flags;
+	u32 format;
+	u32 lanes;
+	u16 prepare_delay;
+	u16 reset_delay;
+	u16 init_delay;
+	u16 enable_delay;
+	u16 disable_delay;
+	u16 unprepare_delay;
+};
+
+struct anbernic_panel_td4310 {
+	struct device *dev;
+	struct mipi_dsi_device *dsi;
+	struct drm_panel panel;
+	const struct anbernic_panel_td4310_info *panel_info;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *enable_gpio;
+	struct regulator *vdd;
+	enum drm_panel_orientation orientation;
+};
+
+static inline struct anbernic_panel_td4310 *panel_to_anbernic_panel_td4310(struct drm_panel *panel)
+{
+	return container_of(panel, struct anbernic_panel_td4310, panel);
+}
+
+static int panel_anbernic_td4310_prepare(struct drm_panel *panel)
+{
+	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+	int ret;
+
+	ret = regulator_enable(ctx->vdd);
+	if (ret)
+		return ret;
+
+	if (ctx->enable_gpio) {
+		ret = gpiod_set_value_cansleep(ctx->enable_gpio, 1);
+		if (ret)
+			goto err_enable;
+	};
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	mipi_dsi_msleep(&dsi_ctx, 10);
+
+	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	if (ret)
+		goto err_reset;
+	if (ctx->panel_info->reset_delay)
+		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->reset_delay);
+	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	if (ret)
+		goto err_reset;
+
+	if (ctx->panel_info->enable_delay)
+		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->enable_delay);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 100);
+
+	return dsi_ctx.accum_err;
+
+err_reset:
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
+err_enable:
+	regulator_disable(ctx->vdd);
+	return ret;
+}
+
+static int panel_anbernic_td4310_unprepare(struct drm_panel *panel)
+{
+	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	if (ctx->enable_gpio)
+		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_disable(ctx->vdd);
+
+	return 0;
+}
+
+static int panel_anbernic_td4310_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
+	const struct anbernic_panel_td4310_info *panel_info = ctx->panel_info;
+	struct drm_display_mode *mode;
+	unsigned int i;
+
+	for (i = 0; i < panel_info->num_modes; i++) {
+		mode = drm_mode_duplicate(connector->dev,
+					  &panel_info->display_modes[i]);
+		if (!mode)
+			return -ENOMEM;
+
+		drm_mode_set_name(mode);
+
+		mode->type = DRM_MODE_TYPE_DRIVER;
+		if (panel_info->num_modes == 1)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(connector, mode);
+	}
+
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = panel_info->width_mm;
+	connector->display_info.height_mm = panel_info->height_mm;
+	connector->display_info.bus_flags = panel_info->bus_flags;
+
+	return panel_info->num_modes;
+}
+
+static enum drm_panel_orientation panel_anbernic_td4310_get_orientation(struct drm_panel *panel)
+{
+	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
+
+	return ctx->orientation;
+}
+
+static const struct drm_panel_funcs panel_anbernic_td4310_funcs = {
+	.prepare = panel_anbernic_td4310_prepare,
+	.unprepare = panel_anbernic_td4310_unprepare,
+	.get_modes = panel_anbernic_td4310_get_modes,
+	.get_orientation = panel_anbernic_td4310_get_orientation,
+};
+
+static int panel_anbernic_td4310_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct anbernic_panel_td4310 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct anbernic_panel_td4310, panel,
+				   &panel_anbernic_td4310_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ctx->dev = dev;
+
+	ctx->panel_info = of_device_get_match_data(dev);
+	if (!ctx->panel_info)
+		return -EINVAL;
+
+	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get panel orientation\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Cannot get reset gpio\n");
+
+	ctx->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
+				     "Cannot get enable gpio\n");
+
+	ctx->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(ctx->vdd))
+		return dev_err_probe(dev, PTR_ERR(ctx->vdd),
+				     "Failed to request vdd regulator\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = ctx->panel_info->lanes;
+	dsi->format = ctx->panel_info->format;
+	dsi->mode_flags = ctx->panel_info->mode_flags;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "mipi_dsi_attach failed: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void panel_anbernic_td4310_remove(struct mipi_dsi_device *dsi)
+{
+	struct anbernic_panel_td4310 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct drm_display_mode anbernic_vitapro_modes[] = {
+	{
+		.clock = 140020,
+		.hdisplay = 1080,
+		.hsync_start = 1080 + 50,
+		.hsync_end = 1080 + 50 + 4,
+		.htotal = 1080 + 50 + 4 + 50,
+		.vdisplay = 1920,
+		.vsync_start = 1920 + 15,
+		.vsync_end = 1920 + 15 + 4,
+		.vtotal = 1920 + 15 + 4 + 32,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+};
+
+static const struct anbernic_panel_td4310_info anbernic_vitapro_info = {
+	.display_modes = anbernic_vitapro_modes,
+	.num_modes = ARRAY_SIZE(anbernic_vitapro_modes),
+	.width_mm = 69,
+	.height_mm = 121,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	.prepare_delay = 50,
+	.reset_delay = 220,
+	.enable_delay = 120,
+	.disable_delay = 50,
+	.unprepare_delay = 20,
+};
+
+static const struct of_device_id panel_anbernic_td4310_of_match[] = {
+	{
+		.compatible = "anbernic,panel-vita-pro",
+		.data = &anbernic_vitapro_info,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, panel_anbernic_td4310_of_match);
+
+static struct mipi_dsi_driver anbernic_panel_td4310_driver = {
+	.driver = {
+		.name = "panel-anbernic-td4310",
+		.of_match_table = panel_anbernic_td4310_of_match,
+	},
+	.probe	= panel_anbernic_td4310_probe,
+	.remove = panel_anbernic_td4310_remove,
+};
+module_mipi_dsi_driver(anbernic_panel_td4310_driver);
+
+MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
+MODULE_DESCRIPTION("DRM driver for Anbernic TD4310 MIPI DSI panels");
+MODULE_LICENSE("GPL");
-- 
2.43.0

