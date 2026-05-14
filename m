Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6D630FF27
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778780354; cv=none; b=lfTWgRhhM/i/4cy1apznMzXB1XhzoUvnGcGe1A5oCS9i0kgJD+ZmbP/m51FJ48YdvXqCbnk6N8SQURFzT7Bo3VHpUOHIRN04OxwI+l4NC4n+HWDS4b0FRipCoY/X2SSHjfRikPJoubLiNViV+qQh8K7tBk7rkgfU+dibwwOmupQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778780354; c=relaxed/simple;
	bh=8qCAdLHW0851OwVJ51V1JECzXkY9eSPFZ4kSDfU9Vf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JbJDWtq4sSkujNH4pCoBYgUGk7yF1QuZWyGzbu4a8xTFTTJURGQbV1PCHtfQ09aNEseq/Hap/NXxUoe7gbIPQ5dOB6MUJs++ivLpnJ3Npu/3iDRcSA3dwxW2nzzEUhrk/VLWpOrOz7jezyzpslpocS5icFlGVJA3RLBEBUX26fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNS7kQUl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNS7kQUl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bc7b311e77so561625ad.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778780352; x=1779385152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuVg/btevpEI3G6fDRzlICOaAv8x5JhKdoYPDB2ISDI=;
        b=tNS7kQUlmDyJ3JcoDrp6Ne0ACBrCOVhiYrrQtY5DC+RF78DA/OTcjnOra2y0KPlHIk
         rGLxyz6nBpJY/vDmpnPGdonpC650mVz7o7bqRX7dfqesKrIehkdzS4YOxoHXCwiKxv2J
         YoM7lZFn+W7wGtRP0IVHzF4tL6utacNAWqZ2nRZrVflHj2H+MPh85FsJ1nmFohnxavwu
         sNxtSODIFtY5ub56NiHMwQDrD7u5lR1aJFusv5LNcUIARP1YrDvilVwcwTEj0Ih/UgR1
         wUpEnOz0G6TkOzONyiVf+e52iuCYCtlKvI883KAHD0icr3ajFX3qfxZPFN7IimgufQLN
         WxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780352; x=1779385152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuVg/btevpEI3G6fDRzlICOaAv8x5JhKdoYPDB2ISDI=;
        b=B9/aYE3rtZzJiGnwcrLnoKygYzfkeOe36/4zWmL/xg/pAtT+b2wK30X5fr/j8GeEHg
         nmKJL0XIJkpWHeXCeKSk4DpyllXRw/proso3Ar7YAt0epsYhbOq1d9EpabmVOFMUSZG8
         LG5eq+9a+IVPiTknlIRSJitPYDrzZvTM7HMR1yIB5qyq8WpTO4W+/KID1ocfoWeTYMfz
         yUBEIghVxtA6Q21jUaxoe7/4bmV/O+scuyWHLL2JGRPHODmvWJBArCW7mU9pZ3DinZo7
         Mte+dLCcH98Lh+fLNjasfr2hH9o14FgMoTk0vxauf0JTnJqJzPVEsAEjtvTZsKVdTgyh
         OSSg==
X-Forwarded-Encrypted: i=1; AFNElJ9OsIUxS3yJBc0LTdr3+8jaZ313/DZgLtZsh4BD9cuTZH9F0H2FOnY1uYcWdopP67/SUTt/eYK3ovZw@vger.kernel.org
X-Gm-Message-State: AOJu0YxW+xMGnPc4XuuH0hvmfqRkJ1aV/1V0c+Tj60U/fQwwsgD/HL3B
	O5MnDdhQD5s7fxwD6mL1Hr7fhSMTYmCTcqWZOv2E41B1UiT1ybOxoWx9
X-Gm-Gg: Acq92OHs4HkEF4OTTaNyvn5t7PSvyr6effbpIrMXwMVHa2w25lhwiAgFnIXga9Ucnx1
	l5yzHQIP/kCj4DwtRmz6Anco52TqK2u1NR9/q6Ttyu3cGonwrlB0pzvh4sIgwQrqu12Q9BH7+TR
	vEm/G4ozNLTrUWdwzl9PJpbl/qHqBaTSut9rPvX26DpDpA3h73ZxCOrbv1MgSpMtIoMcP6U0A/L
	9NxE24tyktLg/oTHQEix8jTgr+myL3Ylb5738mMuF+PSC3F/9miwqHNF2MNI814uhJ7Fx/+D4Bm
	pzd75iMcA+m5d8UY9kuq3XXyC3yoa7CVMK5NpVGYjnplemERAX07QfEeGa6nPPh5NsFXJkJFJ0H
	ER07Y5MSTKleLJWnZx4MCG6+iy/zdXqtSUtKhfzzMP11uODNjyB+L08+1PkdaxmpZhfxs2Yyhbg
	zlZ9KSU8rNRKNWACIQn6jQVeSdg4mGkAKf52vsIw==
X-Received: by 2002:a17:903:2c08:b0:2bc:8e7d:3dce with SMTP id d9443c01a7336-2bd52b54312mr40934675ad.27.1778780351727;
        Thu, 14 May 2026 10:39:11 -0700 (PDT)
Received: from ultimate.. ([58.84.61.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2cesm33273585ad.14.2026.05.14.10.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:39:11 -0700 (PDT)
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
Subject: [PATCH v5] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Thu, 14 May 2026 23:03:32 +0530
Message-ID: <20260514173851.25088-1-challauday369@gmail.com>
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

Changes since v4:
- Replace conditional SPI mode properties with dependencies
- Simplify description formatting and wrap lines at 80 chars

Link to v4:https://lore.kernel.org/all/20260509185735.21557-1-challauday369@gmail.com/

Changes since v3:
- Add conditional validation for SPI mode properties using anyOf

Link to v3:https://lore.kernel.org/all/20260509181909.21871-1-challauday369@gmail.com/

Changes since v2:
- Reference rtc.yaml for common RTC properties
- Add conditional validation for SPI mode properties

Link to v2:https://lore.kernel.org/all/20260509095713.5818-1-challauday369@gmail.com/

Changes since v1:
- Reuse common SPI peripheral properties
- Drop redundant SPI-specific comment
- Remove unused labels from examples

Link to v1:https://lore.kernel.org/all/20260504183728.27412-1-challauday369@gmail.com/
---
 .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 -----------
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 39 deletions(-)
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
index 000000000000..55086ac7d1e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/epson,rx6110.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Epson RX6110 Real Time Clock
+
+description:
+  The Epson RX6110 can be used with SPI or I2C busses. The kind of bus depends
+  on the SPISEL pin and cannot be configured via software.
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: rtc.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: epson,rx6110
+
+  reg:
+    maxItems: 1
+
+  spi-cs-high: true
+  spi-cpha: true
+  spi-cpol: true
+
+required:
+  - compatible
+  - reg
+
+dependencies:
+  spi-cs-high: [ spi-cpha, spi-cpol ]
+  spi-cpha: [ spi-cs-high, spi-cpol ]
+  spi-cpol: [ spi-cs-high, spi-cpha ]
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

