Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16274442B3E
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786702729; cv=none; b=qr3GMgMGE8uzkM4zvv634yPBuqN+ia+DsKy9LyFyHG7PeMze1EAa95o2NFsZv0D6AppkaQAgekAAbsrBSnXhGfXppFa529wqiLC+N087oVPX71LevdjLFcOr7adUBmCWT4/zskGcCdJ3n7O1tcXKtQ2SkGlmtHRnkNZkmPlc9ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786702729; c=relaxed/simple;
	bh=GCnr4Mvm18woqcPyatGz9lyWobnOtJmYTMXDBVkkUVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TkrnNrtNW13SRviJ2ZQYC3Zdg9fr0kx2+uZbrA479OlnayGZ3xrZp4pPlNgCfO8MAFw8+0XqLFwX2AQ6++tV9QY4CQJYIFn8V/MQMMow8LaqaO8BVFCREXSuNh6bL6yZNknyWvWybE1LbZQum/QB3+ZkkEYoK8vOh+ylxbqw8Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSRNdY5c; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSRNdY5c"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccf2360620so8777535ad.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786702721; x=1787307521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SoVS6TyvWyTEmYUl+BaMNjP58PtMCPWRwsnVl6nfaY0=;
        b=FSRNdY5cUjftjEXHR6nwlsxaOEKsW1rKBmmdNZNYZbNET0taa+WJR9UkLTRgm9DTVs
         BufwmboZzKapO6Hn/oo2CIgszxvWpxKhLjBEVgMjdzPuxqMS6hrXfyaCzzNTWzn/Mlrq
         tzVQI6nqtcl1kV8hY/EFFSPrE8okFLZ6X7IsQr+Zvv3Sz7FptqEdgsMpb4xl41wlqjA6
         18EVEwe853+2e7s2XwCgMeVMjxCLMDksJtagBy8JLdiZoJ6tka2wYLchOYWExqqO9Vaf
         6mbqm8406Mi3ssn3ejybO36zvNOvNHoS2m23NfKrM2vQKF9WNnayZWzUTwG49OkbydRq
         YChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786702721; x=1787307521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoVS6TyvWyTEmYUl+BaMNjP58PtMCPWRwsnVl6nfaY0=;
        b=om+WbvXhLVilek9YGP8shsA5Jc3EOLmasjo8tTvI9yUKlPnG/O5EM5skRPYq0Fk774
         vKHA7mDiKB51zu73YYmVFRcC59okPFsdzZXgm/DzyWTbj2SBYicSxVrOhTyraLzE+KTx
         b0ZJGVL/hjjyzkyIMBeQRx2E6oh3RaDIcGTP9Mkm+GqgPCzLeRVu4uchpEG6qbSpNLnt
         yKVQe7eB1Ou02l2fDF5H+8GIu7Njq5x6s+g3MFdhbBG/ZtOSreW9QR6jutpXwEMagu43
         xAgQh7EL1ejaGhZOD6e6flp7KQQ+jICYMWLSg2iuc87FGa9sInoirbGoxyH3LFSdZQhr
         0wsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPdYDpNPTnUtp90cNapda67WI3n5hSwkJkceXamuOs1hW/UUWnYT1mjutsDj4FxStDkb8mOvYl/e9u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8Me/26eLlL1XBS7IOducOPAV2YvL+SJ0MBRDSz08bqvnF/us
	TqBwoJ/DCxyfYC0iohxVqqrtO0meHXlN0c5rmv3VJxCzzKr/xrTEMYqz
X-Gm-Gg: AR+sD11Hb5a0WTGt5cLxzVZxozy3Sjw7xW7yW/h4zTxNUNgF3Kwk5NP6wPDMR4OFSxC
	AQ4KpN0NO819/Ok3/AbPdA2087u3bJf9LW0/lz+rpLWReuDihmSs0mxI9Sp9C1OsUG7eszpJteL
	m5e3PUKajCbJ441mEjOCHHOrkw8V5vRrktymgiKaZodmH5oiNtnAg9mzNlIe9OZ5Bj0sPe8WR8+
	+7l+jrAIEC5nSDagZQnJyWl4qazHevLG+JfI3kEHYFwp6fIRS7OBnoGyRW5BT1dcHB0YsV6OOWa
	tBcXXTeAFu6Fv0xGOphcQItswvGD7aW7l/4vjcnVo4viIwOj+f13z8udP84xSi7PwPUMTujGaEs
	/IXKChMX1tgM0xOsKNs5vo4e+CFdB06JhRWTdxbeMhaDCaxBkuJ4ntmqgejqexEeAgm+03kM6sU
	hb9teFjg9vzSsFRODcqKxwGXwni8/ucEUka+mtPQt72PkQ30VNBHzIVMoYVjmMyipZqFb9PQrl1
	JiUraw=
X-Received: by 2002:a17:903:360c:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2d3b0d5e37amr51097825ad.15.1786702720815;
        Fri, 14 Aug 2026 03:18:40 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:97cb:44f1:865e:4c69:6423])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc81a6sm7393685ad.72.2026.08.14.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:18:39 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3] spi: dt-bindings: microchip,pic32mzda-sqi: Convert to DT schema
Date: Fri, 14 Aug 2026 15:47:33 +0530
Message-Id: <20260814101733.46406-1-challauday369@gmail.com>
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
index 000000000000..f684c359a199
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
+  - Mark Brown <broonie@kernel.org>
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

