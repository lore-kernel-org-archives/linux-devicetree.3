Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07C51F09AD
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636623; cv=none; b=NWRkwf2ApfgJtGWyurd1LYBFUjYTTVzAoRWRX3IHZpoVOauUEcKemEeKiQSdHgmnnzbCnPBE7vmc9cG/NBATPpU0hUTbBGWAkKr8JmMaLT5cNmlKVsegEtrceJ13KihUG3ohmDxsPooxeLtqG7aYEDHn3ltXdqx2jbLqjtEIPVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636623; c=relaxed/simple;
	bh=lJNpucUX68tWdyUfNgUwSALBY8DGx6c0lVEaarXpxxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OGAe4LeBuYB/L+y+0X3TzFLiHA0+LWbKCj/G439sAlHtA+SbZOWoyL5E7GmItZRpGPMxGXrOoLkqIvPiEmijCPH1UwAM8iyUGg5U6mcnqoE3xBE8QdBoiAghM07Xl8CksCLg1p9TGXrq2t5FBMzDJ71yKkx1hThcNccZorNj3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohGdPq80; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohGdPq80"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3760549a91.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775636620; x=1776241420; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MH17IUeOdxsudCo9m2h4oI37xiu1+r/Gu5AYVv32s0Y=;
        b=ohGdPq80WssoXr+QOV31btBchyyfmKuecasUv2gfvFgrkgd2BeAfc7I2fjlLHbVglM
         8tz9Lgvfynom/UM/sTvB9a1EEfrZtBX4Ugh2Wek3FhgrZnppP5svWoh8Ir2nieLXH1+j
         Drv+KiTjB9HOipjwIAlOvyW1+TcOOkcAhh8tInRBQc3kMqY23fk0dwG6PsYNfP7duRRt
         ySfW1viUYCJ60WA+T26WMy3sbjF5ci3G1jYESmp3lzTJYQnWoSAzZtGk2muqA8ChRz8n
         D50qfcyJqJZL6udtQsL8v2xBywyLSFjbZld1eaiXdeylWpjnXij1wnvB9C0RU6mFNJnC
         9W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775636620; x=1776241420;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MH17IUeOdxsudCo9m2h4oI37xiu1+r/Gu5AYVv32s0Y=;
        b=hjftbNKkheeyhrbdmYFUAI9Y4QyhpDq+7uknDdLpWATlTRtCUyIS2BBI0awsO9fH70
         FNs9pTIWR35kGUmq5FmHQjacca9jGwDvNH17cHWfWYmmS1FvnFuvtvigrPDhDU7Z6nyr
         2do4xc5cYbb9nPpklDdmKE4BTEqKVLnsm1SJPh20RBTphiB/5Cg2cN8Hp/wJAAXISblO
         fydjdryxWikg3o/AkTBOQZ875pR/SgopOlIY68xgc/+RJ0HDB+3eh6Bpn7pNXxgT84J6
         sr/aJLX4g7ehJ8dIrA7vkG3lTyOs6k7r51RqhIdegKdsiA/qKqty9zFzP6c2ieZ3FBAg
         Cr4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUituFhq/aLuhYi11I2UR05nJw3I6YV394P2Y3nYITTihzEIXdAbDCpHiPTUbPYPnSO36NDNpo9Ech/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Cu0jchTv7qhL6zlQzHhxy2cHPn79QyEHjBL9zZ6Dptgwsn1S
	9bucn0aISa7qHl5/1u+a0nvpaN8HipmCXi9rj7Jr4x8axIt/zhVFSN6W
X-Gm-Gg: AeBDiet/MGqy53xxGU6BhK8bo7TPylA6SFrKRJ32i0ZL0fOesGZ9Z+Qx1gQPgQji1bJ
	4aL8NtNqXzKRhbNIHXchrJumEIlHc6yQo2ujtsB+bXxS9zU9uHWyImjdWWwfF0PE9m1/UK1QV9C
	+brw3h/iXXFxnSmyVq5+9OPydStyU9bot3Gqt7X9bInaUOVne3ycztEMAlyM50H4jCZs8r9OQpn
	BccWAc9RVC9ieVZfbwr00CFbyzYvJJzJbyg30W8rwFz3u0+jZutNgdrtEo14qsxaFgX82rH/7V4
	ECn8lAZmojxNyloabqxy1Rj6Fl5gYHB/rtR2tznk95uxHkkRXOtsZqYDgc+m+tuREZqY4lTH7wd
	eTJGvTWtEYU6+qiJsQpNrKf2o9ur7HCaNHJSE3HzMw4MGflXcYbCTt5e71kTEoqCfZyU6bUnvEj
	hdwpI74h+s4lGaiqIepN/V5nEFl59QdPWqHGIdLxvDYq+cbref
X-Received: by 2002:a17:90b:2b4b:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35de69aec1bmr20355141a91.28.1775636619649;
        Wed, 08 Apr 2026 01:23:39 -0700 (PDT)
Received: from LAPTOP-872M7T80.localdomain ([223.181.104.171])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-35e27c6173asm1020696a91.2.2026.04.08.01.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:23:39 -0700 (PDT)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Wed, 08 Apr 2026 08:23:31 +0000
Subject: [PATCH] dt-bindings: i2c: nxp,pca9564: convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-i2c-nxp-v1-1-8276ccbd95fb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIIQ1mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNz3UyjZN28igJdI8s0I1PDxBQLsyQDJaDqgqLUtMwKsEnRsbW1ADa
 GKthZAAAA
X-Change-ID: 20260407-i2c-nxp-29f251ad86b0
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.15.1

Convert NXP PCA PCA9564/PCA9665 I2C controller to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../devicetree/bindings/i2c/i2c-pca-platform.txt   | 27 ----------
 .../devicetree/bindings/i2c/nxp,pca9564.yaml       | 60 ++++++++++++++++++++++
 2 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-pca-platform.txt b/Documentation/devicetree/bindings/i2c/i2c-pca-platform.txt
deleted file mode 100644
index 73a693d66ef7..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-pca-platform.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* NXP PCA PCA9564/PCA9665 I2C controller
-
-The PCA9564/PCA9665 serves as an interface between most standard
-parallel-bus microcontrollers/microprocessors and the serial I2C-bus
-and allows the parallel bus system to communicate bi-directionally
-with the I2C-bus.
-
-Required properties :
-
- - reg : Offset and length of the register set for the device
- - compatible : one of "nxp,pca9564" or "nxp,pca9665"
-
-Optional properties
- - interrupts : the interrupt number
- - reset-gpios : gpio specifier for gpio connected to RESET_N pin. As the line
-   is active low, it should be marked GPIO_ACTIVE_LOW.
- - clock-frequency : I2C bus frequency.
-
-Example:
-	i2c0: i2c@80000 {
-		compatible = "nxp,pca9564";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x80000 0x4>;
-		reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
-		clock-frequency = <100000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9564.yaml b/Documentation/devicetree/bindings/i2c/nxp,pca9564.yaml
new file mode 100644
index 000000000000..5d5653255b91
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nxp,pca9564.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nxp,pca9564.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA9564 / PCA9665 I2C Controller
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description:
+  The PCA9564/PCA9665 serves as an interface between standard
+  parallel-bus microcontrollers/microprocessors and the serial I2C bus.
+  It enables bidirectional communication between the parallel bus
+  system and the I2C bus.
+
+properties:
+  compatible:
+    enum:
+      - nxp,pca9564
+      - nxp,pca9665
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  clock-frequency:
+    default: 100000
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c@80000 {
+        compatible = "nxp,pca9564";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x80000 0x4>;
+        reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+        clock-frequency = <100000>;
+    };
+...

---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260407-i2c-nxp-29f251ad86b0

Best regards,
--  
Akhila YS <akhilayalmati@gmail.com>

