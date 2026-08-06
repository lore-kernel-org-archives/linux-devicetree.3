Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE9441616
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011764; cv=none; b=EQAryBDiO9yNSD8XlEcwA1iBruYMln7NhuZHxlPM3ZE54rt1YUdC3bQehdY8lY6pu46NthfA79E9TjsxghavcD4x4HuteMTdYLYF8QZzqZ2NT4wKbaf8fD92D1fjMbHfO8TQuXqBH0ACGuHR2Vk0SnVGa+PGykDPyHXFEIHJN04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011764; c=relaxed/simple;
	bh=6e6tFW6Uzm5NUNHZ2GO/VM2Z9Z8q+t7PPgL30SWore8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bibA9GFVaOMjCWOQzPVyyfZEh26gbb0yJcbx6tvIGK/ZLegVbEuUn10wwF0PKewwNbz5g2zNOTnoXYQClZCOa9ctZe/fY1K7AxX56InRW2fyItBnvpH03V8n6PERUbOvws5sPznLUJCTqW4zhySjm/sYvEbPUubehe0s5mD8wVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+/IGwaK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+/IGwaK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954afac04bso22251525e9.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011761; x=1786616561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgJ/3pGZlmWfqwoJhWBmU3YWLdHB7aCkgkZcZuzPZNM=;
        b=n+/IGwaKFDuq3qOnNirInogJGwBryoZJXYxWeepBELY4wgA8cBMwAW5sn7wRw2juWq
         9mlIifPCBaXwD6QJofaIoJFJGdNVIDwgdcJqKSACjhVRF3zuRQm2fBywVUWGuf0pZ/Vp
         MfC/iB30/drnjZ3EOKkCBWPXkNRFwryMGzbkxZzHBIzy86UXwk0qCgooF6BBx4wsJHNJ
         XPpNbRzVg6FtF26HHPMkbNFvUAUghg/8uKvzJA6rnmOCWYgGGOBKnIT6dIiAwsy13FlN
         0+40+mERgcC7wXQ3632WPZpJbq4VWQvFW4E8SzHlIbfZ+Es+rfFfoLkJTgANc4rxdGEY
         901Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011761; x=1786616561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgJ/3pGZlmWfqwoJhWBmU3YWLdHB7aCkgkZcZuzPZNM=;
        b=cGUqxOauLQVhHGZ/hK1MhUgNY1meLjf0mjdu3LNexO9ysephhdNi9KxXGKzpYIw45L
         Id+j/iwxWxrknBv90vhkwr0tdNFo4J6OCoUcPWJDzJ/bA0Zx4L3Amm4Ecdq2Um7Z42Q0
         6kmjxxIh5dXFP/NU2hQRYYZreC5UfvFzdSm2gGsdiX6rcGJuSNzDsqhHJPsliJq2veou
         3vSy4SjcvDjRxLhooy0sKmP/X0fqk7N8zYwD+pE8Fsl/tzafRfeOVSmGndu9NdvBUuzk
         odZj5z8fVLdIcNt0mpC1tPJTaT3I0xyIhejzUOkyK/q6y6ghIoJ1Z7w5UCfJ02m85fZw
         9KnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpL9PF76qEEIznybzwTGtbbLSxOQU2W7kuMo3SP2IkMQhlt1bswHw7bbsCWhLjwTY4KRXVDjPYGAz8c@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkh4u0meuDiTgK1zxNnnMFP5uqknKRHr7GtKpZD1w/pozBegiq
	29hDk11wODcvDa8qzaFBisFmJVZvMC6ZofgcUjZFp/u/3lbx1XwWw5G7
X-Gm-Gg: AR+sD12DmottXffhBYHhCf+b1xN6zYyMPcfpkrMn7VNBQuUqSzkSSimSMnrAXP9Jzd9
	bIKwWS6vxQ8VcraU11s+H9iCso4xHhsPTS45gt5ZaLcRP43da3VSuVQUXIxkQCTil/rWHENRl/Q
	HiPb/CapeVEcTTcvmtQg8rSJJaM4En5nskR/fvortt5SKv+Nas/DAlC8hhLIOXv0rVTM2xtVeDz
	oV0hU8RBB3xZwXAZZoqE+FbwWiyIv+mdDk/OMMx8M/1981NqFbCB39sUAfWSSZ3SoloIxmd2/y+
	QlZ3Oe/XT7Y89QqW6xI8weNir4vQVoJjKSI/yhX+MKfhm9oljp2Q6oyMO4GIzCr6E/x4opGSm4X
	yJsW88ER3W9hbVLYRMlwSi98x+R9eropFCi1DeKver/Ahvy/KvZePnxNovSQO55VK8Q5cwfZMVm
	wzhEbxoKyCPVIz7ojxQ+qI8wz45BOfNLaGjPO1cOUqcAZ2DseTVdu/uqtL8+ZFIJGPIMLG9GqZj
	jIZ79seZ3Nl
X-Received: by 2002:a7b:c854:0:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-4994e7d7320mr146607195e9.19.1786011761118;
        Thu, 06 Aug 2026 03:22:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:40 -0700 (PDT)
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
Subject: [PATCH v6 02/10] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Thu,  6 Aug 2026 11:22:21 +0100
Message-ID: <20260806102236.149159-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
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
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..9e0c45097657 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
       - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+      - const: renesas,r9a08g046-usbphy-ctrl # RZ/G3L
 
   reg:
     maxItems: 1
@@ -50,6 +51,28 @@ properties:
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
@@ -71,7 +94,6 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
-  - regulator-vbus
 
 allOf:
   - if:
@@ -86,6 +108,22 @@ allOf:
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

