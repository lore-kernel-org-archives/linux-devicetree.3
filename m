Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D96436BD2
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113292; cv=none; b=LTI/YN5mFGYOkkzIcnFAGbA9A0mPeeqbVtTH1cZQ+EcYhf10UeJoiCr2daXNtryPDJR3MQ8LjaenkZgF/hytVDvW8IwBBs+78DcFdqqX8uPf5P5jLRnsMMdb2q+VzGJBJrCELiCCyWStLj+hxb2pYXaHOj08Tvc+SGCy4H4bAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113292; c=relaxed/simple;
	bh=lPtctcSC8Ig3099sW+2rH3FHtRLk8ejfqSVuxDcHY+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DoZrvz2aZgN1X/rg0It4VtcZZL/k6u7mNzJbTWA/yiTb1fp6mDSU9+/eCYSWa3tFHYkV+DZ3Z+8OEV3ER2jLqTwyo99Lw4VTEJSnkPocs0fVq4Tg6IRalk7p7jFGR27WUCK9vxoazWRfkYvem8P5lHVx6+R/Mpwg4EN/kUFXqow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwGm+kk+; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwGm+kk+"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7ff05e5d009so70530487b3.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113290; x=1784718090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppclwzo4aR4SJ35tDOFzdwKD6tEwsXd178wGH4GBW3o=;
        b=kwGm+kk+qyZ5ME777C1mhHo0vJ5V6b0Y9GpL8JLe89gRULYWQ+/ZzF1C9gAp67UNDm
         Ew0K8scGNsPQxgdQeTdrolzJYyCigF9Qz7HUA2yV9mzt7NgeUcd80YVX9k6/5o0U4OSA
         pfgId+FfoLsv4eP36iHmd3KKTAAbkARF3JsN8KNQbnKr7Ulr7Z20bLF9gYilZ82lowwC
         /88d7g30S4QnyhHWWAs2ktY3/FppbfpCFloGXQ/i2+tevz99a+JgTGUIyCYPiHw/T9nn
         1Z1pOJlYLdX9R6HFIWdyRs/TXCz1kw0CxovoVzO2UDe6eXx2/drii5UT4veJAHiAsX8Q
         tWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113290; x=1784718090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppclwzo4aR4SJ35tDOFzdwKD6tEwsXd178wGH4GBW3o=;
        b=RMdrJakkzWYIOMLTRtNs4hLBG8gqgvlMSwFSIK4Y2aKpYWeHhHVhXiTbD+v8snIr+X
         7fCuQuyxILoZYsJkzVRxXEwRQTwMrtVd0bDdAjXh2hBHeQF4BHcYb5msQQZCeB4oIGN7
         eEJ8oVMUY8L0hI4hjcbwPiG73DYOnIB3blu6vj5/oOOi70cU8HgAY0dHf45OVEB207bl
         6HnlWYiFo5gD3zojTPk7TS9Qwfw71QGoH0FmPw94Wk2gfdNlIrZKYPo+fLRsH1fQdHVk
         cO++W2UDY8dWqZlaPNqKtXunY3DmYX8zNCTfPQy3F8s3/2kYYSaLsYwmgIn/Qqsu7+IO
         MItw==
X-Forwarded-Encrypted: i=1; AHgh+RrtjWTijHp5wU789pMMz/hkus/bjNmhHTUeRrR+fJfd6/RFA/DddNe/oPbBabjvlgsFfXjsC78jYcQo@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvzQJZDtYtNq6WHd0Y/kr15O1RVrybx/w+W76NKx5Duezwg2h
	hze3ECk3dr5yYDjBYJ7WJ2RAAOnzXmYRDqWon+MGsfzFo1I48TMJfVJg
X-Gm-Gg: AfdE7cmGMvRoIxlP6/YZmd5GuDdlMkw9aiy4dePSfuQrI+0PtiZzdiRd4RaebUExc4x
	WBiwgq4b/fsqqItvfOnN+NKnrJ8e0RDcpcrRrIuUpXBakz5S/oCIidQEw6Y7dx0XugUcudCElHa
	0JBvCgkLb0aN9mTC8u9oNBBK2SrMc/5+476Sx1rO1O8jjJrf0o3jgDET9G+ugDmkIoVDu0QqHHN
	HISaDGAZ5Nc/ED+efqGV19Zd2kYodviJ37yNwaFMU4CobZYahHRzRf3Nv5+MvHdPtKXpHjUfOnR
	c09m5bKffiIhJ1Jqs/uY95HkbZmYT3ESIOUdf9V8bZWkn/BLrXDXsvXfDBZXezPGJIBJyuAsQ7s
	L1/W0nXcKQ73n765Z8Uk+8EaC9RFmRcaqmcZpuC42Pg1sSErxb6gAQ0H9KOp689CTd37XU1ezSz
	crEXcRTvmF7QrD90OBCTEO
X-Received: by 2002:a05:690e:2002:b0:667:8b90:2ee5 with SMTP id 956f58d0204a3-668078a5e8fmr3034463d50.96.1784113289880;
        Wed, 15 Jul 2026 04:01:29 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fbd8c5esm59066d50.3.2026.07.15.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:01:29 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 2/2] nvmem: rockchip-efuse: add write support for RK3399
Date: Wed, 15 Jul 2026 16:31:07 +0530
Message-ID: <20260715110107.409204-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715110107.409204-1-hrushirajg23@gmail.com>
References: <20260715110107.409204-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement rockchip_rk3399_efuse_write() using the Array Program Mode
(A_PGM) as described in the RK3399 TRM. Each bit is programmed
individually by asserting STROBE for 15us with the target bit address
set in the EFUSE_CTRL register.

Introduce struct rockchip_efuse_soc_data to hold both reg_read and
reg_write callbacks per SoC, replacing the bare function pointer
previously stored in of_device_id.data. Move nvmem_config to the
probe stack so read_only can be set per-device based on whether a
write callback is provided.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/nvmem/rockchip-efuse.c | 152 +++++++++++++++++++++++++++------
 1 file changed, 127 insertions(+), 25 deletions(-)

diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efuse.c
index 013e67136f3b..19eb61380ea4 100644
--- a/drivers/nvmem/rockchip-efuse.c
+++ b/drivers/nvmem/rockchip-efuse.c
@@ -37,12 +37,16 @@
 #define RK3399_NBYTES		4
 #define RK3399_STROBSFTSEL	BIT(9)
 #define RK3399_RSB		BIT(7)
+#define RK3399_PS		BIT(4)
 #define RK3399_PD		BIT(5)
 #define RK3399_PGENB		BIT(3)
 #define RK3399_LOAD		BIT(2)
 #define RK3399_STROBE		BIT(1)
 #define RK3399_CSB		BIT(0)

+#define RK3399_PGM_TIME_US	15
+
 #define REG_EFUSE_CTRL		0x0000
 #define REG_EFUSE_DOUT		0x0004
 
@@ -52,6 +56,16 @@ struct rockchip_efuse_chip {
 	struct clk *clk;
 };
 
+/**
+ * struct rockchip_efuse_soc_data - per-SoC efuse callbacks
+ * @reg_read:  mandatory read callback
+ * @reg_write: optional write callback; NULL means read-only
+ */
+struct rockchip_efuse_soc_data {
+	int (*reg_read)(void *ctx, unsigned int offset, void *val, size_t bytes);
+	int (*reg_write)(void *ctx, unsigned int offset, void *val, size_t bytes);
+};
+
 static int rockchip_rk3288_efuse_read(void *context, unsigned int offset,
 				      void *val, size_t bytes)
 {
@@ -177,6 +191,7 @@ static int rockchip_rk3399_efuse_read(void *context, unsigned int offset,
 	writel(RK3399_LOAD | RK3399_PGENB | RK3399_STROBSFTSEL | RK3399_RSB,
 	       efuse->base + REG_EFUSE_CTRL);
 	udelay(1);
+
 	while (addr_len--) {
 		writel(readl(efuse->base + REG_EFUSE_CTRL) | RK3399_STROBE |
 		       ((addr_start++ & RK3399_A_MASK) << RK3399_A_SHIFT),
@@ -203,48 +218,120 @@ static int rockchip_rk3399_efuse_read(void *context, unsigned int offset,
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
+			writel(ctrl | RK3399_STROBE, efuse->base + REG_EFUSE_CTRL);
+			udelay(RK3399_PGM_TIME_US);
+
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
@@ -252,20 +339,26 @@ MODULE_DEVICE_TABLE(of, rockchip_efuse_match);
 
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
 
@@ -278,12 +371,20 @@ static int rockchip_efuse_probe(struct platform_device *pdev)
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
+	econfig.reg_read  = soc_data->reg_read;
+	if (soc_data->reg_write &&
+	    of_property_read_bool(dev->of_node, "rockchip,efuse-write-enable"))
+		econfig.reg_write = soc_data->reg_write;
+
+	econfig.read_only = !econfig.reg_write;
+	econfig.priv      = efuse;
+	econfig.dev       = dev;
+
 	nvmem = devm_nvmem_register(dev, &econfig);
 
 	return PTR_ERR_OR_ZERO(nvmem);
@@ -300,3 +401,4 @@ static struct platform_driver rockchip_efuse_driver = {
 module_platform_driver(rockchip_efuse_driver);
 MODULE_DESCRIPTION("rockchip_efuse driver");
 MODULE_LICENSE("GPL v2");
+
-- 
2.47.3

