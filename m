Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2812FCC0E
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946353; cv=none; b=ZURYUrN4QUax+UomaVMgtTyvh7KAGGbyWiwY/bQNo8St1UMppnuBphwc4AJEMRT3kSsNZDAUVoY8RYmvV5HAhfW82vpLzRZ5BsGAKEWbq3wXjGJ52s9Ggy8Cmvy+59D3IaVE7vqy3FVX/a1EDSf/F9z2Kbyv2cCzxQY/ryaANak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946353; c=relaxed/simple;
	bh=or+EJ07SOsHtoyrRm94X5M8kiBqJd626zfaT/m/MjG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyVpwnHYXFDxxrg7s0KbRBwiz7epB5Dgr0Xyxz6HeXjFPboG5n0OSSRyF37zT1ufV0HLXMJ/O/m2Olcs3j0VsbPsjutNnCaBhYtKPTiio51ZQE/T28dDg8FcGQ2m7rR0CKRyPQmeEljh/FYQbDzgaMacVYS/QbgzDhrVlddJHOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuQN5ltW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuQN5ltW"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bcd0111ea98so1717457566b.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 22:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946350; x=1780551150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuxBA1Jnwii0AQo0AYAcpS9dZCQZKs+YbA2PPOQhDTM=;
        b=VuQN5ltWkC3k9ikvHRMRn5mkhcc434VY8Oel+BDUNoYr7CMaqMWu/GlU/MWWZUrlH8
         5DUPIc2xQ2+khJIWyXS+p3Xma8S1uZ0dbiO8BYNh0RGr9uuO7uVPgZFbMiZfpLvTURxV
         m3uZImWMUQiZBJ+FTvqI8IkSpXUHaFC7xxP2KO5NxngeJGsPkSvHuqtepwUIt3vDXXjl
         qqGo8bAMsJBscsjObnKv/uulevFqotmRz6Xxrge9ZuU5E8ai7A0DU77H0p+96XJKd69f
         8dc32hl/4AiJdtZmCZyoJ+zklnMIipZGv1CviB+2b4du5/G3i/hJwgaAVT+j803+iHoX
         DANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946350; x=1780551150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CuxBA1Jnwii0AQo0AYAcpS9dZCQZKs+YbA2PPOQhDTM=;
        b=qoED8X2hNE1FH699H63kBnOGjnI7sq9+Z6bn6eJzZ0OO9H71KPhF0l/sVg29itsAaA
         VyBIHjOdj0iNZNru1kBNsmxldM1kFCXQ73gnIKb6yYCWz2Iucm91iIAejL8miAUx0klr
         OOtcCkZLd6wQdkEOKkWXj9+EblWyjUpE76dT6qqi9smqaMzDR3JUKe5ioYezmuMYiJdY
         oj3aLKu0IPqDo5dLB2DLFxXKbB8VjDx6GdIdGgLqcl/XesneqvmuqpDwnXVB9C2rW8yp
         8FgHLtjnvlCE2SGEwL9bKHvpCOU2djL9jvRuqpcttR6MaTwOMnMM6ez2mb1FnSyq3A53
         3eCA==
X-Gm-Message-State: AOJu0Yx1PANGtohez+6lrH0glSJfh4NMMjPwCtGA5/9d1NxWth2MLg6X
	akO3XNHwdS5p+lVs2g/VEv14dJWTLOsd82dtzxbcXBXHaNakjbZiCc+y
X-Gm-Gg: Acq92OEAla6SFCk+lku1IGN9Zta0WfwJanAq+TI5fXGWe15ZZsd3EphqDE/UwFOMEIL
	aFqcImmHL8nT4Zfx1tY7C3sFForPZi8ruX56fLgmZWssUUMfX9p605QbeC/DTQI+ojjzaoe4bpl
	tIZT3/Co+9wv43dxvBBMt3st9CusSUcVxW6eOlhr3lL9TSFPu9pc3DOCf8nD6iSTY/Kn4OiQahW
	U2bxR7ScqRyJniD3EKW4lmMmiTjTsIbkwMrQv5AlKGUKUTyImC4Pmzim6F3rgOTWdw6jgpTTBME
	PQBRoKQUWjIsFXtKRJG/a0eC69N6ll4hLFJztcQLwHdwL4d6sHHoYKNylk6D/oFpGqiBK/MOJf6
	efugrvcya8BpV9O4gGNAsDRMXJhbY6VdKboAyGtJMyrifP51DxXG/dCAK9vdBok7l+c5bAxOdr8
	BiuOLSrJBNrgn1nwmbsbZJNDw=
X-Received: by 2002:a17:907:c003:b0:bd5:7a3:a593 with SMTP id a640c23a62f3a-bdd2b0d6a45mr1714780166b.46.1779946349814;
        Wed, 27 May 2026 22:32:29 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eca616sm693427966b.30.2026.05.27.22.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:32:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v8 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Thu, 28 May 2026 08:31:57 +0300
Message-ID: <20260528053203.9339-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528053203.9339-1-clamor95@gmail.com>
References: <20260528053203.9339-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 000000000000..60b6375864aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.51.0

