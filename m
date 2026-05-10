Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32729233704
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442611; cv=none; b=H59MeUru7qVPlUSQVT3tbyq9c7jzrT6CcWY/OpnPfs77q4Zcrrs5qqyy8UfNtXFyhoZhEGi4irJAShgoOVY4zKD1+r/rSsLA6mmoQDJCUyhlPq/gUfUaKGILwwwqOB1g78QVRRgPjD4RpqBawGDVzk4BwcDuOla3AEHv5JF9Qas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442611; c=relaxed/simple;
	bh=/YGBE3dVcPNO1qgArbYgXysyeVCHChMgg34LhnuVa8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xv0JlLByvkUJiX07aBZSZFwveFacHx2UkAINWqFqaKOY9A4KG63je42YAegLpLKQy0E/ksGToZDaXPMxLczvnVObooWbcrZeWHXKuwSEvVfUGkZRJt55Th2g+PqahpaMM4VNeFWx73+uZ5Br2AIj+II0vYdDzk1tGHZjU4Eloo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cE10PFKJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cE10PFKJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba17c8cfacso36933655ad.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442608; x=1779047408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAPu8zY7K1umMx/3iFtBmWGzNRf6nimLEMSjnAOfuo4=;
        b=cE10PFKJtL+wyXlzm/8SYUyO228sF3CGJokFNiOYRBP6DYo3I+IkLa91a0/XKjRB4i
         y2+CckkIhJLeG8HqYqmKYs0cCZym0eECOejIFa/6bQRo1cdx8sYIycDjv5AdBNJ6Dxdq
         X3TheJXA5bVjMOV9kjO2iEw/8ow8E0ZAWJFg9CXOlE6ScYboJbSa6nx1sJU78mC803Ml
         xqwU/wersHserGf8PaTDx9p0B63qc4196AsZGn1GKaJjBDbdJlUVtbzUdOZMFEhXCoCm
         8rS18IniwHY0oCUrNjVDojqocA5y+rnOIMH8AG3dqNPplU8AO+JvWeL31SJWqzKRoFR8
         /3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442608; x=1779047408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oAPu8zY7K1umMx/3iFtBmWGzNRf6nimLEMSjnAOfuo4=;
        b=Okg11rfLZlup+73iKb/wRvWO/QpnhdtQ2aMwH8gH2L8SINogUijXgdtjd3xjRv4tmM
         y+PyyYcoVyYVM96Qhr5MvIbj4PiWk8ClToj5F3K+5hZ2ryKvBfxTmFHrSd7yrEJ5iazd
         zRSHSY5hjoUgOkq2bxsuTX93rO5mBNAVypn34CmxR4zehM38cYoAt9NLFFQz22sssuDe
         KOhXFVHzwp1i/If2aT6GTnjRm79XYsX7zLAJ1YSmKfH7Ekqj6BnL4f0hJOHJpBKCC3IQ
         4EayJrlG6o867QbMjOaPTffMOyRJnAaHBEvALK1NlHpDFm0VzB2a1W8sJBMy9LoQC4FY
         vyRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TWLxszx4IQE/LLKvU2UktMCOsFQwr9fm/k9UeYW1ZONBWEsRMcrV7DJLOE++yS40x5j6IkvMT0jD3@vger.kernel.org
X-Gm-Message-State: AOJu0YyfuDzWcOmovYSZTW24VLC2zDsmEWzFhdNEy36jI6AM3JuglnTS
	ksFhqJqwSyu3/GmEuE3Jt2qVkMGcnw8NMX6B6M51HRPdrpVmOFNGE2fd
X-Gm-Gg: Acq92OFVLjIAExJ61ppKxvJxu2U6ovRwe7sK1AgCC0BTHjlApGAckyEg4hghX26riAG
	MuTZy7R+fDc+8MknsAYUCU0BZk3+6Fpfs/iDJEHdK60bf+JMTgzlbKMwM/xa6OQAnszHD950db3
	XQA+Aoo1gd3WMeiykAu2H4ZmmEx1PjPYT3U4iBF0tOrVXdhf0NEQibX0WIoODQLD0aejlg/iVpf
	AAIXYz68NqLCC44EchHDJzM0NY9uXKsVnHsiWN5S9RDQ0F9kZQx1sIZwDcsj9w4Wy3o6l0yrZXW
	4AulmwWi5EZDLDF8KXP3AxoNbZ/0N22iVSHf5ZFhiNETVQ+xIEET9VACa5pLEhD+uNwx6NphR4Q
	EYbzNJUmeoq3tfY4SozetQAeBv/whuC7CYYTjMZFRcjj3Cwzy61eYYPxTLRgne+PHnYjRhPiU3U
	TCwk/TsdVzcD8fPnRlE1VXQfu6dAlwwisXKr3xcOUZZi2rDnfjqB0SYY62kqlHdWcdmyIMBPRc3
	aRIojYjMU0YrGTQblaoo5CZyUOcsUFVJWIRjspFbzMpO973PY1sm1J7c519
X-Received: by 2002:a17:902:d48a:b0:2bc:7d4d:3520 with SMTP id d9443c01a7336-2bc7d4d4085mr76196105ad.40.1778442607979;
        Sun, 10 May 2026 12:50:07 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e358b2sm77065095ad.54.2026.05.10.12.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:50:07 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/11] dt-bindings: iio: adc: hx711: clean up existing binding text
Date: Mon, 11 May 2026 01:19:23 +0530
Message-ID: <20260510194947.31997-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510194947.31997-1-piyushpatle228@gmail.com>
References: <20260510194947.31997-1-piyushpatle228@gmail.com>
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

