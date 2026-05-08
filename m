Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789C6363090
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283089; cv=none; b=G0m+7iyOfNVcrQlst/6/R74vd1Hu0PkCCLXrITCbgX3wMEyB4HB6SLrZiNY6bxy8g22KSTE+RJsCe1UYOI5Mw/YTKl+IKLCUrePVABiuY9UrKb5yGmdJFXdFCSr3I0EnXvPPp+SX1XS/2iBWPCRTjQ0stSxTrylr9bcZS/KOzFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283089; c=relaxed/simple;
	bh=mETc0jlTLmI462gvqIk7CFJGzUvc8N7VZDu2GYCH5bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6NGYhl74FS0Nq43XOG2ucH0rR2jIH/vdsJK+GmXj9pmL/7oZKsBGM1Sfo0nDruRsXv+TEvfk59pqnj8Ey1aSYIWn3R2Oz2nH6gKiNgp7neU1SO3NNMU4lBJgqhJfiTSeudQLOmEbP/TsPgAGWmNn4IkyytWrmNY6DXzK9adz68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bctKZUFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbbE4RKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bctKZUFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbbE4RKD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648HelQu1662658
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 23:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Venx6RUzjC9wNNihizVrtl+8Lnx8Pg3T1wsMj8jld8A=; b=bctKZUFfl0+5FwOe
	8FF5mrcEf65PDXJnOwmzeY2SPTTQ0yBrQTrmAQlKk3rBs75KqvQKNO/Us3R1ZYFZ
	9QuHg1caQWqfveagezvQPHKPmcG5yMWVli60F6Cn+Yk+54kj4a9AEBLOMvu+7jC4
	lgibTQuF5iuys7k6ocKUgQ3E2yhtYz2bf9zZLbfw2SLyFbw60bMVThm0cBmrbqmE
	4uJ40XVJAETLcX24E5fR33LhOkCnJrBrrMQfYiEC/AZonXnOTZNMt8w1H8Yr8CSP
	EKrpOIGYy3ucCcS62wusj79HnEPTpj9easejS8+SFgzZoLgpQROw3z+618/JM9sJ
	Jr/XtA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1men0xvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 23:31:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2cc75e79b97so208809eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283085; x=1778887885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Venx6RUzjC9wNNihizVrtl+8Lnx8Pg3T1wsMj8jld8A=;
        b=HbbE4RKDaRz6/Jyq3b+kRNfocTzQv/TW8c+4kH57lXO8UbfML4XLT6EPCWb5BF7G9N
         oRAg2P7rxQgs3G732Ekq4IVlRs2+I6pF8CZeN1J5MF1spDzXVF6S3XyWx/lJ/Q4pxsrM
         HBEowUheQ/KgRZ5pdBK8hG4IL0KCRv0EXDjZTcF8UYv7xBV65kdx/mfgeVC3Fu6y2Opl
         /Rk8SjN/N6U+KCJVABTmhxP8s0e3biTkrRI4FQDDLVMOuwbJBN/S01M0EqFwmIt592IK
         yYgZX1Y8JaknoJGLMuNKKlD5QSv+QELtTGeKYsHzWntdzRKSqXIDFkab98LU7PHKDk5Q
         5A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283085; x=1778887885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Venx6RUzjC9wNNihizVrtl+8Lnx8Pg3T1wsMj8jld8A=;
        b=AXGnNm8qJXsjKN59kKvdm9jvseaOZ6vczS3XTI96qAqPjFRa84n5N961Y+oXUUR7q0
         WuLMbH/uemRWtRLOPNfDb9cmUgFc+sSontujmvKT0foJmPsmFIVetR1DQ3GfA6Lfdxgq
         zVPeNk/CJgqZ4xXYV4KXOhqOa4GuVPgq2Y/2YTXg7TG1PBFvgRPrpW61bnXjwxO3OdEo
         m3b7QvmL3mVa9BEUlMUhHMaTSIQbrUlKBd4aNcwE2Mn1bfgtcValTfW+4jmtk2czIS7l
         XxGn97TyYxdDDYZWD5g9jBNuthjujgtgmmSggbCpFpZ/9XpF2+7+SNTBEPiQuRX852AM
         DOdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Mq60ctjL2sbixbfhptXOgxCxRjLiJ/x6bB5ccjtH1fj2f/epXKmESZvh0fB691bp+7LNC+HaESvZM@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8Us2SmmtINa6CSyHWRV9dH1Gjpr4gXDpRc1PwJMsc4R8qX+k
	B3ykF0tKCF3zX6REALsDZ8tFZehF57z4G8SfDPZPgn7tktnYDpxHsx/cFTmqkaSvs4oT6vX/mxs
	IATQkp0JQ6py0zBD9+P5n1ajSOQVCp7HE+vdKUQ+wbR1cv7nWaOKj0yktDLgZVn4l
X-Gm-Gg: Acq92OFZ+/pzKVrHHWImHTTr9qB58TVoJEE5d63B/8Bu3CUczC7J6+v1XiEJBpZ5/qb
	oR8+9Lc5mJD05m8UfEfdzy3dygM7HWfTpaE3Rhmy2OYnpM/UnDX1marQQcC3qUAMjxVwtmoo9xq
	YM88l1nBZHmf69W3aTzab+ulFTWTd0Hg1a2KQBBQ4m++t55wTVu9nnbMd0aJImT6i6Vlu+AcYx3
	hRFUI+YvgXfw0iIlEom85AAqIT9+Ru459R2mmv4iszD6C+rpMQxWj3hEbGktQ8HL7h8YUqeCGVt
	QKuj/nL07MIszacFE+tyb4nZfaLbbtUHz6UElqp/feDT+jJfcZ9OITEcn1FBrGQaznimh/InQas
	WjnaHSoQbfzUUVrC4avYeJiuep1oJl1HukQNoZ97GE5vtqtbpZ1gnPRIgHt0=
X-Received: by 2002:a05:7300:a987:b0:2f2:8857:1804 with SMTP id 5a478bee46e88-2f54b35fffdmr7390224eec.9.1778283085347;
        Fri, 08 May 2026 16:31:25 -0700 (PDT)
X-Received: by 2002:a05:7300:a987:b0:2f2:8857:1804 with SMTP id 5a478bee46e88-2f54b35fffdmr7390199eec.9.1778283084840;
        Fri, 08 May 2026 16:31:24 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:24 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:17 +0000
Subject: [PATCH 02/10] phy: qcom-qmp: qserdes-com: Add v10 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-2-237b894353fc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=3231;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=mETc0jlTLmI462gvqIk7CFJGzUvc8N7VZDu2GYCH5bo=;
 b=v5DlRytjlARifsmpU+0dJhbC+fvglCoGZZe8O/SeNIVZ9AHNC9kapnpc0TafHv86LhYiamYAr
 sSSOztczabKC07IZ7091Sh2O7+gsKeIAF/VGIb87F1uXqU1TvxgLxx6
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfXx91Kny0KQVTB
 vlJxRZPrDJraaZoH0haqGwGlniOUze3tevf9iedqYUsnS3FXrnEAuSHRFF9G21YKLbj6LzdMieP
 A476CXlD/8OXnF0NSorXTzHy2dPqR5Oe5j1aU4rFRtTwLVlZuBBEsL38wiyS/kv1gzXn1eURH/M
 kN1t0QDlaHnpJ8mrRRIiArXaIPJDA+uOC1huSYXTX1iZBdHvQKwtY3Pt+Sx0cSrFbZGLd2L4cbU
 Ev7/JFr14ZgoBlEUTamkNi7ximGbEzeDs0S3i38Wx3m8KplxAc8f57sTAPS+hlOmezfeoVkia8z
 hgARiLpFuE6biSMkYuInf8o4xZCpZ4iy3x1Ix0tMXxRUDu45N2VaOI7v4fJMm2wO3qDT+229CHs
 XRTp6MLUA/xwKbDJ+wQrlNUqqDaPbHXGC3FAmfWF2e3yWcccbxBXtLcrOc3Z9XYm3GHkQ06+oV/
 OyEA9uElq1cDc7g1Fkg==
X-Authority-Analysis: v=2.4 cv=LORWhpW9 c=1 sm=1 tr=0 ts=69fe724e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MN0C-abDVP1yrleAEAUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: qIbmQP0_yhPH5j5MfC89DLcMp9OQqfB5
X-Proofpoint-GUID: qIbmQP0_yhPH5j5MfC89DLcMp9OQqfB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232

Hawi SoC uses v10 register definitions for PCIe Gen3 x2. Add the new
QSERDES-COM offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    | 49 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  2 +
 2 files changed, 51 insertions(+)

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
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index a873bdd7bffe..3ac5af7cde6a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -39,6 +39,8 @@
 #include "phy-qcom-qmp-qserdes-txrx-v8.h"
 #include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
+#include "phy-qcom-qmp-qserdes-com-v10.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"

-- 
2.34.1

