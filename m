Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60E40B0F5
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219528; cv=none; b=ZDiWCsu3ipLiepryG0tNkezeMWxXF/Dgfe4Vv7dOVmGImPXfRNzZ3OZzJK7Qkb7mxZIQNaiyxvxSYS87FVtfQ4GOZVSrAEMGcfznX9b+FfV0W0Skydx5gURsXzRr3+5gqItAnZ6laFuhP0BKTGsWRvPZIUh74hUH2T934CYwimo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219528; c=relaxed/simple;
	bh=8CDwIcw9Cwa7xa/xb0sjU9AEZPy8+v5Rr1k2WHBl6B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhThgaH72QQGqIISRgvLN4nw0ObvhAqWR3RSTU/+T3RIA8wT0w+YE4YVjFmvtYSguYhPPlaXKW950QqA7qgL6Yy6Hoe5boSs7d1T67Ht/w5/XGMCJ6K1lI+jvyqklHo166tuKvV2naV1+twRmEaGaJwVYFWbV5z/TB3AXPupUTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ/9WwEn; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ/9WwEn"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe4c537ad6so841284a12.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219527; x=1788824327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shThNVvHvcCvkYDrxu1ymT+FnDuu2k7qfXr77Zt+pxI=;
        b=MJ/9WwEnmn0IIPstXrg2HYZ1XmblzdrJlq0sCbcMlJRIqyOdzbW6W8rgy5ns/tR26w
         ZvsQ5Tirm9/JNMtXLBIgZxarb7EzAI6/5OBWqtCJ5f0WME7DTueUWxVcozbw/NvhWXaa
         N0fF1f0vlE4GpJT+Rnk1B6D66vSTSVE2xocewKRAHHa2Hg/ie3LNV8cVjlLuwDVi0YOV
         EPGJN+bBhxTdCPxz+MW7elPyPLB0VtWQHW7giX55hRpiqsN/A4bp19bjTwp0CG3j/414
         rlxgxU+XEg0lTY/qHWxpWarzGizRlKeo9B/wK/SC9Yc7+GzX2np1WHgg9e28lKX7br8l
         htEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219527; x=1788824327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shThNVvHvcCvkYDrxu1ymT+FnDuu2k7qfXr77Zt+pxI=;
        b=Pq4jXr9aMwuOtzlF5jK66rATzg6Mz8q9kCGt1xkAeyWKI1o6sqFhPoul8ALx/yO39n
         uioOD5o62zQK9rHO9YqGU3GD2GFuNoHPbEMLCoFkGiCcnxYT6Zth+cKJlGQAtQ8EFyes
         7A4MdRDgcRUn/cHa5PtHRcuFEOMYESka2+W6liJFE0REFHBBmryEB7QS8m8be6cZ2JF5
         ALqCRaEmy5A37WcVFGHFPlgRs0qe/uHW/E/AEnHFb6UA/M5F/+O8gd9ShsgDI8pNynjr
         Lp3sA7ZZjPOfr6unQP6A+lPW+mHy0ym/tVXgt/wwwweeOOoCwBaMMRC/XZQlqHVhhU89
         +YuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvwHEMcFHLrUjBMp94hwEvGuET2HjkLRROvpuiRfwINYyQOA5AtONKi9GuRGgexUxr8skKqJyYsNen@vger.kernel.org
X-Gm-Message-State: AFuF++nHinSY2g1CNc7/pT2yH/y/wHaKM32xC+Ldrard5X8rqJMJ7fMB
	LO4G1LlCCNrcrMJJuwDFVxkx/zzq8J8Mdn6GVfazqP41Xm/JoBQ+sJ/W
X-Gm-Gg: AYBFou2U7AHrmwJ2Wu3ney/+b+FFr7StPYx3xCnkgIoOMcZL2m+3hGPtgjh72FulcB6
	IXHWb9G37iLXgJaphN/LAg09h2aVFoDEjr67gqeV1/x9W7p4+K3+txhrk/Znzmacv4p/iiuebeV
	elpoGdSJ26q9FeKOycGBLUlNV75wpc9OfUJ6gnt0XOY8Ju2JBRr/aAdmjbvlxElHPdQxShfdbzf
	Wa/BSKRo+Opqwv5y4sPIR5mvwlMTduQ6qUgsQjA8kgvylXF82C1Lmo2w6LglZGL9bKd9MRQusoA
	4uLNhF+c94xtB8DGsEvlLtao7hXM039rSbAHKHkOKTGsT5ptB0S23pEAq7SEpfJwniEtjgRSZjo
	+V5T8uI3py8AeDKnLkiT/08Fq1K3CTutv/fwyx0aEnj+vPLWMRao3jGEWAgOL8WGfzyPR6wonrq
	7ecx78t1LmRpH99ICXUuEFlHhGWj4e2WBDT3lHLCZblATIaOTnjEUi1VzFmiU/B11KvC2C1ZVO6
	R/NpzTjhw==
X-Received: by 2002:a17:90b:17cd:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-398bab29b39mr14687470a91.2.1788219526679;
        Mon, 31 Aug 2026 16:38:46 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm2143682a91.7.2026.08.31.16.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:38:46 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 05:08:13 +0530
Subject: [PATCH v4 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
References: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
In-Reply-To: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219500; l=4141;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=8CDwIcw9Cwa7xa/xb0sjU9AEZPy8+v5Rr1k2WHBl6B8=;
 b=RtlS7lipVVDU7Yzpx9NBd0BOlUuy+8xcgvjciTvzjXfiuS1dupEJC1duo8n5rtoNPopwOZ/sS
 DgTXTYQZVE6Aj+gvomsw9VBPHnR99qUXpaDoybfoXdf845nyA0Maj+g
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
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 90 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 2 files changed, 90 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..564dfc8a731f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,90 @@
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
+    required:
+      - compatible
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP to ARM interrupt controller
+    required:
+      - compatible
+
+  "^reset-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone reset controller
+    required:
+      - compatible
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

