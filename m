Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0C226D02
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775906708; cv=none; b=apFXJY9y2gXs7cS8DEtzN4ihHbGglO0jQLek7rSR7Yr44dE6ae+5VL/EFM6kkQxk+vQgZzY9DqrEig0PYos9w7v5bbIR7j7jlwlImlFetuHfAKjlOIK/sKiflnJeHqVNGwrSM7X4v+uPFtlwQb5m1lyo16xoeYe9LBze7Bh1bdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775906708; c=relaxed/simple;
	bh=1yPE/gK3AQpWAxImlrz/Yz1c3UZwvjy/qnL2N/sFFzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q8obDuBPtlRbqAYg5K46aiijzuWFpgB1VoFSFLCuaSDgWwS35Kyco1pHC0ngZ1ZsVX9poD1VIibZcV+s2I6VSGT+UHhcn3Lm88S/aWmTd1rWeCsnkVDO+cDWYvx3KeFfVlYg5csr7PM9lEpq4yeZn2lzxrhQ7wl22y1iOjG93hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/BBQcNL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/BBQcNL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d9c7bf9a1so2726617a91.3
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 04:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775906707; x=1776511507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H+PTzjpNlpG45FMb1Ubuls/uy+BKWZbFk07TjWDhptw=;
        b=C/BBQcNLgp69ta+Y0BwrSVVw35yHReOZedVjW78RCR1oN2ip3pir1OdV5ypi4BEqB2
         PNwWiqrZVSCrXbPKdrdvbEPmHCcVA2Ir7rZzMnmwEaBqjsOBEyd7JumDRAbMQ1Xtz/FB
         YWH25TurucBv0LCSzUXbwTHaIZcff8fk8q95/Mw0WM+qmxZrgqsBu1yny615tXFMWNqZ
         igy7micDVXM1sx28+K4HACh5lkPd1n2MZjoVlGeeWnBO/FM8zVZx8dA8Me6z7jWVql0q
         DJGWIJx5u7vL8eRxH5nlWhi7qNyps0GcWr92LFvn0XAnfQi/WwzYF/iVcRxiLFxX4yp4
         3SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775906707; x=1776511507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+PTzjpNlpG45FMb1Ubuls/uy+BKWZbFk07TjWDhptw=;
        b=UYqKFE/dfEdgKuaRl3Q/KYmNK1Ct/TLE8Gb0DMXpCzt6bU3uvFIfGz7WZQvaqkQ1LE
         Iien3GrYjgOoFqr3Mp9Ve0r50N+v+Sz0UyvUFyMbhau79jdciS06ufdEYTKcBvRLTNeH
         gKGLbqxUeYja78vlEYrSilJ6nFnV/Jfohk1w4TvOj3F05+T4TsC9Q51pyrh+FafOdwi/
         W9qfpWIG6oJa2W5a6AszZ95upoK0ItRneQGvS2jggzS0EswT5/ZQ4v6SO7rMkpg4fDTy
         npKpaTx3cBDk9gTKdXxOL9B7AZkivJUsOY2RrQ7G7UJMaKE8aqySythbTd8ndQBdsobu
         gOqg==
X-Forwarded-Encrypted: i=1; AJvYcCWHKjEToMjLYhDT703T8jLLYKVLDuLV0WHnegiGixA2s0Y3dd1kK4LBcVa+3nyytj0iR7cuOIJHVK5G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6NaGf6rDIVtUWsEJVaCi6tbwxAS+aOkrZYkv1/wR1rmXiTJu1
	EFrjIhHHpAfP17t0zTFJ8FH0JuFwocD4yRpq2yIezCI/p+uZ0IVsvxgr
X-Gm-Gg: AeBDiesnjhJpPtU5uuvlL8NROznp5z3cLrlQwYFRV2QPFxJcVJsdO6EScIdIAWK/WdV
	T8OyRarQocO0iVM/Bc45PitFTBHOrsabQZzapiwQVuSTt1b4pNbEwZAtrzrRHb1dHLj/xFEy4wL
	/43siZt7wba5JWiiPCzYizYLo/ADqM632ik6PgvYyrVzm5jYIB39WW0J3I0hP90wlVgTm1HwaFx
	d92gGX6m54kGp0TzcCULlv3mZ3GZetX4x7/9EnT9Uf/oWOP7lQTerRXSbB+dGoxEvLW72Ou5pDg
	jQr7qRsSc/6+oo0z3Pq35Orxpe1v/VH2jbfl3JeF+VhJB3SFuwgzT6pLZHkPnKo/WgfbJqZ/aRo
	hKKrlvMnQ/ZghC8lml4xB6WThZPtuNirwPdlLHmAXbveDsus3pgG8TteibwFEsL99Q9m3PYfkd1
	WJww2fozizIa2x9mUseso/C+vT
X-Received: by 2002:a17:90a:ec86:b0:35a:1762:92fc with SMTP id 98e67ed59e1d1-35e428bf537mr6976880a91.26.1775906706579;
        Sat, 11 Apr 2026 04:25:06 -0700 (PDT)
Received: from fedora ([2401:4900:1c6a:cd16:7e87:6c5c:5d2b:6126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e43079069sm1922154a91.12.2026.04.11.04.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:25:05 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	andi.shyti@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: [PATCH v3] dt-bindings: i2c: cnxt,cx92755-i2c: Convert to DT schema
Date: Sat, 11 Apr 2026 16:54:51 +0530
Message-ID: <20260411112451.35095-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Conexant Digicolor I2C bindings to DT schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---

v3:
- Added necessary tags in the commit

v2: https://lore.kernel.org/linux-devicetree/20260409-beneficial-macho-shrimp-4b3a8b@quoll/T/#t
- Omitted address-cells and size-cells in required section

Note:
This patch is part of the GSoC2026 application process for device tree
bindings conversions https://github.com/LinuxFoundationGSoC/ProjectIde
as/wiki/GSoC-2026-Device-Tree-Bindings
---
 .../bindings/i2c/cnxt,cx92755-i2c.yaml        | 49 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-digicolor.txt | 25 ----------
 2 files changed, 49 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/cnxt,cx92755-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-digicolor.txt

diff --git a/Documentation/devicetree/bindings/i2c/cnxt,cx92755-i2c.yaml b/Documentation/devicetree/bindings/i2c/cnxt,cx92755-i2c.yaml
new file mode 100644
index 000000000000..c11bbf8aa9c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/cnxt,cx92755-i2c.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/cnxt,cx92755-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Conexant Digicolor I2C controller
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+maintainers:
+  - Baruch Siach <baruch@tkos.co.il>
+
+properties:
+  compatible:
+    const: cnxt,cx92755-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    default: 100000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@f0000120 {
+      compatible = "cnxt,cx92755-i2c";
+      reg = <0xf0000120 0x10>;
+      interrupts = <28>;
+      clocks = <&main_clk>;
+      clock-frequency = <100000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/i2c-digicolor.txt b/Documentation/devicetree/bindings/i2c/i2c-digicolor.txt
deleted file mode 100644
index 457a098d4f7e..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-digicolor.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Conexant Digicolor I2C controller
-
-Required properties:
- - compatible: must be "cnxt,cx92755-i2c"
- - reg: physical address and length of the device registers
- - interrupts: a single interrupt specifier
- - clocks: clock for the device
- - #address-cells: should be <1>
- - #size-cells: should be <0>
-
-Optional properties:
-- clock-frequency: the desired I2C bus clock frequency in Hz; in
-  absence of this property the default value is used (100 kHz).
-
-Example:
-
-	i2c: i2c@f0000120 {
-		compatible = "cnxt,cx92755-i2c";
-		reg = <0xf0000120 0x10>;
-		interrupts = <28>;
-		clocks = <&main_clk>;
-		clock-frequency = <100000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-- 
2.53.0

