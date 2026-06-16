Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFE13955CD
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641646; cv=none; b=Jdh3YGMxwBu7imdE7nGEArLli4KoVhPNTDKxi7wtWET3N7XCzGsdCcGIn3dtohHb4Nmf+6BuFmN/F0fzN/NZeAVRqS/cywpFW0uDfMsWjqMT/PDb5PDnZ+DO3rPmLab1uGfssJePbkcxszOy8fiRDMMMWyiiuBfAhMubQ/I+5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641646; c=relaxed/simple;
	bh=2CJMMG1/LE5vixHG7JxoV5FWmwbKqkkpuEs/bq1yiII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mfu9m5r0AIrulUIlWDQFfG0EqWWzRNgPFxqT4EZAQ6y0Ib7ppWMBSfWCwmznOkvTXpPb7I8I/ncKVCfwARcTlKYeibFgvItW4CDkDfn7yFzD34tFVV597+oZukWoGPWqAf95qBPu4YPY70oGuZ6cFX269Xu7TN5LxBBX7p/KNKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTuZzQXN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTuZzQXN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so32728705e9.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641643; x=1782246443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVQO6hIIgLgmlWsatP4pC/13zJii6CGhx+MK+WXIvZM=;
        b=ZTuZzQXNKNZtAZI3iPpDPUBXB/Vm+0rau009GZ8z3Px2wTl99HTUDtjDE0QHHDJ9yz
         LSqNpi2zaqGYbyhe5XdbUX/2QQg+2ogI5jEJX0OCs45WqrErVybRisg16zIwCj6dsQkW
         5fPMGxdFAfpSL5ZgTgC7pYkwtO82lBi6DktU7Lvx3U7STQ1ZjEyrr50OP0AcMFa686Cx
         XJacpXI6TSFFbCQo+ztrA/vtRLc+AbrL7pelSDuYk3XaFD+Ol2CTELgy9BscsMoRC4qW
         d0wQJZyCCSHoLosM9RwkYe/bpqtbYQUf5R6xR+1RFls4XPsTUyTm7Vxm+5EqTIWAb2B+
         nPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641643; x=1782246443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IVQO6hIIgLgmlWsatP4pC/13zJii6CGhx+MK+WXIvZM=;
        b=a48dyoPaYdZmHkN0jsTgdvDvz/wiQy6D4Qs5Ubh+MpNih9kaI20tltkBvI18lvVuFp
         vVuuLz/+ORrch+pfLth33DWgYwa6maEGPAirQ8Tt8Pw+JtPKiaVsUkEJ0FkYuEWGTyJ9
         O1ovl564XZ+FWnzINoROd0/KGp4m/bOFziXSG6mbniwmPLQRkdurkKfCsijcjN/nr8ZE
         izWVhLas4FP4xbRXvI5eGeB1L8TFhlQ/oy4Tlp8oMWYE8ifQcxizs63EtjVN+WVmrw9T
         EQ6q5tr+gqX1wSlkTpVLBUNQG673kzZ0tz/mna8s//J8yqRK8AsppSaGwEP4m8RjeTMq
         rRZg==
X-Forwarded-Encrypted: i=1; AFNElJ9F7eqKK4uE9Vth/N0QmFbc9D5/T3Wa3jGQarS/A1yLiMFONXVFWoT5UWTgnob4A3CQtCqPm8wMFyqu@vger.kernel.org
X-Gm-Message-State: AOJu0YwJx68k3lcy6IpULpNBx6rcUf34Umnijqx8uOpPwaBZc1ngg/PJ
	SQLPbCboEwBKlRzHH1cwMThyD2KOlNSfMn8gvr0cjRqRUa2AxAZhp0tC
X-Gm-Gg: Acq92OGPeV6Fxnp0rITd7o5Fzy0fEmDpCwgDE5NqYCJY8VKdTwKk6aJ2oL8vO4lMFZj
	+6EXnCldPz28UtTLr6DOSjiY9roEvqPXpFlC7N6+Co2V5Qht/7WIER+YCnLSVxp8cf1r6VrDGqL
	Ah1+aNtUZDIhOsrt4rqeIVRJljKBpiWOsXeuXRgbtPhjtbtuVezKERSajzUUN3eOOCyT0383kBP
	hluYpF/TBEmWALmcjqabuK0KDYV7uOjfndqalusHR2jOhzSo6U+oMYoscvp/jN4Yd79p1+JP46k
	8vyiUZf3bl6IgTm6AJKtnzV7kMar1NiNC6zjFruqL4a7bGfK8nZVTHuWe/QRNbL4Nt0Vxo/Uw0v
	APElF5JmJDpaQ3DWGfBWpg4RLUkqq1CYD0OE4TAy3Nv5dbx7mUBItXGBtk8Z9verOgB51AWv8DZ
	FLtgyhQx4xst2893q120H0GINPB6OFKSmgZ2N1OJ0oTImq
X-Received: by 2002:a05:600c:332a:b0:492:1e36:85dd with SMTP id 5b1f17b1804b1-492333e359fmr11453315e9.37.1781641643101;
        Tue, 16 Jun 2026 13:27:23 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:22 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:28 +0300
Subject: [PATCH RFC v4 08/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-8-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9437;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2CJMMG1/LE5vixHG7JxoV5FWmwbKqkkpuEs/bq1yiII=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGCHFBls8mhrHFC8ZuUkVYYpxIem8E07Qyy
 5wFNEEcGaqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL9gQ//WHbD9rNammpvKJ6xvivDdcp5lAm7ayr
 BrI9UdJZ6bORXL8cJ3dRUOqiXwvP6+Mwpz3bArD7GkCui3UWb69rRwF/mS2pzfPFBAG0m6XaRiX
 KzpE7bBmidqsftCxtWYreTC9z+ZIXrSQeOePfM7mtnEWsCAGdjszc4pZxFEhmE8G3y37U35Lfjy
 K1Qipeo8D3rTWjTO2S0ryp0g9+K9HJio8+/9YMC8WxknQmbNMUtHnhCJML8ENW3daNK+1zi/nQ6
 pH5j5j9KvzBTVr7aUKPRdUKRWMmu4KoeqfoLvq2CpHjzlBXdRe2Bgsg5bHVJww1OJtW8Ne5Bg7C
 Tt69FM7Am3xuAS89XweaMviBz53Mp5kkfh/i3GHO2eTnVYYVb7IubpeZKel1x8yF/znpUA+ti7f
 n/L3LoWwa527gicsarv6C7pxEjkatHarJmo3H3EIkRjQiwSRzYq1xepf33omqOJOiRuwqcZynr/
 pA4ezELr7pNJiirUbzJ2og3MgYTQYT667U7slpKPxGn2l5QTdOsONlrgrcj8H3CgJOgeJ0UUPOh
 uzL0hqeliXT8fssLrUAP/h93touFp20x+YBKv1I5BiGxF3fGjCVvkNoUDSaaWRc5li2qAsDiZAh
 IlE7U35SRr+1fgI8vmOHxa1nvHVZ9P7v/9xnCUgpSK+tAKcELtxA=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
Ethernet. The only non-clock, non-reset registers I have spotted here
are hardware spinlocks.

I put the entire set of PLL generated frequencies as consumed clocks in
the binding. Due to lack of a data sheet I can't rule out that the any
of the PLL subdivions are used.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/clk/zte/clk-zx297520v3.c | 172 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 50263bca6e08..d90aadf18026 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -410,8 +410,180 @@ static const struct zx_clk_data zx297520v3_topclk_data = {
 	.reset_auxdev_name = "zx297520v3_toprst"
 };
 
+static const char * const cpu_sel[] = {
+	"osc26m",
+	"mpll",		/* 624 MHz */
+	"mpll_d2",	/* 312 MHz */
+	"mpll_d4",	/* 156 MHz */
+};
+
+static const char * const sd0_sel[] = {
+	"osc26m",
+	"mpll_d4",	/* 156 MHz */
+	"gpll_d2",	/* 100 MHz */
+	"mpll_d8",	/* 78 MHz */
+	"gpll_d4",	/* 50 MHz */
+	"gpll_d8",	/* 25 MHz */
+};
+
+static const char * const sd1_sel[] = {
+	"osc26m",
+	"gpll_d2",	/* 100 MHz */
+	"mpll_d8",	/* 78 MHz */
+	"gpll_d4",	/* 50 MHz */
+	"mpll_d16",	/* 39 MHz */
+	"gpll_d8",	/* 25 MHz */
+};
+
+static const char * const nand_sel[] = {
+	"mpll_d4",	/* 156 MHz */
+	"osc26m",
+};
+
+static const char * const edcp_sel[] = {
+	"osc26m",
+	"mpll_d4",	/* 156 MHz */
+	"mpll_d5",	/* 124.8 MHz */
+	"mpll_d6",	/* 104 MHz */
+};
+
+static const char * const tdm_sel[] = {
+	"osc26m",
+	"dpll_d4",	/* 122.88 MHz */
+	"mpll_d6",	/* 104 MHz */
+};
+
+static const struct zx_mux_desc zx297520v3_matrix_muxes[] = {
+	MUX(0,                             "cpu_mux",        cpu_sel,          0x20,  0, 2),
+	MUX(0,                             "sd0_mux",        sd0_sel,          0x50,  4, 3),
+	MUX(0,                             "sd1_mux",        sd1_sel,          0x50,  8, 3),
+	MUX(0,                             "nand_mux",       nand_sel,         0x50, 12, 2),
+	MUX(0,                             "edcp_mux",       edcp_sel,         0x50, 16, 2),
+	MUX(0,                             "tdm_mux",        tdm_sel,          0x50, 24, 2),
+};
+
+static const struct zx_gate_desc zx297520v3_matrix_gates[] = {
+	/* Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in topclk+0x138, which
+	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't really tell the
+	 * difference between matrix+28 and top+138. The clock (maxtrix+0x24) can be disabled and
+	 * enabled from the Cortex M0 and it will nicely stop and restart the A53, retaining all
+	 * state.
+	 *
+	 * 0x50, bits 0-3 have the DDR clock. A lot of DDR gates and resets are in 0x100.
+	 */
+	GATE(ZX297520V3_CPU_WCLK,          "cpu_wclk",       "cpu_mux",        0x24,  1,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_CPU_PCLK,          "cpu_pclk",       clk_main[0],      0x24,  2,
+		CLK_IS_CRITICAL),
+
+	/* ZSP aka LTE DSP clock. I think there is a mux at matrix+0x30, but I have no idea
+	 * about the frequencies it selects.
+	 */
+	GATE(ZX297520V3_ZSP_WCLK,          "zsp_wclk",       clk_unknown[0],   0x3c,  0, 0),
+
+	GATE(ZX297520V3_SD0_WCLK,          "sd0_wclk",       "sd0_mux",        0x54, 12, 0),
+	GATE(ZX297520V3_SD0_PCLK,          "sd0_pclk",       clk_main[0],      0x54, 13, 0),
+	GATE(ZX297520V3_SD0_CDET,          "sd0_cdet",       "osc32k",         0x54, 14, 0),
+	GATE(ZX297520V3_SD1_WCLK,          "sd1_wclk",       "sd1_mux",        0x54,  4, 0),
+	GATE(ZX297520V3_SD1_PCLK,          "sd1_pclk",       clk_main[0],      0x54,  5, 0),
+	/* I don't know how the cdet clock works. Card detection in the way the dwc,mmc driver uses
+	 * it appears broken no matter this clock's setting.
+	 */
+	GATE(ZX297520V3_SD1_CDET,          "sd1_cdet",       "osc32k",         0x54,  6, 0),
+
+	/* This is some "denali" NAND, not the qspi connected one */
+	GATE(ZX297520V3_NAND_WCLK,         "nand_wclk",      "nand_mux",       0x54, 20, 0),
+	GATE(ZX297520V3_NAND_PCLK,         "nand_pclk",      clk_main[0],      0x54, 21, 0),
+	GATE(ZX297520V3_SSC_WCLK,          "ssc_wclk",       clk_unknown[0],   0x84,  1, 0),
+	GATE(ZX297520V3_SSC_PCLK,          "ssc_pclk",       clk_main[0],      0x84,  2, 0),
+
+	/* Yes, WCLK bit > PCLK bit for EDCP */
+	GATE(ZX297520V3_EDCP_WCLK,         "edcp_wclk",      "edcp_mux",       0x64,  2, 0),
+	GATE(ZX297520V3_EDCP_PCLK,         "edcp_pclk",      clk_main[0],      0x64,  1, 0),
+
+	/* There are a lot more VOU related controls in these registers, but turning off the main
+	 * clock seems to shut off the entire VOU MMIO range.
+	 */
+	GATE(ZX297520V3_VOU_WCLK,          "vou_wclk",       clk_unknown[0],  0x168,  0, 0),
+	GATE(ZX297520V3_VOU_PCLK,          "vou_pclk",       clk_main[0],     0x168,  1, 0),
+
+	/* PDCFG. Like PMM, either clock bit will allow the device to function. */
+	GATE(ZX297520V3_PDCFG_WCLK,        "pdcfg_wclk",     clk_unknown[0],   0x88,  0,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_PDCFG_PCLK,        "pdcfg_pclk",     clk_main[0],      0x88,  1,
+		CLK_IS_CRITICAL),
+
+	/* ZTE's driver has a statemt to the effect of *(top->base+0x11c) = 5, with a comment
+	 * suggesting that this sets a 50 mhz clock. The clock code itself lists gmac clocks in
+	 * matrix+110 and lists the parents of these clock as 50mhz gpll output, but the GMAC
+	 * driver never enables the clocks. It turns out ZTE's code is highly misleading.
+	 *
+	 * The GMAC's work clock is definitly not any gpll output because it keeps working fine with
+	 * gpll disabled. The MDIO speed is mostly unaffected by mpll speed changes, so it is most
+	 * likely not fed by mpll either. All other PLLs can be disabled without breaking GMAC, so
+	 * osc26m is the only possible remaining parent.
+	 *
+	 * The GMAC Gates are left enabled by the boot loader and are required for the GMAC to work.
+	 *
+	 * As for the 50 MHz comment: See rmiiphy_wclk.
+	 */
+	GATE(ZX297520V3_GMAC_WCLK,         "gmac_wclk",      clk_main[0],     0x110,  0, 0),
+	GATE(ZX297520V3_GMAC_PCLK,         "gmac_pclk",      clk_main[0],     0x110,  1, 0),
+	GATE(ZX297520V3_GMAC_AHB,          "gmac_ahb",       "AHB_wclk",      0x110,  2, 0),
+
+	GATE(ZX297520V3_MBOX_PCLK,         "mbox_pclk",      clk_main[0],      0x88,  2, 0),
+	GATE(ZX297520V3_DMA_PCLK,          "dma_pclk",       clk_main[0],      0x94,  3, 0),
+
+	/* LSP uplink clocks. The PCLK is fairly obvious (disabling it shuts off the entire LSP
+	 * register area). The WCLK speeds were deduced by setting timers and qspi muxes to a
+	 * specific speed and seeing which bit in matrix+0x7c needs to be enabled for the device
+	 * to work.
+	 *
+	 * Due to the timers I am certain about the 26mhz and 32khz clocks. I cannot directly
+	 * observe the qspi mux frequency, so the clock rates depend on ZTE's qspi mux selection
+	 * being correct.
+	 *
+	 * Two additional bits are specific to sound components - the mux for the LSP's TDM IP is
+	 * in matrixclk and gets passed down. I2S has a mux in LSP, which can select the dpll_d4
+	 * clock.
+	 */
+	GATE(ZX297520V3_LSP_MPLL_D5_WCLK,  "lsp_mpll_d5",    "mpll_d5",        0x7c,  0, 0),
+	GATE(ZX297520V3_LSP_MPLL_D4_WCLK,  "lsp_mpll_d4",    "mpll_d4",        0x7c,  1, 0),
+	GATE(ZX297520V3_LSP_MPLL_D6_WCLK,  "lsp_mpll_d6",    "mpll_d6",        0x7c,  2, 0),
+	GATE(ZX297520V3_LSP_MPLL_D8_WCLK,  "lsp_mpll_d8",    "mpll_d8",        0x7c,  3, 0),
+	GATE(ZX297520V3_LSP_MPLL_D12_WCLK, "lsp_mpll_d12",   "mpll_d12",       0x7c,  4, 0),
+	GATE(ZX297520V3_LSP_OSC26M_WCLK,   "lsp_osc26m",     clk_main[0],      0x7c,  5, 0),
+	GATE(ZX297520V3_LSP_OSC32K_WCLK,   "lsp_osc32k",     "osc32k",         0x7c,  6, 0),
+	GATE(ZX297520V3_LSP_PCLK,          "lsp_pclk",       clk_main[0],      0x7c,  7, 0),
+	GATE(ZX297520V3_LSP_TDM_WCLK,      "lsp_tdm_wclk",   "tdm_mux",        0x7c,  8, 0),
+	GATE(ZX297520V3_LSP_DPLL_D4_WCLK,  "lsp_dpll_d4",    "dpll_d4",        0x7c,  9, 0),
+};
+
+static const char * const zx297529v3_matrix_inputs[] = {
+	"osc26m", "osc32k",
+	"mpll", "mpll_d2", "mpll_d3", "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12",
+	"mpll_d16", "mpll_d26",
+	"upll", "upll_d2", "upll_d3", "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_d12",
+	"upll_d16",
+	"dpll", "dpll_d2", "dpll_d3", "dpll_d4", "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12",
+	"dpll_d16",
+	"gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5", "gpll_d6", "gpll_d8", "gpll_d12",
+	"gpll_d16",
+};
+
+static const struct zx_clk_data zx297520v3_matrixclk_data = {
+	.inputs = zx297529v3_matrix_inputs,
+	.num_inputs = ARRAY_SIZE(zx297529v3_matrix_inputs),
+	.muxes = zx297520v3_matrix_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_matrix_muxes),
+	.gates = zx297520v3_matrix_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_matrix_gates),
+	.reset_auxdev_name = "zx297520v3_matrixrst"
+};
+
 static const struct of_device_id of_match_zx297520v3[] = {
 	{ .compatible = "zte,zx297520v3-topclk", .data = &zx297520v3_topclk_data },
+	{ .compatible = "zte,zx297520v3-matrixclk", .data = &zx297520v3_matrixclk_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_zx297520v3);

-- 
2.53.0

