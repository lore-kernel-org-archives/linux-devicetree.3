Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BC63BF662
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643582; cv=none; b=N9BKh9J6k8VAUxfMa2Yn1WIzWahhYDs1rdDi4erYaPRxaEHM240pBgQHYdbNKjx3RYsjBggQ5hkCBtOGYnbhdHq1nkAcgMBVtbX2DfpyyAHvkr6HgfxgI9BEDtvP+wDCIFsBPAJ/tVZPBVgo8Xu9024u1UV3jNqFjTlKzevNyPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643582; c=relaxed/simple;
	bh=V4H5o84ULyZbBKOijfA3ePaV5yYn20I50mAguDLxKxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMaAeOpkxXQddiVjkx+JxdOd/CB+wDgmuxkbJp+wXfrIaVhxKGuDTA2SzZEz7hzbKM/Pg6ucRU20IBOWmmu0NpHHZJE3bzJ+V4VlGDjCZlcc5hyN2EposFxRa5WNNXDXyXz16d256YXOxHnFMt+08xjhzCZBn4e2JujGBsVhPdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bj5h40i9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bj5h40i9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48909558b3aso20216355e9.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643575; x=1778248375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvl5JR6cLZ1r8lfMyO+kY5MnrAHy1geFL9HdRSp8SKo=;
        b=bj5h40i9kvm3TWgNNisxpFrKdXZ9hRw937P0iDDLLLIzVvMKIvc+Y4Dxb8fzKV4CBm
         Ycz7GnQAhX+E5d697Y+Teupj+aI1jtTvZHR5ileg2zpeZ06WrdTHAgzn8rv6DObqUO4V
         VdJrykQ3RXKgc996af6QXN4Ec1+sl4Hk7e/5fM9bjVKgLpwUzThyUNxElIK+zYOfVs3w
         ZEKNUOHePHKIjjWrVVXPigGCyUYHn2OleBHXV1ySWrGBWnJcDIvouEDO/kdDjoTYX9/B
         Uzmc+zdcR5/WIJORjCcFM4NMpyWH7gGr4IFY7jo3GYF30yXf0ubShJ+xWNeQLBX8cVwb
         94kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643575; x=1778248375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mvl5JR6cLZ1r8lfMyO+kY5MnrAHy1geFL9HdRSp8SKo=;
        b=XUWShXUEWsns+6gCdBnsjhoiwes8t3/kT2qo7bnvaCrlqD0jHhLzvPKICc24ekZ9Ly
         VqbheRRIqSkCI/sDAXiwP/XkyFVLLB0iyLBibWBS6dawItEPGZJYfDnkLnsRmeFo6fVN
         3AVMAeMRuyq9ewWEEqadc2UUHovVs7V8abCknqHp4uVBOC8IJZ0Ze+S4XV5+ASRFQnuO
         4EVZBUgdKFqb+cNp0W2EgeFEXBQ6sBCwfO6kyCnFUA/ro8pgxX4Olul06k4PejZeJbIF
         sUJcteWwWlowUbQKCwiduYlNeX4aTWvTSrnU6I/HqsOIKCuHnWseaLjp/AkdTgpKmC1X
         L6pQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JpcERSZeU4J6NZmOeMkiwEW7fbejWupphvciuaXyQ/LnfyxrvfrWdi1kN7TEAd87V8F329Awjxn31@vger.kernel.org
X-Gm-Message-State: AOJu0Yz65k70eIYzT0nlwgvTJbJ0j1hzcOe4f9bfeG7IP37Nqwqsf/gG
	KSD86NrvvfKjrmkjyj90trD+2nBZqb3r9D69XJ0hMczPPv2E1SPGqJUelHM46clDyvY=
X-Gm-Gg: AeBDies7KLffOU/e5Chv2ME437jwYcLPG0iKr7YndZSp+UBOyWpVIxKY0YPK87zBra9
	8yxrZ5zPXJ3GuKZcApZ7Wk83naDiYlzMpv8tyUDPxxC4QZi/pyC+F16L8yJ9ZDP/cGAg1L5fGoc
	mXWmuWUJ5YrkvNgc13w4tyNHDEpK0ZFeOVFyfz/iQIjThRj6CFSHC3Rl2X9FzBBFuEwNcDl6sGX
	doknvRrxAUz3293C3I3/mwRcbSrEWFLaFER+vk4M8tXVco9XuKkZX/59b7/VLYks6R9g7v5v4fZ
	UEpcJFdPSyT4JSOGlomBNhOytK/ZJmUBvYvVcH9rmWproP09G+SyHmiwtkye1FDXgM5jsC6WtSp
	jH/X0yUhcIQVuuWbDROQUPjbrmPT7C5k37utpvQHU+UpVJ72v750JMPramnrpHiGyD65JRpVwtK
	PTZOD4/EVSyP3tKVB14gbDl2xP0EuiTbncTaL3g+3w/iL+GNAt6n6tP3yNirLQOiNsTuo4Rdo9a
	T+4QepP
X-Received: by 2002:a05:600c:8010:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48a8446d8a4mr118400885e9.13.1777643575472;
        Fri, 01 May 2026 06:52:55 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 15:52:46 +0200
Subject: [PATCH 2/4] drm/panel: Add driver for Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-fp6-panel-v1-2-e09cb05651cc@fairphone.com>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
In-Reply-To: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=16715;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=V4H5o84ULyZbBKOijfA3ePaV5yYn20I50mAguDLxKxc=;
 b=v381AjKbFg0AzynxDkRd7EcaELic1kLFZaxEZrmIJsPyPEN4uz08HrPZUvzMeJFMqjQCCbczX
 fUS4gSPSjAMCAVl9iQ+49jjfq1n7Mcsch6a0v1h5ohY/KI0LPm5VYhp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
smartphone.

The panel can also be configured in 10-bit (RGB101010) mode, however
currently it's configured in 8-bit (RGB888) since there's some issues in
the Qualcomm DPU driver when driving this panel in 10-bit.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37705.c | 413 ++++++++++++++++++++++++++
 3 files changed, 425 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 979109c27b9b..59ab3f29d8ef 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -624,6 +624,17 @@ config DRM_PANEL_NOVATEK_NT37700F
 	  Say Y here if you want to enable support for Novatek NT37700F DSI
 	  panel module. The panel has a resolution of 1080x2160.
 
+config DRM_PANEL_NOVATEK_NT37705
+	tristate "Novatek NT37705-based DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_KMS_HELPER
+	help
+	  Say Y here if you want to enable support for Novatek NT37705-based
+	  display panels, such as the one found in the The Fairphone (Gen. 6)
+	  smartphone.
+
 config DRM_PANEL_NOVATEK_NT37801
 	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 0d694acbfbb6..94639bc58ca8 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37705) += panel-novatek-nt37705.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37705.c b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
new file mode 100644
index 000000000000..27bd8072ccd1
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
+ * Copyright (c) 2026 Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct nt37705_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data nt37705_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "dvdd" },
+	{ .supply = "vci" },
+};
+
+static inline struct nt37705_panel *to_nt37705_panel(struct drm_panel *panel)
+{
+	return container_of_const(panel, struct nt37705_panel, panel);
+}
+
+static void nt37705_reset(struct nt37705_panel *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int nt37705_on(struct nt37705_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x01, 0x01, 0x01, 0x00, 0x05, 0x05,
+				     0x05, 0x00, 0x05, 0x05, 0x05, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x0b,
+				     0x0b, 0x00, 0x00, 0x0b, 0x0b, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
+				     0x1d, 0x00, 0x00, 0x00, 0x1d, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x5c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+				     0x01, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x6c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
+				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
+				     0x00, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x7c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
+				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
+				     0x00, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x8c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x9c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x11, 0x11, 0x20, 0x02, 0x00, 0x03, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x00, 0xc0, 0x40, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
+				     0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xb0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
+				     0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x08, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc5, 0x15, 0x15, 0x15, 0xdd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf9, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf5, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x20);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x045b);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x09b3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x00);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xbb0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x04);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xfe0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x01, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x03, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91,
+				     0x89, 0x28, 0x00, 0x0c, 0xd2, 0x00, 0x02,
+				     0x2f, 0x01, 0x18, 0x00, 0x07, 0x09, 0x75,
+				     0x08, 0x34, 0x10, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 22);
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt37705_off(struct nt37705_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt37705_prepare(struct drm_panel *panel)
+{
+	struct nt37705_panel *ctx = to_nt37705_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	struct drm_dsc_picture_parameter_set pps;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	nt37705_reset(ctx);
+
+	ret = nt37705_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
+		return ret;
+	}
+
+	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+
+	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_compression_mode(ctx->dsi, true);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable compression mode: %d\n", ret);
+		return ret;
+	}
+
+	msleep(28); /* TODO: Is this panel-dependent? */
+
+	return 0;
+}
+
+static int nt37705_unprepare(struct drm_panel *panel)
+{
+	struct nt37705_panel *ctx = to_nt37705_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = nt37705_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode nt37705_mode = {
+	.clock = (1116 + 100 + 30 + 100) * (2484 + 70 + 48 + 70) * 120 / 1000,
+	.hdisplay = 1116,
+	.hsync_start = 1116 + 100,
+	.hsync_end = 1116 + 100 + 30,
+	.htotal = 1116 + 100 + 30 + 100,
+	.vdisplay = 2484,
+	.vsync_start = 2484 + 70,
+	.vsync_end = 2484 + 70 + 48,
+	.vtotal = 2484 + 70 + 48 + 70,
+	.width_mm = 66,
+	.height_mm = 146,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int nt37705_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &nt37705_mode);
+}
+
+static const struct drm_panel_funcs nt37705_panel_funcs = {
+	.prepare = nt37705_prepare,
+	.unprepare = nt37705_unprepare,
+	.get_modes = nt37705_get_modes,
+};
+
+static int nt37705_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static const struct backlight_ops nt37705_bl_ops = {
+	.update_status = nt37705_bl_update_status,
+};
+
+static struct backlight_device *
+nt37705_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.scale = BACKLIGHT_SCALE_NON_LINEAR,
+		.brightness = 4095,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &nt37705_bl_ops, &props);
+}
+
+static int nt37705_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct nt37705_panel *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct nt37705_panel, panel,
+				   &nt37705_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(nt37705_supplies),
+					    nt37705_supplies,
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
+	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = nt37705_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	/* This panel only supports DSC; unconditionally enable it */
+	dsi->dsc = &ctx->dsc;
+
+	ctx->dsc.dsc_version_major = 1;
+	ctx->dsc.dsc_version_minor = 1;
+
+	/* TODO: Pass slice_per_pkt = 2 */
+	ctx->dsc.slice_height = 12;
+	ctx->dsc.slice_width = 558;
+	/*
+	 * TODO: hdisplay should be read from the selected mode once
+	 * it is passed back to drm_panel (in prepare?)
+	 */
+	WARN_ON(1116 % ctx->dsc.slice_width);
+	ctx->dsc.slice_count = 1116 / ctx->dsc.slice_width;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+	ctx->dsc.block_pred_enable = true;
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
+static void nt37705_remove(struct mipi_dsi_device *dsi)
+{
+	struct nt37705_panel *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id nt37705_of_match[] = {
+	{ .compatible = "boe,bj631jhm-t71-d900" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, nt37705_of_match);
+
+static struct mipi_dsi_driver nt37705_driver = {
+	.probe = nt37705_probe,
+	.remove = nt37705_remove,
+	.driver = {
+		.name = "panel-novatek-nt37705",
+		.of_match_table = nt37705_of_match,
+	},
+};
+module_mipi_dsi_driver(nt37705_driver);
+
+MODULE_DESCRIPTION("DRM driver for NT37705-equipped DSI panels");
+MODULE_LICENSE("GPL");

-- 
2.54.0

