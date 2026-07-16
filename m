Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694341DEF5
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205286; cv=none; b=GtbJuGGq3tMHUF5sXk63FveE48kQ6sMa/gJXyaL3/YejwrMth+eqb0dTDLo9vu4Ip1qsOYcxh9dh6ZsDTiDdKVOcClTCTLG//rtE8Vwn75ynpduVySbW2KGYlu0FvTDz8AuMJdUjAYNmHjSdvd/3iT2XpKNmlH6GHNp4t20F3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205286; c=relaxed/simple;
	bh=ZqIWP+AhPURiWzMGMvpsY8KCXG0v5mBRy77w21Oc5j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ0zmKj/E+EPmxnx2ETr9sOiJ6Vc6T84iJ6n+x5/vbjAg1Wy/EFVyNlgEdTsBchEzlSjTyrkITOsUIc1wuKNcU+0bDhhszUv0SNwDWm+HZ+WcZwYEIqvyic70uNKUGFG9aXD5tVKDgJhKgpIga5h1OB84vTtxDFro1D57hEZ1IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAHlAGDA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAHlAGDA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ec555a26so42849095e9.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205283; x=1784810083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdm90W6HWb62Z6VqHGsM8IzSM3ExZORe1y6Jx8qkLJc=;
        b=dAHlAGDADgRYj5QSP4vt/cCDQUnodO3axYjxNm1hySclyZM/vI8dIaKGLZ0R/o+H83
         GeSBQ3LYEATUpv++5fzLFSbEb0bH9JWJgAzTJdgtQKsm4J9Pv6AG+x1sCx86AQxFan+T
         lW/k/0EYsxyJaohc3lQve6i1YE66ixfn+orLk42Xoy5vYs3kzUv/duz/j5XAvgGLMpop
         DRKD9IUh0lew1G4xTsMNPtWivS0+skJGRlpdAxYUjbzuNY70eTVFovUot5Kn2k9Ex3fo
         WOTaX5DaZqRIkVapLsPEKwOyvi9njdUopVSstHwjAfUdWm/0VwePFgh0m7Ev85OJEu6i
         DSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205283; x=1784810083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdm90W6HWb62Z6VqHGsM8IzSM3ExZORe1y6Jx8qkLJc=;
        b=LzzDKGMfXWnhkgUOsKZXzdbG1zixbdCRdWBNtgV6c7jwgy5AeezMrbde3CS7NU+aSL
         6C8XgNhFBi1Lc0dQYWHYFrO1TNwPxXti5mhNkIQ0IyI4uHOHuqSRmHx3osStcbe2PvXx
         MSEuapDSaYhp2/nYf5TsVkZsgzsL4tlAkkji4Z0LCSOAEQNDdG0uog1DC45Im+MKBU5x
         S39u3dunatqSMTEyHLhMfh2msXiyvOZAIFNwmzzXZEomqRBMyaXEiwNyN5vcSyG1EAWK
         /0+pxRkjCb2Tmlp/YIw1tkkH4xQL6++8AOtjTzOnq7UhIv2bkZZZlXNuFx1xFN7TuJZG
         WxyQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1QA+nD9OeGmbcJ5T8IiX96jqhBH43ukxicb1llNOJQoaNe3SDhXUZN0w84mg+WKBGm6AeUFyJLhML@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3SK2EOwbg2mH/Ms6qn2fZDiWdtL4yEiPUWWUG04pzdrgX4A1H
	iq7QuIkJGQcCMdRhk7hKesafZjCb6ZzjFpV/omoXQBUeJTkkV3L93/1x
X-Gm-Gg: AfdE7clzV7xM0Wk6hgrTlDiHIZEjQ6A16V81nGYeWW6kJHbu0c0TcnWDsDkoK8KDmU5
	qhN1cTQE075S29iTD8VrQKDb/HXW538sW5QnHMBaC4Bs8MQMQaAWTc5JZcwuVDQaAgh+iC3i+Xw
	hqs0hOfkqgRt7sU5gtiSp21ffl/jSbfXLytdxdEmQlBGOvRje9eBTFnKKsK+UnBh9nEGoDvBVwy
	sMlKyuFNY3JtHjYtlxGfiqmSKj1gaVbAL27gGu7CwecXPaWj2BRSxUKjRKCaSLvPC8lEZJ4/wvX
	s0a6IKEJU7xo5+8F/eZsxVxYF4ltIkBtMtCsv8f4E3Vkl5e6pokDy5njj1TlDp22hVYM8+JCntv
	XBiYQuOXLrC5/+CkLM0WUyVcXBxUmUeU06x30ke+mx+62xH0yiyNLDDOta0iHAXKhkvRJIs0v2D
	En+dzIAs14LCVtSGMW80rjmrnk9Ijsk0h22lYPS8v1Pubp4qjOGXIa0Xx58sn3Q7I32ds6ccoZ1
	HIyIgV+uNbwuxRrxxhDNdc+K3k=
X-Received: by 2002:a05:600c:1f91:b0:495:3f84:a792 with SMTP id 5b1f17b1804b1-4953f84a866mr52933995e9.12.1784205282702;
        Thu, 16 Jul 2026 05:34:42 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
Date: Thu, 16 Jul 2026 13:34:27 +0100
Message-ID: <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the RZ/T2H and RZ/N2H clock controller bindings from the generic
renesas,cpg-mssr.yaml schema into a dedicated binding.

Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2H
system controller integrates additional functionality beyond clock and
module-stop control, including reset control, clock monitor support,
write-protection registers and other system management features.

Split the binding into a dedicated schema to describe these SoC-specific
features and requirements without complicating the generic CPG/MSSR
binding.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- new patch
---
 .../bindings/clock/renesas,cpg-mssr.yaml      | 27 +-----
 .../clock/renesas,rzt2h-cpg-mssr.yaml         | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg-mssr.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 655154534c0f..933316c34372 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -52,16 +52,9 @@ properties:
       - renesas,r8a779f0-cpg-mssr # R-Car S4-8
       - renesas,r8a779g0-cpg-mssr # R-Car V4H
       - renesas,r8a779h0-cpg-mssr # R-Car V4M
-      - renesas,r9a09g077-cpg-mssr # RZ/T2H
-      - renesas,r9a09g087-cpg-mssr # RZ/N2H
 
   reg:
-    minItems: 1
-    items:
-      - description: base address of register block 0
-      - description: base address of register block 1
-    description: base addresses of clock controller. Some controllers
-      (like r9a09g077) use two blocks instead of a single one.
+    maxItems: 1
 
   clocks:
     minItems: 1
@@ -108,24 +101,6 @@ required:
   - '#power-domain-cells'
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - renesas,r9a09g077-cpg-mssr
-              - renesas,r9a09g087-cpg-mssr
-    then:
-      properties:
-        reg:
-          minItems: 2
-        clock-names:
-          items:
-            - const: extal
-    else:
-      properties:
-        reg:
-          maxItems: 1
   - if:
       not:
         properties:
diff --git a/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg-mssr.yaml
new file mode 100644
index 000000000000..1b90289d61a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg-mssr.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,rzt2h-cpg-mssr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/T2H and RZ/N2H CPG/MSSR Block
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description: |
+  The Renesas RZ/T2H and RZ/N2H CPG/MSSR block is a multi-function block
+  where apart from clock and reset handling it supports other features.
+
+  These additional features include:
+    - Coordination with the Clock Monitor Array (CLMA) circuits to supervise frequency
+      integrity and initiate safe backup clock switching under fault conditions.
+    - Low-power state control registers (MSTPCR) that dictate module standby and core
+      sleep state transitions.
+    - Hardware write-protection logic (PRCRN/PRCRS registers).
+    - System-wide reset generation routing, debug counter halting, and module
+      configuration setups for PCIe and WDT IPs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r9a09g077-cpg-mssr # RZ/T2H
+      - renesas,r9a09g087-cpg-mssr # RZ/N2H
+
+  reg:
+    items:
+      - description: base address of register block in Non-Safety area
+      - description: base address of register block in Safety area
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: extal
+
+  '#clock-cells':
+    description: |
+      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
+        and a core clock reference, as defined in
+        <dt-bindings/clock/*-cpg-mssr.h>
+      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
+        a module number, as defined in the datasheet.
+    const: 2
+
+  '#power-domain-cells':
+    description:
+      SoC devices that are part of the CPG/MSSR Clock Domain and can be
+      power-managed through Module Standby should refer to the CPG device node
+      in their "power-domains" property, as documented by the generic PM Domain
+      bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
+    const: 0
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the module number, as defined in
+      the datasheet.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#power-domain-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@80280000 {
+        compatible = "renesas,r9a09g077-cpg-mssr";
+        reg = <0x80280000 0x20000>,
+              <0x81280000 0x20000>;
+        clocks = <&extal_clk>;
+        clock-names = "extal";
+        #clock-cells = <2>;
+        #power-domain-cells = <0>;
+        #reset-cells = <1>;
+    };
-- 
2.54.0

