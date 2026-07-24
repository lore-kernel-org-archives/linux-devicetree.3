Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83BD42BC32
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890524; cv=none; b=XirWzNbJMDfpSOxGgWEQ23Sswr7xQSBi8xM8/Uty8XAbbVpzKzxNU80BSIW7fihaHwQeHnF8mQj/ReYLwJ7fNB2Csb/vO1B5jAFY+61Ov8Lkbfn+m+GJ+lrCS/xkFnfmOk02k/afA2rB6+T7QyeQKSTF+Whtdv50Ajxr7EB2yg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890524; c=relaxed/simple;
	bh=DiqcmbipYKVPWMsm2gl/onsES4uB3Fu+pOEHra4ye/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=haYM1cWr6cG12n5vbteX8OumeUnJyaOTw/zTnlk9YZ9svgV75we2Yvun1MWJ7qapMDKWqIQWxwt8MLS0TAAHuXxj5TkArhWvqmEsDDZS64KEEuMBR265CNzjLkPlAIi0XTMmZHgS8TOPWuAsodBicVDTLKTD+ECZ/Zl6xSEdPcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HP//NJjq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGCtEMhN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HP//NJjq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGCtEMhN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADYqD2478975
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Orh/7fz+n0VqAwrj2aIkOe7RBY8u8i+x8BBD5dRFB9c=; b=HP//NJjqbTFHLqVk
	h6KMqiNWNhtWgpz+Bsh9rpqRrJXhrrxS2UwLVNj2A2OipctnX7okStq58CC/z0Cz
	PRcvbc4ty95KPVNS4UbmQ6gk3Hom/KIV+Tz/hKjzaeHT5Oj1KE+CNPKBwP42vZic
	nvr/1GWaMUYblF+iug8SWnn9uZXRIBRQ/K88Nfmo8vowKZjwW722IbEyGt/lQl+B
	xDlA8fxSARlyxny95IzpF1FZbLbab35hTClRQHKZwMSiAtoM1DLEuCsHJhuMZFiI
	AVurIS7UD/AnEu/3MyxpTfs6grFPj+DRWoCP91eg/+72KnEoIFM89i68TNeJaYni
	mUZWQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx93vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so6406715ad.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890521; x=1785495321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Orh/7fz+n0VqAwrj2aIkOe7RBY8u8i+x8BBD5dRFB9c=;
        b=aGCtEMhNxDWLnlJYfwUGFDeiwMUV/8pFpaqFnOTrJx2NAX61vCI3y82+ky5m1mhvtU
         CML0UMC8HUJ5JQzDZ6ieQInnGZrSz9rAmZw685WPQfXrINiAbLYqDiwgf9m5nZ7jz/rA
         bYSVEy28d3aTBtaVRj4f/1/L0dJHRxs5EgMu/MioMphXwPMKmGo5wB1Dibmau53/yEIx
         1L2UyULqHwfaYx2ZvmcxspoAwJUf1aXkgpkgbPDKjtvlYfWgkDqW9Ksf1nVa6LqPlQxZ
         5tdfd+fauKvVLOgbRAHXAdiWC/1nHKHVnHBUlyqLMIIlVNb12FZUozi4j+sal5tcQs7g
         MlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890521; x=1785495321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Orh/7fz+n0VqAwrj2aIkOe7RBY8u8i+x8BBD5dRFB9c=;
        b=DN2Iljb0QAxX3AfS7aJXwf69k1bdk/sGh3Sk/0MiDE1DFdCU9jDPFJOUXunN/k87vn
         89B1nMmTghlKWkvNpg8O2gjFEJ7rJt8ifqhSAiaKYsYGu9ZUBjydI581aJ3HmsHbF+1X
         +ci6iMDRfiZusYzXxbJ2a+iM97R6Ne1ObpP9GZu+YtOgYzX0lWbYLJk6FTh/l/1Rker2
         Vx+7WPAHx5HJHtTmaqf8MCwJFmQDvZn9fMZ5Gp7vpM2Czd6fcuGg+NTVQpLhNGOrUuYo
         9GP86a5Fgea3Q+G+G1CMOJAROk2KYSp3Gu4tDjO/x8i2oy2zngln1OT0/w8HqnJlvt7W
         rkSg==
X-Forwarded-Encrypted: i=1; AHgh+Roa5Iwqm5xflo1yoz/bOTpR4Q0LsPY1utAUKM6lpQqX9Oq0yNAKXqCtHbKtbxk9EjZtOCEUnNKAjtf3@vger.kernel.org
X-Gm-Message-State: AOJu0YypdfC9Lt4vmPle9j4OhP7jcIHrIRh8wV0zQkmMQ1TQa0HljeVV
	F51HTXWVyW6aysD2ptnnitjf/wktzX7SNGfZEWR30Zc6VNW680B+ui6tc5LJ/pwUua/iHZ26nz+
	A6HAKmh2cBtAYwot2MTw6l9PneV0Lsi3OVZIvsnY7KCQSxKC1KlVJVkvTQoBtAT7g
X-Gm-Gg: AR+sD12IeC0BCJrsif08QVYmbN6oJpiajn7TF+YH6WFATyQgJ6CzHsUtme5vNNNe9wV
	m/2YkFCp/IlrhLFeHCc3M+Hg3w/i3tiJyTU5TM4Jm7ZJ63dOPzakmHnmL8zF+1wv9938M/kgusp
	FjgYOp0j+sDFt+cl44IXFVgw3kQ1si+a9gVrzFvGqUZWdTM3WKf+czm5UwgnGWgbuI1JVGxbYqk
	zAGcEotLcXKNxsYm042HwsQwb12Zrwsm9Ryh6u+Qc9VtFNVemQK1HVkodXk3bDmGCM0xHN0WCvD
	dIriTlV4C4LZ71q+/nqLkD7TE7yptIDibEgQ9f4f5+r9EbsFFi6gecG9OAsWr4/CfyAIR3Tw2MX
	2g779LRHlaW94zLtgt1zLrWYG
X-Received: by 2002:a17:903:1b10:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cfa7435a36mr77050175ad.14.1784890521200;
        Fri, 24 Jul 2026 03:55:21 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cfa7435a36mr77049875ad.14.1784890520810;
        Fri, 24 Jul 2026 03:55:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm49314775ad.55.2026.07.24.03.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:55:20 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:25:05 +0530
Subject: [PATCH v3 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as
 critical
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-nords_mm_v1-v3-1-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
In-Reply-To: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: RF0xtTJgDBk5LPqWNLLT8PXUGMsQ4vFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfXxz2eo/vh5ehl
 qxl01XQZ/UOyrfFE+hFjldPwgOwjdMCMo3/ZqRUebs+zjEvM6FseH+ttbL+5j1MuL/cVEm0Q+jO
 1ryfvL1Ycz+oL2F4+pK3x/CWmOQCbCzRuuYMQUcPiEGiXDEY8/Hp5bjFpAr1dFCqusFYLlmyTba
 d8p2guOgrFng+hAHdBfiNmga/WVvd1GQYWOm6PzJxEmsU00UVaCLT6gH0K8PoCnIhCWlVVBStWL
 9/Jm/bWd+tUT9oOqUUhQbROJZ38MqKsRWukH0Ign3sh4DuYB6G9q6OjK28W5YnJV/G2LM++Rz2L
 JcS7/vRxNe2z63s/H0GvKRGpY+nryuVPbyuil2IU/Y2ZCH6L1kFndGuuLEH/oPQ21Ov0MyUWOBe
 dXN0wE5iTPPsxiFMVMnNryan4LdgkO+t3MCCDnFYkEQDPo7DkfSITv9WRTtF1Ds0tCNVtbTZc9+
 iZBFFc57fMp29oSJQTw==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a634499 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=CVX4TxgtaZIOJJKr5bQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: RF0xtTJgDBk5LPqWNLLT8PXUGMsQ4vFe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX+L+ofgtmiTMJ
 XblXnM0ZAK3xdL+kwqDyxTL9Ept+rS5VN0WjRyGhlzZTrBLY+hQTInFJyrCZ0PjpGbwDUYD/KaX
 M6WzXzHalLAEQb0spX0XFSMeXpz7qyU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240099

The PCIe link AHB and XO clocks must remain enabled for proper
operation. Representing them as clk_branch instances allows them
to be gated, which is undesirable.

Remove their clk_branch definitions and register their CBCRs as
critical clocks instead so they remain enabled.

This matches the handling of similar always-on clocks in other
Qualcomm clock drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
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

