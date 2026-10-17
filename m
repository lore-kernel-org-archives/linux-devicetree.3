Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485473EC829
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246130; cv=none; b=nftXAhgyqT4MnvK6wwRmrAMT5GZtlaXMy9Rw2UNb7LMbvbZPggV5DZjOXoJiAgSvSpOZnyrWqpa8UB0x2w2/fTPmJYBhQ1lofG10Wr3JKN47+FAMQfZDVwBk9iPPT8OV8HiBiLMzpHU7YVo8Z8BL38MVRQgiW542kkS7YQtnFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246130; c=relaxed/simple;
	bh=bKnsHJpO5i8GgziQaWMpsYIY/GTwM5uEkuyyNJ78nzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrEHb/ng9wjsKBOuTMjrdoQzUZSIEnbfWsAIj5yvuc6wMO3IdDniM855O9Z7KY5LGVHJfsdiq02nwuQB8jtG75RKEw2Z7L7TwOcn50cNok2ecuWor7Vv/B3Ki1tCohdjqYrlGIholfPxxl6HnX8b8UdpJ6fEoUclJreHZ7go4fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6dqWQU4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6dqWQU4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so9016285e9.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246123; x=1792850923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhG+wnkOUndHgFqi7q5mTZCxcyMx8su188FBsGRE7dU=;
        b=N6dqWQU40B87WQHNZ/4Hf2AM+P6Ilk/ZkAXjjHt+OK6v3LJNUMRjURg+E++2xXgthQ
         Fs6ocjoVpxziMztvbi11MF1k/CB9OpPsWjvF0uObs1p6rpqU/n5B+G4u7r3pknSHrdFK
         IFffMQ3MKR/949EcxmRnQUZLu5f/uUtUYkuvYHqamVEdyZUrFQwE3ly7AVXwgjBGiSKL
         ooHBgUtYAInx9HgTGKv0SURuAo832GqqaynoTQPvNIGxpaHGJfAjM6j8IpSGDiz3QgYt
         5O0uOiNUdVsnKAlBbpOoiT6LugH6Vo/WnYlrSM56lT3Px/OeZEGF54L2mirjwdOdMNBH
         mtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246123; x=1792850923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhG+wnkOUndHgFqi7q5mTZCxcyMx8su188FBsGRE7dU=;
        b=WQ+JGudSejIDdKOTJES//ZY2Vw3MwEnlo17bhQIH+yGf0o+dW08EFEuF9m8gtkEasw
         JB/LSypbndkCXib4mJHldgP6gheMDXl17Wbwq6Clg0D1mkIXdMVe7eDArDnx6gFMoP9o
         BL+RQ+IFtBA1pgCPGjsGu+B8mzGGhMIZrmLm4OmOAwYxq8XS4maXOU1YkPO8G+G7a/NF
         Yx2RfYMdsL554kG3yfw1ssXFeokNQJpscejri+ZNTcytLf9DxLMoC9bio0ec922tS66X
         juqPMulEES3ZL8QEKWtPQbcyE/5jTZ7w4SjoEl00wA3l+LZkQMMXxdTMn1VXzPl1I8C+
         knuw==
X-Forwarded-Encrypted: i=1; AKwUvBwu7u+rzgJVMx5u9xcHk4sTzhi+XNt/Ov/GIYmILTZ7pnMZEkEBgscS4JxUOh/q5V/qjNzmXXzNVUdw@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Bq/xiisFroBBWW3zb223oTkUuXvdpyjbjgi03NEGuF6+nLZX
	y04a0LpFPdteHVLp7nKhydlEHuKnWRL7MxbL8j8kLY3JXRXiqXUQofOw
X-Gm-Gg: AYBFou0MbDjpCpu5n3MVVYpgtHu9nP9RZ8DqXEpy6nFq4xSvpmy2z6q5yoeeZqEU4/Q
	8itRluTsJQGezCH3oepA4qzKgbCMKHKwTE6tStVCN0awtFvTgRNYz13kiR863oGQLLR398rSgWt
	UXhM+HzHPnPpcsHGtNRWPMafrMXd9rs3IA0qUKgRP+JXiKXzu5bnvxv5KdC9yGf29aVnerpBIvv
	JQLaiBkadZg68NsiuYCpPRfxAl08YwNB215gVm+yzpSc1DCnqhhT/AQPhtKbbirvMfpTJ2OQFEN
	RB9axCfqLc081Cu/G+sWCPcrjZKZNle3QscaqMAG4q8vmAyAhkhYL1AC78QPFRKFFEb8/BP3AIu
	wgVY7g4XrxNWaHaMNH49jv3NrVOINc9AdsVJL0n+wqvIRSv1K05pKHn1X2GukbOiXTRtk2kaIRH
	+/yBZ30mNbVOJL/2Z/W3yBfJ5hD05zM/6BuUofkgSVzwTlB+X+so3jQN1HOI6gQVf+xalhqf2/T
	GU3qynBxmaB6FomZLzTfWeCjCkZ5FrHOGYd3+pNLHO7QoQtPtPkk1tfR+06xKDlgj2QHOo4ROqM
	Ng==
X-Received: by 2002:a05:600c:1913:b0:4a1:ad01:f8dc with SMTP id 5b1f17b1804b1-4a1d7628d95mr60095115e9.21.1792246123223;
        Sat, 17 Oct 2026 07:08:43 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::1046])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm84430745e9.4.2026.10.17.07.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:08:42 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 5/7] dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT8722
Date: Sat, 17 Oct 2026 16:07:53 +0200
Message-ID: <20261017140827.290666-6-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017140827.290666-1-lukapanio@gmail.com>
References: <20261017140827.290666-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FT8722 is a touch and display driver (TDDI) whose touch controller
is connected over SPI and runs its firmware from RAM. Document its
compatible, allow the SPI peripheral properties and add a
firmware-name property for the firmware to download at power up.

The "-ts" suffix keeps the compatible distinct from the one of the
display side of the same chip, which is a separate DSI device. The
reset GPIO is required, as the firmware can only be downloaded while
the boot ROM is running right after a reset.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
 .../input/touchscreen/edt-ft5x06.yaml         | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 68b2f1601654..51d22ff42675 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -19,6 +19,7 @@ maintainers:
 
 allOf:
   - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
   - if:
       properties:
         compatible:
@@ -30,6 +31,17 @@ allOf:
       properties:
         offset-x: true
         offset-y: true
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: focaltech,ft8722-ts
+    then:
+      required:
+        - reset-gpios
+    else:
+      properties:
+        firmware-name: false
 
 properties:
   compatible:
@@ -47,6 +59,7 @@ properties:
           - focaltech,ft8201
           - focaltech,ft8716
           - focaltech,ft8719
+          - focaltech,ft8722-ts
       - items:
           - const: focaltech,ft3519
           - const: focaltech,ft3518
@@ -60,6 +73,12 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  firmware-name:
+    maxItems: 1
+    description:
+      Firmware to download at power up, for controllers that run their
+      firmware from RAM, such as the FT8722.
+
   wake-gpios:
     maxItems: 1
 
@@ -134,5 +153,23 @@ examples:
         wake-gpios = <&gpio4 9 GPIO_ACTIVE_HIGH>;
       };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@0 {
+        compatible = "focaltech,ft8722-ts";
+        reg = <0>;
+        spi-max-frequency = <6000000>;
+        interrupt-parent = <&tlmm>;
+        interrupts = <81 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
+        firmware-name = "qcom/qcm6490/nexphone/ft8722.bin";
+        touchscreen-size-x = <1080>;
+        touchscreen-size-y = <2408>;
+      };
+    };
 
 ...
-- 
2.55.0

