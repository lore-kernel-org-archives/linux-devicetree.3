Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ABA3346A6
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182268; cv=none; b=PzWQMZKFVqd62zCXIhWoe+PEkZgBM9wiryCyoCkYE/vy9+USi8zGpVg4jMaWo4EtjQX4ojuy5Yj9dp4kIsPLKZiyJ8D+MO2KN8GDli6HmzYqLDVVhS3SAe5fy/FGCeIDk8lEoq8WD/kZKFk+Nh2FACnnqd/cwQSP4AOei/BGElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182268; c=relaxed/simple;
	bh=lxacpAYgrpBPEvUlWUsxBUzA3CNWIf4N6V0WaXElW3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lqr3JRE9StiUGr3bnGJWVFZ+88J62b6KyHAVhwkfnU9jXR0WTxpLCXQwmG3MfvnIuhmyWF7/cMGYwRcsP1BUTG6e/mPWLeNMBb2uHbyN+PkNJZfaCU60BqnG5HMewuuGxGQIiW8Vb8eFSO4e1B+9cdlnT+4NkPuOs614Rs9r2lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyqiZZrN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyqiZZrN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so13211195e9.0
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182265; x=1774787065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YREtjqFTpGoqOZEEhucQYxmXOC7F6oMHgtKmEcTK5j8=;
        b=gyqiZZrNhBkYPDeOm3Ed6B+33Uw3/FdOErVKE9okHM18ECEneYxclVN1iooJDhNu9Q
         Gi3Js7XwwFwz/+gAEmZ+wqkUmKWUSSqDjg+8NASrkg9wv9NI1nvPyHLklBkkm1DM+V6E
         3W+3BZwbkLYsAt+8AaURdBlqJDQ8sMYXp7r07xPVRw8DlP6KwBbEy+KDbJjRNfNT88xW
         6ndAEoB3Nfd2yfaEx3iq3no1ssjxppbMW6w7Lj3zvYdFauG8JupK6irHH7TF5t2Zoyxr
         5kygZqkAYyv6JBKRSY7cqZkxmQs2OB5hM3xEl3f/67bYlG0+cPK83p7qhGGdRiZvCtO6
         VZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182265; x=1774787065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YREtjqFTpGoqOZEEhucQYxmXOC7F6oMHgtKmEcTK5j8=;
        b=or5H8N/J7qt60UkqDJH1uhTqJhPnZ9MoPNPcc9V1t+nIu8mwAt57E4kTzvaqVHTSwj
         JZXEn7LOcrFO4/U9GL580P3pZT67W+ZX1p9aABJCHvxuCCIQErmUGIaXXCgaflx1WOf3
         RZ7D4UL9TGX8aLKTewDXxEUyVPi7SKXLWDexzpZ0KaiBn+Tm1QUCXNaBHiu1LfjYAWz2
         eVTgZn0XyFQTIpqMDXAykBVmV/pZzbz+NqqLHPR02KoOUCq8jT1kkXP578kVlZnRIytC
         1mYBibIlNrTO1tgjVg31F0ksjzQkjEgbIOzLREXu5vl9E5MJ2mnEndS8CGkWVZEfOWdo
         uI7w==
X-Forwarded-Encrypted: i=1; AJvYcCUmxcseBRHhvPkNaocVHmD3Y3fSc5T33GwWQJl3p6cEjKk2D28ItiKLlFyJkusQyMm2wZ79mNyUdjxJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwTIFFJSm88/Zl7BnCnAsZx1A8XDAgjEsbC3phl/oA17nvEwVcc
	COrD0hoCPUUecyyX3YKki9CekHk63MUAKMNOZ4jG3Z+aPXXERCMOxILE
X-Gm-Gg: ATEYQzxOuOg5RDMX8k/0I6iT79jIatb1VANeHEChkD49VPky78FHGTnVD1AKyUYjmXA
	tllS3/oXP455RKekOIZjXEJTJ4XxzzL7E3/3KqL5Iylsb78QUrLGfGKg2WpJzJSIXnXFRTLOSai
	retUu6qJAmnrG/DEaP5qquiKBKe76QesbuLBQ+9EcUIaQZCEanHVwbtyOe7Fr8PkWhBFJ1d3EKs
	TlXjRLOpwb5qfzjVOnjfacEzwn8M2Pn9oPW9F5VEWLoBctaLDuoGrrmB5/Gz5eA8odZneuqXJoP
	J+QIQALKi5tVAM0J3kwEcuVEGOFCGKD/j8FDIwf/iLeX90kur/LV8uaQbKYmuDydaA+cbUhd5ES
	lbSHRctyyU/oHAGJaStGs0rDaNspwxLhPCgl3hLy7vaY/fOV/SHAta664YwMCc+/260bkLalWdo
	336ftmtmapKoAsYU8Ckp5ZAVZtkFif0RgCgv6fTXsmuSVZUHZZeZUYsvOWxgc=
X-Received: by 2002:a05:600c:c84:b0:485:39d1:b500 with SMTP id 5b1f17b1804b1-486fee0d859mr127791845e9.16.1774182265147;
        Sun, 22 Mar 2026 05:24:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:24 -0700 (PDT)
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
Subject: [PATCH v6 01/15] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Use pattern for interrupt-names
Date: Sun, 22 Mar 2026 12:23:44 +0000
Message-ID: <20260322122421.132474-2-biju.das.jz@bp.renesas.com>
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

Simplify the bindings by using pattern property for interrupt-names.
It also allows to change the ordering of interrupts.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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

