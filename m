Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395246;
	b=pb802TUoddRaL9Itd6YzpkJ1GLd/icXQKa3L4hSAisLJMNcvNlok1L5hZCkmq8TGkHox
	 k12VImRWwTX8CLE9PRqRah5puFyDp2087NlK9IrAJFaT34U0BxEw9dInCR210aeBsD137
	 wHsXCtWVce0Va2h64bGRFxCaS4UpKQSwIga2j6A8RsWtowsPRj18USICP+8/1aenNoV7Q
	 /XlF7PMZIk6eE66W0SB60yRfNjU3cj4nIlNBWpOtN2DWfcfbPi/KrT3CbEXv429Y1hqDx
	 t24VoMQtV9WopEJ6YpJxRnQns3YGYJm5UoRMRtAvgncCVtVmLMbrSbZQWiLlQ4Pk3TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
	b=mvX9+gFvap7aTWjhDZtwAmtZeZwNd8oBHIzFZF1xZu4IzJEQxi+G9zGb2gZRQq6csw/v
	 SpVq/OFfjM1Q1NQ9EKokhpmAm8VIew5BQPbJPNieJI3TiAQuRt3Tt6gi04S2YmBpCtPzu
	 n36/DLJLCiHhul1y9+Duw/QRgcWxMTXpoHNOBfsJ9uDczS/CFX2vFg6EvlvttePySyK2S
	 e0l6VuBdW6qUYfB7fnYLrrkWrFZ31LXpB2u0mwnf5ZePA7j9Xjn4SRyQ0hsCuYl8L9Eyl
	 97SIZ1PE9vh+9fc/ZOO/944fHPWvuy2vqPgsaxVFJPeV88B03hAKxqI50hkiyW3iOWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV5BJQEa;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B31606A899
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B31606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV5BJQEa
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso32406865e9.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395245; x=1795000045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
        b=KV5BJQEaU4htQDaRkbnxr7DuDzj4kgGeEfhToTDv1CrTxoIOjCIvWU3RBgL9h7DIgL
         O6wMLLwkNiBHGmNNJu7Tyy8SwnIl62SQ+7IKS6P6JBf6PoR9tWJptCpon2bwWsWqshKD
         y7JxqYFHyvdoC85pKBsbHEIVXnvHa7S8iQVQ4G6ofsFRtRgVYmQ1jLkhd7XmzWlgVq18
         LFznO4HsikwwUcUedN+JvAlG1eU++1ioINed2uxEzcVV1uQcsWLBDemePUSTN3ecXts2
         cIQfkjI28RD63/5CulQjxKYwgHxd6gcIoULHhGSq7T/TOvB5okJernHgXYLtXyfl9yHd
         YCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395245; x=1795000045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
        b=lS3O4xlsXPEmvcNW3BW5tcdgJ8xiA7/pn3r6Lq3aULnq3TzA9G4a+hSA7GJ6y1KhY/
         aMHAbacb1M4HC7qTNNqNFYareRJrRKGlgO2brIxowJTWj0FspUEUhgKtNUfa2JafmXVW
         1yfdtqZ+TLW/9Fn83xi0eGzSspxQ18BloyY1DQZUjjwVSvvzq8O1QDu3Qwp2wZDecwO9
         p2itHr5RW2KtLhR3MZ9GgjdF2lVJ91TmpaChRG5KU+jKacjbwlbBC9RVgKwgsihl3boe
         apJpksYCVlcMdalwhu3wGpM8RJMHZ+2T47Vj34s3EwENDUB+vG+M4HKGRihmP5ChIb/j
         SKKQ==
X-Forwarded-Encrypted: i=1; AL+hErFD2JIN3ohGg4tPGI6Hql7vE0cpcD1bcq9JzYbsy818HQpUYd61y9I01YlM3YicB0OvcPSt32ZI+IvR@vger.kernel.org
X-Gm-Message-State: APuU4Z/y5zF2ccuCEewtUBeCTL6GA0wasXAg4R8IXKwNDGZJQ1OPnaiM
	d5wur+zAtBlyOkYZAln+E0MtoBzPn5Bkh+vtv04rfCe+uu4GVL3MBd5c
X-Gm-Gg: AYBFou0rykznXCU5Y9bfkevjuKB+2hOQ6Tm1EyZumFu5bV1L547fZFnKFVdlO9UHOwn
	9WM1gx9kVI+EjDVbbr8nHKAZIiiUuSYkWGCPRcTKsblGLTy1CaisdE7YpLVWlUeqv+KY/yyDGGU
	9AXoXeAq4w4+PtXg/wLBzBWLLjkEk6GBqLAhLVrlyl3PozjOAreuRG9ovjpIUNfFga6rz+I5j2L
	hEPpuhtVZSM0KLzanNfOpeMdd3lGh4+TFuCGnxcys5sYRorRePEBYvRmPqkB/agnBfG9u8AS7oh
	4bcLnLloknHXU95wFhAkuSWcqR8qCESpwFxZozRA5lMXORJsfioDEx4TAdNg6yIjvJfhM21BcMC
	LYUOcUY1fvoXfJ/T2HLy1zntxylkxsAEI7hXRt49vFTwzs3XB7mxmarBft+0E5dtyG9gclUOE9t
	zv/7RT2gCSo+kD/i5lDZ2xHhs8EkdOjFtfB+d8n498uIrC1E72Aqa+JopOdHXBqS3bbEwtt0Vkt
	ayJYF38Ta25PPig3KiD5ICzEp8fv7IXyimHA3TWixIISuAllpBOC1ltKZ4puO6jerSpXwLXrzpG
	oLHI7xoJzpZsL4iVQBQfqLDTfoI/gD1C4XZlQIp3DTCXLxomTw4sfgoDipJduhvl2la2L4Fd0ih
	p4w4vJDqkhPG9UmoE0Bd2WaED0XZ4YRXJ9wEP89ZuZZKhA1zr+68L5QXc6L15lZ4Fi6PKQ5/X0+
	A2H3WJ+QuM
X-Received: by 2002:a05:600c:4f10:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4ba093c53e1mr41140325e9.28.1794395244647;
        Wed, 11 Nov 2026 03:07:24 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:24 -0800 (PST)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 4/4] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 11 Nov 2026 11:07:00 +0000
Message-ID: <20261111110700.3331225-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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
v8->v9:
- No change

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
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 243b851cc0f1..9056df917a2e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.56.1

