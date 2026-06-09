Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB6C34752A
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014526; cv=none; b=GL2ibnwikCo+UrofHe0UxD0PgxtGiqORcY7FKZO0G30Fjx1VdgNHbeXdACxg17DtQws93VBa74f8iGaIB2l+y/RdYsKUFfVvhn3PzzMW9aZaokBsjJ7hHFR6qsnPPJUeVRpZ084GQjqLOz1O+Zp9BwgdSukAw3VuWcN9B8rVR/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014526; c=relaxed/simple;
	bh=issgt3k3RvI/5CGJJzJAMkNYfQCHRM53jrOTT6DroO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vj9oKVwxoZkBvuc5kJbj4VS1G0bKZFSI9i+Qi7rjToNtJlBbZ8GZaIQ0K/b6Z0nfqlkU3VS3WylkiEqM5iViVUIw0D55UUIlIxIsbxBDOTyG9ElGNQTnlRQYCGbs7/qs3w2BJlgfHF0MaamJH6WCg8mnqiYb2hzmb4t7x5rhOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ysX01lqr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ysX01lqr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19582075e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014523; x=1781619323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXs3e9o8/qwduDh5D/7PUgnbBUvjl2lx8El20vD0f48=;
        b=ysX01lqr2YfYZ8Hb2mQB6O2oP74cHzWHtHWS57DLP+g18P+yI6Cf3MamQI9SpZNMXH
         mobdz1rxaZt5aFyKMook18Ds07NNFJH7ruhsgbdAUng93eifT2y1bwEm8J591Iytw6dX
         S3XKuLhooyMhT9ozK0Z4CPyAfSWLSFOHBoAzm0ScgROlReIV5eoOavn4/3p+ms34oD65
         16TsKF7BhRpp2WBbF8cTAqxwHfYoSLUM7mk+wNHNq9J2vG+mTOstdRUnTU7E/2zfmK2n
         NhOJ7gG6+8BR0jEl/kEwXJa6Z8d4RH2jNqput+CuhFP8/f2zdTlt/sZWzU1GEZGJIP9x
         V2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014523; x=1781619323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXs3e9o8/qwduDh5D/7PUgnbBUvjl2lx8El20vD0f48=;
        b=Bvk4/Z+144LLUZ0R/9jIKp9Te5ayhph0NNPr//GEmU48TX8XDFmz9iWq5/fpWaZVMH
         jzk/NhafLp72UZKBJjaUVhNDQMkiKCXCIZDYLcejk7P53r1T/w2zXbHYviHY8i2fZCVV
         wU717XgsVj/Co7vOIKDC4QpnobO/79sqou1tcG3X+Vh4j7wypM1JWrfxwfcQhK3BFIbJ
         myvGrhRJfZjosCNxxyoNhqTfQDaRiaFy2uNoTC33Jon1JutxonDVkOrnn3448c5EUmB1
         53RnmMTnIkfxBZjLnPSvw+6L9wISftZB7PjvbcRN4fMEW7Ob6mrzz+WRDopvtOOy75+G
         dwTw==
X-Forwarded-Encrypted: i=1; AFNElJ8K4k8GwyYicS2buqa4qrP0DV50uss/MieYfKPyE/9eApzqlnSYUbpJUtaEQqK6d2E5h7ATRogQm8pA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtqz2ZROVYOfZqmiaF8+W8+QGmHWGG6oqfVW/6d9PK9TdEnmvu
	GSdsfT+JwA4tja3fvcA5kQyHxxVshjcL99SiBBkRpkcEGZ0CJTBYGQk+Qdcut7UNXnc=
X-Gm-Gg: Acq92OGYB8M9tBnGWoOr7hFUevXOzJKE3wvzDGSSxXISn6TQeY4c7Vu0d9Tr8sxupgR
	uXSpXDfMysPx4PM9wrJhftnt/hbF8xns84np8q0T36PfF2Q2cm3M36jBGWmPIWNQVbFIW3vDEGj
	ZQnzgkb/ZW+YqRX0y0C5FrEcF0WoilWRj9jX0Cvv87BfiTXi+MQ83aJHTkAS9Swdg5Oja/FrrL1
	S3kPh0ZEc9Xw/s3GTxH/FKsN+Sr/18yQwKtguAOKy0G8WAcj1B+gTeqxC9zcask9lt/xlh13M4U
	+ie/9bPwGC1ecMyeqavz1dUlt4QnOn/Ooh30Z7/Ylz2DTjuZPfq8hxkb3Ni9r0qU5mOVIZIrZYZ
	skIlbH++Zl8Yn5WhfK0SPpT8gaYV59rxZUJdNUeDjinfP2SJ0Vn7BLQpJvGtILSi5FmvRUUPP1A
	0HS7utMA3+d3sto9DwUajOvTjCjduakLGKmMpuUO9I+BfhyoCBH/GF+5z7ZA==
X-Received: by 2002:a05:600c:5246:b0:490:b591:b5a3 with SMTP id 5b1f17b1804b1-490c26196e9mr324507225e9.32.1781014523109;
        Tue, 09 Jun 2026 07:15:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:43 +0200
Subject: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
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
always results in 0 or crashes. The math in the frequency table is also
broken. GPLL2 on MDM9607 runs at 480 MHz, so:

 - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
 - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz

Presumably, this definition was mistakenly copied as-is from gcc-msm8916
(which uses 930 MHz for GPLL2). There are no branch consumers of this root
clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
parent instead of this clock), so we can just drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 7c1890934fe8..61809e221d69 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -677,26 +677,6 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
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
@@ -1515,7 +1495,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
 	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
 	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
-	[APSS_TCU_CLK_SRC] = &apss_tcu_clk_src.clkr,
 	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
 	[GCC_BLSP1_SLEEP_CLK] = &gcc_blsp1_sleep_clk.clkr,

-- 
2.54.0

