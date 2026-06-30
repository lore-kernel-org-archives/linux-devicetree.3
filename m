Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E829C327
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812852; cv=none; b=eg6ZaVE+olVh0zpPsDlFyfcPjyhHDpj9Xh2gK+hwwuuZwOUDEMrvJZQZtvhZQEppB1KbG3a+nQkMFFWmgtx+c1DAnNPmRkkZdVps/SPoj7e3w6qke2gbzuuKclAm7C4nVb9+MFKFAuzyT6/ZgZF747HYJ1zirP/5Q+MukRi/1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812852; c=relaxed/simple;
	bh=+2Y4ncc4aI5sWezwK/PpKOafCsJa4Xl+vxw29ypurXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXazRVwihM2P7PaCMVLlL4cLgbmEHnWaabV2r712PDTFcKmZaZYARM2VtMSad3JLzCKpwBSqqVgNu9s8thyOALjgLK+WSKSvHcjh0IQiOIjwAi9X4GSm5PYwvHzQ+Fbu5wUpGqrGE7gu/vXimSk429U6nUHcKcXMOXmZ6sQpkXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=AUoJPbhL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AUoJPbhL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c9b42be8feso24748315ad.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812850; x=1783417650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSjESf/pgUI8Z+M6V8l9I2o1pCuGSvuAv9qT40udMcg=;
        b=AUoJPbhLwz7u0X+FA3mKv1WmmLytSqupdf4a30JmtjNyKmQvtHtUQKdvHrjJ4oeaF2
         LjU6eqmwO4QwtCMViZ1S80jzlhc83WA39i5PwCDjaZUvLVQ9PN8dgcXzTXcoch0Nc94u
         NN0BO55b1AfyXZSGA+aJ4CoRYiNOR5Bmd1FN8Zn61oEP0XT8dMFsCQnlOwyPPqQ6ZQoT
         H6e5fxCFaaRdApQL/dFPkdb73o2nMNEcoKpDXYXf3AznCdPi8LQxLL/M1ySkysxcVFtf
         UEjmn5TiYRmByYxKFlX+VD5sH6jXm52I4wn61nNwWeqoc3pbgyFUkhr16XI7OoEONoVf
         vdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812850; x=1783417650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSjESf/pgUI8Z+M6V8l9I2o1pCuGSvuAv9qT40udMcg=;
        b=f+lGjxWVG/w3l/xDidW+cGPiTMTkImGB6m/D6eQNXGzImnOleq69m8s2GDH7s8OY5q
         8aCP45QcjgK3zjGzwgRMyfRWmlWtvpoR2oXsj63eVjcGASKrHJCDOpRqq3qSvvOega8Y
         L4/+fQA1YESVuOjIrkk5bm228ouTzH/1A0VyUj+elhr5Gf6O0pDICnUPitn0QAb1jEu5
         94eU6cOcG5uYznV92pcecwrVee/PceSumh6GWAw7gO0HUUb/UPkXleWC9syJBFou/4zx
         arnPK8dafo5Kzx69e+Tb7C6Zm9XdM39WZZLxbz75eOlp0qGLO05pnePsA9ehfeTOA1Gt
         FeVw==
X-Forwarded-Encrypted: i=1; AHgh+RoOCwCVDV4o1NJ7SJjWuCahdJREHnFgDC9gxLRKAIwSzjaOrl/o7RXebVxbIahFcHTU7b4m4V9XTCo7@vger.kernel.org
X-Gm-Message-State: AOJu0YyR1DDXtxTNvEYdpCSw9QWv4mqWTk7zYMu/KKpeGeCNSGNLyUVm
	iSNV7zTburebW4ZVnxnxWIz767cWZ7eAKNLvu6cnEz7QaWSx1Vd/U+dzgGcJIACITKSjgb46U7s
	Pa2F/nCzpA11wHmYFpBZaxSJ6u/A9shN3DC1GcNOO/jNt+FR9DQeVgWXlObcE9rt1YTdQaq5uHL
	GVMuejZoV7LlZx7cnit7IlMBw4tC8v2dOZq6w8ulXTPiNI+bJKkNgfJQ==
X-Gm-Gg: AfdE7cl884jmmfQBJv/AkZnEpI+AB5asl6Cp04iDXbP/Q/1yJnXUPiWil1jJvSw8Nog
	2n1Ry1PXjQhiiQz+F3CUqqQ9pXeXyzh0zYWGVEbeXe3cFUshtURd1oQEaxBGUaU0h0XCTSefE2D
	LmHFsIW6CJOLkbMsc2LQ2oGqdIXhkBHrZ0gqG+sUwJP8B8PYcd9N2gitt0C+Q925WGpcl5A3HcL
	fJSV1gsGebFFirep625YLK+8Qp5SuYFo/gfffm7CCR1xMxkh6Pxm66wER5WzHWsPkPUavLfslsg
	5f9aQwaGGeXmqPigGpuw9BoLmZe2QJjYMMFuFnLYO4Mb2PsQad3p2qMnE9hLmo6ZoVX0m0ixNqJ
	XniBjwxwFLeqKfGPA46ylajRhoT0pwLsrB8QLkxcG3arXFrc7NqmjwhRDpS4mnbgcrXQ30z8xGb
	QNzCNvqUztznjq59Siim2YR1lEFypNN5Y=
X-Received: by 2002:a17:902:da85:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2ca2d564e9bmr22246645ad.20.1782812850271;
        Tue, 30 Jun 2026 02:47:30 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:29 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:32 +0800
Subject: [PATCH RFC 09/12] rvtrace: Add pre-ratified ramsink setup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-9-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=9720;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=+2Y4ncc4aI5sWezwK/PpKOafCsJa4Xl+vxw29ypurXQ=;
 b=rZ5GS88HqnJFH+r0zqXCtsYQyD2e7mw+cqZDw6hrCCpdYFMmLpeGXKVubZeaiIy6QR86hDENR
 8zT0XS7aNRNBvhoZpLyN3HfUWG6wykAMVt/ZUXeS9eIJD7ZhBq/HNvR
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

Unlike the standard RISC-V trace ramsink, which is an independent
device, the pre-ratified ramsink are embedded within the trace encoder
or funnel MMIO registers and utilize a different register layout.

Define the pre-ratified ramsink register layout using 'struct
rvtrace_ramsink_regs' and hook the pre-ratified initialization into the
encoder and funnel driver probe sequences. Depending on the component's
major version, rvtrace_ramsink_setup() dynamically selects between the
standard and pre-ratified register maps.

Additionally, handle a hardware constraint where the pre-ratified
ramsink's sink limit and write pointer registers share their upper
32 bits with the sink base address register. This restricts the trace
buffer from crossing a 4GB memory boundary. To satisfy this, invoke
of_reserved_mem_device_init() during setup to allow the device to utilize
a suitably aligned reserved memory region defined in the Device Tree.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-encoder.c |  9 ++++++
 drivers/hwtracing/rvtrace/rvtrace-funnel.c  |  9 ++++++
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 44 +++++++++++++++++++++++------
 drivers/hwtracing/rvtrace/rvtrace-ramsink.h | 11 ++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.c      | 43 ++++++++++++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.h      | 13 +++++++++
 6 files changed, 120 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index 47740bbdc206..b187731ff855 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -79,6 +79,15 @@ static int rvtrace_encoder_stop(struct rvtrace_component *comp)
 static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 {
 	int ret;
+	u32 comp_maj;
+
+	/* Pre-ratified ramsink setup */
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj == 0) {
+		ret = rvtrace_v0_ramsink_setup(comp);
+		if (ret)
+			return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+	}
 
 	ret = rvtrace_enable_component(comp->pdata);
 	if (ret)
diff --git a/drivers/hwtracing/rvtrace/rvtrace-funnel.c b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
index 2bf553a88d98..21f58001d569 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-funnel.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
@@ -54,6 +54,15 @@ static int rvtrace_funnel_probe(struct rvtrace_component *comp)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(comp->pdata->dev);
 	int ret;
+	u32 comp_maj;
+
+	/* Pre-ratified ramsink setup */
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj == 0) {
+		ret = rvtrace_v0_ramsink_setup(comp);
+		if (ret)
+			return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+	}
 
 	ret = rvtrace_enable_component(comp->pdata);
 	if (ret)
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index e569e875568b..e794b01e19d0 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -10,6 +10,8 @@
 #include <linux/rvtrace.h>
 #include <linux/types.h>
 #include <linux/sizes.h>
+#include "rvtrace-ramsink.h"
+#include "rvtrace-v0.h"
 
 #define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
 #define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
@@ -83,6 +85,20 @@ struct trace_buf {
 	size_t len;
 };
 
+/*
+ * Register offset for SiFive trace encoder/funnel system memory sink.
+ * Note: SiFive uses RVTRACE_V0_SINK_BASE_HIGH_OFF for start_high, limit_high,
+ * and wp_high (shared register).
+ */
+static const struct rvtrace_ramsink_regs rvtrace_v0_sink_regs = {
+	.start_low    = RVTRACE_V0_SINK_BASE_OFF,
+	.start_high   = RVTRACE_V0_SINK_BASE_HIGH_OFF,
+	.limit_low    = RVTRACE_V0_SINK_LIMIT_OFF,
+	.limit_high   = RVTRACE_V0_SINK_BASE_HIGH_OFF,  /* Shared with start_high */
+	.wp_low       = RVTRACE_V0_SINK_WP_OFF,
+	.wp_high      = RVTRACE_V0_SINK_BASE_HIGH_OFF,  /* Shared with start_high */
+};
+
 /* Register offsets for the standard RISC-V trace ramsink */
 static const struct rvtrace_ramsink_regs rvtrace_std_ramsink_regs = {
 	.start_low    = RVTRACE_RAMSINK_STARTLOW_OFF,
@@ -285,10 +301,10 @@ static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 	return 0;
 }
 
-static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
+int rvtrace_ramsink_setup(struct rvtrace_component *comp)
 {
 	struct rvtrace_ramsink_priv *priv;
-	u32 trram_ctrl;
+	u32 trram_ctrl, comp_maj;
 	int ret;
 
 	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
@@ -305,16 +321,26 @@ static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
 		break;
 	}
 
-	priv->regs = &rvtrace_std_ramsink_regs;
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	/* Pre-ratified ramsink regs */
+	if (comp_maj == 0)
+		priv->regs = &rvtrace_v0_sink_regs;
+	else
+		priv->regs = &rvtrace_std_ramsink_regs;
 
 	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
-	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
-	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ?
-		 "SMEM" : "SRAM");
 
-	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
+	if (comp_maj == 0) {
+		trram_ctrl |= priv->stop_on_wrap << RVTRACE_V0_CTRL_STOP_ON_WRAP_SHIFT;
+	} else {
+		trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
+		rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+		trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		dev_dbg(&comp->dev, "mode: %s\n",
+			(trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ? "SMEM" : "SRAM");
+		trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
+	}
+
 	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
 
 	ret = rvtrace_ramsink_setup_buf(comp, priv);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.h b/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
new file mode 100644
index 000000000000..7e0391aeffd5
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 SiFive, Inc.
+ */
+
+#ifndef __RVTRACE_RAMSINK_H__
+#define __RVTRACE_RAMSINK_H__
+
+int rvtrace_ramsink_setup(struct rvtrace_component *comp);
+
+#endif /* __RVTRACE_RAMSINK_H__ */
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.c b/drivers/hwtracing/rvtrace/rvtrace-v0.c
index ba87e1f7a839..9451d96024bc 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.c
@@ -3,8 +3,51 @@
  * Copyright (c) 2026 SiFive Inc.
  */
 
+#include <linux/of_reserved_mem.h>
 #include <linux/rvtrace.h>
 #include "rvtrace-v0.h"
+#include "rvtrace-ramsink.h"
+
+int rvtrace_v0_ramsink_setup(struct rvtrace_component *comp)
+{
+	struct rvtrace_v0_comp_features	*data = NULL;
+	int ret;
+	u32 val;
+
+	data = (struct rvtrace_v0_comp_features *)comp->id.data;
+	if (!data)
+		return -EINVAL;
+
+	if (comp->id.type > RVTRACE_COMPONENT_TYPE_FUNNEL)
+		return -EOPNOTSUPP;
+
+	if (data->has_sba_sink) {
+		/*
+		 * The pre-ratified ramsink's sink limit and write pointer registers share
+		 * their upper 32 bits with the sink base address register. This hardware
+		 * constraint prevents the trace buffer from crossing a 4GB memory boundary.
+		 *
+		 * Use of_reserved_mem_device_init() to associate the device with a
+		 * reserved memory region defined in the Device Tree. This ensures the
+		 * buffer allocation adheres to the necessary alignment and size constraints.
+		 */
+		ret = of_reserved_mem_device_init(comp->pdata->dev);
+		if (ret) {
+			dev_err(comp->pdata->dev, "Failed to get reserved memory region\n");
+			return ret;
+		}
+
+		/* Set comp sink to SBA (system memory) */
+		val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val &= ~RVTRACE_V0_CTRL_SINK_MASK;
+		val |= TE_SINK_SBA << RVTRACE_V0_CTRL_SINK_SHIFT;
+		rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+		return rvtrace_ramsink_setup(comp);
+	}
+
+	return 0;
+}
 
 int rvtrace_v0_sink_config(struct rvtrace_path_node *node)
 {
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.h b/drivers/hwtracing/rvtrace/rvtrace-v0.h
index 48728fef24c0..2b4e63e3ead0 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.h
@@ -9,6 +9,19 @@
 
 #include <linux/rvtrace.h>
 
+/* Register offsets */
+#define RVTRACE_V0_CTRL_OFF			0x000
+#define RVTRACE_V0_IMPL_OFF			0x004
+#define RVTRACE_V0_IMPL_EXTRA_OFF		0x008
+#define RVTRACE_V0_EV_CTRL_OFF			0x00c
+#define RVTRACE_V0_SINK_BASE_OFF		0x010
+#define RVTRACE_V0_SINK_BASE_HIGH_OFF		0x014
+#define RVTRACE_V0_SINK_LIMIT_OFF		0x018
+#define RVTRACE_V0_SINK_WP_OFF			0x01c
+#define RVTRACE_V0_SINK_RP_OFF			0x020
+#define RVTRACE_V0_SINK_DATA_OFF		0x024
+
+#define RVTRACE_V0_CTRL_STOP_ON_WRAP_SHIFT	14
 #define RVTRACE_V0_CTRL_SINK_SHIFT		28
 #define RVTRACE_V0_CTRL_SINK_MASK		GENMASK(31, RVTRACE_V0_CTRL_SINK_SHIFT)
 

-- 
2.34.1

