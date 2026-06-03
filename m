Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48144349B15
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 06:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469860; cv=none; b=YjV3PsLXfdVy4qG3mVXNcktIlx2REmGK0BKMfBS4GY1PjVNeG2M7sQe3j9vBGn6dBjuIy34HL6RJgx5taaCEJy8YivFp8IWuzA1Fplqv/N4CrjStC1SPotCfTMC0umfxl8vZsxJNUVO18KwsiTTv7IIHhTLhyAWP8XCXiKPo8W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469860; c=relaxed/simple;
	bh=ktPWTrIQ6kUyMYFIfy7AUvYRJMB22/jk4rE8DMBdAcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0Ay7GOLlRD5Tj4sPk2n/JcsWsp/Yfi5qlZ2KSkt1gQbxvBIQldOoQJ/CaWdMWER1JbljBCD2ujyUVwgQ4Y+ytQV+FKR0YWym4IXvdQx9ypPGweY63JpWmu8I5Ix64sQKaMw96C+gD0PmtKxZHellSxePH4YaogDKIFis8XsDCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2eek9Tq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2eek9Tq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490afc47455so11368185e9.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469857; x=1781074657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxODoCaYbGYHXWV46RIuqQL4fxR5L5CkKK8wbKgagJA=;
        b=C2eek9Tqala0KNlteyH+wFaDlUfs8LX6rXXOrQkv5HAbJBYSYNlMuNewhqt0lsb30v
         zhD5RNeKNjEAP3RE3vbOkMuTVZ0qKhesXwNJXhyl3FOR9PT9syvcJdir4bZqH7wvx8+y
         F7Bo1MQWfIY9hW89lymPg9+vXFXBepXjNTE2PTxKG0pxlXnJHsa/mZ5/+Uaw83wYOo8v
         gOXZxBD+nnVDJzzLEHN9j+haE8cvVJ/IZ/Jkr59eoa3FbuRVog13Iyy3DeHBRa7JlFvX
         +CpCW4kvFjvpffOPEdJU4qbk3Aego1xitJsZq1y3eonLvkhkNCr6Iz9+wu0xLvlg5gWD
         DneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469857; x=1781074657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sxODoCaYbGYHXWV46RIuqQL4fxR5L5CkKK8wbKgagJA=;
        b=kDzeTYdW6eZLyDq9q6MGLHwzEHyrJb7ym/2N+m0Gf4RU2nlXpt2fk8I8tHENve2rt7
         NyWGQuPkJtB+CeyyppKsvXsxVs2JtgMT+xIanJdfOW+bfm/f9IlNuGBPXIdExd4hXbPm
         Wub+X4l2wT78pfGl7OlMNwDw0TCxIfMj8oj+uunO6+GB/jdQ/vqogPimB7piT+j8b7nk
         8DgFMFTy2LITfbZZhiEAYIo0XFPwqfpVhWG+6xNwm5ig8xEHIRD/tJ1/p/SCCSQo2YtZ
         7Vxy/xut3Vrn10Wb/10bEY7LUTSp2Dh66nZ0w3hMWw9QJqROO8DS8O4JuIwUB1Je7ys4
         VvKg==
X-Forwarded-Encrypted: i=1; AFNElJ9+8psKxSqpw0IT3Th5g9CaEJc5eLvEvpIqL3iDm0eCJOLq5HyjIioDguoidZixIWxbyuftzokc37wO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx94phsVbBrOZC94OIjLK/6r7hkpzr0t+jheuUV/4Wx+P2Vut1Z
	3u8xWgIkClEIubbdQdsMYeDXjsVAymj03Y4/wDUUQ/0aR/nnR8tkbBe6
X-Gm-Gg: Acq92OFtHHF+u5dp6dIvfflQQu9GEc/rlhC6oekAo2KUNuZjIMwzM/CDJVe5b82xKrv
	3pU3QD5PUM/RHoNtAfunk43YMUyHr4drRoq00L3Ad6lYfHqHuXJJuWRklTFQFKjXqAZz71ViIHo
	r4vA7+PWDs4dLghrCtX32LorqvQGZi1c66JowJptYjVFE43r9b7NH0j4Phlr3jH2v0LiQIFR3EI
	obIPOfYII6ZqxyjO5qni9/+xwP2I1mDWoQC2YUicUV+YU4fWuL1/KvZtgrDle8YK+9j/Y+hHyY1
	IolAKQGtgxnsR7vazwUgRWfgen24sbEbisILfIittuWEIM6SQ2ySIJiB+SOJOIBr/tjA3KZO6y3
	j1yt+hPHYThn225M9svVnSVmIk3fNV1fPCiEaTXZ/ywGvNYJflodHa4JV8o5hJAaQ0osu8KQQ8+
	xeI+SE65ailmWE2b5MyJGoI0zrXtt0Ow1eg4xcScmGG1wXD+oa3orrWtFgsvc8dDjVkdr9BQ==
X-Received: by 2002:a05:600c:810c:b0:48a:525b:e148 with SMTP id 5b1f17b1804b1-490b5e7959emr31834725e9.4.1780469856635;
        Tue, 02 Jun 2026 23:57:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:36 -0700 (PDT)
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
Subject: [PATCH v17 01/17] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Wed,  3 Jun 2026 07:57:01 +0100
Message-ID: <20260603065731.93243-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
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
cd, aclk, aclkm) and three resets (rst, axim, axis), so update the
clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
It has an internal divider for all modes except HS400, and a 2048-bit
divider compared to 512 on others.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 +++++++++++++-----
 1 file changed, 75 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 4d66966ce290..16cb395403f6 100644
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
@@ -155,60 +161,101 @@ allOf:
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
+              - description: ACLK/IACLKS, SDHI channel bus clock.
+              - description: IACLKM, SDHI channel bus clock m.
           clock-names:
             items:
               - const: core
               - const: clkh
               - const: cd
               - const: aclk
+              - const: aclkm
+          resets:
+            items:
+              - description: rst, Core reset.
+              - description: axim, SDHI axi bus reset m.
+              - description: axis, SDHI axi bus reset s.
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
@@ -247,7 +294,9 @@ allOf:
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

