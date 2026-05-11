Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C6F3B5303
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485927; cv=none; b=JE2MYVDOmSIIbStwQlbjN6RGfwBxocm0DAl5/6t6076N6dau8p6kaBTq4+NcfT3R1PL5harD2JiGtSZqg1mSj3smTq2NOlwBTwc2/rYh/Q5iHjZM646hZnczQgom67J2gML/GUz5tR1Wk3I726bPX40xyodQzp0aFmHc4/Ii+dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485927; c=relaxed/simple;
	bh=5/ttUGrzdmeLoeUxoa5oBXlyW5O3PmxRxt2bnocF6cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfldAq15xdfkG2MdgxFyovWYFLmesW7g7JC82FqIvkUi8bN2DAinZ+/sLo/UJBdiL3rimhqncgNweHy5kLgUfjD/tRvX1Bu2GXn3LetBowbslPBQMtWX+jE73+LChwh+Kc/9GglJmLbJy1rWQcbR12TLPQ+I5T246gIDiaSTqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX+sDPMg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX+sDPMg"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-835386ff122so3622220b3a.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485917; x=1779090717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncOLD5lTLUziFiCRB20nnJgnBHULNrVrpQmpze3oHIE=;
        b=XX+sDPMgdlqFR7mZUT5D4qGCm2jsEpSadrurtqnFu7HgpgRwWOmgCrg05lgQHTyR0A
         nohsjXHF20c4vB6g6isMbmJ8A+TLX9sZ146LxMPpGmf/vkeZD0+zxkRKFCJYxWFeTXWN
         M5REA+9SmGV8EUIYA2JATECQm901ByqbkJ+U/s4+y95RX00SKxLtjsADQIIgslIa2kow
         mY+dId9tEECU4gdKiTHhaQ8OzdkeKLOSIWTHEo4wG1V/HLpUzkYPPAyQISUEJNb3WzCm
         EaQoPuXoVCucENPRHMwyMTnatXQHAAuACdi828k48zHg34RrOFzmSHK2vwAKkCoh+njT
         RDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485917; x=1779090717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncOLD5lTLUziFiCRB20nnJgnBHULNrVrpQmpze3oHIE=;
        b=DCgUP73bjSJIrLi2/DHoPrK4g6gY8s7j/Nb6btDLCmP5YnjWK+5HP3KbqPXDPJolOj
         TJWGZWGSMlwxRiN/c/m+pe8fzRWM47ttbv6L0AJBvgZZf/VOJVcj1p0g01Y6Ld9PJdaS
         Y3r2whpguRcTEzuQz8lFrJNRn40fNsS20WXp6OrKSEZwSJ227JRwMyGnAflpO6QNjOL7
         OFBmxEmhK8k1ofJCStVjLFJ8CRJWO+mYZUs4cgQV8sfS6FSFqoE1uSPauRDgSJgRAyMf
         zBKILOG/qhMPpQ6ALCMcapScJCBsbGFS77GfynZZPZZaJ2HWU8irKfJDhIf+Xuk4CuBJ
         l+jw==
X-Forwarded-Encrypted: i=1; AFNElJ8WZGUKAiLhXDkJTWUbtPt9J3HcXupD1iNErkDpPpSp5g+qFqlpExvGy4vV7klhuSJFUk0/PFvpebQD@vger.kernel.org
X-Gm-Message-State: AOJu0YwlhXVYF6qRyLc6R1VJe6CdIqhdsaQR1XvfP9z0cpS6J8tdfyqF
	EodzD0b6BcfyipHj3Mivemx3ffPYA2f3PyeRc0J/9lpwf7li7mkVR9l6
X-Gm-Gg: Acq92OFsqDScEReji+ymD3Gtf+M7I5W0oe0sGf4SrFi9EgoctN2Ealv/b1JAtWsNIek
	2SrKxN5DIJCwqnDRiuzN25wuSoDs7olGJ5c1xoDO6sxIdEayqUnK0EZwUxG8VqzaimvGybQO9ot
	OX7TYCvg4MXv4zHZzlfPD9RYLbgNWSCzQDDWmSJkapA+lxvEL+tPIHIXFJOSgUyZUGBLX6fL6mM
	dTzifykw0vmo94RH4EZ5aeFo+AV1Kv6EsWSYjlPvaQa3DnoWKMP9DWR0fhtCXuX7TICVwrcHp74
	CWFZCT/BKgMPtdiupjuuS0NF4XsFyQUgy3Jcx5Iph3yqtX7Id5G6eczxbFCvxhfHmHfx4GbZ2PO
	/I/fIhKuQoIFh9cEbIxrHrekCLeX5ASQexVYTJKA3bMrQc523DrMAayv9VYCEcUDGsuICsa7w9F
	laJwWT3noOCT8aejsbAwqabQKKVbVai8OvRzJpNThV1ljVBJCXj8o1F3XnmWr/VAqWqwa+TZPCl
	g/CoDkfVFrC
X-Received: by 2002:a05:6a00:b83:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-83a5df489c3mr21724738b3a.29.1778485917247;
        Mon, 11 May 2026 00:51:57 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36a12sm17694642b3a.27.2026.05.11.00.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:56 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 2/2] drm/verisilicon: add support for Nuvoton MA35D1 DCUltra Lite display controller
Date: Mon, 11 May 2026 15:51:42 +0800
Message-ID: <20260511075142.54752-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511075142.54752-1-a0987203069@gmail.com>
References: <20260511075142.54752-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltra Lite display
controller, which is a previous generation of the DC8000 series. While
the general register layout is similar to the DC8000, there are several
key differences that require per-variant handling in the driver.

Add a vs_dc_info platform data structure (in vs_hwdb.h) to describe
per-IP-variant capabilities, and use it throughout the driver to select
the correct code paths at runtime.

Key differences between DC8000 and DCUltra Lite handled:

1. No chip identity registers (0x0020-0x0030): DCUltra Lite uses static
   platform data instead of reading model/revision/customer_id from HW.

2. No CONFIG_EX commit mechanism: DC8000 uses registers at 0x1CC0
   (FB_CONFIG_EX), 0x24D8 (FB_TOP_LEFT), 0x24E0 (FB_BOTTOM_RIGHT),
   0x2510 (FB_BLEND_CONFIG), 0x2518 (PANEL_CONFIG_EX). DCUltra Lite
   omits all of these and instead uses enable/reset bits in FB_CONFIG
   (bit 0 = enable, bit 4 = reset) for direct framebuffer updates.

3. No PANEL_START register (0x1CCC): DCUltra Lite panel output starts
   when PANEL_CONFIG.RUNNING is set; no separate multi-display sync
   start register is needed.

4. Different IRQ registers: DCUltra Lite uses 0x147C (IRQ_STA) /
   0x1480 (IRQ_EN); DC8000 uses 0x0010 (IRQ_ACK) / 0x0014 (IRQ_EN).

5. Different clock/reset topology: DCUltra Lite requires only "core"
   (bus gate) and "pix0" (pixel divider) clocks with no reset lines
   managed by the driver. DC8000 needs core/axi/ahb clocks and three
   resets.

6. Single output only: DCUltra Lite has one display output; per-output
   index logic is still in place but display_count is fixed at 1.

7. Reduced register space: max_register is 0x2000 vs DC8000's 0x2544.

Add the "nuvoton,ma35d1-dcu" compatible string to the OF match table,
extend Kconfig to allow building on ARCH_MA35 platforms, and expose
vs_formats_no_yuv444 as the default format table for DCUltra Lite
(YUV444 blending is a DC8000-only feature).

All changes have been tested on Nuvoton MA35D1 hardware and are
functioning correctly.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  28 ++--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  13 +-
 drivers/gpu/drm/verisilicon/vs_dc.c           | 129 ++++++++++++------
 drivers/gpu/drm/verisilicon/vs_dc.h           |   1 +
 drivers/gpu/drm/verisilicon/vs_drm.c          |  16 ++-
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |   2 +-
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |  25 ++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  43 +++---
 .../drm/verisilicon/vs_primary_plane_regs.h   |   2 +
 10 files changed, 187 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603..295d246eb4b4 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index 7a93049368db..225af322de32 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.c
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
@@ -164,13 +164,16 @@ static void vs_bridge_enable_common(struct vs_crtc *crtc,
 			VSDC_DISP_PANEL_CONFIG_CLK_EN);
 	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
 			VSDC_DISP_PANEL_CONFIG_RUNNING);
-	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
-			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
-			VSDC_DISP_PANEL_START_RUNNING(output));
 
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
-			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+	if (dc->info->has_config_ex) {
+		regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
+				  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
+		regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
+				VSDC_DISP_PANEL_START_RUNNING(output));
+
+		regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
+				VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+	}
 }
 
 static void vs_bridge_atomic_enable_dpi(struct drm_bridge *bridge,
@@ -228,14 +231,17 @@ static void vs_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct vs_dc *dc = crtc->dc;
 	unsigned int output = crtc->id;
 
-	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
-			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
-			  VSDC_DISP_PANEL_START_RUNNING(output));
 	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
 			  VSDC_DISP_PANEL_CONFIG_RUNNING);
 
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
-			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+	if (dc->info->has_config_ex) {
+		regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
+				  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
+				  VSDC_DISP_PANEL_START_RUNNING(output));
+
+		regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
+				VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+	}
 }
 
 static const struct drm_bridge_funcs vs_dpi_bridge_funcs = {
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
index 9080344398ca..2f3e6d41c657 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc.c
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
@@ -18,6 +18,7 @@
 #include "vs_dc.h"
 #include "vs_dc_top_regs.h"
 #include "vs_drm.h"
+#include "vs_hwdb.h"
 #include "vs_plane.h"
 
 static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -132,7 +133,11 @@ static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN, VSDC_TOP_IRQ_VSYNC(vcrtc->id));
+	if (dc->info->family == VS_DC_FAMILY_DCULTRA_LITE)
+		regmap_write(dc->regs, VSDC_DISP_IRQ_EN, BIT(0));
+	else
+		regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
+				VSDC_TOP_IRQ_VSYNC(vcrtc->id));
 
 	return 0;
 }
@@ -142,7 +147,11 @@ static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN, VSDC_TOP_IRQ_VSYNC(vcrtc->id));
+	if (dc->info->family == VS_DC_FAMILY_DCULTRA_LITE)
+		regmap_write(dc->regs, VSDC_DISP_IRQ_EN, 0);
+	else
+		regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
+				  VSDC_TOP_IRQ_VSYNC(vcrtc->id));
 }
 
 static const struct drm_crtc_funcs vs_crtc_funcs = {
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index dad9967bc10b..82a6a26f6d81 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -9,21 +9,45 @@
 #include <linux/of_graph.h>
 
 #include "vs_crtc.h"
+#include "vs_crtc_regs.h"
 #include "vs_dc.h"
 #include "vs_dc_top_regs.h"
 #include "vs_drm.h"
 #include "vs_hwdb.h"
 
-static const struct regmap_config vs_dc_regmap_cfg = {
+static const struct regmap_config vs_dc8000_regmap_cfg = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = sizeof(u32),
-	/* VSDC_OVL_CONFIG_EX(1) */
 	.max_register = 0x2544,
 };
 
+static const struct regmap_config vs_dcultra_lite_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = sizeof(u32),
+	.max_register = 0x2000,
+};
+
+static const struct vs_dc_info vs_dc8000_info = {
+	.family = VS_DC_FAMILY_DC8000,
+	.has_chip_id = true,
+	.has_config_ex = true,
+	.regmap_cfg = &vs_dc8000_regmap_cfg,
+};
+
+static const struct vs_dc_info vs_dcultra_lite_info = {
+	.family = VS_DC_FAMILY_DCULTRA_LITE,
+	.display_count = 1,
+	.has_chip_id = false,
+	.has_config_ex = false,
+	.regmap_cfg = &vs_dcultra_lite_regmap_cfg,
+	.formats = &vs_formats_no_yuv444,
+};
+
 static const struct of_device_id vs_dc_driver_dt_match[] = {
-	{ .compatible = "verisilicon,dc" },
+	{ .compatible = "verisilicon,dc", .data = &vs_dc8000_info },
+	{ .compatible = "nuvoton,ma35d1-dcu", .data = &vs_dcultra_lite_info },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vs_dc_driver_dt_match);
@@ -33,6 +57,13 @@ static irqreturn_t vs_dc_irq_handler(int irq, void *private)
 	struct vs_dc *dc = private;
 	u32 irqs;
 
+	if (dc->info->family == VS_DC_FAMILY_DCULTRA_LITE) {
+		regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
+		if (irqs & BIT(0))
+			vs_drm_handle_irq(dc, VSDC_TOP_IRQ_VSYNC(0));
+		return IRQ_HANDLED;
+	}
+
 	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
 
 	vs_drm_handle_irq(dc, irqs);
@@ -43,6 +74,7 @@ static irqreturn_t vs_dc_irq_handler(int irq, void *private)
 static int vs_dc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct vs_dc_info *info;
 	struct vs_dc *dc;
 	void __iomem *regs;
 	unsigned int port_count, i;
@@ -55,6 +87,10 @@ static int vs_dc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	info = of_device_get_match_data(dev);
+	if (!info)
+		return -ENODEV;
+
 	port_count = of_graph_get_port_count(dev->of_node);
 	if (!port_count) {
 		dev_err(dev, "can't find DC downstream ports\n");
@@ -75,15 +111,31 @@ static int vs_dc_probe(struct platform_device *pdev)
 	if (!dc)
 		return -ENOMEM;
 
-	dc->rsts[0].id = "core";
-	dc->rsts[1].id = "axi";
-	dc->rsts[2].id = "ahb";
+	dc->info = info;
 
-	ret = devm_reset_control_bulk_get_optional_shared(dev, VSDC_RESET_COUNT,
-							  dc->rsts);
-	if (ret) {
-		dev_err(dev, "can't get reset lines\n");
-		return ret;
+	if (info->family == VS_DC_FAMILY_DC8000) {
+		dc->rsts[0].id = "core";
+		dc->rsts[1].id = "axi";
+		dc->rsts[2].id = "ahb";
+
+		ret = devm_reset_control_bulk_get_optional_shared(dev,
+				VSDC_RESET_COUNT, dc->rsts);
+		if (ret) {
+			dev_err(dev, "can't get reset lines\n");
+			return ret;
+		}
+
+		dc->axi_clk = devm_clk_get_enabled(dev, "axi");
+		if (IS_ERR(dc->axi_clk)) {
+			dev_err(dev, "can't get axi clock\n");
+			return PTR_ERR(dc->axi_clk);
+		}
+
+		dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
+		if (IS_ERR(dc->ahb_clk)) {
+			dev_err(dev, "can't get ahb clock\n");
+			return PTR_ERR(dc->ahb_clk);
+		}
 	}
 
 	dc->core_clk = devm_clk_get_enabled(dev, "core");
@@ -92,28 +144,18 @@ static int vs_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->core_clk);
 	}
 
-	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
-	if (IS_ERR(dc->axi_clk)) {
-		dev_err(dev, "can't get axi clock\n");
-		return PTR_ERR(dc->axi_clk);
-	}
-
-	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
-	if (IS_ERR(dc->ahb_clk)) {
-		dev_err(dev, "can't get ahb clock\n");
-		return PTR_ERR(dc->ahb_clk);
-	}
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(dev, "can't get irq\n");
 		return irq;
 	}
 
-	ret = reset_control_bulk_deassert(VSDC_RESET_COUNT, dc->rsts);
-	if (ret) {
-		dev_err(dev, "can't deassert reset lines\n");
-		return ret;
+	if (info->family == VS_DC_FAMILY_DC8000) {
+		ret = reset_control_bulk_deassert(VSDC_RESET_COUNT, dc->rsts);
+		if (ret) {
+			dev_err(dev, "can't deassert reset lines\n");
+			return ret;
+		}
 	}
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
@@ -123,23 +165,30 @@ static int vs_dc_probe(struct platform_device *pdev)
 		goto err_rst_assert;
 	}
 
-	dc->regs = devm_regmap_init_mmio(dev, regs, &vs_dc_regmap_cfg);
+	dc->regs = devm_regmap_init_mmio(dev, regs, info->regmap_cfg);
 	if (IS_ERR(dc->regs)) {
 		ret = PTR_ERR(dc->regs);
 		goto err_rst_assert;
 	}
 
-	ret = vs_fill_chip_identity(dc->regs, &dc->identity);
-	if (ret)
-		goto err_rst_assert;
+	if (info->has_chip_id) {
+		ret = vs_fill_chip_identity(dc->regs, &dc->identity);
+		if (ret)
+			goto err_rst_assert;
 
-	dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
-		 dc->identity.revision, dc->identity.customer_id);
+		dev_info(dev, "Found DC%x rev %x customer %x\n",
+			 dc->identity.model, dc->identity.revision,
+			 dc->identity.customer_id);
 
-	if (port_count > dc->identity.display_count) {
-		dev_err(dev, "too many downstream ports than HW capability\n");
-		ret = -EINVAL;
-		goto err_rst_assert;
+		if (port_count > dc->identity.display_count) {
+			dev_err(dev, "too many downstream ports than HW capability\n");
+			ret = -EINVAL;
+			goto err_rst_assert;
+		}
+	} else {
+		/* Fill identity from platform data */
+		dc->identity.display_count = info->display_count;
+		dc->identity.formats = info->formats;
 	}
 
 	for (i = 0; i < dc->identity.display_count; i++) {
@@ -168,7 +217,8 @@ static int vs_dc_probe(struct platform_device *pdev)
 	return 0;
 
 err_rst_assert:
-	reset_control_bulk_assert(VSDC_RESET_COUNT, dc->rsts);
+	if (info->family == VS_DC_FAMILY_DC8000)
+		reset_control_bulk_assert(VSDC_RESET_COUNT, dc->rsts);
 	return ret;
 }
 
@@ -180,7 +230,8 @@ static void vs_dc_remove(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, NULL);
 
-	reset_control_bulk_assert(VSDC_RESET_COUNT, dc->rsts);
+	if (dc->info->family == VS_DC_FAMILY_DC8000)
+		reset_control_bulk_assert(VSDC_RESET_COUNT, dc->rsts);
 }
 
 static void vs_dc_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index ed1016f18758..f0613519af37 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -31,6 +31,7 @@ struct vs_dc {
 	struct clk *pix_clk[VSDC_MAX_OUTPUTS];
 	struct reset_control_bulk_data rsts[VSDC_RESET_COUNT];
 
+	const struct vs_dc_info *info;
 	struct vs_drm_dev *drm_dev;
 	struct vs_chip_identity identity;
 };
diff --git a/drivers/gpu/drm/verisilicon/vs_drm.c b/drivers/gpu/drm/verisilicon/vs_drm.c
index fd259d53f49f..ff0fc6673006 100644
--- a/drivers/gpu/drm/verisilicon/vs_drm.c
+++ b/drivers/gpu/drm/verisilicon/vs_drm.c
@@ -27,6 +27,7 @@
 #include "vs_dc.h"
 #include "vs_dc_top_regs.h"
 #include "vs_drm.h"
+#include "vs_hwdb.h"
 
 #define DRIVER_NAME	"verisilicon"
 #define DRIVER_DESC	"Verisilicon DC-series display controller driver"
@@ -72,12 +73,19 @@ static struct drm_mode_config_helper_funcs vs_mode_config_helper_funcs = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail,
 };
 
-static void vs_mode_config_init(struct drm_device *drm)
+static void vs_mode_config_init(struct drm_device *drm, struct vs_dc *dc)
 {
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
-	drm->mode_config.max_width = 8192;
-	drm->mode_config.max_height = 8192;
+
+	if (dc->info->family == VS_DC_FAMILY_DCULTRA_LITE) {
+		drm->mode_config.max_width = 1920;
+		drm->mode_config.max_height = 1080;
+	} else {
+		drm->mode_config.max_width = 8192;
+		drm->mode_config.max_height = 8192;
+	}
+
 	drm->mode_config.funcs = &vs_mode_config_funcs;
 	drm->mode_config.helper_private = &vs_mode_config_helper_funcs;
 }
@@ -125,7 +133,7 @@ int vs_drm_initialize(struct vs_dc *dc, struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	vs_mode_config_init(drm);
+	vs_mode_config_init(drm, dc);
 
 	/* Enable connectors polling */
 	drm_kms_helper_poll_init(drm);
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 09336af0900a..39402d75d841 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -78,7 +78,7 @@ static const u32 vs_formats_array_with_yuv444[] = {
 	/* TODO: non-RGB formats */
 };
 
-static const struct vs_formats vs_formats_no_yuv444 = {
+const struct vs_formats vs_formats_no_yuv444 = {
 	.array = vs_formats_array_no_yuv444,
 	.num = ARRAY_SIZE(vs_formats_array_no_yuv444)
 };
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h b/drivers/gpu/drm/verisilicon/vs_hwdb.h
index 92192e4fa086..655cf93ca3aa 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
@@ -14,6 +14,29 @@ struct vs_formats {
 	unsigned int num;
 };
 
+enum vs_dc_family {
+	VS_DC_FAMILY_DC8000,
+	VS_DC_FAMILY_DCULTRA_LITE,
+};
+
+/**
+ * struct vs_dc_info - per-SoC DC platform data
+ * @family:		DC IP family (DC8000, DCUltra Lite, etc.)
+ * @display_count:	number of display outputs (0 = auto-detect from DT/HW)
+ * @has_chip_id:	whether chip identity registers exist
+ * @has_config_ex:	whether CONFIG_EX commit mechanism exists
+ * @regmap_cfg:		regmap configuration for this variant
+ * @formats:		supported pixel formats (NULL = auto-detect from chip ID)
+ */
+struct vs_dc_info {
+	enum vs_dc_family family;
+	u32 display_count;
+	bool has_chip_id;
+	bool has_config_ex;
+	const struct regmap_config *regmap_cfg;
+	const struct vs_formats *formats;
+};
+
 struct vs_chip_identity {
 	u32 model;
 	u32 revision;
@@ -23,6 +46,8 @@ struct vs_chip_identity {
 	const struct vs_formats *formats;
 };
 
+extern const struct vs_formats vs_formats_no_yuv444;
+
 int vs_fill_chip_identity(struct regmap *regs,
 			  struct vs_chip_identity *ident);
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 1f2be41ae496..197d5d683e22 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -55,8 +55,9 @@ static int vs_primary_plane_atomic_check(struct drm_plane *plane,
 
 static void vs_primary_plane_commit(struct vs_dc *dc, unsigned int output)
 {
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_COMMIT);
+	if (dc->info->has_config_ex)
+		regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+				VSDC_FB_CONFIG_EX_COMMIT);
 }
 
 static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
@@ -69,11 +70,13 @@ static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
-	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
-			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
+	if (dc->info->has_config_ex) {
+		regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+				VSDC_FB_CONFIG_EX_FB_EN);
+		regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+				   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
+				   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
+	}
 
 	vs_primary_plane_commit(dc, output);
 }
@@ -88,8 +91,9 @@ static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
+	if (dc->info->has_config_ex)
+		regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+				VSDC_FB_CONFIG_EX_FB_EN);
 
 	vs_primary_plane_commit(dc, output);
 }
@@ -126,6 +130,11 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
 			   VSDC_FB_CONFIG_UV_SWIZZLE_EN,
 			   vs_state->format.uv_swizzle);
 
+	/* DCUltra Lite requires explicit enable/reset bits in FB_CONFIG */
+	if (!dc->info->has_config_ex)
+		regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+				VSDC_FB_CONFIG_ENABLE | VSDC_FB_CONFIG_RESET);
+
 	dma_addr = vs_fb_get_dma_addr(fb, &state->src);
 
 	regmap_write(dc->regs, VSDC_FB_ADDRESS(output),
@@ -133,16 +142,18 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
 	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
 		     fb->pitches[0]);
 
-	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
-		     VSDC_MAKE_PLANE_POS(state->crtc_x, state->crtc_y));
-	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
-		     VSDC_MAKE_PLANE_POS(state->crtc_x + state->crtc_w,
-					 state->crtc_y + state->crtc_h));
 	regmap_write(dc->regs, VSDC_FB_SIZE(output),
 		     VSDC_MAKE_PLANE_SIZE(state->crtc_w, state->crtc_h));
 
-	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
-		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
+	if (dc->info->has_config_ex) {
+		regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
+			     VSDC_MAKE_PLANE_POS(state->crtc_x, state->crtc_y));
+		regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
+			     VSDC_MAKE_PLANE_POS(state->crtc_x + state->crtc_w,
+						 state->crtc_y + state->crtc_h));
+		regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
+			     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
+	}
 
 	vs_primary_plane_commit(dc, output);
 }
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b39..288064760b48 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -16,6 +16,8 @@
 #define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
 
 #define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
+#define VSDC_FB_CONFIG_ENABLE			BIT(0)
+#define VSDC_FB_CONFIG_RESET			BIT(4)
 #define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
 #define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13, 11)
 #define VSDC_FB_CONFIG_ROT(v)			((v) << 11)
-- 
2.43.0

