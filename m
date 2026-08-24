Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E71377AA7
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561207; cv=none; b=InhHbT6sje6bn0kMnxL/HP0UGibnrLd1wgtapRWshN0JEt2KOyeDqvBakieGAM4vRcy/Rk7HxLuh+QR1JKJDsSIm2xrVHMK4fDwlpb78bTMIyMt+ds+0j9yS0kOQMkLKTHLyyD+LcjiUak+o51tcZKl480z+PKdP7aJLCirhx9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561207; c=relaxed/simple;
	bh=mZLDs79Db2Zx+KUIRqHP990qtmdC8drsa//LHtCDuF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPumUdC2pwjEz8EQRSucl81keJgwvBZf9GYI5mU8Y46UhdZYlClxZLOA8iZLytmjUL4wW4Qeg5bGF0O16uDDxkclVDW6r4KkfENZunIiiBL3HIiaaCTSFt3G6dL9bBweC3FxHp9+brHeOxHBof4TaaO25m5NZwtRAWpkbhcZNwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITmYATLL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITmYATLL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so39166585ad.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787561202; x=1788166002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4kiW1wmf6ThJa6PW0OMOTGTvahVVw3yujYchGBBZR4=;
        b=ITmYATLLQk6xsb4EEWBfg5nbQMVm30HjFM1VVhHGTpfs6nQPwg0PgOwoksiPJ1pJnZ
         xEqiUBQoTVoimEy0pQq8c2caxdwApGhNI4GoECtu7Z0+rpG9QZsFfeUuFB8LPO7UF5ac
         FaE+KcoEr7+J1Td9Cu15utX2kq4I8GY416WDLIJq1jmB7AUvZDmFFUwQf1ke840HDror
         W007obWhp5oAf6j1Z9ZEVvW9bfGeHcP7zUkmrx7NJ1qzw1892Im/ZOWkvZStiiVFLfvm
         kQK/92muSGCTooRqBRW0Eoum9xLHQ9lH+cyW0zhzVXn0uHU4YveWQy1QIaGyDOpnS3LE
         H/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561202; x=1788166002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4kiW1wmf6ThJa6PW0OMOTGTvahVVw3yujYchGBBZR4=;
        b=OoqHB6eg1UwpYT5ssDCo/1VjpANrqLVX7sJIl/HOp1lXnMz+dIwkvw3PMdR9EtrJVF
         fXeOvLtBuqSmQURyITa6Pd7T6JDPXnf6TftE9JJZN9UOoZHXTHwFl82Y1CfnUOFMHKcj
         ZM6flJ+/P7sL/jTxcQ+o14YXtZhD3sSDzmXvrGMTr89kJcdeC+Aa335z7zXy9I5IZEix
         rejZMP3aZJXvUkNtMmAW5ANdD0ELrb5JvYWjiwAjFlmVenm8Eld9CKfdwyOsaOm7Yy+w
         mQkBH9/Flhz2/YxcZtWPuJ8Rpm7RLaAWjwae7z94bSZMKas8qq23gsg1ifNz00BD12y9
         8DYA==
X-Forwarded-Encrypted: i=1; AHgh+RoH5yIQCqrD6Bl0GIQH46jWtrBoUGKBGPBTT9yemcww35qYr6JDOds/BoDlcQC+g+tA65UM7YWX4oi2@vger.kernel.org
X-Gm-Message-State: AFuF++lCMeDbaoTpFw8102LDdqkOGKk4TJGiOTBjRdEaGMZoL2A1M1lP
	k8rBt6P30nuRJwDrIBU7ms5tQ74ZvZoYqGdn00k6kkm501JjIh31TBU6
X-Gm-Gg: AR+sD12qn2+jFeIwIoUj5M/2pjSsch6X3wjVUo7EtRDOnK6RS32p9mQhpq1XJro4PSl
	ez0eR0eNWaLs9RpWK2jcpHoSnwTDKcrMSsO7gIdXVxpq6+Ii8jzzuqcshcLqfadfYS9vmrXGsGE
	yd195dSZ2txDzp5j9eFg7QkEGk8JUK3T3JVWEqe25P912g5lwpeXrGnFH6/yfuphH5I6Hq03tE0
	8WL6PSojYOWLgwVbYAtVzm7ojcEqEG90F85C+UCu2/R70mN/vREoFIcaIjbL7TbGvi0JOadH9+j
	I/ZwZHKmIE5vT2Pk0loG3ZAkv5VmxtfEJVNXEUL2RILJ+trdVgzJ+n5JTXMHDCYiVeUuE66syc6
	FBYOAPO5U8CoXiIcm3o99jrJ2cjF/BwwKijqqWiE+AjaNFqknu8zeH9fs9JO33qMtdSxF+xiY3R
	DNnfQqLn7h9DoMbbVGWdQfVsVP2RVYFn/jTiSIlHKJi8K5/J7Ih/M6zGuubzWNViYbcTUeLv+Hr
	xfh00f8vOw6INmWycKFSxGmQAXO
X-Received: by 2002:a17:903:b10:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d64a9f80afmr469626455ad.0.1787561202264;
        Mon, 24 Aug 2026 01:46:42 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768e9ebbsm15343265ad.80.2026.08.24.01.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:46:41 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 24 Aug 2026 16:49:38 +0800
Subject: [PATCH v7 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-ti-ads112c04-driver-v7-1-6b3c9c87d0e4@gmail.com>
References: <20260824-ti-ads112c04-driver-v7-0-6b3c9c87d0e4@gmail.com>
In-Reply-To: <20260824-ti-ads112c04-driver-v7-0-6b3c9c87d0e4@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5503;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=mZLDs79Db2Zx+KUIRqHP990qtmdC8drsa//LHtCDuF8=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqjAWwm3fjve7AXbTJLgNgabrI2ybDBtcQLkIv3
 Y7IvbR3TCiJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaowFsAAKCRClg0K3CVbE
 gdzLCACTY/SsTMiu26pui6pH+4XJLAlbe+3ypqi+Y7oINPwQB6Ju9h3QBW6x3dwIRPR7Ef85k0M
 uN4zGKwsPY7jyQWeF5yl4UY067G/sgcB1GoQ6tKVnAySTAo+KSM7SdZx+zNP+CvTm2LXUMzLPov
 kPqYmwgMFkrAaCyzOAC9sF8Yg0rAMVxIdX1y0saY0gGe1cGXUUoVT2dfUe9DtFcvpqYO2Jg18Dy
 BCcX1pLafie3nLKIG51lP6jmm46zUsP8xje/61L20bE3mTJOeqOgHuseaxEb3x3qW4pUiu+pY6N
 sFd5l5my3SlSlFgUQqQ1w/A3HULNsBiKSuRl1TJ14FWUaDKR
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Add device tree binding documentation for Texas Instruments ADS112C04
I2C Analog-to-Digital Converters.

These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
interface, programmable gain amplifier (PGA), and data-ready (DRDY)
interrupt output.

The binding uses child nodes to dynamically define the connected
single-ended or differential channels.

Excitation current, burn-out current, and reference source properties
are also included to fully describe the chip's hardware capabilities,
aligned with the ti,ads112c14 binding conventions.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 149 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 155 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
new file mode 100644
index 000000000000..95a123cd7b67
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
@@ -0,0 +1,149 @@
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
+description:
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
+      Data ready (DRDY) interrupt output. DRDY pulses low when a conversion
+      result is ready and returns high once the result is latched, so an
+      edge trigger should be used.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the RESET pin. Active low.
+
+  avdd-supply: true
+  dvdd-supply: true
+
+  refp-supply: true
+  refn-supply: true
+
+  ti,refp-refn-resistor-ohms:
+    description: Resistance of the external resistor between REFP and REFN.
+
+patternProperties:
+  "^channel@[0-9a-b]$":
+    $ref: adc.yaml
+    unevaluatedProperties: false
+    properties:
+      reg:
+        items:
+          - maximum: 11
+
+      single-channel:
+        maximum: 3
+
+      diff-channels:
+        items:
+          maximum: 3
+
+      excitation-channels:
+        maxItems: 2
+        items:
+          maximum: 5
+        description:
+          Additionally to AIN0-AIN3, IDAC1/IDAC2 can also be routed to
+          REFP0 (4) and REFN0 (5).
+
+      excitation-current-nanoamp:
+        enum: [10000, 50000, 100000, 250000, 500000, 1000000, 1500000]
+
+      burn-out-current-nanoamp:
+        const: 10000
+
+      reference-sources:
+        items:
+          - enum: [internal, external, avdd]
+        default: [ internal ]
+
+    dependencies:
+      excitation-channels: [ excitation-current-nanoamp ]
+      excitation-current-nanoamp: [ excitation-channels ]
+
+    oneOf:
+      - required: [ single-channel ]
+      - required: [ diff-channels ]
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - dvdd-supply
+
+dependencies:
+  refn-supply: [ refp-supply ]
+
+oneOf:
+  - required:
+      - refp-supply
+  - required:
+      - ti,refp-refn-resistor-ohms
+  - properties:
+      refp-supply: false
+      refn-supply: false
+      ti,refp-refn-resistor-ohms: false
+
+unevaluatedProperties: false
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
+
+            reset-gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vdd_3v3_reg>;
+            dvdd-supply = <&vdd_3v3_reg>;
+            refp-supply = <&vref_reg>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                diff-channels = <0>, <1>;
+            };
+
+            channel@1 {
+                reg = <1>;
+                single-channel = <2>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 04fa5322d9f7..417d74b6d6cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26987,6 +26987,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/ti,ads1119.yaml
 F:	drivers/iio/adc/ti-ads1119.c
 
+TI ADS112C04 ADC DRIVER
+M:	Kyle Hsieh <kylehsieh1995@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
+
 TI ADS112C14 ADC DRIVER
 M:	David Lechner <dlechner@baylibre.com>
 L:	linux-iio@vger.kernel.org

-- 
2.34.1

