Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315543D51E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 19:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527157; cv=none; b=OevIThRVywc+aok+FaKwJ0STrGjeCd+txRei4XNlMQ8axIxEwlhNRzB728z5kW9blmVVztjQSB3qSPnY0Q5WusRXZYNy4LBOZoXL6jxMeq8J3KUZWzY0Qwm8bRpHcjlmm8FJTERBcmRIqvz0eEpImTiO1sMwvSiNCAxB6eMdWGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527157; c=relaxed/simple;
	bh=LBeDEgZcG53jxDrJXYhFxbZX8rocP0frMxZVg1RlP94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPs4vbkj+2qr5cyx99d4CW1ZFVOWilSeY2c2q0Th4TigKZMospv4Sp879nCMEniFELLQFZy1FWylsAHUjPJYPPxj3LgVmOdx60c/BeZr6xNg2f92KEjNmjAPYQRysL4jfq2u2F1hf1VAGYcnUe58t8gXs1PbLrsGohOvC+jkZJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9vskC3i; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9vskC3i"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48e82c23840so12222215e9.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527154; x=1779131954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1ZSKqDKys1YDO0iK340T9vdYLek+xBsPl8I5xs6dy4=;
        b=g9vskC3iHYV33tUkLOuXaeGikjhJ8MuQqcwRTCR8OsL3Hk4QLfA/7gEmceUVxRA1XU
         Ak4ntIOMrzT8o9t55bIQihcHVAsXNWas2AgzcOkTpJ5pfk04a9q7g1jQupl/zi8tQcli
         RIB/2QvbyLuHnYd6phr7hnapiiGN80beXuDUMgueCYn6G4wrkowd9wb3bS9c+VxKJXzi
         VzD5YPQdhY5AYz8cfm2F/eQ2i0Yr8Oy3w2W/W//4BqkEuMcrsdSrEvonK8gQNaN+vUHZ
         9uNSkFpiu3tIZDYSMDrinhdDp8ut6jr1xmHhsPg8fqNbUW7p5W4v5nGCphI+lcXW6sLW
         rQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527154; x=1779131954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a1ZSKqDKys1YDO0iK340T9vdYLek+xBsPl8I5xs6dy4=;
        b=kJxp3bPQbTSOSKEAWaBJYZEFUd4asnic9bwl0WTr9kaAqUXzmf5haVQJdFylZM4qzc
         R7I9R/ZJA5yR01hMSp+DD7VVTCnIL7XZRInqBIqe+5qSpxN+fVN+qTwM7aQw1nY1IxXm
         uLXkdfQvEIyus1ha9hx8+J0o6hbPfh4PFbBux3l+dhubeiK78qXjCcK5U+nbsC0vJGaQ
         5/BC8F+zsWY1E6c/MLu7/RLQxiVlV0Uz6byeugj8Ie3gIELI62dnP75JKM083LfS7YMY
         sqBRt6hduEBWtQJ7kG60uLnWt+3UBsLKnfAeouJqKYvWUKcvGcTV0AQkh5llo6VQmP/8
         w1Jw==
X-Forwarded-Encrypted: i=1; AFNElJ/yKCYBGQABMEnxI3uMd61bXnvDlAVpJQL6Jc453JEwmVIEi6gP32bVYPIUaMG/LjfTLEJesGCCtk/i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5quEiHC7pxaHNujDo5PbxWceDD+rshUVqXaQ1R8T5Ds6IY1RA
	1ZzvQ2Dgjf9q/jbfBDUGHa2p0EsOFujkgdfqznhUHKdvpmZ6XMZuTOUe
X-Gm-Gg: Acq92OEfcXA2TyZVgRn8gha7IvOVDSCWCOSm71bwt+GuoH/32FWNpJ64PA4gthVDrvJ
	6UpIRoS+NSRLHmsORZ+qaFAZ1XJDC8DFLV07GpV/JgakZJNmKAbHj6xLwlNlqSl1HYqtCzyGgsc
	U7JJUmN/pD10MfoGob1X3UeCzThZpPMKMHLeolZUN0ywzczXt/HGXFzmvsUVIGJotIdc4V/4WEp
	UgnUCEjbzMtWDIs8N+jnh4o8qbQRiBuQABzWhgOm0wt+jCo/BCWKbR2c9SPAwHzjxg2XKTlgyf7
	0225uI+vEb4KdOsfaasK/2d7n0zxmYBpWIm5MS9XtNwdpMdOK7c0pX0bX/NyANK2apbmw2WDrI3
	6Zzc0i18xptyOWRv+Lfh8d2tuIgR3o7kD6HkxJP0c/SL9iVKeQPie5tYuyYNUW+MZTcR+AdITGp
	IohzOcQySfhYazDNT6riIzl+3PSUtpPsc+3WOM5Qb08ydQu5lF5rvO/JTbs3Eu8rc+xB9oxzZ80
	2be2/2Pt5UpgDfoM6Cqh4NDqfsScH6PPGmCSw==
X-Received: by 2002:a05:600c:c166:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-48e6f39f7d2mr195440165e9.10.1778527153714;
        Mon, 11 May 2026 12:19:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm150350725e9.8.2026.05.11.12.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:19:13 -0700 (PDT)
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
Subject: [PATCH 2/4] clk: renesas: cpg-mssr: Add table-driven MSTP dummy-read delay for LCDC on RZ/T2H
Date: Mon, 11 May 2026 20:19:08 +0100
Message-ID: <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Per the RZ/T2H hardware manual, to secure processing after release from
the module-stop state, dummy read the same MSTPCRm register at least
seven times for most IP blocks, at least 100 times for LCDC and at
least 300 times for RTC before proceeding with subsequent processing.

The existing udelay(10) satisfies the seven dummy-read requirement for
most IP blocks. Extend this to support per-IP dummy-read requirements
by introducing a table-driven lookup, rzt2h_mstp_delay_table, where
each entry records the MSTPCRm register index, bit position and the
minimum dummy-read count from the hardware manual, converted to
microseconds via RZT2H_MSTP_READS_TO_US().

Introduce cpg_rzt2h_mstp_get_delay_us() to replace the open-coded
udelay(10) calls. In cpg_mstp_clock_endisable() the exact register and
bit are known so the lookup matches on both fields. In
cpg_mssr_resume_noirq() the register is known but not the individual
bit, so pass RZT2H_MSTP_ANY_BIT causing the lookup to match on the
register alone and return the delay for the first matching entry.

Add an entry for LCDC which requires at least 100 dummy reads. Adding
support for further IP blocks with non-default requirements only needs
a new entry in rzt2h_mstp_delay_table with no logic changes needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 65 +++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5b84cbee030b..e6bf5062e40e 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -96,6 +96,24 @@ static const u16 mstpcr_for_gen4[] = {
 #define RZT2H_MSTPCR_BLOCK(x)		((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
 #define RZT2H_MSTPCR_OFFSET(x)		((x) & RZT2H_MSTPCR_OFFSET_MASK)
 
+/* Dummy read counts as specified by the RZ/T2H hardware manual */
+#define RZT2H_MSTP_DEFAULT_DUMMY_READS	7
+#define RZT2H_MSTP_LCDC_DUMMY_READS	100
+
+/*
+ * Time per dummy read in nanoseconds, derived from the original udelay(10)
+ * which was used to satisfy the 7 dummy-read requirement:
+ * 10000 ns / 7 reads = 1429 ns per read.
+ */
+#define RZT2H_MSTP_DUMMY_READ_NS	1429
+#define RZT2H_MSTP_READS_TO_US(n)	(((n) * RZT2H_MSTP_DUMMY_READ_NS) / 1000)
+#define RZT2H_MSTP_DEFAULT_DELAY_US	RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_DEFAULT_DUMMY_READS)
+
+#define RZT2H_MSTPCRM_INDEX		12
+#define RZT2H_MSTPCRM04_LCDC		4
+
+#define RZT2H_MSTP_ANY_BIT		U32_MAX
+
 static const u16 mstpcr_for_rzt2h[] = {
 	RZT2H_MSTPCR(0, 0x300), /* MSTPCRA */
 	RZT2H_MSTPCR(0, 0x304), /* MSTPCRB */
@@ -113,6 +131,35 @@ static const u16 mstpcr_for_rzt2h[] = {
 	RZT2H_MSTPCR(1, 0x334), /* MSTPCRN */
 };
 
+/**
+ * struct rzt2h_mstp_delay_entry - MSTP dummy-read requirement for RZ/T2H
+ *
+ * @reg: Index into control_regs[]. Exact match.
+ * @bit: MSTP bit position, or RZT2H_MSTP_ANY_BIT for register-level match.
+ * @delay_us: Computed delay in microseconds to satisfy the dummy read requirement.
+ */
+struct rzt2h_mstp_delay_entry {
+	u32 reg;
+	u32 bit;
+	u32 delay_us;
+};
+
+/*
+ * Per RZ/T2H HW manual: to secure processing after release from the
+ * module-stop state, dummy read the same register at least seven times
+ * (except RTC and LCDC) after writing to initiate release from the
+ * module-stop state. For RTC, dummy read at least 300 times and for
+ * LCDC, at least 100 times.
+ *
+ * Instead of performing the actual dummy reads, an equivalent delay is
+ * added using udelay(), computed from the required read count via
+ * RZT2H_MSTP_READS_TO_US().
+ */
+static const struct rzt2h_mstp_delay_entry rzt2h_mstp_delay_table[] = {
+	{ RZT2H_MSTPCRM_INDEX, RZT2H_MSTPCRM04_LCDC,
+	  RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_LCDC_DUMMY_READS) },
+};
+
 /*
  * Standby Control Register offsets (RZ/A)
  * Base address is FRQCR register
@@ -253,6 +300,20 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_priv *priv, u16 offset, u32 val
 	writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
 }
 
+static unsigned int cpg_rzt2h_mstp_get_delay_us(u32 reg, u32 bit)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzt2h_mstp_delay_table); i++) {
+		const struct rzt2h_mstp_delay_entry *e = &rzt2h_mstp_delay_table[i];
+
+		if (e->reg == reg && (e->bit == bit || bit == RZT2H_MSTP_ANY_BIT))
+			return e->delay_us;
+	}
+
+	return RZT2H_MSTP_DEFAULT_DELAY_US;
+}
+
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
@@ -312,7 +373,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		 * register, we simply add a delay after the read operation.
 		 */
 		cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-		udelay(10);
+		udelay(cpg_rzt2h_mstp_get_delay_us(reg, bit));
 		return 0;
 	}
 
@@ -1142,7 +1203,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 			cpg_rzt2h_mstp_write(priv, priv->control_regs[reg], newval);
 			/* See cpg_mstp_clock_endisable() on why this is necessary. */
 			cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-			udelay(10);
+			udelay(cpg_rzt2h_mstp_get_delay_us(reg, RZT2H_MSTP_ANY_BIT));
 			continue;
 		} else
 			writel(newval, priv->pub.base0 + priv->control_regs[reg]);
-- 
2.54.0

