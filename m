Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334D0393DC7
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350184; cv=none; b=rqqVRNjni/Zofxb8nJIpA6XZlhOPKfVayb8sP6Wn2PqMF5pSZKFoY867QnsQFTKqgLKgYFwIh2U8NMavbXVmgPDIGdWnuuI0Xm2fHJGKL3BAhWGyPWuiSuhuvSAahe+f46GoQ8iot2mkkPYYm7WJdKvl+L1H4ibohIkzcEvjOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350184; c=relaxed/simple;
	bh=oIr6Vm6uJCeF5fjiXKn75HDnWRdml/g8/xMcUJFwrx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBA3U4gaCmkhYeXBbYAFqOWv+P2TZvT7p/ROAhl0U6r6U5KM+JggYRWatG6uvmMQzrfatgsi+eB2qOBGorRGy3vCGqFqsm626bx7dpDbXK9N7oPFroQGJ5M2t3qd0OSXzX8zdcHoFvjDMwGTcGsxw8YCzCW9CqlSNSLrgxRfZUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nVft5dIY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nVft5dIY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c7902f47so18988835e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350180; x=1783954980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L0VpsGhGY/o4A3yhDDb9FR13waT1cgBjZY/lBa48nA=;
        b=nVft5dIYaGM2MXSU82w3rOa8XeVuLX2OPEogCQM9aRx2H1GX/2OlGCHMArh40tFgQG
         UJQqsBnkZeQ6GJjC2tu1BfgW1GDBB1/CEHO2lFBC4wGFWqfB/wagvD0Rfn+Zky8Z2lsU
         9aScVo4ByuUTzMCa/LsBtXnMWH5vEjxy5RfBWEcPywADv0fxUxNBtaskOPMPGEuAvamS
         urWcTkWEW8D7cm6zPTM3+Lq5ZduH29YLptCXO2MVeZp+8PjEUUyaOtFumODdIfkO0BLD
         NJbWpcQX/HCkdvpDklYiFQJgYALM4Qb36VrvQregkPLpVk3T252LhwlDtSUSCpBLp+VN
         Hj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350180; x=1783954980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+L0VpsGhGY/o4A3yhDDb9FR13waT1cgBjZY/lBa48nA=;
        b=hPM8aE6TXZ3svHhk2yYrVT94seRk4rhjCzchFrHYWJkhBPDSDGLIEkyHgzc1Cy056R
         fdayT03XnZXf0sO4CeZWMc6+pJH5eE+VAsHmGzpGeDkccju3wUWiViqLq5P+9j4MqZUe
         MJqH6Eoj9SlXwkm3Sp3zYhb3fbnq42npdh742pJhFrk3q2nJX8UZPQHhb+yBeDhE34QR
         t/RkjF7WeQnm3pf7qL29n5PCTH+AI8SIRXxOYNSO2Dm+xQSlfFSq43gk3zTMe0XKuVtT
         36Uy6cYhaSTG9QbSD9wpYl+9yX+4NWh9R2vyVYIBGmBKww+yH0HPuLTrZnHbeHtIGNHi
         JaKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwdYH/qJ500+pyojlZbS0Hdb+n6j4omF8dnrihVSOGvHMNoNqpjI/olmd/bn386jvJ5pBqmrr2jfRj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8joC3KMk0+H8NOA8UDEjJxw5bbBHHlcfrHBD5pzEdfv1/QCT9
	2CKnnBBCIfj2Zlp5N6FHWUHzmx3bymg052eS6xl55NIEKcPiT8IiZBbNAfYNyO2dk54=
X-Gm-Gg: AfdE7cmnFbLBlmYadeljkzrRk04bE+xa7ZEmkZoW/uTPbrpablhigiNbTGDr2vj/4xY
	xS256vt8e7UZ501ZYOpMzsY66kmyBVsIKGMGSoRyYOJyGs1VFl6tKWy5wSQeMsCk2Ua34GgjXpz
	syjStMPspS5j10hVTkJoFyhtsQ0jh3LhaZKxDaI+sGibi1ciABBomVGUSVJhj0JQFkHHsacuD+L
	wILPbPgF64vKpL0rBc4G7+E90AnD/81BOgYe37n+ISEgZTizjKqGsgf4BhUltUyLZ2a1rfRFV8M
	50wC6x50R4wNChenvmEvRH4deAcMVaqZrKGi7Ic1UZXvDB3+G9fCPaoQB0rO5sQNfdYb4FC6pjv
	ubcf+puC6++DCP/cWgyOop+956ld7Ik08exv7cFf9FtsE7PG/A7uJH7UlDGEZQG387L5gxoXtD8
	s4EHu93fpNxMTcs8WoCImFeZQ/CA==
X-Received: by 2002:a05:600c:628d:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-493df04a9ddmr10784375e9.13.1783350180095;
        Mon, 06 Jul 2026 08:03:00 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:59 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:15 +0200
Subject: [PATCH v2 08/12] clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL
 and related clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-8-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
match nowadays is gcc-msm8909. Looking at the differences between
gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
definitions for the BIMC PLL.

It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
used for GPLL2.

In practice, the BIMC PLL is exclusively controlled by the RPM firmware and
Linux should not touch it. So far, it was defined to model the full clock
hierarchy, but even in read-only mode with CLK_GET_RATE_NOCACHE this is
problematic since the RPM will silently change the clock parents without
notifying Linux about it. The clock framework reads the clock parent only
once during boot, so the resulting rates will still be often wrong.

Follow the example of more recent SoCs and drop the BIMC PLL and all
remaining related clocks to avoid reporting stale status data. This means
we cannot determine the rate of these clocks anymore. This is not a big
problem in practice, since these are NoC-related clocks that are
independently managed through the interconnect subsystem.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9607.c | 125 +----------------------------------------
 1 file changed, 1 insertion(+), 124 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index c6abe93ce2e8..4b749c99586b 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -26,7 +26,6 @@
 
 enum {
 	P_XO,
-	P_BIMC,
 	P_GPLL0,
 	P_GPLL1,
 	P_GPLL2,
@@ -121,7 +120,7 @@ static struct clk_alpha_pll gpll2_early = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x45000,
-		.enable_mask = BIT(3), /* Yeah, apparently it's not 2 */
+		.enable_mask = BIT(3), /* BIT(2) is used for BIMC PLL */
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gpll2_early",
@@ -178,68 +177,6 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 	},
 };
 
-static struct clk_pll bimc_pll = {
-	.l_reg = 0x23004,
-	.m_reg = 0x23008,
-	.n_reg = 0x2300c,
-	.config_reg = 0x23010,
-	.mode_reg = 0x23000,
-	.status_reg = 0x2301c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll",
-		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "xo",
-		},
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap bimc_pll_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(3),
-	.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll_vote",
-		.parent_hws = (const struct clk_hw *[]){ &bimc_pll.clkr.hw },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static const struct parent_map gcc_xo_gpll0_bimc_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_BIMC, 2 },
-};
-
-static const struct clk_parent_data gcc_xo_gpll0_bimc[] = {
-	{ .fw_name = "xo" },
-	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &bimc_pll_vote.hw },
-};
-
-static const struct freq_tbl ftbl_pcnoc_bfdcd_clk_src[] = {
-	F(19200000, P_XO, 1, 0, 0),
-	F(50000000, P_GPLL0, 16, 0, 0),
-	F(100000000, P_GPLL0, 8, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
-	.cmd_rcgr = 0x27000,
-	.freq_tbl = ftbl_pcnoc_bfdcd_clk_src,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "pcnoc_bfdcd_clk_src",
-		.parent_data = gcc_xo_gpll0_bimc,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
-		.ops = &clk_rcg2_ops,
-		.flags = CLK_IS_CRITICAL,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_blsp1_qup1_6_i2c_apps_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
@@ -735,8 +672,6 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1038,8 +973,6 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_boot_rom_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1053,9 +986,6 @@ static struct clk_branch gcc_crypto_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1069,9 +999,6 @@ static struct clk_branch gcc_crypto_axi_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1145,9 +1072,6 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_cfg_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1175,9 +1099,6 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1191,9 +1112,6 @@ static struct clk_branch gcc_prng_ahb_clk = {
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_prng_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1206,9 +1124,6 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1236,9 +1151,6 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1259,19 +1171,6 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 	},
 };
 
-static struct clk_rcg2 bimc_ddr_clk_src = {
-	.cmd_rcgr = 0x32004,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "bimc_ddr_clk_src",
-		.parent_data = gcc_xo_gpll0_bimc,
-		.num_parents = 3,
-		.ops = &clk_rcg2_ops,
-		.flags = CLK_GET_RATE_NOCACHE,
-	},
-};
-
 static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 	.halt_reg = 0x49004,
 	.clkr = {
@@ -1279,9 +1178,6 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &bimc_ddr_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1295,8 +1191,6 @@ static struct clk_branch gcc_apss_tcu_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_apss_tcu_clk",
-			.parent_hws = (const struct clk_hw *[]){ &bimc_ddr_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1310,9 +1204,6 @@ static struct clk_branch gcc_smmu_cfg_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_smmu_cfg_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1360,9 +1251,6 @@ static struct clk_branch gcc_usb_hs_phy_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_phy_cfg_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1375,9 +1263,6 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1406,8 +1291,6 @@ static struct clk_branch gcc_apss_ahb_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_apss_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1421,8 +1304,6 @@ static struct clk_branch gcc_apss_axi_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_apss_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1435,10 +1316,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[GPLL1_VOTE] = &gpll1_vote,
 	[GPLL2] = &gpll2.clkr,
 	[GPLL2_EARLY] = &gpll2_early.clkr,
-	[BIMC_PLL] = &bimc_pll.clkr,
-	[BIMC_PLL_VOTE] = &bimc_pll_vote,
-	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
-	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
 	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
 	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,

-- 
2.54.0

