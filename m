Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F81F372079
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706320; cv=none; b=DwcKhfajkf/en83EXzC1NQ+8KLm1aJW+KLc6Ci1UMPnd9T+TOVLww6ykrHfvBtsFGQOGa7rgeTyGHxpeZ+dmBgOo6pPy1gptEuEprKX8TLbbC1VsP7Z4EHdYwK4c2ZMpikTrpYcKWS/iRRSKrhrIPzl6+Yieo0mopWQc/Us89v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706320; c=relaxed/simple;
	bh=cyVQaYp09rTmHhwDXV8k3udRvnCCwyJNeI/CPfraGR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGjyQ4M6AScq3xfbDlapQRRiT3IadyJ6bc/L0R8x3S/oNoG6L0QI0gvrCLwej1iCh6DsOzyKqUdTbEaHHSrCTnjC40w0Zocd3FUN+Q9vBiFAY/29aXXg0ys7qK1YG2VaJc7NlklQrd9AECVK8+Gv0vfLfBBSoBwLsrKYGzXHKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNSQTEA8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNSQTEA8"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36974217d4eso6173260a91.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706318; x=1780311118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe8F6BBtHSCnTWy+Jvz/dHP4g87OMQse/dKMPfWduuM=;
        b=HNSQTEA83vAbmYa3Rrb7a5PmFxk7zZjcLnVRf1b9QTyHAcZSfRLHbCr3vWC/+2A4VF
         YZswYOQxFXAQFGMHuncE09wm1QJO7gRlbe/TaMtf469igwnSdBo1lWEivP4owpjV8BOy
         JhHfl2IOAyV8++2Cf0M6PQY544QkAD0gCCVZe2Pj7qWTvOpmlxdN/Qqhc95aLbUOkL/n
         mK7ndxW4b/QqtIKXkmXC7n9cPuJhsEGp/cdtM+ZYzJkyQSM6zwgkPhdXEhF0HBzZES5/
         eWBJq7ABOIdEjFNSEj+84/9MC6iORvOtwimMbV/4+jqZpUGA05YEB5i03x0zcvQcAGX2
         IlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706319; x=1780311119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xe8F6BBtHSCnTWy+Jvz/dHP4g87OMQse/dKMPfWduuM=;
        b=BCJcbbJno/EJAvbfSKEN/AAnQbR5K/f1m+mXqURECovEYMEexUPFzH4zMXjjjRCHCG
         wRsrsruGA8OgqHOwJDB5ZZuz/YmbMsWUWL++Y0Ho/ACUapdriElTtH2y1RgYmthu3HOq
         GNAJ2t8S/kfcHL07TDutwKrKi+U4PPRRopTaa3+vcZGsTYilweUgkkkrdKg+H0owWedE
         GxTPY51zktFjh0OnCclrcKekFW3F7AlnUjqqCvy3VXX8BPVBuBasjP+u/Hc1hdvvh6aB
         93mNpppTR5Dt2tZyyHeFWNhkvzZFwmpT4Ai6YZX02jjQ+pgioeMlJyu8DT0A12SBoc9X
         Jokw==
X-Forwarded-Encrypted: i=1; AFNElJ8T+H8LVJXAcYl59ISiRDtLanKjwPEPPNtJ06Jn7Gy3EddycI9xZLxxtiOV+ggMVIv6pp3V6uhxB7Ce@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq6C+zDl+HXbfu8zawL625TwAiyuzMX8nFP/wtZBnwXN2lhhaM
	eMRuSA028On8/W9uu3Q6N5j9VvEXiyAav6oJWF00BNBTfS7mUNVz6nnO
X-Gm-Gg: Acq92OGhKa5FyBLqEDF/Fmq+EGzH80ZHTmfdzw+Ruxl4ZALm+0gGEFXu2sm9ZQuCFJc
	DwI3uCM7+XudV2ehRVA4R2UTr2BcT/B/uQA+och9cYqjNWDlOSfTEAG40Li825m3b8Elj2TKYLR
	Ze9uG6iuD2lcka4h5lgGdCo6a10YVz3waDlf0o9TDnBBGPsY5UIIVCzbM0XYDzQfGocmRbDwrev
	o4/LIkBSew6ZHq0OHNxd9zN9MvNM1oSCSeYxAS+JKcfKbhoBVGvJY8GRwzo7idTTC8ckysVSqm5
	rquCiX9OnZKHp3foOzorZGk5rRS+9l0evasNDcQ+XeDs/gNPaowpsJZzcAMO0T3c2JTiVGQsugu
	jZnt1/obecZVE3qzq8kNaWz5U5Rz5rPV4BaBY//JaAlJc/WQgdkNAs/ohIwuWWO8/vDMH0ppYPx
	Zk111fJbBBgBpeWbt7l73UjFkdkMMjvoXNl03ESWbhR2/VUnAQVfs7pcIIZhCefLxU4Ri7kN6vP
	8/IcT/uffdndgMtXEYQHh9Gh0zjC9bmr/yNHaqv2Q==
X-Received: by 2002:a17:90b:3887:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-36a6787b0dcmr13675423a91.23.1779706318473;
        Mon, 25 May 2026 03:51:58 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:51:57 -0700 (PDT)
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
Subject: [PATCH v10 04/11] dt-bindings: iio: adc: hx711: add HX710B support
Date: Mon, 25 May 2026 16:21:20 +0530
Message-ID: <20260525105127.180156-5-piyushpatle228@gmail.com>
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

Add the avia,hx710b compatible and document the HX710B-specific
DVDD and VREF supplies.

Add constraints that forbid HX711-only properties on HX710B nodes and
require vref-supply for HX710B, then add a separate HX710B example.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iio/adc/avia-hx711.yaml          | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 099235b5fd54..f0aeb15e9eb9 100644
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
@@ -62,6 +71,21 @@ properties:
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
+        rate-gpios: false
+      required:
+        - vref-supply
+    else:
+      properties:
+        vref-supply: false
+
 required:
   - compatible
   - sck-gpios
@@ -81,3 +105,12 @@ examples:
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
+        vref-supply = <&vref>;
+    };
-- 
2.43.0

