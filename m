Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF54534389F
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 03:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786590196; cv=none; b=YLuxohTmirEHy8aTgSz/NXt5CQ5ygaWJ/0Cqq5i/QqmjXaEbzGx4+bZlbbGgb7IRXoDaYax68poCqmzNqDKv6IWGx2M/uG9IgwNKTdeBr2l4eVQrqJPRrThDH4zcg+jmuyPZ2M2K5rh4pOAR0wOz/QKEgZQ5ZSNLyuu5ulxYro4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786590196; c=relaxed/simple;
	bh=S+Dk0LjP2FtBtdRYlhKcN5jnGUH3EuaODenKZWSMowc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCQ4bwt89lVrNUpypLYJr5E4CyVhd6+hXlcl5LROqoRkKdZX3TRAJtwVPcrxOGJGPdBuWwO11Dt17fCsB4ZN24zJkddsscxoQNn+F3ohw9ZjB6bFQ3ZvGEYX2a8nDCpaMy7/vQUnYSrYTRnmenfiTebfyQNb+xQsFwzDZ8NXRg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBkU+mGp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBkU+mGp"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1456302a91.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 20:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786590194; x=1787194994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h699JProhDKp3MIMt9nw4/C+o75sOR4hsWlNILLfWhs=;
        b=JBkU+mGpNislgQiCOSsO9xS4y3UexM0gyjFntM5NA6EUhHr3JeboX7VBedl+7EBag0
         hFXDxsLR7qZU+lHlm95EunZxI9ivhb4sNE8RV2Ye2C7MDPspEDgIF74Ma3qBic0ytQGS
         wddMjgSe/NkDC5qgFRWo3DHZuM6WMAlkEv8NVRKRQJtisz2orKywwqtYQRqzMdEeE2IG
         s86C1+2KFNFg0/mKOCz40d2yJ/xSxyEotG67zD58fcYeFjIDCcJX7nJFiJ4/vyyyNVC2
         EBgxFYNRlGNnf28TeWO+ff0akWx9dGZCeEk2CnZK1mlFIGJqlzlOVp7alJ1PwLFyzLXi
         0GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786590194; x=1787194994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h699JProhDKp3MIMt9nw4/C+o75sOR4hsWlNILLfWhs=;
        b=d6BoAw3L9UzaYUIBPoYVKrjXRAK3WuLPIjYLMyeSYsJ56CFW6uruRjJ8wVwzLMnhLO
         2Bcgw+zwf0A6Gqno8snrrCqVn5Ey9PSYLDdfjDa1lEZj0nDoAQ01hcn+vB7Gz9co6AxE
         x9TjNINDvTTX2SYvDvDSrXksX3KIAVUWrg7e6gSpoG6cSdiI8fE3/i2/0n1Iu3OWuBJB
         ZMrotQNHzx+T9tpKOveKKTlG48zUubZUl8oCRMsaG3lZ7GLllpsRNyhCt0TgYaqyi24Y
         DHsFKZGZc/QW0Qddfb5kElIK7V4oveJhvaUwxGuAbv/RLUMJc1CNoadaEUmy13t5TXZl
         esIA==
X-Forwarded-Encrypted: i=1; AHgh+RoIRdcDnnemEahMNqZc5kNTLIsCweCZ9wHN37/HqOVvxNEGuGpeWLXAk7glP66Wb+a+7qu8Gt+A+YAz@vger.kernel.org
X-Gm-Message-State: AOJu0YzD31LX70k0ZLSW1kL4BKAMl4lOpUdbD7bYDAbkwBZlhbatL7UU
	gksIyUAnpHgCY9M4X7ifYEjp8pxyIa4M7qnwGyU65EtTgmpqaLezlL+K
X-Gm-Gg: AR+sD11WnuFbJLs9p110Y7SjbHNloRR9LhrR9rFioAhDb6UDSf4FlwdxmFWLjKbTmoO
	vxkKFnvD7Tbq8esKMdEXjSfQrcOy89gFg/nucSy0nwiU+Ug+Mks+3LnL//6tQ2bk1NfOOGwI3mk
	KEOXbFIMwT0ilvDXspFHFsO9kpVzX+SuYtr7FW6yMIypLKtgVMpDUNRFyVy14HKbs4P+siSVXzO
	ST2/k00jhLJZE+SGpjjyvVDUaV5wElmUxoM8I/Gy08TMV1IzE3i0K0lHwK1JkPbfPpoe5CtCeOl
	vJsiDPdTCxLM41yMKrlxX1G0dxgNm7NMNZqh1gfHfkdJO3pqu4xdHL5xZbcSxvRR508ivkhbs6S
	Ap270RPV7VOrE5BczhQY7X/4jKVaqbvexLrGNhwPqQNd5AFEH0u1xAOECdxAgjXXSRZUnwxwl4C
	FwDvuKRPtdk0ycNeWAXhnGMEm7br7Dq7P0DVASTfblFbi4wd3LAo6NSILTmCJpxZvsvrk8iAC5i
	biUQYd3dQ0cpXRRECmIK09124lF
X-Received: by 2002:a17:90b:4d08:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-3931e2bc877mr2602933a91.16.1786590193920;
        Wed, 12 Aug 2026 20:03:13 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d9dc198sm517931a91.1.2026.08.12.20.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 20:03:13 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 13 Aug 2026 11:06:02 +0800
Subject: [PATCH v5 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ti-ads112c04-driver-v5-1-79dff9e249cd@gmail.com>
References: <20260813-ti-ads112c04-driver-v5-0-79dff9e249cd@gmail.com>
In-Reply-To: <20260813-ti-ads112c04-driver-v5-0-79dff9e249cd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5391;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=S+Dk0LjP2FtBtdRYlhKcN5jnGUH3EuaODenKZWSMowc=;
 b=owGbwMvMwMW4tNlpO2fYkUbG02pJDFm1JvOX3lbbslH1lM0J8T3t0uc5Ga0XT2Ha8vJZq1vIB
 fWbDiu/dTIaszAwcjHIiimynJQ71pvyPOKn4bEV02EGsTKBTGHg4hSAiei0czBMDZdytC8RUd9n
 raZ8/d2b+/ZhacoZOnq2EUsPdeiKpPD2XbS0m+gczxlbbPjTKi7jxvZJxalavZbN/jEXTWzm/fB
 zVHRhO3lTQ+vabMnF2b36hio37OqrnoqsvP97q1lNQ9Tc/S9VE93b+kwlfThqVcS/FC3IajnNP7
 Gz/hibePqqFB+NbF6j0LDS/cyP5zjs+pOeV/Kk7IEA8yM+K6UXRco5ghP11Wape3zZyTvp3tzSZ
 vYjPx2ldm15N7HgmXh5wD/OwB3KbslGsidW+IuqyDxT0z0Tfrfa9fi5zb/Ns2/OZa1lyviks/KF
 6ZazNsutUuquMMofKjmt7HDKTDdk5p3DSzZs1d8Y47EaAA==
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

