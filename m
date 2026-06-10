Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF52D3A7C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102798; cv=none; b=evEynPSP42c8KAkute8T/6ZgFCkF0kk8kNOyWA6eTAoRt1sPTgioT1xAz9Rd9VV0IpmNJKjGQyoBcp42uTRZX+cYN3/M3VboGMdbrzm/RqW/4Zn7m/HxkYyXbyL9WDFLdUE9sXbNsAr0guIsEd5G8E7ACqniRUK08H1c1AmZcsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102798; c=relaxed/simple;
	bh=/nTVQvwZY2hEBL9WAdNJqvjaC5NssO/stfjGFF0yCLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRke9uTYFEG6Lf9eQko9LFFRUYi64jh+LPF/YSbPXrEK9UENOAgj3g7hAEOC3Ue1NMpBN8amQrM1+9TajLwE8CW/gfqToUrhuyJDXfu+paO/F7gIc9LoV9QxejBsPnoMO6W12eeMY4IBF6mdOWDEp2u3sPaZwWDrE/DmU+vhGaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBR34lVY; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBR34lVY"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69d8091533bso2763529eaf.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102796; x=1781707596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFoYdAxl4NolMJmpm2ZDGLTzkpcIZ1kRqHVd6sBUF0s=;
        b=TBR34lVYOXiO9YtvGK5Ixe/BeOxCwYMDzSwEek3zq5rjuDMm/g5/baG6vlirbpRAi3
         g3hvGy8TOq2tFYEHlxLsfjdGT94QpgyoHdIvAMka1XwKoUJKGiIptFpbBH8ZVLLVMvXk
         75oi2JoQp5UCFERLDBAu28BG5t8aWv8533UzPiXMS6MKvyH4VksObBZB80bgpTeNRTrp
         PvO4kKdX+6jt+AdCtNt/C6VlwGvbcQdU8fF1EnkqVj+Uzfq8wIV74e6cJC9bSEdSj7kn
         EPyrrJzqDIkR4WLZKrOKzIC6FfBCxk10AypK9TZDzorlScPFbHVH4shaCqYhTcN7pTRE
         NDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102796; x=1781707596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFoYdAxl4NolMJmpm2ZDGLTzkpcIZ1kRqHVd6sBUF0s=;
        b=ASIG20TIUR/0+siK83cW0Fcir/kJUW/xuYhLZZZhwpOrkHgyq5k5S8vwxG83AhnOp8
         RFYeonMGgLANkP4sZqSY8ks37XC9CQRGx+dQ7d8JKASe3+o0HMMT6rFLeXRFfbrZACGd
         TYysHgAqKIGrrnb2H77BeUi7k9ETvT9jGwLSsPytEgKOeJfROi/MnfbZrfX7FPirkftI
         V5q7dEixFBKllalWsURd0XFKrCiqJNGWZTwtWMFphsS2bPA1LZEpAJq9Fp/qRHKOwYaq
         6C5zxVGP1EEMgsf6G+9J8p+NwuFYOmgIipjCWdgL6U+WUcxRYr0vXgVa1J1lmq/tmepV
         t1Bw==
X-Gm-Message-State: AOJu0YyBDMNiS+ihFcIyB078uO2bJjKEATkVm4bOVrRXIRJWROjcFLff
	aMcu9HG47RpgrFwRflFnk+KOvHD7Mivzbv9j1H/GwWKAodGKAc/SxVCs7q+lpg==
X-Gm-Gg: Acq92OGyV1BNtgcHWjdR6iQdS71l5yIccAKZAk+qT1bT1U30bi5ihPxzlF8VzS4+3yJ
	rUnsJRsLScMXPZLcuFV6djUxkU84exKwVVdUo1yfL6OnoUl8TxXR8qa+oUbneqOihs8AEAvIvUX
	PLNrjl5dGBNcTFXAyfEzqOIZQJfgWIXaXXEq0Cjoj+ZnuZWpKQobAKUP0nfBSQ+9Yf1eMCvD+vH
	lIOo9nGWdaDVhQ7XK0eMUI0e7B+7MYsR6ovP4kn62FsONw3CJgNzEt5G1OnBIplzI5AmMovqiLR
	zyNNGd78PbB1xM5+R//iaEX27N85GvUpCr5vifKHMdvUCXgIEhGAIJOGa9RKvLG/Y3NYLoESPTD
	T+ljTcPCplZmByntsMTy/KF8vOSxanNTAjUq/no//ResDn3gkwEGOuPXnzDIMSShqkMut8vERiG
	5c4/+d1llbkOgwJNhb/p1futw3q6gbxsU=
X-Received: by 2002:a05:6820:4083:b0:69d:fa89:8478 with SMTP id 006d021491bc7-69e68c2773amr12885869eaf.36.1781102795840;
        Wed, 10 Jun 2026 07:46:35 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e4644ddc2sm12069165eaf.12.2026.06.10.07.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:46:35 -0700 (PDT)
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
Subject: [PATCH V7 4/6] drm/panel: anbernic-td4310: Add RG Vita Pro panel
Date: Wed, 10 Jun 2026 09:44:05 -0500
Message-ID: <20260610144407.438846-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610144407.438846-1-macroalpha82@gmail.com>
References: <20260610144407.438846-1-macroalpha82@gmail.com>
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
 drivers/gpu/drm/panel/panel-anbernic-td4310.c | 257 ++++++++++++++++++
 3 files changed, 268 insertions(+)
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
index 000000000000..9a1b4525423c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-anbernic-td4310.c
@@ -0,0 +1,257 @@
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
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#include <video/mipi_display.h>
+
+struct anbernic_panel_td4310_info {
+	const struct drm_display_mode *display_mode;
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
+	ret = gpiod_set_value_cansleep(ctx->enable_gpio, 1);
+	if (ret)
+		goto err_enable;
+
+	if (ctx->panel_info->enable_delay)
+		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->enable_delay);
+
+	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	if (ret)
+		goto err_reset;
+
+	mipi_dsi_msleep(&dsi_ctx, 10);
+
+	ret = gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	if (ret)
+		goto err_reset;
+
+	if (ctx->panel_info->reset_delay)
+		mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->reset_delay);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->prepare_delay);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->prepare_delay);
+
+	if (dsi_ctx.accum_err) {
+		ret = dsi_ctx.accum_err;
+		goto err_reset;
+	}
+
+	return 0;
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
+	mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->unprepare_delay);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, ctx->panel_info->disable_delay);
+
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_disable(ctx->vdd);
+
+	return 0;
+}
+
+static int panel_anbernic_td4310_get_mode(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct anbernic_panel_td4310 *ctx = panel_to_anbernic_panel_td4310(panel);
+	const struct anbernic_panel_td4310_info *panel_info = ctx->panel_info;
+
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = panel_info->width_mm;
+	connector->display_info.height_mm = panel_info->height_mm;
+	connector->display_info.bus_flags = panel_info->bus_flags;
+
+	return drm_connector_helper_get_modes_fixed(connector, panel_info->display_mode);
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
+	.get_modes = panel_anbernic_td4310_get_mode,
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
+	ctx->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
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
+	devm_drm_panel_add(dev, &ctx->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+
+	return 0;
+}
+
+static const struct drm_display_mode anbernic_vitapro_mode = {
+	.clock = 140020,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 50,
+	.hsync_end = 1080 + 50 + 4,
+	.htotal = 1080 + 50 + 4 + 50,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 15,
+	.vsync_end = 1920 + 15 + 4,
+	.vtotal = 1920 + 15 + 4 + 32,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct anbernic_panel_td4310_info anbernic_vitapro_info = {
+	.display_mode = &anbernic_vitapro_mode,
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
+	{ }
+};
+MODULE_DEVICE_TABLE(of, panel_anbernic_td4310_of_match);
+
+static struct mipi_dsi_driver anbernic_panel_td4310_driver = {
+	.driver = {
+		.name = "panel-anbernic-td4310",
+		.of_match_table = panel_anbernic_td4310_of_match,
+	},
+	.probe	= panel_anbernic_td4310_probe,
+};
+module_mipi_dsi_driver(anbernic_panel_td4310_driver);
+
+MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
+MODULE_DESCRIPTION("DRM driver for Anbernic TD4310 MIPI DSI panels");
+MODULE_LICENSE("GPL");
-- 
2.43.0

