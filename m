Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93A63EBF04
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005145; cv=none; b=eoTl+57x/AjZ+rZXt+nQn51Pwa4gcZ6LrW2NfY9HjR4SetVOOQ6j8qQ4YNzSO5czV66q/floSk8QDecWiWOQO9eAJadsCYX1hhz9y4WDjEouhVc6HQYh+jOJbWMmsLiWRuMKRp1cGTvJzRIh4KBmoZr6Otl15Nt8afULxsNCm0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005145; c=relaxed/simple;
	bh=hFuaXMBuOsZvycVnG5qVkZeVz5/9NRuZ7/y9BtjtH7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUPe4zsv5FAvMU84B8eYL5L29/9DSRK2zQyx6mJr4l+P94l7WAEODdL+E+/seDzi7BpRBq5I7XZfXPz9GvRhy5Ot2TaK288XH0VO85Qiqlsk/ck8v26p4YGuta4aC3FqA3JFycyutgEIIOMAf1xSCM2YVm4Uiq1wNjmr2ld/rCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnHEGmiV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnHEGmiV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso36930255ad.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005143; x=1781609943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ABlpN+jPxbmTB0MnLce2t9pp9M98KB9DN7jc9qFYRY=;
        b=RnHEGmiVLLbjOKUrJPpus7niF8zeafRAphwpPiN71X9degIXm87nX8M23Uxj3rhFHc
         KIeysW1KX7lo8DcVFrPli3Mjs2RhRFLtYUsSA4Bu4SQAfLo/PS4PEoM/iqOQxsLqGqCQ
         zCqXsWziXItLQNR7ZcerxBSK9B1dNq2sAcSAiUUto2ImRb6HfUPipqsceTjrQlEm+dc2
         se3rPlHIvoisMdn6vsIzfccMAlglboYrkwDMHUB5ryyPwJTOXuNvkiLzLf+z7/7/gNll
         vL0CMYVl/ubTyjj4WDoNQJUHcjDejki0bypBOsDYhcWbbJqnjwIETh5plRwVRwny41FP
         N0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005143; x=1781609943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ABlpN+jPxbmTB0MnLce2t9pp9M98KB9DN7jc9qFYRY=;
        b=UQ7/A1YILivcBOPWLXJdXJQA4w6lqJi4tgsEdZ6e13VvufbeG+Jzqxd1W6Ty12V4Rk
         mWvo0n1c4MXsNmSTQ/X4YG2K90p2vFQBktJQcdPnFNtigH9YcnFw2KCPq3UYwJhxhF2V
         v616gPNHYv5qK+cp2+FZnMq8oO0m9thkh68CCUke+NT+Fxz5Po7IU+zcEvd/JwI2tDC2
         rSkzZ33lzRdLQ5uKWsXF9YyinBoXhE5gAPbT5jmovrt/lBnryq5HBQbekcdHlPPgsZ+i
         pD2NYRs8IMPZ0k09ggmZ4G4Fi/6kIvFWyY21bRpu864l88gUJyV6tW0m9/d5lMfw9vOF
         eRZg==
X-Forwarded-Encrypted: i=1; AFNElJ/rpWNeWVoolkeClJQK0uwVoXDJve9zvQ8phE0939xixLS18Rqc5I75IxjSYZn9DrtKBpMosPHC6+cY@vger.kernel.org
X-Gm-Message-State: AOJu0YxP2TxTv6EpHVvxynBJvsA11TKLC3AMXCDQB/4XUjDuQqJ5bd+x
	P1to84/+xxO54IZ8/gxXI2rOwijcb58ksuD6klfM0/7sMQLYTVp6TONk
X-Gm-Gg: Acq92OHQ9RZ41lLrWc7cVC1kukLSbDWQMTWBYM1oX6DoLeb7dfl9JXe0mJ7DDoX73WM
	3NFAiFIaiAklJMnhyFezUv+XvMADTVLdPPmAUc3Lv/pZ/sm3UnyBSYZRsncIpPfYGTtDvY6zuqz
	/7AK/Y9s1s+JrTFlx4wk6h5gRsB3tH4xANGdVHSZofpl5w8A7FMFjvmx/Cb8Uike75rB0sPN+9X
	mET57uxC/uNmKPu4/YSnu+cEZ9EXx/o6UpjysbARthij5ee5a1YO+Q7GkeI+n1dcbY7DuJ89UhY
	sQl0fx9oA6UInTiM9ywQipbVqR0bi+mnzbheD8LvGahcOMegSacALkh/ZQ1jxIXrzHOQ3hrpyON
	+PjqUwzFpNwI5BZx0SHe9/kwP1G7avMZQpICUy7RP+ih7/Ty2vYnbIlKXeUZsfCkHXaIh/r2lbN
	g9G4kQ10B2Pgm6YKaFgsjjaJMm2nTR9ep8JzKMgUU19+mkYThTc5821FUeOb7vpX4EGCqn
X-Received: by 2002:a17:902:f745:b0:2c2:2a8a:af69 with SMTP id d9443c01a7336-2c22a8ab1a9mr174051145ad.9.1781005142987;
        Tue, 09 Jun 2026 04:39:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v6 01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
Date: Tue,  9 Jun 2026 18:38:26 +0700
Message-ID: <20260609113836.45079-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
accessing its registers. Without this clock, any register access leads to
a system hang as the FSI block sits behind the SPU bus.
Update the binding to support multiple clocks to properly describe the
hardware clock tree, including:
  - SPU bus/bridge clock (spu) for register access.
  - CPG DIV6 clocks (icka/b) as functional clock.
  - FSI dividers (diva/b) for audio clock generation.
  - External clock inputs (xcka/b) provided by the board.
The hardware supports several valid clock configurations. For example,
when both FSIA and FSIB operate as slaves, only the fck and spu clocks
are required. When a port operates as a master, it can use either an
internal clock source (ickx + divx) or an external clock source
(ickx + xckx). Therefore, while fck and spu are mandatory on r8a7740,
the remaining clocks (icka/b, diva/b and xcka/b) are optional and depend
on the selected master/slave configuration and clock source.
Both sh73a0 and r8a7740 define the SPU DIV6 clock control register at
0xe6150084. The binding therefore documents the clocks supported by the
FSI driver for these variants.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - DT binding updates (drop uniqueItems, commit message) based on 
   Krzysztof's feedback.
Changes in v4:
 - Update dt-bindings based on feedback from Krzysztof, Rob, and Geert.


 .../bindings/sound/renesas,fsi.yaml           | 60 +++++++++++++++++--
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..803945b7f82f 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -9,9 +9,6 @@ title: Renesas FIFO-buffered Serial Interface (FSI)
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   $nodename:
     pattern: "^sound@.*"
@@ -38,7 +35,32 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Main FSI module clock
+      - description: |
+          SPU bus/bridge clock. On R8A7740, this clock must be enabled to allow
+          register access as the FSI block is connected behind the SPU bus.
+      - description: CPG DIV6 functional clocks for FSI port A
+      - description: CPG DIV6 functional clocks for FSI port B
+      - description: FSI dividers for port A used for audio clock generation
+      - description: FSI dividers for port B used for audio clock generation
+      - description: External clock inputs for FSI port A provided by the board
+      - description: External clock inputs for FSI port B provided by the board
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - fck  # Main FSI module clock
+        - spu  # optional SPU bus/bridge clock
+        - icka # optional CPG DIV6 functional clocks for FSI port A
+        - ickb # optional CPG DIV6 functional clocks for FSI port B
+        - diva # optional FSI dividers for port A used for audio clock generation
+        - divb # optional FSI dividers for port B used for audio clock generation
+        - xcka # optional External clock inputs for FSI port A provided by the board
+        - xckb # optional External clock inputs for FSI port B provided by the board
 
   power-domains:
     maxItems: 1
@@ -69,6 +91,30 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,fsi2-r8a7740
+    then:
+      required:
+        - clock-names
+
+      properties:
+        clock-names:
+          minItems: 2
+          items:
+            - const: fck
+            - const: spu
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7740-clock.h>
@@ -77,7 +123,11 @@ examples:
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg = <0xfe1f0000 0x400>;
             interrupts = <GIC_SPI 9 0x4>;
-            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                    <&fsia_clk>, <&fsiack_clk>, <&fsidiva_clk>,
+                    <&fsib_clk>, <&fsibck_clk>, <&fsidivb_clk>;
+            clock-names = "fck", "spu", "icka", "xcka", "diva",
+                         "ickb", "xckb", "divb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0

