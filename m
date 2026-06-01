Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62673ED136
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338167; cv=none; b=H1gqA30a0sIHbsYPqPpB+TqCfruR1XuNh+4txGijt02BDyrTcq9W2WsYbLAGgoWAPlAgfHLSY2dXtE58UqNfbt+wlg3OCz2mBfok/+p1NawDNfhGQV8Tbb6+4RC9TdtYJFA0Lr/Zl5hb629VTH+Fwfyz86OXekUria993ThP7UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338167; c=relaxed/simple;
	bh=QV1T2jQecsdrWuJKbVRoH9hUbldR74noUF6ZVYYiUhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BynZjJeZqSe8512AAA5m7db2gRuuC9+xBFV+qC4v1NJbFrvPRwKqP0B8VmDJ4EiIHUO0t+uJxq4DKhyNOznZsFkA1pYYYE6g50mbSgCQPYo8FWipeafRcJAYipzjX2tdcqsSm8O922HOq8+j16zfTIiMd5ECxf/8Sh/LjqBdQsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lfi/BpLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADyqdh0a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lfi/BpLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADyqdh0a"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651I4sQH3128739
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 18:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUEqgQxNX1Os6oM9bQGsHLB2AOvejl/HCO6K5ihAV2A=; b=Lfi/BpLK3fmJg+gM
	iKjZ442dTI8YDD0fIcR7KmvGGi+GV9i//9ZPZC4cnNB0NSK2Q+pRnAPmHU0pFJTq
	LFxeGMqbbBrKvbhBUAWYYVE704bhB16WMJvzUwY3nBUUsxSqWPpYeSsfJW/oJ563
	Lqa8p3qDselc/dPeyuOZ5gSnXnO60ubkgmDXokjzH0TLIp7MLRPP+SVB2Q/bO1p1
	FnR3Vz4E+Isu4Ekp2qNlqyjgyyfc5w//1h/nQbHmOrthfLC5JMhGJ0a5kcYAyDIm
	O9/PP6CL357gm78se+wSwyN4f+vL9ge2ZpPAIFasLHontWWbI0t5faSTicKkp4ga
	duCYMQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh9011x7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 18:22:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso3267116a91.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338164; x=1780942964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUEqgQxNX1Os6oM9bQGsHLB2AOvejl/HCO6K5ihAV2A=;
        b=ADyqdh0aGknLChfq9dNnxZv4wJ2ciR8FWVf/YKO8CHndyLVUk/s0Mpm9Wrs6uNOnrz
         l/NCDH3Sqi5l4gRW3y2i0rIDzabhHrFW8wJMLLiRx2biJlZnOHj0XSlCs9EniFG6+7hQ
         Pq2P2YRdbFvMEocsZf68ysyApSDv0l0CGsAVrsmaUzLJhSNRv9uavZ8dIfp2S/huntZg
         hViXEXrmW5YXvpGA20+iybw8CFr/0Nu2YqRLcq0kewGMHbb+vWAwBfyPyGmUuAgv6Ocu
         02i9kMce0aI/VIIu9YvarLuXiiLASYstf3oVjH1YvYYpS9aABceXU8PWX+2KRIWlEfBm
         bV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338164; x=1780942964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xUEqgQxNX1Os6oM9bQGsHLB2AOvejl/HCO6K5ihAV2A=;
        b=TX/oSWjvXv0XzCfbI5/JdOMVWEo7BzVE974lSmzC7k5SRdVFZxC3z5pNQTSNtFTcG+
         cS6R9/bwvFaYGGWDgh2Br5FkXgGWrPbnEGT21ewZ9nnqwGzpVevRsxoK98pA2rvLbIVo
         AeAFUjnHjCFkZJMCKjG6oGVS4f2k6CMAwoalQbRF/rmcKe9xnz2vK4D0744yne4thaUf
         WhbGwFDltv91/ovH3CmulF/HB0wlwFgoIIa0qEHWQXnUUxsvYbP+L0xZ701nkiCIixzZ
         MPQ5YbGwyPjdQOTXn7LILDbNJTqsPrPABmwjEYU3wvL8KyYrNfBpXi6w1zNfHO3ufm9H
         KlsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v14jKeHI8YuQobk971bnbbwrrTM3wk6RTFj+L+g3XXGFNzbclUYexiOslZxPxe2IByn6qTyGeDh3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzkA5X4rZoj7YeDNZxI7oTKv40+R6e9MQ7ZtR7ruAcv1SKSmj5H
	O+KW5dSJe/gRpXHnMdmcCJ0LZwVlv0Paq2yO3qUervOEQAkBZyLT79k07KPCjgq4C21tKNMkUgw
	rHLeojxaSuEpOoLXLh2nHhYZCfmUSNxlYBDNNPjefCMKcO0CnEy/rn8yHWD2aJH4z
X-Gm-Gg: Acq92OH3B7J+AcLB6qgwG9snrM9a22VrnD4veIjJN2/yabetkakXxmumD0odLt8Jcu3
	meQO5wid5SRUogXhRhi2F6AT2qQqw63wSYITelwBZoB0+j8TLwuArsSy/ppsoqHO6z1DxdL1R9x
	j6P+Vu4bI/00OEnHFqu9i/Hgpbeq17usX+RdfvKHmRxBevi4bsPt2rTf4+4TrXLagZ46Q2srCD3
	wc5NcaVYyVlyjMNUOWATZwgcfWplvD8j0GbXCBHZ1OYcs4LZ9O08K0Uzr+IvbTokefM5o0gU8X2
	CsQSHiFwhOhcxaueSriN5lsDmDhkIlGc9m2dWyGfjglIDTlzN2lsyVUbuJ+KYDlOMJglPB66WqT
	Nsg0QJGQpjJ7A91RB5CU8Saujf71IiqrUauXbCN9U4Wt8wcosRzc8nOJXahSaaOU=
X-Received: by 2002:a17:90b:4cc5:b0:36d:7a76:827b with SMTP id 98e67ed59e1d1-36d7a7684d9mr9953712a91.14.1780338163647;
        Mon, 01 Jun 2026 11:22:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc5:b0:36d:7a76:827b with SMTP id 98e67ed59e1d1-36d7a7684d9mr9953677a91.14.1780338163176;
        Mon, 01 Jun 2026 11:22:43 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:42 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:30 +0530
Subject: [PATCH v3 08/12] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-8-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1dcdf4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hOWgcHCWboPR0Rv3GuQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9ZTIgpWI2ur6n99KDqJ1jenR4xVrLozI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX5bKPkMDEBxCa
 VKuHAX0VC5TNHgOJrK+qDuMYcDq2NimM5bugOGJ6Rez1+H6E9TpmjcLcjZbgQ/Z9AKNmul//Ov2
 K5Bdv3g5ln6PEyuLN7M+U4aLZ4oEg3QGkbhDNIW1/QTI27nk5PqHQYwA06/tl8ZR/YSKOPjDQkt
 WrL1vzL03ymeta/LeM8ZUoEGMLyoGHDh56uWOSU/gI1XEv42rrcbJ7EvvUr/kgU9yPzRj/hoff2
 3PGumlnnVquA0VCALP5RHuNGGMUiCUqqpGSEjNzVwM1rpCvTb+lLJ9Q1gNEdfhG7MBdGP5J/njT
 XnAKokpnCTYf5aWfUkyr1Seq47EYZMgmT6Un919Gd7CeFzd+fYtjmauJRBIu2Aatgk4SwIVxRCv
 0ZEEJm2fIvfFzknhSro6mp0AG85j6lzhl35cjHUzaxVDvXb4du16leFdnuCQoG39eZsqKgSKX5u
 dX/f3uuRZiLT3MjGj7Q==
X-Proofpoint-GUID: 9ZTIgpWI2ur6n99KDqJ1jenR4xVrLozI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention. While at it, drop the
modelling of gpu_cc_ahb_clk and gpu_cc_cxo_aon_clk clocks and keep them
enabled from probe as per the hardware requirements, and drop pm_clk
handling as the required GCC clocks are kept always-on from GCC probe.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 92 +++++++++-------------------------------
 1 file changed, 21 insertions(+), 71 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index dc369dff882e69a8c0acd260953d5fcae9453120..1c8ed12f6bf8154596d031347540ef621314edc6 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -2,14 +2,13 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2024, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
@@ -20,7 +19,7 @@
 #include "clk-regmap.h"
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
-#include "clk-regmap-phy-mux.h"
+#include "common.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -57,6 +56,7 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
 	.vco_table = huayra_vco,
 	.num_vco = ARRAY_SIZE(huayra_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
@@ -148,20 +148,6 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	},
 };
 
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.halt_reg = 0x107c,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -224,19 +210,6 @@ static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
 	},
 };
 
-static struct clk_branch gpu_cc_cxo_aon_clk = {
-	.halt_reg = 0x1004,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_cxo_aon_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_cxo_clk = {
 	.halt_reg = 0x109c,
 	.halt_check = BRANCH_HALT,
@@ -318,12 +291,10 @@ static struct gdsc gpu_gx_gdsc = {
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
 	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
-	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
 	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
 	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
 	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
@@ -342,6 +313,16 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
 	[GPU_GX_GDSC] = &gpu_gx_gdsc,
 };
 
+static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
+	0x1004, /* GPU_CC_CXO_AON_CLK */
+	0x1060, /* GPU_CC_GX_CXO_CLK */
+};
+
 static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -350,6 +331,12 @@ static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data = {
+	.alpha_plls = gpu_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcm2290_plls),
+	.clk_cbcrs = gpu_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
+};
 
 static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.config = &gpu_cc_qcm2290_regmap_config,
@@ -359,6 +346,7 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
 	.gdscs = gpu_cc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
+	.driver_data = &gpu_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
@@ -369,45 +357,7 @@ MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire ahb clock\n");
-		return ret;
-	}
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	clk_huayra_2290_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-
-	regmap_update_bits(regmap, 0x1060, BIT(0), BIT(0)); /* GPU_CC_GX_CXO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register display clock controller\n");
-		goto out_pm_runtime_put;
-	}
-
-out_pm_runtime_put:
-	pm_runtime_put_sync(&pdev->dev);
-
-	return 0;
+	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 
 static struct platform_driver gpu_cc_qcm2290_driver = {

-- 
2.34.1

