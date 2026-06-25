Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB23ADBA3
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380717; cv=none; b=SIxXQ0KpXCq1lGAr0Aeg9y1NxWsNbL22FO0RO49/ZnTR2plkK8ih3J2bFgH2YV6iHwhhNcK5yzLay45gBO0dbkzzh4gtXmumOTTic+G8lrmRpcVhU7jGJD6WEzjntjXwJEMoyBIkyq8siMtBu0dupTVP95/uNnoFosfXnbmnIag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380717; c=relaxed/simple;
	bh=s4wLeptzb/gqUw60sro474qlycEB5M9y34Vwjr2u+UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gP30JE+wkygyFBr/ajBZWRbYYYStjd0wakmeqNXHBrwrABLt9CmzSWp1/xg5VwJOC6HtGTq9EChtL/XcP3DbVhTZH/Gj3LnrEacRb/PbBxcIX+6mOY0A0+zEgkiDxJ16Xy++cTl75KQFp/l21Iu/NC8WbEaueJK471WC+6q2FX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdDgI4qS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdDgI4qS"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c74383c93cso15592695ad.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380715; x=1782985515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0dxj0A552w7ubsF/6UDVTgs5P4hm62XQTlAEP8tTXI=;
        b=YdDgI4qScWIyhXuayBk8Jwi02OS2vr8Z0gD8OCzrg8gxqg66Ge0et8JdcmqWUv9NsI
         zimykVqn0YAgk3CcVcwONHoJ08HbA+20R52c7UScK/gN2n8XRRiAZGCRINZsGtAa+4xk
         TVrZN3ia2876oef9goNNSpZQ8vX+T73+dLc2GJd1u/0N1Jmn8OC/KOK/AsTkGeGTK9In
         wBJyFB1i0TeTL32A6C0p8ZjSfcO6G2KpaKiKEQkko6xgKxbhRVISWQccOSsLCeEPnqEH
         qcbST0aOVPsZ0KzmJIcCyL0GD4VQIGcc+x3uvHWc73HK/tNqYI9VIfikTO3MnyK8hWXj
         gyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380715; x=1782985515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o0dxj0A552w7ubsF/6UDVTgs5P4hm62XQTlAEP8tTXI=;
        b=LJPNCp8Q1XTHE0q94uiwBjDXDPYQEOKHkPGpLQ1bdNPzMmJfq42Za0jYezfkDi7V4D
         jiW8aXZMdHZcfG6blBP6YNNI0Ps5TAcuSHg/qxqcwXW0B4eAoYYiyTOZ8RC2AXX4O1c8
         PDD19sZXzqvXyihG2XgWtI9JDSfgmm4wZ3VSVTbGZcxB/2ku6iLPBr2RjdcV8HPELwAI
         3sw2QuhzHk0UWWNmT+UlUZqfOQEvet5aGWvls64nwcVgswrZ9xyPAJ+rs/VzniWJtOQ+
         z+DRHfacdaVn8eDODV3gGrnhOsiZCxGtkX1iHA7y7k7M/ADQDKFbftBC/DmWu2rs9VAn
         bD8A==
X-Forwarded-Encrypted: i=1; AHgh+RpxB1bt9FAQnE0cvV/STg+YRp86dncqG0tQeV7EILFzw/OE7jYzPVKbbY8J82whHK3bK3iHc+CfsnNC@vger.kernel.org
X-Gm-Message-State: AOJu0YyPOWNRSsbJv/bH5ggwN74Z3XuXAg/IYSqBCaYpEZnlbVyH0Z8c
	/Amxc79NTii1crAfmZ72fv5f4ANyxJeGSbVIMy8RjadbbP4KdEogKaT8
X-Gm-Gg: AfdE7clhRzL/4glKWtjOzbbQw8AMORr+C6SWx4VlPO/OuB+4pxWh5NNb+ToIkIdULOJ
	NWFRFn+4y3qpshH4WyK6uHoFUPdngmppJX6PxGz23gGzcCbUs+ntxq716zTBBYK8f2Myg5Kam5t
	uxXNQvvnNxrA+foYK4fHP7mUmXx/72+NWHoC5uNZqrIYLOJXzDQY+4u5NpQgHeD1MZVbHI99klx
	SEGQXmeu1ymV3q1ys7KZ05jmQK5MrubFDZgvqFaP/U4VZq3vqNRS8OaRnFJLBUGgYghoxJK6lhV
	rdpTDPqipVfEtao7Nbvu6zjErSEYSFOdX3Qif9qTcks3uq/ySuIreKresdEKBKtnJcLOdfuz5qf
	zZDq8MtcMSM/LVYQ9GRTIL6ACHBdjv3146DkpNJqlWsj9XQj20xckGx9o7XveQHBdhW0YIv5i19
	k3bwuID2ekyOs9WEa8S0f+dEK2YSwaxcz6mLQfR1np1bDDl7NKzKfphlVB8kjN16ITrzacu6vev
	g==
X-Received: by 2002:a17:903:37c6:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c7fc727984mr18002025ad.25.1782380714969;
        Thu, 25 Jun 2026 02:45:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:14 -0700 (PDT)
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
Subject: [PATCH v5 5/7] drm/verisilicon: add DC8000 (DCUltraLite) display controller support
Date: Thu, 25 Jun 2026 17:44:47 +0800
Message-ID: <20260625094449.708386-6-a0987203069@gmail.com>
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

The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltraLite display
controller (DC8000 generation) whose register layout differs from
the DC8200 in several important ways:

1. No CONFIG_EX commit path: framebuffer updates use the enable (bit 0)
   and reset (bit 4) bits in FB_CONFIG instead of the DC8200 staging
   registers (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT,
   FB_BLEND_CONFIG, PANEL_CONFIG_EX).

2. No PANEL_START register: panel output starts when
   PANEL_CONFIG.RUNNING is set; there is no multi-display sync start
   register.

3. Different IRQ registers: DCUltraLite uses DISP_IRQ_STA (0x147C) /
   DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
   TOP_IRQ_EN (0x0014).

4. Simpler clock topology: only 'core' (bus gate) and 'pix0' (pixel
   divider) clocks; no axi or ahb clocks required.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Makefile    |  2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c     |  5 +-
 drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
 drivers/gpu/drm/verisilicon/vs_dc8000.c | 86 +++++++++++++++++++++++++
 4 files changed, 92 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 9d4cd16452fa..d2fd8e4dff24 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o \
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_dc8000.o vs_drm.o vs_hwdb.o \
 	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index fd1f5fe67a68..9499fffbca58 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device *pdev)
 	dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
 		 dc->identity.revision, dc->identity.customer_id);
 
-	dc->funcs = &vs_dc8200_funcs;
+	if (dc->identity.generation == VSDC_GEN_DC8200)
+		dc->funcs = &vs_dc8200_funcs;
+	else
+		dc->funcs = &vs_dc8000_funcs;
 
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index 825f5dd6bf17..ac96ad701199 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -66,5 +66,6 @@ struct vs_dc {
 };
 
 extern const struct vs_dc_funcs vs_dc8200_funcs;
+extern const struct vs_dc_funcs vs_dc8000_funcs;
 
 #endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c b/drivers/gpu/drm/verisilicon/vs_dc8000.c
new file mode 100644
index 000000000000..fbe0fa516cac
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
+ */
+
+#include <linux/regmap.h>
+
+#include "vs_crtc_regs.h"
+#include "vs_dc.h"
+#include "vs_drm.h"
+#include "vs_primary_plane_regs.h"
+
+static void vs_dc8000_panel_enable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dc8000_panel_disable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dc8000_crtc_begin(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dc8000_crtc_flush(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dc8000_crtc_enable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dc8000_crtc_disable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dc8000_enable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static void vs_dc8000_disable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			  VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static u32 vs_dc8000_irq_ack(struct vs_dc *dc)
+{
+	u32 hw_irqs, unified = 0;
+	unsigned int i;
+
+	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &hw_irqs);
+
+	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
+		if (hw_irqs & VSDC_DISP_IRQ_VSYNC(i))
+			unified |= VSDC_IRQ_VSYNC(i);
+	}
+
+	return unified;
+}
+
+const struct vs_dc_funcs vs_dc8000_funcs = {
+	.panel_enable_ex	= vs_dc8000_panel_enable_ex,
+	.panel_disable_ex	= vs_dc8000_panel_disable_ex,
+	.crtc_begin		= vs_dc8000_crtc_begin,
+	.crtc_flush		= vs_dc8000_crtc_flush,
+	.crtc_enable_ex		= vs_dc8000_crtc_enable_ex,
+	.crtc_disable_ex	= vs_dc8000_crtc_disable_ex,
+	.enable_vblank		= vs_dc8000_enable_vblank,
+	.disable_vblank		= vs_dc8000_disable_vblank,
+	.irq_ack		= vs_dc8000_irq_ack,
+};
-- 
2.43.0

