Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552433FB05B;
	Wed, 29 Apr 2026 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467136; cv=none; b=XXaqAK8QLZ3PXASRqdqGfr/6UBJA4r0LHq5XSRXjDUtTIvtElb37iYFjaL8Hq0jOewZM77dlHSV3KBFzBpe6q4IkYm1jbe5rNOORdLgpkUiJEfUjRflsoDID+taK0rCJP9inZD9fjZsR+VYRQ7qY9kG9/S51MGQwI5zpd8JHBtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467136; c=relaxed/simple;
	bh=4bl7/YjD5ptthtSBhvFFRBcottU9ktImwBEFtCPyz4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ekCgz+Hd8mDsHD1zA4HOg19hnJv+krdDZgDH6kknPdSAv7OOQSgPE8A0dERAb/tbKbyx7CPXjAn9JDg5ZT/p3l/0bOTWbwV0pOucqGAV8XsdXGvoCT7NcjVMfDZJ/9khY6jswzf6qryaeanS8esjCN/xO5VhNQNk6BzQ5+pCtRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni9/D1n3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni9/D1n3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7Un1721239;
	Wed, 29 Apr 2026 12:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZXpV6H7vjYk
	qUaAQjiqyywI8Ceb5UFQ6rPmGH1z1J90=; b=ni9/D1n3nctY7XwP66bBKV0/zFv
	Lfr9uQpqNxtv+DI9kiHNnvJrIlgBZrkHhpBgYw4/jvCo9na28bAvPtS/QOst0AVl
	6pZzZmzRLUkUC4UI8CejCpAWrzP44BFd4+59IPGDUz0N59E7QUOinqJwI/OFNRPu
	yL/FCIywhDaqELKawVkAVf8g28vHOxrmwUjTdCPDcCzYtaK3Bv4h1tZA7KnXAqo1
	nsh/FATcTHBeYQ+FL9uO2QqDPzndFyu3LJdUHrdtsWl/k856C8AQET9d8hse3T+4
	IWSGjnlbt1A2cXiaUlF2WCVvFyaEojjBsulTcp2PQxNRRSZR7Hu5tqTSgPQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7322ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCpb4V010776;
	Wed, 29 Apr 2026 12:51:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds65fvr1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:39 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCpcbi010814;
	Wed, 29 Apr 2026 12:51:38 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCpciV010801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BFF3F22110; Wed, 29 Apr 2026 18:21:36 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v4 05/12] rvtrace: Add trace encoder driver
Date: Wed, 29 Apr 2026 18:21:28 +0530
Message-ID: <20260429125135.1983498-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1fede cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Snd26lYfUHIjvdY5T_gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMCBTYWx0ZWRfXzopjcgDGWZTw
 Aazem1z7j7aH9uoCXE8DhRPz1ygydPPlIbcAeUC7VRBQaxKDC+GVSCn4N4bzGdKyAhU0amabNi1
 EwWlRGXABwB5Z9dXQVNrZaE36dS0PzzeipMcci2Z6jBVLrJEJpiQiVvf+VcEn3eRWEDnBa73doE
 8R9Zi8YTfU8UR2WDJ8P1Z24CpgwBVPPL+/Ai4i/pE5itFFQSwiaQ2BKpoW7A/DrNBMJAkw+n2UV
 edVTxblKaw0Dt0li0YZbkeXIouO/isidVwdpOt7iqcdRqAyjuH384f2tKG1/dTX8QoVvFuuLgDg
 Zcr5p4T5EIPqrZPyqd26ltJ2n2nt+NqX8Qz9v0E/uW0mjaCZaba9rW6kSiUwlY13wykUuioRIIG
 mjmqZmt+sp+xjl6hfuObaENYdlfelf35l1LdXCE3r6YUl9kOfJE+skIgL7bNYgaiEeetk9TIRe6
 21HboKMLX3SkN2J6Www==
X-Proofpoint-GUID: 5yLgl4jf3Up2vZprZMtxCVuuESarS-jw
X-Proofpoint-ORIG-GUID: 5yLgl4jf3Up2vZprZMtxCVuuESarS-jw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290130

From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

Add initial implementation of RISC-V trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/rvtrace/Kconfig           |   7 ++
 drivers/hwtracing/rvtrace/Makefile          |   1 +
 drivers/hwtracing/rvtrace/rvtrace-encoder.c | 130 ++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index f8f6feea1953..ba35c05f3f54 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -14,3 +14,10 @@ menuconfig RVTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace.
+
+config RVTRACE_ENCODER
+	tristate "RISC-V Trace Encoder driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for RISC-V Trace Encoder component.
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
index 988525a379cf..f320693a1fc5 100644
--- a/drivers/hwtracing/rvtrace/Makefile
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o rvtrace-platform.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
new file mode 100644
index 000000000000..d189819aecf7
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/rvtrace.h>
+#include <linux/types.h>
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
+
+static int rvtrace_encoder_start(struct rvtrace_component *comp)
+{
+	int ret;
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
+			       comp->pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable encoder.\n");
+		return ret;
+	}
+
+	/* set mode */
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
+			       comp->pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to enable tracing.\n");
+
+	return ret;
+}
+
+static int rvtrace_encoder_stop(struct rvtrace_component *comp)
+{
+	int ret;
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+			       comp->pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop tracing.\n");
+		return ret;
+	}
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
+			       comp->pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static int rvtrace_encoder_probe(struct rvtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_enable_component(comp->pdata);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable encoder.\n");
+
+	return 0;
+}
+
+static void rvtrace_encoder_remove(struct rvtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_disable_component(comp->pdata);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+}
+
+static struct rvtrace_component_id rvtrace_encoder_ids[] = {
+	{ .type = RVTRACE_COMPONENT_TYPE_ENCODER,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct rvtrace_driver rvtrace_encoder_driver = {
+	.id_table = rvtrace_encoder_ids,
+	.start = rvtrace_encoder_start,
+	.stop = rvtrace_encoder_stop,
+	.probe = rvtrace_encoder_probe,
+	.remove = rvtrace_encoder_remove,
+	.driver = {
+		.name = "rvtrace-encoder",
+	},
+};
+
+static int __init rvtrace_encoder_init(void)
+{
+	return rvtrace_register_driver(&rvtrace_encoder_driver);
+}
+
+static void __exit rvtrace_encoder_exit(void)
+{
+	rvtrace_unregister_driver(&rvtrace_encoder_driver);
+}
+
+module_init(rvtrace_encoder_init);
+module_exit(rvtrace_encoder_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V Trace Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

