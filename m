Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DD839A071
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778320701; cv=none; b=Gow5GeyGAGXds1DQPDs7Y0tT2g4u+eAksEDO0UZqpSjG8qK3+qeygoboSdOZQU9+7eaXBh3WfAVYotABJqm/7ogFUa2q4f8J7ioXsEsUmefOO+hPD3gKaamwLab9O9Dlh6DcJ2PdpcZ9KXwOr55/YhXWD2eE3Rx+bcdPeGHl1S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778320701; c=relaxed/simple;
	bh=OSgeigJrC/LmOWDzFokC2wzqJC4CmOLy+39xvEvBcu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iP31e8ZHqo6d/WCjGwCfvH4xiLcCgtpYvcbhr7VG0rv4cxC8HVNQ2oP7V2wyQ+6IBe2O3Nbyco3Z6CiJxjVmmDzyUIVye68kllLqI3Cpe6pdelOSDuH0Jj4vVKNaoRnagYcPLGSBhm/pRCKCTm6L1Msu0LXWhxnBls2AITh1dNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/pnS9rC; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/pnS9rC"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c7980c060cfso1250717a12.2
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778320699; x=1778925499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGnEaNywaaQdrKkMOeCsl1nlp6Rj/8u/91oXFsfmlSA=;
        b=V/pnS9rCmd9xZnlfR3WdAzetEpTI6s6CNnltiLtC8WBSST//VxYwgS/AJoKFAowATa
         1wFq01CiUmgpfalHMQ69+Or6203W9xsdwo3BFQojmo1uL3GWfxxDd7GWMgxEHoWhff2q
         pddSzCwyat2DXSNA6U71EvQUEdsKL8GdKAGa8o8JAywrSD143Qt9nAAcbFkaR3vFM8SI
         DXTQCJcVWA3xGUfL9oCA3cLbJm4iDzKKkX4/svwfpnb6oNuNEl1m7FUU8jyf0XMBdyJj
         /aieB4oScdM5dpYx8jyXLSM3TnO6sP3h/U0gouTKm04NumwRmXPqgflZkE6icimV8Wd2
         /pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778320699; x=1778925499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGnEaNywaaQdrKkMOeCsl1nlp6Rj/8u/91oXFsfmlSA=;
        b=IDhg2rkABnAr7AboSk9SB6WcMHMu10cY+b1cxpzqHfPcdPMwAYqirmBfM30i5+zx5C
         +QGzBe9eUiPLTlmz9gfsg5/eqvyP/7ihXvHD4nlt71K4MIQh8dxBCN3HioySkj3ylr/p
         3zqFBdD1G3uOopFbhWGKda5YXKHL4jIynCyLgEUyfD2PAStq8vB4IjuI2cNBnPzG13iL
         hsvegt3GeUHOmxawPSxFzS/tGcJ7TBhQuEOeM6J4wuq7/64GVBZCP8IRJk8dWVIoN64k
         M9rP9o/oqYVnYxNfZD/qerCWcaXSylrd4VyOk8pQARNaGQ/nMKUAUBSqYveDmXMKrfkU
         5yMw==
X-Forwarded-Encrypted: i=1; AFNElJ9S75xu/fwMMviGGXpzUBjBn5xYOds1Tpa+/ZTdTueMy3kD3n5QMraKYho6ImHUEcuun7tjFO1oqXyU@vger.kernel.org
X-Gm-Message-State: AOJu0YzXv+MokkBpqLUOm05k43P+NW+5Re4Lhn6UbGp+nqugMzGfFxHY
	uhArKmx8FUmBSCK0c/9Vbp6ERx6abwxje5Rlw7H5yLsbTF9ufglB3s0M
X-Gm-Gg: Acq92OFLV91Eky/mFAkF9dktYo+5AEftsC29cH9YKnv1zx4Es+J2sFiKn/rZuKWKI0a
	Ea0woeDSxTbZpuHTTd0widMsf9DZhWJf1iFI9Alrkwca0/w3F0KVb9UXHbSiWMx6dOcfU39Mtb2
	tAaAS8Q3q4qUBn0WVjtHjC4vzjoH+L6TF5Hbs9jSLi72BVJz3hTR34DAGmodtjkUbUlSTl7ykGd
	E7gf7MpPWntiSX9DkVNfyFot3hueRZ0VE5DRS4jTzYVfyU0sSVCJt/z9uC2MQVvjdNyK0/0bhkL
	fCtDBPrrD3GYjiMIXpGMlgAsx0uYd96d+mPQJ430A/dXqxyVHBRw/djzmRLJ5ldzrJrUD83BEik
	LYdWfLIfnpF9b6VHSZVSyr3hDaYqO1gHixzjz7cn3OyYE1SuzXOmx5uSt8Kui9H/pn3EkKsOxjv
	OCQ28e8sQ8Uh8MyAHyiExP09Wb028P9ASx5sXhfg==
X-Received: by 2002:a05:6a20:3c90:b0:3a1:90fd:dcd6 with SMTP id adf61e73a8af0-3aab16e9e2bmr7224406637.31.1778320699201;
        Sat, 09 May 2026 02:58:19 -0700 (PDT)
Received: from ultimate.. ([58.84.60.186])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be55sm4045885a12.1.2026.05.09.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:58:18 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Sat,  9 May 2026 15:17:41 +0530
Message-ID: <20260509095713.5818-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Epson RX6110 Real Time Clock devicetree binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v1:
- Reuse common SPI peripheral properties
- Drop redundant SPI-specific comment
- Remove unused labels from examples

Link to v1:https://lore.kernel.org/all/20260504183728.27412-1-challauday369@gmail.com/
---
 .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 ------------
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.yaml

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt b/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
deleted file mode 100644
index 3dc313e01f77..000000000000
--- a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Epson RX6110 Real Time Clock
-============================
-
-The Epson RX6110 can be used with SPI or I2C busses. The kind of
-bus depends on the SPISEL pin and can not be configured via software.
-
-I2C mode
---------
-
-Required properties:
-  - compatible: should be: "epson,rx6110"
-  - reg : the I2C address of the device for I2C
-
-Example:
-
-	rtc: rtc@32 {
-		compatible = "epson,rx6110"
-		reg = <0x32>;
-	};
-
-SPI mode
---------
-
-Required properties:
-  - compatible: should be: "epson,rx6110"
-  - reg: chip select number
-  - spi-cs-high: RX6110 needs chipselect high
-  - spi-cpha: RX6110 works with SPI shifted clock phase
-  - spi-cpol: RX6110 works with SPI inverse clock polarity
-
-Example:
-
-	rtc: rtc@3 {
-		compatible = "epson,rx6110"
-		reg = <3>
-		spi-cs-high;
-		spi-cpha;
-		spi-cpol;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
new file mode 100644
index 000000000000..b51d39ef75e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/epson,rx6110.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Epson RX6110 Real Time Clock
+
+description: |
+  The Epson RX6110 can be used with SPI or I2C busses.
+  The kind of bus depends on the SPISEL pin and can not be
+  configured via software.
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: epson,rx6110
+
+  reg:
+    maxItems: 1
+
+  spi-cpha: true
+  spi-cpol: true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  # I2C mode
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@32 {
+        compatible = "epson,rx6110";
+        reg = <0x32>;
+      };
+    };
+
+  # SPI mode
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@3 {
+        compatible = "epson,rx6110";
+        reg = <3>;
+        spi-cs-high;
+        spi-cpha;
+        spi-cpol;
+      };
+    };
-- 
2.43.0

