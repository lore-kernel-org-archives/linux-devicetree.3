Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9454D2ECE
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 19:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527156; cv=none; b=Ynk4N7Q3Pwpw07E0/2t/uGLQ6AjQpaUKSJ40TQLWyKYXaOrkE6pxtgXCdgRwKEV2NHVU+Cyxe0WXet/2pgTLJfGyd2bdrLKZogufbko92LfvNTaUxTXx+ImhvgIXTD6+F0J4Nv8J2lrxdA4gw9wQ1VF7evXnytXf7ZvtX7HMMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527156; c=relaxed/simple;
	bh=RSQEM4AEfXDIroL3bz9Dy4plRs5cUm5ilJwgG0nOjgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPu+SO3zcQigU8SoejRz+znrjPgqUDVr5WbyrXTsLKJbOG7zZ03Ig/Jjj+jcw+RH5y5t8O2Tc/ibMQi1qmBCMZK/QnYJ8j6LV84CRTBRgZQC8ONLEFul9/EfMEolMpgQcwkY/f3ZFJ0eyd23m1fxRKjsKL4G3uwz0isdacfy0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRH+i/eW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRH+i/eW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so31596685e9.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527153; x=1779131953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ert1gXzfFNzUas1j1dDUmLT9J2s7SsBhHdLE/z6vbiA=;
        b=kRH+i/eWUXKVzJLuLKKiuAIpv0BcY4tnRryeVOw6+v4n+uOI757mrirkENlYxOozHz
         VfPoBAVHpnj5FI/JkiblmozWIrt+96gkcEuN30WAJV4oEeEyWvTq++/CDaaYPgq6aanW
         o4AnKi9vwWPurxXozHF22F8/7uukXc0g27EQSImk7KPSfEv25BMeFp3Qq1dOROEYurX8
         PI8bei4h+7yjcD/n3zFIDpjyyIN18z3PEj0FmbvKrjbXWEBC9kHmSqdkEM8XDqRSiHJp
         1n/3sKBWtDRiB1WDzlWBvPtIQNxBdNpCjhjZZh5mVKbNOh5NwFAx9RxMV3N2HA+H3tJ3
         rgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527153; x=1779131953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ert1gXzfFNzUas1j1dDUmLT9J2s7SsBhHdLE/z6vbiA=;
        b=g3ycfl2RgSSk2ZoLFt85s+tfcdIPCRA8039Wy8LGYYteXKYSvedQYUO+aMHlQQKXNT
         0dI2ktKLGh/xHMbgP5iGI5FqWup0R7S9Jl07PluM7u+48yCH6A0kwJPtqffvKpOXsEFW
         GbT5OPDGns6wH9Rr5bT4GjjDEU1GA8jJuLGZtpkzxlktbydRh7Apc/652m+fxRtQ1AiW
         vwdfNJ4ikGzrVuNgf+qnUlZaNSYP4Sex+qWKh8Ex0OJ0cTHmR2eJNJMgx8TUYtqoBuR7
         tRVRx+9CiezCnN0JKUqm+MRx04TnN2YJAchxODaLVr0tJo7DIHokXO9b8uXAbj9A1nls
         ACog==
X-Forwarded-Encrypted: i=1; AFNElJ/wwcezxTIB9rbIC2SV29ZUZEAsCh0uQsFdj1S+jLO5dZz/8kdQLrk1OuADXP+fgHCZvxYH+8jv1U1Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwPOloYR6fH6hjKlOq6LZtLAxuQzZxA02Qg1ZUuXsd9XYQ/pJwG
	G5Yzrd+mf17O7JW1cCucZr0YXpTpPLgukeYJgc0T4wTVeuhlTuXw4Nh4MNhVGclr
X-Gm-Gg: Acq92OFP+k21nDe6+vyGlDY5nhEHB+ojrF0OC8mxmAOz1sUiyE0KWYmRa5NERc85VYP
	d4O6dYGa/zDc8HfHJ6/cU0AXCSiLSO45LhwOuLGHo7Xed1Ud5rt4gfugVC0AL4WfTEcU2bwYVeB
	LGcix8uHOUEtrEXN2R85ONO95NhRJ9N/oFRlRDprQ8rITJdeqh8a+O4YyiVryXBv9VBj44Ef/u0
	MaKhAcIqd0pVhXFPCmI3CDPHlV8yQRFm7qmxEK2p0mMfqlPtGrWr8Hz+miWtnKu6SVcIHpTSyaq
	JlykhzeMcwumaWfB6vQkXFb03u1+RrdufDWxQMkzTNNpf4Jyp+t0uh35GnX37tifJUZkQJ8EfFN
	1hx28Qp7LQvwjJjs7wuQW3e5BwA05uRsUYB0K795FgYQ2bbZZm/lCC3r5F0gluHJBRCPr4YnA5s
	vb7cb+viP2pXNSQczqZQE0BSZtv8LR61un+5DxvB4D2u1Y6ncHGDDSojdsrsdH9jkPNcBt0QkI6
	4sAYAyu3m47gAdjVI170px2htT+tm54+9IW4g==
X-Received: by 2002:a05:600c:c167:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48e8e207f2bmr12978725e9.8.1778527152976;
        Mon, 11 May 2026 12:19:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm150350725e9.8.2026.05.11.12.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:19:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculations
Date: Mon, 11 May 2026 20:19:07 +0100
Message-ID: <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a per-SoC PLL reference input frequency for PLL parameter
calculations instead of relying on the hardcoded 24MHz constant.

Add an input_fref field to struct rzv2h_pll_limits and derive the PLL
reference frequency from it in rzv2h_get_pll_pars(). Fall back to the
existing 24MHz value when no SoC-specific input is provided.

This allows the existing PLL divider calculation logic to be reused
unchanged on SoCs such as RZ/T2H, which use a 48MHz PLL reference
input instead of the 24MHz reference used on RZ/V2H(P), while keeping
current RZ/V2H(P) behaviour intact.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 7 ++++---
 include/linux/clk/renesas.h     | 5 +++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index e271c04cee34..b1d640e5c0f9 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -242,6 +242,7 @@ struct rzv2h_plldsi_div_clk {
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz)
 {
+	unsigned long input_fref = limits->input_fref ?: RZ_V2H_OSC_CLK_IN_MEGA;
 	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
 	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
 	struct rzv2h_pll_pars p, best;
@@ -254,7 +255,7 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 	best.error_millihz = S64_MAX;
 
 	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
-		u32 fref = RZ_V2H_OSC_CLK_IN_MEGA / p.p;
+		u32 fref = input_fref / p.p;
 		u16 divider;
 
 		for (divider = 1 << limits->s.min, p.s = limits->s.min;
@@ -335,9 +336,9 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 					continue;
 
 				/* PLL_M component of (output * 65536 * PLL_P) */
-				output = mul_u32_u32(p.m * 65536, RZ_V2H_OSC_CLK_IN_MEGA);
+				output = mul_u32_u32(p.m * 65536, input_fref);
 				/* PLL_K component of (output * 65536 * PLL_P) */
-				output += p.k * RZ_V2H_OSC_CLK_IN_MEGA;
+				output += p.k * input_fref;
 				/* Make it in mHz */
 				output *= MILLI;
 				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 0949400f44de..bd2d49e7290f 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -53,6 +53,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
  * various parameters used to configure a PLL. These limits ensure
  * the PLL operates within valid and stable ranges.
  *
+ * @input_fref: Reference input frequency to the PLL (in MHz)
+ *
  * @fout: Output frequency range (in MHz)
  * @fout.min: Minimum allowed output frequency
  * @fout.max: Maximum allowed output frequency
@@ -78,6 +80,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
  * @k.max: Maximum delta-sigma value
  */
 struct rzv2h_pll_limits {
+	u32 input_fref;
+
 	struct {
 		u32 min;
 		u32 max;
@@ -156,6 +160,7 @@ struct rzv2h_pll_div_pars {
 
 #define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
 	static const struct rzv2h_pll_limits (name) = {			\
+		.input_fref = 24 * MEGA,				\
 		.fout = { .min = 25 * MEGA, .max = 375 * MEGA },	\
 		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
 		.m = { .min = 64, .max = 533 },				\
-- 
2.54.0

