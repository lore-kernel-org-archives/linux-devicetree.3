Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653452;
	b=dL+/isZY0R0qkAr2ztZZQ84JpUdVNADjDlC6u2KaWV2n9FABZ1ZLpoieXtBBTTrhKFvF
	 6KG9xlqPqaWeyNE8zgKufHKCzVWTVyBby3NX5XjNYJsWL1lpv0wOS4qHK4+AT1PvKYto3
	 p/nUkZYkoZyqpXEL8MQZmgbN3prRfKTyze6L3XEwf0H937mbwFE54JHhATtnY08aLFWyZ
	 6pSQhJpyBW0NVfZEmNBQcohYnP5p3Q9X1s/IJ92CogCXRFBz6SJd44HKFNQIScu/4wB4y
	 snO4C3cQfjpWjh22gEXeocG4KTQcYa0D3uFlkWw4ri2HoJbB9t7TEDH7d0T+X0XFYVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653452;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=CZaE8oRZd7zdqVVzvxdARw9e1KyFIybIP5uCuCoZ4ks=;
	b=1s7JeeftCRRSL+Cxq0nZz5D7XSMX/ZZfWIk6pD+RMZwHtsL6/+5f+2LBUB885hVyvQpX
	 bwZ+CRCo8azANXIfhldAb0y3R+fM+KHTVw0BpAc0s4Ra2EwcJeuhqnrHknauGopIfNHZe
	 M5eFxDiNykzcVJXtb2YACyq+QLczaqi/Bvzloy6kcexbU1oBV2YpZbB4c+tX15Tw1OfYM
	 rDcQmqJPAjgn6K93dPnSO4vajdd67UuOs8Xl72Ktccs4KAqlppIiPs+YKMTf73gTBkOHN
	 Ml9tENbo47b3QpIKCP+wnlrHVqu+/IdshMopyaEGpQ2WXTXHHhAFY8+XLGhh0sXGojw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDI1M8Fg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3438606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDI1M8Fg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013F21F0089E;
	Thu, 26 Nov 2026 00:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653452;
	bh=CZaE8oRZd7zdqVVzvxdARw9e1KyFIybIP5uCuCoZ4ks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dDI1M8Fg1ldXD0ec+Ba3NZIwwQzLHJhdm4J0c06gLcpLJr2p27trhoA/Lh9TvA3VB
	 eI3/+GVAFAf4Uax6L8fqrCoUPWxGoSpAFidwTB3bu9NiqLwiT1sYWpb2738jKli21K
	 34+vQeCoe6ZRN5eFPJXbW/6iaA2P4vDkuLY+HxIN05YrS5e0pvRDYkv+gWPyjpzj9q
	 qCa8Q1aET2HjR7DQRmgepeQeVvRwA1UA+rP+yT/VqVDb5vl1YMdu8IB8KOBtMONB6F
	 YSf3yIyq3Rb0kz2BJ9nsaCqSKE8BYyOIfgwDuS/vVLJ0xU7olmyF0auDqXK2D44GI6
	 e6Dok20yL9S0g==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:15 +0100
Subject: [PATCH 11/20] ARM: dts: ux500: Correct GPIO key descriptions
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-11-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Use names without unit addresses for GPIO keys and drop unused
address cells and vdd-supply. Update the pre-v60 HREF proximity
switch override to match its renamed key node.

Fixes: 1a780d45b10e ("ARM: ux500: move GPIO key configuration to device tree")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href-stuib.dtsi          |  7 ++-----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi  |  7 ++-----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi  |  5 +----
 arch/arm/boot/dts/st/ste-hrefprev60.dtsi          |  2 +-
 arch/arm/boot/dts/st/ste-snowball.dts             | 12 +++++-------
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts |  6 +++---
 6 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index 09c8be0ad7ea..1f0f4ed74fd2 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -8,19 +8,16 @@
 / {
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		vdd-supply = <&ab8500_ldo_aux1_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&prox_stuib_mode>, <&hall_stuib_mode>;
 
-		button@139 {
+		button-139 {
 			/* Proximity sensor */
 			gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
 			linux,code = <11>; /* SW_FRONT_PROXIMITY */
 			label = "SFH7741 Proximity Sensor";
 		};
-		button@145 {
+		button-145 {
 			/* Hall sensor */
 			gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
 			linux,code = <0>; /* SW_LID */
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
index fb9d796c77cc..4a2bfa4c702b 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
@@ -9,19 +9,16 @@
 / {
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		vdd-supply = <&ab8500_ldo_aux1_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&prox_tvk_mode>, <&hall_tvk_mode>;
 
-		button@139 {
+		button-139 {
 			/* Proximity sensor */
 			gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
 			linux,code = <11>; /* SW_FRONT_PROXIMITY */
 			label = "SFH7741 Proximity Sensor";
 		};
-		button@145 {
+		button-145 {
 			/* Hall sensor */
 			gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
 			linux,code = <0>; /* SW_LID */
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
index 1764ddcdf08b..adb8d0be6f73 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
@@ -10,13 +10,10 @@
 / {
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		vdd-supply = <&ab8500_ldo_aux1_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hall_tvk_mode>;
 
-		button@145 {
+		button-145 {
 			/* Hall sensor */
 			gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
 			linux,code = <0>; /* SW_LID */
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi b/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
index c87fd27b4434..5686d777311f 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
+++ b/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
@@ -10,7 +10,7 @@
 
 / {
 	gpio_keys {
-		button@1 {
+		button-139 {
 			gpios = <&tc3589x_gpio 7 GPIO_ACTIVE_HIGH>;
 		};
 	};
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 5b27393a7ac6..29e680264e5b 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -61,38 +61,36 @@ en_3v3_reg: en_3v3 {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
-		button@1 {
+		button-1 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <2>;
 			label = "userpb";
 			gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		};
-		button@2 {
+		button-2 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <3>;
 			label = "extkb1";
 			gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
 		};
-		button@3 {
+		button-3 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <4>;
 			label = "extkb2";
 			gpios = <&gpio4 24 GPIO_ACTIVE_HIGH>;
 		};
-		button@4 {
+		button-4 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <5>;
 			label = "extkb3";
 			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 		};
-		button@5 {
+		button-5 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <6>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index 369572347222..52a54732719e 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -391,21 +391,21 @@ gpio-keys {
 
 		label = "GPIO Buttons";
 
-		volume-up {
+		key-volume-up {
 			label = "VOL+";
 			/* GPIO67 (VOL_UP) */
 			gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
-		volume-down {
+		key-volume-down {
 			label = "VOL-";
 			/* GPIO92 (VOL_DOWN) */
 			gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		home {
+		key-home {
 			label = "HOME";
 			/* GPIO91 (HOME_KEY) */
 			gpios = <&gpio2 27 GPIO_ACTIVE_LOW>;

-- 
2.56.1

