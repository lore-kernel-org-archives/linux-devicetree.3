Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8520133BBC6
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348582; cv=none; b=EhtVxxqFnZ2jzrP4R9G3eyrVQ8uyxdlUaEmdm/hdWTQ6Ydzf8EBkkH29jfTZ4FMibfd0xXSGG/AeW4WjF7WBJEn/1qbWMYoYLM6KGf+3lA6xZn5+rcX/xbxfc/jONeOE+nLTXVPnG76LQno8BFbgvfO2R8175cZMH7ldOBBWxuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348582; c=relaxed/simple;
	bh=GBsVTS4l4F18YjaJ/58wFmxWqzuYLY1cBZgZWMYpxjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FefxnBVmoJH5RkXJungVp5AHCk98myZ+JQVzPuYnaaGBIEMg8DM+nmYWqLw1tat6Bl0wW1WjW9BQnMmaWlil+nadTVRnpf6p4dItFBsyrcdvDbMehRKNovoMp0Kh2gMMlg56wdXRJ/FmFE1iN9yn5BStTTQlDF7X2sgZCKpFuyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8+dzt+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hm2SdUMa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8+dzt+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hm2SdUMa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S0ftCR440834
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4907GskeGPyGqTJtsNAB5xkShzE2fjp5lObjsv/s6Gg=; b=I8+dzt+mUZA/OFcw
	Q+UdE+mg5qijzRIiGORe665Zf2gPQQPzusv91eHAoP+QWmxy3uc1vph5Cd+dvGyz
	B3TtHDihsHsU4d4m+gcJZzOmIs7f37k46HMXueusT7E7znnwnJ2C2IDhBsQJVcpL
	SIKsifnzFi6WNysU3E0sHXZZfT4qA9aFOJdhUEC7w6qaQI3EfoBOhd+Sy3m58bUz
	dLVgj5evrLytsG0zLRNFvqirEa8NRb0lQhiZmLLWZjePv5oYPgCybAFuAmw8yfpe
	r45zoHa/KmADNQTqvGCNintlQ+2ezlWavmPeGDYA1jxIRGZZSQQi5jdio0B9ymJb
	zWDV0w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac42g68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:56:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bc535546so11267642a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348579; x=1777953379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4907GskeGPyGqTJtsNAB5xkShzE2fjp5lObjsv/s6Gg=;
        b=hm2SdUMafWMjLa+L10VlpMBJxMqUveAPNr1+jAtuyidHmw/UydhBWrrcnB6ezqtZlj
         s/InLUk7BfRN5GlwP3npnn1ZUJBsEJ3MHyaYHkwkkMsyAItxGvbz4CJ8K56fbs7vxaoq
         0LYODQuqnZbEUgnUvAt3YfaVoFDl21ciZpgma5H5nKntauJs8MWYpYPvuuvMFrkLbytr
         8naqGF9EA8h01AI+eMrBVJ0AADjSl0Xr0HYjdgQtvIJBzwXkTmFvpFeSvum3siilGb8i
         bY2mWc/LK/OeAUQG9uElC6EPwcOTcXK4XNipmTjsCSGI3xI2vylPNO1ZS0dxS3dH+RiQ
         VYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348579; x=1777953379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4907GskeGPyGqTJtsNAB5xkShzE2fjp5lObjsv/s6Gg=;
        b=lXiROBeJpK9ZI5PIlt/MBRvJz0S8e9xt48Ff4bi8EsX+EGE/OHH1OyJ53f9ESzoE5E
         7w+6gUqZfv7N7cayZDSzKUA0iQqK3WM5hxyQEiuPI+SRKpPFi5wt5V+LQOdibKj6ELRG
         O7/2celVQiM6qDhYBaDnhW9va6DJI/+5dvH3+fY8Ndw/hQsdFJL4RL1bukV/Oe7Dp6YP
         zhwJl1o7McXR9dBzU5ZAY7BwNlathGeCbFV4P6fl2eodhHN0KzJOWELbHdrkQ8aucxtF
         YHXSbEX+aReIAEjF9IYp+ykCKZB8CUQ5saE4l/kQv9YzbAaA3fkeCgNIJBIUc5oAEQDU
         bZsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uVoYoRY6/RsotwzPOASoczV8bBafGu+vyzOgb+Z0LrGnlR7mnNle7D/868wUGb3QxPpkeaw0iuowT@vger.kernel.org
X-Gm-Message-State: AOJu0YxtoiF3HiZiTK8G/fhGDv+5eLeLgMDHAO2MbIEjcMxTX6gAMT4Y
	rwAcoKubNRphb8GkemWmHgblWgd6DBbqr/S12UiyFmXQXyNHADUJEYNaSKgpa1eqX6svzoZgdBY
	LJKPrlvKeLw5ImIkSAs/DxCN2wT3fl51X63jnBg337iKhFJ1wQv4WKX849bxzsecE
X-Gm-Gg: AeBDies3fUZkA5RnTc0dih3f/IaDaoul/5LWndPBBb5eeF0seQvbbV5wT7meluLRlHi
	n+292SWpkrqrNWtsmiBiCfwEsmQ1yIrLSCfjMYTVxvjZZ+cq05yuj8gddueRRWI20z3wGE2Ieao
	lRiPb+nljiIJOl7MnsHFJr5ArX+8Rf8+oif3jESZpqi/dCVwU/6StrRZgxDRAAwkCkPXhfFr9E1
	urti0EqeqpsTpnxXhsOsqibeVvAxeqE4wt+tCn9d4IzMdtevZu1qzLVmQ3EPLQhxFb41pKtZOd7
	SpoEmkYWCvCeSj1SAZoV5HGtua17jY4XpDePO8dffX4bxxpU+1OrQW9cDt+WTAX6WQkNQh7uHKY
	WFpp3LN4E1YSFIXfzbOoEte7XSk0leRAizqF04RRnl8JkWkiu7CfTL4v/ZlCjGDLbCQ==
X-Received: by 2002:a17:90b:56ce:b0:35f:bf23:bd78 with SMTP id 98e67ed59e1d1-3649200cf1amr1423519a91.16.1777348579159;
        Mon, 27 Apr 2026 20:56:19 -0700 (PDT)
X-Received: by 2002:a17:90b:56ce:b0:35f:bf23:bd78 with SMTP id 98e67ed59e1d1-3649200cf1amr1423485a91.16.1777348578663;
        Mon, 27 Apr 2026 20:56:18 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:18 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:09 +0530
Subject: [PATCH v3 03/12] media: iris: Add iris vpu bus support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-3-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=4228;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=cziP+P95lYoSiLg+5MW5xEwescL6vgvBBGLLAvVvoEY=;
 b=bi9dRaFIrDbQfuqXmL+MFazz4osr3HdG1aIehLgn/X1+wUWJ9VgQZej3uqWelBzjJUuiqdOPD
 sVBIXrgUGn9AkOPJvfaTFhWSfp7j1c9usI9diJ76QnGnbEwsUpL7PWl
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: k_R2Dc50OmownUJXxpUYEVn5QZia50cy
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f02fe3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rZQGDrx4aKZhb0zF23kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: k_R2Dc50OmownUJXxpUYEVn5QZia50cy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfX7YM2/g13FCfb
 jLH6JO2IPvaQXuWr9zJFDyEuLBxC2BV498Mjiznp+kvZuvnIrbw2bcnVrHqDeOfCX5/hl5tWv3J
 XFf9C1HwvvciuAM83fVktA4Ie1zXS0d4y7Bb5Un8VImAtD3QCDIxr5t0SSN47LZgRoRr3katzz7
 JUr1hzBgTsmcVlV4eKGaC7M6785KoFk7tR/qB4OKrp/0Ioaj9xd+wu0BBGmE3oKOsLcoeHSI2gr
 j9oMaU0a4DkU688/tnNMZSD58cpj0p5BWiWNSO+9LVuuiogsE7Jka21jpilJXj2fUnAE299HLBP
 vwGsOc1AXUkJltK5HRIYJ3L8wgtA9kdrh6068ydOkarl9SRjWPrjGkfgy7gae4D9X2llWpMLCiK
 NH6MRFw4ROuGKY5ohMHTW23BZgKlFR2alTnWeyIosRHcNI2bX9G0Pbks0ASCBL7CGDFsl5aginE
 7kLrJsoymymHvhYjaBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
assosiated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile       |  4 ++
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 69 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 25 +++++++++
 3 files changed, 98 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..6f4052b98491 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+
+ifdef CONFIG_VIDEO_QCOM_IRIS
+obj-y += iris_vpu_bus.o
+endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 000000000000..15ba4d9c563e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/iris_vpu_bus.h>
+#include <linux/of_device.h>
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *iommu_fid = dev_get_drvdata(dev);
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
+static void release_iris_vpu_bus_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = release_iris_vpu_bus_device;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	dev_set_name(dev, "%s", name);
+	dev_set_drvdata(dev, (void *)iommu_fid);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(create_iris_vpu_bus_device);
+
+static int __init iris_vpu_bus_init(void)
+{
+	int ret;
+
+	ret = bus_register(&iris_vpu_bus_type);
+	if (ret) {
+		pr_err("iris-vpu-bus registration failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..750e878e489f
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
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+extern const struct bus_type iris_vpu_bus_type;
+
+struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid);
+#else
+static inline struct device *create_iris_vpu_bus_device(struct device *parent_device,
+							const char *name, u64 dma_mask,
+							const u32 *iommu_fid)
+{
+	return NULL;
+}
+#endif
+
+#endif /* _LINUX_IRIS_VPU_BUS_H */

-- 
2.34.1

