Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFB3417BDB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375416; cv=none; b=Agc7n1RXyXYqpytJzSdjxrMIsm+wt7w6Y5ThaE2pt/wkHG6mty4ptO3lQlbSolSxPUEE9g6tbzAbux9lnf5cmZd9eHO4Bw3xWp9Dbrn/P9nFg6MIIAmDDzxMop0D4pYGGc6OPAfxWDvw4Sf/dUBAVuaqnBjqIIfmC/it+hIbdhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375416; c=relaxed/simple;
	bh=taM84vFCSDxU9T4PpLRoFiDqoqkeHiWHwB/RuWcTBsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQSLyVyYJpWmYFz+djJd8v/SdEPQZV9tz09f+01PblRu2vGcdFkxXU87Wbalo+ZwL7DC0grcpNl3otKzehLN+WU6XL+zRLKY8BrJ21tSW/cPWc75uExywzktNqZOSGbpF6juPthbDm7Tner6N8UjPIle88RRiVqwuZoxerT5g5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpD0Ag9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQIfk9Dq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpD0Ag9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQIfk9Dq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjHJw1959759
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z+dM5DDsiVw
	nL9fNxml86eFgdNNsx+UOg0u0nQ6709c=; b=XpD0Ag9lMXWg1tJ+HQGfO578BtG
	vYik51BVA6uBtVVqaw+BKsfCx5jJxKLQAcEgebBAwcLLc6AAG+cBk1rw/LTupbAG
	jTN20Y9Zs60msmOyC7NYbTh6gEYlpGst2uus75k7CSeaZT1rIF1jdMjBHa6nSvww
	TgpKQFooIQjbP1zLCh1d+6uCftidYLJNqRNxOGD5a8GTzTnORWyQi7G8vQStz+VE
	9mS5U4xMBW136VN0eb8KHAFqeHEFbjgb+Pt6rbnWQhxCntuePI4qkVKKzXfLp7Nz
	x3xJk2aBgxHM7BU689WMLg5dxvtWSmoMYNku5SZYZlOGY1pTyCZoGugyzAg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xu9cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8486ffba174so4951470b3a.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375412; x=1786980212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+dM5DDsiVwnL9fNxml86eFgdNNsx+UOg0u0nQ6709c=;
        b=iQIfk9DqGWMnfGoTvxz/wVaf0X5mUdsrN89VWFRskuhNPOOGDp2E8z8UsPpp7xSg9V
         HiuCVM3hnblJIqd5/3X1k2tUZ81/4CmStXdROsxFqptHzS6ymbZpxPIF70E5YYB2W8ba
         xZ/buFq0fjMAfn8/KCI9ZsmEu51SIrThv0NxkQD6qn+Xz3DZHNxXH/P6L5vC+s54d6dF
         fu5DIvIZqhYbC8OMbPBoDI6sQYkjkzF4hy2BlsS9IZOcVrf8BAq6EuKQTOTDNbkxpWo5
         asOZL0H+zXiUEjbQkNrTimVd6CEY2Dzo7VZiZn65U8GZRZcYHWHgHX0rvNKvXyt4re9x
         10mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375412; x=1786980212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+dM5DDsiVwnL9fNxml86eFgdNNsx+UOg0u0nQ6709c=;
        b=TkqVWP/ufKdRD5mBDZ4nd7IIRudRyixcARzGBE6TCzbOrm8mH7Tp6y/Z/AtxQB3NLR
         u1/mALgF52UGRsX1zUxiPSNNxy8K/XEIJhHAcOurMjroEZD7H1okqNtfPDDnms2X7Kp0
         tM9XyQaMgjzHCCAk8PnUtG9TC8dmKITVGmaJLLGTfCIy7m8UQ6r+CV5WkBCXIuuChnuE
         +w38T7KU1HqKK3MtY22isP+tct+f/UJJHUQ8GfIvLxhBSl91pJMdtFYLfKX59nuYkNv9
         MBm5czhMCCmmuEKqB69FdMjAigqUN9+8jBX1MscX8bHXPA1E+W1rO7M17L/0kg2tGYIM
         smQw==
X-Forwarded-Encrypted: i=1; AHgh+RrPlcJUBYyFjvWJcD9COYhKoLV6KtOfXIcjtXfeoC6qgzJKT1ZWleDj/Nj5UtoArmNGVA+ljIrOts3D@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/nZO066vpvARE0MzAXf6gQ65S/sgeUo+8R5S6OWIZ7dX4+KFv
	KLyN51kU6c7favzV7MFB/AOWbSHpbOsh87ZWsoqqCp02dsNL4xeNeHHr7ucxmlO9EDF8x4Rzwca
	0EI/9iyBrWLSeqsv5M1y/1q4IAMyA6+NGw1OaSE05bPNj84kKRaVF5rMx5eb5DMK4
X-Gm-Gg: AR+sD12Grh41Wx/Jq19+jt8oHSrejnUxXGCNnPuBiY8IpmhOlfhCsxYmuP5M+pMONo2
	7C94fhMn66cNG/mkBcRO0JyrmqzkKlIGAxaJnxnjw4ervkQjPjxWiDshaZ0Hdra/PFTKSfmEvb5
	QFcJkdb5l4Ga6svuX3LcGmptNJ4PpE4lUeDHcMS1N+Z/h7vz7nEfTTBzWEPP5KwSBm2pS0kO/6E
	23yNrClevmDeyO35/OowrMn2QAy8AlYl1UWn8xHlXzGVhb0u7tTDIwLGeumH9xJkVbaDw/N0f03
	wpifN1LrC4XdxM7e0ZoA4opumPN1wKpkp7izb9Id3dAOnLekX8QXbfbf178xlGUED7bQhUHWOft
	Y8vEjCYT99GZOqV85pP5RDe1mn7nfGgtGTc7Dln/WqG/yyEdGElswhFXmYQAcrq+kozoK4/PIdG
	0XcSBoERmTou6AbwEsriBe23jxOg==
X-Received: by 2002:a05:6a00:2999:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-84f2dff1913mr51002062b3a.16.1786375412194;
        Mon, 10 Aug 2026 08:23:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2999:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-84f2dff1913mr51001953b3a.16.1786375411535;
        Mon, 10 Aug 2026 08:23:31 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:31 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v5 03/14] gtrace: Add RISC-V platform driver for the gtrace framework
Date: Mon, 10 Aug 2026 20:52:05 +0530
Message-ID: <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX82tJ4MHHe++S
 4yLSeO3Y0bEWXmhbiTruQeCXxitr5C09qW2RuTI0u42JiKHVf4ejxzUddaxUQOrE0fapHJzBfNU
 h0M5d9rGHahtziL0z+TdMty/9LiGB60=
X-Proofpoint-ORIG-GUID: GXvDlHfyVnPcANW0uRyOELQX1MUtd5Wh
X-Proofpoint-GUID: GXvDlHfyVnPcANW0uRyOELQX1MUtd5Wh
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79ecf5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=t0Z0ZKfJV8hCQccVx-oA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX+wJHPocMLgBT
 msiSfwKfs316I2tjUYd95XYnQtw9rl5VOTHhOSkxc0yjT7GeNMaJj1lwVMGcSmAwd7u5Or+Z3SV
 yZGx8Rw274eJOGu22yqXT+WjrzSuo5Ikxjlb6K+tbFUpyaX9utIqYvk9jzTYE8oRtExW+9aA0jN
 bMbHgPOO9NJuNAoHV4IRPqsSQebvWYmSFZcygrnv6lIPpldU5TW5nH3an3uFJrJhOob4JleyDFI
 K5R0tZce2lnl/eKwlNGdyClfvAb9N3pClK2uqqmmq7L0xlrJLSoKPU/RvBgfsdqlw3vqMuMT8Ay
 EzayV3isdtz8hsO8AJrBpSdaBg/pqq6Y0GohI3bkNjZeA62j0xMHPy2ETzYhanUsZZH1e6CF7Oj
 /gYqmB3NBNBeIkQlWabyYpK1xe1bka5gKalX/okrRsM+shSRVKfu7LVazlrx4z9ABwYqfez43Su
 mOM29xeaWpwPt6CXF+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V trace components defined by the RISC-V Trace Control Interface
Specification are memory mapped devices which are organized in a
graph-like topology and described in the device tree.

Add the RISC-V platform driver for the gtrace framework. The driver
parses the RISC-V component topology from the device tree, discovers the
type and version of each component from its IMPL register, provides the
RISC-V register level control ops and registers each component with the
gtrace core.

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig            |  15 +
 drivers/hwtracing/gtrace/Makefile           |   2 +
 drivers/hwtracing/gtrace/rvtrace-platform.c | 286 ++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace.h          | 121 +++++++++
 4 files changed, 424 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace.h

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index bcc3b4169a76..04986f216549 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -13,3 +13,18 @@ menuconfig GTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called gtrace.
+
+config RVTRACE
+	tristate "RISC-V Trace Support"
+	depends on RISCV
+	depends on OF
+	depends on GTRACE
+	default RISCV
+	help
+	  This provides the RISC-V backend for the generic hardware trace
+	  (gtrace) framework. It parses the RISC-V trace component topology,
+	  provides the RISC-V register-level control ops and registers each
+	  component with the gtrace core.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 3f90fb99c514..cf02316c1bbf 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -2,3 +2,5 @@
 
 obj-$(CONFIG_GTRACE) += gtrace.o
 gtrace-y := gtrace-core.o
+
+obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
new file mode 100644
index 000000000000..f34de9183d9a
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+
+static int rvtrace_hw_enable(struct gtrace_platform_data *pdata)
+{
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
+			       pdata->control_poll_timeout_usecs);
+}
+
+static int rvtrace_hw_disable(struct gtrace_platform_data *pdata)
+{
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
+			       pdata->control_poll_timeout_usecs);
+}
+
+static int rvtrace_hw_reset(struct gtrace_platform_data *pdata)
+{
+	int ret;
+
+	gtrace_write32(pdata, 0, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 0,
+			      pdata->control_poll_timeout_usecs);
+	if (ret)
+		return ret;
+
+	gtrace_write32(pdata, RVTRACE_COMPONENT_CTRL_ACTIVE_MASK,
+		       RVTRACE_COMPONENT_CTRL_OFFSET);
+	return gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 1,
+			       pdata->control_poll_timeout_usecs);
+}
+
+const struct gtrace_hw_ops rvtrace_hw_ops = {
+	.enable		= rvtrace_hw_enable,
+	.disable	= rvtrace_hw_disable,
+	.reset		= rvtrace_hw_reset,
+};
+
+static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
+{
+	struct device_node *parent, *ep_node, *rep_node, *rdev_node;
+	struct gtrace_connection *conn;
+	struct of_endpoint ep, rep;
+	int ret = 0, i = 0;
+
+	parent = of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
+	if (!parent)
+		return 0;
+
+	pdata->nr_outconns = of_graph_get_endpoint_count(parent);
+	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
+				       sizeof(*pdata->outconns), GFP_KERNEL);
+	if (!pdata->outconns) {
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	for_each_endpoint_of_node(parent, ep_node) {
+		conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
+		if (!conn) {
+			of_node_put(ep_node);
+			ret = -ENOMEM;
+			break;
+		}
+
+		ret = of_graph_parse_endpoint(ep_node, &ep);
+		if (ret) {
+			of_node_put(ep_node);
+			break;
+		}
+
+		rep_node = of_graph_get_remote_endpoint(ep_node);
+		if (!rep_node) {
+			ret = -ENODEV;
+			of_node_put(ep_node);
+			break;
+		}
+		rdev_node = of_graph_get_port_parent(rep_node);
+
+		ret = of_graph_parse_endpoint(rep_node, &rep);
+		if (ret) {
+			of_node_put(ep_node);
+			of_node_put(rep_node);
+			of_node_put(rdev_node);
+			break;
+		}
+
+		conn->src_port = ep.port;
+		conn->src_fwnode = dev_fwnode(pdata->dev);
+		/* The 'src_comp' is set by gtrace_register_component() */
+		conn->src_comp = NULL;
+		conn->dest_port = rep.port;
+		conn->dest_fwnode = of_fwnode_handle(rdev_node);
+		fwnode_handle_get(conn->dest_fwnode);
+		conn->dest_comp = gtrace_find_by_fwnode(conn->dest_fwnode);
+		if (!conn->dest_comp) {
+			ret = -EPROBE_DEFER;
+			of_node_put(ep_node);
+			of_node_put(rep_node);
+			of_node_put(rdev_node);
+			break;
+		}
+
+		pdata->outconns[i] = conn;
+		i++;
+	}
+
+done:
+	if (ret) {
+		for (i = 0; i < pdata->nr_outconns && pdata->outconns; i++) {
+			conn = pdata->outconns[i];
+			if (conn && conn->dest_fwnode)
+				fwnode_handle_put(conn->dest_fwnode);
+		}
+	}
+	of_node_put(parent);
+	return ret;
+}
+
+static int rvtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
+{
+	struct device_node *parent;
+	int ret = 0;
+
+	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
+	if (!parent)
+		return 0;
+
+	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
+	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
+				      sizeof(*pdata->inconns), GFP_KERNEL);
+	if (!pdata->inconns)
+		ret = -ENOMEM;
+
+	of_node_put(parent);
+	return ret;
+}
+
+static int rvtrace_platform_probe(struct platform_device *pdev)
+{
+	struct gtrace_platform_data *pdata;
+	struct device *dev = &pdev->dev;
+	struct gtrace_component_id id;
+	struct gtrace_component *comp;
+	u32 impl, type, major, minor;
+	struct device_node *node;
+	struct resource *res;
+	int gtype;
+	int ret;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	pdata->dev = dev;
+	pdata->impid = RVTRACE_COMPONENT_IMPID_UNKNOWN;
+	pdata->hw_ops = &rvtrace_hw_ops;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	pdata->io_mem = true;
+	pdata->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!pdata->base)
+		return dev_err_probe(dev, -ENOMEM, "failed to ioremap %pR\n", res);
+
+	pdata->bound_cpu = -1;
+	node = of_parse_phandle(dev_of_node(dev), "cpus", 0);
+	if (node) {
+		ret = of_cpu_node_to_id(node);
+		of_node_put(node);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to get CPU id for %pOF\n", node);
+		pdata->bound_cpu = ret;
+	}
+
+	/* Default control poll timeout */
+	pdata->control_poll_timeout_usecs = 10;
+
+	ret = rvtrace_of_parse_outconns(pdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse output connections\n");
+
+	ret = rvtrace_of_parse_inconns(pdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse input connections\n");
+
+	/* Reset the component before it is registered with the gtrace core. */
+	ret = rvtrace_hw_reset(pdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset component\n");
+
+	impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
+	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK;
+	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMINOR_MASK;
+
+	gtype = rvtrace_type_to_gtrace(type);
+	if (gtype < 0)
+		return dev_err_probe(dev, -ENODEV, "unsupported component type %u\n", type);
+
+	id.type = gtype;
+	id.version = rvtrace_component_mkversion(major, minor);
+
+	comp = gtrace_register_component(&id, rvtrace_type_name(gtype), pdata);
+	if (IS_ERR(comp))
+		return PTR_ERR(comp);
+
+	platform_set_drvdata(pdev, comp);
+	return 0;
+}
+
+static void rvtrace_platform_remove(struct platform_device *pdev)
+{
+	struct gtrace_component *comp = platform_get_drvdata(pdev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (conn && conn->dest_fwnode)
+			fwnode_handle_put(conn->dest_fwnode);
+	}
+
+	gtrace_unregister_component(comp);
+}
+
+static const struct of_device_id rvtrace_platform_match[] = {
+	{ .compatible = "riscv,trace-component" },
+	{}
+};
+
+static struct platform_driver rvtrace_platform_driver = {
+	.driver = {
+		.name		= "rvtrace",
+		.of_match_table	= rvtrace_platform_match,
+	},
+	.probe = rvtrace_platform_probe,
+	.remove = rvtrace_platform_remove,
+};
+
+static int __init rvtrace_platform_init(void)
+{
+	return platform_driver_register(&rvtrace_platform_driver);
+}
+
+static void __exit rvtrace_platform_exit(void)
+{
+	platform_driver_unregister(&rvtrace_platform_driver);
+}
+
+module_init(rvtrace_platform_init);
+module_exit(rvtrace_platform_exit);
+
+MODULE_AUTHOR("Anup Patel");
+MODULE_DESCRIPTION("RISC-V backend for the generic trace framework");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
new file mode 100644
index 000000000000..e6be1ce303cc
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ * RISC-V trace component register layout and helpers for the RISC-V backend
+ * of the generic trace (gtrace) framework. These definitions are specific to
+ * the RISC-V Trace Control Interface and must not be used by the generic core.
+ */
+
+#ifndef __LINUX_RVTRACE_H__
+#define __LINUX_RVTRACE_H__
+
+#include <linux/gtrace.h>
+#include <linux/types.h>
+
+/* Control register common across all RISC-V trace components */
+#define RVTRACE_COMPONENT_CTRL_OFFSET		0x000
+#define RVTRACE_COMPONENT_CTRL_ACTIVE_MASK	0x1
+#define RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT	0
+#define RVTRACE_COMPONENT_CTRL_ENABLE_MASK	0x1
+#define RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT	1
+#define RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT	3
+
+/* Implementation register common across all RISC-V trace components */
+#define RVTRACE_COMPONENT_IMPL_OFFSET		0x004
+#define RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT	0
+#define RVTRACE_COMPONENT_IMPL_VERMINOR_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT	4
+#define RVTRACE_COMPONENT_IMPL_TYPE_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_TYPE_SHIFT	8
+
+/* Component types defined by the RISC-V Trace Control Interface */
+enum rvtrace_component_type {
+	RVTRACE_COMPONENT_TYPE_RESV0,
+	RVTRACE_COMPONENT_TYPE_ENCODER, /* 0x1 */
+	RVTRACE_COMPONENT_TYPE_RESV2,
+	RVTRACE_COMPONENT_TYPE_RESV3,
+	RVTRACE_COMPONENT_TYPE_RESV4,
+	RVTRACE_COMPONENT_TYPE_RESV5,
+	RVTRACE_COMPONENT_TYPE_RESV6,
+	RVTRACE_COMPONENT_TYPE_RESV7,
+	RVTRACE_COMPONENT_TYPE_FUNNEL, /* 0x8 */
+	RVTRACE_COMPONENT_TYPE_RAMSINK, /* 0x9 */
+	RVTRACE_COMPONENT_TYPE_PIBSINK, /* 0xA */
+	RVTRACE_COMPONENT_TYPE_RESV11,
+	RVTRACE_COMPONENT_TYPE_RESV12,
+	RVTRACE_COMPONENT_TYPE_RESV13,
+	RVTRACE_COMPONENT_TYPE_ATBBRIDGE, /* 0xE */
+	RVTRACE_COMPONENT_TYPE_RESV15,
+	RVTRACE_COMPONENT_TYPE_MAX
+};
+
+/*
+ * Possible component implementation IDs discovered from DT or ACPI
+ * shared across the RISC-V trace drivers to infer trace parameters,
+ * quirks, and work-arounds. These component implementation IDs are
+ * internal to Linux and must not be exposed to user-space.
+ *
+ * The component implementation ID should be named as follows:
+ *    RVTRACE_COMPONENT_IMPID_<vendor>_<part>
+ */
+enum rvtrace_component_impid {
+	RVTRACE_COMPONENT_IMPID_UNKNOWN,
+	RVTRACE_COMPONENT_IMPID_MAX
+};
+
+#define rvtrace_component_version_major(__version)	\
+	(((__version) >> 16) & 0xffff)
+#define rvtrace_component_version_minor(__version)	\
+	((__version) & 0xffff)
+#define rvtrace_component_mkversion(__major, __minor)	\
+	((((__major) & 0xffff) << 16) | ((__minor) & 0xffff))
+
+/* Map a RISC-V hardware component type to the global gtrace type */
+static inline int rvtrace_type_to_gtrace(enum rvtrace_component_type type)
+{
+	switch (type) {
+	case RVTRACE_COMPONENT_TYPE_ENCODER:
+		return GTRACE_RVTRACE_ENCODER;
+	case RVTRACE_COMPONENT_TYPE_FUNNEL:
+		return GTRACE_RVTRACE_FUNNEL;
+	case RVTRACE_COMPONENT_TYPE_RAMSINK:
+		return GTRACE_RVTRACE_RAMSINK;
+	case RVTRACE_COMPONENT_TYPE_PIBSINK:
+		return GTRACE_RVTRACE_PIBSINK;
+	case RVTRACE_COMPONENT_TYPE_ATBBRIDGE:
+		return GTRACE_RVTRACE_ATBBRIDGE;
+	default:
+		return -EINVAL;
+	}
+}
+
+static inline const char *rvtrace_type_name(enum gtrace_component_type type)
+{
+	switch (type) {
+	case GTRACE_RVTRACE_ENCODER:
+		return "encoder";
+	case GTRACE_RVTRACE_FUNNEL:
+		return "funnel";
+	case GTRACE_RVTRACE_RAMSINK:
+		return "ramsink";
+	case GTRACE_RVTRACE_PIBSINK:
+		return "pibsink";
+	case GTRACE_RVTRACE_ATBBRIDGE:
+		return "atbbridge";
+	default:
+		return NULL;
+	}
+}
+
+static inline int rvtrace_comp_poll_empty(struct gtrace_component *comp)
+{
+	return gtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT, 1,
+			       comp->pdata->control_poll_timeout_usecs);
+}
+
+extern const struct gtrace_hw_ops rvtrace_hw_ops;
+
+#endif /* __LINUX_RVTRACE_H__ */
-- 
2.43.0

