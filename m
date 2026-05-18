Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4419F399365
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141763; cv=none; b=I9x6CPQbv3ZuFVQguh+e7l4OJ2YmWz01DBKEOLCaS0024mlBvua7i6E3UfkX7ZBvrkg0iE0s02V/5CzQ/e05Pfl/P7Ix0n0KX7cTsP40XXS9Hq486YjQcZB3jbIhETqAXYXuJ113YMliSpotRMyd7gZT2MV38l+QBxFYNXxqXTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141763; c=relaxed/simple;
	bh=+3gyUX7aaxHg4IEnt/cUPAS4EOyirl10zVxCVaQOWKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPukPyxzEB6/+hMQlY6QyMCWkzzUkj3eXoi+AWjq6/gVtq410f2mK2v+Efj34aAiFzgwlqc1wW22I/id8KtjXlYjZc+FE6srvMlvIEqZxDgiRnp1SRyyLfKfoZiY+kQWuq8RIPT2jylE0veY2a2UlHT9hqTudbuYERtzbkoNMvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfUKKFCN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfUKKFCN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-834f1075805so2155059b3a.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141761; x=1779746561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRHhm0urB9xrof3Z10YFKkp6gED8PHSdFFw3oxkxeVY=;
        b=DfUKKFCNbsn63+wnTq/ZUkqu13WQUxWJIDG+mp5BN54sIwY8pK0qyqMt+F4VEFMdDU
         NducPBw8PzknezmbMgxRIcNYptrXhD50J92f60AAYZRBwwHLxwDJKKOoytULaC9g097j
         KTxeWuIIy3ZwEhdz78TLW5Fcd8zeoUj04u986AUPH60nY8Oy+ygLgUCP+OujkRAYCzGH
         6B0br76JdeHD1x4Qsig+cBD5r0hDGL60VB/XacJJPNWbnerz6Buxcdh8IQQrSkOE+Yai
         EkkiuFziGYJ+g84Ho7SG5gsmNxaUJvhU9ckXcNsdDe7cpZZaFpGJFRMruTh+BAC3Xknb
         qnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141761; x=1779746561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRHhm0urB9xrof3Z10YFKkp6gED8PHSdFFw3oxkxeVY=;
        b=QTfi+GAZRMYk2P2ocQjOlrUhfxa/XRV8zMT1kGzFM5Cqch72bLNwPex3aAIHUGexxY
         pRx0hdqZ/GSMYA5KvDfxBIZxcgwtKLkc19FVBWqkeLY8yQn7zsGuO1CnmostebyJsXZp
         jAr/YYWO+8SKUZNXUgHEqLEct+sOEAyKeOr7P4cgTmPWx4TBjzuvvQuhG1fIoswQHBNF
         XDr9qR5q11XJTzYAM5lRuUQZnrfTN4GkhfGeI3VzY6ir9vWsssCqQE9PGGS+gjb0XusM
         ch5d6TlAWSEC4gTFRdXNSLlBxn5Hco7CwZsCB1fKZSGbymsAsus933s8Hz4CoRS7ZRI+
         NfSw==
X-Forwarded-Encrypted: i=1; AFNElJ9+Qh5BGILwCjrz6sb2znQ0SYhcMpq0BcmmxG1WP2JMUwrEHvMurNL9RPV29Vei3oRC0NDl4s8uwRUS@vger.kernel.org
X-Gm-Message-State: AOJu0YyJAhXGeZDgsi3BJSTpmvxYhsi/TIIHAgoHmxSc312LyOwxV+uZ
	LhfNx5JO7wg9oNKakeTq1xyRkUup1+X7WFEe2S+4EkdAs8wXaqQWPZat
X-Gm-Gg: Acq92OEK1SkYpPT+EOuEMk+9/yWF3nisAk9hnDQlFolGhR6SXMpl1ClNKRnxgxU0PUY
	wrbTB078MdrFvh//Oi2PyAbdsq0AXSlhubFIufZBoflFCuPRK+iC9mBnvO1Mykt5SC2+5ojSlRU
	84lhhCeQ28rid82GvWJRGXUiiOt3aJdE3FKfiO6HKFYBYUPAOgh/y7Tu3mAEB+u0wDrV274nhuY
	UnktBlIWATwqWUgqJz8g/RaKyo42oDVwuSzI/RHjLSa0p/32NHbNSnOTtFbYM7NA5EXd7O6GikA
	V2b6cm23vfUgqL/cTFsWtmYuz9LimxY9/RU9WJB4CZVaj2QRz3NOj+bRmd7g9YOlQjzvT7qDvwo
	2sk18nv8HcJvxyB83z7naDECSmJbzUv5p5Z6zludnTyLoIDP9pyCN6fwxoYh7lsklRX8eTecEuS
	evATQ9UL2fYDrKi7MFeZjg+wK0xqdmbd1qvu3bXViZby057BYJkmmCHA1qB6tZVhCnRH/lrIxMl
	D5PC7qpSwpOeU1/AO/fiWdUt8vXs/9yX4nT0pQzSASBASiGOdLd6/JMRe4l
X-Received: by 2002:a05:6a00:414e:b0:82f:4a4d:377e with SMTP id d2e1a72fcca58-83f33d9d741mr17598050b3a.28.1779141760496;
        Mon, 18 May 2026 15:02:40 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977b128sm15772960b3a.22.2026.05.18.15.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:02:40 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Klinger <ak@it-klinger.de>,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v9 01/11] dt-bindings: iio: adc: hx711: clean up existing binding text
Date: Tue, 19 May 2026 03:32:17 +0530
Message-ID: <20260518220228.63322-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518220228.63322-1-piyushpatle228@gmail.com>
References: <20260518220228.63322-1-piyushpatle228@gmail.com>
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
No change from v8. Already applied to iio.git testing branch.
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

