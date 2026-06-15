Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E8C3FC5B8
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533311; cv=none; b=JST2I1QcCIeXUP8OtbQkQKUb6A0IlriFOdtCEdiOlQPOD/abcemMICFe02uEwyt2qxPpANQwr7v/v7q74VrBehao0Hr6PL/PZkyH8LSUaIgqNlmwsSehjPyrcNUOGvlxMiKxdjezb+6Wlc8hag/woVG/GLuJ+4KKgq9Z4JxEfS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533311; c=relaxed/simple;
	bh=nZi0t8cL78YZmxGZD62T2lYOUTFA1HtfINqkrnLD3oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CD1BAMT2750kYzsIMCkM5A+z4L5y+f1ptug+DyZ1vtwX35awmyWmLlA1JnjlwNeu7KtpTSNJ7PEdYbi9ehsa1ui3H0GsaHpywDFUUdSRHuzWIA20CXNEqqNi9WGX9uiMNGoIn6YrfKjCr/jhBeRCn8OyHUOPc0Sg/Q+PnQJJDUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNuDFRTG; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNuDFRTG"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso2022784a91.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533303; x=1782138103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLDZVGka1eJnSriA7FyE8scCoa7JYxvPjm4AqcyjUc8=;
        b=QNuDFRTGnFwFB4/zl8I8wenQ3kxA5c2GdweuGWfcJrz6/9dMgSunSaFnQwXH3ZzH98
         tFnxJjyDjKz8g4BjRpMknnmz7VnLrxIGQzn3cKcvu4vOffJ/TYAw4mX6dI+d1iu3a/dD
         N9YBPWikmELPkyhKO5xvRHXxaBtJBknbMck+OoXV0JM30nPEtZIXUTG6NA3KHldhJimj
         rPG+l/kcGoqStcfhvQe4D1cMixRhsZxgXi+VS4u6DFP/bYmngzHuUC4BYNAgHJDln79N
         6sEuaOPU0rKZYnGqlLtew0NnExPSwnZv+Is2yiE2dSwIVEm6VaHXAiWjNCYa5Rox4/0a
         dcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533303; x=1782138103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLDZVGka1eJnSriA7FyE8scCoa7JYxvPjm4AqcyjUc8=;
        b=Bz5ptAXi/4fSs74Lz6pyLrRrWk2cWMdcILHaQ0VGyJjULlGhRyEreJFSdcrPJ3Cnhw
         DbkoQZTW65fvg3cJsju4Y9vGd6JVRmq7JzLjoOWqUSpaD8V3y24vXKcXe229N+T5MuaR
         qm5CVbxQzhKdjc5hRHBtCFdgZcy3NYMobJ17qh9GjgmtQ0IUWm5ZiiO/lnQ1taIc4AOk
         G4kFdU67aRbKo69y0KVAmOc1F6bQmj93WhbEYIHRpSGbWnQGbOVq7i6tRI3eWN23/aBV
         1vUSPF3f5MgSu97fdLEtnkHXuzm746IvRdChKgLNWRoT2tCq3GhoVT6vobWTTqVL8ikL
         Pf4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+C2beRWq93yVMss+wn99QQRZji7PpNoF5T4J8Fh8i3j5W4lobOsSMQnKKXs+AAxQ57Aydbim21/7eE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8upa1MrAIJeHH1rHj0MvJRClu6JUl+Yim+gRC4101spRcvaS
	eTC+jshWl4Yy8X/wEgIThbQ7+Z0IoBSLXrZBVhoQkXYjLM7ovXXjvPgF
X-Gm-Gg: Acq92OGkvr7ZwFkmFMGMDUrhAX8SwVxqf2PswZhD6+gOZbdiL8ILzTYqZbhFyooIG/g
	aHxGtCZMQP+TXIANUGBB0n1LkkJabCgBruoDFe5En8SACRqqcHGkcf1G4P5JpRpB4fVVtDwWaYI
	5yJ6nseZBfamyjcUjTCxZp/+pFdiZ6psmJbboHrMymrP8awcV3oWzA3V6yKt/u2t/GdyToNwdR0
	FUtrjSeYi7waCSItLBMx/D/aWVZRsVjDG1DU5T7ytphoaQSSkzuASwK2HOFMqhGHbf933EOr7Fn
	q0k9oAWx/b8lvKrWsQ2w8y14nBhqGQeLdnQgFPX94Uhab6fmEUX+sf12lJUMUK95j+h0EnoAHxS
	yNU6PZG1kkKFQqTwDG8XYcyM9jTCUbqRQg31doS2J8QOs3ft2t+rbylLBJ6Ka8ycQF+Y7NblBXE
	byKscniOweVKKm19WV/j4g
X-Received: by 2002:a17:90b:5624:b0:36b:ad81:c134 with SMTP id 98e67ed59e1d1-37a01f335a8mr14948582a91.10.1781533303389;
        Mon, 15 Jun 2026 07:21:43 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm7178233a91.2.2026.06.15.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:21:43 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] dt-bindings: input: microchip,cap11xx: Add reset-gpios property
Date: Mon, 15 Jun 2026 22:20:31 +0800
Message-ID: <20260615142103.352163-6-jerrysteve1101@gmail.com>
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

Add support for the optional reset-gpios property to describe
the active-high reset pin for CAP1126/CAP1188 devices.
Driving the GPIO high asserts reset and deep sleep, while driving
it low releases reset for normal operation.

Restrict this property to be available only on CAP1126 and CAP1188
chips, as other CAP11xx variants do not have a hardware reset pin.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/input/microchip,cap11xx.yaml     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index 22a292d4a880..778ec6d659a8 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -49,6 +49,13 @@ properties:
       device's ALERT#/CM_IRQ# pin is connected to.
       The device only has one interrupt source.
 
+  reset-gpios:
+    description: |
+      GPIO connected to the active-high RESET pin of the chip;
+      driving it high asserts reset and deep sleep, while driving
+      it low releases reset for normal operation.
+    maxItems: 1
+
   autorepeat:
     description: |
       Enables the Linux input system's autorepeat feature on the input device.
@@ -157,6 +164,20 @@ patternProperties:
 
 allOf:
   - $ref: input.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,cap1106
+              - microchip,cap1203
+              - microchip,cap1206
+              - microchip,cap1293
+              - microchip,cap1298
+    then:
+      properties:
+        reset-gpios: false
+
   - if:
       properties:
         compatible:
@@ -207,6 +228,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
@@ -228,6 +251,8 @@ examples:
                          <109>,	/* KEY_PAGEDOWN */
                          <104>;	/* KEY_PAGEUP */
 
+        reset-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.54.0

