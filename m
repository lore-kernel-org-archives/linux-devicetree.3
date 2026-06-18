Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED722D4C3
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819705; cv=none; b=eMeMv0rprFYyjSr7Fej7mIvmsMtk/sPBDCw/YFdMxuiB58j1uml2xBThbQcnAmNCmViCSiPmWeN+rkp+HeYe+taYc9s7hvdDpGoHIzqHiH9ikjaHTpG1WVK+l0ks5V8G0Mdbax2rgoPttQ4h59Cx9BwrBZvHbUE3sjRNGtO8fVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819705; c=relaxed/simple;
	bh=FXDxYjYS8KJ/lrRiPR8b1zmRd16pf7+FIu37Wr9h2N0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQi2ClHGXimnD52wAEVWu5MY2b1LR/DeYuqLHRZiztaPehouTj9gyA5XoZ4AZbXjwuLPHwTftsWu/3a3xPCb+juTPOViB/MdZXnaNPwtE2UUX/X/xdVvLHTrlNYXVSdZuszccl3xDbDyIInxRddObCq3qK+gMD3cDjcxAK6OP7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QH8AvE/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VawlqJBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QH8AvE/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VawlqJBY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsQls2785626
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3aF5IthKle4500a7MHYZ2IS0F3E3AUdkvd7Z5HJtNRA=; b=QH8AvE/a+uANiBCm
	sAGirmgXAXQD8yYOdkAMvpqyKv2Fmxt/pnNOYVlPYmjIqZHB0/M3gj3Q2+V5JfGD
	S01e3lYcJAUqXoUjH8qNJUFvYxSVuKQdm0qqQdStji4zup/cySqD5J09jUYrvyB4
	luw19oJRD43fID7mGybak2L7CPrThlxDQLFhqxlUkwvqsP1hIER0yle/DerIc4jq
	Z1vZgzAbo2sQb8cOPSduqb40jNI1E6ShqoLnwC8jKJMThvJebzU+k6xLOvs/BQNG
	CxTFjQVlhXGiArzbdQOKyU6+j6EOp6Bcbzgta7VcNPDwsdXRdJnd7zyHC8acXgDS
	02L4XQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyurj41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:55:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bef75a41eso5857637eec.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781819700; x=1782424500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aF5IthKle4500a7MHYZ2IS0F3E3AUdkvd7Z5HJtNRA=;
        b=VawlqJBYTUL2kbzUSIKpFjmYY1EhMPPbfpj94orPM1tEeLkzZE9f9rk5lvm6qd0GH+
         uhET7ag7Gni5xmxsbgcNyu3MJXx2IPWLfavRNFmR2VfoN0V6iYcwVuElPtV7qjUCYVoW
         EgmyCdx0IlOCeK1XaXU1c5dCOLvT+gsNMH5LjO1XUvDD33kVuEPhCDATdkgxIS2iwJ2h
         lb+WARhA5NcuQULDnzBEZoO/oH2yRkW4tLMIMoy+yi7O4jqhQkR4v56T+fTM3FON2olo
         9PmhxEjul5w9i+u96DDrIt07eFw8aNEzl9zztz/tsgoUpc9yaqYgyL2LF91sPsa30XHG
         AW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819700; x=1782424500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3aF5IthKle4500a7MHYZ2IS0F3E3AUdkvd7Z5HJtNRA=;
        b=ne6zevHay8s0Vp8f4CUiD+rvjQ9OqPWwo2FPewZMXU7gOiALaPRLM9uk6So/G6Vk1W
         1KLmFv/K/P9lPi9U1vvE6SzD9lBw+5g19xcJ9iVs1U8/e2l5VATqilPzpwU+bGYk+uyh
         5AX+FyMBTElXAyq+SUvj51HlwdHs7jilPUNkuIft+sGPxFyih/KhwUIYQXwAlpVytUSb
         JOyvuHGKe15oyeF/z9Di4m4lnGSGcNYRuDpVfPJCQvKRqtGv0e3NDyx+r7n9wSxP6e8W
         DE7Wri6AslrvF5ss6ovJuyo+654/LeYtoZUej2unrheoVLotO+BsSXsOED6akbwi8ihr
         vTpw==
X-Forwarded-Encrypted: i=1; AFNElJ/RhdAm+U14Fa2j0bzaQ/wC8TG1hvNvFbhR5DuLsQaojXWLdkCokkzUU91HDQOQBmH07idEEe7k9vE+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz9ImxP+a6E+a2cWRql0PXegwKE/Av7FogSl9JnR8KRDs8JvPR
	ca4BYk7mGJUjqaAlp9/AubT+XmxC/eGlIscB8eQSlz1xrPs50ewr4uZcEbh0mJUoLrVqOiyoKOC
	R/ag4q+62nk0N9TNAGnWBaM2IY6oUzRRPcstP/bzXOmpAsnSvs1ZzXD/fd+eXKqdr
X-Gm-Gg: AfdE7clqbASf6fPuupxz5xMxFBnN0gCDWxDEeC3AUTyJMDYDEj2LWXPwsEwSffhLToO
	+4S354AKx7RL715jEJTFw/7F+icfiRNuKJq1lJ5Rdlf+Kb5LUJmhEvo7r/hfLZwhEVhliCFzCi9
	oG0Sk9LR6L4NxJW0vx/Y0yyH4H4Vt7PVaeGb8N/Bhbny1dV1Covci3aFHE8QtqVJcjsUnnCYHxe
	HRIg89ufsHfN9T0bjcCQ+Ymj5bxy1PXHVDngKRF9weDzHileYEgeBUM5+AWSqzirIWiMZ38JeL3
	udP7QM1v1Xd5WbyHTvQ1L3fi3FSbNOdQHLKO4Zc6fMDk0IJjNnvwpz97im0DCBH5JxX9KCabqFG
	+i6GzN2ySIz6IpsqTWLKfuMLw8Fr4F+7GwQYiwrgKSO0vDyEH
X-Received: by 2002:a05:7301:4083:b0:304:997c:d43b with SMTP id 5a478bee46e88-30c0736ed55mr935508eec.34.1781819699397;
        Thu, 18 Jun 2026 14:54:59 -0700 (PDT)
X-Received: by 2002:a05:7301:4083:b0:304:997c:d43b with SMTP id 5a478bee46e88-30c0736ed55mr935487eec.34.1781819698789;
        Thu, 18 Jun 2026 14:54:58 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm619430eec.8.2026.06.18.14.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:54:57 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 21:54:38 +0000
Subject: [PATCH v3 3/4] phy: qcom-qmp: Add v10.60 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-hawi-phy-pcie-v3-3-3fa42ca45ea4@oss.qualcomm.com>
References: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
In-Reply-To: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781819694; l=13421;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=FXDxYjYS8KJ/lrRiPR8b1zmRd16pf7+FIu37Wr9h2N0=;
 b=22x7g5F+LF0kEwVGKhsi3Obe2EvYrWbtFMRwHBkm3ZW6pbi0sQu1sd5ktZ+mnuBQGipXythG8
 buq9/8Tn1Z+CBbmdK+oO7q8dtCsfnUm6HIBRorqdizf0GPvUaLsinV0
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX/YDLNXZmzTIa
 dNsf1MwnbqYOy8MRK16m9fGFzI+0wrCTiLSWBu7pOja7d8qmXp7WtQxjQ0yrPFqSfsa23rSEk2h
 1HI7nHC5LU2XxL9sFP4WfCgAmO+CSK0=
X-Proofpoint-GUID: XevBb6e4VgULcfit7n6vMV840BPcfHv9
X-Proofpoint-ORIG-GUID: XevBb6e4VgULcfit7n6vMV840BPcfHv9
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a346934 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HHGjQcAHHd3EETTUzJIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX3QNPTvmQvY3E
 LP+WvrzpEWLkLk+duWY+AUJ5Pbo2eBwMdsT9Tjkqp5s4XWId7cNHFbu67MPK8HRQKVZiJeUR93i
 T8WBSca3la09ZG2QmAYH6bW9BY+HJDtBC1NY1ljOKgulRQ34ARiqNRpxSrW0aWXjWHLDZ0xxSIE
 LdLjLX/cND+lOV/76+CNtNqahNjGrLMfL8qrZrAyRWXDuTrMIuo3ZrZo2bJOzsQiUryoObYorjq
 Oa9L166S8rKU9PxQgksgsAl/xR50Aw4+WhdkrVS1uu7U0ph7IcVr/CZIeSkQBAOuONyXSamwdFP
 c7hxvqbbj72NNWffzLBTlxIerdILo+M+JSGGjHPlHXuAnhb0n3a1ZXMKRqMaPAtRwdoam6wvt01
 J8ohEa+Z491+nnX0SBC6q29ErzgrDf9TyX9K4AhVg0/WYc+iF8twYOz2ss/4sHzUe8z15sSTxT+
 10zVbI3wv0piKThB9NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200

Hawi SoC uses v10.60 register definitions for PCIe Gen4 x1. Add the new
register offset headers for all four sub-blocks:

 - QSERDES-COM offsets
 - QSERDES TX/RX offsets
 - PCS offsets
 - PCS PCIe-specific offsets

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |   1 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 +++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++++++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 6 files changed, 219 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index ba17e53d000f..fb66e2a97ce0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -41,6 +41,7 @@
 #include "phy-qcom-qmp-pcs-pcie-v8.h"
 #include "phy-qcom-qmp-qserdes-txrx-pcie-v8.h"
 #include "phy-qcom-qmp-pcs-pcie-v10.h"
+#include "phy-qcom-qmp-pcs-pcie-v10_60.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h
new file mode 100644
index 000000000000..2df5a45010a4
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V10_60_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V10_60_H_
+
+/* Only for QMP V10_60 PHY - PCIE PCS registers */
+#define QPHY_PCIE_V10_60_PCS_POWER_STATE_CONFIG2		0x00c
+#define QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG			0x018
+#define QPHY_PCIE_V10_60_PCS_ENDPOINT_REFCLK_DRIVE		0x01c
+#define QPHY_PCIE_V10_60_PCS_OSC_DTCT_ACTIONS			0x090
+#define QPHY_PCIE_V10_60_PCS_EQ_CONFIG1				0x0a0
+#define QPHY_PCIE_V10_60_PCS_G3_RXEQEVAL_TIME			0x0f0
+#define QPHY_PCIE_V10_60_PCS_G4_RXEQEVAL_TIME			0x0f4
+#define QPHY_PCIE_V10_60_PCS_G4_EQ_CONFIG5			0x108
+#define QPHY_PCIE_V10_60_PCS_G4_PRE_GAIN			0x15c
+#define QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG1		0x17c
+#define QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG3		0x184
+#define QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG5		0x18c
+#define QPHY_PCIE_V10_60_PCS_G3_FOM_EQ_CONFIG5			0x1ac
+#define QPHY_PCIE_V10_60_PCS_G4_FOM_EQ_CONFIG5			0x1c0
+#define QPHY_PCIE_V10_60_PCS_POWER_STATE_CONFIG6		0x1d0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h
new file mode 100644
index 000000000000..e4558b69489d
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V10_60_H_
+#define QCOM_PHY_QMP_PCS_V10_60_H_
+
+/* Only for QMP V10_60 PHY - PCIe PCS registers */
+#define QPHY_V10_60_PCS_SW_RESET			0x000
+#define QPHY_V10_60_PCS_PCS_STATUS1			0x014
+#define QPHY_V10_60_PCS_POWER_DOWN_CONTROL		0x040
+#define QPHY_V10_60_PCS_START_CONTROL			0x044
+#define QPHY_V10_60_PCS_G12S1_TXDEEMPH_M6DB		0x170
+#define QPHY_V10_60_PCS_G3S2_PRE_GAIN			0x178
+#define QPHY_V10_60_PCS_RX_SIGDET_LVL			0x190
+#define QPHY_V10_60_PCS_ELECIDLE_DLY_SEL		0x1b8
+#define QPHY_V10_60_PCS_PCS_TX_RX_CONFIG1		0x1dc
+#define QPHY_V10_60_PCS_PCS_TX_RX_CONFIG2		0x1e0
+#define QPHY_V10_60_PCS_EQ_CONFIG4			0x1f8
+#define QPHY_V10_60_PCS_EQ_CONFIG5			0x1fc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h
new file mode 100644
index 000000000000..39351bef8b63
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V10_60_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V10_60_H_
+
+/* Only for QMP V10_60 PHY - QSERDES COM registers */
+#define QSERDES_V10_60_COM_SSC_STEP_SIZE1_MODE1		0x00
+#define QSERDES_V10_60_COM_SSC_STEP_SIZE2_MODE1		0x04
+#define QSERDES_V10_60_COM_CP_CTRL_MODE1		0x10
+#define QSERDES_V10_60_COM_PLL_RCTRL_MODE1		0x14
+#define QSERDES_V10_60_COM_PLL_CCTRL_MODE1		0x18
+#define QSERDES_V10_60_COM_CORECLK_DIV_MODE1		0x1c
+#define QSERDES_V10_60_COM_LOCK_CMP1_MODE1		0x20
+#define QSERDES_V10_60_COM_LOCK_CMP2_MODE1		0x24
+#define QSERDES_V10_60_COM_DEC_START_MODE1		0x28
+#define QSERDES_V10_60_COM_DIV_FRAC_START1_MODE1	0x30
+#define QSERDES_V10_60_COM_DIV_FRAC_START2_MODE1	0x34
+#define QSERDES_V10_60_COM_DIV_FRAC_START3_MODE1	0x38
+#define QSERDES_V10_60_COM_HSCLK_SEL_1			0x3c
+#define QSERDES_V10_60_COM_SSC_STEP_SIZE1_MODE0		0x60
+#define QSERDES_V10_60_COM_SSC_STEP_SIZE2_MODE0		0x64
+#define QSERDES_V10_60_COM_CP_CTRL_MODE0		0x70
+#define QSERDES_V10_60_COM_PLL_RCTRL_MODE0		0x74
+#define QSERDES_V10_60_COM_PLL_CCTRL_MODE0		0x78
+#define QSERDES_V10_60_COM_CORECLK_DIV_MODE0		0x7c
+#define QSERDES_V10_60_COM_LOCK_CMP1_MODE0		0x80
+#define QSERDES_V10_60_COM_LOCK_CMP2_MODE0		0x84
+#define QSERDES_V10_60_COM_DEC_START_MODE0		0x88
+#define QSERDES_V10_60_COM_DIV_FRAC_START1_MODE0	0x90
+#define QSERDES_V10_60_COM_DIV_FRAC_START2_MODE0	0x94
+#define QSERDES_V10_60_COM_DIV_FRAC_START3_MODE0	0x98
+#define QSERDES_V10_60_COM_HSCLK_HS_SWITCH_SEL_1	0x9c
+#define QSERDES_V10_60_COM_BG_TIMER			0xbc
+#define QSERDES_V10_60_COM_SSC_PER1			0xcc
+#define QSERDES_V10_60_COM_SSC_PER2			0xd0
+#define QSERDES_V10_60_COM_BIAS_EN_CLKBUFLR_EN		0xdc
+#define QSERDES_V10_60_COM_CLK_ENABLE1			0xe0
+#define QSERDES_V10_60_COM_SYS_CLK_CTRL			0xe4
+#define QSERDES_V10_60_COM_PLL_IVCO			0xf4
+#define QSERDES_V10_60_COM_SYSCLK_EN_SEL		0x110
+#define QSERDES_V10_60_COM_LOCK_CMP_EN			0x120
+#define QSERDES_V10_60_COM_LOCK_CMP_CFG			0x124
+#define QSERDES_V10_60_COM_VCO_TUNE_MAP			0x140
+#define QSERDES_V10_60_COM_CLK_SELECT			0x164
+#define QSERDES_V10_60_COM_CORE_CLK_EN			0x170
+#define QSERDES_V10_60_COM_CMN_CONFIG_1			0x174
+#define QSERDES_V10_60_COM_CMN_MISC1			0x184
+#define QSERDES_V10_60_COM_CMN_MODE			0x188
+#define QSERDES_V10_60_COM_VCO_DC_LEVEL_CTRL		0x198
+#define QSERDES_V10_60_COM_PLL_SPARE_FOR_ECO		0x2b4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h
new file mode 100644
index 000000000000..3150a494685e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V10_60_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V10_60_H_
+
+#define QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_TX			0x034
+#define QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_RX			0x038
+#define QSERDES_V10_60_TXRX_LANE_MODE_1					0x080
+#define QSERDES_V10_60_TXRX_LANE_MODE_2					0x084
+#define QSERDES_V10_60_TXRX_LANE_MODE_3					0x088
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE1			0x0c8
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE2			0x0cc
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE3			0x0d0
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE4			0x0d4
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE1			0x0e0
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE2			0x0e4
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE3			0x0e8
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE4			0x0ec
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL1				0x12c
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL2				0x130
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL3				0x134
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL4				0x138
+#define QSERDES_V10_60_TXRX_SVS_MODE_CTRL				0x19c
+#define QSERDES_V10_60_TXRX_RXCLK_DIV2_CTRL				0x1a0
+#define QSERDES_V10_60_TXRX_RX_BAND_CTRL0				0x1a4
+#define QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL0				0x1ac
+#define QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL1				0x1b0
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE1				0x1b8
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE2				0x1bc
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE3				0x1c0
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE4				0x1c4
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE1				0x1d0
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE2				0x1d4
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE3				0x1d8
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE4				0x1dc
+#define QSERDES_V10_60_TXRX_UCDR_PI_CONTROLS				0x1e4
+#define QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE3				0x200
+#define QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE4				0x204
+#define QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_LSB			0x218
+#define QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_MSB			0x21c
+#define QSERDES_V10_60_TXRX_VGA_CAL_CNTRL1				0x280
+#define QSERDES_V10_60_TXRX_VGA_CAL_MAN_VAL				0x288
+#define QSERDES_V10_60_TXRX_GM_CAL					0x29c
+#define QSERDES_V10_60_TXRX_RX_EQU_ADAPTOR_CNTRL6			0x2b8
+#define QSERDES_V10_60_TXRX_SIGDET_ENABLES				0x2d4
+#define QSERDES_V10_60_TXRX_SIGDET_CNTRL				0x2d8
+#define QSERDES_V10_60_TXRX_SIGDET_LVL					0x2dc
+#define QSERDES_V10_60_TXRX_SIGDET_DEGLITCH_CNTRL			0x2e0
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B0				0x314
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B1				0x318
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B2				0x31c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B3				0x320
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B4				0x324
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B5				0x328
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B6				0x32c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B7				0x330
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B8				0x334
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B9				0x338
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B10			0x33c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B0				0x340
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B1				0x344
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B2				0x348
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B3				0x34c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B4				0x350
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B5				0x354
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B6				0x358
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B7				0x35c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B8				0x360
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B9				0x364
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B10				0x368
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B0				0x36c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B1				0x370
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B2				0x374
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B3				0x378
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B4				0x37c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B5				0x380
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B6				0x384
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B7				0x388
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B8				0x38c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B9				0x390
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B10				0x394
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B0				0x398
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B1				0x39c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B2				0x3a0
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B3				0x3a4
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B4				0x3a8
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B5				0x3ac
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B6				0x3b0
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B7				0x3b4
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B8				0x3b8
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B9				0x3bc
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B10			0x3c0
+#define QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE32			0x478
+#define QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE45			0x47c
+#define QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL1				0x4c8
+#define QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL2				0x4cc
+#define QSERDES_V10_60_TXRX_SIGDET_CAL_TRIM				0x4d0
+#define QSERDES_V10_60_TXRX_TX_BAND0					0x4e8
+#define QSERDES_V10_60_TXRX_TX_BAND1					0x4ec
+#define QSERDES_V10_60_TXRX_SEL_10B_8B					0x4f4
+#define QSERDES_V10_60_TXRX_SEL_20B_10B					0x4f8
+#define QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE3				0x53c
+#define QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE4				0x540
+#define QSERDES_V10_60_TXRX_PHPRE_CTRL					0x5e8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 7af77572970e..3a4a0a9a9e4d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -42,6 +42,9 @@
 #include "phy-qcom-qmp-qserdes-com-v10.h"
 #include "phy-qcom-qmp-qserdes-txrx-v10.h"
 
+#include "phy-qcom-qmp-qserdes-com-v10_60.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10_60.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"
@@ -70,6 +73,8 @@
 
 #include "phy-qcom-qmp-pcs-v10.h"
 
+#include "phy-qcom-qmp-pcs-v10_60.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1

