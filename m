Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5719E442B1D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740732; cv=none; b=thVWThWUPqh+1eANd6+2ni0Q2U2LtdYkzZEuU1IbhX8jn843bGoBm8ud1TbqT/goVBg+jVdpISuzN3wO0pDNnUXijvMCQaJn+bcEfp5rJAywKzJkigszfZANFkOpJ4muZYIPKFpR8v0E1RueJccvgB+aZLeJOwDt/jllfFMb2WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740732; c=relaxed/simple;
	bh=9waZWLhHOEX23tZF9Rv9dopzKj5VvUD4oKC+kdncA7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOuyRoy6IZhkkPGI3NDr6qpH9vugIKDtfJ8lFfIi5NpgAuGhe/YU+OShUJ4JjPo8h3cO0hRVRavvYbfvQaJKoZr5AUfdsstfuTqrQSF+Xncak0dsbiji/OpcirDD2MCJ4VT+Wbv4LLOX8nampUfiYFxHOQTRAYHkoqvAs0pxd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5b4dRIV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5b4dRIV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so38646775e9.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784740728; x=1785345528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=41FBM2ZTWPSHVd6MJ8MXkNt1oTrETIpgt/CWDkyyKWg=;
        b=R5b4dRIV1A+P9MEKIwYsgOeJI1y2ciB8tXFeT+DLR3n19yTbhRHqmfmBAba+SEJO/Q
         X/UoTpeIDQSyvAlEWFrMp/K1wG291Wd0KjSA9xHctMtzyYEoMys+nUfgrBe2MKCeJnNr
         KFhVL4vYovp0ckyavUDrtZd5WWQSyd0AS7eOt02iZ1b/Er9SQS2p93zGmpQ0fldjmc8W
         WsB3TNM2HlcRvzqqDBZX5ewXTGuGJ6gbrAKgXUfHWES5Tz0UUJbdQRFneOFUjxIMWyLu
         058Eil7vrj1E7ncUfluygarJUu3sMfl8E+vACeEl0BIDxMViwgaVy/XKoGWbpv016zUD
         Rd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740728; x=1785345528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41FBM2ZTWPSHVd6MJ8MXkNt1oTrETIpgt/CWDkyyKWg=;
        b=LqF7uieR9k3x0OzNBVlv/xX/URxCGbHuMSmKXRlmaR9JsYqH9eCKErKGyghH24vqLb
         qtldYklpV4uZrdQd/tqDc1rl2fhPVIqMaSS7TkaBe+LwnknTMArQKGIiZ2N001kidkXI
         jP9CP3YFYRI3XYronsjCg0LRLU1BbHCWf4UyDjfksBdHqxn4dO6aoRNj4EG/qHN7PeU1
         nM9VG2fDdT76TRbQvGxTTjOyzldxQ44hiXHgHtDSwXsXwPMkBeF5mqd9eZwXtzRgwMDu
         9zoj5i4o3D5v2hVGqN96fLUEEz+akkf40nxT2XFfGjPzu8Gc/I/9q9lzWjG8LB5tWiaP
         6KKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYax3L70zNqdPqglBF2MIp1vcy8D0moVMnDHHh77JFDSdqk4upBO/EcigM3I2LKiw4mXi+OPH5iY0j@vger.kernel.org
X-Gm-Message-State: AOJu0YxTqO9jrPr5b8u44EDGjkipiRSiVu85E4+v9fh8/rxMbunEplIQ
	wd98pY50uGVCBvzMnrT7OoNXUnngWv+mx/uUTBOdZkV6lEMIidoHPDLM
X-Gm-Gg: AR+sD11DVIjMzcHRnoTCxbaPoZ/cyjqxIo0eUn6NaSG3iAbZg83AInB9dma7UwyNSVM
	yF3I4dl8Vuk4agsw0GAANm15WlKMpSE4j194bKy1owhia6FIySYCSjqYUrQENQT0KZDdVCzr+W8
	OtaJOHF8HH4yVdxHRVo3z4aOy4j6fSKG24WLj84odfJbePoEFzzo3Dfxkd09nz73+DXL8hwfAuZ
	LbVtBDhSArNWZMTslisbeB4yBOhGPtby1bNmfsI0zM1JEakTnCdcb6wJpRDx7T7ynvxP8TEEIhi
	w5SRk1DksmJyPc0lVPKjiybFXgL5/DxpaAuex7OdmRYXtQluRn9igQvkKOag8gNm2qoNtbvvlDz
	YZpJ0Y4a3H0kNn4Z9ZPXsvDbtUXqyXidKdeu+9o4EwiwJmQElb2zyetEeQBwsIM8XvpTHbam9YU
	jBrmvQckeNqHru42B4OaCSlZ8U7zUHt5dC8GXqDz2spKXmC/Hgc+7LMIU=
X-Received: by 2002:a05:600c:3589:b0:495:641a:fffe with SMTP id 5b1f17b1804b1-495641b01acmr134793105e9.39.1784740728297;
        Wed, 22 Jul 2026 10:18:48 -0700 (PDT)
Received: from localhost.localdomain ([86.126.27.145])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956b5c2108sm123344555e9.2.2026.07.22.10.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:18:47 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: arm: omap: Convert L4 interconnect to DT schema
Date: Wed, 22 Jul 2026 17:18:40 +0000
Message-ID: <20260722171840.299303-1-egbostina@gmail.com>
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
- Made 'reg' and 'reg-names' optional.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/arm/omap/l4.txt       | 37 --------
 .../bindings/arm/omap/ti,omap-l4.yaml         | 93 +++++++++++++++++++
 2 files changed, 93 insertions(+), 37 deletions(-)
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
index 000000000000..465d48f44730
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
@@ -0,0 +1,93 @@
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
+          - ti,omap4-l4-cfg
+          - ti,omap4-l4-per
+          - ti,omap4-l4-wkup
+          - ti,omap5-l4-cfg
+          - ti,omap5-l4-wkup
+          - ti,dra7-l4-cfg
+          - ti,dra7-l4-wkup
+          - ti,am3-l4-wkup
+          - ti,am4-l4-wkup
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
+          - ti,omap4-l4-cfg
+          - ti,omap4-l4-per
+          - ti,omap4-l4-wkup
+          - ti,omap5-l4-cfg
+          - ti,omap5-l4-wkup
+          - ti,dra7-l4-cfg
+          - ti,dra7-l4-wkup
+          - ti,am3-l4-wkup
+          - ti,am4-l4-wkup
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
+    l4: interconnect@48000000 {
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

