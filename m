Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D9442642D
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786820035; cv=none; b=O+QqOc2FUJiVfW5zvVAcnQ8wufFbK1iMzOhVx5sRTLf+x6TuS0g27y0or4CGEnh6W9/L8b0zNDiP8jswJnchmPOIgRdBLQb1e/z5MvFCcbBmaD7mZu0Vj3VmGdsvreKZkEweU56ZzZcE/DVerBitZH0QExYGwZr9sfk/+Ic16Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786820035; c=relaxed/simple;
	bh=TsN72N+hkJvAQl8CkzfNLqHYseFH06ElrzzP5rsMKyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6kdpCjkg7oY8ymNgW+whyW5ySK6pIgoksvvGngg4UYqDwx8JPLFH7ajutU4W0B9xB9r5EYdUp4zeD+IqGid63iq91Y9p8x84+b2lTJVKaYj19lnBsgzCkF4iqAEKnrJM70B5JupOkvOnmr+/j5rfE0+kiyGfSYnrrHC1WwyLIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhcgTEJB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhcgTEJB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf49dc28ccso3400125ad.0
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 11:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786820033; x=1787424833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scx0Qdehm+JoDmYbuGUcU99Hdy043v059tiOWEC5ibo=;
        b=JhcgTEJBKy8tsBVghE5ubsroqn/7GVb6O2jzIoccJIE1Ngn+WH3Cma/fl90Ce9io2i
         bLrmpi/ih/8WYnSf1EByMfWhQRYRib/0fdcU6CW90Y0WW+GFlHI/QNH3CG8tR6gHmPfx
         bFZLVUvufoBPFoQDYI76ZlzqHnmJKdRwu5hBMC3zq3uyUBAXoXd4q8458MQDWw9Kyjb7
         u0/wEP1KZE7r7mOMG74N0zdAE9+zexFHbNIPMaryghZ/S4Kpj78PBrRP90Z5OaouoC0U
         Ful0t0rv2XhpftsQSO6W9HnGMF0EzQrdUO511rweiJ7eeuDjFu5AEhFYoVsdlNO5z7nE
         2oEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786820033; x=1787424833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scx0Qdehm+JoDmYbuGUcU99Hdy043v059tiOWEC5ibo=;
        b=GQG+QjklMcD4n4dW0stX3cxDuwcOmx58THahBToYq/MBRVjmwPQ+vcfpaEz53syuFt
         8HzaZCV4nn3qL4QCOo9ifiF1grbJKh3FNFBQr4a91+kwcCE8Qy9OfKTsHiu7HVZDfDXO
         fNrjxgq0Wyo1IfU5ssWcQ9DKZNmznn0XqFMifPCLSVrHvQkGazrISTZ4OH8ZS61oU/xh
         oqzI0ZepN/czmSb7YL8sI8QeHDTcmIQUxxdXlRzkcKh4wlCGPddCWvIgN8We69Nn5NZF
         mfw7yfBIEKJ5cGAe8d1fJ7o3rEhGn/fRkh3LakAaPSh8lt0Xqe/QIVyTOaaurEiHKGEl
         LowQ==
X-Forwarded-Encrypted: i=1; AHgh+RqASyIwmELRdTnSDxzFWOarjgIZM/HWonaudQPe2etBVjQ59fdP37BmfOqW5PooVjHzKzrUjtmjtpRI@vger.kernel.org
X-Gm-Message-State: AOJu0YxBrmMR0C+eu6lySlhPyJhQ4yBc7MofZyJw17wuQ5qHvfTgNoB+
	b6BSJvikYUZgw7WrGPmTd1AmTCSItx35a2Snn4Fj6c5JQuZz5kTTIgpu
X-Gm-Gg: AR+sD12oVtgjGiY2rbMmocv1HPGpQy3hbbQcHrUwrSDNCLlyE8ox+FzrinI/NTK98NZ
	6zOlO/eS7MSNVCnFptkBBX+arjBxiK7H2xvj/bLUUweVdlLGZNa4vUCffV/+dBw39Co+hy6YFxw
	7ppLUmFR0ZFMg/J/BmvupryUDlVFIS94UqMALEf0L3p6IaMsQ/I44VMwHmZw2ljaVygJVR19887
	YQ3OAlPlSjVlZMVTxcTdZNRmixeKw7B9ykoXFFVoQPmH8T+2CVI558wWTFaYvJDu3xe4WQVUYFt
	NtXzQh/LYFN79T4pFSMgP7cTnYQT495W8v6YeMsC0L/vdTuTSS0qhJVOghGMNer25HRwYQujN6k
	FwbmFXfJRu/qDD2mk2wuEd2UOYS6kJuQ3INbq86kpHkQggeDabZxz0h38f1VAfgsb85TwO9UEPX
	7iUrphrcUvMgFJmpwEhWwkYFwUYbghwwl/q/htoPQazGunOpv7HHVHvLgg5WRZS6zPHsb1xpMU
X-Received: by 2002:a17:903:1b2b:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d3b0739429mr113633465ad.0.1786820033065;
        Sat, 15 Aug 2026 11:53:53 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e5cdfsm19289125eec.12.2026.08.15.11.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 11:53:52 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 16 Aug 2026 00:23:00 +0530
Subject: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
In-Reply-To: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786819992; l=4318;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=TsN72N+hkJvAQl8CkzfNLqHYseFH06ElrzzP5rsMKyw=;
 b=uRDyzbTCz1K4RRIHatznqaz/5k5+xEFzai99gT93Mq+Cp0RJx/rmAguaVj44/UvC4HPJH6ZdE
 GazBrxm4IOmDlc1kGO5wAAksx7T9oivA7w+dnDpNtcpJ93ud+lzg5GJ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema.

During the conversion, the following updates were made:
- Add "simple-mfd" to compatibles matching existing dts usage.
- Add required bus properties #address-cells, #size-cells, and ranges
  which were missing in text binding.
- Document child nodes gpio, interrupt-controller, and reset-controller.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Note: Running dt_binding_check on patch will yield a warning for
'ti,keystone-reset' in the example block. The YAML conversion patch for
that child node is already in progress here:
https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-1-189389503324@gmail.com/
---
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 2 files changed, 84 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..dd73b62357ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Keystone Device State Control
+
+maintainers:
+  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
+
+description:
+  The Keystone II devices have a set of registers that are used to control the
+  status of its peripherals. This node is intended to allow access to this
+  functionality.
+
+properties:
+  compatible:
+    items:
+      - const: ti,keystone-devctrl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP GPIO controller
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP to ARM interrupt controller
+
+  "^reset-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone reset controller
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    device-state-control@2620000 {
+        compatible = "ti,keystone-devctrl", "syscon", "simple-mfd";
+        reg = <0x02620000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x02620000 0x1000>;
+
+        interrupt-controller@2a0 {
+            compatible = "ti,keystone-irq";
+            reg = <0x2a0 0x4>;
+            interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            ti,syscon-dev = <&devctrl 0x2a0>;
+        };
+
+        reset-controller@328 {
+            compatible = "ti,keystone-reset";
+            reg = <0x328 0x10>;
+            ti,syscon-pll = <&pllctrl 0xe4>;
+            ti,syscon-dev = <&devctrl 0x328>;
+            ti,wdt-list = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
deleted file mode 100644
index 71a1f5963936..000000000000
--- a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Device tree bindings for Texas Instruments keystone device state control
-
-The Keystone II devices have a set of registers that are used to control
-the status of its peripherals. This node is intended to allow access to
-this functionality.
-
-Required properties:
-
-- compatible:		"ti,keystone-devctrl", "syscon"
-
-- reg:			contains offset/length value for device state control
-			registers space.
-
-Example:
-
-devctrl: device-state-control@02620000 {
-	compatible = "ti,keystone-devctrl", "syscon";
-	reg = <0x02620000 0x1000>;
-};

-- 
2.55.0

