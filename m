Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C845393DDB
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117081; cv=none; b=FpES37d/dAmkkc+Ccwzkw9qlO7Pa4eRn/Jz+Artefglg3grpVjsmshC9UNaEiAZn8b3vFKT43cdXJHjjmwWm30udZy0YxiSGlKGNO5NPNGfoy3wlaBC6LwsxJOY0+Mni3JgXwytzceUs+V6gkI+PoHUSYOZdc8AxWttnJgVgCC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117081; c=relaxed/simple;
	bh=JfkcA2/8Y5FFSyv4O2XmZeNJ8A+Ngpcq71FmWwNVKiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kp3LJLqEXFuNnXgqIuk4eGHDFEXtOWBK5sytDIfpblhSR0963x09BXw0JijArYfPF0DmyiaQZHlOkaFreUYfPdm9PoeiRAqRZ72VOgPaLDWdaDniU1knnhsZYtwlLafbousKqtWifw1R7/SQOOGGAqer2IRS6QNMLO4GgNLn9aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFzkiXmA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFzkiXmA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49222b6e871so34693825e9.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117075; x=1782721875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlFNf2Othj0z2P5LY3YeTXkAwB9klNXkicCVKLXvmGo=;
        b=JFzkiXmAqIATg/iapv94g6Pu8ocNxggjOJcEtz17vPyaT19ZvGqQFCV1PERSIad8KW
         eMMstJePLkGi5ZFHuBOud6oh9WWKMzVV8lZU9d8JAxvYqZ4Ob+1MbmrASZbOvVUb//ky
         MaSzjz4QybhU2fnR5pqd6IZZJUtPILD/UTEkGSAdkfiO7Y1lzHLZuvlo9aRlZ/DRkAu7
         HJXfV1c3suUP6FxCcyvZQVqWYHD+eQOkgBuH3GAdniQizgvqtcQpb+8SmU1PoGAKel6L
         YyQrvQXDIlQVkIUGKR1mgFu5rJVBil52A/PoOQCL4uq7cKishGudvUKppN35jzCuQKxt
         6lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117075; x=1782721875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlFNf2Othj0z2P5LY3YeTXkAwB9klNXkicCVKLXvmGo=;
        b=R1IJaXiK0v6YQ+AftyqlT01sAgAnlLd5kBeGm+Act+/zuZSgRGDWAj2aH9/ymWvZ1H
         WsPnCkOILLkgELz4SqGQl7hEOwqPGoWthxrvgjeWruViNPPB7LtoNczm8mp3l85jBktl
         RSLZq7E1ReIhVf2eP4kHRHLarb5ihdSISiOlQWx1w9LZluL0EEwdn0gNj6CI20kj3/WZ
         R1t7v+9QcPjQaBa31eljajU11ryXAFiivNKniAQ37Ub4gaCaTUooIWrfOYhy0VI+YyD3
         eILRx17eTAUuU2HtOCtWUDNlruMqQxdqq76iK3qJetbdSPE6mU6RZe6zb4TdLJRKv/Ty
         zzHQ==
X-Forwarded-Encrypted: i=1; AFNElJ99+PfaETl8Lmg72oUupmaerP1ewjT3dLF7VcKquVBf8N2ZcxC9LPXMt20miVNqr3poTxeJDkuWiY1s@vger.kernel.org
X-Gm-Message-State: AOJu0YwEVYshyNZXVv2hY3H3TQw4t/cctIAFAtMl/i2dGNMmRSZx+JCf
	gtA+NUDKa3BOa3tozidm1Eg390+mboc7X8nEzwOF6oWTgLYWUVUddYkU
X-Gm-Gg: AfdE7cnbq6yAFchaVO+6HTdV/SZsTldadhMFDAy/IDjjbHlPKbsikzrnCCJphniKzs0
	jkQ7A3FNGdc+YvSn3eAoUNC6lx4RcpJpDC0WLqFhaN7Ihbn0nk50EQw6WyP2fJr+/aU6kzGqlhH
	c7TpTm/CIAx710RBZ9INmeZU43aBrVk8p9D8Pr42ZWoSoz5F5W2LePGaehQMDvn8LItrmo/aHar
	UYrHL9s2LP5tnxnY4w6BM7M5YfyhPXG8zCQHTH88goydhCnERyj46aFoRR0WsFeypbgNb4WpDYA
	f6i+EnyNo0MgZUEQMbO1KsxGal1sroi6Kt91F6HsyoQ1mJlolIdI7GeOisEksOaEmnCJVz9K/rz
	fkExG0UumRDtv+Gn3VhpTY1nXFAAShrc2xts/27iYTE8WhjZl+HTYh6INlQsWzqv8OQ5cg01jqg
	zGyy2v04xcO9wS/UV0wgfMm0g=
X-Received: by 2002:a05:600c:5290:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-49242189b1cmr199955115e9.0.1782117075258;
        Mon, 22 Jun 2026 01:31:15 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494497ffsm200809105e9.11.2026.06.22.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:31:14 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v2 3/3] watchdog: npcm: add bootstatus support
Date: Mon, 22 Jun 2026 11:30:46 +0300
Message-Id: <20260622083046.3189603-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622083046.3189603-1-tmaimon77@gmail.com>
References: <20260622083046.3189603-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPCM750 uses RESSR and the NPCM845 uses INTCR2 to latch reset
indications. Read those bits during probe and map them into watchdog
bootstatus flags.

For NPCM845, cache the sampled INTCR2 state in SCRPAD10 after the reset
status bits are cleared so later probes can report the same boot-time
state. Also report WDIOF_CARDRESET for the watchdog instance whose reset
bit is latched, while leaving WPCM450 behavior unchanged.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 197 +++++++++++++++++++++++++++++++++++-
 1 file changed, 195 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index e62ea054bc61..98660419ec3f 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -7,14 +7,51 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/watchdog.h>
 
 #define NPCM_WTCR	0x1C
 
+/* NPCM GCR module */
+#define NPCM_RESSR_OFFSET		0x6C
+#define NPCM_INTCR2_OFFSET		0x60
+#define NPCM8XX_SCRPAD10_OFFSET		0xE28
+
+#define NPCM_PORST			BIT(31)
+#define NPCM_CORST			BIT(30)
+#define NPCM_WD0RST			BIT(29)
+#define NPCM_SWR1RST			BIT(28)
+#define NPCM_SWR2RST			BIT(27)
+#define NPCM_SWR3RST			BIT(26)
+#define NPCM_SWR4RST			BIT(25)
+#define NPCM_WD1RST			BIT(24)
+#define NPCM_WD2RST			BIT(23)
+#define NPCM8XX_RST			(GENMASK(31, 23) | GENMASK(15, 12))
+#define NPCM8XX_TIP_RESET		BIT(25) /* Replaces SWRST4 on NPCM8xx */
+
+/* Per-instance mapping of MMIO base address to its RESSR/INTCR2 reset bit. */
+struct npcm_wdt_rst_map {
+	phys_addr_t	base;
+	u32		rst_bit;
+};
+
+struct npcm_wdt_status_map {
+	u32	rst_bit;
+	u32	wdiof_flag;
+};
+
+struct npcm_wdt_data {
+	const struct npcm_wdt_rst_map		*rst_map;
+	unsigned int				rst_map_size;
+	const struct npcm_wdt_status_map	*status_map;
+	unsigned int				status_map_size;
+};
+
 #define NPCM_WTCLK	(BIT(10) | BIT(11))	/* Clock divider */
 #define NPCM_WTE	BIT(7)			/* Enable */
 #define NPCM_WTIE	BIT(6)			/* Enable irq */
@@ -47,6 +84,50 @@ struct npcm_wdt {
 	struct clk		*clk;
 };
 
+static const struct npcm_wdt_rst_map npcm750_rst_map[] = {
+	{ 0xf000801c, NPCM_WD0RST },
+	{ 0xf000901c, NPCM_WD1RST },
+	{ 0xf000a01c, NPCM_WD2RST },
+};
+
+static const struct npcm_wdt_status_map npcm750_status_map[] = {
+	{ NPCM_PORST,	WDIOF_OVERHEAT },
+	{ NPCM_CORST,	WDIOF_FANFAULT },
+	{ NPCM_SWR1RST,	WDIOF_EXTERN1 },
+	{ NPCM_SWR2RST,	WDIOF_EXTERN2 },
+	{ NPCM_SWR3RST,	WDIOF_POWERUNDER },
+	{ NPCM_SWR4RST,	WDIOF_POWEROVER },
+};
+
+static const struct npcm_wdt_data npcm750_data = {
+	.rst_map = npcm750_rst_map,
+	.rst_map_size = ARRAY_SIZE(npcm750_rst_map),
+	.status_map = npcm750_status_map,
+	.status_map_size = ARRAY_SIZE(npcm750_status_map),
+};
+
+static const struct npcm_wdt_rst_map npcm845_rst_map[] = {
+	{ 0xf000801c, NPCM_WD0RST },
+	{ 0xf000901c, NPCM_WD1RST },
+	{ 0xf000a01c, NPCM_WD2RST },
+};
+
+static const struct npcm_wdt_status_map npcm845_status_map[] = {
+	{ NPCM_PORST,		WDIOF_OVERHEAT },
+	{ NPCM_CORST,		WDIOF_FANFAULT },
+	{ NPCM_SWR1RST,		WDIOF_EXTERN1 },
+	{ NPCM_SWR2RST,		WDIOF_EXTERN2 },
+	{ NPCM_SWR3RST,		WDIOF_POWERUNDER },
+	{ NPCM8XX_TIP_RESET,	WDIOF_POWEROVER },
+};
+
+static const struct npcm_wdt_data npcm845_data = {
+	.rst_map = npcm845_rst_map,
+	.rst_map_size = ARRAY_SIZE(npcm845_rst_map),
+	.status_map = npcm845_status_map,
+	.status_map_size = ARRAY_SIZE(npcm845_status_map),
+};
+
 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
 {
 	return container_of(wdd, struct npcm_wdt, wdd);
@@ -169,6 +250,92 @@ static bool npcm_is_running(struct watchdog_device *wdd)
 	return readl(wdt->reg) & NPCM_WTE;
 }
 
+static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev,
+				  const struct npcm_wdt_data *data,
+				  resource_size_t start)
+{
+	struct regmap *gcr_regmap;
+	u32 rstval = 0;
+	unsigned int i;
+	int ret;
+
+	if (!data)
+		return;
+
+	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+						     "nuvoton,sysgcr");
+	if (IS_ERR(gcr_regmap)) {
+		dev_warn(dev,
+			 "Failed to find nuvoton,sysgcr, WD reset status not supported\n");
+		return;
+	}
+
+	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt")) {
+		ret = regmap_read(gcr_regmap, NPCM_INTCR2_OFFSET, &rstval);
+		if (ret) {
+			dev_warn(dev, "Failed to read INTCR2 reset status: %d\n",
+				 ret);
+			return;
+		}
+
+		if (rstval & NPCM8XX_RST) {
+			ret = regmap_write(gcr_regmap, NPCM_INTCR2_OFFSET,
+					   rstval & ~NPCM8XX_RST);
+			if (ret) {
+				dev_warn(dev,
+					 "Failed to clear INTCR2 reset status: %d\n",
+					 ret);
+				return;
+			}
+
+			ret = regmap_write(gcr_regmap, NPCM8XX_SCRPAD10_OFFSET,
+					   rstval);
+			if (ret) {
+				dev_warn(dev,
+					 "Failed to cache reset status in SCRPAD10: %d\n",
+					 ret);
+				return;
+			}
+		} else {
+			ret = regmap_read(gcr_regmap, NPCM8XX_SCRPAD10_OFFSET,
+					  &rstval);
+			if (ret) {
+				dev_warn(dev,
+					 "Failed to read cached reset status from SCRPAD10: %d\n",
+					 ret);
+				return;
+			}
+		}
+	} else if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
+		ret = regmap_read(gcr_regmap, NPCM_RESSR_OFFSET, &rstval);
+		if (ret) {
+			dev_warn(dev, "Failed to read RESSR reset status: %d\n",
+				 ret);
+			return;
+		}
+
+		ret = regmap_write(gcr_regmap, NPCM_RESSR_OFFSET, rstval);
+		if (ret) {
+			dev_warn(dev, "Failed to clear RESSR reset status: %d\n",
+				 ret);
+			return;
+		}
+	}
+
+	for (i = 0; i < data->status_map_size; i++) {
+		if (rstval & data->status_map[i].rst_bit)
+			wdt->wdd.bootstatus |= data->status_map[i].wdiof_flag;
+	}
+
+	for (i = 0; i < data->rst_map_size; i++) {
+		if (data->rst_map[i].base == start &&
+		    rstval & data->rst_map[i].rst_bit) {
+			wdt->wdd.bootstatus |= WDIOF_CARDRESET;
+			break;
+		}
+	}
+}
+
 static const struct watchdog_info npcm_wdt_info = {
 	.identity	= KBUILD_MODNAME,
 	.options	= WDIOF_SETTIMEOUT
@@ -176,6 +343,20 @@ static const struct watchdog_info npcm_wdt_info = {
 			| WDIOF_MAGICCLOSE,
 };
 
+static const struct watchdog_info npcm_wdt_rst_info = {
+	.identity	= KBUILD_MODNAME,
+	.options	= WDIOF_SETTIMEOUT
+			| WDIOF_KEEPALIVEPING
+			| WDIOF_MAGICCLOSE
+			| WDIOF_CARDRESET
+			| WDIOF_OVERHEAT
+			| WDIOF_FANFAULT
+			| WDIOF_EXTERN1
+			| WDIOF_EXTERN2
+			| WDIOF_POWERUNDER
+			| WDIOF_POWEROVER,
+};
+
 static const struct watchdog_ops npcm_wdt_ops = {
 	.owner = THIS_MODULE,
 	.start = npcm_wdt_start,
@@ -188,7 +369,10 @@ static const struct watchdog_ops npcm_wdt_ops = {
 static int npcm_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct npcm_wdt_data *data = device_get_match_data(dev);
+	struct resource *res;
 	struct npcm_wdt *wdt;
+	resource_size_t start;
 	int irq;
 	int ret;
 
@@ -196,10 +380,16 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (!wdt)
 		return -ENOMEM;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
 	wdt->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(wdt->reg))
 		return PTR_ERR(wdt->reg);
 
+	start = res->start;
+
 	wdt->clk = devm_clk_get_optional(&pdev->dev, NULL);
 	if (IS_ERR(wdt->clk))
 		return PTR_ERR(wdt->clk);
@@ -208,7 +398,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	wdt->wdd.info = &npcm_wdt_info;
+	wdt->wdd.info = data ? &npcm_wdt_rst_info : &npcm_wdt_info;
 	wdt->wdd.ops = &npcm_wdt_ops;
 	wdt->wdd.min_timeout = 1;
 	wdt->wdd.max_timeout = 2750;
@@ -220,6 +410,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	/* Ensure timeout is able to be represented by the hardware */
 	npcm_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
 
+	npcm_get_reset_status(wdt, dev, data, start);
+
 	if (npcm_is_running(&wdt->wdd)) {
 		/* Restart with the default or device-tree specified timeout */
 		npcm_wdt_start(&wdt->wdd);
@@ -243,7 +435,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id npcm_wdt_match[] = {
 	{.compatible = "nuvoton,wpcm450-wdt"},
-	{.compatible = "nuvoton,npcm750-wdt"},
+	{.compatible = "nuvoton,npcm750-wdt", .data = &npcm750_data},
+	{.compatible = "nuvoton,npcm845-wdt", .data = &npcm845_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, npcm_wdt_match);
-- 
2.34.1

