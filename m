Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191883;
	b=yYL3Yuney5tuiH0/iFcoUUZsvBRMIZ9J0OvbViXpvm/n5hFmlTsLXz45JV2qfozwFLuq
	 pmPwii1w9UWVFcFEV5R2Ad1+Ee4cRIim/9zjft38mQrj8B3+XKNFjHWd9D/8LJXZmF6q5
	 6geixOfAh9NJwBj/MxivTrXmPiwiPUGINDKgSD89bgpaaz8TuBvHtKC28W2mblf3RBK5X
	 0lS7wrF02FOMq8lw59TaDM7QGaVYZgXl9G/QvhXdtv8A9SeN6+gNjmfR0Vupsb9DXtNEp
	 2++ziJ1NRqJcmvNUbXW68Hlr07vQrSHcVVkAoiE5r7VTAKyHNmJAMehk0HN1tU0JIug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vZqAF2vd+A7D5oOpAasydBGtPIEXlBigWjwMhyfI4Sw=;
	b=kONLYLVj68y46AVTIg+ty1KrI8I5imiPa+o+FVhkmNB17c0uUohgzGvqOwaElAEgeWR0
	 MZE9IzO3ypJaYFWc46tGvq65H+/TQAYfSgixkX7+nzFVk3CbG+dz/a9llwFHAaKlmA4gV
	 1XIn/jJe/t47xj9SvAmjgmvrqy4O//fo3gbShcKJ2ceBdrChLqU20PpCGcLU9v1k/cW13
	 fQHtJa+4xD0UikFVKBECCI3i7XmYejCNwAd1OmwIm7mZDeCEaEMiGmCEQShZ3VM7F0F0H
	 bDIVV62EhZpI/qHN+BDS9Z5Er4E4LAwkzpqzqdJt6n48to2hS8AvD/G1bomlcrWbMiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z00SL00r;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0A4606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE0A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z00SL00r
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4f540ebso466720f8f.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191881; x=1793796681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZqAF2vd+A7D5oOpAasydBGtPIEXlBigWjwMhyfI4Sw=;
        b=z00SL00raAwzmoOMc7UsE300gGiKWelmwU+7iQP8bh7hefA9C1O1gHSVg9zc69Qke7
         eB9xajUSyGeqtWzO150qpOgSx1s87vjZ+0fdysoa27luBDIXiDMvRoSvo54jKGHUDtt2
         oAWvFGM8ctZuN/GompyQzQuyOP9ioOyN1am4iWq8Abzl005vixllPTTBa3J+ZoQTPj3Y
         UedR6kxpYfBZcyMSjufxuwnCGgfsSXrxwJkXFYfVbT0QX9FkkLO9WWQLgX/0QVl8xDeU
         eToxEguB5kFWjuh4D3aNxE6hWmTDtPr5w81VLLbkpllIlEpEt5YvGCdsr1OKN3I3lfg5
         NiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191881; x=1793796681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZqAF2vd+A7D5oOpAasydBGtPIEXlBigWjwMhyfI4Sw=;
        b=m9h+9m+ICuYRNirSaweu0J3VqJcTpocg0DTnzmwxhZ7QcQZIgZJ87cMLyPXAXumYBW
         yYtPpxJsavmVdeAt94cQmDLNtFz7YqkOY9NefxWb7j0cdqXvCiK7guXBeE/EK5QGnWRq
         /wlyHlpzMMYL/79F/3ZxJTWVHP0ledmva0TKmintvZCvRB0Kpi3AsicWOArW9a9hgxnX
         3B+IlYn3dEa/s2GX94tjrnCkamj7aBL6AAzcP6DTUETSqGCIsma+W2N/e0QHx5t76rKr
         Ymei0/ssnqT0m7ZbZdJi8ehyfWQo6KmRs7wYTLls/nKjulzhKOmAEKgbQ/Suq4Z6sPIz
         Vq/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx96U28R/SGuvK3BYfydp4B5mGuCH3srt1TO7/R4rv/spvlPpaoLJKpmgO/VCnCVdU0qvf1DgTF8/Mc@vger.kernel.org
X-Gm-Message-State: AFq9FYI05k4HYJtlV3A3eLP4Is6v4aVye1AMfdE2ZS1eIIKKPFMYi9gl
	bIX9SawDAAtnGbLYS93pZo3qSeX7l7KIpIL+gMKCLbBqnACmxtLtSU4m
X-Gm-Gg: AYBFou35uUWtWGRQHYYjfbKWYcU6sTUWBQhtXls+KwG/Z8B49UmMMAv7ohqhQ1V/bbo
	Hxt4QA9HHE4ykZmt1C08F2dpbpvl/Ekcb3IBRJCTrs9vPCzYtQGzph67gT8e9bH4TDBze1znvrI
	P4hrmFmNP9C7Cles0MqCJSrfUo60ZiyK5fGuw76NzTAHKPpAhjdCawLoucK9xXlkyRysvIhh5xR
	Zr+wlCB4facmyzLJ6a3YwwL7gwgiiygGuysDMuf1AmyfB6u2WeVHFbDcSDbSsXsX8jwSx82/KpV
	73QnFMJQX1E3V2tqXasax2VwImx2iiwa3fqF5LA0Uc8+Z6wAygU2tJx+gZaD9b9qCQpdIEyWKaU
	uFfSydmg6pJa6Lqszpvp2KKxS54b+uKxQFMWQP+PBvBH9u6QaO7CgKCR2bj03ZNuD519dtlX9Uv
	iDVCsqCFIt920+rGSGNMFkcD0tXiMSMt9hR0MXL6LNf4NvZRxnfS4zY80EYI8DHordFEbzuILqz
	4nYlJDlPh/UFdrwXhDi3g8J90JQ+M4rhVwUeCwyWRqO/IXqBLliPWLMXtjYYaESmTUz+jtbmJus
	hYoTGXjhSpFY4zScTHNrN588svOM3ymANzOgnBDwJZiEJ+3xLIdytJhshHXs4SKFBHS5GVWhH02
	mzaSpRqN+/Pr+
X-Received: by 2002:a05:6000:29cf:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-48e5d284e09mr3853369f8f.8.1793191881203;
        Wed, 28 Oct 2026 05:51:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:20 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:18 +0000
Subject: [PATCH v25 01/11] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L
 (r9a08g046) SoC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-rzg3l_sdhi-v25-1-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=7268;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=TxWUkuLqsg19AmF0RW4L3Vi0q14uYeLgxqal/SpjHjQ=;
 b=DCbKuOG2oH9Nk/IQjhvnexyFOJebBqIRtv45EUqQLHMe5Qavapns9Jrj/E5xOWd8J23mJUK2x
 OLyMv5VjHn7DCmYwtRPvMbt9/1oR0REdtJJeuMOpecup9dd2PARokTE
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
controller is similar to RZ/G2L but has five clocks (core, clkh,
cd, aclkm, aclks) and three resets (rst, axim, axis), so update the
clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.

It also has an internal divider for all modes except HS400, with a
maximum division ratio of 2048 compared to 512 on other SoCs. Because
of this divider, make max-frequency required so that it is always
defined in DT.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Updated commit description.
 * Added max-frequency is a required property for SoCs with internal
   divider.
 * Retained the tags as the change is trivial.
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
 .../devicetree/bindings/mmc/renesas,sdhi.yaml      | 109 ++++++++++++++++-----
 1 file changed, 82 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 4d66966ce290..2bc74288d933 100644
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
@@ -155,60 +161,107 @@ allOf:
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
+          - max-frequency
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
@@ -247,7 +300,9 @@ allOf:
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

