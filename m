Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A883C2B95
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 05:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328043; cv=none; b=YWW9HgF7sYWvmxg43f2T8AQMTs2DiQtrIFtjltQN6cGp7s46cCpGvFmhoS1B/qNp9lYnJXUgOS82Lm/k9cnsCSTOuV8Q5ylFbXW/7LVg23rmCsSQwmouRMZi8NsFVoD9rDC2O/9SeiV+ZOUsz+KBkolVDmyRsJDbSjGAdqruOn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328043; c=relaxed/simple;
	bh=7Mhi088K4JbmXLsghbRGkWUhMJ0OIYyxUcPPBdeO4Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gA+Fl9inLPF1f7jQOSz/C4SaUUvCGMg9MKzVP6Hh5YHl4RyzL+pgUpwVpZ0qhgYHSLh1Vi52eqhdt5Mga3pFfILKlQZuu01xY64YBsFl1t/eNoqkYrof2VuIJwkws7NCH1mDwZYANVKhbSDSO9aVREsqsxX3A4tEz9W/tghUhLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCYC7lDT; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCYC7lDT"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59c2a81ca92so1057935e0c.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 22:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781328039; x=1781932839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovyq5VY0HrDmnxwXqGTum6kqu484G9zPMiuaByi5weY=;
        b=gCYC7lDTN801y/iu2x/gJc/DhEJBlyKCyocihcH8aTNbvx0NlNiIzcfTbbofjgEBAC
         KV0JztAm/0x/of6ejVeJKdKGqHk+Rknhz71MJPx0+Tq2nfesuF1+DmKXyhf76KSMJTJ/
         z/CItGnrcs/dpS6/Qg82K3EpJNwJA9zgL0A1u71K1MGCfNLRGz58zHqA/v113S26Z1m4
         kNVjTJxwv5/dzVwf8CpU01tXc47Ge2IdiB0rq5PzGSQpztVeh+YbWxksmbbbaword5iW
         PtkNEP0jWKa1V3Rf2NM2GDjClY9k7dbUNRxflNSWpYiRKxpkp6ff/5dQQCUbs0plyj4j
         vZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328039; x=1781932839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ovyq5VY0HrDmnxwXqGTum6kqu484G9zPMiuaByi5weY=;
        b=ObPdPBsP0AwnqBrc9FIm2vekPsbueQfdKHtns+SHFQ8v839kyuv9Wt95bIUJ+DpApW
         JLv4+yX3536wKR7RYXhAUovLRHz8RKQIULys5nQbyLpONstcLEFBalDO1+qzF2XNcM3z
         BGZ3pF0NClaY9wxKmbu4kb7brnR03JyieHs9I0xCtkGQLhzHk5XkMfnH8FddxwwuuZ/B
         mlT1dxPCAZ/+/4LgOQyJtq6Zi/73sAJ/nqusoCL36ib2svR6SbPpC8t6yH3pSGlZIYnS
         hiFC28KIdr8bAt7khsBYGIMXvUEJWHcJiqAuUZdoifgcn8Kw+1QmLxHVEv59CJAKzpqd
         b7AA==
X-Forwarded-Encrypted: i=1; AFNElJ93lbO0hC/Cw+JQoAFTd3c0RhufV4BDqNHv7vZ4+wO1ORaZzKnnPhKp9QE9MM7we6vRXNBkMGA1sIwv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1R4CoC5YOjc4ZaLIWsleRbZMT9bJEumAkjNOli5GvV9hmM7pV
	hPpuSBGavmN+fy4mhmh4rID/mY3FfCpEm/+p2gYa7LVNgOHCpgzMzMeG
X-Gm-Gg: Acq92OGq9WXtDPa+lHNUTwfDGmieNxWqmlpNBEGF+AkWhzj3cZGZUIGEcmk2TKwcaWp
	6f+AGApZwvTVJe5ruYD1fhjFcGnxOz72zr+40lAVjiyKmzUDGHPBjL3tKVHDhnWyKMZYqF+AjMi
	4plXNpXdlGJhAuq5YqeKryMIs3DHMj0Ftr9VAgpN5KH2f2PI1afdocWH5jEyiiZDwRYuTGSOSFx
	SCAyTNimzb0OpOAPVzgPXmvsixr1ZRfZiAHqFeuIQyJjor4FW+tOWKzrN/l1f10+esz3JbG07dW
	cl0O4Rxm/kLyi1sCnBYCI0mSp8u9mLpc8+QPkM7M9q9sEZwwekO5URIwyWoaL2ytJsjd4GUm3ud
	epTS/5jBnhIlNIDy1Bn4pa6pLsdCOcWjqXyRJbvA2nfq5QfPJ0GrIPDJ0Prcxp1oXtx4YAhrxEy
	LkX9+TcYVdxlXAavN/kVUOzTdR98T+qlHtD5Dfpb0=
X-Received: by 2002:a05:6122:4d8b:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5bb6c05beefmr3545667e0c.8.1781328039294;
        Fri, 12 Jun 2026 22:20:39 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.136])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69014308sm4848692e0c.7.2026.06.12.22.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 22:20:38 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 00:19:52 -0500
Subject: [PATCH v2 2/2] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v2-v2-2-3dff7ade75b3@gmail.com>
References: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781328021; l=4330;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=7Mhi088K4JbmXLsghbRGkWUhMJ0OIYyxUcPPBdeO4Vw=;
 b=Eyg5vZ285Yt4XsqlCXfDhI6gutnRY1/qm7OGvSamzvTejycc9Ex+wbJKzBbJ+K8I7VPEBIZTW
 vObz5hhT0QTBZj6W7HOAE6UCPhEdJ+zqVsb7vsunsTNs/+XVHigtLbR
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Correct eight PERIS gate clock parents to match the hardware clock
tree, reorder the GIC mux parents, and add the missing TMU_SUB_PCLK
gate.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 4385c3b76dd6..df5928833b23 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -21,7 +21,7 @@
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
 #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
 #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
-#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
+#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
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
@@ -2600,27 +2600,31 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
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
 	     "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
 	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_TMU_SUB_PCLK,
+	     "gout_peris_tmu_sub_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
-	     "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
+	     "gout_peris_tmu_top_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
 	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,

-- 
2.54.0

