Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B544049A3DD
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589608; cv=none; b=gHhmndYxgJP3KCmT+fehqVqVSFk/4Wy3O9VU4WIomjD4zhnr8phMePfLdhPvHJIkH8fOdNm7CBD5zttNjiSclK9v5ymVx5MhonU8tefFEuKpi9izmeug7VxWIQ9A5yLEwU7R44KCWP9qEnqHfLUjzHKElnhtW3iZYD9Z0yVozy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589608; c=relaxed/simple;
	bh=uwMGDDuWtKUoJStwXibNUSxN2BNOlX8rRHbGS9jiREE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VDHmA/dCsp2bvMBbJTxyYpUwXTdo7jB5/REUdn5PO6W87bMRSBF+tBchG38ljxkcnPC4fGTLgqEjRwehpHSIl+G4Z4C0KjmqJfw8UaXDyEaqM9O1pOfNE3IZyW/4TGrqOsOQQCNALZYW6TjDhdz7k2bim4onJ1mQTEVM9cCFbxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5lErooi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5lErooi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso1238505e9.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789589580; x=1790194380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYhx8ZxTsScYWYyqDbVe9Rlssw/WyreTZuU/4EjcUrc=;
        b=X5lErooifYQ/zgsKns2ujeL1r78+zZ+5INEaP/H2FeQN80Ba9NEQCxUdjT7lTmGXGg
         ZtBM7ZfBNWGdYuboIel5WRHDoc/htr8WQsEou6r381Z4ynhwWfUCE6tn8uAL1FaQoVWj
         Rh88IRdGugn8eu7ykHszgzhVo+8h6rPrYVsCEqpV+1NVot0QzWdlbnC3Bh9bqXJzT+8G
         GpEznnaIJUAG6upNB9ebRyaMZUGTSzRjvWMpvFntMWvDtXWyYostuIZV2ppAA0RdArPs
         VsH49uOMi+Os7J8Z9QrppJZVy4Ap0oZB/N5+mA11FTv2bnkSrzUYZVc0yQmztNgySvIJ
         xN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789589580; x=1790194380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aYhx8ZxTsScYWYyqDbVe9Rlssw/WyreTZuU/4EjcUrc=;
        b=cS5eE2Ajt/eN61gwS5ojUc0ZrQ5cj43/IyV+dzNTZfY3e6SfW4RZuRPxayru+khItr
         H+sC6A9m8Whc/5b2gFlW67pWGUENn+QvEouYyuddFvEtiMDWPe615iSYz1gZKT/gtFIa
         1SNca5FMUBVa60suzllIkwrR1bS5IyAG+7GgExowckEMpjL2s/ScwX8XF5kOf1PU1sNg
         n5knvRIZLQxZl8JQN284sIKn0vRQIwblf3MpdhwhCnD2XYj0T7ohmzMLIOER7vKlhnS2
         AH5dLwJpqMKLmgEytO5BUcNUv1ClKEygTcncmMqciT/Yd8BmUm9Drmq46WBCSMzX8Zk4
         FtpA==
X-Forwarded-Encrypted: i=1; AKwUvBzNYuaMU/E8Pt5mvhdJIUg9TPIhND4jV2Kn7SDV76gHUbYd81Uhjl10sqN9qJPM4NaJELF7kPE/iuEm@vger.kernel.org
X-Gm-Message-State: AFuF++kJdPyGEp0qTk/p2odgXAbmshRSTQ3PqFLYnrHeDSpaT4LByFbG
	146Yp81NjP3kPOFh1VZXthvMeMf9g0sVAFOqqW3vZU5by9PYPbDVAYg3MUcv0blN
X-Gm-Gg: AYBFou1XDuITtPZ6LJIa0adWR0PUGcPeqid+QhhdxmgSwg3ZrK9WtkyEhiJBVO+okWX
	IX0Ls3tOzadXe0/E4AuglzupvXGdmed7DrITdoqAB/0PUeNv/BeoeLiiDYlLLfgDxwBEwv8oXc1
	5Be9zdRJOTuJtUFfm3S3FdgTcOI57WBLGEwe59fX2GmflK/E4viX68JPkxY/oSQiqijzRS+DCei
	zJuuQKx5HgC7ZEB7dgbYfG4+qNDjkSqfUvRzwidXMG5cF2ocUgrYPPxYiX4kDOUKGPT/TruCVZB
	rZEPmgR6q+u40LNKCd4ys/quibgVTdTmxzT9vQDihhAGK3W+uTJFrom51NZo53LzFlTMpuklkxY
	NKGQlw7XpdlI+0zCdi/D8guYj6HVDTafz2UQ4o1ZUeAra5YVrKK5DvhJe2Uz7xah8qBb//quOh2
	Niike9WEpGHpKbiNtB5Ux5wnDAGbA47EngONJ3S37uW9ylbkLjuIgq+QZQ6+C2hlbMtQkzZoY/1
	9B299fUT4Lo+0SJ
X-Received: by 2002:a05:600c:1f96:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-49eb51902d9mr45307715e9.8.1789589580117;
        Wed, 16 Sep 2026 13:13:00 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:ce1c:cd76:6ea7:d213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda77d6fsm5484125e9.0.2026.09.16.13.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:12:59 -0700 (PDT)
From: Daniel Matyas <matyasdaniel005@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matyasdaniel005@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] dt-bindings: axis-fifo: Added missing binding
Date: Wed, 16 Sep 2026 23:11:50 +0300
Message-ID: <20260916201253.483877-1-matyasdaniel005@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/staging/axis-fifo/axis-fifo.txt file described how the
devicetree of the driver should look like. Convert it to .yaml file.
Issue found by checkpatch.

Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
---
 .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..ef1e6bcf782d
--- /dev/null
+++ b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,257 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/axis-fifo/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO v4.1 IP core
+
+maintainers:
+  - Daniel Matyas <matyasdaniel005@gmail.com>
+
+description: |
+  This IP core has read and write AXI-Stream FIFOs, the contents of which can
+  be accessed from the AXI4 memory-mapped interface. This is useful for
+  transferring data from a processor into the FPGA fabric. The driver creates
+  a character device that can be read/written to with standard
+  open/read/write/close.
+
+  See Xilinx PG080 document for IP details.
+
+  Currently supports only store-forward mode with a 32-bit AXI4-Lite
+  interface. DOES NOT support:
+    - cut-through mode
+    - AXI4 (non-lite)
+
+properties:
+  compatible:
+    enum:
+      - xlnx,axis-fifo-mm-s-4.1
+      - xlnx,axis-fifo-mm-s-4.2
+      - xlnx,axis-fifo-mm-s-4.3
+
+  interrupt-names:
+    const: interrupt
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  xlnx,axi-str-rxd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_DATA
+    description: AXI4-Stream RX data protocol
+
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: AXI4-Stream RX data width
+
+  xlnx,axi-str-txc-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_CTRL
+    description: AXI4-Stream TX control protocol
+
+  xlnx,axi-str-txc-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: AXI4-Stream TX control data width
+
+  xlnx,axi-str-txd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_DATA
+    description: AXI4-Stream TX data protocol
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: AXI4-Stream TX data width
+
+  xlnx,axis-tdest-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TDEST width (ignored by the driver)
+
+  xlnx,axis-tid-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TID width (ignored by the driver)
+
+  xlnx,axis-tuser-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TUSER width (ignored by the driver)
+
+  xlnx,data-interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: ignored by the driver
+
+  xlnx,has-axis-tdest:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tkeep:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tstrb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tuser:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of RX FIFO in words
+
+  xlnx,rx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RX programmable empty interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,rx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RX programmable full interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,s-axi-id-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x4
+    description: ignored by the driver
+
+  xlnx,s-axi4-data-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: ignored by the driver
+
+  xlnx,select-xpm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: ignored by the driver
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of TX FIFO in words
+
+  xlnx,tx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TX programmable empty interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,tx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TX programmable full interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,use-rx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0x0, 0x1]
+    description: <0x1> if RX FIFO is enabled, <0x0> otherwise
+
+  xlnx,use-tx-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,use-tx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0x0, 0x1]
+    description: <0x1> if TX FIFO is enabled, <0x0> otherwise
+
+required:
+  - compatible
+  - interrupt-names
+  - interrupts
+  - reg
+  - xlnx,axi-str-rxd-protocol
+  - xlnx,axi-str-rxd-tdata-width
+  - xlnx,axi-str-txc-protocol
+  - xlnx,axi-str-txc-tdata-width
+  - xlnx,axi-str-txd-protocol
+  - xlnx,axi-str-txd-tdata-width
+  - xlnx,axis-tdest-width
+  - xlnx,axis-tid-width
+  - xlnx,axis-tuser-width
+  - xlnx,data-interface-type
+  - xlnx,has-axis-tdest
+  - xlnx,has-axis-tid
+  - xlnx,has-axis-tkeep
+  - xlnx,has-axis-tstrb
+  - xlnx,has-axis-tuser
+  - xlnx,rx-fifo-depth
+  - xlnx,rx-fifo-pe-threshold
+  - xlnx,rx-fifo-pf-threshold
+  - xlnx,s-axi-id-width
+  - xlnx,s-axi4-data-width
+  - xlnx,select-xpm
+  - xlnx,tx-fifo-depth
+  - xlnx,tx-fifo-pe-threshold
+  - xlnx,tx-fifo-pf-threshold
+  - xlnx,use-rx-cut-through
+  - xlnx,use-rx-data
+  - xlnx,use-tx-ctrl
+  - xlnx,use-tx-cut-through
+  - xlnx,use-tx-data
+
+additionalProperties: false
+
+examples:
+  - |
+    axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
+      compatible = "xlnx,axi-fifo-mm-s-4.1";
+      interrupt-names = "interrupt";
+      interrupt-parent = <&intc>;
+      interrupts = <0 29 4>;
+      reg = <0x43c00000 0x10000>;
+      xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+      xlnx,axi-str-rxd-tdata-width = <0x20>;
+      xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
+      xlnx,axi-str-txc-tdata-width = <0x20>;
+      xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+      xlnx,axi-str-txd-tdata-width = <0x20>;
+      xlnx,axis-tdest-width = <0x4>;
+      xlnx,axis-tid-width = <0x4>;
+      xlnx,axis-tuser-width = <0x4>;
+      xlnx,data-interface-type = <0x0>;
+      xlnx,has-axis-tdest = <0x0>;
+      xlnx,has-axis-tid = <0x0>;
+      xlnx,has-axis-tkeep = <0x0>;
+      xlnx,has-axis-tstrb = <0x0>;
+      xlnx,has-axis-tuser = <0x0>;
+      xlnx,rx-fifo-depth = <0x200>;
+      xlnx,rx-fifo-pe-threshold = <0x2>;
+      xlnx,rx-fifo-pf-threshold = <0x1fb>;
+      xlnx,s-axi-id-width = <0x4>;
+      xlnx,s-axi4-data-width = <0x20>;
+      xlnx,select-xpm = <0x0>;
+      xlnx,tx-fifo-depth = <0x8000>;
+      xlnx,tx-fifo-pe-threshold = <0x200>;
+      xlnx,tx-fifo-pf-threshold = <0x7ffb>;
+      xlnx,use-rx-cut-through = <0x0>;
+      xlnx,use-rx-data = <0x0>;
+      xlnx,use-tx-ctrl = <0x0>;
+      xlnx,use-tx-cut-through = <0x0>;
+      xlnx,use-tx-data = <0x1>;
+    };
+...
-- 
2.43.0

