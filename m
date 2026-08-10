Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89876386C37
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367841; cv=none; b=XvBLfTbIdo40ZJ47dgL/sMQhJyRtM/Ap8yKM0aYjEgauatTaf5zob7p8slFQADVdEP05VFMh49aCQFA1prZth1lKgz9VdfyVJm4IntqrpyHET+o2QLDFNPHMX9uC0yTMqhUF2xXKDlWT7OaDmwQWFkXTOLoGrh8o/RwE/ojLk34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367841; c=relaxed/simple;
	bh=et5E2cOGoXpU1sHefktlkulFRxcWrIkinUWgju71Mkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oSuGvy/IMdYGZ15Bdv7+wBj7APDC6ozkKFoNLq62QipQiNe1wAN67DAPZDmAtnNni5HxozIUma2fPRe0Hc8sXFVxp/FzOCJqwbyiYWtSJKC2MHNT6IbTrW7olfZkmY8OO3uUZ6pokt2TK0w8WkS4AuyB/5IzoOdT5gJFZiKiVdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTf+meQZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTf+meQZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954dff6536so15430405e9.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786367837; x=1786972637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8oSs/E53A8VL/5WhNppdFIO5GvmhWJhbKNk7ZSC7qw=;
        b=mTf+meQZHQUT14aNT3vWBOIAW7JbaSNejKF85iAnjp139qCAyxv0ysSaLIOTX88NE5
         uIb1HRQrrMYtTQyfb6Vas0IYMwFIx56ULdXbBUIqcXle2lcBc+Mt1bVGyur+Njmj+PQ0
         QiSzwqgpYb0HyibA5FXNpkCM9DWyrAkmYCQHBgFMmO3+TExMgNsVFTkmCXuLHkn7Bh1x
         oxFotuYmiQVXQ4hjGUZueVRIa9yfvMEMI4u5Y1UYxGNM1CMGmrwg+JDucPR/3Gy5f7gB
         pdzdInMgPLVmWLAATWujnyEjNabRAtWGiZ3uLPkNdF8OqKKWDDHvQ6IcM12aHefAX1F9
         p3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367837; x=1786972637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8oSs/E53A8VL/5WhNppdFIO5GvmhWJhbKNk7ZSC7qw=;
        b=TJ2K+sgtojbKsifIQzqr2HvUru40xs4KXG+1/Wwov3kuciWyYWSinen7rFsHoHTHOd
         xkluod885qd4YtmqG6de0w3OVY+vio4Dcbhp/RXdrm0AbMGShh54ESqYqipt616BFbFf
         INmpx59sJXL6IHbXCkDsoxmly99VtcKvMSUTSD++NdYxfaiiATbglVC8gV+jaG+6PU1I
         wMevWuk4AbucZtXMSGY/GmpUhfW7J+6qkRndmHmm0q8YM3cOYZb5SnzHVNvcERvYZeW6
         efWDI8YqI+HkA0vsLgK6+0aWjA+KRfuEVwoYQ7mHjllVlJCrEuNxSSKezBU6o3hWthJf
         omiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMwQlglklSXmVyTaIfn7/8g5CXXm7dENxWdMjC4wklLHk5MXyjVaxNRTBtumk18L1a/v6jJaaEAfoJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWMWpCqcTNQlSkvcOe+oPJpYC9Czit9q58yrJU4IPQsf5C22jJ
	3JfplkIIKfgMt7qbgdAC+8ukDLDnmh3XwlKzFcOpz+LTfnp+baPU7u5N
X-Gm-Gg: AR+sD132V+kkAXrUG1taw/nt9eOuBMqIPH6zcaACpTaQe4KA1iB9tCUfvayNxzLe6Na
	RZ+P+/EzBGWBmz4/7FadjzggGz7GrihNGZdoTIG1SBLu2NVYcD1oftmkssDhLl8V3ePzLFzomh3
	7ALAimVgaT8iHTHFjZ2P3kTLSsi7r6ihh+C4iXoAR/VWLgmwyyE09beEFS57YS5Sn3Yfp2G/bfx
	El+yLG+0md4ESQwCllIlWYolRttH0bmHPz7a2mRb0NJ/KZ1DPeNw6Qm3S1xeg/QYt+8iwAMm1zf
	PUobjn+fOTocOX+XgZe1PMnUbkr60IDmHwUDvTSg5VCNBedq4izFom+vWTkQhOddbSoITFkvCcd
	6KTt4DwAm1H83+C9GWglZP9uCCxUdJN195ZJj7/PUFg0ybYXL2/ndcJCAccJ556Rv+JEKHN/Qmb
	q4tdxUDe8/op7GOT417iorEvn+twh6Y4KnZBZ1aDZNno0H9cWdHHR7XaL1cmJE6y5uE8D5OjkPm
	MJQMZC3C3krH79wSvcfJlcUNj1pT2OZa5wHjQK1PQ==
X-Received: by 2002:a05:600c:3b04:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-49959e016f2mr394484115e9.3.1786367836983;
        Mon, 10 Aug 2026 06:17:16 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c8bcca6sm231164515e9.4.2026.08.10.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:17:16 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2] dt-bindings: power: Convert TI SmartReflex to DT schema
Date: Mon, 10 Aug 2026 13:16:41 +0000
Message-ID: <20260810131641.352391-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments SmartReflex bindings to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v2:
- Dropped the '|' block scalar from the description.
- Marked 'ti,hwmods' as deprecated.
- Reduced the examples down to a single one.

Link to v1:
https://lore.kernel.org/all/20260730092454.52466-1-egbostina@gmail.com/

 .../bindings/power/ti,smartreflex.yaml        | 50 +++++++++++++++++++
 .../bindings/power/ti-smartreflex.txt         | 47 -----------------
 2 files changed, 50 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/ti,smartreflex.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/ti-smartreflex.txt

diff --git a/Documentation/devicetree/bindings/power/ti,smartreflex.yaml b/Documentation/devicetree/bindings/power/ti,smartreflex.yaml
new file mode 100644
index 000000000000..7ca0a5eed9b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/ti,smartreflex.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/ti,smartreflex.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments SmartReflex
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  SmartReflex is used to set and adjust the SoC operating points.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap3-smartreflex-core
+      - ti,omap3-smartreflex-mpu-iva
+      - ti,omap4-smartreflex-core
+      - ti,omap4-smartreflex-mpu
+      - ti,omap4-smartreflex-iva
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Shall contain the TI interconnect module name if needed by the SoC
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    smartreflex@4a0db000 {
+        compatible = "ti,omap4-smartreflex-iva";
+        reg = <0x4a0db000 0x80>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/power/ti-smartreflex.txt b/Documentation/devicetree/bindings/power/ti-smartreflex.txt
deleted file mode 100644
index 21ef14d6af12..000000000000
--- a/Documentation/devicetree/bindings/power/ti-smartreflex.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-Texas Instruments SmartReflex binding
-
-SmartReflex is used to set and adjust the SoC operating points.
-
-
-Required properties:
-
-compatible: Shall be one of the following:
-	    "ti,omap3-smartreflex-core"
-	    "ti,omap3-smartreflex-mpu-iva"
-	    "ti,omap4-smartreflex-core"
-	    "ti,omap4-smartreflex-mpu"
-	    "ti,omap4-smartreflex-iva"
-
-reg: Shall contain the device instance IO range
-
-interrupts: Shall contain the device instance interrupt
-
-
-Optional properties:
-
-ti,hwmods: Shall contain the TI interconnect module name if needed
-	   by the SoC
-
-
-Example:
-
-	smartreflex_iva: smartreflex@4a0db000 {
-		compatible = "ti,omap4-smartreflex-iva";
-		reg = <0x4a0db000 0x80>;
-		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-		ti,hwmods = "smartreflex_iva";
-	};
-
-	smartreflex_core: smartreflex@4a0dd000 {
-		compatible = "ti,omap4-smartreflex-core";
-		reg = <0x4a0dd000 0x80>;
-		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-		ti,hwmods = "smartreflex_core";
-	};
-
-	smartreflex_mpu: smartreflex@4a0d9000 {
-		compatible = "ti,omap4-smartreflex-mpu";
-		reg = <0x4a0d9000 0x80>;
-		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
-		ti,hwmods = "smartreflex_mpu";
-	};
-- 
2.43.0

