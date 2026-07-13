Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452E2433BAB;
	Mon, 13 Jul 2026 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950588; cv=none; b=FptsisUgSxHTLXUvsRiiKTUUuGMDJTuelqlrdwggak707gLFa7qvLkfXcUtnchbqdTMFn34ha9FRHuogfZUTI8C4c2rMWkg5a0X7JnqsoLsmsbC/HImE4e2y82yu4miSflSP1YSNS3IoWk79eI6vwMQIPdB6FvsY2nBjQieBCpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950588; c=relaxed/simple;
	bh=ZHAXhAB/Nmyfq3sWDdK5q297ggBfC78pdvC3bWLISNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlkq4jxSSab5AFtrGOQRYnVZWrQXCXLyWseLF0BGKitew6FEMBwFSw+FfJWlpsanfljYPS6D+C6uOZlAGrVs0PP/NiAEYpg13Az+J27Dgkodo2wBTDjggXVFnbUYzy+4L76sxeeVRxAcQvxHQXN0mE8GDBg093KhHfRqtKYuyTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pv/nTXIh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WonTAe4+; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pv/nTXIh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WonTAe4+"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzP1s64llzKn7K;
	Mon, 13 Jul 2026 15:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783950577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GLe5ZWC2BODKaSwkrw/e68lOSJ3dCQp5mLBoWS0DVVA=;
	b=pv/nTXIhqAfTPnPTR6rOXi3YsoKa7vTWortN9LYC7EdHLiuFVcONZnEcUGWQKTct1U+ibD
	Le1QOz/oZrzJFVjN3O80443C9j7xNwcallbH5GyR8JD3FWtDJx0mXoroekuVmi54JTOW3V
	GOE/LXVGCBpS+AV/hHuc7Q4umKdjbFgpm2xL6C8hPOoLAWg4Ej4MAWZHSRSC1Upypeqr8Z
	Rff6uAAm2fzbCYzd+HmZf1B0z8uz0tgQ/w1HDFeDtSgdb28E34h8E/5z0p6aSH7PXTn0B2
	yXo4DKpb/Nv8qEbc+SI4Pzg0YNXiDkIvhqHIPYUMiMmS8Gk8BzLAQiLE2I6aOQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783950576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GLe5ZWC2BODKaSwkrw/e68lOSJ3dCQp5mLBoWS0DVVA=;
	b=WonTAe4+/eUIhGfZo7F9eTqVuMv6y9xU/G+0xxD+SlsNbZcazKpqdfWFPWeF3nvD+d0zZH
	54fU0exZr870IEYCeNSxv6Z5UiZ54HRCC7V8uh0bJlON/UDvpFLy93Nz8vb6+h35zlYswY
	qtAOPAIcy8iHAn8FkLHxadnSIHValYnT+cBq4OxZYvUR0abk0YcUbfOhPaclyPEiaMy2WL
	RMNj0HUgpII2Nn2hTlZ4ld6Hl7bCumNe8GRf8rnNgYeml+T0jC85iZutVEfC5ZPzDqRN6k
	d8RAMvCESOSJ9KqNafNHVCZ7m3Yomb46UT5RQnBADKwRQn2/fSgd1QidtqV4MQ==
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] dt-bindings: fix typos and brackets
Date: Mon, 13 Jul 2026 15:47:52 +0200
Message-ID: <20260713134751.498891-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a5b33c15717d24ea883
X-MBO-RS-META: jw3mkywjuuysba6eoireywyga58m15zm

Add missing '(', ')', '}'
Remove needless '(', ')', '{', '}'
'lover voltage' -> 'lower voltage'

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
Sorry for the noise earlier.
---
 Documentation/devicetree/bindings/arm/mediatek.yaml           | 2 +-
 .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml          | 2 +-
 .../bindings/clock/renesas,rcar-usb2-clock-sel.yaml           | 4 ++--
 .../devicetree/bindings/input/gpio-charlieplex-keypad.yaml    | 2 +-
 Documentation/devicetree/bindings/leds/backlight/88pm860x.txt | 1 +
 .../devicetree/bindings/memory-controllers/renesas,dbsc.yaml  | 2 +-
 .../devicetree/bindings/memory-controllers/ti-aemif.txt       | 4 ++--
 Documentation/devicetree/bindings/mips/brcm/soc.txt           | 2 +-
 Documentation/devicetree/bindings/mmc/sdhci-st.txt            | 1 +
 Documentation/devicetree/bindings/phy/phy-miphy365x.txt       | 2 +-
 Documentation/devicetree/bindings/powerpc/ibm,vas.txt         | 2 +-
 Documentation/devicetree/bindings/regulator/max8907.txt       | 1 -
 .../bindings/regulator/mediatek,mt6358-regulator.yaml         | 2 +-
 .../devicetree/bindings/regulator/pbias-regulator.txt         | 1 +
 .../devicetree/bindings/regulator/rohm,bd71837-regulator.yaml | 4 ++--
 .../devicetree/bindings/regulator/rohm,bd71847-regulator.yaml | 4 ++--
 .../devicetree/bindings/sound/mikroe,mikroe-proto.txt         | 1 -
 Documentation/devicetree/bindings/usb/iproc-udc.txt           | 1 +
 18 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..cd4040ad3437 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -314,7 +314,7 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
-      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T))
         items:
           - const: google,squirtle
           - const: mediatek,mt8186
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 152403f548c3..c7301f1b28c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -9,7 +9,7 @@ title: Trace, Profiling and Diagnostics Monitor - TPDM
 
 description: |
   The TPDM or Monitor serves as data collection component for various dataset
-  types specified in the QPMDA spec. It covers Implementation defined ((ImplDef),
+  types specified in the QPMDA spec. It covers Implementation defined (ImplDef),
   Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (CMB), and Discrete
   Single Bit (DSB). It performs data collection in the data producing clock
   domain and transfers it to the data collection time domain, generally ATB
diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
index c84f29f1810f..a14be249fa33 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
@@ -13,8 +13,8 @@ description: |
   If you connect an external clock to the USB_EXTAL pin only, you should set
   the clock rate to "usb_extal" node only.
   If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
-  is not needed because this is default setting. (Of course, you can set the
-  clock rates to both "usb_extal" and "usb_xtal" nodes.
+  is not needed because this is default setting (Of course, you can set the
+  clock rates to both "usb_extal" and "usb_xtal" nodes).
 
   Case 1: An external clock connects to R-Car SoC
     +----------+   +--- R-Car ---------------------+
diff --git a/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
index c085de6dab85..c6842c017934 100644
--- a/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Hugo Villeneuve <hvilleneuve@dimonoff.com>
 
 description: |
-  The charlieplex keypad supports N^2)-N different key combinations (where N is
+  The charlieplex keypad supports (N^2)-N different key combinations (where N is
   the number of I/O lines). Key presses and releases are detected by configuring
   only one line as output at a time, and reading other line states. This process
   is repeated for each line. Diodes are required to ensure current flows in only
diff --git a/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt b/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
index 261df2799315..9e17807d2ce5 100644
--- a/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
@@ -13,3 +13,4 @@ Example:
 		};
 		backlight-2 {
 		};
+	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
index 8e3822314b25..30ad2a858844 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
@@ -13,7 +13,7 @@ description: |
   Renesas SoCs contain one or more memory controllers.  These memory
   controllers differ from one SoC variant to another, and are called by
   different names, e.g. "DDR Bus Controller (DBSC)", "DDR3 Bus State Controller
-  (DBSC3)", or "SDRAM Bus State Controller (SBSC)").
+  (DBSC3)", or "SDRAM Bus State Controller (SBSC)".
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
index 190437a0c146..3ec0a43d4e67 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
@@ -111,7 +111,7 @@ Optional child cs node properties:
 
 - ti,cs-read-hold-ns:		read hold width, ns
 				Time between the deactivation of the read
-				strobe and the end of the cycle (which may be
+				strobe and the end of the cycle which may be
 				either an address change or the deactivation of
 				the chip select signal.
 				Minimum value is 1 (0 treated as 1).
@@ -128,7 +128,7 @@ Optional child cs node properties:
 
 - ti,cs-write-hold-ns:		write hold width, ns
 				Time between the deactivation of the write
-				strobe and the end of the cycle (which may be
+				strobe and the end of the cycle which may be
 				either an address change or the deactivation of
 				the chip select signal.
 				Minimum value is 1 (0 treated as 1).
diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Documentation/devicetree/bindings/mips/brcm/soc.txt
index 3a66d3c483e1..70cd69a4f173 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -45,7 +45,7 @@ each of which may have several associated hardware blocks, which are versioned
 independently (control registers, DDR PHYs, etc.). One might consider
 describing these controllers as a parent "memory controllers" block, which
 contains N sub-nodes (one for each controller in the system), each of which is
-associated with a number of hardware register resources (e.g., its PHY.
+associated with a number of hardware register resources (e.g., its PHY).
 
 == MEMC (MEMory Controller)
 
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-st.txt b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
index ccf82b4ee838..5927abf0c634 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-st.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
@@ -71,6 +71,7 @@ mmc0: sdhci@fe81e000 {
 	clock-names	= "mmc";
 	clocks		= <&clk_s_a1_ls 1>;
 	bus-width	= <8>
+};
 
 /* Example SD stih407 family configuration */
 
diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
index 8772900e056a..e36fac92f0fa 100644
--- a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
+++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
@@ -31,7 +31,7 @@ Required properties (port (child) node):
 
 Optional properties (port (child) node):
 - st,sata-gen	     :	Generation of locally attached SATA IP. Expected values
-			are {1,2,3). If not supplied generation 1 hardware will
+			are (1,2,3). If not supplied generation 1 hardware will
 			be expected
 - st,pcie-tx-pol-inv :	Bool property to invert the polarity PCIe Tx (Txn/Txp)
 - st,sata-tx-pol-inv :	Bool property to invert the polarity SATA Tx (Txn/Txp)
diff --git a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
index bf11d2faf7b8..80ea975697ac 100644
--- a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
+++ b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
@@ -10,7 +10,7 @@ Required properties:
 - reg : Should contain 4 pairs of 64-bit fields specifying the Hypervisor
   window context start and length, OS/User window context start and length,
   "Paste address" start and length, "Paste window id" start bit and number
-  of bits)
+  of bits
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/regulator/max8907.txt b/Documentation/devicetree/bindings/regulator/max8907.txt
index 371eccd1cd68..b04c9edd3dcd 100644
--- a/Documentation/devicetree/bindings/regulator/max8907.txt
+++ b/Documentation/devicetree/bindings/regulator/max8907.txt
@@ -66,4 +66,3 @@ Example:
 ...
 			};
 		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
index c50402fcba72..4eb635179b6a 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
@@ -145,7 +145,7 @@ allOf:
     then:
       patternProperties:
         # Old regulator node name scheme (with prefix and underscores) only
-        # ([^y-] is used to avoid matching -supply
+        # ([^y-]) is used to avoid matching -supply
         "^(?<!buck_)(?<!ldo_)v.*[^y-](?!-supply)$": false
         "^ldo_vsram-": false
         # vsram_core regulator doesn't exist on MT6358
diff --git a/Documentation/devicetree/bindings/regulator/pbias-regulator.txt b/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
index acbcb452a69a..09b07f7ab94a 100644
--- a/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
@@ -30,3 +30,4 @@ Example:
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3000000>;
 			};
+		};
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml
index 29b350a4f88a..9942ee6c60f3 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml
@@ -108,8 +108,8 @@ patternProperties:
       # Setups where regulator (especially the buck8) output voltage is scaled
       # by adding external connection where some other regulator output is
       # connected to feedback-pin (over suitable resistors) is getting popular
-      # amongst users of BD71837. (This allows for example scaling down the
-      # buck8 voltages to suit lover GPU voltages for projects where buck8 is
+      # amongst users of BD71837. This allows for example scaling down the
+      # buck8 voltages to suit lower GPU voltages for projects where buck8 is
       # (ab)used to supply power for GPU.
       #
       # So we allow describing this external connection from DT and scale the
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml
index 7ba4ccf723d8..158d749edaa3 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml
@@ -103,8 +103,8 @@ patternProperties:
       # Setups where regulator (especially the buck8) output voltage is scaled
       # by adding external connection where some other regulator output is
       # connected to feedback-pin (over suitable resistors) is getting popular
-      # amongst users of BD71837. (This allows for example scaling down the
-      # buck8 voltages to suit lover GPU voltages for projects where buck8 is
+      # amongst users of BD71837. This allows for example scaling down the
+      # buck8 voltages to suit lower GPU voltages for projects where buck8 is
       # (ab)used to supply power for GPU.
       #
       # So we allow describing this external connection from DT and scale the
diff --git a/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt b/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
index 912f8fae11c5..d6fdcf457926 100644
--- a/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
+++ b/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
@@ -20,4 +20,3 @@ Example:
 		audio-codec = <&wm8731>;
 		dai-format = "i2s";
         };
-};
diff --git a/Documentation/devicetree/bindings/usb/iproc-udc.txt b/Documentation/devicetree/bindings/usb/iproc-udc.txt
index 272d7faf1a97..6a701ce29ff1 100644
--- a/Documentation/devicetree/bindings/usb/iproc-udc.txt
+++ b/Documentation/devicetree/bindings/usb/iproc-udc.txt
@@ -19,3 +19,4 @@ Example:
 		reg = <0x664e0000 0x2000>;
 		interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 		phys = <&usbdrd_phy>;
+	};
-- 
2.54.0

