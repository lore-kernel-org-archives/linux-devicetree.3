Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047138836A
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787675789; cv=none; b=PqW/wgo1tFaau2oZf34UlFyN6RCpy1/hv4g0gfrEugou/I4Y9Qfe3ZZh/+NHHm90qVaB1xO8JUgftLOGEJJWa0nDMEIpe0QNKUTmjM0KlQ0XMmgSDrGcfNqt7Kd2LcvK50rT0AT9fqHhfeQgVa2YhXQraYQjvAqEr0rnfm+SGwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787675789; c=relaxed/simple;
	bh=i8eodjsuIdPpCX04HGaCZ6BaFipCim8Lde/X299xfiY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IXZCrGdT4EosTCtWu7M19nTuAMcwG3xbYwn0ITbjycD0zkGZKErhk64zF1mmEu3O5CywSSv6j5cL65LOPH7TYk3wIkI5s2o0ZeKhOFzPddr2J6CsG0LOv/E4yAPght/NBqYnBNppQPYjsLqRCThLqDv9uiaia0U6SUizpFDTuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpOx8Czy; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpOx8Czy"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84f77cc7302so16521b3a.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787675787; x=1788280587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wodm8m2zjhUXQujtK3fCFfHBkirwYTQboCwEV2qWqmc=;
        b=IpOx8Czy11N6uMsdJH25tG+zjCz8mTarfl58DnJ6rnPpwmslXbKLeqaajQnomXgckv
         mu9yW896fikk9wO6xVl9PJSCnO1IUgWvCIEYWE0EWrGvKhQD+RI2Lz+nXelnViA2bapS
         CN31c7si5ofDrvQfLQ2lYlB0qWcXWPKVqcllrJDPtdHM+aKrXh4IXnS3LA4ixNyH+9ne
         u/XIYqA2eJzJj6L3g6DARbJZ0QG6GCApUnAqayTNdzPDeto4uPPvu1u462CP6vb+ukxu
         TpsNVFvBSE/hL/Oku7dntQ567dXIuxTOdp4POfgU7qOZgIAUJzJVa4zdVJpgtHTkyv5d
         GYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787675787; x=1788280587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wodm8m2zjhUXQujtK3fCFfHBkirwYTQboCwEV2qWqmc=;
        b=PMUbRmsnzOB4LHLCJIxPKaYBd1iO2l8BHaFdquRtXSb0PNlzD/JZijDWgdcK6HkMOq
         KUdeRfI/9Jlk4cPI77ti7e5MzYZPlYL4EUyYcm5aVwz8dRawhj8FRkl9isXxtN2DeMh4
         GbtMWWFqILSoB1accXOPJAg0RcrW3vexGTUozHNhztzRZM9WJRthtK4Zs4pPZFdUcShY
         QX1NrXv67+6MIxNi/ZeuY1K/hXDJnGJaztjOb6BNm+7p7IuPfZUcX5TdJB+Yqi5/2x+v
         rNTYwg3/QKgJmVQV0gQuIdxoHhmRuhgo97q+RY6T4AfZ36VILCuRVs2A+edSlD75klZ4
         15jw==
X-Forwarded-Encrypted: i=1; AHgh+RpBNaR4omLOVf/12HrwNFjyKfppKRoOOxkgDiVthXMilDIF+SW6kv5D52Af4sJEtG9PqUz348MZBkCu@vger.kernel.org
X-Gm-Message-State: AFuF++kFvrD+RO9Ha4PiGIjmODxDLZxlOz6f9J29a54xFS5ngoYrmkRr
	bK/uT/BcFC8ZwDyjnz51oBRy5FNY0hiDNi4HhsGBmMjG7yt5wrbL83yF
X-Gm-Gg: AR+sD10rXoaGFXFXgAkwPxs3gKEz2s+yLOCMWbb+320bjLBdS/DxAc8z9vpo+MtwC8c
	80ngHn0/49FLbMeUtuPOuwhCy1gc+ZYkovqI3nMkryLTfuCEklJ840YfZYzAb3TpRVCce9H8tqV
	jKlKQdCCyd9NVJU490JtKcOd/bB9/Vu8wQ3dN7YREZeKe/Y+zjKaIroMtfU044w+RWnRrkwsU7g
	KbNP2GLAcWS75k7nifJPYEF1ABsIcyqDV1aRVsMeeE9RM+vOun9Vz+ePsxBPXyG6s2LiEsr7cPI
	LkxzrrSVTtnsZkv9fayOplSEUQ2RaR5EFaBnHkItetTbcWa5baLs+xFlgWl51030+/R2X8dn0L0
	ce//KexM3/9EEXORAIXtJ3I8wXhJxqD4uGZ2tIRULY1GgNKVTubsz5KGaX4RF+jVQL0mCU7FP5h
	dAxzyHXeXpb0D6P5vD75jcv3HQwYSU5krYCXF94CnaEiqibzw4SnRoTxX6fiKh5ujK8pRjw0KF1
	sAGqg==
X-Received: by 2002:a05:6a00:7488:b0:853:2e35:ad84 with SMTP id d2e1a72fcca58-8532e35bfd2mr3411792b3a.14.1787675786854;
        Tue, 25 Aug 2026 09:36:26 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:dfb:c17a:6cf8:3d2c:cd28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cdc03d6sm88527b3a.32.2026.08.25.09.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 09:36:26 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4] spi: dt-bindings: microchip,pic32mzda-sqi: Convert to DT schema
Date: Tue, 25 Aug 2026 22:05:51 +0530
Message-Id: <20260825163551.79603-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Microchip PIC32 Quad SPI controller devicetree binding
from legacy text format to DT schema.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v3:
- Update the binding maintainer to Thomas Bogendoerfer

Link to v3: https://lore.kernel.org/all/20260814101733.46406-1-challauday369@gmail.com/

Changes since v2:
- Change maintainer to SPI subsystem maintainer

Link to v2: https://lore.kernel.org/all/20260625060903.14661-1-challauday369@gmail.com/

Changes since v1:
- Drop maxItems and add items list in 'clocks' property
- Remove unsed label from example node

Link to v1: https://lore.kernel.org/all/20260624061329.130468-1-challauday369@gmail.com/
---
 .../bindings/spi/microchip,pic32mzda-sqi.yaml | 55 +++++++++++++++++++
 .../devicetree/bindings/spi/sqi-pic32.txt     | 18 ------
 2 files changed, 55 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,pic32mzda-sqi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/sqi-pic32.txt

diff --git a/Documentation/devicetree/bindings/spi/microchip,pic32mzda-sqi.yaml b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-sqi.yaml
new file mode 100644
index 000000000000..c8f58c506087
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-sqi.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/microchip,pic32mzda-sqi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA Quad SPI controller
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-sqi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: SPI source clock
+      - description: SQI register interface clock
+
+  clock-names:
+    items:
+      - const: spi_ck
+      - const: reg_ck
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi@1f8e2000 {
+        compatible = "microchip,pic32mzda-sqi";
+        reg = <0x1f8e2000 0x200>;
+        interrupts = <169 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rootclk REF2CLK>, <&rootclk PB5CLK>;
+        clock-names = "spi_ck", "reg_ck";
+    };
diff --git a/Documentation/devicetree/bindings/spi/sqi-pic32.txt b/Documentation/devicetree/bindings/spi/sqi-pic32.txt
deleted file mode 100644
index c82d021bce50..000000000000
--- a/Documentation/devicetree/bindings/spi/sqi-pic32.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Microchip PIC32 Quad SPI controller
------------------------------------
-Required properties:
-- compatible: Should be "microchip,pic32mzda-sqi".
-- reg: Address and length of SQI controller register space.
-- interrupts: Should contain SQI interrupt.
-- clocks: Should contain phandle of two clocks in sequence, one that drives
-          clock on SPI bus and other that drives SQI controller.
-- clock-names: Should be "spi_ck" and "reg_ck" in order.
-
-Example:
-	sqi1: spi@1f8e2000 {
-		compatible = "microchip,pic32mzda-sqi";
-		reg = <0x1f8e2000 0x200>;
-		clocks = <&rootclk REF2CLK>, <&rootclk PB5CLK>;
-		clock-names = "spi_ck", "reg_ck";
-		interrupts = <169 IRQ_TYPE_LEVEL_HIGH>;
-	};
-- 
2.34.1

