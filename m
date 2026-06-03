Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADB347887A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512571; cv=none; b=Z/gZzTgZcdKnm/7wX6iu7zH2ptuYkBOW5LGLa4pDj3so4aTW9AxszEBp6fCWcIHRdv1QPYlpdf9nzANCJ3gdl/KLDXS4e2NWznfwY2tQ/QRT1pXOU5wy7ioSEE5382s/i7GzgyH3qNKHk/HahIGJiy1vR37sEdMTKEOLKlPma2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512571; c=relaxed/simple;
	bh=40M2sV1ViupapFAfo9CoPrRZTe8sv4vv6buoDystY7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBWaIhBt1d9cFHKkXYOp0BIuqqgaVKMfqmtlf+s8kNnu1MLDE7ZA91OuC7oRcd58LVh/+mLLUttvM2QGHbButf5GwuriPyWhE54bvKWBUSlwNRo/q6QMZMFZ/G/BdxR48wKW77kifGdQ87Vm2gszh7ym2CdvUZx3K7EufI9zCgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N32nZj4P; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N32nZj4P"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0aa420401so33152115ad.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780512570; x=1781117370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6ML9c7gULfSe+6SlEf0Y7kEnMjS6nVo8dQzv+8WvZE=;
        b=N32nZj4PgsJB/OXiijJtRx7Amw03+WqvYCBEmYTk9bSLmEItvMtOuN5OSUsL/e2CL2
         y6dkHOcsVRcXsFTvHKZ/R4rs42/nSxDaZYKV5PAJoM3Utr8+PKiAJM+SmnK5jdYaANIB
         +hhHG/r61ny0fx79CL95oyl68t6+vgD3Qh5jQ4QuSd0E3ty7ajMIQhtqW3hEmgEew5nd
         nH6Xkui9lRf/OWX3v+In5e4CMsPup6YxXHnu+jVJcCIOMF/YVrzpe+ZJVTfhdSfJeoXs
         HOfsNAGcydzAGEJNLCh9Gco5kM1AWy9n3TZsF62WFqdkpbzu7+Mhd94YSzDDAMfsg1AU
         UjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512570; x=1781117370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n6ML9c7gULfSe+6SlEf0Y7kEnMjS6nVo8dQzv+8WvZE=;
        b=qWXPbLoNv5pqI1u6wrmdUrjPG0DGrwIFxnC7Otqv510f/3MVJTO5sGAIvBQsPzcm+f
         JXF7oOQ6oFxe3TuxmDXhNuC6XA1R3+FTUIZy/Viqv1baIWbo8dv9I2IEmW4cHyghZUf/
         tlCTHo/ZnJoBVM3dSZiRKdJ3BmuesZk8AQ0red+kSsxA3Zn5N3Jvux8mNO+AjVRa2dlq
         Y2XgVxE0R4FHe4hs6uIG5JPWJIzrQdUEtUlZNzBFN5iy4oMZK7u72ntdjU8xXjzuToSR
         t63Xft4V+x1I2qiAuBYqL8xHEEZ5Pn+ly5ZjBLH+KfdqO5yiDm4CWXLFw/iRgPJ45RLb
         47MA==
X-Forwarded-Encrypted: i=1; AFNElJ/6kM/ZDo1M8vonF4PllUXE15Jk+T8rmW2L+N10EV7RZJZ6vajwpWi+xF9DuBSY5dB1tLYMcvZXsi8W@vger.kernel.org
X-Gm-Message-State: AOJu0YyP9cPuU0SouCKL7e4KfCPxrjLA+s5QoWUaVP34j75Poj2PV7x0
	7+p1QxEUTHyY0KC1p2Y3HdwY5mWWYbOV5R8xGAW2SymY2AKd0B5WzOas
X-Gm-Gg: Acq92OEdTMgA67SbyEe2GKKxnwPPyIf31F56XluSyk3UyWrXOxtlVABdbSuY8905Sdl
	icd11YuCvkli3yAKY0nAhJa672y/R9CVedcDEU5gsFQnwe0ZhaduNScSxAkbXb5fS29J76u+lwi
	jWGXC2o122vi2JWaAE8ZtqB46CO6QxJWcqwiLM5/ueIUSGrE7aLkz7rFza8I+ZGgO60m4WfbFMH
	nP1HjP+vNRbuBYuOqqt7JO57QGFhem+jIJAmhGjHcd6S8EPfjr/M70wymay7cm1545USV7PDEEl
	H1H7g2PcjG1xNM46KNXvfAgbc5GveQYuagtQA9Xwyuqxc/xCvMRzh57y2Jby/LYaVU2dJWzoOKF
	I2jGPm37EcA1JAWHu6E9o/Ql/xKM0ix0Qe/f0divHA7IPtkENWBhdw024DCSTeFDk2Nvl7PjBox
	LA2rYDdUroH/qKRFICttyD7r2kQ2uWYIwz0iJ7HN+BXJTLevvXbTjH0Pgipthazq66flo9HDung
	HCnVDM0YDvmNkIXlt3NjsePD92w9kTKmKrK5TJX1wz24HYzeAzuhw==
X-Received: by 2002:a17:902:e54f:b0:2c0:d097:51ba with SMTP id d9443c01a7336-2c163fadb2cmr48915475ad.26.1780512569723;
        Wed, 03 Jun 2026 11:49:29 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2409:40c1:4015:6e6f:ee79:7998:9a6f:65e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d59csm32139675ad.4.2026.06.03.11.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:49:29 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v11 04/11] dt-bindings: iio: adc: hx711: add HX710B support
Date: Thu,  4 Jun 2026 00:18:52 +0530
Message-ID: <20260603184859.89693-5-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603184859.89693-1-piyushpatle228@gmail.com>
References: <20260603184859.89693-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the avia,hx710b compatible and document the HX710B VREF supply.

Add constraints that forbid HX711-only properties on HX710B nodes and
require vref-supply and dvdd-supply for HX710B, then add a separate
HX710B example.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iio/adc/avia-hx711.yaml          | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 099235b5fd54..13a3a8b007e2 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AVIA HX711 ADC chip for weight cells
+title: AVIA HX711 and HX710B ADCs
 
 maintainers:
   - Andreas Klinger <ak@it-klinger.de>
@@ -14,9 +14,14 @@ description: |
   differential input channels. Channel A supports gain 64 and 128;
   channel B supports gain 32.
 
+  The HX710B is a 24-bit ADC with fixed gain of 128. One input measures
+  the differential voltage between the two input pins; a second measures
+  the DVDD-AVDD supply voltage difference for battery level detection.
+
 properties:
   compatible:
     enum:
+      - avia,hx710b
       - avia,hx711
 
   sck-gpios:
@@ -53,6 +58,10 @@ properties:
       RATE pin state is determined by the board wiring.
     maxItems: 1
 
+  vref-supply:
+    description:
+      Reference voltage input (VREF).
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
@@ -62,6 +71,23 @@ properties:
     maximum: 2500000
     default: 400000
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: avia,hx710b
+    then:
+      properties:
+        vsup-supply: false
+        rate-gpios: false
+      required:
+        - vref-supply
+        - dvdd-supply
+    else:
+      properties:
+        vref-supply: false
+
 required:
   - compatible
   - sck-gpios
@@ -81,3 +107,13 @@ examples:
         avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    weight {
+        compatible = "avia,hx710b";
+        sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
+        dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        avdd-supply = <&avdd>;
+        dvdd-supply = <&dvdd>;
+        vref-supply = <&vref>;
+    };
-- 
2.43.0

