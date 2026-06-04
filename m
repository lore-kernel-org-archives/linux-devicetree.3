Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8C3BFE5C
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550823; cv=none; b=cqnmULMWz6RQzfHJElB8ta2liZS4Z/O9b68981bTicxNvkBaLaX6nB1QHRAGezAxdAwA9kKD+Gq8lnULPPxig7yPKnCYfRZ3mIfOx6f2elmwCYw/gEsuwvRwXyXLd4yLLeJ3Tjn+u6D6lcpzSVOJ5fOsfZAwPtM2R9gb6jiY/jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550823; c=relaxed/simple;
	bh=sfuATI0fCC0PdMmc4wHiyaBvpIQ5ZcPp15gGK/db0jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FuHbQfqyJveBGDJc8dRrKKoGkJ6EZl6RDNoxp8GPh9T5Jo5rwGZ9u0hv7hRTNB6Ad4m+tTuJBLbj84V1IDn3hSu+YHnym072WltAVHpZsHCEpPSmrfIoBQLE081lxKgbRF3XyRccMjdZz5ygfi03+ZucgzOkzaaUb4rCRx7d4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzjTSTOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e57bx3SI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzjTSTOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e57bx3SI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65418hB0140442
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzeyjYyJNfSQbXmAFrqFQg8Zn1md9eGVWpG1i9pHV7E=; b=ZzjTSTOcQXQQWkJZ
	tvrGlqYDUwwW5BPGrsQVvEbrhzfOZZx8nZgbsdCwA31X9uJo+vIDoc++RDVj3PLv
	xPcHibPiRwzLE1rxG8okvBmljrduk3QheN34X5npOoy8wKEi2UlYaJKGrdewwXxI
	7JRP2SJUGNUwSUuPKdgEiZR7DZ5L5ZZ5aJqPtRbuX/1/J0UGYS78BSXwi8217zKw
	9QR9TC+gQxFjTMid6NtHj5HLT0m0dhwvFSHcSGMUanlW3Z7s7i+EqfMUHWBGH1Io
	VoSiahn/CbVUyWmKoOuQqWicVmaZmA7YFoIPgsps1ctTIK6dFHOFJuyOKr5DpEwm
	9XqRQg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen8r25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:27:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842692bf60aso494482b3a.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550819; x=1781155619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzeyjYyJNfSQbXmAFrqFQg8Zn1md9eGVWpG1i9pHV7E=;
        b=e57bx3SIJ8VNB2Ud2NIwqTqrx6fPGeL5mkS9po26ZNA08qZL5ZrbgrPDeroLlK45xm
         V8h0tksM8VIfMJVuCAKFmeDsdkzEmQK77A3Fgkl1aHqCTvm52hkHX+et6krWmS8FuzxB
         tn18pkiaBExiSHc+PItzYZb5pabLulLe6ahSwmYKjLLF8AfVLnua6qhPd1sGsWzoWPu2
         yIKTXmaSoiwO3BLzW7kFc7oaEgNPYklTlix4x1vp7MNL+LqiPDNQ/A/MaIuxDJMBEdri
         88Nujj+hOn/Z3inV3KgA69//zsKx43OMqH6OA9ILsVI20DQ5caNBxB04zeVQrNJYYVOK
         nqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550819; x=1781155619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzeyjYyJNfSQbXmAFrqFQg8Zn1md9eGVWpG1i9pHV7E=;
        b=aOnvyPkK/BHwdIJnuZxfka+m5HDf0uYzj0KUCdGLlFp21LbL6Eake8OAbJcsDMA+Gh
         Rcw8MTLuphwapNScPZCMJ34RVSgC2we9KYHXBsfD4RnFbvGaxBcfWGGi1cFC94UU4bgI
         Xyz6ZhfGxPsqSdfdggyXHr3tFmyz17xZvb6h6+haj7mCRMKAf2FV+62hAur+AdhJNDRI
         Q+B0BaVWJn0QLQq8abEP00jhS9S+9Jl2oN7uWsq5OzFhCa8t1pzgMWrLLV/won7cyOWc
         LyNEre1uU//JFxFm9+42etrh335zsG7Vk8TRl4VmrSBKBuQ9kHlRAxbJ1OMrgkpoiHKD
         c7LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VwSuyW0Qm11bsF+3KbImxk3CO7itShRrg13c5mGgpc/9PsEOk7ohcAfyqz8dRGBHRzz9PbKooLE0j@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3Nul6Pj/a9nWaN/kVsNFMqpYjUKHVdWMu/cvqHTc20R92zJD
	v/eIZOGkehHJYf3KLUBxLanHIJc0he1Vj9npqkKB2W8dtQveThY0n7pD2ExIFgV3c+xXznh3YAR
	Iuf8nfPbYersZRQJQPGe6rIMN4BohrDTZn5xozOPijFCyFsKALH5PkSGUtofkj015
X-Gm-Gg: Acq92OHY9kxkYMmciBhTLu+9E5sOTAlfJTvNg6XfVS6wSnhBO6JQ8rYOgaHAHJcye5V
	PIPh0slgxn6gNT1n9qxmebe8TI+apg6ae8DeDkrg1VauBFQ5vxCoJPxUP6d76FWnTKII1ZHMiLc
	4T00CAPtxDzURyO7M1nyh3SNzVIS38p5wobA7fFjDh0rbLazkFzWmY6gEEMMfUZTADdrD/hFiRo
	eqYd0PFIdVPFwmW3W6oun7f7kaY0XCmCrSM55/fq0ln7FvOITRyba8o+/6dfWzn2fUejCwmg7dx
	fsrT5QMvfGMsginzOky4hzGjK3biazxVXLoYtnV830ylqKzuT3S0oyRdvy3N6eekr6UvPB80G3u
	5eus0mMwwS3VL7F7w3uUOQBFkqB9luSFsrqWE7X4Bfu+vVzi/5TPf3dZ3EUEHA2c=
X-Received: by 2002:a05:6a00:2e05:b0:841:dcf3:e521 with SMTP id d2e1a72fcca58-84284f3436emr6990210b3a.49.1780550819509;
        Wed, 03 Jun 2026 22:26:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e05:b0:841:dcf3:e521 with SMTP id d2e1a72fcca58-84284f3436emr6990172b3a.49.1780550819064;
        Wed, 03 Jun 2026 22:26:59 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:58 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:12 +0530
Subject: [PATCH v4 06/13] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-6-8204f1029311@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a210ca4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Thq-9bDrPsIKtHylmFsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: l8JbaigW743IWHTuaVPpklqBgI30BJf5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX3/gfyW68fDD8
 hQpv+i3f6qCFmtc+3zbji6p8w3LUIsfTwboqpevSaDavYyw5wmS+YfHrWgvq4Tq5JuQLlZRbatz
 SkytQ9ejCssH0vLc26gSP+f798JepZlOfKiay6ww+UVNjGxhiG1YvVkL9QpQWyQb3hRsSCHYbvH
 Zi+UHoFL+YCCm1p2RFi9DQjrwhdN2UBYCv7UfMOtgEWMMSGgWg3SklwC5I6hKT1xb2E8ts3ZRlh
 36XQEHco6fELsFLnSFQDrIOy1ZvTaUHJoMFDjrtkuJ7ejdrpGAHOd5WuQRBR9sIbJrC/Xh2B09K
 pcW4+uTK2WU8IIZXV1pP7mPk/FUR/8CHtwl2at9jzhJQhPyrh671ggRE3VZIOglQ9vPt4k62iqp
 bA08VASiWRBHuRmsoN8YQAflUuJHv4bHwf6I7+kJpLGpg9ug7pbPDEAZ0A8v48tVt1Wo5gYOEUl
 Yn3x2652WkNzLa3u7Cw==
X-Proofpoint-GUID: l8JbaigW743IWHTuaVPpklqBgI30BJf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040050

Update the QCM2290 DISPCC driver to use the DT index based parent clock
lookup to align with the latest convention. While at it, fix the parent
data of mdss ahb/mdp clocks to use GPLL0 main output as per HW clock plan,
and update frequency table accordingly. Also, add the DSI1 PHY PLL input
clocks support.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 1c21267ae0f7a86c1de88e888c2a990c35f0a0e0..f5dbd19d0a0334362a44f91a69229cb0f018f309 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -24,6 +24,18 @@
 #include "gdsc.h"
 #include "reset.h"
 
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_GPLL0_OUT_DIV,
+	DT_GPLL0,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+	DT_SLEEP_CLK,
+};
+
 enum {
 	P_BI_TCXO,
 	P_BI_TCXO_AO,
@@ -33,6 +45,8 @@ enum {
 	P_GPLL0_OUT_DIV,
 	P_GPLL0_OUT_MAIN,
 	P_SLEEP_CLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
 };
 
 static const struct pll_vco spark_vco[] = {
@@ -58,7 +72,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_pll0",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo",
+				.index = DT_BI_TCXO,
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
@@ -72,8 +86,8 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -81,17 +95,17 @@ static const struct parent_map disp_cc_parent_map_1[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO_AO, 0 },
-	{ P_GPLL0_OUT_DIV, 4 },
+	{ P_GPLL0_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
-	{ .fw_name = "bi_tcxo_ao" },
-	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
+	{ .index = DT_BI_TCXO_AO },
+	{ .index = DT_GPLL0 },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -101,19 +115,21 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 	{ .hw = &disp_cc_pll0.clkr.hw },
-	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .index = DT_GPLL0 },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -121,7 +137,7 @@ static const struct parent_map disp_cc_parent_map_5[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .fw_name = "sleep_clk" },
+	{ .index = DT_SLEEP_CLK },
 };
 
 static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
@@ -155,8 +171,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
 	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
-	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
-	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
+	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
 	{ }
 };
 

-- 
2.34.1

