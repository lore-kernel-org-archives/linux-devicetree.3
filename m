Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662E3224234
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283089; cv=none; b=cEEekq86GrAwME1jZewUtawfiBvmSj/QltNauaAyZP4w2B3hLrptghcfyLza3NdcmsqEgMhXIH1u06c3tO1D4tqOmskv51Q10DsWUir6uOBe29M+vZOu/MiVKPqlxSCUjZDB4DuNUP3gppfTmHFl7tW4EH/BLFU3gLKkrg4bjB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283089; c=relaxed/simple;
	bh=cIrdj8/8qr+RDIhnZn+O7Cu+D6iGtXuFpw2ZdlFjXfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIl3WGQLyXgth/1/qQTckvAN5hFYRqC1bIx3+DSZnLiKPdOW6lL0cDKbeTiakOs9cyfP94lXRsMCJ9jrPOAZ8XvvmLLN9j89fP4v6A4wwhaZqX4UMTaDCYSGNUkoDUJy93iYrfVbDELQbhXiETkFzg/OjkjI+P3sotaFUsLvLII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROPJ/LjC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePFF6o6H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROPJ/LjC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePFF6o6H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GWevF2336315
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 23:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=; b=ROPJ/LjCIc1DR3eZ
	v1WNL9kdHP5iNDEDcHBm1qIGwEe19cdwPtdEgvleGl2iK+fLIPPuvq/ZysX+hIct
	7o/7ux6OXmfEvIzg/9Xlpd2xkHAKpmHYIQPeUQPHsCRzNYEyphET4Ly+lmuKuHi4
	t4j0ieGhHjnpN2wKx7JEB+x+uh1y/3p72ukGSkNlQQAFEUn+uH0H6ChxTxBnA6c6
	yOU5N5ORLiCJpvtLVB6MGkRNhVXkvrVZkaKG762zMqvNIyVU40XDwFRFsm5T0L5B
	XVGyZtnPFZ5YqK4PME+w56TFQ+xY3OQ0nh1k6MkVkmdmuh8yApinxKHIx5+OU2qP
	IaiguA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1keh96fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 23:31:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f525565b33so3354359eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283087; x=1778887887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=;
        b=ePFF6o6HO6pz0QsKRmJtCDEdDH2PwGvY3YgtcA7xsp2B0wJd0Tpo5+cKxQobSi8zLc
         6uDb/d/eowZjL2OBT5qH1XnXgI3SBT2oY4BKqLWkVnJC0h1F+0MWP8rk7CoN/bcTmXZv
         ArX9QpZ0CyD4X34AxxXoew4p9ZxR1Xy7jla+nTZk0FXASSIANQf45xMdqjF3P26VEBgd
         mbMYeJJ+iafD31B6cPzITjYvnIdpb6HMDzMcwx+nKCaxnEACjFVpoYVioOyomMv5D1DI
         /XItinPKu4u6ZmTzn3/71vhrdpbxQJnnN6ghG4WIhnF5AcgMxiBfo63GlQTQjA6ELgmT
         hfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283087; x=1778887887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=;
        b=J8/N0ZQsUXJSF6+Dscm+HUT01zchHipVawPSE+bUEjkTS6c9SH+NCioGpKsx5pn+9a
         QYGgdQaw/qIKdJbBqoBW//zo404F2o//ZAUUXwndQTNAx1KSoePtrKFz40J4+NJMIgHS
         jNxgZ8+N4lyuzPzDYzt7Hp97un8A3iDJM9jKAqu4PIo4PZRGvFHxJKrxLSKsLAn8vEhY
         SLixs09+J/yrBcZDrGRp+v73JnDD8/umkEtlQ4kgbCqJ0arwIvTSC8rhaGbbMK38Fc26
         +Heeun93+yeezH/GmqjRfp+y+8SimJKOrDnH6ATl6CZHPiqBwgJZ5gyWovL/xUXo6kcW
         XL3Q==
X-Forwarded-Encrypted: i=1; AFNElJ88fX+EeSCp/G58E8bLFSpoqLj2DjELxjLShC3UCndRhAJnzVnGsV2Pb0zVOeNHd3+gRIoA75hVLwcu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy85comhxlNWyt7H/mfT/Ni+s0++Dh680at0YPbkGeAQEOoR2Bz
	f0GVdAgdst3SQf96OdDC6IwuiS21QWOPqLJOqMZGlhE8r4y6Ycya239sTqu8YN2mFcI5n/5vXtF
	v1cprwF7iDTLkMiaAH0Gp09yv9FRVONp6TEzNS98kUH3RhRThwxYzUZvI9yjI78Q/PbP+FitZ
X-Gm-Gg: Acq92OEh9fbRxwqToZUdotm8XZ8YY9vnP/RN+mBmozjiafpolAKKNv/QGhgjjluQo4J
	eDWueCc/Upy2uMP/rjBRshRvkr6Nz/UZfYN86Ui1ZGqCUeU4snZ2DVe0jUKTsufRNnMwsAY7Nfi
	TZc3w+nnek+Mdbjqc3zlyx8e7yG23RmcyxUmdMLS2eHxDgfaszvy4FAnCo54S1ombJGoCPUFQE+
	6xG1Fne5r/OZptUs0Gq+vNzygo8mvB3CQnTQXiGAsKZg2q9bq0prQcsuT3wWQjUMmDAvmYyMw73
	8aIHJVwgJCcEYWl7J46dF0G2DKPBZ60ixG7qyXiOMHjir+Uo8Eo2Bp/LFc7N0cjg8lzq2zrtA97
	HivtwkCikweP5k6uWz/4kDeeO8nMWu5tL2PBCtvKAdiu7XfFzftg755QeLWA=
X-Received: by 2002:a05:7300:a984:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-2f55034e59emr6633382eec.23.1778283086841;
        Fri, 08 May 2026 16:31:26 -0700 (PDT)
X-Received: by 2002:a05:7300:a984:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-2f55034e59emr6633361eec.23.1778283086298;
        Fri, 08 May 2026 16:31:26 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:25 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:19 +0000
Subject: [PATCH 04/10] phy: qcom-qmp: pcs: Add v10 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-4-237b894353fc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=1794;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=cIrdj8/8qr+RDIhnZn+O7Cu+D6iGtXuFpw2ZdlFjXfY=;
 b=DZrp6nGndGGIUXZ2z75/ZcS2WjopRR3r0Xsvb3cmS+jabNrLAgCtaAcPUoKLvM8PWYZ55UtWB
 yB2Kp5XKO8sBIaBPBHWVWreIFMhtj3iU6kJtEvXIcuMNmDCFXGW6/Hp
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=CJIamxrD c=1 sm=1 tr=0 ts=69fe724f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TapfYG-AjLmxlko4O74A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 0_kDvzqFon3Pq5I4Au703DFhakX_IWOW
X-Proofpoint-ORIG-GUID: 0_kDvzqFon3Pq5I4Au703DFhakX_IWOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX7dB9AHLtv8hJ
 xopUk9TcwIxHzJ+ZYgUAtnQuYr9kH6QJOsbAlfShuauDK3utgsNnUHCqkme1gOw2ciqxVxXiCAw
 x36FSEjUOz0kwBJ2Z+omYkdHI8R9ZcHvU9D/BpEUNgkWlUfYsjsLXMnACmNbOj+h5De4hxP/oox
 GvfxUClE340s2enSSmo1TqeV0z2baqPPhB6TFGCCVBZbKD6LpRpcrLLIS4ep+WX3VrJwAuZ82lE
 UFblucma9VAER9S1zY1x4ahnazMh9uh8AoiYTtTQpcNMKtaAIBnLUCFouQ849psW/hwNFljSKHL
 gZRCEBjutUQhjyON2lWTcJhF5jfO4tkzGYkaxVJ1yy+OCnUmKC03+FD2K8mBpg7pDJqRMMdtCY5
 /uxhZSOHmuS5Wx53j7JkeK++Zy1497ncrBkmwJmojV/nltqkxxSVohwWNKziYa072Rl7wJx5Bs9
 xt59+uwMopWvAIE8Big==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080232

Hawi SoC bumps up the HW version of QMP phy to v10 for PCIe Gen3 x2.
Add the new PCS offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h | 22 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h         |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
new file mode 100644
index 000000000000..6faca6d8736a
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
+/* Only for QMP V10 PHY - USB/PCIe PCS registers */
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
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 76ac72410d31..7af77572970e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -68,6 +68,8 @@
 
 #include "phy-qcom-qmp-pcs-v8_50.h"
 
+#include "phy-qcom-qmp-pcs-v10.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1

