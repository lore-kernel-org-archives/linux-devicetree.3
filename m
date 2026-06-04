Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654382773D3
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536820; cv=none; b=Oj/edsOAKhTX5g/2mIdu5vIvXz6e1p6iDr/fUsaJLzOcKRTIfmW0KpEp53zC3GI4H+zfUR2Omf9BqO8hdybGKYQCaYPav3dOHelMptq6likwDb56cU68PcUMuvHTpTjgp9/KTC8QM6MrrUPrlyygmUP++Mzy8nxyKc46VAUGphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536820; c=relaxed/simple;
	bh=F00WY5r3KpYlfjir5reJlgcKGKiWQ/l5Y3iLOGo4EiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+FZ2JUTWVPP3kro9oX2Scqh48DPUWfEQ3oyLc3VRwdlTS2ToJAksgMUAk05nsDTu3R65bVxReq+bTNbpy8R6EKa/FcP0mIYu2R2nQp5k1ETuTC6sEhbxCUmhF9CB1gg/WnJmo865F3xOVGer/iKorQcc3TzfPpnNQUFLsz7CyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oc7AI92g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgZIvTU2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oc7AI92g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgZIvTU2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65418vce140669
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxm1AY+eckklG1rGatwU6/63VjnztNUWWzVUPAAutqc=; b=oc7AI92gbY/ynkuY
	a2tWAIOtzQWFH8Aw8LPN2IBQ5cRjUj8LV3WXrLvd1fCZP7Z/AAoR/l/8X3L73P86
	OyywFlwJg76aCmIvelIhhvwmm7Nqqy0x87FGCjLITryoaIDCwxIjK5oTYPvsqPnW
	MPzI9iJ8mfKh+zhf/YklhIEJrN2Rz/ItjN3j86S2TlkW+77A52Vc3nG286RwoIop
	1hXEYCscUf+IhDD7MaT1SDcLLCs6a+l20S5IqzocobCHgUp520gqNfhlp/VakKL5
	iTqCwjIYM16vtYr5XSQxTmkprPyXR+7wEsDyItl/od1oOPj/ULUmufogNW+yZKeu
	cg2DEA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen822h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137eff27f36so146809c88.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536816; x=1781141616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxm1AY+eckklG1rGatwU6/63VjnztNUWWzVUPAAutqc=;
        b=VgZIvTU28s9FMX+NLWEl0Qoc88xI6Y20ff7BV3txvxtoqY+VID/PN4wx9+wejApXH1
         yMpSsR5e7c4P5YBraMNULpCJGvJIY2MLOvafYG3S3rcdY2DOTUmVTicROst6Q6QhZggB
         TLtls32X1vin6UgRCDv+pnK79Iuzh4/RcKdKo1rUx0x9FQu5eYDfz+KMmug3OoDqvZe2
         gOOZOSu9R3Hch1rqrHrb72nzTPXfHCNldHlu77S/VqeqkRR488jSwlVTS3AmmM7gFjGt
         94oz71D0a56yew5F7GoKQKg+WkqUFkww2HTLXrZ2JaAcMPQByrrRLERVsLop03rzkA29
         XVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536816; x=1781141616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxm1AY+eckklG1rGatwU6/63VjnztNUWWzVUPAAutqc=;
        b=Q1KgYuy/AqYTMsLUjnI1BuhlyIY/xZ4kaN8X8fEItn79q/09VwC9DyAUvuTbGtB31p
         0zRGXBLjmNsIKTDSisXQlLuG0Lw4LLH90r7l3qOqp774xlggWGmg1W3Zn/6y39wT6q34
         BpoqGNU5LXOad2QjEgfzRkRusaAhPaBLYtneZ7DaBv2IcKrvwpgIYKP31iHHpjR7EtMT
         xbi8FSme/JRcY/W6FlGwGBNjBXHfr7Eu7FJUgvi5T66hPQ9ZpxEjQYH91UmJRAq36d0f
         6H4562zY4/4sTqums9FTd/RkhWpuoqm5TyMUQmlox8RQsQ1kfHnjPGs36oyJZpMAnhUI
         D7oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8yrK8U/AbY5Ovl3/Pa7RvNrmnnXREEAQsvp/T7hFOW9nQMRmxODTfSwXHs+ZTa5SQka6VMRc3v8o7@vger.kernel.org
X-Gm-Message-State: AOJu0YxlgtXjASHDdbMTqNmoAnm2oQjTP+lVfmgr231E/l9DVXrePzSX
	EyoTnDLFukukEwZ62fwdMVNT+ZY4/od9+5S3TsvnGHQ0Cs5H96tCZQKH9fCo25hpz4W9/Av8saW
	P0PLlGF1zgRaJCVv9gi3AKbxDBSj5tVpfz7C4r4LG4RHE0u3XDiySlzGMGZ3Ax2RvpcMvDJBt
X-Gm-Gg: Acq92OG9RCZtsRSBrgAF3GLml0D7+iWnwgu88dyDukpyhmeJGj7/vJTxxVJIKRZXBL5
	sfrHqHUWaJtZL2R0qvi1UrgL4gNlWXxhdt6LmfZWPEVhweXAFsRHF0wx45IoaxveM/1dgpxl4vU
	43dA1X5yToCy8SxPyBuDOrnO/EtaUB/nnKTY8fVMJb6SUfCfB8alGtJloflbOg5f2PIp0HGbLOK
	jjAuT03LiIWGpRMOAtCyZ7Su5NQnen+zzMvBySoZ2NbI8eXBBhTzpDaOfUGEEX5ikgcUw+HBUSm
	xW3414Htdq/M+ltILz5R9eUNhEhX+WjU3KYlOWd9TimkPHXh0+paOPRZPhYuMOD27sx8BYGA+we
	hjcHalhWqXp+G2SU99mP+gjQG3nAHeghEW4H2Ao3YCyPp3yHBEOkXhyRLQ8UHB2ICQ5xUWQ==
X-Received: by 2002:a05:7022:684:b0:136:e639:9c05 with SMTP id a92af1059eb24-137f6c2f5d4mr2946190c88.31.1780536816458;
        Wed, 03 Jun 2026 18:33:36 -0700 (PDT)
X-Received: by 2002:a05:7022:684:b0:136:e639:9c05 with SMTP id a92af1059eb24-137f6c2f5d4mr2946175c88.31.1780536815953;
        Wed, 03 Jun 2026 18:33:35 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:35 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:33:03 +0000
Subject: [PATCH v2 09/10] phy: qcom-qmp: pcs-pcie: Add v10.60 register
 offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-9-be908d3560db@oss.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
In-Reply-To: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=2258;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=F00WY5r3KpYlfjir5reJlgcKGKiWQ/l5Y3iLOGo4EiY=;
 b=9k9W1PbNAjQCFOz1jM9h88Z49vdjzddVAvYJrHWcjCPTa+RtCtE5TRBw+dR7XgbiegtN0XSJo
 8k739u9GzfnAn2ovtmbmsR69fWTwLxUERUUB0Fn+nX7Y15hsM+7bCg6
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a20d5f1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YnN_nBVA4yaojiBpU0IA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: BfEo2zmdx_Z-1iWJEppsKbdPymSJ-gPT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX77RXknNQI3hJ
 pJAGRz6olRiO7n2v5eMiooYP8UfyQMHezt5KRjOIw0ofHwh+d6JFj82Y6nK7i/SKBlI7UIzZBJq
 nqkW/K9VBvxoi9ADjD2AatZ4Jus1niRSlFZLR9UhCO8bzNVihEFXYZlUgJH0wUVB7EULVHnCMKY
 QWiNArBwYZiuiKEHx7RxJXOtSCzPJYf4SPgthCWdfrlgnl6PyS8UZGazeEyaWLzz9B6EU84QSI/
 m3LvGRXS0pjWtLwCGLcZj1t+QuDMTdVoFbh7EReFH/3PGn2CCV/nTd20/P2o46LOToglxd1t4Bd
 LBcLlGqdEu12Lt54U7kvgF2+vuPB3QEE8F+knePFKdmMRu/YmOz+pA6QX8zr9eht6qgMhPOVFkc
 5a5wrTYRWdVrvyEvRyHKyhzvGDZUS1MptxXXzD1T0cSUR1RFMrcB2J/AG8FN3yGDwp4n4IdNpoc
 3fFu/i0fVoDexy/aBfg==
X-Proofpoint-GUID: BfEo2zmdx_Z-1iWJEppsKbdPymSJ-gPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040012

Hawi SoC uses QMP phy with version v10.60 for PCIe Gen4 x1. Add the new
PCS PCIe specific offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  1 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

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

-- 
2.34.1

