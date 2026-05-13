Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA76421F17
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675844; cv=none; b=A4AWjOI6znr0Eeb1W+Td8j/hzMRnmkrhIIMQV9fzPGEv2Qumow6GAdLYz+SwkyjwBqByI9Ih5w6tRQWJaENMizmdGU8KaOJ1I8R+hR+rcp0HOLhnrF9gmKeU3888KAEWUr5jR+cWLyIGL+5ZeVCA5ZjTHreEewnE5/v2sQNYDbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675844; c=relaxed/simple;
	bh=ZOkz/SuJo4lfLAshmePLEVcQ7hKfdcSq3ewd28ZNhPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMLK9zOlp9HVsHIX9+1ukl3ekBjOqFbWRVJTxs1sehs4eNVU8xS4Y75k2PKRjx0jsHDSQRHMpKWWGMvqnR2isK+2GeXc5BvL3ccKPCd5n+ysKvJ0iCfHo/BxBTWFL9H11vv+9l290356h74yRjuew+YQlzO2RCAVdOMALhTdmeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n0aJPZJi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n0aJPZJi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-441209fb77eso4104969f8f.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675841; x=1779280641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cGBjJfBJG5I6RESNuj+5kCZ2a1mSHz4+Qo3Ma26MXw=;
        b=n0aJPZJiscNpTjDtEghslz/HMNE+qfqguyRQYngdCyXdnNFdVx+BUyQRKYbQ3jJ8/g
         VgpyVUhQEZ5CJniy24KhmISr4uL8Y4WO63I3n82E6QMfeBb+lHryUqIfRNUEEE8j3wxF
         jfjdFkRotVYTjGHdPV+44T2icR3Z9k1FXzPi96OyANFhs/Q/oVntbIErk5gStuXqtg3W
         /H4JUaE4k8ItDCDvGCTm4CkkUT2QtJ4ex6QfnQiFPaUGIaEHH6kQ7/jb9q/Z0WMQcNST
         2iKpbn94T/f/hfP0mIPt12tSLGoXtn4W4TnqqL51MvrZI+s4xFphnwVsh6400NBit0z2
         gB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675841; x=1779280641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5cGBjJfBJG5I6RESNuj+5kCZ2a1mSHz4+Qo3Ma26MXw=;
        b=Vgd/r/2Q7aHCSLlyzT+yexZB24DKejzYSVU5aDjS6bkvd5WfO5mrZi5JNWa/8vZ+0G
         3Y4m2S/YJ4Eh1XL5AM4QN4hCV5VNCZtWuzjzA4sW/J0ltvh6VT0j74W7mcywJYPhGs4K
         LOzAgoDucMeCPQ6/eBv1E5FQdLm1fKQvbZrreRe77zURnB7KCv84uP64lKxSD+BUg4mB
         Q0cVAzL1/N/i2L2zdw+5yhAr0WGHKbrX59bi7rpyobBxik13kPOupJubmjGBWJvG8suK
         fsHLHMSpcSiztABKwAKEZZhp+F0tWjbfAthgULBw9vVsXFpiWKMALf091fVsi30MGnxD
         n7fg==
X-Forwarded-Encrypted: i=1; AFNElJ8CxmKKf7+zJ5IAjbW9TOj3gLIvd52xkvFJ7Fq+ApSpMEyBLT75iAoBqsKG7pDah9wf9cd3KVGYQRrC@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQ92Kablk2DOIrBkX3N4TriZ/xiWKNR/+WIrd6EJxj4djK1U5
	P/uvsRA1LP5FRMtur6MnFcoGFwRKtuzsrwICxw4gNNwgIyQgQUA+hfxfuY5PosKyYCo=
X-Gm-Gg: Acq92OHVAEOJkW7bH3l/4fm+HSc9suPLqQ706AvjkyfBwXxOAgWgLVRhi4Tn1BbooQO
	4w7S9q3GErs1IPVGYFKyZiKRi0xHxmb4KNqIFeo4CUxtb5V6D5ra09MJO9q2uCUI98JUC4kIiHw
	W1wzBQyjFdXCLgpdgs67EupXShDSN8hGnm4vZgLl7Dq2C9GdDDHg8YqPowgsg36+MqjZfbMhWXX
	hDkBE9n8RZRyqbbpGroVq8I3bt6a2nt516xvAy7M/XJWVk/cSy3t5RhLfmBNwEE3BNDHtdPAuoN
	sYznktU1P/xYM4/C32iTL83vKOuufvO/kourqyiQIuiUnW839YdfObcrNyHl90HKELj0Q68Y9+/
	Shb7WHktR4KS1y6UFVrMo5XwfC3vZO5eN+WKKFHoLHVqMKhNcXyL4BJmqNWI9YMoED6Qz7qh4BW
	1bJ6WxSdSnc11kKl5on2jPadXUmKXAPsFa0KTZk2ctigCX/Xnip87vBJyLzCAkcqaBaTcvXjT8l
	w8+l4fwJCDxpCwhW6v251JiH8Q=
X-Received: by 2002:a5d:6992:0:b0:44b:5a37:36c4 with SMTP id ffacd0b85a97d-45ac397cb7bmr9453319f8f.26.1778675840954;
        Wed, 13 May 2026 05:37:20 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:20 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:16 +0100
Subject: [PATCH v4 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU hotplug
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-4-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add cpuhotplug support for Exynos850 platforms. This SoC requires
its own specific set of writes/updates to PMU and PMU interrupts
generation block in order to put a CPU or a group of CPUs into
a different sleep states or prepare these entities for a CPU_OFF
or wake-up out of idle state or after CPU online.
Without these writes/updates the CPU(s) wake-up or online fails.
While at this, also add description of Exynos850 PMU registers.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/Makefile                |  2 +-
 drivers/soc/samsung/exynos-pmu.c            |  1 +
 drivers/soc/samsung/exynos-pmu.h            |  1 +
 drivers/soc/samsung/exynos850-pmu.c         | 78 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
 5 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 636a762608c9..7f544e3c1fcc 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -7,7 +7,7 @@ exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
 obj-$(CONFIG_EXYNOS_USI)	+= exynos-usi.o
 
 obj-$(CONFIG_EXYNOS_PMU)	+= exynos_pmu.o
-exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o
+exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o exynos850-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
 					exynos5250-pmu.o exynos5420-pmu.o
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 660416c0db43..9dddf4759ab5 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -133,6 +133,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos7-pmu",
 	}, {
 		.compatible = "samsung,exynos850-pmu",
+		.data = &exynos850_pmu_data,
 	},
 	{ /*sentinel*/ },
 };
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 186299a049a8..4202d3cd94c9 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -102,6 +102,7 @@ extern const struct exynos_pmu_data exynos5250_pmu_data;
 extern const struct exynos_pmu_data exynos5420_pmu_data;
 #endif
 extern const struct exynos_pmu_data gs101_pmu_data;
+extern const struct exynos_pmu_data exynos850_pmu_data;
 
 extern void pmu_raw_writel(u32 val, u32 offset);
 extern u32 pmu_raw_readl(u32 offset);
diff --git a/drivers/soc/samsung/exynos850-pmu.c b/drivers/soc/samsung/exynos850-pmu.c
new file mode 100644
index 000000000000..40df15881923
--- /dev/null
+++ b/drivers/soc/samsung/exynos850-pmu.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Exynos850 PMU support
+ */
+
+#include <linux/soc/samsung/exynos-pmu.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+#include <linux/regmap.h>
+#include <asm/cputype.h>
+
+#include "exynos-pmu.h"
+
+static int exynos850_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
+	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
+		     CPU_INFORM_C2);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, BIT(cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
+		     reg & mask);
+
+	mask = (BIT(cpu + 8));
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
+		     reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
+			   1 << 3, 1 << 3);
+	return 0;
+}
+
+static int exynos850_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
+	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
+		     CPU_INFORM_CLEAR);
+
+	mask = BIT(cpu);
+
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, (0 << cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
+
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR,
+		     reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
+			   1 << 3, 0 << 3);
+	return 0;
+}
+
+const struct exynos_pmu_data exynos850_pmu_data = {
+	.pmu_cpuhp = true,
+	.cpu_pmu_offline = exynos850_cpu_pmu_offline,
+	.cpu_pmu_online = exynos850_cpu_pmu_online,
+};
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 9c4d3da41dbf..93c4d724c8ea 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1015,6 +1015,11 @@
 #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
 #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
+/* Exynos850 PMU Alive */
+#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)
+#define EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu)	(0x1000 + ((cl * 0x400) + ((cpu) * 0x80)))
+#define EXYNOS850_CLUSTER_CPU_INT_EN(cl, cpu)	(EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
+
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
 #define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)

-- 
2.51.0

