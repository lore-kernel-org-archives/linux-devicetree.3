Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D0288C2D
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 01:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790387287; cv=none; b=dYcyUBqp6o4crWvV/VxGU7pbVcp+q0IYAGJ5k17l0w41m2sJKjeqk4jeEghM0UYBc/1wK3QWcdHZB/u6AEARN//du97Q3LEf+DIR7R32D6v1+EgtpRkBCN2Dwcl4k3HzN3MxDESnOyVIOmUAycczGSKl+0M4k9/0ADbwWrEPHIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790387287; c=relaxed/simple;
	bh=TTVyPZcnJYABDmdRCD3Hn0KPAE4CSLVocgepqNv6eGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rlgWKjBYmQ2uBKjDdJlq3r1vYtfLfNxv5lA9sv/KOIA27zgtjHGFn/jbA+jfdSYxnbF25qBOz9+tFhB0NmNWkUITp+1IcdMaS67cV5kENSCy9lrsujEO61vAHFvILf3naJ3gqS/kcuDusIGoDFlpch8Mlc3bvfjhu5SJjdMRop4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0VUhBva; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0VUhBva"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a8568e9so706881b3a.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790387285; x=1790992085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u8E325Hob5EvNUG1ihDxwdbdqqSNh/dhHuy8AA89ZKE=;
        b=c0VUhBvaUXAjhjhhVMBK8VRLWEsAKgSrU59gpHDtGJXqZjWGhqDD9owhV1ujI28iXo
         r8b2cI4sDcQQxvy96KuLgzd1mzVmAU87wRlHshvd2TRUAdI6CeUvAkek6nsq08Qwy4Q3
         dtbbdJtk1H+WrLFKeC0/t5FSaLD8xX/naKpXtVtSqaH6d2rsZIoT8RVfflAVP0wxX+rd
         w8/dU/LYGjvfy69aSXGs49YtgExaw756KQq7oLhZ56YNW4PRTQgWzHa9kJpX1Ksgf6W5
         AbOq7l7tVlmSh4g94brqv2eLXQBKahBpgUPDMf2fVw25HBXYb6lgv/s/yU7XclB/S5Qb
         xbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790387285; x=1790992085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8E325Hob5EvNUG1ihDxwdbdqqSNh/dhHuy8AA89ZKE=;
        b=B2uOvq6ykR6Ffnh0s3kGTv7ObvIKrLMKJWq+oikxT0xYa5dTVjKzXGMyV2bV8l1xrs
         AuptoVzV9AecUxHxn+6VYAE6h2W2UUEt7UCdIg4lF9fi78c3dfQrSnfBKAZ2T+Lz/J87
         gYckuNOhq8N+0xmLkecqAfMBQ12zSOiMJqGrhas6f5qSEFcaCv7eKkmOfpTGTcue95Of
         q7acn2qz5via7ie2+TG8N9g5ZEYS4BPaJjMoQZQpX6Pu7UmokcBDMS2QRiHOkxAjOvoU
         XUsjyr2qA7D7hr2JrQCBQp1dU16WWz4iyXg2xrFapz/VLwzy9a+JZmpGWHuCh8XLLZ6z
         q6cg==
X-Gm-Message-State: AFuF++kKtV8ZjhYA3zPgK1txjjm0ZT7xB8cuv7i/7nj7+Ef3duNgGdcm
	UlEZ33J4QCzob7yNwPQRifBoxdOQz/BXwmYZf8U1u3/4UCk1lJSsTRDLPn/aCQ==
X-Gm-Gg: AYBFou2rUZXAuW7BjdTTLt9xb2kFLNPx4tHb+xeYwL7fvlCB2xK0LqU90yrWXaF5Hhy
	XXVPI3zK+7pz6Jc4dx/4v/zZ05J14igpqlb40oxvZk6QvkdBj+OVMbJ2ddtXzfcMfO9XCHYOdqI
	bhusfsjyOdtuNTQEKA3QHGSbiYpmJeyAiZcz0SkFvVRs3qaW44pZJockwFuT8oUQI6X1dbsUM+K
	xDk4I5mjN9mVQMj5oqrmWUZVi1j1CcZSbGgLOXbGme5q0hXEjdq03DlodkgqaOorQqTIWY+yeTz
	FJf05vJbYiM/oGOJidurEngD/SygyPevBSHGcE8zspb9nYPBXj5PHJKmM5tftHraNyD8jyH1AZD
	D414E+dxqFiDmneHzwmAZKxCfJZzD0mCmhCgPxna8rMA52mhs6o7mcDE0ZP7gAC2qU24zXsyq8b
	oIucLowI3MDKEKsextVMo5cWaty88w0XwXaCuTxKXSKYl9Am/v9kfSkx+xo2UQtPS6gjEcvCY9v
	VduRE2har6QA5SwxR302Ge/eZZLJvZZIP6K4f1HBStIe58GqAMWmh9ljJES8Pe+Cg5W0c5i6zeD
	lyM0kVA8K9BsJPU5A8RnUuz8Dfwi19zvbiCjVynscyc7ZBH+
X-Received: by 2002:a05:6a20:e211:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3de0e8b30c3mr6910904637.38.1790387285324;
        Fri, 25 Sep 2026 18:48:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea18ff85sm1836463b3a.19.2026.09.25.18.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:48:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Fri, 25 Sep 2026 18:48:02 -0700
Message-ID: <20260926014802.87255-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NDFC NAND flash controller was only described in a legacy text file,
so dtbs_check reported "failed to match any schema with compatible:
['ibm,ndfc']" for the ndfc nodes of the bluestone, canyonlands, eiger,
glacier, sequoia and warp device trees.

Convert the binding to the YAML format so those nodes match the generic
nand-controller-legacy schema.  Describe the node's reg, ccr and
bank-settings properties, along with its "nand" chip node which carries
the legacy partition layout.

The "nand" chip node carries no unit address, so the "nand@[a-f0-9]"
pattern of nand-controller-legacy.yaml never matches it and
raw-nand-chip.yaml is never applied.  Describe it with mtd.yaml,
nand-property.yaml and raw-nand-property.yaml instead, the way the
controller level does, so that both the deprecated partition@ nodes and
a modern "partitions" subnode are accepted.  The node name does not
matter, the driver picks the first child of the controller node.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: allow modern partitions
 v3: fix wrong regex
 v2: fix reg value
 .../devicetree/bindings/mtd/ibm,ndfc.txt      |  39 ------
 .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 128 ++++++++++++++++++
 2 files changed, 128 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt b/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
deleted file mode 100644
index 869f0b5f16e8..000000000000
--- a/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-AMCC NDFC (NanD Flash Controller)
-
-Required properties:
-- compatible : "ibm,ndfc".
-- reg : should specify chip select and size used for the chip (0x2000).
-
-Optional properties:
-- ccr : NDFC config and control register value (default 0).
-- bank-settings : NDFC bank configuration register value (default 0).
-
-Notes:
-- partition(s) - follows the OF MTD standard for partitions
-
-Example:
-
-ndfc@1,0 {
-	compatible = "ibm,ndfc";
-	reg = <0x00000001 0x00000000 0x00002000>;
-	ccr = <0x00001000>;
-	bank-settings = <0x80002222>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	nand {
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		partition@0 {
-			label = "kernel";
-			reg = <0x00000000 0x00200000>;
-		};
-		partition@200000 {
-			label = "root";
-			reg = <0x00200000 0x03E00000>;
-		};
-	};
-};
-
-
diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
new file mode 100644
index 000000000000..d5c392001ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ibm,ndfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM/AMCC NDFC (NAND Flash Controller)
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description: |
+  The NDFC is the NAND flash controller integrated into the IBM/AMCC
+  PowerPC 44x SoCs.
+
+allOf:
+  - $ref: nand-controller-legacy.yaml#
+
+properties:
+  compatible:
+    const: ibm,ndfc
+
+  reg:
+    description: Chip select and size used for the chip.
+    maxItems: 1
+
+  ccr:
+    description: NDFC config and control register value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  bank-settings:
+    description: NDFC bank configuration register value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nand:
+    type: object
+    description: |
+      NAND chip attached to the controller. The driver picks the first
+      child of the controller node, so this node is not required to be
+      named "nand@<cs>".
+
+    allOf:
+      - $ref: mtd.yaml#
+      - $ref: nand-property.yaml#
+      - $ref: raw-nand-property.yaml#
+
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 1
+
+    patternProperties:
+      "^partition@[0-9a-f]+$":
+        $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
+        deprecated: true
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ebc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        ndfc@1,0 {
+            compatible = "ibm,ndfc";
+            reg = <0x00000001 0x00000000 0x00002000>;
+            ccr = <0x00001000>;
+            bank-settings = <0x80002222>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            nand {
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    label = "kernel";
+                    reg = <0x00000000 0x00200000>;
+                };
+                partition@200000 {
+                    label = "root";
+                    reg = <0x00200000 0x03e00000>;
+                };
+            };
+        };
+    };
+  - |
+    ebc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        ndfc@1,0 {
+            compatible = "ibm,ndfc";
+            reg = <0x00000001 0x00000000 0x00002000>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            nand {
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partitions {
+                    compatible = "fixed-partitions";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    partition@0 {
+                        label = "kernel";
+                        reg = <0x00000000 0x00200000>;
+                    };
+                    partition@200000 {
+                        label = "root";
+                        reg = <0x00200000 0x03e00000>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.55.0

