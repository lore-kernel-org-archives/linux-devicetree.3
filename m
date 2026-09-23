Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002EB4A0904
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160088; cv=none; b=ZntNPqiU1RU0hnTqjl1BmljMZIFaa9MsNQA8X0JY/4HVfhMMuFjFN+H25NgOAoZC6vpV6xU2PYIJQqNkY81kFS5GFT7PW/1XjnfFqYWG2lIdY/UW6X1Mjja8oHRa4cz8UFdkrJGlq8CZCC9d5eYKBaZWT9kFdg4JMc9+ayMFO6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160088; c=relaxed/simple;
	bh=1lFgLtLwiG9ZlazEhqgrw6NCUNeBFzcT8X96+NwLVuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cV8XGrt+TesAUzMl7qn8dSbMhqy/z5YVG2ttIgmf24PotUeuePb6qx3SXyx84amII+Jr8mqthACce1zhDt2b92SW21vtg5h8gL3adkjCnJj2exJYYdh3exUN2gexLK2fuZqnABgno/wi/xiQHIu2OzPwV23/KEckz7yki65O5Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9woJsjF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9woJsjF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so3896785e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160065; x=1790764865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLPiGOv8BG6J6N1wsKC4oaWQ6OSRmNQqyKq1m7eGBCg=;
        b=f9woJsjFIC+/W69h3fOGepQxMKPqkIl/oy9U8WCqFxQ3EVNem36QDllPRbko/dc6du
         U2WzfG2L9cfRpSQkxHgjjmlAmCdNowP9eG4ufKNyG0DaIkkUgqgQNHwLjM/QTZVY8gig
         qpyqFwEhi1jlJFOZDCHzFULs2NGZqOiJjalaWMJUDpNlhMIfq4/btRB+JdRStZDTRc5D
         0UCey/LAoqdO+enMUCOe28Ueb9G1dm0l9KZ85bgP8xqaSAKDNcObqcbpQ1zbsR8VojjX
         Rw8nqV9wUXGk0hY71AdMnPz9Yn7bHUrFCMTvoudegag6BgSTfiMZZXr7KVv53KSm+Ujw
         ulPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160065; x=1790764865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLPiGOv8BG6J6N1wsKC4oaWQ6OSRmNQqyKq1m7eGBCg=;
        b=CvSrUhLL6d9IGPR3RZnKpDF8Ay97MCX5y8jK9M/uJyacSsA4ycJbywFljLJY1a6Gpy
         /YlrpAJgokruXbNeQvN7s1bnOmiyQJDUX6zlkUKUnSF2Jy7aBIGKsdA2gPYP7Jf4yb9n
         8khC8WmJmE/zQoS2Y8/G8MZWcYN2pOx5vAvm1rHQ53fAaJeVynwJVRoxi9QJBUIVhOTw
         CTR0+yDIxumQG2SVOO6koHhxgbvI4NOK1gGQ4EfDKu1LbxTWdmgxW2RkRPNo5HME8+Df
         U8wyVZr0cSQgsTBPqgk5vPSMM6S36aKZ5Gol4AFVliw583abUu8300aFdKkbb7vT0R+z
         MQJA==
X-Forwarded-Encrypted: i=1; AKwUvBye9iXtcAT2GxL48sDRKpl95rotqEtwwzXqbwmgt/cONr+cMrGcBfP56Dnis6QxRZ3IXNof8TGwB5CB@vger.kernel.org
X-Gm-Message-State: AFuF++kBYHGbv8LI0QFpRS9rbh96mLcHkpa4z7J+xO7FL2aSKE63KR6i
	swf2KPZlhfB2xFlChaAkFoYSZuG6roF1sCAaGMHhXvbdn7FHirjXG6GN
X-Gm-Gg: AYBFou1BzkrjcGcY+v+mCTcsANY7BtTa8+P7AG1fBRtt60+/wOpcTNqjgLkPSZMJV44
	aXq8517gLQyUMM+q7eKy7sJLc+uSbEsv2MUXs5l8Pc3gtxE+aoGpCojIF14HymovCcQ7CNj35Av
	oYCexf7v2K7XqPW9u55M/YnnbNABiLo6PS2gtFXbZQfld04kj2XT0nMkZNuptaGzMCaN7MsKF0h
	IRh8JWPbru1PoOLpk3Xo/95QTIfnPPd6bdjPH2GbqNQ76GZgImTm91jMev79hQi0B4DkwPIDdPU
	1o3UElEwh74CYDYlrUMLayXogEYw5cGTCioOZxa2p2UD89zpcBuycTBE4hDwIvgqGzrGmaGiPpe
	tlBNgVnTurB9+wvIojX5NEn39ef1xlxlV6yCPCT6X0JmW3fbuPM3BcLcErjQTTkw8EZrC10ayPA
	kB98lmrud4hfIwP7KvaCH+UrGCPZUzLorzAs+jDf2Ku6+Y9T46T0kgYu+3e46BYZWMDECXPj/xz
	G6Q2vQ5qGzcqc0o2vddNOiuUx5whDQDUiBruHHMxw9Ih057U70sgfNoApqS+EuqAw88bqD9S64t
	IbBT/nMZ
X-Received: by 2002:a05:600c:4704:b0:49e:799e:c1c3 with SMTP id 5b1f17b1804b1-49fdf12d3dbmr24470955e9.17.1790160064510;
        Wed, 23 Sep 2026 03:41:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 7/8] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 23 Sep 2026 11:40:53 +0100
Message-ID: <20260923104054.3324830-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

