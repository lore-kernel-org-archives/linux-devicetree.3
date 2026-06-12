Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7B3DC4B7
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249026; cv=none; b=EbmjLKKFEVrLahnlnqHpOl6M5BYGf7xXbxpvenrGc2OyaZWmiGfd18Iwn7NdLpbXHboHpJI8IEqYuWV89YFmOlQ33XgddMLCDCv+ky8pmiSeH3hGMGeFmNlwrqflDs1Hw+KFIbUJwEyz9JW4B5HWWtox3jtMReo3A0g/bk7YjJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249026; c=relaxed/simple;
	bh=nZi0t8cL78YZmxGZD62T2lYOUTFA1HtfINqkrnLD3oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=meb+m7Q/GSh579bKnUiStJfrU6POmRNwXRY1dVTtIEBsAAcJerywHFZNu+/LGH0LKGpvahVlhEs8c28TULNJDkfgB4k5QjwYrjTNSc6HD7Vn1WilGygdT1fDn6T4+hMvdATvUMUvHY7NMKktD9HnK4LHLL74CHdkq4ahizY+oBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbiOviUp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbiOviUp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso4182165e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781249024; x=1781853824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLDZVGka1eJnSriA7FyE8scCoa7JYxvPjm4AqcyjUc8=;
        b=lbiOviUpZTNeDE2WZqskrFhiNEU7m0gY5AAg111BFi7G1z8zo2J0d6OzGqVCFHJLKq
         I46HtrLjv8KmMObc3wvxNIbkibuYU4LxhWKgRPEHyC93GwSpUyEDQVuatrHCBBrrMKY+
         9yfa+ZeZHIZTqYLeZZBkNUXX54ePyGa29wBhTJyzIBvHto1ZX1t9d6YXtLPUHWRIdh3o
         dTTEqskGn9k26YzciqSqW/l5HbKiXSTwvoMPe1xcUqc1UAms8KZeL4mCCbEUHkfGcu70
         LufndXfU5FCOG13NAerrS2cyRsF5OBj9jlbLa5X3k9VvPjLTrtA0/xBkDbSlvYTqyxXI
         DYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249024; x=1781853824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLDZVGka1eJnSriA7FyE8scCoa7JYxvPjm4AqcyjUc8=;
        b=Ec6Io5Le/qFPKExeRFZPf7dX86GBc8Vt1tOQNAKGsoZpzcHL8Y3rTVdiLLuQ8ifV48
         N467n3LT0pOltIwK/jXZ5PlHZYO1XWOWVmrmjnfrEPGjYbqnvCVu++rL7wswkk1gTc/f
         /sWWHccuOibnSeSKEFKnxh3RSoX+AxcIYr5FVBqGCUTOv7040ubR4lP2e3tW35t3V1cU
         Cj69P2DnxMbCAvn0YX+Z45jtN1XIzd0mCc1yE7zqQIPYgxNGad/r1ppBmRWpwKuZQW6G
         w5Le0ZJO1WBEahtQ4cudqLoC6ECshzaNdOztGSOaYtvcWsuH0P6LKR9AjTyq4yJdf14g
         dsRg==
X-Forwarded-Encrypted: i=1; AFNElJ8+zaTZzw0/zJgv7pA0nPjBf4vt/kyMP8dpMzEAqyUxIeiiU/4VHOnGjHOo7KZcfQrR8etSmJTUiLgF@vger.kernel.org
X-Gm-Message-State: AOJu0YxCjKxz+FUIFY0/D7/J9p9FRRUcM/p8jaYMKe6VkeCla1jGhlaH
	p82TyMWv7gyEIJlThTI5yDBbxNv7eCDLxu2ZrtngOJG9Bwwd5VM1/ZB5
X-Gm-Gg: Acq92OEYTkeVk+kPCHDSrR8yXDUwWVOLBaW2fCN/GcvALY9CB4uS2199KW617ewwlqC
	4l9LWLeTZHvYrnY9V5YQhDiNIJwN7k+TQmrkMiXbpvMCZLcypn+MBG+CDov0753fL8kdF8n8kC3
	EvVOqS+HLu3GdotTnCuryLMtvoOitwx8jsKaPc73qsa4nU8z/vmEHf4vBhAFs9+yGBlHA4ZRdKm
	uWPKBxblHL+iDNNXggqkfGpw8XvZ+CsdALzTplEYjQG1y8HHhMzBBLb1glYRihgIoqrEBq9PcIu
	qiRMmkqLAxKAGfFSmZEzlYYc/Ldcl7tMbtk7tNoK2893wFoPvdKZ9fgAORS9K+NEzs/FvO/JSnE
	1V84uR6a1/acaRYRiSMCGVIlfZY0j4UsXcdiup0oPA1cGB17DzghOfrjZpRzF8/gUmjJaCP/KTd
	+NfGR2LlOj5eJrx1VumzbrhaitTGvpZg+/p6csC8KJvwyuZL37bg==
X-Received: by 2002:a05:600c:4595:b0:490:bada:6b15 with SMTP id 5b1f17b1804b1-490ec4fb597mr17556425e9.17.1781249023729;
        Fri, 12 Jun 2026 00:23:43 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea963cf8sm28715245e9.2.2026.06.12.00.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:23:43 -0700 (PDT)
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
Subject: [PATCH v2 5/9] dt-bindings: input: microchip,cap11xx: Add reset-gpios property
Date: Fri, 12 Jun 2026 15:22:11 +0800
Message-ID: <20260612072237.1177304-6-jerrysteve1101@gmail.com>
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

