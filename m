Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCA8466B74;
	Tue, 16 Jun 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625821; cv=none; b=QBGNBKHhfIJtJNLvuvZYrJN2oZz2oC32JHtngL+TQEPT+OSN0VkT6JkKWRxftWekvCUkb0GZI+FfKo4auEK0rl62h3dHPT9QDOfadr8ARc22weWtu2CskoTHZj7tJsvPu5I5e0Kd9j+1BtGD9mt9SgxTGzHM31lT+lEE8U6FDjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625821; c=relaxed/simple;
	bh=YHwfvmddVr4unERB3/tGhfSpoWi3ZnbcdzoDw1R0ZMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Va+1Qu0uHjePmGJLrutp+d2cE2+AikjxQIuYlWC2sMCRK/EhZdi8JaZEJeIgi4XvP0bPueqrRJSCphB+X/dUaLuxGFotUJ6mxxUBobafnOXqnoxc2+oJB3A/7Zrpj0NJSPncY4snRGj1DhymGekOQQCdUlgUThPWG42enlb04xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=se5mSKY1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="se5mSKY1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7426C4AF0E;
	Tue, 16 Jun 2026 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781625820;
	bh=YHwfvmddVr4unERB3/tGhfSpoWi3ZnbcdzoDw1R0ZMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=se5mSKY1GRMQrKYN4sTPOHGb3hp3r/1woZ2dunB8k/4J0JQKzs0s2kJsyK/VqGKke
	 aSbZRWmUg7qiPuSw2YsXIQYzUsvtLpx1+l5RdbZNUMNiCNGuGb2Lt6itvHJMzxC+GJ
	 2KK9A+3oKyRQSUf96re2umcGKA5Tl5y2jkhx7RvOujmuIavTxnXBi6dftb0i5JnqpT
	 Dc4P+O4XW4iZZrGH5UPExqCxZ0bDnxvhBkFxBu7y8FiLjFzZGYNUdwA+ZK2azIV+ii
	 LyRX7WezTpK06V7aURmNzUq4/hrJIggxmAaNTbeUUIQ1PkCBDvJo1ogS3J4Sn6Pwf7
	 qSewq9EicBjMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95E3CD98DA;
	Tue, 16 Jun 2026 16:03:40 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 16 Jun 2026 18:03:39 +0200
Subject: [PATCH v9 3/3] riscv: clocksource: Add p8700-gcru driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-riscv-time-mmio-v9-3-03af7bc8f2d8@htecgroup.com>
References: <20260616-riscv-time-mmio-v9-0-03af7bc8f2d8@htecgroup.com>
In-Reply-To: <20260616-riscv-time-mmio-v9-0-03af7bc8f2d8@htecgroup.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Chao-ying Fu <cfu@mips.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781625819; l=3298;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=3gylppdlQket8tUc4qx/+ik8cQwg9RhMZJmHFwMxyPQ=;
 b=JyCsFdiHFV3/q9WIm3YPS+zSuWcxmwYz8t77rpDBcMTZgG0NpVwHkBIYQkcbylZT39ppzBU0d
 cFqlf3WYa38BvaD6VaaUR57VrEEBsbXDozDyTeKbJGURy2xOyfBkXkn
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add a clocksource driver for the P8700 GCRU.

Initialization uses helper functions
provided by clocksource/mmio.c and timer-of.c.

Since the GCRU does not support any kind of interrupts,
the default RISC-V clockevent implementation should suffice.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 drivers/clocksource/Kconfig       |  9 ++++++++
 drivers/clocksource/Makefile      |  1 +
 drivers/clocksource/timer-p8700.c | 47 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index ffcd23668763fe7707a4e917bf240caadbb09a8c..a775a301f3f08ca97699e46aaf3ccfaf99734e6b 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -672,6 +672,15 @@ config CLINT_TIMER
 	  This option enables the CLINT timer for RISC-V systems.  The CLINT
 	  driver is usually used for NoMMU RISC-V systems.
 
+config P8700_TIMER
+	bool "MIPS P8700 timer driver"
+	depends on GENERIC_SCHED_CLOCK && RISCV && RISCV_SBI && 64BIT
+	select CLKSRC_MMIO
+	select TIMER_PROBE
+	select TIMER_OF
+	help
+	  Enables support for MIPS P8700 timer driver.
+
 config CSKY_MP_TIMER
 	bool "SMP Timer for the C-SKY platform" if COMPILE_TEST
 	depends on CSKY
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index ec4452ee958f1a814c708aeba6412bea61d24892..fae9a58d6c8663a7c857b9ab7fdae05782b3551c 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -95,3 +95,4 @@ obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)	+= timer-loongson1-pwm.o
 obj-$(CONFIG_EP93XX_TIMER)		+= timer-ep93xx.o
 obj-$(CONFIG_RALINK_TIMER)		+= timer-ralink.o
 obj-$(CONFIG_NXP_STM_TIMER)		+= timer-nxp-stm.o
+obj-$(CONFIG_P8700_TIMER)		+= timer-p8700.o
diff --git a/drivers/clocksource/timer-p8700.c b/drivers/clocksource/timer-p8700.c
new file mode 100644
index 0000000000000000000000000000000000000000..dd20b4e72fcdd77a6b33775f286d0945c2a2b659
--- /dev/null
+++ b/drivers/clocksource/timer-p8700.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 MIPS.
+ */
+
+#include <linux/sched_clock.h>
+#include <linux/delay.h>
+#include <linux/of_address.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/clocksource.h>
+
+#include "timer-of.h"
+
+static struct timer_of gcru_of = { .flags = TIMER_OF_BASE };
+static u64 __iomem *p8700_time_val __ro_after_init;
+
+static u64 notrace p8700_timer_sched_read(void)
+{
+	return (u64)readq_relaxed(p8700_time_val);
+}
+
+static int __init p8700_timer_init(struct device_node *node)
+{
+	int error = 0;
+
+	error = timer_of_init(node, &gcru_of);
+	if (error)
+		return error;
+
+	p8700_time_val = timer_of_base(&gcru_of);
+	/* Now init the mmio timer with the address we got from DT */
+	error = clocksource_mmio_init(p8700_time_val, "mips,p8700-gcru",
+				      riscv_timebase, 450, 64,
+				      clocksource_mmio_readq_up);
+	if (error) {
+		timer_of_cleanup(&gcru_of);
+		return error;
+	}
+
+	/* Sched clock */
+	sched_clock_register(p8700_timer_sched_read, 64, riscv_timebase);
+
+	return error;
+}
+
+TIMER_OF_DECLARE(p8700_timer, "mips,p8700-gcru", p8700_timer_init);

-- 
2.43.0


