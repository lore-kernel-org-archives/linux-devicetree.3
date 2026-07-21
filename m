Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E242FCCC
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617660; cv=none; b=pTpSMU7LJsLxpVtcWltv1mcpuATNkO6UvpTPlF7+Uii42Anb5OI0XXL2il1Ox/I7a+OgkHf4cagiwwLd+gEweL7uxS3MZ6+X4WeTba9dpYYii4c2f0VrKTbgyXNtA8skBgNt/8orLLTVgW168x39LPFMjjIwNwLE7bx8K5fsNLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617660; c=relaxed/simple;
	bh=DV1CdvMN9m6bWlXx5Ut29Idb/+Jyc4A5Jt70Fw7LcQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hChKHneYMd6KtaCKlMXgCFCsl+ldP+EzmCEoWbIAHiDGN7s2j9D96pqU1OMT85g1cjmfJjOu5nxDy30N3jDUzomFhN6WTsF3NoojYs8rTbNQeTIzcdMWElhMCEqEZJKBHM14ornmxqijCjaSZx6sk0c4JQs7fyPQDykoA4cR9iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0sIY0Wx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApHmUYC2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0sIY0Wx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApHmUYC2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L3xoAF568565
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dd1/x4M1c7J6tJdq2UIZ+6b06JDpOzhLnHLOC3/5vc=; b=p0sIY0WxWZdc7ptQ
	rol2VaG5Wyg/pyvtw1vkqLS75Jv4SdViV6YQO/E2qXWzzJOCJKIx3uIZz2tn5aPi
	kfIor6ZVGegzhcz3yVWqhOgRsHo3kPGCYz3SueiEqOKL/vdfAbK0ryNh9p6fxOJ9
	k0HZkHGky6rRFPOEyleVfppr67CWhCwIz+LrlYcVgPLH+9Zp0FDx1vnC8qpOPVJt
	Y+jaKhBMARPdwwU2bRI3Ara0cZ4zI2FvoEd401A0c4eX6aPE5mWqtlF4cpNc9Vi0
	rlCu13xZZkE6zcO23I/vztlmaq3j52zVwmnSL5h+kA3f9VXV8nqjBDXToev8VlYN
	axpdfQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvrnr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:07:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84865f326efso11510200b3a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784617657; x=1785222457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dd1/x4M1c7J6tJdq2UIZ+6b06JDpOzhLnHLOC3/5vc=;
        b=ApHmUYC2ThZHpT3GpSchqvT5YUngC+FeSDep0BKrtuijZ5r4p4CMdyaLcy/iAx08lH
         IeBk5Hhrj2nh3NCOSbepzR+vlMe6g2L/nKkv8VYVk78ufqO3UXVTrdcOCjHi/ZBzS7GI
         4SMLJ7hcaUk/tV556yFhFFC9Xf0OnFnDKst0qzVWfsYS/MGjukglAwDCsA+wlTD+prU1
         mT5tGa6vPgEtIZMP/ksNxXXd67QD9OAInaOwP6StC2Qg7YbqxVxJPufMDAJUUGtx5wQ2
         HglHAtDoYcVanhoea8Ec2ji31yDtr3mn00VN1k4DFzG+FXfxlq4k3ixHW4LOrl0dGQZG
         0j5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784617657; x=1785222457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dd1/x4M1c7J6tJdq2UIZ+6b06JDpOzhLnHLOC3/5vc=;
        b=Of9OgXkejKheyOd/Atis95AGqysXrnwkPZm1eZCa5fY75ugBhW8TQneDa4P0xRb3eU
         pIM7jRmnBhg6ZcMFujkrYcLBEcKIr+Gryr1RCA+/ER3HxLSP0r0Oy5QMx4KKAKlmxjXd
         bZzO6pRNdGhBO/zf7P5AzOE8tu4IvbHtU84o1xLXIlAm/hCGnAcR0fwCdFZNu4uZQhUt
         GHz3vgtb7yt1HIb1632mGdU99De+N8hYaZdktxKqQReyVx1rSDVF75Ol749ztCiLqiog
         1PcSdrFCGTCIihcC0ZNRb49QSeYxct6ndobdAR9Q7gsAeEc+LjToEAIOGvwDao4yJ35C
         lWUA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2Rn/RqJiWpBmHiGi9Q4O0SSUY8KOcMuypUVsCxuac3rHCdqLuS/kV1pDCpvoXzodPb3XcTqG1V0fj@vger.kernel.org
X-Gm-Message-State: AOJu0YwZWjRZWdtxov0WwuFYOFkBjSkXePNTk/QT+C/l9uNhIA4eOSmH
	sxHibuFgQIu8XmZmUdOzU66fmghbgrSD+G0Gq5VroXJooAJYOFmVT5c/MwkMUgbK2ysF2JTLyvr
	t6agBF0FGfP80XIPxvf2Td4BrPmc2A9yig7/HiMwFguBHDsBe3rF/gj8MMed5vHaI
X-Gm-Gg: AR+sD10VXp+6JSNXEs4p/6M7FT7+8oHbevAfwRCfTKRxxEZRqTer6os7IlG/x5/MWcK
	RYk0o3v+F6Nm6ZEXXDNn6gdyKnZBfbkfe6FHDUAbJKEm2uAAy5pfSWgtIKiNxRvOTz4lc3+eS0C
	Ogf0UMLNAa6I3GJAAQ4ah8EuYVsizkt3rWlyfmtkug1e4y3FECvjQyOwTumHd5IaE4riIFBq+r3
	SEqq3iy5kQqvbRAQbN0vrd+eeclW7Yv8TUHIkhe4zmq8ZetAspCW1oeBNTr3JNkGOoPc9sslGIe
	8+5WYI6GI05NS7l8dr1fSINJaK3Z1t7cV3sxEYofvRBDP8BXhQ02g7qIyppu4/DAeZ2BRp756tl
	0qw50dYArO1HsbKAVbBRhu5Kx
X-Received: by 2002:a05:6a00:6d56:10b0:84c:5349:daa1 with SMTP id d2e1a72fcca58-84c5349e426mr6481114b3a.76.1784617656889;
        Tue, 21 Jul 2026 00:07:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:6d56:10b0:84c:5349:daa1 with SMTP id d2e1a72fcca58-84c5349e426mr6481097b3a.76.1784617656467;
        Tue, 21 Jul 2026 00:07:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc74csm7080833b3a.18.2026.07.21.00.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:07:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:37:16 +0530
Subject: [PATCH v2 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as
 critical
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-nords_mm_v1-v2-1-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: N9mrZNkRfuKGJGeQk0rRMru0WYo-Ni7J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX/WTYMqB1bj+x
 +7R8ccKC3hP249A5nhT0VFk6H956Be5YUDBH3bMtoJgaAhr//cTJEPl2YD3Oi52r/zNKnWaffhc
 d5F6mda7NRPU9vkyK66i34bKHDxCdwg=
X-Proofpoint-GUID: N9mrZNkRfuKGJGeQk0rRMru0WYo-Ni7J
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f1ab9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CVX4TxgtaZIOJJKr5bQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX/8lsLP9Eymlo
 yMbd0ovOwDyl+MUDkpQLOPTxGofaFsWbeJ7flyfEJAmES2oRGfp6PY2iyefhBBqLPaQoApWZHHV
 fBv+6wcmvhhcGXTnPCpsGH7SlSj9hzhdhrM2/R8I/QawmzN9/aXbSHyZdOLJ2ng96cXz38nvznq
 iJ8Y1v/2Wr2+PjcVBvlJn9deLmffQAGeJTCZ69Te1GWfUYAtJGpWPwYmapWs9IGFqMI+jc3UWa/
 dCMj81bdaYu2NqmLrXvN6lLMNl50EAs2zG2Knl7fcUHQugk2ZXWLTW+6pLnjIa+bcoab66dmsGj
 iTIrajm0uDGFMeLiYPewePXv5O6RbvrW1xNm9nGO3v9BzRPfvox9eQazTwY7xMAQk3OVGYs8+qh
 uucGamlfyXYjHU5kQdIkVFdy5fN/2Kz1XF1FabV2AMpS8EjNyJzsxhm6dGNpu0S61a2LeHqCUjZ
 QXGKbuhS15xQb5fFBxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210073

The PCIe link AHB and XO clocks must remain enabled for proper
operation. Representing them as clk_branch instances allows them
to be gated, which is undesirable.

Remove their clk_branch definitions and register their CBCRs as
critical clocks instead so they remain enabled.

This matches the handling of similar always-on clocks in other
Qualcomm clock drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-nord.c | 37 +++++++------------------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 8a6e429f264022d55fc5e59b9ec46ae1124f9ad8..299c616be325156ccd457b7b6ef45afef364ad4e 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1185,34 +1185,6 @@ static struct clk_branch gcc_pcie_d_slv_q2a_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_pcie_link_ahb_clk = {
-	.halt_reg = 0x52464,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x52464,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_pcie_link_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_pcie_link_xo_clk = {
-	.halt_reg = 0x52468,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x52468,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x52468,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_pcie_link_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_pcie_noc_async_bridge_clk = {
 	.halt_reg = 0x52048,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -1758,8 +1730,6 @@ static struct clk_regmap *gcc_nord_clocks[] = {
 	[GCC_PCIE_D_PIPE_CLK_SRC] = &gcc_pcie_d_pipe_clk_src.clkr,
 	[GCC_PCIE_D_SLV_AXI_CLK] = &gcc_pcie_d_slv_axi_clk.clkr,
 	[GCC_PCIE_D_SLV_Q2A_AXI_CLK] = &gcc_pcie_d_slv_q2a_axi_clk.clkr,
-	[GCC_PCIE_LINK_AHB_CLK] = &gcc_pcie_link_ahb_clk.clkr,
-	[GCC_PCIE_LINK_XO_CLK] = &gcc_pcie_link_xo_clk.clkr,
 	[GCC_PCIE_NOC_ASYNC_BRIDGE_CLK] = &gcc_pcie_noc_async_bridge_clk.clkr,
 	[GCC_PCIE_NOC_CNOC_SF_QX_CLK] = &gcc_pcie_noc_cnoc_sf_qx_clk.clkr,
 	[GCC_PCIE_NOC_M_CFG_CLK] = &gcc_pcie_noc_m_cfg_clk.clkr,
@@ -1850,9 +1820,16 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_nord_critical_cbcrs[] = {
+	0x52464, /* GCC_PCIE_LINK_AHB_CLK */
+	0x52468, /* GCC_PCIE_LINK_XO_CLK */
+};
+
 static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
+	.clk_cbcrs = gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_nord_critical_cbcrs),
 };
 
 static const struct qcom_cc_desc gcc_nord_desc = {

-- 
2.34.1

