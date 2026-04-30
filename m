Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4220C282F04
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514223; cv=none; b=pWa16sWMGwz1MouDNu5JQpv8wpTK3B9YHiDqbRsFrbyYOtEXXFg3QigAUIb0MoAf4pSA6cQ4retcKC6Vke8SmllTPz7rmecPgVh/VEB2WzTFYP6x3D1ebu5nk2f2h2i1XBI84tWr3fmTQ43kSxcOED5w8KFgrCOaJ1SDP1YWOXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514223; c=relaxed/simple;
	bh=jH+Uais91Yp/yfS2R1M5zj6Q63Qt9ZCT515I//ZzC/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uD9B2LSlfiMFvhvhlt/q+HiGBILxt1DC4iywTfhoQU01UnVZaneWW+EafObN8YsPxNWBb9nA3ro3GYVxoZLtIi0n05TNWcod4jBx2nvPeDzJvwmq/1+aQuKPgaWGVOW0bFZAc64jdJAmrEvvPuy/TURuKsjAYVkNGmzkp1c+OVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTJx6X0+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTJx6X0+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d73422431so328722f8f.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 18:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514221; x=1778119021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQcInBWC9kq/xkmPKKPsqQgAV8Q2221mBidac2LwPQo=;
        b=FTJx6X0+LUkKAyKBnF9MrZdNbtUBdehTqd713ursVcd4vHA8ivAkhHBZ6DH7TiVHNX
         z3mlc3r9BDfcLxovpCQV9mLPYTj38M2fLHaElwfw6qllt8R15QVspDYWUUMqsPun3/xz
         xWjdZBa7elKOS9h/dTAugbja6qBab4M81/zeb1SrXZyXAhkHBqlDHCv/e9H4qOl5CjNx
         hxzqP1buGE/J6fPo/0hJdB8dio/UyjDwgmwEGELOQto1c2QZUCfM2lcj3q29dL2eSdGq
         zN+KoY22tJamOZ59Nb1z4XRKoGOF9jHyHwcxxn/AakbHcn7cTFcStVMuXF5ijgrARDpv
         1Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514221; x=1778119021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jQcInBWC9kq/xkmPKKPsqQgAV8Q2221mBidac2LwPQo=;
        b=VSECDsnZixDmUIDEmY6h891FkyawjkF7Uz7pfTFQB1JWLk+eUNkxS0x/j0vqcDTgiE
         I1RdjWjnCNSdXZQALdbF7sZrI6niSlkiz8ye7cVEAXGAuSciQx1nhOCb+M2cVAYeI3qS
         csjNS2XsDseUaGX/bsqafjHZUh1mkDckORbVUVESWb8C0NjKwljcS2Ro/2LHBStRx9DZ
         iRearFKyWCMTsRaeU5B7eKT+6ho4H+AJf03+WaC/B7B1muFG8XKSBW/1MnloG4NayfoG
         AmRYZa58fo0kicnceyBCgUDCKrcYM+YbJba0Yea63nXRhO1C86ouHFxXue//wNcVhIyw
         hpGg==
X-Forwarded-Encrypted: i=1; AFNElJ/h+5qw5lmJjHYvnFUsnHU2PxaxfGXDgNv9FRDluqki8H6Ov2preoS8thiurYvLZhfzqm2ik2U+N9O0@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgXeym2tWolewa6vaF+weHaflVP0vMYExXUrt4u73JGCwqsj2
	XVcqKqC9bBid6C7litwbAv9SINfuWkOX9YDQ8dlxHF0mL4EVHd47yTeAqQlJQ5+DelY=
X-Gm-Gg: AeBDievARXQ6YH2T7V2ncuLFfap2Dr8KWO0hPWt3lzSXbgtnUwul/9r8qyqCXwGP9D5
	84z8YtEqcXdCN+2CeqHolWdHXgYXRABMMNFU/sIK/hPyfESjb6fR2UfMmOMhP+o0PAZH4P/WaIq
	DX6R0FT1BAQXLAg+Uhyr2WtAFVYQsn3WyE9QW2+BK4BMuDr9vv68EpzoX864/HBtkoqQ5HkIm4p
	s11a1ayqsWrfI1b9LVE0SSnoSWNksdciKvdvKp/7msk6AoZ71k8C+BD0tFurlCSobT4uEgou7p3
	nrlf1U01b3mA81sn77EirfBM+wltaeYnTzFOmCtbMYFHTVVYq/tm83m9J+CJNNtZe3ak1yF+thU
	dDbGS1wH7whRDUewqaX4c6whiL4v1+9t593NPugJNA6OLgNcZ/qMBLPZjZtLHqFSryzkJm/WWO1
	QKtyIfYUIGa+YvYSBdBy50SLMIdM2IwtfAtD0g4lW+A83ID5fiPWcAkS75TyBRVvQRoo2xXBjdX
	uMdj+lvMF8AbeWbUxBcf72Bt0RH4iL5uq0AbA==
X-Received: by 2002:a05:6000:24c5:b0:43f:e452:f391 with SMTP id ffacd0b85a97d-4493cb42f83mr1242615f8f.6.1777514220538;
        Wed, 29 Apr 2026 18:57:00 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:57:00 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:54 +0100
Subject: [PATCH v3 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU hotplug
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-4-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
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
 drivers/soc/samsung/exynos850-pmu.c         | 79 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
 5 files changed, 87 insertions(+), 1 deletion(-)

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
index 000000000000..7a1ea45810bd
--- /dev/null
+++ b/drivers/soc/samsung/exynos850-pmu.c
@@ -0,0 +1,79 @@
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
+
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

