Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792912525;
	b=JsA8NqhHwsS7iR1AP6GZVTvCpWCsR6ostXuHQIG/JZ4aVySrvlC3Zv6YwJ6gW9izmWs/
	 2nIxTLIknn+QDhrGupEAwoa8PR6NCyQoKx4iBNziI8CJ4BN3iBeIH1y3hVJZ01FsqhsKX
	 M4kbPl7VLCfMtLYDP+m7eSRaSuZkql5efsCDEAy2M1x6k6wLug2rOP+KeUbOetN5FgNOI
	 XpVt3J726fImwkNc07x8pW66ydde3eBPJYSLq+Tc51S9MrfS7mF8/tXJNT/bWqQsSC4sb
	 47oymqbLrdFh5UCrua1Cso0WAmT/4g4M6X1sTy4WdaoZyOTK0zP/d8sYIyel3YrCROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792912525;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=/Exo4AK19GTzwkvKo3vH6KeH1XDMwNptpNsby8IlEmA=;
	b=QgexTJ5l2xR/Kw02gaMH196etfmjtHA31usPXCqZJVwVNPrcVF644LGHZdQfcFAW0MAM
	 KjERaQ126qoYCpY7XThbW/trbxrpwEM3VKHxvLLAWXLxmA51rttD4Wqu3MIKEk8TSu3J1
	 x4IbaqymwjIIhDpAToHG+RPBlbNPMwI7pGmNfYqhRzA1nQUBBOesOsV/nsc7E2mcD8oUm
	 FT68F47iv0ljTDBdyklyS3CtkOFaY4pwCsb7PtsFvhnjf2rj0xeIQyCNoWf20cuyoIWlV
	 uqv8me6sY7uQ1i8a6FUBnlcZ2/7tZHnHf9yRkhj6mO2thLe9xA8VRUQ9Om7uJTWU2NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iETnJ9cv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B981606A323
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iETnJ9cv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59211F01825;
	Sun, 25 Oct 2026 07:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792912525;
	bh=/Exo4AK19GTzwkvKo3vH6KeH1XDMwNptpNsby8IlEmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iETnJ9cvKshtATIDb2zWkFNTuckYe+HE7to7fAxBrt0IJQQVAyv3g5KiPYeIdNgCR
	 2cDvV5h+KcCiSwRw4E+EC1rOKKu0GhqaUb0BsbBMpgO08yquo0FqdLqx7XQOENsb+O
	 R4IWeY/ruaSSQk240BjO4gtrisGZ9UftCFyzhLrPWQbELzypfeRL4qnqCny5l/ue0p
	 kKNTIeExyA+YuNWCRyJp9mx80/+AIMWTgb9NnIy5FUMutzUqHMSjhJ8noiQHiquuU7
	 23hRwmz91td5/cUy0MXAlhlEruOI856244KMnhq62+J1fLTfGmClB4YMxzQfjbYu6i
	 cMoOcPEa9YPWg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 25 Oct 2026 08:15:13 +0100
Subject: [PATCH v4 2/3] ARM: bcm: Add CFE SMP support for BCMBCA
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-2-b352ab54f46b@kernel.org>
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
In-Reply-To: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Russell King <linux@armlinux.org.uk>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The XG6846B CFE bootloader powers up CPU1 and leaves it in a holding pen
waiting for an interrupt. After waking, the stub reads the GPIO
GeneralPurpose register at 0xff800568 and branches to the stored address
in ARM state. The vendor kernel uses this mailbox and a wakeup IPI.

Implement the brcm,bca-smp CPU enable-method for BCMBCA systems
booted through CFE.
Read the mailbox address from the secondary CPU's cpu-release-addr
property. Map it as device memory, write secondary_startup_arm and
complete the write before sending the wakeup IPI. CPU1 is already
running, so no power or reset sequence is needed. Using the ARM entry
also supports kernels built in Thumb-2 mode. Clear any Thumb function
pointer tag before programming this ARM entry address.

Register the operations with CPU_METHOD_OF_DECLARE() so the CPU
nodes select CFE bring-up explicitly. Build the BCMBCA machine
description independently of DEBUG_BCMBCA, keeping the debug UART
mapping conditional. The generic ARM startup code retains PSCI priority.

Suggested-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/mach-bcm/Makefile       |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c | 56 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
index 6baedf4c6304..fcc4e0174adc 100644
--- a/arch/arm/mach-bcm/Makefile
+++ b/arch/arm/mach-bcm/Makefile
@@ -58,6 +58,6 @@ endif
 
 # BCMBCA
 ifeq ($(CONFIG_ARCH_BCMBCA),y)
-obj-$(CONFIG_DEBUG_BCMBCA)	+= board_bcmbca.o
+obj-y				+= board_bcmbca.o
 obj-$(CONFIG_SMP)		+= bcm63xx_smp.o bcm63xx_pmb.o
 endif
diff --git a/arch/arm/mach-bcm/board_bcmbca.c b/arch/arm/mach-bcm/board_bcmbca.c
index b510d959870a..248b8bd77645 100644
--- a/arch/arm/mach-bcm/board_bcmbca.c
+++ b/arch/arm/mach-bcm/board_bcmbca.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
 
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/smp.h>
+
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
+#include <asm/smp_plat.h>
 
+#ifdef CONFIG_DEBUG_BCMBCA
 /* This is needed for LL-debug/earlyprintk/debug-macro.S */
 static struct map_desc bcmbca_io_desc[] __initdata = {
 	{
@@ -13,12 +19,62 @@ static struct map_desc bcmbca_io_desc[] __initdata = {
 		.type = MT_DEVICE,
 	},
 };
+#endif
 
 static void __init bcmbca_map_io(void)
 {
+#ifdef CONFIG_DEBUG_BCMBCA
 	iotable_init(bcmbca_io_desc, ARRAY_SIZE(bcmbca_io_desc));
+#endif
 }
 
+#ifdef CONFIG_SMP
+static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	struct device_node *np;
+	void __iomem *mailbox;
+	u32 release_addr;
+	int ret;
+
+	/* CFE has already powered up CPU1 and left it waiting in WFI. */
+	if (cpu_logical_map(cpu) != 1)
+		return -EINVAL;
+
+	np = of_get_cpu_node(cpu, NULL);
+	if (!np)
+		return -ENODEV;
+
+	ret = of_property_read_u32(np, "cpu-release-addr", &release_addr);
+	of_node_put(np);
+	if (ret) {
+		pr_err("CPU%u: missing or invalid cpu-release-addr property\n", cpu);
+		return ret;
+	}
+
+	mailbox = ioremap(release_addr, sizeof(u32));
+	if (!mailbox)
+		return -ENOMEM;
+
+	/*
+	 * The CFE stub reads GPIO GeneralPurpose after an interrupt and
+	 * branches to it in ARM state. Clear any Thumb function pointer
+	 * tag and complete the MMIO write before sending the wakeup IPI.
+	 */
+	writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
+	dsb(sy);
+	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
+	iounmap(mailbox);
+
+	return 0;
+}
+
+static const struct smp_operations bcmbca_smp_ops __initconst = {
+	.smp_boot_secondary = bcmbca_boot_secondary,
+};
+
+CPU_METHOD_OF_DECLARE(bcmbca_smp, "brcm,bca-smp", &bcmbca_smp_ops);
+#endif
+
 static const char * const bcmbca_dt_compat[] = {
 	/* TODO: Add other BCMBCA SoCs here to get debug UART support */
 	"brcm,bcm6846",

-- 
2.56.0

