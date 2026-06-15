Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B33FBB56
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533302; cv=none; b=Hlz6lDf7ZXExW35oAw+UZGOrNI1jXXAaAE8MqxFaDhfEOiBpKvLZ2fgX3LMpo5ebwDFmIKjGruFwIHXteJ99B9NqjdjgQiaP9XfGdj4vJDT5KwFoLwj4QG7KWams5Qy4YrUD38BMIB5u7TCtjGhkv8yVeOgG6xNgq3tncR8f9GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533302; c=relaxed/simple;
	bh=sni3Vfc+Eo1D4ZxHj4qZfEnv6EajkjCp775AqH7GGvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYZGGtvgfMt28krzaKA9tVXFX6ZFSrPgXS9Gf1a0t7rxRfKMFF8AvLbsrI+Wj1DsLnkBxsCxJzPOkSyFPgshRlv7YdR8DzRRS12rniKnm5m/VeUjB4E7dhTe3/ngoZYPiDN6IydUQ8xpyZMZHY+3IGi+I2YdDQ0oKu7D/00yFno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dbtgh73h; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dbtgh73h"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1638266a91.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533294; x=1782138094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzuJ81oGZTf4ZC4Q8t/Gu5IOv8ZAbUAnAwamVat/tXw=;
        b=Dbtgh73hqTOwLwHbbfKnZDDiezFrOgI+pCKO/TJHDLD/yXxwX3CayQAhjjutpoIS4G
         zECf1iZS7MkFGQarccQ7hKtIgGQsEW7ZqhFHKonhlfXJaoH5li1v/P8TbC2Y+8Q7ZfW0
         Jcbn9aW5iBKhjkvAjUtLcOtTw5hX3JTDJgHEZO2yQmN3muFx8+sAcbtK+tuLn1L7DZgK
         YxeceuuV7OgLD0vRdCza5L7gjpb0v1iq3FPl5FzmsxAEYe9G/Fl1KUuT056xit2N4YsU
         SVtDQ5izxLcSp7o4c2ZI5K0wBNTyS13+qOL7QJEga5JDDMZ7pOdGBJ8T/5vApn5/vgKd
         RkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533294; x=1782138094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzuJ81oGZTf4ZC4Q8t/Gu5IOv8ZAbUAnAwamVat/tXw=;
        b=nxp1EhavwNhM2y0/aVILGSxOmVh+Q8OxHzY44mmyNtizxg8ayaREEms0mNNxPPcI8u
         l28l4miHjVzEAcT7maT4TpTmHUKY4rHME9jUVyKvIZ2xS/8AOqBI9kB49FXePUUuFiI7
         Oxn5SwdGpWzMAU4ZEdK7I9eqJuUZ/y20jZqXR2+FELmcU8/2D9zDlNWC3fYO+0CNMryF
         wmtLsLVHxq9e3Do7GavCtWJmsZxmX8Y/77t+PNbq3xsbBX9TZCraWfMPTyyewfyh2HFj
         M1VFoAVqaMdaVs8TpYWLlHMhUtmEcbXYKbU4R+G4zVXrFVAlQosJZZRJEgH5bTJFaIMR
         jkZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RujvdNMK1p9AFlfsPyYiRNqIJ18OTV+EuuTwoGn2bnhdXB/bhlwE5tX44jSgap2XIy4Ro/O2GkwbB@vger.kernel.org
X-Gm-Message-State: AOJu0YwUyJQKHjr8Qu9q/fzVFcss5HRRohzl9vnfqI3Au9dyIT+SGrCh
	6TfHTLMlFVK36oaquMErGFBXZsX6IcqiD0gNGQ7ZTURubPUlUlGm/r7n
X-Gm-Gg: Acq92OE+eBh9z2CwRnjOiJUpVEwBCfJLtpiXP4GTt3L6qZhhbe04Mxam5C8bDX1Z8N9
	anzau9ivXlgYncb7+AcwxcOC/oPbBR5NNwghWgiseH2D4ydYoj8zB15GB4QpObQoW+tiSprc+rC
	wdnZ+ckRYR6JFp0fId1Eksbv3GVgYWEL3en2KVFaqZjedfM+zzILrA9/MI+eo3MpPLSoIS/Sg90
	OuUzUUZTpOjhkARBE8PoFfbKr5ADc/x99tIG71LueIHpdBBTlCH/Ec+71dUcOhBNcguQ+YoIWwO
	ttRPOv5vDRcUm8rP+M6HlJjkRsRzuvx/M8AoR6+6ZyTeE9m4TF0iLEPhqrWSZnOkZZRSI0WTI6T
	kibYJxOz5OELBGIVrnxK86pr47f9rexMg1Aq4udkVuwckm+xlCXMchDd92LEOWATnr6QaEkZwFK
	kgLwA/OXTPxczAvffNUc3D81TwiT/UMT0=
X-Received: by 2002:a17:90b:48d1:b0:367:b8ad:f0e9 with SMTP id 98e67ed59e1d1-37a032e6361mr14073248a91.16.1781533293728;
        Mon, 15 Jun 2026 07:21:33 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm7178233a91.2.2026.06.15.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:21:33 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/10] dt-bindings: input: microchip,cap11xx: Update datasheet URL and LED reg range
Date: Mon, 15 Jun 2026 22:20:29 +0800
Message-ID: <20260615142103.352163-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615142103.352163-1-jerrysteve1101@gmail.com>
References: <20260615142103.352163-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Add datasheet links for all supported CAP11xx variants.
- Update LED node regex and replace enum constraints with minimum/maximum
  for LED reg ranges in preparation for CAP1114 support.

CAP1114 has 11 LED channels. minimum/maximum constraints are easier to
maintain than long enum lists when expanding channel count later.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/input/microchip,cap11xx.yaml       | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index 7ade03f1b32b..9578c7c206a2 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -10,6 +10,15 @@ description: |
   The Microchip CAP1xxx Family of RightTouchTM multiple-channel capacitive
   touch controllers and LED drivers. The device communication via I2C only.
 
+  For more product information please see the links below:
+    CAP1106: https://ww1.microchip.com/downloads/en/DeviceDoc/00001624B.pdf
+    CAP1126: https://ww1.microchip.com/downloads/en/DeviceDoc/00001623B.pdf
+    CAP1188: https://ww1.microchip.com/downloads/en/DeviceDoc/00001620C.pdf
+    CAP1203: https://ww1.microchip.com/downloads/en/DeviceDoc/00001572B.pdf
+    CAP1206: https://ww1.microchip.com/downloads/en/DeviceDoc/00001567B.pdf
+    CAP1293: https://ww1.microchip.com/downloads/en/DeviceDoc/00001566B.pdf
+    CAP1298: https://ww1.microchip.com/downloads/en/DeviceDoc/00001571B.pdf
+
 maintainers:
   - Rob Herring <robh@kernel.org>
 
@@ -124,14 +133,16 @@ properties:
       The number of entries must correspond to the number of channels.
 
 patternProperties:
-  "^led@[0-7]$":
+  "^led@[0-9a-f]$":
     type: object
     description: CAP11xx LEDs
     $ref: /schemas/leds/common.yaml#
 
     properties:
       reg:
-        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+        description: LED channel number
+        minimum: 0
+        maximum: 7
 
       label: true
 
@@ -158,7 +169,7 @@ allOf:
               - microchip,cap1298
     then:
       patternProperties:
-        "^led@[0-7]$": false
+        "^led@": false
 
   - if:
       properties:
-- 
2.54.0

