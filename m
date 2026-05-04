Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8803E6383
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919928; cv=none; b=JoN47Ng00PdnbMlo3jQT+OqaGRvBYl8UdvWHJv22Pf+E1AViH4uWgm3TcL8FDIl4F6YXQuGqAJAGrXHUsSAuD1x1gSSH8mtQBe71KNftRhf9jBJf2zapqmuFqfBuLG0FYZHxQh626j0OAjcxnQbcq/RxE4a6uwEIkZcJAdd/AzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919928; c=relaxed/simple;
	bh=cqrHsnBNkdOUMEzGFgAyYwYIEH5nri0S1YhnbLjXb+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sdWWj1bjBljvDTfh48SzJdShc26vvFnHXxQTJe/i29MlyGiv/rXUOXNVTt6gmdR19thtvuzowi2pRe9j6DarSyg/MWzTXLeF9WP2VlASEGY2VhLGZgc96QqDfsZT6NAH/ttULZey8Tm4cQZJrLYb7Tv8l/aMuIS0MWiMARRuxvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4GrXtUH; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4GrXtUH"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1442242a12.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 11:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777919927; x=1778524727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cu8NsIgkchVnkYXO/Xn6hCZcZRxaV6y1Wg1XrlN0f/s=;
        b=h4GrXtUH2MWxTYhAIbhU3lLSqXAQyVnGl3Q8HCG3VD4S8sEvxIuEr3dCrGWrtsFsBO
         gjBu2JdtbSnXQrHQLDo4rjUaVDA8TTQ/Zf9+EQNut6NHHUb/iIryenIJ8FK8LBsXCt12
         tBj/5z1Xm2QnjfL2xF8f8alaBuebULuJ/090k8L9eMJ6yqnkuwD1Q0KHf3uGjx04uBID
         Lv5AlvesKPiIa5dTzRnrr/iN9vG1UqNa/syq60ohC8kn5wz4j2C35ywKcPm54ieB70RN
         7Luu6EZJeD0WvEGvd6kVihxQ47586eWihWSdgd22hA/rpkCio2Zce7Da6X05uOO56CQ4
         ciGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919927; x=1778524727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu8NsIgkchVnkYXO/Xn6hCZcZRxaV6y1Wg1XrlN0f/s=;
        b=HWtEm0/qgA0Xnx6gNO5pPXdc7Mwlbduo8Jl5cwyF16SZY67aUE+Z/7o1bmP4RJpcQT
         qbgc1J0n2cyZkwTQDa5PjeOWVuIzeEkoOjeDvWPBms2uu/+w98Q9nawjWLdt59tk8D2u
         dXdObSWUeNrLV7QC9faCdAEWdk7X1B5j86nXjjobB/ZNzBTfNe9ty62T6EKqNeLfmf8I
         EWmjTr2uU4TINIu1NDE9Ide+iSfmKc7B6fsXt/VOB1tTrVPH8f47Nik7ZlL5MqMMxomU
         oLAe/wVxYZi45RVYGjhFmAqtPhz3NcYCiOj5VS6dRh1sRwywc+L6LRGM1K8SgWdy11p7
         p5ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tM5DTu/GcPTxE8/nAHcD1lXDFLaeGCwqlccRab5g2Och7ynMwaYVXW/WfbJLYEueqb5IURN4P99rl@vger.kernel.org
X-Gm-Message-State: AOJu0YywC5iJWOMiajWY4RXElGOFP/rXFkPtKSOPHnmZgCHsH4A9DeEi
	WwCoi4cv0efrDamPmLiLoqMX+sjPyRtNtdvr6O8tMSEuKoZG/yXwTdiE
X-Gm-Gg: AeBDiet8NWjOEiSl1cdVpR6610TOd8F7ghXn1h9T1Ixsv9jTvMfMNskhmdjNPYfw3rF
	E0Gfr66p5sAPnx5fACMtf3mZTYdIWWW2v54+gYM3+sryORtHc3bjqqJ9261PiU/r4t7m8AmZupN
	C+/ZylhAF36PgEBDrYHAMkgj+joZHQcM+xMVurj6/GwyazR6fOmV+D7hCfk9Jp35ByX/JZoB1EP
	slIWBJll2jtOgutzAeZHzMkcSkw2OeRi/hH4T+YuWwXmPqizaIpCuDJDv9xgkbNmldeJ00O8whe
	xK81//BmQLih64iPHpMUJ+sqYQi+FfGT9PTcWYrDEWear9fPJHeDpGoJG/6dbutqcpp/AONhKr1
	84hqkTVOw0AChEdjok+PTW+W0IlKvsa+UXhxrXixthmsIQf0X8ZWDees2cT9DjpOuReq2FJV/F+
	Th8/7h/UCMp9i2FTi1bJJ8mEVQ6gqrwYdWJdgOi4ZMXNoVO3V1
X-Received: by 2002:a17:903:2c8:b0:2b2:d09c:c07c with SMTP id d9443c01a7336-2b9f285243cmr100855555ad.36.1777919926292;
        Mon, 04 May 2026 11:38:46 -0700 (PDT)
Received: from ultimate.. ([58.84.60.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae4fd16sm139392735ad.69.2026.05.04.11.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:38:45 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Tue,  5 May 2026 00:07:28 +0530
Message-ID: <20260504183728.27412-1-challauday369@gmail.com>
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
 .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 -----------
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 39 deletions(-)
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
index 000000000000..32d15a014f91
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -0,0 +1,69 @@
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
+properties:
+  compatible:
+    const: epson,rx6110
+
+  reg:
+    maxItems: 1
+
+  # SPI-specific properties
+  spi-cs-high:
+    type: boolean
+    description: RX6110 needs chipselect high
+
+  spi-cpha:
+    type: boolean
+    description: RX6110 works with SPI shifted clock phase
+
+  spi-cpol:
+    type: boolean
+    description: RX6110 works with SPI inverse clock polarity
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  # I2C mode
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc1: rtc@32 {
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
+      rtc2: rtc@3 {
+        compatible = "epson,rx6110";
+        reg = <3>;
+        spi-cs-high;
+        spi-cpha;
+        spi-cpol;
+      };
+    };
-- 
2.43.0

