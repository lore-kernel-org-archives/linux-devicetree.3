Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F103C108B;
	Sat, 11 Jul 2026 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783775947; cv=none; b=b1gDM9Wrr0wjqN4JvDm+gBoeaYEk1U+jA2BN5Li0IUMDVInsTBv80JMj2xb/uGl6L6nca44wwNoI6EEhfQ8j1WJ1lPCy+MSp585x/SJp7Y8yhPhSNouEcpZqNaQ4frCr3EEMxtE1USWFmVbgrEhboJo5cB7fGlHNWNIvAIo/8q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783775947; c=relaxed/simple;
	bh=gOSMSzgqXZSLR1VV4xnhKPBvU4D7j9r0YvjPkTJ88hs=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=imuvXtnyCPjHdodR/9OaVBH58oe7cgwyR739sx0qen1iAfYB0k2fhzQseqkz0zEMGTM/wd0moerqdkM6RndCA6qTms857MWKPWKoXJq09qoZKbs+GQ6LnkV9Me+SEIZGt/ILiSjeoEcdiQgi8N1wJMkxjKnEYuFEeQYlVZccXYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dJARlIwM; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=p/LiqwZC; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dJARlIwM";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="p/LiqwZC"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gy8RK2743z8txW;
	Sat, 11 Jul 2026 15:18:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783775933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gOSMSzgqXZSLR1VV4xnhKPBvU4D7j9r0YvjPkTJ88hs=;
	b=dJARlIwMDMiskPKxMkFcDALvs6IYlECVhSG174zCXcIwUC0eOatdc59qi175fRlewHh3sX
	o01ndmd3p2cjVhGIiZaSjRUPz4ng8u+ZthtU580JsNklf1R+Go+phVnKgPp8s3UCE65Gd0
	UijhcNca/cxzm9pONylSuas91leiRJFJtpwFwvgOdamr/857R7Yh/N2Jk3JXolRMRqVOxn
	89bq+RQig9bGHcP9h+a9BCs/u/loX+Zoy90svvJuT1LtXDn6APTkt7lb81kUe5YcxMvogC
	AYOF7BLNXDOlbzv0kmwq2aH0iMFtYWgy55dCafIeWoT/iInSzm5DEL9l9fgDSg==
Message-ID: <3f51a907c0a5e9c44d169d67d43ebff36f8f42c8.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783775932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gOSMSzgqXZSLR1VV4xnhKPBvU4D7j9r0YvjPkTJ88hs=;
	b=p/LiqwZC5IS+o00TzriDhyYa1vuvm/nv5hdzZjgRqQndOqQ6uGlDrmzIksLejdD++cJbu/
	0+nJmYzsqNHvBuPRIvcx9mB1kYVbCXSJBCRkkdu7Gra4VZmWx5YGdMwmkz2EYK2laPahId
	Gau3LuKeTNhP6UTQn+c7EBcIEFf8MPTMqTfgxYROayRbAgHLouJ4yEIvDN0HvziP6HL97I
	YcgrhgGoC2wBoImicLJAYT4r1Ug313R4FPiTTA5ynEX4/tvF3fP6jJA46W8DqbdlTm02og
	XBOrBLEL8daashvi3ovkOHOqeGLoB0Bthpv6iPJk/xcPqnfGd66P5aJ7KuCRvA==
Subject: [PATCH] dt-bindings: fix typos and brackets
From: Manuel Ebner <manuelebner@mailbox.org>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood
	 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Randy Dunlap
	 <rdunlap@infradead.org>, Manuel Ebner <manuelebner@mailbox.org>
Date: Sat, 11 Jul 2026 15:18:47 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 98800b465e3ef7a77c7
X-MBO-RS-META: tjy4533gkd59bpptur6aaiiiswuw9har

Add missing '(', ')', '}'
Remove needless '(', ')', '{', '}'
'lover voltage' -> 'lower voltage'

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
Sorry for the noise earlier. When sending "Documentation/ABI/"-patches I go=
t
the advice to send each change in a seperate patch. For ABI it worked very
well. That's why I did it.
---
=C2=A0Documentation/devicetree/bindings/arm/mediatek.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
=C2=A0.../devicetree/bindings/arm/qcom,coresight-tpdm.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
=C2=A0.../bindings/clock/renesas,rcar-usb2-clock-sel.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
=C2=A0.../devicetree/bindings/input/gpio-charlieplex-keypad.yaml=C2=A0=C2=
=A0=C2=A0 | 2 +-
=C2=A0Documentation/devicetree/bindings/leds/backlight/88pm860x.txt | 1 +
=C2=A0.../devicetree/bindings/memory-controllers/renesas,dbsc.yaml=C2=A0 | =
2 +-
=C2=A0.../devicetree/bindings/memory-controllers/ti-aemif.txt=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
=C2=A0Documentation/devicetree/bindings/mips/brcm/soc.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
=C2=A0Documentation/devicetree/bindings/mmc/sdhci-st.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
=C2=A0Documentation/devicetree/bindings/phy/phy-miphy365x.txt=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
=C2=A0Documentation/devicetree/bindings/powerpc/ibm,vas.txt=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
=C2=A0Documentation/devicetree/bindings/regulator/max8907.txt=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
=C2=A0.../bindings/regulator/mediatek,mt6358-regulator.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
=C2=A0.../devicetree/bindings/regulator/pbias-regulator.txt=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
=C2=A0.../devicetree/bindings/regulator/rohm,bd71837-regulator.yaml | 4 ++-=
-
=C2=A0.../devicetree/bindings/regulator/rohm,bd71847-regulator.yaml | 4 ++-=
-
=C2=A0.../devicetree/bindings/sound/mikroe,mikroe-proto.txt=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
=C2=A0Documentation/devicetree/bindings/usb/iproc-udc.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
=C2=A018 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml
b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..cd4040ad3437 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -314,7 +314,7 @@ properties:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: googl=
e,steelix-sku196608
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: googl=
e,steelix
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: media=
tek,mt8186
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google Squirtle (Acer Chrome=
book Spin 311 (R724T)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google Squirtle (Acer Chrome=
book Spin 311 (R724T))
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: googl=
e,squirtle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: media=
tek,mt8186
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 152403f548c3..c7301f1b28c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -9,7 +9,7 @@ title: Trace, Profiling and Diagnostics Monitor - TPDM
=C2=A0
=C2=A0description: |
=C2=A0=C2=A0 The TPDM or Monitor serves as data collection component for va=
rious dataset
-=C2=A0 types specified in the QPMDA spec. It covers Implementation defined=
 ((ImplDef),
+=C2=A0 types specified in the QPMDA spec. It covers Implementation defined=
 (ImplDef),
=C2=A0=C2=A0 Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (C=
MB), and Discrete
=C2=A0=C2=A0 Single Bit (DSB). It performs data collection in the data prod=
ucing clock
=C2=A0=C2=A0 domain and transfers it to the data collection time domain, ge=
nerally ATB
diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-cloc=
k-sel.yaml
b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
index c84f29f1810f..a14be249fa33 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.y=
aml
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.y=
aml
@@ -13,8 +13,8 @@ description: |
=C2=A0=C2=A0 If you connect an external clock to the USB_EXTAL pin only, yo=
u should set
=C2=A0=C2=A0 the clock rate to "usb_extal" node only.
=C2=A0=C2=A0 If you connect an oscillator to both the USB_XTAL and USB_EXTA=
L, this module
-=C2=A0 is not needed because this is default setting. (Of course, you can =
set the
-=C2=A0 clock rates to both "usb_extal" and "usb_xtal" nodes.
+=C2=A0 is not needed because this is default setting (Of course, you can s=
et the
+=C2=A0 clock rates to both "usb_extal" and "usb_xtal" nodes).
=C2=A0
=C2=A0=C2=A0 Case 1: An external clock connects to R-Car SoC
=C2=A0=C2=A0=C2=A0=C2=A0 +----------+=C2=A0=C2=A0 +--- R-Car --------------=
-------+
diff --git a/Documentation/devicetree/bindings/input/gpio-charlieplex-keypa=
d.yaml
b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
index c085de6dab85..c6842c017934 100644
--- a/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
@@ -11,7 +11,7 @@ maintainers:
=C2=A0=C2=A0 - Hugo Villeneuve <hvilleneuve@dimonoff.com>
=C2=A0
=C2=A0description: |
-=C2=A0 The charlieplex keypad supports N^2)-N different key combinations (=
where N is
+=C2=A0 The charlieplex keypad supports (N^2)-N different key combinations =
(where N is
=C2=A0=C2=A0 the number of I/O lines). Key presses and releases are detecte=
d by configuring
=C2=A0=C2=A0 only one line as output at a time, and reading other line stat=
es. This process
=C2=A0=C2=A0 is repeated for each line. Diodes are required to ensure curre=
nt flows in only
diff --git a/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
b/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
index 261df2799315..9e17807d2ce5 100644
--- a/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/88pm860x.txt
@@ -13,3 +13,4 @@ Example:
=C2=A0};
=C2=A0backlight-2 {
=C2=A0};
+ };
diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,d=
bsc.yaml
b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
index 8e3822314b25..30ad2a858844 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yam=
l
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yam=
l
@@ -13,7 +13,7 @@ description: |
=C2=A0=C2=A0 Renesas SoCs contain one or more memory controllers.=C2=A0 The=
se memory
=C2=A0=C2=A0 controllers differ from one SoC variant to another, and are ca=
lled by
=C2=A0=C2=A0 different names, e.g. "DDR Bus Controller (DBSC)", "DDR3 Bus S=
tate Controller
-=C2=A0 (DBSC3)", or "SDRAM Bus State Controller (SBSC)").
+=C2=A0 (DBSC3)", or "SDRAM Bus State Controller (SBSC)".
=C2=A0
=C2=A0properties:
=C2=A0=C2=A0 compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ti-aemif.=
txt
b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
index 190437a0c146..3ec0a43d4e67 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
@@ -111,7 +111,7 @@ Optional child cs node properties:
=C2=A0
=C2=A0- ti,cs-read-hold-ns: read hold width, ns
=C2=A0Time between the deactivation of the read
- strobe and the end of the cycle (which may be
+ strobe and the end of the cycle which may be
=C2=A0either an address change or the deactivation of
=C2=A0the chip select signal.
=C2=A0Minimum value is 1 (0 treated as 1).
@@ -128,7 +128,7 @@ Optional child cs node properties:
=C2=A0
=C2=A0- ti,cs-write-hold-ns: write hold width, ns
=C2=A0Time between the deactivation of the write
- strobe and the end of the cycle (which may be
+ strobe and the end of the cycle which may be
=C2=A0either an address change or the deactivation of
=C2=A0the chip select signal.
=C2=A0Minimum value is 1 (0 treated as 1).
diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt
b/Documentation/devicetree/bindings/mips/brcm/soc.txt
index 3a66d3c483e1..70cd69a4f173 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -45,7 +45,7 @@ each of which may have several associated hardware blocks=
, which are
versioned
=C2=A0independently (control registers, DDR PHYs, etc.). One might consider
=C2=A0describing these controllers as a parent "memory controllers" block, =
which
=C2=A0contains N sub-nodes (one for each controller in the system), each of=
 which is
-associated with a number of hardware register resources (e.g., its PHY.
+associated with a number of hardware register resources (e.g., its PHY).
=C2=A0
=C2=A0=3D=3D MEMC (MEMory Controller)
=C2=A0
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-st.txt
b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
index ccf82b4ee838..5927abf0c634 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-st.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
@@ -71,6 +71,7 @@ mmc0: sdhci@fe81e000 {
=C2=A0clock-names =3D "mmc";
=C2=A0clocks =3D <&clk_s_a1_ls 1>;
=C2=A0bus-width =3D <8>
+};
=C2=A0
=C2=A0/* Example SD stih407 family configuration */
=C2=A0
diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
index 8772900e056a..e36fac92f0fa 100644
--- a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
+++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
@@ -31,7 +31,7 @@ Required properties (port (child) node):
=C2=A0
=C2=A0Optional properties (port (child) node):
=C2=A0- st,sata-gen : Generation of locally attached SATA IP. Expected valu=
es
- are {1,2,3). If not supplied generation 1 hardware will
+ are (1,2,3). If not supplied generation 1 hardware will
=C2=A0be expected
=C2=A0- st,pcie-tx-pol-inv : Bool property to invert the polarity PCIe Tx (=
Txn/Txp)
=C2=A0- st,sata-tx-pol-inv : Bool property to invert the polarity SATA Tx (=
Txn/Txp)
diff --git a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
index bf11d2faf7b8..80ea975697ac 100644
--- a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
+++ b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
@@ -10,7 +10,7 @@ Required properties:
=C2=A0- reg : Should contain 4 pairs of 64-bit fields specifying the Hyperv=
isor
=C2=A0=C2=A0 window context start and length, OS/User window context start =
and length,
=C2=A0=C2=A0 "Paste address" start and length, "Paste window id" start bit =
and number
-=C2=A0 of bits)
+=C2=A0 of bits
=C2=A0
=C2=A0Example:
=C2=A0
diff --git a/Documentation/devicetree/bindings/regulator/max8907.txt
b/Documentation/devicetree/bindings/regulator/max8907.txt
index 371eccd1cd68..b04c9edd3dcd 100644
--- a/Documentation/devicetree/bindings/regulator/max8907.txt
+++ b/Documentation/devicetree/bindings/regulator/max8907.txt
@@ -66,4 +66,3 @@ Example:
=C2=A0...
=C2=A0};
=C2=A0};
- };
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
=C2=A0=C2=A0=C2=A0=C2=A0 then:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patternProperties:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Old regulator node name =
scheme (with prefix and underscores) only
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # ([^y-] is used to avoid match=
ing -supply
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # ([^y-]) is used to avoid matc=
hing -supply
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "^(?<!buck_)(?<!ldo_)v.*[^=
y-](?!-supply)$": false
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "^ldo_vsram-": false
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # vsram_core regulator doe=
sn't exist on MT6358
diff --git a/Documentation/devicetree/bindings/regulator/pbias-regulator.tx=
t
b/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
index acbcb452a69a..09b07f7ab94a 100644
--- a/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
@@ -30,3 +30,4 @@ Example:
=C2=A0regulator-min-microvolt =3D <1800000>;
=C2=A0regulator-max-microvolt =3D <3000000>;
=C2=A0};
+ };
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regul=
ator.yaml
b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml
index 29b350a4f88a..9942ee6c60f3 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.ya=
ml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.ya=
ml
@@ -108,8 +108,8 @@ patternProperties:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Setups where regulator (especially t=
he buck8) output voltage is scaled
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # by adding external connection where =
some other regulator output is
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # connected to feedback-pin (over suit=
able resistors) is getting popular
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # amongst users of BD71837. (This allows fo=
r example scaling down the
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # buck8 voltages to suit lover GPU voltages=
 for projects where buck8 is
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # amongst users of BD71837. This allows for=
 example scaling down the
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # buck8 voltages to suit lower GPU voltages=
 for projects where buck8 is
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # (ab)used to supply power for GPU.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # So we allow describing this external=
 connection from DT and scale the
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regul=
ator.yaml
b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.yaml
index 7ba4ccf723d8..158d749edaa3 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.ya=
ml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.ya=
ml
@@ -103,8 +103,8 @@ patternProperties:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Setups where regulator (especially t=
he buck8) output voltage is scaled
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # by adding external connection where =
some other regulator output is
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # connected to feedback-pin (over suit=
able resistors) is getting popular
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # amongst users of BD71837. (This allows fo=
r example scaling down the
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # buck8 voltages to suit lover GPU voltages=
 for projects where buck8 is
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # amongst users of BD71837. This allows for=
 example scaling down the
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # buck8 voltages to suit lower GPU voltages=
 for projects where buck8 is
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # (ab)used to supply power for GPU.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # So we allow describing this external=
 connection from DT and scale the
diff --git a/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.tx=
t
b/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
index 912f8fae11c5..d6fdcf457926 100644
--- a/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
+++ b/Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
@@ -20,4 +20,3 @@ Example:
=C2=A0audio-codec =3D <&wm8731>;
=C2=A0dai-format =3D "i2s";
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
-};
diff --git a/Documentation/devicetree/bindings/usb/iproc-udc.txt
b/Documentation/devicetree/bindings/usb/iproc-udc.txt
index 272d7faf1a97..6a701ce29ff1 100644
--- a/Documentation/devicetree/bindings/usb/iproc-udc.txt
+++ b/Documentation/devicetree/bindings/usb/iproc-udc.txt
@@ -19,3 +19,4 @@ Example:
=C2=A0reg =3D <0x664e0000 0x2000>;
=C2=A0interrupts =3D <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
=C2=A0phys =3D <&usbdrd_phy>;
+ };
