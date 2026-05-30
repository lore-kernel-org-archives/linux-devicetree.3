Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB74231842
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 05:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780118905; cv=none; b=VIoFgkQ6pHKY09kHpJ4WM3eM0wwG8MNaDp4ZLtyOyOT2qWzfe/aCEHBWZWr0XRBjf9JSl6v80Hr2a6B4zHfbjWtlz6o8t9XipKnsGGz7/gCpnaiXWO1JkhoaHIMxY0HvTDFAgcDrbjqcauUjtgpxZx6JoMeD8eWKT4FeacDoHHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780118905; c=relaxed/simple;
	bh=MktIe/kyYqBWrJCdG9ppZaqxYKeQyaEQWEmvLUbvBxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hoWri9fXpg6XzR/fNH05jqriwfr9HB2q+f/mWGqxCHbID9m3ra2uEMzkuxKqufsNE0l3i04JlCrNZsKBrSePYtGxLNFuLxtsoFIPA4aNgxm/oOPDagvKZ0jUTSgO1IOXTyaLXifUl7LW5nCJufHJgqw3HJWtlX54LGyRFbsvWRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2CZvf+Y; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2CZvf+Y"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so6159235ad.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 22:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780118902; x=1780723702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SmY3471HweDt7C0JbHesY0+I32AoN6OAjy1ZuD0tCcY=;
        b=O2CZvf+YuIWncvTHFQB1uUXaBHOQ7YWgI0qkqd8FIXtken7nfNhlL5eQsAvpg9+pee
         nb9eWQOISoyVeCn/YfmnCd962fT5Zj04jPoOXDzZ/PCL3MMmzgR2SUWHp1aI+13/s6le
         BRQk9+CjfJUHpwC6drl/zmJiLcDHTxQo4oawD5Vlg1LqR6olIFdpLF4RwP7rsTe1acTU
         +F8qp6lFcAhkSJs3TFjoeEDfltIqYyk7HGR2kAMT1w2O4PIOfJ6o1baXHVcrSozDfMhN
         pJoMYtCR3q+hSQVvu3FlDLFHRU+3OfOas104ncRWM6rirMSVJktSGssDlG8OIl6Hcxfv
         P+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780118902; x=1780723702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmY3471HweDt7C0JbHesY0+I32AoN6OAjy1ZuD0tCcY=;
        b=pP6B7b57q9k6BzI+rCKrWfT9zC7vNC6vp6OewUHwBHwy10CnLTR+dm53cTEWBvHubE
         CfXXlquzUWFSGmmQ+XHs0IDb0ippCsPjDmw5rRBlsupQdqfcwARuHJvR/gdiBCqIb5v/
         yflqlPQrgvbA9GK+d2knNCt/QAkPypOePw7BcbyImQShimQN3/a0nzwxXtTlDCsGijay
         XqmJm5tYiOOkmuVcIkRbVDa3+iPGjLXV029gVqaAI+HlqWRdLGzClW1YIKnuehy0BnR3
         N+S+MOGm2xfIxA23G9Y0mmMmuBaoIcAkXt7XAxxDPNSH9VDDbhr27rcEa99ob8pVoclN
         K2ow==
X-Forwarded-Encrypted: i=1; AFNElJ8Gh+02PaDpJ6n1Mvduz6VomEhpFUapOCEpuv3Eb8hRNoooXDB3CKF1uIWa4bQ/F2h/y3fBFexKEUe/@vger.kernel.org
X-Gm-Message-State: AOJu0YwZgjmxv+KLoLRn+TUSuA1jPA48Bes1GtnB+v1VQHPi3OoEMrJu
	Isb0RobkGlJtBdIKDHzimMl26XzmLoklDegpr0NuvF+llYjoA7HpDY6h
X-Gm-Gg: Acq92OGaFHn62A5jombLF8ayWd4EOW4J3HiNHWDXhfrv98xNvw01a3qZLpRmp7bg+W4
	xEOQ2COVlc9fiL+cZrbfEOpeA3j5yBFV4KlwnYTou1i+o9vuTw3cKtUjlDgOhRnxryuhQgdaZy4
	H55/BTUEmVpqupdY8ATJkAQpLLg/bw1L3myCUkby30EMUGTQhbKpA/qGAD9vQx5leTtm5ZM7sD6
	pf1oiswi3vU5LkM8OQQGMF+gFTQNPQ2jRtcnpRF4bFl8UVGkbzfw1vlR2N9rfiSZzsqMDbPoIW1
	qeO9PpaBTQfr/FHIQQGWuATUws3aLMROfOWf79z7gklZjuOPwluIOT1tma53cqRunIPRFqvABwP
	61XYHHhjNMGzGyXla+5pfzdv59QO+kAdqqX0OYYKb3qQQIJ1lOizt0wVCQsN5nAdeBcbZEE/HRq
	HXIRX1i2XQWUVndy2iG6tiBkd31GyZxqP18llLKkA4XS6joEPkUBuXWhMv9VJTC89Mno6rrNB81
	QgHWcUKVyp46ik=
X-Received: by 2002:a17:903:390d:b0:2bc:f202:54d7 with SMTP id d9443c01a7336-2bf3689d80emr35457005ad.38.1780118902331;
        Fri, 29 May 2026 22:28:22 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd6edsm47386275ad.18.2026.05.29.22.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 22:28:21 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: claudiu.beznea@tuxon.dev,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v3] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
Date: Sat, 30 May 2026 05:28:12 +0000
Message-ID: <20260530052812.115994-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Atmel AC97 controller binding from text
format to YAML schema.

The binding constraints were updated during conversion to align with
actual driver behavior:
- Added previously undocumented 'clocks' and 'clock-names' properties.
  These are made required, as the driver unconditionally requests them.
- Removed 'ac97-gpios' from the required list, as the driver
  treats the reset pin as optional, and requiring it breaks existing
  .dtsi validation.
- Fixed the ac97-gpios array in the example to use standard
  comma-separated formatting.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v3:
- Updated the commit message to include the reasoning behind the property changes, 
  addressing Sashiko bot feedback.
Changes in v2:
- Added undocumented 'clocks' and 'clock-names' properties which are
  unconditionally required by the driver.
- Removed 'ac97-gpios' from the required list, as the driver treats
  it as optional, fixing validation for existing dtsi files.

 .../sound/atmel,at91sam9263-ac97c.yaml        | 70 +++++++++++++++++++
 .../devicetree/bindings/sound/atmel_ac97c.txt | 20 ------
 2 files changed, 70 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel_ac97c.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
new file mode 100644
index 000000000000..5f4ebe81bf90
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,at91sam9263-ac97c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AC97 Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: atmel,at91sam9263-ac97c
+
+  reg:
+    maxItems: 1
+    description: Address and length of the register set for the device.
+
+  interrupts:
+    maxItems: 1
+    description: Should contain the AC97 interrupt.
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ac97_clk
+
+  ac97-gpios:
+    minItems: 3
+    maxItems: 4
+    description: |
+      AC97 link GPIOs- sync, sdata_out, reset, and optional sdata_in.
+      The driver primarily uses the reset pin.
+
+  pinctrl-0: true
+
+  pinctrl-names:
+    const: default
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/at91.h>
+
+    sound@fffa0000 {
+        compatible = "atmel,at91sam9263-ac97c";
+        reg = <0xfffa0000 0x4000>;
+        interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+        clock-names = "ac97_clk";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_ac97>;
+        ac97-gpios = <&pioB 0 0>, <&pioB 2 0>, <&pioC 29 GPIO_ACTIVE_LOW>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel_ac97c.txt b/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
deleted file mode 100644
index b151bd902ce3..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Atmel AC97 controller
-
-Required properties:
-  - compatible: "atmel,at91sam9263-ac97c"
-  - reg: Address and length of the register set for the device
-  - interrupts: Should contain AC97 interrupt
-  - ac97-gpios: Please refer to soc-ac97link.txt, only ac97-reset is used
-Optional properties:
-  - pinctrl-names, pinctrl-0: Please refer to pinctrl-bindings.txt
-
-Example:
-sound@fffa0000 {
-       compatible = "atmel,at91sam9263-ac97c";
-       pinctrl-names = "default";
-       pinctrl-0 = <&pinctrl_ac97>;
-       reg = <0xfffa0000 0x4000>;
-       interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
-
-       ac97-gpios = <&pioB 0 0 &pioB 2 0 &pioC 29 GPIO_ACTIVE_LOW>;
-};
-- 
2.43.0

