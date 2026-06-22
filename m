Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F1435BDC2
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105102; cv=none; b=n1AYTCEVw/a8tg4TEsxULANnqpwCLowb+VbJ0ubhOxiAphSQEygLk5JkIr/+p06JJnfS+XkrFd7eIM0W9Pk7G/jc1zIRJx1zhuG6tEhorXkMoQM77QTCxw3I0z2obpcFf1t1t4fKV5U1WKlIZ34EvNXnhDs6TxmrzdN1RnR1K4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105102; c=relaxed/simple;
	bh=rw+jGsr4GUmMEn15wX/6cDmASyIshmLyIewu6Ex4SSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+rXSluwLRNe+3wKOzWVe0ySgpm/3fIHKHaBrBVl+hYqvLJB5z3rrytPqUIlse4yW27R1De+GPAo7OrnRs/x5ASwWrC7OMlc6y+Vy9pqCtZaFXUEcdVOqsIfwZCWPC9kzgCtBpyQ9QUwqQ7OObAwUd/Uht2oSIgsaJ46i2QxVBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYCwCspw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mr05nnYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYCwCspw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mr05nnYk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59G4A1275458
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mn/qVyFIMu6IlzLhpxr4K9csqV7Oi92rZZJCZ2p710A=; b=XYCwCspww4fB6MRA
	KF8z7EIL3ifQYwvco9T7HNX0neEu1QUEmo17ieEoDWC+SBStng6Lk8fyAldFB3d7
	BNvRYfeqsuA5AF4v0H1lWuQMDJkyq+XDcIszaH7gNCKRxi7DjMUjFb8Kc/kkvTTN
	/thXSeLHaAzOAvHSw3BtP1c2am1fPImf31It23SsWFw4xAWzxkgzl64qOjarA/Fe
	Eke/X3eFfG1Jtm8z9qEAdofI1OeK/BuwVug1lc0xCTYqSAPNN7jg+3X+kmqDE2ng
	qqXDssm/t1CxRwtRvW+nbV9JE0zNRGZ7Nbnt1uF0Pgmt37/QKpLjnmcJIX4UJ/O9
	RNMGjQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32vsg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c13bb8ca9so3784830eec.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105099; x=1782709899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mn/qVyFIMu6IlzLhpxr4K9csqV7Oi92rZZJCZ2p710A=;
        b=Mr05nnYkezwO/DT5dbui0z8gF424Pj3uguHqBJJLR8QlQsjuMcIDEDHSoCLcPCNXxX
         IykXKfcqvMB1nMuZQMorMiCPETRMYvqGpmjj6prXZ6i2iTiMOmKbxYBSJyG/z1ea7eTf
         D2MscWCJdHGCaIC/xtDhSZJlRFO0vuWWf1OEh1qDa/YRbaaN6llet5V3hqUharwRKYdM
         jgexrVA1KlEruqt/G7vU5+Q0bwrFLE2MRGWvXVXeAON18n0Rb3NCvC0J1IPiwdwI5Sq2
         SQ4bgK85rX9qUiYVSUdxqSbU1KRAxbMA+YhL5imdHd2Gnk9MWtxzSsawxzVek5lwS51h
         kgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105099; x=1782709899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mn/qVyFIMu6IlzLhpxr4K9csqV7Oi92rZZJCZ2p710A=;
        b=WYp8pmLscQCrOJqUc5mFFGuc2uAHxi0B3kLbH2sYG71+unNcr9ExeQ1vZu7C4JrP0m
         xb2tAvJSPpa8RPSB1Q9lQbaog3SD7wbNR41QgTi9xVAkySX3Mn+J5b/fjpCutEvfRGIH
         3pj7KLZk/xxJLBe++hHEHmH4tdNhoDEiV7Ado7tWaoLZGyBnC8RARbKmtvXCJRapwngg
         t9W5QxByHzprZE7UwbbM4EoQRrDcBCoX0M4q0dSSUdOGpmPfzWA/3pJ/4PEq022QWkKN
         4ohNrC+DDj4yY6jUImr99itkzSyQeccvU2TErVAdLBUVEVNUN0FWFQm6wTP66Ry2GSZE
         Nc9A==
X-Forwarded-Encrypted: i=1; AHgh+Rpdr64sgKikIPifgV60c3lxJ53olddDkeV8527lOyDQZ4kLUGslHfkshmaKxiFinn9ROgNjpRm2NP5M@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRB0hTApeZMztdDUcJ2nWaI+V2B/HsnJ+aOzoHnDIfNrbZW/p
	o8Hn6sZCg4v4N2zVzxCNaZbqjN09cKEe5n5phzHX2ytao+OkBPGDgfuyL3SI+Xq7fuhHP022sSO
	ZzY0DiCAo36alOqjG8zklQfkpt91OaYt2hnrWS2BR3J3hrIjqx83CjuFvKBEkCcP1hCWKmcz9
X-Gm-Gg: AfdE7ckZ9caTphiKrUrPxMbzp1Kl9/kSehc3L2edb3QhJ++CLEOMp9cxh8zFkU3ijW5
	O14cZ7DvUlXuPZFIhW/aow2AGMzyBTyzBxQD5Tg3gmlKqXjJwC1ouebB6VO2QzKty/70WZuGcPq
	NeLN37EmxhJis6LePB+foX/Kk/fq9aDt+yBOpPZ2BYI4h4/mjIXt2SJbUeTLAHn1fLi2xF7qYgC
	oFENJPSIV42HDnLG4OtXSQLuinU7MZcZI4TIxjJrx0UOp2vS9W+NWeKliA2b/aAVMO25IgeMBzz
	91rpmNTx5N/03H/qUhc1jWFZNxYIZXOzu4u4w/LW8/TymymYi2OuysnwvYK8XNlLTjcuyo8V+1R
	OAzhpKdiOF20zqRg/qt4fcTwsif+FQfgejNJw9ey9Tzq6wgNncUaUYtwJNw==
X-Received: by 2002:a05:7300:6ca7:b0:304:ab8:f87c with SMTP id 5a478bee46e88-30c06fff418mr8800542eec.12.1782105099183;
        Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca7:b0:304:ab8:f87c with SMTP id 5a478bee46e88-30c06fff418mr8800514eec.12.1782105098653;
        Sun, 21 Jun 2026 22:11:38 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:28 -0700
Subject: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=4460;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rw+jGsr4GUmMEn15wX/6cDmASyIshmLyIewu6Ex4SSM=;
 b=neyFdZJhWpeusrQeV6c4WGn71aucsOGLhGoNrBICZsLh5N/Kg7Rq/rgninvJjOgnLQFOaKQaO
 yDiX0J4mov/AD4zELMFdiax4N17g/ah+ylNfjiveby7xWgBiovaFC+8
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: gMq99Lk-7b07qZyyEgfMpT4WVAffydHK
X-Proofpoint-ORIG-GUID: gMq99Lk-7b07qZyyEgfMpT4WVAffydHK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX9XwRNd42f7XG
 Of2iiatG2YkGjNTp/ZW/umKXn75+ZpXT5LIBnB0dsnG/KEijEr1Gq7wFn/63FkepjKFIHeJwpeB
 /5dymBrYP2O05m5Myoip1dYzdtTLFLE=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a38c40b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ejsaoIeHybvuXmj4E6UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX6sSklE9PLWsb
 ZYwPxew7ideSD1bpuKMpYL5+6E2HMGqVxFHm9sy/44/yCnhN84L4dDzjZ22YaNwsvxRNN1Kbjl8
 VBpvpDfmQRv3qk0UOiEyr7twFdAeLsUwYrTTkFWJ0fnVOmm7ylzxkmXDR0BqjLsbHR0NuT9k1Dw
 BetZakWWWqfcavdT7HvSPCBQd78i30WjT1Pm+kk4tsu2A3COmjH7+aAdmu1MOTlK+HkmKrqyHRZ
 zNYN4qojwPmdpS60Oi9Vp9RU0SF+3qNf894uuesRfFiZLHktlFLb9D4bAbWAxUOAPtxr4v6g84w
 LblbfwMsCgZB1m3FWgKJ/PecYx8j9rK7nOo60zOcMZ/Zb7sYjh8YAH0BUnGuIz/QNlcWBWt+ckY
 eNXGAtqBzBknu0EgFhcKSLGJWBqd4khTXRRjQoYwLWuV/jAiJRrIHpUc6cQXLtLePy6zsZ4j/KT
 sER+Hl4LFZhtuaDYAFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 99 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 2db039342f30..9af520b71f31 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -13,6 +13,11 @@
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
+struct tcsrcc_glymur_data {
+	const struct qcom_clk_ref_desc *descs;
+	size_t num_descs;
+};
+
 static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
 	"vdda-refgen3-0p9",
 	"vdda-refgen3-1p2",
@@ -57,6 +62,25 @@ static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
 	"vdda-qrefrx4-0p9",
 };
 
+static const char * const mahua_tcsr_tx1_rpt01_rx1_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt012_rx2_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -146,17 +170,86 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
 	},
 };
 
+static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+	},
+	[TCSR_PCIE_2_CLKREF_EN] = {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_PCIE_3_CLKREF_EN] = {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_PCIE_4_CLKREF_EN] = {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+	},
+	[TCSR_USB2_2_CLKREF_EN] = {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+	},
+	[TCSR_USB2_3_CLKREF_EN] = {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+	},
+	[TCSR_USB2_4_CLKREF_EN] = {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+	},
+	[TCSR_USB3_0_CLKREF_EN] = {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+	},
+	[TCSR_USB3_1_CLKREF_EN] = {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+	},
+	[TCSR_USB4_1_CLKREF_EN] = {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
+	},
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_glymur_data = {
+	.descs     = tcsr_cc_glymur_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_glymur_clk_descs),
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_mahua_data = {
+	.descs     = tcsr_cc_mahua_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_mahua_clk_descs),
+};
+
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
-	{ .compatible = "qcom,glymur-tcsr" },
+	{ .compatible = "qcom,glymur-tcsr", .data = &tcsr_cc_glymur_data },
+	{ .compatible = "qcom,mahua-tcsr",  .data = &tcsr_cc_mahua_data  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
 static int tcsr_cc_glymur_probe(struct platform_device *pdev)
 {
+	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);
+
 	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
-				  tcsr_cc_glymur_clk_descs,
-				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+				  data->descs, data->num_descs);
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1

