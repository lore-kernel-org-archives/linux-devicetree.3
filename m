Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC5743CEF3
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125490; cv=none; b=Ef1cEiPzpaLMtXBOlo6QIX+HU7wGShYP0p24iiVq7At1ms7g4Ew0/oCgLGK5Z+MRxMOChX2yWlbMLTqbvCCsPfjXtG2KtjnQsgz/E1Sci68z5I/Laoq/qvZWJgvhsIROzsi8RubJYZMlofIqbcXJSjMhDhsQerWxVRtbfd94MpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125490; c=relaxed/simple;
	bh=7kpJ0HynFt2+Fb9i+/TLOlwncx9aXxoDxSm2N81XzUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBrJfyGQxx4W0LCbj3V7a2hqwNgrL5p3/dSnkUq/2qoywRZkyzxqBr/BJwL77/GSTKv+c9112DUKtGPVEhfwvXAFfdp5pj0K5RPfh1q8PN6zjzOCSTPZLseJUGAB9xxImdhsQkScA9IhdvgIfmc426p+5mWXOq80p7HAMfpCUHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T36KFw8o; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T36KFw8o"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so1150495a12.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125470; x=1789730270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbBV9me3Y/nkvKnsfG5cg/h1HCFDgWHdjYuS8kLRmRY=;
        b=T36KFw8o8CtHNsvSVpt6A+YN3pK8Ceb9kNsVedh1IZqCHh/IgCkhQo9AVx3oc1nfjV
         4aNgKcs9wTb2eLki1T+phE+ekXA4INuMFb9EEVZBJ/6cqrdUrSEub2ZMoqF6maeRelnA
         bu/fANL9zf60yaTwF6RjvIlhdptaVWtNwxnwiTXaeEl7ebHHNi6DEmi2DBtTBPRaKuRW
         uIK6iEy6siU4tSGjJP8TWX1gnR28w5VbYDAkfFz7Xohlk9lLlbNcdaKH0QY6Hj2Bxvea
         B9TxT7P7KBiyzQKby0ck2Ukupn7P8GV2Zfr1T94B9SED5l7NstHRKZLA9pgiselGwCW3
         PvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125470; x=1789730270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbBV9me3Y/nkvKnsfG5cg/h1HCFDgWHdjYuS8kLRmRY=;
        b=tF1xsmwqhp6TIkvXfBBIyRzDazxqIQ5ErS14tARvgEENaIbsXwyfZ2LiiVTVY1keVv
         e4W5/8FUpDT+ysW9CFab351v8zL60a8c3F7ivDP6NswvOSDEWrldOvLOBU27SG+b8jbJ
         0TUahFQrO/ULG2FDXrFxgxr9jAVknMWsRLZt/vPMg5DcqV4njjASZgmmLGuvhjtaB4Kv
         GHgajoAn7oeZdu5JTKSYuxwO91W90X17vXZbYDwPEK5byWBV6UAa0KbBHmIjaN35rUlC
         48bcLbiBR9k2GNANWdA+8L9uicUerkZy/sRBW2opebXSJZOagYp3EprLlUx5E1l0RLHw
         7Utg==
X-Forwarded-Encrypted: i=1; AKwUvByTL2hP9LSq6b+BA2GoPeHKOJ5vmg5Gy3Gk7a2qaD8NioYQQ/ulmD7RUz3fDaF72TlOrauwAwklOAhw@vger.kernel.org
X-Gm-Message-State: AFuF++lglTG9i5r1XSIPWM9ww9c1NYWEJBGcyzO3V9UXEZcr3f41diJL
	AmxnDA66wzZQ5N0iHgF68z0cqfJuRWps4x7OzCykGAxlT52/J6HhaYTe
X-Gm-Gg: AYBFou2+HSqM4t9f7F7znrVuffFr+hYkdpmIKlWv01vf1//pCMAzRE+dk108luyms9G
	XYwW99Q6UMtjpHaXjuprJ5k6xWtPlZnIQuJY1tQpkDIzrtixc0N1dJl8lp0c9O4+EWvdUq1tRrR
	2sOADhYOF6mgNZWq6/9KI1dr7M/JdyRruwE6z6fDr9+QHmTc3ETnC7TufmKGHEfK38vGMFqVcbi
	+apkdxDhaYG8BADcd+igFHP0KGpJwUeJDULf6MQzrdrIWkfEThYwxTGLx1TFOtvF7Ao9+REIsaV
	JEIYOmfSYVzmnczxqJdgwCG5iG3deibaFw2ReCjO3k3LsCBQvAa4LPqVyvZjgqjcvjgQiCJVB2e
	35MDCoCQKo8JpbnN2kWPPCpYUxrcu0mo5z91P8Uc3PZV2+2HKXBBjeuPwO4fze7SxfrbMsGEnv1
	aPjZSdCOgspIsfPor1YNYwZmUP8m4twmOgRUTxrRo15LE+723WItXf6s0ojcyS10yQvR7kU7M+u
	AoqV8gxl476YPYuNPMFnEWld/GOSdQXxEum9oRRQupT015ppvGWMI6qxRmTWdrxBf3qXBF0wZ69
	sUqMt0JZY84WrhsYX4A=
X-Received: by 2002:a05:6402:3907:b0:6a9:92f0:76c7 with SMTP id 4fb4d7f45d1cf-6a9b56ae97amr1630629a12.34.1789125469553;
        Fri, 11 Sep 2026 04:17:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
Date: Fri, 11 Sep 2026 12:17:29 +0100
Message-ID: <20260911111731.3404308-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) resides
in the second register region of the CPG/MSSR block. Since this
multi-function block is shared with other peripherals, it is exposed via a
syscon regmap interface.

Look up the SYSC regmap using the optional "renesas,sysc" property and
derive the WDTDCR offset from the watchdog instance index.

Retain the existing MMIO-based access method when the "renesas,sysc"
property is absent to preserve compatibility with existing DT's.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Code changes due to regmap_lock introduction.

v3->v4:
- No change

v2->v3:
- Made use of the new "renesas,sysc" phandle-array property to access the
  WDTDCR register via the CPG/MSSR syscon node.
- Updated commit message

v1->v2:
- No change.
---
 drivers/watchdog/Kconfig     |  1 +
 drivers/watchdog/rzv2h_wdt.c | 64 +++++++++++++++++++++++++++---------
 2 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef..3c4fc9916d8c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1046,6 +1046,7 @@ config RENESAS_RZV2HWDT
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
+	select MFD_SYSCON
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/{G3E,V2H(P)} SoCs. These watchdogs can be used to reset a
diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 550112446db4..fcd1ff99c0ed 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -46,6 +47,11 @@
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
+#define RZT2H_WDT_MAX_INSTANCES	6
+
+#define RZT2H_SYS_BLOCK1(n)	(BIT(16) | (0x5100 + (n) * 4))
+#define RZT2H_WDTDCR_OFFSET(n)	RZT2H_SYS_BLOCK1(n)
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -66,15 +72,20 @@ struct rzv2h_of_data {
 	bool wdtdcr;
 };
 
+struct rzv2h_sysc_wdtdcr {
+	struct regmap *regmap;
+	spinlock_t regmap_lock; /* Protects access to the regmap */
+	unsigned int offset;
+};
+
 struct rzv2h_wdt_priv {
 	void __iomem *base;
-	struct regmap *wdtdcr_regmap;
-	spinlock_t regmap_lock; /* Protects access to the wdtdcr_regmap */
 	struct clk *pclk;
 	struct clk *oscclk;
 	struct reset_control *rstc;
 	struct watchdog_device wdev;
 	const struct rzv2h_of_data *of_data;
+	struct rzv2h_sysc_wdtdcr sysc;
 };
 
 static int rzv2h_wdt_ping(struct watchdog_device *wdev)
@@ -93,18 +104,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 
 static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	guard(spinlock_irqsave)(&priv->regmap_lock);
-	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+	guard(spinlock_irqsave)(&sysc->regmap_lock);
+	return regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
 }
 
 static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt_priv *priv)
 {
-	return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+	return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
 }
 
 static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
-	guard(spinlock_irqsave)(&priv->regmap_lock);
+	guard(spinlock_irqsave)(&priv->sysc.regmap_lock);
 	return rzt2h_wdt_wdtdcr_count_start_nolock(priv);
 }
 
@@ -274,19 +289,38 @@ static const struct regmap_config rzv2h_wdtdcr_regmap_config = {
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
-	void __iomem *wdtdcr;
+	struct device_node *np = pdev->dev.of_node;
+	bool syscon_present = of_property_present(np, "renesas,sysc");
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
 	int ret;
 
-	wdtdcr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(wdtdcr))
-		return PTR_ERR(wdtdcr);
+	spin_lock_init(&sysc->regmap_lock);
 
-	spin_lock_init(&priv->regmap_lock);
+	if (syscon_present) {
+		unsigned int wdt_index;
 
-	priv->wdtdcr_regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
-						    &rzv2h_wdtdcr_regmap_config);
-	if (IS_ERR(priv->wdtdcr_regmap))
-		return PTR_ERR(priv->wdtdcr_regmap);
+		sysc->regmap = syscon_regmap_lookup_by_phandle_args(np, "renesas,sysc",
+								    1, &wdt_index);
+		if (IS_ERR(sysc->regmap))
+			return PTR_ERR(sysc->regmap);
+
+		if (wdt_index >= RZT2H_WDT_MAX_INSTANCES)
+			return -EINVAL;
+
+		sysc->offset = RZT2H_WDTDCR_OFFSET(wdt_index);
+	} else {
+		void __iomem *wdtdcr;
+
+		wdtdcr = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(wdtdcr))
+			return PTR_ERR(wdtdcr);
+
+		sysc->regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
+						     &rzv2h_wdtdcr_regmap_config);
+		if (IS_ERR(sysc->regmap))
+			return PTR_ERR(sysc->regmap);
+		sysc->offset = WDTDCR;
+	}
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
-- 
2.55.0

