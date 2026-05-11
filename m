Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135FB4CA28E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525476; cv=none; b=JizpPf5DvkiUcaVjPF66dh4PTu+h6ScGFP/+oy8oYZIPPolK5qr4JtL8sEVzJl6AY//WqmegnZgAR6k8MhrpJ2Js5D/txBYle07I8qGp3ZKx3xI4QFlTckWBvU+aRfkJPo5O60aIQiPKvinSdHIVRu3A11xPZxd2REYT24rENOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525476; c=relaxed/simple;
	bh=gsf8O/A4uFSb5xiWCs8Lvej9IiVzo6qsPV5Xik3YnM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEs2RZLTyiAT1+gN1v9ULPKol94zw8dmQp6wx2uhG1L8wrvN/dE3ACTF4WUTJDbzaR8V6v/hrSfzUVi9imBjhTlZ1By1lVG1SoDztC3ipBO0ACnlH0X+I4XEwxWZ8sdeBEvkTawrEdDFdJrJHo7eqbBj0KlV7qF1CI4xoWwmMZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW8fr/QJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW8fr/QJ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so2441002f8f.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525472; x=1779130272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVviRRXyOpOFqlFXNeMmtSmK6+R7+16vmQsfofx/k+I=;
        b=iW8fr/QJHIGZrqwSG9m2vdDynRDk4XZ9gDphPceMVvXcAndcHtWTMyfaKrMuJRZZvk
         HSWyWGrH2ZeJK6MYOcb9xheOOQrgREkwe01fISC0p7UFXs15HfSfgHZNTaOfGhecVRt3
         djtXXUBMT5swzisvwnuWAouDLoMu0STFMhuWjWwwjbeF5KAt+MRPZsedZCZqxFr3G5Cb
         WRbQo/TgY/P8oXnFov/vzKw1pw3UgOn2CGkgswniulACvCame7PghkMKv6n/7k1NVwxA
         73WxA2Eff8Oc3q45c7QNgcokOpUxrxHeTq8tuJipy+UAVP8hqI+3jyyBoyZSmZ+YF7o+
         ljTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525472; x=1779130272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jVviRRXyOpOFqlFXNeMmtSmK6+R7+16vmQsfofx/k+I=;
        b=N0j/HR8TmZYdz0ERp04cuTJKT7M7L/ykC8G75hji5pp7a7dAPRU1zCwE4ysgYFGtuN
         iS6mXJuCCBsN6nI+S3s67v1wQXedjICQLHTHmkq+7y2Rmi9k2ry+s6/LtElCkbG+RiyI
         6m+sA8tMed5PqdlpSd5thGwmVxnmTAiytYXyoAcymKClD5UleTF7wWwd15yicg+uFHAc
         SbSbHuyB9tjPtb+fKPezKAif2zh3mAWJI5x6BUzVfQDJr9ZTyM4tQ7g5Pr/MfQR3mCQs
         prFd2C6vpUMZUhnArOn97YLeGT3dXbnwZukH9vX+qrDvJYelMXxAWvKyToreNvL7tg4U
         maFw==
X-Forwarded-Encrypted: i=1; AFNElJ+Q3pzYfrVdEPfXm644hHEL2PWm/I0dVtL9EPe1yDw+VYJR/QBVy0GQJ3dnUod5I6rOL3zAxBcG1wGV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx00yY/f+m9V0Fik65fw9zDJQl+He4wnaK1c4XIvT4mZ3p4pf/N
	Nm8vYNQUV7O2Ju4bLqJ9z+09f6ighioQkgX4njoDhpDnXAJKo+1Pcm7bS034ahPB
X-Gm-Gg: Acq92OGRWSnbAqtOYkIjL0rbfqTGNhedBcf9Zazo6Q83/SVLzS8cd4ZAuCUZca/GmLb
	TeTSUpzgDfGovRs4ne8nq1hIIYBps13w9YBW5/cj1sESakUzvXb4wcfZYxjEDKndrvvK96O6PgZ
	ZoAQPS3F+acz6z6PY2/TojSXKaheIwGdkk1/KS9lbTcWAmWUKZ8ecuF4stnHiPh8RhDbLl3DN7F
	ofI2MtjJO//z2ltsDeb/CpAhPs24+NEBYueJPEk4X3OskgIb63KnlQItEY29VYzSktHHSM6efjL
	9KhFU2Luu7LdXMwejzRcyfeR5WRZWTnXoQuEMf5CrAQ544MfNvZtxQA+ETUrHw2JujIMYfpwhhv
	8cX49q8hrt4kUhDu1tZ+YVqzTx0AQeLoOIQu+Kvwsg1Ed/geU2dUUVMpQCgGfjn0a2b3o+s4DZ9
	yps/4fEiVvm2peRpln52ihgv2HjVJhZ+3ssI1T4PaNj3F4cxzXXuBmamAxOh+ojLY9zQ3PGPduW
	ffWm2+ejgRzNPfctfcoSNcUry86MG2ctGHRAw==
X-Received: by 2002:a05:600c:8b0c:b0:48a:7a10:4f47 with SMTP id 5b1f17b1804b1-48e51e0a620mr407790805e9.3.1778525472435;
        Mon, 11 May 2026 11:51:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:12 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 8/9] arm64: dts: renesas: r9a09g077: Use SYS syscon for WDTDCR access
Date: Mon, 11 May 2026 19:50:57 +0100
Message-ID: <20260511185058.1926869-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 59e5de743826..b076bea9cb70 100644
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

