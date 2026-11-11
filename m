Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395244;
	b=3+DyFDHmnAHuOLhSYBUAk4RySCr1nkCgHBfDersimyNHIiJnbvnoSvc4c+mQGKkz0b9v
	 mSjuTxGoEoxBgK6+kBCy3dLUOyTM+0wH4A05NbqDw9xyRRhcq+AazpzZ6w5Le9gbbAuBd
	 Gr7cDN540p610PQ365RNZN0Uho7BjxFt/0Y2eHELK/Vce5Ljyi44uFA0I9sorDz+AvqJo
	 PK5eOGiC7lZKwxkq3+FtGcmAPJMq59y8yEelSm2VPe+kUYQA50McDgI8ZUz40IRV1MHbE
	 9wGaosDu5RX65QQ9fwsJi2LqRyIDJXP3y5w1OxRvDKTTiZ2vpasyS3Qf3S8bko/Tpgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0G2v/eEbgk+3iTnp8ZvOYsDQu49c2J5IO9S93LGndYE=;
	b=v4coQdZEfJYIqm1aevFe9hDaTcVVQQjNg0OZqn5iuwoDCYdVb7FrcYrXl8mqe1RER2Sl
	 GifNo8Rx4y4jp+46TSysqDgl0Zt7/4910eVCEJkPP1qiZWzjcWXLfjF0E1yY3G/i7GgXA
	 MKZkjmmbyM9aOhj5EA+ioX/SW2WgBnEM67I0NhT4dZ/JfibOJ2ne10R9ArBQKnTGoI9d1
	 Us+Oq1K6Z8VnicnnBd3h6XkRzJyNrp/NT0OgyO5gF0yZhBgrvrx70cVfw2laZrmRDZICC
	 51hvphUEPElaLoaZHKQg4oJu2hoOX1ug79HyrPgXkS+U/f4kxJcU0NZT+c3s4KRITGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm8Hy4f0;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B028606A33A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B028606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm8Hy4f0
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso20710975e9.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395243; x=1795000043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0G2v/eEbgk+3iTnp8ZvOYsDQu49c2J5IO9S93LGndYE=;
        b=pm8Hy4f0jSS3E6MB3iGev0env48KECBGEevdmcbYfffKzZ8Jor8mkpdAiFiTO94sY/
         +3/lcKGwD13yZi60c1yIjHCHf+AbDsK0ojUXnoHEaMM9exl/6LCilCyr06lM5qXuwSPt
         Aoh2k5Q/zXzsrcJpALFGAjNhFrgQhC0IfoQ1S2o2XBAMdrHD95qiXaFK6v6gE+sEahJ6
         YtaMQjaB90RbPp1fAI1t8A/uZDGKzuwHJ9U2/ch2PuA8c6oHV72dV6D6SzCsRaCXRBOR
         cdZ7RMBmXuiFW2sUAk+pQC0k/D4mD/NmzWPgqf6fAVQ62JAv752KJ3nXsdrD8sCnnOz0
         glKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395243; x=1795000043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0G2v/eEbgk+3iTnp8ZvOYsDQu49c2J5IO9S93LGndYE=;
        b=rfuLXqtyY4bk01PwmRHX1weIp5Ej2ZMUNQoNtDpi039BeY5jndPYBQhRPs+N+UpXn4
         napiuaPdUqPehNqzI9BhUuezvDuWgDSjO3oIuYDLXsaX0yL0HxFeoAPoWpc/oN2SmYSt
         +Scw+J3Bd+bZreEnALXF/pAX2rvB/JsOqa30/r17vo7SE1DyZ14p5Qts9+p+i5iyXY+m
         3TqgTrNn51QUFPU5fBeN+yY5twerx2CoJb/eBgW+59pwGUEi/5Bkm6fzYBzsQxaHn60k
         6FaTDw9cIk5b6jpeLU1PeBNZ0ekrK5/P5+dYKtrCFX9d7sa/rLA2Dzck2rclxYJSy7Ny
         3EIQ==
X-Forwarded-Encrypted: i=1; AL+hErHRqIoxKNaDDoGtSQrJ24EcWFR/I1C88EqsD7ZxPWcWPkjZMVxLdJ8LBPcR3tcTy+iMe5OKH5EOVAOa@vger.kernel.org
X-Gm-Message-State: APuU4Z9nCiSpB2vpE8IVdEZv2PRjWvSEXQ2GHfZjU3kzETlBMx1zrzNg
	djOyagMBxUHqGgn6hHZvxtZo/g/XBGjdNiaopjW4/I1UN8BRK1tvl5jA
X-Gm-Gg: AYBFou0cF7Lc5LAPw1apWuKN3MMDxwxrwaa3qgciibEXJfpQ9+eKC3APnJR9T5QbPgG
	pgORYupCqjtDGAZuKMoAxBcXeAordmUHwyC9EYqp22/yIaIcXU92V3Xw781GXG00EbkySsWUpNU
	k/iZoI4+XU1wqcgoNYs0qaEEx6JB3NxKj30P1pMHT3F8ZQ5MfXLI3lE/jHsmSuYqHYuEwOHJGkX
	ZNPvc7sxSTwWC+usaJpPC4fR9GZVFkixWsTuIM88Yfe2B5GROZIKQGsJsUrA9NMD833r1C9RAfq
	dB6apCGrkoX0XrJZQ8nTvox443ZwD8NQaU14V7/oa4BQnPLj4+g0kv4xeQzuYeK/SUm+P3WhzG2
	bZXtLQW7bJAlBkWGW2x9i/DKe5RDvp54sLuQrXxhoZYri50RCJbmxKof4IEH7mtHDZKcALomw7+
	/J9JNHPTPnpvfgQAcPptHct1d/fP2VtCyDvs8KT+rxhmeu+Ic+OhMld0EVdv/gw7m98FhXrUejT
	SthzdkuKNtSwLAaQcT2uZ+pQLrM8y5xjNpnzIKXzAatDg9Cwv9pNz0dqbi0qOokQi+TeXy0oewx
	zOKCN9UpTadZD1gx92o/FRYihstEK5j3jxLIhQWfIsmePRI+63lVAUPXrgz67kJALRfk2zRdWOv
	jUIlbA+jxdDfr7Xb/gDmtTK1Wgty/hY7REo8ncu0lUB7bWLPmNj3tfnzVwDuZ2+oaDJLpt6PDlk
	58FOK1XVSE
X-Received: by 2002:a05:600c:3486:b0:4ba:6d8:dfaa with SMTP id 5b1f17b1804b1-4ba0936e95bmr39114245e9.12.1794395242201;
        Wed, 11 Nov 2026 03:07:22 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:21 -0800 (PST)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 1/4] clk: renesas: r9a09g077: Add helper to start WDTDCR counter
Date: Wed, 11 Nov 2026 11:06:57 +0000
Message-ID: <20261111110700.3331225-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v8->v9:
- Rebased on -next due to devm_kzalloc_obj change

v7->v8:
- No change

v6->v7:
- New patch
---
 drivers/clk/renesas/r9a09g077-cpg.c | 35 ++++++++++++++++++++++++-----
 include/linux/clk/renesas.h         |  6 +++++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 7dd1f44b26e3..6ecf863b743e 100644
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
 
-	sysc_reg = devm_kzalloc_obj(dev, *sysc_reg);
-	if (!sysc_reg)
+	r9a09g077_sysc_regs = devm_kzalloc_obj(dev, *r9a09g077_sysc_regs);
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
2.56.1

