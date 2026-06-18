Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA6C3603DB
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 18:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806797; cv=none; b=rSEi8wXBCM6OsVFoEVURh51ir+OXSLyKx7jF5kYs4nxGSVOGO1XznqgAiJ5beqTEmBp5qn1UgDGAFx92XFzg/3FYZDufmRBtOuO+TFNHaqEIcnhVTTpQijA9/GZY9Y/4vEumE2jbMntULNakO3K2yCPIUK2Y3ULu0TN3cO2k6LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806797; c=relaxed/simple;
	bh=HoYpqivwGVANa/1JF5XBlbgNs/qwjN7jE8naqxHLyDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MutkJlzh37wrTdNekMiI6TFl5oKjcyR1dZHYTIiEouTIGt+5wcv1ZYhtrk9vknRQZNZd5I9lREgZWwuPT3WBS79JmWmEXkjtLaq0df4us/I3iD17A10IAD05HqP9rIop5gHzFA/bdux6KtbN62agnABeTeMZ3StwWmjdtVBVI6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCBLWfIr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCBLWfIr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4624c1409c9so980662f8f.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806794; x=1782411594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZfCSxnbcgYyMg1b6U2y2nuS3Se3N84xdsJLHyDbTLw=;
        b=PCBLWfIrA3NSAJECZaKmn+f7ERF0ZpxwCmzct7WbPmnLe7I2NBGkDDHeB8Z9HxHaNQ
         VDnDP8fJlmXXSp8j9HimGLcbm9PWcSr7zHUO0XUPC/m6iWpryE5LBWEOrRSpQauBYQfd
         oJCq05VHO5QGnWjG8GgRQkUABdTHpr3r58ZurEaUx4XVJjQ5L0mreaF/fFiJNWgnMnF+
         TaqJD1TZjx9Ul99XM5SPuyvrjwrEEVJiDUKakw3AtnUqJWsh86uW2zu5OlcCSQrTs15e
         MsiUPrRUuEe45t33axagJcdQIDxuhamoO8Td4U8HC6zJtXGzVQxiiG54VBhfa+MJpb3S
         qjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806794; x=1782411594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZfCSxnbcgYyMg1b6U2y2nuS3Se3N84xdsJLHyDbTLw=;
        b=E0egn5FmQCPVmYl+SN6sBjzBsw1Ye3iToA7axDjNhbhEkxDMY2Ois/dJB6WddQbr61
         MFf1KcNZz8LwvrPgZMaRIAVNc0PbifXE1TMkiBjrix64luGhppZ2KdwVmrkdGwgBr9Xi
         swUSmrBC/w1T9y4YJlhIt17VPlMy5LPjpQwFu/KwuP99um8ldQx4ZeHpBD1NYtDm+9D2
         LwrEg92uSuC+Bm0Cxq5E6hXV0YA3ZGvyBKIrTaYxuU4VNiCd83Gb2vefevpOg3gpUkBh
         y5Hgg0t2j6eqK/+oCxgiw9ApExY2YCgnJ8IZoUsp7sXfgBAo+hyBSEo7QFQj7SamIcc/
         wWcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nOI/jyxpBwnqtt+mN2f9NmYzh4Gf5IlUGZGgLAAveBi6v8IBMzdhIyS1wVdnwBAaEt+OsLhZS05jS@vger.kernel.org
X-Gm-Message-State: AOJu0YzDTNRUoIZq9b3XUB4s+326hCkIGnBSfQGw4AFxxOnj68vJBx2X
	jSv5SeUqrf9NgNqq9zLF12dl4QfbZ4Vva9DoakOw/g7mHaQEL4DRZfwY
X-Gm-Gg: AfdE7cnosI3euzkM4T3soIG3lTe48ADxv8PZ50r/+bFIq0HTqFEVQiEPWk0Lxgd2cLu
	bz9UqJKdzDa8e5jOvY2Bjlcctn3Aov6LEpiyLP0mX9vY0tCjcsaHrjexrmUcMlj9X8l59cItZ6M
	8sze4xrQxaxk0GJ11EN9svJd0YPts/4EMYCJHVGk2xlW2UX1NpxkJhBprxpiHrbs2Fwva8j3Wz0
	Cuvn47avViN2OwrCZjI2CUZf8dv55MAtQbcTn+p20qJE4bfJ4s+Y8if38vxNJl84ACr8RhwglHt
	Dxe1bw3EFA17VuLuL9pxihY5g6/rR0fRmNy8wRkcGg0KGhukaUiujGaCFI1I5oyTC7sO+Apl81/
	jZ8ix2GDvsqv1JDVZCVlohwZJlu7fMyk38k2Du8eYl3Qe9GkkGnMkhHzccFkxeRMq4z+RTEIX3T
	LzYHjvNJ6tytri8oSwXmYzCSfT9AjeWtyfcKEIwV3f0UqEECMUgNNUg4VFiKMT5wfyA1gihT14a
	w3lX0aCjaN909/hohpGrMBYAJw=
X-Received: by 2002:a5d:5f91:0:b0:464:f719:561c with SMTP id ffacd0b85a97d-46501e3a652mr988685f8f.36.1781806793851;
        Thu, 18 Jun 2026 11:19:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:53 -0700 (PDT)
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
Subject: [PATCH v4 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for RZ/T2H LCDC and RTC
Date: Thu, 18 Jun 2026 19:19:46 +0100
Message-ID: <20260618181949.3036280-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce a dedicated clock delay mechanism, cpg_rzt2h_mstp_delay(), to
satisfy the module-stop (MSTP) state release requirements specified in
the RZ/T2H hardware manual.

Per the hardware manual, while a standard 10 us delay (satisfying 7 dummy
reads) is sufficient for most IP blocks, the LCDC requires 100 dummy reads
(142 us) and the RTC requires 300 dummy reads (428 us) to stabilize after
being released from a module-stop state.

Implement a conditional bitmask filter helper that switches wait
intervals based on the packaged module clock index. In
cpg_mstp_clock_endisable(), the clock index and individual target bits are
known, allowing an exact match. In the resume path cpg_mssr_resume_noirq(),
where individual bits are not tracked, pass a fallback register index base
(`reg * 32`) with bit verification masked out to match on the peripheral's
register group block instead.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- Added RB tag from Geert.

v2->v3:
- No change

v1->v2:
- Dropped using table based approach in favor of direct conditional checks on the clock index.
- Updated commit message to reflect the new approach.
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5b84cbee030b..4ed056b18d31 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -253,6 +253,22 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_priv *priv, u16 offset, u32 val
 	writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
 }
 
+static void cpg_rzt2h_mstp_delay(u32 idx, bool bit_valid)
+{
+	unsigned int mask = bit_valid ? GENMASK(31, 0) : GENMASK(31, 5);
+
+	if (idx == (MOD_CLK_PACK(1204) & mask)) {
+		/* LCDC needs 100 dummy reads, or 142us */
+		udelay(142);
+	} else if (idx == (MOD_CLK_PACK(605) & mask)) {
+		/* RTC needs 300 dummy reads, or 428us */
+		udelay(428);
+	} else {
+		/* default 7 dummy reads, or 10us */
+		udelay(10);
+	}
+}
+
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
@@ -312,7 +328,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		 * register, we simply add a delay after the read operation.
 		 */
 		cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-		udelay(10);
+		cpg_rzt2h_mstp_delay(clock->index, true);
 		return 0;
 	}
 
@@ -1142,7 +1158,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 			cpg_rzt2h_mstp_write(priv, priv->control_regs[reg], newval);
 			/* See cpg_mstp_clock_endisable() on why this is necessary. */
 			cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-			udelay(10);
+			cpg_rzt2h_mstp_delay(reg * 32, false);
 			continue;
 		} else
 			writel(newval, priv->pub.base0 + priv->control_regs[reg]);
-- 
2.54.0

