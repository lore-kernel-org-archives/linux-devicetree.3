Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B3141F5C7
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873534; cv=none; b=DUnS4SOjr/v6E7TT3XDP0nEbpE6Mr69s4zlqTh8RG0OQhysSZMPNaZy9gWrI8+SKw/QIczkYsxQQpqXpp1eDI5UNQg5NffZgxXx+9MPM6Irt/UXCQW/mvnMLu2SLcgoRG7xUW4z+9SP9lJsAdWFMQiRqOQqrlNs+xcu+kgSMpLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873534; c=relaxed/simple;
	bh=S6VN1ivEjsnqdL0+GBtBo5w+y3FRTxaL/3RuWyOjMuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjPBb0GVZHmBPFJ+l7vpLFmJftE76SyYbk0zYgBySqqPYNLXm7Wve/geQkclXFsd0VebA+f5H9DgnXGIsth62eBzX8bxnIpcMyy2UFxAY+cJSE7tny56/e4/fev+s7gnI+2eTlqqEjT6JRAr995pnJeFYRukz0NA7zDwyFfBxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzpN/rmo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzpN/rmo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso35486925e9.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873528; x=1791478328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2gL6Rq6LC2RfmgVFHY4W3DCjCPHLR3TrZ1IA237aSw=;
        b=BzpN/rmozWoFkZGZ2Fs2WL/g89vJuFQijEkRX6CCeQ/Ks+oQwyM0j9p3EmdMO5p2kD
         bC7Mv8510fBetdnRzw7yu/zZ8U39ZNMu7AlF2zE4crcJULDm340hgJjOOM2cgrOrRE5v
         K0djdh4dN2c9aRsVrfq0WFHZmr7nza9hHNKW4neerm+qOc6fEeWCBmPfiRyJ+W92YeEu
         6CUo6Ake9N+jBVMtpgIKxsjoIPfHxYUmIzjKJ5lnCeMnXahCzQv0f/dRq2NJm01lTDzR
         0EHiBt4MHRUDVfMAX4FQUMwArueDjLZqKm6StdRZXrJjlp4KafHcvzkNjC0bl1s+Yk0Y
         XxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873528; x=1791478328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2gL6Rq6LC2RfmgVFHY4W3DCjCPHLR3TrZ1IA237aSw=;
        b=XIlKqt85ruilkcxVwh8uiWBNkZ5eaCB9WYOLpA47HK+U4IXQokyH+BGVde0JsU07t6
         76H7NWoJ86v7u94emC6EDNIF3Ze3gZhEb8BvW3Qma0Xu4yskz/6b3/grTce9l9OsShqn
         YTbR6UB5Pti1N91vu6BM9HIsMGfOX67KWtL3kni1+PcedsEt6yg2m+Oq9Q8BwZYlFQrV
         ht5IgYB1Z3QNLOyizo1U82JEcimkYeoaQSy+qOKvgp7ciTxGUcKRQ+YUty1msWVBSpyZ
         q6rxZt4wE/D2Gv41CntvwVhaH8kKABbm9lGh/4oE5iWuMybiou/iWkTCl4+8mhTNkiQA
         H92g==
X-Forwarded-Encrypted: i=1; AKwUvByUHFeNqQOXXJC7S7a58DkVWPd5vY8jzkSiQjLo9PCsTi10TCw0BmrC8MC4KRW/zxBrZJF0fsk0bSVc@vger.kernel.org
X-Gm-Message-State: AFuF++nnVNPb5/VHXvkbrvCXIaijHdeZxmOEKh6R5fFR1vuttF4Rcw2S
	AbFDzT/7iKSIFV6jxW4+fHIhduonShoNEc5Bf6jiByvyOJdGpXs7Wgae
X-Gm-Gg: AYBFou2UwWwF2d6j4YAVsw5gb5+fHzmP6vhlsOMmWJh2+kT0lxQyVissjhDABeru/F1
	fYKN6PRtjt1w1fhylgATPfDt4Lo9lMZayjDTHPn+1nhf1EHtmnTiFqxaYWxUSX4/vSSoxNT05dv
	ICIpVWhm+vQKHNkxh3RCBnR8uGHGtgsS4Uq4eT7x4BVtNFrL5nvP68QhOYTIBz77Bb0zyd0Po/3
	44Vd+51/tlIPhsEpiZts11xu3jUp9eFUFT3sa2iXD2IYVULPL0PLk89jzMJ7ymiDTr+7eFKFpFX
	yrxU7RlWZ+RWzE7mpoaqtbEakDhBWMMSyuGcUd05o84oncrNwTuqszo4xWwt8/4IRsVPgWZT26U
	cBf1fKx0KfEnp7caEH18tis9vKKBbS7tJ1zjbPi70aFpuSpOdeenp7TpsYRFu4tsNTfZuf5gXa6
	Y78dLrHvGeri43Td4tWcTkXfbNtZcWwL/1sPxhZrnGuDWigQ/e/vjDNxx4FryeF942ct3TRQZ1Y
	KUmUqxJtrAQ86H6OZ8yMkLJqPOXD675Ey0hpxYn0iQYd4CaoBjpcU6TanmKhsemPEJvUJSSyf0B
	D7W9mtyb
X-Received: by 2002:a05:600c:4e8e:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-4a02759b360mr3749095e9.18.1790873527643;
        Thu, 01 Oct 2026 09:52:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 1/7] clk: renesas: r9a09g077: Add helper to start WDTDCR counter
Date: Thu,  1 Oct 2026 17:51:55 +0100
Message-ID: <20261001165201.763882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCRm registers are not suitable for access through the SYSC regmap
from atomic or panic context, as regmap locking can deadlock when another
CPU holding the lock has already stopped.

Add a lockless helper to clear WDTDCRm.WDTSTOPCTRL and start the watchdog
counter using the existing SYSC register accessors.

Export the helper in the RZT2H_CPG namespace for use by the watchdog
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7->v8:
- No change

v6->v7:
- New patch
---
 drivers/clk/renesas/r9a09g077-cpg.c | 35 ++++++++++++++++++++++++-----
 include/linux/clk/renesas.h         |  6 +++++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 5a0e7df1eb06..90f0c373976f 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -103,10 +104,17 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define RZT2H_SYSC_BLOCK(x)		FIELD_GET(RZT2H_SYSC_BLOCK_MASK, x)
 #define RZT2H_SYSC_REG_OFFSET(x)	FIELD_GET(RZT2H_SYSC_OFFSET_MASK, x)
 
+/* WDT Debug Control Registers (WDTDCRm), in the block 1 SYSC region */
+#define RZT2H_WDTDCR(n)			(RZT2H_SYSC_BLOCK_MASK | (0x5100 + (n) * 4))
+#define RZT2H_WDTDCR_WDTSTOPCTRL	BIT(0)
+#define RZT2H_WDT_MAX_INSTANCES		6
+
 struct r9a09g077_sysc_reg {
 	void __iomem *base[2];
 };
 
+static struct r9a09g077_sysc_reg *r9a09g077_sysc_regs;
+
 enum rzt2h_clk_types {
 	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
 	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
@@ -963,10 +971,25 @@ static bool r9a09g077_writeable_readable_sysc(struct device *dev, unsigned int r
 	}
 }
 
+void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index)
+{
+	struct r9a09g077_sysc_reg *sysc = r9a09g077_sysc_regs;
+	unsigned int reg, val;
+
+	/* Sanity check: ensure sysc is initialized and wdt_index is valid */
+	if (!sysc || wdt_index >= RZT2H_WDT_MAX_INSTANCES)
+		return;
+
+	reg = RZT2H_WDTDCR(wdt_index);
+	r9a09g077_regmap_read(sysc, reg, &val);
+	val &= ~RZT2H_WDTDCR_WDTSTOPCTRL;
+	r9a09g077_regmap_write(sysc, reg, val);
+}
+EXPORT_SYMBOL_NS_GPL(rzt2h_cpg_wdtdcr_count_start, "RZT2H_CPG");
+
 static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 {
 	struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
-	struct r9a09g077_sysc_reg *sysc_reg;
 	struct regmap *regmap;
 	struct resource res;
 	int ret;
@@ -991,13 +1014,13 @@ static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 	if (!regmap_cfg)
 		return -ENOMEM;
 
-	sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
-	if (!sysc_reg)
+	r9a09g077_sysc_regs = devm_kzalloc(dev, sizeof(*r9a09g077_sysc_regs), GFP_KERNEL);
+	if (!r9a09g077_sysc_regs)
 		return -ENOMEM;
 
 	/* Only allow access in the SYSC regions */
-	sysc_reg->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
-	sysc_reg->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
+	r9a09g077_sysc_regs->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
+	r9a09g077_sysc_regs->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
 
 	regmap_cfg->name = "rzt2h_sysc";
 	regmap_cfg->reg_bits = 32;
@@ -1008,7 +1031,7 @@ static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
 	regmap_cfg->readable_reg = r9a09g077_writeable_readable_sysc;
 	regmap_cfg->writeable_reg = r9a09g077_writeable_readable_sysc;
 
-	regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, sysc_reg, regmap_cfg);
+	regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, r9a09g077_sysc_regs, regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c9495558cd5c..1e171db25eb7 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -216,4 +216,10 @@ static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *li
 #define rzv2h_get_pll_pars	rzv2h_cpg_get_pll_pars
 #define rzv2h_get_pll_divs_pars	rzv2h_cpg_get_pll_divs_pars
 
+#if defined(CONFIG_CLK_R9A09G077) || defined(CONFIG_CLK_R9A09G087)
+void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index);
+#else
+static inline void rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index) { }
+#endif
+
 #endif
-- 
2.55.0

