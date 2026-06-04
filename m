Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08CB1EE7C6
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536815; cv=none; b=eEpo0dGawvNc7k/zrs7vvHHUHWq5t6QKagD/kfAGTn/je6UMp6BTT1rYPaU4Xnu1DH2b/fhSNfFCY94lKmk52iFTdHq9LEXygiGYsRbqAPMJK9yLiRXHQxi3ELv2ywq/Zy2SLg9PBLm91lJL4TE/vpArTOux0tUrS6AsoFHZuHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536815; c=relaxed/simple;
	bh=cIrdj8/8qr+RDIhnZn+O7Cu+D6iGtXuFpw2ZdlFjXfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdkPi/y/sUV6bTyUhW1a22vhggXdglLFFNTfGItOIA6tZcLHkhiePPdIv8BcAjtf1jM9qoADH8GkrsdGpfLrEDJol5OtAvHOOUGMpi8T0mS+jp6HYZykrtlt5qgRdJbfh+xRe8AMhLBtekgfFiZFBNDQzrkjVD9LYan1mp1yhMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnNdOSZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehWtcJ4g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnNdOSZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehWtcJ4g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653GjBMW2260708
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=; b=SnNdOSZeKhssPxQC
	QMtHA/xZnx8Si1YycqNUHJQts9sxukl2UWWywAvRHztMmxYkews3X85S11pnaI1A
	W2qQN0lGk7tLQxpjorS9Pa+MBJetPzrW/ILCcyz9it+ik2RODqE/TJ+wPSa8WbWB
	gtARacqercKZ+aaJcOGsHZRMadi9zuridx4DaDwIWIv+HSKczYANnagKSoOMjtCM
	NgSjx5XH5j80nwEwMLzF5VybESt6VGAzSAz6hZB6coEQ8Gtd/Xx26KFf9vvidejO
	E+bOQx/brVbiIVL8egRqRtPMlJIP3SVj1LqtrvBG3igUIlVnyroA42SJfKCtneT1
	jHXHyg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mhthd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:30 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137f2083280so648344c88.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536810; x=1781141610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=;
        b=ehWtcJ4gTJ/5qDcpHRodQBJEYg2jMZuCeHusHKMokIUpKLcfTQoFhX62ZY6bhXKOza
         4OZUIY8A0tssxgj7V/boyiVS0T7FrkPCF+PAx8zGI3FRL8xTNsjUN03rxHw6anVfeBvV
         Kq52MaasLSUm4em5UhP2lPQkLDLF57YpZ4d8KZ9ggDXL6AZPJrTBN2G+B1EoXbEszZxo
         MGxI2p8yB4heIedsrHZSWYfxb291SYeNYGNDwYDLY0PQbX3VLqvR6PHmO4hiLdKjZLrW
         D70cJnUKc0hS/Me73HEtc9Z71T8UStsaB3NantuK+mbDdtWdSl4KgaxHPxqUGdeW0B1X
         KQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536810; x=1781141610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5szkIkAg1aH60/0f1WIg1hk6vms8CLlPDs5chmgmuhs=;
        b=U8f/pGX6FKHzpeSY3QmPrtFDAPc0I2EkPqoIxwDwgKQ9NyJsNexDeK/18eYLNAdWkV
         vYgnVtwH3gyKTVa4i+K6AAIhYwdhN2vUe/i2+m4tKnx9eEGc4RJodN0jVQe7a9cTlVAM
         pXsbdYhqYysMCTLvn3zol/X0yi3c4+269ad+58j4gj5mbiWclLlLCK6qphBspKkBWtXU
         RQlyY9OS8RNCJ0hN4ygd4cZHBJiNxJ/J0GEyBX6bFzLr6DFTPduAbPNdLPTlgCBWql6Z
         YCokRBBJlkoPIq5mbAr5Y3tPBJ4G2lazj5w7fIaUz+iFUoWPszjd3Di7f1DDReqAO6og
         m4Jw==
X-Forwarded-Encrypted: i=1; AFNElJ8+8i4n4JkvRUH3azuge8vlGUDxWG96AM6UbLgUqfiRFbyUcWIuHEn+yXfJ1rZXFZ/U7vYxVwvWaeon@vger.kernel.org
X-Gm-Message-State: AOJu0YyjnrL3gFPymZr4tEzwMp3B7CK7ItAZiglTgWuTpTVuTuTPHiGX
	LLxLLq+hTkCWi92C3CerS3HvTHatJebzvPHrSd48LKOk1e4vxzN3+WBNwh6b4jQfiAaYH6EqR9S
	+l/TpXZmkeOwmgI4WqzTIwYSvpoMpKyNxAhfBEWdMlM2X9iPYmjO4muhhpk+iVXv1
X-Gm-Gg: Acq92OGUEgBIft3lYfFYguOtiouvDZkvKM2/3vXePDLDjV7Ps5YzawpK9b/5/5zie/c
	hLUYWGj1De+FyhM831OA2plqstUTUyiCVf/TdOOE6mfXjVZV0QInda0TPhe7ikd9+wHnfY2DJT5
	jL9Z06TLrM4R+p7Si5uojO0lEMXKIvbONCptR1o7kqEd87NQkwJ2p6IaTO/mAvgy58jIHfbSYv8
	JQELKA/P/pnyi9fPqKsxt5Q/TACvvHZc6HxSCbOf/z7y5zYXkOf7POFYNw7+YdrrwJWFMqjdwCw
	5FRbvYCHqZlS7vO+vrdG3rrXeCJhFTtAo6ELHHSdydHkK3P9HX8XqjdYVjTOhfOJAT4jWTn272k
	ee1zONG357xgkmSUDC0wp5PU8hKhwXFoDobFTOvO8Fb1PMmbBcidxcWuBTxj++4pyzj/rBA==
X-Received: by 2002:a05:7022:e15:b0:137:f5dd:84a4 with SMTP id a92af1059eb24-137f6bf51d0mr2802491c88.41.1780536810199;
        Wed, 03 Jun 2026 18:33:30 -0700 (PDT)
X-Received: by 2002:a05:7022:e15:b0:137:f5dd:84a4 with SMTP id a92af1059eb24-137f6bf51d0mr2802466c88.41.1780536809695;
        Wed, 03 Jun 2026 18:33:29 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:28 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:32:58 +0000
Subject: [PATCH v2 04/10] phy: qcom-qmp: pcs: Add v10 register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-4-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=1794;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=cIrdj8/8qr+RDIhnZn+O7Cu+D6iGtXuFpw2ZdlFjXfY=;
 b=c6mBXCFpB6UsMq03JTTOU5Ckldp+W9UICY4nsLzcYP1H1ervM9SbUDwq8/pltZxG6OW6CT+9w
 SHHiFgKUtWrCFIRuLbLmY9uNsfsrzrdrE9G+/NQaM4UcjhMfkew5l/6
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-GUID: XMlkjwOl1jPRl8Asj2yGqxUk-gt6asKm
X-Proofpoint-ORIG-GUID: XMlkjwOl1jPRl8Asj2yGqxUk-gt6asKm
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a20d5ea cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TapfYG-AjLmxlko4O74A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX/bL14OzqRXJn
 oulOQzj7BIj38uxcoVfYy51NJESdcRicxmFoUo+FW2VGeV5AdYyKUFs/YDxu1gyD2ebMh+36for
 yATdXP4UMEp+t0wABK773QZiHZFw0wE5yI8Cu581vZQTrQQn3cWMfygsXz5qr0+RDnyGoKz9086
 ajsBB9tBZHLtW0djwuEhtFK6BtrWoupsj2UDGuhBm4qsMzFhDw+aZ4WNrUhSG74LnPt28o+8fbM
 Ym8gBIvlAt6VaFBCmvAJvPR+6u7tjAROheMc4VjJL+QlBEu0wsmLCVllBbnkh1d9bii/W3HvXzA
 6ukuRdn+KPIdc0UDvqMagosU76jpFjO/jrcFEL4kZVjM3CDJDtHfZZoi4VsZvZJX0jOKsFp0jLt
 RkHv0DTBnUOVvt5gQ6qQAczqb3y68iCvEMGu/Ffy1WGD7nB+uJe4rTx/OLdxPPOhv7OZTaf6evR
 NDqsuO0elD94R2uuHmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012

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

