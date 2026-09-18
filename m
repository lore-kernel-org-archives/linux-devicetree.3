Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931703DD87F
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700513; cv=none; b=TeqXd9MdVXfwx0PmkDwcmElcl+f9Fc7OIf0QTgBR8GKkVHzXQMPuxmerzIfJ9xDO32WUKisTe3Yp3/GvCOEAH1JF/k8ZO2QMlxQGyaM28tELnRs8cr7Vud/Y7iglVeTDK0lzCgW40qVreMmXjATBJzu/PimUaEtNFkkriAXODuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700513; c=relaxed/simple;
	bh=J/dUq0ZxwAILz+QfgSgSdKH0LgoUZTnLIXqcMTlvon8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llb3mHj8n1s5Cf9w/7EPREiovkvMwDyZgIgHYkhDCb04AHjFFwrOM4jk8pgICdPMuT72bRxJ2FLxoaecxN0UViUbxNoR1Cemw2z91DiwR6LA3t3Gi+RZHAycj+346R+5EGvuBktd4Dvo1vAfN1CBxBrXaLVLXZedBfJyq/qykjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Di7epC1x; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Di7epC1x"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so195367a91.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700505; x=1790305305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmYsInXqGxHOa3AXxpWGJMylYYFqoNEUetbo5r6zMXk=;
        b=Di7epC1xZcwhT/C5WMvUhR/n2JI4qTzn/AgLNFsiQEEE/muLkXawDUOLi7yHIEQeZB
         pBCvv35iVI7F/4uNDW7GBN1OyMPX+UUpBE3kXrubqMO9HzcWsZn48eCGG07FXOM5+jCI
         DaR4utpLR3gqd5uDU0kVTHdHpDOPcJ7HgL8hUPzG2lQJc7mACbkI4D8OQmTmvXCMxlg2
         ERnHDA4BOgkRJZ6DmkllPH1U82IpkfWwm4xXGpIXrBPUri9OJaYAXMGi01D27V+7JwQA
         bm+wjuk9b+A42IwxIba+1DSL9pSC6oIgpDmahUKvT4pQTi77d61hPHRTTYHvw97kHFcU
         KFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700505; x=1790305305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmYsInXqGxHOa3AXxpWGJMylYYFqoNEUetbo5r6zMXk=;
        b=NU/a4SoC10Yn9OqBfWtab8BMNs6fmR5Z2LmlSJNCtL0ViyFijm/UjW+uYLR+Q1W8tt
         nxQIw1+IcnCK0F9xGF/+wPJXrJdM0utwvXyq87QwCNeNIS21cva2tWu9ZkVZyyHn+D1C
         fhiD4MgqczKEqHAJrez1KIkD+Jfb8G5nB7Ng2M6M4DQy/Hl9llW/b3G98R+eJyo6TrYB
         IWAizya3do1TY4Pt4FzlRNhWQ+Psn5eUF7tSDnGGfzfpa271/0dPaX38VvYrKRTazRV5
         oEHkOyoNZieHl2dKbhk5BMpy5fgWnyZqzsvN2Kh39vNESuqEzYU4H0E7okSJb0RrMB5k
         NxEg==
X-Forwarded-Encrypted: i=1; AKwUvByqzCBmY+8uacDyI98hSwzNte230DpHIz4p+eQJ6zIZC38nM2cm09S0cGLpPLUyfyRqB1wNKYS74txt@vger.kernel.org
X-Gm-Message-State: AFuF++lt7c9Rpnu/xwm/TfGMLk1pe4vfFw+RnM5HZOru1c7uw8g5DrFb
	vjelD3PKEdy/yaYQ6P2htC8yFs8moK6n/3hikWrI9SKxS+sYyqq5U7Hc
X-Gm-Gg: AYBFou1Mt5TdXXrlqVPcff7lKTYxWEZF0xFWcjif2Kypwt9eih7h2syiJen9phof2uX
	tu0qJO3jfKEfxBTbAJEAH0ANsXX5udwDvrI+iilhoVTEIERxW0Z34Xy/7KpcL6oKTGaRHWx36Ih
	MLjXxNdzqQkXkN6DsRyup5R/hkZ8bKK0QNjh12wFNCSC77FRaGwCBhr+khgGupPVC5rqrgu6TNU
	87spDZrAuypzy94WgCGbYu4GYet+neqx48kCzZR2GQB9HlumVkLd+wVkWie95oKygAt7Y3ZDcOF
	9kgTaYk67F6kBZG+grnB/ziAcAxDItODjZwuPlks8optemkP96jFoj/0DuO8mSl3PCUm7veeB7I
	pFTY7vD7i2/FFDe3reTnOzSc1ShKmoGazkAfsA53zbpaB7cFbK5+jqbV9C325w8gGdTnZOJphde
	+JHlTgPGKmwRYUXmh4So9Y5b4HEOyPqFwiZzXZvGQrU2NBfrRCIH8G9X3S7N2AKOd5ayh0kA78S
	bTyMZwBtC1bRw0kvu5H9kYIwfEuOHB2I+1I4uBHhvP/mX0Z081GKRF3xNLhTYo=
X-Received: by 2002:a17:90b:56c5:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39e549787b4mr2933774a91.0.1789700504690;
        Thu, 17 Sep 2026 20:01:44 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:44 -0700 (PDT)
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
Subject: [PATCH v7 3/7] drm/verisilicon: introduce per-variant hardware ops table
Date: Fri, 18 Sep 2026 11:01:21 +0800
Message-ID: <20260918030125.315978-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DC8200 and DCUltraLite share a broadly similar register layout but
differ in how the bridge, CRTC, primary plane and IRQ paths are driven.
Introduce a vs_dc_funcs vtable so each variant can supply its own
implementation without scattering conditionals across multiple files.

Add a generation field to struct vs_chip_identity to distinguish variants.
Extract the DC8200-specific hardware ops into vs_dc8200.c and add unified
IRQ bit definitions so implementations can translate hardware-specific
bits to a common set.  Update the shared code to dispatch through
dc->funcs.

No behaviour change for existing DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 +++++-
 drivers/gpu/drm/verisilicon/vs_dc.c           |   6 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  32 +++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 121 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_drm.c          |   5 +-
 drivers/gpu/drm/verisilicon/vs_drm.h          |   8 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |   4 +
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
 11 files changed, 220 insertions(+), 54 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 426f4bcaa834d..9d4cd16452fa1 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o vs_hwdb.o \
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o \
 	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index dc7c85b07fe32..3fbc8d57f8a1e 100644
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
+	dc->funcs->panel_enable_ex(dc, output);
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
+	dc->funcs->panel_disable_ex(dc, output);
 }
 
 static const struct drm_bridge_funcs vs_dpi_bridge_funcs = {
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
index c24c1588cbe69..6033662dd9221 100644
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
+				 struct drm_atomic_commit *state)
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
+				 struct drm_atomic_commit *state)
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
+	if (dc->funcs->crtc_disable_ex)
+		dc->funcs->crtc_disable_ex(dc, output);
 }
 
 static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -42,6 +68,9 @@ static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
 	drm_WARN_ON(&dc->drm_dev->base,
 		    clk_prepare_enable(dc->pix_clk[output]));
 
+	if (dc->funcs->crtc_enable_ex)
+		dc->funcs->crtc_enable_ex(dc, output);
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
index dad9967bc10b8..9729b693d360e 100644
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
+	irqs = dc->funcs->irq_ack(dc);
 
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
index ed1016f18758e..825f5dd6bf174 100644
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
+	void (*panel_enable_ex)(struct vs_dc *dc, unsigned int output);
+	void (*panel_disable_ex)(struct vs_dc *dc, unsigned int output);
+
+	/* CRTC: atomic_begin, atomic_flush */
+	void (*crtc_begin)(struct vs_dc *dc, unsigned int output);
+	void (*crtc_flush)(struct vs_dc *dc, unsigned int output);
+
+	/* CRTC: atomic_enable, atomic_disable */
+	void (*crtc_enable_ex)(struct vs_dc *dc, unsigned int output);
+	void (*crtc_disable_ex)(struct vs_dc *dc, unsigned int output);
+
+	/* CRTC: enable_vblank, disable_vblank */
+	void (*enable_vblank)(struct vs_dc *dc, unsigned int output);
+	void (*disable_vblank)(struct vs_dc *dc, unsigned int output);
+
+	/* Primary plane: atomic_enable, atomic_disable, atomic_update */
+	void (*primary_plane_enable_ex)(struct vs_dc *dc, unsigned int output);
+	void (*primary_plane_disable_ex)(struct vs_dc *dc, unsigned int output);
+	void (*primary_plane_update_ex)(struct vs_dc *dc, unsigned int output,
+					struct drm_plane_state *state);
+
+	/* IRQ acknowledge */
+	u32 (*irq_ack)(struct vs_dc *dc);
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
index 0000000000000..f72da10295e1b
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/regmap.h>
+
+#include <drm/drm_print.h>
+
+#include "vs_bridge_regs.h"
+#include "vs_dc.h"
+#include "vs_dc_top_regs.h"
+#include "vs_drm.h"
+#include "vs_plane.h"
+#include "vs_primary_plane_regs.h"
+
+static void vs_dc8200_panel_enable_ex(struct vs_dc *dc, unsigned int output)
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
+static void vs_dc8200_panel_disable_ex(struct vs_dc *dc, unsigned int output)
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
+static void vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc, unsigned int output)
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
+static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			VSDC_FB_CONFIG_EX_FB_EN);
+
+	vs_dc8200_plane_commit(dc, output);
+}
+
+static void vs_dc8200_primary_plane_update_ex(struct vs_dc *dc, unsigned int output,
+					      struct drm_plane_state *state)
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
+static u32 vs_dc8200_irq_ack(struct vs_dc *dc)
+{
+	u32 hw_irqs, unified = 0, known = 0;
+	unsigned int i;
+
+	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &hw_irqs);
+
+	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
+		known |= VSDC_TOP_IRQ_VSYNC(i);
+		if (hw_irqs & VSDC_TOP_IRQ_VSYNC(i))
+			unified |= VSDC_IRQ_VSYNC(i);
+	}
+
+	drm_WARN_ONCE(&dc->drm_dev->base, hw_irqs & ~known,
+		      "Unknown hardware IRQ bits: %#x\n", hw_irqs & ~known);
+
+	return unified;
+}
+
+const struct vs_dc_funcs vs_dc8200_funcs = {
+	.panel_enable_ex		= vs_dc8200_panel_enable_ex,
+	.panel_disable_ex		= vs_dc8200_panel_disable_ex,
+	.enable_vblank			= vs_dc8200_enable_vblank,
+	.disable_vblank			= vs_dc8200_disable_vblank,
+	.primary_plane_enable_ex	= vs_dc8200_primary_plane_enable_ex,
+	.primary_plane_disable_ex	= vs_dc8200_primary_plane_disable_ex,
+	.primary_plane_update_ex	= vs_dc8200_primary_plane_update_ex,
+	.irq_ack			= vs_dc8200_irq_ack,
+};
diff --git a/drivers/gpu/drm/verisilicon/vs_drm.c b/drivers/gpu/drm/verisilicon/vs_drm.c
index fd259d53f49f1..24e9d0b008f31 100644
--- a/drivers/gpu/drm/verisilicon/vs_drm.c
+++ b/drivers/gpu/drm/verisilicon/vs_drm.c
@@ -25,7 +25,6 @@
 #include "vs_bridge.h"
 #include "vs_crtc.h"
 #include "vs_dc.h"
-#include "vs_dc_top_regs.h"
 #include "vs_drm.h"
 
 #define DRIVER_NAME	"verisilicon"
@@ -168,8 +167,8 @@ void vs_drm_handle_irq(struct vs_dc *dc, u32 irqs)
 	unsigned int i;
 
 	for (i = 0; i < dc->identity.display_count; i++) {
-		if (irqs & VSDC_TOP_IRQ_VSYNC(i)) {
-			irqs &= ~VSDC_TOP_IRQ_VSYNC(i);
+		if (irqs & VSDC_IRQ_VSYNC(i)) {
+			irqs &= ~VSDC_IRQ_VSYNC(i);
 			if (dc->drm_dev->crtcs[i])
 				drm_crtc_handle_vblank(&dc->drm_dev->crtcs[i]->base);
 		}
diff --git a/drivers/gpu/drm/verisilicon/vs_drm.h b/drivers/gpu/drm/verisilicon/vs_drm.h
index 606338206a427..6a89c20879df7 100644
--- a/drivers/gpu/drm/verisilicon/vs_drm.h
+++ b/drivers/gpu/drm/verisilicon/vs_drm.h
@@ -6,6 +6,7 @@
 #ifndef _VS_DRM_H_
 #define _VS_DRM_H_
 
+#include <linux/bits.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
@@ -13,6 +14,13 @@
 
 struct vs_dc;
 
+/*
+ * DC variants use different interrupt registers with diverging bit
+ * assignments; each irq_ack() implementation must translate its
+ * hardware-specific bits into these definitions.
+ */
+#define VSDC_IRQ_VSYNC(n)	BIT(n)
+
 struct vs_drm_dev {
 	struct drm_device base;
 
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 2a0f7c59afa3a..91524d16f7785 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -94,6 +94,7 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.revision = 0x5720,
 		.customer_id = ~0U,
 
+		.generation = VSDC_GEN_DC8200,
 		.display_count = 2,
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
@@ -103,6 +104,7 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.revision = 0x5721,
 		.customer_id = 0x30B,
 
+		.generation = VSDC_GEN_DC8200,
 		.display_count = 2,
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
@@ -112,6 +114,7 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.revision = 0x5720,
 		.customer_id = 0x310,
 
+		.generation = VSDC_GEN_DC8200,
 		.display_count = 2,
 		.max_cursor_size = 64,
 		.formats = &vs_formats_with_yuv444,
@@ -121,6 +124,7 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.revision = 0x5720,
 		.customer_id = 0x311,
 
+		.generation = VSDC_GEN_DC8200,
 		.display_count = 2,
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h b/drivers/gpu/drm/verisilicon/vs_hwdb.h
index 2065ecb730437..a15c8b5656044 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
@@ -9,6 +9,11 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+enum vs_dc_generation {
+	VSDC_GEN_DC8000,
+	VSDC_GEN_DC8200,
+};
+
 struct vs_formats {
 	const u32 *array;
 	unsigned int num;
@@ -19,6 +24,7 @@ struct vs_chip_identity {
 	u32 revision;
 	u32 customer_id;
 
+	enum vs_dc_generation generation;
 	u32 display_count;
 	/*
 	 * The hardware only supports square cursor planes, so this field
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 20a820f1ef302..0d7c6f424079b 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -54,12 +54,6 @@ static int vs_primary_plane_atomic_check(struct drm_plane *plane,
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
@@ -70,13 +64,8 @@ static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
-	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
-			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
-
-	vs_primary_plane_commit(dc, output);
+	if (dc->funcs->primary_plane_enable_ex)
+		dc->funcs->primary_plane_enable_ex(dc, output);
 }
 
 static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
@@ -89,10 +78,8 @@ static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
-
-	vs_primary_plane_commit(dc, output);
+	if (dc->funcs->primary_plane_disable_ex)
+		dc->funcs->primary_plane_disable_ex(dc, output);
 }
 
 static void vs_primary_plane_atomic_update(struct drm_plane *plane,
@@ -138,18 +125,11 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
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
+	if (dc->funcs->primary_plane_update_ex)
+		dc->funcs->primary_plane_update_ex(dc, output, state);
 }
 
 static const struct drm_plane_helper_funcs vs_primary_plane_helper_funcs = {
-- 
2.43.0

