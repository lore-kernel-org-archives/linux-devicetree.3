Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C4B385D7C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173089; cv=none; b=B0krEQUe9JVgXL8XgG/c49kjlQ0pLOvzFNoJSdmE6Lz3pi6yWjgQ9voKuyR0wAYhWeB1a4/Es7LE4exH95OShIm8tIVrLFs2Z4u8Fzr4UzyOobBqt1p717xJoRw4pN1N7bLzXG100uw0MvxlEqb7ERW4nFbzcEUWfHXyR/ehCWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173089; c=relaxed/simple;
	bh=VWRz7lckxRcd4cXpSu6pW5+eqN+XGzez1DeahohpRfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBomhXXuZR/YulCwj1M6XBstZzIl4z4zTbb/rvSyilzJNc4MjdgmN+Ji32r8rwxpGFhvxZ12TBjF+LFWNtdnqC9IkirdrdngnskE0PHPiFg5oOa9+UkBcOvxb8YtYCXVOSaBAwe+LxSi7KeKHILQ9p2dGMhqWiqorfFMvrtafxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmDnk2Et; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmDnk2Et"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-754acc61e10so783407137.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787173087; x=1787777887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEb/XcRzZMGFqqe/Z3DOazNhxu8ChafO/d8R+t1b82A=;
        b=nmDnk2EtRy9lekyxf8fqdCOCz4sVW0Hr+OxX9WzzH3jmAoYaMUYGDnyIqii92xcxcT
         bU0fNTo3z7yWFCH56fXcwSPLXty1Vg6okiWtAiNZbpAQf2Gtcxu7WdI1A0JdrAJZK4GM
         vHczd7OTCQdVzadYHF/A2ym00Q8owsxzH4XUxTyA2jSCg3HDvRdf5PSBNrxMnLcXgGa7
         TwD+sYaB9rFEwZ0Z0Qivpbp1em6v5cwL0VKGxVD+5nnOa3MsWZeD1HQWOZEpRqtr0+0F
         VQyeik5XDGshGCA57luGMqG4+lag6hKFqPZaCl1GxwnqX2yUHw6qwVG4q7RiNNltBYEU
         fKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173087; x=1787777887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEb/XcRzZMGFqqe/Z3DOazNhxu8ChafO/d8R+t1b82A=;
        b=ZIDwxZkQEHMIPrhjRp3SL1h0PKARG+sXf/QvR5rPJyRuc2bdrB3RxCYvPHK8Yo7Ktc
         sQfzNAtW0gf4PXUNhsJkdCVmKzSXm9nerBbVcYaDOVUqkf2Nl5nC/Q9n7QodhfeovRjj
         LWo4B9447DukAHA9GV1pwps7FyqwK8SRWawvVFm2AJHbHxzRTJr0FpspJgK4lOKHjjSP
         dfBNwBt/7u4vLcrD2mD6e9rMAqIMm2yZvmi2Yn2HppZ4/uyXJImhOz0GaUt8pG0q6I/T
         IeA8OFRBR2LUYCyzry1agf/uoPjQz0Zqlx29EUY/iHCjorfU1N+upTo9K63DRM2Ixmsr
         C3Cg==
X-Forwarded-Encrypted: i=1; AHgh+RrPIRXJu+4BphA8fs3k6DwgYnmZPlqDaSMUI2uNVlO8K+z+8Ubzmu+QLmpY/Bw0glAsslTiGH/VjA+l@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt8r7hy/jyfsDV3GeuMVZUwvjBSVxNa4nIT53TJG1mSV1KuIZ7
	PRComRMiqTcFyBUyYCG12sbFnvWgMwp6X2YG9tHJQrj7tOu7CRJWPqSv
X-Gm-Gg: AR+sD125aUwg6osG+fTc/FhPls0KqGCmkib0tmTyYuQMyzSbrpf7zuQZkgABoIgGoAb
	q+3VyKxzSq+BFBjLLspJ1NIGxivVX1HdbNg9OKUdFbvbGB9RlzbzHruOzFyGNBYsNd9KdJcR5kC
	KcxN+UDr/In8vsWgqbAf9QCZVPuMumEgeiy9LDDMt2X3h9wTmBHkShmEgwBIHsaa0ljKPg2qDgu
	NhSdPaVx5xxlT8liTUJpJZEO4vRow7gSPAKAtuSx5/pn7uAbawcR4fyCpFSCKmOTn0dBdGtCiy4
	tPk5tDRTkpAebUWLDpFvLvaa3PUxTbRqsVVkf8ljjkD8kXbOsXe+4xcLIlNrys+H7UbErCtGiNq
	ofsQMbbDE96A6gBU6UeQZ0r8SkD3TjlEVjl6p+LHMqlDMDkqDbJH3Zholws6IzbQXZyubTanvBS
	sPEVmX7E3AfzwESZhiIOnfG9fYbZLtt9Wj/5ioQPM9uuIqdBBG3CU8906l3PxN8Pm1ifJ6nyt3H
	VPJMpT2N0/EqmLBczvmD22ikhn8GJEIfrxxQz6ZEl4=
X-Received: by 2002:a05:6102:a52:b0:778:f972:32eb with SMTP id ada2fe7eead31-778f9723986mr859098137.12.1787173087170;
        Wed, 19 Aug 2026 13:58:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:3443:53b2:2e07:b3bf])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777ddc844besm3616259137.11.2026.08.19.13.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:58:06 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matt@ranostay.sg
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: iio: proximity: move LIDAR-Lite v2 out of trivial-devices
Date: Wed, 19 Aug 2026 17:55:17 -0300
Message-ID: <20260819205751.166030-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
References: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PulsedLight LIDAR-Lite v2 is currently described as a trivial device,
but it is not one: besides the I2C interface it exposes a power-enable
pin and a mode-control pin.

The mode-control pin can trigger acquisitions and report the measured
distance through a PWM signal, entirely bypassing I2C. That usage is
bidirectional and non-cyclic, so it doesn't map onto any existing
binding for describing pin behaviour, and is intentionally left
undocumented here. The same pin can, however, also be used as a plain
status output while I2C remains the active interface, which is
described through the new interrupts property.

Move the device to a dedicated binding file and document the
power-enable, power-supply and interrupt properties that
trivial-devices.yaml has no way to express.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Matt Ranostay <matt@ranostay.sg>
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml  | 65 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
new file mode 100644
index 000000000000..491960bb3a0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pulsedlight LIDAR-Lite v2 range-finding sensor
+
+maintainers:
+  - Matt Ranostay <matt@ranostay.sg>
+  - Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
+
+description: |
+  This binding covers the I2C interface of the Pulsedlight LIDAR-Lite v2
+  laser rangefinder.
+
+  Besides I2C, the mode control pin can also trigger acquisitions and
+  report the measured distance through a PWM signal, without using I2C
+  at all. That usage is bidirectional and non-cyclic, and is not
+  described by this binding. The same pin can also be used, while I2C
+  remains the active interface, as a plain status output signalling
+  when an acquisition has completed.
+
+  Datasheet:
+    https://github.com/PulsedLight3D/LIDAR-Lite-Documentation/blob/master/Docs/LIDAR-Lite-v2-Docs.pdf
+
+properties:
+  compatible:
+    const: pulsedlight,lidar-lite-v2
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO that can be driven low to shut off power to the device.
+    maxItems: 1
+
+  vdd-supply: true
+
+  interrupts:
+    description:
+      Mode control pin used as a status output, driven while the device is
+      busy performing an acquisition. Can be used to signal completion
+      instead of polling over I2C.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        lidar@62 {
+            compatible = "pulsedlight,lidar-lite-v2";
+            reg = <0x62>;
+            vdd-supply = <&vdd_5v0>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..6a7ee45842e3 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -400,8 +400,6 @@ properties:
           - onnn,adt7462
             # 48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
           - plx,pex8648
-            # Pulsedlight LIDAR range-finding sensor
-          - pulsedlight,lidar-lite-v2
             # Renesas HS3001 Temperature and Relative Humidity Sensors
           - renesas,hs3001
             # Renesas ISL29501 time-of-flight sensor
-- 
2.48.1

