Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99705370D7D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274657; cv=none; b=Be4XKSBBdfu10L3saDeHYR+aKIzgQwr4jHaE6NPcb6GNKCWxymcPRqLPREW+txZjY7GHnN4dOv+AO/VsBYsh25SuffEN1zrg2cTP+NSVjhp37v+/9JZIbL3BmXMozw1ouDpcM4bGfcd7wEG4YwztdG+b/1U2ADqCMeq3cT4NVFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274657; c=relaxed/simple;
	bh=NOpsoE5JXaGFwiQl+1H9TMXhbnwI+rsIKFCdxJm7h40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEtl34GXGodYfyqsYK/qI5S6H66ze3loN46CObWjdnP9445SuTGFQwU0MaN3jY34h/1OO0mBaF7IFihXSHNbV83Y5P+yEIGBTUKdbFiMUEOssl3Mwle+sG5hy1C3d6OS2XV8Vj+eGju32lkWxPkpTD7Xu4CqHuVcJfWmDlHffpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmyT/8fm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmyT/8fm"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso771008f8f.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274653; x=1781879453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2v5YdPFwcs+c+/mh1IyaaRfJjErFmT8WoMdd9sikM2g=;
        b=OmyT/8fmPWajWU2/q+8w4u8swkgOED/GehNNiT+UuDR1pfRoZfmPzZkZihBe7OUGfY
         CgpNAFx5GBaN5zRDJoKo3sooOW35M7CL6ooD1WIw3GFZf7TUTyYWn9Id13BjyA70zgU9
         aXD5YIOzauxEszxjRYpuzhmh+0X+GDE6yRMP+6qz3mR81H25jxwib+Yfs3FXAq3W/lA+
         M2+s3HGb2ynctkN5Mp2KJWHJwO7tEDdJLudtqg1+PSwVTwOiXG8qC88SYA/gRnHwdD54
         IlOsJNb/PkazXQVvbB8IA+g56RhmPgtkItWJi8VryTktw2U+UduTQDmPtb5PctiwIGzq
         9PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274653; x=1781879453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2v5YdPFwcs+c+/mh1IyaaRfJjErFmT8WoMdd9sikM2g=;
        b=C1HcdC3hAoXNYwk6Jf3ebqDha/ygLGMJSyI6c1IksABusiVSJBdlSrgmkdyXzIGzoS
         9+94v5rQ9Z84CPXnprWljzUy09U6+fQelQvXeZFmeBFZGLaj8WUMAi2ztwVqwqVLrSqp
         Ksqi8HfxC2a3ZtaZYll256IVbnw3VXfGp8CK8GYoYnwuG2Gf4rP+SNz5hHVb5M9dKODe
         Z98DIjwD0gWXqMSrsCKKgbYrddKu6geFPUM82dWmBNpgWyyf0ECUsWc+gWLkYWHp/oGn
         52ZvlAp2z8JUOqlepOUavqrTyLwAbqIgsQg/uy9m3weu+7tn+Su93nDylTaNORH9DmXE
         hgIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cfzuQ0fz6snGWOAaSkGMt2w8N0QpT9x/G1k6ghE7Yy6DpV7YElvR5V+tGATHvtFFpaAHuyRYNj+cl@vger.kernel.org
X-Gm-Message-State: AOJu0YxCN4MIVJT0+Tvo4BH8qyKrtHlflxXF1REzCXNKraX4JjTZzSzv
	tsxoJlt18ijQtgYljV2z7Pnb1TXe4AIBCsr2/+BcLmN+zL8JlNv8B02/
X-Gm-Gg: Acq92OER4cMNgabw55Te+EfylZaOSXltL70JttWSEYrSGNqaNZDQhSBOVaLIC0e5+vc
	/WMtntvO306JvZd5+F35N7piufHsqp5Tu4j7lVXSdmEo4Sn7CyBUopzlbxy3tmFA6NPamjBOQ/A
	eWw3931WQQ4Y4muSYsUWgT5gOXRDYJjRo6/aH0DEuPyUhmGsD3irl6CUL5+0ncmcMWwBIafGY3L
	G3sUiyuGXJTIbILErcTT8yGg5gd2PfAQg2bxW/q4nXDgVoI6QIURg/DOzyV0z1jWSFczrNadCVt
	kgX/+Bv1BNUZ13/bN1PCNlR20Ja3vl0+o0hCHYfW1WUS+4wbRef+5r3Tn08n7s/eg8R7H6zHcUv
	YeCfy+eRmlnTZ4Zv/m18yIzon7X8A8E1Gv7v5LBmWhzH0ou4UFDXU3dfl2ZbP6qHGnKNHAvb0V8
	Rd5ssMVcm3KI1thvTqRS97XP3TjCvg0Y/hLmJoewhr2N4KbcOI
X-Received: by 2002:a05:6000:25f7:b0:43d:7868:21f0 with SMTP id ffacd0b85a97d-4606da57dd1mr4726877f8f.9.1781274652902;
        Fri, 12 Jun 2026 07:30:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:52 -0700 (PDT)
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
Subject: [PATCH 01/11] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Fri, 12 Jun 2026 15:30:29 +0100
Message-ID: <20260612143048.317907-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB PHY
controller. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..788e467b38db 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
       - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+      - const: renesas,r9a08g046-usbphy-ctrl # RZ/G3L
 
   reg:
     maxItems: 1
@@ -50,6 +51,12 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  regulator1-vbus:
+    type: object
+    description: Port 2 USB VBUS regulator
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
   renesas,sysc-pwrrdy:
     description:
       The system controller PWRRDY indicates to the USB PHY if the power supply
@@ -78,7 +85,9 @@ allOf:
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
@@ -86,6 +95,15 @@ allOf:
       properties:
         renesas,sysc-pwrrdy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-usbphy-ctrl
+    then:
+      required:
+        - regulator1-vbus
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

