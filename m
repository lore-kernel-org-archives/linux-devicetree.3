Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0B33D7D7E
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887309; cv=none; b=fydjQOYPYi//eLQcrRzGn6dCzVKdDxuuMpLxJbMP27kVeO1KEOkAf2j3RVB9yQfJqapC4gpS0LIiz8Ff7L8OsMh0XMNVcsyaUx1+mZ3bcnT0k5Z4NBfLkIlEkSsWWqNGnCsyEHfb5Ad5UhDIuCUpbJMYF1vUtdWjS7b11aU2km8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887309; c=relaxed/simple;
	bh=dzBh3psqxlaNZP/Yp+K3Z/bljoYGB/KLHr0kHGocdg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3R9YJCIWqQLucXLiQT+O+JettmK2zW4UfbogaJHlJxbdSUb4cgcJkl4Ivpl417THjuOI6f8jAXvP7lYmJxLF2FU1zUvp+7ef0k0ugUAAGaqlpfaYPpMJAqBx5oXpeLo9CFtg4FNVretZrqQxZwFVGK0U14q6n1E4jZLjWl73zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QD7kPqeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab1b0ZTc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QD7kPqeU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab1b0ZTc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9T49R3786092
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VefFDIGcoDVJgxQ5Xx4qu3Zc0+ZJdFlAa6Vvq4pqvP4=; b=QD7kPqeUx7hf2OQC
	wR31pVIDlC2Fp3C22PEGU06VJoxw8qV08A6LHO11uP/oXGmDQAadQHJXIHBoLLsz
	0DccSCqW5RiIMEz6VlE2osbPKDDob7L2B8kker+xR5PQ4NKERvFK7CzkKzWmHmLC
	EaXIAgT6BC34L3uDpFYHdBd5XXs5PsK8SHrPLkd2M7YYS6FRuM0aab9fYSAnqmnz
	rO9fBqWA1pGZfyDQj635/3tA1giDMNxkTJKf2z0aqV0T5M5Qbl0a492v+bynQvBA
	oh0W02896mspMF3jGExefC6o2taKAG5m8Fk0kXHkAnbSDqx+oJO2Ur3QCgIaWaYx
	JWg7Dg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5f683xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so273509a91.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887305; x=1785492105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VefFDIGcoDVJgxQ5Xx4qu3Zc0+ZJdFlAa6Vvq4pqvP4=;
        b=Ab1b0ZTcHCaNG7rDT+8SoCCCnl5ivfZ4ooJ1QaJde60QguvCAIe3YCbyJgWtvUq5B3
         t7VB/nBoSHz6vhgYTXjB/Up+QfpvANs4HLrSnj7Hm+iI4+7ZbdNVg1IW5GnucIJJIAm2
         W6TJRyyuPmM1ucE+PGrH6oHvbhr7dseFcdyqKmSvkvxkPOkQOtscQfPKF5BMRiGSS4ee
         QJMWWrIhVrZg2Xxd7GL8cv9jsYFUSQGJYfsASD6KqSCJt2Idt22fT0PzCJ6YIkOVcmo1
         OYSf/x3lpr1OPla0Sxsg+l5XU7Yms79JF0C07tfTS8sD+3I1CaDfAU+8g1mxf40arops
         Xbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887305; x=1785492105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VefFDIGcoDVJgxQ5Xx4qu3Zc0+ZJdFlAa6Vvq4pqvP4=;
        b=CnoXzQEEtT/6Z8iOmBGnQu754UjfvvDYVJOM7xf/l2G2LGiTTgN5coKGdbu0pWwBny
         ats0+3gdkRuLjfK/g18Bqqvr7hEoGn/mYBc1F/7LN+0Gtj3PncYKaIx8vhjRhhX5ZedM
         VV1Vt2LnmNzBb9NU63UVk9hgJTSp9Po56A7uBYdF/K7B3TUpN/bzVOwe/ewDVSa5eWRR
         SJeLAsyF19jaY0NFZMW8Z+i4tHQufIMKBIGQDOV5mAqbRjO04k+maOq4zXDR1ifhWn+i
         59nEh5YAVJqUDX4i1noT3+3zKAzgZs591D8XW91znnkdCARUn1/wQ2eht1L08WFh+Omi
         vAVg==
X-Forwarded-Encrypted: i=1; AHgh+Rppz6j6QvcfZVcweIMVMS58YgvrXVHLFxSYWBEmTVhD7ZIVc3Fa9sIXbg/CtwZijFTgGtu+j4x9izCC@vger.kernel.org
X-Gm-Message-State: AOJu0YypUGrsq03+EYtbYyTdn/fIhlXuOk4XogGh6IHBnqBIY4Dt26xi
	HRSkcPXMeC3yBk0+exuB55dllp96pMqWVdZUlF8DC9bjJoKfbskNUp3/RJWTEKJzDIdAON7PxQa
	Z3fG0ilEmhcjbjc9xlZ9IH/FzRLXseQgqGuwc6/nrdxNk6VRUYMmG2qamPLEXLeVy
X-Gm-Gg: AR+sD124Ove2KIYnFVeo1ZWC/Kx562VQzMe+TmOhUUPEmVVWzPZ2sr3ElzIqIYbX1pE
	ybRL2jFME8nNL0zgQlOhqem6GvZJ4YGxCpM3WyR9F82G+s7u7LQxxc7exN9fmdeEafPt3ZF8YIN
	zzEinxoxA/0do3anIGPVcNIoMpQq76ilmYM/cv2cTbOfedbpy/BJWLKQHLmJHzeympInIUyy1Mr
	MCEYcXRHciIo7kIMdvj87P32EyBain6ffJIpELaRwzPwpUKSqkITd1t5T233AXTLKG39N+igMDY
	xieYKNjHrhywsF7Y1O8gRxcuYjPjG5/u2TgOhcYh0d+iML0xLgyRnU4N6y9gM7jzlS4wefGjTCf
	qaqmTBxHvAHHdwRvqsma9A26s+4zLhwSTnEE1jjrenOO4280=
X-Received: by 2002:a17:90b:524b:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-38ec6461d6dmr6549480a91.16.1784887304871;
        Fri, 24 Jul 2026 03:01:44 -0700 (PDT)
X-Received: by 2002:a17:90b:524b:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-38ec6461d6dmr6549405a91.16.1784887304164;
        Fri, 24 Jul 2026 03:01:44 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm29515427eec.29.2026.07.24.03.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:01:43 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 03:01:20 -0700
Subject: [PATCH v7 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-glymur_linkmode_0724-v7-2-65c8469c6b65@oss.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784887301; l=23152;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=dzBh3psqxlaNZP/Yp+K3Z/bljoYGB/KLHr0kHGocdg4=;
 b=qffUsD2WAEZTw6mgVl10kq98wVbQZh3hxeZKZjBEHtlbkDYJdbMR1MOAUs3soMebiawO98Pwv
 GfLryR9Y8+HBPS+51oa7EKx5CAtl7CS8KjN4XD+aXPgf4muA0BQvDs4
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX01UGn+ptJP5E
 jFqVJX30lax0RUMkTzO2T2Ow7JdPS9PwZEjshT73Lq38sQcxvvgRsK2zUwtFTqcz0XBm1ATN9eR
 54z8RwUHGZQHbGDxfwyRACkgZoX3mUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfXxmiQhes6OIUV
 4Udpmk2KhGZFM90gpMkk8XRKSRlAA+j2sqZhd/MkxiL1E9ZTBcuLf2d0qUU8QGM+dwLFlJVnN65
 GcL1b5F3SbAIsKyoDxxlxRlUquHaTDc8/mQfI9D47jR1ZFUvIro9tIQ3oqAT+HexlWr7PSPRIhm
 hiycsibD5CRCEvnDI2GXwxEOzFWM+haU7mZtVfBuy3CWEybt9ZsZZbnMkBP0Uboa+86n31o+M66
 lhxP/xQsjBuEmfUmZe3oY3s60J6m2bL/izGvjoc6IoBxoa6MRIbkjhcwusuzHm7IvAnT/HuGFjJ
 0t0y/hG1Ziyq7XQh2OVi2EmmTym4tNk3emjlVkON/I9a6W4OoZj7Yg3mtpL8EEW0hSenHON5qxS
 lTh3+wg5E3YX5noRGYrpMcWIIZ8vfTZF5MR65iyuP+SVAZ+d7SbpU5G0vh5dgfCywZEWUViJtNO
 Y3YEgYRL0PeRXc+6HUw==
X-Proofpoint-GUID: F0Li7eS70RRsvgAYFjjqdRQXHXLdoqNO
X-Authority-Analysis: v=2.4 cv=BNeDalQG c=1 sm=1 tr=0 ts=6a633809 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mlzxmGbil-RpS_vCRPwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: F0Li7eS70RRsvgAYFjjqdRQXHXLdoqNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240091

Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
x8 or x4+x4) selected via a TCSR register. The existing single-instance
QMP PCIe PHY driver has no way to model this: it assumes a single cfg per
DT node and instantiates exactly one PHY.

Add a dedicated driver for this class of PHY. Match data carries a
per-mode cfg table; qmp_pcie_multiphy_probe() reads the current link
mode from the TCSR register pointed to by "qcom,link-mode", looks up the
corresponding cfg array, and instantiates one qmp_pcie per sub-PHY
required by that link mode, registering the clock and #phy-cells = <1> phy
providers so consumers can address individual sub-PHYs by index.

The driver inherits the phy setting and link-mode programmed by firmware,
so only the no_csr reset is used and no phy setting tables are provided.

Add the first match data and compatible, qcom,glymur-qmp-gen5x8-pcie-phy,
for the Glymur Gen5 PCIe PHY that can bifurcate into two x4 links or
operate as a single x8 link.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                      |  11 +
 drivers/phy/qualcomm/Makefile                     |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 754 ++++++++++++++++++++++
 3 files changed, 766 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa..8d45820bc84a 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -77,6 +77,17 @@ config PHY_QCOM_QMP_PCIE
 	  Enable this to support the QMP PCIe PHY transceiver that is used
 	  with PCIe controllers on Qualcomm chips.
 
+config PHY_QCOM_QMP_PCIE_MULTIPHY
+	tristate "Qualcomm QMP PCIe Multi PHY Driver"
+	depends on PCI || COMPILE_TEST
+	select GENERIC_PHY
+	default PHY_QCOM_QMP
+	help
+	  Enable this to support the QMP PCIe PHY transceiver that is used
+	  with PCIe controllers on Qualcomm chips. This PHY is a single
+	  multi-lane QMP block that can be configured either as one wide
+	  link or as multiple narrower independent links (bifurcation).
+
 config PHY_QCOM_QMP_PCIE_8996
 	tristate "Qualcomm QMP PCIe 8996 PHY Driver"
 	depends on PCI || COMPILE_TEST
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index b71a6a0bed3f..8bf887d58ee4 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 
 obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
 obj-$(CONFIG_PHY_QCOM_QMP_PCIE)		+= phy-qcom-qmp-pcie.o
+obj-$(CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY)	+= phy-qcom-qmp-pcie-multiphy.o
 obj-$(CONFIG_PHY_QCOM_QMP_PCIE_8996)	+= phy-qcom-qmp-pcie-msm8996.o
 obj-$(CONFIG_PHY_QCOM_QMP_UFS)		+= phy-qcom-qmp-ufs.o
 obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
new file mode 100644
index 000000000000..210c951e997d
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -0,0 +1,754 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "phy-qcom-qmp.h"
+
+#define PHY_INIT_COMPLETE_TIMEOUT_US		10000
+
+enum qmp_pcie_glymur_link_mode {
+	QMP_PCIE_GLYMUR_MODE_X8,
+	QMP_PCIE_GLYMUR_MODE_X4X4,
+};
+
+enum qphy_reg_layout {
+	QPHY_PCS_STATUS,
+	QPHY_LAYOUT_SIZE
+};
+
+static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_PCS_STATUS]		= QPHY_V8_50_PCS_STATUS1,
+};
+
+struct qmp_pcie_offsets {
+	u16 pcs;
+};
+
+struct qmp_phy_cfg {
+	const struct qmp_pcie_offsets *offsets;
+	const char * const *reg_names;
+	int num_regs;
+	const char * const *pd_names;
+	int num_pds;
+	const char * const *nocsr_reset_list;
+	int num_nocsr_resets;
+	const char * const *vreg_list;
+	int num_vregs;
+	const unsigned int *regs;
+	unsigned int phy_status;
+	const char * const *clk_list;
+	int num_clks;
+	const char * const *pipe_clk_list;
+	int num_pipe_clks;
+};
+
+struct qmp_pcie {
+	struct device *dev;
+	const struct qmp_phy_cfg *cfg;
+	void __iomem **base;
+	struct clk_bulk_data *clks;
+	struct clk_bulk_data *pipe_clks;
+	struct reset_control_bulk_data *nocsr_resets;
+	struct regulator_bulk_data *vregs;
+	struct device **pd_devs;
+	struct clk_fixed_rate pipe_clk_fixed;
+};
+
+struct qmp_pcie_multiphy {
+	struct phy **phys;
+	const struct qmp_pcie_link_mode_cfg *mode_cfg;
+	int num_pipe_outputs;
+	struct clk_fixed_rate *pipe_out_clks;
+};
+
+struct qmp_pcie_link_mode_cfg {
+	const struct qmp_phy_cfg * const *cfgs;
+	u32 num_phys;
+};
+
+struct qmp_pcie_match_data {
+	const struct qmp_pcie_link_mode_cfg *mode_cfgs;
+	u32 num_modes;
+};
+
+static const char * const glymur_pciephy_clk_l[] = {
+	"aux", "cfg_ahb", "ref", "rchng", "phy_b_aux",
+};
+
+static const char * const glymur_pciephy_a_clk_l[] = {
+	"aux", "cfg_ahb", "ref", "rchng",
+};
+
+static const char * const glymur_pciephy_b_clk_l[] = {
+	"phy_b_aux", "cfg_ahb_b", "ref", "rchng_b",
+};
+
+static const char * const glymur_pciephy_pipeclk_l[] = {
+	"pipe",
+};
+
+static const char * const glymur_pipephy_b_pipeclk_l[] = {
+	"pipe_b", "pipediv2_b",
+};
+
+static const char * const glymur_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
+};
+
+static const char * const glymur_pciephy_a_reg_l[] = {
+	"port_a",
+};
+
+static const char * const glymur_pciephy_b_reg_l[] = {
+	"port_b",
+};
+
+static const char * const glymur_pciephy_reg_l[] = {
+	"port_a", "port_b",
+};
+
+static const char * const glymur_pciephy_a_pd_l[] = {
+	"port_a",
+};
+
+static const char * const glymur_pciephy_b_pd_l[] = {
+	"port_b",
+};
+
+static const char * const glymur_pciephy_pd_l[] = {
+	"port_a", "port_b",
+};
+
+static const char * const glymur_pciephy_a_nocsr_reset_l[] = {
+	"port_a_nocsr",
+};
+
+static const char * const glymur_pciephy_nocsr_reset_l[] = {
+	"port_a_nocsr", "port_b_nocsr",
+};
+
+static const char * const glymur_pciephy_b_nocsr_reset_l[] = {
+	"port_b_nocsr",
+};
+
+static const struct qmp_pcie_offsets glymur_pcie_offsets_v8_50 = {
+	.pcs		= 0x9000,
+};
+
+static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_a_cfg = {
+	.offsets		= &glymur_pcie_offsets_v8_50,
+	.reg_names		= glymur_pciephy_a_reg_l,
+	.num_regs		= ARRAY_SIZE(glymur_pciephy_a_reg_l),
+	.pd_names		= glymur_pciephy_a_pd_l,
+	.num_pds		= ARRAY_SIZE(glymur_pciephy_a_pd_l),
+	.nocsr_reset_list	= glymur_pciephy_a_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_a_nocsr_reset_l),
+	.vreg_list		= glymur_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_vreg_l),
+	.regs			= pciephy_v8_50_regs_layout,
+	.phy_status		= PHYSTATUS_4_20,
+	.pipe_clk_list		= glymur_pciephy_pipeclk_l,
+	.num_pipe_clks		= ARRAY_SIZE(glymur_pciephy_pipeclk_l),
+	.clk_list		= glymur_pciephy_a_clk_l,
+	.num_clks		= ARRAY_SIZE(glymur_pciephy_a_clk_l),
+};
+
+static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_b_cfg = {
+	.offsets		= &glymur_pcie_offsets_v8_50,
+	.reg_names		= glymur_pciephy_b_reg_l,
+	.num_regs		= ARRAY_SIZE(glymur_pciephy_b_reg_l),
+	.pd_names		= glymur_pciephy_b_pd_l,
+	.num_pds		= ARRAY_SIZE(glymur_pciephy_b_pd_l),
+	.nocsr_reset_list	= glymur_pciephy_b_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_b_nocsr_reset_l),
+	.vreg_list		= glymur_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_vreg_l),
+	.regs			= pciephy_v8_50_regs_layout,
+	.phy_status		= PHYSTATUS_4_20,
+	.pipe_clk_list		= glymur_pipephy_b_pipeclk_l,
+	.num_pipe_clks		= ARRAY_SIZE(glymur_pipephy_b_pipeclk_l),
+	.clk_list		= glymur_pciephy_b_clk_l,
+	.num_clks		= ARRAY_SIZE(glymur_pciephy_b_clk_l),
+};
+
+static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
+	.offsets		= &glymur_pcie_offsets_v8_50,
+	.reg_names		= glymur_pciephy_reg_l,
+	.num_regs		= ARRAY_SIZE(glymur_pciephy_reg_l),
+	.pd_names		= glymur_pciephy_pd_l,
+	.num_pds		= ARRAY_SIZE(glymur_pciephy_pd_l),
+	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
+	.vreg_list		= glymur_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_vreg_l),
+	.regs			= pciephy_v8_50_regs_layout,
+	.phy_status		= PHYSTATUS_4_20,
+	.pipe_clk_list		= glymur_pciephy_pipeclk_l,
+	.num_pipe_clks		= ARRAY_SIZE(glymur_pciephy_pipeclk_l),
+	.clk_list		= glymur_pciephy_clk_l,
+	.num_clks		= ARRAY_SIZE(glymur_pciephy_clk_l),
+};
+
+static const struct qmp_phy_cfg * const glymur_qmp_gen5x8_mode_x8_cfgs[] = {
+	&glymur_qmp_gen5x8_pciephy_cfg,
+};
+
+static const struct qmp_phy_cfg * const glymur_qmp_gen5x8_mode_x4x4_cfgs[] = {
+	&glymur_qmp_gen5x4_pciephy_a_cfg,
+	&glymur_qmp_gen5x4_pciephy_b_cfg,
+};
+
+static const struct qmp_pcie_link_mode_cfg glymur_qmp_gen5x8_mode_cfgs[] = {
+	[QMP_PCIE_GLYMUR_MODE_X8] = {
+		.cfgs		= glymur_qmp_gen5x8_mode_x8_cfgs,
+		.num_phys	= ARRAY_SIZE(glymur_qmp_gen5x8_mode_x8_cfgs),
+	},
+	[QMP_PCIE_GLYMUR_MODE_X4X4] = {
+		.cfgs		= glymur_qmp_gen5x8_mode_x4x4_cfgs,
+		.num_phys	= ARRAY_SIZE(glymur_qmp_gen5x8_mode_x4x4_cfgs),
+	},
+};
+
+static const struct qmp_pcie_match_data glymur_qmp_gen5x8_match_data = {
+	.mode_cfgs	= glymur_qmp_gen5x8_mode_cfgs,
+	.num_modes	= ARRAY_SIZE(glymur_qmp_gen5x8_mode_cfgs),
+};
+
+static int qmp_pcie_pd_power_on(struct qmp_pcie *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int i, ret;
+
+	for (i = 0; i < cfg->num_pds; i++) {
+		ret = pm_runtime_resume_and_get(qmp->pd_devs[i]);
+		if (ret < 0) {
+			dev_err(qmp->dev, "failed to power on %s domain: %d\n",
+				cfg->pd_names[i], ret);
+			goto err_power_off;
+		}
+	}
+
+	return 0;
+
+err_power_off:
+	while (--i >= 0)
+		pm_runtime_put(qmp->pd_devs[i]);
+
+	return ret;
+}
+
+static void qmp_pcie_pd_power_off(struct qmp_pcie *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int i;
+
+	for (i = cfg->num_pds - 1; i >= 0; i--)
+		pm_runtime_put(qmp->pd_devs[i]);
+}
+
+static int qmp_pcie_init(struct phy *phy)
+{
+	struct qmp_pcie *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
+
+	ret = qmp_pcie_pd_power_on(qmp);
+	if (ret)
+		return ret;
+
+	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
+	if (ret) {
+		dev_err(qmp->dev, "failed to enable regulators: %d\n", ret);
+		goto err_pd_power_off;
+	}
+
+	ret = reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
+	if (ret) {
+		dev_err(qmp->dev, "no-csr reset assert failed: %d\n", ret);
+		goto err_disable_regulators;
+	}
+
+	usleep_range(200, 300);
+
+	ret = clk_bulk_prepare_enable(qmp->cfg->num_clks, qmp->clks);
+	if (ret)
+		goto err_disable_regulators;
+
+	return 0;
+
+err_disable_regulators:
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+err_pd_power_off:
+	qmp_pcie_pd_power_off(qmp);
+
+	return ret;
+}
+
+static int qmp_pcie_exit(struct phy *phy)
+{
+	struct qmp_pcie *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
+
+	clk_bulk_disable_unprepare(qmp->cfg->num_clks, qmp->clks);
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+	qmp_pcie_pd_power_off(qmp);
+
+	return 0;
+}
+
+static int qmp_pcie_power_on(struct phy *phy)
+{
+	struct qmp_pcie *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_pcie_offsets *offs = cfg->offsets;
+	void __iomem *status;
+	unsigned int val;
+	int i, ret;
+
+	ret = clk_bulk_prepare_enable(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_bulk_deassert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
+	if (ret) {
+		dev_err(qmp->dev, "no-csr reset deassert failed: %d\n", ret);
+		goto err_disable_pipe_clk;
+	}
+
+	for (i = 0; i < cfg->num_regs; i++) {
+		status = qmp->base[i] + offs->pcs + cfg->regs[QPHY_PCS_STATUS];
+		ret = readl_poll_timeout(status, val, !(val & cfg->phy_status), 200,
+					 PHY_INIT_COMPLETE_TIMEOUT_US);
+		if (ret) {
+			dev_err(qmp->dev, "PHY power on timed-out (%s): %d\n",
+				cfg->reg_names[i], ret);
+			goto err_disable_pipe_clk;
+		}
+	}
+
+	return 0;
+
+err_disable_pipe_clk:
+	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
+
+	return ret;
+}
+
+
+static int qmp_pcie_power_off(struct phy *phy)
+{
+	struct qmp_pcie *qmp = phy_get_drvdata(phy);
+
+	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
+
+	return 0;
+}
+
+static int qmp_pcie_enable(struct phy *phy)
+{
+	int ret;
+
+	ret = qmp_pcie_init(phy);
+	if (ret)
+		return ret;
+
+	ret = qmp_pcie_power_on(phy);
+	if (ret)
+		qmp_pcie_exit(phy);
+
+	return ret;
+}
+
+static int qmp_pcie_disable(struct phy *phy)
+{
+	int ret;
+
+	ret = qmp_pcie_power_off(phy);
+	if (ret)
+		return ret;
+
+	return qmp_pcie_exit(phy);
+}
+
+static const struct phy_ops qmp_pcie_phy_ops = {
+	.power_on	= qmp_pcie_enable,
+	.power_off	= qmp_pcie_disable,
+	.owner		= THIS_MODULE,
+};
+
+static void qmp_pcie_pd_detach(void *data)
+{
+	struct qmp_pcie *qmp = data;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int i;
+
+	for (i = 0; i < cfg->num_pds; i++) {
+		if (!IS_ERR_OR_NULL(qmp->pd_devs[i]))
+			dev_pm_domain_detach(qmp->pd_devs[i], true);
+	}
+}
+
+static int qmp_pcie_pd_init(struct qmp_pcie *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct device *dev = qmp->dev;
+	int i, ret;
+
+	if (!cfg->num_pds)
+		return 0;
+
+	qmp->pd_devs = devm_kcalloc(dev, cfg->num_pds, sizeof(*qmp->pd_devs),
+				    GFP_KERNEL);
+	if (!qmp->pd_devs)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg->num_pds; i++) {
+		qmp->pd_devs[i] = dev_pm_domain_attach_by_name(dev,
+							       cfg->pd_names[i]);
+		if (IS_ERR_OR_NULL(qmp->pd_devs[i])) {
+			ret = PTR_ERR(qmp->pd_devs[i]) ? : -ENODATA;
+			goto err_detach;
+		}
+	}
+
+	return devm_add_action_or_reset(dev, qmp_pcie_pd_detach, qmp);
+
+err_detach:
+	while (--i >= 0)
+		dev_pm_domain_detach(qmp->pd_devs[i], false);
+
+	return ret;
+}
+
+static int qmp_pcie_vreg_init(struct qmp_pcie *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct device *dev = qmp->dev;
+	int i;
+
+	qmp->vregs = devm_kcalloc(dev, cfg->num_vregs, sizeof(*qmp->vregs),
+				  GFP_KERNEL);
+	if (!qmp->vregs)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg->num_vregs; i++)
+		qmp->vregs[i].supply = cfg->vreg_list[i];
+
+	return devm_regulator_bulk_get(dev, cfg->num_vregs, qmp->vregs);
+}
+
+static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct device *dev = qmp->dev;
+	int i, ret;
+
+	qmp->nocsr_resets = devm_kcalloc(dev, cfg->num_nocsr_resets,
+					 sizeof(*qmp->nocsr_resets),
+					 GFP_KERNEL);
+	if (!qmp->nocsr_resets)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg->num_nocsr_resets; i++)
+		qmp->nocsr_resets[i].id = cfg->nocsr_reset_list[i];
+
+	ret = devm_reset_control_bulk_get_exclusive(dev,
+						    cfg->num_nocsr_resets,
+						    qmp->nocsr_resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get no-csr resets\n");
+
+	return 0;
+}
+
+static int qmp_pcie_clk_init(struct qmp_pcie *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct device *dev = qmp->dev;
+	int i, ret;
+
+	qmp->clks = devm_kcalloc(dev, cfg->num_clks, sizeof(*qmp->clks),
+				 GFP_KERNEL);
+	if (!qmp->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg->num_clks; i++)
+		qmp->clks[i].id = cfg->clk_list[i];
+
+	ret = devm_clk_bulk_get_optional(dev, cfg->num_clks, qmp->clks);
+	if (ret)
+		return ret;
+
+	qmp->pipe_clks = devm_kcalloc(dev, cfg->num_pipe_clks,
+				      sizeof(*qmp->pipe_clks), GFP_KERNEL);
+	if (!qmp->pipe_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg->num_pipe_clks; i++)
+		qmp->pipe_clks[i].id = cfg->pipe_clk_list[i];
+
+	return devm_clk_bulk_get_optional(dev, cfg->num_pipe_clks,
+					  qmp->pipe_clks);
+}
+
+static int __phy_pipe_clk_register(struct device *dev, struct device_node *np,
+				   int idx, struct clk_fixed_rate *fixed)
+{
+	struct clk_init_data init = { };
+	int ret;
+
+	ret = of_property_read_string_index(np, "clock-output-names", idx,
+					    &init.name);
+	if (ret) {
+		dev_err(dev, "%pOFn: No clock-output-names\n", np);
+		return ret;
+	}
+
+	init.ops = &clk_fixed_rate_ops;
+
+	if (!fixed->fixed_rate)
+		fixed->fixed_rate = 125000000;
+
+	fixed->hw.init = &init;
+
+	return devm_clk_hw_register(dev, &fixed->hw);
+}
+
+static struct clk_hw *qmp_pcie_multiphy_clk_hw_get(struct of_phandle_args *clkspec,
+						    void *data)
+{
+	struct qmp_pcie_multiphy *qmp_data = data;
+	unsigned int idx = 0;
+
+	if (clkspec->args_count)
+		idx = clkspec->args[0];
+
+	if (idx < (unsigned int)qmp_data->num_pipe_outputs)
+		return &qmp_data->pipe_out_clks[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int qmp_pcie_multiphy_register_clocks(struct device *dev,
+					      struct device_node *np,
+					      struct qmp_pcie_multiphy *qmp_data)
+{
+	int num_pipe_outputs;
+	int i, ret;
+
+	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
+	if (num_pipe_outputs < 0)
+		num_pipe_outputs = 1;
+
+	qmp_data->num_pipe_outputs = num_pipe_outputs;
+	qmp_data->pipe_out_clks = devm_kcalloc(dev, num_pipe_outputs,
+					       sizeof(*qmp_data->pipe_out_clks),
+					       GFP_KERNEL);
+	if (!qmp_data->pipe_out_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pipe_outputs; i++) {
+		ret = __phy_pipe_clk_register(dev, np, i,
+					      &qmp_data->pipe_out_clks[i]);
+		if (ret)
+			return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, qmp_pcie_multiphy_clk_hw_get, qmp_data);
+}
+
+static int qmp_pcie_get_mmio(struct qmp_pcie *qmp)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct device *dev = qmp->dev;
+	void __iomem *base;
+	int i;
+
+	qmp->base = devm_kcalloc(dev, cfg->num_regs, sizeof(*qmp->base),
+				 GFP_KERNEL);
+	if (!qmp->base)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg->num_regs; i++) {
+		base = devm_platform_ioremap_resource_byname(pdev, cfg->reg_names[i]);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		qmp->base[i] = base;
+	}
+
+	return 0;
+}
+
+static int qmp_pcie_read_link_mode(struct device *dev, unsigned int *link_mode)
+{
+	struct regmap *map;
+	unsigned int args[1];
+	int ret;
+
+	map = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,link-mode",
+						   ARRAY_SIZE(args), args);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	ret = regmap_read(map, args[0], link_mode);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static struct phy *qmp_pcie_multiphy_xlate(struct device *dev,
+					   const struct of_phandle_args *args)
+{
+	struct qmp_pcie_multiphy *qmp_data = dev_get_drvdata(dev);
+	unsigned int idx;
+
+	if (!qmp_data || args->args_count < 1)
+		return ERR_PTR(-EINVAL);
+
+	idx = args->args[0];
+
+	if (idx < (unsigned int)qmp_data->mode_cfg->num_phys)
+		return qmp_data->phys[idx] ?: ERR_PTR(-EINVAL);
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int qmp_pcie_probe_phy(struct qmp_pcie *qmp, struct device_node *np,
+			      struct phy **out_phy)
+{
+	int ret;
+
+	ret = qmp_pcie_get_mmio(qmp);
+	if (ret)
+		return ret;
+
+	ret = qmp_pcie_clk_init(qmp);
+	if (ret)
+		return ret;
+
+	ret = qmp_pcie_reset_init(qmp);
+	if (ret)
+		return ret;
+
+	ret = qmp_pcie_vreg_init(qmp);
+	if (ret)
+		return ret;
+
+	ret = qmp_pcie_pd_init(qmp);
+	if (ret)
+		return ret;
+
+	*out_phy = devm_phy_create(qmp->dev, np, &qmp_pcie_phy_ops);
+	if (IS_ERR(*out_phy))
+		return PTR_ERR(*out_phy);
+
+	phy_set_drvdata(*out_phy, qmp);
+
+	return 0;
+}
+
+
+static int qmp_pcie_multiphy_probe(struct platform_device *pdev)
+{
+	const struct qmp_pcie_match_data *match_data;
+	struct qmp_pcie_multiphy *qmp_data;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	unsigned int link_mode;
+	struct qmp_pcie *qmp;
+	struct phy **phys;
+	int phy_index;
+	int ret;
+
+	qmp_data = devm_kzalloc(dev, sizeof(*qmp_data), GFP_KERNEL);
+
+	match_data = of_device_get_match_data(dev);
+	if (!match_data)
+		return -EINVAL;
+
+	if (!qmp_data)
+		return -ENOMEM;
+
+	ret = qmp_pcie_read_link_mode(dev, &link_mode);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read qcom,link-mode\n");
+
+	if (link_mode >= match_data->num_modes)
+		return dev_err_probe(dev, -EINVAL, "invalid qcom,link-mode: %u\n",
+				     link_mode);
+
+	qmp_data->mode_cfg = &match_data->mode_cfgs[link_mode];
+
+	qmp = devm_kcalloc(dev, qmp_data->mode_cfg->num_phys, sizeof(*qmp), GFP_KERNEL);
+	if (!qmp)
+		return -ENOMEM;
+
+	phys = devm_kcalloc(dev, qmp_data->mode_cfg->num_phys, sizeof(*phys), GFP_KERNEL);
+	if (!phys)
+		return -ENOMEM;
+
+	qmp_data->phys = phys;
+	dev_set_drvdata(dev, qmp_data);
+
+	for (phy_index = 0; phy_index < qmp_data->mode_cfg->num_phys; phy_index++) {
+		qmp[phy_index].dev = dev;
+		qmp[phy_index].cfg = qmp_data->mode_cfg->cfgs[phy_index];
+		ret = qmp_pcie_probe_phy(&qmp[phy_index], dev->of_node, &phys[phy_index]);
+		if (ret)
+			return ret;
+	}
+
+	ret = qmp_pcie_multiphy_register_clocks(dev, dev->of_node, qmp_data);
+	if (ret)
+		return ret;
+
+	phy_provider = devm_of_phy_provider_register(dev, qmp_pcie_multiphy_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id qmp_pcie_multiphy_of_match_table[] = {
+	{
+		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
+		.data = &glymur_qmp_gen5x8_match_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qmp_pcie_multiphy_of_match_table);
+
+static struct platform_driver qmp_pcie_multiphy_driver = {
+	.probe		= qmp_pcie_multiphy_probe,
+	.driver = {
+		.name	= "qcom-qmp-pcie-multiphy",
+		.of_match_table = qmp_pcie_multiphy_of_match_table,
+	},
+};
+module_platform_driver(qmp_pcie_multiphy_driver);
+
+MODULE_AUTHOR("Qiang Yu <qiang.yu@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm QMP PCIe Multi-PHY driver for Glymur");
+MODULE_LICENSE("GPL");

-- 
2.34.1

