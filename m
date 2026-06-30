Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCFE40F8C4
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823755; cv=none; b=VO7eUwWoDMC6fwXmfXFzDuqqWyyXgoc6KtQb3dm/E2HKReHKR41CfWJ6wPaLIlCwPr8WVtmNv+uNsn7oDZKBXg1WSH49k1t+4dObIGbIWyAt2b2hHsmEsYRkvnQQZYmChSZzWK7UdV5i1GMXMweQT5m9FSUpw08YMEZb9g0miSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823755; c=relaxed/simple;
	bh=AxLilXai7kh8n+gsv1ff3xUSbI939G7Kn5yFvMnrzsk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eX78OegVCGxF/y45O5exEvwKe9DdH4Lw1Nh1dqR+v9/XY/zwyURyFYqfMwu2MvFxRMNEgnmWzdSz7SEQS5QSySz8wvfwjxTYqhlmXAtKHYKk43hyNJXsC3iSTf4yCbSYLv8QQWLrAV7QAwyTApd6JmEjFE+UuwkVfdIc0SPlMjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxnzgIGt; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxnzgIGt"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso444928f8f.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782823752; x=1783428552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c50dCF6Rd+MbSNOPXAWDKotK7lnVsUArlHEFScFI1o4=;
        b=VxnzgIGtm43/I/J4iXSQ0O4ZSOzIzkioZtkgZV4oq3R61lPMNA0zi8Uz1vXZaoJu2I
         122MsZwjfMseWmBkxWnXWrO5qBlWFFD+Oa+HNL1XYt9YC3xWQ5XxX+sTSyMAqH2XYppI
         vL0XgnJNXx/kCz5RA6b8/wTqBdQHlDg9nVxgcn4m5/cnTmHmGqrGxaUYN1etlGChRG3w
         jQfsM9Xpdo5QzYlxOs41zgamIp0YKi5Kgs5HxzTUZxErgV/j4Q5ptz2QR5iNimaF2mSg
         cnHCAOTh5DYLnekwlPjFXojFXfYEbb6IuRYUegas8ZyykiamFhgPYQWXTosfKzbSNsHv
         b88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823752; x=1783428552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c50dCF6Rd+MbSNOPXAWDKotK7lnVsUArlHEFScFI1o4=;
        b=aqsONUIBDmWYaE2dzMd+e3fi8gBdU0MOYRGA1dpCMWnI6AdSItcy0a5yrgjaipwcNv
         rlFXzeW5mqwNAPiC8vBexoDV9w9Ht5jVO2NKLUhn9/vdCjJWd5Sm1j0e6xmuz/bJyEew
         i3HQqpOLwBvJCqrfS83NTMjkQno3ZBuW083pr7KQsTtA3Et5mmnrGV6+LTEVanmxSteT
         xm7hcXtTvvlkOSEdGlgoKXicyQQDAp+jIgbpVxrTW9s5iqOqeCBchGkEZteSoMoSwydi
         vdjo0KFHVXateuqDGN0ONBC7X0+UkBKNFLIJfwDyMCuMczkv/dI9pVt1ywEZgjzTmonQ
         k4gA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4GPuydjpYXzncpTCr9c0ktm0fvSDe5r73nxl+xayE7zlBMz4KAepq8QB1p4fG1MtaIWF9FaC7wky4@vger.kernel.org
X-Gm-Message-State: AOJu0YxaabJ42nqukMV3hvF2M6TQm5b1bAMfgCdajDU7+VRBmEfxs6DF
	qbDeBmFT3C4DX+RbDDvRgfZ41jRqWLfAGc0kOlESSa+tbzPIWTJ2UoMW
X-Gm-Gg: AfdE7cmyvStal0EilihpaaUm0GNoYowlK8sa1bW5EIbnKTFH5TFmjLGzeImTEWxEeB+
	TKDjK+qF5osDwI5zql1XRYs2E9BelfyJvHMPuwHfD83zwNSx2yBjQQAgVHV24udL8dJRe8dpqXw
	vK0O7eyShktHj7frCO5SY5GsS9PqvCuWiPqNiwJ/czdF8QitRK+mk/QIklh2W097y3tn2hL1vwz
	/Si4Cg16jHoaUBx1XDfHtcqUKx81nvSeWNqQZeWhKA/5xKVaopWiusuagftXYZ1f6HA8/LGoTnC
	sR24B8jpEu7WDMXQnu15FLXG1njrI4YljZnvBsVCJV5RfPSSHo+IhIZW/H2dP38ov0+L0J0/gT3
	h3LflbFCwUp+dDq6g3oLHmADr0zF5qBGK2pdg4cCKCaNFEn+GElXBDnoVw/sV7YVD9RJQzTlBPA
	kzTQmkBSYWooHPclYlNDul0+ng8HlHYfXj53oNxF8cZlmJ3vwKg4jYWg==
X-Received: by 2002:a05:6000:178b:b0:46e:7a27:98cf with SMTP id ffacd0b85a97d-475521c85f3mr4846155f8f.25.1782823752342;
        Tue, 30 Jun 2026 05:49:12 -0700 (PDT)
Received: from localhost.localdomain ([82.77.79.113])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm7004531f8f.32.2026.06.30.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:49:12 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com,
	egbostina@gmail.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: w1: Convert HDQ One Wire to DT schema
Date: Tue, 30 Jun 2026 12:48:25 +0000
Message-ID: <20260630124826.2992529-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments OMAP HDQ One Wire bindings to DT schema.

During the conversion, several updates were made to reflect actual hardware
usage and resolve dtbs_check warnings:
- 'ti,hwmods' has been made optional.
- Added 'clocks' and 'clock-names' properties as they are used in actual
  device trees (e.g., am437x-l4.dtsi).
- Added a second example for the AM4372 HDQ controller to demonstrate
  the clock and interrupt configuration.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/w1/omap-hdq.txt       | 22 ------
 .../devicetree/bindings/w1/ti,hdq.yaml        | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/w1/omap-hdq.txt
 create mode 100644 Documentation/devicetree/bindings/w1/ti,hdq.yaml

diff --git a/Documentation/devicetree/bindings/w1/omap-hdq.txt b/Documentation/devicetree/bindings/w1/omap-hdq.txt
deleted file mode 100644
index 913c5f91a0f9..000000000000
--- a/Documentation/devicetree/bindings/w1/omap-hdq.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* OMAP HDQ One wire bus master controller
-
-Required properties:
-- compatible : should be "ti,omap3-1w" or "ti,am4372-hdq"
-- reg : Address and length of the register set for the device
-- interrupts : interrupt line.
-- ti,hwmods : "hdq1w"
-
-Optional properties:
-- ti,mode: should be "hdq": HDQ mode  "1w": one-wire mode.
-	   If not specified HDQ mode is implied.
-
-Example:
-
-- From omap3.dtsi
-  hdqw1w: 1w@480b2000 {
-	compatible = "ti,omap3-1w";
-	reg = <0x480b2000 0x1000>;
-	interrupts = <58>;
-	ti,hwmods = "hdq1w";
-	ti,mode = "hdq";
-  };
diff --git a/Documentation/devicetree/bindings/w1/ti,hdq.yaml b/Documentation/devicetree/bindings/w1/ti,hdq.yaml
new file mode 100644
index 000000000000..aa539c7bb5f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/w1/ti,hdq.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/w1/ti,hdq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP HDQ One Wire Bus Master Controller
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,omap3-1w
+      - ti,am4372-hdq
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: fck
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the hdq
+    $ref: /schemas/types.yaml#/definitions/string
+    const: hdq1w
+
+  ti,mode:
+    description: |
+      Operation mode. "hdq" for HDQ mode, "1w" for One-Wire mode.
+      If not specified, HDQ mode is implied.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - hdq
+      - 1w
+    default: hdq
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
+    hdq@0 {
+        compatible = "ti,am4372-hdq";
+        reg = <0x0 0x1000>;
+        interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&func_12m_clk>;
+        clock-names = "fck";
+    };
+  - |
+    w1@480b2000 {
+        compatible = "ti,omap3-1w";
+        reg = <0x480b2000 0x1000>;
+        interrupts = <58>;
+        ti,hwmods = "hdq1w";
+        ti,mode = "hdq";
+    };
-- 
2.43.0

