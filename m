Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873887;
	b=taV/w0Qls3ZpYVUvcXKRvu4O0TvvEPtsHETJbA6yA7x/hH8jEWb7RjfP2X8oNWnm5zxt
	 CLJrfPChlpx4ultk1alzjr16iFF3LJfG8VtbZjYbeOaHL23Ofpqnq+2KfjnLaTY0KbtcU
	 ZOnoZf8yJcueMGcBY8Vq1G3jtJTY567lyerO+bbhPaiRJdRJzKhr1kQQ/nPP6m0BF6HME
	 vX1TyOJvE3KtiMBgkpU3sPCaAaLCVGJY0+4Y0sOGOLl9kFCgLC/ajlqQsjt4MWGfQTdbh
	 j6WD+bhK17+S55HnFIaC6jvY6mPICiVoqev0CCXGBjOKcYXAa09apz3gzIEwLHjb5cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
	b=mAwZWjy1E91tFD8eT7eSgwVZeTJT/B9jeecKV9SduyWGrFUtM8nZH4XER8C3ZFQJcGy4
	 E5shlFpSCv2RtJ2ErVYX2pOrR8cAMbIBGTY3sqmgJkLUZTM4vIToLu+4oZQ0LenON8ymT
	 9+Q/SntdIfcZ9DHGAXFQnYCl5e7IWJcEwlrHQOnRwO7rdTd4Y+VGZerdiB2Qz7wb5uA6G
	 EF6Y5UDe+Kd5btXMplZjXR3nX96LuJr+JagsqMAZfkVD+Qg4AJFAk3kPCKR1qmHAStk3v
	 gBaiWbY3q6GPn8GxOuut3bX4jHo2zCdslS2eczEpIHls8HNVDRIfUgQDVgKXg5EKzsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzhWZum6;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56AA606A339
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56AA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzhWZum6
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so15013915e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793873885; x=1794478685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
        b=fzhWZum68XDcz1+w7vFXdqqJhjlSHjqQr4vD9a3TuutvGZvrj5aQ0khmicXbbxdVUW
         bgnNYBDBNzWTRKEe0EP+wT+XKNH8l9YhmqNzePbrFDxKzyklQGM9Yz2heyTRFRi6GsFU
         zQQ7KJ1TDJ3C3Ra9YiDnGVvl7pkiU/lnDh06YXB4+yAanQfyo3sxHs4uarIzASHADCV2
         XU3eeCPv6G09231PUgwFi8hvDIdEgJyI9BLjWwHT9IGqhEw/8kgGL7Oa6KKAqlshnopA
         h5AEXol4jjDbRJxko2PPQyZGQWyIGlsWl0AkV8Cy830PsR9EDwAIG9rELYY+ovbBAfLZ
         FHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873885; x=1794478685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
        b=0ZGL3rgBFMyld6SOhl9JUveRaP6sA3uSNiw4HxIBSU/8TxYferREHFgQngOPqegNVD
         kCkdMDxHB9nzINTcNLT/Ivma/ymADuAE+e29JVAPvT/zC7q236Pg3H+rz4sRcfqC8Krg
         dem8Gb/ZwJbNp54qsFQNm6XtWr02YN7qL5IUibBEcBaIEvj/ZmY7beAED4NpZVJQT/tg
         gfb1aV86kezrKHKq2CkTwVo+O+t/5TvTgGXhsZzvJcaLGlfGgKdUNvxStruiiD7biwO/
         K20IR7EVsvZL6Lu8ArVO8DNuUusOr36xm7OpMjWLYt4V577FuXfWfoJ+f4oMwQxnJYF9
         YWEQ==
X-Forwarded-Encrypted: i=1; AKwUvBww+myse24F6PRJUBQIKJMx3+s4szPwhAZYm5xHBMT5NqvhE3Vvjm8bltr/jyc9Zmi7neKBf4KFwo/o@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kjef8d7DTKVuZ9HN4cj5L3wStKnxyrPjucU+AkNzs10cTuNiO
	pmmaLz01JYt4Jm7hjKRZYMe8PvvJE8/tmA6Sff410TkP6g9ltBQQw8MY
X-Gm-Gg: AYBFou3zaBz9WqGcldYQQqfUcXaU6GWvN//fPM+TD6ltNgwk/sJ4jLUnd/BhcEP/9Ak
	TC+z3splX9z8wFdRp0Y6v2bsfC9xy4k1PWE5xV49noFbbrde2h/hvl9S67Yf55mInxuWVq2Cew2
	wJg2pEpRd5sA02nP4jRauNmKrp9y/MSsBlP4N8qdDABs0JELfwiX0GintHf0QgdiesTm2EbRmKp
	V7AxFrnCLX+6D/zWdKaaPyQGdaVNeOGxApGt+CFg0ieHtL3gPxsYIOUP6maeIeRDQ8rQ5QD4TP2
	kfA6kFo2G+eSJHhy5LtTElAcwP9E7Bc3wrfjr5VcWnHy6gjkWMdJbI2JCAd4AMsEhz7Iha6o61e
	JM5HH9ViyL11bv/PCiSyPvm1FnYXOvnPCkGSQKoBL8M2AJXhWISqGMNW0gm+AxFuKmWqXWOixjN
	EqFL+KCn9Ru60o5plLtyOfh4/CmGRhLU5LN3eK+OrTg9TlzLpiWpM+hndChxDrjp0cca8KfslHx
	BlHZoK7H6CxzeSvae6kcPo3zIrV3lMz4lgSghmU67hnJue23Q8B2rNJOg71RDZrbQvaZwqyGq5l
	x5ROIh8lB4Wk/sfmuokolN07W6vSfqvhv1BybP29VzfN19BodJYrW/tZI4v6QGjUlwAyHXlQ9Ua
	O1AHk9Kt3Xeo6SwaFSHs3ldcYZaSCYfHUeB+jtWlZGK70us4jSZCD
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ac18992a21mr374298825e9.29.1793873884933;
        Thu, 05 Nov 2026 02:18:04 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm59305215e9.10.2026.11.05.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:18:04 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet LEDs to carrier boards
Date: Thu,  5 Nov 2026 11:17:39 +0100
Message-ID: <20261105101739.10614-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet LEDs are physically on the carrier boards, but the
VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
include their LED nodes. Other carriers therefore inherit LED definitions
that may not match their wiring.

Move the LED nodes to the Symphony and Sonata board descriptions through
ethphy0 references, along with the LED binding includes where needed.
Keep the existing LED properties unchanged.

Fixes: c277a3d535bb ("arm64: dts: freescale: imx8mp-var-som: Add EQoS support with MaxLinear PHY")
Fixes: d3ad2ce2116f ("arm64: dts: freescale: Add support for Variscite DART-MX91")
Fixes: 947771d00bdc ("arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY")
Fixes: bec2988b470e ("arm64: dts: freescale: Add support for Variscite DART-MX95")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 20 -----------------
 .../dts/freescale/imx91-var-dart-sonata.dts   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 20 -----------------
 .../dts/freescale/imx93-var-som-symphony.dts  | 21 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-som.dtsi     | 19 ----------------
 .../dts/freescale/imx95-var-dart-sonata.dts   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 20 -----------------
 8 files changed, 87 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index e928a3d44b1d..49d20db7de5f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -3,6 +3,7 @@
  * Copyright 2024 Variscite Ltd.
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mp-var-som.dtsi"
 
 / {
@@ -129,6 +130,27 @@ ethphy1: ethernet-phy@5 {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 61786eee0e82..cbf58aed180a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -8,7 +8,6 @@
 /dts-v1/;
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
@@ -155,25 +154,6 @@ ethphy0: ethernet-phy@4 {
 			reset-assert-us = <10000>;
 			reset-deassert-us = <100000>;
 			vddio-supply = <&reg_phy_vddio>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index f7e32f9375f5..0f2be56ff7ca 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -10,6 +10,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "imx91-var-dart.dtsi"
 
 / {
@@ -173,6 +174,27 @@ led@1 {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
index a9e44efad13f..ec65cd42c195 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
@@ -10,7 +10,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx91.dtsi"
 
@@ -81,25 +80,6 @@ ethphy0: ethernet-phy@0 {
 			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <100000>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..477f31a4cf88 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -189,6 +189,27 @@ vddio1: vddio-regulator {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index b0ffcb534cb6..d9ecbc3e9a6d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -75,25 +75,6 @@ ethphy0: ethernet-phy@0 {
 			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <100000>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 9344a0d99418..ed3e2e1b995c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -8,6 +8,7 @@
  *
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx95-var-dart.dtsi"
 
 / {
@@ -163,6 +164,27 @@ &enetc_port2 {
 	status = "okay";
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &flexcan1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan1>;
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index b4c55bd33858..92ff09fe64a7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -10,7 +10,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
@@ -193,25 +192,6 @@ ethphy0: ethernet-phy@0 {
 		reset-gpios = <&gpio5 16 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <10000>;
 		reset-deassert-us = <100000>;
-
-		leds {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			led@0 {
-				reg = <0>;
-				color = <LED_COLOR_ID_YELLOW>;
-				function = LED_FUNCTION_LAN;
-				linux,default-trigger = "netdev";
-			};
-
-			led@1 {
-				reg = <1>;
-				color = <LED_COLOR_ID_GREEN>;
-				function = LED_FUNCTION_LAN;
-				linux,default-trigger = "netdev";
-			};
-		};
 	};
 };
 
-- 
2.47.3

