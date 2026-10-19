Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A0B4BEE5A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403860; cv=none; b=bAtLpAt7kx/09LKByBN/zY3uUzI+kOz14RYr+peASj3xzsWVZqj7sxPu1ta3YMnF6gi5B1vn+ZfLcRNx0B9EE151RCfb+ZOh4s/VjzpUBO+9icGpLb3oP/Na6vYXHzfD8MqpcOqiohH1umJ/7t1G0DYWJHriZjhCWnbexwbQLTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403860; c=relaxed/simple;
	bh=gOvexMUpNDoLu8Fyf+jZcrGEhsQpvOrTCml/3XWBHt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=siZAqMkYKrjcqBxtdJGoU3pB0xT9C5WV0rW8V7kAjG9X+6XbPzptSVBm5ChSej270oz/nJWAmkFwqyKNBI72ITvwwyQJiRJ7DzkDzgtWSpIxrDcno+VK+fS9U97tMILsrno22jJjCIDIIa6rHOipxLOoQPCyUm/O6pzDyWDzbyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdajyxXM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdajyxXM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so6980905e9.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403857; x=1793008657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+kDEcjvxo1VdT9r0bV/+sDHRVkc+YOrgN2LIdxxt1E=;
        b=WdajyxXMdFw4id22xNdRHR5EZ2EiyCJbZYb6AWLD5sa40R1mYCARnPVCPhY3f/e1KS
         iuag9nDXFkUS9+sr10UVZuf2O1bpUKHJcoLBiH6xDuIESGVPxMudUk7F7z4kUp8hsMjo
         HXfXtkBnzfq8pNN3TbkkYOWO+J/GxqxvEvEf49N8Pu2Atcq24ndZkmmNG6jdDYK24S0u
         7P6ePqud0GNDRNvylFB93Cg8eCFIG+4qMYh7jQp7k3YPOElNYSFKyEyB8aEwDcYBYQhp
         qjlN6EMVi+HakNZoF4tiyXwAYMfSFHu9DtM9GnKRwAqNx3roorL3qld9fUttfnIWSzZn
         O63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403857; x=1793008657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+kDEcjvxo1VdT9r0bV/+sDHRVkc+YOrgN2LIdxxt1E=;
        b=McJAwtnsRgTyP85v2WYIbZx4i1951ssBdcUY0FtF4Rp/iW6ER53RJ11W0MUw0Hvwmb
         6EStF3Xe2G1IFJbzQSM9d/H5aZqu8I1LigvAXQPnjI3WsSvs20X6nJ9s0bBGh7bnLC4N
         spiz7fwmWt8ruA0C9qiFkytrmSiC29p+HnV0Uk/LYc1gPfJGj+0T3ZOu1g812EImSLkE
         W/OPjJ+JPqAncG3jTB2spCR26MejXVP0UAz/S9+KgXdvv6Qr89M6C5lSka3DYRRB4M9B
         ySayNlG8s0qH1xbVLs4TACNRByTWercLPdwQl05gg8VX+o3DkKp0gOIP8Lu2HXNNN0mw
         wHJw==
X-Forwarded-Encrypted: i=1; AKwUvBwg6XL+17Yvf2O+7jWHRRcRaHXJd6pTBsUpwMbAxxOW2jMGfCeOFfAUIhatwCrw04VetbUAOklQsd5V@vger.kernel.org
X-Gm-Message-State: AFq9FYJnNE8DFPrrl4/8TSc/mFJpGvsp2MsCq4OMlrFIiJTiLZFMDbC3
	1w064CkaxRk7JwQUhJoDBVVbF6t4NBdYJQ0pp2CoSbghD5aWEMjtzpAb
X-Gm-Gg: AYBFou0hdd1jCOglq5Gx7jOr+vwcIG/7Oh/FyGGcLihEpp9fvCOVIFR0yiCrs9KrsL0
	ntqNEAU53TW4rwKA+H92EiT1npaxALzZIr1apFK2O7CdV7J4jYM2NmLennvbIstUYwl24TqrJLa
	bcQof1d/bcEyJneXDwTPemKB6U+4YFWP71pls5al97QZEKgEHCY94XYw0J0KT3SfOnN7UxtsbTC
	1H5nsI5Ye/j4TE65c/fdcIthA8lx2e8IJVNapH0Hfao0sYPlP35kxMNMPB4Kfk2776yiWTuUzq8
	ImncBYm4twsPV6nDm2/XXKXBGhGcOx0UInzRBIXb0uCFBIFhbupDgDUE/SQv+lWpWz09PgBVIM/
	qiboXYolskWnMGczjgzg8kkT79tlLKTR6afZxWo22NNuZvoP7pLjct2cnX+r+EwA76g6BLvRVi3
	BlSaeUnR3IDbXB6A4bQL95eJD880abimoXjsKrgYb6KaS9iM1hAvVRZE7Yg5LnyOHZBEz6TiwcE
	qu4zllG1Gg19NLP1PVwgIqMxMvWcg==
X-Received: by 2002:a05:600c:8b25:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1d75f987dmr191840115e9.12.1792403856223;
        Mon, 19 Oct 2026 02:57:36 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
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
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 6/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
Date: Mon, 19 Oct 2026 12:57:04 +0300
Message-ID: <20261019095705.91062-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019095705.91062-1-clamor95@gmail.com>
References: <20261019095705.91062-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for panel used in LG Optimus 2X P990. Panel is 4" WVGA MIPI
DBI Type B linked to DRM encoder via RGB to DBI bridge.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  14 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 297 ++++++++++++++++++
 3 files changed, 312 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 53a1fc2913fee..5f68b78526c3e 100644
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
index f2c9c80a218f0..414267a49d922 100644
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
index 0000000000000..c3434cb96c86c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -0,0 +1,297 @@
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
+	struct mipi_dbi *dbi;
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
+#define panel_dbi_command(priv, cmd, seq...) \
+({ \
+	const u8 d[] = { seq }; \
+	struct drm_panel *panel = &(priv)->panel; \
+	struct device *dev = panel->dev; \
+	int ret; \
+	ret = mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
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
+	priv->dbi = dev_get_drvdata(dev->parent);
+	if (!priv->dbi)
+		return -ENODEV;
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
+	panel_dbi_command(priv, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x03, 0x1f);
+	panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x03, 0x20,
+			  0x00, 0x00);
+
+	panel_dbi_command(priv, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_START, 0x00, 0x00);
+
+	panel_dbi_command(priv, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT);
+	panel_dbi_command(priv, MIPI_DCS_SET_TEAR_SCANLINE, 0x00, 0x00);
+
+	panel_dbi_command(priv, 0x71, 0x00);		/* Ex_Vsync_en */
+
+	panel_dbi_command(priv, 0xb2, 0x00);		/* VCSEL */
+	panel_dbi_command(priv, 0xb4, 0xaa);		/* setvgmpm */
+	panel_dbi_command(priv, 0xb5, 0x33);		/* rbias1 */
+	panel_dbi_command(priv, 0xb6, 0x03);		/* rbias2 */
+
+	panel_dbi_command(priv, 0xb7, 0x1a, 0x33, 0x03, 0x03,
+			  0x03, 0x00, 0x00, 0x01, 0x02, 0x00,
+			  0x00, 0x04, 0x00, 0x01, 0x01, 0x01);	/* set_ddvdhp */
+	panel_dbi_command(priv, 0xb8, 0x1c, 0x53, 0x03, 0x03,
+			  0x00, 0x01, 0x02, 0x00, 0x00, 0x04,
+			  0x00, 0x01, 0x01);			/* set_ddvdhm */
+
+	panel_dbi_command(priv, 0xb9, 0x0a, 0x01, 0x01, 0x00,
+			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgh */
+	panel_dbi_command(priv, 0xba, 0x0f, 0x01, 0x01, 0x00,
+			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgl */
+	panel_dbi_command(priv, 0xbb, 0x00, 0x00, 0x00, 0x00,
+			  0x01, 0x02, 0x01);			/* set_vcl */
+
+	panel_dbi_command(priv, 0xc1, 0x01);		/* number of lines */
+	panel_dbi_command(priv, 0xc2, 0x08);		/* number of fp lines */
+	panel_dbi_command(priv, 0xc3, 0x04);		/* gateset(1) */
+	panel_dbi_command(priv, 0xc4, 0x4c);		/* 1h period */
+	panel_dbi_command(priv, 0xc5, 0x03);		/* source precharge */
+	panel_dbi_command(priv, 0xc6, 0xc4, 0x04);	/* source precharge timing */
+	panel_dbi_command(priv, 0xc7, 0x00);		/* source level */
+	panel_dbi_command(priv, 0xc8, 0x02);		/* number of bp lines */
+	panel_dbi_command(priv, 0xc9, 0x10);		/* gateset(2) */
+	panel_dbi_command(priv, 0xca, 0x04, 0x04);	/* gateset(3) */
+	panel_dbi_command(priv, 0xcb, 0x03);		/* gateset(4) */
+	panel_dbi_command(priv, 0xcc, 0x12);		/* gateset(5) */
+	panel_dbi_command(priv, 0xcd, 0x12);		/* gateset(6) */
+	panel_dbi_command(priv, 0xce, 0x30);		/* gateset(7) */
+	panel_dbi_command(priv, 0xcf, 0x30);		/* gateset(8) */
+	panel_dbi_command(priv, 0xd0, 0x40);		/* gateset(9) */
+	panel_dbi_command(priv, 0xd1, 0x22);		/* flhw */
+	panel_dbi_command(priv, 0xd2, 0x22);		/* vckhw */
+	panel_dbi_command(priv, 0xd3, 0x04);		/* flt */
+	panel_dbi_command(priv, 0xd4, 0x14);		/* tctrl */
+	panel_dbi_command(priv, 0xd6, 0x02);		/* dotinv */
+	panel_dbi_command(priv, 0xd7, 0x00);		/* on/off sequence period */
+
+	panel_dbi_command(priv, 0xd8, 0x01, 0x05, 0x06, 0x0d,
+			  0x18, 0x09, 0x22, 0x23, 0x00);		/* ponseqa */
+	panel_dbi_command(priv, 0xd9, 0x24, 0x01);			/* ponseqb */
+	panel_dbi_command(priv, 0xde, 0x09, 0x0f, 0x21, 0x12,
+			  0x04);					/* ponseqc */
+
+	panel_dbi_command(priv, 0xdf, 0x02, 0x06, 0x06, 0x06,
+			  0x06, 0x00);					/* pofseqa */
+	panel_dbi_command(priv, 0xe0, 0x01);				/* pofseqb */
+
+	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
+	panel_dbi_command(priv, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x40);
+
+	panel_dbi_command(priv, 0xe2, 0x00, 0x00);		/* cabc pwm */
+	panel_dbi_command(priv, 0xe3, 0x03);			/* cabc */
+	panel_dbi_command(priv, 0xe4, 0x66, 0x7b, 0x90, 0xa5,
+			  0xbb, 0xc7, 0xe1, 0xe5);		/* cabc brightness */
+	panel_dbi_command(priv, 0xe5, 0xc5, 0xc5, 0xc9, 0xc9,
+			  0xd1, 0xe1, 0xf1, 0xfe);		/* cabc brightness */
+	panel_dbi_command(priv, 0xe7, 0x2a);			/* cabc */
+	panel_dbi_command(priv, 0xe8, 0x00);			/* brt_rev */
+	panel_dbi_command(priv, 0xe9, 0x00);			/* tefreq */
+
+	panel_dbi_command(priv, 0xea, 0x01);			/* high speed ram */
+
+	panel_dbi_command(priv, 0xeb, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r pos */
+	panel_dbi_command(priv, 0xec, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r neg */
+	panel_dbi_command(priv, 0xed, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g pos */
+	panel_dbi_command(priv, 0xee, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g neg */
+	panel_dbi_command(priv, 0xef, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b pos */
+	panel_dbi_command(priv, 0xf0, 0x00, 0x33, 0x0e, 0x15,
+			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b neg */
+
+	panel_dbi_command(priv, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(110);
+
+	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_ON);
+
+	return 0;
+}
+
+static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
+{
+	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
+
+	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_OFF);
+	msleep(35);
+
+	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
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
+	.width_mm = 86,
+	.height_mm = 52,
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
+static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct hitachi_tx10d07vm0baa *priv;
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
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	ret = devm_drm_panel_add(dev, &priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add panel\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
+	{ .compatible = "hit,tx10d07vm0baa" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
+
+static struct platform_driver hitachi_tx10d07vm0baa_driver = {
+	.driver = {
+		.name = "panel-hitachi-tx10d07vm0baa",
+		.of_match_table = hitachi_tx10d07vm0baa_of_match,
+	},
+	.probe = hitachi_tx10d07vm0baa_probe,
+};
+module_platform_driver(hitachi_tx10d07vm0baa_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

