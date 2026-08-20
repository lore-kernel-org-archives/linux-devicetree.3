Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FA13CF043
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219696; cv=none; b=m2Nduupy5hIMIej1q4q5QldjibjRRGt1+X+lLJ9ITISdgGG3XMMe2xvtELtkEEGrrVwJe1U9nbvi+pyLSjrAmfSCKG/+/y4U5Y5WEyyG8r57sHM1Vc7RyC5boT2JzXu9CYhLe7FuGmdeOfaoD1oRWlf8xePC9gF/3zSaKB2EEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219696; c=relaxed/simple;
	bh=AwEZk7WcowM9wEzT938w9dIDoG3dufLIpfMLw0UeSA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sN9EfSCOmV6BOH4pGSf+cpuim/lbjuzUleR61f7qwoVzfhmHz2CFWJ8jlmaQ9dUZS++jBBVbiJUoAWVYmVveuZk2GXLH1NXMK1J2FQ1/bS4VhNQDUXKw3T/V72f6Iz3pUjAwBQgBAcd8I6F89KyrZbOt2eicqra4Leb0RC5dKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZS1dLrY9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZS1dLrY9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso6030415e9.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219692; x=1787824492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zypP7Z6zLZJ8h5wgmipgBcVN/JTnM3AivoXK7hNLeNo=;
        b=ZS1dLrY94aMFDmoeKLQn4scRR/F8nq3moX6NmzNQShDCzFXKPVRmDqDY1NOwpWmI5t
         QnE8eq2Uw+d/x1QpBZAL2LIXzKoc20Ok6vgW/hAOdhOZEaOZGdqUUyKJoFCpy6quSl0/
         aVNmIEU48yNSKfeUuaZV//9mVSyh7+2Q0YWEIvd+IVmgkBi6k0cSRYvZ99csJ8qom+gZ
         a+S3sDvuN5x4MplehHxjBiqs9NfoWTLdgVfnGbi1bYvsVtKdgTctxolp0DT/SxZ8cJd/
         yNXrG0h73vLU5Tnp88KgNCSbI8j3W3b9rlWFBslvPaBDtO5tqf/GYWhwgl/DhBUIn7Vg
         PVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219692; x=1787824492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zypP7Z6zLZJ8h5wgmipgBcVN/JTnM3AivoXK7hNLeNo=;
        b=XSwmZJmDm6YqzxvFX5jEY7eElnby3pUDZlYjvURN/HUaXRaTLC4ngPw58hR2S9bFtG
         j78af69Uo7qOAXW4fvQMADq0IUAaBcazPggSAHkVRTOZWT548qBGgT9fK3SA3pMZSebq
         B/Mit0hm+DpiTCR0aqzSWo542XFJ2EK5euRzIQ6Zgt54njqsViG8wEShOwBU7nhirMyv
         +0mjCSWazMck3WR07jBuh3+y8cdPI6fshgBRCbvPZgD/t2KhcFXENPiSd3Kajd07C42E
         7cMnHgJyLuo9k1bkVWtnjoSaEam3hnxVW1wHhH/Z3hpAangB/NEzDPMFC9862Z05rGq5
         TyJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQzDjsOWFrOB4/T7b4myVRS81EZhMCE/tZUNCO5IThUhLNKmus1o533TRU0jxiNrAEswBdellhVMMQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7YQD91ygmThVTOxiKT42/WbFdKJGcj2ISni/xlFrLDefpAc4f
	FY5ozh7opaBfGpNfS4j/T/PtM3qP2IPh/O5rp5j1/fd4OenVth+nmFoV
X-Gm-Gg: AR+sD133CKlQYbuUaL6fuZ3Q2Z9b1tRfEi3O2iDGerljX6JB4ny/y/AQJQSIjPZ1cK7
	QFvvG8/k9rkuLxmhdNXCltX/BIcOhWp/sFB0npfQipOHX01Ss3grRY2G2XPehZqKrHUON85T8+7
	6KYucKsGHLJsLY5zBYupTRldAvwMwwKmQEwo6gi+uHzdoYjBk95J4PkIFWK4H/DbPnzra0KlD/0
	U4vp6OPV7V1hhnDWWe8pjvg71frqarOFTHafw/9dscyIh6csEQQ/2gYT7wAKO5TnZoPyBTsOARt
	5rzuTrxf5XPXfbYz+sCkT+Y19dg0JIPwDd1nQLbcs2xHLZsAixJmvZ4GhKLk4LpDnvhGnlh/whi
	FmAyw39hacBeKtF3apybW54Ryzh64oX0PkMnzZ1nVzOnZ6YHfw730vPbRmUbwEhP6851B844bSk
	6lOzTNB6ThQLGlY1iRa/Q/d+3+aRw1FKWy9KimXz/9orO6gqrx313CLBBaqEVWam7M/lOl
X-Received: by 2002:a05:600c:6749:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-499aa1896f1mr209432415e9.2.1787219692369;
        Thu, 20 Aug 2026 02:54:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm172069675e9.11.2026.08.20.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:54:52 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 2/5] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Thu, 20 Aug 2026 10:54:40 +0100
Message-ID: <20260820095448.20930-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
References: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Collected tag.
v6->v7:
 * Added additionalProperties: false in regulators node.
v5->v6:
 * No change.
v4->v5:
 * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
   power sequence.
 * Dropped the tag from Conor due to above change .
v3->v4:
 * No change.
v2->v3:
 * Replaced items->enum
 * Collected tag.
v1->v2:
 * Updated commit description.
 * Added enum instead of const in the compatible section.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated schema check.
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..75e034fa7ce7 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
       - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+      - const: renesas,r9a08g046-usbphy-ctrl # RZ/G3L
 
   reg:
     maxItems: 1
@@ -50,6 +51,29 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  regulators:
+    type: object
+    additionalProperties: false
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
@@ -71,7 +95,6 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
-  - regulator-vbus
 
 allOf:
   - if:
@@ -86,6 +109,22 @@ allOf:
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

