Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778368;
	b=x/Ueaq6OTBlyzx9iJGkpOypTEl6tJMIb+aAO5OzQlj+caTlyEDo8EkB7r19bErx8s1YB
	 MIxeRyqazz1pHqHo3UBPL7G5XBPAqUSAyWCXINGEjj5naa/abGhkf0vcm3lsjlBmdpEqJ
	 7+SbQvQoRc/OSCOQaIwu33A2seic81CzplbA2V5EGN0BOE4Bg83FTgU69tm93kT9+bHEI
	 m6F6Q/JWfdRCieU/ihSTGLXbl2o/iQxgjzd2TAZ08oIEr9B52PqBiAebBN8QXNXNYttt+
	 s5xndANapA7nA9PDEJJL7ytPCJaNq+JW3Ym1UigYaX8DgT4VzYb/ahJbyMofLpOHNyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RC9B4AsYtSl9NgZ1G5jNJR/NzNwSkJidFyB5V6bR/5o=;
	b=X/aRZ2uWeX4hXNfKoB/eufAiTYs6//0XejA+t5YOAhUlYrlsBRfhEPtL+C9aYycPAuxP
	 VPlzujKqhL+e6gCk2qJWd+Cr6mi9aQTStrnmhec2rGaY6MmqNR5jLBo1k2GXqUNj01IeH
	 AiI1d1AmjPOuYjf4nvD7tlj6W59StqcjbZTfwXhABQ8+7+5ypw5U9XX0nFvwP6x6nIUAR
	 eJoNMLoT/iULVBOpH9kRsEiA4pZFOYWAi1qM+NMlxua6zbQjGDZ3s4JuCfISBv6pggGiz
	 n/tqbnr8JSxbrL8IeZgqtUHc3gmYb35az5MGHa6Z8Xm44/jI0aBorxpxOY168B6uHgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UW1CsQmW;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D44606A327
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D44606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UW1CsQmW
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso8819455e9.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778367; x=1793383167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RC9B4AsYtSl9NgZ1G5jNJR/NzNwSkJidFyB5V6bR/5o=;
        b=UW1CsQmWp71H8y3Ya8dgqs5sxJZmBbYOORQQ+AMwjIQDQVb76BLAGEYcIl17q9xPIZ
         uvXybPge4G98nc2n4WLPIgSppaD5S+7FH/X6dK19ZdDJpl+zWQ9S6Whyg8dzczUbgzQT
         4gg+GQVFGZyv40vw2UQibUrse/b6E0gBoCxrdFt2YRhZ52MZQJTzTvoraZiOE80wRlW9
         hl703X4LUXodi+Q+1wiQIuiIIZBXLbi2nvoYuZHoz70a4dlqQz8GTdf9yGYMeTEWmdcz
         EaSYOIfG8JRL5OwUbajKVaCsrFJcfj1WrGAHLxouW0MbyWlbHDMMc6ckTIBVUeKjs+1W
         Q8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778367; x=1793383167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RC9B4AsYtSl9NgZ1G5jNJR/NzNwSkJidFyB5V6bR/5o=;
        b=J1FHTnerAZ2OmERVzVXbmC5OQfT+sUa5BV/DEuyW1hkvb17x8nQpqkHShhArfgfnyo
         RclXdxrYA5MVofmRAv2sV45i7/oIT8gEwqXCIQ0L+YsBgow4T3vQ8L1c2Q08DjnjslR/
         zEWrgPnx0m7EIWBp6f7zQp4jOoZCQM0dDuFwZbRkifkPnQwbMk/S4XE0FNPGWmMgoHNh
         iItqFMwIy1hgDKQl3K4F3qG7hdREbdHSen7wH4+HG0nINve6MmN53y3IDo9yka7CY8Ak
         6IZhSDLv3kpv69MOh7aE20n/waa4I6qw4tOS2Hz9cS7voGaMHi+uUJQddjvtnbwchtz2
         lpqw==
X-Forwarded-Encrypted: i=1; AKwUvBxi6H4guHEvAvZWhj3sBaVPttit6F50l/YVAFkb0pMHxTDwqggnbO7oL61jpXPwLR00j+xA9T32gzhM@vger.kernel.org
X-Gm-Message-State: AFq9FYL8RH8Tptvkj8IMMSPFyx2j9+m34zOA/5dAOQFQd0D2AfTxMBiH
	4ZRU8aSue8U+VKZiaWhtz0g+VZyP5eMpOOGczwQJacVykz/12XwzXykb
X-Gm-Gg: AYBFou0ncn+rysViPuaEevzaSezf+j9iF7JxbQAk0Jr6tg/t4sVe3wE4pwqJjk4cvQe
	5PkBVYCxF8Uv6qi9sx8M+yarAhj/LamyF4K6/ytcpgEuCFi44A3kug9tcFqVrRl66wKsIZwdkr4
	JFP8cisUFP88tVBARcYsd9CnmW7zDu/TIoWgazOKIhx+gWHaJfM07T7nKPDcJ5Yph9uIVXjW14n
	ugvrY4TLhj2S+bh2Uenf6m+E32885GJI6DclIteR7G8N8oKUs4D5jQGuCvvvbRfjZKq4yIoBtkG
	MMlwXa++jUm0VnlQnJXoyTOXa5z7hLPuXzHHbcGsOJLyq0CzZhaCVzFFSMgNC+wC1LjXV3msgAI
	HMJ+aK37qSBmjCepu/p9UiC4orjuuhlStj80uv/XL/3D8tqL5jHnN3ROd85ycOFZiOePVdpV10k
	5T/9cK8lMvx/GzULt3I/MGrLgc1tN4laZLUXa8VlviV5TOBT+R/Ynk3d1Bd/DXQz1JMr8//B7JH
	gBOt846h/OCS4in5iLvyjI68EeIgcbKp0UFJMhFB5/5wEgfApN7xUNA5PZWcfLs9dlqFD2kMzIY
	vShit22ChKKlXYASeyKmRfpyi4IqmzW4xl8mLzGHxSlHqX066mkItBh/t7l7B/Aa847LG/CN1Z+
	Vl62+Ox8kaYePh0yquQAIIPeBUlZk6U8+lGYRxHvD9vt/Ig9A5zfRe08gQ9m1lutdgNk=
X-Received: by 2002:a05:600c:2196:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a211ee51famr34379215e9.25.1792778366577;
        Fri, 23 Oct 2026 10:59:26 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/8] dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N support
Date: Fri, 23 Oct 2026 18:59:12 +0100
Message-ID: <20261023175919.160103-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the ADC binding for the RZ/V2H(P) and RZ/V2N SoCs to describe the
ADC variant used by these SoCs and its differences from RZ/T2H.

The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
20 ADCLK cycles, does not support calibration, and supports selectable
12-bit and 8-bit conversion resolution.

Add RZ/V2N with RZ/V2H(P) as its fallback compatible, as the ADC IP is
identical between the two SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2->v3:
- Added Ack from Conor

v1->v2:
- No change
---
 .../iio/adc/renesas,r9a09g077-adc.yaml        | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
index 5b496729022e..a0fed2f31370 100644
--- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
@@ -18,11 +18,15 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - renesas,r9a09g057-adc # RZ/V2H(P)
+          - renesas,r9a09g077-adc # RZ/T2H
+      - items:
+          - const: renesas,r9a09g056-adc # RZ/V2N
+          - const: renesas,r9a09g057-adc # RZ/V2H(P)
       - items:
           - const: renesas,r9a09g087-adc # RZ/N2H
           - const: renesas,r9a09g077-adc # RZ/T2H
-      - items:
-          - const: renesas,r9a09g077-adc # RZ/T2H
 
   reg:
     maxItems: 1
@@ -55,19 +59,22 @@ properties:
 
   dmas:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
     description:
       Must contain a list of references to DMA RX specifiers.
 
   dma-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
     items:
       const: rx
 
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   '#address-cells':
     const: 1
 
@@ -101,6 +108,29 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-adc
+    then:
+      required:
+        - resets
+      patternProperties:
+        "^channel@[8-f]$": false
+        "^channel@[0-7]$":
+          properties:
+            reg:
+              maximum: 7
+    else:
+      properties:
+        dmas:
+          maxItems: 3
+        dma-names:
+          maxItems: 3
+        resets: false
+
 additionalProperties: false
 
 examples:
-- 
2.55.0

