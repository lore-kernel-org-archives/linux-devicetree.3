Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71CC42B33A
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435013; cv=none; b=eQWoJaQQ4Z+uf+naT87axvCREv9JZkJNPRkScEDDvzt9joA9wm0nJpdqbZt7a7YMXLtaW9ahSw7HeO9vFfaakgl/jhvFzz1U2dvYt0LtScTX5PVMtwPA9nKt4jotPluVsKc01uTk2/I8kYfg3hkANXeUcL5g8z1Frd4LQ/frywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435013; c=relaxed/simple;
	bh=f/qTquKSSQFa0pqnnfjx53CGGTkR7V47887n0TkgzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czZMm1SMiNdipvDyCdGUsPh8183Ort6VaGGPGQFkqForbn7x60ID5uhpuGnLjpHdBl6SstbjAMqnng/E2AxXBEBeZ7B9QdyZFlfn3aWlQk5wVP7+3foCjDYNy84rmDYtMpTGMFv6PB28fQrR8/nqnj4PfI0t1nGLnXigAw7Axhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNGOlhvl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNGOlhvl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c7902f47so26441185e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435010; x=1784039810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A33LPR2qSuWKQrk3c1ruPQev9Ob3rjxQcEtmfQ0dKn8=;
        b=SNGOlhvlwYqOqaiHWwZHqD/rRKvojBxf9B96D+e9TrU0+4Elyxxn93syw6DSV0OeUY
         IHgi6AkfYfM+6pvscT846YmZ6bAdHbdFn85CMbpxCyRgLgDUvWDhMi44SoyzyY5/meTg
         WhO0Y3+n9B7RUHWghlCkWI3gjd9Izp5xu+iQ9LTu5dNSc++v9gbVeJmKLERbdBJXr9bY
         B/5LSfyaEkKFAyGgmsuDu+nVp82tpZ2fyFGkDRqIaBdeca/O2/69UM99gLzkfbwWxWjN
         cQ3hsBrxt42q/j/vH7imBI1VLVhB1ngYpAtxkJe/wkIOlXlOFQz0TGeCVwUD9E06ODOC
         dqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435010; x=1784039810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A33LPR2qSuWKQrk3c1ruPQev9Ob3rjxQcEtmfQ0dKn8=;
        b=ZpoJinW4Y1Obrg7uAldZVsGyGnfdq1Qo6asuI3psQ+qu5H2io9TicuKt+KbdRMdI+a
         oJzlqSH21EBioVN5TZ1QMw+Ib7mcynYg4y/1JmT+LJBfBge3gm9R+OXtX42ISRhZUsea
         pFQThdmJIxXq5h8Yzvc3WO53F0DGrupAa8QfGHP5w8BtoijOfebi9x4TGFPChrYcq82B
         aFuLBK6gUAmzcLKHBS14KQoYjUd44OSO6Flw+Arcw7AEXCP6nlB5oINGXad573WHGV4Q
         07SByMBV4PIgRMWvH9oaW4xUp8Z3kP7Dg7Q9M73DQzZjTpCHJ8Vgae/HlopnwXARPwnC
         zugw==
X-Forwarded-Encrypted: i=1; AHgh+RqhDZaoCc8c/qGUdGPbikqoimwYAy9KgKd9nKE5HtQM1i1nndnHEQGESnW0LdZQZP0AQqVqCB2jhtlX@vger.kernel.org
X-Gm-Message-State: AOJu0YxjoJg/n2JrdetZORfwb6tPpKVAxlRshMiF+OzwclM32F2WtiNm
	i3bWI6XHywaHW4oSmj42j08HbFKnbGzlLJMX8q46cpB+5AenoBeOH3eN
X-Gm-Gg: AfdE7ckkw23BIKmpEHAXqcp4BdfCWJ5j8e40WNiDcK+59csdJGa4ctM6D7Hkb6QO6Ae
	zY7LB1Li0r0kv4Fp3UMkwzNVd0H6fh1hnefgq/FLMcnv3GCi4kTYbS5/4DT74HCy8W3ojqPu/4V
	n24OwDMH7Hji1bI/J8bNJDaAI9+nQj666p9guSiQJPP8GzqyAIskLz7B1haHFtRh7xBPUcY2cKA
	IFEJUMWO9UWiGzZJjIP+UOr+oAMRZqbqrhqG1qTEg30nWvH+IBRTWhqvdUj6GIFMKqib4yArit7
	GNAW4VODpuWXAyg68Wuc8wg9pm3g+4YJmE8QmKqOTxjpumjQbmGF2MBrjC8arHnFCkWsGnie6re
	EBzY/ZQb5Lj4eJzlXcg4O1rhf+8fNtHvu8saYVgCZ/Rb9r45RNXbrfXCEUyUbSUdNdUcBlBYIzs
	yyo6BG2a/+QDBpS3ta3L1kpslUfY7sSJDpuKKtBQ==
X-Received: by 2002:a05:600c:1f95:b0:493:aaf5:6e04 with SMTP id 5b1f17b1804b1-493df04d42dmr66260825e9.15.1783435010074;
        Tue, 07 Jul 2026 07:36:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:49 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Tue,  7 Jul 2026 15:36:33 +0100
Message-ID: <20260707143646.245177-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
The RZ/G3L USB PHY block is similar to RZ/G3S but differs in that each
port has its own OTG controller, whereas RZ/G3S only has one on port 1.
To reflect this, RZ/G3L uses a regulators sub-node with per-port vbus0
and vbus1 entries instead of the single regulator-vbus property used
by other compatible SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Replaced items->enum
 * Collected tag.
v1->v2:
 * Updated commit description.
 * Added enum instead of const in the compatible section.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated schema check.
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 48 +++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..06e003218d2a 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -16,13 +16,16 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+          - renesas,r9a08g046-usbphy-ctrl # RZ/G3L
+
       - items:
           - enum:
               - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
-      - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
 
   reg:
     maxItems: 1
@@ -50,6 +53,28 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  regulators:
+    type: object
+    description:
+      list of vbus regulators provided by this controller.
+
+    properties:
+      vbus0:
+        type: object
+        description: Port 1 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      vbus1:
+        type: object
+        description: Port 2 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - vbus0
+      - vbus1
+
   renesas,sysc-pwrrdy:
     description:
       The system controller PWRRDY indicates to the USB PHY if the power supply
@@ -71,14 +96,15 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
-  - regulator-vbus
 
 allOf:
   - if:
       properties:
         compatible:
           contains:
-            const: renesas,r9a08g045-usbphy-ctrl
+            enum:
+              - renesas,r9a08g045-usbphy-ctrl
+              - renesas,r9a08g046-usbphy-ctrl
     then:
       required:
         - renesas,sysc-pwrrdy
@@ -86,6 +112,22 @@ allOf:
       properties:
         renesas,sysc-pwrrdy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-usbphy-ctrl
+    then:
+      properties:
+        regulator-vbus: false
+      required:
+        - regulators
+    else:
+      properties:
+        regulators: false
+      required:
+        - regulator-vbus
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

