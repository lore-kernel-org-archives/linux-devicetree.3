Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6695357CF3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474841; cv=none; b=UaBQiM7ANSEF/7DYW8wGaZaefXp+gP7J8EDLU5VDq7x99eSaKoKbizPMZ+nvwI1m0VV16AMRQ/O6lwaBd4IOyi3VzTygx7ZAbTkS98HVhDmDep98+eA6bbMUEXWmScAc2SWufFVCEQCCr7NTpLJpXLOnKxZ6uPvMTPtrGQM9+Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474841; c=relaxed/simple;
	bh=ZLP8kOXQOVfBDQlJCPwtg5BPcFfkuBwjBytqT/Re3E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FExXWKR8h6pnYB1fVrx2rzJBfthtFQdPVP9rLKKuf+LLLwSpIEN8ylbfTlagI3Zsmy2FjwEiBRYK1tK72NWdecM4ThNThA+ce9vOw6h61wApDUHDEYOhi4B8yaDVBJiry+yhAoFsWSBUstzIsfOKBY5HSkqK22zlkg06t/6hOfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPV+tqCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hw7ry0rm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPV+tqCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hw7ry0rm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5DEwq3038446
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wp2sntWvFCgyNgcQ059CAP2z7kNbt7G9lt7lEIG4v1Q=; b=GPV+tqCpwVjlypI8
	pgwoUJsvv6Jb4QMDgSSH62N3MEx2oUXulNG8vyMO8tERTy+qakl15C8JVfOGnsc/
	dSX5pOjKVPmZuJxgA3VIXIpNjzTuxoIFwoi6DwepKM8ALxEFAs2k13mpZcRjRI31
	dmP7Sp17fuZWq8xDNpWt3aqrSEqdavjrKZy3RbxSNUppOCuVQ8AGYME2U3uNRwpW
	2odB13koZTFmYGc4U2h+PEgj4+REaas26zCOkLBzlidTMpI50dgXQOVJKALQgsGf
	mZ8+D5GMFr6mYgHUhrfs8YbKmLqIOaKxZZ8ASPRoD6L51/U7o3New6Io+Rd+Y14z
	fzwKfA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnc9002k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:13:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso454041a12.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785474836; x=1786079636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp2sntWvFCgyNgcQ059CAP2z7kNbt7G9lt7lEIG4v1Q=;
        b=Hw7ry0rmr0SRvVb088WOBrZb+FycVyUm1Z7ivn5V17ZVZ0sszg59ikopq8l5QuPvyW
         8nKQVzg6UBvrbniefotvz+GSpH0cPFG3pLlPeLnsypvEo4rp81Y1u9ROPEvRer+eD9Vh
         t3mpYVUPIky/IaH0vAv74DrdRU24UnYRE7+KiNqR//KB3QfRjTidSnwVo0m5kWd9bwxW
         6X6wkoWdLeszSReGetMUfBEpe+dp0YKr+/Q6LrJCY1/G+QuBUVm/VIoXKVcPNhymKszK
         hDafc0yYfTzX0ssad9EgnvWWo9UNHOl1z6vacjXzQlI5Z0nCgb20RVOLqo7a5DLuTNrQ
         /I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785474836; x=1786079636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wp2sntWvFCgyNgcQ059CAP2z7kNbt7G9lt7lEIG4v1Q=;
        b=VmXmS2ogRoIJ7dCDeA8tPDlUzYEu70mDKo0LIcnxV3bT6rr8KaaRFXNBgMyyIeBoSJ
         IKBSXUDpyE9G+vMoTaLxdLFyGEvYYz0geGxR4llDESST6z4AIg5s1APAUHYwSu3zHqeu
         yAGOkMqFB2lPG4rxMHc87tFUW8AC4qZ1Qy/1Xml4b8C/OQV+HkPoXXifnPLi65hdDaS5
         GymYB5vPcXLa7xMijufk29y1I98LruT6xgOKjgOlKBaCcKfiJHZOmNHtpLWnUfL2Aytn
         DHkQd1hFlF0HowUjt6KufvuK7lLOnI5I0k3A3k3+VFgq7X5AJwozf3ZndV0h+D/sisQX
         09tQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7vT94bxVved4wv3gvf9r1+8lEsiiq6QQeirCTjypI8nbK5UJbG5rHBi/gzAMZXJzwBGiFrZ7+eFvp@vger.kernel.org
X-Gm-Message-State: AOJu0YyZiKNojxgVA6QNtwrF6CVyLhU24Xo9gtceeceYuamPE8pMHFui
	FhVzGM15by54Ckz86icMbj09CX1uXsQYevT1BvXLusYSqFxyrQfqMeGc9xl4KGRAZx9TY6Hge/B
	nfNXLPUHcnMk3H2V213YgyvVi6LrLq0TbEbhdm0E4uPwiiRf0cp9OZkES7dQdR8zb
X-Gm-Gg: AR+sD12gKaKJRJEzfNdO8vLJMeEjFgb5f4U2GCn0bf5yfFFqN8K4ER2xvxSkyJWr+6P
	pIM+EdjcFI6I2PZBBRs1SJMQHFLgC7EX5u6rEbLFYe5sM3Od5XsN94fwpVrgyoui/+bbGGXcUd7
	Ohqc1f62BU1V88I9x2ZWe5KC7ZLd73Wc6hPM+4/KIYSSmhAU6upwm2jv3Seyvnd2+deuzGIEG/J
	7gqiR331ZBqXodqMmNn4qrxTAkkSob+Rdlg2dGUhHwQnl8MRPCNsMf9zjXECtDVv3EkrQBrctBi
	1SVpgJvHlgds7yyJ1Vso5V5IPua0NuaKJrEKHuEJ6Gvy9SGxZllh7wdKuxOA3X2MiIovE7E9tql
	eZ+GeianlrQp8SxlImi/xutGTqc/YRw8Q7xwAg7rgbRAMhQ4=
X-Received: by 2002:a05:6a20:918b:b0:3c6:55f5:26f3 with SMTP id adf61e73a8af0-3c91b463fa7mr483955637.67.1785474835868;
        Thu, 30 Jul 2026 22:13:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3c6:55f5:26f3 with SMTP id adf61e73a8af0-3c91b463fa7mr483929637.67.1785474835338;
        Thu, 30 Jul 2026 22:13:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm976435eec.20.2026.07.30.22.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:13:54 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:13:51 -0700
Subject: [PATCH v8 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-glymur_linkmode_0731-v8-2-a455265ad8bf@oss.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
In-Reply-To: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474832; l=23031;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ZLP8kOXQOVfBDQlJCPwtg5BPcFfkuBwjBytqT/Re3E0=;
 b=d7Yq3ZKIyzVondrKyxdKxChIOvc4Wcwd9uRFVYOvhHNxP2r/lDKq/59QiQuwutgkswCJRqi2L
 x/6VrD0ZUuBA+9hFznNcSQFgHryNX1UO/NSEWSudymBWV452H5wPjcR
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX29iLxS1Y1UoE
 v+W7w5JSulo2Cy6I2HWqCyWzVsB0HtqRmbAIg+eLA1etYwp9ev+DfONFlPCA/ovPrbJvnInLmKR
 hY4ynMc3civMz1X/YMc0izmj2wXAQneJ85ol8xrE2s6Bxw3e3dJrIqdN11j52dkJzupbwfiKTJD
 EL2dOkFTl7sEernDrWfI0/7ZkKal5NsKMXr5nrL1S20p1m3L88gKpxlfFRfEHEemT8hM2c4ql4J
 UVqN5BSQ4AN5/I3Wg+XTAvRuNjM8UnWv/tn9ttM6rB2DEBFV2bICqt+N17DTV+5Yp5MT6qjUKA9
 Pi/Y/+vvQZBGViI1SGneHATA1HYE7yerB/jMCwJS3D/6FWFBpq/KBGPJuUCz2GX+yX74Xsqm3ol
 aMMgQ9K6PdYeP/HlXQAZle1T9kQZ+50GYjV+IrTvCacf3CpLNXlDMPfF0Y0Z3/Wo5Ajr7SCqZSt
 khoEuirMjxhtMNEX8lw==
X-Authority-Analysis: v=2.4 cv=GfknWwXL c=1 sm=1 tr=0 ts=6a6c2f15 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mlzxmGbil-RpS_vCRPwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: sxgBI-yjCnXMRmOMD4S9f_bplSR6x3_o
X-Proofpoint-GUID: sxgBI-yjCnXMRmOMD4S9f_bplSR6x3_o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX8NUqoikt6hks
 3MIlS8OAtlEUTTdInpnyZIFs8AXiNKfz8HdN3mDje49l+AzzGqyUp1O5IKYdU5okEFyt+J6bbA2
 oUnFSgxnm3QmsagJu9J80Dzu15I9wQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310032

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                      |  11 +
 drivers/phy/qualcomm/Makefile                     |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 744 ++++++++++++++++++++++
 3 files changed, 756 insertions(+)

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
index 000000000000..739c7c96aeed
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -0,0 +1,744 @@
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
+	fixed->fixed_rate = 125000000;
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
+
+	map = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,link-mode",
+						   ARRAY_SIZE(args), args);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	return regmap_read(map, args[0], link_mode);
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

