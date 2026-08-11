Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BD633939C
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416363; cv=none; b=fcISBVFoF9nGc2U+DDJcSvbuOEe8Rk4snqCReY7+wAC3r5Xqux0nhkArOIPxqAcnXq+K2KHUVj96BdkQUMJZQdCt71qVN4rRVa+H1a9nQzYb309AQLBhemqY1iZWFZUvgfKklh5r+OJhFecL+0L4dblDexTDwXKFDOX42Ntgmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416363; c=relaxed/simple;
	bh=1tYkE6Rm1DfrZKIHMjwRAG2g1+xTsNua0nLGrevK7VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcTapcEdUczjHkhWt8ID16tvmfTjuMoPLAcvz/8pYjHK4m1xLO2PMQ20z3tl+mahbiqf3zxEvy4g3vIh27wv6sswYBCwLU+lhVAYWmX91mDCddnv+6wzQBZVXNKKFeiqrgyGVmcFN7eZ3xleFNFfrLk0iYpa9vgfdhq8zQAmFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mO12DUb/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mO12DUb/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cace91f112so29346735ad.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786416347; x=1787021147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIyiGsSgRZb7PjKqMe4zIlr1n1J2HKoXUtMDtA2XkPg=;
        b=mO12DUb/bUfFHa3373xffP0LqYjTcGNpoObQ4CN/4F6F/p2zRPjWSMmHS6GLgtekDD
         9+CAVm4D7qT7lwWu27989cp9HDsJNJAGkHZhMLvUDMYcCYIwLu+4bb7w1vHgj6Ah4w0f
         Nqvxot39dioe8l5OCE4yG5WwdH7Mj3CN7VlENbtBiWRysO1r8Dir9I82r3kkCvdlAiXq
         O9V+c5XDTVvwbp7ogEBt9vGNcz4ugxpk6efZ/XY6PGEU4zl8ZRsycMeYHNdt43Llqazl
         Y7vj5hnv5SvMmcxqe8Fw0fZfg322t3ANUtgT9PuX96Nk8OYjC3Zh5c6Cu76Z+47E8rCg
         3UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786416347; x=1787021147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIyiGsSgRZb7PjKqMe4zIlr1n1J2HKoXUtMDtA2XkPg=;
        b=YjppEsCug87KTtKA0JyHpI7IFJ/wzLUIw9tTGnDnvcpbVyrY3ZOHbpK2qVBJSrXVeD
         IBCyMHfP7EmkwbaDaBGTdDTau/zU4Yt0yuGPqlIK5j3I4tm0bb+Ixufdb4iOTVc8f1lu
         Dq8I47Qi9c/hyNlgh5rB7/LntmxB3BmqY5L3p9NrH/qpWZrJLjL2yt2QJ1uhScTGxYGb
         XBzpE2jvGw5EPpl/marg46r/QgEuig5xongwnAWGI8XwT1XWHtB1V+i05cGBfMhvvNK0
         r1SgKHjIkLL0szVpYTcPEZTnj1dGbIWHVqopsWu5vyaSYaKGYf6EFJVaN0wwcXbk32YY
         +zyA==
X-Forwarded-Encrypted: i=1; AHgh+RozdHfJdSj0c+nOe10zJtY0uXjQ5bAfCQo+VxgO0e/zPvSmNBnKImF3l89c7QMNHOoz2v426XeQQi+v@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTzx4vPI5gB7PSLrKvFTiPw03wwjKPt9z1WqOJJIVIkpLR7yK
	F+kz8Q5a23dt9FZZODvfRocK7BkDKeJpgVvU8eV/jxxrSeU+bHQ3Jrnn
X-Gm-Gg: AR+sD12k+NVy9hlxcjWbAVD0iGjGAly6WT8w/reo0vX5lNOAv++H8WRTRkorZab1uWA
	3+moHGD2BTB3uCMss44R0Iwe+NRfe/VobYtExCQcQIKEU30xaTwF1uiVYh8rzXMip2mdeASh5Df
	HS4+YQeE+SAkyxSIdtEqNOeD9jLqYKVwSSrKS7Mm2/qRqPq5bpgY0ANmYrhlBTnMbKW+dgP8CuR
	Y/u98KmUxB0IxxfxVNBjXEgSMwughAj/uW73Sjq9eKT3jWgnI/YnF6TGTDjvCcHsc5kskuzx4hb
	carrXVz9s7TUUl98iP5AdcQixm3IwobnC0EMQvvMVmTcGgmtLWX9bOIdj8wHyk87qLiqBKqaAo0
	txLQfT3MR0WRRdutaVh0yHXAmzsImouenLQBpfBZKoO1FmU6ROE/e9lZ8wRu3DKYxRdMTxVsBvF
	burgKfZPMQJ9X89J0r9X2MM+EadWBNBj8exyF1wQfkHxukGc7OVVcSXLaUVrr2MDEmrEwh1Mfor
	QTEGwHxgpLZKTh8MOK6sQ/ta5RF
X-Received: by 2002:a17:903:3c63:b0:2ca:6c8:abde with SMTP id d9443c01a7336-2d3179240a8mr3048105ad.18.1786416347443;
        Mon, 10 Aug 2026 19:45:47 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d31623091dsm470185ad.77.2026.08.10.19.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:45:46 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 11 Aug 2026 10:48:37 +0800
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ti-ads112c04-driver-v4-1-ae704ac17241@gmail.com>
References: <20260811-ti-ads112c04-driver-v4-0-ae704ac17241@gmail.com>
In-Reply-To: <20260811-ti-ads112c04-driver-v4-0-ae704ac17241@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5286;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=1tYkE6Rm1DfrZKIHMjwRAG2g1+xTsNua0nLGrevK7VA=;
 b=owGbwMvMwMW4tNlpO2fYkUbG02pJDFlVvZ1n+iP/VuevePiaX6r5+crL4Wc2fdY3S/031fbLF
 G52g12MnYzGLAyMXAyyYoosJ+WO9aY8j/hpeGzFdJhBrEwgUxi4OAVgIjxSHAy78zxTz1hpM3/q
 33rlX4+ekupJvq+WnI8Xr5yTosMvwJBxVjx/9rSJxdeNi/oXsTGqi/X0WzEHnmQ/euK988PphTK
 h5QzOq051PpuyJtOkdLJD8A1ed36ZAKF/e9tdKthUKvpCZEO6fbSuSvgyWhRrZTu9XVqzIpopdF
 8Im3HSoyX/9MTcmvr8/7Tek+5NXiU1982m568MHom9smebn6Cdavjoe4bU/2/vanbcVVGbojKLQ
 1Bz/SLRTy6m+zy9v8yefrZ7FVO/p42IpPVag11Xj+hWhlR/nKsk0Bk10ejSjoN6LCvUj3zbxfRI
 xdXtt8qka6XenTONGrPOT40sLfFddZiHddpxVsGCD1/dAA==
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

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 148 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
new file mode 100644
index 000000000000..68a0df21cedd
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
@@ -0,0 +1,148 @@
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
+    description: Data ready (DRDY) interrupt output.
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
+        items:
+          - enum: [10000, 50000, 100000, 250000, 500000, 1000000, 1500000]
+
+      burn-out-current-nanoamp:
+        items:
+          - const: 10000
+
+      reference-sources:
+        items:
+          - enum: [internal, external, avdd]
+            default: internal
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

