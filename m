Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288023A99F
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784438602; cv=none; b=odb0wYdFjClIyOI9UVzS8Oi2juLQUVqu9TjiEWdEcmeXe6k2nSK0YmeK7ZdKDYL3o+EgrijJk+E1ji1zgM7PxA/6Vq3hd08iw6o+VE6mSTYCJ6acUa8X/9hmXhXzWcG1u/esjuxd62EdSy+cusvoG1b5YT2RBxSrYIz054D70AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784438602; c=relaxed/simple;
	bh=cxtZuaEw1UMaJjfN/dSnrD/RYOPlm8tv5B9OMNIQuxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJ3+PShk7wHk7iVQ6ZEIcv9zzoNDFosJepBM9S7N178Q32E4gW1q7eKu07V0lSrdWO29R45Y9vbOTjr2sdz1bJq8JG2AqZd4GPEA5dK+rfYlffvC4zx7KRpksnPvmFU6vjD3/eH/uWuZqvOi6E15/P9+yvJA6rclVamuCYFYp5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoS2VJmY; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoS2VJmY"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so7126950a12.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784438601; x=1785043401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ/9YxE8f5UbeN3J0t4LKoL5GudGidDACl40NXpjpQ4=;
        b=hoS2VJmYQkBX6cH8n5BVDFK+lNF2rVilFL0ewUcGijvxv8/0dkxH+0qRt5u+IAH2tB
         osE7KAB3DVCHnCmqvFZ93tnomuNeGz5pDpxheuBuUB00NW83RQtZZJPGGy9ZFtcuImUj
         T3rIl0ekWssE/Dp43LnofG0yy+hThIL8ZBd//TD2TiVQ0idKILHUfZIvGFzy0NM9Hskt
         WzvM330z2oCdy9gWcK0voYFcXvq7VmPYWKPh3RLBkc/JoVj/U9HO5/78Y/1lq9aa4J4B
         eHX4NTjPoVyBIvVbZ43INzqni+tuCvUiBSah0ZJ4d+GCSwHKzOTcjh05KXM3lnPc1eIc
         NrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784438601; x=1785043401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZ/9YxE8f5UbeN3J0t4LKoL5GudGidDACl40NXpjpQ4=;
        b=ABOKQ4fxhmrd3MvfyoxZYrgwmaDxdKHok3R/YnoSESDRe3tGWaaOHbFxMwpj4iDxj/
         u9vuQGYXTXwJYgZJ0F44BctBpBB3FYUfLCSnfdDl+ntLR2TUDA0k5muRdXxGr9XFLVgQ
         U2TOhc9TZYvNTubGJxW+W7sv1vxus9UY3VIvF6xPfF893j+K2WSUAUnsmni7Vn72nGp9
         K2eIkpCnBXU0KMMEHQW3s53pAACzmMMHA3W97t/m8tbQYR+2s8ljLfuiwZ+Ad4Uqd2eI
         Hg2A0xFkMV1IhpHSnNwrEkBKqUO8JAH+1ZSV5E4tIxeEUelGyNzNNSDa54wAw/G+x/ZP
         fCaw==
X-Gm-Message-State: AOJu0YyESCoUL9o3fl1riHp/Az40zyA32t5bZUXO9hgYB5TsMVFUArdT
	ftozTnk4wpAmT1cPjfcjaOsd+v12M5zB+PKBS6+IOEzJLzz4mz/CZWKzpC4gxA==
X-Gm-Gg: AfdE7ckTmWZ6cT149XwefBBEmRWgPdPDMXlfx6DlMu1ujiQRqATG0vnHts7VrPU1XGC
	Da7uVZjRef3GA9JHzwKJF3hVUNVRNPLBGtJG5yrZ5TuXSaEiAhgwYOCcHmnL/MkYhwNTaJljJ+4
	OuYbpdxGNL5UaRtwwCmAY/BKJJ4frBLU9JgnFLmI07/K24DrLbGrxlCKTjzKK4c6ovWXavCQtWT
	Gdesoew5oRouVscNg/tQNcxUKbqf1WLQH/S08+npXm5mF1nqxzYLCRyrg40b3zrszBU+ex9yRm4
	jN9dM6dXzE6RFXS1r2wtqLcd0UnVe0Av/K1Lq8ZkMcPEKySHFZ/Yqr6n6aQ156dkLx727h85+4j
	mSYOrelDgtJCh5hIEr/D8dFYo+cTKUwgBh6+1QUlsTcUASogJ4qA1MKD0P8eEwNq5L5mW2R1nFs
	Oj8HIFfBvX22UHUPQKww4+MBy9etlD2CT1sw8TPYYv1fMgHqndYmxAVEz+DcsQSAZJCA==
X-Received: by 2002:a05:6a21:1404:b0:3bf:6c08:fb83 with SMTP id adf61e73a8af0-3c3ad9bc105mr9522329637.51.1784438600773;
        Sat, 18 Jul 2026 22:23:20 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:431d:c6bc:133f:2959])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbab9sm25950461eec.15.2026.07.18.22.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 22:23:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 18 Jul 2026 22:22:55 -0700
Subject: [PATCH 3/3] powerpc/512x: Remove pdm360ng platform setup in favor
 of mpc512x_generic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-ads7846-pdm360ng-v1-3-f318f85cda57@gmail.com>
References: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
In-Reply-To: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Anatolij Gustschin <agust@denx.de>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Now that the ADS7845 touchscreen on PDM360NG is fully described in the
device tree, custom platform setup in pdm360ng.c is no longer needed.

Add ifm,pdm360ng to the board match list in mpc512x_generic.c, update
Kconfig to select MPC512x_GENERIC for PDM360NG, and remove pdm360ng.c.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/platforms/512x/Kconfig           |   3 +-
 arch/powerpc/platforms/512x/Makefile          |   1 -
 arch/powerpc/platforms/512x/mpc512x_generic.c |   1 +
 arch/powerpc/platforms/512x/pdm360ng.c        | 126 --------------------------
 4 files changed, 3 insertions(+), 128 deletions(-)

diff --git a/arch/powerpc/platforms/512x/Kconfig b/arch/powerpc/platforms/512x/Kconfig
index deecede78776..9d46d791af05 100644
--- a/arch/powerpc/platforms/512x/Kconfig
+++ b/arch/powerpc/platforms/512x/Kconfig
@@ -32,11 +32,12 @@ config MPC512x_GENERIC
 	  which do not need custom platform specific setup.
 
 	  Compatible boards include:  Protonic LVT base boards (ZANMCU
-	  and VICVT2), Freescale MPC5125 Tower system.
+	  and VICVT2), Freescale MPC5125 Tower system, IFM PDM360NG.
 
 config PDM360NG
 	bool "ifm PDM360NG board"
 	depends on PPC_MPC512x
+	select MPC512x_GENERIC
 	select DEFAULT_UIMAGE
 	help
 	  This option enables support for the PDM360NG board.
diff --git a/arch/powerpc/platforms/512x/Makefile b/arch/powerpc/platforms/512x/Makefile
index 2daf22ee26a0..4da6f6923d8f 100644
--- a/arch/powerpc/platforms/512x/Makefile
+++ b/arch/powerpc/platforms/512x/Makefile
@@ -7,4 +7,3 @@ obj-y				+= mpc512x_shared.o
 obj-$(CONFIG_MPC5121_ADS)	+= mpc5121_ads.o mpc5121_ads_cpld.o
 obj-$(CONFIG_MPC512x_GENERIC)	+= mpc512x_generic.o
 obj-$(CONFIG_MPC512x_LPBFIFO)	+= mpc512x_lpbfifo.o
-obj-$(CONFIG_PDM360NG)		+= pdm360ng.o
diff --git a/arch/powerpc/platforms/512x/mpc512x_generic.c b/arch/powerpc/platforms/512x/mpc512x_generic.c
index d4fa6c302ccf..d330d3d85887 100644
--- a/arch/powerpc/platforms/512x/mpc512x_generic.c
+++ b/arch/powerpc/platforms/512x/mpc512x_generic.c
@@ -24,6 +24,7 @@ static const char * const board[] __initconst = {
 	"prt,prtlvt",
 	"fsl,mpc5125ads",
 	"ifm,ac14xx",
+	"ifm,pdm360ng",
 	NULL
 };
 
diff --git a/arch/powerpc/platforms/512x/pdm360ng.c b/arch/powerpc/platforms/512x/pdm360ng.c
deleted file mode 100644
index 8bbbf78bb42b..000000000000
--- a/arch/powerpc/platforms/512x/pdm360ng.c
+++ /dev/null
@@ -1,126 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2010 DENX Software Engineering
- *
- * Anatolij Gustschin, <agust@denx.de>
- *
- * PDM360NG board setup
- */
-
-#include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/io.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_fdt.h>
-
-#include <asm/machdep.h>
-#include <asm/ipic.h>
-
-#include "mpc512x.h"
-
-#if defined(CONFIG_TOUCHSCREEN_ADS7846) || \
-    defined(CONFIG_TOUCHSCREEN_ADS7846_MODULE)
-#include <linux/interrupt.h>
-#include <linux/spi/ads7846.h>
-#include <linux/spi/spi.h>
-#include <linux/notifier.h>
-
-static void *pdm360ng_gpio_base;
-
-static int pdm360ng_get_pendown_state(void)
-{
-	u32 reg;
-
-	reg = in_be32(pdm360ng_gpio_base + 0xc);
-	if (reg & 0x40)
-		setbits32(pdm360ng_gpio_base + 0xc, 0x40);
-
-	reg = in_be32(pdm360ng_gpio_base + 0x8);
-
-	/* return 1 if pen is down */
-	return (reg & 0x40) == 0;
-}
-
-static struct ads7846_platform_data pdm360ng_ads7846_pdata = {
-	.model			= 7845,
-	.get_pendown_state	= pdm360ng_get_pendown_state,
-	.irq_flags		= IRQF_TRIGGER_LOW,
-};
-
-static int __init pdm360ng_penirq_init(void)
-{
-	struct device_node *np;
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,mpc5121-gpio");
-	if (!np) {
-		pr_err("%s: Can't find 'mpc5121-gpio' node\n", __func__);
-		return -ENODEV;
-	}
-
-	pdm360ng_gpio_base = of_iomap(np, 0);
-	of_node_put(np);
-	if (!pdm360ng_gpio_base) {
-		pr_err("%s: Can't map gpio regs.\n", __func__);
-		return -ENODEV;
-	}
-	out_be32(pdm360ng_gpio_base + 0xc, 0xffffffff);
-	setbits32(pdm360ng_gpio_base + 0x18, 0x2000);
-	setbits32(pdm360ng_gpio_base + 0x10, 0x40);
-
-	return 0;
-}
-
-static int pdm360ng_touchscreen_notifier_call(struct notifier_block *nb,
-					unsigned long event, void *__dev)
-{
-	struct device *dev = __dev;
-
-	if ((event == BUS_NOTIFY_ADD_DEVICE) &&
-	    of_device_is_compatible(dev->of_node, "ti,ads7846")) {
-		dev->platform_data = &pdm360ng_ads7846_pdata;
-		return NOTIFY_OK;
-	}
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block pdm360ng_touchscreen_nb = {
-	.notifier_call = pdm360ng_touchscreen_notifier_call,
-};
-
-static void __init pdm360ng_touchscreen_init(void)
-{
-	if (pdm360ng_penirq_init())
-		return;
-
-	bus_register_notifier(&spi_bus_type, &pdm360ng_touchscreen_nb);
-}
-#else
-static inline void __init pdm360ng_touchscreen_init(void)
-{
-}
-#endif /* CONFIG_TOUCHSCREEN_ADS7846 */
-
-static void __init pdm360ng_init(void)
-{
-	mpc512x_init();
-	pdm360ng_touchscreen_init();
-}
-
-static int __init pdm360ng_probe(void)
-{
-	mpc512x_init_early();
-
-	return 1;
-}
-
-define_machine(pdm360ng) {
-	.name			= "PDM360NG",
-	.compatible		= "ifm,pdm360ng",
-	.probe			= pdm360ng_probe,
-	.setup_arch		= mpc512x_setup_arch,
-	.init			= pdm360ng_init,
-	.init_IRQ		= mpc512x_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.restart		= mpc512x_restart,
-};

-- 
2.55.0.229.g6434b31f56-goog

