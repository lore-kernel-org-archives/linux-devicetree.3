Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA53CD8AF
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781586300; cv=none; b=UEqmVUsNHCNzGBrcYj9YRIaGp/91JoIgDottrnZ6K+8zzy6mKAVdfLdV4VRN8ylS4sdG6va8RshHmMXUBvwH/CIuC/QPRLRjfuPzNs/1UJe+qX2xd0SfFGj5neL5/0TsTn5tLeSbCwEQd4iMRJtkn6RQtG6xwzVJx60nv455VUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781586300; c=relaxed/simple;
	bh=522ymK08JkdlcgJ6dNMMAcWCAMBVZQoMiDFm4K0Swg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+oOMsyddoZiFRr9d4Dy8pLFSQvRsRXBDnMCiAAsUcmu1iaGq4aXP3lZ4Q2f0uPmZRZQdHPUwkhXX/uO3rIy5pOougxRRcetoMqW58PCkArXoYSLOlqgLPXhZdxQiyz+ZFgr2EZDiOQg2IHGQszU4V0Ri2kC/2QyxQVOAaaNTUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVB7qKJw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqSvCswl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVB7qKJw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqSvCswl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G1xmfR1690959
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0PA/J62BN19Cc/efH3oLJjcd1H+vsFI2pmpArI45rQ=; b=KVB7qKJwKuN/RUEh
	hdTHB13J9A8c3R37SGXno9QL9EsoQ+wwXFUajEn5jY0SR9BkjxwNV88pKanywAyf
	qaMk2YtlG6Wykwhy7KrB2fwYULnow1NLwkV0xhr82X7GDTz+d0DaWChJNJ2vgZeF
	aZG5c2q1Ii2+vLKq/zQbe/HwuZiOks4fCUbYw+JuL42INmvSmni0+ljKSKfP+7gC
	k6EvhjIu95U+rw49hGxc53dVP9XMIGnmix1DsHFImt8P4hucsf0ShYi76dOTN6Ul
	Dks8Iis1avFh2KKApHcgmgjsAWjx9uAw21md9W22i/6U0jNQVrV0tOT/G10ncrs7
	jTWxrA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjvwav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso4737023a91.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 22:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781586298; x=1782191098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0PA/J62BN19Cc/efH3oLJjcd1H+vsFI2pmpArI45rQ=;
        b=YqSvCswlu0gsr2Q4MbhFc0rpIqhRJPQtjg5kmZk4TCzW1f/x9VuCXnq6XV3eWEiovJ
         rivc2g7iCKxHRvWBgVXbvdjpsqU+WbQ5FloW0LK17kvspsgDSuxeqVWOOWveRVvr20HI
         KTlmWbMal8/vYOX0zuK+7ETbN140v2oVK0BVpZooS0fm+wOHdH3RALAWM4RUur5nKEUW
         ikw9N4KBz5pOvmPqxrD4fw5E83i9+HDb0w8Pvspbu5LZkvdz2pMkCQ3gghCr27bLNnq/
         LRHdK/vIT9Ayw8yAR4rl3sXmh4ghug5n4g//xqHwiggqTS9WCWDZiV9pQa+naHpUJryo
         JTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781586298; x=1782191098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W0PA/J62BN19Cc/efH3oLJjcd1H+vsFI2pmpArI45rQ=;
        b=Aq23yHt8J5WwQ2jKIre6nu6g7EQ3OFfE5FY+oajdowOhWjcbaaNe0++MGEjyQEhjII
         9aCAdx3oRL3Ajf9/L3RUerjrROHNWtziwWYaLj72PkpQ+29e0VEYv2oKGwAnjLnajz4f
         crVBnB/mlY8ZEyr1kBj6qo2TnjHhJxwPKgiPhDqiinzriC4nUKEQ2daLP+CMnPEZ4Yf+
         mjbermZPD5MvIhqZBokrw7wcit+81ujxoRbLZATSiF+WETltUjzlABki0qwOV1mqNsrA
         F1bYNHSvwusk9SKyquMLl5cPwO88fgxZJBJ7ioaSmupKuHVcfxDiAu0TnlS2TNXNylkP
         cLUg==
X-Forwarded-Encrypted: i=1; AFNElJ9WTya1mslZMYc2DjhqeUEAEfzJZPcpULcDag/HVTj/co+k+kgmqNJ1QblsxkskxT+X0lZwt6OIZRtg@vger.kernel.org
X-Gm-Message-State: AOJu0YyIBlaJ7aidHwUVfOyvUsMBXFBJLnZZ2aiESRkICqdFTpyUTrc/
	8slxA9Dh7ZpkIPlWDP+jNSkxn7BVKTvnctbY0pMRscEOO8q4VjDca17hVhDnim4HQfKq57Eyoyi
	k2z4dqYcIy5FG31eOHDlRrZCUU1msGdSQcM2SjGrEU3ZdkLkwYxRfQthg29Y3khkb
X-Gm-Gg: Acq92OEyqUTWFcvPMa98ksgc3GGYAA9Ju1QNgqXBxsJOtcsIz8i/YZ1ETg+/VG0aJvW
	AiYcYedJbyppQ/JkuRp7IYImgES8yC7yBiIcyX21H7QAyflapEivtmx+j8QkRKmPHSeualZG0NK
	yGzc7h/atRrGk3Sj18Y/DW6DHnWHczW+wk9dxS6/Yg2G/2R0h4ycC4ujSzrVpfgqnp9WhIaP6ML
	P/noETjrVPaTy9fNPCouygtyKIACplwMlFzVh7RJgTfxloiw8JXOSPPXe/lNokHmXR+9R1/k+r1
	3FZeCxyTBV2Nzhbih693eGrUMWGmW8gXba9zXqJayAlpTwXG220Tayq4a/4J+qIdEoisiB/vh2/
	MGQDF4ZZdK2SI39iWE7qwfY6AVMzpUa3au9d7FdxfQXY5kKhqVYXcHkRdgFM1laytOhZcc/yw62
	CDIU/XCwa5XPbNsCehg3qJxSQUd1dFjoSo4nOoEft67+Ivhd0VlbA=
X-Received: by 2002:a17:90b:1a8e:b0:36b:a2cc:4857 with SMTP id 98e67ed59e1d1-37c528fef3emr1977162a91.18.1781586297969;
        Mon, 15 Jun 2026 22:04:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8e:b0:36b:a2cc:4857 with SMTP id 98e67ed59e1d1-37c528fef3emr1977127a91.18.1781586297457;
        Mon, 15 Jun 2026 22:04:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm128957335ad.14.2026.06.15.22.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 22:04:56 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 10:34:42 +0530
Subject: [PATCH v4 2/2] phy: qcom-qmp-pcie: Add support for ipq5210 PCIe
 phys
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-pcie-phy-v4-2-504677c3d727@oss.qualcomm.com>
References: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
In-Reply-To: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfXzaAum/7v76TN
 eEzNNew3m0E/IGPSqoJA8fv6djOQmBl0IZQ66/BaqW95b4khQcL5aEHFCfLARI+ccJ9b5TVYtpN
 cVVDCN8LugAR69eys1pByAYpjB7IuxLJUcCOzGAW9054eg5vvkieztIeruvKIcuHKA91Lkhw/nL
 YNXCM9f+cNHKguUO5EIPENrJ5bvwGNR+9E9motmHAU7x6EueYQWMCnl9vYvN5Z0y2/qvkq0DaOs
 RN4jD0HWcoMUxgTmi1CxT6kTuWwaXALkl/d3xQhrJE90gYMyHZMcVzQBm4CP1IfXSKBQ7kFfQTq
 g6GreUttCNF9WAt8jBxuvAOcXtn3TEO0hrab7he17kI6oTExWB+aFyur+OcLrp+zWR30OEjnuOx
 ESvDtyhUtK313zNMOLnN1r9bo5UT3snfEmVRVDU9WF7sSb1uFnlKbD2tPOB6InebRiRXH+tCSUX
 cji3Y3JmDpc1qgo1QEQ==
X-Proofpoint-ORIG-GUID: M8v8nf1UPjrKuV1W3BiNjzzOVXR1pTmB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfX6OEck/aYIrD2
 39uFA+h5e31ioVERC5vb1MeHEPVDOgnInjJo3KQQ5Qil+GC9Rhi4OaF1fF4JL5Bu8FNukQZz2+t
 uQxswhJNWBdmK2ukdmkr3OCtDHoRErs=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a30d97a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lQuujfteSIboIXYB3dUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: M8v8nf1UPjrKuV1W3BiNjzzOVXR1pTmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160047

Add support for a PCIe phys found on Qualcomm ipq5210 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 129 +++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..1762ccadc793 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -620,6 +620,89 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 };
 
+static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TIMER, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_BUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE1, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE0, 0x23),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE1, 0x23),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE0, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE0, 0xfe),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE1, 0xfe),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYS_CLK_CTRL, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x10),
+};
+
+static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x61),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x73),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_ENABLES, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+};
+
+static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x11),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG4, 0xff),
+};
+
 static const struct qmp_phy_init_tbl ipq9574_gen3x1_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
@@ -3746,6 +3829,49 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.phy_status		= PHYSTATUS,
 };
 
+static const struct qmp_phy_cfg ipq5210_gen3x1_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_v4x1,
+
+	.tbls =  {
+		.serdes		= ipq9574_gen3x1_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_serdes_tbl),
+		.tx		= ipq8074_pcie_gen3_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
+		.rx		= ipq9574_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9574_pcie_rx_tbl),
+		.pcs		= ipq9574_gen3x1_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_pcs_tbl),
+		.pcs_misc	= ipq9574_gen3x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_pcs_misc_tbl),
+	},
+
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= ipq5210_gen3x1_pcie_ep_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_serdes_tbl),
+		.tx		= ipq6018_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq6018_pcie_tx_tbl),
+		.rx		= ipq5210_gen3x1_pcie_ep_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_rx_tbl),
+		.pcs		= ipq6018_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
+		.pcs_misc	= ipq5210_gen3x1_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_pcs_misc_tbl),
+	},
+
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= NULL,
+	.num_vregs		= 0,
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+
+	.pipe_clock_rate	= 250000000,
+};
+
 static const struct qmp_phy_cfg ipq9574_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5543,6 +5669,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy",
+		.data = &ipq5210_gen3x1_pciephy_cfg,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,

-- 
2.34.1

