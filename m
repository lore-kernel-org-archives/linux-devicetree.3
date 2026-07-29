Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F1485CD6
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329758; cv=none; b=HN1GH8ahG/rYfvWeN7zd2TlWOCKR+fg5HRGx3CxXZJbRt/02GPzbHJkAXgtcxkGKX9g8yUii9y863A8Qlhg/jySV1R6NO66M9Gg1Xv7OvSs+t9N74zhNJ13EXM9iOoj97YjK/LyWtGE9tjIK4dneZi6GC20VLQobEOoEfuLexgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329758; c=relaxed/simple;
	bh=6s4x9/iYJXYX0zHTiQrcGq54M4eLmLYzY1R611/qq2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYQpTU0QpOWYUnGWQSnwav3JRL/gYoV3gxviNFiUhuSYJrg15qUTtfGtRB6jN5TwOIwnPe764rmX0c0GaCgfdUbAVa3r3+GcZD+hvbvPPJs7As3e35EsYhXrbyfUzfORDI3oCU3SbDOWJbc2936+NlLVIHaq7yxSLdiMOYC34uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmAI9uV4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmAI9uV4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956242332dso7868855e9.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329738; x=1785934538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCw3ZoTpTvwXL1Q/JdFXSpFnxqVRykvwjEQzV4GY3so=;
        b=MmAI9uV4QqEdnfdHG6EilX2DH9DfXK4AQO+jLV6zl9jEUhWqU/9XN2DO2qRypBvCTs
         t0whyu5ZpywHIJPTSviEtdm7JCncn3XuyBsv414cZmNYDgCVVYYNILpP02TWOOTH7Bp3
         m9SNVbZ3W1/xdvJN34fvNgBbQhLmST9psLcXeeJYv8InNekWJsEaDPgOaq0XSjDdS0KF
         pdoZI6mumPsRLKwqaneUQH+Inugw9w1GWlpFglRuWSGlqM0Ygcwa9tD0/xSi9zLgnPcJ
         5MT+wp9nMYuowQysF1aryHRMeQkXxJhmqjwj8CPcFlsucBK7661Yr863Fc1nytw9yakZ
         rTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329738; x=1785934538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCw3ZoTpTvwXL1Q/JdFXSpFnxqVRykvwjEQzV4GY3so=;
        b=qRxeUFQDkRq35NC5+b43LqJMxWwUN9h20iI+QsuloWqWZqr2+a/7HH8YH403HWW7jp
         laZ9rMruyTdM525WjET1HIh3FRAchfpRB8Cl4S48RacyCAyFzKdngHG7YjBxT3paFr66
         Vo2zRe0VuqzCFJBgZI9NUc6zI5kMq3DM6c13lmkF+b/cw7yr/BIkMFw65+UDRkO4DI4s
         l2efV+zpoqXi/D+7DmmfKTRR4CsTgkF476osBVxHqtYfXKUTS0jx2NraAlxUAhFrXW7N
         5f3tnUte1oWjBK2Nr/oMv3VoppSkZ/WAbLfw4zhRTSs+cY/DFTgOjydTVvBGohKo5JeR
         +y7g==
X-Forwarded-Encrypted: i=1; AHgh+RrkeUpNX8e1IO6I7vPDiYihLaAag79N7FZsKkhsUE27lhIX6IYN2826zrtsa5xlJvi/ItPICM1nxN9i@vger.kernel.org
X-Gm-Message-State: AOJu0YwsBznDmzCz1DJzCEluHwzhCFEvIet12cLHDKLW0RvZrbwKcU6r
	YaBD1PM1VhAOFUlyu1y+kC1Br3U9hSexn3PrYtaHR3+xX+rzP7rsxsU6
X-Gm-Gg: AR+sD11EFtSMEEmSiuSnvtJ4r2r5AdB5WJiVWNpCMPQqIqgnWYsm46W3Yn4cmNrzvTl
	qfc0Tv+sF3PzwVckrYPigO9G9w8p1YI5NEwQG9D5zBH2Cg8Ex1MPGCtIc1oIRKUx8NI0s+ttwdv
	JxV35Aa0NaIQWuAEKhDsbLsRTWEF2I1A7uWWPvU+Lkx/nRtSJS0an1Ek3IRxPTUDnuRSsdTd445
	oyzaUMTiQlO+yJZGktnOg6PoYiaOngsPkoDb25+HejG3rO6SvVcMlVLLBWsxUR7dPiwbW/fDr+X
	1kRIGiPx8+M7WKhjaoM/1Bd2LkcTbDQw82/55+951og3Jb6NwYrGQMBmdn+D6Fufq0+dS2WOSoU
	lPZANp+ibt3nsvr7UGqyW5CGnUXTq0/Xho+H5lqQpCNOW64w4CDdAq1jc8BckHec/nlri1sIBTU
	taPL/WMTz4XKTTJNV6umStaenFmVIYjtATHFrcQKO23Br610jzqLG0zaHoRx/KydX46DpbDMyAm
	Rj8s67RxuTZtg==
X-Received: by 2002:a05:600c:3e06:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-496c65906c8mr73830425e9.19.1785329737590;
        Wed, 29 Jul 2026 05:55:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:36 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 09/16] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Wed, 29 Jul 2026 13:55:01 +0100
Message-ID: <20260729125516.230757-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
v5[1]->v1:
 * No change.
v5 [1] https://lore.kernel.org/all/20260625172359.292631-2-biju.das.jz@bp.renesas.com/#t
v4->v5:
 * Collected tag.
v3->v4:
 * Dropped the tags as it is a rework dropping parent node that contains
   simple-mfd and syscon.
v2->v3:
 * Collected tag.
v2->v2[1]:
 * No change.
[1] https://lore.kernel.org/all/20260524195829.960401F000E9@smtp.kernel.org/
v1->v2:
 * Collected tag.
---
 .../bridge/renesas,r9a08g046-lvds.yaml        | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
new file mode 100644
index 000000000000..4cd7b688fbf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
@@ -0,0 +1,120 @@
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
+  This binding describes the LVDS encoder embedded in the Renesas RZ/G3L
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
+    lvds@108a0000 {
+        compatible = "renesas,r9a08g046-lvds";
+        reg = <0x108a0000 0x10000>;
+        clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+                 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+                 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+        clock-names = "pclk", "phyclk", "dotclk";
+        resets = <&cpg R9A08G046_LVDS_RESET_N>,
+                 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+                 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+                 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+        reset-names = "lvdrst", "prst", "rst", "arst";
+        power-domains = <&cpg>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                lvds0_in: endpoint {
+                    remote-endpoint = <&du_out_lvds0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                lvds0_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

