Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653450;
	b=cvC6O0JZ/5oFGESeZpCF0cfje1R9PrNIAGzjFLvu2/1Cw3rqEBlRdCEIbHv1FVeaIhFu
	 BfpFG2LDRFDAWqq+1YxRUs5yoGyyYgAjgNW9fZcKhsg9Gskt7S420Xc8SvYgWpqaoQswy
	 OuZJ3mY1N1FY0eoq/DYLQD4mwoV2FMPjvH89kTLwe/6IDxxbES5wCoTl/BrvGyM/+blTz
	 CbbcVfy45GdrkQLDBUYRgZ4UpQBTIDoqpkR/reEkliX/DhxTMZkt4NSX/+7oWj7qwBLcI
	 HTckY2jal0wfbG1wWhlbPm4ycUgWsKE7jgIqKqJSwNnIa3OlWzmCphRKkbgpkBOoGrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653450;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=n3uVzP8dQyNkzHk2u0PewweHFtTDJWu36twC1wg6sd0=;
	b=4thwrQbtVXX/qy/SL5sp7Qx+BNAdFJvbFaeEm+UmQKNXEaKu4BryUj/lrBNDuAjk7jZs
	 hRhYUnRv4oApHi+La7RWmsImNES/MUW6yPMbWxKpNu6397aS83OOQYdPtMUolPdQRFH+7
	 5f8uA9+BU6klKI86TGpKvW6QcsnYjbCxJzz0nszHG5xk6OeczRmI4r6gszniRezW5CBxn
	 RpbSJtWwSdTU8Okq+/8nNaxSet403iASHaLzcoDHDKQAVWK48+IJRL9SxJimC6Bnt2vLb
	 LZRDjQm5N/iMX5dHU3ntBQNq3AgpR4y5TZj3xrTbSoc2z+GLDm6r5l31NO1CVSQyc4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQF1tTEp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9174606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQF1tTEp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A701F000D4;
	Thu, 26 Nov 2026 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653450;
	bh=n3uVzP8dQyNkzHk2u0PewweHFtTDJWu36twC1wg6sd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GQF1tTEpG4CKGJeNTXGStn6XH3//4TJ4wLBnKl/Y0UrUacOCrgWUIlCx10J/egPwE
	 zaTRHmDvwKFfFIwYBKvXpPg7dpftvTrHi9Ho/BJAF0GIqOiifeAzVUQN0LlCQQza5p
	 xfaD79iTj5cm1V6E1gMUt0YiopUFh1p7gF5X07Xc6XgYASuUgZHocnYAtzRo+53Lxa
	 XUfOpk/UI0Xc+ONksK22CACn4wrDN1WHmQGrAxWOiy8IZdPvjqohNE1K7/nHEr9Vtc
	 QTnn9tipknmLLLEmq0e6c5opK6lvk2wVSL17WbgE1YbMcQ1AsSHG0P4TzDGjtU8wp9
	 f0IAwvDlO8O1Q==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:14 +0100
Subject: [PATCH 10/20] ARM: dts: ux500: Fix SD regulator node validation
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-10-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Rename the SD regulator nodes so the GPIO consumer property pattern
does not mistake them for GPIO specifiers. Drop regulator-type from
fixed supplies now that their nodes are validated, and move the
Snowball regulator out of the simple bus because it has no address.

Fixes: 5282da459a97 ("ARM: dts: ux500: Push VMMCI down to each tree")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href520-tvk.dts           |  2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts      |  2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts        |  2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts     |  2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts       |  2 +-
 arch/arm/boot/dts/st/ste-snowball.dts              | 42 +++++++++++-----------
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |  3 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |  3 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |  3 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |  3 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |  3 +-
 11 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href520-tvk.dts b/arch/arm/boot/dts/st/ste-href520-tvk.dts
index 5677df43c3ac..9033832fd572 100644
--- a/arch/arm/boot/dts/st/ste-href520-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-href520-tvk.dts
@@ -15,7 +15,7 @@ / {
 
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts b/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
index b142bb2d38d8..5dbf6395daa3 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
+++ b/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
@@ -14,7 +14,7 @@ / {
 	compatible = "st-ericsson,mop500", "st-ericsson,u8500";
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts b/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
index 5da1ff41b00e..a43d4153ef4c 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
@@ -14,7 +14,7 @@ / {
 	compatible = "st-ericsson,mop500", "st-ericsson,u8500";
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts b/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
index c4abe24a7cd0..b0bc4df649f0 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
@@ -16,7 +16,7 @@ / {
 	compatible = "st-ericsson,hrefv60+", "st-ericsson,u8500";
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts b/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
index f55e8de2b516..363e2ef14f78 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
@@ -16,7 +16,7 @@ / {
 	compatible = "st-ericsson,hrefv60+", "st-ericsson,u8500";
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 2e2f787871ed..5b27393a7ac6 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -113,6 +113,27 @@ used-led {
 		};
 	};
 
+	/* ST6G3244ME level translator for 1.8/2.9 V */
+	vmmci: regulator-sd {
+		compatible = "regulator-gpio";
+
+		/* GPIO228 SD_SEL */
+		gpios = <&gpio7 4 GPIO_ACTIVE_HIGH>;
+		/* GPIO217 MMC_EN */
+		enable-gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-name = "mmci-reg";
+		regulator-type = "voltage";
+
+		startup-delay-us = <100>;
+
+		states = <1800000 0x1
+			  2900000 0x0>;
+	};
+
 	soc {
 		/* Name the GPIO muxed rails on the Snowball board */
 		gpio@8012e000 {
@@ -222,27 +243,6 @@ ethernet@0 {
 			};
 		};
 
-		/* ST6G3244ME level translator for 1.8/2.9 V */
-		vmmci: regulator-gpio {
-			compatible = "regulator-gpio";
-
-			/* GPIO228 SD_SEL */
-			gpios = <&gpio7 4 GPIO_ACTIVE_HIGH>;
-			/* GPIO217 MMC_EN */
-			enable-gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2900000>;
-			regulator-name = "mmci-reg";
-			regulator-type = "voltage";
-
-			startup-delay-us = <100>;
-
-			states = <1800000 0x1
-				  2900000 0x0>;
-		};
-
 		// External Micro SD slot
 		mmc@80126000 {
 			arm,primecell-periphid = <0x10480180>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index 6afc9b0113ff..2d71366c479b 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -66,7 +66,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO87 EN */
@@ -76,7 +76,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index d3325276dfa0..c81531adcd63 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -79,7 +79,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO87 EN */
@@ -89,7 +89,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index 1cbccaa1c3cd..323887f8a858 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -52,7 +52,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO193 EN */
@@ -62,7 +62,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index 61023711f113..0d2d5bcc32d2 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -56,7 +56,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO87 EN */
@@ -66,7 +66,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index a10710beff32..335539be55fd 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -52,7 +52,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO87 EN */
@@ -62,7 +62,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 

-- 
2.56.1

