Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5AE43E9C6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514015; cv=none; b=SzpztiVCh8RzL5ix70SHag025kv4UJOqu9tJfcBhr2mbjr2U5FpGnxp+0kHaDlyjNDSq0EeMN6s7UCxcJZmmm9uWpB8I/GTbMTK1y/LoKt1sFfuKf7nFfB9/yOiVRJzN4eGDXmfgM9ngRx9TsbrDRxzfGPaqayBFaafT34rPQuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514015; c=relaxed/simple;
	bh=X80VD+BeEDWgeBkAHdnE1UoBvmAMEG2lTMJ/lNSBay0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXM4ray7ODdTPALEytmUH4ldZsOnu63jOHN+Wg6CE5h4YGZNbF2cUExdAqe6o0Jw7l1+0V30qsXpNoTjHuxELII61AmvK8kNbdxYedWKEXQuJe226Q2vABZ2gRvPzdE6LVIKNmUl+mcd150pT+ATgYNFaEBWO71RHKrZXl9nnbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZaTOGEb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZaTOGEb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c00f74baso4158565e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514013; x=1784118813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltAZgPc2qTBdTDCtOOXVslMk/0yCzQbFFc7sQVr1uZQ=;
        b=DZaTOGEbkL610xFvIP64PZBxUJTuIqvUceqZ4fglDNwjWreuqr4GeetfNiXq8SDXj8
         ojW1ezvzgUwmasdtWST3F9YmCfB+rM2hni2WgUuiioMdlB7sqR/FunAQUKpZWEzCswCv
         2/7UTuQk79sTVRUIisJYzjsUBcCmJxkPSU4oEp1fFK922hfMKw6foK7gErSdWniB8gpj
         I1fu/2dfZYn3Zh+uIcads8rSZBtYGpS7taCwEZu67oGnLWizljP2ap+TOiRNLbVCi2yu
         RomEanEUtdBvUXSs/JpGKdQoSOy0+JK1RsLX1aZfiAfB0bhZ/DPZW0OyUusRelQft2HE
         GAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514013; x=1784118813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltAZgPc2qTBdTDCtOOXVslMk/0yCzQbFFc7sQVr1uZQ=;
        b=FHwxXYG10hOEt/A+OizRCL6qeAjoapbd04vvH5TJLUtrrvYEhfIt1RJz1Y3TM6cmd0
         FDmYEpyuLIvX/APfqaq/+HLba1jL0JO79iX2jaGluPnjO36srymGXECkamMoPL+QpjXQ
         7a907KzDpxnzeYIaL70THJql8fXnNcweSI/vgbVpOUp1x9wqeTxIdVOOfvnbdwRo4WIV
         cD7l1+WNrM5bLWKXqqiYqIOtnj4RTFzZX3qXZiwZ1dVFTFo5WQOCqv/zFdLSZK1WBG6y
         pWOBszVZzF2SHYpazJZt2mnqu6USS3/2PG+9oK1/waKvDtL3bkjhXyOFtvlZniIkuqJ6
         exXg==
X-Forwarded-Encrypted: i=1; AHgh+RpkVS+jFRmh7iW/Dvjl5biv1hB//8r9OKUgUWqOh7ObkzvQVQbFMGFaE4ogD88A56agTdN1XE9K6OJS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9JVzFdKkkwlPhZooFbfIl5G3spRxc2zbx7FiF649GKsqeg/tM
	Hcnudsj3hCmFqak/1llLfbhCmcBEr9lWEQA2+Yq2i7adtRXN6rXdKBFC
X-Gm-Gg: AfdE7cn50uNvRVW76iK5tY6UearHYdDLQ/plR6GfqATrTk+zPRGGlivE9RXtmLe9F8+
	zjTqrABybWOtHYUmqSaAkBtMqjwaPWOZmCtzJV8jlJvN0q8F/Dr6dmiRIgxqRpe0+SNCph1XBO1
	5Iy0RUdvLaP//AJ/OyvoKCMdekRUX08tiumx1L6T6evXuD/y8OybjSf93ucG6lQHMjX85lUzvDG
	+CupgeRbmh6KaJIBkjxZAASXQ8gXqxdJ3Ek1Rnt2c8NbyXMpX/j1cbt+xtozmasAlu9GEHrh/Uu
	6tg+aGnuQjKJ8snrB7m1Y5oi7aeQ6hNXrGtmX0e7klMAJQMEhrusktGZw6/zSmbKVu2pf2ie4nj
	0XjjSO7meCPu9GqJT1BflnB6U0LA0SfZAeh5ZefCbfcjz1tVvFySBlLzMBBCqpjSomlM/A/hXT+
	HTzfJuw1+XYFkOdy956eUTDm0dL21R25QCc+6d7SkuDlPjSJjp8HyJMoY=
X-Received: by 2002:a05:600c:8711:b0:493:c816:4b64 with SMTP id 5b1f17b1804b1-493e6892f76mr24414505e9.1.1783514012740;
        Wed, 08 Jul 2026 05:33:32 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0f5b811sm222873515e9.13.2026.07.08.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:33:32 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: mfd: Convert OMAP USB TLL to DT schema
Date: Wed,  8 Jul 2026 12:33:28 +0000
Message-ID: <20260708123328.1768794-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OMAP HS USB Host TLL bindings to DT schema.

During the conversion, ti,hwmods has been made optional to resolve
dtbs_check warnings. Modern OMAP platforms do not require this
property, but it is still required for older platforms.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/mfd/omap-usb-tll.txt  | 27 ----------
 .../devicetree/bindings/mfd/ti,usbhs-tll.yaml | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml

diff --git a/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt b/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
deleted file mode 100644
index c58d70437fce..000000000000
--- a/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-OMAP HS USB Host TLL (Transceiver-Less Interface)
-
-Required properties:
-
-- compatible : should be "ti,usbhs-tll"
-- reg : should contain one register range i.e. start and length
-- interrupts : should contain the TLL module's interrupt
-- ti,hwmod : must contain "usb_tll_hs"
-
-Optional properties:
-
-- clocks: a list of phandles and clock-specifier pairs, one for each entry in
-  clock-names.
-
-- clock-names: should include:
-  * "usb_tll_hs_usb_ch0_clk" - USB TLL channel 0 clock
-  * "usb_tll_hs_usb_ch1_clk" - USB TLL channel 1 clock
-  * "usb_tll_hs_usb_ch2_clk" - USB TLL channel 2 clock
-
-Example:
-
-	usbhstll: usbhstll@4a062000 {
-		compatible = "ti,usbhs-tll";
-		reg = <0x4a062000 0x1000>;
-		interrupts = <78>;
-		ti,hwmods = "usb_tll_hs";
-	  };
diff --git a/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml b/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
new file mode 100644
index 000000000000..78f7a109392c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,usbhs-tll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP HS USB Host TLL (Transceiver-Less Interface)
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: ti,usbhs-tll
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Name of the hwmod associated with the USB TLL.
+    $ref: /schemas/types.yaml#/definitions/string
+    const: usb_tll_hs
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+    description: A list of phandles and clock-specifier pairs.
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: usb_tll_hs_usb_ch0_clk
+      - const: usb_tll_hs_usb_ch1_clk
+      - const: usb_tll_hs_usb_ch2_clk
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
+    usb-tll@4a062000 {
+        compatible = "ti,usbhs-tll";
+        reg = <0x4a062000 0x1000>;
+        interrupts = <78>;
+        ti,hwmods = "usb_tll_hs";
+    };
-- 
2.43.0

