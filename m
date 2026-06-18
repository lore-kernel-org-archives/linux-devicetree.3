Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A435E925
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806795; cv=none; b=SjDPVQM02clNgX4xuMoNEECbCHpdlcnefmsqU7a/yvO76B1ipa9dtYB6XKmJmjhQovUp6yEVtCG1vjdhmLJqcT3/ZkRik7HB77knmbZEusVBrHPVrSHhvnf5GMRShdznRrx+wXx33udEmy6Pn2RAyozuLp9uRgMBTnkLXasvI5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806795; c=relaxed/simple;
	bh=wyus6jMf6L/ne+kZpMNuO/ZqYEE/vAChmJZBV21nv+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/8s5robIH2zGw2L13W/7tXPcRRcJKuzj+Oz1TiRfHOmO3yKsX1oA7SdnUFdXpUXQYwhxyxx97kF+iMSrfecDLxQ0ndfBYx/GFnRcCaV1yLNhbVvAzn/t85rv9UzeCZxR8dzArspmmme9CyS7wKGr+wLDtEkCDacVMHdq9EKkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrHlSvKn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrHlSvKn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49222fb062bso11628585e9.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806792; x=1782411592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDx2KOMtLHoOAsbWqrbmN2XtpZ4cl5riM/ynIeqZ12E=;
        b=RrHlSvKnZ00IwZD0KFKd1d1lz+8jIQ2ze2pPz/xTLrCzQSuKBdJ5OElN+IPqxq13ND
         KERS3B+5mpqyj+CMLWW2Ooc1ifV3s3WBGBFfU2Q2IlsM/pC7uSOpQ5wl8X8MsPZIstEE
         Q3/MvyFRwzqii2PU8oRqMPkDMyFDk0b4prvFbmsbtPcBtUs4onNXdIDfUzS9kzG5K9Hv
         /MMIwhGPBUe/OeiFuGdtRoNGbgsB/jTYfg/WsaztTOEOK3D+M/n4S52jaEv0KQqXSqsa
         qVRNxqS80bwYQR5S6mgaL4DeLOd5qknNj9bYNZbo6gOkTkOduQjtqQBjtkaIAcGfPgdM
         cnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806792; x=1782411592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDx2KOMtLHoOAsbWqrbmN2XtpZ4cl5riM/ynIeqZ12E=;
        b=ATGLXibxsZsEVsMm71bguBksgE8bL9uMCguV9MX4k94eeEWNwJcoydmhrRf+jD44wg
         D4zFqNJqGRUVDqvS+Mwi6YYCj4ZYCrw0cwApr9PQFuT33G8s42qSmzw5huGKtlDvG8WZ
         M/6mEXvS/9tq7dmmUoOZGW0Rk1SrRTWJETjUWklPg2SLxcaGZMzFjHkyRvIFuZO9wYT0
         tZg2uQtEeoi1/MY9dgMcpedyteHBQLLHInl9uNuG2rKKyRQoyIuPBVz6Mkzrs4ttI4u7
         xuO46EltsE3hzlosemd+nA01aFnyyyDsZqEe/xWEBHZEwXPuGG+DTn9DA/w996IbqjrY
         eKuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YoV3awslcly1Hqwl7enSMpWtBypdrJzhUXFISGCSxtlNxlW7kum4QWSSTVOHKqRKo6RovZ6bsuEsV@vger.kernel.org
X-Gm-Message-State: AOJu0YzPw4ykVY/Ab+jxqYAsLM6eTpXGq11gy1Fqzslvn/pB6q8CLgJ+
	QUqV3vvILGB+usCCr9va9xQNnNEJx7tBNb+kR8T0FUhv4c15zUB+RKaW
X-Gm-Gg: AfdE7clpbJCIxWX0beTo6PoWgWfFXoEPJDwBqwJ4WwP7FUhI8b0onNYA/TGrnr1zD00
	dMnL0Fz6T7Pg2YQw14v/j0hxIAKi9aL2bKEOKOViJd98BPDXsn+WDNIb0kfYJpR19+tyZMtmAmC
	G9od/9DGGuxoXXTRTFVLD3yJc25kHuYL/04KGSTKlaKKuVFHlkwAlHzm5zOP+SJOjwdjtBt7sUz
	zWgTvGYlUo1oOwC5pBr1RZsj05/LHY6K+zbEGT+v0wNnZ8xKqyY/CGMFzHyvBYcTJAZEnC1rzHZ
	5t3pnpHNRbiIGuHfcFW0YZk9PXjVsS2D3pkDGKSBgHO2zUl+yH9s3z+v7R0Zh2ieQ9+rTWQykO+
	3Lye7wlnSXfPb5YIyMgQutfH2YhaAa0PFdy+n5JQ02r5pUIWbx7wuOzUhi8gxezOZUx9tbk6+0z
	Xq5T0s7gpQai2mZF4cAM64VbMMZ8IEDX9Qf2wLv/jlXGCyZzKud6BOiidhorWahMiw3qUNDnmnv
	cagfO6gUbmZQWYfAcfNfPZBhmw=
X-Received: by 2002:a05:600c:1f92:b0:490:c2a3:1781 with SMTP id 5b1f17b1804b1-49240eb1519mr96105e9.34.1781806792275;
        Thu, 18 Jun 2026 11:19:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:51 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Thu, 18 Jun 2026 19:19:44 +0100
Message-ID: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PLL3 and LCDC_CLKD clocks on Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. These clocks are essential
for the display pipeline, specifically feeding the LCD controller.

Key Changes:
  - PLL Reference Flexibility in  the RZ/V2H(P) CPG driver
  - MSTP Dummy-Read Mechanism
  - LCDC implementation in the RZ/T2H CPG driver.

v3-v4:
- Fixed MHz to Hz for input_fref in the doc comment for
  struct rzv2h_pll_limits.
- Added macros for rzv2h_get_pll_pars and rzv2h_get_pll_divs_pars
- Added RB tags from Geert.

v2->v3:
https://lore.kernel.org/all/20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Added export.h include in rzv2h-cpg-lib.c.
- In r9a09g077_cpg_lcdc_div_determine_rate() made use of 
  clk_hw_get_parent_by_index() to ensure we retrieve pll3 as the parent.

v1->v2:
https://lore.kernel.org/all/20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Dropped RZ_V2H_OSC_CLK_IN_MEGA macro in favor of direct use of the
  input_fref field with a fallback.
- Updated the doc to specify the default value of input_freq when it is 0.
- Updated commit message for patch 1 and 2 to reflect the new approach.
- Dropped using table based approach in favor of direct conditional checks
  on the clock index.
- Added Acked-by and Reviewed-by tags
- Added new patch#4
- Switched to use the new library
- Kconfig now selects CLK_RZV2H_CPG_LIB
- Renamed CPG_PLLEN to CPG_PLL_EN_EN
- Renamed LCDCDIV to LCDC_CLKD
- Changed ctr0/1 in r9a09g077_cpg_pll3_clk_recalc_rate() to use u32

v1: https://lore.kernel.org/all/20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (5):
  clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for
    calculations
  clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for
    RZ/T2H LCDC and RTC
  dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
  clk: renesas: Extract RZ/V2H PLL calculation helpers into shared
    library
  clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H
    display pipeline

 drivers/clk/renesas/Kconfig                   |   6 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 373 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  20 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c           | 217 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 203 ----------
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |  34 +-
 9 files changed, 637 insertions(+), 219 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

-- 
2.54.0

