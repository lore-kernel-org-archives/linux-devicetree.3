Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA19744F562
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125486; cv=none; b=UjofSVX1IK7bZgNrY8j3PoOfB8g+SVQmMMUnPM+E/Kl1LPe/VUPrrg40o4kHx+Q5e7qXhOW7uYKsI4XNHyKxKEWqKx9u9RRXybDORZ8WEmx3FIKCSSBB3nGG1maYv9pYJFGCMe+lU2UecxX3qWpbDDeRe9det/Jl27541u6mOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125486; c=relaxed/simple;
	bh=4mxpI2/893Z5UG8GLLl14OQMNMqg1usOfIurJ8Ot5xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jzke4PXNzqp0z4aDl7wE8C7dvkCA5sLXFwBPypYppB8y9LiiXsdza5H5OFwu59relXOkog/fZ+zvGt5GzdDYUNLoNXxEIJ4rLxhNSgR4IP8Bl9u2GPExTVRczyMuNbO9ajnh5/rhxi1fVojPupRTswvjPdvdO2hRo7zc6gib0/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj/J9un6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj/J9un6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso449582f8f.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125470; x=1789730270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeO3ig0BGAoWhhaLOpxWQIYCf0wbWpDn5BIfkqhUQfE=;
        b=Hj/J9un6I6+pKzjcLr8Ag+M3oBqa0r+mVSlQ/bxrTdt8KTJa4TF70FhTz0JYP/WuZz
         TL/w0nR7i+Ei7D6l5vAX0CoUJ9N0CN/2hzOH+dNJR5GjCghsxbCNA3T/S5W2rEn7qmmu
         bHzc50aCvnA7XhkLH9z58YfOsHZBAG41xvqqxLWJN2o3q30CpYgfUm8BLtKewzF5iedv
         2KPs+W/r8o6R3f6U+BoxJPgOK1DQbEZUbjHPtIk61SF0X9t2tgfbO2oc1URojnFPfDqO
         LJC8JOKJUGQhHveE601z/jOUFsw9O9iT4zGcLODCGs7fDH3HzfcPsXDR01m/e/SpmSJi
         WPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125470; x=1789730270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JeO3ig0BGAoWhhaLOpxWQIYCf0wbWpDn5BIfkqhUQfE=;
        b=QLUfFPq4nSGlU+EUagj6RdyV5K6F5r5mgjB9iVM5o7fx3Cv06dpDvsBGOWQjw2K1Zd
         QwNisfkQ6viYJNEqRcmQKKRqLERhbmTiSvOJD4hPdmUQt2Cas5VOxXgUibLaASVKxb3c
         cPzvNR2n5GTFkRSykjB21p5PqO6l8bcZFLtwp10a+WK/QI9YHY3ph1NK28dHJZ3nXE2W
         8fBloiV3YQBGmjUs8J4j4hfaOmhJPyJRlfof1JtNp0KlGimjTybovFyMBxAPdgRK1jY5
         oQYmTCQutcu1CFv6TY4GmS7GxUDbZOE0rVgVFXN1NWZETOR0R88Qfu86Y4HENYp6Q/ms
         Nniw==
X-Forwarded-Encrypted: i=1; AKwUvBwV6iE+5qaF5VXn9AXVkfgR9Yvt1bv6xA0P0zU+MrStyCP5Hj44q3BDY9TB86ua/vmWPEBhvoPpfK3z@vger.kernel.org
X-Gm-Message-State: AFuF++mq73F5Q7CzR6yLJ/k5MJehBGEqy3PvB3IggWGmz+NwAJzWGf8G
	ZWJzwjSUe0obMkDsTlahgDy0lu5sB3avRSvnwJNYEM+c0NVOhumLc3oI
X-Gm-Gg: AYBFou1xjO/y48g6/4d8Ks6NffN2+8vpGXqTiLkVfFSv7GBpDUzQB3CwtkmvB7XXtV/
	rA95fjo59IQoPJZpFQwCiudCwW5bs+oOlwPo/xyFW7Doo8mSogfLvsj65libdGJLfJEyv4DX0k1
	Tk5AYxqep4d+SfX/EyqRhCRmGk7G1z35kDGU96C/ZV6rRHzZFVX6pbxnwHowuP1404VHg57tx0f
	8StbZk4jOhqpPXqFyFg9GeXFZBPcVTgRURAP0Sxpi1TD5uyJTvn7Ke/NmyldLwVuo9bG1T8laZI
	kFxRNECTZebE1raA1eXM3g29cBjQlMa0dA+fZ8YlVOAJj8kLtUrrm7J4fv1cSE6pPZDi1iqZWOw
	9/Vb35hhYs/xUy2F0RdFgBdEXcDZxPG1/rdIJPh4V8bBUjgK+yclbKdRAeqt+Lg/uOy4ViNHfzk
	Mf7B9xA6GUUNbQAUYJDvzncPBf9+Jd0peFGNwPliA37kYYScu4wcKy50B2gppkKpFmX3nM1Um5O
	oUjbMJ1PIaR3Fxs1hszNMUGOrO9kl27FX1gubL6hMmV9nB9NMmjucQ7V/zu0TJrbwcsksJojRob
	Cd5ZSmldXbadtySQHdI=
X-Received: by 2002:a5d:5f49:0:b0:485:b169:54fd with SMTP id ffacd0b85a97d-486eb1d388cmr7915145f8f.4.1789125470232;
        Fri, 11 Sep 2026 04:17:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 7/8] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Fri, 11 Sep 2026 12:17:30 +0100
Message-ID: <20260911111731.3404308-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
2.55.0

