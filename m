Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19421FC8
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943983; cv=none; b=oIZvMkxe64Ch1LZAoPLE9KxnsfeyCRzPRFVCkotVhV6Cklsp5e+NcJ0cy0/FcCg3jP+wJA9VI2RsBEFAhqmT7K7WcSCxt/7WvnGnT5AV4Xr2DfivBel8l0V6K5wYu25hmsPLA5fP1RyU46ZiSLgCIk1OkwDUMheArIF1F/tKCVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943983; c=relaxed/simple;
	bh=YyGy7Nz+meoRupCqGJY5hq1blew2HM7LN+pW6cuNtXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ucrk6iINSrnYSohqYNfA1f/7d/SnE92++miwxRv5U2PsIVrv2wSdg1il9BncOPqZFslPDYOlbG+aV5xwI1rtDBbRZlWsxAiedHrJs8Eeogy+HKQDlh0wR0+qxmgkdXc3C8rtG1rsUxvHugAM7EdEPa6t8qA1BJH5VyKAr1zMVGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJT5hK4R; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJT5hK4R"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so2832662b3a.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776943981; x=1777548781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1/0ObLzF5Tu7uxQ0BCDGvfJPatFkVDRZlOHYx521ak=;
        b=NJT5hK4Rv2+4RK508J2cUcmaYh3zHohRl6Y14CsjQwUFdedUjG4Uq4ua7+IIcLTsKt
         AMOJTZBqavjwU0TYP4Q2t3s+4ZyrFRzlOFw7DEweCf5hvSGODQ/vR4OtdLOnFlGRh92T
         Htgy0CLL2Hg/xEuYEgiysF/Gk7A/vR4WQQwUD3xE74ENVwGbAeM8XArM0aGBRmaOINBI
         wpriN9s75lXFzo9Lwo//ZPwGv7t3k/gEoKzkXDMkbOLaMS5Wp0keDwC16QYWy2EB5fc5
         kLEcl5wXjaYp7NZr5aTYoLAykG2+VAXKCtE92H5LppVzoIG0QyCMXb8Yn1xKOv9aWdGL
         u1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943981; x=1777548781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A1/0ObLzF5Tu7uxQ0BCDGvfJPatFkVDRZlOHYx521ak=;
        b=hNV4Ub21L0cKuz83SmSyDt6s2qkeNVgkX/jifZwW9bVZd854rEf9cmZ4d4HgRv7uZ7
         Ox0UTMxlNGBDye6WksHdzf9MdavVMma7qqRVsCDc5kL/Fv1X5WwXnXWk50T8bCjo92oM
         bEnU1jw211UglUw51px+BEcNe1+kAVoNmf8C4dVS91eTVebLgedWStwIMQnXwVDK9nyP
         2YP/UvUFO1GXBxMvale5BGZEh9VnA/sMDkaLo5EHNBa9WbZjswUS4VHqYXnL7DdRnoSX
         bEl0CgbokdpHb5ZYKxZt7LVjFyuW7REJg8WWFx66K0ntGQGkBa0MHZ8EQibJB5ndjgiS
         JkYg==
X-Gm-Message-State: AOJu0YzrnMrGOQVLuKniwPkAEL2rBnKnWMrMCBM0YzqPCQOsGYxYOtib
	XCYnAJ0ZBUdyNn2JzbaE1bZn0ShWoN8ycZrSq1xxUe4p4B+qe4U8G/vxLt8vcV73
X-Gm-Gg: AeBDievJL+5KBUxU2B1P+rqk5Js8xPBMcf0iH1wZWcqlV+94Pp+pTbbURaRzoHrPFqz
	xH2xvDpRRnZ+wsE7C9s42qxotRwcokEb03Kd7iDLOatPHBW0u12Frn9es3LXaZrtiPq1AhGEUvr
	UpFoLnErwsBFL6Qecz9KGH5fGiYmgCyVrTbSm66zXkpCC4GhdK0SE5RjyDN6P18HQOUJh1JicjX
	vjV6lGE4aIv6T0oi7oOTV6momzRW76QUbG8IOMwCj2xLqrwlK7CkWVcK6GnN59rCeOZvW49+Cs5
	yijn1k2eWofuPRiqrsHMk6JtHayk/f3k4UR1EfgYwoIFNNJwluZA/gg7Ar//Zx1PNyB2moPjwKh
	YFLADHCgZ70SGvNUIjFFZnYCPwNSHq6qkAZw/4Kkv5zVZKyCZDsIMehAJF+X1Pj9ooF8IgaZbuq
	zFGk+9libf2dp7yym9TZ5b2puX0d3Tpo49c5MyQB2Sys4gHN/Z7/CBcYq7fYRpG4bGZmihx8EQv
	Pk=
X-Received: by 2002:a05:6a20:3c89:b0:3a2:cbd1:11f with SMTP id adf61e73a8af0-3a2cbd1126dmr15313526637.5.1776943981135;
        Thu, 23 Apr 2026 04:33:01 -0700 (PDT)
Received: from fedora ([103.74.236.136])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79770512afsm15535646a12.31.2026.04.23.04.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:33:00 -0700 (PDT)
From: Shaunak Datar <shaunakkdatar@gmail.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	daniel.lezcano@kernel.org,
	Shaunak Datar <shaunakkdatar@gmail.com>
Subject: [PATCH v2] dt-bindings: mfd: hisilicon,hi655x-pmic: Convert to DT schema
Date: Thu, 23 Apr 2026 17:02:37 +0530
Message-ID: <20260423113237.260652-1-shaunakkdatar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422200200.126728-1-shaunakkdatar@gmail.com>
References: <20260422200200.126728-1-shaunakkdatar@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Hisilicon Hi655x PMIC binding from the text format to DT schema
to enable dtbs_check validation.

The 'regulators' child node is added based on existing usage in
arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts, which defines child
regulator nodes not documented in the original .txt binding.

The uppercase LDO names are retained to match existing DTS usage.

Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
---
Changes in v2:
- Drop the $nodename property
- Constrain LDO according to actual hardware regulators
- Drop 'regulators' from required list
- Drop example root node wrapper and use 1 address/size cell.
- Elaborate about 'regulators' addition and uppercase LDO naming in the
  commit message

 .../bindings/mfd/hisilicon,hi655x-pmic.yaml   | 80 +++++++++++++++++++
 .../bindings/mfd/hisilicon,hi655x.txt         | 33 --------
 2 files changed, 80 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
new file mode 100644
index 000000000000..6f28f472e0f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
@@ -0,0 +1,80 @@
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
+      '^LDO(2|7|10|13|14|15|17|19|21|22)$':
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
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    pmic: pmic@f8000000 {
+        compatible = "hisilicon,hi655x-pmic";
+        reg = <0xf8000000 0x1000>;
+        #clock-cells = <0>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        pmic-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+
+        regulators {
+            ldo2: LDO2 {
+                regulator-name = "LDO2_2V8";
+                regulator-min-microvolt = <2500000>;
+                regulator-max-microvolt = <3200000>;
+                regulator-enable-ramp-delay = <120>;
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

