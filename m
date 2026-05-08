Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECC2366DA4
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283094; cv=none; b=Z+ahlX4YlXwOIY9LCENpcdjRjbWmBcQ4yMvM5pSgBAqyX2qAbPMVZs/JJBJHA6PO6aVmorABgDHTPNfQxHC7ngCHFnNxbGNWIOyqwRhddH5kpMiljbgnO+m7gRABSlWvEDyHtV/KMEJnQ3VdNUfIhfo9Y6X5R6WTsV8BUM7xvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283094; c=relaxed/simple;
	bh=wMHU3nK1VVHDCcTUl8O7/aLbjFc69oBh4Oult/TQmuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFBcO2nHlmMdxbikMQJOUY6lDoOXcBN+n+wxWfjF9oUT5JmnFAaQ6oJ/fREXGWAfc0OO3wNVj5ZOb0QReXh6M+4L9hVA6nxLSj7zeuksVeoCUFOugq/cU09z+PLxcw/qtJSUGv6X9CyAEBYaB/8rxdD9iCSrXcOBl4EusDa/rMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieC100vV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQkIoAhn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieC100vV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQkIoAhn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648HU5Ji2515481
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 23:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Jwq4UTLu8GMYR6Kz5tygrHUgfDSbc+Ycn5uxVJf+w4=; b=ieC100vVZUxzDJgS
	cey/DAr9bVWpAizP+6VCR1rM+6LHiClNFtHvGF8GcWgCPWn/QIqdmwhAdOrrbHA7
	mNvVs0vKNKxR66YUvwiK7zqfpz2+RyHLAUKt30zhpeAHPYcHiQjiYn+7VGpih/OT
	wpJMiWzRclAy+xplg28v0L5J9+HQl/SPWCaeH8eIrRy0XnWuMVf4CnNTe15OJDGX
	TNp7JrxLCW2Rs+7us53fefj3cVDYPwRup/ATEge0CgSPIE7quB+z3YDUY07hxALP
	2sQI+0boQxn8sSQATG4URjTXQokq07X9rXKkCI7u6bLBcRhWYD0Foz2eAEQUjXnN
	JgFfng==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1m9nryy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 23:31:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so4241951eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283091; x=1778887891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jwq4UTLu8GMYR6Kz5tygrHUgfDSbc+Ycn5uxVJf+w4=;
        b=FQkIoAhnVh/B089sPPlQp7BsExZzcIy+rEClG0xMV67OxsrfPJNmW/lWiVs1iP2aSL
         sBiRTki6JpiEya7yzShfTHO+oAvHQvWMgrADDKHmdul4rXvMlHsdSv5hkrEAx2u44flJ
         9Eyj+cmWVQlb/bVjO4dHELY9A3dyPp5TLuS/rxtArfW0LxTuudkl3hyWGWatTC/9h+Ay
         1dqIdkCmvihtUINxeXOOVQxvbfNyjTx//YRMrWTo3Gv5pYBQJN/b2UPPoi4Pk9kXd96S
         G6Js1sTJuuO3n4XwWttzevwV9TwjwRvdi25e5KHBu5bvOwgvs2//Tpi9vQ8WHkUsJTu4
         NrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283091; x=1778887891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Jwq4UTLu8GMYR6Kz5tygrHUgfDSbc+Ycn5uxVJf+w4=;
        b=RPU9oxPzhMrq0XsYP6QneuxZymKvgOo67bV2cmRTWXH2hEk3TPB5zSN+TXw7jYkpWA
         OmkXcJZGwW7VJGxEv8QRtTwEKBAtw5VGyKxoFqlcFgBFKuWHujcBL4FFkIv4p1hrL1y2
         wpBG+mbmv1zVfD0Tzuh9GJyJZVh8eCnOBta/0bazW7UfiHTKszTQ0Yay2CNaLkl0Pa5X
         XiYSKc1Tsf5lDWFTLB9z0zg3A864/EDJmvs4ngkWi4vl+BYQwcB0dWWuLh8LMjLVIT/j
         kvblUxXxKlquU4Zo0FQA2ItSSoN4KRiS0hIc1AMSzl1kjW14exZQ7wPtX0zdxD2aDlXP
         RSug==
X-Forwarded-Encrypted: i=1; AFNElJ//Ama4yYF00d78OATdNYRzh0jUn9ToHfwYtrVd4IDoVQC2ZaORuapTRkZZ95jFlHk87u38LgsKu63c@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDNqyqUm3qx1PoZ/HY7a8f/Ur0YT+9W8fyOoqqW2hussNBvYf
	1Q4pxADytvWdvobptS0WNJ9YbXqhDP/TgmAS+cxVtghVypMoWOqoJ/flJtIYVcvegFHOaS9vNcv
	36T06mbeKDvuIkgEnh5g/bvFVzgHo6fgkFRnFxIBKpjo4qZwyXtGvaIQOGctNJazS
X-Gm-Gg: Acq92OGBUHiAolNpdHJ8QgDe5ug89hIy0hIuPu7xN7LJDaVFcjrPfzdhW5jbP65QYwp
	dA+SQQ6WklDmQvtwAs1dKNu0p8bQUwMF2Bt0DESGASEpAK0I3i15nLIbLcXFRIRBL/zY/xJc0wV
	xCAGuuVGjMnV/vkTTfDnfw/S5ytSRGGDSAWEcyqgx1jn/sPSHeHLHIEvkdkc8O7VTuGHA8pPTtd
	aGORAlDAAOuKjOJhmoFw4pqyxNTveQLhOqu81TlLdgk5qQYhmY3gqBc7s00X9Ut051zBakokb2S
	M7fsn26aHALshAG/xqJEFfHspojw5pP7hrvgyE2V34QqjbHMO2QRKp2pTZfQ1W77NaK9WR8H0Zq
	DeEOXJTOrmhNCzdBkcPT/fuKDvimLuSSevfK/GTMYD3kesMTqtZBmHJYoO90=
X-Received: by 2002:a05:7300:f403:b0:2f9:c83:19f with SMTP id 5a478bee46e88-2f90c83140dmr1101297eec.31.1778283090752;
        Fri, 08 May 2026 16:31:30 -0700 (PDT)
X-Received: by 2002:a05:7300:f403:b0:2f9:c83:19f with SMTP id 5a478bee46e88-2f90c83140dmr1101280eec.31.1778283090198;
        Fri, 08 May 2026 16:31:30 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:29 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:24 +0000
Subject: [PATCH 09/10] phy: qcom-qmp: pcs-pcie: Add v10.60 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-9-237b894353fc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=2262;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=wMHU3nK1VVHDCcTUl8O7/aLbjFc69oBh4Oult/TQmuk=;
 b=A8hKtWx1BXZIcVMuBhwjPbB6JcBQbBq0R8Vw2PupYFSFeoGe2Vb+lQXGvAEYAJavU4QF2GcFp
 lDPWq/1LXOuBg9wdITkNrIPoveZk00bCwJIaKyADpwcyY95wQ49BIwz
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=DaEnbPtW c=1 sm=1 tr=0 ts=69fe7253 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YnN_nBVA4yaojiBpU0IA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RSgV-RP1ICS4XktjO8gmeDE3tI3lMqa5
X-Proofpoint-ORIG-GUID: RSgV-RP1ICS4XktjO8gmeDE3tI3lMqa5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfX0mJ8edFywfu3
 SHwZTymNQa1LbP71hVwjPlWlTbRldhhRGBDAMvyMEiJvTTxPbs+gW1piRsrxCuPPf+9qtfd3iQQ
 Rp5Cn2XpkvlPVBd56adNMQYK2RcSkCDTExRofrNtdFURdOOYuS+1ZHGakRrbUoWPdrtu8USMDtD
 dSjSeTpsWX32+4Bhr9IjthNLbHy3wFfLFcqIp83vEicjZZ5r/yJ07ZvxRunZdFNUBLNJl9dh+m3
 Nq4XGa0K+YKcwwUA7SqjepB0DqAKh4n7OQn5RrYStDBk6nu0aJVkaiOBI8HVCSDVduuxx03UJCR
 8uOyX53VXrc7NOv9T4ZxM6UML/beQwPkyfoP/+08cmHiCAw9HARXqzAt81DLlY6A40zd9iE5Ngv
 Z8lkptFCOwLxC0fjJQGUWkXEnkWAFMGr52Zwtd9HDL628o/063DS4TbFcKzSXAskae/CbdJ+HbO
 obrWII7fFgYcLTviqQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232

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
index 000000000000..e4a2bdc7c3f0
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
+#define QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG			0x018
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

