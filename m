Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6569B3AF644
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506228; cv=none; b=BE/+pvL6SDyx7FUrrgbcQ3SyjC3xOJFX6+46tFuorDLtdxNosmcGHvg7JLHuaIuNGqgkDA+6wok7p8jkYFuXxYz2qKv0eMPwXAODTUgZSkuQ3RT5NZ7q+exopx9y/QeF02n4eDAlV013t3kcboNzN6Up4thnlECdjEfg8/i5x5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506228; c=relaxed/simple;
	bh=Xi6JHa2crZhAiYcrZ02rWwdTy7oW6vfkpqlmhjJNSNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JK0v7O/IvzgIShC4/twnQtraXL12Ye32ZVzrLKcAMhK2kmt5z0TZuXcznKCjqD4TLkpzAqFgavbBjmHjhD9guyhPJX5x0rcu0v8PZfutH8Bmdq9WEOW1Ibhy/PGX9e4WlO5o8napIjweaos10lBB+7VfAreV7SQN/y8I68Mij1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZDfKnvr; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZDfKnvr"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-307263ad0cbso4471577eec.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506225; x=1782111025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCnGy4eyt7vZGs3J5YesXgpvuGxv5PNGr2RCRubwVqI=;
        b=CZDfKnvrfpcwz1zlsYDDqkfI9nb+GSszo9oiQpGyybvKHJBWsMWJJa+ddOEcFq55Xz
         mO/MOM9vQQWcgG0c/vn7l4dpKEzucAdBVvcpyk4gSboDQ54pyakH7boHHPBEMFvWh89o
         aRED0fWocoV5MMrkf/AfYiBgyFayQnHeyPOpC+mOKGHFfno3Tytp7gMM/3YkJSd30WK4
         VsWO9w0KrEYq8d5rFhGNfhSN6OSryb0BFaJeoTYwhNq/C6H6SE8BeSojb0mQppcGHnR0
         aAuYphEqMpQcPltmesCd3YeGQM6QxD74Ym5x6O4sWNZ8I258l8xihJVQKyBvWOdU2OMk
         bV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506225; x=1782111025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RCnGy4eyt7vZGs3J5YesXgpvuGxv5PNGr2RCRubwVqI=;
        b=FepLEwl05rcVIwSeH038HODTqEm26BS+HSC1F9jpbgYLofiQaTnHcQ1t2vY5wNQBBG
         9mUcCZoAFh3u3Tq5DBiX9tvGIr37ILPW2C9brEZo5MqInHfNRD6U2nxouCA2mGP1AHhU
         nQbG1qp8ETTJMyqMdEi6Um1heYmsTXB2S0rFZsRW4jD6fR3Ocba3QeJkw0uPo/g9k3b+
         xg1mciDwONzOeTGKeMqb27y0vNwebesBqMseoFkMMl12MFVdBiNNBOLVrFtjONJmj8Hz
         Xl1wbCYx4Cr0dkcJxPvXh8CQ3ZMbcMR8sQW0Jiw/caNSMDQgWF3NRtvxQ0blTC5HZFZ0
         qVHg==
X-Forwarded-Encrypted: i=1; AFNElJ+VLzq1rI3F7zEpqBy75btEXWOe6jqClx98fCiCTrEoTkk5nBKIcyD3lW8rzQ1NbGjrYa7nD2/h11Kv@vger.kernel.org
X-Gm-Message-State: AOJu0YwUDU+EgQEV7EEcngnVVTPhyPN/l2S8IxwNpfgEKOlsHApAflyT
	hYYSWMu6tSz3K9SdNEwgCFCIMJXKVU3VM2tNw0TLeiLTmJUNPwoRa69g
X-Gm-Gg: Acq92OFB3TGATzJGPvHr69rdcK1bGrbVn8YkFUNoQ5C9DcnjaZED0gjEazW3isAeePY
	UvGvc5OPiHis3W9JZCkGBkbNVXetMco4A53e7QQ6dTu1gbN+RL4z/vb0c/Rp6VsWXiorH+4wZLf
	phnHzONHGz0bohigMjsVTOhUo3C913KWTXO5sJCQd6VpWPfrs/Y4MtshjE91wiycfk47Ozor/TB
	b+JuvVJnnVSKNzYUZ2aZcJALyHmS02E79n5ZfUJ6IPQbCxMjxcM/WlGC5XkNiHb3FOKKG0nFCrs
	OWgij78s3ia7rVXxIV573X9qLyNRkDTt8PzYSepzRvc34Uh0Sjm4aMa7gQ35ibHjVCswGyRyYoG
	yez10p7J4hJpZidOrojrb3yb96XVxRFVXPm1W7f3NzsNmy4n9npYqWCDqDVxkLKfctM71hHM8Gr
	mtmmQDsKm8BOviAHmPayyoFWRhGfzs/4Mkren9tXi4D5Njwf0F+c0bINzwNIH2QMOOht2tZxSIb
	pKBFtkR0qu3
X-Received: by 2002:a05:7300:542:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-30936a4b1bfmr5180127eec.13.1781506225470;
        Sun, 14 Jun 2026 23:50:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:25 -0700 (PDT)
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
Subject: [PATCH v4 4/6] drm/verisilicon: add DC8000 (DCUltraLite) display controller support
Date: Mon, 15 Jun 2026 14:50:01 +0800
Message-ID: <20260615065003.76661-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615065003.76661-1-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltraLite display
controller whose register layout differs from the DC8200 in several
important ways:

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

4. Per-frame commit cycle: DCUltraLite requires the VALID bit in
   FB_CONFIG to be set at the start of each atomic commit (crtc_begin)
   and cleared after (crtc_flush).

5. Simpler clock topology: only 'core' (bus gate) and 'pix0' (pixel
   divider) clocks; no axi or ahb clocks required.  Make axi_clk and
   ahb_clk optional (devm_clk_get_optional_enabled) so DC8000 nodes
   without those clocks are handled gracefully.

Add vs_dc8000.c implementing the vs_dc_funcs vtable for the above
differences.  The probe now selects vs_dc8000_funcs when the identified
generation is VSDC_GEN_DC8000 (DCUltraLite reads model 0x0,
revision 0x5560, customer_id 0x305).

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Makefile    |  2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c     |  9 ++-
 drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
 drivers/gpu/drm/verisilicon/vs_dc8000.c | 78 +++++++++++++++++++++++++
 4 files changed, 86 insertions(+), 4 deletions(-)
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
index 9729b693d360..9499fffbca58 100644
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
+	if (dc->identity.generation == VSDC_GEN_DC8200)
+		dc->funcs = &vs_dc8200_funcs;
+	else
+		dc->funcs = &vs_dc8000_funcs;
 
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index 544e1a37065b..5218e8cf63e2 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -66,5 +66,6 @@ struct vs_dc {
 };
 
 extern const struct vs_dc_funcs vs_dc8200_funcs;
+extern const struct vs_dc_funcs vs_dc8000_funcs;
 
 #endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c b/drivers/gpu/drm/verisilicon/vs_dc8000.c
new file mode 100644
index 000000000000..be0c0d7baf52
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
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
+static void vs_dc8000_crtc_enable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dc8000_crtc_disable(struct vs_dc *dc, unsigned int output)
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
+	u32 irqs;
+
+	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
+	return irqs;
+}
+
+const struct vs_dc_funcs vs_dc8000_funcs = {
+	.panel_enable_ex	= vs_dc8000_panel_enable_ex,
+	.panel_disable_ex	= vs_dc8000_panel_disable_ex,
+	.crtc_begin		= vs_dc8000_crtc_begin,
+	.crtc_flush		= vs_dc8000_crtc_flush,
+	.crtc_enable		= vs_dc8000_crtc_enable,
+	.crtc_disable		= vs_dc8000_crtc_disable,
+	.enable_vblank		= vs_dc8000_enable_vblank,
+	.disable_vblank		= vs_dc8000_disable_vblank,
+	.irq_ack		= vs_dc8000_irq_ack,
+};
-- 
2.43.0

