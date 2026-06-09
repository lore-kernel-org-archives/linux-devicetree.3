Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97653FE37D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002779; cv=none; b=ilch7Zm2yLMvcqX8YAi7OF9+fDNCNL38cnVSJaYF/cqqu3PlFBz58G5OZuL+ypE7owsFU2ldVD53EellaIKsJUW8zxfrP9vbmpRwQQpG4GdupedyWWLgR3HYnp13Ls5gaeThJFphlIW1JMOXsS9YSjQyxfUdXJoZnsLKsym3P2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002779; c=relaxed/simple;
	bh=R9DIIQ1qLxF8W794z9jlN5sGRZrlOa4iNeyrroAHCUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVftDoW2GQGynxEuqrNDtk8Rvde35cBw7kydGH/woxqhTVe6J5Pw8zAP6YEtgnELA/tc/OBjKbdL8uR0IcI94b9WQxyc2VHJvbVz/r5eEgS6kFCjixXro03h70Ov6EIHR69Xz7vXsXyHBHezvPxsYWqVCy8AUnuHycBeLq2+R/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCghCd+l; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCghCd+l"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso16981955e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002775; x=1781607575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu/3p2N53nRfdoRyXkgiVNzw/DhaQXtjUEE28Cccb0o=;
        b=FCghCd+lLYizzNs0vgAG0FYrgWRFif8m5NvlDk9OMfnicC2IgQvyZ6xpU/r3cMwGs6
         s/okitSillqkP9vm1BDOYxzjsv050Vh6LYNIfAPi1QT2opAsWFUYwkNoe1ghf5vxV3fr
         7mycRW6jKm6Dqw71T4y4n52EcM2LTYqccpTjsBE2R1HdSIXNulAW4XNZ2nxrDofeeRm3
         zVZayPnptdm4U00Z6O8RbmuHjx6oQXCZQ47XRq/QUc/k5ivBrWRGAD+ThKGqjd6jTUHS
         UcZBS8JNVMNt4+8ZEc5/qahHLTjfke8C1eM5qT0jGiBRoN0IOM1r1ahR6vZ2JTvuoC9v
         yqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002775; x=1781607575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vu/3p2N53nRfdoRyXkgiVNzw/DhaQXtjUEE28Cccb0o=;
        b=iO6w5GhpJGcwwDynbqBTkeCYsqwFl1XmmaZ4ZBkM6WOQUCxgEhucEVlvYCosD7fbHA
         BNNV9lfkR/48+onjO5b4EEvp5L9o6Z6k9+vdD49/jfZzLFY53sUImLtWVOIUy+R+iS3l
         PkWP9glQpGsiZnG7Dp9f92dwBpkKxrqobatPBhCAujVB0lNwlFYiIyruNpZRyt04N5aO
         S0ysg6K67A8oSY2PEiqdHhP46Jiai39xe2/hWBAOryA66e6Vj+r8xwAjfFXuE3JlaLww
         EjXRx2YsM1GsPHyJ5ObzmFJkakFaVGLyltZJlG5jUTzTbm+YHcNJUq5nbm1WtekNHRgo
         Fz2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/pcszOZ23sIWlxGZ5GztkhgsJhFuMbYLpVOo41eC2kbSE6gXhGmY7WhbDKdLhzlx9efmay/Jen3u3D@vger.kernel.org
X-Gm-Message-State: AOJu0YwqT0chgDd+s2SCIqTvBo5T9MyyJGkL/rGXZQOvIYwt397Rr0rB
	Oa2WBBphVlrhwliQjM1a0JjsVYqCRDG8gaD6sSOmYWp0xdwzyZQolpPk
X-Gm-Gg: Acq92OH3wEYHnMi0+osxQigphBUZ0WK8SCTBd750RykyTgwn+BFdXSj5GFT5+KF1Nyz
	PPDJxvScqLEokzhPv5Oinnd5tLLcTmX8ngZ1jXbth0NkMb0onfZ/wqcTIQNbPVgTS7OLGXTbk75
	iKT5PGiFunDR9tSMvcrOE2kuGZ89IILTMBtFFklW0lQ+K0qxLaloAD8W+qRHWikVaaIQIGBSf5x
	iDm92rg7RQAFnpfB7R6G2lmimEKfl6hIYgaSMFNhVEEUjXkYSxIrbvI5/aEBDS2yKZ2pa1ShmUA
	x3fu+5yyP6AF5HaYXWH0o8HEIxTo201tiP3jetChP4ahzMby2YsNrDYxXP2UtxyzdlhKvIty8TJ
	ODQbaxz9qJQT5Mjn9+yjlyC+N+DF0TSvtejjIBUQiPZPX9NB/NyjN8I135OnLHFpD2oW0K725G+
	j5/yYEaQfulnqEPAeMP3bt28hJ4/fVLDmrahC1BNOadACOero99G9mPcGyEtk8px7ihismv6If4
	b7ExcNtWxCqtnvbfb7vw2GErJgYXmOkiGnoE1Bfm61yszQrCXlkgj0ewg==
X-Received: by 2002:a05:600c:3e0d:b0:490:4663:691b with SMTP id 5b1f17b1804b1-490c256049emr325377445e9.7.1781002774919;
        Tue, 09 Jun 2026 03:59:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:34 -0700 (PDT)
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
Subject: [PATCH v2 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation math into a library
Date: Tue,  9 Jun 2026 11:59:23 +0100
Message-ID: <20260609105924.962573-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the common PLL and divider parameter calculation logic from the
core rzv2h-cpg driver into a standalone library file.

Introduce the CLK_RZV2H_CPG_LIB Kconfig configuration symbol and create
rzv2h-cpg-lib.c to house rzv2h_cpg_get_pll_pars() and
rzv2h_cpg_get_pll_divs_pars().

Keep rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars() in the original
driver as wrappers that call into the new library helper endpoints.
These wrappers are maintained for this cycle because they are actively
referenced by the DSI driver; they will be safely removed in a subsequent
cycle once the DSI driver is updated to use the new APIs from the library,
preventing cross-subsystem build breakages.

This restructuring allows other Renesas SoC clock drivers, such as the
upcoming RZ/T2H and RZ/N2H platforms that utilize similar LCDC clock
divider mathematical logic, to share the iterative calculation helper
infrastructure without duplication.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/clk/renesas/Kconfig         |   4 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/rzv2h-cpg-lib.c | 216 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 186 +-----------------------
 include/linux/clk/renesas.h         |  23 +++
 5 files changed, 250 insertions(+), 180 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 0203ecbb3882..7659550b8566 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -260,8 +260,12 @@ config CLK_RZG2L
 
 config CLK_RZV2H
 	bool "RZ/{G3E,V2H(P)} family clock support" if COMPILE_TEST
+	select CLK_RZV2H_CPG_LIB
 	select RESET_CONTROLLER
 
+config CLK_RZV2H_CPG_LIB
+	bool "RZV2H CPG library functions" if COMPILE_TEST
+
 config CLK_RENESAS_VBATTB
 	tristate "Renesas VBATTB clock controller"
 	depends on ARCH_RZG2L || COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index bd2bed91ab29..ac790e56034b 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN4_CPG)		+= rcar-gen4-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
 obj-$(CONFIG_CLK_RZG2L)			+= rzg2l-cpg.o
+obj-$(CONFIG_CLK_RZV2H_CPG_LIB)		+= rzv2h-cpg-lib.o
 obj-$(CONFIG_CLK_RZV2H)			+= rzv2h-cpg.o
 
 # Generic
diff --git a/drivers/clk/renesas/rzv2h-cpg-lib.c b/drivers/clk/renesas/rzv2h-cpg-lib.c
new file mode 100644
index 000000000000..98e789df5d7f
--- /dev/null
+++ b/drivers/clk/renesas/rzv2h-cpg-lib.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZV2H CPG Library. This library provides common functions to calculate
+ * PLL parameters for the RZV2H SoC.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ */
+
+#include <linux/clk/renesas.h>
+#include <linux/math.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+/**
+ * rzv2h_cpg_get_pll_pars - Finds the best combination of PLL parameters
+ * for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters
+ * @pars: Pointer to the structure where the best calculated PLL parameters values
+ * will be stored
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) to achieve
+ * the desired frequency.
+ * There is no direct formula to calculate the PLL parameters, as it's an open
+ * system of equations, therefore this function uses an iterative approach to
+ * determine the best solution. The best solution is one that minimizes the error
+ * (desired frequency - actual frequency).
+ *
+ * Return: true if a valid set of parameters values is found, false otherwise.
+ */
+bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			    struct rzv2h_pll_pars *pars, u64 freq_millihz)
+{
+	unsigned long input_fref = limits->input_fref ?: (24 * MEGA);
+	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
+	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
+	struct rzv2h_pll_pars p, best;
+
+	if (freq_millihz > fout_max_millihz ||
+	    freq_millihz < fout_min_millihz)
+		return false;
+
+	/* Initialize best error to maximum possible value */
+	best.error_millihz = S64_MAX;
+
+	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
+		u32 fref = input_fref / p.p;
+		u16 divider;
+
+		for (divider = 1 << limits->s.min, p.s = limits->s.min;
+			p.s <= limits->s.max; p.s++, divider <<= 1) {
+			for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
+				u64 output_m, output_k_range;
+				s64 pll_k, output_k;
+				u64 fvco, output;
+
+				/*
+				 * The frequency generated by the PLL + divider
+				 * is calculated as follows:
+				 *
+				 * With:
+				 * Freq = Ffout = Ffvco / 2^(pll_s)
+				 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
+				 * Ffref = 24MHz / pll_p
+				 *
+				 * Freq can also be rewritten as:
+				 * Freq = Ffvco / 2^(pll_s)
+				 *      = ((pll_m + (pll_k / 65536)) * Ffref) / 2^(pll_s)
+				 *      = (pll_m * Ffref) / 2^(pll_s) + ((pll_k / 65536) * Ffref) / 2^(pll_s)
+				 *      = output_m + output_k
+				 *
+				 * Every parameter has been determined at this
+				 * point, but pll_k.
+				 *
+				 * Considering that:
+				 * limits->k.min <= pll_k <= limits->k.max
+				 * Then:
+				 * -0.5 <= (pll_k / 65536) < 0.5
+				 * Therefore:
+				 * -Ffref / (2 * 2^(pll_s)) <= output_k < Ffref / (2 * 2^(pll_s))
+				 */
+
+				/* Compute output M component (in mHz) */
+				output_m = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(p.m, fref) * MILLI,
+								 divider);
+				/* Compute range for output K (in mHz) */
+				output_k_range = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fref, MILLI),
+								       2 * divider);
+				/*
+				 * No point in continuing if we can't achieve
+				 * the desired frequency
+				 */
+				if (freq_millihz <  (output_m - output_k_range) ||
+				    freq_millihz >= (output_m + output_k_range)) {
+					continue;
+				}
+
+				/*
+				 * Compute the K component
+				 *
+				 * Since:
+				 * Freq = output_m + output_k
+				 * Then:
+				 * output_k = Freq - output_m
+				 *          = ((pll_k / 65536) * Ffref) / 2^(pll_s)
+				 * Therefore:
+				 * pll_k = (output_k * 65536 * 2^(pll_s)) / Ffref
+				 */
+				output_k = freq_millihz - output_m;
+				pll_k = div_s64(output_k * 65536ULL * divider,
+						fref);
+				pll_k = DIV_S64_ROUND_CLOSEST(pll_k, MILLI);
+
+				/* Validate K value within allowed limits */
+				if (pll_k < limits->k.min ||
+				    pll_k > limits->k.max)
+					continue;
+
+				p.k = pll_k;
+
+				/* Compute (Ffvco * 65536) */
+				fvco = mul_u32_u32(p.m * 65536 + p.k, fref);
+				if (fvco < mul_u32_u32(limits->fvco.min, 65536) ||
+				    fvco > mul_u32_u32(limits->fvco.max, 65536))
+					continue;
+
+				/* PLL_M component of (output * 65536 * PLL_P) */
+				output = mul_u32_u32(p.m * 65536, input_fref);
+				/* PLL_K component of (output * 65536 * PLL_P) */
+				output += p.k * input_fref;
+				/* Make it in mHz */
+				output *= MILLI;
+				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
+
+				/* Check output frequency against limits */
+				if (output < fout_min_millihz ||
+				    output > fout_max_millihz)
+					continue;
+
+				p.error_millihz = freq_millihz - output;
+				p.freq_millihz = output;
+
+				/* If an exact match is found, return immediately */
+				if (p.error_millihz == 0) {
+					*pars = p;
+					return true;
+				}
+
+				/* Update best match if error is smaller */
+				if (abs(best.error_millihz) > abs(p.error_millihz))
+					best = p;
+			}
+		}
+	}
+
+	/* If no valid parameters were found, return false */
+	if (best.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_get_pll_pars, "RZV2H_CPG");
+
+/*
+ * rzv2h_cpg_get_pll_divs_pars - Finds the best combination of PLL parameters
+ * and divider value for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters
+ * @pars: Pointer to the structure where the best calculated PLL parameters and
+ * divider values will be stored
+ * @table: Pointer to the array of valid divider values
+ * @table_size: Size of the divider values array
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) and divider
+ * value to achieve the desired frequency. See rzv2h_cpg_get_pll_pars() for more
+ * details on how the PLL parameters are calculated.
+ *
+ * freq_millihz is the desired frequency generated by the PLL followed by a
+ * a gear.
+ */
+bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+				 struct rzv2h_pll_div_pars *pars,
+				 const u8 *table, u8 table_size, u64 freq_millihz)
+{
+	struct rzv2h_pll_div_pars p, best;
+
+	best.div.error_millihz = S64_MAX;
+	p.div.error_millihz = S64_MAX;
+	for (unsigned int i = 0; i < table_size; i++) {
+		if (!rzv2h_cpg_get_pll_pars(limits, &p.pll, freq_millihz * table[i]))
+			continue;
+
+		p.div.divider_value = table[i];
+		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
+		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
+
+		if (p.div.error_millihz == 0) {
+			*pars = p;
+			return true;
+		}
+
+		if (abs(best.div.error_millihz) > abs(p.div.error_millihz))
+			best = p;
+	}
+
+	if (best.div.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_get_pll_divs_pars, "RZV2H_CPG");
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index fff89f2bdc0b..c2f018e27521 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -224,151 +224,13 @@ struct rzv2h_plldsi_div_clk {
  * rzv2h_get_pll_pars - Finds the best combination of PLL parameters
  * for a given frequency.
  *
- * @limits: Pointer to the structure containing the limits for the PLL parameters
- * @pars: Pointer to the structure where the best calculated PLL parameters values
- * will be stored
- * @freq_millihz: Target output frequency in millihertz
- *
- * This function calculates the best set of PLL parameters (M, K, P, S) to achieve
- * the desired frequency.
- * There is no direct formula to calculate the PLL parameters, as it's an open
- * system of equations, therefore this function uses an iterative approach to
- * determine the best solution. The best solution is one that minimizes the error
- * (desired frequency - actual frequency).
- *
- * Return: true if a valid set of parameters values is found, false otherwise.
+ * Refer to rzv2h_cpg_get_pll_pars() for more details on how the PLL
+ * parameters are calculated.
  */
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz)
 {
-	unsigned long input_fref = limits->input_fref ?: (24 * MEGA);
-	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
-	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
-	struct rzv2h_pll_pars p, best;
-
-	if (freq_millihz > fout_max_millihz ||
-	    freq_millihz < fout_min_millihz)
-		return false;
-
-	/* Initialize best error to maximum possible value */
-	best.error_millihz = S64_MAX;
-
-	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
-		u32 fref = input_fref / p.p;
-		u16 divider;
-
-		for (divider = 1 << limits->s.min, p.s = limits->s.min;
-			p.s <= limits->s.max; p.s++, divider <<= 1) {
-			for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
-				u64 output_m, output_k_range;
-				s64 pll_k, output_k;
-				u64 fvco, output;
-
-				/*
-				 * The frequency generated by the PLL + divider
-				 * is calculated as follows:
-				 *
-				 * With:
-				 * Freq = Ffout = Ffvco / 2^(pll_s)
-				 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
-				 * Ffref = 24MHz / pll_p
-				 *
-				 * Freq can also be rewritten as:
-				 * Freq = Ffvco / 2^(pll_s)
-				 *      = ((pll_m + (pll_k / 65536)) * Ffref) / 2^(pll_s)
-				 *      = (pll_m * Ffref) / 2^(pll_s) + ((pll_k / 65536) * Ffref) / 2^(pll_s)
-				 *      = output_m + output_k
-				 *
-				 * Every parameter has been determined at this
-				 * point, but pll_k.
-				 *
-				 * Considering that:
-				 * limits->k.min <= pll_k <= limits->k.max
-				 * Then:
-				 * -0.5 <= (pll_k / 65536) < 0.5
-				 * Therefore:
-				 * -Ffref / (2 * 2^(pll_s)) <= output_k < Ffref / (2 * 2^(pll_s))
-				 */
-
-				/* Compute output M component (in mHz) */
-				output_m = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(p.m, fref) * MILLI,
-								 divider);
-				/* Compute range for output K (in mHz) */
-				output_k_range = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fref, MILLI),
-								       2 * divider);
-				/*
-				 * No point in continuing if we can't achieve
-				 * the desired frequency
-				 */
-				if (freq_millihz <  (output_m - output_k_range) ||
-				    freq_millihz >= (output_m + output_k_range)) {
-					continue;
-				}
-
-				/*
-				 * Compute the K component
-				 *
-				 * Since:
-				 * Freq = output_m + output_k
-				 * Then:
-				 * output_k = Freq - output_m
-				 *          = ((pll_k / 65536) * Ffref) / 2^(pll_s)
-				 * Therefore:
-				 * pll_k = (output_k * 65536 * 2^(pll_s)) / Ffref
-				 */
-				output_k = freq_millihz - output_m;
-				pll_k = div_s64(output_k * 65536ULL * divider,
-						fref);
-				pll_k = DIV_S64_ROUND_CLOSEST(pll_k, MILLI);
-
-				/* Validate K value within allowed limits */
-				if (pll_k < limits->k.min ||
-				    pll_k > limits->k.max)
-					continue;
-
-				p.k = pll_k;
-
-				/* Compute (Ffvco * 65536) */
-				fvco = mul_u32_u32(p.m * 65536 + p.k, fref);
-				if (fvco < mul_u32_u32(limits->fvco.min, 65536) ||
-				    fvco > mul_u32_u32(limits->fvco.max, 65536))
-					continue;
-
-				/* PLL_M component of (output * 65536 * PLL_P) */
-				output = mul_u32_u32(p.m * 65536, input_fref);
-				/* PLL_K component of (output * 65536 * PLL_P) */
-				output += p.k * input_fref;
-				/* Make it in mHz */
-				output *= MILLI;
-				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
-
-				/* Check output frequency against limits */
-				if (output < fout_min_millihz ||
-				    output > fout_max_millihz)
-					continue;
-
-				p.error_millihz = freq_millihz - output;
-				p.freq_millihz = output;
-
-				/* If an exact match is found, return immediately */
-				if (p.error_millihz == 0) {
-					*pars = p;
-					return true;
-				}
-
-				/* Update best match if error is smaller */
-				if (abs(best.error_millihz) > abs(p.error_millihz))
-					best = p;
-			}
-		}
-	}
-
-	/* If no valid parameters were found, return false */
-	if (best.error_millihz == S64_MAX)
-		return false;
-
-	*pars = best;
-	return true;
+	return rzv2h_cpg_get_pll_pars(limits, pars, freq_millihz);
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_pars, "RZV2H_CPG");
 
@@ -376,50 +238,14 @@ EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_pars, "RZV2H_CPG");
  * rzv2h_get_pll_divs_pars - Finds the best combination of PLL parameters
  * and divider value for a given frequency.
  *
- * @limits: Pointer to the structure containing the limits for the PLL parameters
- * @pars: Pointer to the structure where the best calculated PLL parameters and
- * divider values will be stored
- * @table: Pointer to the array of valid divider values
- * @table_size: Size of the divider values array
- * @freq_millihz: Target output frequency in millihertz
- *
- * This function calculates the best set of PLL parameters (M, K, P, S) and divider
- * value to achieve the desired frequency. See rzv2h_get_pll_pars() for more details
- * on how the PLL parameters are calculated.
- *
- * freq_millihz is the desired frequency generated by the PLL followed by a
- * a gear.
+ * Refer to rzv2h_cpg_get_pll_divs_pars() for more details on how the PLL
+ * parameters and divider value are calculated.
  */
 bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 			     struct rzv2h_pll_div_pars *pars,
 			     const u8 *table, u8 table_size, u64 freq_millihz)
 {
-	struct rzv2h_pll_div_pars p, best;
-
-	best.div.error_millihz = S64_MAX;
-	p.div.error_millihz = S64_MAX;
-	for (unsigned int i = 0; i < table_size; i++) {
-		if (!rzv2h_get_pll_pars(limits, &p.pll, freq_millihz * table[i]))
-			continue;
-
-		p.div.divider_value = table[i];
-		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
-		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
-
-		if (p.div.error_millihz == 0) {
-			*pars = p;
-			return true;
-		}
-
-		if (abs(best.div.error_millihz) > abs(p.div.error_millihz))
-			best = p;
-	}
-
-	if (best.div.error_millihz == S64_MAX)
-		return false;
-
-	*pars = best;
-	return true;
+	return rzv2h_cpg_get_pll_divs_pars(limits, pars, table, table_size, freq_millihz);
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
 
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 2aeff01150c3..98d9ab38e027 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -213,4 +213,27 @@ static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits
 }
 #endif
 
+#ifdef CONFIG_CLK_RZV2H_CPG_LIB
+bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			    struct rzv2h_pll_pars *pars, u64 freq_millihz);
+
+bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+				 struct rzv2h_pll_div_pars *pars,
+				 const u8 *table, u8 table_size, u64 freq_millihz);
+#else
+static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+					  struct rzv2h_pll_pars *pars,
+					  u64 freq_millihz)
+{
+	return false;
+}
+
+static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+					       struct rzv2h_pll_div_pars *pars,
+					       const u8 *table, u8 table_size,
+					       u64 freq_millihz)
+{
+	return false;
+}
+#endif
 #endif
-- 
2.54.0

