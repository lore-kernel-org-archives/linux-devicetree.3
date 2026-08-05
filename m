Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517B742BC39
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948527; cv=none; b=TdGHUmgI4iZlbGdi0914g8MIQUrfwaAA0w92YDQox4KMXI60BMe85qLR8Yh9QgO0U/CQk9triNUl7YW1h8mvL7MXbZZqTcxK/ogyL/bjlDRyNN6iPkpbHZ9e8LOjQcheAM/rR2qv5lafzcMhOpqDuBkMPVDxtYiY7tHiOC/Di7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948527; c=relaxed/simple;
	bh=eqrXWTygDdND4F854TXXEBBpn0+EjvDV8Ssmv2WQbM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duFxHKjEjIp7VlnRaxYdTgaqBhF8MWCtQDF3ydHhbsCH28Y9g9iloejxBixNFqCk3qRglsJuHhSYnGi10rzvTtzd6jOU276Hr3F/UQsru67Kw+vgr7LC2ztUSPasgkBbK2XEEbxBHN+QAOQR4BkZqUiJygtfTzUkko4jwyKkMCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xn4ckzRw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifs1EteB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xn4ckzRw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifs1EteB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVU1W3332430
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 16:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TO6lpqm08MQbWhNL/DEevt9+rjOakxeIPhEjkQSNruo=; b=Xn4ckzRwj0Kzxaw0
	rIwX2f6VvMN8x5Gr4NcaptNMKSRWUVoP2of9NAiWqrD1SFxLzPWUjhUtxLzOG27Z
	MQUVxhg0ttcd9eZyYAgQOlfMYrml2AWi4oXtg/FthtYGpt3GEJXmnD3somaGVZEN
	AcM3HQYyouwvvY390KEffo9JKTGY/JqKwNRmulqh3Q6WKRgSMSARio+jXAC9MHve
	tVkP0YLNUgsg60rf74F5xnquhYNBiPR9FSsNsrxyirxZift2pH7bnMSVbEO6z9Qh
	zzxBs651CvMSu0Z4nDyZP/SuCLo6dD0e7cT19q6i0daS+dfto39JQr5YyDXdqd+I
	o7NFdA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2c0a2fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 16:48:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so20658375ad.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785948523; x=1786553323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TO6lpqm08MQbWhNL/DEevt9+rjOakxeIPhEjkQSNruo=;
        b=ifs1EteBo98c0GwrCSB4MKRFMNXT0l32Vypz8J6zK+4O5y/unC8VvfBYUTmHugqqu2
         YcIFJH2arNyHWn6TbEgad737K83mar9DVK+28RbI5Kl/yPBTOyiVd9rd69SnNPzciQTv
         ucpEEi+kCh4WO1ysFwLIZ/FxkJV2MJ1Am8kIdoMABwmW3b6IUkYbAwnDITDIG5L/8ify
         QxeAhZ0F7x/olp5r6TpW4zNTNvSteS3PppIS0KHEvtlr+bcWSAKsF4hsy+5hTVhKDtE5
         PMzuC1LolkFXn9nOqqR7XaBDVTgeiMTEb8RiQ98Bh/tTt49aViW3hUNbVX5MhxL8EQCi
         CbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948523; x=1786553323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TO6lpqm08MQbWhNL/DEevt9+rjOakxeIPhEjkQSNruo=;
        b=F8rav9WOC0/86nvLXOXoM4ssar7lP1Og4dLxLGYEVbcCHRYUYxyV/qJEYKiWCQvgXe
         sacGi6rXq7INz3WUpGTH3BIxI66drt4iZZ2fC+HPYdKOkchZ+Nri30weVqO6sTJiZHDn
         +1OJAs1Xrd6K0ksjsTdgPgBPrMwxgKgrfzZca9w2ZewbK5KsefeXIGlVeqXX2qKqUzZo
         TuYh76g4HPk3higX+yQy4q5VKwHEw52MwZherps2bNk0BPPEr9vrXYnl0drW4ABzThyf
         ApMc1bLBVmjp85SGCI7/WMGSWZaZq8pNO57NdMsrCtWxdK1gm0CzmN2y94E7rZlvkgRm
         J9Yg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9ZZwCwE2a0BBPQ4XzZMAOiu4i0T4dEK125bfPqr9mqBT1eWTs2mcj7bEX/x4LlAbKENqXW+p4Ywgn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz01zu+Yh9W2NB40TOlOy9UBrjpw1ffygdTOnZzjcx/hs6gbQYH
	+n2VcMyKhm3Zk+QjGFGryfWfHSSXGVrlA1BiqyEM1Z6W9R6DvGCPsKd3QixKtL+GzuKra+VUA5H
	//DBX/vO8UJeb0mb6kDKe87v3cMrgaWWu9uylRsVEDxlkoZi3xeBvNUm4xAza26Eo
X-Gm-Gg: AR+sD13y3wTeCpD4ZWAFMDOFtt81oIq5I07ZlcgFjYZflLLtIqFN+xxz32bv0YYQa+p
	bH7tMr6vTaH4vBCQCZmIEmC//M/6wOqglOzsNnpSDUGLBICVkT/hFlePLjANVHsi5iIuuExl8Of
	HCrRhivn3mkvLyv4Ty6rT1eQOhttt7Dc+UDqzJP7YK95EGX2bClZBUxlXUGfXOLI6J3FZ+Pw7bs
	WsEl1kkHdR8wmzjuxS7OTS3FK2ZZn65b8sLvNuV4brsHfsA+qPF2SucXrjreAEVevUGxU2ejbo2
	bGKgPevMkXfZ1nv2v5r8+bnzsU6lUzzL9STMucYW744BXxhTWMLsWyTvk2gyVsP4cktTon5OTBt
	edm9QNDKKyKia0bONc2CvRIOXuavt4XU=
X-Received: by 2002:a17:902:da87:b0:2cf:4c0f:5129 with SMTP id d9443c01a7336-2d0caa03fcfmr83550515ad.17.1785948523159;
        Wed, 05 Aug 2026 09:48:43 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2cf:4c0f:5129 with SMTP id d9443c01a7336-2d0caa03fcfmr83549875ad.17.1785948522600;
        Wed, 05 Aug 2026 09:48:42 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d986fsm19159465ad.75.2026.08.05.09.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:48:42 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 22:17:14 +0530
Subject: [PATCH 2/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks
 and resets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-qcs8300-tsc-clks-v1-2-e7a5101ed479@oss.qualcomm.com>
References: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
In-Reply-To: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: c5pGK0i3getssqJtJ66VLR1uGYVxIDYB
X-Authority-Analysis: v=2.4 cv=aOfAb79m c=1 sm=1 tr=0 ts=6a73696c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jA8xgZ3SDyylpiKY2QsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX48d5x1RY7VDu
 rh0tBRLovmkiAxNYNqrF6OiRJ1XxSaS7MRt5XJfqjoBjTx8wmlBW0Wx9OapPwl0iN94wIt1xp1P
 BflSG5Xy54Z0t9oi2DNFWQ61U7uUd/c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX126Y925AcYfS
 pP3gLdOoI9oNJhU+u+gRhP3cKPBIiaGY/jRiFHexkjJEH+CSeOeK1zKqvxAc5qDtlCXhaTvqOnn
 9bl1V+wuw9iJ1+Y7UKzABmY32vagLDeVnAwVVew5hucKnRQmXVyaimhlYDqsKTPV6Ye0POSWfYF
 OwhNSwWEWWdAPOthylyoP3C7f/aHOlJbACRmTmsjVKyi440vFtPKpc2rpolTP7SdgP5bnauWl5B
 RhohW/W4nhwEEH0qo27PpoDBchNWN8SAU/5OLSuN82lmJ9raqyqCEMJ7OPJBHvdqA1FnXytNiIy
 rmvcHAcnuIQLdrU1bg1TXpFQD2mRuA4Rrnsz4J60C0ymL5Ce73p32953VS2iAJnG5VBzctARCBP
 gKTzeYM0QWYBW44yvcq8ScV5q6MRUqJh0zfpInLGT3Cd83ETsAQ0++CWDK8dLdxNRSkSN7q/3QY
 N+hOU/n5dRLrVI2/kHQ==
X-Proofpoint-GUID: c5pGK0i3getssqJtJ66VLR1uGYVxIDYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050137

Add the GCC TSCSS clocks and reset support required for the Timestamp
Counter Subsystem (TSCSS) functionality on Qualcomm QCS8300 SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 103 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 31fd870b10f7aee14b390fecb9e44b8d8a11a77e..146b3b5dfead31ab508fe3df62a44b559026e750 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -42,6 +42,7 @@ enum {
 	P_GCC_GPLL0_OUT_MAIN,
 	P_GCC_GPLL1_OUT_MAIN,
 	P_GCC_GPLL4_OUT_MAIN,
+	P_GCC_GPLL5_OUT_MAIN,
 	P_GCC_GPLL7_OUT_MAIN,
 	P_GCC_GPLL9_OUT_MAIN,
 	P_PCIE_0_PIPE_CLK,
@@ -128,6 +129,23 @@ static struct clk_alpha_pll gcc_gpll4 = {
 	},
 };
 
+static struct clk_alpha_pll gcc_gpll5 = {
+	.offset = 0x5000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.enable_reg = 0x4b028,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpll5",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_evo_ops,
+		},
+	},
+};
+
 static struct clk_alpha_pll gcc_gpll7 = {
 	.offset = 0x7000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -364,6 +382,22 @@ static const struct clk_parent_data gcc_parent_data_18[] = {
 	{ .index = DT_BI_TCXO },
 };
 
+static const struct parent_map gcc_parent_map_19[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL7_OUT_MAIN, 2 },
+	{ P_GCC_GPLL5_OUT_MAIN, 3 },
+	{ P_GCC_GPLL4_OUT_MAIN, 5 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_19[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll7.clkr.hw },
+	{ .hw = &gcc_gpll5.clkr.hw },
+	{ .hw = &gcc_gpll4.clkr.hw },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
 static struct clk_regmap_mux gcc_pcie_0_phy_aux_clk_src = {
 	.reg = 0xa9074,
 	.shift = 0,
@@ -1094,6 +1128,25 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_gcc_tscss_cntr_clk_src[] = {
+	F(15625000, P_GCC_GPLL7_OUT_MAIN, 16, 1, 4),
+	{ }
+};
+
+static struct clk_rcg2 gcc_tscss_cntr_clk_src = {
+	.cmd_rcgr = 0x21008,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_19,
+	.freq_tbl = ftbl_gcc_tscss_cntr_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_tscss_cntr_clk_src",
+		.parent_data = gcc_parent_data_19,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_19),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_gcc_ufs_phy_axi_clk_src[] = {
 	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
 	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
@@ -2899,6 +2952,50 @@ static struct clk_branch gcc_sgmi_clkref_en = {
 	},
 };
 
+static struct clk_branch gcc_tscss_ahb_clk = {
+	.halt_reg = 0x21024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_tscss_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_tscss_etu_clk = {
+	.halt_reg = 0x21020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_tscss_etu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_tscss_global_cntr_clk = {
+	.halt_reg = 0x21004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x21004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_tscss_global_cntr_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_tscss_cntr_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_phy_ahb_clk = {
 	.halt_reg = 0x83020,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -3360,6 +3457,7 @@ static struct clk_regmap *gcc_qcs8300_clocks[] = {
 	[GCC_GPLL0_OUT_EVEN] = &gcc_gpll0_out_even.clkr,
 	[GCC_GPLL1] = &gcc_gpll1.clkr,
 	[GCC_GPLL4] = &gcc_gpll4.clkr,
+	[GCC_GPLL5] = &gcc_gpll5.clkr,
 	[GCC_GPLL7] = &gcc_gpll7.clkr,
 	[GCC_GPLL9] = &gcc_gpll9.clkr,
 	[GCC_GPU_GPLL0_CLK_SRC] = &gcc_gpu_gpll0_clk_src.clkr,
@@ -3464,6 +3562,10 @@ static struct clk_regmap *gcc_qcs8300_clocks[] = {
 	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
 	[GCC_SDCC1_ICE_CORE_CLK_SRC] = &gcc_sdcc1_ice_core_clk_src.clkr,
 	[GCC_SGMI_CLKREF_EN] = &gcc_sgmi_clkref_en.clkr,
+	[GCC_TSCSS_AHB_CLK] = &gcc_tscss_ahb_clk.clkr,
+	[GCC_TSCSS_CNTR_CLK_SRC] = &gcc_tscss_cntr_clk_src.clkr,
+	[GCC_TSCSS_ETU_CLK] = &gcc_tscss_etu_clk.clkr,
+	[GCC_TSCSS_GLOBAL_CNTR_CLK] = &gcc_tscss_global_cntr_clk.clkr,
 	[GCC_UFS_PHY_AHB_CLK] = &gcc_ufs_phy_ahb_clk.clkr,
 	[GCC_UFS_PHY_AXI_CLK] = &gcc_ufs_phy_axi_clk.clkr,
 	[GCC_UFS_PHY_AXI_CLK_SRC] = &gcc_ufs_phy_axi_clk_src.clkr,
@@ -3523,6 +3625,7 @@ static const struct qcom_reset_map gcc_qcs8300_resets[] = {
 	[GCC_PCIE_1_PHY_BCR] = { 0xae08c },
 	[GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR] = { 0xae094 },
 	[GCC_SDCC1_BCR] = { 0x20000 },
+	[GCC_TSCSS_BCR] = { 0x21000 },
 	[GCC_UFS_PHY_BCR] = { 0x83000 },
 	[GCC_USB20_PRIM_BCR] = { 0x1c000 },
 	[GCC_USB2_PHY_PRIM_BCR] = { 0x5c01c },

-- 
2.34.1

