Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BEB2D97B8
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782770978; cv=none; b=rwdvhMUQB9vs68MG2yQwDfWLr2bL83Q819TKD5GLw/pWJ/X1LB21GYHjI2wxRoYBek+1lP8MWClxg1rwKpSdzpPAsQrpX94+QtoGkU6gTKBoK6iH4bOeuGOo6IJf8sbMWC+D5okzMvqEkWrUJe1pnpvXaUDit0nJM47amjMAuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782770978; c=relaxed/simple;
	bh=J1xatfoXArnQvu4XHqmWyqC0CCrKZwNwJs3W4riAnsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pN0qc3gGtiSHQKBKPaAn5En5O9FKWqOciLJ5w7c6b1ftOsi3nEPPbRJyE2GLFrhmG+8r/woEKdwIFXaYftOWMrOn1ckUxHf7S3iRwgOXrQ9yru8yM8FnoqYNgEtDbnqpWdA9sXibV7gF7DNXc47sjaND9WHw3gmzIvgYJW0rIuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVlNJ2sI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVlNJ2sI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1776606f8f.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782770975; x=1783375775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ3vj1zojnGTs4zgewnFfNyAq4pm40w6260MawCoMhk=;
        b=LVlNJ2sIl9E8YY0r1wY6NkL2gF+QpFaBeULcEQhBOTjhjaWi0j+g9s+13wwyLTS0pJ
         8Wo4hJ/dRjlxvbxOE9CkdKApfvYX75yTKE+m4bHbhar1wYTN3pqQGz0swS7UYDnd5HbW
         FQQ/+S7GO3FKVNduVji53ly70EAajBdaNO6ACau9b7MW2Gh4AzK4d7+eFtnOHf2WBBQ2
         UantPrrfNjRCOy7UtzTCLXSCIfF/2VeDTzCjp/Y50MiieyPI4mpZS2T+cAU7FNKrQi0V
         1WqCX+1BW7+Qgb82O7TjzvyeDMltUa/StmiqO9pRlIioBy3UYAEn2aKv1+8rEBy3N9GO
         neYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782770975; x=1783375775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQ3vj1zojnGTs4zgewnFfNyAq4pm40w6260MawCoMhk=;
        b=KcLgTUrdXUgpmdbUyaLHOm0NBXqNHOXz6opUGZbDsw8DE424TjEgRUiEn3ZZ7UDPH1
         R1uwaU2q1sVUN6swFYLY2mOIRXZAXntpNP7aY9FX2hbe+s9ks7GBUWau3qPVeCdhgtdW
         jz/syKbK7bK9mbgdvWvyIc4D/Uzj29Ho5kv0mRBQUoS+ERN+fjGf927OIvo/LB30fP+d
         /Q84OPgURn7Qh+4Wu5FQbg97HMp4xAqmZuYCMc65EcrIVnrZIPDlZ61S7inuM9L+Nr2n
         JhHZ6+7nlObDffwlVNv00UJvEZ6LIU15cuGxfFRNuLO0lXqiszCoi+69MwFTJRCGvTzq
         FGKA==
X-Forwarded-Encrypted: i=1; AHgh+RqC+ylhf40scV4h/cZN2gBjKh46F2fLD8CvPnSw4QfpdhVXnK3zaWWgHtUjqGMSwuP1ZwUCrCinp0jP@vger.kernel.org
X-Gm-Message-State: AOJu0YxJBAv6r//mtZem1OCUyLN4Z+vNqT6lU4Q3p0bsW+1ZZL2hWnJz
	yR12X8A48UAMVfRrn+pO5jlP/iad5pYKLqItMQyprqoGsSirclFCdQIT
X-Gm-Gg: AfdE7ckt4aNmsaPo4xzztwktmuYZ8HK6HIHKjtyZyHev2fEiF+qFwfWWtxMToKxy18l
	MjqCT5bd5z8YEOR0WPtDH6yYnM2nqTP15w6PeCQu+9z5+XYKxJ7CW0GvPC0hSajHVkoD+e/xmTT
	NcmcdyX4me0eWwJ6R4r0/p29FkLRP000CwOJA6kdKZZ1rBo7ugqdNyD5JWf9rfD0urn8X3jn+se
	6mcfm1HuO4PPTAQQmHhiZXv4omBbNf94JBQZoc8wsiGLz0NvjKCuVRf1DJ3RB04YzCe61xacfxF
	O5LBycYO6SXY58nekxsOu2RlgC1v9kEVI3wE1VSVC/gvbDZLW3qqoVz3zX7OAmV8sagcRlPgcV9
	UUiYL7AgsNgIUL7tF0OTZlOXuGHfYpD3A9QqeLfKNUOAiKBX9pWqlyFhRmUaBDH9BK57truThtx
	bld8rt4rJ7CQc8orFP8rfqcAb8Hybb0hmb7rn3+/RSTVXvNqF60Mb67eaO9Jx+XYWKVTRzrPnYa
	aFJ4i45VITvItsHE7aKJkpexFw=
X-Received: by 2002:a05:6000:4028:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-475524a853amr1371170f8f.29.1782770975032;
        Mon, 29 Jun 2026 15:09:35 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dfcc:acfa:dec0:e556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm1644670f8f.8.2026.06.29.15.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 15:09:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
Date: Mon, 29 Jun 2026 23:09:29 +0100
Message-ID: <20260629220932.861445-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the PCIe controller found on the Renesas RZ/V2H(P) SoC.

The RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
additional registers and configuration bits for PCIe lane control. It
supports multilink operation configured as either a single x4 link
or two independent x2 link controllers.

Unlike earlier SoCs supported by this driver which only feature a single
PCIe controller, the RZ/V2H(P) SoC implements two controllers. Both
instances rely on the system controller (SYSC) for configuration, but
the required registers reside at different offsets for each controller.

To correctly identify the controller instance and map the corresponding
system controller registers, update the "renesas,sysc" property to a
phandle-array. For the RZ/V2H(P) SoC, require an accompanying cell to
specify the controller instance index (0 or 1). For all earlier SoCs,
strictly restrict the property to a single phandle with zero argument
cells.

Additionally, make the "num-lanes" property mandatory for this SoC and
restrict its values according to the hardware capabilities.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- Added RB tags.

v2->v3:
- Dropped using linux,pci-domain property.
- Switched property to phandle-array for renesas,sysc
  to support multiple controllers with different SYSC register sets.
- Updated commit message for clarity.

v1->v2:
- Updated commit message.
- Dropped un-necessary new line in schema.
---
 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index 90086909e921..09d78bd1a577 100644
--- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
@@ -14,7 +14,7 @@ description: |
   with PCIe Base Specification 4.0 and supports different link speeds
   depending on the SoC variant:
     - Gen2 (5 GT/s): RZ/G3S
-    - Gen3 (8 GT/s): RZ/G3E, RZ/V2N
+    - Gen3 (8 GT/s): RZ/G3E, RZ/V2H(P), RZ/V2N
 
 properties:
   compatible:
@@ -22,6 +22,7 @@ properties:
       - enum:
           - renesas,r9a08g045-pcie # RZ/G3S
           - renesas,r9a09g047-pcie # RZ/G3E
+          - renesas,r9a09g057-pcie # RZ/V2H(P)
       - items:
           - const: renesas,r9a09g056-pcie # RZ/V2N
           - const: renesas,r9a09g047-pcie
@@ -139,7 +140,13 @@ properties:
       - clkl1pm clock request state
       - power off information in L2 state
       - errors (fatal, non-fatal, correctable)
-    $ref: /schemas/types.yaml#/definitions/phandle
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to system controller
+          - description: PCIe controller index
+            enum: [0, 1]
+        minItems: 1
 
 patternProperties:
   "^pcie@0,[0-0]$":
@@ -220,7 +227,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g047-pcie
+            enum:
+              - renesas,r9a09g047-pcie
+              - renesas,r9a09g057-pcie
     then:
       properties:
         interrupts:
@@ -235,6 +244,25 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-pcie
+    then:
+      properties:
+        num-lanes:
+          enum: [2, 4]
+        renesas,sysc:
+          items:
+            - minItems: 2
+      required:
+        - num-lanes
+    else:
+      properties:
+        renesas,sysc:
+          items:
+            - maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.54.0

