Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269DF415F15
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411129; cv=none; b=cWMWq93Imf6Pv4WQWi2l/LsGh7ZyX4whj2k5yI9ikMfZCkcBZWLddnMdkiHZg04IaR0JjqWu6YcTXTipXXeCM5tT3kdHRvVoLb1/oMKZ7T86v8h4+jvTdxDj0dobPCDlkO36BfanCAzCGDzUWRIY9kuIl50eF3IStqj7SEUrHrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411129; c=relaxed/simple;
	bh=bTPNo1SR+nhOnCnJHbNOjSLy+khNwaBbBdJIzIBawf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlVRptI2MpVWGvX3i1EYy1eFqzrg/PaJA9yZCIawSM25OfoqN3YyDsv7MvO1ZwKy5pa1cCp3yHK6gCthLzXIg7xcWm2jX7lu5EkQA7tDxEuqOEYoTj04qDB+Ya6bpt820Nc9Gs9YUQHpSWmLj60dKIKJa9k1ByToTiRRVEIqRkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbMF4LNN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbMF4LNN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f7854678cso1133211f8f.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785411125; x=1786015925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IeXk6omACrDle7Hcp2lL0AruC9LDPwvUKRrtnE5fVc=;
        b=ZbMF4LNNVzFDWBDLuiZom00ajEStF8UTnr8xgfZ+0ubf+gxNViXVIJoP+vMO8oJd3/
         /JIgVdv8FqFWCwrlx0QYKNmKrzxgDd6VHzVqKelbE3JsayiRwPquOPsc0fSC4kgp8qOh
         dZnZ72siRQ6UA0ftyihHCH5HI8iT3WBFXT2yeri4AIQ742yF4Kck8u7yymPXcKuZk9w7
         bcQehwAv3wVnCh/XVQ3nLmS9dBz1YxQnlwMabI68d/jdbtkuOXVn0WWemNYZKjUNr37Q
         4yhLIb4MjaqYS2YD6pCakzrJb3A4kR3fc7u7XdxKDPe31jT4DQE11sWw5hfc5DHBPPRF
         +Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411125; x=1786015925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IeXk6omACrDle7Hcp2lL0AruC9LDPwvUKRrtnE5fVc=;
        b=XMeYloOjNEPpn2VDlE5gB55PmcHcV9oWDCSb9ZpBi+uNSvaYZJ2oJPjE9VHMBTd1ic
         Zu58JfwsWvRKpkneEq0hJYck8DynW8QgRwwkWnGEowAyp/WYXHZxU6H3vDv8qHBUaIOE
         x3xpCruS50D6Nw/z9wP0nETsBzuUrw61ayWy/fctnVZjFBS8u8QOGkFY+NZpwGQ7/F4i
         HBGssdAfnzXUhKJYKBgM1Kn8JFonqECTzcE79XcfZ495McRFpC2EPMacUd9U1oimkwM9
         /I/uh82vYtYsOPpLXVarAQR/FLvP+p8K0hDZpbiydgNZu6PisGoXxg0coH9+X8Op4cRJ
         sctQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPXbPBze0xYC5oesopm9ZXUJ73VmmKhlVnfvGubsV1LjTWHcRpwTwhAiqzD9HPhYbNd+l9VpBgwW33@vger.kernel.org
X-Gm-Message-State: AOJu0YwtzK6DT9h7NwHYEYGk7d4ANeBAPBhRziMa1oaNcbR5Q9mojvCD
	JGxyr3WhiRj6/oUKdmmp6DEYrnkSDEubDcxvHDjMLKSILW0W8JKp68BDkdsbjg==
X-Gm-Gg: AR+sD12eQWA2IOll4w7nLpE2pRkC1f7J9JvhGumS7pkJ0U491YQG3IiUEbazcLh/3cF
	sZlsIW1sA4m1Uc0kCGLv5U6e7M/HDqmFcjiMO1QtMVTuPI0arxIU5pBxznODan74bwmwmWbLW+Z
	aLSgc/yuWgg/hKFARfonCEJYf9lgPpTTq+pMt0xMHN2BNgAcEZ6pPkuaHzLxeMN9QXSytxmKVkD
	anH+XEE0Epa5NqL9hU7uvPt24oeTn1+aCpEJKAd7lWV+jiucNxi1fuEM7rSy9iWUuVTrjLrAxRq
	31pNdGF78stddsFaue7JC2Bj6bd/6tDWVKEbnpT/uGE2eq/hZ9NrtLYT0Jsh7zvq5z8y0HUCQ7g
	E5e1rASPF0j9IIlQjOxuSEtnwYeyb1RFEX0+IGQunK8CsZgAuV1s8oTjv2pITjAzkMLpoBA/d/O
	3AGd48s2qGJodyDxWUo0uLoLLPgFrcxY+0bzT/NlwLUIkO/8x+1vsv1l7w2IKgS9NzezhiA8lbi
	WpTYLx/uR3B19oklwyl5VEV
X-Received: by 2002:a05:6000:1a8c:b0:47f:c3ea:83c0 with SMTP id ffacd0b85a97d-47fc8330142mr3160438f8f.48.1785411125107;
        Thu, 30 Jul 2026 04:32:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:eabf:a623:1e7d:c359])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc89351e3sm5737947f8f.29.2026.07.30.04.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:32:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v23 01/14] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Thu, 30 Jul 2026 12:31:39 +0100
Message-ID: <20260730113200.36456-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
References: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
controller is similar to RZ/G2L but has five clocks (core, clkh,
cd, aclkm, aclks) and three resets (rst, axim, axis), so update the
clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
It has an internal divider for all modes except HS400, and a 2048-bit
divider compared to 512 on others.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * No change.
v18->v19:
 * Updated commit description
 * Updated clock and reset description with AXI master and AXI slave
 * Added else condition for reset and reset-names.
 * Renamed aclk->aclkm and reordered the axi clocks similar to resets.
 * Retained the tag as the changes are trivial.
v17->v18:
 * No change.
v1->v17:
 * Collected tag.
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 108 +++++++++++++-----
 1 file changed, 81 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 4d66966ce290..6d229a41a4b5 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -18,6 +18,7 @@ properties:
           - renesas,sdhi-r7s9210 # SH-Mobile AG5
           - renesas,sdhi-r8a73a4 # R-Mobile APE6
           - renesas,sdhi-r8a7740 # R-Mobile A1
+          - renesas,sdhi-r9a08g046 # RZ/G3L
           - renesas,sdhi-r9a09g057 # RZ/V2H(P)
           - renesas,sdhi-sh73a0  # R-Mobile APE6
       - items:
@@ -86,11 +87,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   dmas:
     minItems: 4
@@ -116,7 +117,12 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  reset-names:
+    minItems: 1
+    maxItems: 3
 
   pinctrl-0:
     minItems: 1
@@ -155,60 +161,106 @@ allOf:
         properties:
           compatible:
             contains:
-              enum:
-                - renesas,sdhi-r9a09g057
-                - renesas,rzg2l-sdhi
+              const: renesas,sdhi-r9a08g046
       then:
         properties:
           clocks:
             items:
               - description: IMCLK, SDHI channel main clock1.
               - description: CLK_HS, SDHI channel High speed clock which operates
-                             4 times that of SDHI channel main clock1.
+                             2 times that of SDHI channel main clock1.
               - description: IMCLK2, SDHI channel main clock2. When this clock is
                              turned off, external SD card detection cannot be
                              detected.
-              - description: ACLK, SDHI channel bus clock.
+              - description: IACLKM, SDHI channel AXI master bus clock.
+              - description: IACLKS, SDHI channel AXI slave bus clock.
           clock-names:
             items:
               - const: core
               - const: clkh
               - const: cd
-              - const: aclk
+              - const: aclkm
+              - const: aclks
+          resets:
+            items:
+              - description: rst, Core reset.
+              - description: axim, SDHI channel AXI master bus reset.
+              - description: axis, SDHI channel AXI slave bus reset.
+          reset-names:
+            items:
+              - const: rst
+              - const: axim
+              - const: axis
         required:
           - clock-names
           - resets
+          - reset-names
       else:
+        properties:
+          resets:
+            maxItems: 1
+          reset-names:
+            maxItems: 1
         if:
           properties:
             compatible:
               contains:
                 enum:
-                  - renesas,rcar-gen2-sdhi
-                  - renesas,rcar-gen3-sdhi
-                  - renesas,rcar-gen4-sdhi
+                  - renesas,sdhi-r9a09g057
+                  - renesas,rzg2l-sdhi
         then:
           properties:
             clocks:
-              minItems: 1
-              maxItems: 3
-            clock-names:
-              minItems: 1
-              uniqueItems: true
               items:
-                - const: core
-                - enum: [ clkh, cd ]
-                - const: cd
-        else:
-          properties:
-            clocks:
-              minItems: 1
-              maxItems: 2
+                - description: IMCLK, SDHI channel main clock1.
+                - description: CLK_HS, SDHI channel High speed clock which operates
+                               4 times that of SDHI channel main clock1.
+                - description: IMCLK2, SDHI channel main clock2. When this clock is
+                               turned off, external SD card detection cannot be
+                               detected.
+                - description: ACLK, SDHI channel bus clock.
             clock-names:
-              minItems: 1
               items:
                 - const: core
+                - const: clkh
                 - const: cd
+                - const: aclk
+            resets:
+              maxItems: 1
+          required:
+            - clock-names
+            - resets
+        else:
+          if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    - renesas,rcar-gen2-sdhi
+                    - renesas,rcar-gen3-sdhi
+                    - renesas,rcar-gen4-sdhi
+          then:
+            properties:
+              clocks:
+                minItems: 1
+                maxItems: 3
+              clock-names:
+                minItems: 1
+                uniqueItems: true
+                items:
+                  - const: core
+                  - enum: [ clkh, cd ]
+                  - const: cd
+          else:
+            properties:
+              clocks:
+                minItems: 1
+                maxItems: 2
+              clock-names:
+                minItems: 1
+                items:
+                  - const: core
+                  - const: cd
 
   - if:
       properties:
@@ -247,7 +299,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,sdhi-r9a09g057
+            enum:
+              - renesas,sdhi-r9a08g046
+              - renesas,sdhi-r9a09g057
     then:
       properties:
         vqmmc-regulator:
-- 
2.43.0

