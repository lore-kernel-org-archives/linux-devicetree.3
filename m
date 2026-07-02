Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406D39EF0C
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977785; cv=none; b=jIiSSeXANtCcQoB5pZE58bS82FPxrIDtQRlUgn4Hyfcm1Xbz4cT25wPyVZA+G/5aYGhGRpQ7evMU+x1XPSMIyz8w0sfIF/XOmqA85dw9rqAvCSJ1cbRzdRbtH/VO19wv8dvDl7BFQM2hpZfBPyhZgaCL6Z4PAcrdPB1q33j7ebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977785; c=relaxed/simple;
	bh=x4JqYfx5XKMV2QrzDKhoYgOB3jw+qmSVfnwf+7pslQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogE8dMeTIgo59LMOwhfmO7q3TL+HoddW/JzQP0rKnJGeIUO7dTeeHBudW1RGqI43E6U7szik9qlGcr4t5Vh/fKL2CjYO8MNsYKtqDx7nuIZa0kYyAXxdHB2dy01ZV92j0KArQW3O+3xLJowTLfEOl72+KS8IFVE19V5mD6sTUe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBqa049A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f01748Bx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBqa049A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f01748Bx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66242u9D3460387
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rlTz3y0olZ2/56kd7rMDMSpU9o+y3wZn51o+/HWpOk=; b=bBqa049AL/UkZImF
	pGNSd1LOB81ExtbaAIgr8rsFgR3b/uZ3JOeicrZ8TwQ5ioIRuSWASPHP61PyOM8b
	skc84qJ0WCFyzGjUliaUeYyPtr/SzxNvUqHDxM1IzcKpVzKiJbdIZT71CnL+JaJu
	robYRVXnWl3Nojl26Px7ZaQGhLkGqdT2wBZXZWsrxEChuRB73+O+z7PSKbv00Zxz
	teuZJBHa38Rcie3Vlo3ui3VeaFqM9Rq/WkWh/viepONMqUlmH1tuI4t0lJzhPMDt
	rUVE8FgveW8AnzpvHgRh/d+FU+Ws9qqGE0bV8DnIXs65tgklsWWTjF80WWCSLTzk
	KuV1Qw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb0p6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:36:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c81c7421abso34012725ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977782; x=1783582582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rlTz3y0olZ2/56kd7rMDMSpU9o+y3wZn51o+/HWpOk=;
        b=f01748Bx8BMNjyD2UbLNZA2ha/CfKDEyXklh/eKV3HWqY+V8TZ8dTzm4NZHay+eqOk
         ZKupgMQQx3M313ZdE7KdbqHC6bRwzsnTxksotQuC7+OpAFdVVoO1u6YrEEZCsGX64fLe
         ++F3q0B9Ja2DtY+lb7sPhZiRGWFXezDmdsaK1IkdUksclz3A3KCjDMIZre7FOOmc+ZsB
         TfSrHtX4KOQLZO4cnlRjK3dFuKN4bOSNX0NLcW9CLa1Hvsmp4mQplsfmB3mT2ZR0IIjc
         7QwQ/MG5yzD9PSX9b1ULaVrXI6nw44Om3kdXLSdy9umPzw67watTyAWYkaoi2Bezwql6
         mCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977782; x=1783582582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rlTz3y0olZ2/56kd7rMDMSpU9o+y3wZn51o+/HWpOk=;
        b=nuxPbSrqcD9ecpdK22/49qPRf//lHs+jfgduwwRZXka1f6+KgpFnpd0kVbNe4uaRsk
         BhT1C2wBmIzhj+eF6rzaYktfPJzkiGu1gw0iu0NTtrhXE/SvtYKeZJsuP4K3rz0KbDMb
         4WzeUFfNtq4JUQ9xHnGABS/AZamJG8IKFjZAhruQEp2ZGg8CJPwi6tijGH34WmsKKAA3
         VP8fbUn6007kB+1UtqyiSZpfHsPd/GzWTVBouYoGry3GorR3viov8iMcHXVJXyMWmzze
         HJE9o+gNP09yKDZUbtLRROH6IIW0sTVIjxC+38g25uZ9LH398sZUaIA3DNjyn7HnuVNL
         05bw==
X-Forwarded-Encrypted: i=1; AHgh+RrVGbXNg0OynFsWbEo0+pfM4dCK9GrUsz5OT+AhNxQrZcM2KuUwmqmriyhcaEGmj4wXRcuFTuz0vX5y@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLrd7Y2YlEvmMFdHXvRXmkGfo35Rg6jNBfiJl8E1TZTjgUQnV
	VNdQIaGh9BIhtBgvSuPFPPBj5BRIiMT3usMpiRwFNrwCI7hfmQlfghdg6/3ou90kZ0PR84K3Xqn
	YegjtMwADaitZmkgamBejSMfOHU0Nzsw6ZUzWNOT75hDGzz8Mmnv28kGklamNCXDO
X-Gm-Gg: AfdE7cnnSg2Wi1hVi82kZjKbTKLz553S3JN7UXdA6ZwuPppCy99+AHtQVJgqtUEeDvB
	Ev1rk9b7SgLMKIGxHUxKdJC0nyoUjlUVAlUCcO5Zv9E5LrNEM9G1PeLn5M0xPhJxUgxIs/+LYl2
	TXNcNq0RB1Zt7rc6cHncstRAch0Et24uODBlOMOULs4hwLHP93lP1eFN0cdLR5Jyeq2ZBlijTUl
	MP5LCXsxjBjVIOUUIa+9CBuxsS5YA7EKWtX7YoXPU5BAO1b6cJJT/qc0Si4V3C02KfM+TNpfpl9
	rZ0GkVHVSWIx1j9wrJxX7Y4oxaYifPyHxiXQVgZlA0ex1AA9M4iSL6d5Y1YqVw/8wRrB9ARAH1w
	+0FEmAXZ3fLxBe/CiqY8J1DAaGM/7LUsGPB8kyXAU8yAhRlS0ycTPSCr9lQ==
X-Received: by 2002:a17:903:28f:b0:2c9:e5ff:995d with SMTP id d9443c01a7336-2ca911dc967mr41848695ad.31.1782977781626;
        Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
X-Received: by 2002:a17:903:28f:b0:2c9:e5ff:995d with SMTP id d9443c01a7336-2ca911dc967mr41848465ad.31.1782977781018;
        Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:20 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:15 -0700
Subject: [PATCH v7 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=6421;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=x4JqYfx5XKMV2QrzDKhoYgOB3jw+qmSVfnwf+7pslQk=;
 b=KL+aWixh1oLXXQtrcaWbixLx8ZISIBgqjw0qkgYb5wupcfIhOkkW/2GEmc9A06TUlpksDwjjp
 Ml+giJiV+e7D2gWxUYkkiWxFKerBepz7+6G+wKkkEp1z59RrBOCjJ5I
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: ELymdX7uoqVc3D79dNjdyMPrbOZYuyET
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX7w8dzEpAacKi
 4z7TpAdBEP3XTtMmw5lBj23I82oy3eJRfWbvt8gLMkMax18ab4Gtf9dDTW7dbk8acvpHOQ0mib2
 zb5ehYp9JnZv4mmobwglBGbPhnF2QgA=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a4614f6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9Ojz-Py7MuQnRvcrkDsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfXy/87fP17tj9u
 cZZfM54eKdvwjTmCbNSwlJcfSzXxwUvVC4lxhfhEHU8g9s32yFxDO/FJ+n+cMHZur8qtJcyvHNz
 ajf7TcbUDLTvbjzArAZYIcttFDOLei+gvS5QK+iCQ5knChOENneg9EgPWgQH2tovuuwCqHnJyOS
 7Ce5nqP4rXnKDLHyLKfYf/LyfASvJJiKC5FpMB7kqe7AutbCfQftxqtp7muSrLLw6+J1Tx/0llT
 kIwCav/Hwl6n3NwfNyZKHT9qunfkSRoKzW1Gmsm1rgH7aBeEcRsHHWvIxE4PC5UJF2SvHgtKzlk
 ZFrO7I1M5WtggiWDPdeAOVVWqMPS/QwPfn4sSCpse91P+OOXnNd66Gng1nIYAzf2emFX3IR/dAd
 1lxUTuEZQXV5K+6FMASWz+7t/yTZWI+4C/u7E1YCcVYB7+ta4NZUml5Rz39O32Vfmn8HddW9O39
 2i7CvHRkeOfDDNLkWXQ==
X-Proofpoint-ORIG-GUID: ELymdX7uoqVc3D79dNjdyMPrbOZYuyET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 136 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e0b545258ba4..37ad53b0d93d 100644
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
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
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

