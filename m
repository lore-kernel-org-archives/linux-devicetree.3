Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D537DEB2
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317863; cv=none; b=u4UYM4dlWyTq/V4vyosh7MnNHilsGU2ryunGMC0IK19Hmbf/9NqOPWgHk+p0wKrbeBLA9f7pw6sNtKD1qFnOpTjLPVCRB2861ltcwOF2lRb2oCOWV5OqbPuQjF6nHAx5qaEZdrb1WLVy8WqEdmc8u/LBFoguCy39T07U2Hs6e4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317863; c=relaxed/simple;
	bh=ND4t+afKTeWJNKvkfd+bkaxZPQtRVRH6YSMWkHeH59w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fkF6UgDZFsobhBzrDgcDfLc/qL28mY6GeoZqCwc7CdzypJFpnfJc0p/36Qg/ZMH1oaHRJ1HgxKETuMNh/bTT03TLc7Qb0OCGuEqPhW6FuzdOtLWdAhMyWgbm04YOTFP0HInDsdLbpu+YILatd8S281HT9JQDV1TaM9yWKZYbyKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeROmTH3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeROmTH3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c214321dc32so194592866b.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787317851; x=1787922651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSblcr0CCEdB1oJUM1Wum0cFSHQwfMNAeMnxc8Z942I=;
        b=DeROmTH3mhek7zKY/W4TO8o9ycL+iWZ4KYO/55JbK3NQkef9AEOdm+fUFKl+jqpFgC
         smCnKSwjJO5AXQfWe33EeQVmp1n1uKmScMmpw3uaFYSNM5HTF45ybfq8SqA7EZ4Hz4WD
         EkKDd231PYGjHTSMHsNXM6phiOug97WR5AR0tQX3j6JuV0ocGmmBvZnUnje6ekO9BWk3
         AKROKGYyTR5Kd4AkXXo2PYV/CFfg8rtiKKHLMpwMX0FMDgYKtb2BT6V6FtrgDtobHnGO
         IURDFynWa1zpxqv3DxHnRd/TyFIhGya75v3+4IpJahWnIEhYcpoWQWPiouy9LcF53VSj
         NSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787317851; x=1787922651;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HSblcr0CCEdB1oJUM1Wum0cFSHQwfMNAeMnxc8Z942I=;
        b=rpD6TTt//nPLsApzgqoK9KJMcygQqVhKiF5X8uj2T2VGuLN6PBIf55CuJrD8w8K4c4
         YFUzJR5ahQa66GSr950OI5cx0RDJOUYpAUmfpNKAvPsw1VwOfiKSZNq5DaFI9+k5ziRe
         3oMwi9m0gGSjc6lc176kTze3a1ki6A9MTmKBI5RjooQXpN47WDR4gkr14lF1apaTjK7M
         GDcJ8AdlpSGpvnwBK5m7QQtzrk68P354hVMmbn3VJk2O76ctbRc0hTqauESkbsAZ26p1
         8dCDacIncfe4vt+RdmfVksXC0ZQopAuvCrEGs5SiYm3pOwdcIlUgCGRy7sw/kMNyxwDF
         EGxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rreh1hIBukXuyGiLP2k5bAZZ74kYqUAonLICLr90RQnA+r1n8PRgZSe9H//uZXxOAXdd204aeID56+M@vger.kernel.org
X-Gm-Message-State: AFuF++mjf0m95caNnVyi2ci5qfvnIwy6u/T+vSMHgulwkjEE9hULJuFI
	Iqa4idU3Ssh3SYbW0sWrCYVAMLIpSvrJLUPDJL+OfP9mpR6R/OTuqsCM
X-Gm-Gg: AR+sD12m4JRCk3vVLO1u4SP0Ra/VhTMyUdddOftdsBRnewHnw0FlzL6b3vcRtACwpjq
	DiwS7gqcnBVPVOn2yOWVdlR+jf5pkrMQSPhzC5r/NH9t8CzilpbRlRvZQHtS0OXjdaiqjG38s0k
	n7bCzjY3Je/5TjqsrvTFSNmuuBWKW0WTA9zQY1ZOc/u61fD2Kb1ppjsWvif3655opHDyEgBchjA
	bhvS+9EyIxq6XIMAE0mCvMb/ZbSdHscQBYtVaIC2uX8XkRaQnyC5B2kFOUpvuPO/icdUegqqc5o
	XmZ0g3vbpRZWUCzudDgpbXL/oJKNQgIMyI7d6SQXwmBBdpqspntmnECfA2adHNNv6Sq6jxKrx/O
	kQyKOQCIKms7pcUWwVUqpT9d+q6c57cm6g1nx8iyUDfoCQvlL+WtsNaiJrHH1VvPtdeXsVoFaIf
	0vd0AqQiUgrgkZqmhNsd1VitlR33DfRpiMN7OerbYlHhqN0+uBA3qtKWTYOJaDFCL3br+hNGvUD
	PE6cyKH8uhx8yDzz20jkGjt21rkyNJSXyymJCOORlC65xcRPefFO3yHU3X4OAyZquqCeF5cvkK1
	1wDpe0X9+1JLmBevMcm/njca0RnJ7M4W/oHe/YjgXIPVpFjFkIPM6IFQYrKMXoGgR8Inak49wzY
	ECdyKqA==
X-Received: by 2002:a17:907:9603:b0:c07:43ed:1b3e with SMTP id a640c23a62f3a-c2469f9a365mr727120166b.0.1787317850935;
        Fri, 21 Aug 2026 06:10:50 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459197cc9sm468761466b.31.2026.08.21.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:10:50 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] dt-bindings: input: touchscreen: convert sis_i2c to DT schema
Date: Fri, 21 Aug 2026 16:10:39 +0300
Message-ID: <20260821131039.37525-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the SiS 9200 family I2C touchscreen binding from free-form
text to DT schema format.

While at it, fix the example which referenced a non-existent
"irq-gpios" property; the driver looks up "attn" via
devm_gpiod_get_optional(), so the correct property is "attn-gpios".

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 .../input/touchscreen/sis,9200-ts.yaml        | 61 +++++++++++++++++++
 .../bindings/input/touchscreen/sis_i2c.txt    | 31 ----------
 MAINTAINERS                                   |  2 +-
 3 files changed, 62 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/sis,9200-ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sis,9200-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/sis,9200-ts.yaml
new file mode 100644
index 000000000..5c4806348
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/sis,9200-ts.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/sis,9200-ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiS 9200 Family I2C Touchscreen Controller
+
+maintainers:
+  - Mika Penttilä <mpenttil@redhat.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: sis,9200-ts
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  attn-gpios:
+    maxItems: 1
+    description: GPIO pin used as the attention line
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO pin used to reset the controller
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
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
+        touchscreen@5c {
+            compatible = "sis,9200-ts";
+            reg = <0x5c>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_sis>;
+            interrupt-parent = <&gpio3>;
+            interrupts = <19 IRQ_TYPE_EDGE_FALLING>;
+            attn-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&gpio2 30 GPIO_ACTIVE_LOW>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt b/Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt
deleted file mode 100644
index 8f5322e01..000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* SiS I2C Multiple Touch Controller
-
-Required properties:
-- compatible: must be "sis,9200-ts"
-- reg: i2c slave address
-- interrupts: touch controller interrupt (see interrupt
-  binding [0])
-
-Optional properties:
-- pinctrl-names: should be "default" (see pinctrl binding [1]).
-- pinctrl-0: a phandle pointing to the pin settings for the
-  device (see pinctrl binding [1]).
-- attn-gpios: the gpio pin used as attention line
-- reset-gpios: the gpio pin used to reset the controller
-- wakeup-source: touchscreen can be used as a wakeup source
-
-[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-[1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-Example:
-
-	sis9255@5c  {
-		compatible = "sis,9200-ts";
-		reg = <0x5c>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_sis>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <19 IRQ_TYPE_EDGE_FALLING>;
-		irq-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
-		reset-gpios = <&gpio2 30 GPIO_ACTIVE_LOW>;
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f82..88d0cb1d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24866,7 +24866,7 @@ SIS I2C TOUCHSCREEN DRIVER
 M:	Mika Penttilä <mpenttil@redhat.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt
+F:	Documentation/devicetree/bindings/input/touchscreen/sis,9200-ts.yaml
 F:	drivers/input/touchscreen/sis_i2c.c
 
 SIS USB2VGA DRIVER
-- 
2.53.0

