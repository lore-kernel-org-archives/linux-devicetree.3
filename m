Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD303F39C8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070161; cv=none; b=PUNzChk0Ro1jWxDkR6EgKQAZFCP3UOQJ3E4AD9wPohsPVuGeW7RdjPjBqv/es0oD3T/UnOWS34xZGd4Mc/kNTAoJSItdpeGLOK+ZsiACMzCzsCSsjl67sqfi93OqJyznv4hMetZZpCtFQCR4v+CJsmSkxCVL8KoCpl+1NYZl/ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070161; c=relaxed/simple;
	bh=5PWYqDuzl6K8pbXqd0jFJUxkkr3zk1rRhq0XwWc/CBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ojP2aKaP08gAW6j6GRc7EEfxNW0rxhEttbGTgsDcrRXLBx6M3FKKXxoiTf4nd4INYN1TVBmMmqPHJqH2P/mjdMX8bcYXvJXjNkoPEv1XPr7HLyyCg053f1DPEg9LiHRhlTeBgEolEqMLUne7Hfs4D2iCrViTSPmhVOoaKlNfgNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHd96KAq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHd96KAq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe62837baso8193552f8f.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780070158; x=1780674958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOXLfjR907rwej611x7m141Ozi7EpaSMj+LhT2MaIio=;
        b=RHd96KAqJ795oR71P94pdQLPHyMCPzzKxTzzDXNdi9ZAH04kWC2NF3R5j703Swa7Dn
         z6P+s2rXn4A1rWP4vb5sC0grlwD+6ytszPS5vYI7H0firqxkHZ5RMcMqhDvVW9gsFsGX
         WlQOGQrJWoE/hDNZz2biBKtts6wuG5WgBF5/tIcNPN8rvr7C4lPp6tDuN5+W2ZT0Nuea
         yul6CFwTgX+8bnKa6QomMir5psjxgrc7kVofS6JCYwzSz4+pG9vkQrbTPidXbVzVPJg0
         6+QWstN+QECGWjWi/22b2VhVaziXfnJo4wJJs2BjwMWSDDwG0H+SiaIFtmRDK8YBAlxZ
         lgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070158; x=1780674958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YOXLfjR907rwej611x7m141Ozi7EpaSMj+LhT2MaIio=;
        b=ceyaXDkriIMcepKa4seXhHWUhiMRu63o+nKavFCwJEGjWSYtMXSDkiYSg3fPlXmtWL
         M48sUJ2k00oVPkhShNXdY+3cIgofjyjITSIGFWgc5eY2BaU5rmfQ4IFT5c4jc6IdE2IP
         upxW9i4wpEQ4M1/U2x1umafBqb2M0Zh+CKqGqzeIPD2A2pCgCfhtz1fthsqDDtkJySOZ
         9z4Wlu5vgogQod4/fpRlOkB9IPTfSpKRCNTHBc6FHXvMYwYiFZq9tbxDgXRDIZTOEAxH
         /AqunnGvyc1UYyhwkedXXSdFVLsB3F1XRkjJzOM9HaxkFg6KJRzOSbYHhmjD2wvVe5G5
         DfHw==
X-Forwarded-Encrypted: i=1; AFNElJ/qwuMoh9Pfs3pmqjpLKvZFoz/INwto3DCyM0P+NshI4yr9pkwjk1p0israg3077RjC3GMBt76Rexx4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7W7VYT8qig6jTVMeG9Y7TKh9wQynAO5Rc6iFqO0j9QSEW22Aw
	2s0/GYn0ozV8hwczeqL7M4qPclKtW+H9xbcx8Ie0y2sci1jsr3v0S7SB
X-Gm-Gg: Acq92OHnmk4IrfdITLX0aRwYOOUla/8kNhPSih5DE6CRnFqQs6izsa9Bjus/XffIcbc
	N+cA8K/qzJn+Ljsgx42wmZQiYGuakt19LwwiwuRd8KaErl7Di3ynWqJiRvi4W7uys7+cMy4XeCj
	Za9V7CQfEjs0tAKpTUWXcLanljoB0rsx0ngHeLDfZVMueucjZyFuLMYA+hmRbzg6z0j3rCAT3Od
	MZ982VfQzElkwgkZtLrqEiJn//g7Bk51zc5xdydUQPtOykYmenU+5VMLxj3fh24BYyoWysrdqei
	NjNKmA822+QJR9Dxt4U5L0dwOjkN0YBS6VDZUrupTZhCprRf7CMuXGFD/I+DDA2CJ7CZ6P9r4hD
	sU2QQ46yOEJcFmn7sPpvyt9Yz+jPe5RaUOxFy619KkLDCHxAmVqP02Vy9JECthJ8UFVnsPkbWhK
	PllmfHKuKNYAcqEcMKkBbluAb0D6QsI0QhaAphv0mnKO+Kmy3ih7z9SGnzfUC2SedyCFpNyyebm
	CRZQXRWwzs+SfrjRP14ifIVNbPnweVqac9FbPf8
X-Received: by 2002:a05:600c:4685:b0:490:9d1b:2033 with SMTP id 5b1f17b1804b1-490a290d007mr3387985e9.9.1780070158135;
        Fri, 29 May 2026 08:55:58 -0700 (PDT)
Received: from debian.tailb81abf.ts.net (2a01cb09e0354cc878d00097536575e1.ipv6.abo.wanadoo.fr. [2a01:cb09:e035:4cc8:78d0:97:5365:75e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm55150315e9.15.2026.05.29.08.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:55:57 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2 1/4] accel: rocket: Add support for Rockchip RK3568
Date: Fri, 29 May 2026 17:58:21 +0200
Message-Id: <20260529155824.3099831-2-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260529155824.3099831-1-midgy971@gmail.com>
References: <20260529155824.3099831-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Midgy BALON <midgy971@gmail.com>

The RK3568 has a single NVDLA-derived NPU core (0.8 TOPS), the same IP
family as the three-core RK3588 NPU already supported by the Rocket
driver. To accommodate both SoCs:

  - Introduce a per-SoC rocket_soc_data structure carrying dma_bits and
an optional noc_init callback, plumbed through of_device_get_match_data().
  - rocket_device_init() now scans for both rk3568 and rk3588 RKNN cores
and picks the narrower DMA width (32-bit) when an RK3568 core is present.
  - Add rk3568_soc_data and rk3568_noc_init() handling the three RK3568-
specific initialisation steps that must run after the power domain is
on and clocks are enabled:

1. PVTPLL initialisation: The NPU uses a PVTPLL ring oscillator
   managed by TF-A via SCMI for rates above 400 MHz. A two-step
   clk_set_rate() sequence (600 MHz then 1 GHz) forces two SCMI calls
   to TF-A even if the kernel clock framework would skip an unchanged
   rate. The PVTPLL must be running before the NPU NOC bus will
   acknowledge a de-idle request.

2. Explicit NPU power-on (PWR_GATE_SFTCON): The RK3568_PD_NPU power
   domain is marked always_on in pm-domains.c, so the generic power
   domain framework power_on() callback is a no-op. The NPU hardware
   can remain power-gated at boot. Writing bit 1 = 0 to PWR_GATE_SFTCON
   (PMU offset 0xa0) explicitly powers on the NPU hardware before the
   de-idle request is issued.

3. NOC bus de-idle: Disable NPU NOC auto-idle (NOC_AUTO_CON0 bit 2),
   request de-idle (BUS_IDLE_SFTCON0 bit 2 = 0), then poll
   BUS_IDLE_ST (PMU offset 0x60) until bit 2 clears (bus active).

The RK3568 DMA address space is limited to 32 bits, as the NPU AXI bus
and IOMMU page walker cannot address memory above 4 GB.

All PMU accesses follow the RK3568 write-mask protocol: upper 16 bits are
the write-enable mask for the lower 16 bits.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.c   | 18 ++++++-
 drivers/accel/rocket/rocket_core.h   | 16 +++++++
 drivers/accel/rocket/rocket_device.c | 25 ++++++++--
 drivers/accel/rocket/rocket_drv.c    | 71 +++++++++++++++++++++++++++-
 4 files changed, 125 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index abe7719c1..7e2f3524a 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -21,6 +21,12 @@ int rocket_core_init(struct rocket_core *core)
 	u32 version;
 	int err = 0;
 
+	core->soc_data = of_device_get_match_data(dev);
+	if (!core->soc_data)
+		return dev_err_probe(dev, -EINVAL,
+				     "no per-SoC match data for core %d\n",
+				     core->index);
+
 	core->resets[0].id = "srst_a";
 	core->resets[1].id = "srst_h";
 	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(core->resets),
@@ -52,7 +58,8 @@ int rocket_core_init(struct rocket_core *core)
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	err = dma_set_mask_and_coherent(dev,
+					DMA_BIT_MASK(core->soc_data->dma_bits));
 	if (err)
 		return err;
 
@@ -80,6 +87,15 @@ int rocket_core_init(struct rocket_core *core)
 		return err;
 	}
 
+	if (core->soc_data->noc_init) {
+		err = core->soc_data->noc_init(core);
+		if (err) {
+			pm_runtime_put_sync(dev);
+			rocket_job_fini(core);
+			return err;
+		}
+	}
+
 	version = rocket_pc_readl(core, VERSION);
 	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;
 
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d738285..742e14a29 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -12,6 +12,21 @@
 
 #include "rocket_registers.h"
 
+struct rocket_core;
+
+/**
+ * struct rocket_soc_data - per-SoC configuration data
+ * @dma_bits: Physical address width reachable by the NPU's AXI bus.
+ *            RK3568: 32 (32-bit AXI), RK3588: 40.
+ * @noc_init: optional callback to de-idle the NPU NOC bus at core init.
+ *            Required on RK3568 where the NOC must be explicitly un-idled
+ *            before the NPU can be accessed.
+ */
+struct rocket_soc_data {
+	unsigned int dma_bits;
+	int (*noc_init)(struct rocket_core *core);
+};
+
 #define rocket_pc_readl(core, reg) \
 	readl((core)->pc_iomem + (REG_PC_##reg))
 #define rocket_pc_writel(core, reg, value) \
@@ -31,6 +46,7 @@ struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
 	unsigned int index;
+	const struct rocket_soc_data *soc_data;
 
 	int irq;
 	void __iomem *pc_iomem;
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 46e6ee1e7..0ed8251c8 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -27,6 +27,9 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 	ddev = &rdev->ddev;
 	dev_set_drvdata(dev, rdev);
 
+	for_each_compatible_node(core_node, NULL, "rockchip,rk3568-rknn-core")
+		if (of_device_is_available(core_node))
+			num_cores++;
 	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
 		if (of_device_is_available(core_node))
 			num_cores++;
@@ -37,9 +40,25 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
-	if (err)
-		return ERR_PTR(err);
+	/* Use the DMA width of the first available RKNN core.  RK3568 cores
+	 * are 32-bit; RK3588 are 40-bit.  If both are present we pick the
+	 * narrower mask.
+	 */
+	{
+		struct device_node *n;
+		unsigned int dma_bits = 40;
+
+		for_each_compatible_node(n, NULL, "rockchip,rk3568-rknn-core")
+			if (of_device_is_available(n)) {
+				dma_bits = 32;
+				of_node_put(n);
+				break;
+			}
+
+		err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_bits));
+		if (err)
+			return ERR_PTR(err);
+	}
 
 	err = devm_mutex_init(dev, &rdev->sched_lock);
 	if (err)
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 5c0b63f0a..f8e153fc2 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -9,9 +9,11 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/iommu.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 
 #include "rocket_drv.h"
 #include "rocket_gem.h"
@@ -199,8 +201,75 @@ static void rocket_remove(struct platform_device *pdev)
 	}
 }
 
+/*
+ * RK3568 NOC de-idle: the NPU bus must be explicitly un-idled before the
+ * NPU hardware can be accessed.  The RK3568 PMU provides BUS_IDLE_SFTCON0
+ * (offset 0x50) and NOC_AUTO_CON0 (offset 0x70) for this purpose.  Refer
+ * to the RK3568 TRM section "PMU" for the write-mask protocol used by
+ * these registers (bits [31:16] are write-enable for bits [15:0]).
+ *
+ * rocket_clk_names[] in rocket_core.c defines: "aclk"[0], "hclk"[1],
+ * "npu"[2], "pclk"[3].  Index 2 is the SCMI-managed NPU clock.
+ */
+#define ROCKET_CLK_NPU_IDX	2
+
+static int rk3568_noc_init(struct rocket_core *core)
+{
+	struct regmap *pmu;
+	unsigned int val;
+	int ret;
+
+	/*
+	 * RK3568: PVTPLL (the NPU's high-speed clock, managed by TF-A via
+	 * SCMI) must be running before the NPU NOC bus will de-idle.  Force
+	 * two SCMI calls now that the NPU power domain is on and clocks are
+	 * enabled.  The intermediate 600 MHz step ensures a real SCMI call
+	 * even when the kernel clock framework would otherwise skip an
+	 * "unchanged rate" request.
+	 */
+	clk_set_rate(core->clks[ROCKET_CLK_NPU_IDX].clk, 600000000UL);
+	clk_set_rate(core->clks[ROCKET_CLK_NPU_IDX].clk, 1000000000UL);
+
+	pmu = syscon_regmap_lookup_by_phandle(core->dev->of_node, "rockchip,pmu");
+	if (IS_ERR(pmu))
+		return dev_err_probe(core->dev, PTR_ERR(pmu),
+				     "failed to get PMU regmap\n");
+
+	/* Disable NPU NOC auto-idle so the bus stays awake */
+	regmap_write(pmu, 0x70, BIT(2 + 16));
+
+	/*
+	 * Request NPU power domain power-on (PWR_GATE_SFTCON bit 1 = 0).
+	 * genpd for RK3568_PD_NPU is always_on so its power_on() is a no-op;
+	 * explicitly power on the hardware here so the bus de-idle ACK arrives.
+	 */
+	regmap_write(pmu, 0xa0, BIT(1 + 16));
+
+	/* Request NPU bus de-idle (bit 2 = 0 → active) */
+	regmap_write(pmu, 0x50, BIT(2 + 16));
+
+	/* Wait for NPU bus to become active (BUS_IDLE_ST bit 2 = 0) */
+	ret = regmap_read_poll_timeout(pmu, 0x60, val, !(val & BIT(2)), 10, 1000);
+	if (ret)
+		dev_err(core->dev,
+			"timeout waiting for NPU bus de-idle (BUS_IDLE_ST=0x%08x)\n",
+			val);
+
+	return ret;
+}
+
+static const struct rocket_soc_data rk3568_soc_data = {
+	.dma_bits = 32,
+	.noc_init = rk3568_noc_init,
+};
+
+static const struct rocket_soc_data rk3588_soc_data = {
+	.dma_bits = 40,
+};
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "rockchip,rk3588-rknn-core" },
+	{ .compatible = "rockchip,rk3568-rknn-core", .data = &rk3568_soc_data },
+	{ .compatible = "rockchip,rk3588-rknn-core", .data = &rk3588_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.39.5

