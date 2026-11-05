Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885099;
	b=JOdiGMqRA8eHOTHS+7jqczelDm8QHO934LSCZlkuanqkVqa5fME8qogLlMty7gPjfHky
	 sj3FsgxDTGWew7jb3jd+kOFnLA00s0fYCta4x4oiB8pZlmraNN+aDcRmtYAQn8Ia4Zyg9
	 CEacy/60pdbjl0tLAPro8tegGYR6WUd/MQwZIph/MREMY7rLewJLfBBgu79QO8Go3MCrM
	 jU1HrUgqVsF2eXDQLB27KOMmwZsM553kkSOuAo4EuKrpwDh0smjo7Ajjua6Y7JXH3GzIZ
	 reYNYpEvjkIfheyDKPs7D/MpjVMG75nBzJqo3/3IsRW9YKZOwhcvb/2QCiwRJAPtvEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885099;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=/Exo4AK19GTzwkvKo3vH6KeH1XDMwNptpNsby8IlEmA=;
	b=RHCJu6YEszSf0AXiKV7LpjXRcNxCLXbBCyHSR8MNmG+zW9DLQNhaj02q+hRY9hCW0vBp
	 /07obfBcuOspKK0CwVOThHrfNDlLdyrF3/aWuYC+KI/6tb+onDIgT5dsUuGQFwAfSKMxP
	 6VuANeKaWy1vd527iFHdgkW6Xym2UP9b+zWYbMCUdCzUOxdL8tyI0zLLTbqZ2L226KzNf
	 o+OYNHEnNCNVoZbttwjD90j1hc6qG+oPsEIPX24Jxng2qq/7A2aAsAazyMWjuVMY1KrmL
	 az96z8zsz4PmY50hjFtV832LybcD4uv0Xhdx/SOlwV1A/deV2Jdnsd7t0OYwwSMbIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfCTGnNI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F1606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfCTGnNI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DE51F00A15;
	Thu,  5 Nov 2026 13:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885098;
	bh=/Exo4AK19GTzwkvKo3vH6KeH1XDMwNptpNsby8IlEmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XfCTGnNIKcK4RPKWAnpfFeXDyrpGPd2lGlzxZe2AvXg9XUZeOwsHtXnTBmQJA0535
	 FhpKWocy+A8173SRRd/WrCr43ixVqkKsQibCbGYkTih3mEmVdUh3VUi4/zMrpxRAJE
	 Qzza3o4jMSfDkEu0s+qnIsn4eBEiGvljF8xiGxbG/dJ74AA0SH1z9M5jRBGmyZv0RC
	 6si73t3i1a+4P4QD0UVL8x6ouk6njlSTiGBj6+JZVr963oLVuLAv0H+tmZtkMSY+BZ
	 RBgiBeKihpJNiM+X3ItkisAUBlpRjTboetUaw6cuqYgQ8g52Kf4mLanGVU23cV6UJm
	 fzdeeurWsaPbw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 14:24:47 +0100
Subject: [PATCH v5 2/3] ARM: bcm: Add CFE SMP support for BCMBCA
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
Message-Id: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-2-4103df2588d3@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
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

