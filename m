Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF64347FD7
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182269; cv=none; b=kNOfSvdkW48kvy5u6aQ14TfD9OgTXqNsIuUYqwoOHBO3n6BRxGRZCfHIx6wg+PDASMx6XH7S01WiplOa+ba0jjwSN+hBM1FOpAHgZfolI86w1OgwB/ObdHgJLJIC1rB5hsOEUj4lO74iogDXH7utOye18xuXgbxlay109FFFWxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182269; c=relaxed/simple;
	bh=NqL++QS6pCKA8dKHUyiOCiT56oWQTwHXVPj7oO5XapU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1i4MQWFJ2x4h0PhRzwzI2lQQoFwLZe3oCVH9HW7hW9eCh8fRl7gdd7S8V6ifw2nKKVwFEsAF5eP6m0M6Yn1Vf8G/QbjmEwOr4fQ8ArNis7EKy5FkUj/0yra5UGTVoi1JTY8KFEvRBAhn1+aO6E+Pm3n5Q3QBjZJWhZ3B1N4TUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4ERTGXE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4ERTGXE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso3376260f8f.3
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 05:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182266; x=1774787066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gap/Q33IiQRtCOD/Ll2fknn9+W00XJGVBJHUg+QgTgw=;
        b=h4ERTGXEIZPYXgyqjMFNER4XF8Keqj/N/KzJDNLUta5zQK0Q4qWTXLyd24hbeILYLJ
         4MTQp1YLkMtPp+hua0Uh5LiCroI5ghfCGoxVUUMhBJFJWVOLehsYHy9a5316qL2S6F5Z
         JnwwffMfSDMUHhfwdlupCXZM+VJ/xdIV28ha479sSwVUqerC2y3axiIMHtbiIKUm99ol
         wq+6LK6ctPQh2cE0HZzPC17wc5nZ4547ppAeANL0p9reqMbgyWUjwPKQjVQg+5Njy7oY
         Q04XO2aJdDJ3OUls25iltby6Oumi1GFUC5kL8Qj/dgQCTLOLvWI4n2Z69iWxPD4/bGl6
         qxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182266; x=1774787066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gap/Q33IiQRtCOD/Ll2fknn9+W00XJGVBJHUg+QgTgw=;
        b=AbjLm87KYtLHGurl9tv8uGWwn8/URJj1r4pIZI3RWHfP2zwBXy+Ha690VMx43f9gDs
         b1jL8ShTP734LoFElw+Gec2EN8hco2oXAucrN0VBNttRPkmSkZPmNR0v/1foQBIWl0/C
         1NTr1W/czyUFV7fhiTNG8IyEo7B54NOTvIQk7MSQyCLiau74UMwF05wSCxEubTUcLKWP
         Axjpzrus5qdzzxXMGAjwSaWTsoQaX2M+wCH5ru5/8SxfQpSnTUe4pTYLN9sS7OZdZaxc
         FoLaC4icnVyT+x6LLKXbWk3WU1yRIKxcnxGA5ZUzPlHJOYExMiJCqBAksNErtzdeVOOR
         DyjA==
X-Forwarded-Encrypted: i=1; AJvYcCW18EEeK0oBTnuCX4xk7dTYR+O+f2Xuomk6/5vFk7DG27zVq1bQHhRjDEScCGufAScZdUt1QSrddeKY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8UBi0bmpIgtJ3qGR645KjCaDxNOgweRvJ22OIcClXdVs+E1pN
	5s2oUBKzspnj6rPBt4FPZOqpEoM4aCL2886nLTrGkInrWScrgnx/HJnY
X-Gm-Gg: ATEYQzwgYuHkfSyrcdFSCRdeUWy8D9CHQ8d5Suylz43QB8roqEgqnyBD5Nkmkd0Sf/Q
	HnAW7fnttbDEKM3PYdCLPmwJWtgaL2zVu7cOrJcARyI3dN9fu+WHvIdY5D5qYD9W6z5Ycm0TWyh
	7gYW4+y08zpM1PNwlcdywAYpVB3cs8UIvKzb8J5RPpWwN1YgmvSVwHcWUTYfzggVX3tRcZuqGxX
	/aotRWfqhbUeOvwcBNtfmK/RsigUH9reTVicufE99n3qRneJgbILpaJ0wp7CZR1oBperm2/whh8
	vDiZRXiQRGKGTqxKBszNQpKkKVpyIRqSC/T7epcWETuBzWtUawBiEcC3vRWO0wUMCNmxmxJQBCQ
	lpMuj24Kx+nXhWzzzxqdVyc1laq9fskEkkx0rw3PzH3TklnfFFNq7sCiNWI42pGtXzzZiTuTeLw
	tIefsf8qxQo7IZLZzgtzdgJqhKjsrFuiKZGPPbd2+9oXN/ayW1
X-Received: by 2002:a05:6000:24ca:b0:43b:45da:f296 with SMTP id ffacd0b85a97d-43b6423286fmr13975167f8f.11.1774182266443;
        Sun, 22 Mar 2026 05:24:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:25 -0700 (PDT)
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
Subject: [PATCH v6 02/15] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L SoC
Date: Sun, 22 Mar 2026 12:23:45 +0000
Message-ID: <20260322122421.132474-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
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

