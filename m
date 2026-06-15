Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0673233262A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520532; cv=none; b=o2Fk2BnbiJHMTX8z+AOulCnF4+eNFanRr1+rG5WmgKMwqAJeWQviwjFfNI8HYSwA4lu/nNWEZYDXgaMltkjrO4FC3osMOzY55eFWLHigNWmkbqjaysm67SZ5MQ4M6arfQvKSmFvTzmR7PFbH5PR43l6evreNSLPjn81kLz2kmzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520532; c=relaxed/simple;
	bh=+yugR+VkpeDU1YTmH2+IVHiaYwR9RbHN8mN26aejHOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axGlQu30BPIXVW/v1C47n3DKWicu1kRV2ucv7YAp4p0cO9RA2OWg2NIuHTb/M+kMBjBX2gJMjpyKFNBajeAlwKGjchdykYgY6++psM63qKdXhNMlRIIDR2+dNetftUn+wQ2BEVuAXkX/GRNRjKsgjt14uJn21AxCCe/WEyY84SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G812gQOh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G812gQOh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so33568905e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520529; x=1782125329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hGZ4SH9tCHny9E9iOba0SMLuDEJ7JVbxNU+JthER5Y=;
        b=G812gQOhXXiX9CLdYj94wCGmVr2cAOmAFfgptXEvUjJqErsoKiXVwD9u+l4i4VLTt7
         67NoMfYGq2bRzt0HF3Xlp286m1r4Y2SmfMfRcky6nbL19CjBW2v92FhJ5xyetPkB4oHP
         vZ6mHYbVymgZ2gQ1Sx8vguYFRk340O8/9lv6Xda/ib63vlzfEcy5ABp6WfbSnY4Y9ZY4
         wK9nMBjjO41ra1hwQnAD+HdgOiVMOy6HFLx+4CygxTxMWR5wBkR+Tm0cXKN0DDzEDkz2
         CzDR8wiTwmCk6v0Fb1QkGOeyeH76mlYV/kTYG2QBpJJeokw7wVDfq6FFocORl5XI8wsH
         TIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520529; x=1782125329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3hGZ4SH9tCHny9E9iOba0SMLuDEJ7JVbxNU+JthER5Y=;
        b=fVtF3YQ70N7oy/TTD3mivsHGgbt3Omsn8gOOxKr/mpEEdNJvMAw9Uz0dUzJPxg0brM
         C0JFLmJX5AO72unvgzNVF3DHbkBNPCBcfzuxxmeSbWdjf09j/d1yDWSwwIsTmv+vQuwU
         XGrobdruSWMW7uhD67LeKaM4pat+OgQSsLOcc3yLbjqOtNxZmLo3/RyzQixCOEDR6Yhw
         Wfc/iC9LCkL50L+KptLSp4zNnN3/SLpyt66GyrRqY9VnVUV3Dh3+3YvIkhC6qbOB4syK
         JVRmTfyr47TQ16iIs/2nTsWBvMB/3qGC0xYaAFsUsgnWDE46LTAI2y0XTXY77WZDt1XQ
         fwdw==
X-Forwarded-Encrypted: i=1; AFNElJ/L/wjyPWu+DnbVSugevtBeSX26YZcfatsW2DaUArgKItmHW3OFdZIwXEQHD8eLiwMtI1x9yF9II3wJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyQOolBf4aeBXDygwEzx6eOWSEM9CNh6BJLPf4rPuYu3I2OlO16
	rCW6QRgg/WV1c7Gb2EGMHLUgOb2eAAHPDimgkoJAdc66tgaDLfMArkYo
X-Gm-Gg: Acq92OG3DFcQfvGJfvANZTGm0UVBo/NBam7aRBv5QJUFMghwSlNjuYikQmA4cjMYg5M
	AL7629uhHko2DTERjYy2TnTY554Kb1fjFEuU3KwiJX0ZqAoABfxtvTJXSzmuUVvmbmfQG6QL5dx
	BpUQ5HdmdkFD2XBUKYDHtm3kAjNGiPe6XxkZwFd0pl+5K0w8CfIPq68X9zFWMN7s/1YqQm6onqC
	QES+CFK1dWcjregqoG8j4Myn313iuNGcnhha3vHUfcEIJnPHwHeGjFuXxl4Bu5MuHobtyJl6RXh
	g9SkXv8vTW5eIeG18KmKTaTpJxDLH8IpUO4nd/tFwd0qakGQgOSdwHYx0pnaTg3fhvkgcaDOMHY
	CR76iUSD/HNRSrJMtSCczKBYeXfFtCEGhKKeQvr6U7LWmHu/JV9F1LN3tSDRMTjX4h8SLEtRT9i
	x+iuwuEu7GZP9vULxej5CyizswLiiW8RBNiZXUe1LLm788rrYsMBAdpHHsYUDnL9YKk3wdT1yez
	7s8gVxHEzghSCgpcZDTm2hwj2jGnDm6IySL
X-Received: by 2002:a05:6000:1788:b0:450:ad00:86aa with SMTP id ffacd0b85a97d-4606ce33976mr16781374f8f.15.1781520529439;
        Mon, 15 Jun 2026 03:48:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:48 -0700 (PDT)
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
Subject: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculations
Date: Mon, 15 Jun 2026 11:48:41 +0100
Message-ID: <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No change

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

