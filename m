Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863E2395AFA
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496426; cv=none; b=SM70gsnnt6W4Vu0T0zbbmriJg3dLnBBle+wxOeHcrdmWKcOu8Qr3oht08WIgDHNjyVN+h6aCh4dYCMTwFfG524PhvmNPXWnI0IlbiezqXr8fesz7aYA7dbPrT4aszCE5a75BKJMBYjD01v1LchEGV38ZSDa32PDyqyKKwLTPg18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496426; c=relaxed/simple;
	bh=0F6NYH2vBOPGXFbInvg3unabFPXg6JrkTEoOs8NbdW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGqLYmBKylDcKkzAnsS0IgnKy9r7rehw7/duOYp+IbdqPPtVCJNPyL58yi2p7agDAe8SMLqduvLwFWLO3iw/hiUwwpW0rNWCOLMr3Y3mzdwXI4uY08Z72vXG6kIqqT8NJ4msfui34J8AAvOG0LkDXiOEZd0cd1kcQ/wZ+eLc5QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkK6l5Zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaSKz28H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkK6l5Zd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaSKz28H"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CDX3l3077826
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 14:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMD0vi07CEccdmp8qLavRITVcgt4Oz8v3SLZupcLXoA=; b=lkK6l5ZdrcjKz7W3
	z5DJ1oBqp14j55ForPBtXses8rXUFPXz03cv3BbIXiTSRzJcsy8PFZli+3nqghaY
	nbyLdjxAnOR8GBnR8ESvosZQZb/gwdOva5hBoV6mZSwv0XlM7BV2XrmAY4blWY1F
	mJE+a5dN+oWZVHofW+mwxFKMTDM7cJNmyKso1nH9wL70quhD6SpNydbl15PR5kfN
	6mamsxIMCRGqSf7vXCgk0ObSh7afbp6X6VKEqI5Iuox4dHjkrNC0akc8IJFVMG9X
	WenqWl2JjtTW4UTAYym/N2Gn9NecZ7YfSCI5qeAsAMvINJUxAMzLGclQ7mYVRCOm
	5nKaHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbtvds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 14:20:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so76029515ad.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496424; x=1781101224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMD0vi07CEccdmp8qLavRITVcgt4Oz8v3SLZupcLXoA=;
        b=IaSKz28H4+Y+YjApxp5UMWZ735Qu1Eo4KDHeFX/6FK0UCVRVWeMXEsHl9DiYIUCQg4
         4n3e0LDppONIxQ6F9KNLRKGBqNmy9pTUSTkXZtphq8H25zJDMmt2gU9XV/8JxN2U0s66
         OpTATj43QfXB2glzSef5B9KJXRaTvR+Md9MrOdwGx1ddOiuWyWPKke3um/ReFtaSmoRK
         ZKpaH7TH0G7SIsA/bwmV07Jbvv0zVXFEpp1B/L+CTBafN49whz6hQ0bwxZ7L46FNImx/
         SINgNFRUGbZl0Yxm+4ikBP/vzDjvTB/4x0MydnEIU4HI+gW6puXe6r0tGbofiax4yJXq
         Sbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496424; x=1781101224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMD0vi07CEccdmp8qLavRITVcgt4Oz8v3SLZupcLXoA=;
        b=eEOXGgGqZK3W8owu0p9MPEAT8tuQ30Bx5z1h2Nqou0LiqZxiDexmZWRDPD4jr2CRSj
         eP+5JnUifngprzRwInK+2u9JJaWha4SRy/b9MVDtYfqDuE1hTLN8McoRZDDv9ehK7deq
         KihqZ9cW7DTM11TVY/fJcpW1Iembtpn4Usu2H6hhGs0/K5A6bUO8NfcWmPWdGAHr0/Hw
         eo3w7ru9tvNmoiNUBvAum1dgeWjJzM6zEABwjrhhA7Vo1UBMjsZJoM2yp594KeILBB6d
         7XEkPdswLAlm6huXudmRPZ3YOvPlSXM6JZvtJYny6a+WJVyVwBXJ7B8jFWnjmqt1P1sL
         R5Nw==
X-Forwarded-Encrypted: i=1; AFNElJ9Jkl55VtAfodJ61smZbRY+H4w+jUq9cmPu/xsJ0mwCI6csWIOnFyLefT38+hFC58UJYOQwzjxG4jjp@vger.kernel.org
X-Gm-Message-State: AOJu0YzKukrbljaSg5iQEZqVFjqSGQvi9PwQJ90MQT/BAlFz7hHH6W9h
	C+TBWMHANse5By8E5NmBbThPmmuXVs+oawts78oGFKapIrJnQboISx2yLVJNy8o18fyDYPCcM2Q
	/hCJrm++gFRD7gnky7lxHrKBQLlOnfHopVbuyFKBBQaQBUSadhNhPDRaLuUlaSy8Q
X-Gm-Gg: Acq92OF/3XmYeXctiTZDat1XgwZ9Pm++5M2XjqcKBIPTIO0AQWnoJ2uNg53cxn1ljuV
	5g1KmRXWeXyWohokPHu5RmqV4v4gjTJqjFGuOchUc2O5ZN7argipG/Nq0eluir6ZOk41k62sxRH
	pA0ItrG/OnXT2SfxXgVtlYGn6HPMOx20kMUC8j7CPVa6YUXfcH2Y4YOFC4erKBW73tvt+GfJ2HV
	PqXxRjH2iOhM/ChlVh1jZCLC2s8bLsORo9MZFzo4FfNMK6bGG8AIy/lF52KgAfwpynuSrmXkzDo
	Au5iknOc6IUEvlI6QH9HEO7kX/XFc/0LVWWMQqJJVp6vsP3/WtbiMrH3zA2045owdLnCcI6Pqr5
	cxWasyLKnZUFD54E+jwrJky4PNeogoPEIBxNT5tZQZ4GsOvGNla7wA6KctieoKhNo1g==
X-Received: by 2002:a17:902:f787:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c1640ab375mr42523285ad.28.1780496424081;
        Wed, 03 Jun 2026 07:20:24 -0700 (PDT)
X-Received: by 2002:a17:902:f787:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c1640ab375mr42522565ad.28.1780496423356;
        Wed, 03 Jun 2026 07:20:23 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:20:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:39 +0530
Subject: [PATCH v7 01/12] media: iris: Add iris vpu bus support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-1-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=5398;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=lgs97ZMLfMsrUuRVQ2JpjplW6O7nx8Egm5QQ2cPQxEY=;
 b=UhBVV+0OiyAWuPE/lzW4Rta3udej9PFLi+yMOhT5AFGAvH2GsPTojUKXK7U0r61ZUAhraimM3
 /dFowAfO0cCBNr4M3NWexEKON1jnYZvh+BAE48lyN2wP086fG9jLVZs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfX5v8VHoWGFhH2
 eVRXVQUVZrd94CC9VC7tA5Ap/kQ4pnFcqPI7wT1rC7uBrOEAUWZkR0Cnfj0gKdb03M+NcA2womS
 /3jnTnhTeb9RzEqiCI7UisN/k3egQiTB1Sc1nwgRhPf6Y3eZFIYlkrlRlPLdndMF8W+sRamE6sf
 CD+0ZJ4hdujoSYD+mdDsK/1iqPylss+aK001KNmdX6U7y9dffkIqGsUBeVyHzsBaHL45uhxIpj6
 7BCPC+PDApxIVhmPKPjTFjnLTTh1nA3I7PZhktDzi4j2BG1eScmfaE0bG5S7jMwvCgIYuh46Slu
 0JHvOZ7ZEz5FYDa2W9lPIykW4T4PjXl3FIXmHBVq1E1HYEG9mMgJ3cvDbysRdVra2OVHjtMbEVw
 GZvaX8gVsQNyBf+FLPGbqsMqADInRXl0osd+pWWfC0dQo/yO1Bk076VLW7LTro4y70z3XbDDpQE
 dFUsT/t9XROx+PSALig==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a203828 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=6cGehGV22KE80QuxIsQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: zdwZcBfeVQt630QTGk_eaBXkxKEkpQ6p
X-Proofpoint-GUID: zdwZcBfeVQt630QTGk_eaBXkxKEkpQ6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030137

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
associated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduce a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 MAINTAINERS                                     |  1 +
 drivers/media/platform/qcom/iris/Kconfig        |  4 ++
 drivers/media/platform/qcom/iris/Makefile       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 61 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 25 ++++++++++
 5 files changed, 92 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9f2780b2d31..508a1150ffad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22230,6 +22230,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
 F:	drivers/media/platform/qcom/iris/
+F:	include/linux/iris_vpu_bus.h
 
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index af78a1775937..76c9fcd253df 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -1,3 +1,6 @@
+config QCOM_IRIS_VPU_BUS
+        bool
+
 config VIDEO_QCOM_IRIS
         tristate "Qualcomm iris V4L2 decoder driver"
         depends on VIDEO_DEV
@@ -5,6 +8,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER
         select QCOM_SCM
+        select QCOM_IRIS_VPU_BUS
         select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..6deadd531c8e 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -30,3 +30,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 000000000000..e3327b227332
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/iris_vpu_bus.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *iommu_fid = (const u32 *)dev_get_platdata(dev);
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-vpu-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static void iris_vpu_bus_release_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = iris_vpu_bus_release_device;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+	dev->platform_data = (void *)iommu_fid;
+	dev_set_name(dev, "%s", name);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(iris_vpu_bus_create_device);
+
+static int __init iris_vpu_bus_init(void)
+{
+	return bus_register(&iris_vpu_bus_type);
+}
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..62af9ee7e288
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_IRIS_VPU_BUS_H
+#define _LINUX_IRIS_VPU_BUS_H
+
+#include <linux/device.h>
+
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+extern const struct bus_type iris_vpu_bus_type;
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid);
+#else
+static inline struct device *iris_vpu_bus_create_device(struct device *parent_device,
+							const char *name, u64 dma_mask,
+							const u32 *iommu_fid)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+#endif /* _LINUX_IRIS_VPU_BUS_H */

-- 
2.34.1

