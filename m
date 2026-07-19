Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AEC397E91
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470630; cv=none; b=BbQr+nTjJK/pLOl9B2EFH7ITlOARIqs34FaDte8XKKQqpQz8ZyKCzFIC0wUd5UUvOsKHOVg1BriVDamAFroDjw13zXCxrW0+RKhFywBejJN/djfvqBaY7+GO7Lfv3x/CFHCCXH9MmdmgXjy9PhERp3VLpU/uS6qU7YU9Cie1j/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470630; c=relaxed/simple;
	bh=SpeAbWuMzIs16vYBg+PKkHGC0eKCjEEqBJcc41Jr0Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gXEA5SoyfQqRNko0Uf/yjSpWbyt4PUw38A9eteoHbmwCF5f8TFB3HaLgZBd1rLK+wFMzv1afKcYeRNMS0gf46BeSJuOrvZr3vj5YePXQirA3dUd5sXqtYeenLLIN/Gl9U4Gi53gQaolFG+EvlWPo30K4Pi5mHIM9uEkyC4mhA6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY93HeRZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY93HeRZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f71156e1aso248643f8f.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470627; x=1785075427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=flMnLVuuStL9Ibbrxu4EV+KrfuDkbDXYXGCnZSZTM1I=;
        b=NY93HeRZ8opmVeD5+KP0f3GTsTqjKHUonlk74abib+qMzi/Fq8okTI2uvaVF01TiH4
         cczgv0itZqjLTYi6CXAw4MuG3OSdivZocCS/v/XtCNqHk0bdnmEKAkjYUYxk0HM0/YfI
         /6fAVR/OoJj2rhsD24FzdwCNNCBJsD0d25hdwW9cGLEn9Y39VlydkhEt6xcI+KboYqby
         hE6Mggf4l9VGP/fXBueqc45IYGjN0QNNXSLs/AxuK7W5vAaelduW1M/Rxie1p7Uzbcpv
         EXv2jlMYv8dqI6SfrPCq7H6qTqXrnzEfL0MfFqfoyF9ZE9tHPj4U6dGWkyHPMK6rVsYw
         00wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470627; x=1785075427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flMnLVuuStL9Ibbrxu4EV+KrfuDkbDXYXGCnZSZTM1I=;
        b=VUxAtrBsA8X5n8Dpy6+QBnLx+zyG5p26laJzrGbqj/yycq2yJPNJ+MTWkroWzxUr1X
         bPF8RyZDNGcb7A5BlDXrbJfgDSwPqeeHXzzXRYh41Cxg7z+Zj43YPpAsYX0SHeAKDpo5
         ASBi+wLX2HFULzpWCqvWXr6IpKDsW7NiHUN5YPAHin6b8P1KzAbIl8+g3c8PKiWwkkCq
         Anob5E4YXLu35dvo3LC4Mrkbmh3phrEZ5AmoWNvIfdnLK8OBFYgs5+RlnNpwl7Pw0cZo
         amh/U44jJaig/C2wtqodQupx+YEU8gHmn+WyPM+Y86Kg6Nh4roFPQSsHprdDImPc2fsT
         X5PQ==
X-Forwarded-Encrypted: i=1; AHgh+RqU3+1m6nrvEvy546tWTvUa39XJkMsTIu6hGf3UMAHpaSSc9aRdOUd6a5l+b/wXH9eJBElnkQFOK/d0@vger.kernel.org
X-Gm-Message-State: AOJu0YzVWowul6rv+tZMBU9szYmkGsul+1gDEVoER2ysdb2JPpCDiCxG
	SbjhMyLqr/an6wO8uLGIcfJqF39vAjGb5vUBdhJvJB3A7wvxF0HoOh4w
X-Gm-Gg: AfdE7ck8Z3u/9tQhvPc9+3SDfVijsekLUxx10xcvgZH4pO1FTFL/GRC67+LD2CRy0qv
	mDrLrM2CE8coO2If4T2JNh6BlS+ltLf+hDaC08omHWdPdgUBZiDfZEgZ3ky5KUKyNfPpF5OVFPM
	s1eBMgi4QzyaNo8HMqPyhLUvLBsnp3WGBiJ8bwSBrZ8r8CPt7Cti/AkerJOdr87ZzA6n266S50Q
	lW6xc8q7pzh/qTXPkj9A3lAd7xD6lnnsiFPsoG62X/gH9D8EtD9i79IVBw5xmQGYFrWhB+GxHrK
	okbr/cbS+Worls5XdOhqtAL2NAOuCwJsNElL827xCiO2HsHDqbZB6EpS1xOeL4AijKGiH9rki0x
	NHylsNmW3mdVPEG4tD0eHiXNeyNKv/ad42WQbd8yvyIPM5Mg5vR1K29N5qafjw6fOYvlMZBLSez
	teo0KeK5Rg/EVt7Dg5v0/625/LzYeeb8tVCetFJzzkCuTfI/JXBPCiWLs=
X-Received: by 2002:a05:600c:6c98:b0:493:f6c1:2f09 with SMTP id 5b1f17b1804b1-4954a3d2fcdmr83284595e9.6.1784470627212;
        Sun, 19 Jul 2026 07:17:07 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4954a2edda2sm193403455e9.13.2026.07.19.07.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:17:06 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: input: Convert TI Palmas Power Button to DT schema
Date: Sun, 19 Jul 2026 14:17:01 +0000
Message-ID: <20260719141701.3565277-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments Palmas power button bindings
to DT schema.

During the conversion, 'wakeup-source' was added.
It was missing from the original text binding but is actively
used by in-tree boards.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../bindings/input/ti,palmas-pwrbutton.txt    | 35 -----------
 .../bindings/input/ti,palmas-pwrbutton.yaml   | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.yaml

diff --git a/Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.txt b/Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.txt
deleted file mode 100644
index c829e18e1a05..000000000000
--- a/Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Texas Instruments Palmas family power button module
-
-This module is part of the Palmas family of PMICs. For more details
-about the whole chip see:
-Documentation/devicetree/bindings/mfd/palmas.txt.
-
-This module provides a simple power button event via an Interrupt.
-
-Required properties:
-- compatible: should be one of the following
-   - "ti,palmas-pwrbutton": For Palmas compatible power on button
-- interrupts: Interrupt number of power button submodule on device.
-
-Optional Properties:
-
-- ti,palmas-long-press-seconds: Duration in seconds which the power
-  button should be kept pressed for Palmas to power off automatically.
-  NOTE: This depends on OTP support and POWERHOLD signal configuration
-  on platform. Valid values are 6, 8, 10 and 12.
-- ti,palmas-pwron-debounce-milli-seconds: Duration in milliseconds
-  which the power button should be kept pressed for Palmas to register
-  a press for debouncing purposes. NOTE: This depends on specific
-  Palmas variation capability. Valid values are 15, 100, 500 and 1000.
-
-Example:
-
-&palmas {
-	palmas_pwr_button: pwrbutton {
-		compatible = "ti,palmas-pwrbutton";
-		interrupt-parent = <&tps659038>;
-		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
-		ti,palmas-long-press-seconds = <12>;
-		ti,palmas-pwron-debounce-milli-seconds = <15>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.yaml b/Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.yaml
new file mode 100644
index 000000000000..9f64caaac00d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ti,palmas-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Palmas Power Button
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  This module is part of the Palmas PMIC. It provides a simple power button
+  event via an interrupt.
+
+properties:
+  compatible:
+    const: ti,palmas-pwrbutton
+
+  interrupts:
+    maxItems: 1
+
+  ti,palmas-long-press-seconds:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 6, 8, 10, 12 ]
+    description: |
+      Duration in seconds which the power button should be kept pressed
+      for Palmas to power off automatically. NOTE: This depends on OTP
+      support and POWERHOLD signal configuration on platform.
+
+  ti,palmas-pwron-debounce-milli-seconds:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 15, 100, 500, 1000 ]
+    description: |
+      Duration in milliseconds which the power button should be kept
+      pressed for Palmas to register a press for debouncing purposes.
+      NOTE: This depends on specific Palmas variation capability.
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        power-button {
+            compatible = "ti,palmas-pwrbutton";
+            interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+            ti,palmas-long-press-seconds = <12>;
+            ti,palmas-pwron-debounce-milli-seconds = <15>;
+        };
+    };
-- 
2.43.0

