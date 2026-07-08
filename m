Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9389B405C30
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528364; cv=none; b=EVeGTqJqkZ29KLlw4KgkXd4FBVTlQQ7wcLCWLy9BwiV30VNjeAJm5kJOn4HA1RvLaM5dFpCP/bNpfrf39o/VlOzKpdRVE4mAzWo+kJbYzVPrlf+n1wX64//yGT4k5tnjmIVQjmMe9xytBi032sK1S1iZmskungFoRXlpX8zvO6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528364; c=relaxed/simple;
	bh=VtZM2qD7Un0eQm+y6xnch5aCljKPdhMYWFqn+0laie0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ybd5qeEyvhd/7Ndlg7f86FciXRPxa4whnkPe3h1iGUf09A7oEsbSryDezuu8VQStqXA3mHLONRGqgW/1d2uLa0VKusk3v2pgecs8ChTQxEGIkHrT/26jfOTne1vWvWm4O2eN4mqGhqsagZldRwYGiOT33LhJz6WtwzA+6U0xVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpCgxJWK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpCgxJWK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383fff6e8b6so108170a91.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783528362; x=1784133162; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fWuQ0mPWMJpAyjf5/+TbvMYXq9kqNgTMYENPSWW7pBg=;
        b=fpCgxJWKr2ROqzfv670bIti+IRxSqUIqBctdhnR7nL/BrFdmOcZhZwuNK4TwrDzlc1
         ZU2kQjIXsMla+3hOtmL8FflDI/8lA3t76Pue7WHyoZyY5QYPvEscoDC98f24GioP3IWs
         PKf7wJh4gPVbcxJG76j6wadCXjAu85O0eiEzZ5VmeeaDzNUPVQwp2rJzGmoMix9r4ECD
         FBIGrjjcmzKUfXCuP3WQQybme5XUHTU0KNV0eBIICMVvmCIWeh9nTqyPkiAvvF72FyxN
         kO8BW4qIU0IxFlbYPMafWcfNQTdvgsV+8mCr5NNp8/G+jYad8eV8w70pRzVtWup96Cv6
         CU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783528362; x=1784133162;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fWuQ0mPWMJpAyjf5/+TbvMYXq9kqNgTMYENPSWW7pBg=;
        b=VVy+FmGt+AknChdyE0zl7fV5GLAq3Ic5Ls0xPDZ2M/SzKMRbc7Wv/xUYEjh5Ys5vuX
         Ml1TjWW7blqy4mZfLUsq9WGBHNXZDirhwT89SiN48fhZJKdxymNDlKNdFokPMrtMWokO
         DXJ9rT7voS6jneOGL/5b6q389Exsq+fMi1rVTCWZ20smNHl81EBH/QcdED/jTpM1vZpk
         bQ3AYsM6dVKmTdnJtt+9dHuS9s84kgjBRono1VPP7sSpDFFb/ZgwP9NhfJUtJNX7f1Vc
         2UdssrtpuCOkG3TqOMqs9hmYdXc6exxy7srIGTpiipR75LhQ4cIA54gOZjL0mxRAqNWT
         po9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoDt0rEYxW/JaKt7AeXHRSUhhiXnAGntqPOce2gRFyvk7QrdIwflNKwE+U6mc6XmQWpxxImysD5zMff@vger.kernel.org
X-Gm-Message-State: AOJu0YxT5DKClREUyuitHlYRnvDByT66KZN90h9yKYwrw8d0a6f0BCg1
	XmHP6xXZ2uVoLGL/97K+4LTZsUuMn2OZ6rm+s8qMe0alwLSAxS8DUnX/
X-Gm-Gg: AfdE7cll+9vRYGg8AlUMTYJ1oidWGVjUPbwr6FEmv/S0f3ARKUt6pEM6asBGu6AOkPZ
	d2h1NDApgmhi2oNXrSkzC9u3+jywKFDfaZwmoTiEqUJal937jRom07xALJbNGd5Hw1p1H0kqTZX
	r2vbh9Mv6BIHZ0EElkac69klr9VaQ2zxnc4EommsGvjTXbLMMiCARkolOGV4Fol42Ozd8pNpQXg
	KbyfpcvbOshbeygcD0y9IVQMVoidc/IiC0odWPGwHXM8mFd1ZPwC03yTm+CLYnqiW8fWB1sCgaW
	A47jwITT/H0ymjbqtrzMW+4tgXABg7ei+OMH1q3RtAea/5WCBQlAjhA/BHcwGWoQ8mcK4ZYYVvt
	jXne/O+nSXR0/z8FyQKVCCc3PDi/JkxbKZI0mhYg2/4LPnVhVayGssAJCd7XwjZeiVbrI9DmpYv
	7ANTLIaYhNBstzjMsrYczrXA==
X-Received: by 2002:a17:90b:3502:b0:380:7688:fc06 with SMTP id 98e67ed59e1d1-38a21af6569mr199889a91.8.1783528361810;
        Wed, 08 Jul 2026 09:32:41 -0700 (PDT)
Received: from [192.168.1.2] ([2401:4900:881c:f765:f05c:d31e:8ae0:b06d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a8f521sm21334679eec.22.2026.07.08.09.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:32:41 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 08 Jul 2026 22:02:18 +0530
Subject: [PATCH v2] dt-bindings: dma: ti,dma-crossbar: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ti-dma-crossbar-v2-1-2ac0d6efde36@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2jFtxVJc+R+GRe0DJhFKWtJoS
 P/dyt7lOck9d4fkIrkEt2aH6DIlCksFcWrATHoZHZKtDIIJyTqmcCO0s0YTQ0pPHVE71XJurrZ
 XAupqjc7T+yg+hsoTpS3Ez3GQ+c/+b2WOHL0UXS9boTy/3MdZ0+tswgxDKeULecmDJ64AAAA=
X-Change-ID: 20260708-ti-dma-crossbar-ae8411c5d982
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783528356; l=7311;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=VtZM2qD7Un0eQm+y6xnch5aCljKPdhMYWFqn+0laie0=;
 b=8UUVG/V7m8IFQrOl0+Czl3uNXOfTfrrryplL13fs8AJOXUF7Ax34fabmQJKV+LqcpqDSIYrRY
 f6BvLJU/Ni/C6zeDtxaLninKrrlVYV50kicVUaNZbqfIq/mcpAX2jt2
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments DMA Crossbar from text to DT schema.
Modify MAINTAINERS file to correctly point to new yaml file.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
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
 .../bindings/dma/ti,dra7-dma-crossbar.yaml         | 89 ++++++++++++++++++++++
 .../devicetree/bindings/dma/ti-dma-crossbar.txt    | 68 -----------------
 MAINTAINERS                                        |  2 +-
 3 files changed, 90 insertions(+), 69 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml b/Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
new file mode 100644
index 000000000000..3de4f53797d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
@@ -0,0 +1,89 @@
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

