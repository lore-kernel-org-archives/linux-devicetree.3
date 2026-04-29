Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC6634D4F9
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441572; cv=none; b=hbsP5DXRsamMjKPjJods3rKgH9ihNkNTwtAjS4NDxPHKFO+vIQU+pJOfRT2NryW0LwLi9KvPI/ehVKmN2OXVjuWNO72ElVnFKJ/gQ7VTqvJRPEI+C3od748I4LJfBDhG/20nxV+OJJCMSp9coly5EqgF+IMNUaZEGSt4U8iJTRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441572; c=relaxed/simple;
	bh=rK4lvNmkMm633W8/JNjJJXCQe0WllFArMfDDBGRU2Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=by+mCeacuh49Bmi3/lFGuQJWrcChjuQAfhAbSYs2kBuwCmNS+EcTzkkEzlkpAxkPpgkvu1ZYeiJ1ckLDFz4uC8ZFiCbGyf1H2X8Y2m1lb7R40VhsPC3gMTNL+tzrVXGsI0ThM24b5LwUUg2LArGE5yvSK0aha9sSuVfv9ycNSOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxkkjIoE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxkkjIoE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b299b3c739so56584785ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 22:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441570; x=1778046370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yG6eLDM9IfMZdVUIJDp52SWlVGdhG5JSrqqETcLRiA=;
        b=mxkkjIoEVm6J2DiH1o1M94kZMGacWv6bTCdXi0vo3CbKFD3DhUqi/BWeTS26oZmgSs
         nmkazPzbHI5e4A1nU+dYEkKJ3lHKn7TQClkbBgmzIcxmRIvpMIGqshA1ou7YoZmrdgxt
         N/bDxFJoIfmXzH/LN272fdqq2X8S/a0nR/vEt1VQgjrLOFwe3vzEeeO4UlICMZKsuLo3
         RLJthiqrMSFU6WhKhTo0wbYyaiO3gBjeM4Jf/kQ+S3WwlBJARSN1Kq0mmg3bJeGbp6bT
         rs6VYBtDzLIFzgaovxrkMkb9FfCx6VdQlFXV/bzcT72aUszLzxe7xGglhSEhxR1+AT46
         TjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441570; x=1778046370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8yG6eLDM9IfMZdVUIJDp52SWlVGdhG5JSrqqETcLRiA=;
        b=FTckfjAe9aAwAO2D7OyX1WLBVgpk5xLyxZBIjDOq2TZy484PWOWQugSpC2H66hsDNU
         frdlGOPOPEOvD6rs2VXDAWWPX1wgjgyDFCXfCEOOhLbu8Yt+UYiT7NR3RmD79QXYGt6E
         DRhYKnmxkdyfl8cR9EB2FaN2Q/kvz9dXF7o6zwc4r1wwU0aHoMCzDxg0HM4gekpAbu/G
         saHhOIdryL3P4DW9MaOza3qcepXDZfKR2qviFeoJ5OxgaIFDvKlW+tf/yN/fxQL8nggE
         IECg4Xjzww3jEozt13AoQy9gy+OKVewUg2Iahlxaw9E+MrAxbdYvDHt3wfCVKApWDkyU
         rECA==
X-Forwarded-Encrypted: i=1; AFNElJ82bhQjJUK1LMnnDs5IkaTctOqYCmeegE5YfyyjhMxrrUMqW/iQ9YSNnHTLXxV82sYeNkcad7i2AhXA@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4CkkX4tSn6Sn0L5SHrD5MSfjnQdvOyA8y5nqsrJm1Baw6vcz
	5Biwuj7JNU0SjRuWg8+Po84epxJlaxVD+mhK/PJL8mQEw4AfaFC5gyJi
X-Gm-Gg: AeBDiesNG69faIFjG9Q7jQfxioxy21y9wJjp6EepauQ3RqNI5esR6kGPIFP+0Dq1aYR
	PCvPvmFS2wS/ejV4ROkZF2NgWootwoWHFZj60i+CYWM/U0zvF+GY0lvWNGaRnGF1/qTHzKYLz4Z
	l18B99Mo+p6IdxFq49HsfKHtOtvvT2c8uvRq571zvUWBxyZUzvlxptK5Zam/jhA8vblbUsc/ZEI
	mDRxkpubRze/EPJAiW8/YFW8+u5f3eCPiLOLAp/sxSxuq3BvxCT6it2Xd4AFHDpQd8KnGCe/boH
	+3WO+cGFMeHob43mZVOV6ERcSTDBlA0q3C1gVoow20n24iZGx+CX+sJX1cLPIuWLaVtKFxU6cBo
	Ozi3gkMnJrfwEYIonKM2kM8Exa9y6CSrqXmlUpMAC457DOsBa7SM77Dqy1OJxU6MeBDlTXSBOn/
	eYhGqs7vVXgU//kONi2tghEBQVsNquytDZjs2fExuNhnHDnVFmEo7Fgs+QDJ+FJmcfPY4igpifv
	Z7nbwpe21VFrPGui2xOR/NFa+g9drIjtB9KzwOjE61HT8G0/g==
X-Received: by 2002:a17:903:1b07:b0:2b4:5c20:ec7 with SMTP id d9443c01a7336-2b97c4ca086mr58037785ad.41.1777441570041;
        Tue, 28 Apr 2026 22:46:10 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:5fb:20b2:c2f6:85bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879656dsm9346365ad.25.2026.04.28.22.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:46:09 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/11] dt-bindings: iio: adc: hx711: add HX710B support
Date: Wed, 29 Apr 2026 11:15:37 +0530
Message-ID: <20260429054544.123862-5-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429054544.123862-1-piyushpatle228@gmail.com>
References: <20260429054544.123862-1-piyushpatle228@gmail.com>
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

Keep the existing HX711-only binding extensions in earlier patches so
this change is limited to the new variant.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v5:
- Split this out of the old combined binding update so the HX710B
  additions stand on their own.
- Require explicit vref-supply for HX710B nodes instead of documenting
  an implicit fallback.
- Use a single if/then/else schema block for the HX710B versus HX711
  property constraints.
Changes in v4:
- Add vref-supply for the HX710B VREF pin.
- Remove dvdd-supply from the HX710B forbidden properties.
- Add an HX710B example and the vref-supply constraint for HX711/HX710B.
- Update the HX710B description to avoid channel-number wording.
Changes in v3:
- Drop the old vref wording from avdd-supply and remove the separate
  HX710B example used earlier.
Changes in v2:
- Add the HX710B-compatible, dvdd-supply, and the initial HX710B/HX711
  constraints in the combined binding update.
---
 .../bindings/iio/adc/avia-hx711.yaml          | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 9134bbe41379..b2b5c7bdf05e 100644
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
@@ -44,6 +49,17 @@ properties:
       RATE pin state is determined by the board wiring.
     maxItems: 1
 
+  dvdd-supply:
+    description:
+      Digital supply voltage (DVDD). For the HX710B, DVDD must be
+      greater than or equal to AVDD. When DVDD is a battery rail and
+      AVDD is a regulated supply, one channel monitors the DVDD-AVDD
+      difference for battery level detection.
+
+  vref-supply:
+    description:
+      Reference voltage input (VREF).
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
@@ -53,6 +69,21 @@ properties:
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
@@ -72,3 +103,12 @@ examples:
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
