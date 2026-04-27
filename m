Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B37355F4E
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309905; cv=none; b=bPz4/OTxPht1CDMNqMKuNxBsOhwls80q9iUW0OMUcEXzHCQHyq+amB6pJhKQssZMR5ekrzpHxWqaqmffLSclRI6NvTxui4XmFUA4oekWoa6W9+oycOK3ipskjfMtwK+JcMFeFn/k6FDhoIWvWD4ERYQ7YNL/2zUUGzJdnkKAe+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309905; c=relaxed/simple;
	bh=40Q0FHycVkAdCD38Shu/5+j+bUm15rAf8Tgbi3I7ne4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgN709hnoHN8/qxIqQfiPsJWKdMTKMjkhuMRDpIzAtMdPXUBWagZtMKwewSxjXPKjBagiCswgV8CEk+FomMmcdOpyfq+AH3R9IWSt8uhLsD4T7ucuMKAerCfZIhilqAnLnpXYBAxDfmLKzIR1ZcooSuifKF7YLLlBd0eIM1r0Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gskxJ04+; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gskxJ04+"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6948b5b1c53so4683494eaf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309903; x=1777914703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff3Oah9+sf3dvTFmRGJs44c/nx8rxOEtIEmQFlJnbJA=;
        b=gskxJ04+coOCiPrR4pJXvQaV4ywOpEyj7Poddp2UOk+ddMQ4pThEs3FOV0Z6BelAr7
         MRzCnHGHYxM+V30bIgGdxLY+BZCCU6dQYBaQ3O0gkm9whMZjXwSomHdNbNF1qyof1otb
         FpAapNJMgSEySJ0TbG1FpSaeXxXizUAioF6reI+89HFBzFjnblj+/VHegxlJRy/J0mf+
         0Xdv/qfsBtJ2RuHbVfo42JQdvJtn0fj9gdElDUz4S0zUnj4m8OgLyvSC2XWwmD/vHMc0
         nY+25piHPBaHUNMpyh85krHKuPap5500+iwlv7WtjqiGehRpdgO1hjJ8a0R3c+e9QkJp
         Vw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309903; x=1777914703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ff3Oah9+sf3dvTFmRGJs44c/nx8rxOEtIEmQFlJnbJA=;
        b=ERnWDMAZrjHyiQnD74lCiIEvigBppUzSgki2Gszd3xnjZ/n7iZNnd/3SFL2KIXvsMJ
         mrCjDI4rBhTX6WZd+pNzEVFUF/w+Q2ndIyXUNCD2G0zryQ60wDZn1CqU4Sojl4LqlqPo
         jmaLzQPZfLyTq9bHESOObRiAb6CxX0cHexlt+DI5nf8VRXrsB4o3MZ2RV82fwV33oU0X
         GOJTGluQEfiMIK6+MHsomljjMFy8G3xTMEjXVIyFGNJPKyebUrHsb4P+h5v1tE+73/r5
         G8fZ7I8R5FuGh68wgjb6VG4lF5TktUOHGZx0bO5+QTIbKeEYa2CvLblwMaVvQXA4uYrN
         T1WQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Pm6IRpZ9tMoLNfGJnbEHjTplXqh2IkVo0r5BRI05NvIkvzeOOHeIwYe3I042k0zjnaQgdFaqDXDaT@vger.kernel.org
X-Gm-Message-State: AOJu0YwLQOaMVBfF9+3t0yqiQZmOslYBzefXc64rxwKPojwTNK4v/X1u
	7TVxwTz7tBhbcSCKTXdQUsWK7f2bs95T3X4Mdq7QwH7J0NjSFlXJW+t7
X-Gm-Gg: AeBDieuOpJzZul7DBpKaq6N4fmJ/alUGBNAaJlqq+zUS36JHrIlrg2J+oSwHqkTN/gb
	E1x5Nu4wwum+eEzVj3O7FexaVXj/650y/hI+dJPwuKoz8nlube1ddXrxYhOT054yv1ofpntJeRK
	kqwbZblfyJh2l5+RXQT8QdiduFBcNe4BQaedegBM9dm0KmtDRLXrPDsZfZkBFHX2Ba9itQRY1JO
	BVLzGfEfw7rKg6WWGIhyqosLQ1SDljvFeECwuzdnD4OfTL5XfeauUdeDKh52tuWe9Zo3MzLl4kq
	f/SxPmI8Hn6c5qQI8AhJc/Eer3q24fctS38eAdLDmCP6vRuspB6sBCDnthbp3s/QDRtbklzmHK6
	kwAxDqe9zE6Go4EPbWCUGBGo2GpLMIA1FIksXSgOmhc+PCBL3fZzNClxbR59yzKwf3V8ez4tDzd
	mJ7ZChx/oPZbVn4B5JiC06WRaqybblXK8=
X-Received: by 2002:a05:6820:1b10:b0:684:5041:9296 with SMTP id 006d021491bc7-69462de2716mr23720910eaf.10.1777309903103;
        Mon, 27 Apr 2026 10:11:43 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6955036558esm10261236eaf.14.2026.04.27.10.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:11:42 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/6] dt-bindings: power: supply: sgm41542: document sgm41542
Date: Mon, 27 Apr 2026 12:09:09 -0500
Message-ID: <20260427170914.5062-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427170914.5062-1-macroalpha82@gmail.com>
References: <20260427170914.5062-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Document the SG Micro sgm41542 battery charger/boost converter.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../supply/sgmicro,sgm41542-charger.yaml      | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542-charger.yaml b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542-charger.yaml
new file mode 100644
index 000000000000..3e5041e5b551
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542-charger.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SGM41542 Battery Charger
+
+description: |
+  The SGMicro SGM41542 is a single cell battery charger/boost controller.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+  - Xu Shengfei <xsf@rock-chips.com>
+
+properties:
+  compatible:
+    const: sgmicro,sgm41542
+
+  input-current-limit-microamp:
+    description:
+      Optional value to clamp the maximum input current limit to for
+      the device. If omitted, the default value for the hardware will
+      be used (2400000).
+    minimum: 100000
+    maximum: 3800000
+
+  input-voltage-limit-microvolt:
+    description:
+      Optional value to clamp the maximum input voltage limit to for
+      the device. If omitted, the default value for the hardware will
+      be used (4500000).
+    minimum: 3900000
+    maximum: 12000000
+
+  interrupts:
+    maxItems: 1
+
+  monitored-battery:
+    description: |
+        A phandle to a monitored battery node. Values for the following
+        are used by the driver and if not present will result in default
+        values being applied:
+        constant-charge-current-max-microamp
+        constant-charge-voltage-max-microvolt
+        charge-term-current-microamp
+        precharge-current-microamp
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    properties:
+      otg-vbus:
+        type: object
+        description: OTG boost regulator
+        $ref: /schemas/regulator/regulator.yaml
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    battery: battery {
+      compatible = "simple-battery";
+      constant-charge-current-max-microamp = <10000000>;
+      constant-charge-voltage-max-microvolt = <4350000>;
+      precharge-current-microamp = <180000>;
+      charge-term-current-microamp = <300000>;
+    };
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      charger@3b {
+        compatible = "sgmicro,sgm41542";
+        reg = <0x3b>;
+        input-current-limit-microamp = <3000000>;
+        input-voltage-limit-microvolt = <4500000>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        monitored-battery = <&battery>;
+
+        regulators {
+          otg-vbus {
+            regulator-max-microvolt = <5000000>;
+            regulator-min-microvolt = <5000000>;
+          };
+        };
+      };
+    };
-- 
2.43.0

