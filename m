Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896E143E48D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377581; cv=none; b=b/C4V72jsMFaC0bQMl1WQm51TTYTILKoHmYnRSvfGKCex7tK3xxlNPT15kWa83jAQXJqgkGlvW0zdwyAxxwd7AEfv5whDIEtcmU5kup0m3ByRAPP+wL2wZJDB8Bg65m8MOCyDf7MuUGGILmX10J8NoUaLNzGb4YjC+Cj2l0yTsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377581; c=relaxed/simple;
	bh=t/lScOB7CpFSN+BBpWau0Y34mVwtawmhNWrHgcJiZHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITMUl27LWPmNEaTKaOP7Ue0bdGkhv0VbWwyqKTRJDF8HlbFTA+faZisi8sWeGDwBpxnYcwjlE81V5lLCo6+8+UD5wbNB3/4w0imJMcoVVOKVTB/xPlJ0AbWYRYINn4MkAfs7oKfB3U4ObiCEBI43BCP9LNFka35Oi67V5fY9LJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axBEjrOA; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axBEjrOA"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39b38d3c929so29062141fa.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783377578; x=1783982378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWfH/GxGUXWLsJ6S744tEAlMTJ0a2RTRBnRY+9o/Ybw=;
        b=axBEjrOArXL1gQPAvRXL3kEZfzjMKdnPuqwLPwpldKM/HFilwa2bIiSTKaTz/+H2EP
         vdS6Mi6rldCUsxh1GbmcUVvI5dzqM3759M5blz+N0W3EbIj8bjjB9wT/M/RfCTTorjOI
         //FgmdQ8EZWZj2V8zHbVnld/j+1wzqZdWpjk73k2jXfcBY9E9Np+L43w1QPJ54nTEUvz
         zVGBFzDRaE+EnOZnU2KnIp695xhp8I8IHvWRoWvhPBzn7mumEoZG6/bMUF3qyLKBHM6Q
         IKk4tbf8VVulwkJCHqoONJ8I7OOiUS305O3DrQUaacjO+DcOgnfFW6iAAbqPcAc/4FLU
         9yWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377578; x=1783982378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WWfH/GxGUXWLsJ6S744tEAlMTJ0a2RTRBnRY+9o/Ybw=;
        b=oWBiplRKohaiW229hf+lyxdu0vZ0JqBYduHFN5mIx97Yv5r+i1/buu4DfA4vE+NQKO
         RnDO3fM/URtsUnUHdWEa24rXZdrDIeJkkBIk1PftgkI+8cuhBUfU+C0BG8U+O2KrfJvc
         JBXcSaRZyrw5HuhUp3ajll/k3/AB5CMVifc5HHn1qN0icqFV/7YMKUB9SluY7xD4JZf3
         lwbhUXKmO0PcfVcS/tHdFkHvRunSRbnKy5qgn7KSrUNfpGEnUdPZtK80PW7YrPDujz27
         gJ39laiRQoHorYOQbkL4RCtbkozA8zag5a5yOxPzKJUz5z2cHcphMD5g3xspnFE0STxP
         7pZg==
X-Forwarded-Encrypted: i=1; AHgh+RodITDCiE+SlDI7IVFYXOJIyI5WYroAINXfP/JELrtpXz71EqomAGKApSD9tJ2F9ZZhYgd9LI8vAqtG@vger.kernel.org
X-Gm-Message-State: AOJu0YwwfiSI/Tr+wQIsi4B31ThmR/mC+TBj6t4GY20FAgOn4k/WHeMN
	yGT0MJzQrvIgEpf+BbKf04f+EGl3akY3OQ97d7dh3nMmmFv9EnHQY/m3huYMdEClWWuDfw==
X-Gm-Gg: AfdE7cn8wL8E/2rLk4jEGoJG1twdLaDfVArbUuFQZfsorFP0ppUTSBqtqfyz+osPLky
	W7WF/AGCpVbds/MHblfrzBLMVEEHSahP5brvrveFA6aPmtNx7oW+e3c/BspnicSAIBUFSD1dIsg
	XsycVk9ByUMB32Iz+F4KCR6k/BZPcIcqt+Y3cCabWtNixIe9hLOpDS/GPrnZ5gRA0wlCFXJF04W
	+PnSdFpQjkB3FwSIxVQ6xtgkBBBnfJ0P9kyyOsGSYWlnFUmSObjBbdJArTMz9GLcnUPiWjvjXgq
	6O6FKJiDL3EFTiGjiidcisnePnIhRUYNJnFWdDrIkwN/o4aycjycuwuOZPXq7hchz8Lhg7SjXNU
	0ATVB6RXekxjP90twPfX2QKUQcqU8tvJWd+H5Xhj/Y5XIpPYek86G9SrbeHJP8ewfPdopoARChV
	pe35AhS3XK44yb0rBkSz8g3jqDaOu8OfBv0B5Gn8BURjWd/A==
X-Received: by 2002:a2e:a312:0:b0:39b:35bd:e708 with SMTP id 38308e7fff4ca-39c5fd6fd45mr4667841fa.1.1783377577629;
        Mon, 06 Jul 2026 15:39:37 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c6631e1ebsm965691fa.42.2026.07.06.15.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:39:35 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 v7 1/3] dt-bindings: iio: health: add adi,max86150
Date: Tue,  7 Jul 2026 01:39:28 +0300
Message-ID: <20260706223930.1807714-2-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260706223930.1807714-1-shofiqtest@gmail.com>
References: <20260706223930.1807714-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding schema for the Analog Devices MAX86150
integrated ECG and PPG biosensor.

The device exposes two PPG channels (Red LED and IR LED) and one ECG
channel over I2C, with a 32-entry hardware FIFO and an active-low
interrupt.

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 .../bindings/iio/health/adi,max86150.yaml     | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/health/adi,max86150.yaml

diff --git a/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
new file mode 100644
index 0000000000000..b0ae7d2ecfcec
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/health/adi,max86150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX86150 ECG and PPG Biosensor
+
+maintainers:
+  - Md Shofiqul Islam <shofiqtest@gmail.com>
+
+description: |
+  The MAX86150 is an integrated biosensor that combines two
+  photoplethysmography (PPG) channels (Red LED and IR LED) and one
+  electrocardiogram (ECG) channel for biopotential recording. Samples
+  are buffered in a 32-entry hardware FIFO with a configurable
+  almost-full interrupt.
+
+  Datasheet:
+    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX86150.pdf
+
+properties:
+  compatible:
+    const: adi,max86150
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line, asserted when the FIFO almost-full threshold is
+      reached.
+
+  vdd-supply:
+    description: VDD power supply (1.8 V).
+
+  vled-supply:
+    description: VLED LED anode supply (3.3 V to 5 V).
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vled-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        heart-rate@5e {
+            compatible = "adi,max86150";
+            reg = <0x5e>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&vdd_1v8>;
+            vled-supply = <&vdd_3v3>;
+        };
+    };
-- 
2.51.1

