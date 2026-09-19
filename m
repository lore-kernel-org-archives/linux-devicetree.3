Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04E8381EAD
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786749; cv=none; b=PeGZhOEV3wK3tZ2eaCHtO8+mAgmnhLwVpBvdlPw8monXBGRMo3lAr3nRbBjwq4c152lufO39/J3gBSHZatu/e5vHvNwdq9JaGZNBnYzKQNh0b+zpVdrtjcBcelJTdqwxMwG4kW69oJJR3CqeBmYyjpvgwYuwwIYZdr/hLxCH9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786749; c=relaxed/simple;
	bh=7SO7huozNpC8xsd0EcEChJm70n1+Di7oMJy3Qo+WZec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aeEnVmTMA/uGaQrc7zgdObn8+73Wk8FTkXw3DaO9yiO+1+PYRMFsofQ7zKrccrN3B6jsOPJuZpX8WokOcpW1TddeBvfs6z5dHTXGii4oENRxB7hbst/jMhtj/cwK08KI3y6xZZFkxdFS4Z8210Bn8OOm7KEvwg7jvm27Mmj21Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAwv8nC0; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAwv8nC0"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6b1ae740487so849802eaf.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789786746; x=1790391546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWNlP+9LIuJK/Y0IQA0euuofWcsmhE5Bep7bJpGdEx0=;
        b=gAwv8nC0vyXQJIvwvILOfTuWPeDqUkdYi1eZVsDpmhEtaqwiH1gdoSaKqUp/XcabaI
         W9tEIw+EM1wuT1Wx0xq8/Wgvd4wRmHPIEH+WWk6Azx30oEbstBQ9jDC41mTkkuH1zVOH
         vyBsP4/pMj77PHb3/3H9T5pRhgvCEZTLkg9hkitzgtnnIibJDR5PhUm/NhepNffryZWU
         BPmEhWBE28ABOsDdLLKImHigChUKmDbZYb3ymF42cQ33ufhcWdv6onH8Jw820GEDTueT
         j59ymKcmeB13aa6H1R51hOvbhiUJS+9EyWoZFM6+cdhvYyaCWcorky/J1DCNG9njIZn4
         RkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786746; x=1790391546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oWNlP+9LIuJK/Y0IQA0euuofWcsmhE5Bep7bJpGdEx0=;
        b=SD0GIo1WL+MKOu5mwq/CFq7NATgTt/a5GLCKAovMG3Iu+2enQisOrdcfkQF0qAv4sg
         +v58bR5FWgBXq9T+7EOhDIHK9CaMxCfX9F3ka9uQtErVF74v/Y4V+6v4K3zyf33/d2LZ
         wLleHBXUaJPztcrN+UO61KvfMkxCw008dFch9lxL+tnaCnQnY7I1z2MPryt646FLQAkw
         tNKbijOYfiYWV9M1EdgbgoOjXT+UckUR81s7vJNnsWM2p7xmpx+OYjlksQRr8xWQ1PCO
         4kuNBiJIq2uzlMzCBASo6ZvyfmPuxvJEsKm3soVZuzrsQeKOovLQ8bMK3xf6neN7yZlx
         O79g==
X-Gm-Message-State: AFuF++nWaxT5cC3++r4ixizlgXQWx4FeAfljRxpqYxUOn5LVUf4+lY9Q
	ftLnbnytV4zVkhlRkOx7m8c7uRJYWw6xlkgjC2Eg/+WfemQO9NCCC59D
X-Gm-Gg: AYBFou3RhbBGRr/RgNfvQyc39AFBSzxV2r5avOKAV8HWyLa4kj3Q4Z0XGLLBcvjH4oX
	7OmJxgg2F3BiLw/EIBIyuLoC398uSaXXN4dRMx7UBETHJdJg1yb0EnamkJfcQe8Eu1t/lXIAjcB
	dpY5/1l0siSJX1J1KS+9fzI09v9n9B9UHAoFw8Yb2DJ5d4YSzkKJhHjwtx3A/yqMFDw+IO/RBXa
	BwfOCxkeoUo8aXhQHlzYA1Uig32jP4w+KkyNT7DmlNlGP0bWTRl8paD7C3l3t5TjsikiSRFtX9r
	nclh3iFfcyYDFVSaFjQfvVEt0vsYbUKJoNIP1OTFZxEJ5oCtaC2nhMbvlg4G4+NXO+55DoRczf7
	t8xtesp12bugwAisLnxhnV8TGFxasDbVtvXgfGynv+/V3Jphf3io2Ix8+hhj8iaAbO432mphsiJ
	zePZGY3PlEi1aMdYcgPoqEIdY+AiaX8+T67tXNTkG25/BWynWyuTUv2PVOTPfZJ+XlJw0HShCX/
	kI7hSJ1nVtX8RMoJ0f2jMi0KzZPsSsEz+om+6mAZz2ASJ+ljPRESFSGtGt9hsrMXkn9zWOMCA==
X-Received: by 2002:a05:6820:3393:10b0:6cd:3fec:de81 with SMTP id 006d021491bc7-6cd3fecf3ffmr1084365eaf.87.1789786746555;
        Fri, 18 Sep 2026 19:59:06 -0700 (PDT)
Received: from DESKTOP-FG7FD3B.localdomain (fixed-187-189-149-136.totalplay.net. [187.189.149.136])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd2ea874c3sm1904355eaf.0.2026.09.18.19.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 19:59:05 -0700 (PDT)
From: Daniel28972897 <danyboy28sep@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel28972897 <danyboy28sep@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: misc: convert axis-fifo binding to YAML
Date: Fri, 18 Sep 2026 20:58:59 -0600
Message-Id: <20260919025900.169703-2-danyboy28sep@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919025900.169703-1-danyboy28sep@gmail.com>
References: <20260919011417.156828-1-danyboy28sep@gmail.com>
 <20260919025900.169703-1-danyboy28sep@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert drivers/staging/axis-fifo/axis-fifo.txt to a YAML schema
under Documentation/devicetree/bindings/misc/, so it is checked by
dtbs_check and by checkpatch.pl's undocumented-compatible warning.

The FIFO depth properties are documented as being in 32-bit words,
matching the original text binding and the driver's own arithmetic
in axis_fifo_write(), not bytes as an earlier draft of this schema
incorrectly stated.

All properties from the original text binding are preserved,
including ones the driver itself ignores, since they are generated
unconditionally by the Xilinx IP integrator and may be present in
real-world devicetree sources.

Signed-off-by: Daniel28972897 <danyboy28sep@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..fffd69b12811
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI4-Stream FIFO MM S IP core
+
+maintainers:
+  - Daniel <danyboy28sep@gmail.com>
+
+description:
+  The Xilinx AXI4-Stream FIFO MM S IP core has read and write AXI-Stream
+  FIFOs, the contents of which can be accessed from the AXI4 memory-mapped
+  interface. This is useful for transferring data from a processor into
+  the FPGA fabric. See Xilinx PG080 for details.
+
+  Currently the Linux driver supports only store-forward mode with a
+  32-bit AXI4-Lite interface, and does not support cut-through mode or
+  full (non-lite) AXI4.
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
+    const: interrupt
+
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream receive data interface. Only 32
+      is currently supported by the driver.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream transmit data interface. Only 32
+      is currently supported by the driver.
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in 32-bit words, of the receive FIFO.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in 32-bit words, of the transmit FIFO.
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Whether the receive data path is present in this IP core instance.
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Whether the transmit data path is present in this IP core instance.
+
+  # The following properties are generated by the Xilinx IP integrator
+  # for this core and may be present in real-world devicetrees, but are
+  # not currently read by the Linux driver.
+  xlnx,axi-str-rxd-protocol: true
+  xlnx,axi-str-txc-protocol: true
+  xlnx,axi-str-txc-tdata-width: true
+  xlnx,axi-str-txd-protocol: true
+  xlnx,axis-tdest-width: true
+  xlnx,axis-tid-width: true
+  xlnx,axis-tuser-width: true
+  xlnx,data-interface-type: true
+  xlnx,has-axis-tdest: true
+  xlnx,has-axis-tid: true
+  xlnx,has-axis-tkeep: true
+  xlnx,has-axis-tstrb: true
+  xlnx,has-axis-tuser: true
+  xlnx,rx-fifo-pe-threshold: true
+  xlnx,rx-fifo-pf-threshold: true
+  xlnx,s-axi-id-width: true
+  xlnx,s-axi4-data-width: true
+  xlnx,select-xpm: true
+  xlnx,tx-fifo-pe-threshold: true
+  xlnx,tx-fifo-pf-threshold: true
+  xlnx,use-rx-cut-through: true
+  xlnx,use-tx-ctrl: true
+  xlnx,use-tx-cut-through: true
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
+    fifo@43c00000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x43c00000 0x10000>;
+        interrupt-names = "interrupt";
+        interrupts = <0 29 4>;
+        xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
+        xlnx,axi-str-txc-tdata-width = <32>;
+        xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,axis-tdest-width = <4>;
+        xlnx,axis-tid-width = <4>;
+        xlnx,axis-tuser-width = <4>;
+        xlnx,data-interface-type = <0>;
+        xlnx,has-axis-tdest = <0>;
+        xlnx,has-axis-tid = <0>;
+        xlnx,has-axis-tkeep = <0>;
+        xlnx,has-axis-tstrb = <0>;
+        xlnx,has-axis-tuser = <0>;
+        xlnx,rx-fifo-depth = <512>;
+        xlnx,rx-fifo-pe-threshold = <2>;
+        xlnx,rx-fifo-pf-threshold = <507>;
+        xlnx,s-axi-id-width = <4>;
+        xlnx,s-axi4-data-width = <32>;
+        xlnx,select-xpm = <0>;
+        xlnx,tx-fifo-depth = <32768>;
+        xlnx,tx-fifo-pe-threshold = <512>;
+        xlnx,tx-fifo-pf-threshold = <32763>;
+        xlnx,use-rx-cut-through = <0>;
+        xlnx,use-rx-data = <0>;
+        xlnx,use-tx-ctrl = <0>;
+        xlnx,use-tx-cut-through = <0>;
+        xlnx,use-tx-data = <1>;
+    };
-- 
2.34.1

