Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8037C0F8
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 06:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781333911; cv=none; b=AeaW1L1V6BMKULDshuRvsSSgx2xuZ+Lt7EaSnf6bTGHpb2c1xpaDygu1ijLqJkGLyZJso7NrH4mMNDqe8DAc7KzrSl1CpnwpoJtAhdb9h+/JWQlNxCzfLkrvX1bD+lCZSlsbjtWqsd5xNW4QjcNtMJgpK+xcvmdVT8uAYlx1MRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781333911; c=relaxed/simple;
	bh=YKShoX65LVO0XZhx3YTVduiOdaRxm/z7AzofXLKM1PE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d0uABx+bpEn47ICeuh3uVp/D/McGKzzVwxvPkj0qYxpKIYJiCalkgiZp50mHqGEDtUGo7DbGZoZIT1Kf2CM3xQ7o8/WXCV4B6FldpEmeVj+9KTwRqsC7CW3M/NUYMO3kBIYqwTNCUbseI+EvpBV8j7pMULUrj3QMQJiYSizO44E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtje2r34; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtje2r34"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso12836955e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 23:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333908; x=1781938708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRmyPRAFuevqTsUvI5TWwwBpkZJdoLOQStZBNs50ckM=;
        b=gtje2r34nGf6Ux1i4txK6XDzhWkhx+5xcM7gooQ8QPO6FpQtn6d60L81Y2rgnjpNia
         bm/kjq2C8pMxApJ/0CGSlM8VyqlAW19AdB50r4+TtKKNSk4nsUCL4/qLW2991LYPu+K9
         looZMbRUmnNm2XoBazkl2JoK7uwadtsPN9KyMtpe6BHCwnR+j4kLkhYjnablj/lFRbhk
         40biEOi1gALyyfZfbaGyYN757k7xGt8oKwr8fd81kviq/FNW68W5ld/pLJIFkQy/l+R+
         6U8LBNshVFIt9lvsozUiSbZlUGQQKe0OiOnSFChQuZYagJYag1Wg+A9RUPiI2ZUAF/VH
         huCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333908; x=1781938708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CRmyPRAFuevqTsUvI5TWwwBpkZJdoLOQStZBNs50ckM=;
        b=BOtoHw7t2EstciC4nFmhUE8eEv7wwNWQyQd1F4DazQ5/FAVUlC9QeZSVsvMdan2MF5
         P3rMeHh2ascL8pkWliir9o+jHmgyEKpi1Ac4K/R+oFWLltoAii9NFzvvovcvR/jWKmry
         8Jn4xfa0bRV39oBLYYx+JNZLvWnLtDRGZ9PPWzeYTCAgmg8bDMbxw4f0w3y9BICgkq4X
         gySCr6E5ROCLlFjU4lmZbDlbkntS6ZXTceGtE9eNyC7bl9nA9/TAFm/kDZdonjmOI18k
         MAHyA7TEIbrzaumDVXLeppDH0GOxonAep09H7fTBBn04TfgmZIcOZ3QPP5ciKOnu6jTB
         nS7g==
X-Forwarded-Encrypted: i=1; AFNElJ/QBfnbspxPsjQcmOm1T0dO2aIr4N9MVV9juFlVVIlkjqeMDg29E2w6s8MTFk4JIACkOdXJBckWzFRy@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/mAATUhw36YG7HuiBg6WbpAh70Wq1VGtF5mmn2wvZZnKVW1+
	iTPICHUYSk3EFEIPowwyMClLW3ki4VUxUjSy1UK/eea3b6DObuV+M85d
X-Gm-Gg: Acq92OF25cH1Ue9jY1pFzCd69JbVh3iAYoPHv5Etx0uxoZ8zF74Ll64RgeAiz1/9duh
	Qh0yE/qXOb2oMeMgDUOqn8UNO+9VsPmm/mJpgFgJu+4RrJyCz7Kr3zDdmvf2cDCYAcNKljmTVKb
	6ZqZnBHt3SzHmia+ycyxLew5oB8Rqi9fe/z9NpT9+uQTiJ+/5nUbmwlbREU6n33vc70js4rSyn0
	DSK6Waucr5s27DSiF19eaReN7I0/fi3NDkhOBai722HDX+cCn8jgbHBg5RmNrYaCrD3A+1bAyTN
	Gr3pQX8/FyzOB/vntdv9Z4cuMhSsQDT9jc55rhrMZfOhykQNIzDdY30rqr4xoWIV38Qjqjb3B4M
	dca42KiX2fyqJEH9/i/kgzEFM2wZby/WsoDwe1Vvuw8U+bTBLZMouQFJ1h3kv9/t6cxe4gxpUkD
	j+IvvLEV/d1nqJT5R9b7iXJseKktcjytvaybwFYF6Euw==
X-Received: by 2002:a05:600d:8489:20b0:490:b724:507d with SMTP id 5b1f17b1804b1-490ec4cec11mr54479185e9.11.1781333908035;
        Fri, 12 Jun 2026 23:58:28 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:27 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 2/9] accel: rocket: Derive DMA width and core count from match data
Date: Sat, 13 Jun 2026 09:01:09 +0200
Message-Id: <20260613070116.438906-3-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Midgy BALON <midgy971@gmail.com>

The probe already has the per-SoC match data, which now records the core
count and DMA width.  Use it for the cores array allocation and the
device DMA mask instead of re-scanning the device tree for available core
nodes.

While at it, reject a device tree that declares more NPU core nodes than
the SoC has, so the fixed-size cores array can never be overrun.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.h   |  2 ++
 drivers/accel/rocket/rocket_device.c | 15 +++++----------
 drivers/accel/rocket/rocket_device.h |  3 ++-
 drivers/accel/rocket/rocket_drv.c    | 13 ++++++++++++-
 4 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index 8ee105a0be40e..d6421251670dc 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -16,9 +16,11 @@ struct rocket_core;
 
 /**
  * struct rocket_soc_data - per-SoC configuration data
+ * @num_cores: Number of NPU cores in this SoC.
  * @dma_bits: Physical address width reachable by the NPU's AXI master.
  */
 struct rocket_soc_data {
+	unsigned int num_cores;
 	unsigned int dma_bits;
 };
 
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 46e6ee1e72c5f..6186f4faa3a2a 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -6,18 +6,16 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
 
 #include "rocket_device.h"
 
 struct rocket_device *rocket_device_init(struct platform_device *pdev,
-					 const struct drm_driver *rocket_drm_driver)
+					 const struct drm_driver *rocket_drm_driver,
+					 const struct rocket_soc_data *soc_data)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *core_node;
 	struct rocket_device *rdev;
 	struct drm_device *ddev;
-	unsigned int num_cores = 0;
 	int err;
 
 	rdev = devm_drm_dev_alloc(dev, rocket_drm_driver, struct rocket_device, ddev);
@@ -27,17 +25,14 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 	ddev = &rdev->ddev;
 	dev_set_drvdata(dev, rdev);
 
-	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
-		if (of_device_is_available(core_node))
-			num_cores++;
-
-	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
+	rdev->cores = devm_kcalloc(dev, soc_data->num_cores, sizeof(*rdev->cores),
+				   GFP_KERNEL);
 	if (!rdev->cores)
 		return ERR_PTR(-ENOMEM);
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(soc_data->dma_bits));
 	if (err)
 		return ERR_PTR(err);
 
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index ce662abc01d3d..2f74e078974e3 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -22,7 +22,8 @@ struct rocket_device {
 };
 
 struct rocket_device *rocket_device_init(struct platform_device *pdev,
-					 const struct drm_driver *rocket_drm_driver);
+					 const struct drm_driver *rocket_drm_driver,
+					 const struct rocket_soc_data *soc_data);
 void rocket_device_fini(struct rocket_device *rdev);
 #define to_rocket_device(drm_dev) \
 	((struct rocket_device *)(container_of((drm_dev), struct rocket_device, ddev)))
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 384c38e13acce..f0beed2d522c7 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -159,11 +159,15 @@ static const struct drm_driver rocket_drm_driver = {
 
 static int rocket_probe(struct platform_device *pdev)
 {
+	const struct rocket_soc_data *soc_data = of_device_get_match_data(&pdev->dev);
 	int ret;
 
+	if (!soc_data)
+		return -EINVAL;
+
 	if (rdev == NULL) {
 		/* First core probing, initialize DRM device. */
-		rdev = rocket_device_init(drm_dev, &rocket_drm_driver);
+		rdev = rocket_device_init(drm_dev, &rocket_drm_driver, soc_data);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to initialize rocket device\n");
 			return PTR_ERR(rdev);
@@ -172,6 +176,12 @@ static int rocket_probe(struct platform_device *pdev)
 
 	unsigned int core = rdev->num_cores;
 
+	if (core >= soc_data->num_cores) {
+		dev_err(&pdev->dev, "too many NPU core nodes (max %u)\n",
+			soc_data->num_cores);
+		return -EINVAL;
+	}
+
 	dev_set_drvdata(&pdev->dev, rdev);
 
 	rdev->cores[core].rdev = rdev;
@@ -214,6 +224,7 @@ static void rocket_remove(struct platform_device *pdev)
 }
 
 static const struct rocket_soc_data rk3588_soc_data = {
+	.num_cores = 3,
 	.dma_bits = 40,
 };
 
-- 
2.39.5

