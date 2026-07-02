Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E47636897E
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017210; cv=none; b=ID6+tVBGp6R1CG1b/SmPpNAXZJDpxUX9UXnsuWbPxkHbo3xKm6jNTgavhsjzPMfNRXGYF4a7LD6C99c9ZdFTHwCAPgYZQgq39PImJycMrSymOkS7Uv2OlyylHEypCYKA7PjgX1erfmJ/P1PDWgVSOLdcxy17DodV16lNCXwuTVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017210; c=relaxed/simple;
	bh=R51D9HeZ+Vg0Rsl0PNUJ14lRccWMdZfVaqTmaO/sjmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umEPWCzwvpCs0A4YbAJ0Ogwb71yYp548oLz/IRjjn9pigzvcuXgO4rDgLFfNx08ZgQzJo8OzYwjlvabEsB0YAflzOTZda3zbykonaf1j0/+/tN8IceE1r0GIvg5lqzQb6HqI4buLntz1oCjqjCZ8in/9opKyLlMi2ONrVZEYGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjPDaiQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSXZ1gHy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjPDaiQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSXZ1gHy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3HtZ682745
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zUmmls/L94UwYRqT4cXSw29pARzyX1sbrFhRE5+U1l0=; b=HjPDaiQjg+ZQ8y2G
	ajeEiYVnh0qEqecfGC8epnKna4PusFPBmW5ztmI/DKF3jA09YEITRO9fkm4FAMlu
	KuolbEIBzBdl9urf2n9z+TLkcxiWE7xVb0TfNRj2OPtwJnrf/+xvTfyyjoRyJ0xx
	ndAnj6QVTAPBrStQy1/qcZBEn/uLQCsr3pHMTSeVBZdYx6XHLVeH2aSA21AWrbEt
	RJZiSe7uQ7RyRITS0gBct9px+oWWzq7dt+kpSQwzM2pFIn4Sxp+L2ucx+I+tlSjJ
	5kVYMd+IbfrqYNAW75rK/MlzNaf6coAES07WnCivx4N3JXtg2ogBm82p0qG0nW59
	ROOyQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwtfge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:33:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso50105405ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017208; x=1783622008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUmmls/L94UwYRqT4cXSw29pARzyX1sbrFhRE5+U1l0=;
        b=DSXZ1gHymAHVffZKzrIkcCtQVtzj2T7sWnyRLjFnVjIRaiafOjblB7xRFB+VCU6U7n
         3nRzYVO9wadtxkuI3DfVTjB+Hd82mFLr64Kr6XGuH25ZeY/fyNp66DcLt2dijKyPBrFA
         x7D9elAf5aRDyyHVlA/xHBDMOdJ3IpcIAqLcq8nZAS5Fcmds6Cd9+83SMArMOHdD2Q4m
         d/8jWETtpfRbdT7+hShFQc/IHIttp1UMslUevSHTSJB44HPVqF4pqGHP20UWIK3A/d3+
         U7W+KUWzitzBc02rvhWltoAkKAwGpV56UWvP6rbm71XO5gZEOv8YZyaB0+zSqgcx6b3Z
         LUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017208; x=1783622008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUmmls/L94UwYRqT4cXSw29pARzyX1sbrFhRE5+U1l0=;
        b=YsGyMOog3GCGFZ1jfKjDcu+q9+zNIIGDyYVsH7ILjpzEKcmWNyYny9BwRTynL4lDGW
         +WWm/VUIRJd0Pqp+7sm2221FSS4MIhFdLpvwVvbhd0XxD2SkAxb1GvCm3vZck5t5SPR0
         F2JQfe9TfIUSAsNM/bzjwECo+AyEkyT2UGb/nVIeaaOB/c5ZRNnWVemPIqu6um1rCeOE
         GNfvk6huXZ0dPPiFy6JmxmJ3F1lESy9ZTgSVsdKuEanehFeHkmVp4m/Vd9nO7WiaozTK
         4Dm643gdt8wsNxv03t0WuWiB1KjAZN1RJxy31h1mmtsvD31i7HiFFRecsYqmF00dOXyF
         NZHA==
X-Forwarded-Encrypted: i=1; AFNElJ9+sYVSSw8rvMZ+QeTWYysZCCZXoc8NS4n/LtrPjCSdb4GiL8UEUFOIff1Iui3h44LaXb8HiHBkT8Xu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0cIDeTdLjywHJlFFfWJOgoWRz1CbdseIeTWfeggEvmNlPolKR
	q/lt3faZL+GlP7dfluKWi8RXXxDMtxlrWvneISRupy0iWH1bAbwWQh/uW7cV2YWw0FRMg+3QKb8
	a/fR6BEGSWdEV8+zl6JWoVnBss1N9EKIhA12X2pbECx3rJIp2EYO8lB420Y8L1gOy
X-Gm-Gg: AfdE7cnaoGomdaOXcZUSR3bG+OSwInGilBceaR/CrmcpuHCEQvEnGGjhFgqnotPJvA+
	Vn9lGLU5Uau7lQhL8Nk+twjkieRwtK7KLIwrL1iQc3jMnticlI4vpgwEH+WFPKBTvwvpwcRs4Wm
	sqc2CGIoGBBfwX5trBTMJnYBF4rLi+Ffe9piuJwZgR/ALRVeyFe9XyvOsVmxwfjgAttQFIg+RRt
	LlCd976aqM9RNfFldhqHmrGjcsGlpY1ZczQtnlnBV6O/sk+4dZckM3+AAznATcgHZjrKzl2piMm
	3ihtC4HfQZYLUevadlumTEeTRVjWIee627ICBg23gdvfOxfKkaUAmvvwDCi4kyuAvhlsLDXGCJP
	HfIhYwvrxqvngMpSMTiNjCFNukatfmAVjhU8tHyhGew==
X-Received: by 2002:a05:6a21:d88:b0:3bf:5539:f93 with SMTP id adf61e73a8af0-3bfed3e8aa0mr8540922637.38.1783017207712;
        Thu, 02 Jul 2026 11:33:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:d88:b0:3bf:5539:f93 with SMTP id adf61e73a8af0-3bfed3e8aa0mr8540874637.38.1783017207255;
        Thu, 02 Jul 2026 11:33:27 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:28 +0530
Subject: [PATCH v5 06/19] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: z0j3VSVm3t0M8BQ-MvlDsOvPCqnN93ry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8JtIIJjc2JE6
 SOvi/+uAgIx89XtBfWvsM5rj+dcYB4YAaVBiVzwXsX71aEfwg4EGvnTSZC3GHLUfgFss9qOsH4E
 Ti7ldNhixZp3WxP8i22TQ1sMKmoh6UWmcHzxm/ETiO4aLAMMooUVX2Rbg4SX24VKc7vXysp8OgJ
 7qt6nBH0LcGvsj06y0tGbC/2XmsIlP8SfNfRQbriO9qrFVt9nsf+DA8lNVhxk4n1btThDn9DQdy
 nsHh+UZPGXsh53gY0gOcPlUtmn3WLsEdsuAXnQeeEewVGJrgzPG5kqQDzGVv411ftfDqozKIc/S
 afeKhvMQ2Ne+ebRI8HbyOhExkA66m2SZh+S2IhNwi4EJB6lNarM9hYXhzKG6bov4mUVkemjNAPb
 sCIePOKA2cMlyLUof/nYCcbUZoGodYDzXFo5oOBfL59RsUg5Iyh1p21CCoiGiZ/vOpJ3UaR0DD9
 D9f8TR88i7rmGzUcyzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8ZdQjAJZoV6w
 27l65KvEgLRm4h67k2IBc213OK1vNvfKX42FqlXmIM1v/ZDAiKEPpyBusvCz1S85n8UkLSG6kCH
 urB72hfoKucbHjZ4CrUjDzlDAOXDtI4=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a46aef8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: z0j3VSVm3t0M8BQ-MvlDsOvPCqnN93ry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 4d6aad280ae178426bb70528fcd9699627359ef2..50a0705128a37073a077b560d0c9e57544d54348 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -48,6 +49,7 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
+	.config = &disp_cc_pll0_config,
 	.vco_table = spark_vco,
 	.num_vco = ARRAY_SIZE(spark_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -482,6 +484,14 @@ static struct clk_regmap *disp_cc_qcm2290_clocks[] = {
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
@@ -490,6 +500,13 @@ static const struct regmap_config disp_cc_qcm2290_regmap_config = {
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
@@ -498,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id disp_cc_qcm2290_match_table[] = {
@@ -508,25 +526,7 @@ MODULE_DEVICE_TABLE(of, disp_cc_qcm2290_match_table);
 
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

