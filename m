Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684050;
	b=QxjEookr4X8DuObqN3E2iJhxeYvcuGJQ0GETwVzkRfDoU6eW9mjVmOLVdRgDRnPRZeDQ
	 zlL8q8dGH8HUdilO+BXLcnmMU/0seni5PeHjmDrjdClbGsG35PXc1dnGOdDSVwlqtdoVG
	 URn7IElVgxJfz913a9ddq0nm5QGXeTRGExY0fN/QxYMJqV316CCopMzu7lndx1Ea188sz
	 Bxn+zfviYyGLk6iWFaV+b45qLZ6OpUfYT2rd40w5kJ6XbvjGhfBEquoL9zXPyTrcb0FOb
	 XtLSSPH06tV7tlQxkvR+GPnDlx0nFJqXk+DI8vLudazy0OWqO17GzZbiy3sHOOxxaRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D34z4LAKYnHU9cCU4CpSl7aFm0LZ4mxwUeYBCb2GPa8=;
	b=bbNLVMNu7xyVFBYO5mS1DVQnFkjd8IFDfuYSum4YnumY+CtABySxdGNCUb4iNcv0xAnR
	 +EbiK0wEZIGukO375lLwNG263cimFuWH1GTOrwNp6W+wmOgfvxELkTFkfeC6WBgOM0PXn
	 j8McMKRReo1r4vNaC8A/8ohAgz0PT7vKo8IknF4XXgTVIx0a8dc9bjbK3jnnvNAFmnv0t
	 zSOow1SfgXBU3d5yiDV6i3PN8i5GSc6a21VimLAkrMudh79WQCVzh7Eh9YU105yZ/5GmO
	 WL+7GMP9j8536xRVQcdZQJcngBWyuANQwH6wYC3Q2IjU7jgUV1ogQz3c3Lgnx7GzmBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ejpAtzhQ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E452660A261D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E452660A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ejpAtzhQ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3869f03af6aso5951453eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684049; x=1796288849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D34z4LAKYnHU9cCU4CpSl7aFm0LZ4mxwUeYBCb2GPa8=;
        b=ejpAtzhQJJfX+zeG609ydxFLuwyxKIE9hOlNLCcuH0EZyryg7JlBZpNMtIjWCAURES
         GBU0NWjhxMuITwnSXZ9LGKjZ3iu/gkrtbTR8uy8PSDBZ1spA+6sOavFgeuFklNGIZgf1
         PK9e86FndRZff9I8TYGFqcmGkbWe4bzyWRcJiptqdtg47AWFRGYkJAZ9vsvViIOoMULk
         R6mFScu9g8g/WTpdvVDlzB4tTuwPCOKHmTV5xTstq06aZCiaPy5GoNrG3SXi7BRg8gwk
         v51scUg4ifp4t5JNLZlXumQ9EpMk3UhKTFn8j2H2MpPfTrzWcm3Ppzm9wm3fz57IcnFY
         b7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684049; x=1796288849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D34z4LAKYnHU9cCU4CpSl7aFm0LZ4mxwUeYBCb2GPa8=;
        b=OOlZ2smzM5JXixBIsr2GMOL7XpRarp8PA0L/QlaUO3efY403pwuYxcjdpK10gbM5St
         +zx+Y1oXyF2NcISHKgcA5Kce7nlodYN6IDdwKBGYJDP7p9omApSDjjpT2rUGyj7dJi+Y
         6cGjYsn/nF21PTgY6kacu1518AgZU4IcedYPIqS4lsFbDPSn3A+Xt7oEAlGfVpyTaQYL
         UJX5DIJs5AI8sFQTFre+4YXGMzXauAtBIKIHKEauQGRVVEhqcL0swDTMstzL3xFFe5ev
         7BDdsG0QravNaEhU8Zc8SLbTvium6ZMwdSM2+X9kg6IFWoqlUCKhuUUv103gBjVCW2+h
         HZ4A==
X-Forwarded-Encrypted: i=1; AL+hErHLxcFgp9+zZkqZntEFUHBihGHX1vvvpdVv+fSf0yVlzYnrWkHvKRdfpeF9vnJizi5JHpq2zaBS/Ay3@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZXmvFLhYz70o+czH5YsNe8CtJMSerS/SG7Acvv1+nGem1yeEo
	sF4XY7b8t9oJI46VuLT7oFt1ioh4Ri5plLLWrzcRjHFH0I5rhmF2t4jsBx53fvUE5Ofg7CB9V1x
	7FEwJUn1/Hk2hRACSpnCTq9F8cOvw9l46Lr6TrzyTzxZ4PW4dODDXBtmwG0PO9yn4WITjqUY8bU
	2b1ium4M2okzof/+DoMDZdTCFtAcfd5aQ1JYM8wQsmYApL76YN6Q==
X-Gm-Gg: AZFdTZdtR13o34VNlzBCRGKvZFn7jrQNG1l7x01ws9T7yGuuSBRwkkkcmXNSr5X+C7M
	1gl5JjOEoC+FnBUFxy4BsJFnfY9pXP4Kgl3/zirv1U0kzFsD5ZNjDd+L/EZw5tYpTgfRohTBL9C
	7+/bnFvFRwWHziUmg4HR7g9+vs3pA2iZSI6khcpKkLA4v79ZKF3gd2+BJONvpNP2zCp7Wba/CSz
	8gF6bKbjrmHTXFjxq4u3X0PH/jHRpT2skB4GEhFNjOhrif6zRzLSD7iMBExkzyXNUV172ww7P6l
	oAgDR6gYObVbIf/ywB4aXLyrvmAE2NGSEphdhiReu/+8XoVUQBk0pQj/P2kxYah7s5V6eosOyyJ
	7VbCEH8uFPbtgSL1yH7FnJlwSQAsfZAOo+p7E/o7vDZWvCTjcDVAGEM43VHDF53SU4TYRqveLFs
	qxyfb99kMg7aUiZi2mEA6Gfmvknx8is9oF2nKyVXdrLZXOwdB+8CP0pIioNCoTbSVOq10zcXJY1
	7xLB+wVxPylfrF+dJAGyMK7oo53D3QyCvrX0N7eePq/bpCjOsjchJWIWBPa7Z3/INxKR47J18Jp
	l4GbKa7qOpYnQpdxmqjNNhid5SoLuCJEfm48VpqjiP/a
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id 5a478bee46e88-3852ea8d7d4mr29001166eec.23.1795684048801;
        Thu, 26 Nov 2026 01:07:28 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:28 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:13 -0800
Subject: [PATCH 07/10] gtrace: rvtrace: Add pre-ratified trace funnel
 driver
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
Message-Id: <20261126-send-preratified-trace-v1-7-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0

From: Eric Lin <eric.lin@sifive.com>

Add the initial implementation to support the pre-ratified RISC-V
trace funnel. This implementation provides basic functionality to
enable the trace funnel, configure its next sink when tracing starts,
and disable the funnel when tracing stops.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/Kconfig          | 13 ++++
 drivers/hwtracing/gtrace/Makefile         |  1 +
 drivers/hwtracing/gtrace/rvtrace-funnel.c | 98 +++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index b1f9ca8f73cb..66fc2791d8f4 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -43,6 +43,19 @@ config RVTRACE_ENCODER
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-encoder.
 
+config RVTRACE_FUNNEL
+	tristate "RISC-V Trace Funnel driver"
+	depends on RVTRACE_V0
+	default y
+	help
+	  This driver provides support for the RISC-V trace funnel component
+	  which combines the trace data from multiple upstream components
+	  into a single trace stream. Only pre-ratified trace funnels are
+	  supported for now.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-funnel.
+
 config RVTRACE_RAMSINK
 	tristate "RISC-V Trace Ramsink driver"
 	depends on RVTRACE
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 0a2e2d1732c2..38dd96b3dc34 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -8,4 +8,5 @@ obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-platform.o
 rvtrace-$(CONFIG_RVTRACE_V0) += rvtrace-v0.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
new file mode 100644
index 000000000000..2e0843d233ab
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+#include "rvtrace-v0.h"
+
+static int rvtrace_funnel_start(struct gtrace_path_node *node)
+{
+	struct gtrace_component *comp = node->comp;
+	int ret;
+
+	/* Set pre-ratified comp's next sink */
+	ret = rvtrace_v0_sink_config(node);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set next sink.\n");
+		return ret;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to enable funnel.\n");
+
+	return ret;
+}
+
+static int rvtrace_funnel_stop(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to disable funnel.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static int rvtrace_funnel_probe(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable funnel.\n");
+
+	return 0;
+}
+
+static void rvtrace_funnel_remove(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable funnel.\n");
+}
+
+static const struct gtrace_component_id rvtrace_funnel_ids[] = {
+	{ .type = GTRACE_RVTRACE_FUNNEL,
+	  .version = rvtrace_component_mkversion(0, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_funnel_driver = {
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
+	return gtrace_register_driver(&rvtrace_funnel_driver);
+}
+
+static void __exit rvtrace_funnel_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_funnel_driver);
+}
+
+module_init(rvtrace_funnel_init);
+module_exit(rvtrace_funnel_exit);
+
+/* Module information */
+MODULE_DESCRIPTION("RISC-V Trace Funnel Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.7

