Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B7314D0D
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651903; cv=none; b=fCUMwOFcIM0mrkwI08FxdDqg1LHf9vliLWDftF7fdtvgPc1WnEN7pw3/bN7ZZYMlqM/DOAI2mJzeSsYJBSJkh9vQb6iC/x2Scsx5s43pPPIhzR2f9ch89zGV6DpC08X6tm8bYllxhJGq3bnY4Pymsyu1qwUhP6AsauwF8Zcc/P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651903; c=relaxed/simple;
	bh=S9yv0ppDny13+PFHIZntF7i0NLLrmOWsJlGQ0136268=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tKYVVm1dYpkatKQzFBpS+sI52hf+ee/A5CeiqzOp2ng98BeLrNt0oNQqi8y5uogQbO+WNQnxaDX5qPUbnjhrPmQQbVnP4T61fbdOkmzMDBXrJmnzAdbTwO0UHwLpmHK0XBat6fkovEDvhnmSEegW5J6cgRXyTFZLdyDz8dAb2QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlfEX2kB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlfEX2kB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48fde648a71so58779045e9.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779651901; x=1780256701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Y9GPXTLGAUIBWqeRqyMnJLPiEzYcwSV+9lPF8ht34M=;
        b=HlfEX2kB7WoIYFpXFN45JFc/yGSSoSp2kc91/cjtTj7lmKm6N36iUsD3jvzHS9ZyNq
         2SLg6r4tGrYSe53AGIAwMB62VJ+PdBFYeJ4oqmU6keyvkRWEKtLcj5Yre8YXr5c3K9fH
         bxPVB8W8z0WJxBt6pYtsX8dm8XNJMt5wwRCqXktyw54qnuRSxUETq0DaaLHygbyRvHnJ
         uqBYtFuH+PaELqNmtP0Y+hokULAvR+VUIzp+NtIzT4/k43CVqjqg52OcWwkPK8Gkr6So
         n0HlbYHVQCF4jV4cD9h0r4pquQ6l7AWz7CmCLmPsqqTuyls7/OpJqsfGqpzlKvt3KBWC
         1WNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779651901; x=1780256701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Y9GPXTLGAUIBWqeRqyMnJLPiEzYcwSV+9lPF8ht34M=;
        b=BlRthDYyo4kTwtocqKRz+OLC6/hUAAfZbG8zlWdJ+eMWdSBLj+HIwdSkJdL3BP14PJ
         VdeAAGOBSDW1g+YeKwEzdCPsRImNbLx5uhmGPhidmgfxe7I82ODs7t6wrirFUZka/JS1
         w4QhRDPabEx0jHOq6VC5Hd3pbSMzPCqcdYbwe36WtTCil/mUfOgFipukxJfRYsaToFJ1
         Wok7daA2lIF3axISJBeVa8piNz+Q4OyfwraxfD9wWIAVS3zDLvpJU8Li+TvcKBHhizIA
         XUwt3+IO2+fSNWGuXVuVZBwUHoEBLymevMP5iljvkfNkFnOtI1X537B3Uvzvn06iyesu
         AG0g==
X-Forwarded-Encrypted: i=1; AFNElJ+iIaV2urBXgmzB1gG3X4rUCm0fCxX8pK4AOli3ZMhm1B/YnTjBei8y3nOw2Nb2An6MCsphn6X821iZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5WG2MVNINVHloPTXxtZQbf9mDlTj3IDXExhkMvVIrnEZP57k2
	a14I6sKzfgTBZ2afwldJOBXryLQJIEZx/4RMTw34CXBlazJ+g1sTQmuf
X-Gm-Gg: Acq92OHyEw/SNTk1J/s6YMXFtbT8U/ywEAEnhMaeWtqWncQ8KpqAFBq5UTP8LpK4b/V
	Syu9T+2Gix27OhQni2ho2djlqZugmGypuuorlOi293sbFcMcc7xTm1XDuVrh5jQDh71tT9CVNBI
	t0BamM4wm5loAPOxsNYBvrS9bl6zqOkVcC8Ew4vvd61nv2GjHtRGmpLQnzZsK/CzoIjzNhgninR
	URhSkSV/VaB4rqUhRjE4sYbUskL9iOjmV3z/Pd00EhCjNWku+bgxA1SMgEBHjT/bCwVBXomoH4k
	OgNyJlFhIcnSYAzzKiFESFjWJ+0QCHguGURJ3fXUwR/3tKPxkBOZmrX8r5Ak22PV0oGCxdg5AY5
	rknLR/zRT6eGY1TYpe+7NfP7Vs6XRzQvVQV8eWnR/1yJdvl74bXhOM2CV9KnWf722ZphUb+DwJK
	PqRZKyPXy9YNeTf6cNPDJCjwU4MQvqirs=
X-Received: by 2002:a05:600c:46cb:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-49042480f2dmr161584355e9.10.1779651900589;
        Sun, 24 May 2026 12:45:00 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a700:7301:ae73:a12b:ca55:91be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042cde62csm68224515e9.32.2026.05.24.12.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:45:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Sun, 24 May 2026 20:44:50 +0100
Message-ID: <20260524194457.479681-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
References: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
single-link mode. LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
used at the same time as MIPI-DSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 .../bridge/renesas,r9a08g046-lvds.yaml        | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
new file mode 100644
index 000000000000..b1f6d020ae7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,r9a08g046-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3L LVDS Encoder
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
+
+description: |
+  This binding describe the LVDS encoder embedded in the Renesas RZ/G3L
+  SoC. The encoder can operate in LVDS Single-link mode with 4 lanes
+  (Data) + 1 lane (Clock).
+
+properties:
+  compatible:
+    const: renesas,r9a08g046-lvds
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: PHY clock
+      - description: Dot clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: phyclk
+      - const: dotclk
+
+  resets:
+    items:
+      - description: LVDS_RESET_N
+      - description: MIPI_DSI_PRESET_N
+      - description: MIPI_DSI_CMN_RSTB
+      - description: MIPI_DSI_ARESET_N
+
+  reset-names:
+    items:
+      - const: lvdrst
+      - const: prst
+      - const: rst
+      - const: arst
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input channel, directly connected to the Display Unit.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Output channel, directly connected to the LVDS panel or bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
+
+    lvds-cmn@108a0000 {
+        compatible = "renesas,r9a08g046-lvds-cmn",
+                     "simple-mfd", "syscon";
+        reg = <0x108a0000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        lvds0: lvds@10 {
+            compatible = "renesas,r9a08g046-lvds";
+            reg = <0x10 0x8>;
+            clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+                     <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+                     <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+            clock-names = "pclk", "phyclk", "dotclk";
+            resets = <&cpg R9A08G046_LVDS_RESET_N>,
+                     <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+                     <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+                     <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+            reset-names = "lvdrst", "prst", "rst", "arst";
+            power-domains = <&cpg>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    lvds0_in: endpoint {
+                        remote-endpoint = <&du_out_lvds0>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    lvds0_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

