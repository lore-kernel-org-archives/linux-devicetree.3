Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F8243F0B3
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315565; cv=none; b=MSRg4d4/3hQe57H4zkQy647/7Br1e1G7VCa/Fv2G8Nrsup1D1xhSZBWrfIZ4jJAtd1vo/Ng6dmN5NX+0ed+GHzv7dcJ6iP3PXtxyd+7Q2eRd1dqTDf2FIZPEfXss5yN5oIE1ptAu1hUnsuukVFbd7zV7GaVZZ/tt+mCli/zTNGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315565; c=relaxed/simple;
	bh=gKiwoRAVkwSb51690zXpkoQfU8oJGnmscZAj9YbiCU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWdik/H4VumL/yvGz2PKhNgzFosi3lw6/Lmdi5179qKgDLDNaXNG/uktYEg7VOtOBxt7HYrNA0jHwiSKQsFT09+NL8AYkjzVmYx8BTtt2kRCyJFXUgAO8ZTNyMUQCKheO11yc2KxlNHXvFqYIYPvE0YD3CrF0Nk7dR+89Cm5daM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbEuGsJI; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbEuGsJI"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb662575d3so376783a12.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785315563; x=1785920363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGKG5vGqvxPWnfZeW+tOz0OJKir7eiBHOsJj6jpBMt0=;
        b=JbEuGsJIuYy9/drxLsMBvNMT+eRBywG+fTw5tEDMk/LMqNeIVN4558RHWPtm5ph881
         80BjR03VLMxiDaScOUkiapd2c8dAf3/pHNR2xOVeO+EM7TIDT4jBG1IeJcQJ+weIREIv
         zkL4xorEJCXxuhd0mo/nkRs2de3eH3n4Cs3GR79cXyz2MnwsojhlXhQl5WGn1I136AyP
         SjrUn4vZbhprF1AVCoiMXRZUmRR6k3izHcsPea8L9kgfZ42I4496hLQiDmuQqjOPy9M5
         l7Dn80e3qsWFLvJwxzTjglI+FOszqG4sRE3icDjHCsfY6gD3roXmK3ml5IHsArzW/XSM
         52cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315563; x=1785920363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eGKG5vGqvxPWnfZeW+tOz0OJKir7eiBHOsJj6jpBMt0=;
        b=QulUY45jZwHUTnJIa/PPUiDGCk8+Bd0qgoleX7q5y+PfMM9iahCDB2YfEioM8KGZA9
         wxd63BrE2YubzXtNfbi+sLQ9629txAijMbizJQIqVUn7U4MydW8HPiJnZpLnrt3VdVRU
         Ysa6feDxeVGDcdi+Q6lPGGLiWQ3SkvLbbc7EjGGUCwgf66WR4mVo7l9GXzgSiRIHbxKV
         dQsePF+dDUngLZ2wRF+4ow79nK0uXUrY9xQ1unODsrpThVAEQa1DyEvwjRBg0Js6U5C1
         XRD4FB8ai0mkhrTMmKyisFWPKtvo/r0Mx+hQgPwhaECtk+maW47zAylr6XCKqJFTznb0
         5xSw==
X-Forwarded-Encrypted: i=1; AHgh+RoskLhrovekqCunnQUgicjNmGBfGx0ex0V91HZPTnSPTwBiixnFCwfMyKFVUeAYhXUaq2EZvmQCSigU@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLQuvaaaHIUTaQ3k4sVPtek0XJmnQH2+xmuTVVCYNmPGARgHV
	1yK257mQFTPPgtuekWPFjSO2fGvc4HMwi1uj1IsQQMnA+LbhKXN8EcPQ
X-Gm-Gg: AR+sD13ESJ4r3KreeYP5Uson8qMBQDBL1MV/Rgk6krdZtwSHlG7n6j1Y0BYUF3ODysU
	8W+yCLqcpphI/wH464ZUa9ea3+rQ4HKY4c2eESonQ8QWXoLTuWl+zmejKy6H+wDDleIqCnQzJI6
	sLvxlNJu1mvJqBw8hHoVGU2g1wdiQGXPXKMKh6GtMtXijRdd/z0rvFllAiHQweuD7DoJNAVndcI
	s4u4j7v6FiBCybyRqdVa2IJfrFUfUwToyZdQ31uXKl0AKuOS7DuKAcyLx7oebHfvVaDMqo920vY
	MD/5LzaJJKunaMENV9lOPi/ASXxMCrg/w7a01VTqgY3bm8THlbCspG420LlL8Na5zIIpfllngEs
	WOYcS5anFo/are96vLV9g8bswnepHZaAeeOTAwfRNLnzcZ0TyT3KzjdonkD/3090OMkNnNxMeaZ
	c6qcsTFCa2YRkstld9R8r4V9/fbyC3bdgUIG24i9+9OWN7JDPX4pOT+c3XAmg/06X3cxo=
X-Received: by 2002:a05:6a21:44c8:b0:3c4:2cf9:2898 with SMTP id adf61e73a8af0-3c8ba5cdf2bmr6772062637.45.1785315562534;
        Wed, 29 Jul 2026 01:59:22 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm8179352eec.14.2026.07.29.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:59:22 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 2/2] nvmem: rockchip-efuse: add write support with optional VQPS supply gating
Date: Wed, 29 Jul 2026 14:28:56 +0530
Message-ID: <20260729085856.226001-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729085856.226001-1-hrushirajg23@gmail.com>
References: <20260729085856.226001-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement write support for RK3399 eFuse using A_PGM programming mode,
and gate write access on the presence of an optional "vqps" regulator.

eFuse programming requires the VQPS supply (1.8V~1.98V per RK3399 TRM)
to be active only during write operations and kept at 0V during reads.
To support this:
  - Probe uses devm_regulator_get_optional() for the "vqps" supply.
  - If "vqps" is present, the driver registers write support. If absent,
    the driver leaves the device read-only to prevent unsafe write.
  - In rockchip_rk3399_efuse_write(), VQPS is enabled prior to the A_PGM
    strobe programming loop and disabled immediately after.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/nvmem/rockchip-efuse.c | 178 ++++++++++++++++++++++++++++-----
 1 file changed, 153 insertions(+), 25 deletions(-)

diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efuse.c
index 013e67136f3b..3bde09236c74 100644
--- a/drivers/nvmem/rockchip-efuse.c
+++ b/drivers/nvmem/rockchip-efuse.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -37,12 +38,16 @@
 #define RK3399_NBYTES		4
 #define RK3399_STROBSFTSEL	BIT(9)
 #define RK3399_RSB		BIT(7)
+#define RK3399_PS		BIT(4)
 #define RK3399_PD		BIT(5)
 #define RK3399_PGENB		BIT(3)
 #define RK3399_LOAD		BIT(2)
 #define RK3399_STROBE		BIT(1)
 #define RK3399_CSB		BIT(0)
 
+/* Program time per TRM Section 21.1: 12us +/- 1us; use 15us for margin */
+#define RK3399_PGM_TIME_US	15
+
 #define REG_EFUSE_CTRL		0x0000
 #define REG_EFUSE_DOUT		0x0004
 
@@ -50,6 +55,17 @@ struct rockchip_efuse_chip {
 	struct device *dev;
 	void __iomem *base;
 	struct clk *clk;
+	struct regulator *vqps;
+};
+
+/**
+ * struct rockchip_efuse_soc_data - per-SoC efuse callbacks
+ * @reg_read:  mandatory read callback
+ * @reg_write: optional write callback; NULL means read-only
+ */
+struct rockchip_efuse_soc_data {
+	int (*reg_read)(void *ctx, unsigned int offset, void *val, size_t bytes);
+	int (*reg_write)(void *ctx, unsigned int offset, void *val, size_t bytes);
 };
 
 static int rockchip_rk3288_efuse_read(void *context, unsigned int offset,
@@ -177,6 +193,7 @@ static int rockchip_rk3399_efuse_read(void *context, unsigned int offset,
 	writel(RK3399_LOAD | RK3399_PGENB | RK3399_STROBSFTSEL | RK3399_RSB,
 	       efuse->base + REG_EFUSE_CTRL);
 	udelay(1);
+
 	while (addr_len--) {
 		writel(readl(efuse->base + REG_EFUSE_CTRL) | RK3399_STROBE |
 		       ((addr_start++ & RK3399_A_MASK) << RK3399_A_SHIFT),
@@ -203,48 +220,128 @@ static int rockchip_rk3399_efuse_read(void *context, unsigned int offset,
 	return 0;
 }
 
-static struct nvmem_config econfig = {
-	.name = "rockchip-efuse",
-	.add_legacy_fixed_of_cells = true,
-	.type = NVMEM_TYPE_OTP,
-	.stride = 1,
-	.word_size = 1,
-	.read_only = true,
+/**
+ * rockchip_rk3399_efuse_write - program fuse bits on RK3399 (A_PGM mode)
+ * @context: pointer to rockchip_efuse_chip
+ * @offset:  byte offset in the efuse space
+ * @val:     data to write (only set bits are programmed; OTP cannot clear)
+ * @bytes:   number of bytes
+ *
+ * Each bit is programmed individually using a hardware-timed STROBE pulse.
+ * The caller must ensure VQPS (1.8V~1.98V) is present during the write.
+ * Per TRM Section 21.6, only one bit is programmed per STROBE cycle.
+ */
+static int rockchip_rk3399_efuse_write(void *context, unsigned int offset,
+				       void *val, size_t bytes)
+{
+	struct rockchip_efuse_chip *efuse = context;
+	u8 *buf = val;
+	int ret;
+
+	ret = clk_prepare_enable(efuse->clk);
+	if (ret < 0) {
+		dev_err(efuse->dev, "failed to prepare/enable efuse clk\n");
+		return ret;
+	}
+
+	ret = regulator_enable(efuse->vqps);
+	if (ret < 0) {
+		dev_err(efuse->dev, "failed to enable vqps regulator\n");
+		clk_disable_unprepare(efuse->clk);
+		return ret;
+	}
+
+	while (bytes--) {
+		u8 byte = *buf++;
+		int bit;
+
+		for (bit = 0; bit < 8; bit++) {
+			u32 addr, ctrl;
+
+			if (!(byte & BIT(bit)))
+				continue;
+
+			addr = offset * 8 + bit;
+
+			/*
+			 * A_PGM mode (TRM table 23-3):
+			 * CSB=L, PGENB=L, PS=H, PD=L, LOAD=L, RSB=L,
+			 * STROBSFTSEL=H (software controls STROBE)
+			 * STROBE is asserted separately below.
+			 */
+			ctrl = RK3399_STROBSFTSEL | RK3399_PS |
+			       ((addr & RK3399_A_MASK) << RK3399_A_SHIFT);
+
+			writel(ctrl, efuse->base + REG_EFUSE_CTRL);
+			udelay(1);
+
+			/* Assert STROBE to program the selected bit */
+			writel(ctrl | RK3399_STROBE, efuse->base + REG_EFUSE_CTRL);
+			udelay(RK3399_PGM_TIME_US);
+
+			/* Deassert STROBE */
+			writel(ctrl, efuse->base + REG_EFUSE_CTRL);
+			udelay(1);
+		}
+
+		offset++;
+	}
+
+	/* Return to standby mode: PD=H, CSB=H */
+	writel(RK3399_PD | RK3399_CSB, efuse->base + REG_EFUSE_CTRL);
+
+	regulator_disable(efuse->vqps);
+	clk_disable_unprepare(efuse->clk);
+
+	return 0;
+}
+
+static const struct rockchip_efuse_soc_data rk3288_efuse_data = {
+	.reg_read = rockchip_rk3288_efuse_read,
+};
+
+static const struct rockchip_efuse_soc_data rk3328_efuse_data = {
+	.reg_read = rockchip_rk3328_efuse_read,
+};
+
+static const struct rockchip_efuse_soc_data rk3399_efuse_data = {
+	.reg_read  = rockchip_rk3399_efuse_read,
+	.reg_write = rockchip_rk3399_efuse_write,
 };
 
 static const struct of_device_id rockchip_efuse_match[] = {
 	/* deprecated but kept around for dts binding compatibility */
 	{
 		.compatible = "rockchip,rockchip-efuse",
-		.data = (void *)&rockchip_rk3288_efuse_read,
+		.data = &rk3288_efuse_data,
 	},
 	{
 		.compatible = "rockchip,rk3066a-efuse",
-		.data = (void *)&rockchip_rk3288_efuse_read,
+		.data = &rk3288_efuse_data,
 	},
 	{
 		.compatible = "rockchip,rk3188-efuse",
-		.data = (void *)&rockchip_rk3288_efuse_read,
+		.data = &rk3288_efuse_data,
 	},
 	{
 		.compatible = "rockchip,rk3228-efuse",
-		.data = (void *)&rockchip_rk3288_efuse_read,
+		.data = &rk3288_efuse_data,
 	},
 	{
 		.compatible = "rockchip,rk3288-efuse",
-		.data = (void *)&rockchip_rk3288_efuse_read,
+		.data = &rk3288_efuse_data,
 	},
 	{
 		.compatible = "rockchip,rk3368-efuse",
-		.data = (void *)&rockchip_rk3288_efuse_read,
+		.data = &rk3288_efuse_data,
 	},
 	{
 		.compatible = "rockchip,rk3328-efuse",
-		.data = (void *)&rockchip_rk3328_efuse_read,
+		.data = &rk3328_efuse_data,
 	},
 	{
 		.compatible = "rockchip,rk3399-efuse",
-		.data = (void *)&rockchip_rk3399_efuse_read,
+		.data = &rk3399_efuse_data,
 	},
 	{ /* sentinel */},
 };
@@ -252,20 +349,26 @@ MODULE_DEVICE_TABLE(of, rockchip_efuse_match);
 
 static int rockchip_efuse_probe(struct platform_device *pdev)
 {
-	struct resource *res;
-	struct nvmem_device *nvmem;
+	const struct rockchip_efuse_soc_data *soc_data;
 	struct rockchip_efuse_chip *efuse;
-	const void *data;
+	struct nvmem_device *nvmem;
+	struct nvmem_config econfig = {
+		.name              = "rockchip-efuse",
+		.add_legacy_fixed_of_cells = true,
+		.type              = NVMEM_TYPE_OTP,
+		.stride            = 1,
+		.word_size         = 1,
+	};
+	struct resource *res;
 	struct device *dev = &pdev->dev;
 
-	data = of_device_get_match_data(dev);
-	if (!data) {
+	soc_data = of_device_get_match_data(dev);
+	if (!soc_data) {
 		dev_err(dev, "failed to get match data\n");
 		return -EINVAL;
 	}
 
-	efuse = devm_kzalloc(dev, sizeof(struct rockchip_efuse_chip),
-			     GFP_KERNEL);
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
 	if (!efuse)
 		return -ENOMEM;
 
@@ -278,12 +381,36 @@ static int rockchip_efuse_probe(struct platform_device *pdev)
 		return PTR_ERR(efuse->clk);
 
 	efuse->dev = dev;
+
 	if (of_property_read_u32(dev->of_node, "rockchip,efuse-size",
 				 &econfig.size))
 		econfig.size = resource_size(res);
-	econfig.reg_read = data;
-	econfig.priv = efuse;
-	econfig.dev = efuse->dev;
+
+	econfig.reg_read = soc_data->reg_read;
+	econfig.priv     = efuse;
+	econfig.dev      = dev;
+
+	/*
+	 * Enable write support only when a VQPS programming supply is
+	 * described in the device tree. Its presence is the hardware
+	 * declaration that irreversible OTP programming is intended on
+	 * this board. VQPS must be 0V during reads (the regulator is
+	 * only enabled inside the write callback).
+	 */
+	if (soc_data->reg_write) {
+		efuse->vqps = devm_regulator_get_optional(dev, "vqps");
+		if (!IS_ERR(efuse->vqps)) {
+			econfig.reg_write = soc_data->reg_write;
+		} else if (PTR_ERR(efuse->vqps) == -ENODEV) {
+			efuse->vqps = NULL;
+			dev_dbg(dev, "vqps supply absent, write support disabled\n");
+		} else {
+			return PTR_ERR(efuse->vqps);
+		}
+	}
+
+	econfig.read_only = !econfig.reg_write;
+
 	nvmem = devm_nvmem_register(dev, &econfig);
 
 	return PTR_ERR_OR_ZERO(nvmem);
@@ -300,3 +427,4 @@ static struct platform_driver rockchip_efuse_driver = {
 module_platform_driver(rockchip_efuse_driver);
 MODULE_DESCRIPTION("rockchip_efuse driver");
 MODULE_LICENSE("GPL v2");
+
-- 
2.47.3

