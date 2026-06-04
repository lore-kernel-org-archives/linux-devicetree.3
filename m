Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9CC28002B
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536819; cv=none; b=Xvvt7PJdaVLLsdAtSg51ETXpvlYuX72QgUUswinK2iBGiI7thtTKvj2J9+UndUa4IQFgggFdc0KzC+i9i/GlMmjQ1IjLvR/PgcMK/sbqHl1MSJ00X2ZXGY+o7p+kq6GFWEck0+9GJ0kUcS8hsQwM7uRnNKIQs1i19PdJ1DBq2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536819; c=relaxed/simple;
	bh=l+CJCriIHCqSTKfqB3yNlnKfu4zi16GuU5MaRzEG1I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XEUzpBlu0BxlphLENNkMjXbT/LNkkJREyNqIa5loTrsDwiiNBseai+ai1RJC1CzAhGv7xHJiggZBKd6kMtSEjnnYHsLNeENWs4gMUWGRpcVmhhs8WyXK+y+CfRSSf4LRwW2X+6C5RqwVzyAocIUHlMMMs5nqobShf5kHZIFAAbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzkVtazN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNtmpQJg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzkVtazN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNtmpQJg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540o2vp313865
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=; b=AzkVtazNqpn4P5j+
	Rdw4fuFNHeszyEjiMCntXGVTDYVCe4uvtS6UoxaUBCsYQfEWNGjXcBVWKn2CcG2V
	3WiFJxeBHool05XoDIadGE9RcEiIzaeOEoVeud78SkEHQKI5j7v4jSosUc20Wbq6
	7mxGOh6KZ9dHpa40fmR9QajAZrH+c/PcIbTInr4mx3iJABZpmPstGVqNPKIzzvim
	uV/iCpfvWMMOF8t4GzohbdOM12V6FHjIhkhzimfAZpIF8OPp/SIqHh5/n+Vmv8qI
	ME5RQi/npWnxnB1P2b3QOxv354rjA0uv5gmyA1L3BTV8dOuoe6M8Q1yoLRgXfWS+
	1bY+Qg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v03v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137d4309062so727368c88.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536813; x=1781141613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=;
        b=fNtmpQJgvKZS5Zn/dA2VCpgQk3mSZFJG0rJ7urlMUlTPC9PJtJtAY45l9jfazaJr3J
         ExqeuqQQB8I689nmymR//ZmdCKPlzAIPG8h2GZzQM9XFPAjmvYi7R+INhl6yhlw8H+zz
         1CsFfoBUu2U+6WKNZK51KGTaFnefGKnr8qsQeBStTPfpKnIgPzah5GGfFXfSyosSmyxL
         wXA0cgorj4KeHJfVSD6C3b6nRcTeL4ZuhHN124f+g9fUW6yRcgAkk0IiHDzl/ZWFPrt1
         XIkVyK/cMWo43R7L2z5niupTdaEIRM1pCOS/owK11K56HLQZmzeb546mQBnHDBbl7jAb
         CCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536813; x=1781141613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbuSh7qg+z5cv7EQdenG/3gCq/0U8ci8jC/n3KJ+wyA=;
        b=Byzzv4DJPky2VUULAqMRGcgKgO5vvNE11JKyenXVR/imeVC7Olsd52ByA1ytSm9mM3
         +6FwqH45Q1LL/LCvNIY6slGyXkQ/UsJGdF1HjpspdnI+Y4lQjWmZQdC5noFthfvIvhd4
         5Pw1W9T+CPoG1oPK545FLJAZ4wI7ZzFnViV3SW9pBVRbywtdlAnKMYexBjJJeva+pjmS
         JQ00bwycN8PXj0IfDqykeVAiNBj2xfEfhYRhmujUl37m51bNFVLYdwctAQugfJNe1oMw
         8OZ3b7M37nxvMz9ZmcHnrHad/BXfPtUZMV+OVPEQcYtWMdREDopbail4lDcJYkoxjSMk
         9BqA==
X-Forwarded-Encrypted: i=1; AFNElJ+DaUYHUPuX1CCZRfBOignIVdDUX8tDG941ADupqbiwDYsUyJ1B6SLkQyIZqqkCwxnc8PTxX9FBCw/N@vger.kernel.org
X-Gm-Message-State: AOJu0YwxArX0wjSdTxw6ffZDZRWCkLpI3xNVJQQvqIOngtxGDYwIqpU6
	8MFzg8fqtScBEqkemcb4t7+bf4WnKTlzTRs2BJIRK26p+npRkwpCnG3d/jtzoyfOyR2/nHvl6Zu
	iTVOsC+SH5auy53ofKWrnGvssNvmbPQuaCYdTXGFdtsrDlhuhnQXLt2B3EVD/wilo
X-Gm-Gg: Acq92OGiTZOvJTK+SKzaket6nEfgMHYvUa/LpTvGKZovZhNjwQQKQUa8Tl11nuaFraV
	rgmwwCl2y1w0U0xx2KAhOKOC5ro5mslWwLgLHZx038EU0qXDjM4JKB0H5Ax9fggAOtT8ESlBgsa
	Dd1/piubK/JLTxXEFvk8PHArKMCF2SG7tF8zWDWcQFF/L89V5soV8FEHBrELwjtkx0vl220EgMN
	sM/oDsibKsHvan+VI9+I4D+e+YAS2scXqE2C2jjU/FUXktjs6XATpPwB1Kuhh9NWefiuYLK9VeO
	Rkg6aaUYjDaauqwwIINSzoDGOJKnr8auJyJAOrYvbvWmIXSN8j+kdIeNUI9GruAqFqf9hBuaKZR
	t9GkUUy9jLfxfM7ZjRB+sFOOl9s/8R4IoWUoHarDzzuFdSoGv62Ud4wUGd3f6BVFN+Zza7A==
X-Received: by 2002:a05:7022:3d03:b0:137:fccb:8105 with SMTP id a92af1059eb24-137fccb874bmr1240766c88.4.1780536812737;
        Wed, 03 Jun 2026 18:33:32 -0700 (PDT)
X-Received: by 2002:a05:7022:3d03:b0:137:fccb:8105 with SMTP id a92af1059eb24-137fccb874bmr1240753c88.4.1780536812222;
        Wed, 03 Jun 2026 18:33:32 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:31 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:33:00 +0000
Subject: [PATCH v2 06/10] phy: qcom-qmp: qserdes-com: Add v10.60 register
 offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-6-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=3662;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=l+CJCriIHCqSTKfqB3yNlnKfu4zi16GuU5MaRzEG1I0=;
 b=MZm+aCncu38l+zWUIRpDRU+AV8Fc8rZFnCkg0kLRYsteagLM9JX74qo6PlV7Ncy//w34KX7c7
 vs3Cw7kKTEuAlX7R+I2mFDrbUPDE0mkZQGyKLsEJ6xdTvZ1JDwNBEQQ
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX9Jm9c5RwYqff
 JYVmLkqjhcnEJF1aMOeNzJOjpAIBTng91SP+c/5dl7lJYSAg0ZsHL28nYvUCHCk6szT5tn6qlle
 EDQ+nwnw1hh3hTcMpXIqJxesWCgd+HjSCQyRjO921qqlqKQ8RQR6TqK5wkeRPLFvoaY64qyffxJ
 9GQzJkhHuU7u7OCwdHlKolNfT8bdZjQBovvPdsMeX8BY08aRpB8G9sM3FXvOhhYU9NnUkNOKxIl
 BleFl3RqkIpan3YSoI/Ulk5GTB+HxbDWROGv6rOud+9IzcbtskBaVW+w88ljTz1inAnr/wY0llL
 Ce1dpEq6pUA6AeMFlGn3u5FxnMRIBTGLdMP7i8uaDyPg1XPgiFyr9tmnLSEQSsbVbuhxdwTrpSC
 sEIe/dLuQ/L3ehsxv8eo6GR4cAWbxo/PyMymgKOCIOxGDKkpgioV7f+lKtpQwwATi9CI2tSMQUh
 58nz5ARlzWTBszf4dUQ==
X-Proofpoint-ORIG-GUID: O6sV81PHBTjBwKjtcB2x7AHFgUOqONSL
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a20d5ed cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MN0C-abDVP1yrleAEAUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: O6sV81PHBTjBwKjtcB2x7AHFgUOqONSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012

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

