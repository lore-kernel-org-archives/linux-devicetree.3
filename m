Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1429B19CCF5
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284612; cv=none; b=UPrs9XfPcZI5TMcKy+t5gq5WYdhGNo+hRsATNj5UpAD/4/KxPCdpcg88yvTBpy5mGHVk1FR8nNdP0aD/8cXIPgqiPYRh+5rFIyJ2orkkzLy0PhNJ2XeRXaSylUnZksgR2k39bdqU2YTJNeqW22UnguWu55McBVCkMH49yei3Rdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284612; c=relaxed/simple;
	bh=0PUkoXhMDarNP9t/5JZNDvxydLZwYMiP1Clat9658yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=op+CfzdhERCIrxJ1PLEsUmpkSE9FdlanTHcyclzOO+8Eu08hqxV9l9IJJa9foKEVCzfUlIgg2FYIDKp59OpdJFrdH9n2GtZP5NE2m7qhMWhZb+kKhlOdVd7+mXrh+zJmA/WodZptInXubRonoFsQtwyOxchqu/IBJQUAP6J+RSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePDfWqKX; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePDfWqKX"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c76b9efc299so4063105a12.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284609; x=1777889409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbGHpgdnNrh8VCIxoCiZ35IAkxAnxOipEdRQVtqttRY=;
        b=ePDfWqKXToKssoSJRTXpp1zcC2bjUAo9g8FIpp81kqamB4B76sZaDU3zh3QD0fEH4m
         fRKDDcghcwhCgZzx6MOIujFEvUD537CGDVHPgZZv4Jr+ij8jRNQTRlLX61z8zq3/F6bu
         5mcgJUXmpAeeve4T/vtxITbxxZQKTuWvGK2BWpsQFCO2gstVENR46My9Ux5GJZI9y/cf
         f8HHRA8D9LgnJNwvkgcfYXR5ad+yer/I1p7dYNr1bgHUlFovUSVZ/imRjvPFEYBUHnvk
         g8Ypomiji/SISgzonPgmUIsHZNn2A92BJZpR3LjtV0PUNAVWj2XLSkiX82W1fbUidlTq
         2sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284609; x=1777889409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DbGHpgdnNrh8VCIxoCiZ35IAkxAnxOipEdRQVtqttRY=;
        b=ZLPkfsImF/mrl23xUSFA70HS0RqGrzHwVAjQLnyRq/pYeouYSKNbzJeFJDOjCPWgCJ
         3gFVpVxwa4dNDWl6EEH4IqLhLrQsI5t/1d42UbsVBKyHSBDpvgERNKra7U0j2RedLoMZ
         j4oKF4yMliXzh0G7ytNACdNav2xFIfXst+uf3XVnKhCFqiNX9kK1iBj4Udoaf/6z6Oc2
         9GUxPGEqw7ukize2uBw2aBvxcy8YqoukUkoHUyPU0P7D2ICSlXYOaGFzwvPIsLE/sG3f
         cVwYKTXRRbo32gp00S4kjOxzdL4E+encEmRl2TXHKceiX+v0EgFD7rFAM7Z7xOC6iucz
         5PcA==
X-Forwarded-Encrypted: i=1; AFNElJ/LY19VRnGmeQVealZBbUfe1THT1Q922y3a9XKtN6AUSPXWPjoWlNAN/gxpmdPZxoDf0bDfTHDzp6bC@vger.kernel.org
X-Gm-Message-State: AOJu0YyRPEIfYXprVvY/OO9RNx6Gz+0pZbn42uV9mbjueSQOJyDvbSim
	L8BIgHBsDgmj8BTIlwudgyCQrwzWbOsCq9MQiJuIMvNJ97Z0hAOaLfdi
X-Gm-Gg: AeBDievimTgw6kbNg6k5kXiYrqU6CLKw3P5+mgo+KTLpjBZt4R2y47L6lK+dL00Jwkr
	uEqoOoZzDCEDIyhdFzchcJSdZ/iT7seLNhYdZ5Cx078uIzk38gG1bQPc1aERUZ/XhyYS0EJwuy1
	vaubUqTNz9NUKKvB/At0DFQHz9VmV5Qtmg91+ZtbQZSZ0wW2NGtnj8/XwYtVMKVjwlWjl+20JNH
	EygqB37Ef/RDPmWnKKVkY8z1eE58nIKnNIQl6pXf/zmIful6d3S21zKc0XMG9e9KN++bSo92yi0
	YkkMGPdw5JnDid7JgypIDLs+r4Uej8yQrH+nes/Hlew8p5VrlQHzlpKtp5oPsfhJMhzOE3DMGMx
	o4eWKrACiDLv4CEPe9G0m90fSr9LiLPfRuSQYCGCxGGZg+jCt655cMYEQXTpIAXsTr0a1QyfRHM
	BWozZv/PucIPVamLKnVsxVQX7ZTmDohL0PqpY11luxAPrNEL1aRBLs5zoOGAIhevAq/71zwq1Ru
	2frASpkbd1RKFhznXiOdiuhLeE6FQ+BBBbqlYO0jn1is5yQBA==
X-Received: by 2002:a05:6a00:3397:b0:82f:6c31:51f5 with SMTP id d2e1a72fcca58-82f8c830364mr47167373b3a.3.1777284609395;
        Mon, 27 Apr 2026 03:10:09 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d016:e577:22da:dc9:7f6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm39534225b3a.38.2026.04.27.03.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:10:08 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] dt-bindings: iio: adc: avia-hx711: add avia,hx710b compatible
Date: Mon, 27 Apr 2026 15:39:32 +0530
Message-ID: <20260427100950.33936-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427100950.33936-1-piyushpatle228@gmail.com>
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HX710B shares the same two-wire interface as the HX711 but differs
in its channel and gain model: gain is fixed at 128 and the number of
trailing PD_SCK pulses selects the input channel rather than the gain.

Add avia,hx710b to the compatible enum. Document the chip differences
in the description and add chip-specific supply properties (dvdd-supply,
vsup-supply, vref-supply) and a rate-gpios property for the HX711 RATE
pin. Add allOf constraints that forbid HX711-only properties on HX710B
nodes and vice versa. Clarify the clock-frequency description to
reflect its actual purpose: controlling the SCK bit-bang timing.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v4:
- Add vref-supply for the HX710B VREF reference voltage pin.
- Remove dvdd-supply from the HX710B forbidden properties list; the
  HX710B has a DVDD supply and the DVDD-AVDD channel relies on it.
- Add allOf block forbidding vref-supply on HX711 nodes.
- Add an HX710B example showing vref-supply.
- Update description: avoid specific channel-number references in
  hardware text.

Changes in v3:
- Drop the vref-supply mention from avdd-supply; no such binding
  property exists.
- Drop the clock-frequency sentence that repeated the schema default.
- Restore the example node name to weight.
- Remove the separate HX710B example.

Changes in v2:
- Remove driver implementation details from the description and describe
  hardware behaviour only.
- Drop unrelated punctuation cleanup.
- Add dvdd-supply and vsup-supply optional properties for HX711.
- Add rate-gpios optional property for the HX711 RATE pin and forbid it
  on HX710B.
- Add the allOf if/then block forbidding HX711-only properties on
  HX710B nodes.
- Clarify clock-frequency as SCK bit-bang timing, not a crystal or
  external clock input.
- Sort compatible enum alphabetically.
- Remove redundant example comments.
- Update the HX711 example to exercise rate-gpios.
---
 .../bindings/iio/adc/avia-hx711.yaml          | 82 +++++++++++++++----
 1 file changed, 67 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 9c57eb13f892..fddd296bfaca 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -4,49 +4,91 @@
 $id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AVIA HX711 ADC chip for weight cells
+title: AVIA HX711 and HX710B ADCs
 
 maintainers:
   - Andreas Klinger <ak@it-klinger.de>
 
 description: |
-  Bit-banging driver using two GPIOs:
-  - sck-gpio gives a clock to the sensor with 24 cycles for data retrieval
-    and up to 3 cycles for selection of the input channel and gain for the
-    next measurement
-  - dout-gpio is the sensor data the sensor responds to the clock
+  The HX711 is a 24-bit ADC with selectable gain (32/64/128) and two
+  differential input channels. Channel A supports gain 64 and 128;
+  channel B supports gain 32.
 
-  Specifications about the driver can be found at:
-  http://www.aviaic.com/ENProducts.aspx
+  The HX710B is a 24-bit ADC with fixed gain of 128. One input measures
+  the differential voltage between the two input pins; a second measures
+  the DVDD-AVDD supply voltage difference for battery level detection.
 
 properties:
   compatible:
     enum:
+      - avia,hx710b
       - avia,hx711
 
   sck-gpios:
     description:
-      Definition of the GPIO for the clock (output). In the datasheet it is
-      named PD_SCK
+      GPIO for the clock output (PD_SCK in the datasheet).
     maxItems: 1
 
   dout-gpios:
     description:
-      Definition of the GPIO for the data-out sent by the sensor in
-      response to the clock (input).
-      See Documentation/devicetree/bindings/gpio/gpio.txt for information
-      on how to specify a consumer gpio.
+      GPIO for the data output from the sensor (DOUT in the datasheet).
     maxItems: 1
 
   avdd-supply:
     description:
-      Definition of the regulator used as analog supply
+      Analog supply voltage (AVDD). Also serves as the voltage reference on
+      both chips.
+
+  dvdd-supply:
+    description:
+      Digital supply voltage (DVDD). For the HX710B, DVDD must be greater
+      than or equal to AVDD. When DVDD is a battery rail and AVDD is a
+      regulated supply, one channel monitors the DVDD-AVDD difference for
+      battery level detection.
+
+  vsup-supply:
+    description:
+      Supply voltage for the on-chip regulator (VSUP). HX711 only.
+
+  vref-supply:
+    description:
+      Reference voltage input (VREF). HX710B only. When omitted, the driver
+      assumes VREF is tied to AVDD on the board.
+
+  rate-gpios:
+    description:
+      GPIO connected to the RATE pin (HX711 only). When driven low the
+      output data rate is 10 SPS; when driven high it is 80 SPS. If
+      omitted the RATE pin state is determined by the board wiring.
+    maxItems: 1
 
   clock-frequency:
+    description:
+      Controls the SCK bit-bang timing. The value is used to derive the
+      delay between SCK edges; keep the SCK high time below 60 us to
+      avoid triggering chip power-down mode.
     minimum: 20000
     maximum: 2500000
     default: 400000
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: avia,hx710b
+    then:
+      properties:
+        vsup-supply: false
+        rate-gpios: false
+
+  - if:
+      properties:
+        compatible:
+          const: avia,hx711
+    then:
+      properties:
+        vref-supply: false
+
 required:
   - compatible
   - sck-gpios
@@ -62,6 +104,16 @@ examples:
         compatible = "avia,hx711";
         sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
         dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        rate-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
         avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    weight {
+        compatible = "avia,hx710b";
+        sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
+        dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        avdd-supply = <&avdd>;
+        vref-supply = <&vref>;
+    };
-- 
2.43.0

