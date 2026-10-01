Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E7A43A809
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832232; cv=none; b=D40+0ZhkY65/77tdfYxz5UTB47pg9FrCIPA4e9zAOKFKDvON18m8LEDYo2Lt6ORcanXNWh0mXui+eZVbZFlenC+VJ+wXcelCRxG6cZn7TG/M5ZKrnvvh0G+ml4wu2/XzLxbV3+E0IfkcMSNiMpLfCSTsnraHqyz+HvJt7wIiRwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832232; c=relaxed/simple;
	bh=ESMctJhLwttGxN9MluBpcSJeo/OCZArS1mPBGwzJFQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOvx9+e3X2qvZ6KoEm45PzsPg9ftD7KxIpQGdxm6JFYcJSeWkfZuTgAfBdTs6w0knxfelIwDfMkXFK32ZV31LKzXkvxiQldWBUGHuYZUvTeTiyjU2P8/l+22KPqwWYECI0qqEdzpuY3/GDpPLnEKUWUUki+CwgJCgJ6sdbKD9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULYoWAkL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yba9+GqE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULYoWAkL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yba9+GqE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913g8G1865989
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 05:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3DsIgeaBr3q
	KKU0wkToE8BS3wkTVxiMyMWIJlILltbo=; b=ULYoWAkLg4rOGoqS5c6HXXfEcsU
	1HrvcTzYfPPidxBGVquTbkOkxR8mu2Z7CmN8lVRaJAY+BShQsoX9l0Bd93xMLtUQ
	aHR/z0PLtbnxBzGzvYC6AioDpDNS74AkaxysfMiXj3/mJB2wzj92Gh/FJmdG8w5Q
	cnBgfyNvhho/frZxkv1VkvbwrBFZUZEPXpvBRRVXiy+NIUwDIw68z/ONnf5iGCQS
	q0J6ssim28jw1rTjTJBLd3D4VucK/EFJRnMOBF4eXlM4fELk/OOkjtM7zs/YPdBr
	rSWInUHUcAnUvCVu4M86hxUcXRy/vjRuuz9NeN1vsMj4chyooM2L0A5L/Vg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pja5ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:23:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3f521346so6499288a91.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832229; x=1791437029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DsIgeaBr3qKKU0wkToE8BS3wkTVxiMyMWIJlILltbo=;
        b=Yba9+GqEI0uNP5v7GpeV7wKyU07FD43/Lxw52nvBA7HJyWnb5jCRQxkQYabHycuX8y
         +o9f6ri+t6NvIRxuGLVD0ckoRNzYVzQN2fLnpE1+zNqKJ2t5cJ53xVWr0jMwuobeFXH/
         FGE/d9RZSQjMUY80KAH9guX13T4FTtyGHQxWP9pbartifnuNzYwRW3rDQwIgOSVjc0s3
         ix+947ishy+ZslVCdKV/5tPLrShjlqMvouo86+S6yr9aRSLRZvptBrLEgRVBFNLJLuVV
         YgkStioAXm3BOM9oGC9c6b5+0sudqzv1Co7tM0ruAB3lnCRWzxItQg3Aor2Fv1NyojDm
         kPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832229; x=1791437029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3DsIgeaBr3qKKU0wkToE8BS3wkTVxiMyMWIJlILltbo=;
        b=iLoRsIM6P21FK/ZKrb1LQ2vsc3sDjomwblO1NmsovYoKZMYq64bosOvYEihNoExAtZ
         Yths93w5LjaWa2Lxs4filDHGng4xebgPsGKgAh50zzs+Xvzk8YyzfBFI6z3Ok6kgZSWa
         FjYgF85EQXjGlhB3YGkkgEIVrw3NjTSJ8WVrTXpkw8TK8JAVzWKx1lzth0GhTUfQHVCS
         YMBrEa8Mp+OarrbNWjOBaZAmZCPLMv303YKTDlmsnErNZmBBOi+FFmO+H3tqAeJs4fiz
         np8o4mOGKJicpp7kPEI0hBRaEfGGbFfSpgtZzs6/FBsu8XilZ+hPu4tFbLBV8Y7mUny6
         OCzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0nq6tnOAsRU5O6iKweNUfl4yVbs6h37yAS6J2MNP4aYZ+Y6V5z4lK5ui/KXrVUblNvsaQDNp7aEwI@vger.kernel.org
X-Gm-Message-State: AFq9FYKOvOgf2oICymoyDs86ZqqhuaIAm4RoIO2ak9FaKaF81ZxjzUaL
	ozQQ4oIrSGglptDzU+Y2UVFa9AqY2oLW/eW7rEmEsbcWArxX9PaTENAftyTDHuQ1TGjSOVXuEAC
	hZU5EgiCB+rFEb/btuOoX8ZNwkTBksmbBVP5dJrimHM2mAQnpHGdvzKgE5xBUICSF
X-Gm-Gg: AYBFou2/VCDGUU6nnCaWkiuhrVmY8UmfH9CzUqKSABBGSQiXOofx3u34tke26DeKE3P
	DFg+whXE+tStKAHhj/0GufPwrYmvcN/yoTmsK1yClpff/pgB0eDHOUPyNgjdSUuabgb1T5DbyBW
	oJe8261R/Wc8+nISsmnnfQxuGLHDdWZehN+UvlGscOGidFCvGiWRC8ROEw9r29T8l/BJrKzrJgB
	7VPj3GdBkwVdv8DHSpytQoDP4FrWyuhLRe4Dh6RIp/P8Jzt4LwT1UEG8lrJBEf5V1MAGtEilGrU
	1Y7V71AxPb353bL6IPztmzr31ZruoyNkbcPykVq0wWWO3tUm5WeMwMCesUnNbR8mtS+gzFtMw7m
	+h/f3n4oaAi7NfsFEHJw54FOmiBQlaGwloIdsgUCuqd6fn6YBk/RNF9lpyS+TtT+2l+b9V30DgJ
	Ov2KMwOXusm3H4yEcvuBTEfiTG
X-Received: by 2002:a17:90b:2b44:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3a4d1509d61mr2868093a91.18.1790832228456;
        Wed, 30 Sep 2026 22:23:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2b44:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3a4d1509d61mr2868073a91.18.1790832227876;
        Wed, 30 Sep 2026 22:23:47 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:47 -0700 (PDT)
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
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the gtrace framework
Date: Thu,  1 Oct 2026 10:52:14 +0530
Message-ID: <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abdee65 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MynGWnbBoGqc5BfHMUQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: eV3zfrixaZjexAd-3a3pgHEp4dM4dyUF
X-Proofpoint-ORIG-GUID: eV3zfrixaZjexAd-3a3pgHEp4dM4dyUF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX34+fzZchKZ/1
 I0g9BmRINmMlMV6a8Q3Fo5W2Qw01p6WMqgglK1NIWwN7bDDO/sz1lRpmdh6SWZRxJSNkINtQDGg
 S08jVUdvXPO9ZXY4x2WqLBZcC/gGX8k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX0KphWyNCDw6F
 sZty2kc1rvGR2mFoEJtE+Yhj+axEvuUifkoGaufZO49SwfvImYoowUEi10k4dbmLG9qUgyiQnPz
 rs+KOTeZ9nxlTRX2z9DU2MXRgM05abl1VSxj7iQTKCsZX8qz2ADlfxU3dsTu/vN75Zcrr2X6mp8
 q0CGn6TWHgvJyn7E5lkcQ09kPW4+YWgZt5/ynYOk6K8lDWro0b/Lkz93J5gBE4Z92r26Kp+j64R
 if+RGusnRq6kpis2YXcvZmuNfsy5ckbbrUS6bDkxsSNA8jgsnKiqWAuNtsh0GjbqpLpG4ANkdv9
 yBV/mlcQ/80R3rwOF5WBuyr+jkX5Taz4oHmDT3VXwR3g+3jDXDAgg0211y60VrOIAM1mYdhf0r6
 VY94N2IqlxW3FGah9WYFDf1TqQ5EE+WrfWYZk4uHXkHXxMcKKoWS5C4hrHq0P74ScwmQzzVZVMI
 8s+xiS8+o5ELPH0Ta/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V trace components defined by the RISC-V Trace Control Interface
Specification are memory mapped devices which are organized in a
graph-like topology and described in the device tree.

Add the RISC-V platform driver for the gtrace framework. The driver
parses the RISC-V component topology from the device tree, discovers the
type and version of each component from its IMPL register, provides the
RISC-V register level control ops and registers each component with the
gtrace core.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig            |  15 ++
 drivers/hwtracing/gtrace/Makefile           |   3 +
 drivers/hwtracing/gtrace/gtrace-of.c        | 126 +++++++++++++
 drivers/hwtracing/gtrace/rvtrace-platform.c | 186 ++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace.h          | 121 +++++++++++++
 include/linux/gtrace.h                      |   3 +
 6 files changed, 454 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
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
index 3f90fb99c514..20f67a78b8ab 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -2,3 +2,6 @@
 
 obj-$(CONFIG_GTRACE) += gtrace.o
 gtrace-y := gtrace-core.o
+gtrace-$(CONFIG_OF) += gtrace-of.o
+
+obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
diff --git a/drivers/hwtracing/gtrace/gtrace-of.c b/drivers/hwtracing/gtrace/gtrace-of.c
new file mode 100644
index 000000000000..8f99cd35dcce
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-of.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/gtrace.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/property.h>
+
+/*
+ * Parse the "out-ports" graph of the component's device tree node and fill
+ * pdata->outconns.
+ * Return: 0 on success or when there are no output ports
+ *         -EPROBE_DEFER if a destination is not registered yet
+ *         negative error code otherwise.
+ */
+int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
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
+EXPORT_SYMBOL_GPL(gtrace_of_parse_outconns);
+
+/*
+ * Parse the "out-ports" graph of the component's device tree node and allocate
+ * pdata->inconns.
+ *
+ * Return: 0 on success or when there are no input ports, -ENOMEM otherwise.
+ */
+int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
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
+EXPORT_SYMBOL_GPL(gtrace_of_parse_inconns);
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
new file mode 100644
index 000000000000..a5655e983e51
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/io.h>
+#include <linux/of.h>
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
+	pdata->format = (uintptr_t)device_get_match_data(dev);
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
+	ret = gtrace_of_parse_outconns(pdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse output connections\n");
+
+	ret = gtrace_of_parse_inconns(pdata);
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
+	{ .compatible = "riscv,trace-component", .data = (void *)GTRACE_FORMAT_ETRACE },
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
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 3ae9fcf5bcfa..5368dca0e936 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -236,6 +236,9 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 						   struct gtrace_platform_data *pdata);
 void gtrace_unregister_component(struct gtrace_component *comp);
 
+int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata);
+int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
-- 
2.43.0

