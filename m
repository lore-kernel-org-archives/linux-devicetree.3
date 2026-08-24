Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC33EB0FB
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553491; cv=none; b=UBeNayg8a9XqO6BTwC+1C9wtsrjzTe0z/ZYNp2AUmBmb0gr5GnKpQkPTNBuaM3X9RMw5/BMevk4c5EWmnoE7xyZ2VWPUiRpuFK5GlBG5ikf0JkVMUsledevgzZxZpvUnJLLdxiaOY91RAEOsrCYR4Sz7BwnUJqflxClIxseGM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553491; c=relaxed/simple;
	bh=BY7Re9ZAKiJC1aF4jDGHOuCzEmdjn5geHIdnW6RHsU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MViz4WM5PowQWFtzfs5LmrfLwXP5dfSWghfRW73b+zvybzL8wdD1t43IkB6vPcAdWeuQUwpKW+ZBJWnwqx2egH8VpPJl3sZY4cnK5eUwrCurdnkq7+mgdUODV+NwR9He5P3QCwLJJvEeYb+9rHysAD6L/qlHUmuTRMRd9UWjpP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZgbeGYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0gZOZu3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZgbeGYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0gZOZu3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RMYw866865
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/werBemlVnDaMAXAHg5cgVtJvw6t+Wx76nl38H1JEI=; b=fZgbeGYO5IOkKODp
	8rnGdlSNV+7QZlOiXhNOHNGP4XYMtM+pNGCaqIHG1JYVS99ilyKo7i6rB778vXIm
	HYWJ2fpGhTqpvzVA32xkDU0xnQHCn2Ff13qaqXYoLmaGc+vr2rZFQzB/APV0h3lR
	UEFoF0OhloDKuszrHoMGtxJI8pXMJtPgAD3wgbcbvOU0pNtCHRcQhihOeM4PvE1l
	E5Xl7nuWAcbj9J2C/2gsaC3vf72mTQPrDMTB7ajVCG4xJXm+j0Oqx7Z9vmRuiv7H
	pYchF3ywX7V/R0+CPx2VfKRTewUg2WowGo05ZLTuCTnVqA/GHOsNf/9KsUnFjg0/
	1xKjOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwne1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5355159a91.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553487; x=1788158287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/werBemlVnDaMAXAHg5cgVtJvw6t+Wx76nl38H1JEI=;
        b=f0gZOZu3h5AkqKclv4Wu1Q94Y+eJdoZYrE/CDBL0NQGYPODldVBD8ekico56Vie6sE
         CoHCvRkK/8mmBsEHBn0UJ1g+7ClNXqSHU31165x/w4r0sGRc8psVcr5Qn5beWv44rT8C
         FfR2qJ3VYWCAKv90BA6ouondFJd1IAn4/e76mcLrKOu2qPJTY8SgoDSOQYwpCZSccpLt
         ZpnGTQg+rDJMIB5gKH8iPjftM/J65CPvviOVRgISuxN4BAdE7aoUf1lGSuH1MXh9EWYS
         m66xu8ciTdUvoqYp0M9Jsrac5WPo/R4rygvDw8eI2peu2mQGE8kNBEyLsfHzRrfXJ5QP
         CRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553487; x=1788158287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/werBemlVnDaMAXAHg5cgVtJvw6t+Wx76nl38H1JEI=;
        b=Vz3Adrs7ccI5L4rz0EmS4thwYXDX0ZkZCC1mvd4YEj43cpzKkiiD/NlBrk2TfAotVf
         NgwteYTSlOu0RMB3kAa3ty2yLqrT3bKb/cNEePdUkzP3aGMmPNYpCmK3FfoPKfZZZ5AT
         KrWGwPDUTOt4HWiHKheFMYgtCYuUg9l8xdDH5Uag3KnofLT2MzBL2KsP2M+7jQEAjypy
         342ykbj0Vpt/qHAVjMe0j93YJFi1DVjE6mCcPt8kmcZmnOo5wLkuCXcWadxDUyY6nAKE
         7xInbA3o26FMhqEup4AfFsDqVS6PqUsR0CCrjYodAgwS9HLmUPnW0itfJHNDJNwxpQ+g
         qRxA==
X-Forwarded-Encrypted: i=1; AHgh+RqGks2UCx/5WZx/KZY8VNaXih7oVd94foV23dG6jFRegCpOc7twg63p7Yaga5umWjFcTXO3aRAXsA/p@vger.kernel.org
X-Gm-Message-State: AFuF++n2OPtgwBaOC3hUsX0/FT+uQxgiULITlFKqhpkv2NwC+u2gCUhh
	I2a5KIh4RLU0qDoymutCnwCuIVd9l6BTXvrRWs/OpiXh7T3sva+Sm0kfbGoRHzB50HLcJ5veECu
	bDXp1T2XhPRXOa3SEJYCWt9WayPPvix+3xVPLhUBXdF17duRLk6aCvsFgk6zzaz73rj0vnxFb
X-Gm-Gg: AR+sD13r1iY8EdmZ4lOHxk8HM145ZSuQXsUXqga24sp18vrIR52pr5kNWWXY/AWEG/P
	sQSJYdiUpCrfZh4m5Xy807FtX0jnSesz9zcq3pCloKHQhBUV7rMWdkmW9TMlZrFRlnVrDzM3P4U
	6nPJc2KNThENAIvj43ZQL/Ut6OQ2gKeoxowRXo5LFQ5x9AzbPTQ9iZArN/pmLeovH0Nc01DXE3w
	mqMj5ymHmo7MQ/rmmo48KvfVN+VHG+7RqGtDQnD1vszUmYMvQIyzFAo6iu3/qQBm4V7JqcuxUSz
	5pKTV8kNLxK0BwMRxG3NEC8Yh5o8n72+1JihZClB8Ewa8TuQArPpX/nVarDjf1W7IYLHDIrPNVD
	XtuMvkogIdyrgxPo95MZ+8JLW8uuoPduqn68zKDHOSUCTXpSmcx07Dlj/sKaUQT79AVsIbHG9gY
	8G8G8Uq5bG281qDe+wi0oNa9pOqGjnqg==
X-Received: by 2002:a17:90b:58cf:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-395deec0e5amr31268916a91.6.1787553487563;
        Sun, 23 Aug 2026 23:38:07 -0700 (PDT)
X-Received: by 2002:a17:90b:58cf:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-395deec0e5amr31268824a91.6.1787553487109;
        Sun, 23 Aug 2026 23:38:07 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm21667830c88.10.2026.08.23.23.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:38:06 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:07:43 +0530
Subject: [PATCH 3/5] phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-phy-v1-3-257d68a3210b@oss.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
In-Reply-To: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 9sCS1qTx5_2JESEDVRjYHxrl3cqfwk0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX591upyrC2kBw
 iUP3LczFc0jkteQf0LR8S6q2tZbzghVs5IEbjSvlyhSFraqMnBUmh9jjAarG6Ba01y6Vf155Zh9
 R/n779AmCDz0dN/G3yO0Mtn50ACNxufXxZOurENwXEXV4WuW5Zoizf3gulmnl9xFaAnT4haFMDm
 5AeeCReHDykJsj2gWQKFfzGdHm1oikwWg9Hb+zwHLcu5qluEZJGK1NEt6bCuBSPwjzJYNuwFfMU
 GHrbznMpMjf8mFq/aXTF4uqowU0efsIyFOcm0IOiREgbjl2H4AfNIHBjxQ3FEt3VOptRP+voBvS
 MfhFzqax5xjQpqf2n5i8YdZXXVoAC6xyv0kvx16v1v7LQEgpOVMwYHJI9WPWHJcgAyhJcJcLo3P
 T55XmI6D0JcxIRQVoSHnGxIN83ipsTPBICOKY8rJzEy839U9YeyWpQPb60UxuBqEaI8wPiEKjjl
 RP8KxCFhsMSV1hf/BIw==
X-Proofpoint-GUID: 9sCS1qTx5_2JESEDVRjYHxrl3cqfwk0H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX7J4zm7nKaRTu
 2N+FOMwfUjQMnRw+oxhqduAeAAU4j/SgaWgsNsw50fMCzZkSpie8sHAwJLpOoxdBO+xpHyiX/ne
 MMjTtWDBLtgnXwp1S53QECY7yAhPpAQ=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8be6d0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1pfUWIqQpZhN5ooAS-4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

Add the USB3 QMP PHY configuration for IPQ9650, including the SoC-specific
init tables and compatible data.

IPQ9650 uses settings that do not match any existing supported SoC, so add
a dedicated configuration to allow the driver to support it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 118 ++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b0790bcf0bc8..e772e1fa27cf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -400,6 +400,101 @@ static const struct qmp_phy_init_tbl ipq8074_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0f),
 };
 
+static const struct qmp_phy_init_tbl ipq9650_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_IPTRIM, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BG_TIMER, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x01),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xb5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x00),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RATE_SLEW_CNTRL1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL2, 0x83),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNT_VAL_L, 0x09),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNT_VAL_H_TOL, 0xa2),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_MAN_CODE, 0x40),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+};
+
 static const struct qmp_phy_init_tbl msm8996_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYSCLK_EN_SEL, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
@@ -1596,6 +1691,26 @@ static const struct qmp_phy_cfg ipq9574_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout,
 };
 
+static const struct qmp_phy_cfg ipq9650_usb3phy_cfg = {
+	.offsets		= &qmp_usb_offsets_v4,
+
+	.serdes_tbl		= ipq9650_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(ipq9650_usb3_serdes_tbl),
+	.tx_tbl			= ipq9650_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(ipq9650_usb3_tx_tbl),
+	.rx_tbl			= ipq9650_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(ipq9650_usb3_rx_tbl),
+	.pcs_tbl		= ipq9650_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(ipq9650_usb3_pcs_tbl),
+	.pcs_usb_tbl		= ipq9650_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(ipq9650_usb3_pcs_usb_tbl),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v4_usb3phy_regs_layout,
+
+	.has_pwrdn_delay	= true,
+};
+
 static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.offsets		= &qmp_usb_offsets_v3_msm8996,
 
@@ -2483,6 +2598,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq9574-qmp-usb3-phy",
 		.data = &ipq9574_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,ipq9650-qmp-usb3-phy",
+		.data = &ipq9650_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,msm8996-qmp-usb3-phy",
 		.data = &msm8996_usb3phy_cfg,

-- 
2.34.1

