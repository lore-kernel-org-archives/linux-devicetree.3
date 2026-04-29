Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E599401A08
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482026; cv=none; b=p9AWtfs8mKoadTRem2S16CnTzJFhr1jFvj9IUYx7215EdBPh6suV7c+Dd5PTt7xx2NCnJFCg5B8IRD5HOBnT6EJvIuvcm2YzqqzDeFpqY4xd7Jb7sihnZHmilpP1NEM9iuU1mK973jDhqaMOpLwMj84u2kg/0zzxSkBAUay2pmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482026; c=relaxed/simple;
	bh=bLNTtKp/CVda7Cb/aKSAn7N01NwscsKfgXsH38fKinM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGeNM8qJ/W9L8VVZDsFbBQz3FWAdouVGbYoCGzzQsv7w4E35D0vMY8oH9zDl/lEwsRZ/56M+V6bgMumbIrXi9V3SpjqnsI2xS+ELHgQ8D6tip0+CauxTl7rF5tDZUmEcE2T3/P5Kbi4g7c4EXXXJf4vN/0lfL7xxbTSCgz4KBSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDAcqbeU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDAcqbeU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso106659865e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482021; x=1778086821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikSPOGR4XXwx0JwMlnraIx1B5HOIyelZFy6MXUSY+IY=;
        b=iDAcqbeUiZp+yqy63C3pV7kcXiTBNCxawfja7sk/TkZXr9AVhFF5oNqZLJgRvjiYrI
         f+/GmU4jmR4jJuEpWiJ3YDEML5mxIJDSjxq5wfOiU0f+zWWtSqYwtlBdh2zcWZPG1szt
         W57Ab9IHcucI+0A8+L1/SrihcWp9Osr4sZsb7VpmJ9pfVTYp/yhP7CAECG13ZgH6Eikx
         +TsBo76+7KlNKOoYsXqfLde4YZtETYqvtrudT6B83cMoJLBNe4IBFqDcP+ezIsHw43F3
         Lu3/IkZszuiCIYKz05Ru/lECE0vKSY0LmT0df77c/cWMTyMawvoXMkjPsGeA9SxpKlAp
         P1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482021; x=1778086821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikSPOGR4XXwx0JwMlnraIx1B5HOIyelZFy6MXUSY+IY=;
        b=V1y5kOz5yDRdsRcoMBBv7Zhx35sdamP7X/4dbpMFvM1YchzX8XUEM+3C/McNbHQ/a3
         59POkVe6uaCoky/jln9UHUg7+ug+BWiD+qKJr3qZROZdjfx5RFiMW8ZH0cECkrkSt3gy
         Vt71a5sqYXpUsKvqD1NrqSSuPBrH+mf4KrzKJ6oOREFtSrxmFK7YPgACkTnyfGYHGejH
         wHhWtw58jKY+J0AW+NwGKnanu4s6UuC7kTZan/AfKAlVMrUGhpG7t+ugnJb0nFxD5jCx
         ONlwXyVzC7Doid4nRD8z6gTvYj7qTZAEfg+ylj4UgwMgo43Pjrn31wHinWMZacvxHhca
         819Q==
X-Forwarded-Encrypted: i=1; AFNElJ/VfDY+Yk/kE7cWqhQ5pl/EuuNIqxmhxGtmKq9cZY4HgSH7c7HOtWxFOMSsFBmm7tKXmwmMYq3D7SpQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwjwoBmGICBp2K5SYH7+XnvNclY8p3CISv4iLl5Iym96rrVLLW3
	6MuKc2PFCMDBPo6ZfExH3gwBB1lFq4hUesdueZecaiFBXENej0ljtDOZ
X-Gm-Gg: AeBDievqmQlQvCmWM75AZYjaCQRWD5ZZRVcAlEFKPMAP7DA2jiFwvxsOJr74aXd5wL+
	zV0qz3WkgFe/Gimkl6nTGrVOM5z+nkRZCS2aBL+hurJNZeyEJW75QcLHjLVPreMTam8Kbj/UMLZ
	kO3IF2wc300GSSHG1LIqxa+EfDjKvqQ9vj0aWLZaHE8EFU1KWALlYYZm7c7ghHPOmvjQeb9p69L
	ozlJYxh+r5BG+wN+q8GL7WcMUoa6P9z/jRqvrl7vnXD/gOVgfjI2Kk0XgHnsJjR7+PMKUBfDS7P
	9DaJ7rv507R7RhiuuT1byDbylBHG9DdnNumUw5uoXlxNcn4s3ohts65YYb5GK5XTRYMYnCbZtEc
	Lt+XWUoY2yeRPiPckKuEJmXqj0n0m6Loi0QgazKThYzoxQl1aiWEoHCUeUZxqa7qSgqOwWC9+zT
	tW+4vzIr+q4v9kvToblXXhEQyoTdWyjCzcvkNizEeUJhaGBO3L9EZrFm8C/EUlUCc4nthQS5siE
	ccvoD6jGDCun1K5241Z1NWlv3Pdqx7lIUyoXdQGIyJv0SuA
X-Received: by 2002:a05:600c:3b0f:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48a77b177aamr133031915e9.15.1777482020092;
        Wed, 29 Apr 2026 10:00:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:212b:3a69:4f2c:3897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm4809755e9.6.2026.04.29.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:00:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
Date: Wed, 29 Apr 2026 18:00:09 +0100
Message-ID: <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.

The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
supports the DPI interface, but includes SoC-specific register differences.
Add a dedicated compatible string to represent this variant.

As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
RZ/N2H specific compatible string with the RZ/T2H compatible as fallback.

Unlike other DU variants which use a multi-port model, the RZ/T2H and
RZ/N2H DU has a single output and is modelled using a single port node
with one endpoint. Add a port property to support this and update the
allOf constraints accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..45678d536a75 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -21,6 +21,7 @@ properties:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
           - renesas,r9a09g057-du # RZ/V2H(P)
+          - renesas,r9a09g077-du # RZ/T2H
       - items:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
@@ -28,6 +29,9 @@ properties:
       - items:
           - const: renesas,r9a09g056-du # RZ/V2N
           - const: renesas,r9a09g057-du # RZ/V2H(P) fallback
+      - items:
+          - const: renesas,r9a09g087-du # RZ/N2H
+          - const: renesas,r9a09g077-du # RZ/T2H fallback
 
   reg:
     maxItems: 1
@@ -53,6 +57,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Single output port for single-output DU variants.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
@@ -83,9 +91,7 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - resets
   - power-domains
-  - ports
   - renesas,vsps
 
 additionalProperties: false
@@ -137,6 +143,20 @@ allOf:
 
           required:
             - port@0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-du
+    then:
+      properties:
+        resets: false
+      required:
+        - port
+    else:
+      required:
+        - resets
+        - ports
 
 examples:
   # RZ/G2L DU
-- 
2.54.0

