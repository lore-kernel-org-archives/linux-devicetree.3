Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2874E73A8
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873537; cv=none; b=qSWD/CW5mZZj7dCZAnEZJvlDM3Q+282xGkIc40KNs5GO+0hS0Xf922lnydm728aHXmCSF46Ho7e/WcB2tKLdv7hOBOXhfA/6brmaVaFIldqGlEmKMr0tmi9ISUVtdDt+VBLTFR1LaTOVZNCisQfci53/cZh4Q42S82xLGFcvTDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873537; c=relaxed/simple;
	bh=uVcGLMDH2AwPjF/HVDOvxlHAEX5/rPpj/bHGgZgWVNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YiEpEj9D+95UTPh89rIykQ32Xf/ag8/c5j3yTOxTMuwL/mxZVIhWTGCr/t8v+gJ1bIWRJt887R+hNc69JQrVoc7vcoPhmr0i2i2fOwcOyez9wEFiCSJD+9E+T/YY74DgSrth8BI5RK3WgzO+E85xRsxgLfb4ajzsQoN2ovmxlrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Azg/RB6c; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azg/RB6c"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso20705815e9.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873532; x=1791478332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KlgcyMNqAZK4e7+PLpFwRaSb7sPrb5H2u572a28OOk=;
        b=Azg/RB6cGTpZBEOhO9oYwMk32uwx40dpZRzVXFfQ4dGSiD8/4ab0LH+Ij5fXpdfNPQ
         /195Y1xRMyTVQgExxl9qgMzhhE/h5JJoRM4gWKeUsRLB7HOzmDaRYhyoJD7mn9p+dqF7
         UP0CpyAvd+k+QslsWKb1Loe2X+E69308sW0gDP7WfSwfWny40SsUUwZfexPAA6Z3ZJOD
         dlKoFozHYpLX6BFcRfynsFyVS/3fYewaXpaUHmR+xUVmkKcKdKMG6f7zY8tVpN8j7kjr
         vwbKZAwa0eaQFxOgK6bSpVWfKWE/lbQ3A8Bv0pli+EltNn/kEBZDVZgl/7su/DmvV2Rb
         u+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873532; x=1791478332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KlgcyMNqAZK4e7+PLpFwRaSb7sPrb5H2u572a28OOk=;
        b=i1OC8MxC4EH8m+VOaue6+1U2598B85mycva8HOioBQjyMmq/AlNxms62CEqSbtdfgA
         INBwfBxlM4Fh4Ibc+3xwHPcKzR7ai5ODfADTM4e5Zg/j2ZZtAedWI3v7I+9HLSdmLhbj
         t/Hc66fWqNaOHxoKXIv8aQ6U1eDygrwrrDm6XEAlmHunHvweQG29qI+Mz0T/R7Hqc/Y7
         A+ewgtNi+Gu6QwTCejAnbybSdOkNiW3dZj0NoqZbxWenQj196HpDg8l1mzk8GHCX1qgy
         0K7NLTEcMuAd/eGw08ktGRbeMd3+qcf7KBEGJhcJLh+XelxQ0Gkr6xSHeXbSAHoWzsol
         kbJw==
X-Forwarded-Encrypted: i=1; AKwUvBxytFUQoXKl24MTQObnJItNNP6ORDxtyCelN3yRxNypinz5zyGhEsA7r0dVMzOMe2sECCZy32ce29W/@vger.kernel.org
X-Gm-Message-State: AFuF++lg+Ox+MuEvb86FrP7ETm/fIS5mlYH24AxpgRjMliojPeIu2eI9
	+AFT06aJA1QghJSr+uqwTBG3Nfc5P0bmrb4XcZcyN/M0ttrI6vhgeYiM
X-Gm-Gg: AYBFou3m2mmIxE+FVs9yij4Rre2573rptt6po26PNgQ4dQMGBIqI1C9Oi5CzHUcVYAz
	cXDoGU7dl/BvQ+cfRhz3XwkcsG6aG4Ugay5cXm56tN4AzvwHmASdxCGVBpLKn5C81dL+JniiRjh
	en0rAj7kA7WZAGYK8V779wxg97KHrX/eqLdGnKywC3fEdoumU6Kfo8UciyXhM+OwAYdpq6A9Zn7
	ztefiVce926t9m0iJr5klTilLNdwwnkOrcJggJ/yTKbjsCqY6HaxRm6443QCrUVcZADwrwnWXig
	Tb1NA0fan/9qvp72oQCZJIO9ekscrI3CrZn+6m/5dG/G3sJt0m31rtFuCpgW8Fgdsu8b9ngvtGD
	l/AxDfwR5LB67TLtlo7MNsvCPlqrNoAN+w9EzCRmiQE8yAPzooTOZLNswC//o+ebt2N50kmv8YH
	z1jL0xJcAXP0J+QIsyG8qf9mWTxAIDxA0xV6nl91SgZqGtjY3MMetfu1on0DoM9BTcm74BYxB7S
	bZL4mhNkqYTS91RC42PWasdQo4jD4Sjhrq2hWnD2eMfYbyw0twzchN5NYuyXUhwdmWBmR5AyZwJ
	FfHdLcSq
X-Received: by 2002:a05:600c:3b1d:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a0276b5d6bmr3767235e9.15.1790873531845;
        Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 6/7] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Thu,  1 Oct 2026 17:52:00 +0100
Message-ID: <20261001165201.763882-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 674e35e4f242..18d748661a60 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

