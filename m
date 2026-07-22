Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C430541685E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740627; cv=none; b=FFhI4/8mn7sN7iSQE/nVgQoVDU7bjjgWSTP0qgppViw0u6HXZ48Kbflg4klTrkxrhu6Kmfoj1HtT4P+MkL3HK5SfwBN29JIWHwgQ2gNP1RRL3JbAV59Jn1qj7siL5QydUyI4D3kGMU8JsPemDDQhvxaz1xhNOr7ayWs40eD7qOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740627; c=relaxed/simple;
	bh=mYZUJor6/T6trj8IHE26Q4et79EcziTm7R1sunOS/9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XPGJDf6s0QzTrDbPCbsfRuL1lFCcOyNSlcJaKIc/nB2+kRl4oWHbAaOi6L6HzmP2AdSIoLa+ltlfbt0WYuqACfMWJ9C5ioKT6P9d13R+1zYK4ZPYiiiN4Gcq3KvnUXlfDAUGSxDEfyN63lOgUTnJJFCQvb4p5o8pdHMpknwfmYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APrdh2bJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APrdh2bJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso8447709f8f.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784740624; x=1785345424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdGkR8Ij2hIXDFqcob6FpIhEFRpXT8BWO4ggBDHHFPU=;
        b=APrdh2bJu7YboykJoabOFU6V/vVWBFIbTjojKOd+GeqiTPXE4w2DUpwtH0kWA1rjj6
         uLFOK4x/yP5wvYaiRUkFww5r7/kti3aWM28ucCTETx3gqQnQnEAZHPhkP767wRVIIHwa
         WF0BW3WSXktJqMG2EbhcJoZppXMa+FGdjuJpUtIoJ5VfO2sw8EpA8W895MX/iraOhRXh
         Vcn2H6nZchRidpyDvOPX2TB/JD877tujiZnuXASD0u+TLd/Z1cFrwhrhPlx5N8a6CWbH
         POuAvr4Di14g6p2HDvQltm6LVCOZcyznXlzIlCmKRwAO8kp4OWlxFYkKeu8om6ES1kX/
         JAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740624; x=1785345424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdGkR8Ij2hIXDFqcob6FpIhEFRpXT8BWO4ggBDHHFPU=;
        b=UMVxhQGfvJgSG6NfqFSJVlcfdbd+k6ZEy3dx+nEvOCutptHXJRtNCkIfALehsikAmq
         1wbpJAYfpt7kqsxYw4tHsO1fPA2rhuqJCr3DyC+OPH0TlDqL7+V22DhWHYY24TltRerf
         N40BD1Pk6cPe7gvwjvPwDAIxnp8dKI2H283CHb/D5WNOIn+Fk4fvjZ+jI3O3KmfmchHE
         CJn1X3fBai+a47GIEeAqZFp8ksNrq2rAXcGIYO8lvK2DVFZ+QlsX6tDlZWkCe3QMd5qz
         oONLTa1nyCaQGMaYcs+hJrO6QDMokorX5w/bzArBmb+DV9pFz83GEW+C9YPVcFbCxmIM
         tPjg==
X-Forwarded-Encrypted: i=1; AHgh+RoPJKestbV8hIiAVEX9Fd6o7CR3Gi/n4Z+bxckVuBksrTpZP2D8FUEgNFQnoPglIq+ZDNSJwC50wVGr@vger.kernel.org
X-Gm-Message-State: AOJu0YyvlPvzJT0bcuN7i/f0wKmh2+lU2RRWrRYyZarzN2A0Qz9ZJR8u
	/SZbbl8bg5QnqR7YSibKYaGJ0vgHxS1Pqg/XQo0RwTIDMCVcMAxwd8aX
X-Gm-Gg: AR+sD12w7D/oM8TVdDFloJ0fFmsiy79Qxxj4cLjCHk/9f42vm8BOsg9axXiSXFGqUr/
	qeDbAFx1obh/H6cTZaG1gLT/jaSSyn2E2SEdXBru3fm1Eu+CwbX7o0MNeOovTUl7YAdEcOjYMBb
	ZhU5Pf4IizS4/giZAohF7f9EaM/A2vkyuhFXCD7bfP+YmqV5Yr70vjZt1J9L1CT+CVcj3VTpTFa
	yXYwJZ2WcDQ8/M+er62rW5HGoDdXMKsU8morPTWIz8QvQM2oTvarAbUpbdoVXusfMQqFxiDRVF2
	bzEjz2h2m7+G4iOyilN+8xiALa5QcqJK7s/zz6SiaVI/29ipl6JJ+8mscUv0UxFvyqx2QA8trjB
	hDqSdMITUisAMYmKg8PX/tEzUlltdQFJ91KCP8ze4uvyWBEuYa6jwpWfJeq4iu4+Pu5S0ED8svY
	ALq4wpRzD74gdimADo+UXIezNMaFbsn4P9iSl7yQB8R8qW
X-Received: by 2002:a05:6000:5c6:b0:47d:fc44:f4b6 with SMTP id ffacd0b85a97d-47f62305747mr29702353f8f.20.1784740623759;
        Wed, 22 Jul 2026 10:17:03 -0700 (PDT)
Received: from localhost.localdomain ([86.126.27.145])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm7593170f8f.18.2026.07.22.10.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:17:03 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: sound: Convert TI OMAP2+ McBSP to DT schema
Date: Wed, 22 Jul 2026 17:16:54 +0000
Message-ID: <20260722171654.298557-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments OMAP2+ McBSP (Multi-Channel Buffered
Serial Port) bindings to DT schema.

During the conversion, the following updates were made:
- Documented the 'clocks', 'clock-names', 'dmas', 'dma-names',
  '#sound-dai-cells' and 'port' properties, which are used by the
  boards but were missing from the old text binding.
- Added 'dma' to the 'reg-names' enum, which the boards use alongside
  'mpu' and 'sidetone'.
- Changed 'ti,hwmods' to a string array of up to two entries, as some
  boards pass both the base and sidetone hwmods.
- Made 'ti,hwmods' optional to resolve dtbs_check warnings. Modern OMAP
  platforms no longer provide this property, while older platforms still
  use it.
- Made 'ti,buffer-size' optional, as it only applies to OMAP2430 and
  newer SoCs.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/sound/omap-mcbsp.txt  |  36 -------
 .../bindings/sound/ti,omap2-mcbsp.yaml        | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-mcbsp.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml

diff --git a/Documentation/devicetree/bindings/sound/omap-mcbsp.txt b/Documentation/devicetree/bindings/sound/omap-mcbsp.txt
deleted file mode 100644
index ae8bf703ce7a..000000000000
--- a/Documentation/devicetree/bindings/sound/omap-mcbsp.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Texas Instruments OMAP2+ McBSP module
-
-Required properties:
-- compatible: "ti,omap2420-mcbsp" for McBSP on OMAP2420
-	      "ti,omap2430-mcbsp" for McBSP on OMAP2430
-	      "ti,omap3-mcbsp" for McBSP on OMAP3
-	      "ti,omap4-mcbsp" for McBSP on OMAP4 and newer SoC
-- reg: Register location and size, for OMAP4+ as an array:
-       <MPU access base address, size>,
-       <L3 interconnect address, size>;
-- reg-names: Array of strings associated with the address space
-- interrupts: Interrupt numbers for the McBSP port, as an array in case the
-	      McBSP IP have more interrupt lines:
-	<OCP compliant irq>,
-	<TX irq>,
-	<RX irq>;
-- interrupt-names: Array of strings associated with the interrupt numbers
-- ti,buffer-size: Size of the FIFO on the port (OMAP2430 and newer SoC)
-- ti,hwmods: Name of the hwmod associated to the McBSP port
-
-Example:
-
-mcbsp2: mcbsp@49022000 {
-	compatible = "ti,omap3-mcbsp";
-	reg = <0x49022000 0xff>,
-	      <0x49028000 0xff>;
-	reg-names = "mpu", "sidetone";
-	interrupts = <0 17 0x4>, /* OCP compliant interrupt */
-		     <0 62 0x4>, /* TX interrupt */
-		     <0 63 0x4>, /* RX interrupt */
-		     <0 4 0x4>;  /* Sidetone */
-	interrupt-names = "common", "tx", "rx", "sidetone";
-	interrupt-parent = <&intc>;
-	ti,buffer-size = <1280>;
-	ti,hwmods = "mcbsp2";
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml b/Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml
new file mode 100644
index 000000000000..17cd66460620
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,omap2-mcbsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP2+ McBSP
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,omap2420-mcbsp
+      - ti,omap2430-mcbsp
+      - ti,omap3-mcbsp
+      - ti,omap4-mcbsp
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description: |
+      Register location and size. For OMAP4+ it may be an array containing:
+      - MPU access base address
+      - L3 interconnect address (or sidetone)
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [mpu, sidetone, dma]
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [common, tx, rx, sidetone]
+
+  ti,buffer-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Size of the FIFO on the port (OMAP2430 and newer SoCs).
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    minItems: 1
+    maxItems: 2
+    description: Name of the hwmod(s) associated with the McBSP port.
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    maxItems: 2
+
+  "#sound-dai-cells":
+    const: 0
+
+  port:
+    $ref: /schemas/sound/audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    mcbsp@49022000 {
+        compatible = "ti,omap3-mcbsp";
+        reg = <0x49022000 0xff>,
+              <0x49028000 0xff>;
+        reg-names = "mpu", "sidetone";
+        interrupts = <0 17 0x4>, /* OCP compliant */
+                     <0 62 0x4>, /* TX */
+                     <0 63 0x4>, /* RX */
+                     <0 4 0x4>;  /* Sidetone */
+        interrupt-names = "common", "tx", "rx", "sidetone";
+        interrupt-parent = <&intc>;
+        ti,buffer-size = <1280>;
+        ti,hwmods = "mcbsp2";
+    };

-- 
2.43.0

