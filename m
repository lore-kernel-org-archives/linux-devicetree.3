Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1434750B
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778350070; cv=none; b=JEqJDq5CE1cbITLzPxCBiYKkgFi+w2RjOHw1UXtLm/X8u2J23iExEPbi2EnIXv5TVbrlcnEMNN3g5IMLnketjnNsZJDTVu77h1XIaLWVWzGnEQ4eZRxIPuHN0nREtoinbauE+ZnAjIVktnOHS9ywaag4pmkGWEqeRXcYESW9M3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778350070; c=relaxed/simple;
	bh=GoCoxfzQpBvPwQmuGxwI0C4sTzQ184QwchDvK5L4QJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eb2LYVt4Ys8ilqD2YSYFmW7DB1hS2orlCihu9WB6N47P3L2G1JJhgEXa8akRNMdGJEwFbFRDptEWnGrkHv6xG8ra3rJoI4NVRkWloC2F4SYpKOCx9/Vb3jjgaEuk5FWGnl0Q/x3AMNjMQJeQU5rc3tPJk6TSusZn4b7+ZKBPNpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtTubtk9; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtTubtk9"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1261923b3a.0
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778350068; x=1778954868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5rZ3mxgfICvz9bbe7aRFUF9gV3csPbhzGjwc0x281Y=;
        b=UtTubtk9rD+jMcu1pZhFwRgd1MKDtfkVWrj9M4APMndiYNRBsq9DZHlMjnMgv1jOJz
         NPvnn+J2Xb7AgQyOxDE8P0Bu0+fo7byLYba7sr5qYla+1dfXCJJr/2sAvc5id03G5BqG
         zb2feCN0izKKdAAqbIg09z6TOHgS/osVhd2SgFL4nptNmZm25fwO++K/dqpIUY50HqrJ
         knRyyaH0XoCgfsOCIV1loFjWdEXpStLe3RYAfGGycXjsXSdW4Jr7n6riVGixPgKeqoAP
         znXTp0+gmk29HMTxqQbejK2qK3Vvm7zItGLlwC9zXEmXCBtJ1iV9F+4B2trAHjmSIjeK
         Q5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778350068; x=1778954868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5rZ3mxgfICvz9bbe7aRFUF9gV3csPbhzGjwc0x281Y=;
        b=oEI9wwuQoS4gmULMMhn2FnwjoebELJVOwNT/+JbXm5rYzkrzYBYw0cCIanis+C9EHE
         s8Ixi6PEfwNT+ZxurO8X6FX7IIzbQGCG0H7s3R4jvZO8HDH3juX/p/KJS8XSSJTJp5lr
         t7B/4Vn0sWrCq9iQMGuNJiVdDK+OKXWR6yONo2oEx45k0CQd+eSuJ9XG3rj1PchS+Fc2
         HPc+VXzwjMRnsgbF7eCkWs5kI8DDi5pP9AIAxNJOXKm5sUajk2U8xwuLRqJQR6XKXiAL
         uxc8eGFT7GwLcLkVojjmp/0C2GGpGU1GXRjGg8h8BsBoN4TzkwOWf/+GuqhimWvGh4OQ
         Bc5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+02p5Hy8KbowjOwNT/FCJT61GeuLsBHBqmXXKSiwCsIbcg4+2hH6EbZ3Kg5IFCKdzaSWE4kuchz0Gu@vger.kernel.org
X-Gm-Message-State: AOJu0YzGJCnLvP7Cew9lXN5m0VWW5NaUeojS7Hqh6plRWzrPgtdIs3CW
	ysnvoS+cKcxvtlucZv2nKQEgnIXCoBykxt7j5+1jiFNxOMSGxkwaLdg6BlpCYTOEmz8=
X-Gm-Gg: Acq92OFuvDjO5yZx5MRBvVb+x/QZ+fUZNo5uDGGksTEwqapOnIM9UTbV/8N6Qmjuk0Y
	rmv0ORk5cCbxbvzYY4s6OhT9LFg0I9WtmBCUhzOoUvLtGlbF8HVyK5uc5KomIK4A3T9o06YQtB+
	QMIS3P1LDWGeBTBzKdKZfm43wf9tgJklt3AUmg0Cgfq+Ihkhxr8GkuHo1ByID72fYHcmN5LAvdc
	zowu+40GBZRXyAPGmI9ePt0ONKYnQls0wRTGlFuUdZUK5rYnouJ7qD6Eo3m8R+7dnO+OG4lqC+A
	972FU02Bd9FsdQboSEADiQ738CMjGrtfXLn1r6+kv9BvQ6cbqIieHvX37KhsMhN5AQbslihSwuo
	8tVnxmV9BbiP2f/LCpAXKkeiE7wgJyHWCEfrjFNxu9L/Ill/C+dgmH1IDkkRQCr+uHiw7qJclcV
	0kYerZonyteO9qnbfDxEeJ4os/ZfpR2wBDu1ngF+X08CWVkZx0sR4=
X-Received: by 2002:a05:6a00:929d:b0:82c:6b1b:7ad4 with SMTP id d2e1a72fcca58-83e3955033bmr3066956b3a.3.1778350068047;
        Sat, 09 May 2026 11:07:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm16044884b3a.19.2026.05.09.11.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 11:07:47 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: jic23@kernel.org
Cc: pramod.nexgen@gmail.com,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: iio: adc: Convert xilinx-xadc bindings to YAML schema
Date: Sat,  9 May 2026 14:07:14 -0400
Message-ID: <20260509180719.53704-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Xilinx XADC and UltraScale System Monitor device tree binding
from the legacy plain-text format to a YAML schema, enabling automated
validation with dt-schema.

The new binding covers the same hardware and compatible strings:
  - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
  - xlnx,axi-xadc-1.00.a  (AXI softmacro)
  - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizard)

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
Changes in v2:
- Fix patternProperties regex to use lowercase hex unit addresses
  (channel@a through channel@f) instead of decimal; correct range
  is now "^channel@([0-9a-f]|10)$"
- Add allOf/if/then conditional to enforce xlnx,external-mux-channel
  is required when xlnx,external-mux is "single" or "dual"

 .../bindings/iio/adc/xilinx-xadc.txt          | 141 ------------
 .../bindings/iio/adc/xlnx,xadc.yaml           | 204 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 3 files changed, 211 insertions(+), 141 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
deleted file mode 100644
index f42e18078376..000000000000
--- a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
+++ /dev/null
@@ -1,141 +0,0 @@
-Xilinx XADC device driver
-
-This binding document describes the bindings for the Xilinx 7 Series XADC as well
-as the UltraScale/UltraScale+ System Monitor.
-
-The Xilinx XADC is an ADC that can be found in the Series 7 FPGAs from Xilinx.
-The XADC has a DRP interface for communication. Currently two different
-frontends for the DRP interface exist. One that is only available on the ZYNQ
-family as a hardmacro in the SoC portion of the ZYNQ. The other one is available
-on all series 7 platforms and is a softmacro with a AXI interface. This binding
-document describes the bindings for both of them since the bindings are very
-similar.
-
-The Xilinx System Monitor is an ADC that is found in the UltraScale and
-UltraScale+ FPGAs from Xilinx. The System Monitor provides a DRP interface for
-communication. Xilinx provides a standard IP core that can be used to access the
-System Monitor through an AXI interface in the FPGA fabric. This IP core is
-called the Xilinx System Management Wizard. This document describes the bindings
-for this IP.
-
-Required properties:
-	- compatible: Should be one of
-		* "xlnx,zynq-xadc-1.00.a": When using the ZYNQ device
-		  configuration interface to interface to the XADC hardmacro.
-		* "xlnx,axi-xadc-1.00.a": When using the axi-xadc pcore to
-		  interface to the XADC hardmacro.
-		* "xlnx,system-management-wiz-1.3": When using the
-		  Xilinx System Management Wizard fabric IP core to access the
-		  UltraScale and UltraScale+ System Monitor.
-	- reg: Address and length of the register set for the device
-	- interrupts: Interrupt for the XADC control interface.
-	- clocks: When using the ZYNQ this must be the ZYNQ PCAP clock,
-	  when using the axi-xadc or the axi-system-management-wizard this must be
-	  the clock that provides the clock to the AXI bus interface of the core.
-
-Optional properties:
-	- xlnx,external-mux:
-		* "none": No external multiplexer is used, this is the default
-		  if the property is omitted.
-		* "single": External multiplexer mode is used with one
-		   multiplexer.
-		* "dual": External multiplexer mode is used with two
-		  multiplexers for simultaneous sampling.
-	- xlnx,external-mux-channel: Configures which pair of pins is used to
-	  sample data in external mux mode.
-	  Valid values for single external multiplexer mode are:
-		0: VP/VN
-		1: VAUXP[0]/VAUXN[0]
-		2: VAUXP[1]/VAUXN[1]
-		...
-		16: VAUXP[15]/VAUXN[15]
-	  Valid values for dual external multiplexer mode are:
-		1: VAUXP[0]/VAUXN[0] - VAUXP[8]/VAUXN[8]
-		2: VAUXP[1]/VAUXN[1] - VAUXP[9]/VAUXN[9]
-		...
-		8: VAUXP[7]/VAUXN[7] - VAUXP[15]/VAUXN[15]
-
-	  This property needs to be present if the device is configured for
-	  external multiplexer mode (either single or dual). If the device is
-	  not using external multiplexer mode the property is ignored.
-	- xnlx,channels: List of external channels that are connected to the ADC
-	  Required properties:
-		* #address-cells: Should be 1.
-		* #size-cells: Should be 0.
-
-	  The child nodes of this node represent the external channels which are
-	  connected to the ADC. If the property is no present no external
-	  channels will be assumed to be connected.
-
-	  Each child node represents one channel and has the following
-	  properties:
-		Required properties:
-			* reg: Pair of pins the channel is connected to.
-				0: VP/VN
-				1: VAUXP[0]/VAUXN[0]
-				2: VAUXP[1]/VAUXN[1]
-				...
-				16: VAUXP[15]/VAUXN[15]
-			  Note each channel number should only be used at most
-			  once.
-		Optional properties:
-			* xlnx,bipolar: If set the channel is used in bipolar
-			  mode.
-
-
-Examples:
-	xadc@f8007100 {
-		compatible = "xlnx,zynq-xadc-1.00.a";
-		reg = <0xf8007100 0x20>;
-		interrupts = <0 7 4>;
-		interrupt-parent = <&gic>;
-		clocks = <&pcap_clk>;
-
-		xlnx,channels {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			channel@0 {
-				reg = <0>;
-			};
-			channel@1 {
-				reg = <1>;
-			};
-			channel@8 {
-				reg = <8>;
-			};
-		};
-	};
-
-	xadc@43200000 {
-		compatible = "xlnx,axi-xadc-1.00.a";
-		reg = <0x43200000 0x1000>;
-		interrupts = <0 53 4>;
-		interrupt-parent = <&gic>;
-		clocks = <&fpga1_clk>;
-
-		xlnx,channels {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			channel@0 {
-				reg = <0>;
-				xlnx,bipolar;
-			};
-		};
-	};
-
-	adc@80000000 {
-		compatible = "xlnx,system-management-wiz-1.3";
-		reg = <0x80000000 0x1000>;
-		interrupts = <0 81 4>;
-		interrupt-parent = <&gic>;
-		clocks = <&fpga1_clk>;
-
-		xlnx,channels {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			channel@0 {
-				reg = <0>;
-				xlnx,bipolar;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
new file mode 100644
index 000000000000..cfe753e3e8d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/xlnx,xadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx XADC and UltraScale System Monitor
+
+maintainers:
+  - Lars-Peter Clausen <lars@metafoo.de>
+
+description: |
+  The Xilinx XADC is an ADC found in the Series 7 FPGAs. It has a DRP
+  (Dynamic Reconfiguration Port) interface for communication. Two different
+  frontends for the DRP interface are supported:
+
+    - ZYNQ hardmacro: available only on the ZYNQ family as a hardmacro in
+      the SoC portion of the ZYNQ device.
+    - AXI softmacro: available on all Series 7 platforms as a softmacro
+      with an AXI interface (PG019).
+
+  The Xilinx System Monitor is an ADC found in UltraScale and UltraScale+
+  FPGAs. It is accessed through the Xilinx System Management Wizard IP core
+  via an AXI interface in the FPGA fabric.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,zynq-xadc-1.00.a
+      - xlnx,axi-xadc-1.00.a
+      - xlnx,system-management-wiz-1.3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: |
+      When using the ZYNQ this must be the ZYNQ PCAP clock.
+      When using the axi-xadc or system-management-wiz this must be
+      the clock that provides the clock to the AXI bus interface.
+    maxItems: 1
+
+  xlnx,external-mux:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Selects the external multiplexer mode.
+    enum:
+      - none
+      - single
+      - dual
+
+  xlnx,external-mux-channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Configures which pair of pins is used to sample data in external
+      multiplexer mode. This property is required when the device is
+      configured for external multiplexer mode.
+
+      Valid values for single external multiplexer mode:
+        0: VP/VN
+        1-16: VAUXP[0]/VAUXN[0] through VAUXP[15]/VAUXN[15]
+
+      Valid values for dual external multiplexer mode:
+        1: VAUXP[0]/VAUXN[0] - VAUXP[8]/VAUXN[8]
+        2: VAUXP[1]/VAUXN[1] - VAUXP[9]/VAUXN[9]
+        ...
+        8: VAUXP[7]/VAUXN[7] - VAUXP[15]/VAUXN[15]
+    minimum: 0
+    maximum: 16
+
+  xlnx,channels:
+    type: object
+    description:
+      List of external channels connected to the ADC. If this property is
+      absent, no external channels are assumed to be connected.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^channel@([0-9a-f]|10)$":
+        type: object
+        description:
+          Represents an external channel connected to the ADC.
+
+        properties:
+          reg:
+            description: |
+              Pair of pins the channel is connected to.
+                0: VP/VN
+                1: VAUXP[0]/VAUXN[0]
+                2: VAUXP[1]/VAUXN[1]
+                ...
+                16: VAUXP[15]/VAUXN[15]
+            minimum: 0
+            maximum: 16
+
+          xlnx,bipolar:
+            $ref: /schemas/types.yaml#/definitions/flag
+            type: boolean
+            description:
+              If set, the channel is used in bipolar mode.
+
+        required:
+          - reg
+
+        additionalProperties: false
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+    additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        xlnx,external-mux:
+          enum:
+            - single
+            - dual
+      required:
+        - xlnx,external-mux
+    then:
+      required:
+        - xlnx,external-mux-channel
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    /* ZYNQ hardmacro example */
+    adc@f8007100 {
+        compatible = "xlnx,zynq-xadc-1.00.a";
+        reg = <0xf8007100 0x20>;
+        interrupts = <0 7 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&pcap_clk>;
+
+        xlnx,channels {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            channel@0 {
+                reg = <0>;
+            };
+            channel@1 {
+                reg = <1>;
+            };
+            channel@8 {
+                reg = <8>;
+            };
+        };
+    };
+
+  - |
+    /* AXI softmacro example */
+    adc@43200000 {
+        compatible = "xlnx,axi-xadc-1.00.a";
+        reg = <0x43200000 0x1000>;
+        interrupts = <0 53 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,channels {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            channel@0 {
+                reg = <0>;
+                xlnx,bipolar;
+            };
+        };
+    };
+
+  - |
+    /* UltraScale System Management Wizard example */
+    adc@80000000 {
+        compatible = "xlnx,system-management-wiz-1.3";
+        reg = <0x80000000 0x1000>;
+        interrupts = <0 81 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,channels {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            channel@0 {
+                reg = <0>;
+                xlnx,bipolar;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..9b107057ad8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29226,6 +29226,13 @@ F:	Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml
 F:	drivers/watchdog/of_xilinx_wdt.c
 F:	drivers/watchdog/xilinx_wwdt.c
 
+XILINX XADC DRIVER
+M:	Lars-Peter Clausen <lars@metafoo.de>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
+F:	drivers/iio/adc/xilinx-xadc*
+
 XILINX XDMA DRIVER
 M:	Lizhi Hou <lizhi.hou@amd.com>
 M:	Brian Xu <brian.xu@amd.com>
-- 
2.52.0

