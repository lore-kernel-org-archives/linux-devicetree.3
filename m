Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD783446BE
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014524; cv=none; b=bDOkmonUVeM+ZNfaT8TcGCPEl8Q/kVy57P+VXhSXxAbKcqDpqZtkGezTm5QwKfV6VTIbqwuBL1dpy8jWEGmPfv3jYo4JAQAnixo29FRBx/Fxiqho6z/xc8rZbyd3vHpKUyj+wij/ndyF6/CSQnKQDZ10vFpY2bx0AY/UqSWDr+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014524; c=relaxed/simple;
	bh=gr/snqPCXMRgD4Vqhu0RLziDOGv5ZYzLjvee3cXndFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aEbMSvo9ArggnJPCAEQoO6AhjmAaJfDcQkqRjf9Kh3Hgc2UGzGYQxzzWXkLQ6PV+V5KfAqCkK7DvnsdIDG1XeMSniH+iqR3zR/S0OQAwzaD2trz23a8cy3P6zV/6OMJ2LCSzsD93Lf9e0AZSnwnx1hOGHN8MWAuliF8e3MLbJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPTaSsoA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPTaSsoA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ac357c55so61185385e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014520; x=1781619320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OkefV3MvzoG01azX7X+knm26SKd9cR3V43+TFVkWxo=;
        b=qPTaSsoA9SN9LCWGIz/XTlN/hDs+AjkqsCzDAkF0glu2Fnm1xr33zo0fqdag4F81yb
         MEZQ9FSOm1H0+XizvizqUvVKjGwMdEqIZqDD2ZZKwtWzQp2kQiflDdtBNMk+6vBJmyhI
         WPT4XuQJyRLK4ANGdBadJ6zSyu41Kh2PJeWnbgI/GEQVtzm+hEwVlhm0lEAhKTQs8kVH
         Z972Owj3f3vhl7WlFtZ8j+7uVjfEu5+z8brbFuW/LhnPOvILf5gpN14AhR32sG7g/AMU
         0pyK7P9MXOZTEKNA80SJ8p+h9eVYWAtiTOk+6Nn8tups9u8zyUcaBvH9+hEx32hOcu8Z
         Ihfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014520; x=1781619320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5OkefV3MvzoG01azX7X+knm26SKd9cR3V43+TFVkWxo=;
        b=m+By0LkXh9s9Jdw5FXTEho/UVRRvNvmrrNJ3rkYBqPzGDxXBTzctY2xzEd5KU8boS8
         d23od5RcjaoS9pZaoVHvrVs7LWds/YxwelnNAMSda/wDAm/io84wPX3hsVmMaCHI9CPy
         Rei/wy37AojQoIc+VAB5PTsUgVI0fK063ADoW77ivUjSzQcKNaLmlUZlODH2l4yckwiD
         L8KGgmcjTmLhIkG8moRNO+TNYIA/ihDzGnXDFnaMP0ikmqA40KCF7Csh1qdOcPbQkmit
         Ohu+dioCWov8oJEJf5dGLVQ5RRPMt98/63/IPicXF0XUrPVCNYWMbNYWL3EFlnLMxEM8
         NO+A==
X-Forwarded-Encrypted: i=1; AFNElJ94MNE1t/phol/+rIRuQ03NXi+c+fouaQcpCR0EgypjlAHLtp736cr/DAgSdWNNX8GD9H8LHq3hPoLE@vger.kernel.org
X-Gm-Message-State: AOJu0YxgKfJ1111xay4+/ZNOQU0uW7Vdx4grHHXLLV6Vw13bXuRaQX+r
	8O9woR7mD5WjERWpasYryGroB1HnMEslQIUKizpVc3UrsjBX6bPUbdQsvZzuQyp9G/k=
X-Gm-Gg: Acq92OHNEa/p4hJ1QMydq6dqknXVzIIGJGLl3c9tqew9KHCMiUlTQlC+8H4h9CrkYGy
	FDtfxVZ8n+DR6T0vxUrFe706Esnx3P69ERX2kR6n0MMQFJEnYSRHkuMsnUPc8sTZUpuPErwT2rD
	wXGEOMD1dvH9Llvhvcy8M1xqV6TQJv3VAOBVcOVWJAqkyVh18cQfRX3vVIls7L0SLc+NxIEBaqS
	2iRRY7mnRk+NS1cRkAy8zjpwLcJxRnRuxwq/YyxmtKveOehdxhaiqMbEreHR8gSyxG4pdbMU0EO
	HshekVJ+c8ftuGYNsjOUwCfRowlqZYxJjGLpFYxPrWL0EckVsfr2w7cONt0Q6/oVWbc2JiHQL0D
	yBxK2qgEjJdAyiJ3WbzqvgAzdfNRWhU96PWiA0FrWDpQCcmQD43rJAUp+vWBvGS5ESUuLxaV/8r
	YcjkA4NrHasqUea93IgvIiR5ziBQjeb6BVv0kVIt4muPwrTA8=
X-Received: by 2002:a05:600c:8183:b0:490:5cd8:d213 with SMTP id 5b1f17b1804b1-490c25c4898mr298626375e9.15.1781014519919;
        Tue, 09 Jun 2026 07:15:19 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:19 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:40 +0200
Subject: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
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

From: Stephan Gerhold <stephan@gerhold.net>

The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
match nowadays is gcc-msm8909. Looking at the differences between
gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
definitions for the BIMC PLL.

It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
used for GPLL2.

Replace the definitions of the BIMC PLL in gcc-mdm9607 with the ones from
gcc-msm8909 to make sure we read the PLL status correctly and don't make
accidental incorrect changes to the PLL configuration. With this change,
the rate of the BIMC PLL (600.6 MHz) is displayed correctly in debugfs.

The clock naming typically used for Alpha PLLs differs from the older vote
PLLs. There is no device tree upstream for MDM9607 yet, so we can still
safely change the dt-bindings. Nevertheless, by keeping the old ID values
and swapping the two entries we can preserve ABI compatibility for compiled
DTBs. Previously, BIMC_PLL_VOTE (71) was the final PLL clock to reference
when needed, this is now just BIMC_PLL. The previous parent BIMC_PLL (70)
is now the parent BIMC_PLL_EARLY clock.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
dt-bindings changes should be usually separate changes, but there does not
seem to be a good way to make this fix bisect-safe without also changing
the dt-bindings at the same time.
---
 drivers/clk/qcom/gcc-mdm9607.c               | 51 +++++++++++++++-------------
 include/dt-bindings/clock/qcom,gcc-mdm9607.h |  4 +--
 2 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 499e0fbbfab9..d0b08b112fed 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -121,7 +121,7 @@ static struct clk_alpha_pll gpll2_early = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x45000,
-		.enable_mask = BIT(3), /* Yeah, apparently it's not 2 */
+		.enable_mask = BIT(3), /* BIT(2) is used for BIMC PLL */
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gpll2_early",
@@ -192,32 +192,35 @@ static struct clk_rcg2 apss_ahb_clk_src = {
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
+static struct clk_alpha_pll bimc_pll_early = {
+	.offset = 0x23000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data) {
+			.name = "bimc_pll_early",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+			},
+			.num_parents = 1,
+			/* Avoid rate changes for shared clock */
+			.ops = &clk_alpha_pll_fixed_ops,
 		},
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
 	},
 };
 
-static struct clk_regmap bimc_pll_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(3),
-	.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll_vote",
-		.parent_hws = (const struct clk_hw *[]){ &bimc_pll.clkr.hw },
+static struct clk_alpha_pll_postdiv bimc_pll = {
+	.offset = 0x23000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "bimc_pll",
+		.parent_hws = (const struct clk_hw*[]) {
+			&bimc_pll_early.clkr.hw,
+		},
 		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
+		/* Avoid rate changes for shared clock */
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
 	},
 };
 
@@ -230,7 +233,7 @@ static const struct parent_map gcc_xo_gpll0_bimc_map[] = {
 static const struct clk_parent_data gcc_xo_gpll0_bimc[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &bimc_pll_vote.hw },
+	{ .hw = &bimc_pll.clkr.hw },
 };
 
 static const struct freq_tbl ftbl_pcnoc_bfdcd_clk_src[] = {
@@ -1482,7 +1485,7 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[GPLL2] = &gpll2.clkr,
 	[GPLL2_EARLY] = &gpll2_early.clkr,
 	[BIMC_PLL] = &bimc_pll.clkr,
-	[BIMC_PLL_VOTE] = &bimc_pll_vote,
+	[BIMC_PLL_EARLY] = &bimc_pll_early.clkr,
 	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
 	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9607.h b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
index 357a680a40da..fe4c15be3781 100644
--- a/include/dt-bindings/clock/qcom,gcc-mdm9607.h
+++ b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -76,8 +76,8 @@
 #define GCC_USB_HS_SYSTEM_CLK			67
 #define GCC_APSS_TCU_CLK				68
 #define GCC_MSS_Q6_BIMC_AXI_CLK			69
-#define BIMC_PLL						70
-#define BIMC_PLL_VOTE					71
+#define BIMC_PLL_EARLY						70
+#define BIMC_PLL					71
 #define BIMC_DDR_CLK_SRC				72
 #define BLSP1_UART3_APPS_CLK_SRC		73
 #define BLSP1_UART4_APPS_CLK_SRC		74

-- 
2.54.0

