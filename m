Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7F43BFAEB
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001095; cv=none; b=kQb07RtmHlJUbNMo1PGEhCGGPoy5FzErtRxDb9UOGW3mSkQd4stjSUCIuChyvwNuZiJrvYmVbn5iIZ1vry/bQg66goHKR7+BD+GXu8EWqf2tvQW5m4dW5xqjuzAYrDrCPizYQndHLfeJQ4ODIgbVQ4Puu+OrIdy/sZXzAQ540Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001095; c=relaxed/simple;
	bh=9gxlDRHqhuwt8FJ/CwukjTyzdPv7n6MCBFsd7dAHKR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i72tsku5C+TaLvmtus0mUi8Gfr57jdXHbVbmujylh0bF2Krz+GBJYvOHp5P16M0UVeWcxiexrcs7AspwNjAF4AWMAm4V4+CavUo1ZBX0Yh6UHydIKZbxHefWCUDDJEPWbEq1xJArK1cJsdBHavqXn0khbHKGypSQpGuSAUZjG6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9tCz+L+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9tCz+L+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3943237f8f.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787001090; x=1787605890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ht5SF4+wx6Jf8JH+OLs35dYBN3IVS35rx1u5RktbmkM=;
        b=M9tCz+L+Hbev3R+xTFWnewrHpNUkeCm5DAeEcIz1WCzOdwFUAjx6XF06Zhps9mOAl8
         gi5P4eEX7/i02a7CFjsn/8Yk5YY9pNgV1hX22Ivt0v3r4zhdAiEVia2HSWdqWHc/K23O
         Ymck1jO0Q2w/efZ9HCAVW6A/2rO28c3y6/QighqnL7HbWuNFEIZoLy2V16N280ADxQHL
         6yAK/8k1Euzrql9p99/xUzjrmwfhHVrIk/Ba5nkgqJF9YDmrW1aVjdt+KbIlLWqUezfp
         EQtNndCeEtHB1R5R8x3Gggvb533crJtmaRzv3zfDguqs18wD8X/NEGKNaaATnMfQPL7c
         t9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001090; x=1787605890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ht5SF4+wx6Jf8JH+OLs35dYBN3IVS35rx1u5RktbmkM=;
        b=B+0X9Tsi4R7//P2H8do1pYxtKOQGL7o2mGNfBtXn3VY1MB2Bg3+VyHRF1uqyGCItFH
         AxgpjIK9luMauJiFockLj0g8Wsq3N75bbloUi2JGsNKRnFM1jpQwfjFrwPC45QRBHsKx
         hDk4XJLgfnr29X3cqMIxLL50yOZn9nn4UguHKKz3u1mInFCLLOdu+bDuuWZ8zttiffS9
         0bhuHPELxYgVKyjGQlVZDn/Ly3dVchDy8kgd/qdGmg2MSzJIY9i3xTPkjG8yuFq7xlp5
         0dNnHKXA+SK7OD8fjKMBk9NofJlbce7TG3cl5242Fo+jCaiFRo+tcvVEz5Sb6C8wFxsD
         wMrA==
X-Forwarded-Encrypted: i=1; AHgh+RrAdWIMfAXs5qGFDwo3l9cW6JoZtscJlU6f81TQnzsqB5/HAyOJFVjLUhHNrGnzai9xWF1AaB67gUXW@vger.kernel.org
X-Gm-Message-State: AOJu0YymsAldUhAwVag4jLaJp5ytqHdTlzoOMhTM1s6pf56pPMZ0F/TW
	evTAmK8ASqghGhfKTNNMNxu4gSbz94sbRnSRjwjP4lOaZ7dvXo3p68zW
X-Gm-Gg: AR+sD13JZ/px3M5RftdfBqymGwSIk4Qtvfs5HfCATfSHuGxMqHB39IKrlcnCbPubE3D
	jDAt+u+4ihfqcbSvS8K33/DJbsVWbRNxPK+GsImMkwA7ohkw2MtfkVSYS9ZsHiBT4aWsShCwcWo
	8KaTAsnXr+58TvrKjx1NpdLA8rJW2muIdBhHzjHvL4NtdJVM9pIgCqlkKTh2EOsC0MW5nVK/PIi
	YMD0+R+Ona1Qac413TNDwWs5gJ+O2/Gg3zovCCV+7TK4dd6VyyT3ZyWTh0qdUgaeOtosVnU3LLh
	RlkSEaE/PQh+wV23w0gl2bQtstcd03axbqNjenhw9HxQLqLEikhWCoeYS9EDkZaTXJhyj9K03/n
	cKWVgrPBvJOcu1csp/3ljl9feuh+ex0Lo7wg/DSOyJe5t/67XEt9ZZF9rVWjMKqVHa7q5F0mHxX
	QRMwbLHwQzgceefAcY2XDMOqVWSbbu0dn90rdWr+jCu4Jo1Ah7FectzAireBOXLfRELGyqPD+dh
	fL0wexXjmM1
X-Received: by 2002:a05:600c:3b23:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-4998ae1bb69mr347688205e9.12.1787001090092;
        Mon, 17 Aug 2026 14:11:30 -0700 (PDT)
Received: from fedora ([105.74.73.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996176b95sm134587625e9.10.2026.08.17.14.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:11:29 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de
Cc: Michael.Hennerich@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/6] dt-bindings: iio: dac: ad5504: add output-range and missing gpios
Date: Mon, 17 Aug 2026 17:11:10 -0400
Message-ID: <20260817211118.21833-2-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817211118.21833-1-0rayn.dev@gmail.com>
References: <20260817211118.21833-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD5504 output range (0-30V or 0-60V) is determined by the R_SEL pin.

Use standard output-range-microvolt and range-sel-gpios properties to
describe the hardware configuration of the R_SEL pin. Ensure mutual
exclusivity using the not/required logic. Additionally, add missing
vlogic-supply, clr-gpios, ldac-gpios and datasheet links, and provide
a complete usage example.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iio/dac/adi,ad5504.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
index 9c2c038683b4..e0123dceaa33 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
@@ -10,8 +10,10 @@ maintainers:
   - Lars-Peter Clausen <lars@metafoo.de>
   - Jonathan Cameron <jic23@kernel.org>
 
-description:
+description: |
   High voltage (up to 60V) DACs with temperature sensor alarm function
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ad5504.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ad5501.pdf
 
 properties:
   compatible:
@@ -27,6 +29,29 @@ properties:
     maxItems: 1
 
   vcc-supply: true
+  vlogic-supply: true
+
+  output-range-microvolt:
+    description: |
+      Specify the channel output full scale range. The R_SEL pin
+      determines if the range is 0-30V or 0-60V.
+    items:
+      - const: 0
+      - enum: [30000000, 60000000]
+    default: [0, 60000000]
+
+  range-sel-gpios:
+    description:
+      GPIO connected to the R_SEL pin to select the output voltage range.
+    maxItems: 1
+
+  clr-gpios:
+    description: GPIO that controls the /CLR pin (active low).
+    maxItems: 1
+
+  ldac-gpios:
+    description: GPIO that controls the /LDAC pin (active low).
+    maxItems: 1
 
 additionalProperties: false
 
@@ -34,9 +59,17 @@ required:
   - compatible
   - reg
 
+allOf:
+  - not:
+      required:
+        - range-sel-gpios
+        - output-range-microvolt
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -45,6 +78,10 @@ examples:
             compatible = "adi,ad5504";
             vcc-supply = <&dac_vcc>;
             interrupts = <55 IRQ_TYPE_EDGE_FALLING>;
+
+            output-range-microvolt = <0 60000000>;
+            clr-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+            ldac-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
         };
     };
 ...
-- 
2.55.0

