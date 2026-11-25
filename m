Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649459;
	b=Iy5JXaB24RzYX7/RXAlqyJHSkQWgiHko5dBPxHfH1ViPC80UW6G3y+p9KN3UcATlrtA5
	 1Wli/7Gkh8qfS0j5JHrxVxsKVJjAWwzoFfviE2w/9SPIaEA3X/8EyMq2p7n3JSZyuKoaP
	 s9Ki8JU4lia1YBElmNt7lizRjCdnrUsPpbkkY8L3uoWr6ywQvwIMWBp+xUNCiT/+ZpUZJ
	 mHr8fghmYci6m55hynTeveZAuzHa1HGsK8YPhYOMGJ/eOnBpKBUFKRAlVPgpScG37PnE6
	 NRQTkAXmwK7gewKZdw1G68d0bKguu45zbTJDrNRpGhVlR3Ueo+zhceRHQkOW5wunVoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=1z+y7fmEUMtLnG3lTMWhkUey//yqaPCMXeCiS+uEMnc=;
	b=drhEBd3MWcKNORqgGCCkRYS4hXxQPFerM1TlOJqbc4oavhZbd5vaDmJSqzdPuYfxi4Ev
	 7CFJ1RJfc7vb06RhIKY3BQwHLXj+rvZgsf8MXZd/raey6Os4y4jEggD8L5Tr7lkLQErNo
	 Ay//YwOktcDEqpFaWG5zHr/Ovm9RpQWVk1hCdh2YPQjGUFVR96QRD4+XrQwwP+QrpjAfr
	 c4gxLXa4wUB5iKonTMUdUCH3khwwRaayfz7qLl3CitknnVGOZ6romGtd4lBXyfsJTu/iR
	 5XfP+7iSFtHIXwcbqmGifAh3oQP6BJ8HVQc+/U2//51iLA8iJtSOc9mwWUoUqf4P5tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z81dQqxI;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E39606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E39606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z81dQqxI
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so82288315e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649457; x=1796254257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1z+y7fmEUMtLnG3lTMWhkUey//yqaPCMXeCiS+uEMnc=;
        b=z81dQqxIjn1HN9zU17fyIjc0R7p6ncjaSSGREiCBJDp5w3AdpEqtc11ocs8EUBCEg8
         xsInIbXt4699r3oFKY1wvkjF/ArNeFAQMscCogMGC8+33tn37RdDuJQG4DrJz/vW2XTJ
         kFQoXnAPPxmm3JRYcyK/+smhNTxPrsAojxIDA9I0rDhJ30ieFvQAynIqvtj9u4qI1gi6
         FT3TXPGemo4mDKB2S/XNskbpnN9iIoxSL3srq/4/Ra7LFNwWS7N2RpS8OR+P5aoYidIN
         PsXDBC6BreoBpR6FYeSxnxRWQY6weAjI5uH0gi5jlF6CD0nZ8g02t+1nS02chNgzkYEE
         5knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649457; x=1796254257;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1z+y7fmEUMtLnG3lTMWhkUey//yqaPCMXeCiS+uEMnc=;
        b=Y/Gifp6TCtRhZtvHBNqlRYguQtzHrOJBd3nRiOxMNKyRgNyQfSslYWRIyAIqx9Gnsu
         CyCoLQv/6UZY6E0kZwwNfudvUqOhiWbwm5IrtCtlcYDmYgLApeapH0ri5dLNVLfXg1G2
         VCCyPKwRLgqIV/TZ/iWCwIaLHqRv+uQ8uTInX+XGe2yuxk9O7xjA1zUPU3ml1qqmhMvN
         kMECNktfgzdYwrLyt83fpwlRDAvepyzWcNF4G/Z0jqcQxqPXe+FiJpUROPX/CkXxyT7I
         kkQx2Keoqt94NcnesyC5urP8Xrx3cqIWY0hzO90ekMeWq2ID6lhBPt0dxYO7aj8u+36v
         pThQ==
X-Gm-Message-State: APuU4Z9qBv4Ghw6hXN4i3s1v+JrQXQ8AVPkgs9ldtZ4bveUHZgEhS36j
	/faFxJamn4+Vg/o3XgMESDy1QHo9Cio30d622OkIivhAmkM9Gk3JYr4w
X-Gm-Gg: AZFdTZc6X0y0hF/r5NdtoRG9YGVBY8sUXzy10UI0ANUK6SqGKiVnKdBGSSgCx2s8PYZ
	8O8vU8iq/nCV0xiT2iC1SwxdGy76/OyGF18hN+1EfL4L6fEU4HclAKKzu6cvpc42O6JHPDIPNNV
	aUKOoeQKTqBD9e7IDl/yAHyK7VnhV/GwbynmzWiK2gvPKhZezjalKKgbR6UAnh3AfoVZrS/LGUy
	Owuy6neJDz1+/Dr6kEBgzrWNLzkVqafzzPCxQPNj3N2YupUoUx95S0xi9ogXh+cXdMCxfV8rY9i
	Qk4dOQ8ICZX5RYqdVGV/TtPLtY0swqRPwV7v+F/h2PEeEsYYzbj1nkyg6ycHx1ADoIKDL0M7EnC
	7bFiHcgLfl79V+QJackqGayAlqweL2huir5z99Q/zujdrm//btWAe5WUm0OQzNRyXeRNlNAmMXA
	RqSIIf2QNUDAv0cu0afomaXWSlXBSI5Wq3AzUTM6h5uogPubUG7MADv10WXjHvfY0SYyIiM7eqY
	cn/9Bg1syhThz2NOfDTeZfL8rPYk2OU6YhEz9Guf6nctqVto5S9CdXZHULn6DsR3/Rz6A+ksjc/
	iZiQKg8P7agSExcq8yTbvzedKlVDolUoCOIqdqYGM90wr3lwkkAWEuVUR0vtN+5FWjhUm1YGYSV
	IrMnghhd6evk=
X-Received: by 2002:a05:600c:5901:b0:4bb:5e8a:7c9c with SMTP id 5b1f17b1804b1-4bb861467c8mr335670965e9.7.1795649457193;
        Wed, 25 Nov 2026 15:30:57 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm31083635f8f.46.2026.11.25.15.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:56 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH RFC 06/19] irqchip: Add Espressif ESP32-P4 interrupt matrix support
Date: Wed, 25 Nov 2026 23:30:07 +0000
Message-ID: <20261125233020.1380594-7-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register a child IRQ domain for the ESP32-P4 interrupt matrix.
Allocate a CLIC external interrupt input for each peripheral interrupt
and program the route when the interrupt is activated. Support
active-high level interrupts for source numbers 0 through 127.

Disconnect firmware routes before registering the IRQ domain. On
ESP32-P4 revision 3.x, also clear the three additional routing registers.

Tested on a Waveshare ESP32-P4-Module-DEV-KIT. Verified that peripheral
interrupts were delivered to the CLIC through the matrix.

AI assisted with driver development and validation.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/irqchip/Makefile             |   1 +
 drivers/irqchip/irq-esp32p4-intmtx.c | 139 +++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 drivers/irqchip/irq-esp32p4-intmtx.c

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 408d06c20ab8..772d9558bbc8 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_RISCV_ESP32P4_CLIC)	+= irq-esp32p4-clic.o
+obj-$(CONFIG_RISCV_ESP32P4_CLIC)	+= irq-esp32p4-intmtx.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
diff --git a/drivers/irqchip/irq-esp32p4-intmtx.c b/drivers/irqchip/irq-esp32p4-intmtx.c
new file mode 100644
index 000000000000..0fc1a7b78f8f
--- /dev/null
+++ b/drivers/irqchip/irq-esp32p4-intmtx.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Espressif ESP32-P4 interrupt matrix */
+
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+#define CLIC_FIRST_EXT_IRQ	16
+#define CLIC_LAST_EXT_IRQ	47
+#define INTMTX_NR_MAP_REGS	128
+#define INTMTX_MAP_MASK		GENMASK(5, 0)
+#define INTMTX_MAP_DISABLED	0
+#define INTMTX_V3_FIRST_EXTRA_SOURCE	133
+#define INTMTX_V3_LAST_EXTRA_SOURCE	135
+
+static const struct irq_chip esp32p4_intmtx_chip = {
+	.name		= "ESP32-P4 interrupt matrix",
+	.irq_mask	= irq_chip_mask_parent,
+	.irq_unmask	= irq_chip_unmask_parent,
+	.irq_set_type	= irq_chip_set_type_parent,
+};
+
+static int esp32p4_intmtx_domain_alloc(struct irq_domain *domain,
+				       unsigned int virq, unsigned int nr_irqs,
+				       void *arg)
+{
+	struct irq_fwspec *fwspec = arg;
+	struct irq_fwspec parent_fwspec = {
+		.fwnode = domain->parent->fwnode,
+		.param_count = 2,
+		.param[1] = IRQ_TYPE_LEVEL_HIGH,
+	};
+	unsigned int clic_irq;
+	int ret;
+
+	if (nr_irqs != 1 || !fwspec || fwspec->param_count != 2)
+		return -EINVAL;
+	if (fwspec->param[0] >= INTMTX_NR_MAP_REGS ||
+	    fwspec->param[1] != IRQ_TYPE_LEVEL_HIGH)
+		return -EINVAL;
+
+	/* The IRQ domain core serializes allocation across the hierarchy. */
+	for (clic_irq = CLIC_FIRST_EXT_IRQ; clic_irq <= CLIC_LAST_EXT_IRQ;
+	     clic_irq++) {
+		if (!irq_find_mapping(domain->parent, clic_irq))
+			break;
+	}
+	if (clic_irq > CLIC_LAST_EXT_IRQ)
+		return -ENOSPC;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, fwspec->param[0],
+					    &esp32p4_intmtx_chip, NULL);
+	if (ret)
+		return ret;
+
+	parent_fwspec.param[0] = clic_irq;
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
+}
+
+static void esp32p4_intmtx_set_route(void __iomem *base, unsigned int source,
+				     unsigned int clic_irq)
+{
+	void __iomem *reg = base + 4 * source;
+	u32 val = readl(reg);
+
+	writel((val & ~INTMTX_MAP_MASK) | clic_irq, reg);
+}
+
+static int esp32p4_intmtx_activate(struct irq_domain *domain,
+				   struct irq_data *data, bool reserve)
+{
+	esp32p4_intmtx_set_route(domain->host_data, irqd_to_hwirq(data),
+				 irqd_to_hwirq(data->parent_data));
+	return 0;
+}
+
+static void esp32p4_intmtx_deactivate(struct irq_domain *domain,
+				      struct irq_data *data)
+{
+	esp32p4_intmtx_set_route(domain->host_data, irqd_to_hwirq(data),
+				 INTMTX_MAP_DISABLED);
+}
+
+static const struct irq_domain_ops esp32p4_intmtx_domain_ops = {
+	.alloc		= esp32p4_intmtx_domain_alloc,
+	.free		= irq_domain_free_irqs_common,
+	.translate	= irq_domain_translate_twocell,
+	.activate	= esp32p4_intmtx_activate,
+	.deactivate	= esp32p4_intmtx_deactivate,
+};
+
+static int __init esp32p4_intmtx_init(struct device_node *node,
+				      struct device_node *parent)
+{
+	struct irq_domain *parent_domain, *domain;
+	void __iomem *base;
+	unsigned int source;
+
+	if (!parent)
+		return -ENODEV;
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain)
+		return -ENODEV;
+
+	base = of_iomap(node, 0);
+	if (!base)
+		return -ENOMEM;
+
+	/* Disconnect routes left by firmware before allocating IRQs. */
+	for (source = 0; source < INTMTX_NR_MAP_REGS; source++)
+		esp32p4_intmtx_set_route(base, source, INTMTX_MAP_DISABLED);
+
+	/* Skip the status and clock registers between routing banks. */
+	if (of_device_is_compatible(node, "esp,esp32p4-v3-intmtx")) {
+		for (source = INTMTX_V3_FIRST_EXTRA_SOURCE;
+			 source <= INTMTX_V3_LAST_EXTRA_SOURCE; source++)
+			esp32p4_intmtx_set_route(base, source, INTMTX_MAP_DISABLED);
+	}
+
+	domain = irq_domain_create_hierarchy(parent_domain, 0, 0,
+					     of_fwnode_handle(node),
+					     &esp32p4_intmtx_domain_ops, base);
+	if (!domain) {
+		iounmap(base);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+IRQCHIP_DECLARE(esp32p4_intmtx, "esp,esp32p4-intmtx", esp32p4_intmtx_init);
+IRQCHIP_DECLARE(esp32p4_v3_intmtx, "esp,esp32p4-v3-intmtx", esp32p4_intmtx_init);
-- 
2.56.1

