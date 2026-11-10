Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274625;
	b=AWm7iLcau9MKCKAfoM57vQt1vGHjMQol43DHBSShK1CdY1XIwX0JjaozRE9yEioWQhYK
	 Q39Cn0McX3jCTYWAsirbzF+jx9HGOtdjB8ACKHHfRuIYtyc+v5zQ8Gs9zSUnFq4tfYGLa
	 rpWXSKKBAh9w3lYaHvQPm6c+yp8Jd74X5TEJK5M6nDFVVAPUWoy40qHAXfoI4jA+RIczP
	 8o5FYq0Aeuyid2FpNqK556bcWmCVjG7i/2OijD1yVpmd6GXw7LUGBIC4VW/A/rACmPC6f
	 p8fOI4AS2sI4kfHk0bONTmd19EmVBfFoaCDpvt1ZxYyN/mxfL/ndqTZMaKv3JzKIkzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=egHWs+EmtSKFwKFH3pyzpGd8QhXT9fOMUbmh0rGS1wE=;
	b=GIsFN1aYHV8afEj1Qmbv0Pw+ZGdnRfXUjrFnv6RERxW7ry4Zc/TYFuUADl0E9EOONDSV
	 Va4HID9rVLqb6sD9MqX49HOLtktyEetCVdauXsaVUXy1J/bgswsCwgc0NdJxN3U80NDCI
	 mpj2P4K4JcFtTVvxGHZd8tx6NkmQaB9ab0hZL0Q5J2aoQtlcenpoclIqIX8xDqlqAAyah
	 34tqGy4MLsOWUrvmnwQmHskh5/V8Oe3PHHngp9nFky7leLYr6UgFTbmExTapCU/jzwh8v
	 b/i1Jlark9mQ4F9B5cVLUe3ull9bf+ph+L58ey1mGblXLelhWqGW9xHlj79HjBVK4Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdAXVkWv;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DD606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdAXVkWv
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987a2ba0cso8697115ad.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 17:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274625; x=1794879425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egHWs+EmtSKFwKFH3pyzpGd8QhXT9fOMUbmh0rGS1wE=;
        b=bdAXVkWvq5SSkUYmFOWf3BhNeHa1h1sR2UOTYaaF7LKtjj59UMYGgKudhwJ2kYmClm
         5Dy0vUvQtIBkhHFXW8oLZFXc/m2OrsL4KcKsVUNpVF221LU/BkkqDCJBDfVmWMFQhrQs
         wRjBnI7BQyDp1CHYOidmYnXD4qFO893CO94V0BjebQG0OJOw88d84DVzp8+QVgtMRdtJ
         7LOG83mJ1CHELlUwfS1kUnYsxZOK9MKc3mWxtr7V2jlw6Ltg6jRZ5YSG+0jxFYZN8EbA
         n8IU6GpvlfZJezYHyzoELB5q4fDzVMpEvLlKpANSfRc1bBYdD9RoPXYRcYBcqc27uYeF
         l13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274625; x=1794879425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=egHWs+EmtSKFwKFH3pyzpGd8QhXT9fOMUbmh0rGS1wE=;
        b=vQlayKA9tXAdCOqc8HCKzk5s51QkLp1E4bb4vbkr8e3D3bgRVTSFwoo/TP6IcdABY/
         84Ydg26FbdptXL6Bdj1iQTmFemvUJMWsbm76ERE7PCr25YwwxwDN8hwa2Sg4wNwhVIVv
         0Kw/64KuTdkob3OPGAw23/K8BO5yX7AQ1PPFQ/5le8hmkuFF8ytYdWWEkGgAf66BYbBH
         0LwoxaNGlLDXdojx3VE3P3244+zyRCIfZ8H5+e2Eb55yN++iRYaAaeYLO1SSxfsWfSm4
         zdlpFxMk6VAoJlwnR217/WPyiXFeCva/+RQJ/PNe7CQsvsjRpUM0Jlpe9UM758AWu+QG
         XUCg==
X-Forwarded-Encrypted: i=1; AL+hErGP0dUwXAkCrmhqRLUWZMKFhaH/YdPHgwrP6I0H9HQ3Nrc4iDIo66NTJvhJP79blBMMD7nU6iL0MTkR@vger.kernel.org
X-Gm-Message-State: APuU4Z82/uhUR/gGDcWFlPVwZhlX55fvNWNMEdhqae1ENIl4DM1eEOvG
	A/WVxoM5QjMrFRAa13xUEEqB7yeDw770FFCE0aMkJA2XJN2ei1+9UyVs
X-Gm-Gg: AYBFou30I8sfwjfR9m33/MKpBRRGhQuFFKgLajcB5T+LJ+DeWdeVMGN8q+KoCyHgElT
	GYQ4kQ/alVX63WYEmFE3FsUGgaF8KDWeY/aGeYLIow2B1tVKSYzYeiEL5t07IIvONGg875l4b7w
	v/m1XDajXiaUI5ht7O6h21MEx7wri89aqggJ1AoHv+AjyftPx1leO9KoA2xUDI/20Y2paZHWTPD
	5GenQd7Exw0cq//kji6YlpaCT7Fu+ABlFoF2JolH4OqvLONpQtGKin75zlAKXX+Usxrv36CudLC
	QG2gu/Dgnt7fdugfBGyGOCT41Zt2P9lSPPD2bJfAim+3tZTMWeUSRHKlgvjtaedIWYbIkkIKDX9
	3vv/1S04tvokGsx24X0VSK1Ls9cwUhHML2I0csP+NC7q6FdnNyaqAUFmOFrgncpwb+eUnQkHlIY
	f/WQKEocfXVcPW8YwIo/d1qtSbl06JYhdzXaEl1OlFmUkOXQM8t9M7ln0X4hlDga33iIz9I3d8k
	Zkp9tglx95RrQCLgV+fFkguApBLMnOAfFX/sM3J9wEAIJWm5Ie9GOqcSI74zvIcL18HBe+sBKEE
	6c4TDyduO9oCCpUb/pkDTUxSJniodSGrMtz9NYR7xfS0SEn6d5nawfT23znQTUvSrpUAYAdxG7T
	IB+dYIb9g66eBWAioOi9oxXH/sDsXXe+Ki3fSh21dq9M3yO+0k5Ot/7xih87X8Lr3gkvIUe/PiN
	K5EQ==
X-Received: by 2002:a17:903:2ad0:b0:2ec:ff7f:6f1 with SMTP id d9443c01a7336-2edb9145f10mr9584345ad.11.1794274624501;
        Mon, 09 Nov 2026 17:37:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:37:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 6/6] MIPS: ath79: remove the old clock code
Date: Mon,  9 Nov 2026 17:36:46 -0800
Message-ID: <20261110013646.1582970-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk-ath79 driver in drivers/clk has replaced arch/mips/ath79/clock.c,
which is no longer built. Remove it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/Makefile |   3 -
 arch/mips/ath79/clock.c  | 626 ---------------------------------------
 2 files changed, 629 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c

diff --git a/arch/mips/ath79/Makefile b/arch/mips/ath79/Makefile
index b78ffdc9b389..5df55b5e1c15 100644
--- a/arch/mips/ath79/Makefile
+++ b/arch/mips/ath79/Makefile
@@ -8,7 +8,4 @@
 
 obj-y	:= prom.o setup.o common.o
 
-# replaced by the clk-ath79 driver
-obj-$(if $(CONFIG_COMMON_CLK_ATH79),,y) += clock.o
-
 obj-$(CONFIG_EARLY_PRINTK)		+= early_printk.o
diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
deleted file mode 100644
index 85f747cf37a8..000000000000
--- a/arch/mips/ath79/clock.c
+++ /dev/null
@@ -1,626 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Atheros AR71XX/AR724X/AR913X common routines
- *
- *  Copyright (C) 2010-2011 Jaiganesh Narayanan <jnarayanan@atheros.com>
- *  Copyright (C) 2011 Gabor Juhos <juhosg@openwrt.org>
- *
- *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/err.h>
-#include <linux/clk.h>
-#include <linux/clkdev.h>
-#include <linux/clk-provider.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <dt-bindings/clock/ath79-clk.h>
-
-#include <asm/div64.h>
-
-#include <asm/mach-ath79/ath79.h>
-#include <asm/mach-ath79/ar71xx_regs.h>
-#include "common.h"
-
-static struct clk *clks[ATH79_CLK_END];
-static struct clk_onecell_data clk_data = {
-	.clks = clks,
-	.clk_num = ARRAY_SIZE(clks),
-};
-
-static const char * const clk_names[ATH79_CLK_END] = {
-	[ATH79_CLK_CPU] = "cpu",
-	[ATH79_CLK_DDR] = "ddr",
-	[ATH79_CLK_AHB] = "ahb",
-	[ATH79_CLK_REF] = "ref",
-	[ATH79_CLK_MDIO] = "mdio",
-};
-
-static const char * __init ath79_clk_name(int type)
-{
-	BUG_ON(type >= ARRAY_SIZE(clk_names) || !clk_names[type]);
-	return clk_names[type];
-}
-
-static void __init __ath79_set_clk(int type, const char *name, struct clk *clk)
-{
-	if (IS_ERR(clk))
-		panic("failed to allocate %s clock structure", clk_names[type]);
-
-	clks[type] = clk;
-	clk_register_clkdev(clk, name, NULL);
-}
-
-static struct clk * __init ath79_set_clk(int type, unsigned long rate)
-{
-	const char *name = ath79_clk_name(type);
-	struct clk *clk;
-
-	clk = clk_register_fixed_rate(NULL, name, NULL, 0, rate);
-	__ath79_set_clk(type, name, clk);
-	return clk;
-}
-
-static struct clk * __init ath79_set_ff_clk(int type, const char *parent,
-					    unsigned int mult, unsigned int div)
-{
-	const char *name = ath79_clk_name(type);
-	struct clk *clk;
-
-	clk = clk_register_fixed_factor(NULL, name, parent, 0, mult, div);
-	__ath79_set_clk(type, name, clk);
-	return clk;
-}
-
-static unsigned long __init ath79_get_ref_rate(void)
-{
-	if (!clks[ATH79_CLK_REF])
-		panic("ath79: no reference clock");
-
-	return clk_get_rate(clks[ATH79_CLK_REF]);
-}
-
-static void __init ar71xx_clocks_init(void __iomem *pll_base)
-{
-	unsigned long ref_rate;
-	unsigned long cpu_rate;
-	unsigned long ddr_rate;
-	unsigned long ahb_rate;
-	u32 pll;
-	u32 freq;
-	u32 div;
-
-	ref_rate = ath79_get_ref_rate();
-
-	pll = __raw_readl(pll_base + AR71XX_PLL_REG_CPU_CONFIG);
-
-	div = ((pll >> AR71XX_PLL_FB_SHIFT) & AR71XX_PLL_FB_MASK) + 1;
-	freq = div * ref_rate;
-
-	div = ((pll >> AR71XX_CPU_DIV_SHIFT) & AR71XX_CPU_DIV_MASK) + 1;
-	cpu_rate = freq / div;
-
-	div = ((pll >> AR71XX_DDR_DIV_SHIFT) & AR71XX_DDR_DIV_MASK) + 1;
-	ddr_rate = freq / div;
-
-	div = (((pll >> AR71XX_AHB_DIV_SHIFT) & AR71XX_AHB_DIV_MASK) + 1) * 2;
-	ahb_rate = cpu_rate / div;
-
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
-}
-
-static void __init ar724x_clocks_init(void __iomem *pll_base)
-{
-	u32 mult, div, ddr_div, ahb_div;
-	u32 pll;
-
-	ath79_get_ref_rate();
-
-	pll = __raw_readl(pll_base + AR724X_PLL_REG_CPU_CONFIG);
-
-	mult = ((pll >> AR724X_PLL_FB_SHIFT) & AR724X_PLL_FB_MASK);
-	div = ((pll >> AR724X_PLL_REF_DIV_SHIFT) & AR724X_PLL_REF_DIV_MASK) * 2;
-
-	ddr_div = ((pll >> AR724X_DDR_DIV_SHIFT) & AR724X_DDR_DIV_MASK) + 1;
-	ahb_div = (((pll >> AR724X_AHB_DIV_SHIFT) & AR724X_AHB_DIV_MASK) + 1) * 2;
-
-	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", mult, div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, "ref", mult, div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, "ref", mult, div * ahb_div);
-}
-
-static void __init ar933x_clocks_init(void __iomem *pll_base)
-{
-	u32 clock_ctrl;
-	u32 ref_div;
-	u32 ninit_mul;
-	u32 out_div;
-
-	u32 cpu_div;
-	u32 ddr_div;
-	u32 ahb_div;
-
-	ath79_get_ref_rate();
-
-	clock_ctrl = __raw_readl(pll_base + AR933X_PLL_CLOCK_CTRL_REG);
-	if (clock_ctrl & AR933X_PLL_CLOCK_CTRL_BYPASS) {
-		ref_div = 1;
-		ninit_mul = 1;
-		out_div = 1;
-
-		cpu_div = 1;
-		ddr_div = 1;
-		ahb_div = 1;
-	} else {
-		u32 cpu_config;
-		u32 t;
-
-		cpu_config = __raw_readl(pll_base + AR933X_PLL_CPU_CONFIG_REG);
-
-		t = (cpu_config >> AR933X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-		    AR933X_PLL_CPU_CONFIG_REFDIV_MASK;
-		ref_div = t;
-
-		ninit_mul = (cpu_config >> AR933X_PLL_CPU_CONFIG_NINT_SHIFT) &
-		    AR933X_PLL_CPU_CONFIG_NINT_MASK;
-
-		t = (cpu_config >> AR933X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-		    AR933X_PLL_CPU_CONFIG_OUTDIV_MASK;
-		if (t == 0)
-			t = 1;
-
-		out_div = (1 << t);
-
-		cpu_div = ((clock_ctrl >> AR933X_PLL_CLOCK_CTRL_CPU_DIV_SHIFT) &
-		     AR933X_PLL_CLOCK_CTRL_CPU_DIV_MASK) + 1;
-
-		ddr_div = ((clock_ctrl >> AR933X_PLL_CLOCK_CTRL_DDR_DIV_SHIFT) &
-		      AR933X_PLL_CLOCK_CTRL_DDR_DIV_MASK) + 1;
-
-		ahb_div = ((clock_ctrl >> AR933X_PLL_CLOCK_CTRL_AHB_DIV_SHIFT) &
-		     AR933X_PLL_CLOCK_CTRL_AHB_DIV_MASK) + 1;
-	}
-
-	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", ninit_mul,
-			 ref_div * out_div * cpu_div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, "ref", ninit_mul,
-			 ref_div * out_div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, "ref", ninit_mul,
-			 ref_div * out_div * ahb_div);
-}
-
-static u32 __init ar934x_get_pll_freq(u32 ref, u32 ref_div, u32 nint, u32 nfrac,
-				      u32 frac, u32 out_div)
-{
-	u64 t;
-	u32 ret;
-
-	t = ref;
-	t *= nint;
-	do_div(t, ref_div);
-	ret = t;
-
-	t = ref;
-	t *= nfrac;
-	do_div(t, ref_div * frac);
-	ret += t;
-
-	ret /= (1 << out_div);
-	return ret;
-}
-
-static void __init ar934x_clocks_init(void __iomem *pll_base)
-{
-	unsigned long ref_rate;
-	unsigned long cpu_rate;
-	unsigned long ddr_rate;
-	unsigned long ahb_rate;
-	u32 pll, out_div, ref_div, nint, nfrac, frac, clk_ctrl, postdiv;
-	u32 cpu_pll, ddr_pll;
-	void __iomem *dpll_base;
-
-	dpll_base = ioremap(AR934X_SRIF_BASE, AR934X_SRIF_SIZE);
-
-	ref_rate = ath79_get_ref_rate();
-
-	pll = __raw_readl(dpll_base + AR934X_SRIF_CPU_DPLL2_REG);
-	if (pll & AR934X_SRIF_DPLL2_LOCAL_PLL) {
-		out_div = (pll >> AR934X_SRIF_DPLL2_OUTDIV_SHIFT) &
-			  AR934X_SRIF_DPLL2_OUTDIV_MASK;
-		pll = __raw_readl(dpll_base + AR934X_SRIF_CPU_DPLL1_REG);
-		nint = (pll >> AR934X_SRIF_DPLL1_NINT_SHIFT) &
-		       AR934X_SRIF_DPLL1_NINT_MASK;
-		nfrac = pll & AR934X_SRIF_DPLL1_NFRAC_MASK;
-		ref_div = (pll >> AR934X_SRIF_DPLL1_REFDIV_SHIFT) &
-			  AR934X_SRIF_DPLL1_REFDIV_MASK;
-		frac = 1 << 18;
-	} else {
-		pll = __raw_readl(pll_base + AR934X_PLL_CPU_CONFIG_REG);
-		out_div = (pll >> AR934X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-			AR934X_PLL_CPU_CONFIG_OUTDIV_MASK;
-		ref_div = (pll >> AR934X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-			  AR934X_PLL_CPU_CONFIG_REFDIV_MASK;
-		nint = (pll >> AR934X_PLL_CPU_CONFIG_NINT_SHIFT) &
-		       AR934X_PLL_CPU_CONFIG_NINT_MASK;
-		nfrac = (pll >> AR934X_PLL_CPU_CONFIG_NFRAC_SHIFT) &
-			AR934X_PLL_CPU_CONFIG_NFRAC_MASK;
-		frac = 1 << 6;
-	}
-
-	cpu_pll = ar934x_get_pll_freq(ref_rate, ref_div, nint,
-				      nfrac, frac, out_div);
-
-	pll = __raw_readl(dpll_base + AR934X_SRIF_DDR_DPLL2_REG);
-	if (pll & AR934X_SRIF_DPLL2_LOCAL_PLL) {
-		out_div = (pll >> AR934X_SRIF_DPLL2_OUTDIV_SHIFT) &
-			  AR934X_SRIF_DPLL2_OUTDIV_MASK;
-		pll = __raw_readl(dpll_base + AR934X_SRIF_DDR_DPLL1_REG);
-		nint = (pll >> AR934X_SRIF_DPLL1_NINT_SHIFT) &
-		       AR934X_SRIF_DPLL1_NINT_MASK;
-		nfrac = pll & AR934X_SRIF_DPLL1_NFRAC_MASK;
-		ref_div = (pll >> AR934X_SRIF_DPLL1_REFDIV_SHIFT) &
-			  AR934X_SRIF_DPLL1_REFDIV_MASK;
-		frac = 1 << 18;
-	} else {
-		pll = __raw_readl(pll_base + AR934X_PLL_DDR_CONFIG_REG);
-		out_div = (pll >> AR934X_PLL_DDR_CONFIG_OUTDIV_SHIFT) &
-			  AR934X_PLL_DDR_CONFIG_OUTDIV_MASK;
-		ref_div = (pll >> AR934X_PLL_DDR_CONFIG_REFDIV_SHIFT) &
-			   AR934X_PLL_DDR_CONFIG_REFDIV_MASK;
-		nint = (pll >> AR934X_PLL_DDR_CONFIG_NINT_SHIFT) &
-		       AR934X_PLL_DDR_CONFIG_NINT_MASK;
-		nfrac = (pll >> AR934X_PLL_DDR_CONFIG_NFRAC_SHIFT) &
-			AR934X_PLL_DDR_CONFIG_NFRAC_MASK;
-		frac = 1 << 10;
-	}
-
-	ddr_pll = ar934x_get_pll_freq(ref_rate, ref_div, nint,
-				      nfrac, frac, out_div);
-
-	clk_ctrl = __raw_readl(pll_base + AR934X_PLL_CPU_DDR_CLK_CTRL_REG);
-
-	postdiv = (clk_ctrl >> AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_SHIFT) &
-		  AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_POST_DIV_MASK;
-
-	if (clk_ctrl & AR934X_PLL_CPU_DDR_CLK_CTRL_CPU_PLL_BYPASS)
-		cpu_rate = ref_rate;
-	else if (clk_ctrl & AR934X_PLL_CPU_DDR_CLK_CTRL_CPUCLK_FROM_CPUPLL)
-		cpu_rate = cpu_pll / (postdiv + 1);
-	else
-		cpu_rate = ddr_pll / (postdiv + 1);
-
-	postdiv = (clk_ctrl >> AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_SHIFT) &
-		  AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_POST_DIV_MASK;
-
-	if (clk_ctrl & AR934X_PLL_CPU_DDR_CLK_CTRL_DDR_PLL_BYPASS)
-		ddr_rate = ref_rate;
-	else if (clk_ctrl & AR934X_PLL_CPU_DDR_CLK_CTRL_DDRCLK_FROM_DDRPLL)
-		ddr_rate = ddr_pll / (postdiv + 1);
-	else
-		ddr_rate = cpu_pll / (postdiv + 1);
-
-	postdiv = (clk_ctrl >> AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_SHIFT) &
-		  AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_POST_DIV_MASK;
-
-	if (clk_ctrl & AR934X_PLL_CPU_DDR_CLK_CTRL_AHB_PLL_BYPASS)
-		ahb_rate = ref_rate;
-	else if (clk_ctrl & AR934X_PLL_CPU_DDR_CLK_CTRL_AHBCLK_FROM_DDRPLL)
-		ahb_rate = ddr_pll / (postdiv + 1);
-	else
-		ahb_rate = cpu_pll / (postdiv + 1);
-
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
-
-	clk_ctrl = __raw_readl(pll_base + AR934X_PLL_SWITCH_CLOCK_CONTROL_REG);
-	if (clk_ctrl & AR934X_PLL_SWITCH_CLOCK_CONTROL_MDIO_CLK_SEL)
-		ath79_set_clk(ATH79_CLK_MDIO, 100 * 1000 * 1000);
-
-	iounmap(dpll_base);
-}
-
-static void __init qca953x_clocks_init(void __iomem *pll_base)
-{
-	unsigned long ref_rate;
-	unsigned long cpu_rate;
-	unsigned long ddr_rate;
-	unsigned long ahb_rate;
-	u32 pll, out_div, ref_div, nint, frac, clk_ctrl, postdiv;
-	u32 cpu_pll, ddr_pll;
-
-	ref_rate = ath79_get_ref_rate();
-
-	pll = __raw_readl(pll_base + QCA953X_PLL_CPU_CONFIG_REG);
-	out_div = (pll >> QCA953X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-		  QCA953X_PLL_CPU_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA953X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-		  QCA953X_PLL_CPU_CONFIG_REFDIV_MASK;
-	nint = (pll >> QCA953X_PLL_CPU_CONFIG_NINT_SHIFT) &
-	       QCA953X_PLL_CPU_CONFIG_NINT_MASK;
-	frac = (pll >> QCA953X_PLL_CPU_CONFIG_NFRAC_SHIFT) &
-	       QCA953X_PLL_CPU_CONFIG_NFRAC_MASK;
-
-	cpu_pll = nint * ref_rate / ref_div;
-	cpu_pll += frac * (ref_rate >> 6) / ref_div;
-	cpu_pll /= (1 << out_div);
-
-	pll = __raw_readl(pll_base + QCA953X_PLL_DDR_CONFIG_REG);
-	out_div = (pll >> QCA953X_PLL_DDR_CONFIG_OUTDIV_SHIFT) &
-		  QCA953X_PLL_DDR_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA953X_PLL_DDR_CONFIG_REFDIV_SHIFT) &
-		  QCA953X_PLL_DDR_CONFIG_REFDIV_MASK;
-	nint = (pll >> QCA953X_PLL_DDR_CONFIG_NINT_SHIFT) &
-	       QCA953X_PLL_DDR_CONFIG_NINT_MASK;
-	frac = (pll >> QCA953X_PLL_DDR_CONFIG_NFRAC_SHIFT) &
-	       QCA953X_PLL_DDR_CONFIG_NFRAC_MASK;
-
-	ddr_pll = nint * ref_rate / ref_div;
-	ddr_pll += frac * (ref_rate >> 6) / (ref_div << 4);
-	ddr_pll /= (1 << out_div);
-
-	clk_ctrl = __raw_readl(pll_base + QCA953X_PLL_CLK_CTRL_REG);
-
-	postdiv = (clk_ctrl >> QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT) &
-		  QCA953X_PLL_CLK_CTRL_CPU_POST_DIV_MASK;
-
-	if (clk_ctrl & QCA953X_PLL_CLK_CTRL_CPU_PLL_BYPASS)
-		cpu_rate = ref_rate;
-	else if (clk_ctrl & QCA953X_PLL_CLK_CTRL_CPUCLK_FROM_CPUPLL)
-		cpu_rate = cpu_pll / (postdiv + 1);
-	else
-		cpu_rate = ddr_pll / (postdiv + 1);
-
-	postdiv = (clk_ctrl >> QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT) &
-		  QCA953X_PLL_CLK_CTRL_DDR_POST_DIV_MASK;
-
-	if (clk_ctrl & QCA953X_PLL_CLK_CTRL_DDR_PLL_BYPASS)
-		ddr_rate = ref_rate;
-	else if (clk_ctrl & QCA953X_PLL_CLK_CTRL_DDRCLK_FROM_DDRPLL)
-		ddr_rate = ddr_pll / (postdiv + 1);
-	else
-		ddr_rate = cpu_pll / (postdiv + 1);
-
-	postdiv = (clk_ctrl >> QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT) &
-		  QCA953X_PLL_CLK_CTRL_AHB_POST_DIV_MASK;
-
-	if (clk_ctrl & QCA953X_PLL_CLK_CTRL_AHB_PLL_BYPASS)
-		ahb_rate = ref_rate;
-	else if (clk_ctrl & QCA953X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL)
-		ahb_rate = ddr_pll / (postdiv + 1);
-	else
-		ahb_rate = cpu_pll / (postdiv + 1);
-
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
-}
-
-static void __init qca955x_clocks_init(void __iomem *pll_base)
-{
-	unsigned long ref_rate;
-	unsigned long cpu_rate;
-	unsigned long ddr_rate;
-	unsigned long ahb_rate;
-	u32 pll, out_div, ref_div, nint, frac, clk_ctrl, postdiv;
-	u32 cpu_pll, ddr_pll;
-
-	ref_rate = ath79_get_ref_rate();
-
-	pll = __raw_readl(pll_base + QCA955X_PLL_CPU_CONFIG_REG);
-	out_div = (pll >> QCA955X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-		  QCA955X_PLL_CPU_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA955X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-		  QCA955X_PLL_CPU_CONFIG_REFDIV_MASK;
-	nint = (pll >> QCA955X_PLL_CPU_CONFIG_NINT_SHIFT) &
-	       QCA955X_PLL_CPU_CONFIG_NINT_MASK;
-	frac = (pll >> QCA955X_PLL_CPU_CONFIG_NFRAC_SHIFT) &
-	       QCA955X_PLL_CPU_CONFIG_NFRAC_MASK;
-
-	cpu_pll = nint * ref_rate / ref_div;
-	cpu_pll += frac * ref_rate / (ref_div * (1 << 6));
-	cpu_pll /= (1 << out_div);
-
-	pll = __raw_readl(pll_base + QCA955X_PLL_DDR_CONFIG_REG);
-	out_div = (pll >> QCA955X_PLL_DDR_CONFIG_OUTDIV_SHIFT) &
-		  QCA955X_PLL_DDR_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA955X_PLL_DDR_CONFIG_REFDIV_SHIFT) &
-		  QCA955X_PLL_DDR_CONFIG_REFDIV_MASK;
-	nint = (pll >> QCA955X_PLL_DDR_CONFIG_NINT_SHIFT) &
-	       QCA955X_PLL_DDR_CONFIG_NINT_MASK;
-	frac = (pll >> QCA955X_PLL_DDR_CONFIG_NFRAC_SHIFT) &
-	       QCA955X_PLL_DDR_CONFIG_NFRAC_MASK;
-
-	ddr_pll = nint * ref_rate / ref_div;
-	ddr_pll += frac * ref_rate / (ref_div * (1 << 10));
-	ddr_pll /= (1 << out_div);
-
-	clk_ctrl = __raw_readl(pll_base + QCA955X_PLL_CLK_CTRL_REG);
-
-	postdiv = (clk_ctrl >> QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT) &
-		  QCA955X_PLL_CLK_CTRL_CPU_POST_DIV_MASK;
-
-	if (clk_ctrl & QCA955X_PLL_CLK_CTRL_CPU_PLL_BYPASS)
-		cpu_rate = ref_rate;
-	else if (clk_ctrl & QCA955X_PLL_CLK_CTRL_CPUCLK_FROM_CPUPLL)
-		cpu_rate = ddr_pll / (postdiv + 1);
-	else
-		cpu_rate = cpu_pll / (postdiv + 1);
-
-	postdiv = (clk_ctrl >> QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT) &
-		  QCA955X_PLL_CLK_CTRL_DDR_POST_DIV_MASK;
-
-	if (clk_ctrl & QCA955X_PLL_CLK_CTRL_DDR_PLL_BYPASS)
-		ddr_rate = ref_rate;
-	else if (clk_ctrl & QCA955X_PLL_CLK_CTRL_DDRCLK_FROM_DDRPLL)
-		ddr_rate = cpu_pll / (postdiv + 1);
-	else
-		ddr_rate = ddr_pll / (postdiv + 1);
-
-	postdiv = (clk_ctrl >> QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT) &
-		  QCA955X_PLL_CLK_CTRL_AHB_POST_DIV_MASK;
-
-	if (clk_ctrl & QCA955X_PLL_CLK_CTRL_AHB_PLL_BYPASS)
-		ahb_rate = ref_rate;
-	else if (clk_ctrl & QCA955X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL)
-		ahb_rate = ddr_pll / (postdiv + 1);
-	else
-		ahb_rate = cpu_pll / (postdiv + 1);
-
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
-}
-
-static void __init qca956x_clocks_init(void __iomem *pll_base)
-{
-	unsigned long ref_rate;
-	unsigned long cpu_rate;
-	unsigned long ddr_rate;
-	unsigned long ahb_rate;
-	u32 pll, out_div, ref_div, nint, hfrac, lfrac, clk_ctrl, postdiv;
-	u32 cpu_pll, ddr_pll;
-
-	ref_rate = ath79_get_ref_rate();
-
-	pll = __raw_readl(pll_base + QCA956X_PLL_CPU_CONFIG_REG);
-	out_div = (pll >> QCA956X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
-		  QCA956X_PLL_CPU_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA956X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
-		  QCA956X_PLL_CPU_CONFIG_REFDIV_MASK;
-
-	pll = __raw_readl(pll_base + QCA956X_PLL_CPU_CONFIG1_REG);
-	nint = (pll >> QCA956X_PLL_CPU_CONFIG1_NINT_SHIFT) &
-	       QCA956X_PLL_CPU_CONFIG1_NINT_MASK;
-	hfrac = (pll >> QCA956X_PLL_CPU_CONFIG1_NFRAC_H_SHIFT) &
-	       QCA956X_PLL_CPU_CONFIG1_NFRAC_H_MASK;
-	lfrac = (pll >> QCA956X_PLL_CPU_CONFIG1_NFRAC_L_SHIFT) &
-	       QCA956X_PLL_CPU_CONFIG1_NFRAC_L_MASK;
-
-	cpu_pll = nint * ref_rate / ref_div;
-	cpu_pll += (lfrac * ref_rate) / ((ref_div * 25) << 13);
-	cpu_pll += (hfrac >> 13) * ref_rate / ref_div;
-	cpu_pll /= (1 << out_div);
-
-	pll = __raw_readl(pll_base + QCA956X_PLL_DDR_CONFIG_REG);
-	out_div = (pll >> QCA956X_PLL_DDR_CONFIG_OUTDIV_SHIFT) &
-		  QCA956X_PLL_DDR_CONFIG_OUTDIV_MASK;
-	ref_div = (pll >> QCA956X_PLL_DDR_CONFIG_REFDIV_SHIFT) &
-		  QCA956X_PLL_DDR_CONFIG_REFDIV_MASK;
-	pll = __raw_readl(pll_base + QCA956X_PLL_DDR_CONFIG1_REG);
-	nint = (pll >> QCA956X_PLL_DDR_CONFIG1_NINT_SHIFT) &
-	       QCA956X_PLL_DDR_CONFIG1_NINT_MASK;
-	hfrac = (pll >> QCA956X_PLL_DDR_CONFIG1_NFRAC_H_SHIFT) &
-	       QCA956X_PLL_DDR_CONFIG1_NFRAC_H_MASK;
-	lfrac = (pll >> QCA956X_PLL_DDR_CONFIG1_NFRAC_L_SHIFT) &
-	       QCA956X_PLL_DDR_CONFIG1_NFRAC_L_MASK;
-
-	ddr_pll = nint * ref_rate / ref_div;
-	ddr_pll += (lfrac * ref_rate) / ((ref_div * 25) << 13);
-	ddr_pll += (hfrac >> 13) * ref_rate / ref_div;
-	ddr_pll /= (1 << out_div);
-
-	clk_ctrl = __raw_readl(pll_base + QCA956X_PLL_CLK_CTRL_REG);
-
-	postdiv = (clk_ctrl >> QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_SHIFT) &
-		  QCA956X_PLL_CLK_CTRL_CPU_POST_DIV_MASK;
-
-	if (clk_ctrl & QCA956X_PLL_CLK_CTRL_CPU_PLL_BYPASS)
-		cpu_rate = ref_rate;
-	else if (clk_ctrl & QCA956X_PLL_CLK_CTRL_CPU_DDRCLK_FROM_CPUPLL)
-		cpu_rate = ddr_pll / (postdiv + 1);
-	else
-		cpu_rate = cpu_pll / (postdiv + 1);
-
-	postdiv = (clk_ctrl >> QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_SHIFT) &
-		  QCA956X_PLL_CLK_CTRL_DDR_POST_DIV_MASK;
-
-	if (clk_ctrl & QCA956X_PLL_CLK_CTRL_DDR_PLL_BYPASS)
-		ddr_rate = ref_rate;
-	else if (clk_ctrl & QCA956X_PLL_CLK_CTRL_CPU_DDRCLK_FROM_DDRPLL)
-		ddr_rate = cpu_pll / (postdiv + 1);
-	else
-		ddr_rate = ddr_pll / (postdiv + 1);
-
-	postdiv = (clk_ctrl >> QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_SHIFT) &
-		  QCA956X_PLL_CLK_CTRL_AHB_POST_DIV_MASK;
-
-	if (clk_ctrl & QCA956X_PLL_CLK_CTRL_AHB_PLL_BYPASS)
-		ahb_rate = ref_rate;
-	else if (clk_ctrl & QCA956X_PLL_CLK_CTRL_AHBCLK_FROM_DDRPLL)
-		ahb_rate = ddr_pll / (postdiv + 1);
-	else
-		ahb_rate = cpu_pll / (postdiv + 1);
-
-	ath79_set_clk(ATH79_CLK_CPU, cpu_rate);
-	ath79_set_clk(ATH79_CLK_DDR, ddr_rate);
-	ath79_set_clk(ATH79_CLK_AHB, ahb_rate);
-}
-
-static void __init ath79_clocks_init_dt(struct device_node *np)
-{
-	struct clk *ref_clk;
-	void __iomem *pll_base;
-
-	/*
-	 * The board's crystal. Without a rate in the device tree, the arch
-	 * code registers it from the bootstrap pins.
-	 */
-	ref_clk = of_clk_get(np, 0);
-	if (IS_ERR(ref_clk))
-		ref_clk = clk_get_sys(NULL, "ref");
-	if (!IS_ERR(ref_clk))
-		clks[ATH79_CLK_REF] = ref_clk;
-
-	pll_base = of_iomap(np, 0);
-	if (!pll_base) {
-		pr_err("%pOF: can't map pll registers\n", np);
-		goto err_clk;
-	}
-
-	if (of_device_is_compatible(np, "qca,ar7100-pll"))
-		ar71xx_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar7240-pll") ||
-		 of_device_is_compatible(np, "qca,ar9130-pll"))
-		ar724x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar9330-pll"))
-		ar933x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar9340-pll"))
-		ar934x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9530-pll"))
-		qca953x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9550-pll"))
-		qca955x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
-		qca956x_clocks_init(pll_base);
-
-	if (!clks[ATH79_CLK_MDIO])
-		clks[ATH79_CLK_MDIO] = clks[ATH79_CLK_REF];
-
-	if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data)) {
-		pr_err("%pOF: could not register clk provider\n", np);
-		goto err_iounmap;
-	}
-
-	return;
-
-err_iounmap:
-	iounmap(pll_base);
-
-err_clk:
-	clk_put(ref_clk);
-}
-
-CLK_OF_DECLARE(ar7100_clk, "qca,ar7100-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar7240_clk, "qca,ar7240-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9330_clk, "qca,ar9330-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9340_clk, "qca,ar9340-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9530_clk, "qca,qca9530-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9550_clk, "qca,qca9550-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9560_clk, "qca,qca9560-pll", ath79_clocks_init_dt);
-- 
2.56.0

