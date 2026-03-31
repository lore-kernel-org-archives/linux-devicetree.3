Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4CB3EDAA7;
	Tue, 31 Mar 2026 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948878; cv=none; b=IIKVjKSLn6np5nQ4R9P/LNBWm48dqwpr3gdKW2GAtA95d2B1ActKiz5hEsjxBw3ApZXkwz0m9wJ7EWI3mDfZSte4vIc6zAKez/QsF35Xj+e+ZO8awhQwQylIa1sfnuWPI2L7UFMrMr/FP5uy9g8SMxCRafke0FaoBFjCWw4mjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948878; c=relaxed/simple;
	bh=GIK4OZilvzltbW6bnGRySBlxlnGZd82vBfqb5T5IGPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qU0oV1Ft555saTLwr61hSTc/dvJInzZGrNan/760vDV/uviSzbiMiAgO7IaSgUXPK42Z8t6J6FBWgkQpnCiJ8Bbi/8+i6dX/a1cDKzPjA31dcTsczN4Ov3SkuoHdlNUWIoU/07FyPr+7WYNzQIl4+Z9XeUJNkldqE74CMymecyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y/VLmCjI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y/VLmCjI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 843CC4E42884;
	Tue, 31 Mar 2026 09:21:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 533A26029D;
	Tue, 31 Mar 2026 09:21:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39669104511BF;
	Tue, 31 Mar 2026 11:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774948867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z6eQULr6vi+XAO7HwlYxBjsXuvozmVrpGeGaYTRfmEk=;
	b=Y/VLmCjINRLUsnT/7cqcc44kmZZ9P4OkLSWbOqpcx4MKLAmfe9RKzMNVnhg3Q2Bah596bj
	vOkAlVX+OmuidvJkrPr7ezxO5CqL7FzuJNhG+FkZ5cx9pB9sdulJHMMLd+NCrvZXEXmaAC
	Xra3Y6scQPGZw5AiIKxf5tyJnTw9dMIhfxxRgKWfBt7S7coH6H2k58L0TiQ8zZHTNYwwUL
	j4CZdwexKC4k7iPVAoAnDQg/PGnZhA5ToOYfikpB5ktDjyLswv8Op3VFwZ5QMXBy2DjyKk
	hh+AEdvE6g4K6RQtw0KksGm39ZTKmYR6Wyw19MlowDG9GLaaLH2UhcVET+T8og==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 31 Mar 2026 11:20:57 +0200
Subject: [PATCH v3 2/3] dt-bindings: misc: Describe FPC202 LED features
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-fpc202-leds-v3-2-74b173537d42@bootlin.com>
References: <20260331-fpc202-leds-v3-0-74b173537d42@bootlin.com>
In-Reply-To: <20260331-fpc202-leds-v3-0-74b173537d42@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felix Gu <ustc.gu@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The FPC202 dual port controller has 20 regular GPIO lines and 8 special
GPIO lines with LED features. Each one of these "LED GPIOs" can output PWM
and blink signals.

Describe these special-purpose GPIO lines.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../devicetree/bindings/misc/ti,fpc202.yaml         | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
index a8cb10f2d0df3..71c5859d2e135 100644
--- a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
+++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
@@ -53,6 +53,22 @@ patternProperties:
 
     unevaluatedProperties: false
 
+  "^led@1[4-b]$":
+    $ref: /schemas/leds/common.yaml#
+    description: Output GPIO line with advanced LED features enabled.
+
+    properties:
+      reg:
+        minimum: 0x14
+        maximum: 0x1b
+        description:
+          GPIO line ID
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -89,6 +105,11 @@ examples:
                 #size-cells = <0>;
                 reg = <1>;
             };
+
+            led@14 {
+                reg = <0x14>;
+                label = "phy0:green:indicator";
+            };
         };
     };
 ...

-- 
2.53.0

