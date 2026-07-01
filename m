Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAA232B118
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 05:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885369; cv=none; b=KWJ7kYk3WDK7pnBl3GfW2RDmjFW6rgq1La97IaASB6J/qDlXmKrRzS96oP6mw7eUOI2yVBxzakdL50u7Q0pt2WRRdUWZdoH8eInP6QcKGPxJcOTBC5gSNWzpdX6TJCVBFJ6CRcQtG33G7I45QCuT/Pyyt+gjxICzldJJ9FpAHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885369; c=relaxed/simple;
	bh=hnvbIfozVefWK8S2Bk++05lbB4qmlmu7L5lJ+voUoLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BIduzz9a+JlV7FSZYU49I3iEf6sRz8TOv53IB/NvGHZwk7sCB7/HVE+Ug3qxOWes/9IXz981DKFTFiF4bwAS4FlEhu2HNYjrKZt5F7qEH+s0Vhscf2nkUXNpblP1a7HCA2LBY6Y0zyjagubUya0/A0VhkmvcBvEsC1aFZIE6POA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h74zCW4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2r4N5DC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h74zCW4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2r4N5DC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lZiT058560
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 05:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZF33Hb636Zl
	3naXgxTQ5BQlQ0x23s56+TgTiHwtOpM8=; b=h74zCW4sFFTP69snC3btBmlpR5B
	psTJV43NgBT8Wf+g+zQvszDnW+/aFmWFmBQXDWyngZXSQJl65MI+sWSbio/GOTzK
	/dHXphIiynF5sz05OlgPQPJgdzLk4RPgATV0kfzidrXC+FRrkY4ezmtc5H/UwQ2G
	8ndvWa+gjUdy/wN+G8iQeOal3Wva94FjedbjPTNp/Rrul48xuQ4h0hNQcFxjomW3
	3cjkxmg6/R8hdxwOUS/nOadt9SZPhpxE0o8mxUEkfdd1gHSjJ003xRfHmIBNHXK0
	EchQhUejuHjstBO5y6eftOMIYr83ZscQoa+tcvg8mWB7w2lTCCSAQ6tfm+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfyatxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:56:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca0331d0b1so7035045ad.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885366; x=1783490166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF33Hb636Zl3naXgxTQ5BQlQ0x23s56+TgTiHwtOpM8=;
        b=b2r4N5DCujUF40hhi3mAemyRtZgaAFR72WynrAg0LkRpRYnvFc55vQRjCBaX/0D4GF
         tJZC0q5sP6xeqv6NBeCaz+dQDbVfFZfy1Y/W1vysGFiNoc/RsI8klmFEeRUB+Hc7olWm
         ot3550SJLPxG0ZfDrEVAIzhRFXGGleaiOWah2hZKJumfJWA39SwFRQvCiZ2ySSrEBIZc
         wgqI0DTlPSO1mmdQ8VCNiEGrOImBqbI0ndWnix/CkE6ttFZ7KejtWarZi45QUwCdRU8T
         qSzr0En0YAm5xPQLnK3QzrVUv0b+TsmmbQTTF8iC3DC8r7Bo3WZjrelUMfyyK0vtTrQ3
         PPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885366; x=1783490166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZF33Hb636Zl3naXgxTQ5BQlQ0x23s56+TgTiHwtOpM8=;
        b=BYDSWFQ2fVMqKUQvBLkjOfWeqpue+Nik+MvxRwBKS5WWqMy7QXzoA4fBhsi3Ky714s
         /aVWbTYQsSJiLi6Kg5dVFpkIc17f0/Z8hEQI8cbqTyqya29uls98Xi5WT2MqpJQXFUn6
         IMgmvNLVGboaVeOLEk7D7Y4L5yzSUmJMFhdm8n+SV0NXrnIwP2M6X9UOBvs9JNcY3v33
         2CyiiLluow/L3x9ubROBph77iEuGa0pIwV7PC6790tRttGbEBirCKB3El6BkNL2UnWER
         IXK/oX4uJRQp3w1/a8XW0XOVhfGVhhXHILi75AGIu6u/63ENluvwXPqBpv0rZPz4tY5/
         K5fg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2TOyGhVdB5+VqUOYueA9tvsNqoglY9spBmn2/4UrJSdUsVw2PjbNNPpF8i4uv821hJkPYa4bzFRIj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+R5kMGZbr+9n050IDj5J9pceCq30TbzWAcdZ2fqi4NTkIvAN
	6yr/NRN8R/GTytkF2o8FXhVOdoxDbaNsZ5B0vjo/VJIz+PBI5dksJTYqaufRosKIaanUiWUFhG/
	9btXQUKv1i+4paPqm1taMwQfRLzVng44NEs+VClrxkJixZYp1sts8tE8lXCPCbTpI
X-Gm-Gg: AfdE7cnK6j2bpBZQvh43xgR67G5d4OjGWxmBZhI8DsZtZ3BJbRkKkSobfbqIncECyAF
	X1z/KV0+GHR2xhxHmagTnxA86gim1BJZ5C68lMKYsO/irjcn0H5PH4FIZYrYsn/A3cwAs+ubCC6
	RKUAPucWbpZUx9Be0YokEgLjIkLg4wV2sgEk9OKN7D2apxjKRzBPe0tH3CrOoDhyrs5wOcPl1GE
	W/SN13n3LELl4SkurHy6SSEFl/cTHmQjbm6nPNeKAwUOsDveBvbW4J+h9KYGgFU3HMFIaKStkq3
	pMF8bLOq5VHiSns5AdYvzGGPY2GwS40+7qePK934m910i+5Xb63gRIYwMyFG18ubXTGgRa5AozB
	2KjxCTSB8FYQuMekJ14bBdnKZ4d4XYgCaZfFUoPzmCUaO/myPnxbLl9T+U2JXTF85sA==
X-Received: by 2002:a17:903:1245:b0:2ca:f4d:eff0 with SMTP id d9443c01a7336-2ca7e675bbbmr4065125ad.7.1782885365475;
        Tue, 30 Jun 2026 22:56:05 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2ca:f4d:eff0 with SMTP id d9443c01a7336-2ca7e675bbbmr4064905ad.7.1782885364929;
        Tue, 30 Jun 2026 22:56:04 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:04 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 2/7] qcom-tgu: Add TGU driver
Date: Tue, 30 Jun 2026 22:55:24 -0700
Message-Id: <20260701055529.445819-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a44abf6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=dBtDmtHw2wm7H2knD7gA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Hl4pY72WvIv5bzYidLfCAnVfsPkfNfDj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX3XoDVayhjIsY
 vT0yNMOVU3olRC647BwsxkA4vhh2zbrWpUc16b5n4EtJI/AaG/1eJf4NSUQ9RgqgCwVpmP7txwF
 xrcAkPW9DLsqJjVFc6491d4cFTr5+as=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX/1ySPJb27XNA
 CIT8RNDmP8CRTrBhyTf3Qdj49pCG7UEQTjwDVoVO4vHDl9xteOQVoQb9ybBztWFFpY+Lh2qfpn8
 iMFXaWiwsJQ1DtuilBYt11U2AId906bkegEgLY9Kxy9pCFtBpSG9tUYJUihOEa9oYlJEElq9MHy
 WvN9+3le+rvR4OJpgAPIwKiHXQ6/x5hmjVNcMlrcB62uhsg7QIUimiWEUvd9Nu6JnkEmZ2lVxsm
 2ZWapWHl2LfqNjIfrbRcvsZuz/XL6KwHsIPybfDfl03rSfXVf8CwAMhMpm3Z3imrvVurh5KG6It
 ORxLRXNVYz0XuZUv6AzUyALRuYy8GPtbhsZwrfZf10/WXtSO++0cqQB0RYImcN+1OS/BERmpO5P
 g5c09qWbwEcs6K1gPEHKs+4fIPPQ8SkK2KT/pRw7XtsHJYaxQei1E9+7nbDvIlk9ZRm1app61eh
 UJN5LsrWTgV8TXrAzzA==
X-Proofpoint-GUID: Hl4pY72WvIv5bzYidLfCAnVfsPkfNfDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 MAINTAINERS                                   |  11 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  20 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 8 files changed, 290 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..8eddcf3bb5fe
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..d627c27d0592 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22358,6 +22358,17 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM HARDWARETRACING DRIVER
+M:	Songwei Chai <songwei.chai@oss.qualcomm.com>
+M:	Jie Gan <jie.gan@oss.qualcomm.com>
+M:	Suzuki K Poulose <suzuki.poulose@arm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
+F:	Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+F:	Documentation/devicetree/bindings/arm/qcom,tgu.yaml
+F:	drivers/hwtracing/qcom/
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..6a2cbe5b340f 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)		+= ras/
 obj-$(CONFIG_USB4)		+= thunderbolt/
 obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
+obj-y				+= hwtracing/qcom/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
 obj-y				+= android/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..8a640218eed8 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/qcom/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
new file mode 100644
index 000000000000..5c94c75ffa39
--- /dev/null
+++ b/drivers/hwtracing/qcom/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# QCOM specific hwtracing drivers
+#
+menu "Qualcomm specific hwtracing drivers"
+
+config QCOM_TGU
+	tristate "QCOM Trigger Generation Unit driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on ARM_AMBA
+	help
+	  This driver provides support for Trigger Generation Unit that is
+	  used to detect patterns or sequences on a given set of signals.
+	  TGU is used to monitor a particular bus within a given region to
+	  detect illegal transaction sequences or slave responses. It is also
+	  used to monitor a data stream to detect protocol violations and to
+	  provide a trigger point for centering data around a specific event
+	  within the trace data buffer.
+
+endmenu
diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
new file mode 100644
index 000000000000..5a0a868c1ea0
--- /dev/null
+++ b/drivers/hwtracing/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_QCOM_TGU) += tgu.o
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
new file mode 100644
index 000000000000..49c8f710b931
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+
+#include "tgu.h"
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	TGU_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	TGU_LOCK(drvdata->base);
+}
+
+static int tgu_enable(struct device *dev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	guard(spinlock)(&drvdata->lock);
+	drvdata->enabled = true;
+
+	tgu_write_all_hw_regs(drvdata);
+
+	return 0;
+}
+
+static void tgu_do_disable(struct tgu_drvdata *drvdata)
+{
+	TGU_UNLOCK(drvdata->base);
+	writel(0, drvdata->base + TGU_CONTROL);
+	TGU_LOCK(drvdata->base);
+
+	drvdata->enabled = false;
+}
+
+static void tgu_disable(struct device *dev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	guard(spinlock)(&drvdata->lock);
+	if (!drvdata->enabled)
+		return;
+
+	tgu_do_disable(drvdata);
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	guard(spinlock)(&drvdata->lock);
+	enabled = drvdata->enabled;
+
+	return sysfs_emit(buf, "%d\n", !!enabled);
+}
+
+/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
+static ssize_t enable_tgu_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret || val > 1)
+		return -EINVAL;
+
+	if (val) {
+		scoped_guard(spinlock, &drvdata->lock) {
+			if (drvdata->enabled)
+				return -EBUSY;
+		}
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		ret = tgu_enable(dev);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
+	} else {
+		scoped_guard(spinlock, &drvdata->lock) {
+			if (!drvdata->enabled)
+				return -EINVAL;
+		}
+
+		tgu_disable(dev);
+		pm_runtime_put(dev);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(enable_tgu);
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable_tgu.attr,
+	NULL,
+};
+
+static const struct attribute_group tgu_common_grp = {
+	.attrs = tgu_common_attrs,
+	NULL,
+};
+
+static const struct attribute_group *tgu_attr_groups[] = {
+	&tgu_common_grp,
+	NULL,
+};
+
+static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
+
+	spin_lock_init(&drvdata->lock);
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	drvdata->enabled = false;
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	tgu_disable(dev);
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tgu_ids);
+
+static struct amba_driver tgu_driver = {
+	.drv = {
+		.name = "qcom-tgu",
+		.suppress_bind_attrs = true,
+	},
+	.probe = tgu_probe,
+	.remove = tgu_remove,
+	.id_table = tgu_ids,
+};
+
+module_amba_driver(tgu_driver);
+
+MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
+MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..dd7533b9d735
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL		0x0000
+#define TGU_LAR		0xfb0
+#define TGU_UNLOCK_OFFSET	0xc5acce55
+
+static inline void TGU_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + TGU_LAR);
+	} while (0);
+}
+
+static inline void TGU_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @lock: Spinlock for handling concurrent access to private data
+ * @enabled: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointers, clock, spinlock for
+ * synchronization, trigger data pointers, maximum limits for various
+ * trigger-related parameters, and enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	spinlock_t lock;
+	bool enabled;
+};
+
+#endif
-- 
2.34.1

