Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D624887E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521443; cv=none; b=kowZlVtaHPDKSdwqEqSYD6Pn3Bl241Wk5P9arT2jDxWY5+UnxF8TE0U3K+2KJgPiqVzN7/c939H5iF1leRT5zvHPNSypQA0QqnJUSCDdw7c/e25IXmUpQ9HH4xipUlYeqCjoZLQcVI/GzsZM7FwScWRpxZxSaTgOOB7cgZXmn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521443; c=relaxed/simple;
	bh=fGN8QACq5acyX3/tm53OfWk81sTlEN73wII2m7as1Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2+gNoquEiTilSXk7h2X6vuvpDves9Ue7VeRTc3udkiDA44OB2n0tAhLAqwLHnMvPLNG+wG0GJLT0OCaQxnwE0odQw1JwdJWsGEMkZLsiXo2sxlzwR8SWjzevaAbhTrytaSE/R0jdHdxXmCaC5n9o5yqGPNQvgVsb4PNjQFY49M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOmB2kfY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOmB2kfY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba4efedbeaso33003685ad.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521441; x=1779126241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf9rYDctPN9NDbaPR2RYs1zVFeB2pT+PMnoNRzcUIUM=;
        b=HOmB2kfY+aJKm+zAEs2E0bkKsHaWEtpH4mMPS/+/W3VTKEjQxqKNq9wmKqJXbglFEx
         +AaxZuc0t+PI7KN2iJkqRx3rq6YPciOI+Mk5VE9zfJlY9EmYarjN0UpJJgRcxkOxj1JX
         Uq78eqU0ihNCLHMV/nHDGoTyXfgrq2gKRX5S3F5pvem22rxDLavy7ENqW7AEQFZQghfg
         LpDR2Q/j3VdzjTJwI+XwNB9X2DcEeynxC+YitafF1iCNrmWpaBRsqHsXUWA0dBLOqh5g
         6sXGLXj31F+RKlzx/IYRk3vR0RgJZu9nE28jjeY6aUk2h6YMY3MjcrHNWmC5aWe3oKxq
         G5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521441; x=1779126241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yf9rYDctPN9NDbaPR2RYs1zVFeB2pT+PMnoNRzcUIUM=;
        b=T3ny6VjYOWtqCgRSM7gum8ZR7HggOw/Whcnl3yUkOKFJ/xeXGZVTbs7fr+K1MYf/+l
         wMiAufIr+zRUPmyGlKKGbh9NIr5Ydhkn8tKCz1lCSwHcQ4Q4KG3dph6YTngBWB9rmHMI
         6RRQLbWi1aoX9F+xTnovehvN9czWxykGezdgvcUTNXSlwipf3Dc2hHKQXJAT8JPepk0l
         pSUqHc+QEttg9bWFwK5pu02NudvCBkTRUBwdSP7Gy19z5Y4/aHeEBpKIDYTYrGHaUtM5
         gxcWAYRhSgyJtcb0TfolbwyC7ytnq5TqVXY5ue6pgX0cgWMLiTP5ifdv/SunBa/9fBhc
         zH2w==
X-Forwarded-Encrypted: i=1; AFNElJ/L8YWDRSnUHjB906Ev1K1TGBjpRMgZ26m2yxW3iN+KdSLjVeaZlmAST/qmSUYb6p9NW5FDNj9CaAKm@vger.kernel.org
X-Gm-Message-State: AOJu0YwYU+9bZGIGW/qIqc4j5MXsf8mkeC9ar5W3omjkc1PEJv81z/IX
	oCtRMRcKuzsLf3CeESF5d765HI7s/73gLW5HXw+T95kmELqkYvT+TysK
X-Gm-Gg: Acq92OGqOkc4vmlTuQ+CEMpynTdrLhG/zr/3n0z0zBlCR47tWutWP9VeT7ZvGjepY21
	YybKQr/VreFVGbDj9Tz6U3VLi57nvoio4K3/aFhi7bd3aDMgE/sBhZy1cP+WnzG+6GaWwVFel4L
	iJ7LdYIn2fu/hsbSVFI8UvJ7h/VMj8eiuluvPwS++6mQVlK7X9/RPWTAvhGvF2Z4VEI5JpZEntU
	jVlLsztfa6AFWggRzhv8kSdCIJ/WW3v3uimh5NJDsKKxzvfi9/Gsw6ENq/GTPmAEWm9l+QRynhU
	yTvgBJb7rt7u7yYnvEH+F7kvIFzgb2paBBkr3hdI3sZ+fxI+sBIUvulj+cB++9YCu+06rwf3t6c
	YnUqEqJ49AAFFUQZWMCBPNR3JY8MOo4cHr5XplZTK8MtoWZkLCehAE655u0PXhym+NGEWTIjSn3
	qHEyTnN57oUuraKo5CTPr+/Rls3KWT9O727G/axbhc3x3+h3ZFM9oC+dUk+pugCR1Miep9Z/0cs
	SNe6PmeMEmkt5ky3npTvBYDhvF0YGg9fCgmMdWDrEuIa/yhvmWppYfV33/IY9cqNAiTuVk=
X-Received: by 2002:a17:902:e986:b0:2ba:df8c:11d3 with SMTP id d9443c01a7336-2badf8c1b77mr138761745ad.32.1778521440783;
        Mon, 11 May 2026 10:44:00 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:44:00 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org
Cc: ak@it-klinger.de,
	andriy.shevchenko@linux.intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 v8 01/11] dt-bindings: iio: adc: hx711: clean up existing binding text
Date: Mon, 11 May 2026 23:13:26 +0530
Message-ID: <20260511174342.123820-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511174342.123820-1-piyushpatle228@gmail.com>
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rewrite the binding description and property text so it describes the
existing HX711 hardware behavior directly instead of documenting old
driver implementation details.

Also clarify that clock-frequency controls the SCK bit-bang timing.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iio/adc/avia-hx711.yaml          | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 9c57eb13f892..1ea60dff98d5 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -10,14 +10,9 @@ maintainers:
   - Andreas Klinger <ak@it-klinger.de>
 
 description: |
-  Bit-banging driver using two GPIOs:
-  - sck-gpio gives a clock to the sensor with 24 cycles for data retrieval
-    and up to 3 cycles for selection of the input channel and gain for the
-    next measurement
-  - dout-gpio is the sensor data the sensor responds to the clock
-
-  Specifications about the driver can be found at:
-  http://www.aviaic.com/ENProducts.aspx
+  The HX711 is a 24-bit ADC with selectable gain (32/64/128) and two
+  differential input channels. Channel A supports gain 64 and 128;
+  channel B supports gain 32.
 
 properties:
   compatible:
@@ -26,23 +21,23 @@ properties:
 
   sck-gpios:
     description:
-      Definition of the GPIO for the clock (output). In the datasheet it is
-      named PD_SCK
+      GPIO for the clock output (PD_SCK in the datasheet).
     maxItems: 1
 
   dout-gpios:
     description:
-      Definition of the GPIO for the data-out sent by the sensor in
-      response to the clock (input).
-      See Documentation/devicetree/bindings/gpio/gpio.txt for information
-      on how to specify a consumer gpio.
+      GPIO for the data output from the sensor (DOUT in the datasheet).
     maxItems: 1
 
   avdd-supply:
     description:
-      Definition of the regulator used as analog supply
+      Analog supply voltage (AVDD).
 
   clock-frequency:
+    description:
+      Controls the SCK bit-bang timing. The value is used to derive the
+      delay between SCK edges; keep the SCK high time below 60 us to
+      avoid triggering chip power-down mode.
     minimum: 20000
     maximum: 2500000
     default: 400000
-- 
2.43.0

