Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51330391E78
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249015; cv=none; b=fLLjxDIq1o5ifh6Z3kkvmHI5T5jc8k1ZHiXxtL2BpPgHLm4+Trp3p0f/9KyhhEELQGtyP6eHZB02oiCyHmplbcp1fBppECeNgNlh9X2huqU0InsK4ZfrDvgJk/Wr9cxd5HyI+4wVdpEy5dxzoTJ3SV8LXuHf79Uv7rcZoQCEkCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249015; c=relaxed/simple;
	bh=sni3Vfc+Eo1D4ZxHj4qZfEnv6EajkjCp775AqH7GGvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KxUSfnOoFsBe/M/2czbH2/9Usq93xItBzsRVytUHzsklN7qzCCTZ7zkUFzI5Bzx4aCtaPwd4AQyZlZGoOc1652qJGFkddIvDPFJlKt+FO9tXvIMWqGIX8WzmyH3TZO58CDYkCjl99YVSSgAY3UdpNc4qK4TccesSuZZb3UFc2Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEXFC43Z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEXFC43Z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so15988415e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781249013; x=1781853813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzuJ81oGZTf4ZC4Q8t/Gu5IOv8ZAbUAnAwamVat/tXw=;
        b=NEXFC43Z/YFyD0gHFlYKPAd7/kor1ZTcOg7uYMzrijBj4SnWDFG71dvUO0+GALLiRR
         OptZxt/JNkscCieqoQooYL9owsrkoShOQ6Ik/ZsvNDZz/de2sFUHRKtMTnCzY9ez6ghq
         p9HywbVY7J8y6V/IAJN5ZaMsCrrXEERMPGL7f/edjViBabnhyHx4VovZWjJ07f515uEb
         T+V45XdotmKoFjIeoMRSTzI+85CxYpz6UDsbPcy34MQ294QJxLplfFqfkskfg9FzycAE
         zJubAEfCTA50q9efLsCef8NbNcohPvevoo/XysSy2fa6AlcBqcwh9gYqoYX8ho/4lCGL
         lIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249013; x=1781853813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzuJ81oGZTf4ZC4Q8t/Gu5IOv8ZAbUAnAwamVat/tXw=;
        b=Lu8nmWp62IdM/+nmQMCkyYiAFlLJX1IJyyC8SA/zKS0gAJmWKmJj7f8I3QwE0CYu/m
         BtqubQb2ItBFhndXd9DdIIMmbwtRf11AAB1qY2r4VqQrEq9/H2Lgg2yAk03+OI9wgstq
         7oZ/DvRBIvjaD6MMMgwJOjTrfRcEVRz2xzZu6eVaX0ZwlgCTctaxl+LgdbZ6apibimsX
         ZbI8zT5SZnrfJUUb1+rpkc5NSUoVWNjjhrPT84CX5SwM8JYr1N1FkI6LKGDSxJWAjofo
         W8ClnSk+FpfA+j9zJUDvos83KgIKkjl5nL8FRs4oV0BUo9eFyglHy43yjuuCg6XbQjK2
         +w0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/qiS7ci8lG/i2QPxhRruqR+YtNmh2loB0D+X8IxySiQdBcFWpnDePfMdofDWTVh6djgt1fVVrr8x1P@vger.kernel.org
X-Gm-Message-State: AOJu0YxslerInnllItlcnZW8DCXTVpz8rcKNOBS3s1RiOb8gchqOVAyA
	rA/BJz9nsNlcrpqzTy44feOvHvi/66CnQ4CD0rVUazO79Tc7t6JKkYUD0ZcVXUSIwvE=
X-Gm-Gg: Acq92OHYLbT8IkClloFsGenMFxJkAOgobnMG79LIYEDmLtqz6ccX1bkr/q33rQ468lA
	1Uef//u2sW2jl5F/LkVbSVlDlaYOqG2Hy91i9A+OtmTqzbrDSNl2Dl2A2gG7ww+JJqPBt6GAOHF
	PUmuqXwJHPuYHdVmsmky+U05DPn1meKWF514B61sgUkGKGcF2vyffSwKDzXzg+cx/R5UbsqF3IX
	nknYoH/1Qx4lFccc39XSKvkBoVgya4uQwVZGMHE46c+a+9XQScDMHqub+h/+I3bgdIMCJ5io57J
	Czjrf2ZtjTFVQzVtxNZNXZv+aOAzZvlOlDWjuICBWrI1Ec6DRpr/8FPnGNvzAFSbRJs5edlVVbS
	NpuYdwhgtJ3CEPDdfKnQXZGrd2GxMBtmXvB9RsHnzpYJdUNYvPkFEV9OCkENbLTz8O9nBlOtuYF
	9GY1TSsF38xDQoaaldU2S+jfabOWhcJD0lUudl/SM=
X-Received: by 2002:a05:600d:8446:20b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-490ec4d77afmr8812475e9.12.1781249012588;
        Fri, 12 Jun 2026 00:23:32 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea963cf8sm28715245e9.2.2026.06.12.00.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:23:32 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] dt-bindings: input: microchip,cap11xx: Update datasheet URL and LED reg range
Date: Fri, 12 Jun 2026 15:22:09 +0800
Message-ID: <20260612072237.1177304-4-jerrysteve1101@gmail.com>
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

