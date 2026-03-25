Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8335E34F46F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 19:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466699; cv=none; b=sE5mA38YjVt8Gtx2Mg+ctUOIGnUjrU+sbjLuhbL/BTJnvBi8OwbKsY1f1m0Sga4lyWJHY35p2ERCGkshJ/Hm6YSaUaHRoQRr6UA9prlT1pz1VjesssC/nDYyF1klnJG7XoanPVQKLfNxX1NNU3C/DUoqrAeOCDR79h4M0q3Cfps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466699; c=relaxed/simple;
	bh=dr0hoUUrW6vj9urNlGrnX8d1+Sfr5kIRvgTpPgnWXSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAHJkKWMsJQunURDKBFAbruz2a3JIViAfF0yWtd8Fs+ddEV+/rTz5vmYMd4AYZNiiXNGGtx5gTgW8lwSVnCMdDNUMSZ42mWYLPHISrMWhEltThRPkD1ZY8wR9YHWFwKCN0AqpJGxy1tMZXlVdp7mISbR7nOnpzotqNMhniqBM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBN/W0D0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBN/W0D0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so100093f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466695; x=1775071495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1vQlbGeloOuUiIVtqcbhBtuip2JwXGeKasixrFaD6Y=;
        b=XBN/W0D0q3DscLWOeYzz3MVNA/xiOUD8telENmZ+NPjNl4AroOSSkEdKy/4o9eYiXB
         4dTnCdr+6eS+QteHnfo3mwJHBHJmTfwAGj8PEr8AVwevnziniAj5SED/3LW/iSPmh7Wp
         F4KcUabBA6l6h7jH0tQUtKUqvQjFZkNilUW/z5Ih4cUZ1ONPOtkQlRXLLhQ4Xmp7SlTZ
         MBRvH0D380tOEOc2f+/nhOd7Vze88U8/J3AdZW/0f7/zWW45raM6Yqm7rar2TTLsYi0u
         Z0XAL/drEHw2dUoOHjY5W46OPKEZDEtl4566oqLyiww9+mpc2oieEkueM6ndEGzt3m5T
         GwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466695; x=1775071495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K1vQlbGeloOuUiIVtqcbhBtuip2JwXGeKasixrFaD6Y=;
        b=j5tTz7M4YQacBed8YmfXqPBeWSeZCsLfIukjDo2o+WBA/9yIA1vp+A/CH91cCLDSN/
         JO5lUY3hw0p+FDhvfS4MxZOShkgLhqR1zHKNKXIy7tNM6Iv/NjiFypYbzgHPwwaD5YvI
         Y6YejkjfP5VEjomX26SsZeCKLeNtDq+UsqaUaSjFQOrgOD5s6sKdKvZQQm+3azxv5d/R
         o2wd1RlZgtmEu88VE+3CXnBsLrchvo5XfE1pEXaNKgqG3TK2C+4mfUg1SMQkr7jzdl9P
         uFlkM5F2djJSp1DKQbd5Sus1KPavdq8xTJYxxV7p4VIPJhH0HlWr8lYDecugfVVxfGlT
         omuA==
X-Forwarded-Encrypted: i=1; AJvYcCU6WALDq2JU9CXnMZrHmsk/s14IO2prgkcaaPZ2wsUJz/wMgFH+5Km3VAc5V9t0aaVAnBPd8CRLVwgK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd8jqtb8xWTMA0qOolmD4diqXMllV/wNhX7Z01FlUhnhnH72zV
	QBFwT5lHqMDVM+iMtTONzZev3nabcK60FPKxkPf/QA7gpoQ10buZu0tA
X-Gm-Gg: ATEYQzw4t6BswkbmNTVWZ4IW7ybwkCgiKjAs9j5DzwNZOlXCKqOL8Z65GJzD69caLDE
	qzr/Qpje8Ubuv6HXLHPlkbR74zbMf7twU0CMiLNa8PMrBJ0CHvMPIH4AF73et6iCAcwDLbFCz05
	0XJK5nD/+ZU5edj6X9R1GpDzfgpKJduC1grEl1j302kGnrQXRe4MOvRjwI5y/oecggQLGhZm9wm
	Y1f3PcxNENSQuOvozWps4Q39JF0QkE8a9vIEpamARQI4LmLNvRWkuihtLuTblHldcL/tQDtJfkW
	Utf1rK8WtD5/XGjMgakprxuSleFAgsIWRGkb0zwusa03FpFFpNMRWlEwoxp+vcOfRdu/uFUKF6K
	sh1RKJ2p+A7Rn0T7BCV5EHqGU4FdP7gpU7J9ck4b2xAG2xlmKDibjVtoE36/hBdc7MmkL8MPOr6
	ZxyznKo3GWtXt5eBVqXZTzaNLDZI2yGRuDQI+gGQMpU86ahkpN
X-Received: by 2002:a05:6000:2401:b0:43b:3d83:f04f with SMTP id ffacd0b85a97d-43b889993d7mr7169669f8f.9.1774466694830;
        Wed, 25 Mar 2026 12:24:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:24:54 -0700 (PDT)
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
Subject: [PATCH v7 01/16] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Use pattern for interrupt-names
Date: Wed, 25 Mar 2026 19:24:16 +0000
Message-ID: <20260325192451.172562-2-biju.das.jz@bp.renesas.com>
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

Simplify the bindings by using pattern property for interrupt-names.
It also allows to change the ordering of interrupts.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Updated commit description.
v2->v3: [3]
 * Dropped items and instead used enum for single compatible values
 * Add minItems for interrupts and interrupt-names properties of 
   the RZ/{G2L,G2UL,Five,V2L} SoCs
 * Replaced maxItems->minItems for interrupts and interrupt-names
   properties of the RZ/G3L SoC.
v1->v2: [2]
 * Simplified the binding using pattern

[3] https://lore.kernel.org/all/20260204180632.249139-3-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260206111658.231934-3-biju.das.jz@bp.renesas.com/
[1]https://lore.kernel.org/all/20260204142320.103184-2-biju.das.jz@bp.renesas.com/
---
v3->v4:
 * Collected tag from Rob [1]
 * Updated commit description and kept the tag as it is trivial change.
v2->v3: [2]
 * No change
v1->v2:
 * New patch [1].

[1] https://lore.kernel.org/all/20260204180632.249139-2-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260206111658.231934-2-biju.das.jz@bp.renesas.com/
---
 .../renesas,rzg2l-irqc.yaml                   | 120 ++++--------------
 1 file changed, 23 insertions(+), 97 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index 44b6ae5fc802..a0b57d808639 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -48,107 +48,33 @@ properties:
 
   interrupts:
     minItems: 45
-    items:
-      - description: NMI interrupt
-      - description: IRQ0 interrupt
-      - description: IRQ1 interrupt
-      - description: IRQ2 interrupt
-      - description: IRQ3 interrupt
-      - description: IRQ4 interrupt
-      - description: IRQ5 interrupt
-      - description: IRQ6 interrupt
-      - description: IRQ7 interrupt
-      - description: GPIO interrupt, TINT0
-      - description: GPIO interrupt, TINT1
-      - description: GPIO interrupt, TINT2
-      - description: GPIO interrupt, TINT3
-      - description: GPIO interrupt, TINT4
-      - description: GPIO interrupt, TINT5
-      - description: GPIO interrupt, TINT6
-      - description: GPIO interrupt, TINT7
-      - description: GPIO interrupt, TINT8
-      - description: GPIO interrupt, TINT9
-      - description: GPIO interrupt, TINT10
-      - description: GPIO interrupt, TINT11
-      - description: GPIO interrupt, TINT12
-      - description: GPIO interrupt, TINT13
-      - description: GPIO interrupt, TINT14
-      - description: GPIO interrupt, TINT15
-      - description: GPIO interrupt, TINT16
-      - description: GPIO interrupt, TINT17
-      - description: GPIO interrupt, TINT18
-      - description: GPIO interrupt, TINT19
-      - description: GPIO interrupt, TINT20
-      - description: GPIO interrupt, TINT21
-      - description: GPIO interrupt, TINT22
-      - description: GPIO interrupt, TINT23
-      - description: GPIO interrupt, TINT24
-      - description: GPIO interrupt, TINT25
-      - description: GPIO interrupt, TINT26
-      - description: GPIO interrupt, TINT27
-      - description: GPIO interrupt, TINT28
-      - description: GPIO interrupt, TINT29
-      - description: GPIO interrupt, TINT30
-      - description: GPIO interrupt, TINT31
-      - description: Bus error interrupt
-      - description: ECCRAM0 or combined ECCRAM0/1 1bit error interrupt
-      - description: ECCRAM0 or combined ECCRAM0/1 2bit error interrupt
-      - description: ECCRAM0 or combined ECCRAM0/1 error overflow interrupt
-      - description: ECCRAM1 1bit error interrupt
-      - description: ECCRAM1 2bit error interrupt
-      - description: ECCRAM1 error overflow interrupt
+    maxItems: 48
 
   interrupt-names:
     minItems: 45
+    maxItems: 48
     items:
-      - const: nmi
-      - const: irq0
-      - const: irq1
-      - const: irq2
-      - const: irq3
-      - const: irq4
-      - const: irq5
-      - const: irq6
-      - const: irq7
-      - const: tint0
-      - const: tint1
-      - const: tint2
-      - const: tint3
-      - const: tint4
-      - const: tint5
-      - const: tint6
-      - const: tint7
-      - const: tint8
-      - const: tint9
-      - const: tint10
-      - const: tint11
-      - const: tint12
-      - const: tint13
-      - const: tint14
-      - const: tint15
-      - const: tint16
-      - const: tint17
-      - const: tint18
-      - const: tint19
-      - const: tint20
-      - const: tint21
-      - const: tint22
-      - const: tint23
-      - const: tint24
-      - const: tint25
-      - const: tint26
-      - const: tint27
-      - const: tint28
-      - const: tint29
-      - const: tint30
-      - const: tint31
-      - const: bus-err
-      - const: ec7tie1-0
-      - const: ec7tie2-0
-      - const: ec7tiovf-0
-      - const: ec7tie1-1
-      - const: ec7tie2-1
-      - const: ec7tiovf-1
+      oneOf:
+        - description: NMI interrupt
+          const: nmi
+        - description: External IRQ interrupt
+          pattern: '^irq([0-7])$'
+        - description: GPIO interrupt
+          pattern: '^tint([0-9]|1[0-9]|2[0-9]|3[0-1])$'
+        - description: Bus error interrupt
+          const: bus-err
+        - description: ECCRAM0 or combined ECCRAM0/1 1bit error interrupt
+          const: ec7tie1-0
+        - description: ECCRAM0 or combined ECCRAM0/1 2bit error interrupt
+          const: ec7tie2-0
+        - description: ECCRAM0 or combined ECCRAM0/1 error overflow interrupt
+          const: ec7tiovf-0
+        - description: ECCRAM1 1bit error interrupt
+          const: ec7tie1-1
+        - description: ECCRAM1 2bit error interrupt
+          const: ec7tie2-1
+        - description: ECCRAM1 error overflow interrupt
+          const: ec7tiovf-1
 
   clocks:
     maxItems: 2
-- 
2.43.0

