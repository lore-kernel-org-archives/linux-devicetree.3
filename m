Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC073E7BD2
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456401; cv=none; b=At+7VsNKQxgssu5tgoj0trcd27gTPbc8nmXf51S9FGUNsrTdS7OdCT1KfQvSjsMVTh10wE+aHm9XX5ECn6mCDTEuVpQht99kLIj2FJedjZ3KqBu2l6D0+Qlpkwxtxd7ytQMzEVPZq9eENiKDEFmdi6Q6jI5N7/+KkgEKK0doPqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456401; c=relaxed/simple;
	bh=0xAUSEOAr2rhWZfhsiNyllLVTAhJYJxfqRAjkQ20CNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvxKLUiL0Wp4IQPq+tiZE6EuvZd3njWa7akMY6sPJXNOMPj9G3Gik04/tSVzt5UeE6+y6bmg3WS+kILC6ogY8kM6kfw0JotTp/FVr3db7YKlIsVvGP1MZrP2o8+wLAPZlWZB4wLSBCjchSF5kY2YvOTAYfk931hzugAj7IqR/fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJS5yX7i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BC/CjDA7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJS5yX7i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BC/CjDA7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5OH1357429
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 20:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCkDZQmQnkTpF+OJAwOBLl/IzCnTr0eTl+X1vlkLePI=; b=lJS5yX7igehqHCWL
	MvsWfq/mT0HesLdvfmsqPtwl6N0CRbgABS9CFwQ1Qaml2FL6KUMCGsXLR/AYhRmq
	+R5Hc43gVMeHvo2dU43wfMNp2LiROn3QG/h9WZFPRSTVn4WM4E4P2GN59uattxlT
	wUesH+3DiYbOmO2PvDDzkNiwJwFBcHqK+xwfnU+/2ecB+J9GpKVSEITlDxbL5o0n
	QT2tDxCC8w1neabPUhWONtQkMwW7jskPUEXsweuIqTLI+SWCBAwvlUw7bWV2F20l
	TV82n1EhLwvRFeOO8yXb7JN4LZOHxj6kFRkDQqH9N+ZyjKE38UA8lJo5WJnJKst3
	YqFRlQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8m1b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 20:33:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8894570b58so3451036a12.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783456398; x=1784061198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCkDZQmQnkTpF+OJAwOBLl/IzCnTr0eTl+X1vlkLePI=;
        b=BC/CjDA75gskd8b2KJHFGImsJZxt6BRz6wdYirIKeT+jzSynC/cHmJaKNItw1izhNu
         RD/BD4Yhs2/knVSB8g7zgT5+rxmdXh8Q8nIGtRPerKlS9ubxDH9wxoNGrhwxzJpZdoB1
         INq+Wi8wYKcTCozdru2jdHVJ9ASLw8CTcTRx5j+bhRXlrybqjgQ2ceW4APptLMSmuU4x
         UMhuUt/mXH6W2KsuD+otLJyS0702yN9/IQBO2UltA7U2LaILhG4YVBhUXXF5wg76YHGD
         kShTpTPhIG6AdPLkqh/2ankowEtJc+l++ID0z5Uf7mwJrjjH8PyYPyFFMXMN/DjqJCRo
         1PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456398; x=1784061198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCkDZQmQnkTpF+OJAwOBLl/IzCnTr0eTl+X1vlkLePI=;
        b=geGYK1CkRyVPsgqi8Wx8yUrl/sssWTyDkHjxSEQ9P/isijXYhJY6dFk994xgicTcVf
         zPZIok4n9qVUD37481OHRBoqBQd8XolN1T1v9GscsD5oa5ADYKp9KBVay+wfeizn+16K
         uscjYQI2m8I6MWdyvbRAh1BroiRRfgvC8a3DDIX8pwRqpohRGeo09B86ALhXnpe9UWVf
         VkpQduvSUuc6KmlFfzuTDbICKXiltBw9RZxE6QeKKkxP1+n/u2Scq30b6JuYkpQgJziU
         MvYEGvjyDcrVOU6dwbH78pAOF7GOMmlWLRYoiBDKx5RQhLEPLJoVqjVsDQa6SM+3uXZQ
         iA9w==
X-Forwarded-Encrypted: i=1; AHgh+RpAxpvr66JWEchRQLL7nxWuo9u2WCkaekVshlNWuunmioAaCPm1QFI39Ps1z6jO6YZYtITOyMIWtsVw@vger.kernel.org
X-Gm-Message-State: AOJu0YwsaGmbv7HLOnVfF7OV5tONK0cZV0DgGhGISh7DfV4OuPp4R7FY
	GtltFiQ+782P+Z7K/z6PLb1CvBgVSbDH/R4/ijo0+nr58Q0eSVQKKa0YNRPYSzPV9YVPawa5hZX
	JTawpiUwW3VNdgoN08btaBpA3DUvFEpbS2di4Ma+r7EkfFzAaRXe53ZF4+YhcYM5h
X-Gm-Gg: AfdE7cl+CTqJy6dPKewuF89Y/uLG3mUhETpf2Tm0KCGi4HBNxOCeWe86zSRfQRUyH0C
	fTmN8IAl6zfbu8vP7iQhD6BOSe2MEVXlCoUTaxdICJS8oE6nPpM15zgK/zWChYxEdQmxtD4WyiX
	QLk7xaxB82GNbWMFBF4ZLao2uEL2lwEa7fcBxVKbb1pVFDTRQ0VNIyJSDu6Z16Ah0SP4ZJJ7Co/
	zwWoQsGj0FkUZqZkDCu9RP9kbZPwCtsHReUdk1lVtI2IO6rpBGLjHqVAvNqHVhLAOAD7wMONQXa
	O0LZWoOyzsLIFWWV0zW+XAQKnLM/sVuavq19nJHcvDCxNXWGCz9OL2vkFPZtHqPe2TrDfgxcmtU
	bY1tE/ZZhkO0GjMhfnonDDAAkKICc+HT1Bp9S3w4hYGB4M0lC
X-Received: by 2002:a17:90b:3c86:b0:381:b64b:5a28 with SMTP id 98e67ed59e1d1-38757d76a1amr5839874a91.30.1783456397967;
        Tue, 07 Jul 2026 13:33:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3c86:b0:381:b64b:5a28 with SMTP id 98e67ed59e1d1-38757d76a1amr5839855a91.30.1783456397459;
        Tue, 07 Jul 2026 13:33:17 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm11975804eec.10.2026.07.07.13.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:33:16 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 20:32:47 +0000
Subject: [PATCH v4 2/4] phy: qcom-qmp: Add v10 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hawi-phy-pcie-v4-2-8d9cc6324947@oss.qualcomm.com>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
In-Reply-To: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783456392; l=8539;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=0xAUSEOAr2rhWZfhsiNyllLVTAhJYJxfqRAjkQ20CNo=;
 b=GwVozCguACuUhdhoqzqo6pMOMbGYUmtDjbLnG/twYwzuIwr97GDU9QrR7Zv0Pt7UU4KXE4wc4
 5HNAR2oduIVAnexnINxyrqk/Udz1IvHSUVPWm0Xz4CpWWoU/PTc9odt
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX0vp5PJjRv+J1
 wk8vfeukSRU8ZmXT9WtS/E/MCFPuQ3oykIaYO/NZFopOpvflgJS+SnP8BidpUjP3W3XFRNAuSx8
 EFXkfgHVMxs2RBQfCMbzEZ3uBrLuj4pKHWLyZtnAB1uUVsJOUtAi1EEHeZb5440PSEoxTCXtYw3
 TqqTiT80zOtIUIVn2qLIKwclOni8sof6Qip90/9rEdKH3Ts7HVe2PLXOngkzyoJOKHXmhu61PQp
 uD3bV7gJQAll609hKyMDV8Hlt7+blUejwh+1N8ZJvw6WRavhEMzm0E76AVyPUbIER+iyMZG0V+t
 DH+h+I4l2H3E83Z73weTB5TOJHbm0EOUCHXmjlGb5VTVvC6t1DgOVVG8P0cGGQglVFLTPLt/BOc
 CUbhE974+AyD7SDaBB0l73VRKaVt61kRO8bTgBFTrHb7lo0Hg6TKWz8sbgKaJIJqXHC7X+noELG
 4dtbLD0a3Zy5d2LjBvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfXwu6dCt3VAaiO
 hVG8OlLPCy2jwMtKSaiFyfnVBGkvKA55LKeYN0BKjjxMLJqskX/FTHhtSMg0F4baUbbIJf0/Efu
 03EigNZWgN25DKGVYPeVKHXmM7IjHdI=
X-Proofpoint-GUID: 8HJMKY8w-s5gQZvToQlSzEiGGvOmgiF6
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4d628e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=n0CoORYsuzxYYYjHsOkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 8HJMKY8w-s5gQZvToQlSzEiGGvOmgiF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070201

Hawi SoC uses v10 register definitions for PCIe Gen3 x2. Add the new
register offset headers for all four sub-blocks:

 - QSERDES-COM offsets
 - QSERDES TX/RX offsets
 - PCS offsets
 - PCS PCIe-specific offsets

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   | 18 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        | 22 ++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    | 49 ++++++++++++++++++++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   | 47 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  5 +++
 6 files changed, 142 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..5a26347d0fc9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -40,6 +40,7 @@
 #include "phy-qcom-qmp-qserdes-com-v8.h"
 #include "phy-qcom-qmp-pcs-pcie-v8.h"
 #include "phy-qcom-qmp-qserdes-txrx-pcie-v8.h"
+#include "phy-qcom-qmp-pcs-pcie-v10.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h
new file mode 100644
index 000000000000..2cdcc211bd93
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V10_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V10_H_
+
+/* Only for QMP V10 PHY - PCIE PCS registers */
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG2		0x00c
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG4		0x014
+#define QPHY_PCIE_V10_PCS_ENDPOINT_REFCLK_DRIVE		0x020
+#define QPHY_PCIE_V10_PCS_OSC_DTCT_ACTIONS		0x094
+#define QPHY_PCIE_V10_PCS_EQ_CONFIG1			0x0a4
+#define QPHY_PCIE_V10_PCS_RXEQEVAL_TIME			0x0f4
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG6		0x0f8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
new file mode 100644
index 000000000000..165ce8a28f61
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V10_H_
+#define QCOM_PHY_QMP_PCS_V10_H_
+
+/* Only for QMP V10 PHY - PCIe PCS registers */
+#define QPHY_V10_PCS_SW_RESET				0x000
+#define QPHY_V10_PCS_PCS_STATUS1			0x014
+#define QPHY_V10_PCS_POWER_DOWN_CONTROL			0x040
+#define QPHY_V10_PCS_START_CONTROL			0x044
+#define QPHY_V10_PCS_REFGEN_REQ_CONFIG1			0x0dc
+#define QPHY_V10_PCS_G12S1_TXDEEMPH_M6DB		0x168
+#define QPHY_V10_PCS_G3S2_PRE_GAIN			0x170
+#define QPHY_V10_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V10_PCS_RATE_SLEW_CNTRL1			0x198
+#define QPHY_V10_PCS_PCS_TX_RX_CONFIG			0x1d0
+#define QPHY_V10_PCS_EQ_CONFIG2				0x1e4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
new file mode 100644
index 000000000000..09199e7b4aac
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V10_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V10_H_
+
+/* Only for QMP V10 PHY - QSERDES COM registers */
+#define QSERDES_V10_COM_SSC_STEP_SIZE1_MODE1		0x00
+#define QSERDES_V10_COM_SSC_STEP_SIZE2_MODE1		0x04
+#define QSERDES_V10_COM_CP_CTRL_MODE1			0x10
+#define QSERDES_V10_COM_PLL_RCTRL_MODE1			0x14
+#define QSERDES_V10_COM_PLL_CCTRL_MODE1			0x18
+#define QSERDES_V10_COM_CORECLK_DIV_MODE1		0x1c
+#define QSERDES_V10_COM_LOCK_CMP1_MODE1			0x20
+#define QSERDES_V10_COM_LOCK_CMP2_MODE1			0x24
+#define QSERDES_V10_COM_DEC_START_MODE1			0x28
+#define QSERDES_V10_COM_DIV_FRAC_START1_MODE1		0x30
+#define QSERDES_V10_COM_DIV_FRAC_START2_MODE1		0x34
+#define QSERDES_V10_COM_DIV_FRAC_START3_MODE1		0x38
+#define QSERDES_V10_COM_HSCLK_SEL_1			0x3c
+#define QSERDES_V10_COM_SSC_STEP_SIZE1_MODE0		0x60
+#define QSERDES_V10_COM_SSC_STEP_SIZE2_MODE0		0x64
+#define QSERDES_V10_COM_CP_CTRL_MODE0			0x70
+#define QSERDES_V10_COM_PLL_RCTRL_MODE0			0x74
+#define QSERDES_V10_COM_PLL_CCTRL_MODE0			0x78
+#define QSERDES_V10_COM_LOCK_CMP1_MODE0			0x80
+#define QSERDES_V10_COM_LOCK_CMP2_MODE0			0x84
+#define QSERDES_V10_COM_DEC_START_MODE0			0x88
+#define QSERDES_V10_COM_DIV_FRAC_START1_MODE0		0x90
+#define QSERDES_V10_COM_DIV_FRAC_START2_MODE0		0x94
+#define QSERDES_V10_COM_DIV_FRAC_START3_MODE0		0x98
+#define QSERDES_V10_COM_BG_TIMER			0xbc
+#define QSERDES_V10_COM_SSC_EN_CENTER			0xc0
+#define QSERDES_V10_COM_SSC_PER1			0xcc
+#define QSERDES_V10_COM_SSC_PER2			0xd0
+#define QSERDES_V10_COM_CLK_ENABLE1			0xe0
+#define QSERDES_V10_COM_SYS_CLK_CTRL			0xe4
+#define QSERDES_V10_COM_PLL_IVCO			0xf4
+#define QSERDES_V10_COM_SYSCLK_EN_SEL			0x110
+#define QSERDES_V10_COM_LOCK_CMP_EN			0x120
+#define QSERDES_V10_COM_VCO_TUNE_MAP			0x140
+#define QSERDES_V10_COM_CLK_SELECT			0x164
+#define QSERDES_V10_COM_CORE_CLK_EN			0x170
+#define QSERDES_V10_COM_CMN_CONFIG_1			0x174
+#define QSERDES_V10_COM_ADDITIONAL_MISC_3		0x1bc
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
new file mode 100644
index 000000000000..d81ebdde0063
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_TX			0x03c
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_RX			0x040
+#define QSERDES_V10_TX_LANE_MODE_1				0x084
+#define QSERDES_V10_TX_LANE_MODE_3				0x08c
+#define QSERDES_V10_TX_LANE_MODE_4				0x090
+#define QSERDES_V10_TX_LANE_MODE_5				0x094
+#define QSERDES_V10_TX_PI_QEC_CTRL				0x0e4
+
+#define QSERDES_V10_RX_UCDR_FO_GAIN				0x008
+#define QSERDES_V10_RX_UCDR_SO_GAIN				0x014
+#define QSERDES_V10_RX_UCDR_SB2_THRESH1				0x04c
+#define QSERDES_V10_RX_UCDR_SB2_THRESH2				0x050
+#define QSERDES_V10_RX_TX_ADAPT_PRE_THRESH1			0x0c4
+#define QSERDES_V10_RX_TX_ADAPT_PRE_THRESH2			0x0c8
+#define QSERDES_V10_RX_TX_ADAPT_POST_THRESH			0x0cc
+#define QSERDES_V10_RX_VGA_CAL_CNTRL2				0x0d8
+#define QSERDES_V10_RX_GM_CAL					0x0dc
+#define QSERDES_V10_RX_RX_IDAC_TSETTLE_LOW			0x0f8
+#define QSERDES_V10_RX_SIGDET_ENABLES				0x118
+#define QSERDES_V10_RX_SIGDET_CNTRL				0x11c
+#define QSERDES_V10_RX_RX_MODE_00_LOW				0x15c
+#define QSERDES_V10_RX_RX_MODE_00_HIGH				0x160
+#define QSERDES_V10_RX_RX_MODE_00_HIGH2				0x164
+#define QSERDES_V10_RX_RX_MODE_00_HIGH3				0x168
+#define QSERDES_V10_RX_RX_MODE_00_HIGH4				0x16c
+#define QSERDES_V10_RX_RX_MODE_01_LOW				0x170
+#define QSERDES_V10_RX_RX_MODE_01_HIGH				0x174
+#define QSERDES_V10_RX_RX_MODE_01_HIGH2				0x178
+#define QSERDES_V10_RX_RX_MODE_01_HIGH3				0x17c
+#define QSERDES_V10_RX_RX_MODE_01_HIGH4				0x180
+#define QSERDES_V10_RX_RX_MODE_10_LOW				0x184
+#define QSERDES_V10_RX_RX_MODE_10_HIGH				0x188
+#define QSERDES_V10_RX_RX_MODE_10_HIGH2				0x18c
+#define QSERDES_V10_RX_RX_MODE_10_HIGH3				0x190
+#define QSERDES_V10_RX_RX_MODE_10_HIGH4				0x194
+#define QSERDES_V10_RX_DFE_CTLE_POST_CAL_OFFSET			0x1a4
+#define QSERDES_V10_RX_SIGDET_CAL_TRIM				0x1f8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 11b7e03b4fab..e4237e374404 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -36,6 +36,9 @@
 #include "phy-qcom-qmp-qserdes-txrx-v8.h"
 #include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
+#include "phy-qcom-qmp-qserdes-com-v10.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"
@@ -62,6 +65,8 @@
 
 #include "phy-qcom-qmp-pcs-v8_50.h"
 
+#include "phy-qcom-qmp-pcs-v10.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1

