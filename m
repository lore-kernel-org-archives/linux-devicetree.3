Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7ED3BAD9C
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074880; cv=none; b=IrJn8BnnFpxh5ZECblprJWQloLuwWcmkkn7jUgo3pt44s7mBVJpDDZJrKCJtW40WngQvAAaaNyxsmYq2dxXRqKvhKiGzwSEE49aNsKI7Vq/07C3alvehjyZUNFLYQIE7OH6uSsko/Ps/b7kewr54yzn1yN+f4uxZmnKHGvv1aIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074880; c=relaxed/simple;
	bh=r3lJLyo4pwKES9BKycKLT/FzReE1LAodZaW0RGMG4wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sygcQcZpTuxhmSI8mZVM1liYroWpq+gR75FWIzqrYs1fCZhqfe6Z+M0ksAAwo4ShT4C9pg5KRlCj3Wvn7aoAU47njf2Od+mbTHD8aUCP6yq5VLNq2sNcySQNGWyDhoI7CuqUxYfLt5TeRkeU7G/BOF43Q2+/T+Ya59nwAQBHPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXMbh7Xk; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXMbh7Xk"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f0fc82c76so1045335b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074877; x=1776679677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkTJde6ErisNFz71GX/g+WRnRx4lnEoOHW1gq8vDPR4=;
        b=sXMbh7Xku6gnotaijSj5fqL7mkcQeJyGJQzAczF/sOI+mJ/WUFEd9PHllggbZl/xvj
         neWcTmvuK98tpb45QyjupXNi94b6yGOq51QRxAc6oCbJJVYW7Z9yLOWcY11MVI722SxN
         Lid7iaM71hWjAmz+NlB576hRrYl/hSxKwd2I7+12W8ba/EtmqeX1zBgC9e/qMrwxVStt
         ZL5GAG5m+nagL1buW9D6Kt+wcRdKvEHIfqg8Z/mZ2dv63iR18LeEHXYSKj4ZA/HBPRL8
         myah57R0WCb/FjQRUnFZGM1N+UAy+3G1LM5NxfGTQwsQr6BdqzJ5msVv8f5idNW8EcUF
         JTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074877; x=1776679677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MkTJde6ErisNFz71GX/g+WRnRx4lnEoOHW1gq8vDPR4=;
        b=CTpIYDA9fzYP5j++mDYUiKHlzIMQmpl0LJrKSOy39JGtdksea6bDHhpmoZiZcjmiXa
         hN44VZ1Yo742wT3EDWtK5VeE7AaxycR99tkegaECv8nlax5HbVvKVWQRawkoG+t4Qa7X
         +O5M6UKu4qEqPFwJWz15xCPyn409H+cHlhuxciwcusHJ/fXBHyxtG5VfaTim20Tf78K1
         YVm/qRkfBSPgMtECTmCRHfdUjDEjNwQLiwH679f0TNBZgDa7RiZNGzMuz5Nuw2j9MgEK
         LvbJH3IkwVYhLXRNbdQ3+PoxaL9xPHk0BgaFiLkH237FqLzZ6FtaoV6vzG4C2dOluLBt
         uSCg==
X-Forwarded-Encrypted: i=1; AFNElJ/hyQkMttgscGVrO0ESy5o5yol4Obm3x1IMGCNO1g5L9MrtI6EMdh67G7sejtsiyRF+j3redixdZ1/c@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLkMcIelN6+FL4CdoH/b2r3+aG1XAgqeK2kXRODEG9IPcKnz5
	G2nT+U9bOT7ox6810Dhy2sphp86o9WoqeV6jtVHt3KaDpA0qCWp1nZov
X-Gm-Gg: AeBDiet2bfhksKcxCZ04i1Apll3j//K7UCpQ5CEH4deS2T+MO461WqTaEdd47R7L/7Z
	x9IpY9feXuFeWS2lYRVsDCGNWTajwaLZ+SjQwqKLuMNpnos3w48qGVJaRcRU4w78PtXfn1bHhHv
	4vqGlbIrHC/hq8snW5vUV5JUSXJAgy2G8gTM71oE+/ZGhHK8NyvNUzpmBYBBB8uXAwJOxq/n88y
	5c45amjM+NoOxYs7c4Cf1xtwEQh3PXRUVWObRMvei87s1ISQDwQvHcNjtYomRz5AkHPAzVhTohW
	6y2i1er1kj/VcciXzqRfWh3ryGXrHx2C1NKejo161p61Ui/BNGKvuVn/GIpVwvhPaoM7zZVVgKz
	QumjP1TaGueZpX94NeJiDxZntj7b3FwSlYjTYVITmOhXSoMdE4rMqdtZaGmA9U5U954Lxvdf4n6
	RYWojkUT4tBfvYBc+oxz50GDmNzG4B0k7jibzVq5DlOinHixf3EnSxP9IYDA==
X-Received: by 2002:a05:6a00:84c:b0:82f:4cc9:186d with SMTP id d2e1a72fcca58-82f4cc936a7mr445459b3a.46.1776074876725;
        Mon, 13 Apr 2026 03:07:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for multiple clocks
Date: Mon, 13 Apr 2026 17:07:00 +0700
Message-ID: <20260413100700.30995-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
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
Update the binding to support a flexible positional clock list to properly
describe the hardware clock tree, including:
  - SPU bus/bridge clock (spu) for register access.
  - CPG DIV6 clocks (icka/b) as functional clock parents.
  - FSI internal dividers (diva/b) for audio clock generation.
  - External clock inputs (xcka/b) provided by the board.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Rename FSI module clock to "own" to match driver.
 - Add "spu", "icka/b", "diva/b", "xcka/b" clock names.
 - Use YAML anchors to constrain clock-names properly.
 - Add "if" rule to require "spu" clock for r8a7740.
 - Update example with full clock configuration.
 - Clean up schema by moving allOf location.

 .../bindings/sound/renesas,fsi.yaml           | 61 +++++++++++++++++--
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..d0ae54f3d321 100644
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
@@ -38,7 +35,36 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    description: |
+      Clock driving the FSI Controller. The first clock must be
+      the module clock ("own").
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    description: |
+      Names of clocks corresponding to entries in "clocks":
+      - "own": Main FSI module clock (must be first and always present)
+      - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
+        enabled to allow register access as the FSI block is connected
+        behind the SPU bus.
+      - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
+      - "diva"/"divb": Internal FSI dividers for port A/B used for
+        audio clock generation
+      - "xcka"/"xckb": External clock inputs for FSI port A/B
+        provided by the board
+    minItems: 1
+    items:
+      - const: own
+      - &fsi_all_clks
+        enum: [spu, icka, ickb, diva, divb, xcka, xckb]
+      - &fsi_no_spu_clks
+        enum: [icka, ickb, diva, divb, xcka, xckb]
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
 
   power-domains:
     maxItems: 1
@@ -69,6 +95,27 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,fsi2-r8a7740
+    then:
+      properties:
+        clock-names:
+          minItems: 2
+          items:
+            - const: own
+            - const: spu
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7740-clock.h>
@@ -77,7 +124,11 @@ examples:
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg = <0xfe1f0000 0x400>;
             interrupts = <GIC_SPI 9 0x4>;
-            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                     <&fsia_clk>, <&fsib_clk>, <&fsidiva_clk>,
+                     <&fsidivb_clk>,<&fsiack_clk>,<&fsibck_clk>;
+            clock-names = "own", "spu", "icka", "ickb",
+                          "diva", "divb", "xcka", "xckb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0

