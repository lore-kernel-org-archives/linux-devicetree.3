Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F9304BDF;
	Wed, 29 Apr 2026 03:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434542; cv=none; b=Q+C+FFwXBnVDHfn/Etl6Uqii0fq+sVdICnyfs8ab9CdnA1ZikJXkUDj9HbSvdklJii6mHuRHxzZ7MIjZD+qSFWIQ5/c9DwHkJFXZACkIwde5aK6wesYnDhzI/pswtwWc31QwLV2Cq3jSRsfOsqbh9tX83egt0mLKT//6pA6Kdf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434542; c=relaxed/simple;
	bh=SaPIU/PqnwS/ORb5gaxG8JWL7ECPawU9OrkzmJNdIYo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTpke9JhlzUGuIJQ/M+Vvti4mz1GMT3qP8BDuxn6XVlmiu9zIGVj3eWqo9KNaIvpal99v8yfU5Cb1qCkKJELAgYmlPTdOYlZQ8o5fzFd6QUZ7WxSlYGXaJqQKt37HVU7RjaSWzcUvdhxTY/gDKUKIVxJ3H1H5V6B+h2Ux7pFthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wHvv1-000000006Vx-0S1k;
	Wed, 29 Apr 2026 03:48:59 +0000
Date: Wed, 29 Apr 2026 04:48:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: drop tab characters from DTS examples
Message-ID: <2044ee0cac191c7be8b6e989fc3c99b24aa4cc5e.1777434096.git.daniel@makrotopia.org>
References: <cover.1777434096.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777434096.git.daniel@makrotopia.org>

YAML literal block scalars cannot use tabs for indent.
Replace tab separators (mostly between values and trailing /* ... */
comments) with single spaces.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../bindings/i2c/opencores,i2c-ocores.yaml    |  8 ++---
 .../bindings/iio/adc/st,spear600-adc.yaml     |  2 +-
 .../devicetree/bindings/input/imx-keypad.yaml | 32 +++++++++----------
 .../bindings/input/microchip,cap11xx.yaml     | 12 +++----
 .../input/touchscreen/ti,ads7843.yaml         |  4 +--
 .../devicetree/bindings/leds/leds-lp55xx.yaml |  2 +-
 .../media/mediatek,vcodec-encoder.yaml        |  2 +-
 .../media/mediatek,vcodec-subdev-decoder.yaml |  2 +-
 .../memory-controllers/nvidia,tegra20-mc.yaml |  4 +--
 .../samsung,exynos5422-dmc.yaml               |  2 +-
 .../bindings/pci/mediatek-pcie-mt7623.yaml    |  4 +--
 .../bindings/pci/samsung,exynos-pcie.yaml     |  2 +-
 .../bindings/sound/davinci-mcasp-audio.yaml   |  4 +--
 .../bindings/sound/simple-card.yaml           |  6 ++--
 .../devicetree/bindings/usb/ti,j721e-usb.yaml |  8 ++---
 15 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
index d9ef86729011..736e9a3eab8a 100644
--- a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
+++ b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
@@ -95,8 +95,8 @@ examples:
       interrupts = <10>;
       opencores,ip-clock-frequency = <20000000>;
 
-      reg-shift = <0>;	/* 8 bit registers */
-      reg-io-width = <1>;	/* 8 bit read/write */
+      reg-shift = <0>; /* 8 bit registers */
+      reg-io-width = <1>; /* 8 bit read/write */
     };
 
     i2c@b0000000 {
@@ -108,7 +108,7 @@ examples:
       clocks = <&osc>;
       clock-frequency = <400000>; /* i2c bus frequency 400 KHz */
 
-      reg-shift = <0>;	/* 8 bit registers */
-      reg-io-width = <1>;	/* 8 bit read/write */
+      reg-shift = <0>; /* 8 bit registers */
+      reg-io-width = <1>; /* 8 bit read/write */
     };
 ...
diff --git a/Documentation/devicetree/bindings/iio/adc/st,spear600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,spear600-adc.yaml
index dd9ec3038703..c8b8f28541ce 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,spear600-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,spear600-adc.yaml
@@ -65,5 +65,5 @@ examples:
         interrupt-parent = <&vic1>;
         interrupts = <6>;
         sampling-frequency = <5000000>;
-        vref-external = <2500>;	/* 2.5V VRef */
+        vref-external = <2500>; /* 2.5V VRef */
     };
diff --git a/Documentation/devicetree/bindings/input/imx-keypad.yaml b/Documentation/devicetree/bindings/input/imx-keypad.yaml
index b110eb1f3358..175256cb1295 100644
--- a/Documentation/devicetree/bindings/input/imx-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/imx-keypad.yaml
@@ -66,20 +66,20 @@ examples:
         clocks = <&clks 0>;
         pinctrl-names = "default";
         pinctrl-0 = <&pinctrl_kpp_1>;
-        linux,keymap = <0x00000067	/* KEY_UP */
-                        0x0001006c	/* KEY_DOWN */
-                        0x00020072	/* KEY_VOLUMEDOWN */
-                        0x00030066	/* KEY_HOME */
-                        0x0100006a	/* KEY_RIGHT */
-                        0x01010069	/* KEY_LEFT */
-                        0x0102001c	/* KEY_ENTER */
-                        0x01030073	/* KEY_VOLUMEUP */
-                        0x02000040	/* KEY_F6 */
-                        0x02010042	/* KEY_F8 */
-                        0x02020043	/* KEY_F9 */
-                        0x02030044	/* KEY_F10 */
-                        0x0300003b	/* KEY_F1 */
-                        0x0301003c	/* KEY_F2 */
-                        0x0302003d	/* KEY_F3 */
-                        0x03030074>;	/* KEY_POWER */
+        linux,keymap = <0x00000067 /* KEY_UP */
+                        0x0001006c /* KEY_DOWN */
+                        0x00020072 /* KEY_VOLUMEDOWN */
+                        0x00030066 /* KEY_HOME */
+                        0x0100006a /* KEY_RIGHT */
+                        0x01010069 /* KEY_LEFT */
+                        0x0102001c /* KEY_ENTER */
+                        0x01030073 /* KEY_VOLUMEUP */
+                        0x02000040 /* KEY_F6 */
+                        0x02010042 /* KEY_F8 */
+                        0x02020043 /* KEY_F9 */
+                        0x02030044 /* KEY_F10 */
+                        0x0300003b /* KEY_F1 */
+                        0x0301003c /* KEY_F2 */
+                        0x0302003d /* KEY_F3 */
+                        0x03030074>; /* KEY_POWER */
     };
diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index 7ade03f1b32b..2d762193f1c0 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -197,12 +197,12 @@ examples:
         microchip,sensitivity-delta-sense = <16>;
         microchip,input-threshold = <21>, <18>, <46>, <46>, <46>, <21>;
 
-        linux,keycodes = <103>,	/* KEY_UP */
-                         <106>,	/* KEY_RIGHT */
-                         <108>,	/* KEY_DOWN */
-                         <105>,	/* KEY_LEFT */
-                         <109>,	/* KEY_PAGEDOWN */
-                         <104>;	/* KEY_PAGEUP */
+        linux,keycodes = <103>, /* KEY_UP */
+                         <106>, /* KEY_RIGHT */
+                         <108>, /* KEY_DOWN */
+                         <105>, /* KEY_LEFT */
+                         <109>, /* KEY_PAGEDOWN */
+                         <104>; /* KEY_PAGEUP */
 
         #address-cells = <1>;
         #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
index 8f6335d7da1c..1b58fc263dce 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -165,9 +165,9 @@ examples:
 
         touchscreen@0 {
             compatible = "ti,tsc2046";
-            reg = <0>;	/* CS0 */
+            reg = <0>; /* CS0 */
             interrupt-parent = <&gpio1>;
-            interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
+            interrupts = <8 0>; /* BOOT6 / GPIO 8 */
             pendown-gpio = <&gpio1 8 0>;
             spi-max-frequency = <1000000>;
             vcc-supply = <&reg_vcc3>;
diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index fe8aaecf3010..67637efac378 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -183,7 +183,7 @@ examples:
             compatible = "ti,lp8501";
             reg = <0x32>;
             clock-mode = /bits/ 8 <2>;
-            pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
+            pwr-sel = /bits/ 8 <3>; /* D1~9 connected to VOUT */
             ti,charge-pump-mode = <LP55XX_CP_BYPASS>;
 
             led@0 {
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index ebc615584f92..4505e66876a2 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -160,7 +160,7 @@ examples:
 
     vcodec_enc_vp8: vcodec@19002000 {
       compatible = "mediatek,mt8173-vcodec-enc-vp8";
-      reg =  <0x19002000 0x1000>;	/* VENC_LT_SYS */
+      reg =  <0x19002000 0x1000>; /* VENC_LT_SYS */
       interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
       iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
              <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index bf8082d87ac0..d1d209cbbd43 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -232,7 +232,7 @@ examples:
             #address-cells = <2>;
             #size-cells = <2>;
             ranges = <0 0 0 0x16000000 0 0x40000>;
-            reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
+            reg = <0 0x16000000 0 0x1000>; /* VDEC_SYS */
             video-codec@10000 {
                 compatible = "mediatek,mtk-vcodec-lat";
                 reg = <0 0x10000 0 0x800>;
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
index 55caf6905399..a33913fcd11f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
@@ -66,8 +66,8 @@ examples:
   - |
     memory-controller@7000f000 {
         compatible = "nvidia,tegra20-mc-gart";
-        reg = <0x7000f000 0x400>,	/* Controller registers */
-              <0x58000000 0x02000000>;	/* GART aperture */
+        reg = <0x7000f000 0x400>, /* Controller registers */
+              <0x58000000 0x02000000>; /* GART aperture */
         clocks = <&clock_controller 32>;
         clock-names = "mc";
 
diff --git a/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml b/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml
index 783ac984d898..4cd5af38abce 100644
--- a/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml
@@ -128,7 +128,7 @@ examples:
                       "mout_mx_mspll_ccore",
                       "mout_mclk_cdrex";
         operating-points-v2 = <&dmc_opp_table>;
-        devfreq-events = <&ppmu_event3_dmc0_0>,	<&ppmu_event3_dmc0_1>,
+        devfreq-events = <&ppmu_event3_dmc0_0>, <&ppmu_event3_dmc0_1>,
                          <&ppmu_event3_dmc1_0>, <&ppmu_event3_dmc1_1>;
         device-handle = <&samsung_K3QF2F20DB>;
         vdd-supply = <&buck1_reg>;
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
index e33bcc216e30..542252168388 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
@@ -125,8 +125,8 @@ examples:
             phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
             power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
             bus-range = <0x00 0xff>;
-            ranges = <0x81000000 0 0x1a160000 0 0x1a160000 0 0x00010000>,	/* I/O space */
-                     <0x83000000 0 0x60000000 0 0x60000000 0 0x10000000>;	/* memory space */
+            ranges = <0x81000000 0 0x1a160000 0 0x1a160000 0 0x00010000>, /* I/O space */
+                     <0x83000000 0 0x60000000 0 0x60000000 0 0x10000000>; /* memory space */
 
             pcie@0,0 {
                 device_type = "pci";
diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
index f20ed7e709f7..57a8f163dda5 100644
--- a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
@@ -109,7 +109,7 @@ examples:
         num-lanes = <1>;
         num-viewport = <3>;
         bus-range = <0x00 0xff>;
-        ranges = <0x81000000 0 0	  0x0c001000 0 0x00010000>,
+        ranges = <0x81000000 0 0   0x0c001000 0 0x00010000>,
                  <0x82000000 0 0x0c011000 0x0c011000 0 0x03feefff>;
         vdd10-supply = <&ldo6_reg>;
         vdd18-supply = <&ldo7_reg>;
diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
index 87559d0d079a..f8a602cee37b 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
@@ -248,13 +248,13 @@ examples:
       reg-names = "mpu";
       interrupts = <82>, <83>;
       interrupt-names = "tx", "rx";
-      op-mode = <0>;		/* MCASP_IIS_MODE */
+      op-mode = <0>; /* MCASP_IIS_MODE */
       tdm-slots = <2>;
       ti,async-mode;
       dmas = <&main_udmap 0xc400>, <&main_udmap 0x4400>;
       dma-names = "tx", "rx";
       serial-dir = <
-          0 0 0 0	/* 0: INACTIVE, 1: TX, 2: RX */
+          0 0 0 0 /* 0: INACTIVE, 1: TX, 2: RX */
           0 0 0 0
           0 0 0 1
           2 0 0 0 >;
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index a14716b2732f..23310f303be3 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -315,7 +315,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        simple-audio-card,dai-link@0 {		/* I2S - HDMI */
+        simple-audio-card,dai-link@0 {  /* I2S - HDMI */
             reg = <0>;
             format = "i2s";
             cpu {
@@ -326,7 +326,7 @@ examples:
             };
         };
 
-        simple-audio-card,dai-link@1 {		/* S/PDIF - HDMI */
+        simple-audio-card,dai-link@1 {  /* S/PDIF - HDMI */
             reg = <1>;
             cpu {
                 sound-dai = <&audio1>;
@@ -336,7 +336,7 @@ examples:
             };
         };
 
-        simple-audio-card,dai-link@2 {		/* S/PDIF - S/PDIF */
+        simple-audio-card,dai-link@2 {  /* S/PDIF - S/PDIF */
             reg = <2>;
             cpu {
                 sound-dai = <&audio2>;
diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
index 653a89586f4e..0aaaadb584e4 100644
--- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
@@ -88,7 +88,7 @@ examples:
             power-domains = <&k3_pds 288 TI_SCI_PD_EXCLUSIVE>;
             clocks = <&k3_clks 288 15>, <&k3_clks 288 3>;
             clock-names = "ref", "lpm";
-            assigned-clocks = <&k3_clks 288 15>;	/* USB2_REFCLK */
+            assigned-clocks = <&k3_clks 288 15>; /* USB2_REFCLK */
             assigned-clock-parents = <&k3_clks 288 16>; /* HFOSC0 */
             #address-cells = <2>;
             #size-cells = <2>;
@@ -99,9 +99,9 @@ examples:
                         <0x00 0x6010000 0x00 0x10000>,
                         <0x00 0x6020000 0x00 0x10000>;
                   reg-names = "otg", "xhci", "dev";
-                  interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
-                               <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
-                               <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
+                  interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
+                               <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>, /* irq.6 */
+                               <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>; /* otgirq.0 */
                   interrupt-names = "host",
                                     "peripheral",
                                     "otg";
-- 
2.54.0
