Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20A836DA02
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706306; cv=none; b=iLoqJCeZ97J6BxWPOYxQRpahIEazOW/3oEzTB+4hmsq9T/qv96e0ikWm6oIDufuvridQPsMJ6xYDs9QDQ6yx26Ht535DgOiloieieE5kiSQ7+Id5goZBoGvm3N96+BAwHt0uBUogbQxTf3tMehih5f0nTfq/ucC6Oq/+98uMKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706306; c=relaxed/simple;
	bh=fGN8QACq5acyX3/tm53OfWk81sTlEN73wII2m7as1Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osQGhoFH2o6c88kWTELFKtmI1KWArJ05xb/1JrMahY3dYdsQihDvZjZRN4IW0/st+agGwKiQpcj2D7yrryXmYAO/VnHHz74OFaiGp/Wt/Z0sEsI6EObils/HcKw21beTPinzRtRcuV9AQ2FRdvK9w9m1cFe/5zq1Uthpibc6iUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlK/JZGf; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlK/JZGf"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36931e4f5e8so8801049a91.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706302; x=1780311102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf9rYDctPN9NDbaPR2RYs1zVFeB2pT+PMnoNRzcUIUM=;
        b=FlK/JZGfALU3zpzsgZQRkL0bE9hcwMEnyz2P/DT0Zl4usRSuQUB0zv6zBy5TpBSwkz
         KcYfshz0A7ctoWjj0Mz4bskHGX3RcIuWYZ/qxlMyFF5tmvK95TAy66xzO6+gudB2yCBR
         q8ZgoTf2OpFaPIF0H4n9s+hnmGV2qoDK3ZTKTMcdz8mgJSPfZtsbTuUjBQDnJszhrDRH
         G/IMtRSOzNCEiOXI8fegkApgiU2mswc6kyX1rG97Mk2tw1HUyez/H4smt3yw1RVgSrp2
         knAykL51LAHCktFnSm9xD2CNExbLnulQTfh+v2hQCStmkuQVc2t1eJhxar8+AAKcORkg
         tGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706302; x=1780311102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yf9rYDctPN9NDbaPR2RYs1zVFeB2pT+PMnoNRzcUIUM=;
        b=hMa/zBCLx9g7nJGJHEBmdApcbsZA4jOmOUw1JmOWLO6EsaKy1A1jvjoFQOV23dpjxN
         zJhu4Md7KQ4B/TzV4J1gE5fTLfHanvptKlbjiazt4sLF57pssHfQQDP4dSvqxneU3Qtz
         X6+5mqys7U6r9CsfngSZmqE4AwNuELKLdvq0j6ofYxOnf4u4rGouP1qJIDE4aET1pzYF
         L6pMVR2Av9kdhkv3qZ6DQ+lHd1FiNC0gmd0CRfpRkX5ASyoRW/H126cU9QUMffERTcKu
         AX8iTv7pz+5uOSbj7Wrt+gY/52roG6HlH7E96CE5FwOPNBl4znb4OkmnCIEphB1guzXK
         bCxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TPG1oHC48WCDXUH7Z/XP0J8WcxZRRunuAUNcKX55ERMFoj8TSJFRv3c++QtqY3Vp5Q9XMkpzJQAms@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTWgWGCTiaQ0RY6MlByDIGex75lVD9B8J2Oyf0sEFbDQzJUJo
	PJT1P6BEo7r/xoRfDincC7v+xeafzP0i4ZbDZrWJEv73+TToLUPtiqLu
X-Gm-Gg: Acq92OGSjTY+1kp39pacSzuyjyTrODjCh8C63PErR9IS/fz7qk9Kd4p/I/u8yS/mOMg
	jrs/sL2Pigd0HHoZixQ+M+CZcKayzgjeYzTlxTcW1kS1ciKtgMIzp/LdObCIIwfX5+hCf6Kj2zp
	G2la5GiFuRHRxaCSlZ9tHOQkvqjuTMm+yyeKZABgwrh+xkSJ/X16B8PNHFCI/Z94IAvxUsEkEjq
	6JjFPfd/Uadopuksxx4AdOX5TxgxveFnhNexYRhOG11gdeqMWKeIwj5Lc8e/gFG9DshKL9Mj74z
	7QcQ1E8kfYuyO5Bd+5O3BcOCGilS1yw5D800JWxtUPMSgrcDpahapn3ybX4I4ErRrK/OYL3At4h
	wYLhyxxNV+mwqHa2OKKmq3ropHzagcaKh2cYB9GxSwdU+C9XuQJadO2tZnj46VgSL6sWAa6i1yX
	tTakgudR2cEDXWWOfak3y7QTekHRCbWGfZs4jPkWKRMrqtlMT+rfLS1ISQFusXQuSToql47BSuX
	tWv9iMki+xvwMta7rv7pYsR4/cxjPRl4Y2bTXU/RQ==
X-Received: by 2002:a17:90a:c110:b0:368:341a:a925 with SMTP id 98e67ed59e1d1-36a67616959mr14192750a91.23.1779706301802;
        Mon, 25 May 2026 03:51:41 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:51:40 -0700 (PDT)
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
Subject: [PATCH v10 01/11] dt-bindings: iio: adc: hx711: clean up existing binding text
Date: Mon, 25 May 2026 16:21:17 +0530
Message-ID: <20260525105127.180156-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525105127.180156-1-piyushpatle228@gmail.com>
References: <20260525105127.180156-1-piyushpatle228@gmail.com>
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

