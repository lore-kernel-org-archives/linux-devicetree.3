Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2793659E8
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283093; cv=none; b=S7R0im2Di8V0LZHuPf5q6CEp1E8VpKcASiexx3o7eg5sA/DQ4bOJ5Cpc5F3prJxxXgtidcR0C5NTSFZnvX/VtJblSRY9bA9ZXwVMFOsNCza6LfgGIsYPPy5w2fRQgw55n/7dKW5kfocb/nbiztjlJa5EldOnbKh/09RcPpQxzc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283093; c=relaxed/simple;
	bh=l+CJCriIHCqSTKfqB3yNlnKfu4zi16GuU5MaRzEG1I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Asc0qSb/3QVm1F4mT/VM9isJ+Y+1eNJ2wLetJ+652suKFjeuUqnoktyU0ZYhHZ2BsJXPgAYRCR9PiBhSpDvTY6sfQE7CfzZ9kRo+rac8HG1VWPcMIncdMom5sRS5DhSH2PH/LVzL9Hn55GZRcNu1C29qkghRSVh0TVlUI8LMevQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2HsJQUV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9XtQnYG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2HsJQUV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9XtQnYG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648HelQv1662658
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 23:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=; b=U2HsJQUVcvNL/6ve
	2Yr8rAZ3bxsPjYRnRlfHXCIZtuy2v5LMtU7Fo893QQY1XcPvYW3zH3d3qLsrm8Ee
	jatSjk57aLf88dWoHhKnd3Wg8Z7Eh0iVRq6qcvxFUMILDRhpRPY85K4cbpxwfR+m
	h6J2fN/XW/nXzPD3LBHzQhBSRdyz3IUunaWtyLlOS34pfJ760gcSE25BPvkXQnqE
	QjJqmqdWjpAo2MpDYXsNfBVrFee6Edr5rYwOI8Q9uSbR6CYn3MZCYuYtBnJ8T2D/
	qz0PGhKYM8VdwtABAMv4cgY9w/WXcyD7p4q+PJf92GXDnOX8u4HPH06kW/xWMjmM
	YFo7OQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1men0xvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 23:31:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f525565b33so3354371eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283089; x=1778887889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=;
        b=c9XtQnYG/RCB4qzAgtId458aidbmGtzaRcq5y/mhHx2AlHhVVE830U/t88cCLa/7F1
         moIXAJ2iBSthAStbS5QO8A/pIMXWXAFAKPE2prvAWZUFOXvlOe7HyyNMMrRZZq0CIvoM
         OED59b7kvnAHWDtVA6tKsyQEHYPAIfFxHXXRvsR81rnSZ7FPcD1nXzXXhtTAAbOSfLll
         lJWeJZ6WUWF8Sry6cngPJnE05VL2h4kkJF/YqI9OaqnEL0SvLVo2YOTXeHCZGKER8Flk
         JfpXskW2HaxkEpfbL0OXxrM9NS720ADIY1pHydIDK2tpmRaYTh0oZeyW3hdsPku3ufFa
         t79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283089; x=1778887889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=;
        b=JFD9XkDfYNLpSC3LX8LrCY7VlXxmwAqcrbZHx8EuAx8l7He+baIxRE72jH6E3BhlqG
         DRYJRBDqvK8E1z6YmRN+8YmayXjVqTGQXUrkXx1Iw3DaBrW2tE5Ds45ukTKlNlwPviWy
         /ws5QhZhZGozJNACVBT0zveWAR/3KI+C3Xdh2r0ufV4gW2S85DQ8pbPYJrGZ0Ti4kLb0
         4Stc5ShIt5la8ko780VAYrwWL5rZksMe9p+gTWVLQnEVfnHnRSs2iyA80t1twCP0gUIx
         qMspPytsi5PTE66GEe5+WoysF6DrYk1zqr7rL7PgxLX1QW6g5NWTva9Serjy14OwTCVC
         zjzA==
X-Forwarded-Encrypted: i=1; AFNElJ+iGU3ntSoHc6BOQ0bSoPMR8ArTwgnAUAZAoyprN1OufRQcaIoOkiWEys6UFKX9ioO4RT7kByzgES55@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsh7w7ZSuxjTicU1bS2XJed5vlmP5lBH/w5L5kTHTXnZMROVyl
	G0qTEExM1k/zsBiDVCZnK1bptSp/wGAAvg+wY5S+maY0TTFSGaXpxJRLWM18No0FsWYbMir0AL4
	19nUqHNC3xpmEdAR3PU2v9sgBUrSEtqWKt92Vs3mnKnwAzhMhc9+nUGLic+mzMaqv
X-Gm-Gg: Acq92OHQwLndRJ0rywdkHBsTpzCKR89g4KMO4uhph3r6MH3wLeGMEpJCn1N/SxGpDvP
	xFF4PGRJVC4G06yLlj0qG8uHDIluGHfxE9CR0zAbNXAuzqwkGu3OFosvGmNBgpa84FxcKUkv8Df
	MYB1lDcp5lDV0BLa/m6NAWAe2p76m6OVXC5QUWgVw9vczBsWjaUJgX/oSkI+uKjHYj6zbR+QC6V
	cpYY1kdP1QKVlyL/BfK55E++8H5wiyDH3teNXLykGVEtVqTglBaCQNQubL7XUPXTO6mLmC3D2hS
	iMrVpYc4qM7a07fUatnbXttraiJq0cA+PzyFN7ShQmMJNhdkdU+RVvN9X0gVApQnfBxOWFDtEu6
	cKi4+QFm9cMI58E9u3Y7uoYBx+8qDeeNrrcNMsjYO09d1tRkRnyFid5FTnfo=
X-Received: by 2002:a05:7300:72c8:b0:2f5:23fb:9aac with SMTP id 5a478bee46e88-2f550b4320amr7478839eec.31.1778283088951;
        Fri, 08 May 2026 16:31:28 -0700 (PDT)
X-Received: by 2002:a05:7300:72c8:b0:2f5:23fb:9aac with SMTP id 5a478bee46e88-2f550b4320amr7478799eec.31.1778283087845;
        Fri, 08 May 2026 16:31:27 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:27 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:21 +0000
Subject: [PATCH 06/10] phy: qcom-qmp: qserdes-com: Add v10.60 register
 offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-6-237b894353fc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=3662;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=l+CJCriIHCqSTKfqB3yNlnKfu4zi16GuU5MaRzEG1I0=;
 b=SQPGvg0Vr7HJhUFr2y1XzSHCV/4M0ZuKpm/xAp2rbdav4FYRezMMGfW6djNo9UDc6Q1udRlzM
 wBb7DPMmy8sAgTTaPdTZx8UOt9oAOCceVxbT6skE1QgVtk14BXGR+ap
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX6DfECkXlY+/X
 uw2JJmtt9figOEHUy2pEjfOrMPQnHYcIkdAeHYBOm0Bl4WicjsJEnH8wd5J6LI5z47yupS9/tgx
 lWYBvsEnGBE/mdFobpl7+/17sZ2TnVjEIedZY8Y7024rwmyRUUJxwgBb2KgsWc8z8ol5JgMaT87
 /eSULnljn6LsenzszyR3mt9QSit3SzeyETC56ncC9zmWbpDu54NJZw1ui/LR7Y/7z4gH/Hjxw50
 fm56LwrvXLQun83UONJkkNgImW8omdPLUp9AsG5/fryS1bN25Lg1WnNAhPCwyaawzCjUdC80eka
 UhDpqP2/IeCRm7zxUPQ/6i1lInr5dnoo7YjGSXUSO1zGZeeC//dgyiv1QbhtT5peyjuntNLP+OA
 2ttR7BMBdXIpK5m83+vOSQVI78HYSzDafAVyc+S/feOpc9DC6UmLxfh2lixOBTy5T7wf9mTP7C1
 jW8JY8eCIOd85BIIOiQ==
X-Authority-Analysis: v=2.4 cv=LORWhpW9 c=1 sm=1 tr=0 ts=69fe7251 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MN0C-abDVP1yrleAEAUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: BrTQMrieo3zUPKrsfs-jtPosDPHx6_19
X-Proofpoint-GUID: BrTQMrieo3zUPKrsfs-jtPosDPHx6_19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232

Hawi SoC uses v10.60 register definitions for PCIe Gen4 x1. Add the new
QSERDES-COM offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h | 55 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  2 +
 2 files changed, 57 insertions(+)

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
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 7af77572970e..85da2581ef90 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -42,6 +42,8 @@
 #include "phy-qcom-qmp-qserdes-com-v10.h"
 #include "phy-qcom-qmp-qserdes-txrx-v10.h"
 
+#include "phy-qcom-qmp-qserdes-com-v10_60.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"

-- 
2.34.1

