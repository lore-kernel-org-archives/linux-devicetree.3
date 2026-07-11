Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9772DC79F
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783781861; cv=none; b=nEu3qQSjc3gV1hOiz5w39YaiiALCu+9D5IOhAgmzGq/EYTBtnkW/PBHrp/c5kE2tBYtAkfU1hZJXgdYooRnysqjVpTutMwPa8askRwhF/pN6YcjjrdnEXnnnxu0/VpVWgZ2dayEPE3HX5vnOqT34S7jau0JKFgKJWcWQ60YKILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783781861; c=relaxed/simple;
	bh=yf7IrBvBrKRaoeuR+nDz+T8BMSyugAsap+/X6UxUGtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liY0G1KbBwatdOCq4vpQMHwhM3R4yt9dc495ShPyfPXCTEqq8J49IMu1fvQsqB5ceIucC/lT4z2pZflAgnxtRJHSNKScZe4g1HKetybWvykhMD1SYW21/zE5u8X3AgPEx3HPF4cedJHkF99Zk9etuAMiGw07++AoTMWJVeFyvMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAeSKmoZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAeSKmoZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso17022355e9.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 07:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783781858; x=1784386658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gkj5L9wtCn4YwWm3JNDMgU5Pi28drv8kmdPHyAdRC2M=;
        b=fAeSKmoZQMVGlvmhydBYX1eT0l53+pVTR2rVrphoKvEcoPR/gNYoAKG3fqeuJpqmUl
         QgH0lVj15WrVHNfttVhhRWyquI5ifsIEMBSBWinJW2ITc1ChYfdqAdmyXBK7LsQZ80We
         YbjnUNvAI1AtsaLDBBgs89mFw4nSriWGtyg9HohJHn6ClbeZ8PFSGKqsPvaMUyTD2bod
         XUu6N6Z9qQfS+i2LKYcRCWIySnGxFsAMD+HZyKHcd7rSN7ecpHSNwiQU6qVg94HC9k2r
         Hq2Cff3MO4MZo+L/bHE7BDc3lWTJf61USUxbCQ26jpHbHNmTlJUSTfgK1j1XSFvUrO6l
         Y3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783781858; x=1784386658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gkj5L9wtCn4YwWm3JNDMgU5Pi28drv8kmdPHyAdRC2M=;
        b=apN9wFWC+6DqlePpK7K1W4PqzDCWmm3pH35VGA7yqDTged1p10X3+cj8LL2b440BpE
         lbzFMDqx83UJvBXh+xV9T6POG4ZruprUu+VbF5ZeKe7ZngjrA4RIB74eK8Ki8m0aaWXO
         U2cxphB2AbWLin6kpeZ447jt4qX0Ef7+5XV70h3aVVwINtAog/SJWnSScYvrretAbRkg
         WuyH+ogPeXjgP5No3YYVShBlpecxz6h2OvAWHGoD7UrljsYpmJ3Cv1oseykYfOgyjFKK
         X3Uiig3gwv37TW3pfaWWWNw448mR6q8vHJ/Ardxnxuim3r3tbQBpQPyVzZFBBNdNQ1T3
         GQAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRZ9irPVKYp5kM7ydF+WIzV0m7WPHBrhW81+BL73XN4FZjRSPC98UjOU/sjv8MVP9kiwKYRXFAhTLl@vger.kernel.org
X-Gm-Message-State: AOJu0YzmZpt2qTHxdudzoBKtI08E7F/UwnlKMgLlwVglFweYwMHsSgoP
	FKqgCRxO87qcVltcEfHoLheXc+yRBBJmC2NIy6KadEx5LO/zL3dBuWPc
X-Gm-Gg: AfdE7ckuWh1jalEKK1zBxxCUI5pqoptglT8MoF0b/9lLtXWqcMUoSYBuNcLhERBhO2e
	AbVWhYrAhPuaZvycaDuhpDdFSb4i8lQcXvytum9YeVPuqId+jPvZOmyG62nJHZnPyBXi3Czrunc
	wRkwYDJ1imiu+o9z112AFmCoApu++fJ8FYioRXQUBVCituaxiuHxaXHxFwGyHpzVlvP52rDzxfq
	l+SSc+P5W6RNaTdv+YXNgVSpE5QasPU7bqsOMu90JYt/zU7KtgIPdJHh+jaanOLS/A492xDw5Nw
	1ep9Abq0Pca7s37I5BNd+hU0sqM/J0ORxsP5rWwu3AqH63EL2EJJcld+d0e1j2xToWxukZ/X3U7
	gd5KpeL8ZO7EkZ05UG6FcrHk2ayg/WlfJDkboTWVFdU3GvZKWcxIrka9R+lidvLsBaYO6Ov988G
	WeJXQfABPe6utEAK/AO1d++UI95/qq
X-Received: by 2002:a05:6000:230e:b0:47d:fa32:c895 with SMTP id ffacd0b85a97d-47f2dced65bmr3107112f8f.50.1783781858380;
        Sat, 11 Jul 2026 07:57:38 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:15:795f:9b40:189:2716:6c6b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm67213819f8f.24.2026.07.11.07.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 07:57:37 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	"Wang, Sen" <sen@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Sat, 11 Jul 2026 16:57:20 +0200
Message-ID: <20260711145722.188556-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711145722.188556-1-morf3089@gmail.com>
References: <20260711145722.188556-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the TAS2557 mono Class-D smart amplifier with an integrated
DSP for speaker protection. The device is controlled over I2C and
receives audio over I2S/TDM (ASI). It can drive a single mono speaker
or, as two devices, a stereo pair; in that case the ti,channel
property selects the audio slot each device reproduces and the
per-device tuning it applies.

The on-chip DSP boots from a firmware image generated per speaker
design with the TI PurePath Console tuning tools; the optional
firmware-name property selects a board-specific image.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
v2: add the four mandatory supplies to the "required" list (Wang Sen)

 .../devicetree/bindings/sound/ti,tas2557.yaml | 127 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2557.yaml b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
new file mode 100644
index 000000000000..862ea4036cb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Gianluca Boiano <morf3089@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tas2557.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAS2557 Mono Smart Amplifier
+
+maintainers:
+  - Gianluca Boiano <morf3089@gmail.com>
+
+description: |
+  The TAS2557 is a mono, digital-input Class-D amplifier with an
+  integrated DSP for speaker protection. Audio is carried over I2S/TDM
+  (ASI). The on-chip DSP boots from a firmware image that is generated
+  for a specific speaker design using the TI PurePath Console tuning
+  tools.
+
+  Stereo playback is built from two devices, each reproducing one audio
+  slot selected through the ti,channel property and applying the
+  matching per-device tuning contained in a stereo-tuned firmware
+  image.
+
+  Datasheet: https://www.ti.com/lit/gpn/tas2557
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: ti,tas2557
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the active-low RESET pin.
+
+  interrupts:
+    maxItems: 1
+    description: Fault interrupt output (INT).
+
+  vbat-supply:
+    description: Battery/boost input supply (VBAT), 2.9 V to 5.5 V.
+
+  iovdd-supply:
+    description: Digital I/O supply, 1.62 V to 3.6 V.
+
+  avdd-supply:
+    description: Analog supply, 1.65 V to 1.95 V.
+
+  dvdd-supply:
+    description: Digital core supply, 1.65 V to 1.95 V.
+
+  ti,imon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TDM TX time slot for current-sense data.
+    default: 0
+    minimum: 0
+    maximum: 7
+
+  ti,vmon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TDM TX time slot for voltage-sense data.
+    default: 2
+    minimum: 0
+    maximum: 7
+
+  ti,channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Audio slot of the stereo stream reproduced by this device (0 =
+      left, 1 = right). With stereo firmware this also selects which
+      per-device tuning set is applied.
+    enum: [0, 1]
+    default: 0
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Name of the DSP firmware image to load. Defaults to a name
+      derived from the silicon revision. Stereo systems typically use
+      a stereo-tuned image shared by both devices.
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - vbat-supply
+  - iovdd-supply
+  - avdd-supply
+  - dvdd-supply
+
+unevaluatedProperties: false
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
+        audio-codec@4c {
+            compatible = "ti,tas2557";
+            reg = <0x4c>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+
+            vbat-supply = <&vph_pwr>;
+            iovdd-supply = <&vreg_l6b_1p8>;
+            avdd-supply = <&vreg_l6b_1p8>;
+            dvdd-supply = <&vreg_l6b_1p8>;
+
+            ti,imon-slot-no = <0>;
+            ti,vmon-slot-no = <2>;
+            ti,channel = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..8a824da3979e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26677,6 +26677,7 @@ M:	Sen Wang <sen@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/ti,tas2552.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
-- 
2.55.0

