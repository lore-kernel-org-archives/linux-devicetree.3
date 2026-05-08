Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A59363086
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283090; cv=none; b=klfXS8JqBeVpZrsVoRqcndmfwAjas0FYipS1OEX37MyeNOBMQWElFeHvlw7a4pcnQ37qis7/IRSuRR0YWsna+951tq7NpDIeVAd/SmtIFpM4QyOcbIvq+x56zt51thAwq3T9TYIUKYZMPjuD+yy0DbjyilO54qTKcv36FeX3a8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283090; c=relaxed/simple;
	bh=DOGsd2u7iW9cMvj4+PDQls+GBNWh6gWdVwXtre2Q3s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikHEdr6yS/i1XLi/unc1J6zwty9kcWeYAGmRMC17Gg/IGazZKdIbc5gQvC/feQ92wkruOWXJsPKj1UcRtpceSk4BOvXJgLv5rLO4lE9lJnLmv9LX3dMLpdPLtgeTO7zYHTXl5+4hgjlpXMTt73WILLYT32szJfhuMhv/PsIpJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLt3faeP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxSZTC5E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLt3faeP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxSZTC5E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648HU54K2515470
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 23:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=; b=KLt3faeP/lLN18pd
	/YXJDoRxk2OzVCKNu40kf3n4u+J5/K2uf1TXIyqQyUDFnG+MpwcEKkPkOtJ/toS0
	WMTgYYS3XQ/7RcEGB6GXOBbK/ukjHZZChnBUILC2lTIuIGwmENtX4eB2gr0BnbJH
	l7YKFqF8Dh8A2Xg77h+Hnak8l7Uvxg+gXMed4vSdd7I+eOl6NhINhczVJNv6qNkI
	IlflYRbjvUapd7OtnTH7aRol1JorJ/iPQPOANNUgLWIl5pqYrloNNs8/egnuuxGR
	0wvosPohCVKdQyD+0yDEo5AUZNMVFPodt0M/jBcSTJ5zaHp5odmr1ANah/e87FHc
	8YDICA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1m9nryxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 23:31:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so26795eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283086; x=1778887886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=;
        b=ZxSZTC5E9W2yNSHePCL8sQ1j0Di6oVkyx+5LT5jxT9eEcqRc7PlX3uupff03lKof5B
         r4azA9cSCR3dSRvAV4rPqF2BE7sZuqhywN7uPEcHaTfEGAXD5bUBBhZG64ENGfQVloK/
         7GZTg+pyZjz5NCpXTBjbHPZ7d4pMnSLVCJeRlskeJ0Mm1R3X/jZaZ1fXnCbs/fqvc0cZ
         JNmcGdgu2eOmeVjsHMfYODmo/F1L/NIiXiha20PyyGRiKhvEgC4avAnz/PV81UNfVDXO
         LofNvPmBux3HsHE0NKMvRtbvW6symuWt2T9OTQBLn29UGTejEYvXFrhc7GjOGwS1KqNu
         wtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283086; x=1778887886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=;
        b=m1yfwL2MqM8jz8EkVE9dmACTzDEJAr0rxjwXlPIrYDexPTjPSDmsIlNe9A9Bd3jrqm
         Jj8W8YQsoH1RrgILfmCFqQB1dNoBtjNofmNNWIjoaFZ5WazjhFLDx1J7edMtRjtotPio
         aRjBaAbUzXGgydS32CzzZNVA4k7AftGUV/5bUWM8Ysrbg2GbprfYdTPff5DYlSyIh8Sx
         Q0llr7R9zCPUfERpStS7PWsRObLbMk8tTvjBrjWlG/FyMUch3Q29p8zywDAKV5OWW6V5
         PKrPZDiKyqCb6MkIzu6wCegnSfBmtPW2wfXGQBcNY0YYXU0/eBPco7nJZvVT1gmIv2BT
         lTVQ==
X-Forwarded-Encrypted: i=1; AFNElJ81sxz69HgLUHOol9OcqpUWcsVU8HDp4LAY1NhAKkXpMYfe9b0YDurEPyORkl8k42vrWkV9hDdjzG0q@vger.kernel.org
X-Gm-Message-State: AOJu0YzVKvYoxHWARFThIviVu0qLilV8eEXWO5NeKaabcoxrWXv5lgS7
	0XoEhGuHw1fVz4FXSrGUvBIXR/2TXWpJNjMWh/OtujL0MQy5m7xs90a/AcyscnyXqKY6wpPGiXh
	Oo1xPgOqU/+h2XuqYyP+RzDDxV9NoK/kfaMIS2rqRGu6EGPMn2SFHVQOKgwD9/kdt
X-Gm-Gg: Acq92OFYsJtktHI9w5/H9ASGpPxygacLage3LSJZMo3mxirDR1r9fkOaMGRvZA0uUrs
	YG7DQkl3UWJ69bSKQfFjVMqhwrD/TFYbGo0UWRzjtWzrenYTo/YwsT6qBuUO2GXvCPFYyyJLlrh
	YvJm7qA+d8CE+qjdZFNG3vVsnqUYAToEPR5Ag+G1N6XO9qx6QlTg74wO83GPaXd4431HFvStmIO
	MwJ7+p6K/3sXXS20VfOL7fncE6pp3RVTfY+0MgRZSIyMKEaka+lmmX6zUxM/o2irwvZIayvqfX5
	HAAkXn4lvrxxoI/mToa/gzm64IcKYDXZ/mVcKVxvzsGNY1+RRMz8TRnSKYF7Jm+QjD5Obklzc+2
	QSMVfvzFMNhOHLvjdfCaIVDeC+6WbipH2bo6O5TdLxZhATljrXlsKzfk3Vso=
X-Received: by 2002:a05:7300:b10b:b0:2d8:97d6:6ac8 with SMTP id 5a478bee46e88-2f85d94b2ccmr2176674eec.21.1778283086103;
        Fri, 08 May 2026 16:31:26 -0700 (PDT)
X-Received: by 2002:a05:7300:b10b:b0:2d8:97d6:6ac8 with SMTP id 5a478bee46e88-2f85d94b2ccmr2176653eec.21.1778283085572;
        Fri, 08 May 2026 16:31:25 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:25 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:18 +0000
Subject: [PATCH 03/10] phy: qcom-qmp: qserdes-txrx: Add v10 register
 offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-3-237b894353fc@oss.qualcomm.com>
References: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=3118;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=DOGsd2u7iW9cMvj4+PDQls+GBNWh6gWdVwXtre2Q3s8=;
 b=M1NyJKqphIbPzN87ChMeDEtvOTQSa6ZIZzdv/CNOEy7e57CCQ2Lrmmn85iAua2MC3d1PwM7b/
 7b2XupfrAtPBX3Kh1MMkpTDtgeQjcqgXlxpxrNtHsG8d1RKmpC/bVUQ
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=DaEnbPtW c=1 sm=1 tr=0 ts=69fe724e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=A1tEKnX2-cfyyskZ8tQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Dh7sEO8XJcwWopyCJOgonxPSrUi8d1rY
X-Proofpoint-ORIG-GUID: Dh7sEO8XJcwWopyCJOgonxPSrUi8d1rY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX98DTwd9AbS6B
 IAud+3DLrsyQH17DeW0srNKmWmSVOkyY62JPSU/IKY1n6gXIN28X1nuBaNiFxbu2DnHAXIhE0MM
 MetyEr9V+29jIsekzEvTYEixI95Phsiri8kLcRHxXwgnfkeYCXXv4yis8fWOz32c67F7i4y7oUp
 RxtkU4O1iLjkpo2pOJ1+bF8/KygL2eHdw36K0GYsMnHZJb9x24A+itQpi4WzyzalqlOph8CHgT2
 6eQVmLUYqeNytQaadRUCcOPJ1eMu1fBu4XPrePiesDIFxWIgCNIoWFe8Yv6Gr1r3AGyJ34zbUd0
 O/lvQKMX/JRn5Mwa13SQKgXZ4M4jJidtQACUV4sbSBsb26mAcC3r7WAj1aUeMWrvPGbO6hjq4QG
 E1mqquUZjI7Jgtp12whTNmaSOIdulBd8hXeIM3ZcaJGwTEO+cvrvi4cBY5o3wYn9s69guOvaHBL
 qyWQDArm2Xe3h1ZxlAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232

Hawi SoC bumps the HW version of QMP phy to v10 for USB and PCIe. Add
the new qserdes TX RX offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   | 47 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 2 files changed, 48 insertions(+)

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
index 3ac5af7cde6a..76ac72410d31 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -40,6 +40,7 @@
 #include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
 #include "phy-qcom-qmp-qserdes-com-v10.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 

-- 
2.34.1

