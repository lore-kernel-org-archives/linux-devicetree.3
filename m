Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812542;
	b=KgNZwLmRR1GNhv8taTSkbb9oaDVSQYnyZqdEdF8L29BWe3stGErBEncEwFJ7NX5L7n98
	 L+OwJOucZSKd9EyG9npshxpVYa5dsjlJiBH4CGH8qywbjNT473O3c1rHe3Iwkwltw3kW6
	 TfL/oUnVnLTCJFF3wtnmhMFrSp0M+lgRKQz+170VQ5H2TIoRXo3SNSaQc0KoBNIUw9YZt
	 SVWYPT9b+rOwPByLHDC65WY97C5MQH/s9yj/ziirTjB6jKGjSrli3EtEnjLZqfBrhJMYV
	 tLmWT20zfGc+AXgzAO1Y4izPIh/zvCPmsyexMqpD5iZtjpg+fW4o2Zpahti7Bg5k9Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Dr7LZzth5V2hWEiJXepSgpf4Gu/fvC5toXgZe9kh6oc=;
	b=SNDJqHC661AC4ZtcBPPRqHTLAU9R/08Ocicwh+2r7jjOILLAulSVuBIwoceHYWRfe34E
	 YH+rmKxp2Ro9ZKHU9MPzU4aQ5dM6gBAgXeRQpU+NxFoeSrPDqOoB0iwzgYqvZBOhJdE3s
	 OUmWeHHjNzYXbEYSdd3tKWFJNM0N3j8Al/VGY7dpFDRFn2Tzfk+1OGSQlPyLsT5Mnib00
	 prOQMlGOuAG0nKQj8aQHyYKpQcwYqAFeHLRljPuVZA6TNYlIto7qzyGtOyRm/5Xcz6jD6
	 UY6g6wUSkpxr5u76g2pLU8AidkQQZy3tZpHbbCdL0NCwdp7kSr9S8yk7Yoden3J5KoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYkopgnk;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB759606A880
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB759606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYkopgnk
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so17123795e9.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794812540; x=1795417340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dr7LZzth5V2hWEiJXepSgpf4Gu/fvC5toXgZe9kh6oc=;
        b=PYkopgnkzfiHNFPjMn5ZJLUL7N5Wu5/se5vd4Opb5cld7Vs61pm0NbXB61vcyBjEey
         xc6N8vwEc5kEawvlMAOSZAX2lFWSCJUw1wcIYiXamFhd47SIYnUGMEhmDfKSpyLF3/gJ
         ByxgUwwr/GrtomW1mth+TRP/BqLpqenubmTrY2sjMfxGx4N1mOooFtCuBJg5xrlXieXa
         Zw48fHSKxWhjgTijLN47XJSZcKL482dX4PJ8r73CKQcOQNocbwXv9pq3rjI5jVQVEG8c
         n3h646v2JJtsaKlKrCcirW5VKhXp610GBRTDlUKH3az2GwXrgVWxZYiCpAO4ENeLq9zY
         V9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812540; x=1795417340;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dr7LZzth5V2hWEiJXepSgpf4Gu/fvC5toXgZe9kh6oc=;
        b=n0P34sWY53O27N+Ti8ffQ9+vB2MiPWKDrOd9oeV+GI9V/mEXd2aMUYFq92sWcW2c4Y
         Hen7o9iGCe/GXDfFC6NnvT2krMJVvCQ9jy0F95oDCoYLvK8cfPAQ2NmHgQTInUlyupif
         eeBcoi4K4C1OTD1WrDyrgogBCFw2a4H6e5QJYjw0eV0GLitxyHj1+fLbArpeTg8qgsEq
         Y6xIVOrSKcED472eAp1p8CJadhnh7xyPI8efkf4C53ZhEkG4KMHqLNqH/k47EyQkmkU4
         wrxkK8dxYKiJp2SA5WJiEcK6CLMvbgqOHicG/mRWNRNaPRGbGG3Dh0ZW3jOPp+Wl5Sl3
         VeeQ==
X-Forwarded-Encrypted: i=1; AL+hErEO0KxLipHxcPCXbh0cHBRd5mhiPNtRlQPpzpofdVNhCahTx1+4EF4OSG3/m9hPAkUENwOpUBnSMVgL@vger.kernel.org
X-Gm-Message-State: APuU4Z/0nJYmf1Z1jBI7iwHdl9x8je5+SqTuoM+w8aXGs37wkGG/gK20
	oI2/7QBFU5fs8yP7ClTxpsyOh+ZsIZCZx+2o495cx8cHde6b0lGitu5P
X-Gm-Gg: AYBFou0vn93tb5RQxTQN6B68nab79SEThX+n70JyGfkgR/kYUZX8yVsZ33uT5G/q7nz
	tBQ8XYr+z18Wx5i8Ss717V60k+baFEDhUuJuhrz/GOwtcCi+38R8VDf7OH00S1JkY+XOZvOpl2d
	YLgAedpR7znKAsvaw2243yIdDWmzU7Qyf8tm7KznGLpFZpshUZ2C1sdQeEGB27MBaQN1O94vDJv
	FV0qYW6YHV9BUR2r06nOr2yvQi86LeCC6vWwMkGcDuu6F13he7ZaqB0iSjSovaRquW9I1c8M2vj
	I587YFwTcPfXqe0ONzOmk//ggKJBxCsV+qVttRCafsJ86pA7Vw78STOEBgsymj5jaj01MKLbc4r
	JFOs5z3WKNsZcAbcjQ6kqgnrw5T/3Y4i4lWQW5CV8X9s6/NaHG2YQu8Co2mswYGsnGkZMZPi8W6
	XTdZE1Z6KXgyyWGpOEmw6iWRFD6zj0TEhw6facZdTb7nyle9E7LNgUqQJdQ/WWCyu8RvhR54FCj
	ZlR4ybi+IVEz+qeiCvuZcEURaxvI4Lg41ophu7xQaHrFCrzM0rnNUcMD56zF6m7D/GcNbwtBfbk
	6nKdW7Th3WQ=
X-Received: by 2002:a05:600c:83c7:b0:4bb:6fd3:5aab with SMTP id 5b1f17b1804b1-4bb6fd35beemr44404165e9.13.1794812539993;
        Sun, 15 Nov 2026 23:02:19 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm558777625e9.1.2026.11.15.23.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:02:19 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 2/2] drm/panel: add Novatek NT36525 panel driver
Date: Mon, 16 Nov 2026 10:02:12 +0300
Message-ID: <20261116070212.314228-3-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116070212.314228-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DRM panel driver for MIPI-DSI video-mode panels based on the
Novatek NT36525 controller, as fitted on the Samsung Galaxy XCover5
(SM-G525F): 720x1480, active-high reset (RESX), and a DCS init
sequence that mirrors the stock Samsung bring-up. Backlight is handled
through the common drm_panel_of_backlight() path.

The driver was developed during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic), which converted the
init sequence to mipi_dsi_dcs_write_seq_multi() and drafted the driver
skeleton; I reviewed every line. Tested on a Samsung Galaxy XCover5
running 7.4-rc1 plus this driver: the panel initialises and displays
correctly under phosh.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36525.c | 486 ++++++++++++++++++
 3 files changed, 500 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36525.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a520b4d6..b76b9521f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -676,6 +676,19 @@ config DRM_PANEL_NOVATEK_NT36523
 	  around the Novatek NT36523 display controller, such as some
 	  Boe panels used in Xiaomi Mi Pad 5 and 5 Pro tablets.
 
+config DRM_PANEL_NOVATEK_NT36525
+	tristate "Novatek NT36525 DSI panel for Samsung Galaxy XCover5"
+	depends on GPIOLIB
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Novatek NT36525
+	  720x1480 MIPI-DSI video-mode panel, such as the one fitted on the
+	  Samsung Galaxy XCover5 (SM-G525F). The panel uses an active-high
+	  reset and a DCS initialisation sequence that mirrors the stock
+	  Samsung bring-up.
+
 config DRM_PANEL_NOVATEK_NT36532
 	tristate "Novatek NT36532-based MIPI-DSI panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index da5175909..46de72db7 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35532) += panel-novatek-nt35532.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36525) += panel-novatek-nt36525.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36532) += panel-novatek-nt36532.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36536) += panel-novatek-nt36536.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36525.c b/drivers/gpu/drm/panel/panel-novatek-nt36525.c
new file mode 100644
index 000000000..246476af4
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36525.c
@@ -0,0 +1,486 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Novatek NT36525 MIPI DSI panel driver for the Samsung Galaxy XCover5
+ *
+ * Panel timing and the DCS initialisation sequence are taken from the
+ * Samsung GPL kernel release for the SM-G525F
+ * (drivers/video/fbdev/exynos/panel/nt36525/nt36525_xcover5_panel.h).
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct nt36525 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator *vdd;		/* vdd_ldo28, 1.8 V */
+	struct regulator *vpos;		/* LCD positive bias */
+	struct regulator *vneg;		/* LCD negative bias */
+	struct gpio_desc *reset_gpio;	/* panel RESX, active-high per Samsung */
+};
+
+static inline struct nt36525 *panel_to_nt36525(struct drm_panel *p)
+{
+	return container_of(p, struct nt36525, panel);
+}
+
+/* XCover5 panel timing, exact from Samsung DTS node. 720x1480@60. */
+static const struct drm_display_mode nt36525_xcover5_mode = {
+	.clock		= (720 + 128 + 20 + 130) * (1480 + 18 + 2 + 232) * 60 / 1000,
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 128,			/* HFP */
+	.hsync_end	= 720 + 128 + 20,		/* HSA */
+	.htotal		= 720 + 128 + 20 + 130,		/* +HBP */
+	.vdisplay	= 1480,
+	.vsync_start	= 1480 + 18,			/* VFP */
+	.vsync_end	= 1480 + 18 + 2,		/* VSA */
+	.vtotal		= 1480 + 18 + 2 + 232,		/* +VBP */
+	.width_mm	= 59,				/* from panel size node */
+	.height_mm	= 121,
+	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int nt36525_on(struct nt36525 *p)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = p->dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x20);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0e, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0f, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x94, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x95, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x96, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x24);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0b, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0c, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0d, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0f, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x10, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x14, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1a, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1c, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1e, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2f, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3a, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3d, 0x92);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4d, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4e, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x52, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5a, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5b, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5c, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x72);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x64, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x85, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x93, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x94, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xab, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xac, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xad, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xaf, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0xb5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x25);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0b, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5a, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5b, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x60, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x65, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0xb5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xca, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xcc, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd3, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd4, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd5, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd6, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd7, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x26);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x27);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0xb4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1f, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc1, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc2, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc4, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc7, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x23);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0xa6);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0xfc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x04, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1e, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1f, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x24, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x27, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0xfc);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0xfb);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0xf9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0xf7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0xf3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3a, 0xea);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0xe6);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3d, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3f, 0xdd);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x40, 0xdb);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x41, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x20);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00, 0x08, 0x00, 0x18, 0x00, 0x34, 0x00, 0x4c,
+				     0x00, 0x61, 0x00, 0x74, 0x00, 0x86, 0x00, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0xa5, 0x00, 0xdb, 0x01, 0x02, 0x01, 0x43,
+				     0x01, 0x71, 0x01, 0xbd, 0x01, 0xf7, 0x01, 0xfa);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb2, 0x02, 0x34, 0x02, 0x6f, 0x02, 0x98, 0x02, 0xcc,
+				     0x02, 0xf1, 0x03, 0x1d, 0x03, 0x2d, 0x03, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x03, 0x4d, 0x03, 0x60, 0x03, 0x7a, 0x03, 0x94,
+				     0x03, 0xa6, 0x03, 0xa7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb4, 0x00, 0x08, 0x00, 0x18, 0x00, 0x34, 0x00, 0x4c,
+				     0x00, 0x61, 0x00, 0x74, 0x00, 0x86, 0x00, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5, 0x00, 0xa5, 0x00, 0xdb, 0x01, 0x02, 0x01, 0x43,
+				     0x01, 0x71, 0x01, 0xbd, 0x01, 0xf7, 0x01, 0xfa);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x02, 0x34, 0x02, 0x6f, 0x02, 0x98, 0x02, 0xcc,
+				     0x02, 0xf1, 0x03, 0x1d, 0x03, 0x2d, 0x03, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb7, 0x03, 0x4d, 0x03, 0x60, 0x03, 0x7a, 0x03, 0x94,
+				     0x03, 0xa6, 0x03, 0xa7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x00, 0x08, 0x00, 0x18, 0x00, 0x34, 0x00, 0x4c,
+				     0x00, 0x61, 0x00, 0x74, 0x00, 0x86, 0x00, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0x00, 0xa5, 0x00, 0xdb, 0x01, 0x02, 0x01, 0x43,
+				     0x01, 0x71, 0x01, 0xbd, 0x01, 0xf7, 0x01, 0xfa);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02, 0x34, 0x02, 0x6f, 0x02, 0x98, 0x02, 0xcc,
+				     0x02, 0xf1, 0x03, 0x1d, 0x03, 0x2d, 0x03, 0x3b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x03, 0x4d, 0x03, 0x60, 0x03, 0x7a, 0x03, 0x94,
+				     0x03, 0xa6, 0x03, 0xa7);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x21);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00, 0x00, 0x00, 0x10, 0x00, 0x2c, 0x00, 0x44,
+				     0x00, 0x59, 0x00, 0x6c, 0x00, 0x7e, 0x00, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0x9d, 0x00, 0xd3, 0x00, 0xfa, 0x01, 0x3b,
+				     0x01, 0x69, 0x01, 0xb5, 0x01, 0xef, 0x01, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb2, 0x02, 0x2c, 0x02, 0x79, 0x02, 0xaa, 0x02, 0xe6,
+				     0x03, 0x0f, 0x03, 0x3f, 0x03, 0x4f, 0x03, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x03, 0x71, 0x03, 0x86, 0x03, 0xa0, 0x03, 0xbc,
+				     0x03, 0xce, 0x03, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb4, 0x00, 0x00, 0x00, 0x10, 0x00, 0x2c, 0x00, 0x44,
+				     0x00, 0x59, 0x00, 0x6c, 0x00, 0x7e, 0x00, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5, 0x00, 0x9d, 0x00, 0xd3, 0x00, 0xfa, 0x01, 0x3b,
+				     0x01, 0x69, 0x01, 0xb5, 0x01, 0xef, 0x01, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x02, 0x2c, 0x02, 0x79, 0x02, 0xaa, 0x02, 0xe6,
+				     0x03, 0x0f, 0x03, 0x3f, 0x03, 0x4f, 0x03, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb7, 0x03, 0x71, 0x03, 0x86, 0x03, 0xa0, 0x03, 0xbc,
+				     0x03, 0xce, 0x03, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x00, 0x00, 0x00, 0x10, 0x00, 0x2c, 0x00, 0x44,
+				     0x00, 0x59, 0x00, 0x6c, 0x00, 0x7e, 0x00, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0x00, 0x9d, 0x00, 0xd3, 0x00, 0xfa, 0x01, 0x3b,
+				     0x01, 0x69, 0x01, 0xb5, 0x01, 0xef, 0x01, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02, 0x2c, 0x02, 0x79, 0x02, 0xaa, 0x02, 0xe6,
+				     0x03, 0x0f, 0x03, 0x3f, 0x03, 0x4f, 0x03, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x03, 0x71, 0x03, 0x86, 0x03, 0xa0, 0x03, 0xbc,
+				     0x03, 0xce, 0x03, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0xd0);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x10);
+	mipi_dsi_msleep(&ctx, 1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0x0f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x00, 0x01);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 100);
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+
+	return ctx.accum_err;
+}
+
+static int nt36525_prepare(struct drm_panel *panel)
+{
+	struct nt36525 *p = panel_to_nt36525(panel);
+	int ret;
+
+	/* Power-up sequence from Samsung decon_board_nt36525 panel_power_enable */
+	ret = regulator_enable(p->vdd);
+	if (ret)
+		return ret;
+	usleep_range(1000, 1500);
+	ret = regulator_enable(p->vpos);
+	if (ret)
+		goto disable_vdd;
+	usleep_range(1000, 1500);
+	ret = regulator_enable(p->vneg);
+	if (ret)
+		goto disable_vpos;
+	usleep_range(1000, 1500);
+
+	/* Reset pulse, Samsung sequence from panel_reset */
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(p->reset_gpio, 1);
+	usleep_range(1000, 1500);
+	gpiod_set_value_cansleep(p->reset_gpio, 0);
+	usleep_range(3500, 4000);
+	gpiod_set_value_cansleep(p->reset_gpio, 1);
+	usleep_range(10000, 11000);
+
+	ret = nt36525_on(p);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	gpiod_set_value_cansleep(p->reset_gpio, 0);
+	regulator_disable(p->vneg);
+	usleep_range(1000, 1500);
+disable_vpos:
+	regulator_disable(p->vpos);
+	usleep_range(5000, 5500);
+disable_vdd:
+	regulator_disable(p->vdd);
+	return ret;
+}
+
+static int nt36525_unprepare(struct drm_panel *panel)
+{
+	struct nt36525 *p = panel_to_nt36525(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = p->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 60);
+
+	usleep_range(3000, 3500);
+	regulator_disable(p->vneg);
+	usleep_range(1000, 1500);
+	regulator_disable(p->vpos);
+	usleep_range(5000, 5500);
+	regulator_disable(p->vdd);
+	msleep(30);
+	gpiod_set_value_cansleep(p->reset_gpio, 0);
+	return 0;
+}
+
+static int nt36525_get_modes(struct drm_panel *panel, struct drm_connector *conn)
+{
+	struct drm_display_mode *m;
+
+	m = drm_mode_duplicate(conn->dev, &nt36525_xcover5_mode);
+	if (!m)
+		return -ENOMEM;
+	drm_mode_set_name(m);
+	drm_mode_probed_add(conn, m);
+	conn->display_info.width_mm = m->width_mm;
+	conn->display_info.height_mm = m->height_mm;
+	return 1;
+}
+
+static const struct drm_panel_funcs nt36525_funcs = {
+	.prepare	= nt36525_prepare,
+	.unprepare	= nt36525_unprepare,
+	.get_modes	= nt36525_get_modes,
+};
+
+static int nt36525_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct nt36525 *p;
+	int ret;
+
+	p = devm_drm_panel_alloc(dev, struct nt36525, panel, &nt36525_funcs,
+				 DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(p))
+		return PTR_ERR(p);
+
+	p->dsi = dsi;
+	ret = drm_panel_of_backlight(&p->panel);
+	if (ret)
+		return ret;
+
+	p->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(p->vdd))
+		return dev_err_probe(dev, PTR_ERR(p->vdd), "vdd supply\n");
+
+	p->vpos = devm_regulator_get(dev, "vpos");
+	if (IS_ERR(p->vpos))
+		return dev_err_probe(dev, PTR_ERR(p->vpos), "vpos supply\n");
+
+	p->vneg = devm_regulator_get(dev, "vneg");
+	if (IS_ERR(p->vneg))
+		return dev_err_probe(dev, PTR_ERR(p->vneg), "vneg supply\n");
+
+	/*
+	 * Request RESX released (high) rather than asserting it here.  At probe the
+	 * TDDI may still be running the image the bootloader (or a kernel that
+	 * kexec'd into this one) left on screen; asserting RESX mid-stream made the
+	 * touch half of the chip raise its interrupt before any driver had mapped it.
+	 * The real fix for that livelock is in pinctrl-exynos (inherited EINTs are
+	 * masked at init); this only avoids resetting a live panel needlessly.
+	 * prepare() still performs the full 1-0-1 reset pulse, and vdd_ldo28 is
+	 * always-on, so driving RESX high never drives an unpowered chip.
+	 */
+	p->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(p->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(p->reset_gpio), "reset gpio\n");
+
+	/* MIPI DSI config from Samsung panel node: 3-lane, video mode, RGB888 */
+	dsi->lanes	 = 3;
+	dsi->format	 = MIPI_DSI_FMT_RGB888;
+	/*
+	 * MIPI_DSI_MODE_LPM is load-bearing: .prepare sends the DCS init sequence
+	 * before the DSIM video stream is running. Without LPM those writes go out
+	 * in HS, which blocks waiting for a stream that does not exist yet, so
+	 * .prepare never returns and the modeset hangs. In LP mode the init goes
+	 * over the low-power escape clock, independent of the video stream.
+	 */
+	dsi->mode_flags	 = MIPI_DSI_MODE_VIDEO		/* video (non-burst) */
+			 | MIPI_DSI_MODE_VIDEO_SYNC_PULSE
+			 | MIPI_DSI_MODE_LPM		/* force LP for all transfers */
+			 | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_add(&p->panel);
+
+	mipi_dsi_set_drvdata(dsi, p);
+	ret = mipi_dsi_attach(dsi);
+	if (ret) {
+		drm_panel_remove(&p->panel);
+		return dev_err_probe(dev, ret, "failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void nt36525_remove(struct mipi_dsi_device *dsi)
+{
+	struct nt36525 *p = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(dsi);
+	drm_panel_remove(&p->panel);
+}
+
+static const struct of_device_id nt36525_of_match[] = {
+	{ .compatible = "samsung,xcover5-nt36525" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nt36525_of_match);
+
+static struct mipi_dsi_driver nt36525_driver = {
+	.probe	= nt36525_probe,
+	.remove	= nt36525_remove,
+	.driver = {
+		.name		= "panel-novatek-nt36525",
+		.of_match_table	= nt36525_of_match,
+	},
+};
+module_mipi_dsi_driver(nt36525_driver);
+
+MODULE_DESCRIPTION("Novatek NT36525 panel driver for Samsung Galaxy XCover5");
+MODULE_AUTHOR("Adil Hüsrev Tepe <tadilhusrev@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.53.0

