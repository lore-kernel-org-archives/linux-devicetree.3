Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C88734D915
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014527; cv=none; b=RHviZf6Iy30eG7tNpvrQX8ZyEise061TjjnCzZTRNmoC0b9yXyD8Z7yA3ylz5fVbNKaWxtStf30t1P4NzhyQROIGd/W06Hd0x65YPRoybat0n2GjhC4kK9KbgH1Vmt0vXD0VTwXfxxWftuVZWA1CZDlB/2chtLHP1ljaTNCXn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014527; c=relaxed/simple;
	bh=oGbqM6EN41lmsgErQceCRY68q2RnSqYHK/UP3bSocb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rk1RsoP5uSgaihwmNUbgqWGycsjzuiHcbPWH6jjUrpGOT1OaT6Ns27mZoVGUHI/BIFWzkK7ZTIUTqYUHeVwfpfgBycXBTPowVrqyiZQ9NefoA1A7oTkA8kvX+azZxJfkqZ2WujSEYeF9OOBmnB9KO6QSMjML5GpsHUhYMYY2MWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EnWAF+gQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EnWAF+gQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso63519385e9.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014525; x=1781619325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m50m/nD8qYsKnQv0HG1rbIvdMWSxFg2dkj/6gccCEjc=;
        b=EnWAF+gQY/mYH2j1Rtz/aIevvqebw4wiKkkAthQlSXkEiT3TSKfOtwB8UpCYccIi9A
         BYJOkhYgzM7I5GADu04sWhMYrB9rR8qeIddlHkE+t6gZsVYV3HYrxMnJtRfWDJagjlKH
         ZhW+02cTi4ZmgsQcLCQCbTAJPMiWAaUFVRP4DEb6X+GBxxEit6+8ZstSTW33cPvIMVem
         CVxJ1ecqy6wVBe3qYd4EuWlaNIntwfBifHBJwbdgXYmu1lyK/U0fId1kL3qTPQieScZB
         sKyUAdCFl+zX2iYxh9qUApUaPUNLow1qjFmbXW++uIJgO8I6YnZ167yk/mI3aR0LQTyy
         Iq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014525; x=1781619325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m50m/nD8qYsKnQv0HG1rbIvdMWSxFg2dkj/6gccCEjc=;
        b=gi2smjuY4y5TduAz1cbb098w3NwYoal9n+/2OTk9OOQOJSYK0Xb0A/i5WJJ2yHSSAO
         D1piXU2mtmXNncGnddqNPZ0acnxrss4/0YK8/BvNkKdXe8fzcbXm2JiLKqDEfNB9h5SA
         Vq/JqH2rx72/XXWyiL9RClU/SgHcg0bZF7mJyJYixZiLf32VKs64najAhiq5QJ37+whc
         hnFvOsvwou663VjoiG5Ca1+NcISr2NeLogb25Yao2cyPp2sU++6Cm8p6Wi0KfNdgNy0G
         6jG305kY/OtvEqwej92EhJdm62uSZjcdZkpI5YsaBAcOWqT3I5d/DEpK5+1VoBxGgBMF
         HMYA==
X-Forwarded-Encrypted: i=1; AFNElJ96FOzVZkjGaTUkF3edTU5QlO2dtWYgbwTUT3pF3Y0u9UZV53BKd0rmJiZJVj/OIi/twPpUJirhGYDe@vger.kernel.org
X-Gm-Message-State: AOJu0YxHf9wuRGRtVsm+2ZKuBmX4FPD13gdykxRgp2YClxf0Z+3napw+
	P4OQyBCQUx5HwnRPMQMP4KvMdlcmqGg6vVqs3fYTImz/uq289yGv3z/61gtmPPSAyIk=
X-Gm-Gg: Acq92OGFskvz2XGuloziz40C7pJYU7mUi50Wj3H44ijOvQFoGDtV8PggM46NpfiTLSD
	jIFBRVwL4vl9r7I+aEMd9wnQrP3tIYka1SOk6M60+txxZAOasairwULBHNuPgXJyV1G5TFsYLqa
	mI/IbQU8Nvw5xqvf7WtN88XskPIXKcaB9wzqeel92nWmdncAav7MLaBSRrheBi3XUUVoJEnx5s0
	xSi8l1yRJfVeWlyb1ZDKSjUORMmyUToR5s4RMXtmLVmCKdi50qSAx/3nca+KlhCTmL2HelduJOS
	E/PttKPDmqnTK8w7MowH6PXnk61vSdVicVW963zTw53Gfi1xnNGwjLXGwd2/Ajm6vHjvjjTlGmd
	LG8ZuvImYr9NhsJDpbI1wNChhgz9P0T2n59/bD8Rs/9GDGZpqbKpMGQoc9LiYRrcMaXzKoYp19Q
	Lpl8solJ8uNX9s6Vq57LBtdFRm3n9+hx3BnWLEFsq9hGYX1Dg=
X-Received: by 2002:a05:600c:e548:10b0:490:d2a4:1b59 with SMTP id 5b1f17b1804b1-490d2a41c3bmr73028535e9.31.1781014524390;
        Tue, 09 Jun 2026 07:15:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:44 +0200
Subject: [PATCH 08/12] clk: qcom: gcc-mdm9607: Drop incorrect
 system_noc_bfdcd_clk_src
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-8-5e9717faf842@linaro.org>
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

This clock does not seem to exist on MDM9607. Reading/writing the registers
always results in 0.

Presumably, this definition was mistakenly copied from gcc-msm8916. On
MSM8916, this root clock is used for multimedia subsystems (camera,
display, video). MDM9607 has none of that, so this clock was probably
omitted in the hardware.

There are no users inside gcc-mdm9607, so we can just drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 61809e221d69..0bd4c12483cd 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -257,18 +257,6 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	},
 };
 
-static struct clk_rcg2 system_noc_bfdcd_clk_src = {
-	.cmd_rcgr = 0x26004,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "system_noc_bfdcd_clk_src",
-		.parent_data = gcc_xo_gpll0_bimc,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_blsp1_qup1_6_i2c_apps_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
@@ -1468,7 +1456,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[BIMC_PLL_EARLY] = &bimc_pll_early.clkr,
 	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
-	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
 	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
 	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,

-- 
2.54.0

