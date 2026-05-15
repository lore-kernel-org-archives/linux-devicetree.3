Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EBB3EFD27
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831927; cv=none; b=UkUWGLpwzFd5oEiKnTul1RGJ7Jq37/iy2+Znj0X8LSfBiJGTac/cdATKxNnrW0M14atiY0YW/LHmYTHja6s5MRBVTbsX71dCcrHDsjtSS2YBUgDO01n3++tRcZzDSDvYfJW7Flf4Od1LKMGSb5hUG+BuesjJFvDJE1fGdJf9M3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831927; c=relaxed/simple;
	bh=wyYa8gIFgLjBYlLhyXw9vzSHb5OxneEJ6CcsElborA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBue3hA8KfjRCz+WE1hYivtihI0ZTngxjmK3uV+NnkV3hv3z4EithlmmAIucphGevcw1XUyNe3sDwIIiorbJZN2W6JoUIkNzR4UyaSROimGYL02jQ6jhZuhx/CzBrrbGm6iJBLFyNw3AMdRTSe2wHbgqoF+igDQPhZF9qA8vPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOyUGC8z; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOyUGC8z"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so7096867a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778831924; x=1779436724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MiS+JhxTiWTYXV5rcm6uEgwCs/g+gk9Na8Cem5QvF0=;
        b=GOyUGC8zk2B7f1atKHeOFC8hTNzjFpG8l0wfhMd6NehmJYo0p6jPcvKvZCAYAzF7Bs
         91X/PJJ+3425G8d+eFddfzeZNiCqoYudAR5iWKwJfUbOAP9Da25AAPsZHK/3Db2cELIL
         dXoJqaNBAQOwMqfUxoTNnQWewjyFDhvMLH7qVf7GfocPdXY3GApQCDFTFGepQobbAkuI
         sXfouRycjEbD5AHxKLUzcsfpl5YFON/SI77PqWuTPGDeb/ZXUXkoipj6TsWenWitIEIa
         fNO0xeDgDfT/MPY2kTZq5RLZ1SgviWMYmGpqUVSxf+Sh6V8Z8DFnGJ5rFFnvItAinvtB
         4tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831924; x=1779436724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5MiS+JhxTiWTYXV5rcm6uEgwCs/g+gk9Na8Cem5QvF0=;
        b=Q5xNm9vTlJLa0Y7ntZuzhNGlRUCZ945EF7Fc6d3Zq8+ttdgiWeYPdwcy//R+C37JpZ
         qiyEDiHUk1YHI7twKKCWW//OAzH505+ahpH4J6Qndb44UkmAQZGqta3cwMmJA9l9jm6H
         4ADMDhrDONoJ1TtJE55gcK+HjLnMTzE0JckCNllP7lsGcYJ1rgdOafcHnB1+mBZQVpD8
         LkSxczQ1XvNuqQul7tMI0Is/xdZ2xUs18stxaoPyB1FWeZYjMdSj/IiAFi6yPNUjYuo3
         yMOPLiKiOHuySD6mUwWVwUqrQkXGpJyVCZAH9yElzSI/9xIDFS1joUyNCqvpPKtocRK6
         4CCA==
X-Forwarded-Encrypted: i=1; AFNElJ+eGnF3+s1rFE158mG+ad+KbWh3u6FUH+hXRV+ii1J7dIgh+YPAH7+zlF/v0uxZKYWMxTDD0TznW1zY@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBrAE+LybX8iL3WcD2GnniKuxJDEk/HRRHcjSnfwWBwZyyMt5
	lUUqG1qn9bWO+1hKfh8kkadI/xstbBhm3KxvyNeMHoeWSowBGLLUHis4
X-Gm-Gg: Acq92OHpfmWUh3TDL9yEBqdnK32TX3D/PlGjomy2CRnTE8GtA/Rl95d/F/y7YlUlQcZ
	d8PvSq8CP5B033ZOhD0Iz4CvExKFlKrrUoGgYNnoDqtni/z6ZWaYPnSxwiOStOis3sdxlXvOUUd
	qoTJTJJhk70Au5IXZtcXWK+3QwdK+F0k+8y377K5Q1RMoQn0FUrOj1d9Eyny6ON0Hg1QJTdV1zQ
	U14T+RUZz79lj/Cao90ebYg/WHnERU88Tu/vTvTdAg1yx1mvKiAe0Tg54Re62b+IHp688493l7O
	JEiekzeYgngK96SS4bZLnnCCRdEtvTZOwfJMdOWSvZfZSGDn3KzEPozzxEU1Y9D3f8zrhiDjsbF
	GUuTBHTYmCgKlBKRV9CPgaFYB0kNyD8saqzBKcy+2ovHdgul1lkv9wex2+Qz6nv4f634CJonVok
	1k5JhwsCV8jcnNPNFbTXyDK2eUjz4fGVkmFJeUUuDg
X-Received: by 2002:a17:90b:38d2:b0:366:33a6:9921 with SMTP id 98e67ed59e1d1-369519af699mr2924409a91.4.1778831923836;
        Fri, 15 May 2026 00:58:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36959c7eacesm542040a91.2.2026.05.15.00.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 00:58:43 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pramod.nexgen@gmail.com
Subject: [PATCH v4 3/3] dt-bindings: misc: Add binding for Xilinx AXI-Stream FIFO
Date: Fri, 15 May 2026 03:57:36 -0400
Message-ID: <20260515075736.172172-4-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260515075736.172172-1-pramod.nexgen@gmail.com>
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260515075736.172172-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a YAML schema for the Xilinx AXI-Stream FIFO IP core (PG080).
The binding documents the three supported compatible strings and the
vendor-specific properties that the axis-fifo staging driver reads from
the device tree.

This resolves the following checkpatch.pl warnings in
drivers/staging/axis-fifo/axis-fifo.c:
  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.1" appears un-documented
  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.2" appears un-documented
  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.3" appears un-documented

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 93 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..f4ef7c277cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO
+
+maintainers:
+  - Jacob Feder <jacobsfeder@gmail.com>
+
+description:
+  The Xilinx AXI-Stream FIFO (PG080) provides a memory-mapped interface to
+  an AXI-Stream FIFO IP core. It allows a processor to transmit and receive
+  AXI-Stream packets via simple MMIO register reads and writes. Currently
+  only store-forward mode with a 32-bit AXI4-Lite interface is supported.
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
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Width of the receive AXI-Stream data bus in bits. Currently only 32
+      is supported.
+    const: 32
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Width of the transmit AXI-Stream data bus in bits. Currently only 32
+      is supported.
+    const: 32
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth of the receive FIFO in words.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth of the transmit FIFO in words.
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Set to 1 if the receive data FIFO is enabled, 0 otherwise.
+    enum: [0, 1]
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Set to 1 if the transmit data FIFO is enabled, 0 otherwise.
+    enum: [0, 1]
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
+    axi_fifo: fifo@43c00000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.3";
+        reg = <0x43c00000 0x10000>;
+        interrupts = <0 30 4>;
+        interrupt-parent = <&intc>;
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,rx-fifo-depth = <0x1000>;
+        xlnx,tx-fifo-depth = <0x1000>;
+        xlnx,use-rx-data = <1>;
+        xlnx,use-tx-data = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 58d35c17704d..bbb6b8c20ed6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29164,6 +29164,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
 F:	drivers/iio/adc/xilinx-ams.c
 
+XILINX AXI-STREAM FIFO DRIVER
+M:	Jacob Feder <jacobsfeder@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
+F:	drivers/staging/axis-fifo/
+
 XILINX AXI ETHERNET DRIVER
 M:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 S:	Maintained
-- 
2.52.0

