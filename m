Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716203;
	b=EdaUzyP4W41T9Peaxmx7SxQWWod4sFlAw9r86UuH1gRrskrKzqqNIUnJopuOecMcwewA
	 O/gbz4jVC9RlxqNu0MTFPGSEzLpLBFwuHxsjpOYnWWkda059LGcqV/YXArkx6KNhJlinK
	 8oDb/KjTzOl4k93i2ZayJ688g4gd7MLXifJ70Q8PiiWjtc4E+zk2f1GVghuo9+EIFd+az
	 civULi/wuGdkTleSw1g3Cc73bOktMmL8b4WCzmKhpj7GfbZwrIEL0IHe+RRbdo6ttXHcc
	 D0tbMnA6fzrepJXSGwSUkDCfrjUzwc+8E7A+JKDEeonWyeX0hZeuIDxZBFLl3xLWKgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I9bKQN8g3f7XpsfQpR52IE9Iq4xxM0LX7R6BIa4pL78=;
	b=hBUo9XRqePYAnfG1g4/OVBpHDYkvmgk9nchfX8axDU5BRQ0T11BuHrq1TzedNC3uv0EH
	 hl8UUPcon/kCvt2vxRFxT3VrSD1fFZnSrIGnuv1DSPtD/+XF71JWs4RGm8KOSCxwwyqAs
	 Bc4WQz4vPJywt5YwzTdFflRkBWVx1v4PlB3ezk1TmJal3i/Uo+FZG+3q1UVLBBJFDwimL
	 kgtp+XQA2uo0ZBjUIffeUj+1r+/AZ1V5TcosflYK/8lfUXw+V2FQefZlQevZyDyb7DZV1
	 xqUqzlZjcYFbK9Z7sAwXuH+/eNkGKJr3S/+aDjoxF2sk+y5vti1Tt504nQs/o5g+RKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GA9pe8S2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049CE606A33D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 049CE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GA9pe8S2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so19070635e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716201; x=1796321001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9bKQN8g3f7XpsfQpR52IE9Iq4xxM0LX7R6BIa4pL78=;
        b=GA9pe8S2GnC2F9xZxNvpyr3BF1l710P69sQAM8eV8RHAmUzz3h7DIOO1BnTBrqyebp
         qsW763nIsa+a4QUUbmXmH3KGue/E32NVP6N86kgmBhmXdSDBUOV1WmwotGvVcPWZAP/u
         2yGOUT48umXJSU2UKSu0xyL52V1imrCU5m5+uZ5WLDBO/nP1wMdmQQgd/kdpLvIjwBtQ
         QHl5btH4TrGYZieaoT/WSsswgT4iAlJI5kIB18CFta6sZR67m3mlrdHiXQMYQTEkkcJp
         KUE91ziprHVtE2dkZcEe/hA4lOzrI5qUnLbAgkfOljzroSHeLsfCiT6J5LzRUfYfTNg6
         g8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716201; x=1796321001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9bKQN8g3f7XpsfQpR52IE9Iq4xxM0LX7R6BIa4pL78=;
        b=Ma159ao/yw0VuDMLAfqXzANIVHHfKR8aFwk9/4L/Po6Iwm/wcgK/H4+SW1+7b5xoRI
         mroTT85KojeZzrL1HklRSqqy/qZjwxDiuS5ayuHTIhTFqp6czfFaawC0Fw/37rbNXuG/
         +Dm2GlfUOL4zDQCG8fo8mB4e64vEKcb4+FNNoATwP5ZuZq/XfBdVpVLGvb6bDuQ2ewBb
         qE4BKo3ZE0qC0D55Dt4MqoUj1pRt5/3G55z9Q3DMBMAkOlIfxH3Q/oge4tNuEPhXge8+
         z9GxJBDyc8P3NiPcQyxIXu3liWLY1J2YfLkatJOinxzzlgQORBkvN6pjKeqGimOEegU5
         c3eg==
X-Forwarded-Encrypted: i=1; AL+hErEJxa96kfi+GpgdiDfo1NV3RYb0OBkWFei5u71VcSrB4FyAsu+Ac1xkqIPUEdsLshdWzQMs2tQIMVPd@vger.kernel.org
X-Gm-Message-State: APuU4Z/j/H+2LTj3XYPWRhqR5N8KrBUFI/hk1fHDeSEX+KZT84qcW6Wr
	N2aJtZEDVYG0M5+An0tCL5qXI/43gto6ai9VCxVQtHoM3yjptFx8LXk=
X-Gm-Gg: AZFdTZd7ovUDJP0tYsBvNyyl1HIKuRhVWVp0L+V/qC7T5ElGYTd+WwUOOFQ9f3FLmV+
	102Ju4IrHNXz2qqY18JY9DeDwK/BnCDMJPnTnHmPV0x5B4XE8jQ56lAjuobAocX2Lex7fIceqtU
	B9AyEIWmFamfu3e2I9IJU+0POT64E01LPcgbqKxmG4PREUabfWFcWIZNdaPXCVzBW7rDPb78vUv
	W1EGEsxI73EUxOktvzBJ76CCuBxuPPBHKZsTB0aWspLlj0miJ3ibVUnLTd2QxH79/SX63VFIQ90
	SNo809fo+XnX/MK5isffUx3MPY12o/mEmRl2gApH4dWP3L/Zpj4Yae5wSLZwXSdHMjt8S2g3vb9
	1eETBuEg7Nz0QEr/lmoJkdk7j8LhScGIz+czYZi+eVNxeV8KFrh6XNNNFhN0qBLm6ATMiW2FTla
	6QYdSQAXqb/rZElGkaOuePQ78Cd9kFynKH14hpxlV7zOB1zIqzbs6UUVHO5PdzFF8qw4Aj1Qg25
	uhZRBN29cNZyhGwUOp6Z5PS573Hessbg3GyUxmiw7q+6E9q4ppw4UaS3QWCTadKuOCX3Zomcyuy
	139zjKsleb/ZzYnD7YXteJZ+chExBdeCErc0PLMB7cGXcUcwVQFv5NAiDaLnTg/9M+E6bzsWbIV
	eqUuvxV55Ayvn8p2KCtVqk8kmFaWdE5h/sf31jMS8uUeJAvGWQUwX51xfyio=
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb88806292mr454614305e9.15.1795716201307;
        Thu, 26 Nov 2026 10:03:21 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:21 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 2/5] dt-bindings: gpio: Split fcs,fxl6408 from trivial-gpio and add diodes,pi4ioe5v6408
Date: Thu, 26 Nov 2026 19:03:12 +0100
Message-Id: <20261126180315.98034-3-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fairchild FXL6408 and its pin- and register-compatible second source
Diodes Incorporated PI4IOE5V6408 provide an active-low hardware reset
input, dual power rails (I2C bus and GPIO port bank), and an open-drain
interrupt output.

Move fcs,fxl6408 out of trivial-gpio.yaml back into a dedicated schema
to document reset-gpios, power supplies, and interrupt controller
properties, and add the diodes,pi4ioe5v6408 compatible with fallback to
fcs,fxl6408.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 .../devicetree/bindings/gpio/fcs,fxl6408.yaml | 97 +++++++++++++++++++
 .../bindings/gpio/trivial-gpio.yaml           |  1 -
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml

diff --git a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
new file mode 100644
index 0000000000000..5977aa026ec14
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/fcs,fxl6408.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fairchild FXL6408 I2C GPIO Expander
+
+maintainers:
+  - Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: diodes,pi4ioe5v6408
+          - const: fcs,fxl6408
+      - const: fcs,fxl6408
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 8
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low GPIO connected to the RESET pin.
+
+  vcc-supply:
+    description: I2C-bus interface power supply (VCC / VDD(I2C_bus)).
+
+  vddio-supply:
+    description: GPIO port power supply (VDDIO / VDD(P)).
+
+  wakeup-source: true
+
+dependencies:
+  interrupt-controller: [ interrupts ]
+  "#interrupt-cells": [ interrupt-controller ]
+  wakeup-source: [ interrupts ]
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@43 {
+            compatible = "diodes,pi4ioe5v6408", "fcs,fxl6408";
+            reg = <0x43>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+            vcc-supply = <&reg_1v8>;
+            vddio-supply = <&reg_3v3>;
+            gpio-line-names = "Wi-Fi_W_DISABLE", "Wi-Fi_WKUP_WLAN",
+                              "PWR_EN_+V3.3_WiFi_N", "PCIe_REF_CLK_EN",
+                              "USB_RESET_N", "USB_BYPASS_N", "Wi-Fi_PDn",
+                              "Wi-Fi_WKUP_BT";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
index fe9b14a72d698..aca42dd1ad20a 100644
--- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
@@ -21,7 +21,6 @@ properties:
           - cirrus,ep7209-gpio
           - cznic,moxtet-gpio
           - dlg,slg7xl45106
-          - fcs,fxl6408
           - fsl,ls1046aqds-fpga-gpio-stat-pres2
           - fsl,lx2160ardb-fpga-gpio-sfp
           - gateworks,pld-gpio
-- 
2.25.1

