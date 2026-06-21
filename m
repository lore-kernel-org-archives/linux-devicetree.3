Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205E28C2A1
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782056751; cv=none; b=PZ+Wmm6VQzTX7t3cx5sC4YM83rUJ63YZ+KrdA1uDWGTOXNjZ/934zNaLHhxBv180Lm41wGt0/gp7Cy9mTI5L8ry5IePCJc0NHUDL7THpLmM2VkAmBHeJjx/n2h7ydHEToGPxUaYJuDpGeTgPzVT0kJt6uHXYdKe7vtaur98a9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782056751; c=relaxed/simple;
	bh=/gZfcSYO5I5loQX3u0LwqbrBQyMEw4vh91vd11x3l9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUzQNDEtT+jR+l/NYLCuAeYetCIVb5xoisC5nFVIANPmjfj1ohSoj3QVekD53aIqqHpiIbwq1sdSfR+mVaBXfrATKf+HbWOsUiTwiCiHHfBuFi4B7k8heFFAo1U3IqPNt6UdzA6jXCcHdDKkfeLrxmeqGDaHhaCjlnvvZwpFBF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5/t7da5; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5/t7da5"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37cbcf49deaso1702148a91.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 08:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782056747; x=1782661547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCFISPejpA4KN+GVlYKxBYlhkGQr78rc8f+aUEsLn44=;
        b=c5/t7da5f0en0JAxFcO9IooIqte0WWSOBO8qTGPrzfPNTTYiCdEBzl6HGYPKEw26mW
         et+7ieJ49O2BixfJx6xXVFZX5j2wyT3DnN9I2dgxIAh8786dkj0jwYC3SvbA9xmoJfrI
         RK9D0eBbsD465AbLpPhPKtNdNs1uW/Z/Ibquar6xSOT7CAjQ3iFW32kYIZmRzWqEtzxz
         9+7EPIZkPgyx0jceb6eeqcfYOHl4SliT29hvSKoFzZ3moI2Wpl7j/Jx8RYX6U42Sd9Uo
         Rj1KTfES4iqdSferCBnbowXjXzI2XoxjIytjT1GS+Zik7JAOb52IBoqiEWTWZjx2laaS
         sz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782056747; x=1782661547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tCFISPejpA4KN+GVlYKxBYlhkGQr78rc8f+aUEsLn44=;
        b=NxCbLktgQ5+xqVrtHf4QtPbQE+uwzyuf0jC4sz8c/BmUuZaosA1du4OB6ZAXOi6MTH
         afqW3l8hXv6+Euws6k8qhOqbp5zDTS8NGPRTPHbXg/kDjLagQYrGzqi/jHAfU8pqoopt
         E0/i3y0h6KucpolNmNtTZknVQ/1RFdJPWasg+y/PXtSsAC3+V6Is9hgVC0NOtBHBaBI7
         VKqCS9X7EA+WIIDLSjfGQowPvIwxMU1mR+/jx7lvus9AzMiiq8Pt3xWNkMfbW2jdrFMv
         fH8+8DfrJ9nTosXvrI5zbXK/a0clCgmOMHvI82GO/YgPlQ8kAvAa35K8jWEpaTtk+2YE
         l9hw==
X-Forwarded-Encrypted: i=1; AHgh+RoZP+TJtu+gv+4pSPVMgznssv3ESmg0iTvJT6Baf03rn2txFIDt2MeC3/ErY/Q5uAe/RCOnfe3aLhjf@vger.kernel.org
X-Gm-Message-State: AOJu0YzWf3GNOi3bjAQVqjisYg1d3JX87PlUQ7gznXjjzgXBsSPK+u0c
	x/a62cL3aeYCH/9Mqot73ozuhmLZLJd+SIDTbMBZzIBpQzLCaDqwWIqW
X-Gm-Gg: AfdE7cmy3+m0VuOcOJpAKPBXLkkeMQ5zO8Fa9MzjaWHrfxL9QviULYSFpdxassxgJZ2
	5CTo/Pb9FEPZTZXtoNsNpIddpT/czI+aw5cI23ajT7EVCzyOZotOJmbc/BWqkkat7Up39gSTqvo
	4/+OHtQ/ECtaOAaIjpyLym4uNu+ziFqNQnYoxj6Q/YoQBdTFHMTbXYRgsTv/w9yHRJNCQRrLCRu
	yUYYl6ND1aeDGGtjmDBkN10i6hEay5vD7x2dtqSq5yepHt6nTUcZId6swzyTfW7WsyoaxkvzmI9
	rRY+lnTTV+Ul3YkOl31TKeyJoqROUSX2leguDpCUIHTMFuX48jkWamKnN59IMlRscOlycn9nyk4
	2b4KaUWvq0ucEETEjGBWLXcCstkOLapnmkVyoDnEz5bf3M69iH1ra1ZYs/K/lJSX1VO7CZBtQUe
	FrtoyLrDd55pk25xGP9yJ53wKyRwOoOjN+Va0bWEIwcg==
X-Received: by 2002:a17:90b:5824:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-37d15de2859mr10666648a91.14.1782056746751;
        Sun, 21 Jun 2026 08:45:46 -0700 (PDT)
Received: from kernel-dev ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df7424sm7727194a91.14.2026.06.21.08.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 08:45:45 -0700 (PDT)
From: Aditya Chari <adi25charis@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: jacobsfeder@gmail.com,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari <adi25charis@gmail.com>
Subject: [PATCH v3] dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO
Date: Sun, 21 Jun 2026 15:13:12 +0530
Message-ID: <20260621094312.53655-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260621085209.52651-1-adi25charis@gmail.com>
References: <20260621085209.52651-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The axis-fifo driver's compatible strings were undocumented, flagged
by checkpatch.pl as UNDOCUMENTED_DT_STRING. Add a YAML devicetree
binding document for drivers/staging/axis-fifo, converted from and
replacing the existing free-form text binding (axis-fifo.txt), which
this patch removes.

Constrain xlnx,tx-fifo-depth to a minimum of 4, since the driver
subtracts 4 from this value in its transmit bounds check and a
smaller value would underflow that check.

Signed-off-by: Aditya Chari <adi25charis@gmail.com>
---

Changes since v2:
- Added $ref: /schemas/types.yaml#/definitions/string to the three
  AXI-Stream protocol enum properties (xlnx,axi-str-rxd-protocol,
  xlnx,axi-str-txd-protocol, xlnx,axi-str-txc-protocol) for explicit
  type consistency with the rest of the schema.
- Added minimum: 4 to xlnx,tx-fifo-depth, since the driver subtracts
  4 from this value in its transmit bounds check
  (axis_fifo_write()) and a smaller configured value would underflow
  that unsigned check, bypassing the oversized-packet guard.

Changes since v1:
- Fixed xlnx,rx/tx-fifo-depth: depth is in 32-bit words, not bytes,
  matching the driver's overflow check in axis_fifo_write() and the
  wording of the original text binding.
- Restored the full set of hardware-generated properties (interrupt-
  names, AXI-Stream protocol/width properties, has-axis-t* feature
  flags, fifo threshold properties, etc.) so that additionalProperties:
  false does not reject valid device trees generated for real hardware.
- Removed the now-superseded axis-fifo.txt text binding.


 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 227 ++++++++++++++++++
 drivers/staging/axis-fifo/axis-fifo.txt       |  96 --------
 2 files changed, 227 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000..53bf52524
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,227 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO (axis-fifo)
+
+maintainers:
+  - Jacob Feder <jacobsfeder@gmail.com>
+
+description:
+  The AXI-Stream FIFO (AXIS-FIFO) IP core provides a memory-mapped AXI4-Lite
+  interface for sending and receiving data over an AXI4-Stream interface
+  using FIFO buffers. Currently supports only store-forward mode with a
+  32-bit AXI4-Lite interface; cut-through mode and full AXI4 are not
+  supported. See Xilinx PG080 for IP details.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,axi-fifo-mm-s-4.1
+      - xlnx,axi-fifo-mm-s-4.2
+      - xlnx,axi-fifo-mm-s-4.3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: interrupt
+
+  xlnx,axi-str-rxd-tdata-width:
+    description:
+      Width in bits of the AXI4-Stream receive data interface. Only a
+      width of 32 is currently supported by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+
+  xlnx,axi-str-txd-tdata-width:
+    description:
+      Width in bits of the AXI4-Stream transmit data interface. Only a
+      width of 32 is currently supported by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+
+  xlnx,axi-str-txc-tdata-width:
+    description:
+      Width in bits of the AXI4-Stream transmit control interface.
+      Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,axi-str-rxd-protocol:
+    description: AXI-Stream receive data protocol. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ XIL_AXI_STREAM_ETH_DATA ]
+
+  xlnx,axi-str-txd-protocol:
+    description: AXI-Stream transmit data protocol. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ XIL_AXI_STREAM_ETH_DATA ]
+
+  xlnx,axi-str-txc-protocol:
+    description: AXI-Stream transmit control protocol. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ XIL_AXI_STREAM_ETH_CTRL ]
+
+  xlnx,axis-tdest-width:
+    description: AXI-Stream TDEST width. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,axis-tid-width:
+    description: AXI-Stream TID width. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,axis-tuser-width:
+    description: AXI-Stream TUSER width. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,data-interface-type:
+    description: Data interface type. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,has-axis-tdest:
+    description:
+      Whether the AXI-Stream interface has TDEST. This feature is not
+      supported by the driver and must be 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+
+  xlnx,has-axis-tid:
+    description:
+      Whether the AXI-Stream interface has TID. This feature is not
+      supported by the driver and must be 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+
+  xlnx,has-axis-tkeep:
+    description:
+      Whether the AXI-Stream interface has TKEEP. This feature is not
+      supported by the driver and must be 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+
+  xlnx,has-axis-tstrb:
+    description:
+      Whether the AXI-Stream interface has TSTRB. This feature is not
+      supported by the driver and must be 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+
+  xlnx,has-axis-tuser:
+    description:
+      Whether the AXI-Stream interface has TUSER. This feature is not
+      supported by the driver and must be 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+
+  xlnx,rx-fifo-depth:
+    description:
+      Depth in 32-bit words of the receive FIFO, as configured in the
+      IP core.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,rx-fifo-pe-threshold:
+    description: RX programmable empty interrupt threshold. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,rx-fifo-pf-threshold:
+    description: RX programmable full interrupt threshold. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,s-axi-id-width:
+    description: AXI4-Lite ID width. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,s-axi4-data-width:
+    description: AXI4-Lite data width. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,select-xpm:
+    description: Whether XPM macros are used. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,tx-fifo-depth:
+    description:
+      Depth in 32-bit words of the transmit FIFO, as configured in the
+      IP core. Must be at least 4; the driver subtracts 4 from this
+      value when bounds-checking transmit writes, and a smaller value
+      underflows that check.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 4
+
+  xlnx,tx-fifo-pe-threshold:
+    description: TX programmable empty interrupt threshold. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,tx-fifo-pf-threshold:
+    description: TX programmable full interrupt threshold. Ignored by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,use-rx-cut-through:
+    description:
+      Whether RX cut-through mode is used. Not supported by the driver
+      and must be 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+
+  xlnx,use-rx-data:
+    description:
+      Indicates whether the receive data path is present, as configured
+      in the IP core. A value of 1 enables the receive path, 0 disables it.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1 ]
+
+  xlnx,use-tx-ctrl:
+    description:
+      Whether the transmit control interface is used. Not supported by
+      the driver and must be 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+
+  xlnx,use-tx-cut-through:
+    description:
+      Whether TX cut-through mode is used. Not supported by the driver
+      and must be 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+
+  xlnx,use-tx-data:
+    description:
+      Indicates whether the transmit data path is present, as configured
+      in the IP core. A value of 1 enables the transmit path, 0 disables it.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - xlnx,axi-str-rxd-tdata-width
+  - xlnx,axi-str-txd-tdata-width
+  - xlnx,rx-fifo-depth
+  - xlnx,tx-fifo-depth
+  - xlnx,use-rx-data
+  - xlnx,use-tx-data
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    axi_fifo_mm_s_0: axi-fifo-mm-s@40000000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x40000000 0x10000>;
+        interrupts = <0 29 IRQ_TYPE_LEVEL_HIGH>;
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,rx-fifo-depth = <512>;
+        xlnx,tx-fifo-depth = <32768>;
+        xlnx,use-rx-data = <1>;
+        xlnx,use-tx-data = <1>;
+    };
diff --git a/drivers/staging/axis-fifo/axis-fifo.txt b/drivers/staging/axis-fifo/axis-fifo.txt
deleted file mode 100644
index 413b81a53..000000000
--- a/drivers/staging/axis-fifo/axis-fifo.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-Xilinx AXI-Stream FIFO v4.1 IP core
-
-This IP core has read and write AXI-Stream FIFOs, the contents of which can
-be accessed from the AXI4 memory-mapped interface. This is useful for
-transferring data from a processor into the FPGA fabric. The driver creates
-a character device that can be read/written to with standard
-open/read/write/close.
-
-See Xilinx PG080 document for IP details.
-
-Currently supports only store-forward mode with a 32-bit
-AXI4-Lite interface. DOES NOT support:
-	- cut-through mode
-	- AXI4 (non-lite)
-
-Required properties:
-- compatible: Should be one of:
-    "xlnx,axi-fifo-mm-s-4.1"
-    "xlnx,axi-fifo-mm-s-4.2"
-    "xlnx,axi-fifo-mm-s-4.3"
-- interrupt-names: Should be "interrupt"
-- interrupt-parent: Should be <&intc>
-- interrupts: Should contain interrupts lines.
-- reg: Should contain registers location and length.
-- xlnx,axi-str-rxd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-rxd-tdata-width: Should be <0x20>
-- xlnx,axi-str-txc-protocol: Should be "XIL_AXI_STREAM_ETH_CTRL"
-- xlnx,axi-str-txc-tdata-width: Should be <0x20>
-- xlnx,axi-str-txd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-txd-tdata-width: Should be <0x20>
-- xlnx,axis-tdest-width: AXI-Stream TDEST width (ignored by the driver)
-- xlnx,axis-tid-width: AXI-Stream TID width (ignored by the driver)
-- xlnx,axis-tuser-width: AXI-Stream TUSER width (ignored by the driver)
-- xlnx,data-interface-type: Should be <0x0> (ignored by the driver)
-- xlnx,has-axis-tdest: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tid: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tkeep: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tstrb: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tuser: Should be <0x0> (this feature isn't supported)
-- xlnx,rx-fifo-depth: Depth of RX FIFO in words
-- xlnx,rx-fifo-pe-threshold: RX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,rx-fifo-pf-threshold: RX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,s-axi-id-width: Should be <0x4> (ignored by the driver)
-- xlnx,s-axi4-data-width: Should be <0x20> (ignored by the driver)
-- xlnx,select-xpm: Should be <0x0> (ignored by the driver)
-- xlnx,tx-fifo-depth: Depth of TX FIFO in words
-- xlnx,tx-fifo-pe-threshold: TX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,tx-fifo-pf-threshold: TX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,use-rx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-rx-data: <0x1> if RX FIFO is enabled, <0x0> otherwise
-- xlnx,use-tx-ctrl: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-data: <0x1> if TX FIFO is enabled, <0x0> otherwise
-
-Example:
-
-axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
-	compatible = "xlnx,axi-fifo-mm-s-4.1";
-	interrupt-names = "interrupt";
-	interrupt-parent = <&intc>;
-	interrupts = <0 29 4>;
-	reg = <0x43c00000 0x10000>;
-	xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-rxd-tdata-width = <0x20>;
-	xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
-	xlnx,axi-str-txc-tdata-width = <0x20>;
-	xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-txd-tdata-width = <0x20>;
-	xlnx,axis-tdest-width = <0x4>;
-	xlnx,axis-tid-width = <0x4>;
-	xlnx,axis-tuser-width = <0x4>;
-	xlnx,data-interface-type = <0x0>;
-	xlnx,has-axis-tdest = <0x0>;
-	xlnx,has-axis-tid = <0x0>;
-	xlnx,has-axis-tkeep = <0x0>;
-	xlnx,has-axis-tstrb = <0x0>;
-	xlnx,has-axis-tuser = <0x0>;
-	xlnx,rx-fifo-depth = <0x200>;
-	xlnx,rx-fifo-pe-threshold = <0x2>;
-	xlnx,rx-fifo-pf-threshold = <0x1fb>;
-	xlnx,s-axi-id-width = <0x4>;
-	xlnx,s-axi4-data-width = <0x20>;
-	xlnx,select-xpm = <0x0>;
-	xlnx,tx-fifo-depth = <0x8000>;
-	xlnx,tx-fifo-pe-threshold = <0x200>;
-	xlnx,tx-fifo-pf-threshold = <0x7ffb>;
-	xlnx,use-rx-cut-through = <0x0>;
-	xlnx,use-rx-data = <0x0>;
-	xlnx,use-tx-ctrl = <0x0>;
-	xlnx,use-tx-cut-through = <0x0>;
-	xlnx,use-tx-data = <0x1>;
-};
-- 
2.53.0

