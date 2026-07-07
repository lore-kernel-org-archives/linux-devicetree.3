Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A777D3F7873
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423644; cv=none; b=Zn2eG6UXYABnfK7GG7dl1UQmWlzMCuadpJcForIJ5wGcclvBQBh/I1E3DR9UdBt0jS/U44lXNYAzmCSblmdMhuiOH3Nl0xiuTMP7HLTnA+w2xMO9oN9wKmKPZH29OuquCRY0PwNljWFfudhEG/2Nk4NUWZfeMxoJuK3B/2klQ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423644; c=relaxed/simple;
	bh=P+Oj7jIQQ1kjlJTfRXzJ+5BB+gvvqtYkyAyEyKsEQ64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GVd1w1zsYPMJ5mXc2FrjcQU2+CzTeziuUPTKrjQwTQdmSApZ1ILRkyrDGfQaki8E/naV7O8yMB42hnwmfH0jhgjF4880fFnonQyO7q79lmCpMZsiITwuvnpOn32XLkYX/vTgbPGFP/ot/BHrCubYHd6jXZpnSEjbP/zZiUN72Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Or8PdQfo; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Or8PdQfo"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c61ad6750so7967071fa.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783423639; x=1784028439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6Zlhe/AiiYbwfoODBy7+1UxzTGdf8QvkuXVvPOs3kU=;
        b=Or8PdQfo/P/dkoNpKgI1pS0giR/RYclqHPP2QKDy8zf6BTPIYWZXrYkwpH2gyoDHyw
         N4/ftUy/jfida9VKk9rsciz4BKY/n/H7oTlvpByr3YEr6TW7VcpIe1QPy/uZ3M2BiwUV
         2IxKt/lKr5F5bdav4Hg7lQSX6FKJrXRrOlcfcnBqTQJM1dadA4VOXIu1eeYkZ/qDITS+
         XaQMSgm+yNcwMW/GlMJpYpU5Kkuq6ehOC9aHNyVFMj78ztVPh5PKp7k2gGsiOnmXvFXX
         U95K2PsfcjjEqcS9PzSZ9e5NyL0HCr1f08unb1oC0U1klhrqgESkn2Xii7kc/opfF/6I
         4OXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423639; x=1784028439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6Zlhe/AiiYbwfoODBy7+1UxzTGdf8QvkuXVvPOs3kU=;
        b=QBiE2cbZDO6iuCcRztrJZvXBibeAfFZhOGCdmJzI5Csw4jpVPHyzq7b00kHt8tcRQq
         3rLEb1YHjUu4kUA+CXZjH32qEs5jHYcBVnvIA4E05ZgyiEnz2azz5JCuKXY5MKh/zPNZ
         u+aBnkast9W/svbr/eBI+aL6ci0aKhROCDM/lQ0aOzxFPpHLujpWfCE8xb/5QrwY941u
         h9tvS005NwhJuKRI19d04vDDEY6QO+U7cNwFGaQ+XUC5KJOWS2tuvnbHIS2+Mx+nWA0B
         u59hDWYIzIeOmY5XX3yIwhS9uaO9UySejzmjFz4EoqJA4Ed9Cpar+LksRe9oVeeo4xVN
         wNnw==
X-Forwarded-Encrypted: i=1; AHgh+RoDCBmAXuRL2BX0HfcA5HRQ7PlOUp3V0eYuGdzvWe8DqJabjqJ7hTay32jcdU4Dldjqf1xVVzNKbqxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxbkuXeaIERIXeA3u+gJ0IOmKB/Xs/qZTAPtIG2OqK4BA4hFTGr
	eYCqg017IcB66IqYbxWqm21Xqmw31s3/X9nzhmSRiyaBRXWul3N1n6tL
X-Gm-Gg: AfdE7cn0uIJFQFqm11EVonTLWldsY6lxXHd7UE75pSb2m90164zMmDV451VF/QKdhpI
	I+QtywNDWrDNGhxYpIkbzmsmX0Bu7zAm31KBxt4HOipl+hE/2qBcIV6YCCj3ev2BJQh1c9m986G
	fLdhtdEPi1s0LADpOTqE6nBbIu0k0IpIJSo+yoAWTSMPhGqXTUNjKbPQf2hT5vRkTwegLXjDkA+
	TGWgzA74aRD5Vj0lnQpDarr5Crj3OJYOosAy4AzFLmGBRSmxqdSKCWvRXH7gxJ/9G6Hdsok9cOm
	G4SASy/kUgnMicc2n5GusF0uCut6AASmmJHZyrauegDRn4R0Ies+SRuyMDAHA+b1JLrsQ+IVrkT
	RH4VouBOdcCIWqnioOSORxw5QhojbbgAxnY/yqoMgZ6/nyEgrbbsAXNkwuTNWhOXJrIM/Efb4+5
	VWsYGyV8YuBMs/Bp1rKj6runyVC8R3Zv+ngzfncevwbdAmFA==
X-Received: by 2002:a2e:840b:0:b0:39b:d04:b783 with SMTP id 38308e7fff4ca-39c5ffa4569mr7787251fa.20.1783423639058;
        Tue, 07 Jul 2026 04:27:19 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1890asm23602331fa.3.2026.07.07.04.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:27:18 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@intel.com,
	u.kleine-koenig@baylibre.com,
	joshua.crofts1@gmail.com
Subject: [PATCH v9 1/2] dt-bindings: iio: health: add adi,max86150
Date: Tue,  7 Jul 2026 14:27:13 +0300
Message-ID: <20260707112714.2261727-2-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
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
 MAINTAINERS                                   |  6 ++
 2 files changed, 71 insertions(+)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 3115538ce8291..e9b9fd619bd86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15863,6 +15863,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/power/supply/maxim,max77976.yaml
 F:	drivers/power/supply/max77976_charger.c
 
+MAX86150 ECG AND PPG BIOSENSOR DRIVER
+M:	Md Shofiqul Islam <shofiqtest@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
+
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
-- 
2.51.1

