Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42152231A3B;
	Sat, 11 Jul 2026 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783777134; cv=none; b=uWBapA+fmhjP2RTyCPLGqsVlgsi/ONzfxpFIEGUeUi0sqORC+ZHzTkxNpCSJ1tCB+RvSWI+M797DXmU7CeutqeltVgGwyctCKrCoE6oe9nsTUWqEGCSXO3c0c4NLsqrP2ov45doRKXofkO/jD85bd/Z7cqoKlP23+LYxVNYww6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783777134; c=relaxed/simple;
	bh=6Li9mobmVhVKMBRPElVkkD0ju6lvyh4JxQ87uZV/C8Q=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=G4fRpbQiWQUu92afPc6kqe27uX/5slN3jvQ2/3CvYeyEyjb0mKO4hBMq9IdNuJI8oH+M7sdC9Lmi3WXfIpYTIqbl7rR1+YKxJEAM9w0QFRJcl5ElwYZSBVWWw3lzfLoGRYn2kWyX+MsG9UynuVp4tD5QGi07HRdwM57M5DikUNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kLXQ9PNo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GpPyFPee; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kLXQ9PNo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GpPyFPee"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gy8tJ6RvxzKnP4;
	Sat, 11 Jul 2026 15:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783777128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=54Lp+46ikacj3JgXIKIRjSM34KQqHhUIhe0Gf7khfL8=;
	b=kLXQ9PNo/Kl8SIAhY3LeGoUOnorYmkx04XjdZr6glILla49wCtzYnh/C3UrrYuc5oLqR4i
	30vT2iPe38xNevN5nl1RkLY1tFf6Dr1RY4J5cFAD9pOjA2AhIBnw+h5aW5PQs876e2dTTp
	KNNw1cjQE12ba7L1ELZ7NTu4FRh6rG1GOlfiifZfLP3D5MuqR1upElC+i2ZKf81JH2vmlG
	Qu+GtF1GglaNsro5cQYH0uqL34W9x12Xp0JnU0FPZDioVvQ8d0okAON1q6J1k2sVKscVNE
	4xC4dDfDwk+IwY9pqYoMm6iWf05w82hJeFRB/yFUe22MSHb89a0m5kauLuYJGg==
Message-ID: <802ebebbf204cbcec5cd73b6b0f19fc8ed10e86e.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783777127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=54Lp+46ikacj3JgXIKIRjSM34KQqHhUIhe0Gf7khfL8=;
	b=GpPyFPee0WNp/ShMkyTqQrpNJasvjvN/sDxO1kI61kSD7nQAkmi9+jWN1oQlo/W8oOAY6e
	qRB9AzYZQ1rljAPriHSMN5hFC7LMQNr9rI5Ev4Lt41sfOouAKy70iQkIScLzIFbFC/BgoW
	m7dl89jfknnQ+I8lxD3DKo+wr5lzpJwaI9rPjCoMt0EAeAelToyOioOFeEa0fn+qmI+z5y
	uGUdiloe3s7Ft2tZOvq+3fEEQ4/IysJg3lhGLneGyUIS+Nixq2HpexvHcwehZ6Xo6rouGo
	Ib3Ibtr9aeruoddyzMJNRnXYPlKUftKooBZqCbir/uF+B81aXaJJATWTy2yOWQ==
Subject: [Resend PATCH] dt-bindings: fix typos and brackets
From: Manuel Ebner <manuelebner@mailbox.org>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood
	 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Randy Dunlap
	 <rdunlap@infradead.org>, Manuel Ebner <manuelebner@mailbox.org>
Date: Sat, 11 Jul 2026 15:38:43 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: i5xk3dhufomdig8mbkdzysj491ir5g3y
X-MBO-RS-ID: be941fa07209a983429

Add missing '(', ')', '}'
Remove needless '(', ')', '{', '}'
'lover voltage' -> 'lower voltage'

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
Sorry for the resend - e-mail clients ...
Sorry for the noise the last days. When sending Documentation/ABI/ patches =
I got
the advice to send each change in a seperate patch. For ABI it worked very
well. That's why I did it.
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

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml
b/Documentation/devicetree/bindings/arm/mediatek.yaml
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
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 152403f548c3..c7301f1b28c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -9,7 +9,7 @@ title: Trace, Profiling and Diagnostics Monitor - TPDM
=20
 description: |
   The TPDM or Monitor serves as data collection component for various data=
set
-  types specified in the QPMDA spec. It covers Implementation defined ((Im=
plDef),
+  types specified in the QPMDA spec. It covers Implementation defined (Imp=
lDef),
   Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (CMB), and D=
iscrete
   Single Bit (DSB). It performs data collection in the data producing cloc=
k
   domain and transfers it to the data collection time domain, generally AT=
B
diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-cloc=
k-sel.yaml
b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
index c84f29f1810f..a14be249fa33 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.y=
aml
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.y=
aml
@@ -13,8 +13,8 @@ description: |
   If you connect an external clock to the USB_EXTAL pin only, you should s=
et
   the clock rate to "usb_extal" node only.
   If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this mo=
dule
-  is not needed because this is default setting. (Of course, you can set t=
he
-  clock rates to both "usb_extal" and "usb_xtal" nodes.
+  is not needed because this is default setting (Of course, you can set th=
e
+  clock rates to both "usb_extal" and "usb_xtal" nodes).
=20
   Case 1: An external clock connects to R-Car SoC
     +----------+   +--- R-Car ---------------------+
diff --git a/Documentation/devicetree/bindings/input/gpio-charlieplex-keypa=
d.yaml
b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
index c085de6dab85..c6842c017934 100644
--- a/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Hugo Villeneuve <hvilleneuve@dimonoff.com>
=20
 description: |
-  The charlieplex keypad supports N^2)-N different key combinations (where=
 N is
+  The charlieplex keypad supports (N^2)-N different key combinations (wher=
e N is
   the number of I/O lines). Key presses and releases are detected by confi=
guring
   only one line as output at a time, and reading other line states. This p=
rocess
   is repeated for each line. Diodes are required to ensure current flows i=
n only
diff --git a/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
b/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
index 261df2799315..9e17807d2ce5 100644
--- a/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
@@ -13,3 +13,4 @@ Example:
 		};
 		backlight-2 {
 		};
+	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,d=
bsc.yaml
b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
index 8e3822314b25..30ad2a858844 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yam=
l
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yam=
l
@@ -13,7 +13,7 @@ description: |
   Renesas SoCs contain one or more memory controllers.  These memory
   controllers differ from one SoC variant to another, and are called by
   different names, e.g. "DDR Bus Controller (DBSC)", "DDR3 Bus State Contr=
oller
-  (DBSC3)", or "SDRAM Bus State Controller (SBSC)").
+  (DBSC3)", or "SDRAM Bus State Controller (SBSC)".
=20
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ti-aemif.=
txt
b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
index 190437a0c146..3ec0a43d4e67 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
@@ -111,7 +111,7 @@ Optional child cs node properties:
=20
 - ti,cs-read-hold-ns:		read hold width, ns
 				Time between the deactivation of the read
-				strobe and the end of the cycle (which may be
+				strobe and the end of the cycle which may be
 				either an address change or the deactivation of
 				the chip select signal.
 				Minimum value is 1 (0 treated as 1).
@@ -128,7 +128,7 @@ Optional child cs node properties:
=20
 - ti,cs-write-hold-ns:		write hold width, ns
 				Time between the deactivation of the write
-				strobe and the end of the cycle (which may be
+				strobe and the end of the cycle which may be
 				either an address change or the deactivation of
 				the chip select signal.
 				Minimum value is 1 (0 treated as 1).
diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt
b/Documentation/devicetree/bindings/mips/brcm/soc.txt
index 3a66d3c483e1..70cd69a4f173 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -45,7 +45,7 @@ each of which may have several associated hardware blocks=
, which are
versioned
 independently (control registers, DDR PHYs, etc.). One might consider
 describing these controllers as a parent "memory controllers" block, which
 contains N sub-nodes (one for each controller in the system), each of whic=
h is
-associated with a number of hardware register resources (e.g., its PHY.
+associated with a number of hardware register resources (e.g., its PHY).
=20
 =3D=3D MEMC (MEMory Controller)
=20
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-st.txt
b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
index ccf82b4ee838..5927abf0c634 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-st.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
@@ -71,6 +71,7 @@ mmc0: sdhci@fe81e000 {
 	clock-names	=3D "mmc";
 	clocks		=3D <&clk_s_a1_ls 1>;
 	bus-width	=3D <8>
+};
=20
 /* Example SD stih407 family configuration */
=20
diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
index 8772900e056a..e36fac92f0fa 100644
--- a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
+++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
@@ -31,7 +31,7 @@ Required properties (port (child) node):
=20
 Optional properties (port (child) node):
 - st,sata-gen	     :	Generation of locally attached SATA IP. Expected valu=
es
-			are {1,2,3). If not supplied generation 1 hardware will
+			are (1,2,3). If not supplied generation 1 hardware will
 			be expected
 - st,pcie-tx-pol-inv :	Bool property to invert the polarity PCIe Tx (Txn/T=
xp)
 - st,sata-tx-pol-inv :	Bool property to invert the polarity SATA Tx (Txn/T=
xp)
diff --git a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
index bf11d2faf7b8..80ea975697ac 100644
--- a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
+++ b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
@@ -10,7 +10,7 @@ Required properties:
 - reg : Should contain 4 pairs of 64-bit fields specifying the Hypervisor
   window context start and length, OS/User window context start and length=
,
   "Paste address" start and length, "Paste window id" start bit and number
-  of bits)
+  of bits
=20
 Example:
=20
diff --git a/Documentation/devicetree/bindings/regulator/max8907.txt
b/Documentation/devicetree/bindings/regulator/max8907.txt
index 371eccd1cd68..b04c9edd3dcd 100644
--- a/Documentation/devicetree/bindings/regulator/max8907.txt
+++ b/Documentation/devicetree/bindings/regulator/max8907.txt
@@ -66,4 +66,3 @@ Example:
 ...
 			};
 		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-re=
gulator.yaml
b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yam=
l
index c50402fcba72..4eb635179b6a 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator=
.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator=
.yaml
@@ -145,7 +145,7 @@ allOf:
     then:
       patternProperties:
         # Old regulator node name scheme (with prefix and underscores) onl=
y
-        # ([^y-] is used to avoid matching -supply
+        # ([^y-]) is used to avoid matching -supply
         "^(?<!buck_)(?<!ldo_)v.*[^y-](?!-supply)$": false
         "^ldo_vsram-": false
         # vsram_core regulator doesn't exist on MT6358
diff --git a/Documentation/devicetree/bindings/regulator/pbias-regulator.tx=
t
b/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
index acbcb452a69a..09b07f7ab94a 100644
--- a/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
@@ -30,3 +30,4 @@ Example:
 				regulator-min-microvolt =3D <1800000>;
 				regulator-max-microvolt =3D <3000000>;
 			};
+		};
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regul=
ator.yaml
b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml
index 29b350a4f88a..9942ee6c60f3 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.ya=
ml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.ya=
ml
@@ -108,8 +108,8 @@ patternProperties:
       # Setups where regulator (especially the buck8) output voltage is sc=
aled
       # by adding external connection where some other regulator output is
       # connected to feedback-pin (over suitable resistors) is getting pop=
ular
-      # amongst users of BD71837. (This allows for example scaling down th=
e
-      # buck8 voltages to suit lover GPU voltages for projects where buck8=
 is
+      # amongst users of BD71837. This allows for example scaling down the
+      # buck8 voltages to suit lower GPU voltages for projects where buck8=
 is
       # (ab)used to supply power for GPU.
       #
       # So we allow describing this external connection from DT and scale =
the
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regul=
ator.yaml
b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml
index 7ba4ccf723d8..158d749edaa3 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.ya=
ml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.ya=
ml
@@ -103,8 +103,8 @@ patternProperties:
       # Setups where regulator (especially the buck8) output voltage is sc=
aled
       # by adding external connection where some other regulator output is
       # connected to feedback-pin (over suitable resistors) is getting pop=
ular
-      # amongst users of BD71837. (This allows for example scaling down th=
e
-      # buck8 voltages to suit lover GPU voltages for projects where buck8=
 is
+      # amongst users of BD71837. This allows for example scaling down the
+      # buck8 voltages to suit lower GPU voltages for projects where buck8=
 is
       # (ab)used to supply power for GPU.
       #
       # So we allow describing this external connection from DT and scale =
the
diff --git a/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.tx=
t
b/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
index 912f8fae11c5..d6fdcf457926 100644
--- a/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
+++ b/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
@@ -20,4 +20,3 @@ Example:
 		audio-codec =3D <&wm8731>;
 		dai-format =3D "i2s";
         };
-};
diff --git a/Documentation/devicetree/bindings/usb/iproc-udc.txt
b/Documentation/devicetree/bindings/usb/iproc-udc.txt
index 272d7faf1a97..6a701ce29ff1 100644
--- a/Documentation/devicetree/bindings/usb/iproc-udc.txt
+++ b/Documentation/devicetree/bindings/usb/iproc-udc.txt
@@ -19,3 +19,4 @@ Example:
 		reg =3D <0x664e0000 0x2000>;
 		interrupts =3D <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 		phys =3D <&usbdrd_phy>;
+	};
--=20
2.54.0

