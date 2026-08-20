Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60EE47F774
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246225; cv=none; b=UF8xwsLAPbQpQa1L7dCgQA0C0rTRVL63wy0Mfa2Ol+nRqJFtVpvZLnb+O79npsu4/TXhfq4XhFOBstv0p5AFulrCtPTl10EtavQHGA4BSNHaSC9AhFky+dSJ6uL2VRxAgcJ6neMRUN905HHBehFIz0F9lGBz1Gob1s/xvZEG0Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246225; c=relaxed/simple;
	bh=LeJpvsmE8/8oIBqIo77XO1N7ZMpxYFIy1g4h/XeP6k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ErDU+vEt5B2IQLK4Fsx5PTjXnKMGeLwxoxGXf4Tr89jKZ8hu57pMwmEdYQpBReAnaVrvUf21RPNc6+d9L/PwPe178rz4AO7PQRK7bJb88KzVGl10opJO3Y24MIFOsJsmtOUn5ouMF3znFDTbZMFleJ7zk2PW3XfUMy3i2LRGS8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqtgzFvC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqtgzFvC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso785605e9.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246221; x=1787851021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LF21JGxH17vVW7bu66t9RUZbiTMUiqLzjDtcuysGx8g=;
        b=EqtgzFvC/8tZwSIQeZ3NNUYmSPpWX99V0e/Gt71iqqI9VMA7aCbgxRy/oRwXfOE1+G
         Ja7rlwRkm5LHoKpNvubzzdPXjEi31BwHDK5wWGIPTGgc9HqKKlAVuR6va6uMQspv/Er7
         9t7D+a9vAIOpS+JS/CLZvIz4ePEcyLHxAmYA0dwiqxq1W9pjXvHfzuEw3FLNadKXL/5p
         PeyvNuSVYeqw4s76vxMgE7rl0etGisRS6QO9qFgUqGYxV2uPZKWVwPykEczXtEfsStH3
         lB4goOmmK8Sm/6blHFyQXaFOhMfRbmej1m4RC1dX77vDSpS9oEJOc07xWF+LM6duG8gd
         Q0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246221; x=1787851021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LF21JGxH17vVW7bu66t9RUZbiTMUiqLzjDtcuysGx8g=;
        b=QeUfV07ye+rQbj+VgSZSoN6JvPUjQfOmBI8iGQbv7QyomY8dKjmNT1mtMhkFDx4deE
         +fnRODgpOpV0jK2E7wO5UWN5ql6uXVyrTZ5MIZl2AcJyrxH+GK5iJFLqFtv0oh5MQdct
         o4zQt+n13793eY4RMjNZUno4aMParpiE5AHoZpbb4iEUF5eMZr/YKaJakIcP4RRFFPsA
         oKNvrVSJKd5bMuJnE/nz3QZrNagJKUnuOwE3MNcgGpV65lZHv1qGzDS7t6TZL1jk0Guy
         05rqZNDhHJa3mT4DcWXvCLWGphhQX0jKsitcox7QsQrhXOknf6hXtND2n0T6WikcZKQg
         8vZA==
X-Forwarded-Encrypted: i=1; AHgh+RoIGTrI7A8Be4A8X/inp4uWn9eJYPPdTwOtiYI6qDIw9Vq39TYgMLG7M2kBD0D1VoHbTHKmsp+C7Eve@vger.kernel.org
X-Gm-Message-State: AOJu0YwxoREC5uuuYQoL1P8YDpLvjdyFYi8zc4WR5WYu0UpqH1NX90hf
	+mHiXPqhO6+dEPgDBKXVCbZwrwBu2gt/TYxCvMD43dnHStHBlhmUJvXB9NnK3Q==
X-Gm-Gg: AR+sD13mLwpCdoXHlOUdyc7S3wQdIGtS+pfWLP5b039Z5DIByRxCiRLwilJqlEztYaK
	pprxDjaRgiWJ/GJECiDSz1LJMk4MzMCxR3M5wpti+JFstPTZHL7C1jjjJpe8nvu4Ew4BFvIpNmm
	GefwzrOdMgZp1KghdUpArM0eaE8oqsiB/dDVCKRN3YKzxdN/GSaaiXxh82gSc8vvEHCz+YmBzTP
	iCfxT94mpeos7qMMWcFnGECUuFPDLBijmDfmYRthpJYUOZB/YZIXuPQdq6TTqSvFzgvj1DklMDp
	yUODdk2yVXDmfZBrCVOxO3UbiB63b1mMRn2mDv/2l6Y5k9CNRHgnP5DXcWa06r8+ZcBFDueT+/t
	E8afaCmOeqA2saD6IeOTlyPGfrKXza94nw93I1GcEMr9XRkploTBM3BiFIR+5nKV+bJJ97lVEag
	a1naPi/U+iFFyHVY2072ObnHz4RSXIYENjR1X39sZXVhBoLb+pAEh/aQLpTr55A55V/RonIw==
X-Received: by 2002:a05:600c:6211:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-499b82e8e9dmr9581305e9.3.1787246220686;
        Thu, 20 Aug 2026 10:17:00 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm219313495e9.3.2026.08.20.10.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:17:00 -0700 (PDT)
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
Subject: [PATCH v24 01/15] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Thu, 20 Aug 2026 18:16:31 +0100
Message-ID: <20260820171657.62815-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
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
v23->v24:
 * No change.
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

