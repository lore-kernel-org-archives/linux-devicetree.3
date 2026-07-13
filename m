Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0C830E835
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946264; cv=none; b=QrojnwxChZqM82G6540hAa8dU+C4zI4DfqmCOhWHOw4CGg3noTu5HRxsld8MzlAhoWEGGDn+iOlLCyQi9E2GQj0H9A2PwlkbY1qbxFQ/Y2slECmpkb88Ohm2RMeUAGTERTRpx3JJuBSOsiJ5ws9ykx3nfD1kR7TDIhC6IXc0WUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946264; c=relaxed/simple;
	bh=jqYyoMG9cIhIr1bVpCsLdm1qwArlmbeG5gPxMFq1aLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KmQ1FenZFjLgkuroqB/U3drlksr5BOV6kxc+JZwzufio1sRPtwOCeU8uviXTp48tRC19YreG55DijyRWPfm9v/U7jHWkS5wzjanNUiBmjEfDwUCgtJJpUjR2rl8hwAMr6+baB6Z6oOCsUurc/e7j4rEP/ea9JGqFtvkomQP1sJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIanZH+l; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIanZH+l"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c88ada0e12aso242909a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783946262; x=1784551062; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1iDad2QVdj4/nBD86WrgH7MagYtru4Jp7EnF3L9WAic=;
        b=iIanZH+lnMGRuzItoiTpVfEwnNdULeTl5OBXPF58vIDOFym+HagGuc37JTD+BUhQZR
         auertkIk9IbbtblseC8c5ge3jketwKFouAcaCeAaNUW0ohv/gS5rDOdPy7BF0R/J09EH
         sAsk7n8bDY5vpnHBA7Sy13GnD3yAUB0nPYzJU+QzApa0KuVRChCR+ZtRPtR0dVFN+VO0
         ttcA1n5J/TpQ+n6+XmKKupGHAQmPGrgu6f5HhKDsH3w2ZtgLwbKCZwkorkbgTllWaXFo
         Qyh2oP16kFHldASd+C0jZARIgwO7X7UQY+rh0uLQAvqWLmC1e6x5whOu/YGCFiiP3pWm
         92sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946262; x=1784551062;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1iDad2QVdj4/nBD86WrgH7MagYtru4Jp7EnF3L9WAic=;
        b=HSR4O+PrL+bO3iDgjJ748L4XunjpVD12mqnr6uvP/oM8eHMb8mV6JfW6ZhdqFq/rOL
         dD8+I5iT5+2CMonzL2oGiN22pnLy+XllmXiihrqfkI9U/pFzVgvU+/zdYbmBuMCiUm9T
         dUIT8uJVTXxxwXy6yloly82QsQag0yZPTo2zCknFMobDjfC9UHNA3yKkzm/kDiJKd2UM
         H3D48An1G+RH7p10QA/ihUX3T9l3DAyycRqlF+jvSVGvqq1uHnfS2kP22w9+Tsl4ysCz
         zIyjN8zt6EECY9oiT0XMzDTNRokhxoTm1D2mz1ublPm/4iQVNnuSjeWxiQF5J1Kdpb07
         dkbw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9fMioNjmdcpBJS+vH5IWC6v69XfOnWUgYwHFrIkDojN15V6WQnmpJSGYGgBbOQwjB+o61JMWQeFNp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzao0JnB8nAkFF8wUEHmcgSYdCxPqIHlrCBv5u8xvoXkXd4S1h7
	lMCxjPnRSW4rBkGbhSv2LcKeCuF7YHO6gjdipd7nE7CuIkdH83WDt27U
X-Gm-Gg: AfdE7ckgKonG8G8j3iQMchg+wfBzgXKftm56nwj+y1AA94UXN5RqneGtgLrAe8Gt+1+
	NzAHGKkVxWT7rBS3JGSQVhvLkAkXQ08zKbPiRiBayKH5jnVCH5IEjhgKRySzzz4Z8ckujUEJWob
	JFgoap4b4Xufy8h2vKsTxWCsW6UnfZFEoPTH++cr7BpiUnwgarrHdNWcaPRuUpDhi3EvuniZB8D
	JuYOYAtYpcKXk0f41eZKJQC7WiiGPxg1WR3QYRMjaiw3pV1apMVfZEv7GFaNWRK7Xvv2y6IQmdf
	JReH4M5hpOdT20lYm9bmQcKCeQOxWkRNY9a2NBYaqRgE/vhFFsiDboOYQrUiLbC7GA8vQCW3/z6
	0PjleM4WMDsTfBbscpiHDv5t56iCMoVfmZi1W8CuCJSyFob0GTB/Cdffu9gnI8K2UJZ389hI1cN
	hQO8DklPhPSCD+yUWDvnvCaA==
X-Received: by 2002:a05:6a20:9404:b0:39f:1dc2:70c with SMTP id adf61e73a8af0-3c110ac0a5cmr6123739637.6.1783946262056;
        Mon, 13 Jul 2026 05:37:42 -0700 (PDT)
Received: from [192.168.1.2] ([2401:4900:881f:4446:b692:9244:2734:87f6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ba16d46dfsm5372188c88.7.2026.07.13.05.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:37:41 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 13 Jul 2026 18:07:30 +0530
Subject: [PATCH v3] dt-bindings: dma: ti,dma-crossbar: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ti-dma-crossbar-v3-1-734509b316c1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNwQ7CIBAFf6XhLAa2lVJP/ofxgLC0m9hioCGap
 v8u7cmL8TgvmXkLSxgJEztXC4uYKVGYCtSHitnBTD1ycoUZCFCiFZrPxN1ouI0hpbuJ3KBupLQ
 n12lgxXpG9PTai9db4YHSHOJ7P8hyW3+3suSSewVtpxrQXtaXfjT0ONowsq2V4Y8PxQdjhVPoH
 dbq21/X9QNkIRR77gAAAA==
X-Change-ID: 20260708-ti-dma-crossbar-ae8411c5d982
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783946256; l=7562;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=jqYyoMG9cIhIr1bVpCsLdm1qwArlmbeG5gPxMFq1aLA=;
 b=MdCnIFJmdPFCBPeHbffmuaLjRrJTHlI+VsSEv1qMvN/7oQ4aEQZ4sDkq7vLPuaVMOMJhCVyR3
 VcxKksBpOgPCn8eacDHQ0DS+TOhOygA/h1xp63+L9MS4AEx/QGxQLH/
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments DMA Crossbar from text to DT schema.
Modify MAINTAINERS file to correctly point to new yaml file.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Add else block to validate dma-cells property better
- Link to v2: https://lore.kernel.org/r/20260708-ti-dma-crossbar-v2-1-2ac0d6efde36@gmail.com

Changes in v2:
- Removed the unmatched `ti,omap4430-sdma` compatible string from the
  example block and trim down example
- Restored dropped documentation regarding client dma-cells
  configuration into the top-level description block.
- Updated the MAINTAINERS file to replace the old .txt reference with
  the new .yaml file path.
- Added constraints on its inner tuple dimensions of
  ti,reserved-dma-request-ranges
- Link to v1: https://lore.kernel.org/r/20260708-ti-dma-crossbar-v1-1-f62796428f13@gmail.com
---
 .../bindings/dma/ti,dra7-dma-crossbar.yaml         | 94 ++++++++++++++++++++++
 .../devicetree/bindings/dma/ti-dma-crossbar.txt    | 68 ----------------
 MAINTAINERS                                        |  2 +-
 3 files changed, 95 insertions(+), 69 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml b/Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
new file mode 100644
index 000000000000..873cedd1427d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti,dra7-dma-crossbar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DMA Crossbar (DMA request router)
+
+maintainers:
+  - Vignesh Raghavendra <vigneshr@ti.com>
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+description:
+  When requesting channel via ti,dra7-dma-crossbar, the DMA client must request
+  the DMA event number as crossbar ID (input to the DMA crossbar). For
+  ti,am335x-edma-crossbar the meaning of parameters of dmas for clients dmas =
+  <&edma_xbar 12 0 1>; where <12> is the DMA request number, <0> is the TC the
+  event should be assigned and <1> is the mux selection for in the crossbar.
+  When mux 0 is used the DMA channel can be requested directly from edma node.
+
+properties:
+  compatible:
+    enum:
+      - ti,dra7-dma-crossbar
+      - ti,am335x-edma-crossbar
+
+  reg:
+    maxItems: 1
+
+  "#dma-cells":
+    minimum: 1
+    maximum: 3
+
+  dma-requests:
+    minimum: 1
+    maximum: 256
+
+  dma-masters:
+    maxItems: 1
+
+  ti,dma-safe-map:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Safe routing value for unused request lines
+
+  ti,reserved-dma-request-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      DMA request ranges which should not be used when mapping xbar input to
+      DMA request, they are either allocated to be used by for example the DSP
+      or they are used as memcpy channels in eDMA.
+    items:
+      items:
+        - description: starting DMA request line number
+        - description: number of consecutive lines to reserve
+
+required:
+  - compatible
+  - reg
+  - "#dma-cells"
+  - dma-requests
+  - dma-masters
+
+allOf:
+  - $ref: dma-router.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am335x-edma-crossbar
+    then:
+      properties:
+        "#dma-cells":
+          const: 3
+
+    else:
+      properties:
+        "#dma-cells":
+          enum: [1, 2]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dma-router@4a002b78 {
+        compatible = "ti,dra7-dma-crossbar";
+        reg = <0x4a002b78 0xfc>;
+        #dma-cells = <1>;
+        dma-requests = <205>;
+        ti,dma-safe-map = <0>;
+        /* Protect the sDMA request ranges: 10-14 and 100-126 */
+        ti,reserved-dma-request-ranges = <10 5>, <100 27>;
+        dma-masters = <&sdma>;
+    };
diff --git a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt b/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
deleted file mode 100644
index 1f9831540c97..000000000000
--- a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-Texas Instruments DMA Crossbar (DMA request router)
-
-Required properties:
-- compatible:	"ti,dra7-dma-crossbar" for DRA7xx DMA crossbar
-		"ti,am335x-edma-crossbar" for AM335x and AM437x
-- reg:		Memory map for accessing module
-- #dma-cells:	Should be set to match with the DMA controller's dma-cells
-		for ti,dra7-dma-crossbar and <3> for ti,am335x-edma-crossbar.
-- dma-requests:	Number of DMA requests the crossbar can receive
-- dma-masters:	phandle pointing to the DMA controller
-
-The DMA controller node need to have the following poroperties:
-- dma-requests:	Number of DMA requests the controller can handle
-
-Optional properties:
-- ti,dma-safe-map: Safe routing value for unused request lines
-- ti,reserved-dma-request-ranges: DMA request ranges which should not be used
-		when mapping xbar input to DMA request, they are either
-		allocated to be used by for example the DSP or they are used as
-		memcpy channels in eDMA.
-
-Notes:
-When requesting channel via ti,dra7-dma-crossbar, the DMA client must request
-the DMA event number as crossbar ID (input to the DMA crossbar).
-
-For ti,am335x-edma-crossbar: the meaning of parameters of dmas for clients:
-dmas = <&edma_xbar 12 0 1>; where <12> is the DMA request number, <0> is the TC
-the event should be assigned and <1> is the mux selection for in the crossbar.
-When mux 0 is used the DMA channel can be requested directly from edma node.
-
-Example:
-
-/* DMA controller */
-sdma: dma-controller@4a056000 {
-	compatible = "ti,omap4430-sdma";
-	reg = <0x4a056000 0x1000>;
-	interrupts =	<GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-	#dma-cells = <1>;
-	dma-channels = <32>;
-	dma-requests = <127>;
-};
-
-/* DMA crossbar */
-sdma_xbar: dma-router@4a002b78 {
-	compatible = "ti,dra7-dma-crossbar";
-	reg = <0x4a002b78 0xfc>;
-	#dma-cells = <1>;
-	dma-requests = <205>;
-	ti,dma-safe-map = <0>;
-	/* Protect the sDMA request ranges: 10-14 and 100-126 */
-	ti,reserved-dma-request-ranges = <10 5>, <100 27>;
-	dma-masters = <&sdma>;
-};
-
-/* DMA client */
-uart1: serial@4806a000 {
-	compatible = "ti,omap4-uart";
-	reg = <0x4806a000 0x100>;
-	interrupts-extended = <&gic GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
-	ti,hwmods = "uart1";
-	clock-frequency = <48000000>;
-	/* Requesting crossbar input 49 and 50 */
-	dmas = <&sdma_xbar 49>, <&sdma_xbar 50>;
-	dma-names = "tx", "rx";
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..a4b39e0dc178 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26710,7 +26710,7 @@ TEXAS INSTRUMENTS DMA DRIVERS
 M:	Vignesh Raghavendra <vigneshr@ti.com>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
+F:	Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
 F:	Documentation/devicetree/bindings/dma/ti-edma.txt
 F:	Documentation/devicetree/bindings/dma/ti/
 F:	drivers/dma/ti/

---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260708-ti-dma-crossbar-ae8411c5d982

Best regards,
-- 
Bhargav

