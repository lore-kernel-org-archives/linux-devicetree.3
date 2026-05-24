Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D22314B95
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652409; cv=none; b=JIdFi+Uo0/u9MxAzEJLZ9oqxld8JfWAKnaliBzx6Xa6WT8BpJ+5w2dCd/WHlsns+nyzcFPdR03QxuFSj1abC1rLXaHagL2gPCo5Pdm+jULbSdUs0Q6aAwtnmStp9PV1hTD5QLChkutQNW/CsaYI0PSZKQPVd4ik8i+y9B4IX+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652409; c=relaxed/simple;
	bh=7jRjmR7byF90I5z6f0XKYOOsZQ2tNGR1X41E9TzoQMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VX0nuEI94pG1bX9PXJj5Z9HcPXINldyKpLBkmVHfGH6pwu5wof3v+YFGpEmGHnoovvOisXuhQD+tPAkIUEFnQ9EwRrqIwWN2cQC41bDiNd/OFk+4BSra6ggnPeHzaeNmkzPDllT9hciBi6lO+fXWRTLqNKg4v2Q7JakXOMYTlL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp7zOXwn; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp7zOXwn"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso5850032a91.2
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779652408; x=1780257208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETDhX6hQeHZ88Twc2vJV86bPqeNnna3Es2w6c/Lk7tM=;
        b=Hp7zOXwnOOpcIrbOO+pfwvtVYXZtTpaLrb0Tezy2o4nFV3d0EXHytMFFJCl51cTFXi
         rodi31U1kBpFAsjU7DZPM9xehjhIHfTGlNuL+xETsyDZuPS6LUsQARPGSiJjaSE9fOFo
         cDpZXq1W8g7bpqWrYzXmLMcheAC4DMCCAb05ezkaFbmUgZpLuJcQoNAPh71iDwiOD2J9
         ZHKqrcUjSb0vAwFW6QdYQbVZmxwcsai2hi+H7q+7fMwMyPEjKBZHj4t/sdOkTwL1YANx
         hGauJIyNorWHwlt8JSA4d1aGkXj4zC4hJYfSixM2yqH4rn2etqwVfAaTR5U4ZgHs5gpm
         RHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652408; x=1780257208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETDhX6hQeHZ88Twc2vJV86bPqeNnna3Es2w6c/Lk7tM=;
        b=H5YXO3L0bLC5nKoFQDuHWIxU4Rf1lOagnUOYlyqyBaLtKyDUbCmYWHqqW5F1qBuoQz
         WXg40dd/FaUps9XDvFEJaoo7f1Gm1t7CdFj+C0nhE+B/RuD+wM7C6IJmJRB6Tm9sKDVL
         wfcoB+MJihFpIThysSE4aMddxfCuGQGNbRlfmv/KA6hm+5GGN05fOdkzvLlRywdRTt2Y
         GH/LKLKdd+37nA/TqyfbHW64V4Z1oPXFOiRrdJDyxDJKwkTwKEP8zy6UfWA5z6Srf9xA
         XM1I+xAtjD3qE/8KdahLSAPY5pHGcms/OQ4U8ejo5DP0PsYSTN6+4SA36TfoTtlQrvVM
         NkCg==
X-Forwarded-Encrypted: i=1; AFNElJ8DSwahyyaL8fxm+UqVHiIYJ4P8bgEBjgigKdaiJx/okNDFCfOd3NYrjfkpb6ALecCD4ZybTgh3ACyQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0ULVZZq9mrYes6zHGL/b0oeIUIJrfdccOweXay/Jd/gUPcp5
	fNXROXe0r77EkBz9Oj0v+MuiE4ig7gyWSEO6i7hVxOknfqkOFKwtPBHk
X-Gm-Gg: Acq92OHpmKGXQTWSHSY7HKsgW8ynliXwpRC+olSIqOFNoPYX4yFjoPyStJqEGcKgJEk
	HQqyDnWU//H3/nv+LkYoSlx2QsfXuRomQlOdlJ4+53GbsTIpK+8TT1VdkoS/5ljtlZM+Ivcy/Wo
	ZoKPVSXsMqptRmLPF9ugcyV8zbBAbnL9LYpfkwISmcS7rdLunRvi1t9dAPchLa0e1TjcI/mLm3y
	5pzcpG8YBi3Q4y7AYH26TdcZ55s5ybITV+Yi7v73mTx08BfEHsdecvgj/iFvdMrkmpEADOyYJcC
	n62xOrQY1LhtN9BXI5uRHaTzff4+GjxcEcer6j2Jp+mC2SNClCPmBDPXxcMqE+F6nh/r39+PNnJ
	b83RbDqfCu8g4IyJYutvUWPA7HDGSksQtT2xsP6TSqhy/CVTYXbQXLUMAf1oD09N5HhkUJGJrRZ
	PsPo5WChYbNlo1GXwFJo460pDSB0VynkueEHfb5QLLt2gLMe+FGEUaBs90kBERLn4yjWvMHkSfi
	dfe+g==
X-Received: by 2002:a17:90b:2585:b0:366:3ac:f730 with SMTP id 98e67ed59e1d1-36a6788e0abmr10580647a91.25.1779652407646;
        Sun, 24 May 2026 12:53:27 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6d86daddsm3584575a91.11.2026.05.24.12.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:53:27 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
Date: Sun, 24 May 2026 19:53:18 +0000
Message-ID: <20260524195318.112398-1-manishbaing2789@gmail.com>
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

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
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

