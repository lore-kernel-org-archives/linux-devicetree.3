Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EBF495528
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086301; cv=none; b=oY/jI2KuBTXan8UhfPOWrX50mWzoMEY6zgq3uxD/bXGEJCmmPByJJraLNyVfQlF9C1t5nadPnIpRQVtrI+w8GTU/rVEmQr7RaQ1LSVC4pC2VGFdg4x1koUH7KemyX5P16ToPQWIzdSg0DMQAmy2PlyFUNdikgCgWCwSp5XHE6S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086301; c=relaxed/simple;
	bh=40NxVXovUiixWCXyomPxXiMim4vp3tig+MiKVM0oErA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejBCDRCTgGi26UW3QpzrEtIUjhP9Y3a1bAxagtiCTxi1kK/dgxFg392DAfvTL4Y8r1xDKZPUl/Nl6IXYEB9wAYeO8jZrEg2uQkdd8aSfKjADLsrGI9v2FzXnsPd+2OMJKfEjTmo/ttNaXHZcDk3lQAk1nPkrHSEvrIwh89MdjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4GuygyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TyYryf90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4GuygyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TyYryf90"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646E5Dqm2427834
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 16:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzNYzFHoxvD46pWkAWSFVcW4/RTuh1Ic/IvgIy3sPcw=; b=K4GuygyQva6PX61I
	xQEL8/0NtzhsXP7i3SOXqrGXW8baguTS6SH7A2a0XUdZLVEPDdnNv6MuSHXfaKmX
	7Wd/aioOwZ/aBZRXyB++licGlu7XzaY6JcBOhNObeOWoRVFCxUnhdBKepUowUZWf
	9YKN1SRulMpgOipbACXr4v3ZMOb26sLD2CB0pBz1eo4D5RG4q6GBalz8wS3K6ZnA
	1QYx6PFsRYzUDo1G6pe/7Y4CNBCoZQ9pYObQ+7YVqDQ2HPZm12pHWB5Sn3S9CM1M
	Ich/tQ9gb3xT9JYUr+ACHI6yYmxTj0JZRxbvNsq3zyDyNn5ZKwjpBUDtRU/WfWtF
	8LxsGQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph23e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 16:51:36 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dc1c0b7ccso1080858c88.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086295; x=1778691095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzNYzFHoxvD46pWkAWSFVcW4/RTuh1Ic/IvgIy3sPcw=;
        b=TyYryf90ouM9yxdY6vIGOsqcBAvhL+oOJbqheggO1pe8xFRuHid+7mjA/NezIzRrTU
         aoN2V9tjYCg5mHyKwSXzsXPJlwriofTwFpQDE9KtC88j2hLgZcGWj8H2AWx9jCG3SGe/
         7kPOfpLjgCWKbUtC8sb5uXG0i8Vb4tRV+zu6NdSCgByAF8jkEGGThuKArLqPo8VlFunX
         aDHqVqPKrizi9eTaIzvkRpytb8F2NJwrpi+uLaPnxfDxbpucoqL/VCegI/Wmqvylb2Sl
         ulli7jpTBC81H08y0hHj7nT9PR8ej1iUAKouRrrjkM2duvwvZKpVya5nUQw51tRdcpdK
         F2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086295; x=1778691095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzNYzFHoxvD46pWkAWSFVcW4/RTuh1Ic/IvgIy3sPcw=;
        b=aSBL0Tv+M9C0mBEyp2C+UVwitsr0uRI9EUysZ8V82L7NQqY25hd/eqSJEPkzZoRFNX
         2in4P7020cjKmZgriQR1W5JyZK8Lgflqd66KD5sHlUk9p69jt29VKNoPr5uitveJSBUI
         MDTje8PdaoyR++lXNbbDmkXbZFRnrtN93dO9WQF0j2jI6BDeDExh/KHcYOna0866deFf
         jnd8qzI/ZTkMfcv45Mn7ZtQGluOhBG29zMtxKhhHlx6Y7X12MuitoFWYy55ruCP+Brhc
         J+LPxn+XQAZVub6qx4UdSWypIRusJw8ix4KAZNxaMCRWJwGagkr+neZZHjfMUF7sj+oy
         LipA==
X-Forwarded-Encrypted: i=1; AFNElJ8cOQ0MimgWnqn6wXPmKLdXxhaEbmbnLXlq6TLJr7w0CnkcHn9TPQtQkEp4h+cl1GdAHcC4hoLdv2sZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRbEDeITSPLBSYB144HInWRvsAydjYs4naZI2v9W/Xp0DERX1
	8+o9j5oUhZH0rxt4UFg0QrCPiY1eVIsWYOfNnGi5E+R1b2DhwpIXpwgtiSO6CgNywYCdlnmZCVG
	kz0DzYbIQEKfjq4dQxQQ3IbthPJU47Ka8PnNl9hF+s4MFJuNbdJnEsFlDfhKxSLy+
X-Gm-Gg: AeBDietFtuXDhOfG5ANGRA/EnPduVn2hviYMSKeSY2yO+2tduWb1u6Y+H0HuUR7bQPX
	B6SuvtDzQoYtVh9WpsU8HU/oVCr4WU4FkYBWonzZQhAsC8tx+IcngWNp8FoECy/rWcBz4pik5vi
	tnKcn9XtmkzeeYpa2pwf+shBLWGODQzTyZcVkFtzZRGAcF4cecg9Htm2LlNG+wjUHOqotqfgvSg
	9CAg4uvtVq/ctzdM93Wk1erG/pRh91obYkkZJxnKoTmZ/jmrXy5tpXigGXZZ1EO2fn605+75x2K
	Kmg+/4sO5RsLB2CjDp1YeC4n1eMLJQVE6e7hJnaaTA03E3e5Ea9QwnUfJe3w3MzekvVSheGfl8o
	kExn3j+gVBDrDJlJGXdGiC6iE6fUaaf+x0kkAdKzJo32moyUGQNb4vFsjRCY4f2yNdj3GCZo8Fp
	jfeRoGeJ54/W4=
X-Received: by 2002:a05:7022:6187:b0:128:ceac:6db4 with SMTP id a92af1059eb24-131acfeec10mr1995903c88.6.1778086295066;
        Wed, 06 May 2026 09:51:35 -0700 (PDT)
X-Received: by 2002:a05:7022:6187:b0:128:ceac:6db4 with SMTP id a92af1059eb24-131acfeec10mr1995832c88.6.1778086293088;
        Wed, 06 May 2026 09:51:33 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:32 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:43 -0700
Subject: [PATCH v3 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-4-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=3051;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=40NxVXovUiixWCXyomPxXiMim4vp3tig+MiKVM0oErA=;
 b=c+XjCtSNJc7nTfD5N5hOh1UxYyN1MjW9YZnKBJdKoT3KT1btu5w/rV3cZYHyqMrigGOepk9Sp
 Bv45AU3OTYUCUcCDBup/23udKJtQGIElky4t+5gLSD43FiJlG2Vj6zJ
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfXyqDPs74Pco1g
 XUo1t6zzaoT0nJ7eTdrkOUUqOg2Y3TpL1T+i+byX1HOOJ7bnASdWGVo/DFuNTn2sHjEyHYLkdTd
 ofGZK56g6FXqaz1P36V/mfTBauSy+r28lIeTGoPW6+sRJymGQLxROsAhBgRqOLtiKcCrfY2+lVR
 jdn6mu36YaHb0uXo2WoAwaXh1MmyMY4vrkrYVNSOHfD5TNXajkAGQ/uvDzHR1k7Kf+66aJLczNJ
 RP291kb8tYpQTTqcfh8WR+EQBQxLD+5Vn7AIGbrpB/h57L98QDzP7dcXzy/F4wzN4qGBRw76kNB
 ufMFyqKxdeC7hMvhq0iDSKfoiLhdUZadYkc2H6WZEiYD2T9S1W+Mqyt55lfmKV9JGwRYYQ0eNld
 1rBXIIwlRbaVYaY4MXfbEwkqWF0ngVQNamE9/+dxMevKFmX8oK6GooqiBOGiadiieoyor3bFS/F
 Ev9MY18dYKi6aTWo6IA==
X-Proofpoint-GUID: R8gH2qCcO7C0gzJdcNfqL8CsJCgSPI_z
X-Proofpoint-ORIG-GUID: R8gH2qCcO7C0gzJdcNfqL8CsJCgSPI_z
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69fb7198 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oFwqGCNmLK_XFdElRrAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

Add RPMH clocks present in Qualcomm Hawi SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 339a6bbcdc4c..8eae6fccc127 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -409,7 +409,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
 DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -984,6 +986,36 @@ static const struct clk_rpmh_desc clk_rpmh_nord = {
 	.num_clks = ARRAY_SIZE(nord_rpmh_clocks),
 };
 
+static struct clk_hw *hawi_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2_e0.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_hawi = {
+	.clks = hawi_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1075,6 +1107,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},

-- 
2.34.1

