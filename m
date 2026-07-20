Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1863A59A7
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784525849; cv=none; b=QCPFxyCWdjfBVsDBX/lElSKqId27Byapizvx+Zhp7kodLZkJSS5mrLAi1miyhiRlI9fLp7DBHtYo8L8rHK4HbjDfV3yZZM87NO2s9PE83Ruk8xKk2GwMIp4Gh6TAQMfljs3C9Of3t4VeukVPKRtusp7lNEfqRb+X6mWooD9R0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784525849; c=relaxed/simple;
	bh=cxtZuaEw1UMaJjfN/dSnrD/RYOPlm8tv5B9OMNIQuxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDDlq1M7k9sWLgoA14ET8tXqrohoj48xcWtlaxtzIPFJ06Jp3CS3MT3wu/xg1eo3R79P/9dfDPhGkWyIeGJvc5L3Kdya0MlDCU6y4aley1ffSKOX1ogJORa5yjFxTKWQ+uMdeoaxr1eJv+cglCvwAMtZ1khBaZqep0QZYUFF5Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce8bbCU7; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce8bbCU7"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so8345786a91.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784525847; x=1785130647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ/9YxE8f5UbeN3J0t4LKoL5GudGidDACl40NXpjpQ4=;
        b=ce8bbCU7m5jsrXnITzXnJfpR+4HC6IeGlLeLTvsVHpfTZJ9hEUEQxL1xtspx2PKFKf
         XaKEb1FvR+IohoyCwowDKUjKyTcfe3SGqyau0GIAG3Vk3kH+sfAkfVBlZxFUx8D99Rxb
         y1jnWaYLfl4r19BYvMe+a81buTIcNT0YD8CB6IEIWUIgTMEPt+JVPMebG8hb74w6WGOF
         DGLOzCo60crsZfcVqkzhOaDAGRbZtCfX6fq5ceCgwU4A9Ij1G889Ul1t4gwfQbPfUk02
         o8Mag2ATAf3IoQ4q3CR2zaUcMqHjmTNjYu7ZY34o+sQgaBgsm/JFQKh2YEKScwX3zNos
         OaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784525847; x=1785130647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZ/9YxE8f5UbeN3J0t4LKoL5GudGidDACl40NXpjpQ4=;
        b=ODKM2Oj843VOzRA8zVEfALH54+x/F6VJsRlU9erWvFO777PvZK+1ZlxHtMaNBHmBby
         vUAii5nw5AV4+tOg26hQkGpxVpOS5u8J0/3O60q83R0R1t+svyKQ50DFM1S8LSvYLE2X
         qjmsjdf1MrhJxsmDqYQPeG+napmfJlqLSLD1TrRqvJM7c1qyKfALPL7HZSumUr4GD0+c
         997YUB3GNItbAt+dguEZemvcuvSXwSg0MiCQ5xI8tXAnzDkEknBS4Th5ZBOhmv9M3xGC
         hzhfII0IyJCM9boqcABirbLSrgENGnSM1mekg6EO7prjo/OpDsYm9JCIfZkMUmePs0z/
         1DgQ==
X-Gm-Message-State: AOJu0YzEQT0spa2MK1j7lxkTUOo8OWdEewHnKEsaDiWdwxgLMi/HZJQ+
	qTPRujv81y79U1lbSoO2SDe3uTwb3b5HPmNJCI+tOBN71YlcK+sE3CQk
X-Gm-Gg: AfdE7clD2IDaNkC2WoqWyAol4gzgigZNdyH/mMsmrIdA/KoVUocyoIXQYy7vwSCwQ4c
	WIF8+KxAzE1avFZFi7cyCgX30Vsbsgnz83NymT7G8Lrc5loPEStoOH9vudoiS4LA9K9A3KCW7eZ
	L8Dic9rECkmd2yp+qz1zmJ85HwDrEzheGyYfN3r+bb4uGHQaFSWJosf1cpIXijEre0wqXZYmzZ+
	uvjE34GKFxh3lJ7Vr26JvTol8Ty+Z5VSUx8ZlZaXcDMUDIRd/vKB/o5vMRkHYbzFX5EOw0MbUaR
	oZ6jDpQmSj1y4iYE9vIlim8ZbzkWgNDSjylvBwf5XYzD+ZCHTrvvccBPXgsoItqQtOp3acpJWHW
	+C7xgxcirimThncfDjs/wfXjqoyqmi5Ms92AZpuRLfo4qDX6rV2QIHQi3AxgtBspjagt2wp8pSx
	dqh6cKMxMhenb/EWcsupKLV+JpmPkEV6/gDlSVeQHXzwFcL1YtkCPtJCswTjCRcHjAuw==
X-Received: by 2002:a05:6a20:ce4d:b0:3c0:9c19:65a3 with SMTP id adf61e73a8af0-3c3adaa8bf4mr13638856637.75.1784525847486;
        Sun, 19 Jul 2026 22:37:27 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:345f:e51b:3d0c:4546])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm34224663eec.30.2026.07.19.22.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:37:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 19 Jul 2026 22:37:18 -0700
Subject: [PATCH v2 3/3] powerpc/512x: Remove pdm360ng platform setup in
 favor of mpc512x_generic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-ads7846-pdm360ng-v2-3-1198bd108502@gmail.com>
References: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
In-Reply-To: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
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

