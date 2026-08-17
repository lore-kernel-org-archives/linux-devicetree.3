Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C53043D515
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994797; cv=none; b=iIvfVYSH5lIlrrfMESaGO1HW/Vp2iUnWtrh2AolL4JyAslQhoBPnaZvFXL+dx47Xv2Yo+MCfLIkgessBCxLU0RzU+P3oDLyopJFeMplcAgmX2jrpecDi6hfVV1pXCJiN5xKl9CVM65ICxq1tksd4CCfCqXhrWqdv1N+P8xSB/aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994797; c=relaxed/simple;
	bh=sIvlwinupomxM3a2hWMmImtBO5VxdZ7EwFqpLwq+WFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iENCTAFKZ60Ux+etzVq3CPKj5yWgbiHNkam3omnGj3NpxsUr5ahSHCwTZL+L8gMAs36FN6d+Jq5IsOLOCmAcsAoVaChtwsXefOP2tqI11ESM6Hu1MSQzyvcAbIef1bACJ6AvtYDqH/GnpGi95sgy5ozXns8Um7x9gAJhyVodZ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tve+i3WF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tve+i3WF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caed617615so50677275ad.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994795; x=1787599595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ami9imt6GO00xjWzOm9H3fAjKzP3fMTgY6VhTdgPoQ=;
        b=Tve+i3WFWTnxLlhj2GPm3LSBnbGoO3pF0i3oRyRtM+T48AmZfrBaY+JbMZd9pAYLec
         xczMVuFJQHE0XsJ8JV66nV9+MV7y4m5gtR2USrLFDnK0Ommh3+flW6e8/dLYuU/f7H75
         PVZTSfdh6Un+QEaLI7uOvT6yGRqKFbOA4rppDnokPS8NMHuICkOXM/ZvI2GUTbhuijAy
         8Iq8eS/V9xnXQXB7wkxu5IoSivcyvxxbcRqNrrtAn7SVxo+GMuFu0xw4R8pr6wtVdM1E
         Hz7RECjZpUG7/VvlWONX3inJCEv2Y/f/PTiNgqM0NlX7eWuoM+VFk2XOcEeaxe9j6DuS
         KTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994795; x=1787599595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ami9imt6GO00xjWzOm9H3fAjKzP3fMTgY6VhTdgPoQ=;
        b=WHqWjzZ3yZw8fwiM2X+CbwMeRZqh+mOwAyB3liFPQ/+ZXKiq+XO/eO1tRs91ORH00c
         GN4kisut/vYmvfiV4Gb+V00HhuwXYIgcZHQJEJE/6OspSOWsg3KYlOrhNPjhmC1Uw6Qk
         NwEqNQ1zvgZU/6kqeucF44mLLMnLxndMUDNh7CyvLfXlFbU0g2raSutjWpGpeesOQcLe
         ZOyp/c+zmiJv4xLuHFc2vNiMm2gnoJaAredQBEdsmzVNGl1//FFtPi8e7SZ5f2SzIbD2
         5Aw/ylaz+l21j9tkGR9GQvhZdXXm5H1ROqfGVW73DU+gMExBrEKR9LuK4mKq3XZIsJ5z
         scBA==
X-Forwarded-Encrypted: i=1; AHgh+RrGxmhhR/W2K7PBaD3pe5ZZl0nQMgaFItkjqzBvAfQSpiYK82Eu110oeWC5fpQhAjdx01F0p7bf25Fr@vger.kernel.org
X-Gm-Message-State: AOJu0YxYAXk63c671+GPak2pLcGAEpKyzn25DsBUU/7ZtALJefcbJj/g
	i1J12uK+eDY4mlfGnI9l19jXyo0WEQ4xpjvsnPaY90cJ67nO/b0ELrDX
X-Gm-Gg: AR+sD11z4992Fx1vf9ISEtqDTlXb/y+k45zahdezBbHyNgqmDEG/M1q+jJ1hLSb47VR
	LmRDKb5oqm3UKwCDEgMp5zkrAlNyFZkeGw2gW6e8YGxqZWW52TK/hWdfivLmvXhuWFMonqOw/DJ
	DuIV+U4p4kOG347h/SBfx3rHCbHaLdp6dgL9YU30/IPtKhock+hjoTA5s9MtlJTJWQah9KhXMEm
	bNU92Gea1asoQFRNPUSjL6IGCtMUbl8PkWg73H5a9bFNgF+jLM4P4itkTeoFQWW6hmsyyC37d+d
	HEKtYS4Tk8CdA8ga4jUUnOb5VfAmoQslkbC4XAdwSr9hbglPRlU8i/0X9N4g/kO6U5d0CZ3a6MK
	PUEVZKoZQGEhi6gGQJsU95iJr3MhjhE0skDQGb3cEX2s+NNTpniUSuQ8G5eqMfSYooPFrGAaiTG
	H9Dv9Xa5k6dYSA4IAiUpDnkSdqaLI+sSRlCQJeDrzr13qzKkWIulL5s8fIHMLDKu/oeetj3hZPk
	YoJR037kvoOY98ZyiObf6nwPRcSCsjxMAg+IYF/3NC5bNDsQYplLlIIGVMZpFJUY7At3YrqGuOc
	dzX1eggsZOY=
X-Received: by 2002:a17:903:3885:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d3b0d78794mr281621245ad.5.1786994795153;
        Mon, 17 Aug 2026 12:26:35 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:26:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 6/7] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Mon, 17 Aug 2026 20:25:39 +0100
Message-ID: <20260817192540.423994-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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
index de20bed2797b..80910e0bd977 100644
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
2.43.0

