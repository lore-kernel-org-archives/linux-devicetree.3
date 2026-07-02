Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C8481FA3
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995502; cv=none; b=RgS9qWKjQAQ/K+ABQ6GjisGwpBFZ2W1XnLhA2AhMyrI5m6out5V2LikB0a3NGivMG1M628r3RKA0twzgpq7wW0yQkiKsdrk/0Ubm6J3jDKAzwLbWjI37pzOHUBurWDZIUmpEqsRQskRX+bPgZ/ix0A1GmX8HlxFN+7EbjyNoFFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995502; c=relaxed/simple;
	bh=L2A0GzKH9EPwF0QTXt3G5lEq4T6+Kmo+xZFk8aeRjsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeLQ/jWYdzG+DGtYreUv/8bvKdPfSNlJOtaQLnRammUbHbC/Ves38x3F2YJApBLki0dpIQsgfKu5d8OTyyWLrykt60srYwSoj33LSySnUhH4SHvA6iHtO5GonLnhnDwZq+cIyHPMjzCf44GaKxEi7ho0V/SnWMtv2bQcpAtPk0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl7zuOUD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl7zuOUD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47362928f65so1723261f8f.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995492; x=1783600292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6muIoukBpYJpCaryUIHW0miALiF24vbZVpFhaej9tM=;
        b=Nl7zuOUDjVjahQ9dDysYVGddey8LPUUincNs70vHHLxrUhvAK/n0MxF1ookRgz+K4Y
         3XU1vwdPkM/ezoWGldoo2uNnM4nhugmAB2ZuRo8RzJor724W0XzmSwGenJdrjmwmSaPx
         5JQLy/QQV6YFlQfCcWhjzHAlNve0Xz6+xI+nz6hLhT4H8GTma5ojeP48OFBEs1/XGZro
         LTy0y1eaDfuBSghS3C0u0w1MRZp4fuX/vNmFunh7cAMNd+ost1CcwGyaslejC8CCEa9d
         zb2OGN2l6/9QB9pcuWg8aHfZ5le8j1xj+Vmeita+si9mPRyhEfic5RjOyvJKEMfCTlQQ
         EYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995492; x=1783600292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L6muIoukBpYJpCaryUIHW0miALiF24vbZVpFhaej9tM=;
        b=InImtOYKpGT9f2cqKjDRXPTWEr+RKMMZaTxQoKSq3LZ8L0+iDG9oGmqpUQHL/VjE8w
         hXjexagYUHazLfZ8YSVwE7REZNFBy6J+GWYfzEaxsMJEcwYETeUoh2dDz7fpsY982fTp
         MDtKNoUu9IzoSkjTcd9V2UtiSe3forSI2nj8pVEOtVKkRkuhV3+8qyPuvhHtsqSSki6f
         O5uEKNJxYSCfESbdasmX6zKYQLskc5XBEhdXlVlt3tN8vnlAw1J+fynCpOFyYOTNKNGl
         Fd+Vqi0pYbc0iRR11da/602dNhT41Vc1DY7/cJysOKGNOCbXIhr/gBpqkBg4PoDkL7Xv
         gHbA==
X-Forwarded-Encrypted: i=1; AHgh+RrjskQgrYeqPc0/jj964h0EOfsDpq+e3BvzlQCpIODzuUpEWWsrk1bxDNXN+9ADcu2zQk6Odme/h/zR@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKzCThI1NFeMxfsLudSYIbCNfYbL1gp8zHfTDeO0xvrNh3U3V
	G0qgSS+e+Zidt3GXLQzXomj/h1h0k28rXGerdbgNHGIaycv2qunvVQo/
X-Gm-Gg: AfdE7cnWECgims1scqfrYSy9BwuklCl+GspJYiCNJ5Srw4khT7Ka2j9xLOuefYSSxbq
	zoZM1njfDrXE7cU4pkeedmj/qrVd9QGSEFGEjEvlnUZ1DkHnCr8vYwM5NzmwXn6kex/BcIGkgP4
	hfr1QhZkhFzd1Wj0Bs2Li1L47LhWxJ/wurW0T+ogkdOw1NRy2qMygoyqsT8DmuJzjVrggMFejlx
	MK5mnZkgbeiOMa2XHLaeQCKO2LwWnCoYPKJQ+j9boqU7+I1694OrLuV/SyH30FAvbq/W8HszPmV
	m2cplQsuLw+E7peHsXhpYwKOLSD55cswkDNYq40Lzim8/vgbYpLkB/00XQwZHnVerK+h3LammaJ
	/YzEijjLGIPGt3t0gWJResUvYNffei3dzE46nfzKJ1fn8EgiTNV2Ncz5xonJoxjss5Wt5Zncqp4
	0Br9vD+TJ8tf9Up8DLgRpPIVX0aK9BQ4Ex+haEZNc96w0uLUQXWOc3keMySeWE+hhH1rmyFMyL+
	7j2yb5lGxOEpNHc8KBMopX4j6Y=
X-Received: by 2002:a5d:518d:0:b0:46f:7d90:8128 with SMTP id ffacd0b85a97d-4775a2efbb4mr7323330f8f.14.1782995491590;
        Thu, 02 Jul 2026 05:31:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 8/9] arm64: dts: renesas: r9a09g077: Use SYS syscon for WDTDCR access
Date: Thu,  2 Jul 2026 13:31:11 +0100
Message-ID: <20260702123112.161160-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second region of the
System Controller (SYS) block at 0x81290000, which is now managed by
the dedicated SYS driver and exposed via a unified syscon regmap
interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sys" phandle property pointing to the SYS syscon node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 6f4c1086afcd..27e0e278ab47 100644
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
+			renesas,sys = <&sys1 0>;
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
+			renesas,sys = <&sys1 1>;
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
+			renesas,sys = <&sys1 2>;
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
+			renesas,sys = <&sys1 3>;
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
+			renesas,sys = <&sys1 4>;
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
+			renesas,sys = <&sys1 5>;
 			status = "disabled";
 		};
 
-- 
2.54.0

