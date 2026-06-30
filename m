Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07DA3EE1E4
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812842; cv=none; b=FXGB+xoWiUtSHxDVPztKqUf37AXg0orgsTsC6olbg6+RZhZLf8Yi4qEDAZS7pINlkZMhLO2o021OCz+dpC+EgwAvqkFU0YFGr1aY7WMgN4Jt1N4pAQXqELsSG4yJLOZEKfv2T2r8hDfyUURpS4fEAcnCbMM5moamG2sH/qPhv9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812842; c=relaxed/simple;
	bh=eRKhmeO9nwyT5BisG6p3UGoQK0PWEsh0XUk+FQFnMnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZwTxskjcOotuf3uw/s0GoQShxA84/kpTMQni9c0oVevuMY5yF4TYPev4TB4WUbYscNNsPfhM5V/pN7jYIS4HvfXDxStascRjHdua2FRhtii9eAWwedxtx+McRB+IpIhdXXtokidl89ZoenCQcpMqPdVplZzH/46UDSrOAJr9zxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=COzIqIS7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="COzIqIS7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9e8a1d256so20353635ad.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812840; x=1783417640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qj8pE/XpiQwCOFu8myquPJudJuFdNQxFRhQdwwBjWd8=;
        b=COzIqIS7PXSrOPOuJkgWxTtcrJ7iQ18FR6gcTXmjPm1B1z0M44pQC7IiIXD5kTsE4/
         QJfEaIJxWhI5/gFbaI4V5/h5KNNeU2XM+cjPfZCcQFuoAHlwqqRTzxTmLZ56BZflAC83
         XDI3a23dv/d+d4ML603shnLepO1T3Zjspt9/d74xWPUlcDWzF+ifzj2ss/FxWzXXgNfe
         F4Un0CSUszR/UD7f2n8NdCFUezTWV+f/vq2cvcL/bcSFc35/STTtnYdB/LK44/pjUbYj
         ipuYA4cMDpM68k1B+nkg9Gd0VGdHqwCtOJ25GiMiUkfCAd4STPTYjEkVP2bQRjd2PTm2
         jmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812840; x=1783417640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qj8pE/XpiQwCOFu8myquPJudJuFdNQxFRhQdwwBjWd8=;
        b=Oo8jdQ/EKh3ijSuYN0JCCagsqrTphcuhDCyJmnNdM1JDClEjKcA4ui1vvjL1flaXSR
         wBparYfr/IDxY2ie7f2mtgPNe9+zx2UO9uru1co8gMkGo/V7b7uv4GvIYRlbhAbXSWYH
         hzmgLqNwIa5yucZHnu1UVOqKFzNCCEw1Jl/5Fl3iOKGYALnKQ8W8bvUdv7d4rAAXeqaf
         KBbkSjXhzWfAxCBFwG5xXvutumfefyDvqe/b0St1IYKRlHff8rhsX1uT3c1hvWq5QVm1
         +Q9tiO26kzxFQuH9XZtz6QrEcVRIX9OHGJ4JVUEyk2AAAvxFX9Zkr5oIPJVx7kPPF+rv
         E6rA==
X-Forwarded-Encrypted: i=1; AHgh+Rpy/o21yjiyu+yTwsp6eAmpzkjW8MkKa13WVHJbXZLwdmtPqEcKxrkltGvdvGe8O9Iw2mfBwkaL/0cp@vger.kernel.org
X-Gm-Message-State: AOJu0YybgkNqS1ggW3gBdizcdnLC8gtCPVx0cO9XbXFDj92tLCVYC+R0
	xkQwwtPmTNjQQ0Mp6cLpnp+ksX2g0UzbzQ1EvlLC2nSn4RGsAEG+P0RXJLbCRNasWu2idwqVUiN
	4zNZQni3gSeJZ7mi2mfu2C6Wbv3tX/zO1/MQuhq52533mDKMkwK71bVLV4hdZ/2COWkAGCstkOB
	qHcxz6EHu7ecThKT9nFVvu1pbtm1K0DzhruoabV0nT9PU9MrEAy8yJkQ==
X-Gm-Gg: AfdE7cmiJ0RYjU9N1Zvk+4y8I4oNO1oosLMrSz3QVeMFt1aGX83xB0eQEyjCnDYAzFY
	bOhXyS3IQdkha8S4wkWfnWRJ3aoOW9EHKF5O27Dfo4L2SJOZEENFbLkvL2w+mnAUXCugjMG9P6W
	+1r/WdMvzOKy/q3e7dHQCAFOVqeCUE26xKMGTMVkn+JbUB8Qunlz/h+4hmMQmJNKIr8PcA5Aduf
	CQrd72uLoeHwth0zK2jPgxQcRHYx2x1SVdsQpbmaGDz3Jj4W3HQzATWIJyAiTK8VYkoJ+ywBX6L
	xOslyKJlK0fsCb8eBwOkrZ4U7rGu1u8z/ACTlJfeghD4NyhhvYd31qxTdKsXsZNSSJTk45SSCf9
	uzwejZP1uXO1FjgDG9Yh+DmZVMAsydyHV+Sl8jkAe4/iPRNvklHULdfU/Aevp58yAtH0csPYRtp
	BrtRZWgcu/LKBvFWQGRQffPGiQRj+2Xv8=
X-Received: by 2002:a17:902:ce0d:b0:2ca:265d:6942 with SMTP id d9443c01a7336-2ca2d550766mr21933355ad.13.1782812840116;
        Tue, 30 Jun 2026 02:47:20 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:19 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:30 +0800
Subject: [PATCH RFC 07/12] rvtrace: Add pre-ratified trace funnel driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-7-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=4774;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=eRKhmeO9nwyT5BisG6p3UGoQK0PWEsh0XUk+FQFnMnk=;
 b=sIine6RnwOaPYur6Fv1Uo8271Vqx0C9pY3YBOMuk6CMw+SeUioi4/DDIRURBLVttYA3hxvpF+
 OJbDlnqHH4hDpjCCvbaP1150IOmCWRTHdDRE1CN7XbGAufAzW/TymVx
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

Add the initial implementation to support the pre-ratified RISC-V
trace funnel. This implementation provides basic functionality to
enable the trace funnel, configure its next sink when tracing starts,
and disable the funnel when tracing stops.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/Kconfig          |   7 ++
 drivers/hwtracing/rvtrace/Makefile         |   1 +
 drivers/hwtracing/rvtrace/rvtrace-funnel.c | 108 +++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index 5e84a3d0b633..f684ad0d8c3f 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -23,6 +23,13 @@ config RVTRACE_ENCODER
 	help
 	  This driver provides support for RISC-V Trace Encoder component.
 
+config RVTRACE_FUNNEL
+	tristate "RISC-V Trace Funnel driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for RISC-V Trace Funnel component.
+
 config RVTRACE_RAMSINK
 	tristate "RISC-V Trace Ramsink driver"
 	depends on RVTRACE
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
index 51b292b1b4c4..573709f9b2e3 100644
--- a/drivers/hwtracing/rvtrace/Makefile
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o rvtrace-platform.o rvtrace-perf.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
+obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-funnel.c b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
new file mode 100644
index 000000000000..2bf553a88d98
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/rvtrace.h>
+#include <linux/types.h>
+#include "rvtrace-v0.h"
+
+static int rvtrace_funnel_start(struct rvtrace_path_node *node)
+{
+	struct rvtrace_component *comp = node->comp;
+	u32 comp_maj;
+	int ret;
+
+	/* Set pre-ratified comp's next sink */
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj == 0) {
+		ret = rvtrace_v0_sink_config(node);
+		if (ret) {
+			dev_err(&comp->dev, "failed to set next sink.\n");
+			return ret;
+		}
+	} else if (comp_maj > 0) {
+		return -EOPNOTSUPP;
+	}
+
+	ret = rvtrace_enable_component(comp->pdata);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable funnel.\n");
+
+	return 0;
+}
+
+static int rvtrace_funnel_stop(struct rvtrace_component *comp)
+{
+	u32 comp_maj;
+	int ret;
+
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj > 0)
+		return -EOPNOTSUPP;
+
+	ret = rvtrace_disable_component(comp->pdata);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to disable funnel.\n");
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static int rvtrace_funnel_probe(struct rvtrace_component *comp)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(comp->pdata->dev);
+	int ret;
+
+	ret = rvtrace_enable_component(comp->pdata);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable funnel.\n");
+
+	dev_info(&comp->dev, "%s is available\n", fwnode_get_name(fwnode));
+
+	return 0;
+}
+
+static void rvtrace_funnel_remove(struct rvtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_disable_component(comp->pdata);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable funnel.\n");
+}
+
+static struct rvtrace_component_id rvtrace_funnel_ids[] = {
+	{ .type = RVTRACE_COMPONENT_TYPE_FUNNEL,
+	  .version = rvtrace_component_mkversion(0, 0), },
+	{},
+};
+
+static struct rvtrace_driver rvtrace_funnel_driver = {
+	.id_table = rvtrace_funnel_ids,
+	.start = rvtrace_funnel_start,
+	.stop = rvtrace_funnel_stop,
+	.probe = rvtrace_funnel_probe,
+	.remove = rvtrace_funnel_remove,
+	.driver = {
+		.name = "rvtrace-funnel",
+	},
+};
+
+static int __init rvtrace_funnel_init(void)
+{
+	return rvtrace_register_driver(&rvtrace_funnel_driver);
+}
+
+static void __exit rvtrace_funnel_exit(void)
+{
+	rvtrace_unregister_driver(&rvtrace_funnel_driver);
+}
+
+module_init(rvtrace_funnel_init);
+module_exit(rvtrace_funnel_exit);
+
+/* Module information */
+MODULE_DESCRIPTION("RISC-V Trace Funnel Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

