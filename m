Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E82351C3A
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466698; cv=none; b=bYMhpXVNnK3uiPRpX5IiyV3xpM4eu32JDcd2UbI0WCCKMmNQQ3APX3Lv/lSi5NcWAf/ozFyJSOZBQb8gMLyZ/pi1rTmXJGp8ATd/EMKd1WCWgfJZFom/JGVzqMZ6+3tVCT7B4ZViE4+uJCA+Wjtt00SxpY9XWp7sCgB3Cb15QLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466698; c=relaxed/simple;
	bh=VLqRs4Z+TlZFkqPL9lA/KP2hABPrJ6FXrZ5BEUxerfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2I+0rvKWMse+cetsnHDoW+HZlEmMpN5QzjFXFRRHCwMzMlFQfqQYiIRO3a/8NJAgHk4KzgQ8bV+R8sGhla64lua9tQoNQqpHsgD8UPZkHFgd4nyDqzHVfSBfGGy3ImI4IeOSA/TRp9H9V59gZk4jrTp/FuaLoj79Ku5FlnihSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7YkUyqf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7YkUyqf"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b94a19fdso152705f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466696; x=1775071496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFx6UUPP8hEeX+S9NN+ZbAQ52l6KXscUunPIZqDqnbg=;
        b=f7YkUyqfxwgeTdF0HkWPV/I8WvbL/eJVIKReWPo03Ynp6t/RvJCtji6UQUKe3n6G4w
         mrkrXOdL5hb2sBleXd5evtKHkyEA7KLMRNhYeBtlYtmhJ5v+jfhDAFa+/WQzh9nWpbS5
         8fuC2BoDYzGL48ml1BBuzXmzzN/mTqMPLSO7rw5Av8c+C07ARGmezEzE5Fgzhxb3Ajhl
         7gfFvgKJJri+s2SXpqNOoOcKbt/SlRy0dxeRs6TQY/yZyrdxHO0PkjLOPagSwhYDlCfa
         avMyLX3HoSHra0M4GoPKbOoopVZoV+2eIJoYm0TwQk+LK9Q9+Sn9xsStJ3KusuKe8C5m
         ODgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466696; x=1775071496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFx6UUPP8hEeX+S9NN+ZbAQ52l6KXscUunPIZqDqnbg=;
        b=XiqZTmKLeuMsImlElqGv57yqLikicMUEc/8qTZt4zZ/FMZN74PZMbmMz/2/V9GWIp7
         NrHMFzPHM0HxYsDX8fJN4JVFdsPf/OjlYWuVaUN642CBLkHhKaxoxL8fSci+4NVZSUj0
         Vve2a4wudilmo2zrRUzixb7iiYwE7v6ZttCXYmMYowGQBLeglDEU/vGiLazSdaGfNgy/
         cuDUx2KF5cyodxAkkujsBo4ovAjxYUdqqcqtSqc6zvPc41b4gGKX6pF729yaeq0eoMEA
         WQXvNVQb5cCS3TUyPUFlsHcdVewm7D3XlRwwRaRq2Y+MAEZNT2R1nVczRz8IwWRtzawa
         mq7w==
X-Forwarded-Encrypted: i=1; AJvYcCU2bq0vJ/qeBksGDwhsy+xtjCOS/OqwSCJ1LgfK+x0vPgJQeMyjw3Bv1jecqRF77DQhixd/iUhAJjVI@vger.kernel.org
X-Gm-Message-State: AOJu0YxK6eUFFcr00IIK7ZX8yhs6AxfTsG9MK8R2DxupjwI1K8UYUe8m
	mTqG8wy7uenOu1Q9R4CUebnWMI2/NPEExITgeF5vrAhrOn7Di9EWkR3X
X-Gm-Gg: ATEYQzwhBDPDzeeHzryE5jc9lRf/8ooEFF3di7gZ8OlXUYosbMa0TiZaEWyhdPRJjtx
	lrjAL9ObndxknMeA1GhszC1+CRyGMILgPBQ7wbIGYD2DVibcGXp74N3w0X02O6mFRrPX0D+orT5
	Kr4aNkTMPjjy7x7RSi4zqBqt4AdDGruUcQyUuEoqa8IMA2+W671cJUR586p3ytvexWdIB4gZSxC
	NDn0kWkSzZUp6WhyS2BTLHw46AQ1c0XDc3cmIrJl2BPPgN3kgafU8/mnFj3baSJ1rQ58YT6sxuv
	nD9kB319ycDKojl6xvYMTWnIljsukrD9YY00exn23aDNH0jz1tWpC/8toirzAxEkmSelSe1GtGF
	hyLMJ7fX6q6jitNwgeCcWuX1o0DKl0Q7+rKNBS/3JtPbD2Lv+vyj1AHkWFRT4cGxv/pAPpPfnWj
	QqWlRZRIzTDO8vuhsU5eLr22MB94FNrcVLDG7BlWEEbH/KIOxbaaQoO20Yzhk=
X-Received: by 2002:adf:e6cd:0:b0:43b:4989:869d with SMTP id ffacd0b85a97d-43b88a055f2mr5072167f8f.33.1774466695675;
        Wed, 25 Mar 2026 12:24:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:24:55 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 02/16] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L SoC
Date: Wed, 25 Mar 2026 19:24:17 +0000
Message-ID: <20260325192451.172562-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document RZ/G3L (R9A08G046) IRQC. The IRQC block on the RZ/G3L SoC is
nearly identical to that found on the RZ/G3S SoC, with the following
differences: it supports more external interrupts and GPT error
interrupts, and adds registers for GPT/MTU interrupt selection and shared
interrupt selection between external interrupt and TINT. A new compatible
string "renesas,r9a08g046-irqc" is therefore introduced for the RZ/G3L
SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * Collected tag.
v4->v5:
 * No change.
v3->v4: [4]
 * Updated commit description.
v2->v3: [3]
 * Dropped items and instead used enum for single compatible values
 * Add minItems for interrupts and interrupt-names properties of 
   the RZ/{G2L,G2UL,Five,V2L} SoCs
 * Replaced maxItems->minItems for interrupts and interrupt-names
   properties of the RZ/G3L SoC.
v1->v2: [2]
 * Simplified the binding using pattern

[4] https://lore.kernel.org/all/20260227140316.308106-3-biju.das.jz@bp.renesas.com/
[3] https://lore.kernel.org/all/20260204180632.249139-3-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260206111658.231934-3-biju.das.jz@bp.renesas.com/
[1]https://lore.kernel.org/all/20260204142320.103184-2-biju.das.jz@bp.renesas.com/
---
 .../renesas,rzg2l-irqc.yaml                   | 43 ++++++++++++++++---
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index a0b57d808639..3a221e1800a0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -30,7 +30,9 @@ properties:
               - renesas,r9a08g045-irqc     # RZ/G3S
           - const: renesas,rzg2l-irqc
 
-      - const: renesas,r9a07g043f-irqc     # RZ/Five
+      - enum:
+          - renesas,r9a07g043f-irqc    # RZ/Five
+          - renesas,r9a08g046-irqc     # RZ/G3L
 
   '#interrupt-cells':
     description: The first cell should contain a macro RZG2L_{NMI,IRQX} included in the
@@ -48,17 +50,17 @@ properties:
 
   interrupts:
     minItems: 45
-    maxItems: 48
+    maxItems: 61
 
   interrupt-names:
     minItems: 45
-    maxItems: 48
+    maxItems: 61
     items:
       oneOf:
         - description: NMI interrupt
           const: nmi
         - description: External IRQ interrupt
-          pattern: '^irq([0-7])$'
+          pattern: '^irq([0-9]|1[0-5])$'
         - description: GPIO interrupt
           pattern: '^tint([0-9]|1[0-9]|2[0-9]|3[0-1])$'
         - description: Bus error interrupt
@@ -75,6 +77,8 @@ properties:
           const: ec7tie2-1
         - description: ECCRAM1 error overflow interrupt
           const: ec7tiovf-1
+        - description: Integrated GPT Error interrupt
+          pattern: '^ovfunf([0-7])$'
 
   clocks:
     maxItems: 2
@@ -106,6 +110,24 @@ required:
 allOf:
   - $ref: /schemas/interrupt-controller.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a07g043f-irqc
+              - renesas,r9a07g043u-irqc
+              - renesas,r9a07g044-irqc
+              - renesas,r9a07g054-irqc
+    then:
+      properties:
+        interrupts:
+          minItems: 48
+          maxItems: 48
+        interrupt-names:
+          minItems: 48
+          maxItems: 48
+
   - if:
       properties:
         compatible:
@@ -118,12 +140,19 @@ allOf:
           maxItems: 45
         interrupt-names:
           maxItems: 45
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a08g046-irqc
+    then:
       properties:
         interrupts:
-          minItems: 48
+          minItems: 61
         interrupt-names:
-          minItems: 48
+          minItems: 61
 
 unevaluatedProperties: false
 
-- 
2.43.0

