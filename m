Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FD238239D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350181; cv=none; b=RcDn7CIK3TbhWS1MMg2/ibsZ3XmJhJ3dmiM4gaWXnkQJXO40mEnPAb2srcEnNEODDmEC7K31pAUPZA1hMqtZnBnskFspi11fFshdeAKyVxtrdVddsFrQQNQmHL71hcw3pW7WK0lVC/k4y8++802J+3x+o9eYZLo5xx+5efoN5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350181; c=relaxed/simple;
	bh=7EVf7sPgwz08uOEICfZTm2vyiIZLETiS/W6o+3w2BxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ftTRo5BvfxPjZd8xmdLNSn80GQhYtz1ZFsOa0PgaQ0VaKPKTLGHqXk/J8ZJNbhV8AKuf+lfmyDxD2RON6/8qnBnMmAyo0M62oivn0mOiNetbHMV93XRXSDh9ZO9RMj6yv3yVKll8SiNUkOTSKgkYE25wxv/+kA7o3Vyk4c4ntQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UK82YOZG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UK82YOZG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso32410715e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350178; x=1783954978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH8HjuXrMw2eGpjgO3KSZfxBVdv9hq/LigpfLGCHtBo=;
        b=UK82YOZG/jr03MLFPNgmxCEFlq1zBVTWH44o56O490XMXI3Yuri6je5AERAkKMo4dD
         FrixllGsdrkNQ3SjOXNoeAnIMtegIZDsKlfw9oSk5tuCTAdkuNkMOTxqiHItBCFt0oY7
         zZkpMyqLx28kTCx8QuZnTYu8hcwNJH8FZ6ZUQZWaPzdwF73/XZch4m17I8gKirquQd00
         +f7t4rpePAqKvji2IpgrGxIrHdVrAoQVCFbToubvSuyF5HVGdLbDsFmgeWzqQvBkPwsA
         ZPcmbuDHof0Plpbw7Cb5p6hS0x73Cp/AhByUrujNPLz7PaOb2ao+/N5f5JCkkvNHCYhi
         mb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350178; x=1783954978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FH8HjuXrMw2eGpjgO3KSZfxBVdv9hq/LigpfLGCHtBo=;
        b=Z5yEaP+/K8VXB9fhLEsGJKKKZJ6/jsc7XHTXiQx9lVIFa8IE3dtBvcfW5gCT71F0mK
         Z3+4KWW+81SrxndrF/n0OHjWB9Clrhz8ibRJZCjkQqMFNO8egyOM+xezxlw0NxgwVsmC
         KK1bJAAGcH1KHisHvhpuGrw/YxWo0X/ORWBeU28T5NxVsMAOgpwjtJurBomxCb2ZZgPf
         Lur/7kbNb/mJ3p6SF0eH7VcHNjVe0tuGZSAloXmjWrdYdXCr3PPz86oPBM4pkaHBRbSo
         BIJvpJ8N0AjpvOh87JKmXtxexIExzb7is9rdkR4lVlB+xcUTHcqo7JnNNAy28gdO3p8T
         AHVA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Novu0C3N+m5MwTQmYxli1PtnqELwzOSeK21xuI7dMprq9+8Eh+4DHmK1PAorwj2nIdx0KBnDK8be@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/GP+cCXTlcXu1h3qgov1ItvFOC1D9MqAezeUqmvbzl7MK//Fn
	/nA8DmDonM+Vt7pwyN0kwQsb6XHf3UvJljwd0PLcPDJcA+Iw9/DyHPymWhs0XqBAyrOhXMJhk5L
	EPRomzyI=
X-Gm-Gg: AfdE7cncS7/iiwlWRUveDIaqgoWKH/Yeixq53jSFIVmeh/1KDXR48nXzgoqe1bMfJV/
	XtL6ILtITT+XapGYCiqHlc42+Qo8wM/lyxBQVaTR3FmzQBp4mLHV+e2LiQ9j6Gunqg+a7Gu+dHe
	EzKX7Ox2a1sX0OhprWTeCzMmF9ZniS1D06TrytmdT1l6Lf8rZZ8uxTymF8wVdcvI/mK0SYMNXLs
	00CIx+3TAbCnHkmVi2v/Zc/c7k7aYNTejW62b78xGUrEZMGoNmCbPjrDfegY/TGg+BrHwR4ynRh
	9NlFoJ7Mf/jpGKMnc4KUezeCpCT4rOk202rpPk034AdXVn7qC18FRsHc/4MsqC41rW922mplV5A
	X9R/TpBWfOBoYCScUwcsWvJ9GW65e8zbbtj61Cy1dun1ae4xpTh7aR7tivCzq7nTTeHF301EvfV
	ButB8RU2tvm30ao/Sh1UDbr0snwg==
X-Received: by 2002:a05:600c:5297:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493df062140mr10992855e9.4.1783350177732;
        Mon, 06 Jul 2026 08:02:57 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:57 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:13 +0200
Subject: [PATCH v2 06/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-6-745565101869@linaro.org>
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
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not exist on the specified address on MDM9607.
Reading/writing the registers always results in 0 or crashes. The math in
the frequency table is also broken. GPLL2 on MDM9607 runs at 480 MHz, so:

 - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
 - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz

Presumably, this definition was mistakenly copied as-is from gcc-msm8916
(which uses 930 MHz for GPLL2). There are no branch consumers of this root
clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
parent instead of this clock), so we can just drop it.

It seems like this clock does exist on this SoC on a different address, but
since there is no user and reference code for it, it is still better to
drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 092076a5a0c9..f9ed655513ef 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -158,20 +158,6 @@ static const struct clk_parent_data gcc_xo_gpll0_gpll2[] = {
 	{ .hw = &gpll2.clkr.hw },
 };
 
-static const struct parent_map gcc_xo_gpll0_gpll1_gpll2_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL1, 2 },
-	{ P_GPLL2, 3 },
-};
-
-static const struct clk_parent_data gcc_xo_gpll0_gpll1_gpll2[] = {
-	{ .fw_name = "xo" },
-	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &gpll1_vote.hw },
-	{ .hw = &gpll2.clkr.hw },
-};
-
 static const struct freq_tbl ftbl_apss_ahb_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
@@ -674,26 +660,6 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_apss_tcu_clk[] = {
-	F(155000000, P_GPLL2, 6, 0, 0),
-	F(310000000, P_GPLL2, 3, 0, 0),
-	F(400000000, P_GPLL0, 2, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 apss_tcu_clk_src = {
-	.cmd_rcgr = 0x1207c,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll1_gpll2_map,
-	.freq_tbl = ftbl_gcc_apss_tcu_clk,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "apss_tcu_clk_src",
-		.parent_data = gcc_xo_gpll0_gpll1_gpll2,
-		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(57140000, P_GPLL0, 14, 0, 0),
@@ -1512,7 +1478,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
 	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
 	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
-	[APSS_TCU_CLK_SRC] = &apss_tcu_clk_src.clkr,
 	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
 	[GCC_BLSP1_SLEEP_CLK] = &gcc_blsp1_sleep_clk.clkr,

-- 
2.54.0

