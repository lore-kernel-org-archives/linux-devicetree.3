Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EF63FB7F3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002776; cv=none; b=qPUXJpCev/xb4pf8YHLTlM/FYf6+xFld6SDlX8Wvm7YCWprPCJayspHl4O3qcCoyQwZeSh9cCQtXJ/22E0G0txzFd2qL/0tIvE27S0f8kxfpZCae3bgM9703A/eS3sNx+8lP8MlXAX0cuUE9HU7bUVYRjteiPFdBVZ7Sdi3X/PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002776; c=relaxed/simple;
	bh=b12c6iLXA4awrYB8q5Y8WnRZMEHvy5W3/61wkBqgDSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4JRZ8BpYkYIBrQqVl5hJ+pzfk09JYMvQ40uUgJfDk9wNjWq511pdgebz88L27sT3eVLvpLe9P2AqIlcefDN7qKMc6+wlq1qByUAySKkg5EtqnfVYnhw2fiLlnjbsTv8ovCW033wRxzgejaNNbPQt14/dy/fYWwF9DRemRIxv+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvO46vda; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvO46vda"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b64c8311so60241985e9.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002772; x=1781607572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ft0f5hArd103x4WKKQghd8evqBTe2UKtulu4qdVwWY=;
        b=jvO46vdaY+XxZ/k+EPYwtNeYo3jqPTvnjRcGOyHT09aqHAYz9hw9vPMguZH1Sm5cj9
         sAQWuPY2ryMrHAiaENoJXLOZn5UT0/JBuESXn+sH7sEBG9HEpVCGU/K/CI2CoH4eYLDZ
         8LbKQ/2U/tq3cqxTSAUCcqKYVCnffq2wVb64vpJ1N+M97uaA1+DcyCEbdO0sM0KqHq3n
         /gbvMLx0KtldwnHKCt3NmH+9rKbJlhmGck7l87sUj5W57sVjNefvYBSLCYvuOqpSw61y
         9xQaU4URoySjJwqFm2T1Ucv9YQ9LhsAEyn288d9xAyUsXW68WvK8Uwcqr3QNFb4ldcHm
         zTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002772; x=1781607572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ft0f5hArd103x4WKKQghd8evqBTe2UKtulu4qdVwWY=;
        b=bocCuKjBNkP7UoFvrDPxgrjim5JvWIBQZBFXFnSKcOWjq3imfoTMKwOzQQy6YCArXM
         aA6s29Jtg4Zt5QsNiqaEAj60UUvRv44cDp4QN4wGBBcOU8e/63dSBCb2UpsVBkL3EMr5
         lIiRoEFWu+LZtYxI0kBQ2QXzpwQbWA2CcZu7ayVdF4W3Frro63qD6qPXAfCCZSnkwtIJ
         AiqfOBwZPWvMVUAmM7pMYoZCkmSU2muc0DPy3PHRJ0vunMyroZtJkhSxiyWO7OFAaixo
         F2s4m1P7t6Rz+DXVtL/DE5cZD8Hz+5gxFtVbrKz16FhHGbFNXhJbl2upVp2UWN2DFOkb
         ytlg==
X-Forwarded-Encrypted: i=1; AFNElJ8HAoBSIom2usoV7zy29EI7OSU6DzjGbV0B4QZ2WVt3E12j5yzlAkCYLDjWFPE2Yj76p64DH8T+UDWm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iI/0UZPxtvbS/lH2n9dX947gCqhOlfRcDO8Z3H4LU3IE8mpG
	J+fCZDW3xFYsy4bKkQI0k76m5WqcV4WmjvPWNmUGa/I5AaOMn6XG15nz
X-Gm-Gg: Acq92OE+BAEXd/JFQCJbZAYMvgg9+QQUlBNsQLqrCHrawiyDf4Eyg0sed1n/bpuA5O4
	OQUQqiuu+dSHTJXIr4sqhYdUk3PkmmeMSu29nd4PjNV3pIOidhD4XhyzZ9Y7Bz5RT15Z9D/26na
	LfBwYM2ZnAUdPJNTH6T0BdxA7cvgFRWVBzR3MHN+26uMXqCd562hcNvEvRVySClIJWRZfbPMh8T
	1yuQ9dH6hJfJUT1tEKEoaHp8eFovgGLFXt2citLh6lMZUhWZyAZ6JuVn0T2CWzdwsFOfzLMO1Hv
	sdUEshPjOQAd4yGQaorzf+p4hI3UepGdBJxL7vApRYi89aE5BIFXvofuK4BxgDECIhF7aYUDLae
	LYZqwucsxTaPQD3jNrXHJu+jx7VX2EkvIu+PJsSbX6Bn0+EYUDh3tN6KXz3aDVXRIXjmoNaVqcx
	O2fUv0bScMg9LOhcFEhx9Ig5BNq/sVmGgb0Fzq7mq/+IkniHSkBsFmMJ5CRilW7lnsLLdoOY/u6
	Nt+DDXEiqkwVx0IXLW/T6+q5mP2W5f3xdHMys26jFm2EUX9qfqIihmZPg==
X-Received: by 2002:a05:600c:82c3:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490c25f4963mr307728995e9.25.1781002771771;
        Tue, 09 Jun 2026 03:59:31 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:30 -0700 (PDT)
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
Subject: [PATCH v2 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculations
Date: Tue,  9 Jun 2026 11:59:20 +0100
Message-ID: <20260609105924.962573-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce a per-SoC PLL reference input frequency parameter to avoid
relying on a hardcoded 24MHz constant during PLL configuration math.

Add an input_fref member to struct rzv2h_pll_limits. In the core
calculation helper rzv2h_get_pll_pars(), derive the base input clock
rate from limits->input_fref, utilizing the conditional ternary operator
to fall back to 24MHz if the struct field is left uninitialized (0), and
drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.

This abstraction permits the reuse of the common PLL divider logic on
newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL reference
clock input instead of the 24 MHz signal used by RZ/V2H(P), without
disrupting existing platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped RZ_V2H_OSC_CLK_IN_MEGA macro in favor of direct use of the
  input_fref field with a fallback.
- Updated the doc to specify the default value of input_freq when it is 0.
- Updated commit message
---
 drivers/clk/renesas/rzv2h-cpg.c | 8 ++++----
 include/linux/clk/renesas.h     | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index e271c04cee34..fff89f2bdc0b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -218,7 +218,6 @@ struct rzv2h_plldsi_div_clk {
 #define to_plldsi_div_clk(_hw) \
 	container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
 
-#define RZ_V2H_OSC_CLK_IN_MEGA		(24 * MEGA)
 #define RZV2H_MAX_DIV_TABLES		(16)
 
 /**
@@ -242,6 +241,7 @@ struct rzv2h_plldsi_div_clk {
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz)
 {
+	unsigned long input_fref = limits->input_fref ?: (24 * MEGA);
 	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
 	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
 	struct rzv2h_pll_pars p, best;
@@ -254,7 +254,7 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 	best.error_millihz = S64_MAX;
 
 	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
-		u32 fref = RZ_V2H_OSC_CLK_IN_MEGA / p.p;
+		u32 fref = input_fref / p.p;
 		u16 divider;
 
 		for (divider = 1 << limits->s.min, p.s = limits->s.min;
@@ -335,9 +335,9 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
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
index 0949400f44de..2aeff01150c3 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
  * various parameters used to configure a PLL. These limits ensure
  * the PLL operates within valid and stable ranges.
  *
+ * @input_fref: Reference input frequency to the PLL (in MHz). If set
+ * to 0, a default value of 24MHz is used.
+ *
  * @fout: Output frequency range (in MHz)
  * @fout.min: Minimum allowed output frequency
  * @fout.max: Maximum allowed output frequency
@@ -78,6 +81,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
  * @k.max: Maximum delta-sigma value
  */
 struct rzv2h_pll_limits {
+	u32 input_fref;
+
 	struct {
 		u32 min;
 		u32 max;
-- 
2.54.0

