Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F431195C
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862991; cv=none; b=qSA3c0JAU7Na2oATwvJ4u1U61xG8MkGhZwAiNLOY7FuV2EKtKzxFcHc6I3Nq0rqW6UOkd/+d6NfqO7I2hyhHfQQn8zq8UwDN5987ZRzFTNW8kWD/gKPFiH88llljbrSESBo6j9NLFlKtB3Hb4+jHDg2weZ3ZJP2IDPU93XdPwD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862991; c=relaxed/simple;
	bh=xNnPtp0TVop6QElEEJ3/TiPQmYW/UX7/x5PZxacnj/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHXYmEK1+BPDLxlcEya5RFwWWpeC6oBLwwF6Tm5+NOM4bUw2SesuxXib6gF7a+QeXhzhrKJpb6Jd4WELo4LZqD82UMRngDxQDYnvBoh7pTPf+TNdLdogYg+DTV0gdlDlvhVjhvfn/xqz0QeWzRn9ya1EXVmaUGnWZjc+s4k/dU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=IjWiP1BM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="IjWiP1BM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b9e9a6802aso49266565ad.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 23:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1779862988; x=1780467788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxKv6TNT2ucWixdqNW8yAkZUrV+NzaLwJo+O9oWCtAU=;
        b=IjWiP1BMXWTJYMEExwYUYn3B5LHnGTB8yXZ9Jt3TWB0Jw8WYRwX4xn4jSxsFBxKujl
         zAkmSSU66yL3iww5giZuOfBvae46zm3E2rn5XetwHFx0NH9Qgiit+BCnKbJ72qUhCom0
         iC0wjTck7zVaQRMv/WZRClbiQxjWE6A/n0xjwp9Zuxzrn6NUy96i1m/e/59n4y81n5CO
         Gzn4Q5DX/Lbf/KXQ2RZozHi5n0tyu0+09B4PmAejBXWyGE7NJlQs1RVL5L+D0wK2+PfY
         UK6yAs4GMNA4LVbRu1K+iTQZMH2qqlZCvgWCYqXc7FKV8hI6ygYrnH8aiLuXIofd2OYk
         S8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779862988; x=1780467788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxKv6TNT2ucWixdqNW8yAkZUrV+NzaLwJo+O9oWCtAU=;
        b=r9vp1xIA6FuUGc2W6o9CTZjF+YWvWQ3vZqzLsDHrEl/Enl+5U59J57vym39n29gHv3
         JssO6q/yPZo1H92khx6OvpKAupIB/SnWvBJr6/d7fR3OnMvIyQIki7jT8SvQm6+KI/V9
         B/99iiVfplvlQrcw+vWJ9kAntPO9FqSiYY54mg0ooZOv0xReax2xkWsXytH+2xCgPaOF
         6LXZoBW2EIM9mYJNl9o9ZpilaJSwCdRUL2vckPR6e+g9cb+cKtdzZ/ZWS9nw13WpweUy
         5V+Z8+Ca6XnXnZzKBWE1Xrr6CNbwpD500aB5m4a5Zl5AZIHyJjC0x9eRgM7PPbP1P/r6
         pf6w==
X-Forwarded-Encrypted: i=1; AFNElJ9cRRnqaq7D0EqpH+csCO43SCwSKDZQAARCVMrz0gdxpHFxxaSuN6ecnwL2xieVZnloVmTc8JLXbicB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9WQLFAk+kWRQhLsvDVOy6MoWmlRApNx3JpfGcfsOsLVCpibb6
	YgRTCo0GJxFkQ2YHsBTWOPRM7Oql5k0Rz5IWIDFRiSRSc+4kMLzfCb0H8IOs61cxwxo=
X-Gm-Gg: Acq92OHMj+4TaesmdDmAKzMBYTQ4YLnLCKIQU9huKQN0o3A/F8fn2WwwClsQjICeWRV
	a/hmgGStTOJJQXeReJR/y6PXq8yMheSswJ5FwiroTfDznYbgPwVC/wQOCpj6HRS2s9h/5yGvSON
	ZtRr67ZFV7Xh9YITwOANbMJ+Y8uSjlsP2NrW6R8JLHsY53qU+XyA7XIRRVd5EejOj0J0nCENMYN
	D+VqUggjBidTpEe2qk8Xg/lVnV2dronPutP6qCG4AE+IIG4n3NYqhxSvdN9dn3+sACLQa7nwiqS
	kixV08XdvsoCg0LVbIKlspUevFxZmAsnjSJbO1RQ7Y6G2HNBmKp+RI5t6shrtneynuhZztUuMDi
	3xrt+Wv1++Kuvz1v7HX5wWXvpIOdcMVS0g2n9izXRaKQGU6jIkHVOg2dPlsmH+2h6MlWGq2Xq75
	UTJy/JsBDbYCp22Ex7BSRJESARcQ==
X-Received: by 2002:a17:902:d48e:b0:2ba:5a20:1d94 with SMTP id d9443c01a7336-2beb059944cmr243719465ad.13.1779862988022;
        Tue, 26 May 2026 23:23:08 -0700 (PDT)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm182387205ad.6.2026.05.26.23.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 23:23:07 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/panel: Add Ilitek ILI9488 controller driver
Date: Tue, 26 May 2026 23:23:00 -0700
Message-ID: <20260527062300.88928-3-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527062300.88928-1-igor@reznichenko.net>
References: <20260527062300.88928-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Ilitek ILI9488 DSI controller which is used in
FocusLCDs E35GH-I-MW800-CB 320x480 MIPI DSI panel. The mode timing
was adjusted after STM32MP157 testing. The previous 14.256 MHz mode
worked on AM62P, but was awkward for STM32 DSI/LTDC clock synthesis.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 MAINTAINERS                                  |   6 +
 drivers/gpu/drm/panel/Kconfig                |   9 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c | 299 +++++++++++++++++++
 4 files changed, 315 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9488.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..a70aacb4f6fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8038,6 +8038,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 F:	drivers/gpu/drm/tiny/ili9486.c
 
+DRM DRIVER FOR ILITEK ILI9488 PANELS
+M:	Igor Reznichenko <igor@reznichenko.net>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+F:	drivers/gpu/drm/panel/panel-ilitek-ili9488.c
+
 DRM DRIVER FOR ILITEK ILI9805 PANELS
 M:	Michael Trimarchi <michael@amarulasolutions.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d592f4f4b939..03397e652cae 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -260,6 +260,15 @@ config DRM_PANEL_ILITEK_ILI9341
 	  QVGA (240x320) RGB panels. support serial & parallel rgb
 	  interface.
 
+config DRM_PANEL_ILITEK_ILI9488
+	tristate "Ilitek ILI9488-based panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y if you want to enable support for panels based on the
+	  Ilitek ILI9488 controller.
+
 config DRM_PANEL_ILITEK_ILI9805
 	tristate "Ilitek ILI9805-based panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index a4291dc3905b..753b18842e7a 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
 obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9488) += panel-ilitek-ili9488.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_CORE) += panel-ilitek-ili9806e-core.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
new file mode 100644
index 000000000000..b2145cbe8c30
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#include <video/mipi_display.h>
+
+struct ili9488_desc {
+	const struct drm_display_mode *display_mode;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	unsigned int lanes;
+	void (*init_sequence)(struct mipi_dsi_multi_context *ctx);
+};
+
+struct ili9488 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset;
+	struct regulator_bulk_data supplies[2];
+	const struct ili9488_desc *desc;
+	enum drm_panel_orientation orientation;
+};
+
+static const char * const regulator_names[] = {
+	"vci",
+	"iovcc",
+};
+
+static void e35gh_i_mw800cb_init(struct mipi_dsi_multi_context *ctx)
+{
+	/* Gamma control 1,2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE0, 0x00, 0x10, 0x14, 0x01, 0x0E, 0x04, 0x33,
+				     0x56, 0x48, 0x03, 0x0C, 0x0B, 0x2B, 0x34, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE1, 0x00, 0x12, 0x18, 0x05, 0x12, 0x06, 0x40,
+				     0x34, 0x57, 0x06, 0x10, 0x0C, 0x3B, 0x3F, 0x0F);
+	/* Power control 1,2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC0, 0x0F, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC1, 0x41);
+	/* VCOM Control */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC5, 0x00, 0x25, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0x48);
+	/* Interface pixel format 18bpp */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3A, 0x66);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB1, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB4, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB6, 0x02, 0x02, 0x3B);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xF7, 0xA9, 0x51, 0x2C, 0x82);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x00);
+}
+
+static const struct drm_display_mode e35gh_i_mw800cb_display_mode = {
+	.clock = 14400,
+
+	.hdisplay = 320,
+	.hsync_start = 320 + 60,
+	.hsync_end = 320 + 60 + 20,
+	.htotal = 320 + 60 + 20 + 42,
+
+	.vdisplay = 480,
+	.vsync_start = 480 + 20,
+	.vsync_end = 480 + 20 + 10,
+	.vtotal = 480 + 20 + 10 + 33,
+
+	.width_mm = 48,
+	.height_mm = 73,
+
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static inline struct ili9488 *panel_to_ili9488(struct drm_panel *panel)
+{
+	return container_of(panel, struct ili9488, panel);
+}
+
+static int ili9488_power_on(struct ili9488 *ili)
+{
+	struct mipi_dsi_device *dsi = ili->dsi;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ili->supplies), ili->supplies);
+	if (ret < 0) {
+		dev_err(&dsi->dev, "regulator bulk enable failed: %d\n", ret);
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(ili->reset, 0);
+	usleep_range(1000, 5000);
+	gpiod_set_value_cansleep(ili->reset, 1);
+	usleep_range(1000, 5000);
+	gpiod_set_value_cansleep(ili->reset, 0);
+	usleep_range(5000, 10000);
+
+	return 0;
+}
+
+static int ili9488_power_off(struct ili9488 *ili)
+{
+	struct mipi_dsi_device *dsi = ili->dsi;
+	int ret;
+
+	gpiod_set_value_cansleep(ili->reset, 1);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(ili->supplies), ili->supplies);
+	if (ret)
+		dev_err(&dsi->dev, "regulator bulk disable failed: %d\n", ret);
+
+	return ret;
+}
+
+static int ili9488_activate(struct ili9488 *ili)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
+
+	if (ili->desc->init_sequence)
+		ili->desc->init_sequence(&ctx);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+
+	return ctx.accum_err;
+}
+
+static int ili9488_prepare(struct drm_panel *panel)
+{
+	struct ili9488 *ili = panel_to_ili9488(panel);
+	int ret;
+
+	ret = ili9488_power_on(ili);
+	if (ret)
+		return ret;
+
+	ret = ili9488_activate(ili);
+	if (ret) {
+		ili9488_power_off(ili);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ili9488_deactivate(struct ili9488 *ili)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 120);
+
+	return ctx.accum_err;
+}
+
+static int ili9488_unprepare(struct drm_panel *panel)
+{
+	struct ili9488 *ili = panel_to_ili9488(panel);
+	struct mipi_dsi_device *dsi = ili->dsi;
+	int ret;
+
+	ili9488_deactivate(ili);
+	ret = ili9488_power_off(ili);
+	if (ret < 0)
+		dev_err(&dsi->dev, "power off failed: %d\n", ret);
+
+	return ret;
+}
+
+static int ili9488_get_modes(struct drm_panel *panel, struct drm_connector *connector)
+{
+	struct ili9488 *ili = panel_to_ili9488(panel);
+	const struct drm_display_mode *mode = ili->desc->display_mode;
+
+	return drm_connector_helper_get_modes_fixed(connector, mode);
+}
+
+static enum drm_panel_orientation ili9488_get_orientation(struct drm_panel *panel)
+{
+	struct ili9488 *ili = panel_to_ili9488(panel);
+
+	return ili->orientation;
+}
+
+static const struct drm_panel_funcs ili9488_funcs = {
+	.prepare	= ili9488_prepare,
+	.unprepare	= ili9488_unprepare,
+	.get_modes	= ili9488_get_modes,
+	.get_orientation = ili9488_get_orientation,
+};
+
+static int ili9488_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct ili9488 *ili;
+	int i, ret;
+
+	ili = devm_drm_panel_alloc(dev, struct ili9488, panel, &ili9488_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ili))
+		return PTR_ERR(ili);
+
+	ili->desc = device_get_match_data(dev);
+	mipi_dsi_set_drvdata(dsi, ili);
+	ili->dsi = dsi;
+
+	dsi->mode_flags = ili->desc->mode_flags;
+	dsi->format = ili->desc->format;
+	dsi->lanes = ili->desc->lanes;
+
+	ili->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ili->reset))
+		return dev_err_probe(dev, PTR_ERR(ili->reset),
+				     "failed to get reset-gpios\n");
+
+	for (i = 0; i < ARRAY_SIZE(ili->supplies); i++)
+		ili->supplies[i].supply = regulator_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ili->supplies),
+				      ili->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ret = of_drm_get_panel_orientation(dev->of_node, &ili->orientation);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get orientation\n");
+
+	ret = drm_panel_of_backlight(&ili->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get backlight\n");
+
+	ili->panel.prepare_prev_first = true;
+	drm_panel_add(&ili->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to attach to DSI host\n");
+		drm_panel_remove(&ili->panel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ili9488_dsi_remove(struct mipi_dsi_device *dsi)
+{
+	struct ili9488 *ili = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ili->panel);
+}
+
+static const struct ili9488_desc e35gh_i_mw800cb_desc = {
+	.init_sequence = e35gh_i_mw800cb_init,
+	.display_mode = &e35gh_i_mw800cb_display_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB666_PACKED,
+	.lanes = 1,
+};
+
+static const struct of_device_id ili9488_of_match[] = {
+	{ .compatible = "focuslcds,e35gh-i-mw800cb", .data = &e35gh_i_mw800cb_desc },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, ili9488_of_match);
+
+static struct mipi_dsi_driver ili9488_dsi_driver = {
+	.probe	= ili9488_dsi_probe,
+	.remove	= ili9488_dsi_remove,
+	.driver = {
+		.name		= "ili9488-dsi",
+		.of_match_table	= ili9488_of_match,
+	},
+};
+module_mipi_dsi_driver(ili9488_dsi_driver);
+
+MODULE_AUTHOR("Igor Reznichenko <igor@reznichenko.net>");
+MODULE_DESCRIPTION("Ilitek ILI9488 Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

