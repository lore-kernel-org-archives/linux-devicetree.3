Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CFB36894D
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554430; cv=none; b=YTSw3SEmvzQcch+xnPOM+spAQ6FGmdjKnNYUmYX4T4fXEn/NFgZC7QEkxTMFWAyHkxol3j40Vb70VOkJmu/Z0BBFwEM5jDpGFLO95IKkeldtCmgsVDjFK1fXfPSGaEjgH0lH5T1lvk44CituS1qm5Xo7tPdbq12uAyI/pSw3Ff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554430; c=relaxed/simple;
	bh=n3x0cJOu246TSwgd6On6Ug7dWBRcqQbFbOZ6s80OiCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g+JLv7V8tLZc3xovDOQcWDjti3PXvBF+x/H16v84NTGlgi9m+x3fFCzRYiCuPoIeX6wzumUJVmXG5MTiP0oPaKK1Q3bNfoYngWCzY66wfGPrGmNLCO7s87e/bCk3bgZjwIoKkFbRn5uaVhEkyAfbNrIzNARJIVnkvF3T23hHNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLOXQWsc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2rKQHdl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLOXQWsc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2rKQHdl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RP3r2602541
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vxdNmJ62Dm4NfiRo2IDW9sWDVOYUVG5lo8mJcJ2cRU=; b=WLOXQWsc48obTFol
	p2ZSJvsmL6Dk0lv53vqVW5zc6aTtu0sErBQVvs/I80aOMqVgPj3aGP3e+LjTZx0Y
	ehl2fwjxJilKgPQucveV6Ek71zn7NgmgWiFkXcowujgKAr80JPrbhp0VplcFKun2
	bA/8e20zIU3kXHl/P+Q3xQWzQhlE6DMw+lCkqncf1TiT/TxFlGNjay6FEHpLk5yC
	FHlx7eGFJjd+FVunTyjxhXcAbaq1jquhZHqhEHG7MP4FLDlwMMYY4HpuD3+0REgz
	nz4tuq2R3FVuKBZSVLgn2nFNBg8rQ5r/aY47ix4xwC/ammZVJtBx8carZDMoh9BB
	4WPaow==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wwj7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:53:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedf42f199so3510538a12.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787554427; x=1788159227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vxdNmJ62Dm4NfiRo2IDW9sWDVOYUVG5lo8mJcJ2cRU=;
        b=A2rKQHdlXC6S77QGc5ALBty8OpXWUm0ZJK9zjRcFLFVARKFTZL7TQM/XrLc+u30tEd
         qcQDcpJ8qdCl9Y1ED2VTXywxrhZw4YdMa6wrRogR/a+KHIehVxRso2TjMR9bo8dj1uw0
         HCv+wTUbb6hM/33LRrK9r/jR6hpqr+q3Y6wYRqGhQWt2qctN2Ng4tQ3qO3gMn3/HGFM+
         QiFEuu/4pqwWyg18tVjKCr2M9K6jVOK2t85yj4+39IkWRk43VtzcAFiwoCYOAk2ZwgHy
         onJfVilFkPKtP+eQ1zhb0T+Laeo4mHG/Wg3FW/Em5pnzixiEIA7vLix0lG4AYhA5tlJN
         9/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554427; x=1788159227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8vxdNmJ62Dm4NfiRo2IDW9sWDVOYUVG5lo8mJcJ2cRU=;
        b=fdqOUNKsK589pz8BxPqMUdorR/Elk6yUcQFvt0xubxhAa+hRYVRwa3sjYehCrNERIp
         +1mkIhaeABE3S7OzPCZPiz/XZm2KEKZzF+Jr+IO65wD10n1FbD8qLy9s2DQ9G9vlhcCU
         U0sjuNWPjpLmYNr/IFFNDoX+kKnNEDPrMkLD4NkDytucEPGrB/zafpsGvLD9CdQCMnFX
         eAXt0rWzQEYNlDehmWq6rpGTqGMZHsfv6c+uELxkrpW04+9Ki0pJR5+DEAmOBmWCKhAM
         esyqBBFHwZP/t+5OEIvK4xHk9q9VwIox7cQFk6SvVt6GbnJkdF5ar/g4Z39a/bmSMsQW
         WoPA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9w4ZPc5oxaVg8PVexgi297ggcFQFcSu5MkyutzQYIrCzZ4gXTIgEEjqVXWqh3IpVd4ij6FLn4qYh1@vger.kernel.org
X-Gm-Message-State: AFuF++n8bQz+CtHKYimBE1qZhrmwc+GoDribBNXJr+EFYIt9zkO+jc3j
	uJOu5YU7K0kI2bG8v7VciKqI++BJwMrlU5P3p3ZEjslLHC8fqb/iN2D7UINEsEDbjhwNH2tp8/B
	v/rFMyO08M5rA2I6bUNdvVZ+XrXo0QaydtRZn57wYH6x2CPpJex30JJE+lIXuiEXN
X-Gm-Gg: AR+sD123HMREYPPI/pjL22H3LSD4Zc2GMsgXvO772FGQIFG85SKY45lQnc5ke3f3qrj
	430QndDtgP/7JqKzJJp3fYoI/FRi0glXvpSYbLUqKF/ZPES/kVr3UHOV27Vq9KNjFlWcg2zYjYW
	Bg7zxo7vjKJO08KRl4mI+bvWqe5u8h187I0zj4JCoRmKFjQGKaPJPMDtBsBMD01Cuj7cmai61qG
	MFmRT/MP/RGarVPM/byfDfFlTiH7srUP46Cj0OyiogNGiD5ymcS1RwPCGh66yLATpgdFHZEZcf2
	rCu4dNsicR0H4QNyKgXx/r40/e3Brd+g0pP8ioczS3LhmXpybKo+upcQF9T35XDr7fjqPVGi9/k
	IZyrKbyhTIYArA1mir3+ZUr6i
X-Received: by 2002:a17:90b:538f:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-395df29e128mr30994190a91.13.1787554427024;
        Sun, 23 Aug 2026 23:53:47 -0700 (PDT)
X-Received: by 2002:a17:90b:538f:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-395df29e128mr30994099a91.13.1787554426596;
        Sun, 23 Aug 2026 23:53:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b240e7sm8768031a91.13.2026.08.23.23.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:53:46 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:23:30 +0530
Subject: [PATCH 2/2] clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for
 Nord SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
In-Reply-To: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: i3Iv7bcih7BjrH83QrccYxgSXV6y8PcI
X-Proofpoint-GUID: i3Iv7bcih7BjrH83QrccYxgSXV6y8PcI
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a8bea7b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Izso3j8jpzlsbR86OAQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX/Uhr8enjipeq
 GKUFfyuG5i0OQei15Il5AVNPNoHS65MkNQCAyX3kD5E0IKUU2Vll3K6gMEf13JZpICzbJyrTVcN
 WxRCAgQGib1Bnt13nOUIS/c9qWsfHMjLAnwm7ODMGTc45l2XO6Bty3LUWnMV1duN3Fp5SmY86vw
 EHZR7TDCAE6tcNv3BCCmsxy3GY5jgMKvkgQTgtdAvD0RKAYOIXpCbN3G0eVzLNkHA2nR2/AHay6
 msA9YdcvB80peznO0QRzLRqlIaC9+gxkkL1X8GuaOGvgh1x93hQGlFz24R4VijD+2oAPC/J9XCL
 pHyAjunak/TF3krwkBagV59EN+ZJLiJ0pWw3fPuNpURlqgicbxwGmVhzvywWC3LlFPFOhtQKS3j
 Rm47Ga1RJDKOMGkMcZ1nsWFJwlmqzUIKWqwFllRJqAQbP18efAHDFK1Tt2oVIZbp1R9IEg1LNnr
 6YjQRd4vAI6dsBLjPXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX0jY05xqCRXpL
 UW2lvpr34tostVhNm0J6ERp1Va1JbYcExUIgTWZHiCYtzrdZVFTZ0wR9FLT4UH4wxw7SZjPn7ir
 R4CANLxNHvkt9+RkgZ3ImHdOsauLzBg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240059

Add the EMAC0 and EMAC1 CNOC APB clocks to the SE_GCC clock controller
on the Qualcomm Nord SoC. These branch clocks gate the config NoC APB
access to the two EMAC controllers and are required for register access
to the Ethernet MACs.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/segcc-nord.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index 51d7f83e21b6b2f2780088f26f547cc48801c6e4..aa807980d464d90e6a1ae209612b0ba9841bb35d 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -747,6 +747,21 @@ static struct clk_branch se_gcc_emac0_cc_sgmiiphy_tx_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_emac0_cnoc_apb_clk = {
+	.halt_reg = 0x24018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x24018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x24018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_cnoc_apb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch se_gcc_emac0_phy_aux_clk = {
 	.halt_reg = 0x2402c,
 	.halt_check = BRANCH_HALT,
@@ -894,6 +909,21 @@ static struct clk_branch se_gcc_emac1_cc_sgmiiphy_tx_clk = {
 	},
 };
 
+static struct clk_branch se_gcc_emac1_cnoc_apb_clk = {
+	.halt_reg = 0x25018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x25018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x25018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_cnoc_apb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch se_gcc_emac1_phy_aux_clk = {
 	.halt_reg = 0x2502c,
 	.halt_check = BRANCH_HALT,
@@ -1458,6 +1488,7 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_EMAC0_AXI_CLK] = &se_gcc_emac0_axi_clk.clkr,
 	[SE_GCC_EMAC0_CC_SGMIIPHY_RX_CLK] = &se_gcc_emac0_cc_sgmiiphy_rx_clk.clkr,
 	[SE_GCC_EMAC0_CC_SGMIIPHY_TX_CLK] = &se_gcc_emac0_cc_sgmiiphy_tx_clk.clkr,
+	[SE_GCC_EMAC0_CNOC_APB_CLK] = &se_gcc_emac0_cnoc_apb_clk.clkr,
 	[SE_GCC_EMAC0_PHY_AUX_CLK] = &se_gcc_emac0_phy_aux_clk.clkr,
 	[SE_GCC_EMAC0_PHY_AUX_CLK_SRC] = &se_gcc_emac0_phy_aux_clk_src.clkr,
 	[SE_GCC_EMAC0_PTP_CLK] = &se_gcc_emac0_ptp_clk.clkr,
@@ -1471,6 +1502,7 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
 	[SE_GCC_EMAC1_AXI_CLK] = &se_gcc_emac1_axi_clk.clkr,
 	[SE_GCC_EMAC1_CC_SGMIIPHY_RX_CLK] = &se_gcc_emac1_cc_sgmiiphy_rx_clk.clkr,
 	[SE_GCC_EMAC1_CC_SGMIIPHY_TX_CLK] = &se_gcc_emac1_cc_sgmiiphy_tx_clk.clkr,
+	[SE_GCC_EMAC1_CNOC_APB_CLK] = &se_gcc_emac1_cnoc_apb_clk.clkr,
 	[SE_GCC_EMAC1_PHY_AUX_CLK] = &se_gcc_emac1_phy_aux_clk.clkr,
 	[SE_GCC_EMAC1_PHY_AUX_CLK_SRC] = &se_gcc_emac1_phy_aux_clk_src.clkr,
 	[SE_GCC_EMAC1_PTP_CLK] = &se_gcc_emac1_ptp_clk.clkr,

-- 
2.34.1

