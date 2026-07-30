Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8570D367B63
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398871; cv=none; b=eQLq+ukDIROh/c68LzmbQi4vme9FI3aa5B0UwhH3RZfSYzqsR/EgAGutQ8TKolLfktvyhm2+6uJxk27UNVZphtOGn+4bRk6ROFG2maFtfO2BdWTEnkwO+7SKrvk1iqY9m+63n+2AJm30uPv3SmaGZpFtAeLuWMRZB5QFhrZVE+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398871; c=relaxed/simple;
	bh=XkZC+VCD78aC1HgIFYNHSIbXV+TujpcNG0JPLu9ihkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fz8tkCGWAaOpUDkC9a7TP1TwMfFNLqDQkiDlIsHvYWrQ/DMJZsDomf9XvGrQlK/uleCUKiLunI1CsUDahO3iSNKcIEdvZ9uPt+td/l3Oa2jUnZhJ6BxJsuKdhUmntWR8kCT65hdKa0tcDQm6EOLgwttjXciBo/JrgbRm+zLB0xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtQ7ECk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfBzWyQO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtQ7ECk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfBzWyQO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U83C3W013140
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z7mwDzt4pyi
	csJbF/PR33YEwBkAHXFs91MmvUgurCW4=; b=OtQ7ECk/SETUBacw0cGjUCSYA97
	Kx40hAmwPyjXXUIxTEaU53QsKLUC3HzDGKAeefqWvLBhv5mLkS3GgE9nYELwOUSV
	CgzsDAN4qx/AhTgCo6vV5+j+5BMiDOhPIFpFJs+SXopQ5lEyr/2pyMJiEat2ZbYD
	lLSR1pilstZu6ZNWCWFTCmJ83J7fZOwiquagG2aNc2U+pij4Bg6729y1ch9lUs38
	xTjir5P9X840EEDkQEwn2jaDIh++xJvkWVaWHHtNzKzI9ZcIkY/nwP65/JyEKSOr
	yFuQxBMaUJmIFDYV+Q19+0hZ3GdEFy6Vbg7g6fUpdtpdd8Sf1ltsvAxsugA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2rx00q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4226902a91.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398863; x=1786003663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7mwDzt4pyicsJbF/PR33YEwBkAHXFs91MmvUgurCW4=;
        b=SfBzWyQORhTuKl3YHZMa8eMsI7yWg180zkSk8A77TjVGIeL5iQbiDKvlJy532ejHTP
         A/fDbZji+DSzXDEcfV7XelnKjTqYPwLNTWvFi1gtj3O6PT0zL3CSa4SZL9tukRvT2TfS
         l45rFK9tMEuFr82qfx2TZN20zj41eEntF+83BqckGilc7hCqL3TwEBP46T6gQFhbvM8W
         QIXrC0WdMp+AFgaYdMMaRQIpWNKg2gGPitRdYHECjr4CaA9UfTcWaX1WXWHvGxIJImrd
         pyh0da4Q08RZlvQ5H5n5VDm4V9Ap6V2C8/tclGAbfXUR22HuZOVfdoF+SBvVFzEO1c6J
         aZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398863; x=1786003663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7mwDzt4pyicsJbF/PR33YEwBkAHXFs91MmvUgurCW4=;
        b=sTzbosqg4u69O81SBxAyU1PBXuip5qANeviViSHR1JjrIxi1apm0lTtSWtLAkoxy4N
         /C1gs/ArvGpN9H81qRbn2OECo4L2uR5AuVY1RXQLBnSb/PDyTxSl9jtT+YMWafQpVAbP
         oOKCBfdKispoDKF41DwnSdCBiWTA4CJOTydznhUh7ML+6LTu4UWZbXVmUW6DH4IK8HUb
         n95IgzVIwWsiwkMxTSiiO8aTr97x3Fs8lHuC0E/WL2NNBOjCd2Xo1qyX1dhPCOZO57BD
         wDn/3QHc3qQoN4lM5ll0xxKMr9IFqhyLN3yxh121NmX52B3dS/7BbxzH8iF9scFkKuiF
         yvNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqH2KAMtzAabH971UC1KveQ/QFm6eLW23v8Zbaqa48jZ5IOEE+cGZ75pv21uZEoCuvZts5LobYj0lbU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyde/C3doo1fxhecR3AE2dS4GMeVJHNjCpLs5IlIfu5V+gQFELr
	Y0XJ1RKonr79vmIX1RQfb25nQQvYjou761tyj1lkCMEe73kU5LRfdsjl3o7d0BEkZnsb5Vsu8Pp
	54F6w54auQa6ezuEKxCi8QMbIo07ncp9753Qy7eWkbmf4k0SLdwYXyj6T/LwSKMki
X-Gm-Gg: AR+sD11enPM4g7fr4ri6r14BaHbXg25OqU9A25RBmwZckADoguToql8y24wQWLfUR75
	CDOM/WrJDSUrS3iinE3eP8ffQjrXJeNWS6BrfPFQ0ecEgkZNXs4M5/5GFFX35bkIKRuq3O10Un9
	vEKcXxSYQBZiB8OemWoiKoPXQf/QMuN9WglhAAsfd/yC2yfRI/GZ44JghAAPbYLiaxKUs+kY6jK
	tjFC8rG6WomrTHTBAqx6R78op7aDwcMlbS9oqub+m+tn1kKZibvq2DhvT6/pJw7qPny3OXJ7dV+
	MwTHUt6TCWFiVXgcIRDv+cGEjsNVSwK5w+QpS2GNEdYXtO0AmAEcbKz/7BZOzHG7pxINUs/nuDV
	qlsKQmvXQcRkSjTheju/AZ4C1P1AfnyuKcUuNEvZweRr5BCjrTZvCLqY=
X-Received: by 2002:a17:90b:3c11:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-38f9bd74415mr1582719a91.2.1785398862829;
        Thu, 30 Jul 2026 01:07:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3c11:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-38f9bd74415mr1582687a91.2.1785398862390;
        Thu, 30 Jul 2026 01:07:42 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:41 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v16 2/7] qcom-tgu: Add TGU driver
Date: Thu, 30 Jul 2026 01:06:59 -0700
Message-Id: <20260730080704.2903540-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX4YPbOa2GbPnR
 hDHZxu5aSml9GqxvMfUklHUv/6zLJhTuMweqzjYHUftQC5VGX8sTavFBhiUvcI29SrWK0NjoNEs
 eu0928lW9zals3ioACS6GQltMlWX7QI=
X-Proofpoint-GUID: rZpZ875DdGjBcOo4UmdxphAkcSqtZoT6
X-Authority-Analysis: v=2.4 cv=aO3Ab79m c=1 sm=1 tr=0 ts=6a6b064f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=ihhBPCL7kiVGXwQKODUA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfXxZP6Mx8pIyRo
 DjrJ/fOefysKJgR9bGAIcNS/zN4DxpjXvxEhkENHrMdhfrpZmWZLeC/L+SdY8e8Xs2JvNfcSA6f
 j5nzl6Zl0Rr3ctED5lPghX4GSoLbsIuznPVZycGSaCWKVNeEnWyEZMo21eGW/gNbP49fqwBCx+e
 APHzHKduIDRsQWh8FuGVsdmFelG6lKypF0HdoVmWUm9M7xT3qnZ2llbU5D8cvxNGp+ahyq+52oD
 zwULjMtpmmy9n5wZktGIwTa19EiaooMiP29Gmg+NYtYraxyRcSgFl3NHb/GNBVNJu1GUHoDq9cR
 JOJw85hqlu5HPfpz4p2UZM9KJosCz/WI3O49BVvlfjR8C7qznldcG0Yg5QwdIyYzoPfBa5YTU5v
 ZkJrtem4xB0SZQ6LeeCZk2mBPB+xm/ThwZf2WJgBhUfKwEVqSU7ohXMo6UMjK9EcUzxk1SH/j6s
 P/7KpjsOVQWE2OJl83A==
X-Proofpoint-ORIG-GUID: rZpZ875DdGjBcOo4UmdxphAkcSqtZoT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 spamscore=0 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300057

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
 drivers/hwtracing/qcom/tgu.c                  | 192 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 8 files changed, 289 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..36ab64f1e301
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/MAINTAINERS b/MAINTAINERS
index ce5c5185c773..4789321cca6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22360,6 +22360,17 @@ S:	Maintained
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
index 000000000000..9c7dd4a09f02
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,192 @@
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
+#include <linux/mutex.h>
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
+static void tgu_enable(struct tgu_drvdata *drvdata)
+{
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enabled = true;
+}
+
+static void tgu_disable(struct tgu_drvdata *drvdata)
+{
+	TGU_UNLOCK(drvdata->base);
+	writel(0, drvdata->base + TGU_CONTROL);
+	TGU_LOCK(drvdata->base);
+
+	drvdata->enabled = false;
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	scoped_guard(mutex, &drvdata->lock)
+		enabled = drvdata->enabled;
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+/* enable_tgu_store - Enable or disable the Trigger Generation Unit (TGU). */
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
+	/*
+	 * Hold the mutex across the whole check-and-act sequence: the check of
+	 * drvdata->enabled, the PM runtime reference counting and the state
+	 * update must be atomic, otherwise concurrent writers could each
+	 * imbalance the PM runtime usage counter.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	if (val) {
+		if (drvdata->enabled)
+			return -EBUSY;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		tgu_enable(drvdata);
+	} else {
+		if (!drvdata->enabled)
+			return -EINVAL;
+
+		tgu_disable(drvdata);
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
+	ret = devm_mutex_init(dev, &drvdata->lock);
+	if (ret)
+		return ret;
+
+	drvdata->enabled = false;
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	/*
+	 * If the device is still enabled through sysfs, disable the hardware
+	 * and drop the PM runtime reference taken in enable_tgu_store() so the
+	 * usage counter stays balanced. Use the synchronous put: the driver core
+	 * disables runtime PM right after ->remove() returns, and the barrier in
+	 * pm_runtime_disable() would cancel a still-queued async idle/suspend,
+	 * leaving the runtime-PM state inconsistent.
+	 */
+	scoped_guard(mutex, &drvdata->lock) {
+		if (drvdata->enabled) {
+			tgu_disable(drvdata);
+			pm_runtime_put_sync(dev);
+		}
+	}
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
index 000000000000..ebba49402a20
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
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @lock: Mutex serialising enable/disable and the associated PM runtime
+ *        reference counting against concurrent sysfs access
+ * @enabled: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointer, the lock serialising
+ * enable/disable, and the enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	struct mutex lock;
+	bool enabled;
+};
+
+#endif
-- 
2.34.1

