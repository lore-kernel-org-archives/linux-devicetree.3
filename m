Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1235E33F5A3
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819701; cv=none; b=hbbH1CEEa/9SVM/dijjPQM1nNIbJgKPLUa7yTZwO7ZlhIMJcg4WLNWlVIgZ9YIfLSUh7atqin0F4MENr8o7RZEeXRjPeC/AicihwrDFxwx0oFg2qy/c9gSuFGs1wCg0Nxa1EFDVGHiYVm5FmB4WUHAZ8Am06CHGALepsBr0sPr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819701; c=relaxed/simple;
	bh=dFT85cqKIaR32iyoAs7eXG0FDDwOYFazC07kVohix04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ar95eJhRx+r6oZY5mDNfAiXrDaKTBLgWMxFstmAX+yQce00buE6/09B0HoV722nm5WQLC5SxRXWuzSlPA9PcBu4cxRN79SeH10GbRPxzfGRgSx9E/UaXcGmeKXg9dEtNg/fZXYA2KKzRCN7vt9ydKZ8Eey3ArphSc/9Zl0d/a/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRLa80IH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pa22yAUR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRLa80IH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pa22yAUR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsWNX2987958
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJijQnlWqsHkKIVeWAmczh2CgPZv2ZSVNEf1/uQWmIE=; b=XRLa80IHYcoFf3fc
	0ALwoU6H62R6qu7u7+EWz4UiFHMXUOpZdvh4q2oteNgnHKBrkIjcZvLvBoGHYGd5
	h3aYDPTXBtcU6Os5fen1q1Ger83ow+x8bsfyoZLOWsdUmknD6S2msO6egVeGXWFg
	UDxAo67i8szWqaACFVxklgZdXELPWNXr4ApIgCJ1frLhqneqR509PxETtqq0GGD0
	y1YCMTvvAlRtS0Lvy8nznn3bBnpFZ2p6jbpq/gk8AJlUs+qJMLJQDfPuFMcWc7G2
	mE753YNLzaGmtMxA0BlWlDVrMM7ZGupcaFLsrIedUttjMST8YQPDNVGXss30j8f2
	oyoA9g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm20hfse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bfe262ef0so580412eec.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781819698; x=1782424498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJijQnlWqsHkKIVeWAmczh2CgPZv2ZSVNEf1/uQWmIE=;
        b=Pa22yAURSHaUKIwYg9CLeUcgH41rzAjSTGEjgpCMiOYsqu00Wao6nLQBJSsnvjMGSa
         TwQMtK52ePIPeiuGwi8fnqu5pKGdMCxXZy9lEAR+igaDEfuqSxD76B1foqYPaHewS0nY
         +vD8rZ42uG49KcnrbqjjI29UGSBSXIqoLDpvxwSF+1fELcK9e3kCOiRRGZ72briZ2fkV
         Rh3YLCgP6fjgm+CipWHsGo9RN6/e8Q6GoyjTWshetHTpKlmcb/mzwMfucE6MG/Dy3iVI
         teYf6YnnYk1II+KnwmpCMISTv42t97DfDpr1UjrUUhsaYi7c9CoCNPrX7+eTEbDk19wN
         /KQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819698; x=1782424498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hJijQnlWqsHkKIVeWAmczh2CgPZv2ZSVNEf1/uQWmIE=;
        b=Hk+wDPJFaDfVtIQB9y/yzU9Sngk2ZsiEF6620zgUwTeQsBqFGUQNhV2hFx3sXAPHIK
         0po1VI/KW1DlPElSQXK2OBVNVkG9fCa4nh7LUw1ce9VsUs/Kix4dXgeqqsIJuVRRDNJq
         04BamqmL0GS6sCgF6SWyZpibCQYvB54dLQqU5te1NsqcqtOYSYZlJBva28e89LHS7or3
         ABsozoQEuRiN2fh5trvlW7Xr92AXU1MCUhE6oxEiYFczuPzTvdYr4jWQOzxnYUqq783i
         fx1t1OHzFRi16pU6gFq5Pgx5UBSU14X6kkF3I4a2xXhMfmEEbEB7GOFgrxJF5nvnvOUk
         nBJA==
X-Forwarded-Encrypted: i=1; AFNElJ80MNY/8Ccjch1ev/l8P0oIx8tVIbsshD32pc6HLQ8eIJaQHk9R2KubngCCZGmvDK3ZwrNSK92LmWEi@vger.kernel.org
X-Gm-Message-State: AOJu0YzHROAeJ3GoYqiJjD4Np+T7Op1JLnJKwFpgVq6JykRK/1QrsQvJ
	X3LtYVEHS86pJ80BN77FlhoqNTiYUd7FHXHNbH+8J6LRBaMv4AoAyltWDk0KR4xli1/bWp7Pd8h
	leUJxyPHvCRNd3oZGFDs2NiyHyvRToTkS5Hz0QJR8ksAlLfhoR3J4YBFspaTJ88kS
X-Gm-Gg: AfdE7cnXTAXuycF2x1i4ATCVbHnLTsTf8lphJZMWFtD61u4FP5MZ4sE4kW9fqp24vot
	L90IJ4n4VfTrfm9atb3+KBSePVkEqfTOFYUm+ajWZHjqCPlsnfu6gX1iXnm5h5oJ7tcbVyAHbD7
	7xCVPf6WLyzGBjJcoTONhSAqRI7EfAZcj4X3v3HaZTEa9GkI8EuoZTUd53s/ZY/vDpY8asbBv3p
	eH0Ii+NHcbOBogmTIXxyFtFG9Tk7/t2nKUxvq/BqNkZieKx/berxaLwa+h3k4OR9a60ka3+7M+4
	zGRw5U01KV4Rf/Fzn/sKfgaIiOR4HhKbnWlWKK29JADLC3su31C3nSjJctQEJ4eOoW/st23/SWr
	YuIfbN1XoaM0eiqqNxh5GsW+12DHC2w8NzgcP17khSjWk+pyJ
X-Received: by 2002:a05:7300:eb14:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-30c0782e94bmr779411eec.3.1781819697947;
        Thu, 18 Jun 2026 14:54:57 -0700 (PDT)
X-Received: by 2002:a05:7300:eb14:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-30c0782e94bmr779394eec.3.1781819697339;
        Thu, 18 Jun 2026 14:54:57 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm619430eec.8.2026.06.18.14.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:54:56 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 21:54:37 +0000
Subject: [PATCH v3 2/4] phy: qcom-qmp: Add v10 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-hawi-phy-pcie-v3-2-3fa42ca45ea4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781819694; l=8539;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=dFT85cqKIaR32iyoAs7eXG0FDDwOYFazC07kVohix04=;
 b=ho1YhaHdxfIC3OpSbD6R1TSGu7AqVlcfHlCduhdhvPVJtmbQIQbozjNGqXO3iWbXdsb7TOomw
 Jeur0Gmv+iDCCJdwPD6VTgcfk6Do3EhM8dSudkf96JfsM61LZSWvRRr
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX8OyAbpMl7RTR
 p2aHy9pTC+Ts8VmXjB+dvp8yam4QEMoo130FBULnXRZc4unNQ0b2PAk1d36q9NtUhGX0PQaxoQ2
 QdcPGx9lnnTnHcTMmnLP9ZYo97pg2DvDdFB26PBX6urgRLQh9WBbpN5FV6eLUYZmStmh+CzDlDj
 2IKsbnma80pOY3GWILwfc64weKxCVTLg+L/KHAY2KiJJM8eIpoCLm47hODsN1lQzRlesSLKZsBF
 L17H13vqhJMNZ2DLeCzcHsl/+bLp6xnBEVNJAUsy7ZxzyvI7Ol9fkio1eitUeohzCUdO7e2/pSw
 essomp+te52sbCEy04NRr8y1qxgGSy43Oy2rZ6n9SCXb6D9oetZF+ZeHvAUcDARhOuG1frbMAeY
 TCoqjaX3JNsuiiU49gSe0ZVjiWNFrnxYG2F69W2PJg5renrskEgaswdWedz9pbJJR6/OYjU1BUe
 Gz7U9Y2VfHSLnWLX5Pg==
X-Authority-Analysis: v=2.4 cv=GKw41ONK c=1 sm=1 tr=0 ts=6a346933 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=n0CoORYsuzxYYYjHsOkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX/9XjWOWdL3FB
 TsyPPlOvprm214cjX5jNXHJ5mMsGKzDCI7Xp2llLCorXL3+bOUYetrxCxC8/Fc2Ytoc9cMnU5Ve
 1cw7xgmmikKhj82X4n7h+leqdxnUk1w=
X-Proofpoint-GUID: O29hxqfD0WJB1R2znHl1mPMafc5WzMcj
X-Proofpoint-ORIG-GUID: O29hxqfD0WJB1R2znHl1mPMafc5WzMcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200

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
index fed2fc9bb311..ba17e53d000f 100644
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
index a873bdd7bffe..7af77572970e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -39,6 +39,9 @@
 #include "phy-qcom-qmp-qserdes-txrx-v8.h"
 #include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
+#include "phy-qcom-qmp-qserdes-com-v10.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"
@@ -65,6 +68,8 @@
 
 #include "phy-qcom-qmp-pcs-v8_50.h"
 
+#include "phy-qcom-qmp-pcs-v10.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1

