Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE1D3F54D9
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225570; cv=none; b=qFB3eTBwbhbIL4xyKnRlju0lmZ7biMgB0nMYZZnjZVNIjKfELxHxXzi80T0GYzygI0B+gcp43E/yY2bJf6KOI+SoZgtZmFm0W+do/1y6WImglnnY8fsP3L7aB0NcUl3fjDARRyTOZU6zWEkJ2+QapgCZ99KCLNsZ/CrAJWK8k3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225570; c=relaxed/simple;
	bh=UuR898KEiT0etvcWG892aFyNkNw5Im61er1Rzj1xJ3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nC2h1SzfKMFNHfLRu0MQ1viACNi4FLa923z66QD2p7ZF2JDwejCTMenUpsMc4Vveqbd24rXkEtXaEnB/7weS7eeoba+B6Ga7bBM/1U023MPfjfrZGY6IPRyQryGF80GlHVm7Z/0UbDqW0P3PaG+iJSRXQGSw619J02bzZDW6MkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW87GPvr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW87GPvr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf41bab353so51285815ad.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785225568; x=1785830368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vs25IufisVBAoZjBQMlMsFTHa5QxDB91GfGLQ6eBcM=;
        b=LW87GPvr0yWhScQZa+iZ0EiURw5upBoAhNSMTUpJ22MdPi8Oy3TSaz3hltcVfLAn40
         pilZ8H0+CJ7LDKj5GvqDIhBAkfBF6uO/GNWKuHoXdrORLDyIfWk7JuFx4OGwJQA5SNCX
         mlSVVwPnuP4h9Kf+XV6BtVT5S/hESTG4ysW5rFZn2tlpMIqeW9zenbhVBRiiLTKaq/tV
         x9l9o1lPe8kRIHZX6RWH1MVe4BtrC+/A+mHVeelffQS6rgbbUBC0edWXmJmkpI4Sgeej
         DeMLDTSNQXDRW8GtDCZLA0M7VwUxUZVXJldoV2b41cDBGaSG+S4VC6+A48PypB/3xOrb
         FkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225568; x=1785830368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vs25IufisVBAoZjBQMlMsFTHa5QxDB91GfGLQ6eBcM=;
        b=KI/HLIuGM3l73GDAAB2RbD/oLC1ZufM0g740aZSuWp8K0RM6S9DL0NS5CCEYQ5RF8K
         UM2+9DoBbVppPO9OgU1ayw9diRIt87JetVAE0ebzIL3Y3ZD4IWUROWodvV03c5pQ4PaU
         /S6sWwoRXUfae0RIiAtXF8XjbFGj/O8XuAfVuUs9ujxd3DHeW1kLXAYlYQbzrWVs8yUm
         ZCwOCvJWExMyPz3KJGPliqzGDxCO/hs4R/htJDJO0Dt0NQpRJJsKLbd0jNFijvqWOpXu
         RLStoiLMM0Xw0uAv9cETGHgFQNxh3pjn8nIbXGRIPNFGAe2fmMc6eB3qI1O5Bx1dgLI7
         473w==
X-Forwarded-Encrypted: i=1; AHgh+RqM5GLUuqViSBKFxeVOrxp9V3vMs08/fZLxSHTjyurVXOSRKapERPaJ60zA7Om3qRCmM+H4REwDR1YP@vger.kernel.org
X-Gm-Message-State: AOJu0YzPey4Ri26gyoqT2iOpbTAorsd7aCtYMcjBIWv7g5JVptxXu3nA
	YYRFW3NQQYnMqrEzHnjLEmsgY7aKLKKMOVcAz/46JNMatDwbAXSxy0C5
X-Gm-Gg: AR+sD12V95+5I1q7HqGQ9ojWkwc77BpTHrbNfw1zwDPCHOaKXwDq18GzDUpmZuzYj8E
	Tr78l4esvAc/98yTjcJR9tzTlyhmhzbn9UkP1lxgq7u3AbCKw77QfKyjhr/R6KrpTbynlpGh230
	TT9GiN3h0FWPdjPcYFiNjBTIPyw60QcQ55xYuynZUKMGowQiO20QnsCkG4fDvz2IUbvfbi0gy81
	w2lhV1Z7eFj9TYeMIpyZciYrt0dZ4781Oxsq/Tr91nncoJCrmb2OH5ybSq0M6GjGc3LMrdsLUoX
	G9qeu5G5ZMSHO8Rxt6qXnfK5dRNRE9TJzin55Amo4PyrVHsz6DDzSU+WMbAIKYHv48lmoCFZDUf
	9caLCXfUIL7XODnqpBVsjYjGNCwldMO6FS89UlZKs3NwGP98CubrcVxuDQphJiYvvCp7V+XPNeB
	3d0NMWMls+AMUmHY+VXWJpQIThSrTAIzUAvjigq2hRBQ==
X-Received: by 2002:a17:902:ecd2:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2d015b15c5dmr16733285ad.9.1785225568379;
        Tue, 28 Jul 2026 00:59:28 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d81csm47543915ad.80.2026.07.28.00.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:59:27 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 28 Jul 2026 16:01:17 +0800
Subject: [PATCH 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding for
 ADS112C04
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ti-ads112c04-driver-v1-1-475efe4e2b78@gmail.com>
References: <20260728-ti-ads112c04-driver-v1-0-475efe4e2b78@gmail.com>
In-Reply-To: <20260728-ti-ads112c04-driver-v1-0-475efe4e2b78@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=UuR898KEiT0etvcWG892aFyNkNw5Im61er1Rzj1xJ3o=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqaGHQ5+GCOE3CGZtxx5Pll7ZTJq0JJQH64iIPa
 HQPAPxgNXOJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCamhh0AAKCRClg0K3CVbE
 gWnwB/9wmEDxNIAoEoyp9+ZgJj5Ve+wzwQ8HwUld7kUzHq/+kvWnQ3H/U0xHZqLUuR8HKDCY6GZ
 0NnpiMFlF4sNxE8xo4d/zlgo2ntckoB2usFQej1k98Ii+pavh7QdltPhDEMwu3TEL9Z8AwnvfP4
 aD0uq8g/YVxwUII8SdIUc3ER7kh4P+uX74mAKE0tLqLL6sUKJd/9HuQlVVFCIlBSm8bavFRZAwx
 sKnIsYqHq+pVOClyAUYrDcmknUSRwBprYLUlTzEU3t5Ivt8Kv+XUpHilakD8jegW4WcE+vCw8M/
 27cEnXqK6kxSW5XYLM4Ih25c/w9uMWF270LpIdvHCWU52sIs
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Add device tree binding documentation for Texas Instruments ADS112C04
I2C Analog-to-Digital Converters.

These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
interface, programmable gain amplifier (PGA), and data-ready (DRDY)
interrupt output.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
new file mode 100644
index 000000000000..55842fca1215
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ti,ads112c04.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments ADS112C04 ADC
+
+maintainers:
+  - Kyle Hsieh <kylehsieh1995@gmail.com>
+
+description: |
+  The ADS112C04 (16-bit) are precision analog-to-digital converters (ADCs)
+  with an I2C interface. They feature a flexible input multiplexer, a
+  low-noise programmable gain amplifier (PGA), two programmable excitation
+  current sources, a voltage reference, and a precision temperature sensor.
+
+properties:
+  compatible:
+    enum:
+      - ti,ads112c04
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Data ready (DRDY) interrupt output. It is asserted low when a new
+      conversion is ready.
+
+  "#io-channel-cells":
+    const: 1
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the RESET pin. Active low.
+
+  avdd-supply:
+    description: Analog power supply (AVDD).
+
+  dvdd-supply:
+    description: Digital power supply (DVDD).
+
+  vref-supply:
+    description: External reference power supply (connected to REFP/REFN).
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@40 {
+            compatible = "ti,ads112c04";
+            reg = <0x40>;
+            interrupt-parent = <&gpio>;
+            interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+            #io-channel-cells = <1>;
+            reset-gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vdd_3v3_reg>;
+            dvdd-supply = <&vdd_3v3_reg>;
+            vref-supply = <&vref_reg>;
+        };
+    };
+...

-- 
2.34.1

