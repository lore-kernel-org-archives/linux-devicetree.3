Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB95E280325
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 01:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780536822; cv=none; b=hEHTpPuXaxzKcb4sewSCSQNb3ZEEfY5Pr1jgUccE62RttA4rKtWO7s5XhmTPVx7rlNYEOwsTNxfAYv1ty0U77DIrd59dJy7U6cpPo9I8SbjbmtSybolqwGXe+ahaw1s21sNy4Vv5xQydnXNPhX5WxCdCg3ZwTAv3MSKEjNdKWnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780536822; c=relaxed/simple;
	bh=12KW9clOAozD452MIOmNDYymCgfcce2/rtjAZbxivRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tPeyc6PlNiMCxCxbGoSj51aNm2SgJFeKqvY28XzKeplw67U1DJBnTmRbO94hbxHSPkSHZubxAT2WO+0xWQxDsOHCw0CPQoNIHQCC2fQojqU7oMhQzOP2Rqvjg8w6Qx6DpOQqN2QELYG9WNJHB2s8Q9RsUOX+IkzWGD7SbPPfT+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fimgej8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Br0zd4yp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fimgej8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Br0zd4yp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540nxbN313682
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 01:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VNX6S4OYiaRdl27b4ng7lxM/NUhFr12IPjpypWGdrzI=; b=Fimgej8i+GXuiDZS
	+8CAO/QTo6b6Ns1A6YeLI5g6wi4I07DHIaMXwOaH5Ke5GNx9bCa6iTMbiw+La9vX
	bcJuE0yNwnoBi6XDwDYyH+h2lNZQE3a2tCnxrOhKgM/3M9qLYt23DTX7J5hVWTBV
	ycYiH+JCMNv0t92dgr3zYqKKLwGD3+G7/wTch+1902AOmWdU6Aq9AWJwRX0K9Mue
	RZ9jUFoncVNKiPswyVTCvffzkyo8cMMGGYOMA3y1Figc2NYeqljThLeplCEzk311
	b0SIwS8iEd0agwAOXohQPX+DQ660I9nZxIDNa3Rc+Bq4NuMyDeW42PuHvgRnEzGy
	44M+hA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v03vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:33:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137dd3a60e8so208083c88.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780536818; x=1781141618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNX6S4OYiaRdl27b4ng7lxM/NUhFr12IPjpypWGdrzI=;
        b=Br0zd4ypBOenI7hONhgRd+4N0ejZNxV+6crEdjHSQ8wL3EXnf05MMhNzoK/XLZekia
         qhaUIoPj5RKyl31rV6eL3gLjdgr/IxKPsXrLZyCbOfbdcVRZZJPLSXTSP5Uw402x0Eap
         NxBC//WmkGs8X4DZHI0JTmR/PDfFpcU59xIFoPCoSen/rDLOK2zciB9LHTsATsmLTCPK
         rw6PNK8Elighipi2iRdpmuZm+sLaJw2yMIbUIPGpZs1Rx4qj8V9iJw41NF9j7lnrvoMg
         RyC+cuO+0lG+5fT6Xg9wSJ3UY0s/pbpnwNEDhpVNz2bELaQ4EDmoI26Vgu83EwYmeMHo
         cmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780536818; x=1781141618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VNX6S4OYiaRdl27b4ng7lxM/NUhFr12IPjpypWGdrzI=;
        b=lDEFxnr7zErOt6oQUTHuI8N+qgH0C916p8gNxWsA1T81U3OdnLw0wk+a8+pxXTFsut
         DvJ3NO/x4B/qMJqMyINZlYtlblyA4OG5vIyM0+VM1+tgh3QGeRQkxrZAxrlJxH8W2U1I
         uduOcOLOXUBS7/Mp9xNTU3by6TjAd8J4FBhtuBofQAIMKr6xO6RUfRekgriGnbQDKL1Y
         NP7+B6Es3eC33DN4MQQLtiFqCP9E3K+gHY0oXsMpGGfoUV9TKx5mUwRX5OsqjBmcwer3
         Ck+mWTksx0rpW1t4HsqP8kXgZUUNy3GGcFHb/XVnJVIOZzWSiHkzyHeayXwOVlUKzofD
         DgMg==
X-Forwarded-Encrypted: i=1; AFNElJ/CsKfKNLrnjNDtnF8fdSX6uzYcP3nATwWibR3g+JeADPbm0r7Y4AnWBPGyC3hvlzhkMxf2V09WXPGS@vger.kernel.org
X-Gm-Message-State: AOJu0YxvMGpnaeaHHapAaDFABTqObJ78rAmMj9IFMwNJ9IeEfTeze/JO
	dXgbU2m6daEnTqNexyJnyulp5pwCpvATSqwltohn4FxoJUtqUrQQaPYv8xAUGlUSyEciO3TJcik
	PfJPxOxL7oA7BkQ0CWUYkvNFeLLhzsAZm1MG9vGaGB7BdThLQNOQ8pxmvQ/3htQ/B
X-Gm-Gg: Acq92OH4RyH5UXKXD1BYzjGGN6Svx9YIMnU6SvIeb/jccffRECZxbzMApd2uiTGFCww
	LYENKMUk2VP28CPaK01irdrrEzt/Ax2L0a6GfINFww2bCP/ok0fz5UU1ZHdUenxCSst6tRywVKe
	fnqoX7h4vSKxeK0bMg+OhQDa0wpdGpPltaguEpT61miPOrDmkGUC5AjejYnl3mYNS7a7PVhqnIt
	uLROQyaWXweEQn0PmkbtCBeup6vIAlXK2a3asvDAEgzNB2OP2tLS9FZAUXc73d6Rh6cINyAB2W6
	7sHL+47MULdlibkAhoC1xlNHHi+dRxUr06KoPYwsjpCHmyNXoFinrtxLyJy9qVlrDJVSjSC+Tx3
	BDmOKZ8qFw19zU+NkzGje2Xr7ZRLEjNBLM/MdlRL/+gkU2O3aCoHozLmVcNvHKqCYTjGLcQ==
X-Received: by 2002:a05:7022:790:b0:134:cf34:b8e0 with SMTP id a92af1059eb24-137f6a4c4e7mr2458828c88.9.1780536817745;
        Wed, 03 Jun 2026 18:33:37 -0700 (PDT)
X-Received: by 2002:a05:7022:790:b0:134:cf34:b8e0 with SMTP id a92af1059eb24-137f6a4c4e7mr2458816c88.9.1780536817133;
        Wed, 03 Jun 2026 18:33:37 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f553ab33sm2870659c88.10.2026.06.03.18.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:33:36 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 01:33:04 +0000
Subject: [PATCH v2 10/10] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-hawi-phy-pcie-v2-10-be908d3560db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780536795; l=23451;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=12KW9clOAozD452MIOmNDYymCgfcce2/rtjAZbxivRc=;
 b=p8Zgwh3Bjp7HbiWFW5tGhB+oWPhBxjeAXn5OSYhG4PejblcMW8XEpbN+ONYsGtF0TJw67DE8S
 74vYo03KZD1A6TM504zqLe1Iigdhdkd72nDguXWTKjle6DemVI5X9q1
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxMiBTYWx0ZWRfX6DRg/l60R4Xc
 18Rz3Mn8Adn1x0aYLnJzjL3VvofyJ8BvTY9LavBNqQkcGGw66qOhWC7R/w5eoDJpWpQETtQ8pWA
 g/oeJK7BIwHlguWpQM74FHok1lYMk2gJKoZ0GNzothk94usb5IQtTUM/pbW9xT0OqPzr6T0FKhI
 B4pi3dsGlo2YFEHOpuI8pgWAmKmMuNja98li6BX6J/9UdWWKKxmTmngeX9/dV4ZVN/yILBIrGWT
 939WB7wYzHybx2R3piEGVPesfNOtQDNSs40uzVp3xRE3dyeM2scRBd9bOYq0s01YudcQPgjzaFV
 hEkLc/SEbDY/jo+YNb0TuuECFQ3aqbfZ7DxKk2trn1yphfQcqL/aCzM8AmUiIlKDZB/HvcJxTfs
 EvUPIu7G7cB+Gy6shOElQZPedXsJ/adRMWYeY4rlGgPmgK0gHEoNmRIo0vPVQ8/6WqDnTKz6woz
 FjDaTwXN/URKbl4l++Q==
X-Proofpoint-ORIG-GUID: XnVLIKhE7Vg31mkTY_ctEddIgQ97M5zr
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a20d5f2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dz4cDvm8OFdBSD4W4bUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: XnVLIKhE7Vg31mkTY_ctEddIgQ97M5zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040012

Add the QMP PCIe PHY support for the Gen3 x2 and Gen4 x1 PHY found on
the Hawi platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 380 +++++++++++++++++++++++++++++++
 1 file changed, 380 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fb66e2a97ce0..2b3e6bb3d2bb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -118,6 +118,20 @@ static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V8_50_PCS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int pciephy_v10_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V10_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V10_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V10_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V10_PCS_POWER_DOWN_CONTROL,
+};
+
+static const unsigned int pciephy_v10_60_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V10_60_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V10_60_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V10_60_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V10_60_PCS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -3222,6 +3236,287 @@ static const struct qmp_phy_init_tbl kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl[] =
 	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_POWER_STATE_CONFIG6, 0x1f),
 };
 
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE1_MODE0, 0xf8),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE1_MODE1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SYS_CLK_CTRL, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP2_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP1_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP2_MODE1, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_ADDITIONAL_MISC_3, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CORE_CLK_EN, 0xa0),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_GM_CAL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH2, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH3, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH4, 0xec),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH2, 0x49),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH3, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH4, 0x9c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_LOW, 0xd1),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_HIGH, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_HIGH2, 0x49),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_HIGH3, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_HIGH4, 0x9c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_LOW, 0xd1),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_TX_ADAPT_PRE_THRESH1, 0x3e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_TX_ADAPT_PRE_THRESH2, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_TX_ADAPT_POST_THRESH, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FO_GAIN, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_VGA_CAL_CNTRL2, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CNTRL, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_IDAC_TSETTLE_LOW, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CAL_TRIM, 0x08),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_1, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_3, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_5, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_PI_QEC_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_OFFSET_TX, 0x14),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_REFGEN_REQ_CONFIG1, 0x05),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RX_SIGDET_LVL, 0x77),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RATE_SLEW_CNTRL1, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_EQ_CONFIG2, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_PCS_TX_RX_CONFIG, 0x8c),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_G12S1_TXDEEMPH_M6DB, 0x17),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_G3S2_PRE_GAIN, 0x2e),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_EQ_CONFIG1, 0x1e),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG2, 0x1d),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG6, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_OSC_DTCT_ACTIONS, 0x00),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen4x1_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_STEP_SIZE1_MODE1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP1_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP2_MODE1, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DEC_START_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_STEP_SIZE1_MODE0, 0xf8),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CORECLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP2_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SYS_CLK_CTRL, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP_EN, 0x46),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP_CFG, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CORE_CLK_EN, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CMN_MISC1, 0x88),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CMN_MODE, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_VCO_DC_LEVEL_CTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_SPARE_FOR_ECO, 0x02),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen4x1_pcie_txrx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_TX, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_RX, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_CAL_TRIM, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_TX_BAND0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_TX_BAND1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SEL_10B_8B, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SEL_20B_10B, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE3, 0x22),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE4, 0x22),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_PHPRE_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE2, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE3, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CTRL2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CTRL3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CTRL4, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SVS_MODE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RXCLK_DIV2_CTRL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_BAND_CTRL0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE3, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE4, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE2, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CONTROLS, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE3, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE4, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_LSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_MSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_VGA_CAL_MAN_VAL, 0x8e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_GM_CAL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_EQU_ADAPTOR_CNTRL6, 0xca),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_CNTRL, 0x6f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_LVL, 0x84),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_DEGLITCH_CNTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE32, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE45, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B0, 0xc2),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B1, 0xc2),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B2, 0xd8),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B3, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B4, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B5, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B6, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B8, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B9, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B10, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B2, 0xd8),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B3, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B4, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B5, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B6, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B8, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B9, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B10, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B0, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B1, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B2, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B3, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B4, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B5, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B6, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B8, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B9, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B10, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B2, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B3, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B4, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B5, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B6, 0x2c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B7, 0x86),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B8, 0x83),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B10, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_LANE_MODE_1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_LANE_MODE_2, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_LANE_MODE_3, 0x00),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen4x1_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_G12S1_TXDEEMPH_M6DB, 0x17),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_G3S2_PRE_GAIN, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_RX_SIGDET_LVL, 0xcc),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_ELECIDLE_DLY_SEL, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_PCS_TX_RX_CONFIG1, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_PCS_TX_RX_CONFIG2, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_EQ_CONFIG4, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_EQ_CONFIG5, 0x22),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen4x1_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_POWER_STATE_CONFIG2, 0x1d),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG, 0xc0),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_EQ_CONFIG1, 0x16),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G3_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G4_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G4_EQ_CONFIG5, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G4_PRE_GAIN, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG3, 0x28),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG5, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G3_FOM_EQ_CONFIG5, 0xf2),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G4_FOM_EQ_CONFIG5, 0xf2),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_POWER_STATE_CONFIG6, 0x1f),
+};
+
 struct qmp_pcie_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -3233,6 +3528,7 @@ struct qmp_pcie_offsets {
 	u16 rx2;
 	u16 txz;
 	u16 rxz;
+	u16 txrx;
 	u16 txrxz;
 	u16 ln_shrd;
 };
@@ -3248,6 +3544,8 @@ struct qmp_phy_cfg_tbls {
 	int txz_num;
 	const struct qmp_phy_init_tbl *rxz;
 	int rxz_num;
+	const struct qmp_phy_init_tbl *txrx;
+	int txrx_num;
 	const struct qmp_phy_init_tbl *pcs;
 	int pcs_num;
 	const struct qmp_phy_init_tbl *pcs_misc;
@@ -3319,6 +3617,7 @@ struct qmp_pcie {
 	void __iomem *rx2;
 	void __iomem *txz;
 	void __iomem *rxz;
+	void __iomem *txrx;
 	void __iomem *ln_shrd;
 
 	void __iomem *port_b;
@@ -3534,6 +3833,23 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
 	.txrxz      = 0xd000,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v10_0 = {
+	.serdes		= 0x0000,
+	.pcs		= 0x0400,
+	.pcs_misc	= 0x0800,
+	.tx		= 0x1000,
+	.rx		= 0x1200,
+	.tx2		= 0x1800,
+	.rx2		= 0x1a00,
+};
+
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v10_60 = {
+	.txrx		= 0x0000,
+	.serdes		= 0x1000,
+	.pcs		= 0x1400,
+	.pcs_misc	= 0x1800,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -4650,6 +4966,60 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg hawi_qmp_gen3x2_pciephy_cfg = {
+	.lanes = 2,
+
+	.offsets		= &qmp_pcie_offsets_v10_0,
+
+	.tbls = {
+		.serdes			= hawi_qmp_gen3x2_pcie_serdes_tbl,
+		.serdes_num		= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_serdes_tbl),
+		.tx			= hawi_qmp_gen3x2_pcie_tx_tbl,
+		.tx_num			= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_tx_tbl),
+		.rx			= hawi_qmp_gen3x2_pcie_rx_tbl,
+		.rx_num			= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_rx_tbl),
+		.pcs			= hawi_qmp_gen3x2_pcie_pcs_tbl,
+		.pcs_num		= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_pcs_tbl),
+		.pcs_misc		= hawi_qmp_gen3x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num		= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_pcs_misc_tbl),
+	},
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v10_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
+static const struct qmp_phy_cfg hawi_qmp_gen4x1_pciephy_cfg = {
+	.lanes = 1,
+
+	.offsets		= &qmp_pcie_offsets_v10_60,
+
+	.tbls = {
+		.serdes			= hawi_qmp_gen4x1_pcie_serdes_tbl,
+		.serdes_num		= ARRAY_SIZE(hawi_qmp_gen4x1_pcie_serdes_tbl),
+		.txrx			= hawi_qmp_gen4x1_pcie_txrx_tbl,
+		.txrx_num		= ARRAY_SIZE(hawi_qmp_gen4x1_pcie_txrx_tbl),
+		.pcs			= hawi_qmp_gen4x1_pcie_pcs_tbl,
+		.pcs_num		= ARRAY_SIZE(hawi_qmp_gen4x1_pcie_pcs_tbl),
+		.pcs_misc		= hawi_qmp_gen4x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num		= ARRAY_SIZE(hawi_qmp_gen4x1_pcie_pcs_misc_tbl),
+	},
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v10_60_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -4688,6 +5058,7 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
 	void __iomem *rx = qmp->rx;
 	void __iomem *tx2 = qmp->tx2;
 	void __iomem *rx2 = qmp->rx2;
+	void __iomem *txrx = qmp->txrx;
 	void __iomem *pcs = qmp->pcs;
 	void __iomem *pcs_misc = qmp->pcs_misc;
 	void __iomem *pcs_lane1 = qmp->pcs_lane1;
@@ -4708,6 +5079,8 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
 	qmp_configure_lane(qmp->dev, tx, tbls->tx, tbls->tx_num, 1);
 	qmp_configure_lane(qmp->dev, rx, tbls->rx, tbls->rx_num, 1);
 
+	qmp_configure(qmp->dev, txrx, tbls->txrx, tbls->txrx_num);
+
 	if (cfg->lanes >= 2) {
 		qmp_configure_lane(qmp->dev, tx2, tbls->tx, tbls->tx_num, 2);
 		qmp_configure_lane(qmp->dev, rx2, tbls->rx, tbls->rx_num, 2);
@@ -5294,6 +5667,7 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 	qmp->pcs = base + offs->pcs;
 	qmp->pcs_misc = base + offs->pcs_misc;
 	qmp->pcs_lane1 = base + offs->pcs_lane1;
+	qmp->txrx = base + offs->txrx;
 	qmp->tx = base + offs->tx;
 	qmp->rx = base + offs->rx;
 
@@ -5406,6 +5780,12 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,hawi-qmp-gen3x2-pcie-phy",
+		.data = &hawi_qmp_gen3x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,hawi-qmp-gen4x1-pcie-phy",
+		.data = &hawi_qmp_gen4x1_pciephy_cfg,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,

-- 
2.34.1

