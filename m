Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ABE34EF03
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169930; cv=none; b=GEjaXdBc+wlvMEjmRzvNjkXYOktU9ZPCLHMlKnvVT6t5r2W3sLivFIOq7G+UcEI8w2ervjvOzyYRLGWFANc4JFW+Yy1keVJ+iCkvyEUCuX9VTtWqRWKxQH9etJ86z++qZ8ZbfNB+PNXeFy+CXq4OVyYbwOv7HBzFgFLc4YmEjUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169930; c=relaxed/simple;
	bh=m8yYttzAFfJQMYTlya4fdSZy53kmh2NJN1x0Q0YCK9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMKksbum8AdWe7d3wyahedxrUpaLrhm8eaJVMApKOqGbwHWxJtVduI4a4M6IfvQjJpPI0wsgqNCFubfOJH1SlpUVdw7ajN/KQskpXcNAUBH/jOpwA7reuA2EaI7cDrWB7T+hkDaD5UXOaYQ/Jy+wdsjbp+/kmeTrPE9Ud8NXKhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqMc704f; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqMc704f"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-835399c11e0so1366031b3a.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169928; x=1779774728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEmisENzXac0DHZ2ZcRrG+bgkW9GIlfNwVxwtE7zIsY=;
        b=SqMc704fcHXLISZ/48M71UD4eEEErYsS797cILkmemqyh8NRRV9uWs6p+e+l/jnlWm
         F5gIITshaE2GZQ9N5tnp31GFoo88ttTKWOxq+5UMLnL3bCaLHy37NIh9Y0baZlS97wos
         Tqr2e9Hre6Pgj4aoCnna9hiUlBHokLijshEFShOZzrhMS0P+/fSJEVKRbZwftuL+ePpo
         1hnVWy3NcIbmsKm7PqMyYAfebDVrqAndErp5jeukrHC/P7Z9tGf9sGs0cDy9x0mZCYUs
         tU5Zdv2k81OQrO2j/hHw0giyEQ5ScyhxKC3q1nb6HkZ35zcAMDje7Z9mMKo8apMkLdOT
         Qv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169928; x=1779774728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEmisENzXac0DHZ2ZcRrG+bgkW9GIlfNwVxwtE7zIsY=;
        b=DjrSFYaGwE/c0MNhjcDspK/hRRdfgmlTZDV7Zo2D87Aa0Wohi2gDGIhngcMqN+46SC
         79UoTrdyVIwOMIrJF3sJU/KflZD97nXtciQMl8wwUa6Qn5+h4l2GHRuINgFSPDpRkPdY
         P+ww72/QngUkZ6cAUZwvkmkGcPdYHwJ2ZxMSMHX1nIHXCbli/ZUDFflc58QyLV/l6fDe
         bEPdqNe9tkaa2ciqRO1T0AIsCVaiXulhqbWxvLkwCUIGADczT7PvXWH4YHiVMLmJJEgY
         ASdH/cvSVx5g5tL0mDrR0YQY5y8Evajs3Cy9z+P1R3vZ73i/t05CVc1FyE57VN05asC2
         p5vg==
X-Forwarded-Encrypted: i=1; AFNElJ/aIDlk3B8i9RFvXQyw5Ya/EgrxXAzxqTIeSsF36yyGrrhWe4KL+B5r4vLiYouWD76ZSLZP/g3PtMtZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxgWM4mp8SqyHl1kx3w1ymoLx1QM8AR5M6mgxPt6jvFGk7r73TQ
	oc747WuqokNTXQRsszp1CmvzHpeB1xTwXI9D1xa23coEhuUY1fPqyhwe
X-Gm-Gg: Acq92OHgNhPmnkbrcElFWZaVwyOMbFNLrbjtNY0PgzL3O7Mb7wrdpHNn/rJds/15jAV
	mwTS+OdTX3H2HzzbcEOXoTo55RsJv7FgPgGFSdd+t+4EvVf55ldOPBd2aufUArRmd6gHkBCotC9
	M6PEQ9nTqx2QWvsSUOLPCmWU0mg6iauHXcR1jihe4y2NqhkJhhlLTXolfnOP0t8KGnu5/6KhVkT
	hnmN26n6zEgg72FY2we3/O2cWA0ImVpIGnZ90lqdc+qOLjsg0VrOKkn+opC78IgEpiQsQmNTrBA
	D3DHaZHSxfDk5nxUoL5S0uuBfIJHXDzBA9kxGL/5VHiSUuaEfFeFCb9fHOUXhZxCh3vl871CVpJ
	VXW4pUs/ITg+vSCtKW6bBN/3uqjGXfbv47SWrur+OLUQ9upaM/hFDk32XM61qTQdkIFZ/EEVpOX
	zU8doa7oe8IpH9b2LSBJugd5LvbELB59auxRshP2uTpl8kyxXxgE3oWr0oPmhip660HPa6hpst1
	J7yk2FH5qKf
X-Received: by 2002:a05:6a00:3921:b0:83c:de0e:bac5 with SMTP id d2e1a72fcca58-83f33f3d3c7mr17473259b3a.49.1779169928330;
        Mon, 18 May 2026 22:52:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:52:07 -0700 (PDT)
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
Subject: [PATCH v2 3/4] drm/verisilicon: introduce per-variant hardware ops table
Date: Tue, 19 May 2026 13:51:08 +0800
Message-ID: <20260519055114.1886525-4-a0987203069@gmail.com>
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

The DC driver directly calls DC8200-specific register sequences from
vs_bridge.c, vs_crtc.c and vs_primary_plane.c.  Supporting a second IP
variant with a different register layout would require scattering
if/else branches throughout those files.

Instead, introduce struct vs_dc_funcs, a small vtable of function
pointers covering every hardware-specific operation:

  bridge_enable/disable     - panel output start/stop sequence
  crtc_begin/flush          - per-frame commit begin/end hooks
  crtc_enable/disable       - display output power on/off
  enable_vblank/disable_vblank - IRQ mask for vsync events
  plane_enable_ex/disable_ex - framebuffer enable/disable
  plane_update_ex           - variant-specific plane update registers
  irq_handler               - read and acknowledge pending IRQs

Extract all DC8200-specific register operations from vs_bridge.c,
vs_crtc.c, vs_primary_plane.c and vs_dc.c into a new vs_dc8200.c
source file that implements the full vs_dc_funcs vtable and exposes
vs_dc8200_funcs.

Add atomic_begin and atomic_flush hooks in vs_crtc.c to dispatch to
crtc_begin/crtc_flush; these are optional (NULL-checked) so that
variants without a per-frame commit cycle can leave them unimplemented.

After vs_fill_chip_identity() confirms a DC8200 (or compatible)
identity, vs_dc_probe() assigns dc->funcs = &vs_dc8200_funcs so all
callers automatically dispatch to the correct implementation.

No functional change for DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +---
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 ++++++-
 drivers/gpu/drm/verisilicon/vs_dc.c           |   6 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  32 ++++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 107 ++++++++++++++++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +-----
 7 files changed, 186 insertions(+), 51 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index fd8d805fbcde..f4fbd9f7d6a2 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index 7a93049368db..6a9af10c64e6 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.c
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
@@ -162,15 +162,8 @@ static void vs_bridge_enable_common(struct vs_crtc *crtc,
 			VSDC_DISP_PANEL_CONFIG_DE_EN |
 			VSDC_DISP_PANEL_CONFIG_DAT_EN |
 			VSDC_DISP_PANEL_CONFIG_CLK_EN);
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
-			VSDC_DISP_PANEL_CONFIG_RUNNING);
-	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
-			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
-			VSDC_DISP_PANEL_START_RUNNING(output));
-
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
-			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+
+	dc->funcs->bridge_enable(dc, output);
 }
 
 static void vs_bridge_atomic_enable_dpi(struct drm_bridge *bridge,
@@ -228,14 +221,7 @@ static void vs_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct vs_dc *dc = crtc->dc;
 	unsigned int output = crtc->id;
 
-	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
-			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
-			  VSDC_DISP_PANEL_START_RUNNING(output));
-	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
-			  VSDC_DISP_PANEL_CONFIG_RUNNING);
-
-	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
-			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+	dc->funcs->bridge_disable(dc, output);
 }
 
 static const struct drm_bridge_funcs vs_dpi_bridge_funcs = {
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
index 9080344398ca..a87caa6f73ba 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc.c
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
@@ -16,10 +16,33 @@
 #include "vs_crtc_regs.h"
 #include "vs_crtc.h"
 #include "vs_dc.h"
-#include "vs_dc_top_regs.h"
 #include "vs_drm.h"
 #include "vs_plane.h"
 
+static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
+				  struct drm_atomic_commit *state)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+	unsigned int output = vcrtc->id;
+
+	if (dc->funcs->crtc_begin)
+		dc->funcs->crtc_begin(dc, output);
+}
+
+static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
+				  struct drm_atomic_commit *state)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+	unsigned int output = vcrtc->id;
+
+	if (dc->funcs->crtc_flush)
+		dc->funcs->crtc_flush(dc, output);
+
+	drm_crtc_vblank_atomic_flush(crtc, state);
+}
+
 static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
 				   struct drm_atomic_commit *state)
 {
@@ -30,6 +53,9 @@ static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_off(crtc);
 
 	clk_disable_unprepare(dc->pix_clk[output]);
+
+	if (dc->funcs->crtc_disable)
+		dc->funcs->crtc_disable(dc, output);
 }
 
 static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -42,6 +68,9 @@ static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
 	drm_WARN_ON(&dc->drm_dev->base,
 		    clk_prepare_enable(dc->pix_clk[output]));
 
+	if (dc->funcs->crtc_enable)
+		dc->funcs->crtc_enable(dc, output);
+
 	drm_crtc_vblank_on(crtc);
 }
 
@@ -119,7 +148,8 @@ static bool vs_crtc_mode_fixup(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
-	.atomic_flush	= drm_crtc_vblank_atomic_flush,
+	.atomic_begin	= vs_crtc_atomic_begin,
+	.atomic_flush	= vs_crtc_atomic_flush,
 	.atomic_enable	= vs_crtc_atomic_enable,
 	.atomic_disable	= vs_crtc_atomic_disable,
 	.mode_set_nofb	= vs_crtc_mode_set_nofb,
@@ -132,7 +162,7 @@ static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN, VSDC_TOP_IRQ_VSYNC(vcrtc->id));
+	dc->funcs->enable_vblank(dc, vcrtc->id);
 
 	return 0;
 }
@@ -142,7 +172,7 @@ static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN, VSDC_TOP_IRQ_VSYNC(vcrtc->id));
+	dc->funcs->disable_vblank(dc, vcrtc->id);
 }
 
 static const struct drm_crtc_funcs vs_crtc_funcs = {
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index dad9967bc10b..c94957024189 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -8,9 +8,7 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 
-#include "vs_crtc.h"
 #include "vs_dc.h"
-#include "vs_dc_top_regs.h"
 #include "vs_drm.h"
 #include "vs_hwdb.h"
 
@@ -33,7 +31,7 @@ static irqreturn_t vs_dc_irq_handler(int irq, void *private)
 	struct vs_dc *dc = private;
 	u32 irqs;
 
-	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
+	irqs = dc->funcs->irq_handler(dc);
 
 	vs_drm_handle_irq(dc, irqs);
 
@@ -136,6 +134,8 @@ static int vs_dc_probe(struct platform_device *pdev)
 	dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
 		 dc->identity.revision, dc->identity.customer_id);
 
+	dc->funcs = &vs_dc8200_funcs;
+
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
 		ret = -EINVAL;
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index ed1016f18758..45172c1a525c 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -14,6 +14,7 @@
 #include <linux/reset.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_plane.h>
 
 #include "vs_hwdb.h"
 
@@ -22,6 +23,34 @@
 
 struct vs_drm_dev;
 struct vs_crtc;
+struct vs_dc;
+
+struct vs_dc_funcs {
+	/* Bridge: atomic_enable, atomic_disable */
+	void (*bridge_enable)(struct vs_dc *dc, unsigned int output);
+	void (*bridge_disable)(struct vs_dc *dc, unsigned int output);
+
+	/* CRTC: atomic_begin, atomic_flush */
+	void (*crtc_begin)(struct vs_dc *dc, unsigned int output);
+	void (*crtc_flush)(struct vs_dc *dc, unsigned int output);
+
+	/* CRTC: atomic_enable, atomic_disable */
+	void (*crtc_enable)(struct vs_dc *dc, unsigned int output);
+	void (*crtc_disable)(struct vs_dc *dc, unsigned int output);
+
+	/* CRTC: enable_vblank, disable_vblank */
+	void (*enable_vblank)(struct vs_dc *dc, unsigned int output);
+	void (*disable_vblank)(struct vs_dc *dc, unsigned int output);
+
+	/* Primary plane: atomic_enable, atomic_disable, atomic_update */
+	void (*plane_enable_ex)(struct vs_dc *dc, unsigned int output);
+	void (*plane_disable_ex)(struct vs_dc *dc, unsigned int output);
+	void (*plane_update_ex)(struct vs_dc *dc, unsigned int output,
+				struct drm_plane_state *state);
+
+	/* IRQ handler */
+	u32 (*irq_handler)(struct vs_dc *dc);
+};
 
 struct vs_dc {
 	struct regmap *regs;
@@ -33,6 +62,9 @@ struct vs_dc {
 
 	struct vs_drm_dev *drm_dev;
 	struct vs_chip_identity identity;
+	const struct vs_dc_funcs *funcs;
 };
 
+extern const struct vs_dc_funcs vs_dc8200_funcs;
+
 #endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c b/drivers/gpu/drm/verisilicon/vs_dc8200.c
new file mode 100644
index 000000000000..db9e1b3cd903
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/regmap.h>
+
+#include "vs_bridge_regs.h"
+#include "vs_dc.h"
+#include "vs_dc_top_regs.h"
+#include "vs_plane.h"
+#include "vs_primary_plane_regs.h"
+
+static void vs_dc8200_bridge_enable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			VSDC_DISP_PANEL_CONFIG_RUNNING);
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
+			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
+			VSDC_DISP_PANEL_START_RUNNING(output));
+
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(output),
+			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+}
+
+static void vs_dc8200_bridge_disable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			  VSDC_DISP_PANEL_CONFIG_RUNNING);
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
+			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
+			  VSDC_DISP_PANEL_START_RUNNING(output));
+
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(output),
+			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+}
+
+static void vs_dc8200_enable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
+			VSDC_TOP_IRQ_VSYNC(output));
+}
+
+static void vs_dc8200_disable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
+			  VSDC_TOP_IRQ_VSYNC(output));
+}
+
+static void vs_dc8200_plane_commit(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			VSDC_FB_CONFIG_EX_COMMIT);
+}
+
+static void vs_dc8200_plane_enable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			VSDC_FB_CONFIG_EX_FB_EN);
+	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
+			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
+
+	vs_dc8200_plane_commit(dc, output);
+}
+
+static void vs_dc8200_plane_disable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			VSDC_FB_CONFIG_EX_FB_EN);
+
+	vs_dc8200_plane_commit(dc, output);
+}
+
+static void vs_dc8200_plane_update_ex(struct vs_dc *dc, unsigned int output,
+				       struct drm_plane_state *state)
+{
+	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
+		     VSDC_MAKE_PLANE_POS(state->crtc_x, state->crtc_y));
+	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
+		     VSDC_MAKE_PLANE_POS(state->crtc_x + state->crtc_w,
+					 state->crtc_y + state->crtc_h));
+	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
+		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
+
+	vs_dc8200_plane_commit(dc, output);
+}
+
+static u32 vs_dc8200_irq_handler(struct vs_dc *dc)
+{
+	u32 irqs;
+
+	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
+	return irqs;
+}
+
+const struct vs_dc_funcs vs_dc8200_funcs = {
+	.bridge_enable		= vs_dc8200_bridge_enable,
+	.bridge_disable		= vs_dc8200_bridge_disable,
+	.enable_vblank		= vs_dc8200_enable_vblank,
+	.disable_vblank		= vs_dc8200_disable_vblank,
+	.plane_enable_ex	= vs_dc8200_plane_enable_ex,
+	.plane_disable_ex	= vs_dc8200_plane_disable_ex,
+	.plane_update_ex	= vs_dc8200_plane_update_ex,
+	.irq_handler		= vs_dc8200_irq_handler,
+};
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 1f2be41ae496..75bc36a078f7 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -53,12 +53,6 @@ static int vs_primary_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
-static void vs_primary_plane_commit(struct vs_dc *dc, unsigned int output)
-{
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_COMMIT);
-}
-
 static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
 					   struct drm_atomic_commit *atomic_state)
 {
@@ -69,13 +63,8 @@ static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
-	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
-			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
-
-	vs_primary_plane_commit(dc, output);
+	if (dc->funcs->plane_enable_ex)
+		dc->funcs->plane_enable_ex(dc, output);
 }
 
 static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
@@ -88,10 +77,8 @@ static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
-
-	vs_primary_plane_commit(dc, output);
+	if (dc->funcs->plane_disable_ex)
+		dc->funcs->plane_disable_ex(dc, output);
 }
 
 static void vs_primary_plane_atomic_update(struct drm_plane *plane,
@@ -133,18 +120,11 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
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
-
-	vs_primary_plane_commit(dc, output);
+	if (dc->funcs->plane_update_ex)
+		dc->funcs->plane_update_ex(dc, output, state);
 }
 
 static const struct drm_plane_helper_funcs vs_primary_plane_helper_funcs = {
-- 
2.43.0

