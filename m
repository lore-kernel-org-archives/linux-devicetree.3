Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE36383320
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910326; cv=none; b=Ma6ji8Pwmt7M56r9zn2nWQZlG4EpAFN4+qmHNyS5Ijh9X+5dyaFf2+wuoNO0yu0GpDSp22bMEK3HkHxRR8TuHYQTMMmsWU8lCvJj57Fs1mUwsWg4q1HPKBb28qLdWoeztln1XWlegbmgF9SUGRwa2A8EotNMv9ew7QaWbbuDmOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910326; c=relaxed/simple;
	bh=QRhVBSuXVEoQIY3bGLpzbuEnhuAMXEhnpVZXREUzxAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chkx9CWQhECYPkgQLo/ReLLJvo0NThKthrhCADomCnDC09Ttbrrl2Zmv8OTDzOSwNfg8r993JKrW8EbJFps4Qbl3dJJOcPoexf7Xzjr7qwS/n8823jugbEYAIHIwBECfahI0T+pd/eJC6mcPImChJ29X+maLmoAigbvPB+Y2GCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmhdF5tc; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmhdF5tc"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbb7926836eso455491a12.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910325; x=1785515125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIveEnsC2i4BV8ze8aVcBp+MK1iWZOOv1jA6qIdT6uQ=;
        b=NmhdF5tcjEnk83tCdriS199zsfUSXWnwFS5232BmzC3qpDrUGtcTXiT2GMyoth4AH9
         heokU014TSiEz+jceo+acAtaFXyEy2rj/lNuamP6Ufyf0bhtpqcAVHPdQLp0i1kJmb40
         vyAwVAgXY4bEdiey582Pwe+YV/Btkq+87NgMA0Ss4ibfHIK4cxfrnY/Xr/fcfXbLYMYs
         TwmYITUM8UATzM3HNI4DuWLVMREXJJ5LBsVXfV0Al0IqkKe1/wwQQtQvnnSOzo0z8/JL
         LTD4WldM56ZB1da4JKRBMSMd0N6K/ZEP/E+kDJ6gzZ6I5zmtjIZv80MGyHERV+VK+WkW
         S+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910325; x=1785515125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIveEnsC2i4BV8ze8aVcBp+MK1iWZOOv1jA6qIdT6uQ=;
        b=FJ9dELKe/h+THwkGPG/ABwaKYQUniA23LfDoNCs9WSwmJ7X2b4QC1eDHauWSkOD2aj
         2oUgHGxVrt+xNujedJTkfibcfETs4Dj5c4Yki92L8NWtB+lkUjNrgT5m9L5A6PE94V3Y
         2DUQB+u5Cwr2EPpw+tOm03nFUrhGxFKfC6P+8/YtNUq8ZpBca/O75+mgk8ttHgzBG7Gh
         pmUTWXC/WISSfb0RFP0tNAj0CG8RjOhVepDZ8ZRoj6G+YSpQTvXO7yZ0qX61reRkPTP+
         UzON79YqHXdCu3PSNcFxqg4wuEwy1p8veJyNNK8xSej3Oi0RzjYTzhM4xTQAUtRwYjKo
         2vzA==
X-Forwarded-Encrypted: i=1; AHgh+RoxtEWy32s8riDIqX87yVa8KezdjJDVRgxH4agRfZuzpueJssn2xGDWmJU/I+DjkN2WWBNV01O/BqZu@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjIe030MvNCT5peYJvhmIVWU7EH9WFRwQxppcbUukpcCcLSQw
	pZP6zIQXcpuwd0ND+TTvf1GHQelXJjBLUmt24Q+lqL7Tcl6/y8Omm/zR
X-Gm-Gg: AR+sD11EhvemrAgkxwTdaVyzTwj+kZKa5lVIiLLf9iOkqL0qg/8CVQgRTNy4wsm8fkk
	uwvI+15QZzFgEghg6Nlz6GGm2+dhxdPQW7NnRap6VYndgYaMmg+X1XNYbeCbrY1BeToy/aG6n8b
	RdhbwKFANn33jwYZZW1Ny7Vt/lPPaMAHZS3FvkOVShVxnri1ldDlgAB36v0P7LUme6u3OTQA1Jh
	lm96K5rVK8EKQNKqESYAuhy+j5i4v6UIEHSwCX8y1R/1K+mzcsIv47GS/oAvdZ3r+M860au2iwm
	3TdnzgxsPTd7z2q8RMUAqhVUdCeNLlvZ/YIzzLTg7YZ7rV/3UBMCCpCiS5JTE7cukPHs2GtmbaE
	QgLU1f+Hf72Nh13uN8RrQIAguvvTIxEJu+wN5P7ES+7Elx+mU+QkRHW42yU4OyrccC+DOSCHwWz
	8UXJifboQ8bFN6Kpls6LgXbaURlm5XX+t1/LPX4S/eX/mWByBY6kGPeHwtF2SblXSIv/1CxSBId
	MDYriwC8AM2F8nyyw==
X-Received: by 2002:a05:6300:141:b0:3c3:a1a4:862c with SMTP id adf61e73a8af0-3c44b2680b9mr8889730637.68.1784910324540;
        Fri, 24 Jul 2026 09:25:24 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm1323838eec.4.2026.07.24.09.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:25:23 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	simon.guinot@sequanux.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Fri, 24 Jul 2026 21:53:32 +0530
Message-ID: <20260724162332.32291-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,ns2-leds to DT schema.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202607231542.6ovJrInT-lkp@intel.com/
Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v3:
- Add optional property num-modes to the schema.

 .../bindings/leds/lacie,ns2-leds.yaml         | 85 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
 2 files changed, 85 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
new file mode 100644
index 000000000000..2138c75c0413
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-GPIO LEDs found on Network Space v2 (and parents)
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description:
+  The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
+  modes are available, off, on and SATA activity blinking. The LED modes are
+  controlled through two GPIOs (command and slow), each combination of values
+  for the command/slow GPIOs corresponds to a LED mode.
+
+properties:
+  compatible:
+    const: lacie,ns2-leds
+
+additionalProperties:
+  type: object
+  $ref: common.yaml#
+  unevaluatedProperties: false
+
+  description: Each child node represents a single LED
+
+  properties:
+    cmd-gpio:
+      maxItems: 1
+      description: GPIO connected to the command LED output
+
+    slow-gpio:
+      maxItems: 1
+      description: GPIO connected to the slow LED output
+
+    num-modes:
+      $ref: /schemas/types.yaml#/definitions/uint32
+      description:
+        Number of entries in modes-map.
+
+    modes-map:
+      $ref: /schemas/types.yaml#/definitions/uint32-matrix
+      description:
+        A mapping between LED modes (off, on or SATA activity blinking) and
+        the corresponding cmd-gpio/slow-gpio values. All the GPIO values
+        combinations should be given in order to avoid having an unknown
+        mode at driver probe time.
+
+      items:
+        items:
+          - description: LED mode
+            enum: [0, 1, 2]
+          - description: Command GPIO level
+            enum: [0, 1]
+          - description: Slow GPIO level
+            enum: [0, 1]
+
+  required:
+    - cmd-gpio
+    - slow-gpio
+    - modes-map
+
+required:
+  - compatible
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-ns2.h>
+
+    led-controller {
+        compatible = "lacie,ns2-leds";
+
+        led-0 {
+            label = "ns2:blue:sata";
+            slow-gpio = <&gpio0 29 0>;
+            cmd-gpio = <&gpio0 30 0>;
+            modes-map = <NS_V2_LED_OFF  0 1
+                         NS_V2_LED_ON   1 0
+                         NS_V2_LED_ON   0 0
+                         NS_V2_LED_SATA 1 1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-ns2.txt b/Documentation/devicetree/bindings/leds/leds-ns2.txt
deleted file mode 100644
index 9f81258a5b6e..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-ns2.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Binding for dual-GPIO LED found on Network Space v2 (and parents).
-
-Required properties:
-- compatible: "lacie,ns2-leds".
-
-Each LED is represented as a sub-node of the ns2-leds device.
-
-Required sub-node properties:
-- cmd-gpio: Command LED GPIO. See OF device-tree GPIO specification.
-- slow-gpio: Slow LED GPIO. See OF device-tree GPIO specification.
-- modes-map: A mapping between LED modes (off, on or SATA activity blinking) and
-  the corresponding cmd-gpio/slow-gpio values. All the GPIO values combinations
-  should be given in order to avoid having an unknown mode at driver probe time.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-#include <dt-bindings/leds/leds-ns2.h>
-
-ns2-leds {
-	compatible = "lacie,ns2-leds";
-
-	blue-sata {
-		label = "ns2:blue:sata";
-		slow-gpio = <&gpio0 29 0>;
-		cmd-gpio = <&gpio0 30 0>;
-		modes-map = <NS_V2_LED_OFF  0 1
-			     NS_V2_LED_ON   1 0
-			     NS_V2_LED_ON   0 0
-			     NS_V2_LED_SATA 1 1>;
-	};
-};
-- 
2.55.0

