Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4433911CF
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470238; cv=none; b=b+oNtEce2LuV4//C8T+LV1NsoDCWNOSah1WMB+W3IFIeDNsMezEMnuNu6/sfc3HOGUT6FfgT7ZLwVUxy1xB0+8K0BUycVXoteo5IcaWkk8jcpwYnuj7D4I23xHw1WxAFZxAlulXQSiftIU5LRPD2EvJj9yPrns6CK1uQJlwUAno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470238; c=relaxed/simple;
	bh=yGYoDUH0GpngWJRM/+2oKxqx2lbtMA4BIRUeJWrnKho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCTxq+MXOrtTLK6pjeZwRHOkOdnXMkrob9NXQo2m9L6ZRFQGzWqyKCPo0ZlZc68kTI93EtzwV+b11+UgisI3U+MLQtZ2B36b9d/NlDnTbE3dBfjYgZ8KODPyfWDpDzlxC/qBEMMUhAAEvqOe/z13JBubOM9dXBfEy50FzzV81Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMexMDeJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMexMDeJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-475417f010dso5068427f8f.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470234; x=1785075034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPyP+KaxXd4uhOrdQI9yUrxfXv2oT9xTCa0+/ekjFvQ=;
        b=BMexMDeJK0nc2M82nT/iykR+MOCN0r6K9J5C8ruvgPnU3OGF2vknw32nHwCZ93JyMV
         pGf/bKqhLsrAvkuhuEBlsvbYy6XS66AWi7fcENDSsia6SiQdw65vj6bkjfQRqcDfCDCP
         /vJnHrGKY4h12bhOH6uAJ9taR+oO7NBAlLB/yH0YYjuIWvcUsHDjoX4oJgRyoIsxO0bk
         MZUPwe8MEBwRbEjHcryGXG/d/3miXFkq4oD25+/GeL4npmF4eRmifnWR50GXQLKw5ywT
         o57ytqaYfNGRdjKfCEzRb3oJf4AmGprkEEossZZdqHHbvl5jsIospHnX4dqg4skb+qjP
         kILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470234; x=1785075034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPyP+KaxXd4uhOrdQI9yUrxfXv2oT9xTCa0+/ekjFvQ=;
        b=jUSRdWuB/AUWyCJcguk+DUAoUm7VBbt3IfIkvPTOVXT3x5rFKyLr934EE4kAH9k5wJ
         TbIi9bfI8cHgLw8EZsdUztnaxF6x6eeJXQGASxuZfU/xRWufTR7WlHmaZC5eKZMYqf0P
         KYw3MTq9WJ1neZeLYzpa/m7571FOblrKPwsSaNX1sG7mLxUK9sVW4asycdGx+2cfwiqX
         8+V0LyfAy2nWvVEC9NRmK/rPxP4/z9jcbWVuFAlJnbT/GnaxbZ/IIKO6D6Z+eeQksMMb
         nYjkqTcuk48y+PIf+fU5Ro4xt4mPMnw1GRrVYmJ7l8A1emxZgsd0mfYkJiUtElUYwF5F
         uAAA==
X-Forwarded-Encrypted: i=1; AHgh+RpMQWyc7hPk8y2dUvzez5FfayVxDhLO5TpAWWSSeUUsIFRai3XRGJp96kKNEHfSElOPAiw4p7apsW7I@vger.kernel.org
X-Gm-Message-State: AOJu0YwQfbbybD1AUuN9piHmtVY5vvLMq5qx17STPJU+vLUr40Fg4rNS
	pY6Rj6tuhfy/2eFCrFyTyojRoFq67vg0gihatdAyOCYbWMW9gLbntUvU
X-Gm-Gg: AfdE7clCjltaV1bgPYqzE1ohph4+8PQytdQODbW4bfXH/ZN/+HqWuFfJpikzwWzwVja
	eeue8zGrKQlVO0Kk6uj4GkdkHxJquv83ZO/2FDCxPP+saILsgAWQGmkL9qE+km32jbU6SKf4RB9
	V3UkcGwniYS07WwH4F438FpALIYaSZFe1EUlvRSnse8zOaf22J4Wiy9m/RsAEw1Y9StmqoBLeKP
	+82DdUd1CbK1Xc4uETJ4qtJYpQU03T/zwBcK/9p7xXSgATNrqr0E/nWdABSvdS4Tr1igZ3fwFRO
	khL6uGww31qcHMywdK+C/qvr3BHlGbzzgfyR3k9YSulJFlkHoD/l/t5/OTC1YpCktjMkIY82GGd
	KmBVTkmDL+HWIg4kwylF09u+e6T1w+2ZhzKJaH+3sNCPEVRpU4p6Zunz4L65hfmSMcuLC8qgcDA
	hvJmAyFy16ljx/S6KY/3+yeR9agIqSbGedi6gpWRm9jneg
X-Received: by 2002:a05:600c:4ec9:b0:495:4589:707 with SMTP id 5b1f17b1804b1-4954a3ec5ecmr132249565e9.5.1784470233698;
        Sun, 19 Jul 2026 07:10:33 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63eddd1csm21264859f8f.29.2026.07.19.07.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:10:33 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH 1/2] dt-bindings: rtc: Convert TI Palmas RTC to DT schema
Date: Sun, 19 Jul 2026 14:10:07 +0000
Message-ID: <20260719141008.3562347-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719141008.3562347-1-egbostina@gmail.com>
References: <20260719141008.3562347-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments Palmas RTC controller bindings
to DT schema.

As part of the conversion, declare 'wakeup-source: true'.
This documents the Palmas PMIC's capability to wake the system.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/rtc/rtc-palmas.txt    | 32 -----------
 .../bindings/rtc/ti,palmas-rtc.yaml           | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-palmas.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/ti,palmas-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc-palmas.txt b/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
deleted file mode 100644
index c6cf37758a77..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Palmas RTC controller bindings
-
-Required properties:
-- compatible:
-  - "ti,palmas-rtc" for palma series of the RTC controller
-- interrupts: Interrupt number of RTC submodule on device.
-
-Optional properties:
-
-- ti,backup-battery-chargeable: The Palmas series device like TPS65913 or
-	TPS80036 supports the backup battery for powering the RTC when main
-	battery is removed or in very low power state. The backup battery
-	can be chargeable or non-chargeable. This flag will tells whether
-	battery is chargeable or not. If charging battery then driver can
-	enable the charging.
-- ti,backup-battery-charge-high-current: Enable high current charging in
-	backup battery. Device supports the < 100uA and > 100uA charging.
-	The high current will be > 100uA. Absence of this property will
-	charge battery to lower current i.e. < 100uA.
-
-Example:
-	palmas: tps65913@58 {
-		...
-		palmas_rtc: rtc {
-			compatible = "ti,palmas-rtc";
-			interrupt-parent = <&palmas>;
-			interrupts = <8 0>;
-			ti,backup-battery-chargeable;
-			ti,backup-battery-charge-high-current;
-		};
-		...
-	};
diff --git a/Documentation/devicetree/bindings/rtc/ti,palmas-rtc.yaml b/Documentation/devicetree/bindings/rtc/ti,palmas-rtc.yaml
new file mode 100644
index 000000000000..ac64f0589c84
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/ti,palmas-rtc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/ti,palmas-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Palmas RTC
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+allOf:
+  - $ref: /schemas/rtc/rtc.yaml#
+
+properties:
+  compatible:
+    const: ti,palmas-rtc
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  ti,backup-battery-chargeable:
+    type: boolean
+    description:
+      The backup battery can be chargeable or non-chargeable. This flag
+      indicates whether the battery is chargeable. If present, the driver
+      can enable charging.
+
+  ti,backup-battery-charge-high-current:
+    type: boolean
+    description:
+      Enable high current charging in the backup battery.
+      Device supports the < 100uA and > 100uA charging. The high current will
+      be > 100uA. Absence of this property will charge battery to lower
+      current i.e. < 100uA.
+
+required:
+  - compatible
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc {
+            compatible = "ti,palmas-rtc";
+            interrupts = <8 0>;
+            ti,backup-battery-chargeable;
+            ti,backup-battery-charge-high-current;
+        };
+    };
-- 
2.43.0

