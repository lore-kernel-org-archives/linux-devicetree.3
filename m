Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D03FA5CA
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534405; cv=none; b=YtrBFwA6EEelqDZgPOUAMZUG5rx13RrZsEvBlGePlWx+b0+GbXpk6Lai5EA39ky9E6fT/9BG9oYFC7B/8DF/vbwuOoeEwwBUEJhlYGhcbCnVV6R9+8SL+b6Iv4aeXxwK1brJQlvVu6nEFHF252H9YkEnfgZRYPi/EClsst+3R7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534405; c=relaxed/simple;
	bh=m66F2sL25SNBJsCp1T2HIzM0RPg0EP/lLtzkItOGeTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KkUyDNm3gQ3L+v3TYo+LToBb5IOEXkO/6vLMrENcSDmzFEO30hwcwglr94qYIu0GhNKMgral/tz6z9TnLAWrSw7CSYq4Qu7Jkf11Btwbz2i0SJ1xQLGWl7Sbt+n8IQbhd4UYqsHURW3unNuM79dNGnSCAh1LxXyyCPa409JpQYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9Y5BAEC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9Y5BAEC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49222b6e871so20594315e9.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781534403; x=1782139203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU/52Hsil9tk4JLlHlSaydCvbsd+hTRfmIz26QTpIbs=;
        b=H9Y5BAECGBOY2rbXHVx/Ncm+oMUbsHX6DeIkcju8psO5UMzVbfTzn0mVFtNI/M+2SM
         fTfxRjEcRQsN/vLyEhtYhDulpBatU4M2xOUqa0GOaXy+PWt4bfcwOvPyxo9Xug3sKTe5
         yN67/3Vy23shGqNf4+xbaJAvTKXzgaLVb3++o2z9OLvve+5Gbi3z5GtKZi8KRyQPJJP/
         YK7NVxxBUU6JDxXEOvjt9nqwB0T+o9ZG2xOPK7O1PJgvxDaR1FJKmxlemW7cXta+bDVW
         OxqbZ5MgMAa607Qhyl/EoWPm5cYWpF9i4sGINfc3MmSPWP5LX1QGXdV75DWvrnblHgT+
         kcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534403; x=1782139203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZU/52Hsil9tk4JLlHlSaydCvbsd+hTRfmIz26QTpIbs=;
        b=TTCdCZGJ+V0fiaATJ1WVEF+/rUZnoH3gPild7TL3Jio+WaflC0jFgfZCKi/ZGVXz+O
         e1ZSt3CvJ/XJ2ewMbSqmgpFw+PTspr9DslMOcmQqCJxMyOKULReXXbT8V9wRk1VAUKEP
         hzofhjyife+JfWBMRx1R8BLbNBgLbz+kbbTC2ZNlxSH8Y0iSZmmbkcknkhV8eDMr6R5n
         FGYiyK/4Q/BygNIZ301CS189KNv+AnTpdBC4APHNaHTIYkoJ2wflooGVOdimrsVv9vMd
         jKd2nn2StEixUhTJlP+ktfW7aaiFZqMXAAVq5FKpDk2mnSxny4Ee/XvoUzEeyPXr3HJD
         VkWQ==
X-Forwarded-Encrypted: i=1; AFNElJ92DkxC3E2D3iQk11QYEftyX4ftWtTIDFYOm8ACg5oPrDHFMtl7FyqUADhtWXB+vvj/Gd57+8tEc/yw@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZmig2pf4lxw9O3AVNva7wgHgOGxBs84JM/l15bDQlrq2PRfi
	mG6fw17PRYJX9cBoe5VQCm76M4Q9z7PDFZVqdSmrDGwx0cHpoHeGXAIO
X-Gm-Gg: Acq92OH4J4ylg0biH/F90jyB5pYiAyRuXpPeF9Hd875wPnAIJLSVW/V5kkGV9l4wamR
	urTqx5jhoVZrUAvEqp4bTjHTSuPwtAQezAECjMiNYgLLn4eh4wTctyKSVeO8oOsa7UcmnTqOLj0
	JEC/VUOzSL5ROsyjdc1g6woT0ZDGYH+Pk2IcNCNCMN2UqEHxm2qjmjF05mhGVdZzObH1twsbv+v
	JL8iVdM0tT/Ijf4WIBoO94BAswmeqbPSBSLsiQ8zbnH5B58TOvRX/f1aVxUp3ZgmJ15pZsPAXjF
	G5GHQHkKVIK8ZrB7aARCXcQyA8MVGMZFr/qPkYOHlOQ7a2sGYqwoop/OvGxeeWqlY8puKTWZKnI
	tN255kSQ5Om5hlAbUGXnYRmuUJjhqwd7dfGc8kAFPPMhA9RemllsjJXAnqouaaUc+sM6OgKy0dr
	VEADil6Vh6Hf2Dc6VCkAmbiZBHjTrH3zrxWRaLRthagcucl1mXUSuwbhqgYyKdbhMiGeV3UaGnM
	ZzI9I/W7RGUFTOPTKgJ9xWEdov7JuzXcIqQ
X-Received: by 2002:a05:600c:8b56:b0:490:e60b:5fb5 with SMTP id 5b1f17b1804b1-490ec527e4emr178094045e9.34.1781534402500;
        Mon, 15 Jun 2026 07:40:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c05ebsm256627915e9.9.2026.06.15.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:40:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: r9a09g077: Add RTC clocks
Date: Mon, 15 Jun 2026 15:39:43 +0100
Message-ID: <20260615143943.1610095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the core and module clock definitions for the Real-Time Clock (RTC)
peripheral on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 873c41ae5606..5640c2035e5a 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -149,7 +149,7 @@ static const struct rzv2h_pll_limits r9a09g077_cpg_pll3_limits = {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_LCDC_CLKD,
+	LAST_DT_CORE_CLK = R9A09G077_PCLKRTC,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -337,6 +337,7 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 		sel_clk_pll4d3_div10_div20, ARRAY_SIZE(sel_clk_pll4d3_div10_div20), 0),
 	DEF_DIV_LCDC("LCDC_CLKD", R9A09G077_LCDC_CLKD, CLK_SEL_CLK_PLL3, LCDCDIVSEL,
 		     dtable_2_32),
+	DEF_FIXED("PCLKRTC", R9A09G077_PCLKRTC, CLK_EXTAL, 128, 1),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
@@ -367,6 +368,7 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci5fck", 600, CLK_SCI5ASYNC),
 	DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
 	DEF_MOD("spi3", 602, CLK_SPI3ASYNC),
+	DEF_MOD("rtc", 605, R9A09G077_CLK_PCLKL),
 	DEF_MOD("lcdc", 1204, R9A09G077_CLK_PCLKAL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
-- 
2.54.0

