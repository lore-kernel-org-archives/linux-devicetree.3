Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A442EEC7
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606707; cv=none; b=PyPb4jzj5RP3rA/UJV/fFdPbalvzqh5pfAKHaMoMZFsqLTDSyE/BgVtUEuhz97pw1El7pO/tMyyNBDCnVKAJS9lwEY6R4CeLkE1fdh0FMUCAuv7hA8t78N0dI0qcaQNKItp+RfM/4m2wV8aIoSkwiDzl2QZMVIMufwhhT+jKgeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606707; c=relaxed/simple;
	bh=hE/rAa8cIAFCiSwRAOdCUx6p7AMGdkVHFDY86sn+p18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbOw8annsIVjfstP4p1DrZdqTs/8K92RIs95o/STWIHiUSgBNF1/+ZLA2pFEBpMMxBJ6SoLC6t8gREyfsaVva0UaFwhmOFCrojMl4OYBLZjmxnlqY0stdq2covco8+V4RPvUc90qwhYTlluNTEI5rohr5IzUrM07OeIFOvxzmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYPvnZ0d; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYPvnZ0d"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so42538755e9.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606704; x=1782211504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9LQ4o7glj9cP9c5+t5/R59fIbvl6dlD933Zh2HibUo=;
        b=sYPvnZ0dU1J2QO/GBpeKT4mtUXsB/kruclxrVUQ8vHlUBqS/u+WxWcQKkF9qOf8R6t
         SVzFzlFRsDE+EIBcDXSlzeKyt7r2jTACORqtlYINHn4lF1rlm9KTlsy5eap4al3uTqlx
         k/ZNtcYUdQVxhYSourrx363d+vD4t+utsgmeR08Ucjku7IxID2An2OgI8M3fYc42Oh8x
         bYV+YJ4yOGFDwStvh5rGPY1Rsh5vQ1oOYwVTxpNYo3RqlT+5l2cigNQ7VXp7ebHWlkfe
         rOoQX9YycCPRqhM2yFBX2txWxd8st4ESKGSd1xB77WaWOX2DZVg3GA++pFJ/dP2c8Fzs
         Muog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606704; x=1782211504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9LQ4o7glj9cP9c5+t5/R59fIbvl6dlD933Zh2HibUo=;
        b=gznPNQxI7g9Ih+nr8RwWF1/lH8SZ0l7TyR2a9MR4q9e+QyYuLZgMIGcKnPjBB0MSbY
         /t5J1t5jJeNDeSTzYGdIGWknOyB1rpMnli1foZk4kMjoD2SDjgN+LMYD52fTJf5I2FQr
         wFFAE0IRqGUIsc61aN98H3YKKhxGElmRp3mjIF7f32YIY1htbSE9xAXildOkj/wxR9QU
         cWGqjZ2o6KF0oO3oHI1GSBTGDTrRx3dBaNInxhZi7iaSDSkq3/otB/HmSnh1Bqep+4hw
         ICGvL4aEtQYeSUP6IOtriN6ivmAgN9U0BVXBvUykhoTtoypz407cWrqchpKfZ3f77BFz
         cC7A==
X-Forwarded-Encrypted: i=1; AFNElJ89a7STL4VaGH5nLRFO1rPZ9W+jAuwIQx5K9ZT/zcRPpOB6IpePQ6ubKq5+mTn8AM20RrxTvE5NYBzS@vger.kernel.org
X-Gm-Message-State: AOJu0YwVVg4QL1dfmdBuQRYU5jV7WVQzSeS11kStE0QqdoaT4IxoB9n+
	7AdwJg3lNUEgCyVcZQgx9Q71OqEi3vXpLui2YvCwCgbOXv9+4enHawr4
X-Gm-Gg: Acq92OH5Vv9h/YUx0sVE5MXaUYbGNKsH9MTaf8T4w+2iyebQqdKq4OLPcZtXughu0Sj
	dbnPI4uHjYeg+tefgZvaxDg0rYeatO7h+HexkgIkkeODwZDOCBPmokyS2SDODw/uYbktk/YXXmm
	H/egX427CHdOcgwsGIJ8jfA8iyo+upq7ApX/BDeFzMEABss8H5FOz/KLa95KYANygQJhYY5nw5c
	xQl4JmAmcT4rAHm617l4OYflRR+rPswvOtRnVX7DvlmnJch3776kEa3oAmiJPh6mjY58KMlUn/G
	EICKjtYy92seTS+7fpX0AdBgBgajR3DTA6YuQWOC//IGpVlYRG+h8SoYfTA2AIOJfN65wtE6he8
	W0fV+v8YiPoganjS8rxFMb7ZWEauvGVsazJF+1nz++Pi93YVA1GPT5nKyCIdxJ5NNwb/lt5qvO/
	RaySX7C3vis6/kgdjPSiKmA7fkdBT9g0j/htOjkbAC6ImUJ7cO
X-Received: by 2002:a05:600c:4205:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-4922fafc737mr28884945e9.16.1781606703933;
        Tue, 16 Jun 2026 03:45:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:03 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 01/10] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Tue, 16 Jun 2026 11:44:43 +0100
Message-ID: <20260616104459.410743-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description.
 * Added enum instead of const in the compatible section.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated schema check.
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 49 +++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..12da48d069e5 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -16,13 +16,17 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+              - renesas,r9a08g046-usbphy-ctrl # RZ/G3L
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
@@ -50,6 +54,28 @@ properties:
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
@@ -71,14 +97,15 @@ required:
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
@@ -86,6 +113,22 @@ allOf:
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

