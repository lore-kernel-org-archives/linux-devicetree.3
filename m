Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBCF2E36F8
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888142; cv=none; b=OMKgEI6pxDuOnKgDlTmnFugQQH7Eor2G1yQ5g5iPJhT4BKIJJuFSWNllbvrTIbh4dZLOQsMiBxg4jaXcKWGabLyEWLeJG7HHY7EOj1/Dtp+Q455s7+T1DUKGbROtsKraYmYdv/ZW6vpiACk8yLTApN/i20jZ20DlDMZOGOvkbH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888142; c=relaxed/simple;
	bh=HVz3/L2fqmRZQRDlew4uafvnAebYI5gzHYEjsvoL6Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AG7vgUFbfb76L8Uo3BvoYv65/a4rzK45wbxaMDxBpDb+hNzu+EbuhtnPuOsbIhTmlDJbMIsNWc7sudnyfi8Jc5Rk4zg0UPk1Kf/8Vu8qAolEiTaBh93CRjhamcM2urG1yOM8sCPe0590x8GC9CqrSekCtdR1uzsDpb0bB9/XBR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OH4y6Z5P; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OH4y6Z5P"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso4679554a91.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776888141; x=1777492941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cOF75pFIeZSsbNfSVxr+pwPDlNPMTeZu3Drv83vgjoQ=;
        b=OH4y6Z5PkFdMkilByjBUIK7+tA23pEmRLNjORO5QZ90uWTZsaplf1a5EoKUXaPoqIT
         8Z8Aq71MPasGtZ+rA+GfU0fv/l07P7NTO2hQcleZNv7bNT5fkzcsScmn7yNYuRBsN0d5
         ZrxHG+l3IxRfzsGErDtTJY7YxKeU1iA5o8dNXX9cNxD67lGehA2zM02PEtp5cghnbS3Q
         plAP/ARTUrQpy/kQzIROWRYTzVxz3zWkb2jl7yswmDsxFuaWo2XYYacNgZ5BsaGlRgwd
         sbgPO1Z5uAgIot2DaaW2aYTUBxAkpouG35DFTNSomaPyCGEmWwK6AwyublC0w10sjYg2
         yPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888141; x=1777492941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOF75pFIeZSsbNfSVxr+pwPDlNPMTeZu3Drv83vgjoQ=;
        b=KcJpzGt22n2CmwoaP7Ou/hHyzPPL9VsT1Iknsh5Dug4UlzYE18ICnTe8fxhEJK0Wpe
         aJug2QWIJbDTmecAw180HevPqJgIvvFKC8Ddru5A2fXA+yH25c+qC6Dl3q1HxlvBQOzC
         Mbm5vomsbQmwuwD1hc6Vw9gZh/BOnVupojzL80QAan3VxSeuUjvhRxN8I2HqYmbPM1Ic
         oXmjGpe8P5Eg9h/j3Q0YhKzfjAzSGKaXmyKA4sC/M4kGrqIHsKZGuSGjXT/AEIvTDbHY
         YXreF1JX28nmZPfzlqOOVrv2fO6v9gdzA6oVvYC58cmihznayURMBWNufJO/ovsWhqe2
         eUmw==
X-Gm-Message-State: AOJu0Yx7FwRxWzUJtp+5uQzU0+/qDe2EIxkNLQuq8CePaLtt1Py9xo4s
	jDOs6bLCN7RnnhdPdvQFU6jpe7f/08TyPeZBZAfhkudiZAPpcEVcbHyD
X-Gm-Gg: AeBDiesAIPK32Pw9iXZlFmB1WDBnNpxqS30MfLfGEU0fYs5Ur5gdHkYrJ1bBBzSy4KJ
	Ls3yaGyxmLgRI0wivkqv/Jm0mLMYBY06+5Obvdmssei0il2VHy58AXDIWthU/8HYmAYMpoG5+f0
	CNqw0BbBha4AjJb76Z6U575Jg/NT5Z4TY2eufq8p+2j72tn+MD2R8IPwY73veW0yh6xLxCdcxS7
	5mjI9UWW5GX+HKOi8V6NAb8/+qhYau8J60wh48W8ZjqicXItbSqi+69BEcntpEgEwoFc7E+AxUs
	t9M0nrSG68rpJZ42S0qjbMyE+BcbaWcrJzpK0C1zdBojZoHL6vGIdzNNQFxkuYvHi9Shq2ktg0w
	eI8cLlzy6YhW9eOVAxhFa1Eopxgu8dGy4hzMchYZuyE/FUIuIF6C6DdNuXYZk9FRDlWDj5sp9qI
	R4BPpdCfEETfaY5aaM1qmQIwmI16D6ioB4KceIeslHncQyyzlcEmIwyzjUiVrzc/Pr+mpFfKn4N
	2U=
X-Received: by 2002:a17:90b:4c8c:b0:35f:be09:1a2b with SMTP id 98e67ed59e1d1-361404104d3mr24072825a91.10.1776888140664;
        Wed, 22 Apr 2026 13:02:20 -0700 (PDT)
Received: from fedora ([103.74.236.136])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362b9b6f5b5sm3243573a91.1.2026.04.22.13.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:02:19 -0700 (PDT)
From: Shaunak Datar <shaunakkdatar@gmail.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	puck.chen@hisilicon.com,
	daniel.lezcano@kernel.org,
	Shaunak Datar <shaunakkdatar@gmail.com>
Subject: [PATCH] dt-bindings: mfd: hisilicon,hi655x-pmic: Convert to DT schema
Date: Thu, 23 Apr 2026 01:32:00 +0530
Message-ID: <20260422200200.126728-1-shaunakkdatar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Hisilicon Hi655x PMIC binding from the text format to DT schema
to enable dtbs_check validation
Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
---
 .../bindings/mfd/hisilicon,hi655x-pmic.yaml   | 89 +++++++++++++++++++
 .../bindings/mfd/hisilicon,hi655x.txt         | 33 -------
 2 files changed, 89 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
new file mode 100644
index 000000000000..1bed57003bd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/hisilicon,hi655x-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon Hi655x Power Management Integrated Circuit
+
+maintainers:
+  - Chen Feng <puck.chen@hisilicon.com>
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The hardware layout for access PMIC Hi655x from AP SoC Hi6220.
+  Between PMIC Hi655x and Hi6220, the physical signal channel is SSI.
+  We can use memory-mapped I/O to communicate.
+
+properties:
+  $nodename:
+    pattern: "pmic@[0-9a-f]"
+
+  compatible:
+    const: hisilicon,hi655x-pmic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  pmic-gpios:
+    maxItems: 1
+    description: The GPIO used by PMIC IRQ
+
+  '#clock-cells':
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^LDO[0-9]+$':
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - pmic-gpios
+  - '#clock-cells'
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pmic: pmic@f8000000 {
+            compatible = "hisilicon,hi655x-pmic";
+            reg = <0x0 0xf8000000 0x0 0x1000>;
+            #clock-cells = <0>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            pmic-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+
+            regulators {
+                ldo2: LDO2 {
+                    regulator-name = "LDO2_2V8";
+                    regulator-min-microvolt = <2500000>;
+                    regulator-max-microvolt = <3200000>;
+                    regulator-enable-ramp-delay = <120>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
deleted file mode 100644
index 9630ac0e4b56..000000000000
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Hisilicon Hi655x Power Management Integrated Circuit (PMIC)
-
-The hardware layout for access PMIC Hi655x from AP SoC Hi6220.
-Between PMIC Hi655x and Hi6220, the physical signal channel is SSI.
-We can use memory-mapped I/O to communicate.
-
-+----------------+             +-------------+
-|                |             |             |
-|    Hi6220      |   SSI bus   |   Hi655x    |
-|                |-------------|             |
-|                |(REGMAP_MMIO)|             |
-+----------------+             +-------------+
-
-Required properties:
-- compatible:           Should be "hisilicon,hi655x-pmic".
-- reg:                  Base address of PMIC on Hi6220 SoC.
-- interrupt-controller: Hi655x has internal IRQs (has own IRQ domain).
-- pmic-gpios:           The GPIO used by PMIC IRQ.
-- #clock-cells:		From common clock binding; shall be set to 0
-
-Optional properties:
-- clock-output-names: From common clock binding to override the
-  default output clock name
-
-Example:
-	pmic: pmic@f8000000 {
-		compatible = "hisilicon,hi655x-pmic";
-		reg = <0x0 0xf8000000 0x0 0x1000>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		pmic-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
-		#clock-cells = <0>;
-	}
-- 
2.53.0

