Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7E47669F
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307913; cv=none; b=mFnqmLrPtS6vv2Q9gWJRvgdBr2UvH6cNtT6nIrQf5YYXPGvYOoTY5qoKuNMJlb71GJaZK6Nh9cFo1q+zhox3aGXAkayxyAoT8SGA2CloSUYuqpJXk+SAMZvIl4rGgVoRB4su91HAM6l2daQNmUNRRCGQKNbQBF0IMWEab7s/AQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307913; c=relaxed/simple;
	bh=9gxlDRHqhuwt8FJ/CwukjTyzdPv7n6MCBFsd7dAHKR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLMKpqWw2lhcP4o42cVyJw1SsDanMeXj+oZsFFy/tu1XV9qEUWlY69bGO27Xnt51raJ1C8eCxs2YZIfRA12Y0xOQTxmcpERI8PtyLXAetruvCkqyQTfBLcd6yu067xT9ioFObqV0ezZ1NsXtsIwDrgtLfQe7ulOxSc4rushhgYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVbJYFFs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVbJYFFs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so3439235e9.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307906; x=1787912706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ht5SF4+wx6Jf8JH+OLs35dYBN3IVS35rx1u5RktbmkM=;
        b=HVbJYFFsfHHdhr9I+hzI1eFyz3vSZWsjDeitoM/gZlePB9MjYHNieWY1PLlH4gMetJ
         pv90BUseyhihDJQpI2gtXDiO0tJnOUp8RrzjjpnsuO8vILUzWirjEZHpdtIYgNzG/FcC
         SRErJE9bsYyJe2C7U2o0DKDg2GJpaL4HJ8sFpSDbKy/kG6TWmz8EmUfUcCgbYaJAq+P/
         06YEKKTTwkEL0Ip1Z0HcVrJh1Kc0gjg6YxM2OpVtQp1ZI7hEGG+IPSRfOOW/v8PQcRN/
         c5KSH2CZ12Z6b9MXlJgWBYOmkGvbxxSGpbLCLmEoPmOslqsYNWYZPSHWBb/OQWe0pDf0
         wIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307906; x=1787912706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ht5SF4+wx6Jf8JH+OLs35dYBN3IVS35rx1u5RktbmkM=;
        b=CRsTGj6bIdWjh9r2+uIUISH9VX+ObojRTJiZt6216eCne5znkyYaFlr0HNM/UvAH/D
         8lO8SRpngcg6zZepd+YCQHDp4Fhkn8wm4+FeRDC5nfOpeFUkOadDPsU1HtxArluhUBIS
         U4ebFdQDN30vDKZn/onjvTdG2q2+XGT6d4P5Rg08zF2zHR0wyNobo6mXLiLMpPMLPTwu
         XPZZauAX5UPpyvOWXpgI3KQEOjyOqBSns2V5Q3JEUCUrjy/AbF9w6mrCEoXFwzE3X3w1
         TBdFerzbQwXfIE1GzHuAo4FCCHf8aWjk7+bnAeLOhF+0m9MdCJ/WxDiu87pWLKTBG1r5
         EiTQ==
X-Forwarded-Encrypted: i=1; AHgh+RoW3il4HrYvXadHWeqEls5RAi8l3GayFl+ESRbVbMgeEimGj/JNmzx4CFyvm5fJkgv3l0jrkkOzZ2NT@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxdoK2AnYYqUz+Qg8fH4ySRm/zi4PgkrtE7k8OxTRPSwQAbI7
	fmLBX+TNo9oeTak3HQji5MK+2XZiPKkupFU36LSiMqEIYHFFbEpu7ql+
X-Gm-Gg: AR+sD1252hHWQPkrel8zJjzT8mC/03E6VLhn1aa/vBSjtjY8eTlT0HftetWzgXWUMLh
	P3cDyDtbYmC5NPsZhQbxxHXvM0HXfIyDWh06bEOgSBJ60S6142xLRywypLcvCvDAe8rliqnkBzo
	/7UligWTQQUukbdQF03yDYwswRSjmx7tpwLfCHdyTOD/dl2oBwLxQgdEAkMno50SqZ8oYiYm/q0
	xp/aKpAVX0WbwS3xjLHDGr3TiKYg+wQYLA3MxHaxp7HPshBd+W60Rxzdwl9IcCKS9EKjNXy9RWI
	L0ClJD/erMqch6/Ne6W4ulnYHfwf4asFJFHEgGxIE/HuJWUedJgeZPk7rydNUozzFfRZdjo8MUx
	IccAhsNrqDXBJraeZdpMu0FkkvjwJCVSUnADrTdClz9VRPwwwvkh2rBF6W1fCIduKRoFRjQHz8+
	23UiR5+4gnpr6c6t0bC+goVnHWPpuljgk3sHwmS97cwbk5SXku8Oa5gnla7VBximA+YNFGJW6Oc
	ChuJLujesNHiA==
X-Received: by 2002:a05:600c:8b76:b0:499:8c68:a3aa with SMTP id 5b1f17b1804b1-499b8475133mr82881315e9.13.1787307906435;
        Fri, 21 Aug 2026 03:25:06 -0700 (PDT)
Received: from fedora ([105.74.130.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9ba5139sm11663155e9.2.2026.08.21.03.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:25:06 -0700 (PDT)
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
Subject: [PATCH v5 1/6] dt-bindings: iio: dac: ad5504: add output-range and missing gpios
Date: Fri, 21 Aug 2026 06:24:43 -0400
Message-ID: <20260821102452.37407-2-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821102452.37407-1-0rayn.dev@gmail.com>
References: <20260821102452.37407-1-0rayn.dev@gmail.com>
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

