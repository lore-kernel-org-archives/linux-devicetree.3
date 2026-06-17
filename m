Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7C947B401
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708641; cv=none; b=NMNcc3TQlVVdV+vyHgVYei6sG4zxscAPP73EkdBL/8EZkFRVpREQSsQN72s4kRxVZIJ9AXUFThIihcYljVL80pn9HhdVpyXmC3vmy9npUtI16PMtx068MTkZwf12cYuimMjQMfXs1jkNvtqie3ipDyRHE4uXOi0kuWkdYe+SThc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708641; c=relaxed/simple;
	bh=6lMpZduYpP5W+klHpWiNc9Xd2BaAFhQOHEyJIaimAgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZoYY0etR80YZibQi2oKUOjxPPWHgtelowa80nPB7sTv5nKYoBkBn+iuilCI2Jvi9yZwyZifoWVfRspgKaLYJ2C2LOVzzyUZchpwt+9eW1HFTiEuNkCrdvQXzHkDOejFQwxf4QbqkuQx7SsQduQd4JJXpcZLMSjNNqh1KbcEH9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4yGU6BJ; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4yGU6BJ"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-662dc387b7aso563947d50.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781708639; x=1782313439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo0xjM5xBhMRhmelvlu84hkHLwYRkl5tNqhsXZBc70g=;
        b=g4yGU6BJzzwlILdIhbmQVzWRven5g/rMpfra9w3jzq8D22J4AfJglXYrQAUvvgf2/c
         SrgZ2jVEAdPnzGAAhWoHks+GLxCgzcd5BbPmkm72TOOr0UszhPBUef4BFS7Q72q8EbCG
         w+/RC5Ravg5CM9q4TLSu2X2xMXYgao56KPkvlRYMYzbkR92wyg9qzyup9OUlagajWq3y
         Q/5sseOvnpmIdTzNBBFAj479NnE54e31SecFdT3+siv7pq7CPt4I3yBqxMJBazSLsM0m
         ++T1loACns0Y0UsaMQBqbof1OAoQUYhYXMylYju5T1D48lRAKjSjzoNVxff1GlVNYzhk
         JBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708639; x=1782313439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eo0xjM5xBhMRhmelvlu84hkHLwYRkl5tNqhsXZBc70g=;
        b=F7JMAJa5NaKxcIgt+idnpiaCywliYzK0pN02yHOVal9XOv6OKfulEtQ19cdXhdpIBC
         anSl/tQv8iJ+gDOv7S0Oec/USDORk3fzzt/mF01HWi0KouR/mPgyHiHHEsQkUGCyYla9
         x6clKntKkboxnBPV0HiHEq8RkXkVc9A3rkTg3gmK9m83Fy8zlodhTObVvESxN65t5Pke
         +3Ig6ScOIQwF4oULSrwuJNfL7C6X+G53+HYaz+H+WI4VrPtSedueHI09oqUi4sJOLn1A
         UaYVv/p1nMy8u4FNldWDq1nRecKm1bwefVhsmFavhpZZ17KHeUXocLLJcN0leubPhj2A
         IBtA==
X-Forwarded-Encrypted: i=1; AFNElJ8UjBSDxCirkJ2YpVnzgrcpHHODUoaw9JsPXV/wxFMntfVF4cdKIshq1epNbREgJ/dc7Do37MTlDCAR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6/nPcubkFbheP8VqCO8aZ+8ceISJ5fc09rY5T+6fvW9J2VT4e
	0qsZg3uQXBAx0fmEHSCAn9nnM9YA1BpEpyr/S/o7NAbq7xbjPeUEnsLc
X-Gm-Gg: AfdE7ckn8KsimrjF69DSkamsRPYWe/QydclsO0kXaxztsh7Oit1t6p46cVaqJdm8fzt
	sx+V4E8sctTWrQCan9KKhDivHlF+GtttfvyCFfGC4W2iqMch64PjBZPW+nMZm3zlUDX8N6hMTHM
	2eBAiU0bHnn2NKaGo34LLyogc7GWO5ud8OUuCw8mWzrZRsmIsLf7XJYIFiOLgbsBLiMYrPALko0
	6ljMiZXdBe+NR5eIOTHzLrs7grocG1TNj5JNusd6U2uKjKZ9sjVNiPQQoAUjrI2hptUegWNLHDf
	Sn3iEqSu7y3p0djOj/WKPHMg5IL0kvEfx5DqYUkAZ3DnHMMW1XK/tnGakPWuAOIYnWhzdlTTSuH
	vx8Xy14WrlNnatZ8qPeFN52g30h1MWZEE+xgCMEflJiPLWjoNcl3ez775tIY4Veq6pP9u8XRBeq
	M+6yLQz4PJEQ==
X-Received: by 2002:a53:ee92:0:b0:65e:4b06:f85d with SMTP id 956f58d0204a3-662cba6286fmr2906585d50.33.1781708639346;
        Wed, 17 Jun 2026 08:03:59 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-662b976e47csm4387677d50.20.2026.06.17.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:03:58 -0700 (PDT)
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
Subject: [PATCH v4 05/10] dt-bindings: input: microchip,cap11xx: Add reset-gpios property
Date: Wed, 17 Jun 2026 23:02:44 +0800
Message-ID: <20260617150318.753148-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617150318.753148-1-jerrysteve1101@gmail.com>
References: <20260617150318.753148-1-jerrysteve1101@gmail.com>
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
index 798035e942af..b97e5b2735f1 100644
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

