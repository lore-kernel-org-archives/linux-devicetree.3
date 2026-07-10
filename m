Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46A5351C2A
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705626; cv=none; b=FwsCtkgHpPZryduxuXgBFwQEOlnYXKQnN7YRZiVfOfJgLgQ3H7fdO1HqEH7c0QaEc2sBeJJbJOV4sa09mFPfMXK/uLvfBrFF5lHGOhmOWsnzLHvklT4pXgjinmF6US4aDNVSJHlVt9+LU7IUw6zywRsha1haljrx6bmFadxdK0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705626; c=relaxed/simple;
	bh=gG9ubWDV8obkYD9l7fRHTKuA4wg9civszzpkiQZvLHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JgfXijakxpoZDkV9kyvWSDNyHchTeYTipaVo4TsME+tUOT174Mhw82ExdxIwZ4nknaMHP/FdgDHJaUdNbjSymS32C9l9ADX2/PzshuNpKu2duSXf80EvF/ZRWXrx95h1t5JkNF0aPTIEqFamP2nHGhgG/Ac3bl1d6CDkvBPmHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjcD0EBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DN+LZsHZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjcD0EBi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DN+LZsHZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3tBw1325625
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tjV/CkAxIWTyslaFZ2ocLePAkLaXs/ucx9oU2hGAhH0=; b=kjcD0EBieuvAOV31
	lQqVq3iyS4N7yy7bgNOqQEWiezBhyG2RwkKiKQlIXyGiwewK2ISz4etsEiFJSe6i
	PoWq06jY9angV9g9iHW3cTEGKXjM93VsoVdZ1/1rskgp33i5pyoTmXaU0ZTVFRWB
	Z+6AH4GqTOV8udrf+7xO0HZSn4MvR8bSej1oYoSsgRzUytzJCMUTVpyz8qMwt11w
	dHnKLKkWME2+oHMfPi/qFbXPhwimTGlyol0A+umcVL8NPEu3DX6mJ705pfAvm3lO
	M01spGG+GqKeAmdvVQR4g57nOMtrIjBKinaX9Us+INC0v+kF82R1KjSuoMdW810R
	Sg7luQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb339rk03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:47:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so1417531a91.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783705623; x=1784310423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjV/CkAxIWTyslaFZ2ocLePAkLaXs/ucx9oU2hGAhH0=;
        b=DN+LZsHZAZ3spOa1dOCGHZpORJ7LI9oO4YXSe48RGGzeBTefmHSlNP6gVSnU/lDbdB
         RYH/vhL6YCxhraykCNtdFNZRqj0tR6gExJkfK47OoGcm/3pbAbUn/z5xFsgIx/nv/Ref
         D13coWE7ye4cVYgJLLd2FxmGVwQXEwdUZvSVnK/dO5QdeREbfWh1ph2lodjzdev+Ak62
         GXfSBEH1fEx2MTn2X9cR93xeffeJfNKr+bzXKDzHyk0rY9WAt1RsFewnx/bsyEXl98CC
         JsfAQykGjlbbUVR5z/tTZh69NCXnlcXxTEV0sxDsV46IXWnwiuJ0aGNwkjMjAFLjljoG
         513w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705623; x=1784310423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjV/CkAxIWTyslaFZ2ocLePAkLaXs/ucx9oU2hGAhH0=;
        b=IO15n7a4Zb02kaYvygMfPf47F5wAyWUhXNN1wK/H5vUDu1BRzbO3Yzpaur7ZTqfh4U
         9LPNBFRsk9mlE8/XF1Xw+TyjCt9+yj57ca4yjHTe/YPhGPe5uf/++nZ8M291Tate8zSE
         Ho/E3WqtINR23i+C2S80LYz98U/yPb/13TVws4n82ESd1mqgmonsgesuYEcw/pfTcqCK
         o7z6TsvQiZJivhCKjWB7OU3WdckZNy5lOcnUiKCQBcNCVItye3M5DgCz+Sym4Ct+tjdH
         coPWWaH5GqriwawBqSs8LuOs+eUZcVfa5Wo08C3EHwfmp2u5hqEol35Enht6Zm0Hj81L
         45hA==
X-Forwarded-Encrypted: i=1; AHgh+RpqhpDyg1rDKNmZdwtaATGgKBqIkQLQm/JEj1/XEL7v5U2oQElfu8EjXRKzKi4yMPL/bgdEMyS3wivB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+b0xJrXzDbs2VuyrMS1Tt360o45r9Kq81bV8FJZAoC2YQ1gtu
	Ot7kd3Uv7sajjjqoxR7QEe84SGlrLqTQ/QB3LtefRiSy6euV/nYEEQAsPWLmST74HYvjsVagdED
	NvW8g8oD0sMnt+J5LDQVLiSd8anfQX8q+dSIwE/2VI7D49Ok76B3PpesS0lwRtyRJYB9xcqhl
X-Gm-Gg: AfdE7cm6HGNneR1mMk8yhkp75MDyetNB5+g6dYoruZ9xDK8ZIAsrrSUH+Id7e6DWdcy
	nhn4PV9WSw/sCq/yf3c3Jh/BX7y6NzeHdnVtwDR4+D3Oq2Bn93yfd+rLAVbZBh+UGvV//IPX+dw
	lEMfAXcxA1OINFlH2uGnJgMNslq+ERWHbMfAGkAP2cxxk8Tk2l96D88JnDWjbAc6HvXbKd7yL6k
	/OsiIbL7vZQM924K+OXmlNyqT6FnZQ9Zt8sCnmlcjwPPED3Z7aPhhDVj+DQoHmVAhNrAHQ3wSZS
	9S6sPoitJ/zEFHkoPrPI3PJPrVOUtnxikFqPeUYzV6OB4rHv2ut4Mcow8Q4+ckk8EuA3ekPl+29
	6/gXYt4pqlKvmqQdArq8PhowNU8nBFyqdNzMYBJq89l+fwGwSfPkk10sGovz09tlvSluy+8yuRy
	/r5FaKvrt8QGnLwv2Qm1mR2ql7bjWBo5vMOMWwRDYYObyXHg==
X-Received: by 2002:a17:90b:3b8a:b0:387:e0bb:57f3 with SMTP id 98e67ed59e1d1-38dc7792414mr390a91.36.1783705623052;
        Fri, 10 Jul 2026 10:47:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8a:b0:387:e0bb:57f3 with SMTP id 98e67ed59e1d1-38dc7792414mr361a91.36.1783705622442;
        Fri, 10 Jul 2026 10:47:02 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm33008273eec.9.2026.07.10.10.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:47:01 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:16:41 +0530
Subject: [PATCH v3 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-ipq9650_pcie_phy-v3-2-ef6018818d33@oss.qualcomm.com>
References: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
In-Reply-To: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfX+hRaX6V3qtw7
 C7qOFBhx8H8nPsQEtj0s9KOoFdiX8Oi7eoiiO1uxT91azMOc5qHjvkVSGvRzkASPlMs4i5Xkx0R
 lJOU59lh3NDOmpa5ujnA6XdH8pTTgRc=
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a513017 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SzMj-Qgm2C8wWq0MGEoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: FlYf8H-1XqQwxbbgfqvuJCtPqj7IB320
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfX6PgrqbogpW64
 vGQAtvQ0D6KcT5BLMlhr+CjRbJC/21TDPIsMvJ+5uhuf853vGq1sJZ3qyJ7nEGRVEHUjWJR24Ol
 gZFedM2HV5A0Nv1cciODhIIsZT6+Gbi7bNAahfKWGNitUB5Z1rKqYxwh639UEM/2Qo+1YoxFdw+
 O5Si2QXA0BYTs7UIO7ciVXC24phyKPRsm2XKV13LOLdZHuXTBkSAP4jPtv7Bmw187EfpCXOeHVk
 SFMeimNd2L1FbtDmJ0BdtlEPgPyctLpcQr2cGR+BXMeFGB8IK0XAVUccXBg6jd/FQbMyl1AZOW9
 vRsZRkjSTzqRZ7eSUhWW9RSJSnyvnZMLfeWoxXUe4O/4zBg4BVWYeRJl3Z93+lOaPdJDgFOk67V
 Ftxe/tRPteMK+mmoeHNQh4gnpdm2EDd3QwsK1nMHdRVkXQUU9A0jV3iVmjDKawkonn5G5db8OVE
 vP4AX/zi+rQbD8Bd0Sg==
X-Proofpoint-GUID: FlYf8H-1XqQwxbbgfqvuJCtPqj7IB320
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100177

Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe
controllers and two Gen3 x1 PCIe controllers. The PHY instances require
the on-chip refgen supply.

Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with
the refgen regulator supply. Note that an on-chip LDO, driven by the SoC
CX, supplies the PHY voltages without requiring software control. Note
that IPQ9650 does not support CX power collapse or rail scaling.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..c832db6c8953 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -857,6 +857,152 @@ static const struct qmp_phy_init_tbl ipq9574_gen3x2_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 };
 
+static const struct qmp_phy_init_tbl ipq9650_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_MODE, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BG_TIMER, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x53),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x29),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xb5),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_HIGHZ_DRVR_EN, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xb5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x00),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_VGA_GAIN2_LSB, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_VGA_GAIN2_MSB, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_PRE_THRESH1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_PRE_THRESH2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_POST_THRESH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_MAIN_THRESH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xec),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x67),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x3a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x25),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RATE_SLEW_CNTRL1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG2, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_DCC_CAL_CONFIG, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0x77),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x1c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG2, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P2_P3_POST, 0x34),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P6_P7_PRE, 0x33),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P6_P7_POST, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
+};
+
 static const struct qmp_phy_init_tbl qcs615_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_ENABLE1, 0x10),
@@ -3484,6 +3630,10 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
+static const char * const ipq9650_qmp_phy_vreg_l[] = {
+	"refgen",
+};
+
 static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
@@ -3527,6 +3677,14 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x1 = {
 	.rx		= 0x0400,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_9650_v4x1 = {
+	.serdes		= 0,
+	.pcs		= 0x0600,
+	.pcs_misc	= 0x0a00,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x2 = {
 	.serdes		= 0,
 	.pcs		= 0x0a00,
@@ -3802,6 +3960,62 @@ static const struct qmp_phy_cfg ipq9574_gen3x2_pciephy_cfg = {
 	.pipe_clock_rate	= 250000000,
 };
 
+static const struct qmp_phy_cfg ipq9650_gen3x1_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_9650_v4x1,
+
+	.tbls = {
+		.serdes		= ipq9650_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9650_pcie_serdes_tbl),
+		.tx		= ipq9650_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq9650_pcie_tx_tbl),
+		.rx		= ipq9650_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9650_pcie_rx_tbl),
+		.pcs		= ipq9650_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9650_pcie_pcs_tbl),
+		.pcs_misc	= ipq9650_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9650_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= ipq9650_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(ipq9650_qmp_phy_vreg_l),
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+	.pipe_clock_rate	= 250000000,
+};
+
+static const struct qmp_phy_cfg ipq9650_gen3x2_pciephy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_pcie_offsets_v4x2,
+
+	.tbls = {
+		.serdes		= ipq9650_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9650_pcie_serdes_tbl),
+		.tx		= ipq9650_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq9650_pcie_tx_tbl),
+		.rx		= ipq9650_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9650_pcie_rx_tbl),
+		.pcs		= ipq9650_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9650_pcie_pcs_tbl),
+		.pcs_misc	= ipq9650_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9650_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= ipq9650_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(ipq9650_qmp_phy_vreg_l),
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+	.pipe_clock_rate	= 250000000,
+};
+
 static const struct qmp_phy_cfg qcs615_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5558,6 +5772,12 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
 		.data = &ipq9574_gen3x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq9650-qmp-gen3x1-pcie-phy",
+		.data = &ipq9650_gen3x1_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq9650-qmp-gen3x2-pcie-phy",
+		.data = &ipq9650_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
 		.data = &qmp_v8_gen3x2_pciephy_cfg,

-- 
2.34.1

