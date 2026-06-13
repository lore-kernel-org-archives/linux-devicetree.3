Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC23E5EEE
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354212; cv=none; b=WiZQ1PEZF63QoqH25kMQGBErTBk62H3EbI3H3iUshciagnEPp+xeBkZInV7l+BalByYAx9BVduffJIZNKWc3mHvsCHMmzC7/QibDWNXg05Tui9qRan97J1sUokDa9O77myYlUuLnSINuJkqJfaTpqECKYVhN11EemiBF2ECF57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354212; c=relaxed/simple;
	bh=8QsT5qMevIWG1r4CekVOQr7GSa6vcMhLRdQO614ENU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozy6hroTg2L7CtYs223rW4WIUCD1nGIpCMzvzpVc6tSQjieaB9t8MJiHtQtTbb5ohajxQ4m8cnQTQN1T3epPpUdCzPOjSCmbs2jJ/HC3BzjYP8A+k6giNMMtjVkmiKBqk1Rti5uN7cgehg/35Bg9l2BKtL+YZscbbE57o3Aun2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1NxmSFz; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1NxmSFz"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1370417c01cso2367755c88.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354210; x=1781959010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4USlR/wTC53+DK1xOyOVELLpPn6dQVqos5QLqbfQPM=;
        b=j1NxmSFzOiqZf8mWZ/7Cn7e3K6qMkGJeV445+HSmYdOymJZZouuwPoaI+qwwC4P+A5
         hC9bMLQ6R0KaNe0Uh/rRiSwhVgYJfQArTBrjW8Ke+a0E/qJDbOMpDa6vayChXcgkwnUP
         HM1alEEx3o+ZDEOOnVZ63IPgGKoMwmPwCSDh8NTqkxb7y9Z+AhdYEG7A+yt1q7iyHd+K
         hp0mFvRYwXOfSQ6Tfiljmr3skCXH3p8C6di+v/MDOAWTV/r4d05OLqRv+zWjijZq8fVJ
         fB9W3p3XJXg1h1yyfnIgpEB5TPaZxKPY+uCswsHqVLNtIRBkCGsSz0jou9YrjnIA9hct
         R/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354210; x=1781959010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k4USlR/wTC53+DK1xOyOVELLpPn6dQVqos5QLqbfQPM=;
        b=WQxrY8matH1E01FfZv4udeGe36uK3NUn16RaQe2IjBYVIbZy3OE7Dw/zQmcc+NrZi/
         qZBe72jHjvp6c+8zhrn6ziPSlIHWDufcQSoGvdbTX8vFGrP+YGuFHAtyEH22az2bh0Re
         wmuwVV9Sfz+zLoSChYlA58hKIeVtpC/JZGO7Ew70JAPOsQfff7aJKMQWRTwjzFEB1VGx
         G3QIuCej+VFyem1Q5tGeV5X12dBqH4upUO71X5/JTW9zmUOw4jxUplc08+VRsygmnxKF
         mLCyAV78VGZk5Z2JVK9cyCYVFkK7qkQ/eerMfW/WaZpkVaGu7+frbI6mssH9AgPQT8Oj
         6nIg==
X-Forwarded-Encrypted: i=1; AFNElJ9hWCzvqyXxKsiDNBVx3tDw3Erw3DXYj2SsAwVkhA8voo5S5IA9He484AVyykZNZKobqcKFXsTz5ZPC@vger.kernel.org
X-Gm-Message-State: AOJu0YwZmK8WHNCYreMCpXmu7SZBatx6xRVgeMTwF9YHIW2PVe9iyCOG
	Fo9A1yZBPMBKIgkj4KwrmB0P9F/lfx9YiD9vuLWv+FOFbQBg3hM+DSQW
X-Gm-Gg: Acq92OEEhuVTG0MfLiiyqV4zosVhZBV81LYAxAAKR/G/sSVfeRfkaxlJNAtlwGA725z
	fTw4odigVu2S54XZj+sNIJAmwfdMqnXspTy5fIIET+X92bOgzZtOB/6rk6PxKbonLkgprwTbtdW
	RURrP267m73q3A/4C3iNnow4wlhiNYHBizKsi2xHIDb0WHZbpK5SjMEO45pT9O54FIFDzjgoY2E
	7y1eoxfGvsmaq1CBky5nY4Tl72Ui9yLWOpEVB9/TnbHo56mtA8sRH757av5xwuKlHIcDbQ3iJZG
	ajZyh0aCaEw8o7E783IaD1GMg5+TCUb0QNwaGpHEynutY4emZSJrQ3XI4HmlCY/Sdot5A3oIgRp
	2IWg79QLKFr5Xl/3Q2cK4TwaV6V3huDa/flLp4F8m7qj8nJC9FQWsPDRDRM+hKqdPhIymL7RBmL
	cMQNuG5RtwNLXSHc2OIc6mEa+wVq6H
X-Received: by 2002:a05:7300:d513:b0:304:54d6:20f3 with SMTP id 5a478bee46e88-3081ff3da47mr3614433eec.4.1781354210099;
        Sat, 13 Jun 2026 05:36:50 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm9176630eec.28.2026.06.13.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:36:49 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 07:36:18 -0500
Subject: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781354194; l=3772;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=8QsT5qMevIWG1r4CekVOQr7GSa6vcMhLRdQO614ENU8=;
 b=ihYZln6EC8btrpTxULgjKOmfDRIQxFeQLj9PPzVgyazaKnnRWT2mIMsb9cFanykEkbWDFuL65
 zqMsltsBrMjDXF5b8zKilor295hReYlHkfEKHOAhh2CJsa00CRG/Fkx
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Correct eight PERIS gate clock parents to match the hardware clock
tree and reorder the GIC mux parents so mout_peris_bus_user is the
default source.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index ee3566b8e57c..df5928833b23 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -2551,7 +2551,7 @@ static const unsigned long peris_clk_regs[] __initconst = {
 
 /* Parent clock list for CMU_PERIS muxes */
 PNAME(mout_peris_bus_user_p)		= { "oscclk", "mout_cmu_peris_bus" };
-PNAME(mout_peris_clk_peris_gic_p)	= { "oscclk", "mout_peris_bus_user" };
+PNAME(mout_peris_clk_peris_gic_p)	= { "mout_peris_bus_user", "oscclk" };
 
 static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
@@ -2584,15 +2584,15 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_CLK_PERIS_OSCCLK_CLK,
-	     "gout_peris_clk_peris_oscclk_clk", "mout_peris_bus_user",
+	     "gout_peris_clk_peris_oscclk_clk", "oscclk",
 	     CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_CLK_PERIS_GIC_CLK,
-	     "gout_peris_clk_peris_gic_clk", "mout_peris_bus_user",
+	     "gout_peris_clk_peris_gic_clk", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_AD_AXI_P_PERIS_ACLKM,
-	     "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_bus_user",
+	     "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM,
 	     21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_PCLK,
@@ -2600,19 +2600,19 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_GIC_CLK,
-	     "gout_peris_gic_clk", "mout_peris_bus_user",
+	     "gout_peris_gic_clk", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK,
 	     21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_PERIS_LHM_AXI_P_PERIS_CLK,
-	     "gout_peris_lhm_axi_p_peris_clk", "oscclk",
+	     "gout_peris_lhm_axi_p_peris_clk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK,
 	     21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_PERIS_MCT_PCLK,
-	     "gout_peris_mct_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_mct_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_TOP_PCLK,
-	     "gout_peris_otp_con_top_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_otp_con_top_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_D_TZPC_PERIS_PCLK,
@@ -2624,7 +2624,7 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
-	     "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_tmu_top_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,

-- 
2.54.0

