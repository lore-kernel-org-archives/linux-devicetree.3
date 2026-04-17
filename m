Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB89130CDB6
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 17:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776448365; cv=none; b=Evz4xwGVMeX68edHLO0EyuFQQZ7JlSB392YEPIABNmBd3IXErMHVuRsHdRQz4oYDSAh0ikmXhbEa1jBwmJQ0+vhCB+3Zz35mGsbkC4XZoDdjlboSXG5iNqcaHYNoIKMUECfn6Nh3IrrqJEvVHjK8CFaU14MjRX9tDuhfCSQcORk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776448365; c=relaxed/simple;
	bh=ChWfJT6jYHO8O5gq0fvteY6A9Sj+WFluSBHsD4S10u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b714UU9Vm7JPLunCP9VPqiFYnsJtjt5b7K8xU1vO+MOiZNWhM+oZBi63ZeFg2ZS21n+Htbm0wYDSjolJF5IZ56dI6tU76aZHZASJ8I5CamP4hXvRnvomsaQIKw4zV8sgWarNP1y8+bflZ82IbzSVjOHSbQbol+pc2wKNXsRP/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJf6RVER; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJf6RVER"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488c2690057so9648575e9.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776448359; x=1777053159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzAtXQjauknA1e9f55ELLhSNN5mP1FnYcEPzv2Nn1ds=;
        b=PJf6RVER4rqoBDZ5TIlx9JVzRQtiJbYEG1d/f8qa2JWo4IBKGdrV0SezQ04eDtY7AM
         /23LRj9VUHJDDptqBW45lVpzixpEeiF7uAnQwKdkHKzIMtodJnZzh7/mzEP1629RiKHk
         ZxStGvKEPGLNCalBEeoJlKdMk1CoryV6p1yH/LYy6dQxYu0UV+c4G8HNB4NeoEVp4+Bl
         sHfx3D+g5K6crDXopV/fOD3odAxoC8buR36Ibmd4C+FZPHgnbzpatRRH/Kd0oXMSo3Xx
         QhPQItwP1jXt4rlvP1AVxPO/Qg+fNSzs3lu7M3xo045i59ndm6UbRisUnnyjx9CUsyqM
         wkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776448359; x=1777053159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JzAtXQjauknA1e9f55ELLhSNN5mP1FnYcEPzv2Nn1ds=;
        b=AUWueAB6uvda0m4dKuXxRYIv+DedJNi17etX2iI0EPWPGtlnC5epU7ZQIA2eqGojlG
         SyHlngeL90+vmzJXvZgV2Uj/aNj8N3oTBvpyzKbMlgl7LFbyxyyG1xhtHTRAXOb+y4Td
         lPUAl28h6xvdt3XLNkzgYZvswZSLtxIghAd2lNv2po4Zb3YTU+X8lYizsmKqdtDlaBA3
         obzKPODfIuxi/xlkasZ697UJ8gqc565bP3Htf4HuzkF83ub5SrwLwVPD/4P/M/0iHAGY
         fORrHs+gc6veSmwpIs5elZ/jrUFHd0+7DZFdkpdQn0x2yx/AdTaVfy2cES67hYaxnTBd
         UvLw==
X-Forwarded-Encrypted: i=1; AFNElJ/HYy+kk70QswU2A6+MCQoW4rax/evO98K9YTHsL2sP5mfeE1ylG1IvxUu1T3JRbJz2KeFCEfNuZdGk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17STskK2eLAw4NNw+CQu86xFScibDTnVLrh3fvoq8dpHoMnc/
	LSnZ09s5zEXJWJEPqZfObW42VtXwX6rPiwTgAO6gZEtZpXcElHTY/Igj
X-Gm-Gg: AeBDievalkzUbKr0hqNM934v+BlFsGVPeFq+qPyvoFMBxq2JjV+QC999/KAESr8aM7+
	RiezVtwb/gY4+o4T3xe7iaGCU/fyDMvUt9Yh0XC5LXLYDE/TK65ssURmkjRBw6+rVu5HwTTkAnp
	EDWdnpwC51tHPVEJHOdAn4dCcO4YrCwTLg30AQYGjaK7+ReQqHfTT9l4lNLq/aWIwdnjgNH0wDm
	RAdmnDx3ApMs9eyMJsWCOvr++0gUFPMiJJGgCVMO+gqiddejbtUKPnm6SH9qfRd/JTptaVHOlly
	tYzFEMIeEKP7+8kc04AJkmcpRJyd2SvaGwLgNvcgc9r48Ig6DC+owa5DE0kEFFOVV+mciPoW8sN
	APb8m79o85wEn9wKbauInBnryD5KEVPZxF+OS05V5/vh3KNuK419WIvgAOSo8p9PpmuzeL9ugBY
	GfhACNZR0xUCIF2jImPqfXq0kP2sRJBfSqCG4Ji5UF
X-Received: by 2002:a05:600c:c084:b0:485:39d1:b4dd with SMTP id 5b1f17b1804b1-488fb74a495mr42654155e9.10.1776448358967;
        Fri, 17 Apr 2026 10:52:38 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:528c:590:5bef:9bc8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm56166535e9.12.2026.04.17.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 10:52:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/3] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Fri, 17 Apr 2026 18:52:29 +0100
Message-ID: <20260417175235.224809-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
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
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

