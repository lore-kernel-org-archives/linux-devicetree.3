Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F83AE6F7
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380710; cv=none; b=svwcQVNtM2Jw8CXb2jNZjZ7Ye2OvV1QyhUBGjaaGzFneo0P1Z+J2I8QndSbo77Kz+cNVGIBq71Stm0D/pbGt+aEtEKZOvy7CnyTnPubgNZFd9/G60fJoZyHAooWDCn99DT5BToTZat09bNXU4jNH45vSDaQYsugJp2dvV5hjZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380710; c=relaxed/simple;
	bh=qjFa/LPIVleRPvg3Jongs9c8fmOKWbazZq7noNxUzsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eprDWbrkwXkKv5wbU+J9YV9G+Z4o+Wb5hJ5IZ9UTHrijF2EG+FEpOUpy1tL3ZdOx3PCbToqhu0hcOlMZjOUONItGis4vJgx5BhrE8w1cevw/faVf8/8G6sZACS3iIcIT0B2RU4YzMAlwV9pgqHVhjsPPSDq9Pm7XK6tW4Sm5XHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWirR1oT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWirR1oT"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37de8c6a2b6so1025280a91.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380708; x=1782985508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siWxlr4TspbmCfys6FQFpaeZVhp+dwUJ+/qi5Sfewo8=;
        b=qWirR1oTY2nVjhBut5AVL8UuFlBhNHNbFB9LyoE8fph9D5++8zfBepTDVp0gKUySLV
         dbuLCgr5jXG3z+dA6xF7gBE8Jk1UV9VOaU6HZ0Y/sLHuP4lKZX6KgHzXjLN/zhk5rIdy
         lXeXX8h5Fex0DMoMJaP5elFoj5cim/qo1Azyz7LU2dBsHx4zIF+iAj+Dq1FbDkaDttDi
         +UxkDDzP9UOjxnxWUpTb7DghwO86LBLu5t6i/pY5CTpOcMx3136lChgs9Y4MLaMPpWr8
         Y1xLG9IXs6OaurEL8xAzQMpw/zBN1sfMsDlAuhQi8d5vEQKC4wH41f1tT/xQr+M94m08
         umjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380708; x=1782985508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=siWxlr4TspbmCfys6FQFpaeZVhp+dwUJ+/qi5Sfewo8=;
        b=XgGd/3eWLjhfjQ8dOOu/bSR4LJrY3JNyXk52kixL9AUbNmhisivFeTwvj1VHaoFBub
         9NrZ9zbTK0Rv03zPeZdptDuaERzlpNrvb3pIGBfGXyrr50xl31FyNlHroFNZ2vYIN5gK
         HBU4IaTxqoxOPqRWsnxS9JmsBfS3v/9qte4apSfKc+mmekodrb7xhZJlVpS/Ue38PLUy
         kfb++PyV/bz+DTbhI2vgdWT1GSMzp61BgiICNvwtIdLkuYeTybVk9IvyQqvICRubfzSe
         QDfbLoB8SXxB09IHUDegR5+YJnZkKzBZwpCFjoUx1je0RXMkeahLGh+5fDEHx3KTuLNx
         B62g==
X-Forwarded-Encrypted: i=1; AHgh+RroXYiMHNFtTse+fp6J0Ior1UZY3K9F1QJD78kiAqG8d9Ee6h7c6gddGlPWlnzt65xEK55QwkItFNsH@vger.kernel.org
X-Gm-Message-State: AOJu0YweAbUJ+966PAN0y+uPCqc2OQNC2RXH3TyNn5iwOfVJEcG/27u/
	0sXn1JPCRHBJvnkPKOmmv8Oqx6o8T3u+MqGHoVoAx7PN79wpHezgHPdh
X-Gm-Gg: AfdE7cmRVLcu81QQzv82VHXzHBVtjjko7B8HiGH74Rl2cJkXxabcbaYbBp+q9jXLWsH
	uCl+Elk+1jnJp6utyIfyNBGBXuGu3NJ2a4TLGwC2EXZLNZ2Ts++Oi97MA+GIkM+BVtVu9W2jKda
	j8CVrhcfF3hGF6sMLzWu4gVsvIBainsac2lh1FQFCEG8T9EuCsWZyVbBVTgwmSwywUxGx5QNK08
	PCwx+cXY45JOCFoqwt/mikZDUiDK1WvKJ4WxLRwKvGM2v2czrKFBVQVuyF3pnkcYYkr9BckQjUS
	pVCHas5yqcC6QCto5ra7PWrA+7sURtzIa9ylpRNkHw/dEdiXCrfbkO+AlNCDubdU3zUrZ4rWb2G
	ks5vcuNSEJPdWFnO4icO0QxKPJA2TxpfNypEy3+AK9cQ9i3YKHnOBDTy3g8baiDeIu0Qfeui8gL
	GOlY6oQvpLBrRptfw/BwAUMKnVtgr2ra4g+Q4Ton+45b9Toy7pnO9PfEvGOkMX+bRhyFCEmxCrP
	w==
X-Received: by 2002:a17:903:4b08:b0:2c0:d8ee:7d66 with SMTP id d9443c01a7336-2c7fc8a2ad8mr21327625ad.36.1782380707784;
        Thu, 25 Jun 2026 02:45:07 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:07 -0700 (PDT)
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
Subject: [PATCH v5 3/7] drm/verisilicon: introduce per-variant hardware ops table
Date: Thu, 25 Jun 2026 17:44:45 +0800
Message-ID: <20260625094449.708386-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
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
---
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 +++++-
 drivers/gpu/drm/verisilicon/vs_dc.c           |   6 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  32 +++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 115 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_drm.c          |   5 +-
 drivers/gpu/drm/verisilicon/vs_drm.h          |   8 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |   4 +
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
 11 files changed, 214 insertions(+), 54 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 426f4bcaa834..9d4cd16452fa 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o vs_hwdb.o \
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o \
 	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index dc7c85b07fe3..3fbc8d57f8a1 100644
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
index 0b8a35d09cd2..1c4aac708669 100644
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
index dad9967bc10b..9729b693d360 100644
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
index ed1016f18758..825f5dd6bf17 100644
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
index 000000000000..17378f4ef96d
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
@@ -0,0 +1,115 @@
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
+static u32 vs_dc8200_irq_ack(struct vs_dc *dc)
+{
+	u32 hw_irqs, unified = 0;
+	unsigned int i;
+
+	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &hw_irqs);
+
+	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
+		if (hw_irqs & VSDC_TOP_IRQ_VSYNC(i))
+			unified |= VSDC_IRQ_VSYNC(i);
+	}
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
index fd259d53f49f..24e9d0b008f3 100644
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
index 606338206a42..6a89c20879df 100644
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
index 2a0f7c59afa3..91524d16f778 100644
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
index 2065ecb73043..a15c8b565604 100644
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
index 1f2be41ae496..f992cb277f61 100644
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
+	if (dc->funcs->primary_plane_enable_ex)
+		dc->funcs->primary_plane_enable_ex(dc, output);
 }
 
 static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
@@ -88,10 +77,8 @@ static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
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
+	if (dc->funcs->primary_plane_update_ex)
+		dc->funcs->primary_plane_update_ex(dc, output, state);
 }
 
 static const struct drm_plane_helper_funcs vs_primary_plane_helper_funcs = {
-- 
2.43.0

