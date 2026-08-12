Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA0C4582F5
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544391; cv=none; b=nqF/hTsw0+pgZMspQ2ktszgCn+Dh7MFsdXOXBUi/dOn6mxDRyrAtU/fpPnP1zRGrgjngI/gLTQsQ0JVwFbYjJMGkMwdj6wRyLTqCxt1HKxyKBM7puK2h64T0fssrAqSjBd0sNWXGHiu68HxjKnSyvdtmQ6r1fiujyoKJ8/adq9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544391; c=relaxed/simple;
	bh=PAuqx3Oo6pCx7LhNYgdtHK1gvcUEQLqIqDi7HAo/eAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBFr3V+viZV0DV77hvzEXDhnCEndgEzBV2g4FfkEgIcJpeHUUHQTZ28/AdOqD6J4/OVnLe+s7Susmcn4hk4geZz9lnSOy9mgVAj7DxfR+opHNps0E+NQWQmAjp/cTq1+X5DEQCOO3YQlPm5FxsSdKsFuYVZHjWFK+2KRns5hv5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLJlxmPV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLJlxmPV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49553515a8bso14820265e9.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544388; x=1787149188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVKo3Q7nPdTFxJ7F70e1vvr0CNMhGLLGRCE1tbx1uMA=;
        b=OLJlxmPV39SKnJJOzJZcwGlCDoD0ADvS3Rgi5dDOppwyBr2KUdA0ucjo3EyvrTZgHu
         wWlUtQ9Zz+Czc043P5vmw25c0RsWZTz8bXQPyCQ7C+wkL9IOXrkRqdH4x4Snhz1ibVT7
         JZ38jECxcHciu9VPbT9iOnXSeC2kSphZ45bZ4bD0xe5SPd/vsCTloIYkEm3SKu1/ztIq
         eegZZDd7sXB/sRkFfzqfgqpwE9O2Z2tjJdQ9pgkWGJLiLlF3oyyu6yJYlDTVpnSIhYnj
         fHXoORFnsVW0URMuu33zyEKniNCuNf1u8dJek4/h7gr3djHnIbnhS8Lh6zdNWSyEwjwS
         vZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544388; x=1787149188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVKo3Q7nPdTFxJ7F70e1vvr0CNMhGLLGRCE1tbx1uMA=;
        b=TFiwgXFHcL6P9GdFHO7OVVcro2b9EHx8mM22JNYHSSuhpY2eHzYlMHxeuZjYSyFAeI
         QwmuDWS0nhH31qlJFzb0rHKyJBoWY+l43Ow3FpXWPw9tt1mMIkyhr9YmqW9Lun1mJLcC
         EiftLq3UuyLSo6zfoxDNOa6OIh3oeqD8d+1R02HPZ7C1pKJyvMSHt+Rf2darwyav49BV
         zPjDQq4GaKNP9TaWIFUYsOS6bezJYMwedIdNA3rSpVvzoEHLlE2j9pZS+L2ab0oinsNm
         oSBvx93zXxyrZQ4mZNsoy7I+P/X49ZBFCB/Nv/8IF7lMh7hvqCTc49Y2kgQnxTyjkKaR
         y9JA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4BGZv+5/lbjk5z+YYxoLpaXcEFe+10piKlrULCubjtFHrNsepEDzS+vT6YLrL0kg13QpdJGax69+E@vger.kernel.org
X-Gm-Message-State: AOJu0YxlryHRB8o2BNAI2tjldTtAGAV2aq7o67zMHjcs1dWJmPoizdP0
	lsXe7XC+kIlK9qBiDeVuN/shnqlDmoeK15Vz8RoI7yokzSB8qusevYLL
X-Gm-Gg: AR+sD13/iavUndpwkJCP3duGeKbpOucaNQlJ9RctDwtO767HOAT62zYZ9dwavGgCajB
	O7kR4Ohb0dVCBfk+hyTQqXZ3QJwxKN1UZG2YlkWbLJsa0wn+/1NarNZwQLSzMIEovF6Upy9xkFN
	Sb+TZZQdw3FKB4C4YtpO6mNOg9F4Pko99ILw3Dub9yjlJOvLzlfGQ7W+32o2/fVYY1od2eyetb5
	zMykqY1s0ILs6MSMTQTQ19EH4cSVoh8VC6IOlafJBB16ddtNTQCStbhJ1+DX5FIYpQvEZdOHDKN
	63gozIgAKWjA75w4Uvz2C/QcK2hiCzPew08UZYCoJH0z5qnerKflDWPWmrmvdQNgyf6+0CMlBvf
	9ESClt8jVVRQ97T4tLZGN70bskPXoaipFCLhxC4BwMAmf6Ax8iZMjT9BpDSmuwKR1MZqVrjpqNu
	86loT97tQNgVyCwqMNeBN9ljH+86VkOMf47YQKyhvXd1WU4fH6UPq1Y5jLpi00kG5MRuixcfRue
	Bi26yJh+vZupg==
X-Received: by 2002:a05:600c:2104:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-4997c111b2cmr56120515e9.8.1786544387414;
        Wed, 12 Aug 2026 07:19:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:46 -0700 (PDT)
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
Subject: [PATCH v7 2/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Wed, 12 Aug 2026 15:19:20 +0100
Message-ID: <20260812141940.246223-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
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

