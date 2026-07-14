Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EAB304BA3
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005201; cv=none; b=kcFrFjXIrnkgjE0kR8Yo9Hvd4NmimUuXvs8KSW8ZbZX8Sh9/03L2nWQBciKoGHL9Id92sDa1ivuDkcJC+A30BC/J1xCKZV13ArwOIpweGo9ZdxUtasAFAAcuTVryHfRD2Qz3AK9dXhCuedWIT+xl9cAZ9Va7OmNVZDJsNYtNDfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005201; c=relaxed/simple;
	bh=9BxxmcrVybxTieypSLyf4ctSd8fHI9uE2WwM4etNwjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZdtiPD5QRsIzk4W/H1rrmzNvp/IVBuIy38EwH9oCwbaK4SCRO1xi4WRQSyLGyEDAh05EZ1OjRD0D6K2str672ym8VbfRCq3+H723CZie8OkYmLrgm/HPjfHcDwlBMdERcMmAxf2COWv+cz18VlRxXfaJSPNdRK4IoLkJ+R7gYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEJo55Qq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NukgE9c5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEJo55Qq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NukgE9c5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E384X73389536
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO86e3p018RnHLJ2AvFSTUm2N11FNqXo/0u9fnwt8/U=; b=hEJo55QqxScdYxtE
	ORCbvEfsi7r4jmvR6Saw9ulmAnwQPxHpPLvL64IHkuoWbmCvORuDiOohsnJK7Val
	qwhpf51HySXMvD9n8k/rHyVgohKaoMMwsFglRMLXncNiPrbTTojdbMi7JsqJE1Oy
	1B39M0nZaHRFLl0793Ts3WSZRvW724Eao4beIgv/Ar8TCBYJbjAdqj7uasf4/PwY
	CyRSYSO/x3paIJelSIgL+8qJLQVhNPgIzJE1d5g2V8bUoUSpt82EadpF33KYzIr+
	GUe/e8grXRdnZhG0505HHoaG4WInvcytD85WpwY5ENPuMFfH+1i0zPx4O/w1+cPb
	hmwHDA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4ut1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5619221a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005197; x=1784609997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO86e3p018RnHLJ2AvFSTUm2N11FNqXo/0u9fnwt8/U=;
        b=NukgE9c5ssKSooejWgJOORBTzRTsPkbV1wABuu1/LiT8x+ZSPPsyOJWPgsEI3421Jj
         KzdAj/3I8jh6U4GMJzXZcApgiRLyfG7BPztERMlEyKH+JSvmSXOzmixy5xRS0c7Q8qP2
         qEQybpTJbITOR2cNeiw1XLhrNH02EcrYYGH/kwxfxDIluSm1dA86FEuFM5Uh9NZGwy/7
         qv4NrnROt81BXNqsyj6yk3bq6ZmQCYcxpoCkt4ZdP7z8Fe/R8XV752RTwfXScCB3OqCn
         45/yZnroxPAWmzU+exHFzXJ3+x/R9qUWukYiQD7lYROItnQfit+rA1RxSI5r37DPfsKq
         jl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005197; x=1784609997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO86e3p018RnHLJ2AvFSTUm2N11FNqXo/0u9fnwt8/U=;
        b=bLMu4K0p+TDogXoMfBcPXCxK3uraoCGiQXvoRXI6ydAItpcWYsWGSc8yoKAMDbrlR4
         SAlRMbC13IYT1B7RoPGwAtFMsTkQDjkvcIMsdB/JREs/eBz8ZzeK26FKxeUomy83ZJ5s
         Phn6P85oeTeexL0oGnO+avGte7XYZnpTARWiaKuPi2Qh8eYNtoD1y1+w1KN5wv3t9u63
         iDMgo9Nd2tzAiG+kTyM60kvvl4+z/UuZmuD9pGYfzuSXzkVtVVrxpa72silv3kHrFa8h
         quCiqZG9ncdIaEkuFY9PMzj/XhBuxQK0rN76Xw4dcywbZ/clwH4mESrOBlTmZNTeDglB
         9I4A==
X-Forwarded-Encrypted: i=1; AHgh+Rp+QPaw67UOTPsTup3ON8Ebh21BmlRCesFBKn5oTjAppKsB9YtYxiRTi+QpGOXRUaDS952Qh5xkqXts@vger.kernel.org
X-Gm-Message-State: AOJu0YxPiiEHLS2dB80rfjrwbXSNsu+rrSz/TQc5Bq2gdJ3v9f+ywzxm
	Ut8lWAjjZ4MSDoN1casFR0t4h9TD97iS6CKAiGTbzv1+e6BGGGMsx6pvdKraghbeb6h4VSIeB8e
	C0YC8dQgERXLtRZ6523tXfaWQH/48Mu8nylpeu0rrbOtTmVyujYyRMNz1cD+s0Yvs
X-Gm-Gg: AfdE7clWJUqqXWBW3/Rr5hqLDvu+LD5q/lEJmQI47mQAT1F5qIgEdU7fbWQMAoToj+5
	EpT/sEj4Qj4rxnrcFl5nBnsIfy7v5JHdp0J/DAjeJyWHgW4mduZJ1YUbqEtn/HVyEL3yOSAs3Dh
	pZuwqgb2dN/zF6OSsB7sQo7n8FesKzJ/fcHKqlQUGzcK/kycrY5I7Yj1cUxuDzUe60QJGcu5Pf7
	yDcf1/aw3zN6Q+5Fqzx0x2yydcF37SoO5XqUi8aBsgcoGCWEUdojQlVvYuNq+ybZ/6+1LOtcpMV
	vzK0M6dz9KWsvEpFnm57HV9TM4XwOlUEHOx431R0hL9cwVxLV+PUTeFWfTWvcfB7RaDfZGvfohl
	csMAboAFP4dlim6eEg3q5CMMo/3oOo1PdCTWRZiUqlij4h5IYQheXttO8/w==
X-Received: by 2002:a05:6a21:3382:b0:3bf:e66f:2656 with SMTP id adf61e73a8af0-3c34d88f27amr2844518637.55.1784005196526;
        Mon, 13 Jul 2026 21:59:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:3382:b0:3bf:e66f:2656 with SMTP id adf61e73a8af0-3c34d88f27amr2844471637.55.1784005195983;
        Mon, 13 Jul 2026 21:59:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:55 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:40 -0700
Subject: [PATCH v9 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-5-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=6484;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9BxxmcrVybxTieypSLyf4ctSd8fHI9uE2WwM4etNwjk=;
 b=CVmdDinA+nb7Q6Yb5dZWylsvDXWZde0G1SdFkVBZhPeU6/Fj5hjg7fepDRHE1zznj/Juk1uct
 KzwCpMtYMwABO0iqBr3VLGq1J9NouUfL1a/00Q+Xf5quNQPBWF2uNlR
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a55c24d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9Ojz-Py7MuQnRvcrkDsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfXwxLKZzejFT6k
 0f4VqROLwgI6SxLWoY+mviMK7gIiR7AnCdn2zjrkAnrpIRBq7KQPbzJyv5t/sK5Ig8u+1s2GOCb
 d7HphYw7DZOAr8N+R7GyTHgVVJ22S30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX9Z4HsojcNn8K
 /6YA30eGuolFO+HQ+XUA1SphZIX3jvcr3f5m8ph0E6QFY3EWeSOMQJMFrNWqhogY37DtsZrBr3f
 r8pEVvF2QwpMn9w1niOPRLCEoynWW1gQSiKwy4oC5++PKsinevlC4f3KNJVnWZKP1DR0kPigS5z
 gLZItUKhkc0XnkRbh4lH8s5zhjPYi+xfWaYCvVfwB8l2C53tDiuR59H7nmuS8m5zQv1EQOcstn4
 QkdA7OfqJPNmXNGq8U5OOGTgTqZKAinkirixohhg7VlG4nnKveP53z8IGZb7pq8HN7dkuVzTRYX
 KVVMKFjszkPpOHM89tnf+eHgR9JR/j4H4B7379X1EOuegxGeoB0O9nzVnUPBvbHw5ZW+IBTkVPu
 DFSDH9pZFQVPxtVbRYGyWmqOpauK29vWQBE5cLUj5DrBSmjqB1qHdS6jVSOcG8hilF44xr3E0wX
 AqHPU4R8oVOd8LxIQBw==
X-Proofpoint-ORIG-GUID: mi_ZlAcJaZz5HFLhmfuKHxIaAo1N0OkI
X-Proofpoint-GUID: mi_ZlAcJaZz5HFLhmfuKHxIaAo1N0OkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047

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

