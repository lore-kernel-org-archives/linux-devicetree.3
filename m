Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7963932E2
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 05:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785908131; cv=none; b=MSIJ5GZneHsDogYI234wTfCdSlFdp4Rmq/hB9FwZ3ajBJ/grURHvyOjWGzGSH7oMFP9OQZM4F2pF6D8ETrrQ9Sxr7FjduGldunaPyPKaKKS6xQJKNGwuVCcLzLshbtyjYj1JLTyoDMhsvEq50nPyOitiG46XN3QIN+ZhaWWEZms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785908131; c=relaxed/simple;
	bh=j33YZ6CfweNN6iiskAYLb8a1L781jvQcgyuM6dGuVh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jjfe5f/A0+Sum2nof9WKfOz27VXOcFypdoK55Wxs8gysJULPrxWCXrrvsTXc2QvcOGtpDwl3oJjuPV10+gZkRQb+BwJT2uu6aIzkXmQCH7+ufpbD9VpXdPQDL30jDyFYgDqD/3gmpqr/0J8/w2HjAzI6Z2IZOeTPyO9zvXhVQm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNfvtXeA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNfvtXeA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caf228a910so5135245ad.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 22:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785908130; x=1786512930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNE+4b0/cY6qO/wMLz1H6Q1CQk2R0SO7Rau9LTG2NX4=;
        b=NNfvtXeABZlbWjhLmRR28slZesuXNf1sRyoUTGpt65NQodyNo2Vk7GI+b0ZUPaML0a
         leQiCAeY8ryvIgFn5HJ5HNp7oK8RjTg10xqBCbZg6arQ16wgIch8Uj0zgpN+gIyQc6DW
         4UAhzfzHUVroZKtSPvCFeNzsUGMZ8YxktnNUER5AudEQfkCVEKeNGAvmVfCO3zE611qF
         TgfSegrWv9xUv9gwGE9HcIK5FpQxa6owR5n7i5CR0SzQaQnjP85u1T+5wWJr+/7fPU0p
         KUXgvIDEc/MDuLYcp0DdwW56Res0EnPbbuhxl56tV2HtDSwaNtlWfdhKnxKld20Ouqt/
         KdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785908130; x=1786512930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNE+4b0/cY6qO/wMLz1H6Q1CQk2R0SO7Rau9LTG2NX4=;
        b=e/0t37pik7Pr5yurziksU04qMiJ9pz1tO8uNPC1KCnBTx09k24gNRHrm8TUSpnqYqp
         NHlRabf+Us0l7r6MJK+xvn0vh4q5Wk2O8l+YV78Z01AqhEfG/ofC3AL8fxBrLR7921Oi
         NPls6QG3s7ZCxM+wpKhYG9/tD0zWbZAb3EPVb4KM4O+9ZQbB3gCU3MOYzmRj31gq6kUm
         1hl/topGzJkCrCt3k5Ux7oTyPrgKUai4fD/kq/qW96tHOH5U2cwtm80UHoZ9HmonB2iv
         sWWxIBX+r7Fhad8PT2lwF7XpQDl2b+P8Nrem7xI79UIDcn4ZIK6MgConaV1fUUE81jB7
         iteg==
X-Forwarded-Encrypted: i=1; AHgh+Rrq1cVMkfpfp8OAXGjWXdesjUwZKo+2k+hmFmwOouZxdjOmLMbF3P8b2iDHgO/erATXVBVtn2r8zZCt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4CorvmhpVmMbBx9i6ir1dgLWdflzUJ/iDLa/0kpyDn10asiL2
	powQ5sTXbF7wlsDJwt9POTAu4ZNPKBxYLCzD22O9XKmX3E4BHGb/UyIw
X-Gm-Gg: AR+sD11hiLvCNOZuNyfmU4QiL7XE7Y/6dRvyxa68EbEbKxJxfEUyfqXQimIFzlqOUqE
	RQgLWS0t2tUZJ7CU3/V3klWW/1dERtTz/hRh5E3EKT5DKWoUHOUMxktnlXAL7S0eKV6Fbu+3DVQ
	WII6Z2UpVdJoRFGlDy6uz20Ewup9VnudlSLI+Die9PnK1jgFrqJiekrCd8+jWulCt96I7gW4IOp
	DTGZ2S1O1fbtUcbMRnn5Oef5vTK2x3qO7jzgIQCz4PtyKClPdnhc+iu78CJfY+lCr8mh2fyLwG/
	2lPLct4HUpseHhktOH7tL+HTEvGgHthNIA3fDBdShZW9hoKLVBqAAryBWkHCp4kraLRFd2dW3wh
	XXqOFAinoKPW5dy16tVzfjelp1R8egmw74kYegzzpgmz1bLVxQiJQHnESsqnZtP/2Xx3iEBhNsY
	ncBCtA15Euo4vmRShFgrK7fNElSZmmin8OQEO4Uv3xW3mEaIgdw6IZvKoXcXYahQEUIRTMHgV7d
	fCp5tm8j5XPYHhnAGC39GiVJVUP
X-Received: by 2002:a17:903:245:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2d0ca7aea8cmr41389385ad.8.1785908129743;
        Tue, 04 Aug 2026 22:35:29 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4c0b1fsm14307245ad.64.2026.08.04.22.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 22:35:29 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 05 Aug 2026 13:38:20 +0800
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ti-ads112c04-driver-v3-1-49f436829e01@gmail.com>
References: <20260805-ti-ads112c04-driver-v3-0-49f436829e01@gmail.com>
In-Reply-To: <20260805-ti-ads112c04-driver-v3-0-49f436829e01@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4388;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=j33YZ6CfweNN6iiskAYLb8a1L781jvQcgyuM6dGuVh0=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqcsxNtFIVsPYwl01+sisYtA9hsX6zcsHULxjdP
 tAVoxJTnw2JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCanLMTQAKCRClg0K3CVbE
 gTSgB/9zrSTVPQrZRhQcdxl3WpBFrlJatlJYeeHWVcq3u49ZhHJayV3cfuK0y//zvq8b6RdXIy1
 ZHtIp/4HklBEk+PzOB5JjfNpJ/EvKEqjyOVL0ykmB4M8UhxXYeIifSMl7V5e7Bt0MNbMK4vghS0
 QVKXGW7ckeki+9Eu9HubbLiqj4RubSOGsFDjoymW7h4JWSssbiekVIKjLWn27NDaT0OtxNCmqg3
 i6OeblihpoTT17YrEKakFiwNKD2liM7Z473S5HT6FRi6Nvmwet6xt3kDWJkWnuWNF4iABzmU0Ic
 Naq0SpVeNmw9BpbaWWsIp3sS/9yuXZWmp2AITYAPj+gFBAnt
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Add device tree binding documentation for Texas Instruments ADS112C04
I2C Analog-to-Digital Converters.

These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
interface, programmable gain amplifier (PGA), and data-ready (DRDY)
interrupt output.

The binding uses child nodes to dynamically define the connected
single-ended or differential channels.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 146 +++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
new file mode 100644
index 000000000000..ff079bb5b3dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
@@ -0,0 +1,146 @@
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
+          maximum: 3
+
+      excitation-current-nanoamp:
+        maxItems: 2
+        items:
+          enum: [10000, 50000, 100000, 250000, 500000, 1000000, 1500000]
+
+      burn-out-current-nanoamp:
+        items:
+          - enum: [10000]
+
+      reference-sources:
+        items:
+          - enum: [internal-2.048v, external, avdd]
+            default: internal-2.048v
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

-- 
2.34.1

