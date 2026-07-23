Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CFC439331
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801152; cv=none; b=nGyf342NQDwUyGtyGOYW4SkrPx0/3JNtJe534zhyGwqxxa/3JOOtM40EbG0jwlbcc+abMdQX9oXc0KESNRsxqzisa/K0DmBIPIZZIDzftuChawlKhPDETM6bdElZl44fHED6rFGcK1r59YMI/fxvnzuJRIGCPIEqHN/XzClO8Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801152; c=relaxed/simple;
	bh=lVKhuj6YAbNCqer3dUWbEH/eJk0pDX0SwDS421Uql4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZgJ4UL47/1JhQP3puqgy/n/ErN1xX3z221M4tmvciiSQ/t3sm6BRI6YAxlswMhDY1xDbMvtzCYsuZYgI9vv/po7xqu4kP/A1CJy3AwahV28H4KqAGOx0XU/zC5VNiLJCLrDShg+gvk6Z2kphyZF6Je8uWyoTj0GT39lk7oFUJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHYOU/hC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHYOU/hC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f71156e1aso232701f8f.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801149; x=1785405949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WaBzdPQvWsX6mWS6oo8cEv6vODAfYsHlpXHMfqMmz4=;
        b=SHYOU/hCZ9HFbuFrN2NolZdmDYK7jARBuzYoGtPZrf6I9rYrLTUrNc2S4GCFOlvink
         qk9JoUy45KVmU49g9Z0TJhF9ewtJu2R090W8UddbzyHcOdISgnEBZNgjrbdQTJvWDF56
         ipLNYeN9mLvr1PyJkXMPfFDcHG4ZcWU/MPAevHPGxfwIX2TtcVNA+4sQMSXS4m8csIJ0
         ADZGZemzW5lNjLIakbTNygYGRjAqAMjHxcY7UZIcEybMGS4n5U/dJak0MsLBVx6P+W/d
         rDjinFCXjzADdF0h7y8O1ugyXeqx3bDsA6xwSqDj43uDPzX5CNaG2ap8nIQ5TZCZ+j+E
         NQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801149; x=1785405949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WaBzdPQvWsX6mWS6oo8cEv6vODAfYsHlpXHMfqMmz4=;
        b=slqjOK+OfXdnPI19DRAUFGW7ylFw33vUwreLPxHE85tvE0tZKzzT971GpbwFy1GA7A
         B7LGisbsw7BnHMtsldkm0f4epknU5mzmTtPSluByfSDReiobqb6cmauTh5TdghBjTJLT
         4HmwlI6n3swE/lSkS86Ezh4riiVQLNppKfDR7A21kdIZeJJ6VGVQYTXXMk2XbwVianGh
         m8Eqba/CRMhAdAje1f9NP4NsAw1h9UlAPzQWfiWA1kUa2/80tPfBc5FRHowf4aGROpRy
         Dd7E8UZmF50sc+KQYT3vaTMjGOlhZq9VKRrv8MhI/SxhLc0sMvS8wtw+pbaFhF+G5j+z
         w5Bw==
X-Forwarded-Encrypted: i=1; AHgh+RqUMPR+2H6TzdJUGCBXR9Jbdkl8EihfBDAoEL4RKr1E2uFp4ZDxJH6twXWBqKz1WCQhjdFtfoNAiisJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwLS3dtqlHODsHlR+3ef71pire0F3HJ/70ZKavsHblN45QAWI+l
	ZvaM5zlmNoYtXk5peN2vgSFcvnIdxrnHDIzKTzvSzdz45/nuMvI/rzF748/g6Fz8
X-Gm-Gg: AR+sD11krNrsTxHgkw12zb6oYXNLNXNtoLBxRmQoXIcpwvASLJ5gzw9RGPcRpvKBkWl
	bSoD6IN+CzFDnyKcX7ClSGcreTO6tT632aG/m9pjE9RRdlQlT/kU52kSEXflnXmpe5uZoy1F1F+
	7Qaj22jwyfcf0cFn2GEyv5715KNA/5B8nI10j60HaWwvxoImLS2ak2aTVsIdWi3chuREebw0Is9
	w9nKmqVig2IRdRXurj1EDV/yQpCyjf7YVtAOnOSPf1C1lFnku7ZFQP4tXFz6Zl3mtGx5q4szZzx
	AMW+8FCpPFxqeAFBYsm82M9QJja+y1Wb20Ui2dixhBDqYR6j/Bk9LpzeCdp5lwYKxBvuLjKPFYn
	V0DoRglIHX1sdscWYbjJ3mX2/fTfgX4CLrP7VmZXfzMIdEa7xn29QfWkAXfNMaqa8GHRK62dOb9
	NsTXL/LGTDciMG0raNq55vm8ORj/TpsKXSUeY1OrWWyTE9
X-Received: by 2002:a05:600c:c4a3:b0:495:51b6:174f with SMTP id 5b1f17b1804b1-49573cfa389mr24289555e9.20.1784801148468;
        Thu, 23 Jul 2026 03:05:48 -0700 (PDT)
Received: from localhost.localdomain ([86.126.27.145])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49565304aefsm197413245e9.0.2026.07.23.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:05:48 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2] dt-bindings: arm: omap: Convert L4 interconnect to DT schema
Date: Thu, 23 Jul 2026 10:05:40 +0000
Message-ID: <20260723100540.628609-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments OMAP L4 interconnect bus bindings
to DT schema.

During the conversion, several updates were made:
- Defined the compatible property as an array to require
  the TI-specific string first, followed by either 'simple-bus' or
  'simple-pm-bus'.
- Added a 'select' block to ensure this schema is only
  applied to TI-specific nodes, preventing duplicate
  schema warnings against the core simple-pm-bus.yaml.
- Added the L4 compatible strings used by the boards but missing from
  the text binding, and corrected the 'ti,am3-l4-wkup' typo to
  'ti,am33xx-l4-wkup'.
- Made 'reg' and 'reg-names' optional.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v2:
- Renamed the example bus node so it matches the simple-bus schema,
  fixing the 'make dt_binding_check' nodename error.
- Added the L4 compatible strings used by the boards but missing from
  the text binding, and corrected the 'ti,am3-l4-wkup' typo to
  'ti,am33xx-l4-wkup'.

Link to v1:
https://lore.kernel.org/all/20260722171840.299303-1-egbostina@gmail.com/

 .../devicetree/bindings/arm/omap/l4.txt       |  37 ------
 .../bindings/arm/omap/ti,omap-l4.yaml         | 121 ++++++++++++++++++
 2 files changed, 121 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/l4.txt
 create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml

diff --git a/Documentation/devicetree/bindings/arm/omap/l4.txt b/Documentation/devicetree/bindings/arm/omap/l4.txt
deleted file mode 100644
index 6816adcdc15f..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/l4.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-L4 interconnect bindings
-
-These bindings describe the OMAP SoCs L4 interconnect bus.
-
-Required properties:
-- compatible : Should be "ti,omap2-l4" for OMAP2 family l4 core bus
-	       Should be "ti,omap2-l4-wkup" for OMAP2 family l4 wkup bus
-	       Should be "ti,omap3-l4-core" for OMAP3 family l4 core bus
-	       Should be "ti,omap4-l4-cfg" for OMAP4 family l4 cfg bus
-	       Should be "ti,omap4-l4-per" for OMAP4 family l4 per bus
-	       Should be "ti,omap4-l4-wkup" for OMAP4 family l4 wkup bus
-	       Should be "ti,omap5-l4-cfg" for OMAP5 family l4 cfg bus
-	       Should be "ti,omap5-l4-wkup" for OMAP5 family l4 wkup bus
-	       Should be "ti,dra7-l4-cfg" for DRA7 family l4 cfg bus
-	       Should be "ti,dra7-l4-wkup" for DRA7 family l4 wkup bus
-	       Should be "ti,am3-l4-wkup" for AM33xx family l4 wkup bus
-	       Should be "ti,am4-l4-wkup" for AM43xx family l4 wkup bus
-- ranges : contains the IO map range for the bus
-- reg : registers link agent and interconnect agent and access protection
-- reg-names : "la" for link agent, "ia0" to "ia3" for one to three
-              interconnect agent instances, "ap" for access if it exists
-
-Examples:
-
-l4: interconnect@48000000 {
-	compatible "ti,omap4-l4-per", "simple-bus";
-	reg = <0x48000000 0x800>,
-	      <0x48000800 0x800>,
-	      <0x48001000 0x400>,
-	      <0x48001400 0x400>,
-	      <0x48001800 0x400>,
-	      <0x48001c00 0x400>;
-	reg-names = "ap", "la", "ia0", "ia1", "ia2", "ia3";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges = <0 0x48000000 0x100000>;
-};
diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
new file mode 100644
index 000000000000..de3f5f9da3fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/omap/ti,omap-l4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP SoCs L4 interconnect bus
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  These bindings describe the OMAP SoCs L4 interconnect bus.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ti,omap2-l4
+          - ti,omap2-l4-wkup
+          - ti,omap3-l4-core
+          - ti,omap4-l4-abe
+          - ti,omap4-l4-cfg
+          - ti,omap4-l4-per
+          - ti,omap4-l4-wkup
+          - ti,omap5-l4-abe
+          - ti,omap5-l4-cfg
+          - ti,omap5-l4-per
+          - ti,omap5-l4-wkup
+          - ti,dra7-l4-cfg
+          - ti,dra7-l4-per1
+          - ti,dra7-l4-per2
+          - ti,dra7-l4-per3
+          - ti,dra7-l4-wkup
+          - ti,am33xx-l4-fast
+          - ti,am33xx-l4-fw
+          - ti,am33xx-l4-mpuss
+          - ti,am33xx-l4-per
+          - ti,am33xx-l4-wkup
+          - ti,am4-l4-fast
+          - ti,am4-l4-per
+          - ti,am4-l4-wkup
+          - ti,dm814-l4hs
+          - ti,dm814-l4ls
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ti,omap2-l4
+          - ti,omap2-l4-wkup
+          - ti,omap3-l4-core
+          - ti,omap4-l4-abe
+          - ti,omap4-l4-cfg
+          - ti,omap4-l4-per
+          - ti,omap4-l4-wkup
+          - ti,omap5-l4-abe
+          - ti,omap5-l4-cfg
+          - ti,omap5-l4-per
+          - ti,omap5-l4-wkup
+          - ti,dra7-l4-cfg
+          - ti,dra7-l4-per1
+          - ti,dra7-l4-per2
+          - ti,dra7-l4-per3
+          - ti,dra7-l4-wkup
+          - ti,am33xx-l4-fast
+          - ti,am33xx-l4-fw
+          - ti,am33xx-l4-mpuss
+          - ti,am33xx-l4-per
+          - ti,am33xx-l4-wkup
+          - ti,am4-l4-fast
+          - ti,am4-l4-per
+          - ti,am4-l4-wkup
+          - ti,dm814-l4hs
+          - ti,dm814-l4ls
+      - enum:
+          - simple-bus
+          - simple-pm-bus
+
+  reg:
+    minItems: 1
+    maxItems: 6
+
+  reg-names:
+    minItems: 1
+    maxItems: 6
+    items:
+      enum:
+        - ap
+        - la
+        - ia0
+        - ia1
+        - ia2
+        - ia3
+
+  ranges: true
+
+required:
+  - compatible
+  - ranges
+
+additionalProperties: true
+
+examples:
+  - |
+    bus@48000000 {
+        compatible = "ti,omap4-l4-per", "simple-bus";
+        reg = <0x48000000 0x800>,
+              <0x48000800 0x800>,
+              <0x48001000 0x400>,
+              <0x48001400 0x400>,
+              <0x48001800 0x400>,
+              <0x48001c00 0x400>;
+        reg-names = "ap", "la", "ia0", "ia1", "ia2", "ia3";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x48000000 0x100000>;
+    };
-- 
2.43.0

