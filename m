Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7583CC7CD
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781675; cv=none; b=W1i299sSzdkfnHZcIdRokJkAew3LmrS4NyQbS/Dkp5hiidhxeUQmW079BQwYdKW8X9ORA6JYFh+n+qmwCG7q04j06+5O0SIAhk/y4arihUlDOZPYShJs8DTcdYrHhr5hekYXsxxlbSJ/5T/I2pMSUpaFjQrUO05+SMUr0TrPy5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781675; c=relaxed/simple;
	bh=n1DtoBZuhb6x6ID+/i33USvSYjT6QvCCgh+3YAxC/u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNoIKMAxMVKf8r1lIHyGlXCX7YTzvnEMr7PqVBpr3pIDNz4knTe3cjVI7VRX7N+mys6t837tXdZNoplUFHevHIJLvGdSUCpvfJxS4lDUgEqOXHY5GHQAkNL0VhuOftfVUYde/zOOH1U4sQ2j1n4mkhIEhWzaB6MLy8lQ7T/GSuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuKOxmeB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuKOxmeB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49039a8851fso46486945e9.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779781672; x=1780386472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBh+uiKYVAcFVXpV57ihLoKRc6InQ9I4cC8J3sHjzn4=;
        b=nuKOxmeBT9m/6yHF7RE7yqqa3Z2L5LFhk+VG/dNTT5B7Q0ai2K+MFwuSkvIwSDiAYm
         ep+TINppXKeNL62IPlv2I2wbwQoSyqQ7+nuS2NQ7wEhSfXRiPRRK72EHot+FXgqACbDZ
         MEnyNDkW57Edigtf1iMa914m9kOt0pu5e/reGA30wjgUoLCOymTVrR0MukI9h/bdcU3U
         7HT5DyhfM7a3ymt9YbnMIkh4THd/SDXpWvzKRmz9yTCMQYJhYcTzILseSvuQyxrnYGzj
         PD6r9/mBmb/9pY4JyvKU4Xl7Gl9PWGAxnc2FT6Kaz22mC3GCF0udWgQruEO7IWp5cQgN
         Thag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781672; x=1780386472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LBh+uiKYVAcFVXpV57ihLoKRc6InQ9I4cC8J3sHjzn4=;
        b=phuhSco8w8H9SgnkSpD/7nr4LZRtH4AWV8t+yoL5sYIYhuShPF5mBsz0MHFbJaSVgH
         fvVh9aiTR5+McxXz+y/AZQUGp+Qfm2aFouLs20EeOSFD45MkMWf2Bfmu3AQXHH0yGu+J
         lVf2MTdnsmvvWae4PvJzCHjRw/wD9aIuF3F2FDV7IxQuISgAWP3/jn++wE+jLR0O9ADc
         +RUiVWBrPRpvQRfy3o5iHgX2MSsGWV5P84NPN3BgxRDQ7u1yBgwxqISZVOL4BE7k8bxl
         SzjZSEi8ssXbUcyz4fvGt3XRTOP2XPAq4lukTDq+MBRt/2TYiOItNtaiubjzqtgdaoOB
         pufg==
X-Forwarded-Encrypted: i=1; AFNElJ+XvtTSL2D1jwz9uJg49n5CJJUN6gf2bEE4R84jkQGUk8vNsPnPGGpI9GtbB7wfyHdPKNFxzOLfbV86@vger.kernel.org
X-Gm-Message-State: AOJu0Yw10C94/yOq8mnGa+R9aPm+EelaMbRexUMF1IowfT8ne8yw8hf8
	j1EjPBhdKBElFEpdkH7nuYfyhpykr4KTJLvLgZbAajOsuLzBrmnH6EtV
X-Gm-Gg: Acq92OFk2obv9lKZHSkzwHyGEENOvCEOP5D1YUno1eYuEf57zBDs01GOc2maWTzTZme
	20HQXosbFteKt+jsr1ZocgWr0L+/P2nw0cL6AKLF773MusX6ihp1QxSPw2GDOXexHTYBHr6zoTx
	oHGGuxkEp3qRrSvRAZ9kKmTsetnli64idtxA7fBO0FC8xVP23XQ2tbzzo3s+mBh6hhCbdeCc2y1
	NVd3gen/gWJfsSCICUsdnRew9MeUaqUwSAbrPshVmYPP/QXX5q3N6aIONtBw6dgKP38+nwqrlGh
	OcED3/WCSayYkmofgPCK2qcR80QlpJCv3J8KBlXDMD0X7j73PlF9xyF32AZA53KJeoRNn3C/kt/
	BQr7qAU5v7fxbjoh9hPrVFPpPcW2kEwV432HoXIAw5AySm/PFqzcV3BpMXDTiJeo6xhRtpjMYqc
	3f2yFGFuq8YkNOW4x1USAKfjAgQ2Wo4y3NnWOvwIgpgXyU0nDqRGQx1l2VyXI=
X-Received: by 2002:a05:600c:470e:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-490426aa413mr288737895e9.9.1779781671902;
        Tue, 26 May 2026 00:47:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c204:f511:e9bc:10b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d63f8sm102848155e9.18.2026.05.26.00.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:47:51 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Tue, 26 May 2026 08:47:42 +0100
Message-ID: <20260526074746.20371-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526074746.20371-1-biju.das.jz@bp.renesas.com>
References: <20260526074746.20371-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Collected tag.
v2->v2[1]:
 * No change.
[1] https://lore.kernel.org/all/20260524195829.960401F000E9@smtp.kernel.org/
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

