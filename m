Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D45E3BFE5A
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550817; cv=none; b=nrMKRsu4odxy1buoLHRmFj39OciquICi4duw3HrM9HRE0FoZGsywgSGp6M5UPpAZPsoZZISFPNfcjASkwJJmMmiPHK4nAEd/Nod+/JSaAiT0I35LyHMqq3uxuk197MgEW9KvLpSKvwQnRweSsa4GdrxJXzesGzEZx4ME8c6x8Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550817; c=relaxed/simple;
	bh=42ccGag0WOj0/GBe2dVH9h3Tap4krbtNxLr1X4sK6N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXONKueuU6LMT9hm/FryxDJ9G+tiu223aMfSeoR0Wc7dbgN7kXkfEl74d/idcQXCZAWFOeNLjz1YIDNr+EC11Fyvb24stTxd+OYJXHVRvJkrg/ifpztJiAr2J1TzOp6SyWFxLMHRZvZx8ky5sgXsq5qLSvnGm2O2gChfz9rQkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWL8E5H0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITK7Qq+p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWL8E5H0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITK7Qq+p"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542K2mc2368039
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=; b=OWL8E5H06GXMGVpQ
	gZNN8NmWWSACqYGiDciGdVRvYiNSm87VHduLObObTWSE8svhb36AJEU0oTJsD+Gv
	VUCw4wDQewRtqRcXjGHJJtN4R61Pp+1WLLnz4RJLckU4tHLdXXxNpFV+eeGJgkcd
	G0zc45pO/BB/dhaDvkXSgra2wEu8qlMfhILsYSONpQeao2vZEn7L9M1vyqs6k9Bq
	6EimwlYTiJRplMj5995yFZFNKdQrl6Hh4bA2bxrKNXfkJHW8bZjYjeB4vlA9/GiE
	Hud2RWWbW6wH+cSaDJvNnXozAi5NQrnsgwOwJ910jqWGqaSpm2m66WGy+Dd6pvUC
	OPLfSA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gm5c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:26:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2f19558so221234a12.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550814; x=1781155614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=ITK7Qq+pdggMnF5wijd+YrcwKX43ze+EqUSwOrMYaw2OZiknPkAoyZ4SnSxvF3lp17
         xfdcupkv11hPaoRIDaonsYnh4UTMPudqnTdCIU+GwJUOdyXqX5sDcxZh7D9fM3tH2jcV
         1F1Anq+DT6rkjOrn90iFA/X111RcolBMGVA4VdCpgUrGWvuukz/gW4Oud35YnrMs8WXR
         PQ2+3skIsq2gzA4ocOVVl/XWvv9wDLG0uQ8AtXJN/mQfLdNAC8kWslzS9Uk0wicG/GkN
         2rR3pb5B/OGIldhav+R79/5RGjMi9YE56plhABfqRqCuQshPpW2ktYdltYZw/Lho324D
         4pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550814; x=1781155614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=Ns2gZT7RdixtficqJvcTBOHhID9DR+80UjK1ICI015Lj6Cnyr3qVxR/7zGn7nFdn3x
         DXdv5aauAtC/pLbZ66Vz/6x3HkgxSTZsoZ/+vClqrUDGJ1tAvbKTFBcQLtcvwP+gDE1Z
         addjU9GvVidy0OZ0WVsUD9JSMto7fQRAwSJIXzTGyav8mbV4Bzoauft1hB6KE4zJUMhl
         RRnqDo3jg0j0HO9D7HpglKjmmW54Oauc8etRU1aLedwfA5dcKAn1X0IN0wxi/XolLoWh
         4949iqqt1+r4rRQA31Uoz1mVllcJ0JuZu9Tb0osaDDFv+ophHPcIOHNzAf4ODPvIAsYa
         +gGg==
X-Forwarded-Encrypted: i=1; AFNElJ/NhcxTO5dPVmAJYz0Tssk4PA8PPWDIm2EyY8N8pESYEnYMI1xnFfQY3Ba3LxFD9twtWkGfUp+JWlj9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0IZrZVJKPOcen50SHd/rPi1UB9Ajt9mNC6lok1xw9tr8wpMsh
	uX2Hn4NSNQYZSpuBvSp3hiqoAePJZbVka1LeFB8kbjjEemJqZQZ4t98U9s2G0pYhBd877PugQGS
	gJ0YtaRxUf6lWqogMxh5eT2z/O7ctDpZLAltXIPIsoZxUlFfVMoBMUHWGXQZ5aQC4
X-Gm-Gg: Acq92OHCkcEzbnPozlq+Qc3AjFI3fgyZBK3mIKQQns4C6tGElk2bqkJ4lf+M9ExkIz+
	UDdJR3k9tdN2072FNmSAB+KVlI8uOAe316uOOQpVWf008WVHYkhl5euHImv3SGV9hnq3768RfE8
	Fi/i2Q6Um5o6+a3IZS2h/YKuQGZiADZrRHxD89Qb0FlagU+f3W+9Xp3bygy9iw1OrkUjpRpz7gV
	Fa5wxZwaZHZHKnZnaOi4B9RfkCG340PqmbKIsjTmbGMn3JWv+mp7ogN1uMXds1dAf1EZ9a6mvMU
	gbWjSB4xl1Ce15+Iwr2oHdRvT4JvUcmDItr3vnVETkssWVhQ1zwKciwsU0gcNZpgliyZPocz+CV
	ynnOM9YWnDNRnoSqOzCwwBO9idIMtT1p2npLSrHh3HZ1crbpd0RCSP2Pfrl5hvqo=
X-Received: by 2002:a05:6a00:13a7:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-84284f78f88mr6408284b3a.30.1780550814212;
        Wed, 03 Jun 2026 22:26:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a7:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-84284f78f88mr6408266b3a.30.1780550813795;
        Wed, 03 Jun 2026 22:26:53 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:53 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:11 +0530
Subject: [PATCH v4 05/13] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX20t4Ggsg88yI
 65j7jJrKTEOQTCjCR+KOiQZE5Lg29xHi9GP5VfWG8clz4vyP9DH4+7s0+NI+ws+qen+g42vDqaH
 czpfgqO5VpeBp1G8JIm6CdQNx+z0+hAAe987XkU0j8sxeJheXpLEn2yRm/P581xOw8qkXQPV6oc
 +EGlT5hfDRmnBkhVN7uHRloDDUbnrXlw+pCt49tJlKcq9+SiW7s/xnRS4ONh4LEJ1nr/JkY6Ie/
 Wg25ln3VP2uhA5OhrY+aucWmAF0HcFw8hxVTY4Dq6p18VxbCfdZfoBl8NIKjHsVv4V9mK3sIC41
 YBNrTMue3qWmUg7CCdIBanO9UEawOO8z5r3eaLLNwk4m1e0DnlD/wC8qRfaTZbQkvfVpJSxlrd7
 n5gqNYYkm0q4xguwtM0FJr8jt9efv+NK9Gx2d1vtqaN9Ff8kiSCWkNkVC9fZIudO34Eae4lBc8P
 uQ2LoxugC9l/0SDbY4A==
X-Proofpoint-GUID: xUU7KFtX_GzAeIyviVK1-YzScBN9I25J
X-Proofpoint-ORIG-GUID: xUU7KFtX_GzAeIyviVK1-YzScBN9I25J
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a210c9f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040050

Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6d88d067337fa132114b0d8666931b449f86de17..1c21267ae0f7a86c1de88e888c2a990c35f0a0e0 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -49,6 +50,7 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
+	.config = &disp_cc_pll0_config,
 	.vco_table = spark_vco,
 	.num_vco = ARRAY_SIZE(spark_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -483,6 +485,14 @@ static struct clk_regmap *disp_cc_qcm2290_clocks[] = {
 	[DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
 };
 
+static struct clk_alpha_pll *disp_cc_qcm2290_plls[] = {
+	&disp_cc_pll0,
+};
+
+static const u32 disp_cc_qcm2290_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
 static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -491,6 +501,13 @@ static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data disp_cc_qcm2290_driver_data = {
+	.alpha_plls = disp_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_qcm2290_plls),
+	.clk_cbcrs = disp_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_qcm2290_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.config = &disp_cc_qcm2290_regmap_config,
 	.clks = disp_cc_qcm2290_clocks,
@@ -499,6 +516,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id disp_cc_qcm2290_match_table[] = {
@@ -509,25 +527,7 @@ MODULE_DEVICE_TABLE(of, disp_cc_qcm2290_match_table);
 
 static int disp_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &disp_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");
-		return ret;
-	}
-
-	return ret;
+	return qcom_cc_probe(pdev, &disp_cc_qcm2290_desc);
 }
 
 static struct platform_driver disp_cc_qcm2290_driver = {

-- 
2.34.1

