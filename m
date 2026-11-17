Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936682;
	b=vzc6K8ZgsUUfkzrpNqffd08ktsGW2W/InWrE043Kx8bTnFQzd3OE1+jzlZUL6XMBEzE0
	 1yCGOJX/PN2P7LoTidch5gBhSj+rX+WV3et3yDSqumiK5o7uzSxjd84wxjQghWntohdpT
	 IqfaK3fh420b8J/tEOSQ2nAOzzQvM9h5Icdw8WaBw1+Vm9THW4GFxTOl1/jB78YR+dFZS
	 V2jvipjzlXztqUSGz0x77WGasUNV5G4ampOnnZx64ORrPRqjMyis05QSo/SpCi/t8wr3O
	 oO/QgqmXHA5KdfUIkoGBlZqhqFImODAW2YuigGBd6bzSzju8P2D4ZijxfdECCpTFosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+5KzUYY/vcXfemi9waz3d6wiZ68aHIzdXI9cSdmvu0U=;
	b=4XjUA+ml3D+7UPbYYuJSgCnCSGXP++clmsKbyHAWSIe320IBRT4lcUZPqWjYYUkHGDmZ
	 fZsLbplqFh0La2O/bJ/eTzA1OaA9hIESreDbD2uGAIpVrT9Vdo++dcKS7ZpE2K+z8hhJH
	 CcVhVR10r4ybDYO7XI03PnONaH2tzhfWaYSLB/wZ2CbQP6P1ujXwGgB3sJgpkpZK6tQj9
	 dkstyJEBhaKLyHMmMm2dNIToyCmUa5TJ1Qo/etXBzHbgZV0URox/LdKzMX2jiO+KuoHzA
	 /ueoC9sPQSyZqf+MytyJcGvnA9lyoXg5+ERP7XZenaBTip9w9MFr44g01RUFJH1MVSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Vp0WSGLp;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B113606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B113606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Vp0WSGLp
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso1165915e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936680; x=1795541480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5KzUYY/vcXfemi9waz3d6wiZ68aHIzdXI9cSdmvu0U=;
        b=Vp0WSGLpBVkp6PdcnPNAFI5j2X9aeAu+wVvQL5/FEq927aIDbZ/vYe69aK7U4faq3A
         cXzF2cdHPz5OOkxdDc1BH+vhD4JbTMRXUWRdnNDskHLBQMuXJxGggNYt0Ojyou/0954+
         NTLxwjzSCyy6CAlaLL+zhH8u6VE2o5F/WGRFx5ex+CwVFTzHZyNmyQi9zfX1+Y+SmEs8
         3rzpqkupqzASZUScuPzsnoQlO8eKVeVtObijIAnibqc6oMyIIuNsaq8nqC1itnI3tw44
         9/63Ldkbnc5JNCICprAkOun90Pyqq1db79uYHelsvEOreS7+G5o5bJ6Zc6vY58ONyS1v
         F0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936680; x=1795541480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5KzUYY/vcXfemi9waz3d6wiZ68aHIzdXI9cSdmvu0U=;
        b=2GpwRjCEqCMN1ddx9Z9t2rLCVq5DQXLc4bObROdN7e7PEfyghvUNiMsUlTopck4icE
         j6ybnmpHja1yAnftDq8cR0XBjiIsYeYbNasmbQcdh0lVqo0tFPcVxZ8B0KP+q56oQhoY
         W0hBOj+c75mTkheSnfJWbX7c+W9PBstWUuHCZ9GJb3pU6T13iLcMmAE6tPM1+ryTaqVb
         /jNrGRARSCyJ6hgmypDOa1ziaeWYD2OuWEJftfPui85C7jGZWgTYclh/TRMO6C4Q4s1u
         60+hymj9F5SJw9NAgayCIfZP7lUvOsO/Bf4ZYsVxiVYy6LnQQaEBRwbfkfVGL1U546nu
         TkeA==
X-Forwarded-Encrypted: i=1; AL+hErFs0Hu3uZlPLgS2bZygRAsw6nqEdlgUmPdSTG+BFhy+cEv2pIwBCrSm/InqhsE3GRoPbi1kzK9VUvws@vger.kernel.org
X-Gm-Message-State: APuU4Z+MqGscGIbc7i/kBT3BeJJfK8PHBzvN+w6i2NzWQZxYcnAlZ8PL
	odBGgxAbKy4GALvo6fKcYjrRwqD4s5z45sPtpaSqt9C9qp09+T3xACA3skIvJ0TZJL8=
X-Gm-Gg: AYBFou0pVKZqagJkJDTBv3K+gWxJDn2FY1ck8cN32P66aNFRKuvNmrQcDP1ixeR3Y9i
	qkb3HGJDZA3UxeA0UgDsjLzaUNJ4VL7bn+wZgsET48ZZlnBuL7ehsPhBZxFBGVblTMU4lp+acUu
	JdebUuJM9bM5aasKTzEcMkJH7Pn2S3pdR3ytjqAjJ6Aick83QKhiA+/TPs3p4M6IAU+B3DreG+p
	fpANj+wZLXYpHp+3K72VCZPkUCJTJ1qZY4x4BRVXMo55UZExq79e5dG1S5Pggu1eRpckZDBv0LH
	esW5Q1xtt0weRP8SUBiVU0aIAIhYzokBKksZgNuAhPfv29CF/G7hS1XaLFfFTF5mfgMkr02WKp9
	lUikFLu4n4ORn0gQgAokM8ZygtXJtfbre9oJ17i6R1zcKpR+N6krHjS9kj0q/GExiD9MFCUkPCK
	+SnLaEfx6F5gkDNeY5qvijasnD2jjHV1EftzIJgACNN2LY1F2tQnmVMEXGQZxw9LUaOmDicYbTC
	FRaAVdCfTI6iaf1BiSMigYH3Ygk+ExcOCGqLMKT3ByZMzHJ0+opCsYelFYUYQ5gaX4UTpkaxjxx
	Ry0cxb34YooAFQN3Fx1L2XisqaDAEIIfzPp1PA/wDKySWPfnK/Qcy197e8BnI7/9IsD6KCYTp8t
	d3w==
X-Received: by 2002:a05:600c:3111:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb61184db8mr281583825e9.30.1794936680498;
        Tue, 17 Nov 2026 09:31:20 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:19 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 17:31:05 +0000
Subject: [PATCH 2/2] irqchip: Add MediaTek SMMU wrapper driver
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-smmu-wrapper-v1-2-229f04d9f693@baylibre.com>
References: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
In-Reply-To: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

On MT8196, each interrupt of the multimedia SMMUv3 must be acknowledged
in a MediaTek wrapper, which otherwise keeps its GIC line asserted.

Add a driver for the wrapper as a chained interrupt controller.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 MAINTAINERS                       |   1 +
 drivers/irqchip/Kconfig           |  11 +++
 drivers/irqchip/Makefile          |   1 +
 drivers/irqchip/irq-mtk-smmu-wp.c | 145 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5cc65a753ad2..36866ba47912 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17228,6 +17228,7 @@ M:	Alexandre Mergnat <amergnat@baylibre.com>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
+F:	drivers/irqchip/irq-mtk-smmu-wp.c
 
 MEDIATEK SWITCH DRIVER
 M:	Chester A. Unal <chester.a.unal@arinc9.com>
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 2edf121c7841..2773515f1dd4 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -866,4 +866,15 @@ config IRQCHIP_XILINX_SMMU_CSR
 	  ZynqMP-class platforms where a vendor CSR block mediates SMMU
 	  interrupts.
 
+config MTK_SMMU_WP
+	bool "MediaTek SMMU wrapper interrupt controller"
+	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
+	default ARCH_MEDIATEK && ARM64
+	select IRQ_DOMAIN
+	help
+	  Support for the wrapper block that MediaTek integrates
+	  with the multimedia SMMUv3 of MT8196.
+	  The interrupts of that SMMU do not work without this
+	  driver.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index eb539d41251e..573b6c06fe06 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_BRCMSTB_L2_IRQ)		+= irq-brcmstb-l2.o
 obj-$(CONFIG_KEYSTONE_IRQ)		+= irq-keystone.o
 obj-$(CONFIG_MIPS_GIC)			+= irq-mips-gic.o
 obj-$(CONFIG_MTK_IRQ)			+= irq-mtk-sysirq.o irq-mtk-cirq.o
+obj-$(CONFIG_MTK_SMMU_WP)		+= irq-mtk-smmu-wp.o
 obj-$(CONFIG_ARCH_DIGICOLOR)		+= irq-digicolor.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o
diff --git a/drivers/irqchip/irq-mtk-smmu-wp.c b/drivers/irqchip/irq-mtk-smmu-wp.c
new file mode 100644
index 000000000000..6e5172d18b14
--- /dev/null
+++ b/drivers/irqchip/irq-mtk-smmu-wp.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MediaTek SMMU wrapper interrupt controller
+ *
+ * Copyright (C) 2026 BayLibre, SAS
+ *
+ * The wrapper latches each SMMUv3 interrupt source in IRQ_STA and keeps its
+ * single output line asserted while a latched source is not acknowledged.
+ * An acknowledgment clears every pending occurrence of the source, so each
+ * source is handled as an edge, acknowledged before its handler reads the
+ * SMMU state. No mask register is known.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#define MTK_SMMU_WP_IRQ_STA		0x80
+#define MTK_SMMU_WP_IRQ_ACK		0x84
+#define MTK_SMMU_WP_IRQ_ACK_CNT		0x88
+#define MTK_SMMU_WP_IRQ_ACK_CNT_MASK	GENMASK(7, 0)
+
+#define MTK_SMMU_WP_NR_IRQS		8
+
+struct mtk_smmu_wp {
+	struct device		*dev;
+	void __iomem		*base;
+	struct irq_domain	*domain;
+};
+
+static void mtk_smmu_wp_ack_source(struct mtk_smmu_wp *wp, unsigned int src)
+{
+	writel_relaxed(BIT(src), wp->base + MTK_SMMU_WP_IRQ_ACK);
+	/* Flush the posted ACK before the SMMU is read */
+	readl(wp->base + MTK_SMMU_WP_IRQ_STA);
+}
+
+static void mtk_smmu_wp_irq_ack(struct irq_data *d)
+{
+	mtk_smmu_wp_ack_source(irq_data_get_irq_chip_data(d), d->hwirq);
+}
+
+static const struct irq_chip mtk_smmu_wp_chip = {
+	.name		= "mtk-smmu-wp",
+	.irq_ack	= mtk_smmu_wp_irq_ack,
+};
+
+static void mtk_smmu_wp_handler(struct irq_desc *desc)
+{
+	struct mtk_smmu_wp *wp = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long pending;
+	unsigned int src;
+
+	chained_irq_enter(chip, desc);
+
+	pending = readl_relaxed(wp->base + MTK_SMMU_WP_IRQ_STA);
+	for_each_set_bit(src, &pending, MTK_SMMU_WP_NR_IRQS) {
+		if (generic_handle_domain_irq(wp->domain, src)) {
+			/* Release an unused source, which would hold the line */
+			mtk_smmu_wp_ack_source(wp, src);
+			dev_warn_ratelimited(wp->dev, "unexpected source %u\n", src);
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int mtk_smmu_wp_map(struct irq_domain *d, unsigned int virq, irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(virq, &mtk_smmu_wp_chip, handle_edge_irq);
+	irq_set_chip_data(virq, d->host_data);
+	return 0;
+}
+
+static const struct irq_domain_ops mtk_smmu_wp_domain_ops = {
+	.map	= mtk_smmu_wp_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static void mtk_smmu_wp_setup(struct mtk_smmu_wp *wp)
+{
+	u32 val;
+
+	/* Make each IRQ_ACK write clear every pending occurrence */
+	val = readl_relaxed(wp->base + MTK_SMMU_WP_IRQ_ACK_CNT);
+	val |= MTK_SMMU_WP_IRQ_ACK_CNT_MASK;
+	writel_relaxed(val, wp->base + MTK_SMMU_WP_IRQ_ACK_CNT);
+}
+
+static int mtk_smmu_wp_probe(struct platform_device *pdev, struct device_node *parent)
+{
+	struct irq_domain_info info = {
+		.fwnode		= dev_fwnode(&pdev->dev),
+		.size		= MTK_SMMU_WP_NR_IRQS,
+		.hwirq_max	= MTK_SMMU_WP_NR_IRQS,
+		.ops		= &mtk_smmu_wp_domain_ops,
+	};
+	struct device *dev = &pdev->dev;
+	struct mtk_smmu_wp *wp;
+	unsigned long pending;
+	unsigned int src;
+	int parent_irq;
+
+	wp = devm_kzalloc_obj(dev, *wp);
+	if (!wp)
+		return -ENOMEM;
+
+	wp->dev = dev;
+
+	wp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(wp->base))
+		return PTR_ERR(wp->base);
+
+	parent_irq = platform_get_irq(pdev, 0);
+	if (parent_irq < 0)
+		return parent_irq;
+
+	mtk_smmu_wp_setup(wp);
+
+	/* Release the sources that an earlier boot stage left latched */
+	pending = readl_relaxed(wp->base + MTK_SMMU_WP_IRQ_STA);
+	for_each_set_bit(src, &pending, MTK_SMMU_WP_NR_IRQS)
+		mtk_smmu_wp_ack_source(wp, src);
+
+	info.host_data = wp;
+	wp->domain = devm_irq_domain_instantiate(dev, &info);
+	if (IS_ERR(wp->domain))
+		return PTR_ERR(wp->domain);
+
+	irq_set_chained_handler_and_data(parent_irq, mtk_smmu_wp_handler, wp);
+
+	return 0;
+}
+
+IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_smmu_wp)
+IRQCHIP_MATCH("mediatek,mt8196-mm-smmu-wp", mtk_smmu_wp_probe)
+IRQCHIP_PLATFORM_DRIVER_END(mtk_smmu_wp)

-- 
2.43.0

