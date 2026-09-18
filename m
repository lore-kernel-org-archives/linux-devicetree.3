Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB043AC0C1
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789757943; cv=none; b=AxqIqYL+yf9ltKdlFadibA3bKSK9jyNPuHgv08oOm0euiyW2V4CExVifBPynV5xhWYS/2ya490PGHDwzEREu1OmfAUiX0XjBoK05wLoJyQGhX/3KVrhHsU50Bno1uejKEXQxSo17QfJy7Ct6KDg0IHeedDx7PJ0HJIZZubgORv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789757943; c=relaxed/simple;
	bh=/FbHT9o2WMbM0FApAIv7rH49v02xoqlz6GhTyHqXgcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GR1ivPYvy1UDL65ocDxN1IrYfKnriVrEZEfBXju+mGq8SHwYzsPAS4/Kfg0kx1rkp4V+frpdwtR8WlEYQG3Qz8Q18j4YQYAcVCNjHfNUi555dZmanDN4dnQftusqs98onHMu2d88QhRkClRYJchCU+Vg9Qg9DkHvj+1dCjB2+rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCEQTexq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCEQTexq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso11599755e9.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789757936; x=1790362736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSwV9QyihTEWzNpSev0Rq3JhnfzG5CYZv5DMfWp7kMA=;
        b=eCEQTexqQfROhlOufNWAVnxwNg9SWm7RaAT022ZnLAOUIea0CsR14jpof91q8EsiG1
         13FZi3S8s6rCIUNPkshvzhI67MK6tXQqpgaxMl3RDYfHjn8d/hs7vNDiGP0KM+4docgD
         Z4JvtoMtU+pyhXrfRtY+f0vhKjLfEAR6KLnHhrniSQu5AJ4UyrGBGVOvth3kWdjndtHn
         XlLadJVQYInIQDQ6lujzRHHkX4mG5QB0I+jlijx5qanq4RmU0SCKJ6+BxWjfG68qroPJ
         Xiv+p0rK3b/b0dE6pfE6YhiBcoOInCY48KzI4gvemEaBQ+1aQ670QvV8iVu2r5AYqyHm
         A+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789757936; x=1790362736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSwV9QyihTEWzNpSev0Rq3JhnfzG5CYZv5DMfWp7kMA=;
        b=iCrGTmH8dMYdUqkPb2+2kuR9u7GQLXuGthmsG/FtxqRAhHO59ypl6vc/IFTQDPe1MB
         HlW85ZhDcZaDTFG3+LrSdC3VB2wbTg4QoK2AfJy+aU3eSicCHaIH0SOAdcO4J/HPNmtM
         wemT9EJIG3lBZYa73G8UP1w7MPclmGa/Tgea0pKB5hHJknciU1M7hBPqnxlKqFtm0sXq
         FU/6z/yCwhZTsmHcij0EnEssUVyjsFujl0yXmG15mE+X98esirUMfyj3eW37shwpIgIm
         Wp+Xy+plYcHDezB+peWXmrOhMcKDI0D1ygzRoZz7bnhOgufD4U8vPtrmdouMvjzflD4k
         SG3g==
X-Forwarded-Encrypted: i=1; AKwUvByZRF2IPWmv5+U8zKxuX/NzuuveJGlVgj2d/+SmQvVXWbnXMvRKeJJ+2iAz1izTYTsg/wlBB2gJ5sxJ@vger.kernel.org
X-Gm-Message-State: AFuF++me7uRsn3IiehTsEENvLDnP3+w7nYEtYXO6QK5oo7X3UwSBgaS9
	APmxCrnKNml5lPeLXYHDk2JU4CAzrRvrU2Zay2HtVQ9ZLcs/pWSkFu4r
X-Gm-Gg: AYBFou0xjdUHeNpJiTyApDy26YLdLBn8G+HLTDJshvwAv2Opx0KsozffVlf1XE9UhPg
	7kZm8MaDdp1Z5z0js3xc3Nl6fzLVuwsOUIwETpk5kOXPqdXIeMyoCx6Tmkt4IMrf2lD7NiStKhi
	ybSRvz/eBFIMyDDYb0TJGFH2zujZd/x3fbN5IsgVq26JqOF0YMGK5QgEDzeTL+GpFHc1k7LNE3K
	O4GXYjlEFhQQK9JDvZjTF7710MZRMcDRluY0IHaVMMGQ1Of/QEGdRbpuOu30ZIv7NULlEN9yKTJ
	2GJQh1fff5aauyaGt/AeZa6kcKhhQwrEJCm4U1126SmexTf7O+NkompKkaZeJFqcgT6gLaB5Hen
	IBFP77cfvIOnnubnLWdyebdc233Y7/XNK8AjJ7fWAjiY8CzFsZmBuqXsFFvCYc+5zrxD5KAyn64
	jrSBULGJTLo9QZwYhJ6P21OUANvMRDkNCkrkWF8kuCXotzMfKImQ5ztG7LxkiBJUn69q2Qt+Ocs
	hzPiOARYGOFMF3x2Y+82e41wAJJKhv54ynms26W0hAzL3o=
X-Received: by 2002:a05:600c:3512:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49fc56aee64mr48011805e9.12.1789757936371;
        Fri, 18 Sep 2026 11:58:56 -0700 (PDT)
Received: from localhost.localdomain ([176.220.123.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eab91sm14380145e9.1.2026.09.18.11.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:58:55 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
Date: Fri, 18 Sep 2026 21:58:06 +0300
Message-ID: <20260918185813.5070-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918174809.17502-1-palaomer100@gmail.com>
References: <20260918174809.17502-1-palaomer100@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add yaml devicetree binding for xlnx,zynq-xadc-1.00.a,
xlnx,axi-xadc-1.00.a and xlnx,system-management-wiz-1.3 from
xilinx-xadc.txt file.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 PATCH v3 Details:
 - Fixed $schema URI: "schemas/meta-schema.yaml#" -> "meta-schemas/core.yaml#"
 - Added "required: [xlnx,external-mux]" to each allOf/if block so the
  none/single/dual mux conditionals only match when the property is
  actually set, not just absent

 .../bindings/iio/adc/xilinx-xadc.txt          | 141 -------------
 .../bindings/iio/adc/xlnx,xadc.yaml           | 191 ++++++++++++++++++
 2 files changed, 191 insertions(+), 141 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
deleted file mode 100644
index f42e18078..000000000
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
index 000000000..ffaada52f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
@@ -0,0 +1,191 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/xlnx,xadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx XADC device driver
+
+maintainers:
+  - Omer PALA <palaomer100@gmail.com>
+
+description: |
+  This binding document describes the bindings for the Xilinx 7 Series XADC as well
+  as the UltraScale/UltraScale+ System Monitor.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,zynq-xadc-1.00.a
+      - xlnx,axi-xadc-1.00.a
+      - xlnx,system-management-wiz-1.3
+
+  reg:
+    description: Address and length of the register set for the device
+    maxItems: 1
+
+  interrupts:
+    description: Interrupt for the XADC control interface.
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupt-parent: true
+
+  xlnx,external-mux:
+    description: Selects the external mux mode.
+    enum: [none, single, dual]
+    default: none
+
+  xlnx,external-mux-channel:
+    description: >
+      Configures which pair of pins is used to sample data in
+      external mux mode.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,channels:
+    type: object
+    description: List of external channels that are connected to the ADC.
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+    required:
+      - "#address-cells"
+      - "#size-cells"
+    patternProperties:
+      "^channel@[0-9a-f]+$":
+        type: object
+        properties:
+          reg:
+            description: Pair of pins the channel is connected to
+            minimum: 0
+            maximum: 16
+          xlnx,bipolar:
+            description: If set the channel is used in bipolar mode.
+            $ref: /schemas/types.yaml#/definitions/flag
+        required:
+          - reg
+        additionalProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        xlnx,external-mux:
+          const: none
+      required:
+        - xlnx,external-mux
+    then:
+      properties:
+        xlnx,external-mux-channel: false
+
+  - if:
+      properties:
+        xlnx,external-mux:
+          const: single
+      required:
+        - xlnx,external-mux
+    then:
+      properties:
+        xlnx,external-mux-channel:
+          minimum: 0
+          maximum: 16
+      required:
+        - xlnx,external-mux-channel
+
+  - if:
+      properties:
+        xlnx,external-mux:
+          const: dual
+      required:
+        - xlnx,external-mux
+    then:
+      properties:
+        xlnx,external-mux-channel:
+          minimum: 1
+          maximum: 8
+      required:
+        - xlnx,external-mux-channel
+
+examples:
+  - |
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      xadc@f8007100 {
+        compatible = "xlnx,zynq-xadc-1.00.a";
+        reg = <0xf8007100 0x20>;
+        interrupts = <0 7 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&pcap_clk>;
+
+        xlnx,external-mux = "single";
+        xlnx,external-mux-channel = <0>;
+
+        xlnx,channels {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          channel@0 {
+            reg = <0>;
+          };
+          channel@1 {
+            reg = <1>;
+          };
+          channel@8 {
+            reg = <8>;
+          };
+        };
+      };
+      xadc@43200000 {
+        compatible = "xlnx,axi-xadc-1.00.a";
+        reg = <0x43200000 0x1000>;
+        interrupts = <0 53 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,external-mux = "single";
+        xlnx,external-mux-channel = <0>;
+
+        xlnx,channels {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          channel@0 {
+            reg = <0>;
+            xlnx,bipolar;
+          };
+        };
+      };
+      adc@80000000 {
+        compatible = "xlnx,system-management-wiz-1.3";
+        reg = <0x80000000 0x1000>;
+        interrupts = <0 81 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,external-mux = "single";
+        xlnx,external-mux-channel = <0>;
+
+        xlnx,channels {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          channel@0 {
+            reg = <0>;
+            xlnx,bipolar;
+          };
+        };
+      };
+    };
-- 
2.55.0

