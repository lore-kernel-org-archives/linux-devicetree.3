Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B734FF55
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169933; cv=none; b=JOUgralAjz7othGoMzVv4wod83dfRLCbzKVEUiEGBsHdNzUUgiHhKrCG3zVytVw4hVUeBOGqb4CLgzzwr2+4nrpV6bHmMW1WVWG6zP02WvNan12elIlTGFVlejXG9vo5Ve454/Cvlz9btvOa8GoqBRr3n+w/gjuMHhSV1/wGcdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169933; c=relaxed/simple;
	bh=9PFoLWZw/d2eHT9wNJjBlZuTX37mryzwhE0FRtU992E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jNGofeC5bX6dejqdTL+4e1ZDfiqLJisCZk7gDXxejqS1eP9S6i+Z5196kvaCZjpYYXTssaWemEubcBasKcwyC+hVUIGo/yaxjvFJsCgUSCWf8HdodnVBfENSvIO63vbLCzlSs3v1714dGCPtl1uNmgR6zI3PKmmWGAypX4FLktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDFR8hFz; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDFR8hFz"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83d31ac4017so1375410b3a.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169931; x=1779774731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGibKSdQf3IcDSU8T6R8Cil+pcTsme1TCnBNNHxsWpo=;
        b=ZDFR8hFzRK6+HgMxQUsvrLPnD67ZYK1vc+Xpnb+GEgegGBdLs+TzwQOBrOFb5hDium
         9tvVtXhVnY8kiTut3bZPNDzpI396a6MnZq8DmsPnL3t4yEQu1z7OdFNv9X3gtlSe1Y+m
         1yC0gnKGvf+Jox3Qs7CsPWvETYZRseV3pM6dZxFSwoaFthUkyk5NhXgq5pJRTKHtBq0j
         PHWwecY/0SpHDBIFEhhj/CMM9Qj72MJWBb1dDdxrYQKN53OWEgIM6XRUn+ZxoBhLdYhQ
         9TBvNhrAsvbNPAeBTkw3VFMzzJXFUHaeM83klcu9VKRUHp4tSjMhD+zIK09slhU8YNZE
         wgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169931; x=1779774731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGibKSdQf3IcDSU8T6R8Cil+pcTsme1TCnBNNHxsWpo=;
        b=mP5728wBTRh/CMdDVI4PyyEcGFgX4n1mWMZxSVpYClJxkRR4cKgtyQOC15TCV1gP7T
         kWJeOZXssFWH4WGeS/e8vYhXMVtZGkbBbe0iMW6YEMuUWQ5OqSdX8CuAAYzKvdM2XusT
         V8cSFFjQzQuByRFtE/c4B9TlIMr/L0ZAWvcPDT6HMjhNqsaRYJng62CSkc/kq8Xn//jn
         hf5Yz0z9tWrtSevsJLBZzj+sfGxfkQja73xNPgUShP+nhSqbX5PWxJRAhkD54W7MZ4nP
         51xRllM816RPSy19WjfW41CvES68nX6nH1cr6wlpxJod5zmVCApqzOKpbVh3bNflCQ07
         NIXw==
X-Forwarded-Encrypted: i=1; AFNElJ+23AcfVIfxG5dh7rnTLrN+/b3hZay1PmkyRjQow3znGokippfNb2M3YQhIHWdePe575SWrifufzHYb@vger.kernel.org
X-Gm-Message-State: AOJu0YzDVlKEzF2Kzv3a7f8rr5AE3zrjLQ+j5qCUY/YG9fWnWNcYEMF4
	e7QxJgXIvHEF1Xi/9tVwcu9hA/UZAzROV6cYNDAimQ8hzFisS3zI7fAd
X-Gm-Gg: Acq92OG9r3l/bvo++M8hFv//aWtkVPRuFvQfbaJy2NpOHO1KoqHDE6vG+bEaEu+W/ZC
	vfdEkOav6jcH45Od44SFUTzfkfXJS5hSKs2g+LwBHyQWsKXgIYIXnLItdQ9gqGvuVbNMHza3CwR
	njoPBCHOLIZAMd1UA/AoCTDH/UK8aiiC5IL1Gwfjh0BmuSmDn41jpqKbaNw56coT/zrFBfNepiM
	KR/l8kdRBWacapkK9sJ5PDCCXOsrPQaj32QUrhPHvcm4kEnQXu2fBOox0pwcN4RdId0m8tz4kWu
	hfjJup+kTtwlrC9FR6+TnAY7+G9dh9RoaD3ze8tQghHjEQR3MfeWjh3bRnkUWFG5SrlZ+7lM8Gy
	sqPrRC7YL/YC8wVa688G9vkjNInk9AnpwfdZXQ9uJXiWBlbTk4TvyqwcK3qnY8Vq/96NYFkFBny
	sfNrHMGyGSxYPb66zHBbFGSYrdT6kc0sG8TbnNtTUs16FnfP0AW6+XyA0A/eBg86LXEAzycSk+9
	U1+aSzpZcXg
X-Received: by 2002:a05:6a00:4304:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-83f33d0399bmr17632560b3a.20.1779169931435;
        Mon, 18 May 2026 22:52:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:52:11 -0700 (PDT)
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
Subject: [PATCH v2 4/4] drm/verisilicon: add Nuvoton MA35D1 DCU Lite display controller support
Date: Tue, 19 May 2026 13:51:09 +0800
Message-ID: <20260519055114.1886525-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519055114.1886525-1-a0987203069@gmail.com>
References: <20260519055114.1886525-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 SoC integrates a Verisilicon DCU Lite display
controller.  While its register layout is broadly similar to the DC8200,
several differences require dedicated hardware ops:

1. No CONFIG_EX commit path: framebuffer updates use enable (bit 0) and
   reset (bit 4) bits in FB_CONFIG instead of the DC8200 staging registers
   (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
   PANEL_CONFIG_EX).

2. No PANEL_START register: panel output starts when
   PANEL_CONFIG.RUNNING is set; no multi-display sync start register
   is used.

3. Different IRQ registers: DCU Lite uses DISP_IRQ_STA (0x147C) /
   DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
   TOP_IRQ_EN (0x0014).

4. Per-frame commit cycle: DCU Lite requires the VALID bit in FB_CONFIG
   to be set at the start of each atomic commit (crtc_begin) and cleared
   after (crtc_flush).

5. Simpler clock topology: only "core" (bus gate) and "pix0" (pixel
   divider) clocks; no axi or ahb clocks.  Make axi_clk and ahb_clk
   optional (devm_clk_get_optional_enabled) so DCU Lite nodes without
   those clocks are handled gracefully.

Add vs_dcu_lite.c implementing the vs_dc_funcs vtable for the above
differences.  After chip identity detection, vs_dc_probe() now selects
vs_dcu_lite_funcs when the identified model is VSDC_MODEL_DCU_LITE
(model register reads 0, revision 0x5560, customer_id 0x305).

Extend Kconfig to allow building on ARCH_MA35 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Kconfig       |  2 +-
 drivers/gpu/drm/verisilicon/Makefile      |  2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c       |  9 ++-
 drivers/gpu/drm/verisilicon/vs_dc.h       |  1 +
 drivers/gpu/drm/verisilicon/vs_dcu_lite.c | 78 +++++++++++++++++++++++
 5 files changed, 87 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dcu_lite.c

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
diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index f4fbd9f7d6a2..bf88f627e65c 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_dcu_lite.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index c94957024189..77bc63c629f7 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->core_clk);
 	}
 
-	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
+	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
 	if (IS_ERR(dc->axi_clk)) {
 		dev_err(dev, "can't get axi clock\n");
 		return PTR_ERR(dc->axi_clk);
 	}
 
-	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
+	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
 	if (IS_ERR(dc->ahb_clk)) {
 		dev_err(dev, "can't get ahb clock\n");
 		return PTR_ERR(dc->ahb_clk);
@@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device *pdev)
 	dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
 		 dc->identity.revision, dc->identity.customer_id);
 
-	dc->funcs = &vs_dc8200_funcs;
+	if (dc->identity.model == VSDC_MODEL_DC8200)
+		dc->funcs = &vs_dc8200_funcs;
+	else
+		dc->funcs = &vs_dcu_lite_funcs;
 
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index 45172c1a525c..d77d4a1babdf 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -66,5 +66,6 @@ struct vs_dc {
 };
 
 extern const struct vs_dc_funcs vs_dc8200_funcs;
+extern const struct vs_dc_funcs vs_dcu_lite_funcs;
 
 #endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dcu_lite.c b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
new file mode 100644
index 000000000000..11ef57d5ebaa
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
+ */
+
+#include <linux/regmap.h>
+
+#include "vs_crtc_regs.h"
+#include "vs_dc.h"
+#include "vs_primary_plane_regs.h"
+
+static void vs_dcu_lite_bridge_enable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dcu_lite_bridge_disable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dcu_lite_crtc_begin(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dcu_lite_crtc_flush(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dcu_lite_crtc_enable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dcu_lite_crtc_disable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dcu_lite_enable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static void vs_dcu_lite_disable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			  VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static u32 vs_dcu_lite_irq_handler(struct vs_dc *dc)
+{
+	u32 irqs;
+
+	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
+	return irqs;
+}
+
+const struct vs_dc_funcs vs_dcu_lite_funcs = {
+	.bridge_enable		= vs_dcu_lite_bridge_enable,
+	.bridge_disable		= vs_dcu_lite_bridge_disable,
+	.crtc_begin		= vs_dcu_lite_crtc_begin,
+	.crtc_flush		= vs_dcu_lite_crtc_flush,
+	.crtc_enable		= vs_dcu_lite_crtc_enable,
+	.crtc_disable		= vs_dcu_lite_crtc_disable,
+	.enable_vblank		= vs_dcu_lite_enable_vblank,
+	.disable_vblank		= vs_dcu_lite_disable_vblank,
+	.irq_handler		= vs_dcu_lite_irq_handler,
+};
-- 
2.43.0

