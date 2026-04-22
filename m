Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E0735B63F
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776880766; cv=none; b=lRrkFiWcEswiO0FeIzOhYLTwQFFqKxVz5o2FcOyIlQdS+QpFAaTLnbC/Hv3i71iG69OXM1FEpReklYatpmMWwlG12TZT70CWh5Munj9gnwAoniPa2NtrYaq0+v0LUv5JnVVsKRrZmxY+BN0ho7+sQ57Elb5Eehmk/h0bv6rhKh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776880766; c=relaxed/simple;
	bh=0EQVOM5UfQLhGCbzUWEfNLcVwhW6GiAbaiGqT5rlV4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOlH3or12Zir+rt7OIXNxrGG3CMwXGe4fEJc5aVBLx4ZvXIkQbKLTVtGC1XmmKj2pRjo2b0lLmx15knGyWZt943ZxM1J8nyM4g3ILhTqWx/H/L9mFJmvvIsgVL8lJgTqKUbWeUaObmRq5fff5sPnm7IOxJt19yXIxnb7/7vjYqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+/KLL9z; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+/KLL9z"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so2441503b3a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776880763; x=1777485563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftXrLDJi6w7JnF2X+ObW5xlG+z41xv2Ad84lI5gTtk8=;
        b=c+/KLL9zUiz8CPbAnHPZAgbqFclMUpqYAZsIXo4NbXxwxRZu26pm1p4S9q5AqUy+pv
         0ENewM5evP9eHjkvMyk0PE5ZMtCkELXMDSnh0Upgp2+3KmHpT+d1gcz/O9V8kIHAQJ8K
         iSQmJub5V+BI/5Fc2uvBaFFkn8D/R8qdvxEAAIPG6CRA2gLO8h7iZGR9TmnUYtHDtveg
         I0sGrN0qdZoXmizi4jC5PP6PSN2APJ5P6lLHB1uddmgqHyZuVApaJkgRYBeNLBWQ/lnz
         XXyr2LN/NmKvweMZXHE42ZCD5BT0WeFIGo7FZih3HJoyStXMwOGO0JKN8SfmgqZvSoZf
         UV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776880763; x=1777485563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftXrLDJi6w7JnF2X+ObW5xlG+z41xv2Ad84lI5gTtk8=;
        b=XcuRQf4j459YgqWVa21tkESbYCBx+Oj+hop7vMNhzHcvUaWxFzt2Jo2PKw6uJQVDlg
         +M2TMmS0CjgUaBgMGAk68VrjIyLcTVZsPWqcNK23rHyGhUbNJWB+jUoi4oThywuSX92k
         NHH7wW4bEkCH8HEF04lQmjLqOpLZj1S6kBNI+XnvBEjwa7YokhWRCj/b/CuxLL0WSrwh
         6jpgsf79A6jbeEBa0Pqf74tLxAME5/VswMmDOpLw7R2xJP1orpicHeGR3JYuTb+WulmA
         0nVmnFXXTSHKJZnyHK8PfR0UzsYRwTUWWGrLsmlIb2PMcQW2pL4SnP1gKFrzFuxTsL1r
         XPpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IddOuLIiaSDNPXovj4Qzr4xWxbvKseQxE5pUwkAS2v4Wwg6BxxWe7nGJI4OUwdfhQo33PQS0WRSRl@vger.kernel.org
X-Gm-Message-State: AOJu0YwnkBNZRj+blBJnl5XyghsTxswQzIPReU81c6FV8kLOHayqjGB0
	uqw9yPmXfSZxKJidrbdYKzcZBrgy/lkif9SdCuggx8uTVCyBVkOEZokE
X-Gm-Gg: AeBDieuGIo/iJCxb0Hx20a3QQaGWGMiHex/O6SoacN0cmqxFWwPWPayOoQXJjwJ52eW
	+rDuXqQOW58TJ/JVsDHqTsTu8/M9g+l0ah6quJA89DQhQQnSpGgByMoY16pa8dSyaxvYWCiB9kP
	JWetWHTd9WSCXDN5HaE8Y157+/Z0JeTq7aaZnTgnShPIefiVHDBxemEgP4UcXTCk21nA69/y0TT
	fxHpDchE1gn2t/gnbDPlena5LR6MFMei1B1m7tPqRCpbVJxmcIFYJ2TarhCRZ/0UeWx/xyRLCgc
	J8JmakQz4M06iZeD5i3TTvj7nNw3XQ1XPuAHexgatGL+RDH8b1rv6OGQZ7I55536bToAgFD4kaH
	KaY6u+mo4t12zURCxmTq9VysU/VqScAVSQjalxlDlbj+oKfwS3RV7h6iBVcn4PzYfRDwfola0AL
	MGy1Upy2mZKq/Av3El3XqvmRMD78gNCgpE5+8NsVLu+vbtiyx7FwN9bCnQgfhv0vGE/uXKZsD58
	BdESkCGHG5ixAfK7K8dP7wsLY1Wwx12vvfSWNg8aPEbV4yef/YnTDN2plqYRQ==
X-Received: by 2002:a05:6a20:3d82:b0:39b:af8e:496f with SMTP id adf61e73a8af0-3a08c910f4dmr20227565637.14.1776880762895;
        Wed, 22 Apr 2026 10:59:22 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:48f3:f940:b423:53fc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f9cacasm15174361a12.8.2026.04.22.10.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:59:22 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Andreas Klinger <ak@it-klinger.de>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: iio: adc: avia-hx711: add avia,hx710b compatible
Date: Wed, 22 Apr 2026 23:29:08 +0530
Message-ID: <20260422175910.1258579-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422175910.1258579-1-piyushpatle228@gmail.com>
References: <20260422175910.1258579-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HX710B shares the same two-wire interface as the HX711 but differs
in its channel and gain model: gain is fixed at 128 and the number of
trailing PD_SCK pulses selects the input channel rather than the gain.

Add avia,hx710b to the compatible enum. Document the chip differences
in the description and add chip-specific supply properties (dvdd-supply,
vsup-supply) for the HX711, a rate-gpios property for the HX711 RATE
pin, and an allOf constraint that forbids HX711-only properties on
HX710B nodes. Clarify the clock-frequency description to reflect its
actual purpose: controlling the SCK bit-bang timing.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v3:
- Drop the vref-supply mention from avdd-supply; no such binding
  property exists.
- Drop the clock-frequency sentence that repeated the schema default.
- Restore the example node name to weight.
- Remove the separate HX710B example.

Changes in v2:
- Remove driver implementation details from the description and describe
  hardware behaviour only.
- Drop unrelated punctuation cleanup.
- Add dvdd-supply and vsup-supply optional properties for HX711.
- Add rate-gpios optional property for the HX711 RATE pin and forbid it
  on HX710B.
- Add the allOf if/then block forbidding HX711-only properties on
  HX710B nodes.
- Clarify clock-frequency as SCK bit-bang timing, not a crystal or
  external clock input.
- Sort compatible enum alphabetically.
- Remove redundant example comments.
- Update the HX711 example to exercise rate-gpios.

 .../bindings/iio/adc/avia-hx711.yaml          | 50 +++++++++++++++----
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 9c57eb13f892..0c7c5843b8d2 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -4,24 +4,24 @@
 $id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AVIA HX711 ADC chip for weight cells
+title: AVIA HX711 and HX710B ADCs
 
 maintainers:
   - Andreas Klinger <ak@it-klinger.de>
 
 description: |
-  Bit-banging driver using two GPIOs:
-  - sck-gpio gives a clock to the sensor with 24 cycles for data retrieval
-    and up to 3 cycles for selection of the input channel and gain for the
-    next measurement
-  - dout-gpio is the sensor data the sensor responds to the clock
+  The HX711 is a 24-bit ADC with selectable gain (32/64/128) and two
+  differential input channels. Channel A supports gain 64 and 128;
+  channel B supports gain 32.
 
-  Specifications about the driver can be found at:
-  http://www.aviaic.com/ENProducts.aspx
+  The HX710B is a 24-bit ADC with fixed gain of 128. Channel 0 is the
+  differential input and channel 1 measures the DVDD-AVDD supply
+  voltage difference.
 
 properties:
   compatible:
     enum:
+      - avia,hx710b
       - avia,hx711
 
   sck-gpios:
@@ -40,13 +40,44 @@ properties:
 
   avdd-supply:
     description:
-      Definition of the regulator used as analog supply
+      Analog supply voltage (AVDD). Also serves as the voltage reference on
+      both chips.
+
+  dvdd-supply:
+    description:
+      Digital supply voltage (DVDD). HX711 only.
+
+  vsup-supply:
+    description:
+      Supply voltage for the on-chip regulator (VSUP). HX711 only.
+
+  rate-gpios:
+    description:
+      GPIO connected to the RATE pin (HX711 only). When driven low the
+      output data rate is 10 SPS; when driven high it is 80 SPS. If
+      omitted the RATE pin state is determined by the board wiring.
+    maxItems: 1
 
   clock-frequency:
+    description:
+      Controls the SCK bit-bang timing. The value is used to derive the
+      delay between SCK edges; keep the SCK high time below 60 us to
+      avoid triggering chip power-down mode.
     minimum: 20000
     maximum: 2500000
     default: 400000
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: avia,hx710b
+    then:
+      properties:
+        vsup-supply: false
+        dvdd-supply: false
+        rate-gpios: false
+
 required:
   - compatible
   - sck-gpios
@@ -62,6 +93,7 @@ examples:
         compatible = "avia,hx711";
         sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
         dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        rate-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
         avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
-- 
2.43.0
