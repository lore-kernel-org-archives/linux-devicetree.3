Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2352A3EDE59
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420961; cv=none; b=Amql1Mi1YzEj3RvnySnUIKV9pK70zxUImWKT+d2rR8YuR6ZixehbNz7GdVMKMa/RWHhzw2ftUUND2YK0TXS7dUrFLxf6ESKlTcV4ViakVMH7MT6QqYhVhTof1OWkxKTX2nQA30N4uh+Y/WURuT5RFDjpUjqyLtopqj2McqszYFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420961; c=relaxed/simple;
	bh=t/lScOB7CpFSN+BBpWau0Y34mVwtawmhNWrHgcJiZHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tnFr9+lIrArbuF/oy5E/tRazSLaHiq71XQq3PlAnpjtbqp1B2r+u4G9ox1V55gbELe+5ZbnZZOSpNmfKDeYsE8AuiApWHRgw6I7Tgg1hzc4Lndaih0GFj9RyOsZRmw5Q2c+XVbbR/7vR9vjdFsBkbqoel9RTziqveRBqVhMco8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzN1bt+m; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzN1bt+m"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c61ad6750so7704001fa.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783420958; x=1784025758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWfH/GxGUXWLsJ6S744tEAlMTJ0a2RTRBnRY+9o/Ybw=;
        b=XzN1bt+mCRkeS36V7K4EYwA2AnsO0ryf72JpUu8n1ZNiEQlN3u0AxGwAzmfCiDp9ZR
         FScIkC0D/rH6H8G0GBjYyMqOIRxtcmFM9dHt8JB/iVrtJYyrytxkgnplmZr6Qj3bWlX/
         g3FjNJLsUrgC9UM1lBSgy3QVyIopmflKwe7cMij+fCSyAWzvYRkcWJY6aKqzcf4FADyx
         W53TBKlkphdR4deM0WPkCffslHedC3SouRrS/3AOmv71AQ6J6PencI9QcoCkxdmDykbn
         LextugtZUi2vPlThlFGPfahxqV/K3cq9THzhPm8J1/Hm6/tguGhbGFmMGjFEDEaHT+Y/
         jUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420958; x=1784025758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWfH/GxGUXWLsJ6S744tEAlMTJ0a2RTRBnRY+9o/Ybw=;
        b=TGyHJCJTzgShamQsJCWrzUj7cYvxcwvlb+0wQvtpAJ17jrv0O7STvCOgB8UO5/QMLE
         pCycaQtpziNTveZw1cPxeZVS1GdWgFYeJ+ugtHOCcfqpeSzJ3eewMSB2XXQHBeR5QDTf
         4qtgFB4CS1IiZPfJnXohkWSb3iANpKJgK7A2pnFYOLbCBP89gBh9v7dcCiKHfFRoE9jk
         EJDle7LYd7sqIwkdGs51xITmgho3q9gLLJvCckZShQH8j867M5F3NNU6uy+4ZaAY+XEO
         LzTLXfMrAQ+kIUXsvnhsCSEd3I4V46GwLTflQJlPz9zEGaF04/woroQVMHUxBBoaKzBN
         vmaA==
X-Forwarded-Encrypted: i=1; AHgh+RpGA7FRePk8SIJuuQ5Vr/PVPzkhjChB9hkqWcgmV/NX69M8if5yhVlGi02MI4BOMn+eBOl3hcj1UqZY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4FZa/PpD+Nztuo0T2zJZCKwHqPzwxhx64GPEmjEoXQpdG4fy4
	u7M33yK4/rycpWvhAQuRFGD+Gustnz+FqCNG+PXFhYFaWH7k9DP+Pjoq
X-Gm-Gg: AfdE7cn1Gaso6V/xYxxEMJpB9GJYlZ5dOuOHMvj2qMXSQoW8oqgZ4VLi2r1oy0El9cu
	5DKqILMeeVcUJu0s1kUigiUCf+ddiVjNuYIGqqXUlUONbSv9ZxLNNRKQm5YICQ4owR3j+nmoAHb
	c9P1R8YzpLske5AfVwD1zqlJBRHYnQPr4hZP/msALS8vyC0DBi8LKts5JX4neljvwI2DvKx+UT7
	W3n23Gfbn3jXHldH+LLydXSVpIMc9uorbCB4iKs44jmI1hxMkyMM1LcOBcM84EYn9k1SxuRa/dK
	pxit7Ubpe7wSZXPgHda/ilabt2q2GgMiHHnV6y+vHbilwDOmEsMhrV/LyiMGaJ2U/0WhkomBi8i
	kEbE0S+AZ1NMc7A90zWv3uAmD228roDaI+H/J5oOr9i4qB4lAWh4CUq84TnUkWvTfjmWpt8a7r/
	KJRKXNnq1YgfyLdq8Apdg2cw4dhi7BMc4MuQYRdT9hMrGglA==
X-Received: by 2002:ac2:4c35:0:b0:5ae:9c19:165c with SMTP id 2adb3069b0e04-5b007c089cbmr641197e87.7.1783420957925;
        Tue, 07 Jul 2026 03:42:37 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c1asm3533227e87.81.2026.07.07.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:42:37 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org,
	jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v8 1/2] dt-bindings: iio: health: add adi,max86150
Date: Tue,  7 Jul 2026 13:42:33 +0300
Message-ID: <20260707104234.1957104-2-shofiqtest@gmail.com>
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

