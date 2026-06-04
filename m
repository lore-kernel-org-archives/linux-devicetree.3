Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969247ECD2
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581181; cv=none; b=eTFgKU5rax72gTs//VGiafae0SxN2w278scFJp12rYTPIhpfhEMEhkkaQOCDGEC1hLmBu1ldfYfhpmx5tHwrP4Dr9uswOzJ4cCYtuMtYdaEL8oiyPbEODd0wE6tXhRdntFn2hbwa++4cD5lipy0JlVmOkkrb9u1zRLeSB06+Ji0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581181; c=relaxed/simple;
	bh=DzZKakHuN52Xow3vnp9cNnLc4W+yXF/Ljm2JhcvRG7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aNnnxwFG1vk1O+TPjmdRRa5J+bH5a5XtS3PB/mjxe2X3ML+oKN/Jft2TGrJEf+3CX3vq6MtheybVs23mJT1wEj/h+sB1PADEJe/8+9aKQtOXCXmEYCsSs2s8ZxAMQvA5x+TcQfxevxOmmd6TgnWnvhLMQl+HR/SSG7P9xHEWZtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckdwN6Kt; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckdwN6Kt"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef82204c6so426081f8f.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581178; x=1781185978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoHc1Zlbr3pNOE70Y4k5QiMyrmoz//QwwHMvtTDGYPc=;
        b=ckdwN6Ktj/9wzI+zSYeC2d6K+i3sDLHsIZ4eBq8IUsc7Hhbkg5/uQIgPq/EPZApvwS
         rF200sgwSNhB0v5GYT2U26JVtx6uK3BTbK6H4NbElILuC+TJlSSPHcUNegoXYnaYQwGd
         qyiKnlwMZtY5ZeybznA2tWEQ1i97ocJ0intstECuntT3giDLDeshdKXBEBVdQwkdxwgq
         m+DsW24HJeR19m67SpQBTiEGlBzG3f6ZOQFD6+0s4X5LpMKqKEeBhxlGpgpfD7Zo9OPj
         GAvCaNbPlvT0i3BezDHb2Tbk1G8f6I6yy8OY6B8S2vFLsS4y80CXX1N3MZfrW7O7Nvhf
         sxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581178; x=1781185978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CoHc1Zlbr3pNOE70Y4k5QiMyrmoz//QwwHMvtTDGYPc=;
        b=ISCPpMTJViwzHnR0XUQLL1BrG01DlWHlXAfmbzGfv9For3EQyn1mnMZl7nI54ZBRKH
         mlAtmcVFGdNTJPBtWKICbK7GoGNxmgG5hnuAUnu0z6B94Z11kVe0DCRMNTlesL1A7qaB
         69QbssTtE9kZUpLAhx9rp/1FCIn3GQl4GHpMaYjSoEtkdjVTWCVHuAlmmAJKcRjoShVi
         0FV514pKMIMVg/03/ZFFWw1S8oUFdSSXqxISLBpzqRjBQCwUbXYmASo+RPfVGOsrdJlj
         LE59kNcG0Mgfw32Xy5yR03JwGSCagdx5zm/WQCxShBDuweWnfN9F1Sa/LqOAYXJV3WPb
         0T/g==
X-Forwarded-Encrypted: i=1; AFNElJ+qTIrx7sB9OwtE6RzlPBct5xYceOyvW4oxpqujji3oIjuRmObyAuprm1AFzS87T1ZYqOCaGEmoixcR@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZ6r7SCzx37RTLcgso/RuTwtXnlXS7yqRyPSXgzoD6FQJh5vm
	wLiuDAvFu8Tmfbus24DiqhC0nYXK54VD64hmJ8YyZIYXOx2FyomLym1H
X-Gm-Gg: Acq92OFgdenKQtblTtagAP4sOkkKVjUcpXoHZirlcv7bZdmFMIN0gnJfkU7BoCNmXLx
	ZEs2nfnqVsT+RkoDnCspUXQxDne8geQxxkBi3aBuOQU/+oRYYIsbZBg2tLpEF2+ww8wcZ2xUtAx
	oewT7EgXqzXc/S2Hb9B8HS5awzsTUnJy+vYuUFKS/7iuVdrOT5tZJhFzQlMf65qWVb00GDJf4pw
	yzl0sojBGe3Iy5uAq9UqZLDdpiTuonHzH4NwCAouSQ/hbfgJVv9Op/vbciXnYP17su45PzIiyRu
	GdfVZip6k3jRyBgqmoNsdITWNHNaQWPcPcpjXPLT+qHQmcaEJ98MD7Uh7VmIr6R1Sjvk6LGZ57q
	P0ie4D4vHTF59Jk2xR7UXKdfuwTvZRuYSdkFmCRN61X9tKWI4PDhdm6j9NSJDd5JD/jJYfAeO47
	aAdh95GSVxfi/99EPa8bieFTSW2KrEaD+LO6l9/r/L6yZg1DpzvCCmCWIjdy4MW7w=
X-Received: by 2002:adf:f8c4:0:b0:460:e0f:8d19 with SMTP id ffacd0b85a97d-4602179121cmr10232727f8f.9.1780581177846;
        Thu, 04 Jun 2026 06:52:57 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:52:57 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 1/9] accel: rocket: Introduce per-SoC rocket_soc_data
Date: Thu,  4 Jun 2026 13:52:47 +0000
Message-Id: <20260604135255.62682-2-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a per-SoC data structure carried in the OF match table, currently
holding only the NPU AXI address width, and use it for the per-core DMA
mask instead of a hardcoded 40-bit value.  No functional change: the
RK3588 AXI master is 40-bit.  This prepares for SoCs with a narrower
address width.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.c |  7 ++++++-
 drivers/accel/rocket/rocket_core.h | 11 +++++++++++
 drivers/accel/rocket/rocket_drv.c  |  6 +++++-
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index b3b2fa9ba645a..09c445af7de73 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -7,6 +7,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/iommu.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -21,6 +22,10 @@ int rocket_core_init(struct rocket_core *core)
 	u32 version;
 	int err = 0;
 
+	core->soc_data = of_device_get_match_data(dev);
+	if (!core->soc_data)
+		return dev_err_probe(dev, -EINVAL, "missing SoC match data\n");
+
 	core->resets[0].id = "srst_a";
 	core->resets[1].id = "srst_h";
 	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(core->resets),
@@ -52,7 +57,7 @@ int rocket_core_init(struct rocket_core *core)
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(core->soc_data->dma_bits));
 	if (err)
 		return err;
 
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d7382854ca9..8ee105a0be40e 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -12,6 +12,16 @@
 
 #include "rocket_registers.h"
 
+struct rocket_core;
+
+/**
+ * struct rocket_soc_data - per-SoC configuration data
+ * @dma_bits: Physical address width reachable by the NPU's AXI master.
+ */
+struct rocket_soc_data {
+	unsigned int dma_bits;
+};
+
 #define rocket_pc_readl(core, reg) \
 	readl((core)->pc_iomem + (REG_PC_##reg))
 #define rocket_pc_writel(core, reg, value) \
@@ -31,6 +41,7 @@ struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
 	unsigned int index;
+	const struct rocket_soc_data *soc_data;
 
 	int irq;
 	void __iomem *pc_iomem;
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594883e..384c38e13acce 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -213,8 +213,12 @@ static void rocket_remove(struct platform_device *pdev)
 	}
 }
 
+static const struct rocket_soc_data rk3588_soc_data = {
+	.dma_bits = 40,
+};
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "rockchip,rk3588-rknn-core" },
+	{ .compatible = "rockchip,rk3588-rknn-core", .data = &rk3588_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.39.5

