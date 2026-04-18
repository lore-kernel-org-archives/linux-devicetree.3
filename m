Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50913128A3
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776531961; cv=none; b=i8HCCz4C0k0n2vjP0lUrctq5DDYsvMaMvQcw2yczW5rlbiz5GTswRjPApqupGBBpuR7P/ewgOVBv8EDkNNG/pW+MF4/2kJvp/lxG3welSVLh23pQbyqHesWAn59sUJYhMroyNIfIQeJQWio6dwSr8CvgpQYkxxXCxuHwb2Lha8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776531961; c=relaxed/simple;
	bh=AmWEh6daW1VQAeTy8GGtceY6duADadqAiHNIJMFUJhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LH5snkYWDDCJFY6w66Kb4xJ84PMYAGPQDZ3Zdev9oXJtCp9+DuCPMbKybI+n1/ESUgcK1EmXjT0ZcooSEfyCfOoolu4qUdzKdHAgvMR7/XJ/e9DL7p1TAa+Ko9+LMKc8M7KYGSeB2yBVbl1Xg3UjsQMtX4RqRuU0+TbmXGrBVX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UT1G/fsZ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UT1G/fsZ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8296d553142so1061811b3a.3
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 10:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776531958; x=1777136758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JodRHsR4G0nSxaXov0yHPNIAP1IY9vLGIzz8YV/oYk=;
        b=UT1G/fsZNeA2W7gxFGrWJibzmtl+9tvigOJUdw69RYWg/r3b8TidIRMi+MQMKLKWAd
         RRy9N9l5+k/z/CNOkbJ1hFw6pwDuwWqTWibgVoUMKCsIjDIZvbQr7/KYeN/AXSsURvMZ
         eEj3i5KSw3GM0oJf6YCKHL9+1BZVmNYTuuRjHJrK13gvuyUZzaaDpAinnyZjjiLowPIw
         LhPfuvfirUZmMx4HcpTNWkrCOmrmpq5BfkvlvqOoetbA1/rcRAyL7mGdB/N4lH0MRUMb
         /yAGlhPXoRanwC98L3xbSg2UT801yUAO61LCGF8faLCezF8hUy084U3+ujeboNUEPZAt
         4WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776531958; x=1777136758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JodRHsR4G0nSxaXov0yHPNIAP1IY9vLGIzz8YV/oYk=;
        b=tNLZ4TgCjYms8qnlNJQsDS2Tjfi5zX0479MXqBrH0R795+Pp745uHYH1SOtP361Ri4
         Zo25XcBMZeuubgX2m3z3cV3lvghsYodQDh1nmOEz0S1aR8BRxbM01iFmcOU5QqgDgND1
         DltxQdZ+yQVwdE9VgCND0uj9dO2evLNMoP3lRmLQdOZIxRp5nBlliVOMD4ebl2yUvf0N
         eFdnvwHyr8KXAzNteSKIF058fz7pxYEnLzhmADHP4zU6uz2XmxMyIYLk32TRNtky+v46
         mKIwaovCWU2cxc+7fcKLdZfmQ4pDJiY7QZvbV9HGCuDCmpmpS/Vq8W0ccxqUF/CK4WmG
         b83g==
X-Forwarded-Encrypted: i=1; AFNElJ8eMow07R1Icy3F/iA/9rm0lLYJ+01LU50AId/83LlIx8JoBr9iQjTtK06d2K95eRou10chEhqgfi89@vger.kernel.org
X-Gm-Message-State: AOJu0Yy90lYL8IiNN7I74uG4f3cqsAY4kj9qwB4ycThuH/oOhBQJ3N+D
	EakWIXC9IQY9TA0qvjINLILahnJTaxK/y8NQ5CEdpNw6/DJvBpUBEnSv
X-Gm-Gg: AeBDieupuK3ZpVJSlnasaTcfdC+5XrTTGsuD/yqx/qgzBjmwDvYNw00pFQM/cytUqe1
	jp55uag3npvlk4GtBh3RZaNiG+2R63r4J1Ylimb3ooCymfFDhJRpMx+zFf0YgzBTbc0gx2UeePi
	Be+fSDk38gy1pQS306GgEVEec3k0whixcvIyyxBV5SDo7xqV3Sru78AeiNUXMWZ741YKCFoV1ni
	sqHuFY2WgNFtG3qnBw9YAnRlHViqa8O2px0Gh61SrjU6hH6Q9Z8zxkZzQSVzB+tasZ6TYuvo30a
	2Xu3jEmcI+6oKFYJbfMPyMIicGd7Z3gaGNZ19c7h0ZplARe7Vj+Q03GW2FcomV6zHZiYomrfHoS
	JMavdtkrmUUO2Da4fax3Qbv4sAIvhitvJtpo4/veXBF2qWIw96SqfFx9wEw+a+sn3SmO3X7mdrE
	/HYBHfjgx157cJED8bXyJlprtA6YVuaGlooqGECa6W9+iVt5tyq2xv3hFLBt3ZSa75qgBJMUMol
	673H9iEUuHMrcTsHLcVORoeogliNxJw+cd+TrG8C620clfHVHM/DzVmYGGpdQ==
X-Received: by 2002:a05:6a00:21d3:b0:82a:6de8:fa50 with SMTP id d2e1a72fcca58-82f8c82eac0mr7759057b3a.18.1776531958135;
        Sat, 18 Apr 2026 10:05:58 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d016:3ec3:66e6:8cde:aa47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm5435965b3a.40.2026.04.18.10.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 10:05:57 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: iio: adc: avia-hx711: add avia,hx710b compatible
Date: Sat, 18 Apr 2026 22:35:41 +0530
Message-ID: <20260418170549.312446-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the HX710B compatible to the binding and describe the variant-specific
channel and gain model.

Also add an example node for HX710B so the schema covers both supported
parts.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 .../bindings/iio/adc/avia-hx711.yaml          | 36 +++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 9c57eb13f892..19318c4dd994 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AVIA HX711 ADC chip for weight cells
+title: AVIA HX711 and HX710B ADCs
 
 maintainers:
   - Andreas Klinger <ak@it-klinger.de>
@@ -12,9 +12,19 @@ maintainers:
 description: |
   Bit-banging driver using two GPIOs:
   - sck-gpio gives a clock to the sensor with 24 cycles for data retrieval
-    and up to 3 cycles for selection of the input channel and gain for the
-    next measurement
-  - dout-gpio is the sensor data the sensor responds to the clock
+    and 1 to 3 additional cycles for selection of the input channel and gain
+    for the next measurement
+  - dout-gpio is the sensor data output the sensor drives in response to
+    the clock
+
+  HX711: 24-bit ADC with selectable gain (32/64/128) and two differential
+  input channels. Channel A supports gain 64 and 128; channel B supports
+  gain 32.
+
+  HX710B: 24-bit ADC with fixed gain of 128. Channel 0 is the differential
+  input and channel 1 measures the DVDD-AVDD supply voltage difference.
+  Channel selection for the next conversion is controlled by the number of
+  trailing PD_SCK pulses.
 
   Specifications about the driver can be found at:
   http://www.aviaic.com/ENProducts.aspx
@@ -23,11 +33,12 @@ properties:
   compatible:
     enum:
       - avia,hx711
+      - avia,hx710b
 
   sck-gpios:
     description:
       Definition of the GPIO for the clock (output). In the datasheet it is
-      named PD_SCK
+      named PD_SCK.
     maxItems: 1
 
   dout-gpios:
@@ -43,6 +54,9 @@ properties:
       Definition of the regulator used as analog supply
 
   clock-frequency:
+    description:
+      Bit-bang clock frequency on PD_SCK. Keep the PD_SCK high time below
+      the chip power-down threshold.
     minimum: 20000
     maximum: 2500000
     default: 400000
@@ -58,10 +72,20 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    weight {
+    /* HX711 example */
+    weight0 {
         compatible = "avia,hx711";
         sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
         dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
         avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    /* HX710B example */
+    weight1 {
+        compatible = "avia,hx710b";
+        sck-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
+        dout-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+        avdd-supply = <&avdd>;
+    };
-- 
2.43.0

