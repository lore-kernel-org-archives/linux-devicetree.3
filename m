Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A344242D97
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536819; cv=none; b=Po5D2TdFqlalRBF1NOyr+Oo6SBig/pepi+xpNsJg+cWq5jJ28tSB+BfgU131Y1qP9hnto1msaI+Tj0/Oot6NJIFxo6I/hFkKBohuoLr/EMEsg+saP+woU7zwSRJzK+KronG/h11DI9UOz1XbStwjYISPcW8VN9vjE71xwnD8om4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536819; c=relaxed/simple;
	bh=vfLZQA0CCbl1QXldfy6CoH4yZcYAenCkW3y8IH9Sbb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fmX3H1b/47xGtGZ7uT1FczEa+ROrP1y/EOBifejdtjvvprNAZvePPGfW3PWpufixma+R0t0jBaoHU/7AE27EDWTTDiJeFaPCXezns4vPbOy48Ij67uPJEKcALnlaiR8a9FOYO6sAXw8bPO8ZGOe8XveCUERTZQi4/XXZMH8dDTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnNUhkkP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fksgqJ/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnNUhkkP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fksgqJ/t"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JZ2gV1039351
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZNiqJWbEkNasW3EjtPd4UizYzo77rAvgCzDeRMLYD8=; b=RnNUhkkPIxx8SGT0
	8d1+5Eko5JvHga0wGRpOggQZJQF9VbIq/QW0u4KDW4WBwqEoqdudX3yuN51sNFSx
	qZtJmNUSmr2jDOMjlWkV9qSpEPAZMGRXtTwSXY8YHUjZyxy+DMI8vhdWCGlSCD9c
	HepWjEtz6v40s68oOs1SH9v+1y6+vGIaUrXQnSxQeMlseIpaDTNToGkiPaSJVL3N
	DZUUVSfsGcyFCSCRDqYDVe4Zbt8xXN3rnGYI6eEXm9uhv8UpIWwKUaEcWjjnlQeU
	zB0DYeVPkLzdbz6ITLcFTrE9GLg2GnAsq1HjZxNaoKfQ8Bv6Vjg6FXk9dXzPxH+Y
	velyEw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8h34n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f81004cbso725093c88.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536814; x=1781141614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZNiqJWbEkNasW3EjtPd4UizYzo77rAvgCzDeRMLYD8=;
        b=fksgqJ/tyWqs3mC3g3fzIvOyChkD5rPJbpMiEMRMfS6ealAio+ani1kn8yTLSiIn+R
         S6+J0fO8Se8zqw5nQ61mLt6GxdYC4iyga7Qr6wrNeUugnlui1MwLTXIh8kqGrUII1rL8
         pdJvmihoYxlDkVaHyMGajsMj6mA6nNmlrct6X5CfwQkn1r/eLFCJ/aoYFhJfuo1qLk+P
         SwwpV3S1spDswXCBeqz1ZcENwoumX3MxV8NEp2X7pMGwca3GSLewr4bgtbZnHeC1Qr0a
         x1GZcBQyEAq2MLClyt8M+ST52ivu8xdmVVUIBhtcgjs5Mc7O3HyKBB2FvA3CQKdYGPqk
         3NKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536814; x=1781141614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZNiqJWbEkNasW3EjtPd4UizYzo77rAvgCzDeRMLYD8=;
        b=UAiZXSwez1AbCtGhGNG7J3ngNHR+8/5xzUpdlYTfMs0cE1JMDlY09O9T3yoBHfzJPL
         nAaxadzfOWAImyw6Fvbkdp0R6qaCR7eQElFSn0q6WTF4xnqXnGmMXz/UtQIdVOgsJeFV
         pQvCuzVbB5PThmhWEqqsF8VDeJsboWF+wuI4lmA3JSl5PnA7qR6ZTSCBSSqUKRyeXJSe
         0JjuO5pSukneyuZ9czhWVSpI9jCuAoiyKAvjjKOMZLJiYY9fTCuQnHKnXWXP+c/a6ipG
         dc8f70wOYb9C1uJwFKfgdYNniOqgi1owvaT7MuFm3gQTsaPBUnr+MtkRnByz14Dr/clh
         8oBA==
X-Forwarded-Encrypted: i=1; AFNElJ+qiTyyIYR9QPCXpBSe6whtlfd1EXZk127BdCF4wqQN56Dn2nKy1Zn1KdkDaKNL/Kg3hdZwKYMo246L@vger.kernel.org
X-Gm-Message-State: AOJu0YxuAElu2bKnE0SesgwLjH23+QTBkvcQ8c3MtpU7dY7UvnkPo3pO
	jfOMO6lxQ/q1eVPCAnDdlrk2wqkvMFWHkeh6Q8b/e9OyxtTONzxUqudm3bnOv5YSk75D+nvb3YJ
	GGbLnAwVeyu7HhOzObSSO6D3xdB8a/GzVEo0vFbQCUpleTia0eldMFZqsTbiCbucR
X-Gm-Gg: Acq92OH1lwgRqMzDeTruWkHnDMxg9qVKECcSDWLIUEA4WbOSouTDMJ23Bse2pJRUrqg
	jhQJ8coFgk0vFXMX7tekzWyEgwlhVJKigQCWhIf/IhJMzW8s8cDqAWqS+AJhPdnl5c3lEdWx8td
	5l652NwiTYYvR0EhVqLq9GF7tZYGRkn8eqBdpkyYsu/fby2YFgV8WFqi2u5xfI+tzjfCS8L/loj
	j/2w9VjpqkgaJmnfRw9/jAkdCXBl4iToHqpzec8lIV78CdFeIFJXn+BjPMsOTIf8DZTaYyRqosz
	ZZkVHCYTmlzho4DWZS9xl5sDpv2I8V+jdLRqgwl/Xd+a2j2gwVf4ETRd5VtGDDFvMb7UlNO5nrv
	S30WmhNsEywRRWlAONRHVamImJFiBpfkIJLtEj3xZqgYCkNENHbR83wiFKdxAfr84+0BTcQ==
X-Received: by 2002:a05:7022:481:b0:137:ec47:8ff2 with SMTP id a92af1059eb24-137f663ef61mr2413010c88.0.1780536814011;
        Wed, 03 Jun 2026 18:33:34 -0700 (PDT)
X-Received: by 2002:a05:7022:481:b0:137:ec47:8ff2 with SMTP id a92af1059eb24-137f663ef61mr2412998c88.0.1780536813497;
        Wed, 03 Jun 2026 18:33:33 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:32 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:33:01 +0000
Subject: [PATCH v2 07/10] phy: qcom-qmp: qserdes-txrx: Add v10.60 register
 offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-7-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=7004;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=vfLZQA0CCbl1QXldfy6CoH4yZcYAenCkW3y8IH9Sbb8=;
 b=4z3h9nJGsLrWX7Rbt90jH/YhZjffMn+6VLL+O6t364FEubuIr7RFUgugDA0sEdkYQbDb3Gt9R
 sZwKgvV7OU2DyS2FfybTduLAFj32cO1pUCa/zOwX0M++d2s0RI39ui9
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: 33FpCr-Vr6hZ7VXjWv-x06KsaBTYZLvA
X-Proofpoint-GUID: 33FpCr-Vr6hZ7VXjWv-x06KsaBTYZLvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX9NTLWLcPJBDP
 5QBJfF2bMfnTEQI4b36cmtQ1tqA8h8BHK1DP0BNN0Pj7qUPUn4pw7Dqr3EmW6q3SIOi0C/L1fAz
 rniueffGRvd5ObsvFO8M7SwBgLlsLaaGTobT2ygAUDEqu/0opMkPG6FcuE/Gf6R6aDsR3Kcb4la
 e9RFYSwxR9GJZN1cCUcuURqwDNw28DTiFR9i+nvUiN9GbKyueXREDP+AZJBcDGUNME5hEuOG/x5
 viQmoTUK7+2Da4/rhs5ZP6v2SfDCN23G4+mT2g3Q96IK5t5xGtj+UtdVGAK6aoycHPrC2C/mp61
 Zc5K6cPOFdp6M6odDejGdsIlfNw5OQeYqYuMFPFP75Hezt1xUPI4OXKgYU3NqQQmOzNZs8+P4NR
 n2a/CG9Dj4u5fEEsyzLLe7xzAbHZYydXpyMaxG1E8vW8xCbhHwgGB3+XSCJ9+RUu5pY1ufsGXzW
 gYZfobaeMFGZWc7ytBA==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a20d5ee cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3YFJjVyaoLhYZoL7l5QA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040012

Hawi SoC bumps the HW version of QMP phy to v10.60 for PCIe. Add the new
qserdes TX RX offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   1 +
 2 files changed, 110 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h
new file mode 100644
index 000000000000..3150a494685e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V10_60_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V10_60_H_
+
+#define QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_TX			0x034
+#define QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_RX			0x038
+#define QSERDES_V10_60_TXRX_LANE_MODE_1					0x080
+#define QSERDES_V10_60_TXRX_LANE_MODE_2					0x084
+#define QSERDES_V10_60_TXRX_LANE_MODE_3					0x088
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE1			0x0c8
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE2			0x0cc
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE3			0x0d0
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE4			0x0d4
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE1			0x0e0
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE2			0x0e4
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE3			0x0e8
+#define QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE4			0x0ec
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL1				0x12c
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL2				0x130
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL3				0x134
+#define QSERDES_V10_60_TXRX_UCDR_PI_CTRL4				0x138
+#define QSERDES_V10_60_TXRX_SVS_MODE_CTRL				0x19c
+#define QSERDES_V10_60_TXRX_RXCLK_DIV2_CTRL				0x1a0
+#define QSERDES_V10_60_TXRX_RX_BAND_CTRL0				0x1a4
+#define QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL0				0x1ac
+#define QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL1				0x1b0
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE1				0x1b8
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE2				0x1bc
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE3				0x1c0
+#define QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE4				0x1c4
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE1				0x1d0
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE2				0x1d4
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE3				0x1d8
+#define QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE4				0x1dc
+#define QSERDES_V10_60_TXRX_UCDR_PI_CONTROLS				0x1e4
+#define QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE3				0x200
+#define QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE4				0x204
+#define QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_LSB			0x218
+#define QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_MSB			0x21c
+#define QSERDES_V10_60_TXRX_VGA_CAL_CNTRL1				0x280
+#define QSERDES_V10_60_TXRX_VGA_CAL_MAN_VAL				0x288
+#define QSERDES_V10_60_TXRX_GM_CAL					0x29c
+#define QSERDES_V10_60_TXRX_RX_EQU_ADAPTOR_CNTRL6			0x2b8
+#define QSERDES_V10_60_TXRX_SIGDET_ENABLES				0x2d4
+#define QSERDES_V10_60_TXRX_SIGDET_CNTRL				0x2d8
+#define QSERDES_V10_60_TXRX_SIGDET_LVL					0x2dc
+#define QSERDES_V10_60_TXRX_SIGDET_DEGLITCH_CNTRL			0x2e0
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B0				0x314
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B1				0x318
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B2				0x31c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B3				0x320
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B4				0x324
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B5				0x328
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B6				0x32c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B7				0x330
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B8				0x334
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B9				0x338
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B10			0x33c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B0				0x340
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B1				0x344
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B2				0x348
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B3				0x34c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B4				0x350
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B5				0x354
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B6				0x358
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B7				0x35c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B8				0x360
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B9				0x364
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE2_B10				0x368
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B0				0x36c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B1				0x370
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B2				0x374
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B3				0x378
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B4				0x37c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B5				0x380
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B6				0x384
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B7				0x388
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B8				0x38c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B9				0x390
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE3_B10				0x394
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B0				0x398
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B1				0x39c
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B2				0x3a0
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B3				0x3a4
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B4				0x3a8
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B5				0x3ac
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B6				0x3b0
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B7				0x3b4
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B8				0x3b8
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B9				0x3bc
+#define QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B10			0x3c0
+#define QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE32			0x478
+#define QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE45			0x47c
+#define QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL1				0x4c8
+#define QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL2				0x4cc
+#define QSERDES_V10_60_TXRX_SIGDET_CAL_TRIM				0x4d0
+#define QSERDES_V10_60_TXRX_TX_BAND0					0x4e8
+#define QSERDES_V10_60_TXRX_TX_BAND1					0x4ec
+#define QSERDES_V10_60_TXRX_SEL_10B_8B					0x4f4
+#define QSERDES_V10_60_TXRX_SEL_20B_10B					0x4f8
+#define QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE3				0x53c
+#define QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE4				0x540
+#define QSERDES_V10_60_TXRX_PHPRE_CTRL					0x5e8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 85da2581ef90..e461a000da48 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -43,6 +43,7 @@
 #include "phy-qcom-qmp-qserdes-txrx-v10.h"
 
 #include "phy-qcom-qmp-qserdes-com-v10_60.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10_60.h"
 
 #include "phy-qcom-qmp-qserdes-pll.h"
 

-- 
2.34.1

