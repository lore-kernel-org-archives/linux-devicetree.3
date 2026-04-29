Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACEC3FB051;
	Wed, 29 Apr 2026 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467142; cv=none; b=Iwj2haE5CJekjZy1MxKr5GX2GlGDiGotR0KTDzrxHngehsVLIA5IRH89a+gpXKOsixT3CqCwev8EoZc+YoXBVwtfp52whInFdOXVGUtWyXjLdIqjO1QvC2DGKhybXhYHDCXiwUCWEmdPgt0o7i+rG4k2j2JdSPs26Gv74RH6HhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467142; c=relaxed/simple;
	bh=1095uXiuqsAXa/MWt576srlL10/ajViMa9weRPCDAiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cS7EHH0u3j6ms650GnapjPVGeTD+KqQSEOpWXhjfc+wtyFZ6w83X+uCbuX+32AQTnu6Z0jyImYTlQwmF7OtAmikaaG04oaX0hOg3937Ez2MVyqHmDDbesoqaRgm5BeTFFgaXtuG6nOC821nPRtHCUXWEDNPWH+u+IgXQHP/pt+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKZDZMYW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKZDZMYW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pnFa901599;
	Wed, 29 Apr 2026 12:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iGGDeNUT9MF
	tQmWgfZ3Kgva54kxCx/caPOWT3Otmue4=; b=bKZDZMYW8gDDX4/84RjbRo9vSFj
	cvx0cQtHDohixcFNpd86MSNCVOph6Ypp0jk0LcBArM7ulAiOai40niwQbNLOKpw4
	5zlRz6Wb627VqU3Lox8K8aCV4IHe5DfJWhijp05BYlVeoWYTQTj923Tgm3DGUB8w
	KVLF8ixStDoRM89whjP96sblX9nWxRPi2XMQCiGQoojnwQOEDSSanqdsgIg7dJWf
	Z8RkWd5gDZbOpzuMV0RK3kjKvXGNm745YJPZXxqcwC9/QTuuLT04bNqrtdNp/NLf
	UyvisKta1ZUxB9SSU4d7yhS0IoNsgzuVqeM9mb8WrwzcmBnpglFQPsbmXDA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9hqqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCpb4S010776;
	Wed, 29 Apr 2026 12:51:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds65fvr0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:37 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCpbEx010751;
	Wed, 29 Apr 2026 12:51:37 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCpb5F010747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:37 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id B455E21BF0; Wed, 29 Apr 2026 18:21:36 +0530 (+0530)
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
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v4 02/12] rvtrace: Initial implementation of driver framework
Date: Wed, 29 Apr 2026 18:21:25 +0530
Message-ID: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
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
X-Proofpoint-GUID: YXL19JS7Y08qcPoTni1OZLJ3LmPR3aqh
X-Proofpoint-ORIG-GUID: YXL19JS7Y08qcPoTni1OZLJ3LmPR3aqh
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1fedd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8
 a=YT8UZTGgE0tzOG1900gA:9 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMCBTYWx0ZWRfXxolWMhPLltc8
 KVQm+WgI5twDalDmYCq4o+9mJhI2Ewqv/ArlakDxlMqB5Xs2k6wQ+ad4p9ia0ijfNzLIg9JaWg4
 OuJLglmFcLh79qEW+PZ9uFabKjFIBYtK9JOh91QZUiA3wxd17j/WA0G43EHOderAlC6/8W7tfNi
 +JGlVbrNFA3J5Vi9RpBNLBoPBMZbYoUV1ZDeLx4LmpEOeeDbu89uJilI1BXmufxomcAKEZhdsGy
 f8MVkrUENhzgbiJ6De4nZHHWeqO8Jgsz3INcGH6zf2hAKz6VsK21vkkR7KAa02BqrFYk9nTXxKf
 yHIh3k32BZr444KeL23IG3BiZI3WZRVA44lfwVyRgURLW+2iNRmeXzWE8qy4y16tlL/BHPGuNCK
 zK/lcGZHjOBop1AdJxEINfFwWHArL3cbNhUo0+y8tOjYg+Uu4dqoIlYETgEQxTA2n4MHB+nP7co
 tfitGQxookzMRLHFMlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290130

The RISC-V Trace Control Interface Specification [1] defines a standard
way of implementing RISC-V trace related modular components irrespective
to underlying trace format (E-trace or N-trace). These RISC-V trace
components are organized in a graph-like topology where each RISC-V
hart has its own RISC-V trace encoder component.

Implement a basic driver framework for RISC-V trace where RISC-V trace
components are instantiated by a common platform driver and a separate
RISC-V trace driver for each type of RISC-V trace component.

[1] https://github.com/riscv-non-isa/tg-nexus-trace/releases/download/1.0_Ratified/RISC-V-Trace-Control-Interface.pdf

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/Makefile                             |   1 +
 drivers/hwtracing/Kconfig                    |   2 +
 drivers/hwtracing/rvtrace/Kconfig            |  16 +
 drivers/hwtracing/rvtrace/Makefile           |   4 +
 drivers/hwtracing/rvtrace/rvtrace-core.c     | 490 +++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-platform.c | 209 ++++++++
 include/linux/rvtrace.h                      | 283 +++++++++++
 7 files changed, 1005 insertions(+)
 create mode 100644 drivers/hwtracing/rvtrace/Kconfig
 create mode 100644 drivers/hwtracing/rvtrace/Makefile
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-core.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-platform.c
 create mode 100644 include/linux/rvtrace.h

diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..66d7a6bfa0e5 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -178,6 +178,7 @@ obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
+obj-$(CONFIG_RVTRACE)		+= hwtracing/rvtrace/
 obj-y				+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..daeb38fe332d 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/rvtrace/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
new file mode 100644
index 000000000000..f8f6feea1953
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menuconfig RVTRACE
+	tristate "RISC-V Trace Support"
+	depends on RISCV
+	depends on OF
+	default RISCV
+	help
+	  This framework provides a kernel interface for the RISC-V trace
+	  drivers (including both e-trace and n-trace). It's intended to
+	  build a topological view of the RISC-V trace components and
+	  configure the right series of components when trace is enabled
+	  on a CPU.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace.
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
new file mode 100644
index 000000000000..988525a379cf
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_RVTRACE) += rvtrace.o
+rvtrace-y := rvtrace-core.o rvtrace-platform.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
new file mode 100644
index 000000000000..d69c2236493a
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/cpumask.h>
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/idr.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/percpu.h>
+#include <linux/rvtrace.h>
+
+/* Mutex to serialize component registration/unregistration */
+static DEFINE_MUTEX(rvtrace_mutex);
+
+/* Per-CPU encoder instances */
+static DEFINE_PER_CPU(struct rvtrace_component *, rvtrace_cpu_encoder);
+
+/* Component type based id generator */
+struct rvtrace_type_idx {
+	/* Lock to protect the type ID generator */
+	struct mutex lock;
+	struct idr idr;
+};
+
+/* Array of component type based id generator */
+static struct rvtrace_type_idx rvtrace_type_idx_array[RVTRACE_COMPONENT_TYPE_MAX];
+
+static int rvtrace_alloc_type_idx(struct rvtrace_component *comp)
+{
+	struct rvtrace_type_idx *rvidx = &rvtrace_type_idx_array[comp->id.type];
+	int idx;
+
+	mutex_lock(&rvidx->lock);
+	idx = idr_alloc(&rvidx->idr, comp, 0, 0, GFP_KERNEL);
+	mutex_unlock(&rvidx->lock);
+	if (idx < 0)
+		return idx;
+
+	comp->type_idx = idx;
+	return 0;
+}
+
+static void rvtrace_free_type_idx(struct rvtrace_component *comp)
+{
+	struct rvtrace_type_idx *rvidx = &rvtrace_type_idx_array[comp->id.type];
+
+	mutex_lock(&rvidx->lock);
+	idr_remove(&rvidx->idr, comp->type_idx);
+	mutex_unlock(&rvidx->lock);
+}
+
+static void __init rvtrace_init_type_idx(void)
+{
+	struct rvtrace_type_idx *rvidx;
+	int i;
+
+	for (i = 0; i < RVTRACE_COMPONENT_TYPE_MAX; i++) {
+		rvidx = &rvtrace_type_idx_array[i];
+		mutex_init(&rvidx->lock);
+		idr_init(&rvidx->idr);
+	}
+}
+
+const struct rvtrace_component_id *rvtrace_match_id(struct rvtrace_component *comp,
+						    const struct rvtrace_component_id *ids)
+{
+	u32 comp_maj, comp_min, id_maj, id_min;
+	const struct rvtrace_component_id *id;
+
+	for (id = ids; id->version && id->type; id++) {
+		if (comp->id.type != id->type)
+			return NULL;
+
+		id_maj = rvtrace_component_version_major(id->version);
+		id_min = rvtrace_component_version_minor(id->version);
+		comp_maj = rvtrace_component_version_major(comp->id.version);
+		comp_min = rvtrace_component_version_minor(comp->id.version);
+		if (comp_maj > id_maj)
+			continue;
+
+		/* Refer to Ch. 5 'Versioning of components of the Trace Control spec. */
+		if (comp_maj < id_maj)
+			dev_warn(&comp->dev, "Older component with major version %d\n", comp_maj);
+		if (comp_min == 15)
+			dev_warn(&comp->dev, "Experimental component\n");
+		else if (comp_min > id_min)
+			dev_warn(&comp->dev, "Newer component with minor version %d\n", comp_min);
+
+		return id;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(rvtrace_match_id);
+
+static int rvtrace_match_device(struct device *dev, const struct device_driver *drv)
+{
+	const struct rvtrace_driver *rtdrv = to_rvtrace_driver(drv);
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+
+	return rvtrace_match_id(comp, rtdrv->id_table) ? 1 : 0;
+}
+
+static int rvtrace_probe(struct device *dev)
+{
+	const struct rvtrace_driver *rtdrv = to_rvtrace_driver(dev->driver);
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+	int ret = -ENODEV;
+
+	if (!rtdrv->probe)
+		return ret;
+
+	ret = rtdrv->probe(comp);
+	if (!ret)
+		comp->ready = true;
+
+	return ret;
+}
+
+static void rvtrace_remove(struct device *dev)
+{
+	const struct rvtrace_driver *rtdrv = to_rvtrace_driver(dev->driver);
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+
+	comp->ready = false;
+	if (rtdrv->remove)
+		rtdrv->remove(comp);
+}
+
+static const struct bus_type rvtrace_bustype = {
+	.name	= "rvtrace",
+	.match	= rvtrace_match_device,
+	.probe	= rvtrace_probe,
+	.remove	= rvtrace_remove,
+};
+
+struct rvtrace_fwnode_match_data {
+	struct fwnode_handle *fwnode;
+	struct rvtrace_component *match;
+};
+
+static int rvtrace_match_fwnode(struct device *dev, void *data)
+{
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+	struct rvtrace_fwnode_match_data *d = data;
+
+	if (device_match_fwnode(&comp->dev, d->fwnode)) {
+		d->match = comp;
+		return 1;
+	}
+
+	return 0;
+}
+
+struct rvtrace_component *rvtrace_find_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct rvtrace_fwnode_match_data d = { .fwnode = fwnode, .match = NULL };
+	int ret;
+
+	ret = bus_for_each_dev(&rvtrace_bustype, NULL, &d, rvtrace_match_fwnode);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return d.match;
+}
+EXPORT_SYMBOL_GPL(rvtrace_find_by_fwnode);
+
+int rvtrace_poll_bit(struct rvtrace_platform_data *pdata, int offset,
+		     int bit, int bitval, int timeout)
+{
+	u32 val;
+
+	while (timeout--) {
+		val = rvtrace_read32(pdata, offset);
+		if (((val >> bit) & 0x1) == bitval)
+			break;
+		udelay(1);
+	}
+
+	return (timeout < 0) ? -ETIMEDOUT : 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_poll_bit);
+
+int rvtrace_enable_component(struct rvtrace_platform_data *pdata)
+{
+	u32 val;
+
+	val = rvtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	rvtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
+				pdata->control_poll_timeout_usecs);
+}
+EXPORT_SYMBOL_GPL(rvtrace_enable_component);
+
+int rvtrace_disable_component(struct rvtrace_platform_data *pdata)
+{
+	u32 val;
+
+	val = rvtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	rvtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
+				pdata->control_poll_timeout_usecs);
+}
+EXPORT_SYMBOL_GPL(rvtrace_disable_component);
+
+int rvtrace_reset_component(struct rvtrace_platform_data *pdata)
+{
+	int ret;
+
+	rvtrace_write32(pdata, 0, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 0,
+			       pdata->control_poll_timeout_usecs);
+	if (ret)
+		return ret;
+
+	rvtrace_write32(pdata, RVTRACE_COMPONENT_CTRL_ACTIVE_MASK,
+			RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 1,
+				pdata->control_poll_timeout_usecs);
+}
+EXPORT_SYMBOL_GPL(rvtrace_reset_component);
+
+struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu)
+{
+	if (!cpu_present(cpu))
+		return NULL;
+
+	return per_cpu(rvtrace_cpu_encoder, cpu);
+}
+EXPORT_SYMBOL_GPL(rvtrace_cpu_source);
+
+static int rvtrace_cleanup_inconn(struct device *dev, void *data)
+{
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn = data;
+	int i;
+
+	if (device_match_fwnode(&comp->dev, conn->dest_fwnode)) {
+		for (i = 0; i < pdata->nr_inconns; i++) {
+			if (pdata->inconns[i] != conn)
+				continue;
+			pdata->inconns[i] = NULL;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static void rvtrace_cleanup_inconns_from_outconns(struct rvtrace_component *comp)
+{
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn;
+	int i;
+
+	lockdep_assert_held(&rvtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		bus_for_each_dev(&rvtrace_bustype, NULL, conn, rvtrace_cleanup_inconn);
+	}
+}
+
+static int rvtrace_setup_inconn(struct device *dev, void *data)
+{
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn = data;
+	int i;
+
+	if (device_match_fwnode(&comp->dev, conn->dest_fwnode)) {
+		for (i = 0; i < pdata->nr_inconns; i++) {
+			if (pdata->inconns[i])
+				continue;
+			pdata->inconns[i] = conn;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static int rvtrace_setup_inconns_from_outconns(struct rvtrace_component *comp)
+{
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn;
+	int i, ret;
+
+	lockdep_assert_held(&rvtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = bus_for_each_dev(&rvtrace_bustype, NULL, conn, rvtrace_setup_inconn);
+		if (ret < 0) {
+			rvtrace_cleanup_inconns_from_outconns(comp);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void rvtrace_component_release(struct device *dev)
+{
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+
+	fwnode_handle_put(comp->dev.fwnode);
+	rvtrace_free_type_idx(comp);
+	kfree(comp);
+}
+
+struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type type,
+						     u32 version,
+						     struct rvtrace_platform_data *pdata)
+{
+	struct rvtrace_connection *conn;
+	struct rvtrace_component *comp;
+	int i, ret = 0;
+
+	if (!pdata || !pdata->dev) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	for (i = 0; i < pdata->nr_inconns; i++) {
+		if (pdata->inconns[i]) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+	}
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (!conn || conn->src_port < 0 || conn->src_comp ||
+		    !device_match_fwnode(pdata->dev, conn->src_fwnode) ||
+		    conn->dest_port < 0 || !conn->dest_fwnode || !conn->dest_comp) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+	}
+
+	if (pdata->bound_cpu >= 0 && !cpu_present(pdata->bound_cpu)) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+	if (type == RVTRACE_COMPONENT_TYPE_ENCODER && pdata->bound_cpu < 0) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	comp = kzalloc(sizeof(*comp), GFP_KERNEL);
+	if (!comp) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+	comp->pdata = pdata;
+	comp->id.type = type;
+	comp->id.version = version;
+	ret = rvtrace_alloc_type_idx(comp);
+	if (ret) {
+		kfree(comp);
+		goto err_out;
+	}
+
+	comp->dev.parent = pdata->dev;
+	comp->dev.coherent_dma_mask = pdata->dev->coherent_dma_mask;
+	comp->dev.release = rvtrace_component_release;
+	comp->dev.bus = &rvtrace_bustype;
+	comp->dev.fwnode = fwnode_handle_get(dev_fwnode(pdata->dev));
+	switch (comp->id.type) {
+	case RVTRACE_COMPONENT_TYPE_ENCODER:
+		dev_set_name(&comp->dev, "encoder-%d", comp->type_idx);
+		break;
+	case RVTRACE_COMPONENT_TYPE_FUNNEL:
+		dev_set_name(&comp->dev, "funnel-%d", comp->type_idx);
+		break;
+	case RVTRACE_COMPONENT_TYPE_RAMSINK:
+		dev_set_name(&comp->dev, "ramsink-%d", comp->type_idx);
+		break;
+	case RVTRACE_COMPONENT_TYPE_PIBSINK:
+		dev_set_name(&comp->dev, "pibsink-%d", comp->type_idx);
+		break;
+	case RVTRACE_COMPONENT_TYPE_ATBBRIDGE:
+		dev_set_name(&comp->dev, "atbbridge-%d", comp->type_idx);
+		break;
+	default:
+		dev_set_name(&comp->dev, "type%d-%d", comp->id.type, comp->type_idx);
+		break;
+	}
+
+	mutex_lock(&rvtrace_mutex);
+
+	ret = device_register(&comp->dev);
+	if (ret) {
+		put_device(&comp->dev);
+		goto err_out_unlock;
+	}
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		conn->src_comp = comp;
+	}
+
+	ret = rvtrace_setup_inconns_from_outconns(comp);
+	if (ret < 0) {
+		device_unregister(&comp->dev);
+		goto err_out_unlock;
+	}
+
+	if (comp->id.type == RVTRACE_COMPONENT_TYPE_ENCODER) {
+		rvtrace_get_component(comp);
+		per_cpu(rvtrace_cpu_encoder, comp->pdata->bound_cpu) = comp;
+	}
+
+	mutex_unlock(&rvtrace_mutex);
+
+	return comp;
+
+err_out_unlock:
+	mutex_unlock(&rvtrace_mutex);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(rvtrace_register_component);
+
+void rvtrace_unregister_component(struct rvtrace_component *comp)
+{
+	struct rvtrace_component *c;
+
+	mutex_lock(&rvtrace_mutex);
+
+	if (comp->id.type == RVTRACE_COMPONENT_TYPE_ENCODER) {
+		c = per_cpu(rvtrace_cpu_encoder, comp->pdata->bound_cpu);
+		per_cpu(rvtrace_cpu_encoder, comp->pdata->bound_cpu) = NULL;
+		rvtrace_put_component(c);
+	}
+
+	rvtrace_cleanup_inconns_from_outconns(comp);
+	device_unregister(&comp->dev);
+
+	mutex_unlock(&rvtrace_mutex);
+}
+EXPORT_SYMBOL_GPL(rvtrace_unregister_component);
+
+int __rvtrace_register_driver(struct module *owner, struct rvtrace_driver *rtdrv)
+{
+	rtdrv->driver.owner = owner;
+	rtdrv->driver.bus = &rvtrace_bustype;
+
+	return driver_register(&rtdrv->driver);
+}
+EXPORT_SYMBOL_GPL(__rvtrace_register_driver);
+
+static int __init rvtrace_init(void)
+{
+	int ret;
+
+	rvtrace_init_type_idx();
+
+	ret = bus_register(&rvtrace_bustype);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&rvtrace_platform_driver);
+	if (ret) {
+		bus_unregister(&rvtrace_bustype);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit rvtrace_exit(void)
+{
+	platform_driver_unregister(&rvtrace_platform_driver);
+	bus_unregister(&rvtrace_bustype);
+}
+
+module_init(rvtrace_init);
+module_exit(rvtrace_exit);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-platform.c b/drivers/hwtracing/rvtrace/rvtrace-platform.c
new file mode 100644
index 000000000000..83e5a577bc52
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-platform.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/rvtrace.h>
+#include <linux/types.h>
+
+static int rvtrace_of_parse_outconns(struct rvtrace_platform_data *pdata)
+{
+	struct device_node *parent, *ep_node, *rep_node, *rdev_node;
+	struct rvtrace_connection *conn;
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
+		/* The 'src_comp' is set by rvtrace_register_component() */
+		conn->src_comp = NULL;
+		conn->dest_port = rep.port;
+		conn->dest_fwnode = of_fwnode_handle(rdev_node);
+		fwnode_handle_get(conn->dest_fwnode);
+		conn->dest_comp = rvtrace_find_by_fwnode(conn->dest_fwnode);
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
+static int rvtrace_of_parse_inconns(struct rvtrace_platform_data *pdata)
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
+	struct rvtrace_platform_data *pdata;
+	struct device *dev = &pdev->dev;
+	struct rvtrace_component *comp;
+	u32 impl, type, major, minor;
+	struct device_node *node;
+	struct resource *res;
+	int ret;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	pdata->dev = dev;
+	pdata->impid = RVTRACE_COMPONENT_IMPID_UNKNOWN;
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
+	ret = rvtrace_reset_component(pdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset component\n");
+
+	impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
+	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK;
+	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMINOR_MASK;
+
+	comp = rvtrace_register_component(type, rvtrace_component_mkversion(major, minor), pdata);
+	if (IS_ERR(comp))
+		return PTR_ERR(comp);
+
+	platform_set_drvdata(pdev, comp);
+	return 0;
+}
+
+static void rvtrace_platform_remove(struct platform_device *pdev)
+{
+	struct rvtrace_component *comp = platform_get_drvdata(pdev);
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn;
+	int i;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (conn && conn->dest_fwnode)
+			fwnode_handle_put(conn->dest_fwnode);
+	}
+
+	rvtrace_unregister_component(comp);
+}
+
+static const struct of_device_id rvtrace_platform_match[] = {
+	{ .compatible = "riscv,trace-component" },
+	{}
+};
+
+struct platform_driver rvtrace_platform_driver = {
+	.driver = {
+		.name		= "rvtrace",
+		.of_match_table	= rvtrace_platform_match,
+	},
+	.probe = rvtrace_platform_probe,
+	.remove = rvtrace_platform_remove,
+};
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
new file mode 100644
index 000000000000..d6be6e3cc10f
--- /dev/null
+++ b/include/linux/rvtrace.h
@@ -0,0 +1,283 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef __LINUX_RVTRACE_H__
+#define __LINUX_RVTRACE_H__
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
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
+/* Possible component types defined by the RISC-V Trace Control Interface */
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
+/* Encoding/decoding macros for RISC-V trace component version */
+#define rvtrace_component_version_major(__version)	\
+	(((__version) >> 16) & 0xffff)
+#define rvtrace_component_version_minor(__version)	\
+	((__version) & 0xffff)
+#define rvtrace_component_mkversion(__major, __minor)	\
+	((((__major) & 0xffff) << 16) |	((__minor) & 0xffff))
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
+/**
+ * struct rvtrace_connection - Representation of a physical connection between
+ * two RISC-V trace components.
+ * @src_port:    A connection's source port number.
+ * @src_fwnode:  Source component's fwnode handle..
+ * @src_comp:    Source component's pointer.
+ * @dest_port:   A connection's destination port number.
+ * @dest_fwnode: Destination component's fwnode handle.
+ * @dest_comp:   Destination component's pointer.
+ */
+struct rvtrace_connection {
+	int src_port;
+	struct fwnode_handle *src_fwnode;
+	int dest_port;
+	struct fwnode_handle *dest_fwnode;
+	struct rvtrace_component *src_comp;
+	struct rvtrace_component *dest_comp;
+};
+
+/**
+ * struct rvtrace_platform_data - Platform-level data for a RISC-V trace component
+ * discovered from DT or ACPI.
+ * @dev:         Parent device.
+ * @impid:       Component implementation ID
+ * @io_mem:      Flag showing whether component registers are memory mapped.
+ * @base:        If io_mem == true then base address of the memory mapped registers.
+ * @read:        If io_mem == false then read register from the given "offset".
+ * @write:       If io_mem == false then write register to the given "offset".
+ * @bound_cpu:   CPU to which the component is bound. This should be -1 if
+ *               the component is not bound to any CPU. For encoder component
+ *               type this must not be -1.
+ * @nr_inconns:  Number of input connections.
+ * @inconns:     Array of pointers to input connections.
+ * @nr_outconns: Number of output connections.
+ * @outconns:    Array of pointers to output connections.
+ */
+struct rvtrace_platform_data {
+	struct device *dev;
+
+	enum rvtrace_component_impid impid;
+
+	bool io_mem;
+	union {
+		void __iomem *base;
+		struct {
+			u32 (*read)(struct rvtrace_platform_data *pdata,
+				    u32 offset, bool relaxed);
+			void (*write)(struct rvtrace_platform_data *pdata,
+				      u32 val, u32 offset, bool relaxed);
+		};
+	};
+
+	int bound_cpu;
+
+	/* Delay in microseconds when polling control register bits */
+	int control_poll_timeout_usecs;
+
+	/*
+	 * Platform driver must only populate empty pointer array without
+	 * any actual input connections.
+	 */
+	unsigned int nr_inconns;
+	struct rvtrace_connection **inconns;
+
+	/*
+	 * Platform driver must fully populate pointer array with individual
+	 * array elements pointing to actual output connections. The src_comp
+	 * of each output connection is automatically updated at the time of
+	 * registering component.
+	 */
+	unsigned int nr_outconns;
+	struct rvtrace_connection **outconns;
+};
+
+static inline u32 rvtrace_read32(struct rvtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl(pdata->base + offset);
+
+	return pdata->read(pdata, offset, false);
+}
+
+static inline u32 rvtrace_relaxed_read32(struct rvtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl_relaxed(pdata->base + offset);
+
+	return pdata->read(pdata, offset, true);
+}
+
+static inline void rvtrace_write32(struct rvtrace_platform_data *pdata, u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, false);
+}
+
+static inline void rvtrace_relaxed_write32(struct rvtrace_platform_data *pdata,
+					   u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel_relaxed(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, true);
+}
+
+static inline bool rvtrace_is_source(struct rvtrace_platform_data *pdata)
+{
+	return !pdata->nr_inconns ? true : false;
+}
+
+static inline bool rvtrace_is_sink(struct rvtrace_platform_data *pdata)
+{
+	return !pdata->nr_outconns ? true : false;
+}
+
+/**
+ * struct rvtrace_component_id - Details to identify or match a RISC-V trace component
+ * @type:      Type of the component
+ * @version:   Version of the component
+ * @data:      Data pointer for driver use
+ */
+struct rvtrace_component_id {
+	enum rvtrace_component_type type;
+	u32 version;
+	void *data;
+};
+
+/**
+ * struct rvtrace_component - Representation of a RISC-V trace component
+ * pdata:    Pointer to underlying platform data
+ * id:       Details to match the component
+ * type_idx: Unique number based on component type
+ * dev:      Device instance
+ * ready:    Flag showing whether RISC-V trace driver was probed successfully
+ */
+struct rvtrace_component {
+	struct rvtrace_platform_data *pdata;
+	struct rvtrace_component_id id;
+	u32 type_idx;
+	struct device dev;
+	bool ready;
+};
+
+#define to_rvtrace_component(__dev)	container_of_const(__dev, struct rvtrace_component, dev)
+
+static inline void rvtrace_get_component(struct rvtrace_component *comp)
+{
+	get_device(&comp->dev);
+}
+
+static inline void rvtrace_put_component(struct rvtrace_component *comp)
+{
+	put_device(&comp->dev);
+}
+
+const struct rvtrace_component_id *rvtrace_match_id(struct rvtrace_component *comp,
+						    const struct rvtrace_component_id *ids);
+struct rvtrace_component *rvtrace_find_by_fwnode(struct fwnode_handle *fwnode);
+
+int rvtrace_poll_bit(struct rvtrace_platform_data *pdata, int offset,
+		     int bit, int bitval, int timeout);
+int rvtrace_enable_component(struct rvtrace_platform_data *pdata);
+int rvtrace_disable_component(struct rvtrace_platform_data *pdata);
+int rvtrace_reset_component(struct rvtrace_platform_data *pdata);
+
+struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu);
+
+struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type type,
+						     u32 version,
+						     struct rvtrace_platform_data *pdata);
+void rvtrace_unregister_component(struct rvtrace_component *comp);
+
+/**
+ * struct rvtrace_driver - Representation of a RISC-V trace driver
+ * id_table: Table to match components handled by the driver
+ * probe:    Driver probe() function
+ * remove:   Driver remove() function
+ * driver:   Device driver instance
+ */
+struct rvtrace_driver {
+	const struct rvtrace_component_id *id_table;
+	int			(*probe)(struct rvtrace_component *comp);
+	void			(*remove)(struct rvtrace_component *comp);
+	struct device_driver	driver;
+};
+
+#define to_rvtrace_driver(__drv)   \
+	((__drv) ? container_of_const((__drv), struct rvtrace_driver, driver) : NULL)
+
+extern struct platform_driver rvtrace_platform_driver;
+
+int __rvtrace_register_driver(struct module *owner, struct rvtrace_driver *rtdrv);
+#define rvtrace_register_driver(driver) __rvtrace_register_driver(THIS_MODULE, driver)
+static inline void rvtrace_unregister_driver(struct rvtrace_driver *rtdrv)
+{
+	if (rtdrv)
+		driver_unregister(&rtdrv->driver);
+}
+
+static inline int rvtrace_comp_poll_empty(struct rvtrace_component *comp)
+{
+	return rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT, 1,
+				comp->pdata->control_poll_timeout_usecs);
+}
+
+#endif
-- 
2.43.0

