Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94383AA519
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857807; cv=none; b=MTNz/9uDz9UHcq3YdvxXvg0mAypvEUivSD6ftpPcT2JpMJKpGZv+mVbQUxKcRcpNSgvr1CircR1uE3Y1geZ1Tf+oyeXx8ft6bAeEUEcspjAbmoOC3Z0AFZqbzxAEb/YfzwEBxKUQKvhy3u4BM0S9wHPzQRoLHP87MZ61xxFFlNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857807; c=relaxed/simple;
	bh=IAOyoOy+EjFLK/X3zhzuRtb8iwoi7ayaBAr+goBfAB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eB6/H0Ht1bXnvJdUgx6U8kZscrxgmYHt1L0uoEy0ARFvu/Kj+LYm9eGfzZ+faHZV4TYE2mCxw3HKgb0sbyOJRy2ThNiY1dhaXkoZT1fZGgNTdcykg2TUGZkXCmBMrFblWDuvJtEiKHIXIt9czi1kVTFyVoieLQRSYm6Whcb9yJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIVthQ1l; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIVthQ1l"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so675320a91.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774857805; x=1775462605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNbEamoVFrWEy3eDEJ2YhwcNGTuf+SgX6uLT44AchCY=;
        b=iIVthQ1lLCK4iI588FPVWzdsjyGn6EeQqwrpPZAaM60gp8zJFN91h51wiAfTQeq5DO
         cDC9CGgUFBPrceAQtwnJZWBxAg49eQrQ2a5BB3uLHHdbz2CGMrYfjD3mGlUJjwvjbnEL
         nwCHkzyjhe0idwVe82pR/O6cMkii+fVrUxcMlYAsa4tu3xkdelSiFXCF604sc/4r99Kc
         teF0LAIkMMEn3GJPyJkH090K6T+yo/XudNi4jGBXbV7RKimdC/2ARlOyfruhx5p9Dqf0
         BQUgN5f+a/f767XYq8gHossABFOPSLYqHjtPc3BV5BCTcw4Y4Ci9YKtTRAIKCiu8lzrW
         UhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857805; x=1775462605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNbEamoVFrWEy3eDEJ2YhwcNGTuf+SgX6uLT44AchCY=;
        b=rPJjKQvOCFdXNYcj6rrADSqZwXJTa+vHa5WK6nL+kKYB6CuitnoyWF6DKdhQYx8oP1
         28swvuYlHS99RUjc04HvNyD4O5VPl2q5e3OY7McFDKCAGjzJcHvARaBXypiunDrFb4r/
         ZoyPpYIShWypO4PYIFGWYmDU1lFXzRay0oGooErz2qv5yU9iYi1Rlhpm2jAQ5NkRS0Ai
         zutnRDzVjc/AXfv4rYiXegu6UTzICYUrm3zZR2KDdmG6edPenTJ+kWVIeDnj+QJG4HG7
         8IAG/5US6OFg8KWN1mxLnjwxcEGT3FQq1CkfXBF2zHmApYRlUTUque1AKBbYuGXhrHzF
         NUPA==
X-Forwarded-Encrypted: i=1; AJvYcCWJi7fUIDCfz1EtIOnymbnFqZI3DPMHT6VvxtgUWctsZMc9kNHeY3KtT/0YVqAMC/nRnbTDWmMDEuRV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+2Zyajd84I0WFS8/xRaWSl730FbFNXItcg1O8toiMko1JYAPT
	u4Bek4ferE0L8Gv0Gv1MOx5ZfGM+L6mpBKniIDCO6gzEL+4h6W96XWIg
X-Gm-Gg: ATEYQzyoSV0BW5VTWY2IibU8plZFL94XkzO+tqVslC9LtxL/UrP4SJefq3G2UkBpUWI
	oOZUinWManxL76Z3u3NXYqu47D8HqUIhmdumOrbgIWPqG+HMVr2q//XHLkhK0FGTcuDd+0jbeC2
	5hm9BT7Un0N2xp6uYo6Un/p57vb7833WQp0jFSo7Bre36AhfidPtftnSS0vaq5DnSOHvy0WR5kq
	FlZcvcMcdZzKDIgP1ReSIYisqr/cqrUvxGf9bUFX5DziCBdubEEOv0fUkSYHbNiO+hzsjXs7ljR
	xLHJG+VHiEVeJcCwB/lFNAghN894k5DiL1rLu4TUEc88ZVhjJhLA2ui4uktxsOlc+XgB5vL+2ha
	VqUGiGBUl81apHi8b8bnPonZBf2nHDJkf4ZseN6d67wZZJF9hyD6+2ao+OV1rThYn3+kMfS/Cxn
	6ms9MEaTaiikPtO3Smi+8=
X-Received: by 2002:a17:90b:3c10:b0:359:8d0d:5905 with SMTP id 98e67ed59e1d1-35c2fff1fa6mr10657290a91.9.1774857805193;
        Mon, 30 Mar 2026 01:03:25 -0700 (PDT)
Received: from fedora ([122.173.26.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950b5583sm6204597a91.14.2026.03.30.01.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:03:24 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: linusw@kernel.org
Cc: brgl@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rric@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: [PATCH v2] dt-bindings: gpio: cavium,thunder-8890: Convert to DT schema
Date: Mon, 30 Mar 2026 13:31:08 +0530
Message-ID: <20260330080108.24294-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Cavium ThunderX GPIO bindings to DT schema.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---

v2:
 - Rename schema file based on compatible string
 - Wrap commit message body as per kernel patch guidelines
 - Use appropriate maintainer name and email address in DT schema.
 - Change commit subject as per guidelines
 - Fix $id path
 - Rebased on linux-next

 Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
---
 .../gpio/cavium,thunder-8890-gpio.yaml        | 45 +++++++++++++++++++
 .../bindings/gpio/gpio-thunderx.txt           | 27 -----------
 2 files changed, 45 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/cavium,thunder-8890-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt

diff --git a/Documentation/devicetree/bindings/gpio/cavium,thunder-8890-gpio.yaml b/Documentation/devicetree/bindings/gpio/cavium,thunder-8890-gpio.yaml
new file mode 100644
index 000000000000..0d42ddaeb23a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cavium,thunder-8890-gpio.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cavium,thunder-8890-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cavium ThunderX/OCTEON-TX GPIO Controller
+
+maintainers:
+  - Robert Richter <rric@kernel.org>
+
+properties:
+  compatible:
+    const: cavium,thunder-8890-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+required:
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio_6_0: gpio@6,0 {
+      compatible = "cavium,thunder-8890-gpio";
+      reg = <0x3000 0x100>; /*  DEVFN = 0x30 (6:0) */
+      gpio-controller;
+      #gpio-cells = <2>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
deleted file mode 100644
index 3f883ae29d11..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Cavium ThunderX/OCTEON-TX GPIO controller bindings
-
-Required Properties:
-- reg: The controller bus address.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells: Must be 2.
-  - First cell is the GPIO pin number relative to the controller.
-  - Second cell is a standard generic flag bitfield as described in gpio.txt.
-
-Optional Properties:
-- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Must be present and have value of 2 if
-                    "interrupt-controller" is present.
-  - First cell is the GPIO pin number relative to the controller.
-  - Second cell is triggering flags as defined in interrupts.txt.
-
-Example:
-
-gpio_6_0: gpio@6,0 {
-	compatible = "cavium,thunder-8890-gpio";
-	reg = <0x3000 0 0 0 0>; /*  DEVFN = 0x30 (6:0) */
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-- 
2.53.0

