Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287779;
	b=g9TnjrR9tBslpLHllV6ZTnTVASuZtRm0t63gbuGOYVtir/gsUnkiF7chpKWo556BsIlR
	 jMGu9fIGluj4gTLOMKlUNa+Tz8djTUuVSyvvEkmMbT7ldUU3zJolSMqwPX7UaGX86VVST
	 H7TMFItXeLUwm2dXPhbBLu5bercoOM2+WBgRLpFJOnTKa5z2R+dsNWlSUAPMg3nwZe1sv
	 hooadNuvD9RO3YiFRoFW07AQyLgbY282xHXuIN6n19iig7hRbqlxfdG66QtZUMfhFNkNj
	 y2MNVwaHfnwIPGYn+4xl2S3tzGM9tFHK4996Y68xf6VDYiHgAV2ritraVTL/CpkO3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AKlnNUPAZYqn7bdU1beV1huh2DASjeUZeMyqIT8C+UA=;
	b=bAUp+AWJStf8i7ng3KG1lldvJJVERY/9jaI+X6eG0KNuQlMfx6GDM1LUZgDpIXb43Jj9
	 5QiiD/s0x0rhHRfzikqNKSq4gfUzyjal04SCMOrcxtvcfSFEFOHVmf5NsjrhtaEchpDvx
	 bNtVpVp/r8mzNy3pEQ6LCLC8hnsWv9xjMU+NCav/QS9Yrnp2LSNjPsx3k722C5sJu4v3M
	 fC3g45ozSGpi1yYxxECfosVvO3aaNtbFWYWEnFNCVd+hwL6KL3wDVxPROhjbpoirM91vj
	 SI0JzEvMwc/0rBGVIq6XHf0GU5YbGavx5cfnRHqOa0NPhHuqL+UMqflSwrWxAgb1eQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s/iGFxHK";
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AEA606A336
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50AEA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s/iGFxHK
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso1441425a12.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287777; x=1793892577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKlnNUPAZYqn7bdU1beV1huh2DASjeUZeMyqIT8C+UA=;
        b=s/iGFxHK9NC2DxZTBNiiMRquVUfTd9KD5ThMd4/6IS8a7gbj+VVj3A4hdmtJUFtq9v
         hC36AcrfLT5rriJ/qQOxtcYVo9syg1B4TkJmOYTBjZG06/bABEQA1SM9IZeu1VRgaMUV
         D2Gdec216cezCEvUl2Jyd82uNKcZHWHth1xmkgC9sszY72XMX8Apvm7h4D3+F3WBhc0z
         dW5KkqZahneAOSQcMzJlQgln9XFsiYKAlQ/ZlWj6mQ1dr+iHAFLBLuqDDFjts1UjM9pb
         SWNeUjAce+QCwV4ujkqKaz6uV07/jxxgiVfSjrgO7kD/Bs2MHb67TE6rb16eJ2/GggPq
         WINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287777; x=1793892577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKlnNUPAZYqn7bdU1beV1huh2DASjeUZeMyqIT8C+UA=;
        b=iKGYHPuAHIkM2+HSXfC31Keh924b2uTUhbYy0edN0hsNdlawRGI/IzAh9B+OB+VYCu
         ZMnUZUKKQ9HqtCEYMoNBrpz9gjpFI+XDwvPLxBhx+HhjwEH9BXMq/dY439c3SnNSbKmE
         dsAj26WJTGxHgwHAV1BcvQ+pI7aPbybyv4WLqpCN1FK7UuR0qlGShcZ0psEvyonsk5hE
         T5UnAJGnLmRaccm3OQxq8tGQv7L6EVqirPZK1Eq2ixksVP1xgIPtEo7aXv9nv5Q1Too7
         1UF15XR3CUj+/iWMiuUEbKCB76GXvd/YRr7lh2VazwIDJu6p6H9lF8g0MiepU94DVFBL
         iHLw==
X-Forwarded-Encrypted: i=1; AKwUvBxfwo2KTZn4jNlgyHjAOBZUEYPCsVXG9f/v35Kbuge0aQ07RHTa10SgbgGQxJ7pq7JQb75y9IvT+9hj@vger.kernel.org
X-Gm-Message-State: AFq9FYLKv6hcp/J7jqYzDcSyU1Xjg9nT4XF2CMM/Z73FUmlw6cwjs7iZ
	ECnmGhTO21VB/XEy6wpgPFiys6KdO8IsiKGVqqZUpTAxUcTw1nEBAf1cxpj0SA==
X-Gm-Gg: AYBFou3DvU+HlSzyLPicNM/OPWmK/8kmf4IQ/XnP+uhzvVwFTzrg9uJxy8aY3JzP3sS
	yEkVs4ja43N6iHBqUkY4HJHMGmH2ltYLBa6wpL46XuymMproR+wPyJoXa+ySrTduZmFTCZ4S6iT
	gqgMTeA4ehhLVLAcGzxh4sRV8Zue8+mrGqnrzyObY6Zly+uZuqXCvyX9FUskxPUWG5crG7jfU/1
	/kgVACeJwvRS/SIjlr2sYIF/V0ADowOWkAh2l2hi4tRpJ27+/xBhqrMqiM02fvyzKzYOT5UheBw
	Nu3UpewZGq0ZoUYYKbY+jV6U5/YiRMW8QmeHdnKnv4aL/S/iGoCXUFPy0WBn8Plh10k/WEK+MNN
	cwaI1IfJzmxSUoqsiWOvDQnszAd4Vg9fIwzcVTCdNmibPn0+oD2R2Ip2SeQmoEBVuKM3V8ZVUn2
	unfnXE7V0zJ9eVeeBHgOEFJotVO+2vS7y048xno2mdmEnYU9iAn61qBYOVmm8WZB2Vcbie1y5H8
	Covqj6WgegOS4j93OAFvOHt6dzzCRAUFTtzwLXAuQqwiHtKb9iBbKMDuotyoWzq9oYCUzULpz+B
	EgabbAe38F0EX3z/R8gmmgluwe8ee9rHp71NO9Yw9rftTYcGIv6ytIGcd72U1slPbvm5PNY=
X-Received: by 2002:a17:907:3faa:b0:c21:5cd6:3e49 with SMTP id a640c23a62f3a-c49d11364c7mr261281866b.9.1793287776394;
        Thu, 29 Oct 2026 08:29:36 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 03/11] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
Date: Thu, 29 Oct 2026 17:29:01 +0200
Message-ID: <20261029152909.234584-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

Add a driver for panel used in LG Optimus 2X P990. Panel is 4" WVGA MIPI
DBI Type B linked to DRM encoder via RGB to DBI bridge.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  14 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 294 ++++++++++++++++++
 3 files changed, 309 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a520b4d60fef..0e86628bcdb80 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -274,6 +274,20 @@ config DRM_PANEL_HIMAX_HX8394
 
 	  If M is selected the module will be called panel-himax-hx8394.
 
+config DRM_PANEL_HITACHI_TX10D07VM0BAA
+	tristate "Hitachi TX10D07VM0BAA MIPI DBI Type B panel"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DBI
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to enable support for the HITACHI
+	  TX10D07VM0BAA MIPI DBI Type B panel found in the LG Optimus 2X
+	  P990 smartphone.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called panel-hitachi-tx10d07vm0baa.
+
 config DRM_PANEL_HYDIS_HV101HD1
 	tristate "Hydis HV101HD1 panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index da5175909d540..2f57e350311f3 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) += panel-himax-hx83112b.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83121A) += panel-himax-hx83121a.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
+obj-$(CONFIG_DRM_PANEL_HITACHI_TX10D07VM0BAA) += panel-hitachi-tx10d07vm0baa.o
 obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7807S) += panel-ilitek-ili7807s.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7836A) += panel-ilitek-ili7836a.o
diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
new file mode 100644
index 0000000000000..5ccc8d4725bc6
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+static const struct regulator_bulk_data hitachi_tx10d07vm0baa_supplies[] = {
+	{ .supply = "avci" }, { .supply = "iovcc" },
+};
+
+struct hitachi_tx10d07vm0baa {
+	struct drm_panel panel;
+	struct mipi_dbi_device *dbi;
+
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct hitachi_tx10d07vm0baa *to_hitachi_tx10d07vm0baa(struct drm_panel *panel)
+{
+	return container_of(panel, struct hitachi_tx10d07vm0baa, panel);
+}
+
+#define panel_dbi_command(dbidev, cmd, seq...) \
+({ \
+	const u8 d[] = { seq }; \
+	struct device *dev = &(dbidev)->dev; \
+	int ret; \
+	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
+	if (ret) \
+		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
+	ret; \
+})
+
+static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
+{
+	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
+	struct device *dev = panel->dev;
+	int ret;
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable power supplies: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(1000, 2000);
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+
+	usleep_range(10000, 11000);
+
+	return 0;
+};
+
+static int hitachi_tx10d07vm0baa_enable(struct drm_panel *panel)
+{
+	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x03, 0x1f);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x03, 0x20,
+			  0x00, 0x00);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_SCROLL_START, 0x00, 0x00);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_TEAR_SCANLINE, 0x00, 0x00);
+
+	panel_dbi_command(priv->dbi, 0x71, 0x00);		/* Ex_Vsync_en */
+
+	panel_dbi_command(priv->dbi, 0xb2, 0x00);		/* VCSEL */
+	panel_dbi_command(priv->dbi, 0xb4, 0xaa);		/* setvgmpm */
+	panel_dbi_command(priv->dbi, 0xb5, 0x33);		/* rbias1 */
+	panel_dbi_command(priv->dbi, 0xb6, 0x03);		/* rbias2 */
+
+	panel_dbi_command(priv->dbi, 0xb7, 0x1a, 0x33, 0x03, 0x03,
+			  0x03, 0x00, 0x00, 0x01, 0x02, 0x00,
+			  0x00, 0x04, 0x00, 0x01, 0x01, 0x01);	/* set_ddvdhp */
+	panel_dbi_command(priv->dbi, 0xb8, 0x1c, 0x53, 0x03, 0x03,
+			  0x00, 0x01, 0x02, 0x00, 0x00, 0x04,
+			  0x00, 0x01, 0x01);			/* set_ddvdhm */
+
+	panel_dbi_command(priv->dbi, 0xb9, 0x0a, 0x01, 0x01, 0x00,
+			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgh */
+	panel_dbi_command(priv->dbi, 0xba, 0x0f, 0x01, 0x01, 0x00,
+			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgl */
+	panel_dbi_command(priv->dbi, 0xbb, 0x00, 0x00, 0x00, 0x00,
+			  0x01, 0x02, 0x01);			/* set_vcl */
+
+	panel_dbi_command(priv->dbi, 0xc1, 0x01);		/* number of lines */
+	panel_dbi_command(priv->dbi, 0xc2, 0x08);		/* number of fp lines */
+	panel_dbi_command(priv->dbi, 0xc3, 0x04);		/* gateset(1) */
+	panel_dbi_command(priv->dbi, 0xc4, 0x4c);		/* 1h period */
+	panel_dbi_command(priv->dbi, 0xc5, 0x03);		/* source precharge */
+	panel_dbi_command(priv->dbi, 0xc6, 0xc4, 0x04);	/* source precharge timing */
+	panel_dbi_command(priv->dbi, 0xc7, 0x00);		/* source level */
+	panel_dbi_command(priv->dbi, 0xc8, 0x02);		/* number of bp lines */
+	panel_dbi_command(priv->dbi, 0xc9, 0x10);		/* gateset(2) */
+	panel_dbi_command(priv->dbi, 0xca, 0x04, 0x04);	/* gateset(3) */
+	panel_dbi_command(priv->dbi, 0xcb, 0x03);		/* gateset(4) */
+	panel_dbi_command(priv->dbi, 0xcc, 0x12);		/* gateset(5) */
+	panel_dbi_command(priv->dbi, 0xcd, 0x12);		/* gateset(6) */
+	panel_dbi_command(priv->dbi, 0xce, 0x30);		/* gateset(7) */
+	panel_dbi_command(priv->dbi, 0xcf, 0x30);		/* gateset(8) */
+	panel_dbi_command(priv->dbi, 0xd0, 0x40);		/* gateset(9) */
+	panel_dbi_command(priv->dbi, 0xd1, 0x22);		/* flhw */
+	panel_dbi_command(priv->dbi, 0xd2, 0x22);		/* vckhw */
+	panel_dbi_command(priv->dbi, 0xd3, 0x04);		/* flt */
+	panel_dbi_command(priv->dbi, 0xd4, 0x14);		/* tctrl */
+	panel_dbi_command(priv->dbi, 0xd6, 0x02);		/* dotinv */
+	panel_dbi_command(priv->dbi, 0xd7, 0x00);		/* on/off sequence period */
+
+	panel_dbi_command(priv->dbi, 0xd8, 0x01, 0x05, 0x06, 0x0d,
+			  0x18, 0x09, 0x22, 0x23, 0x00);		/* ponseqa */
+	panel_dbi_command(priv->dbi, 0xd9, 0x24, 0x01);			/* ponseqb */
+	panel_dbi_command(priv->dbi, 0xde, 0x09, 0x0f, 0x21, 0x12,
+			  0x04);					/* ponseqc */
+
+	panel_dbi_command(priv->dbi, 0xdf, 0x02, 0x06, 0x06, 0x06,
+			  0x06, 0x00);					/* pofseqa */
+	panel_dbi_command(priv->dbi, 0xe0, 0x01);				/* pofseqb */
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
+	panel_dbi_command(priv->dbi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x40);
+
+	panel_dbi_command(priv->dbi, 0xe2, 0x00, 0x00);		/* cabc pwm */
+	panel_dbi_command(priv->dbi, 0xe3, 0x03);			/* cabc */
+	panel_dbi_command(priv->dbi, 0xe4, 0x66, 0x7b, 0x90, 0xa5,
+			  0xbb, 0xc7, 0xe1, 0xe5);		/* cabc brightness */
+	panel_dbi_command(priv->dbi, 0xe5, 0xc5, 0xc5, 0xc9, 0xc9,
+			  0xd1, 0xe1, 0xf1, 0xfe);		/* cabc brightness */
+	panel_dbi_command(priv->dbi, 0xe7, 0x2a);			/* cabc */
+	panel_dbi_command(priv->dbi, 0xe8, 0x00);			/* brt_rev */
+	panel_dbi_command(priv->dbi, 0xe9, 0x00);			/* tefreq */
+
+	panel_dbi_command(priv->dbi, 0xea, 0x01);			/* high speed ram */
+
+	panel_dbi_command(priv->dbi, 0xeb, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r pos */
+	panel_dbi_command(priv->dbi, 0xec, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r neg */
+	panel_dbi_command(priv->dbi, 0xed, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g pos */
+	panel_dbi_command(priv->dbi, 0xee, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g neg */
+	panel_dbi_command(priv->dbi, 0xef, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b pos */
+	panel_dbi_command(priv->dbi, 0xf0, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b neg */
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(110);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_ON);
+
+	return 0;
+}
+
+static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
+{
+	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_OFF);
+	msleep(35);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_ENTER_SLEEP_MODE);
+	msleep(50);
+
+	return 0;
+}
+
+static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
+{
+	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
+
+	msleep(50);
+
+	return 0;
+}
+
+static const struct drm_display_mode hitachi_tx10d07vm0baa_mode = {
+	.clock = (480 + 10 + 10 + 10) * (800 + 4 + 4 + 4) * 60 / 1000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 10,
+	.hsync_end = 480 + 10 + 10,
+	.htotal = 480 + 10 + 10 + 10,
+	.vdisplay = 800,
+	.vsync_start = 800 + 4,
+	.vsync_end = 800 + 4 + 4,
+	.vtotal = 800 + 4 + 4 + 4,
+	.width_mm = 52,
+	.height_mm = 86,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int hitachi_tx10d07vm0baa_get_modes(struct drm_panel *panel,
+					   struct drm_connector *connector)
+{
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &bus_format, 1);
+
+	connector->display_info.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+					    DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
+					    DRM_BUS_FLAG_DE_HIGH |
+					    DRM_BUS_FLAG_DATA_LSB_TO_MSB;
+
+	return drm_connector_helper_get_modes_fixed(connector, &hitachi_tx10d07vm0baa_mode);
+}
+
+static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs = {
+	.prepare = hitachi_tx10d07vm0baa_prepare,
+	.enable = hitachi_tx10d07vm0baa_enable,
+	.disable = hitachi_tx10d07vm0baa_disable,
+	.unprepare = hitachi_tx10d07vm0baa_unprepare,
+	.get_modes = hitachi_tx10d07vm0baa_get_modes,
+};
+
+static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbi)
+{
+	struct hitachi_tx10d07vm0baa *priv;
+	struct device *dev = &dbi->dev;
+	int ret;
+
+	priv = devm_drm_panel_alloc(dev, struct hitachi_tx10d07vm0baa, panel,
+				    &hitachi_tx10d07vm0baa_panel_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies),
+					    hitachi_tx10d07vm0baa_supplies, &priv->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
+
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "Failed to get reset gpio\n");
+
+	priv->dbi = dbi;
+	mipi_dbi_set_drvdata(dbi, priv);
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	ret = devm_drm_panel_add(dev, &priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add panel\n");
+
+	return devm_mipi_dbi_attach(dev, dbi);
+}
+
+static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
+	{ .compatible = "hit,tx10d07vm0baa" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
+
+static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver = {
+	.driver = {
+		.name = "panel-hitachi-tx10d07vm0baa",
+		.of_match_table = hitachi_tx10d07vm0baa_of_match,
+	},
+	.probe = hitachi_tx10d07vm0baa_probe,
+};
+module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

