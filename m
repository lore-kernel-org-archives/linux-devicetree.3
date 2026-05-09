Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256A8003D
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778347033; cv=none; b=TUV9dWtLc47TPyWCITrztXK2u2yGXWIh8wLtorCmQKxaB0q4DHysY5WkYcZ8UIE2AvhImGSKtf/tFwdixj353zX9Z4FIP8U648xWzgY/u/yx7t4lRi7i2ExTsVs8vs0uK6JM1nd/lj6YjrAHBhmxjnQxSHjE5ag6lJPKa8CEK90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778347033; c=relaxed/simple;
	bh=/hETm0sSJvyR6rIwsFyHoJ31l9McOXE6vipbZssdKV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJRCADOrBB2E46JuFrEoHOWy0bZAAGooPnj99396C48okUiBMDczsOlMS6Q19pS1582RH9b6EpUsTGuBEdAMlAhrK98tz7jWZCRB4/AU+RF3Jrcs2Fwi0Vwzo/xLezTVVYRxoatmHmvGbvKVam+rsMu5sO+7XcMpncQU5evNIgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbcDMgi5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbcDMgi5"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36627a0ea23so1139207a91.0
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778347032; x=1778951832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMHjcRNL6ikkM67BPqw0OqfMiFjG9Q+UjzpAW5Cd8DM=;
        b=GbcDMgi5DPtOnxDjn1twPqicFk744OZp3rgrZCzlTarH3Jdm524tra58ALt88WV/6a
         IC1cPkBjnU+LsSXNoJY82bBmLYJHdZtwzLZ9wuG+r3khZF6oEHPEXHR3DABZztqUgk/p
         tOM1PmHRkKiP3uG0O1J1hT1CLp84v1bE6pDZ5gwxQjyWJhI59+tT+Pfz+jtWtW0Q9RWM
         GHe+qiZlYKaGn+vwCBFnvC1RpAZoScj+zq5+VDgY+dQeLmDn1GfU1UZLscSuYFjbOJxT
         VhYahNbk+1kt3tf/XonmMFIe7wJZvT9OKb/ocApmoENnOewy18DIyGBVN4ztKsMh8aNu
         3NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778347032; x=1778951832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMHjcRNL6ikkM67BPqw0OqfMiFjG9Q+UjzpAW5Cd8DM=;
        b=I4EtjnXCb+hvuEtasCL3t2+TGwspb73sVWN8PJAX2bZJ8B1ag3Qj20S6NsxTM8DnAu
         BW3zeBDQs5EQlRrQm6qoapdrRqrJnaLIKLCOSi0Q84h6mn0xGgDQ4eo1xGc/xG2V/LHw
         k8hWfo7p5/GV0N7lg1LzNTg6BgblYt8cJCL/hpRY0n9M3gq0myjdsPxQALuMuUepQ9sK
         7LPxVpkPFtu0TJSdDVQESuCn3nj+sQGrMeSlxl/9vNnEx8z7n9a8CD1FSByPuRZj4/kh
         WAAOHhkiTq3kYJfINgLdwel27TcYwH8OG7nd6adUerrV4mCSyTGl9DgT3xoBEzVXz1dH
         JH+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ixKh044OW43DCmV1vwH3otZow/Cw1z8jk0Mq8EO+wuqgDn9u72WrW7jl9UF+9vTQydnue5CdoMVje@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYcAc5vFkub41K/sGIBb2B8s7uiWEl8TShts9qa9bocbDNczg
	LjrgzVxC8xSC3fYhzB+1589B31Hii3fFZO9EawsEA5KAwtN++zFs5ZIA
X-Gm-Gg: Acq92OF8nnvr8RmRNb8l+jtLHiEfhnlUUBszApEaJkNQKAOv7XcNQGWgJp/4kOHe183
	QvgORhnUHEaFg4Sjvw3JqO+Q3lxQ3TrherPDJ7S7KAkTLgWywMzzlqhXMjEKtXN9YkLzBxnufdy
	s48zhPUza/FUJBLkdL/uGjEgMzT4PX0Ex/RGU+kSeG1tlJHtNWtARpAitJkdixdJCBLxLrHgnVR
	Hr2fL+8+wCJonHgoSw/efG+I30nAlkwBa+QZjQFwMswYpxwc0sO1DPzC885M/eFKUbDxteyv2Ze
	lLopFGnlM87fu2uQrPRYtZNHw2T2xhLGQCEimS8f433rN/UvN8AjjtiBS0SwUKfbBsuZQwtveAk
	ZyNcAdMcisq8s5mrfLU121FAlUdW4cx6Vowa18vxOx35fF6Yq6rCr+HEv3DIIbyYiMxxGS43P5E
	dG6+hAMLmWd/qKLi4pz9NMTRrUWjuZcV77eetO9FED
X-Received: by 2002:a17:90b:3d44:b0:366:3517:1a95 with SMTP id 98e67ed59e1d1-3664c687d94mr7216200a91.0.1778347031714;
        Sat, 09 May 2026 10:17:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63dffe5sm3380493a91.11.2026.05.09.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 10:17:11 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: robh@kernel.org
Cc: jacobsfeder@gmail.com,
	pramod.nexgen@gmail.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: misc: Add binding for Xilinx AXI-Stream FIFO
Date: Sat,  9 May 2026 13:16:46 -0400
Message-ID: <20260509171648.46933-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a YAML schema for the Xilinx AXI-Stream FIFO IP core (PG080).
The binding documents the three supported compatible strings and all
vendor-specific properties that the axis-fifo driver reads from the
device tree.

This resolves the following checkpatch.pl warnings in
drivers/staging/axis-fifo/axis-fifo.c:
  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.1" appears un-documented
  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.2" appears un-documented
  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.3" appears un-documented

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 92 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..1e07db9cd456
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,92 @@
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
+  AXI-Stream packets via simple MMIO register reads and writes.
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
+        interrupt-parent = <&gic>;
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,rx-fifo-depth = <0x1000>;
+        xlnx,tx-fifo-depth = <0x1000>;
+        xlnx,use-rx-data = <1>;
+        xlnx,use-tx-data = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9b107057ad8c..84be7c8ae257 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29130,6 +29130,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml
 F:	drivers/net/ethernet/xilinx/xilinx_axienet*
 
+XILINX AXI-STREAM FIFO DRIVER
+M:	Jacob Feder <jacobsfeder@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
+F:	drivers/staging/axis-fifo/
+
 XILINX CAN DRIVER
 M:	Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
 L:	linux-can@vger.kernel.org
-- 
2.52.0

