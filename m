Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3428E3382EC
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699951; cv=none; b=kffozk/e/tmE2dAq1YVs+IvU9ShPcNbqDkhkBySX9gPP7t02UGqHANEHFHAVDI7HSM+M/2PlQSgR24Ld+5qG5rldO3qNT7qJnjF+JJqKOhtjv8hmtFlPfQhovCoIfvWzZQFcz/0SwP7Ozi48IbWbl/UIl2Hx+ImSmRE7i00wnbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699951; c=relaxed/simple;
	bh=9BxxmcrVybxTieypSLyf4ctSd8fHI9uE2WwM4etNwjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFD2VY+wDPiEYTwCviVhRivPhkrpv1r19nxF5xOq1hY1vVvOK45zLttEYPhX84Ok5sH+MRYJ3z5H8yTsSpMDvGfOYEqNTZiav3NqidWmxLQ0U+8SOb9QuArop/U/hYBvDwBPoqbUUAl0HZMWt3UoBDdQBMGYd00IZUNpTbBfQfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7xuNXJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwUguHqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7xuNXJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwUguHqv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53lZH3767875
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO86e3p018RnHLJ2AvFSTUm2N11FNqXo/0u9fnwt8/U=; b=S7xuNXJEykiDw+Rk
	QyhRkL+okcDmpXnxrBFbo4jvy4KDtMHCkudZT6JGjbtv5cpTU+dKabOVHq5VjlO0
	xAOsWp3Up4hdVyaJt7emUZXjWDc252DlrwGZ+YG2SnRLOrNvI2MOvHipMG1AQezp
	FQsiq78scsC13agWCE1JvCehVQqKZaPw/2Uejy42Yg3JS43UK0J2QHIB07bT7y5P
	rHKBLZyGihXeXcCko9zk939/4oaCahTyN0eN7PHWQDtGDAQvSU4OXPBTvwRuPxLE
	URCYpgiSmfn4zZcEIAx2+U2JJcJ/fUrSS1aILpBc0GyYJZ8J5XVi4EX+4h2DqC+P
	anhkng==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4rgdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:59:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so15342821b3a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784699948; x=1785304748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO86e3p018RnHLJ2AvFSTUm2N11FNqXo/0u9fnwt8/U=;
        b=jwUguHqv/0uG16+TMGAUyqHysnNZmoq2OWF1nEHeqbdtP+vIu8QStG4Hj1FpuXdkB/
         coiIAjoz5JJoGqbzbxlA8DXq2Poku7EPhAnLzF27taKjbXQ6dRBcMOiixAb6eGfVeqsf
         oVEnai0ChgCxpykO5RYcABTKyfsL0yDvyUHW21+JNAsLiP79fcf6HdIAXxreRRFVUDTO
         g3A9zyOIWN4uh44+3UX8I0knwOgEX6WC2W0QgcO/JKenUlLkyi3HwFJDiUaohaMrpxFK
         0hTA4CF5juzA1XuCi9azI3mc59SFG9BClLLW1vsKSh+piyHuESWrAJIPKjs2qm8D3TJr
         eLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699948; x=1785304748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO86e3p018RnHLJ2AvFSTUm2N11FNqXo/0u9fnwt8/U=;
        b=Q7flyjIGddFK+5HOEyvq3IRi1KK3ujFBLmQZNmdY0AUMRfJ828DKtFaubHfhzDasvy
         GLgncge07C0sBn6K8ojSm1OJy+I+bsQcnfRG6ehrw5ZE/KfR5BhMkVz/uwegtoGRv31Z
         BNRU3srZrtR6yxdbAm4x2oj+KNiKymeu7ZIaBxgIBxMTEvf9N8rX7yR89JTB6BK6GE7Y
         Z0u5bh5b7Umftk+NFZvQh4TmNA6qpbvYGZgWc+Km1HLT3c+pM8GdhBN2nhedznjbUAlf
         EYzWq/8TbFAxrJHc72U+Ee8ysayNHxmFRsYj4tv7JPHSWo1kNhKXRn2uxDR22HUJhSDL
         Dq7g==
X-Forwarded-Encrypted: i=1; AHgh+RrbJ4XuhEEWxChPtBw8kjEuwJZmYWEBhftVachHt0Eqigo1s00HY8SEc0kb4Iuns0AHLDV4Xciv3WJS@vger.kernel.org
X-Gm-Message-State: AOJu0YzBImur4aKNACINojiASVqds9JEmlX2OkTdko4u4X1iMbVkHEug
	yQ0wqjJL71+r1gsoGokS+6MG/JS6JMPzNCiJVIKz3XRiIBRySqNt9fDnnryu9uiBFpFenumOOTo
	2ji0WHHf4PFydnSKzs01TgJpJxshL9jXUhXzhGhB6s2H2oPRdnNfdtT65ZhZKhYO9
X-Gm-Gg: AR+sD13v3xJtHS2B9rKATWlr4hIlIS86B35sMNG8g0Ji7sqc3uM4BEWrA/ahmz5EiAA
	VnowS/mTr6TSeDV/ZECnTZXUQAUxt+2OultI62tB5qv5WP1BhBEyCnrBAr+YcULLL1w1Ij+6nFE
	dQpdzKe7+Y0n7s0O2jkMxd1ixKQXqxcwMIU7HQ6VtDz7UdLjuuG56g8RAChUW4oYmW7owP12PRp
	nfCfbazxKlRH1ljfJKhvCXqHBdzDpcvJVh4dAh1Cn2UHfSsXULw8Q2w9cwUGRXq/o4bR8czkhYK
	k+EcBQ7fLJKtub6w9NX+wb+gRVYjdHzmgevtfwd1fet+tRJrWh/B6HV7yf3uO4mebXFbKbbEx+4
	RJ3yShPSdh5AjPaZTHZKN92zpq1ywQ5yeWIS2UTdVrz2wnUQ=
X-Received: by 2002:a05:6a00:238b:b0:848:5540:2371 with SMTP id d2e1a72fcca58-84c294d5605mr23782231b3a.75.1784699947689;
        Tue, 21 Jul 2026 22:59:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:238b:b0:848:5540:2371 with SMTP id d2e1a72fcca58-84c294d5605mr23782206b3a.75.1784699947281;
        Tue, 21 Jul 2026 22:59:07 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ee1e6sm554013a12.12.2026.07.21.22.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:59:06 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 22:59:00 -0700
Subject: [PATCH v10 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-tcsr_qre_0721-v10-5-d2fa68c63b78@oss.qualcomm.com>
References: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
In-Reply-To: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784699937; l=6484;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9BxxmcrVybxTieypSLyf4ctSd8fHI9uE2WwM4etNwjk=;
 b=YuwVsxvzb2m5H1QPQTxStxo5ax/iI5vmOSshPyS/Qb5oBf1FtdR5DpcBDmXVH/nBSFm4q+bt3
 Xt9thlq4WsGDH3Cnv6W5KeJISCqhbqT7uExgUX/QOVS2sqeKfyMr7Hu
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: 3lvCwWlPJCk0GAGrqQN424DwTV3wK0Qg
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a605c2c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9Ojz-Py7MuQnRvcrkDsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfX4LjG1dL8ikpe
 DP9RPnG1wjxAs6/BFnjx+ASwiNxX9GVbzuXZsZlGqFGqng2/DJpbJOI2t/wGc+ckkvJKY4vaz3M
 h1MIkG/eXuOto+QWwDv5483j6zMoYzeP8DYx7Nd/tuMAX2cGIbadQnnWBsuH7/krzBDlzqPg2Ru
 WgQNkf6uq9eqcXgBQfnhvc6/CICAHzlrFE0vxWoy0SB4XYY0bFuspO01ABa4l1UPvl0GEaUG0a5
 0lJkQv7GxLCqUpEUCzhSKKkXsF4Nlhazi2l//Kg2vpb0a8PYZ4aHexC6BN35meqFkviaJtDi8SA
 USIETR5zLVPgbxFendRs1ZppLP1o9OGGM7/q5kfUxS2kDdL38iDAhnkwOB01Y5+rlK122GzHHbf
 XvXIVuvVhA8I1Tqexxpo0tdDSGWjZqCVKD5ZI/qeh/igdOFAuKaU/gEMwOUPduZ2+xnIhvw23X6
 DHL6GYmqqx3CthnmmWQ==
X-Proofpoint-ORIG-GUID: 3lvCwWlPJCk0GAGrqQN424DwTV3wK0Qg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfX6Dpo6U1pWDNo
 GmHN+s4TdJDpsfrHZ0dtGIzL0jpRCBKhQPkLC2f0sFQGRKlJaXHE3aNXkzfC32IKSlhCwhAGDPb
 Jnzvsiyh4Syf/qd928XYPuDYNh7RQ7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220053

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 136 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e0b545258ba4..1791e23739ed 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -12,6 +12,11 @@
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
+struct tcsrcc_glymur_data {
+	const struct qcom_clk_ref_desc * const *descs;
+	size_t num_descs;
+};
+
 static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
 	"vdda-refgen3-0p9",
 	"vdda-refgen3-1p2",
@@ -56,6 +61,43 @@ static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
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
+static const char * const mahua_tcsr_tx1_rpt0_rx0_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrx0-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt345_rx3_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt3-0p9",
+	"vdda-qrefrpt4-0p9",
+	"vdda-qrefrpt5-0p9",
+	"vdda-qrefrx3-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -145,17 +187,105 @@ static const struct qcom_clk_ref_desc * const tcsr_cc_glymur_clk_descs[] = {
 	},
 };
 
+static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
+	},
+	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
+	},
+	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
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
+	if (!data)
+		return -ENODEV;
+
 	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
-				  tcsr_cc_glymur_clk_descs,
-				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+				  data->descs, data->num_descs);
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1

