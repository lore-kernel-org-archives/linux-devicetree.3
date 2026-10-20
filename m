Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501839;
	b=c8xC/UkHlp3WF4g2may1OqXNNgR1mhdTx/vs1xfWrjee2kIwzJ87Fvlp3qZsFmShoAeG
	 M0Ku8SD6Nk8ukjBM1SZUGZjROdezofx1rxLxNkpx2ppsNMx0eDpH3CGehHJaUk6NxwZOR
	 hqeZN9d+2hWFdmfGJ/AlkePIv7OpHC5HHW1ZB2pr8YYZogptwg2UuYrEq3vLZ4bhvzOeJ
	 ipuW767ZwlRHs9UfmD2dCGCc0ErAOMb+cjtd+rXZY8RGDTZDIGMxXnzl0NyrGn2iv3+1v
	 Ao49Ynssa9FBuiE5d0Syf2uBwYomj1uV4x+PFhrTdFMm872V6QLO0X9yMyYJhuBk5rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aVloLkPfmcmAFlVr0SVmoPwIgVisTJ/BPkXzuoo4z+Q=;
	b=OztnChsSUkuJUwaBbdAfPdabwmsNFxKOx/Xm/E/8//239h6Lir2+LgPxAlTd8FIXOBKC
	 qAg43HhidyvazyMBLIZHjI9bNoX0nURxwXSraVztIbtNX+7nD4vUtgtwa+TopA6eKfa4j
	 b7rHkjJmQLDWxrXaRfZycMSLDLN6DttG21glZ8B84cqt2nGeRty3Qh1m5DMdznO+/W/F1
	 KvdhZpNJkkTJ1GRwuu3HaDYx3g9PkZXHgjTVE32Z9S2lxq6U8R9w8O/xxrNwJOwVKbVmY
	 JPbUVHc7/8zueuYaJwexHPv7cE2yCQOT8K9QzhOyAiPfpXw8i73PleeB9Qqw5aiImAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oNZAFiiQ;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC253606A329
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC253606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oNZAFiiQ
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3a476ee8669so900558a91.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501838; x=1793106638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVloLkPfmcmAFlVr0SVmoPwIgVisTJ/BPkXzuoo4z+Q=;
        b=oNZAFiiQBnAgEE//WT/WoN7QPRLwv2UWIbXqFxJ7qjvsb9o9b2y9kccvGBP4dR0OKT
         510uxjpUhCleY7Msd0imRMl3eCmaU0ClGNFawA5Ar61FhahHlxn+kGR/CzBVFxLMq6Np
         DZ6/q2YQPdX75qwq7Uh3Z3vVzEJY8w696vvcbYXtA22x0oyqrNDAb6M+iGCa/EzHKwjz
         /ehSOfe55yziSbfHbBLW9lEXQHYy43V1gywASVmsyM4wEiilxBQWRuTQXY9SyF/vtyev
         qE6HpbzZPHJsEkF88cRsKu+lj2RhBBUiieBPABJnTimahRGexvHvoM9d9prF2PUg7/BL
         jAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501838; x=1793106638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVloLkPfmcmAFlVr0SVmoPwIgVisTJ/BPkXzuoo4z+Q=;
        b=supZ3wwa/LMao+psyQ3/pdeuLd9cyZtWuAvUvwJ1SIn61srBa3XYORN/nFdGb0iyxn
         e3j9GtzE4U6yXN2lYlTLsZUY+q6/7azSpBNgTgh673t/GesszIfM+3cfuUiq5xWATVYk
         bOElgMf7QuavLT0soTWs4eXp7tZhiUvZgIkLNy0sLEsaTkHINWtVy9A3c/PVKlxY+aXa
         l8DY3yX6CJdGGZvrtrLDqdByo3wNwa7tcfhDC4PgSDlrKmtznnI2jWgkVWKPCX07b/gU
         AjavBXwLtD8Lsbre4vSU6RjDbiKCGXJL82zoK8sqBjgrJXFn77x52KHe4p+mVM3oBtGC
         d4mw==
X-Forwarded-Encrypted: i=1; AKwUvBz3FSJjhA0vM90PsHH/ZRFOgsReg1Q4Bn6oK3vRwwGAQixqUmov1ZOp+V4OUqG6+SUj7aYZf8ToajJN@vger.kernel.org
X-Gm-Message-State: AFq9FYLqnmQpPNp5Ixjc/KGB8StoUKu9hG7XWdY69H+Mqi8J0BB8PNrq
	Ddsz02p2eH+RdnqoHaN5wuTO00nBcccCDctTYEvrrmsA5xS1IIYoy1yB
X-Gm-Gg: AYBFou3j1xBy1IKv227OMr5K/OK/TqfUCRO97ho2yx7vYcIJJwoyyne0KrTZExuTbmT
	hGMdKH7nlszXRaYB3g+EO2Bti3NaPgliLSrK/HOCI1lEaZxI9XPRxaPVnLkk+MTsDwjGYiJiP08
	E8hVcE8OoXJ9h4XSFqh9fLa21mj6YZTgJNl89XYM5zqHg7DlvILXvnyfwS06Lc5UPxWgR0vJtXT
	BIxxGax7ehNPhW57u1TtR1eQDxz/nsAutpHAe21hx+MGNAnLsQuL93YhyxybGDbs+40ME4wR2fi
	NyEbs1ZFKDfvOcZ8lzwxk5JyaU8ufa5Tetgo0ipKBtGTdSY/+XzGvUSFkKGGHsO0nZr6uo4J+52
	6hlun56vHapvPwbtFp2y0usCrUJTxxwwhlrJYYsldUkKUtLRzCjn8g810fsVP/iWvr3b+KTamjZ
	hNNPmnWGyEYTu8UPwDDTr0ZmnKKUb8rHd5pweE32D/A84sWgxcJntgGPs=
X-Received: by 2002:a17:90b:570b:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3acef29edffmr9320116a91.30.1792501837978;
        Tue, 20 Oct 2026 06:10:37 -0700 (PDT)
Received: from Linux-PC ([2a09:bac1:1980:20::1d3:a8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm10131496a91.4.2026.10.20.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:10:37 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH v3 3/3] drm/panel: add driver for Smartisan TD4362
Date: Tue, 20 Oct 2026 21:09:34 +0800
Message-ID: <20261020130934.2289011-4-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020130934.2289011-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261020130934.2289011-1-tianshi12127@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Add support for the Smartisan TD4362 1080x2242 command mode DSI
panel found in the Smartisan R1 (trident) smartphone.

The initialization and power sequences were generated from the
downstream device tree with linux-mdss-dsi-panel-driver-generator.

Tested on a Smartisan R1 (trident).

Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-smartisan-td4362.c    | 262 ++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-smartisan-td4362.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index b30d7781745c..0b413152267f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1124,6 +1124,19 @@ config DRM_PANEL_SITRONIX_ST7789V
 	  Say Y here if you want to enable support for the Sitronix
 	  ST7789V controller for 240x320 LCD panels
 
+config DRM_PANEL_SMARTISAN_TD4362
+	tristate "Smartisan TD4362 DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Smartisan TD4362
+	  1080x2242 command mode panel found in the Smartisan R1 (trident)
+	  smartphone. The panel is driven over four MIPI DSI lanes in
+	  command mode.
+
+	  If unsure, say N.
+
 config DRM_PANEL_SONY_ACX565AKM
 	tristate "Sony ACX565AKM panel"
 	depends on GPIOLIB && OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 4532f79021ea..bc4fad310554 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) += panel-sharp-ls060t1sx01.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
+obj-$(CONFIG_DRM_PANEL_SMARTISAN_TD4362) += panel-smartisan-td4362.o
 obj-$(CONFIG_DRM_PANEL_SUMMIT) += panel-summit.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_TDDI) += panel-synaptics-tddi.o
diff --git a/drivers/gpu/drm/panel/panel-smartisan-td4362.c b/drivers/gpu/drm/panel/panel-smartisan-td4362.c
new file mode 100644
index 000000000000..b3905aee1528
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-smartisan-td4362.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2026 Lu Chen <tianshi12127@gmail.com>
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+//   Copyright (c) 2013, The Linux Foundation. All rights reserved.
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct smartisan_td4362 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data smartisan_td4362_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "vsp" },
+	{ .supply = "vsn" },
+};
+
+static inline struct smartisan_td4362 *to_smartisan_td4362(struct drm_panel *panel)
+{
+	return container_of(panel, struct smartisan_td4362, panel);
+}
+
+static void smartisan_td4362_reset(struct smartisan_td4362 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 10100);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 10100);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 10100);
+}
+
+static int smartisan_td4362_on(struct smartisan_td4362 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x82);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x08c1);
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0x07fa);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 80);
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9,
+					 0x9b, 0x51, 0x07, 0xe6, 0x00, 0x10,
+					 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba,
+					 0xbb, 0x2f, 0x1d, 0xbe, 0x00, 0x10,
+					 0x04);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xce,
+					 0x5d, 0x40, 0x60, 0x78, 0x87, 0x94,
+					 0x9e, 0xab, 0xb8, 0xc4, 0xcd, 0xd6,
+					 0xde, 0xe5, 0xec, 0xf3, 0xfd, 0xff,
+					 0x04, 0x28, 0x04, 0x04, 0x42, 0x00,
+					 0x69, 0x5a, 0x40, 0x01, 0xf4, 0x00,
+					 0x00, 0x04, 0xfa, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xca,
+					 0x1d, 0xfc, 0xfc, 0xfc, 0x00, 0x07,
+					 0x07, 0x00, 0x00, 0x00, 0xeb, 0xe7,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf9, 0x64);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
+
+	return dsi_ctx.accum_err;
+}
+
+static int smartisan_td4362_off(struct smartisan_td4362 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 16000, 17000);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 64);
+
+	return dsi_ctx.accum_err;
+}
+
+static int smartisan_td4362_prepare(struct drm_panel *panel)
+{
+	struct smartisan_td4362 *ctx = to_smartisan_td4362(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(smartisan_td4362_supplies),
+				    ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	msleep(100);
+
+	smartisan_td4362_reset(ctx);
+
+	ret = smartisan_td4362_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(smartisan_td4362_supplies),
+				       ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int smartisan_td4362_unprepare(struct drm_panel *panel)
+{
+	struct smartisan_td4362 *ctx = to_smartisan_td4362(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = smartisan_td4362_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(smartisan_td4362_supplies),
+			       ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode smartisan_td4362_mode = {
+	.clock = (1080 + 44 + 2 + 60) * (2242 + 8 + 2 + 100) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 44,
+	.hsync_end = 1080 + 44 + 2,
+	.htotal = 1080 + 44 + 2 + 60,
+	.vdisplay = 2242,
+	.vsync_start = 2242 + 8,
+	.vsync_end = 2242 + 8 + 2,
+	.vtotal = 2242 + 8 + 2 + 100,
+	.width_mm = 64,
+	.height_mm = 117,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int smartisan_td4362_get_modes(struct drm_panel *panel,
+				      struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector,
+						    &smartisan_td4362_mode);
+}
+
+static const struct drm_panel_funcs smartisan_td4362_panel_funcs = {
+	.prepare = smartisan_td4362_prepare,
+	.unprepare = smartisan_td4362_unprepare,
+	.get_modes = smartisan_td4362_get_modes,
+};
+
+static int smartisan_td4362_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct smartisan_td4362 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct smartisan_td4362, panel,
+				   &smartisan_td4362_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(smartisan_td4362_supplies),
+					    smartisan_td4362_supplies,
+					    &ctx->supplies);
+	if (ret < 0)
+		return ret;
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
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
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
+static void smartisan_td4362_remove(struct mipi_dsi_device *dsi)
+{
+	struct smartisan_td4362 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id smartisan_td4362_of_match[] = {
+	{ .compatible = "smartisan,td4362" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, smartisan_td4362_of_match);
+
+static struct mipi_dsi_driver smartisan_td4362_driver = {
+	.probe = smartisan_td4362_probe,
+	.remove = smartisan_td4362_remove,
+	.driver = {
+		.name = "panel-smartisan-td4362",
+		.of_match_table = smartisan_td4362_of_match,
+	},
+};
+module_mipi_dsi_driver(smartisan_td4362_driver);
+
+MODULE_AUTHOR("Lu Chen <tianshi12127@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for Smartisan TD4362 1080p command mode DSI panel");
+MODULE_LICENSE("GPL");
-- 
2.56.0

