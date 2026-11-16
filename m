Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843190;
	b=iPr1NXssclijDqbD3noz1Fw45tBSN4iG+IkEV/ZlhoPC50pxNz43RlInmIQu1HP6vX1z
	 Csm4OaAYs7UsxvVBlyqdrFyZDF9H3o4hghExUatGUdYrmRyJiFeXUk9YFnHi9vcz9JgxM
	 5YZirDmLb/JIIy9lFiVdQGCDOWZhi9U5k9fRroi8keLPiM6tGIGBtuE9dRiYz39DiwTnH
	 pqBMNWjrUKEynymW+vWaMwlCU6fxw/NQAcZo6e8gj5WTrQFizcWlslIdbOlojshe1L6os
	 h128MJ+7Fg6cTgr1Lh/1mkqrFwA2N0ctDAfRoA7FcSFBJadM/m9RFfDgMQOhf+8U5OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oazTUCb6XryWH2lSX3ROjmozPJ6oCTinVy4m1XQHFCU=;
	b=weH8Wxa2XfVu3s6hWkJZjcbeD78yf8RZHby8lGgrVOn+2NrFpZvQpHjP9DU2W6KNbyjQ
	 84scFefVLHfT/G3lkMptKIL81XBycJPOi365OX+Cme1E+1qEOvWnd8Hrlz9B+21taWkQN
	 YgQskPsJcaMHC3S9bvTVnhqwU20vIvcEr/G+1hX0InBZaQ6rKXbVyILwwXt6LtjboaSTV
	 kZqLhyffuFaYHPaXhLsz5PJUJOEKFNDXyRMxSBlwjhGe+Su72IF5nD53vMVlDvNkpbEBh
	 Jdn40ZStt23QO8U9HlcwNGoPBGyR5oLnEqZXMwAPCMtabzgwFKyyJ1Zhi16/uqoAOig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryIdEDyF;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AFE606A887
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64AFE606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryIdEDyF
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so38100165e9.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843188; x=1795447988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oazTUCb6XryWH2lSX3ROjmozPJ6oCTinVy4m1XQHFCU=;
        b=ryIdEDyFDs5cHYpLuMt5wkrw9A55eaiObVkG7jWQS7AOYHuon/3ahte/hkeWkqB/Z/
         5xUOor+mw5oHsJPQgA/cPHc0MaQKj8uX3UG99cOJZyrUxWSLUhDWBe8w0I8HcPIunlLn
         O1PTBNZgQHOhr20Mt8kzup2NI/eQcnpotPKQwHjdsjr0f5hlZJAF8wjT2flA+ZBJDDHJ
         KNIoTIRkyCdrhyRhnfO3DnV2AAVROOM3puPyDStbZRqtOxvLdkXwUEBBuiK4Tvcfi28n
         7fN57D4pBkojzYVveSZ+Zn2/mqJiD3rgVrTrta2o2vOSt7ozYzUD6Z5/65U7aMVI5gXF
         4IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843188; x=1795447988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oazTUCb6XryWH2lSX3ROjmozPJ6oCTinVy4m1XQHFCU=;
        b=UCD70JZoIzAkanATA1/I+NZg+rNlkyzMDiPPnwi72JguujGnzyX5kZ2TrOOgvhdw0G
         b6kUceA9DVKpSZ7n/WqILBe/1K0+ITU+kK+/9iLMz4OKDVjCOp+PLqXtou3zIybYdMtv
         aii9hqB/0kaGE03g5pTusfvPu/EPRMAJlDsh81Mo/y295WXpuorP5WZCOp7A9BS44UMn
         TE00C6aN7/YAvF3J3uCMY/IQByFBHXCTGuN7SVXHwJXCLcJzDc4qvGe+VV9Vtd28JmYq
         fFgi4oLeDZdLCg9o1n3B8MKexnBll3PL7GtBlFmln6+SDvUIWRr6rrezUHzP36iNhaN+
         dQBw==
X-Forwarded-Encrypted: i=1; AL+hErE4tM9YLqnBwCgQ8zhffW6e/dN2T1g0M8ZyRNnba0UQWLGLctxK3nAxbE7CQtcGbS9ijVmlD3VNtWZm@vger.kernel.org
X-Gm-Message-State: APuU4Z9qSuEB2thhshRK76CdNwz/gZZbzNzBkVXAIjIuBVOS5XELGTfI
	8t7MJ2k/dEo1l7kEod9EmS7F7gKm8m+s3/0dy+Ts9I+BAaFBUFBqP+WGy95Jfw==
X-Gm-Gg: AYBFou2aAK1PtGBuANgSbWZzW/iFfmJ+FXSmW8VaAHNj0ebj9aDZcJ3Q/R9PeyjQHw6
	cgxjvfxMM0uOwe8HyN3r402VZv6+EGx5yTqluIbzYkrxsluzi/04qBbd1tyIq6w4O27v7q5n08q
	rYJkWue8dAgsMv9o/pxs4ipBoLnM+C4S/hDvzEGXNREa2B6qM/NTXpEE5fj0fFms2RNbeYq9hB1
	msKjyPtOBxb4jVnnztNLj9FI3FwJBNh35+j1vphw3q2JouJ1/W5j3D+YNjTnknq2TmMB2OMBWrq
	IKYa8xkZ0N4eVTQxTWAGBTbEtYwU6VzP12IXGOP1sXPcJdsG4rRsMRAnanrrqdCpAE44h8rzyef
	YFUbLjetqQWDjk/jWcMnUV/9zn01fH54yl3iaoYNKw253K0YyA3KYZ9XDYCHoF23vvLX+7TK6K7
	HQUJHmLRTuBvwL2Mr0VEZG8MMBnxLdpVScH+Hq8M5B/uIk4KT0xrXs68hRQc2yHIAo4V20PHQTY
	zAhFxhtMLMjPyuOFzTeyJ7bK99AkxIY6TPevZcmpq/ux7pHAtdd5CYkHchGL6NjvN+PAW4CZbI5
	8Lz4R3Icrl/Aki1f9QvVFBUyCNNcvAO/91ihmHa4VIREQNGZC+xpnF1Gc5eGTO/wfA==
X-Received: by 2002:a05:600c:6206:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb687c5079mr121080955e9.8.1794843187787;
        Mon, 16 Nov 2026 07:33:07 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm315407665e9.11.2026.11.16.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:33:07 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 15:33:05 +0000
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add CANFD node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-canfd_rzg3l-v2-1-89e06c46f40b@bp.renesas.com>
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794843186; l=2530;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=MBMsJHEXlBjneZEz7hzvDUbXcDmUBxSqtdCD9gjGz4k=;
 b=zDYN1fO7M8tHthmxufJNI9PxwB7bog1Ay6y4sHKkXoZIwTBKVUZa9R5eltdv2AL4y89qgaeoK
 KxgGzMka33qCDASrpTEWzsPJK6mKA97m/KPNATdTzzSEqsxUC3JlIGe
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the CANFD placeholder with the full node description:
interrupts, clocks (fck, ram_clk, can_clk), resets, power-domain,
and three disabled channel sub-nodes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped fallback compatible based on bindings.
 * Retained the tag as the change is trivial.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 43 +++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 29ce1ab2a57f..682301a38a71 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -28,6 +28,13 @@ audio_clk2: audio2-clk {
 		clock-frequency = <0>;
 	};
 
+	can_clk: can-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+	};
+
 	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 
@@ -651,8 +658,42 @@ rsci3: serial@100f3000 {
 		};
 
 		canfd: can@100c0000 {
+			compatible = "renesas,r9a08g046-canfd";
 			reg = <0 0x100c0000 0 0x20000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx",
+					  "ch2_err", "ch2_rec", "ch2_trx";
+			clocks = <&cpg CPG_MOD R9A08G046_CANFD_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_CANFD_CLK_RAM>,
+				 <&can_clk>;
+			clock-names = "fck", "ram_clk", "can_clk";
+			resets = <&cpg R9A08G046_CANFD_RSTP_N>,
+				 <&cpg R9A08G046_CANFD_RSTC_N>;
+			reset-names = "rstp_n", "rstc_n";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+			channel1 {
+				status = "disabled";
+			};
+			channel2 {
+				status = "disabled";
+			};
 		};
 
 		ssi0: ssi@100e4000 {

-- 
2.43.0

