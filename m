Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93663E7BA8
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812819; cv=none; b=XyPbxTYfuRJV0hAR6RV5gsdAuA8SdbLMDdHU9Vkwf8KgA+h4toY68+Y/hH/hUtCSf228Fsp9yrWcna/z27khlAK+74TLpvDgMdq3LEzGX6B4hro7KFhkCdGx01sYOyqGO3agIeL54x+21V/fz28AWeWDK7yCAZjYYURtX21pxG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812819; c=relaxed/simple;
	bh=lU+olg6b7xeVFnmwRYJG6Mnyo25fN+iR9etdHelbHUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0mdR+QRYEIv3rN3ExMBLg3FrJWfiSqioZeRizEHDRDlEZjX4FWaWS4yTK2h12NmMQotm2sBNTKj9nCJw9kLHDZ0cXec+jtfp/NHqw/Tk58yyeIubYxP2oKicW/9N6Uf9expCfnE2f3ZXRGhXQDSo8YvomYWVyL7QA743lmreSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LviGVdbe; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LviGVdbe"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so23118765ad.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812817; x=1783417617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B91IsKiKSBLDxQvOwWqL0iEBK/LnKCgLJJ+MpBBdIFk=;
        b=LviGVdbeOsYlR6vfcfQ5z34dkejUEAbjSwyeg35+IMzmpwe7lIoXimiPdNW6e8AFw0
         g87LgQBfFhXj/X2i3wPk2ShvGrZ6UFUBESpCCxintHcC4DXyvkY8XCCTXsBgDJH95NLj
         DjetL7bTyerDywLnb9Vbzj0OuPH4AM3+WyI5wEyy+uScX6wcTPUEpl9qF+aejeLtQIin
         Pz7GON6b8nPyf918Pq5oDq/jw3pCxg4epYS3N1GT8F71rHhSNL699XhDAAA+X/wZ8kuy
         1a1CLqRx+lebCP/wg49cF7tDqbK2ZEzRxdjchs35dmTt0yl91A6nqhCx4741nL//z4e0
         M4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812817; x=1783417617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B91IsKiKSBLDxQvOwWqL0iEBK/LnKCgLJJ+MpBBdIFk=;
        b=MFp1qI17T0p3zdz0/wo9r6sbohnFdNERF9rcQuPICcPtk/ACz0tV+6yJ2OQTr38PgI
         Me3uDTHVM1Qw1WNHSOsvGa95D6g1zNzx9k0acWMVg5sxykLFEHc2n1Z/hCB6k/91XZZn
         xrTnbdcizKHWwqWI0eQsCAfWHdbc4WkGHAVrFiFPciVF7T7qsHo+WQf0WC8O19LpdR2Z
         1DRGMPzMnhAkLCfCqVMbU4SFy51kE+5Y2DoI2GbWYh5wuSDqRzRTMkHTDlkvQnMX/vQx
         WkLKbzLiDtTpME5Airwjketb2sm+FCTlwf78hjpsp8yzgNXkjb9aGXRV6W1Z3A4mMuIX
         aR1A==
X-Forwarded-Encrypted: i=1; AHgh+RoOHRszgh0dwaAA0DNtHkW+9Rc6gkAlUUP+XL7P+F1xzneS4BRmV6IUqznzX5w772OUKbGKMa4zH9Q+@vger.kernel.org
X-Gm-Message-State: AOJu0YyWRkoIX4GWhm0KVPi9BiQmwEZ6gk/yujCLKNECTu2gSi3ksEgp
	GR7c+cUiK58U+jEZoc99+Yx6qb2VdxEO/1MCWCtXSqSQsVvFKus7R6QKWixRAG5sb3jMjehG9FX
	8A+HSni7oY/pec69DgqEqLxEhEgj0CywQeobLiKD030JF3UyVXi3K/difgLX3Xp0tsA7dZ6fNsa
	drswYrVXQ31/J0T2hpFaVFmUNJ5IbZj8NWcN+Al6uus0RGJA8Th2WIIg==
X-Gm-Gg: AfdE7cnE3oopRYHg5k8RT4LNg3wqNp8bAGzm4M7ERW8HKHECeQNos1xUW6gKersjPhD
	T4pW8kItCGMBha2jIRQdC+s1K9/0J1avUhnt5KamR85llSufH4zGQRqRtSGf9E7X7HzXudhWNIf
	UoOh1jZflJd0Jo3XR1iUNbitPjvqX92QodZXEgQ/UmQRg/w0XMnSqERcSFtRESpk3mBiFGFuczk
	7dVGTxxxb6ik4R9znm+fzAAm8v6GEFvF2btT0DAKpaO/J6v0v55qc9Z6ZzybiCM6aG6GTRAK/pV
	YSevgrJkkHBq2Q6uMoVhID5TVBct8pHekPX8kYKxbX7hKQWW+mHIMgabEMlGNOkN138tGhJX2bD
	Yp0SdjIo447FTXK02cefrBn5MdrRV11Yzw+rr+lyUOWDfhVuS8AZV0j+nwqJDQtjCsF36/AP/nQ
	IpdB/Rklh9iWXZC9BBRhqZCChIELWMaKk=
X-Received: by 2002:a17:902:d584:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2ca2ec35fb8mr21656615ad.44.1782812816777;
        Tue, 30 Jun 2026 02:46:56 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:46:56 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:25 +0800
Subject: [PATCH RFC 02/12] rvtrace: Add pre-ratified implementation
 callback
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-2-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=6744;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=lU+olg6b7xeVFnmwRYJG6Mnyo25fN+iR9etdHelbHUI=;
 b=oHZedcK//rLV5fqw1rrhytPWnhPCnfkdo8L1ckX2GZwlN8Y267sSo0+/cVReoIpiv1rhNs1gV
 hYL+xwkQXNGCzRkCH4GvLB84OgfX29DGgUqkdvVJHsBEYfjvSbvl0Qk
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

For pre-ratified trace hardware, the implementation register
bitfields differ from the ratified RISC-V trace specification,
and the component type is not defined in the hardware
implementation register.

To address this, add a get_impl() callback function in the
driver data to translate the pre-ratified trace hardware
implementation register information and encode it into the
standard RISC-V trace implementation register format.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/Kconfig            |  9 ++++++++
 drivers/hwtracing/rvtrace/Makefile           |  1 +
 drivers/hwtracing/rvtrace/rvtrace-platform.c | 21 +++++++++++++++++-
 drivers/hwtracing/rvtrace/rvtrace-v0.c       | 32 ++++++++++++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.h       | 16 ++++++++++++++
 include/linux/rvtrace.h                      |  8 +++++++
 6 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index ba11acf1117d..5e84a3d0b633 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -31,3 +31,12 @@ config RVTRACE_RAMSINK
 	help
 	  This driver provides support for Risc-V E-Trace Ramsink
 	  component.
+
+config RVTRACE_V0
+	tristate "RISC-V Trace Pre-ratified driver"
+	depends on RVTRACE
+	select RVTRACE_ENCODER
+	select RVTRACE_RAMSINK
+	default y
+	help
+	  This provides the RISC-V pre-ratified version trace hardware support.
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
index 07403f4d94e3..51b292b1b4c4 100644
--- a/drivers/hwtracing/rvtrace/Makefile
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_RVTRACE_V0) += rvtrace-v0.o
 obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o rvtrace-platform.o rvtrace-perf.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-platform.c b/drivers/hwtracing/rvtrace/rvtrace-platform.c
index 83e5a577bc52..6cf8e7dae2ad 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-platform.c
@@ -11,6 +11,7 @@
 #include <linux/property.h>
 #include <linux/rvtrace.h>
 #include <linux/types.h>
+#include "rvtrace-v0.h"
 
 static int rvtrace_of_parse_outconns(struct rvtrace_platform_data *pdata)
 {
@@ -114,6 +115,7 @@ static int rvtrace_of_parse_inconns(struct rvtrace_platform_data *pdata)
 
 static int rvtrace_platform_probe(struct platform_device *pdev)
 {
+	const struct rvtrace_driver_data *driver_data;
 	struct rvtrace_platform_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct rvtrace_component *comp;
@@ -162,7 +164,14 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to reset component\n");
 
-	impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	driver_data = device_get_match_data(pdata->dev);
+	if (driver_data) {
+		if (driver_data->get_impl)
+			impl = driver_data->get_impl(pdata);
+	} else {
+		impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	}
+
 	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
 		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
 	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
@@ -194,8 +203,18 @@ static void rvtrace_platform_remove(struct platform_device *pdev)
 	rvtrace_unregister_component(comp);
 }
 
+static const struct rvtrace_driver_data rvtrace_v0_encoder_data = {
+	.get_impl = rvtrace_v0_get_encoder_impl,
+};
+
+static const struct rvtrace_driver_data rvtrace_v0_funnel_data = {
+	.get_impl = rvtrace_v0_get_funnel_impl,
+};
+
 static const struct of_device_id rvtrace_platform_match[] = {
 	{ .compatible = "riscv,trace-component" },
+	{ .compatible = "sifive,trace-encoder0", .data = &rvtrace_v0_encoder_data},
+	{ .compatible = "sifive,trace-funnel0", .data = &rvtrace_v0_funnel_data},
 	{}
 };
 
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.c b/drivers/hwtracing/rvtrace/rvtrace-v0.c
new file mode 100644
index 000000000000..825de1120c8d
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#include <linux/rvtrace.h>
+#include "rvtrace-v0.h"
+
+static u32 rvtrace_v0_get_impl(struct rvtrace_platform_data *pdata, u32 type)
+{
+	u32 impl, major, minor;
+
+	impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	major = 0;
+	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK;
+
+	/* Encode to standard rvtrace impl format */
+	return (type << RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) |
+	       (minor << RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) |
+	       (major << RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT);
+}
+
+u32 rvtrace_v0_get_encoder_impl(struct rvtrace_platform_data *pdata)
+{
+	return rvtrace_v0_get_impl(pdata, RVTRACE_COMPONENT_TYPE_ENCODER);
+}
+
+u32 rvtrace_v0_get_funnel_impl(struct rvtrace_platform_data *pdata)
+{
+	return rvtrace_v0_get_impl(pdata, RVTRACE_COMPONENT_TYPE_FUNNEL);
+}
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.h b/drivers/hwtracing/rvtrace/rvtrace-v0.h
new file mode 100644
index 000000000000..511aa6489caa
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 SiFive, Inc.
+ *
+ */
+
+#ifndef __RVTRACE_V0_H__
+#define __RVTRACE_V0_H__
+
+#include <linux/rvtrace.h>
+
+u32 rvtrace_v0_get_encoder_impl(struct rvtrace_platform_data *pdata);
+u32 rvtrace_v0_get_funnel_impl(struct rvtrace_platform_data *pdata);
+
+#endif /* __RVTRACE_V0_H__ */
+
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index 0cb3bd474c2b..fdf6115d7f06 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -154,6 +154,14 @@ struct rvtrace_platform_data {
 	struct rvtrace_connection **outconns;
 };
 
+/**
+ * struct rvtrace_driver_data - Driver-specific data for RISC-V trace components
+ * @get_impl: Optional callback to retrieve pre-ratified implementation register information.
+ */
+struct rvtrace_driver_data {
+	u32 (*get_impl)(struct rvtrace_platform_data *pdata);
+};
+
 static inline u32 rvtrace_read32(struct rvtrace_platform_data *pdata, u32 offset)
 {
 	if (likely(pdata->io_mem))

-- 
2.34.1

