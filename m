Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909A7334695
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157313; cv=none; b=H6wfBTKL+i/HyrGStbSYiQEeMDhzP+Lrr1qX3vgqrDN98RxrS3+cJ7+Y6OAIHhnkmZJARajrBhQX3ukLL6sCtJt2Bw3AY48c5M9fBXRqOucOZ9A6gGMB9YsmprUa31q6JMOepjBmVAnw36l7/l4wBz6cE4k0P4qAGWiPgTkFm5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157313; c=relaxed/simple;
	bh=LGU3EhNzItmD7/F0QP+/J37ZX1QLxCXHqhE26IfIzsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dEGTFTW/xuF/fM2WyJdaGlxWyTFRJgfYult5Xz84wNNeM7zfkqKL1RDJ9jcWDwDbbFtbzzggZE0P2QxpJUQE3as80eS+7vNM5r/g23Krkd84YNDmdj6gshRjqERmscrDNlvsHCy1+aXBmFg3MxBmXXajw8gRCTaPKjPtutoq8nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYcOosoH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYcOosoH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so633581f8f.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157310; x=1780762110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umKfVYTIv6The/YCck3O88OfkMKCNNX7zzNxe0iNolQ=;
        b=IYcOosoHAEoUg/MDxAbVJCb4CygvRqddfkyAIsOnZaoirCGK6C5qXIxeaVkJOKjAqV
         s6ZwLyE8Suf1p9Mq3iYgnmW6oslZCh4juU20JMR4NM2TexFwGEBx8G1CvSMO1sPtp9Y4
         ovUo7IG3iw19Ae8BzfOdJ3BTvGJjH7ESy+XVOc6vAI/iRaGX+72ketXHSL6u+6vVb6aK
         dP7QUVheA6MuNszsgT+uVbDzhqVUxljTelhafsXWyx+L0iZJBRuGaO1FF1izIZe/I9d7
         7DS289yIubELkuNZ9jnE4QTFgjNcqWQgLlSdYzNPktzMmnxr/LaLNNcWcjkiryUnwZYm
         ZGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157310; x=1780762110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=umKfVYTIv6The/YCck3O88OfkMKCNNX7zzNxe0iNolQ=;
        b=qYJs1c6CMyrJNv1Q8NRCLohLHlzecH5p61mNJQQwf67oVNngRyYLrPp+4MyHGh72ds
         33/l+BbVcfTKYmfGM3wR2ICGXLFWGZ0FdWiD9tJOnGiTbtn5Khd4qkSNjOzzObsEiJnl
         rPBoX4qshv0yYEc7zJ+CMO7DoTnY6T4+kYDKCIBhWk7FhrGbr5bWlw1UcY9Ep5lgBb3K
         tutlc15wksHsn2JrfjFKAZisHjfsjVDu86XJDMylYKLHi5l8J25b1Q4tfKb0xWEYyunu
         iPPL2TIjAqUaBUlBfQyqufv1IuYPd6lL7NsNLQ1vgKxZBpIaAr8+1hYoTAw0RRdSM5dx
         DYgw==
X-Forwarded-Encrypted: i=1; AFNElJ/7TGR5aqKGKO+91OstIxQUoNgUk4CyodFe/pEHjY+fwDpuGgF1uV7XRada+q9PjK3dnCBT9bMyWgYV@vger.kernel.org
X-Gm-Message-State: AOJu0YwfTe7cr6Dszm7WR4zdhJa2ols/3zA0B1q7PvNwp+wdvtQQh71/
	Ssp9TQ7hPIMbJ9FtiIHdfL04eVALD5DTRStFv5lBjfyok8hOH41jmH8A
X-Gm-Gg: Acq92OEKWLJTHOh295CLCZ+48bh8rIRd3MAwuk0U81cy2x2oZbuqEZnV45Le9L0HsuN
	qVcCj73cWdEEnkizB04RXHrtLnPSTIoPIvvMTpjkiknaXbYWl32i6ogTULWxZhyIDuF2P4Oa3RN
	5UqFTfTMk+Hjfp0Ck0XaG8x6pIRHZ5+385oNgUgCPwfu/WH2cvKpW6gZ2qrIuQXHkZtd1uBHkwW
	8WRyt7H0xqVFm+GnfWeXXinQXykqKHshtv/gM1+4uxCpdo5H7De3KeI+GFGZybEWiYZXbdazyzz
	JBKtQ8T1QgOVdM+8kFLmwzFvTD5ohoIEXLpop3fCmIo6eEIktxQag2rPdjqGU8Yd229qYnv5kdR
	dncMOtl8eXuXVFXu1KbEh6lFcodEFt1QTvhn+ESLSzj9OxEHcSWNdhGaFvlHMpyMMv8L+scmuqX
	C16Xux7Q5HhyK80p5hjpwv/bsNpadSH6Byi+3tFW3VhEuqBvEwgaH9HMfhwvLYiqTEuJvuaA==
X-Received: by 2002:adf:e84c:0:b0:45e:ec17:430a with SMTP id ffacd0b85a97d-45ef6afbf37mr6578158f8f.11.1780157309895;
        Sat, 30 May 2026 09:08:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:29 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 01/17] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Sat, 30 May 2026 17:07:55 +0100
Message-ID: <20260530160823.130907-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

