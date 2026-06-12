Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E693E00BA
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249042; cv=none; b=jjHS6USLD5vs/YlfR42V9jyUVyurUhGeUFtzkuqT+T8iOcat53lJ6mCqmDlGFyM9koUykoCaY+j3g4nBtt53FtQUzpk5aF043fS32T6znfWIXf/JAMKfR/LP5Sd1+nnmzmzrF97v/hZtgXWKGHu8rEbXCtmMW/LV06dTo34wn+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249042; c=relaxed/simple;
	bh=2r1POua5Uak1EMM86PHnU2yGF0SZxOkEsj2Qssr0YtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eethd7+SUd1+WCRnXr2Vt/2ukbUvbdE7yURKKufA+Rz/QrrsKfsoIOKaGRLufzgiqTu+IPMABij9EFBT1b/dHNVAeOB954SEwyKAed5vRYsj1YzX7USHtVsTihUB7rNGCSUQQYeJBKtcYEdPhWK7ccsu0Gs/9gk8M47Yizyk4b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPuO/0BL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPuO/0BL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cdae130cso2993695e9.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781249040; x=1781853840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdrbtOKOy43UIR4Cul3JyowdVOGtAQchKw9DmBdAo9Y=;
        b=aPuO/0BL2CtgndKk6i+LsyHYv+KgwI15ilnnxG0IZgwcz1EPLAHBHLlQs3gBXMv6ta
         A6kjMf8NE3rJ4C3W0J56Cw+vpsSRNrHD0d+TlvPps6mjZjbHkaD9K0KyMhbRJ39HvOfX
         6abugkSg8CPAaDrAhWNn7/1mUU6HDoHVZ+s36wCOCvMIYFcZ3XjPAGOFGUudRsE7Tmiq
         4eG588Bu8ezgEeI2e60qInORpu+EvvIRwCYqxaQJX6BWyW1DexvDCs3itrNNRM5OTGQA
         IW3tKmnAylPSGjUXmymU62D/mchOeS8tJ0oxaHlc7kht+X5a0QX1sUE91VcG5UtAilYt
         mRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249040; x=1781853840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sdrbtOKOy43UIR4Cul3JyowdVOGtAQchKw9DmBdAo9Y=;
        b=tCPjLSKip/hXC3x7gi4ew89juNYY/NgNhvFfJR1DM16y9yU/rZMRv9dKLdk5aYbvuE
         fvlgJEPGjj77W2EXIb1ybKsHku1IuELDOtqHlKV0yttnAxlc8BU3916BamjGJQVpFXnG
         WYGzzhpi9x9x1tIBvz0xO3//Y4UkOgId39kb2m1Rl9sVW+0vDjBg4YIg5fQulo0YWvFg
         GFHFciaJoeVhFfMAbqwmvaxe+DsiflfrveeH+6XNH4HtpCAjgl0jAKfimqF+LVmmW2+s
         PJzV91Y7kAw69R0oA19OB8Jh3NaE8tAdi/N9S036C4VyCIXCbGQTnwgz4rp5yszEWd/p
         5vVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kttpIy08ov/IEFZd/5q7PwjIhq+SXlMWn2jai1mNvLNCFtiuD86NvM35Sjb0UKlfvBvKdbU32krFJ@vger.kernel.org
X-Gm-Message-State: AOJu0YziDdijPwkk/qcNZHBYibNukBj27ljIRGv3zfzKO+wxMEtdjfMZ
	qqmAQkBwkPIvFXg6/THkFXK965UrWsVfDTftY30yLDlU7BYbN8mzJgq7
X-Gm-Gg: Acq92OFTsc7ui2wo31ON0BV2fPYZYBpa66Jnwz4MgLValGAhydwsgyhsfEWJFFLfmmQ
	oRSKwRYmm50v7h/IgpZSCAWAKv6+WeSmvMz+GfBiBkgfRYhe9zqEl+OwjvsF0x7MbaBBYf+Fi9T
	ZDLukk6aSuy0IB/or9F7t9eOrPQY1uikWwaL87s8W2t5KSGObS30arsFTtFiPIyXyUEUdcgSizh
	3GpSkRtNHrPPOSozhFPXbtYt4PIQ666LhsnuEb/oqNvXN/bwmiAyrjXYm5JPMIdGrpMot75cgLa
	NG10iSfs+Rfu+tXfkdhoml+K0BBNM4z2D9P/k8MFCLh4Eniq1sBiUdGCPSzSLFsxAYPJe2pQ+m7
	907cB0R1RlzF1HlOojNb8Dgee+dZyQU+xesdTtQp1+koMfVoEJOXhQpLlkMX5DM5s9iQEYUEkq3
	V28XAk1WYUEBQAZHh4HuPN/wQS/+c7frlbr4nTX1E=
X-Received: by 2002:a05:600c:8b13:b0:490:b724:dbd6 with SMTP id 5b1f17b1804b1-490ec4b8ec8mr18729605e9.6.1781249039726;
        Fri, 12 Jun 2026 00:23:59 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea963cf8sm28715245e9.2.2026.06.12.00.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:23:59 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] dt-bindings: input: microchip,cap11xx: Add CAP1114 support
Date: Fri, 12 Jun 2026 15:22:14 +0800
Message-ID: <20260612072237.1177304-9-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
References: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
and hardware reset support.

Add the compatible string for CAP1114, add its datasheet URL,
update the maximum of LED channel reg, and add constraint for
linux,keycodes.

Previously, the LED reg property had a default maximum of 7 for CAP1188.
With the addition of CAP1114, the default maximum is now 11.
An if-then constraint is added to limit the LED count for CAP1188.

Update description for microchip,input-threshold: CAP1114 only provides
eight threshold entries, which does not match its total channel count.

CAP1114 does not support microchip,signal-guard and
microchip,calib-sensitivity.

Add CAP1114 to the unsupported enum list.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/input/microchip,cap11xx.yaml     | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index 778ec6d659a8..0e9a1a8a3f3e 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -12,6 +12,7 @@ description: |
 
   For more product information please see the links below:
     CAP1106: https://ww1.microchip.com/downloads/en/DeviceDoc/00001624B.pdf
+    CAP1114: https://ww1.microchip.com/downloads/en/DeviceDoc/00002444A.pdf
     CAP1126: https://ww1.microchip.com/downloads/en/DeviceDoc/00001623B.pdf
     CAP1188: https://ww1.microchip.com/downloads/en/DeviceDoc/00001620C.pdf
     CAP1203: https://ww1.microchip.com/downloads/en/DeviceDoc/00001572B.pdf
@@ -26,6 +27,7 @@ properties:
   compatible:
     enum:
       - microchip,cap1106
+      - microchip,cap1114
       - microchip,cap1126
       - microchip,cap1188
       - microchip,cap1203
@@ -122,6 +124,8 @@ properties:
       is required for a touch to be registered, making the touch sensor less
       sensitive.
       The number of entries must correspond to the number of channels.
+      CAP1114 is an exception where channels 8~14 reuse the eighth entry's
+      threshold, so counts differ.
 
   microchip,calib-sensitivity:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -149,7 +153,7 @@ patternProperties:
       reg:
         description: LED channel number
         minimum: 0
-        maximum: 7
+        maximum: 10
 
       label: true
 
@@ -178,6 +182,18 @@ allOf:
       properties:
         reset-gpios: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,cap1114
+    then:
+      properties:
+        linux,keycodes:
+          minItems: 14
+          maxItems: 14
+
   - if:
       properties:
         compatible:
@@ -205,12 +221,26 @@ allOf:
             reg:
               maximum: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,cap1188
+    then:
+      patternProperties:
+        "^led@":
+          properties:
+            reg:
+              maximum: 7
+
   - if:
       properties:
         compatible:
           contains:
             enum:
               - microchip,cap1106
+              - microchip,cap1114
               - microchip,cap1126
               - microchip,cap1188
               - microchip,cap1203
-- 
2.54.0

