Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68B226F29B
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536812; cv=none; b=o68XQY/p5sNdbYuzOb7p/njCxdsRQ/sGYwXRzShPH5hGtCcItdhSYiYKraFnYs/Lxafi/DmpFzZ70b3PVQNcA+fISH7TNr8BQ+ohtFdzXAdNjqOzdepgZeVvQkGXMhoKchn36abQ/iiRAJg/f4ZEAh4N/E+TkvUnwqu9ucdADIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536812; c=relaxed/simple;
	bh=DOGsd2u7iW9cMvj4+PDQls+GBNWh6gWdVwXtre2Q3s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lYPr3NXQu1Wh6q7g4wiyLel4spI1AWcfnA/czcVC6StyrihYC9kuNw0HDRpj8fxGs/GvX2r7dAsL76FJlvjHDLdv06hUfgNgvks7CgXa6uoKVX8k2ULYB0nvFRQ2EO51uklfUhArDrZGKb89eXIBXyqhl8msGYBOO/xfH2hMeFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CB76ZMtN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Urr2XaUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CB76ZMtN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Urr2XaUJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65416AeK2368043
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=; b=CB76ZMtNypemFEeF
	qQ3EjQUm6YeKFBw1YhrrlI/dnadaFiXxnSPr6n51k9ZccFcqHzKVaj179IXDfJwV
	H62GkoYo+G76x5S2kXKRrDX75Ouf+G5Yx49o5zXSpk7gY1++quMuWqmbu6gdt+mQ
	YPu9l8VdInPTKVD0DFNLu7nHoKMIBkfAygJX+dPRuBuuBXwnSJgvuuct+hr5nmMp
	mYlmnhwUZH/XdlCvoU31yEpVd7Li5nbxuk+LmWD7FsONDwA4g8fOmMSxYCq3TQ4R
	tD3xERrtD6Z/9buyCV6ijhHlZDGU/YXSBdc0UCPGsC11G0CqVDMwpS9k43E3WaFB
	INI3DA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gkftc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:29 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137ea73393cso764287c88.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536809; x=1781141609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=;
        b=Urr2XaUJeI3urfaiEe0Ls+/ifut+kJFLdpCWxXJtTGwVFdMTMET/zhcNC2bagLPSe4
         TzUzLJTc2wmCqruVeFCkykIUJvyp7/z6bayN0yS4p5e3go36ucdt9DcY+8JTaECSaeAh
         OKwbVrThN8R297E0ofNCw8h4zXWtbpT+1Sw+arUrlWXg1bUmL037/YXlMCAxS45TCH60
         FiKOOsDstwnlZIr/ZYQr29wOW6Jbwtxbq7eFf1T6spPm+02TVNX08g35A+hbcRaSLqkL
         mdlMhT5KfLLGyUqminMnDhCyu92WIVX1pMWWSXfDrH+6Cw60thqdPJTRVCXpIozGNUQk
         ZGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536809; x=1781141609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qj0nAIAK4LBbELZANLlnfukG9vwKdKBxFr9Mk7W/Rt0=;
        b=R6g3d9U+JjiQzeKNyx0aR30sjzbFX7ktu+8VL18uWB3Y6VXWjlTwX+nviEnBu2ZhaQ
         ghvOeXqf8SxEkoIit3xXVriFM2IQPTd8a290i2f0UEEGynCTKfGwFAknL1Vvo/jMMHbP
         bPGXrKHXTsR3C7uu/U/lGjeQYeJY7jRpwLzC9xR2aywUd6wL/qJme2TZw1/qbexgItbv
         sRV6nz6sLKc7sKJpGiA2SmjYPyxXaprF1HyejPOWi+wv4EqJ8B0QZI9dBmZIoTGieWD/
         5gxCPAHO5yJT/X4am95JWYb5A30wKuFsiFsiI8DqBh+lgngyxR1giF1c6zKOL5Y5KzgV
         Iu4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8L8M9rjQnGCW59QeAiFa/UeRMwzsxLfrzgYChPDGGnINIREjPOT7PDUfgPplNwEB7VHnc9yn9hYB6v@vger.kernel.org
X-Gm-Message-State: AOJu0YxFFBwk7ZiVliG3dBhg4oDNesyb1ID0kr0Z3OgB0GErUBCDMte1
	Rdpj4oVR2bDuq9EYpXq7LLMwmnoa7T0maS4FOeefasOMDJ7EWgydysheHb+sBqnvnAP7bQylhkw
	VoYJEs4nBGnmbXpn4+YwzdXxNU67SlEyb/ieRiC2syzhlBkSS5VOHUjguU+9MlKwis/OC2DDH
X-Gm-Gg: Acq92OE23ZBBhYBSpDT4dCjEzmq7tAf5SZGkYz/mTI2cliyPMd7/zrmQTGcIyqky5Ob
	xELiCadNcx22S3rNxh4twuNmBp6Gb6CM042kd9IQvSR1EzSZJ5kZsO1awkKcgM+w4ozLRJ3U3XV
	sX629Hu1SKQwJo9s1qW2w6iWZ/YQfJCh/jpPKEUHNpdUqLZHHoylYj7WzMglqzlIkl/z9S3bKYb
	4yrm3H1FZYaKvl/CyzmhjAplWG2N4qB13WtY5bh+sUZdNVfxDF6UN3Q9jrb1jSOQcBNNh9xTXP5
	RQ/+XZGnLRjcVw9tYuceZfZqA+mvZdLEFI0GrHwlqyrh6z2M/hI2xNCitWHdT2wm90s9enzol+T
	PT8UrWSwPBDagUl6DG8k1PFd48eIriceFuCzy8BoT47pNMS9cizgZjFHJsNmgMNy9jvcMMA==
X-Received: by 2002:a05:7022:628e:b0:136:ac69:b0e8 with SMTP id a92af1059eb24-137f6a4bd62mr2547966c88.15.1780536808861;
        Wed, 03 Jun 2026 18:33:28 -0700 (PDT)
X-Received: by 2002:a05:7022:628e:b0:136:ac69:b0e8 with SMTP id a92af1059eb24-137f6a4bd62mr2547943c88.15.1780536808321;
        Wed, 03 Jun 2026 18:33:28 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:27 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:32:57 +0000
Subject: [PATCH v2 03/10] phy: qcom-qmp: qserdes-txrx: Add v10 register
 offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-3-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=3118;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=DOGsd2u7iW9cMvj4+PDQls+GBNWh6gWdVwXtre2Q3s8=;
 b=uaYrEDNuJbbZy9J793wtPHNpQiQdsFL+8+7sd3GhytiDOXqkbqwX/4XeGigQgGY/RRggOs+s3
 b/RIKu3k9J7B4erouqkmLTG9JDw+oF9oY9EFe6UbhRWo5yu5oggdIZQ
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfXzDFFUcwFRHEu
 FAZUgPrRYLlyD1MowT49at/fgU5bBnCvg2+m6LcvR2ZQHw5wnWBUoT3nxnN4K+Y6XFB3LBBCWhr
 M7Ba37Jp7nzMjekHVE/zITvCYda/sdflj7ZCZDOrMeBb5N/OiK15ye9RbCyqHJWgVu0QtnZv8wA
 rYSgRUEX3AAo+S96BB8NiZcz9Y3BK+uWASXnI6M09p+4uIYgDfGIVrUcz+6UA0lZiARnO5qgfvX
 QF61FJ9mn4M2ed2Qi7tKrOOfdUOzHwredFN4mqGDVukgXfTan6N0QS9VtQit6KJ4m5ke1WI7QrA
 IFDns6I6AtKlbyyPprUSJ0M7VrjCPeDSWCSCfK/VXFvqviJmVgXRt+oullIRzwdchILpIU1I/1F
 WVB29kCvN9p3MrLMrggr57Zzpun6Wg9Fn7oeScjHb8qQlLKm9UCWLsOSVVcTMNu6ot0LN0a5j2m
 zDJnp+9FNGONwPvYP6Q==
X-Proofpoint-GUID: TxeWu2oSwqXXWrJqLBAeUODnSB4Zak6A
X-Proofpoint-ORIG-GUID: TxeWu2oSwqXXWrJqLBAeUODnSB4Zak6A
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20d5e9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=A1tEKnX2-cfyyskZ8tQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040012

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

