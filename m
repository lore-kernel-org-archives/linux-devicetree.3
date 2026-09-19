Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A12E266C
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780492; cv=none; b=DQG5ShEKnl3CQbgTGmwLMusQSewvMczN7pZceCMaw98SspkDaaUwpBzgTeWrro3Ah4e0t3eZIu30/IvUuARLTvJdHpmrmRGw4C9GysdscP3TPZZ2BhYxAydhwZlN7MzvAwzIuwut0+Nt/GIooTXTcTPl08S/FoKIVc5+HC1IVuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780492; c=relaxed/simple;
	bh=zqQ2Gc3YrVtSTqVH9pz+HHauXgCJZooWRhN+Ev9jLqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p7+aESAFciWE3rxVSm2FUonRzaa//Wr3oKQweHFCcP9o63rqxs3ICotwBzpwNUyLcpdqqveKEwWj2SeZwczYTtJvXrNNbNlyH2soux4sJQFpWPOurGTUCWoOcOi+XV7u1oARs3vkvMMlvY0ErZDd7D7qzZa6Y8KRM35JhOxvuDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHCXCE1Q; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHCXCE1Q"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-805c194bc92so1347412a34.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789780462; x=1790385262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxKrnFCKVv+A/s21AGnSTz11SqzSXxKNsYK80fhyo7I=;
        b=WHCXCE1QvwvNBvVl7/vVkNmQur++G7Srnu/8VyBNehIJ2KfoX4D5jhzst436M2svCC
         wzfGJMBiFOBAdzkbLQMbtVgp4mEy7um5T7znha8/h0wmhcrtNiqG6ztkVsCP5EYp/YCT
         YwJItOzCcp+rKjN4tzV9HweRZwhSPUOwOfxXi1BSBCxKZBG8rLPGaeu5beRKqp9JzH2s
         BidVtCW/2lyGrixk/eSwX/XsGZ7IA+1oAYmrrkc7RJJtjdwGac8vpACA3cZqrK4MFoyV
         EU46tMZAQfw3V+hnJF/06YhYWhso02HmgmmXpBR8elimR39pG206m+S4/IKuxqW/Rpp0
         vMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789780462; x=1790385262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxKrnFCKVv+A/s21AGnSTz11SqzSXxKNsYK80fhyo7I=;
        b=VinGIRYCXqZi9tQWls+7pnNFt/4WhNo15l04qNn/TLcvsHQn8/NtkeitbJF10OCFMH
         p285llHiaO4ydoP+saDKaPlVDdNMRKquRUa75z2MWjItB00XkJCfuPEuK93061Ds1ev2
         5ogKN9sI+vYlADTTH20ygDe3nxtfxFRw5AoH+uZ1aXchO6hRw57J472OwQnuk0lYheZB
         vz5Hiv9uQDoWqcZW5PA0H1CPyQ7cN9DQCLytQhbe/pf2KnXSfc/0/bFgSSWQ5mrn6Izs
         IqWzsrl4r7peBrLX4T4+Hz+UfUboeXUJv/wsd29yjXW9WO5hUfsZ0WsvQ46XhQL1TKOF
         FILA==
X-Gm-Message-State: AFuF++lzxBzdpE2cOjNwFRIbBa72SOOnyGgVm7d0ZWGd5BB/YfOMJlWp
	NR2NtC7/D1fI84FXC/xXv//1lhK4MsYpobISnc+0JWw/j+ppKM9vqntT
X-Gm-Gg: AYBFou2MZDR6Umteo49jJ9HrVvC7gDislKkhythliyfkcNgPwpRB7WEgzx3R8RvtARD
	BBQzEPWTOu/JQ80MF3ZTFSTa8ItCHZmF7o+aYY3fjSc9a3ItNT0P84r6YuAZzRNkEcg+aiwrxtw
	JbEOS3KFf7DXFS6QD+fyOWcGASjX3zqbPv+H+/xec1T3c7607i9uokrElP25BbMOCDXcpOgoV4c
	NbHpL7/ntbJDC7qg0PzE+o0jT4n71D0XJhWzEgtxPxj5T9QaRYiNJdYcEUgb4cW6LkWK+vU5dWM
	Re/cGqQGPZ3Aoh4DDHC8+Du5rLLCy11Ngde7C4EJ/upp4r2bPfPksEQexFJFAxd0lG1y1UxbDnO
	1THnm+IN6WM1a7Wm6Nfnfj8I+bKdiVS0c2Rd2ZmnqsTzVjx3Vt63pdzxeDo3RhAabTgAWLzZD0j
	R5mC3MExG6n/ylhqL1/HyzLWcFTA3Exsb/QuumpvPdSZ8/Mbh7ithKcEuv8dZQrUwt3BIEFufAt
	XDRWs/8RiQPqFC1iGBB07i91Vdhsb99f5UXXP1ZNUIsVdOpeXPa673yxMMOmCWX
X-Received: by 2002:a05:6830:3886:b0:80c:d30f:97d with SMTP id 46e09a7af769-80de33eccf5mr4941299a34.30.1789780462100;
        Fri, 18 Sep 2026 18:14:22 -0700 (PDT)
Received: from DESKTOP-FG7FD3B.localdomain (fixed-187-189-149-136.totalplay.net. [187.189.149.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8107eea55c8sm1317188a34.26.2026.09.18.18.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:14:21 -0700 (PDT)
From: Daniel28972897 <danyboy28sep@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel28972897 <danyboy28sep@gmail.com>
Subject: [PATCH] dt-bindings: misc: add binding for Xilinx AXI4-Stream FIFO MM S
Date: Fri, 18 Sep 2026 19:14:17 -0600
Message-Id: <20260919011417.156828-1-danyboy28sep@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The axis-fifo driver (drivers/staging/axis-fifo/axis-fifo.c) has
supported the "xlnx,axi-fifo-mm-s-4.1", "xlnx,axi-fifo-mm-s-4.2" and
"xlnx,axi-fifo-mm-s-4.3" compatible strings since it was added, but no
devicetree binding schema exists for them, which checkpatch.pl flags:

  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.1" appears
  un-documented -- check ./Documentation/devicetree/bindings/

Add a schema documenting the compatible strings and the six
xlnx,*-prefixed properties the driver reads in
axis_fifo_parse_dt(), all of which are currently required by the
driver's own error handling.

Validated with:
  make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

Signed-off-by: Daniel28972897 <danyboy28sep@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..56d58b37b71e
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,91 @@
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
+  The Xilinx AXI4-Stream FIFO MM S IP core provides a simple interface
+  to move data between the AXI4-Stream and AXI4 memory-mapped domains.
+  See Xilinx PG080 for details.
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
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream receive data interface.
+      Only 32 is currently supported by the driver.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream transmit data interface.
+      Only 32 is currently supported by the driver.
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in bytes, of the receive FIFO.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in bytes, of the transmit FIFO.
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
+    fifo@40000000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x40000000 0x10000>;
+        interrupts = <0 29 4>;
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,rx-fifo-depth = <2048>;
+        xlnx,tx-fifo-depth = <2048>;
+        xlnx,use-rx-data = <1>;
+        xlnx,use-tx-data = <1>;
+    };
-- 
2.34.1

