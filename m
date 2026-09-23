Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F293BCD19
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191534; cv=none; b=feGGkB6o9+6IKn53Pj1v3q7E+C1VwaK+/f4kVGWHxfJTsatFjAPsOH2Fyzi0Gk4TxMFZ7Tq5XMW/AcNNaRO29qxU/x5UL8pQqH1HRcqtQnBKwtOgZNIWUaSVePDsHgVVWvEtOZnEid1OsN8fWQhoQtfnLBbcDb7Rgh83C+rc5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191534; c=relaxed/simple;
	bh=BWqLzOXRk+5S9MZYqWW33QkwbgUmwjXfTeVGI8+JXcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sIw6wlSedELMX9JS98z/ICrcITpnNNtO/fRhiUA1tqVCib389mvoDLKVmKaLKYmPBX6RthHwN8HUcEH2NNfFi+MzVITLzKGz6XK27tt7rLxnXpvvL27TBMtvUHhlIr6vWnpDwe/0hFdF1eonoF4Lpnn6oDkkvdopbyuPeNa8MBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtrrVqAG; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtrrVqAG"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109fafd6so101015285a.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790191532; x=1790796332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2uLNBtINgA/GkNyiQCsk9cZ9o6dy6b2I5aUCsD0irM=;
        b=AtrrVqAGTIbeShKnXhWwYxY9l5h8GvTMJo/rMpzCw69W0QpwTyBQ2R6ZHIZeiHj60a
         kJ3pVz8KfY8g1q73td2wGkoTl/C1aUW3B9t02SM7fWi9y3QXi39S8pJ+UfA/XCiTYI9Q
         IzkN2Si562TcCnvbXDnwomjSOE6tOSSPwlXtntF+1pISJ4vN4LYspj8g09nGG1dSmanG
         Iw1An93zago9FLusyk1Pzl3jOxxQ9m8vEQWpAKncMrmYnlMz37E1ptfrdhX39EgSFUcC
         gK7MHTtA0kvxdhX0zfzBQfoest2suI8m5MiRYC/r0NJ2+AAzRMq2n0C2lr2jyUaWp5g2
         53bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191532; x=1790796332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2uLNBtINgA/GkNyiQCsk9cZ9o6dy6b2I5aUCsD0irM=;
        b=2EODDTqDCPigUq1yY/fdsGSAV1YT4vkrZ2o9nQXwfkpl/PG4RmgrIY0QejHGMtSJ31
         6PiNkjK2ZwyK0raD17V8gL/b913NmkH6p1LHZINIFOv0AGdy151BUBODUMrkhSLOaJIx
         5eCsAXiRIiM2rKVrpI23uKhXVO6yb6LRIsC9gjMR8DmWDVyT6EIuwKUzybMcWIjSGJRw
         pvaR2iBQ8nSAIRpGRoaaCDgEeMd5ZSxCV5/EDAgBt93mw+5ixyMvIbqTyHJ7yYy1tI6j
         UN6nLnZP9mM53POqL/hoOXfiUf9hfz07dUKDgkC5wiESX+TFWu5bask2yfZq/f1bjDPG
         GuOQ==
X-Gm-Message-State: AFuF++lWcWxjRftqbnKzfyWSJKsRtiwLAjXzkrir+7pUz5pMbCL8+MOi
	6iIMsvDtBzo3CjnQNA8JDkLyE135zUJ4SWTIuj3EA26Gd1r2PUSJ0NulaGwJNw==
X-Gm-Gg: AYBFou3PYcjdOeARKEha82Kz4qw+QHtriQ+5O/uktRwzbdUsMfYMeclmsQjk5Pp44Mp
	bU/dpkjCYSpVIHOkkmtmGP8a0F27AIZt/ExJ5nyWJxSra2vszeEkLpqI75Qf433Fv2yxXK8YjZ1
	wcq4RQyFQh8Ycnx7lZm0F2C+RNMIFvrb2RgQaSgICPXm00nkAGt1X6z7l2c6eNcWoORj0tWvalA
	0pJbmNoKAneC5lIYJBmZ3ChhF8N8EOjnWEVvL8PVS8c7w2UTEytWtNxgfc/oGBmdEBXPni95dls
	WTe4QXw2D54G1guRB9RexGaydkbRMoBw6z1A0AkW0cB8D2HfKha8og3nf48EjkDSNjxUchg+lUn
	tREXcDsj/d+Mtl7CnaYw3RDnywUam00sJxf+KaDnSH97Ddwqpla3uDF8fccwq1ypKb5h/g9qC5p
	cFhFNvXpapxwdCU9XNHNM9r0oIaejsSm34I+GNIug1wTRA/bjI4sAItUBufyuEA9TRpqz7RXOEq
	fc2RgnjPPsGRx/aJSIVSDSgZg4O7EgyXBCEYyl9zQfPvKcn3Y8bh2WWKAl0Xy/Hfs5ltBO9ABNy
	FyU8qxyl6GLT+2WPRFOkLLeFAWMQ8kOo1XJNcSuDrGwfz4qKNuJHAJez9rI=
X-Received: by 2002:a05:620a:c47:b0:939:8c80:669 with SMTP id af79cd13be357-93c344f00f6mr28296485a.42.1790191531871;
        Wed, 23 Sep 2026 12:25:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c245e8804sm294644185a.0.2026.09.23.12.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:25:31 -0700 (PDT)
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
Subject: [PATCHv2] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Wed, 23 Sep 2026 12:25:28 -0700
Message-ID: <20260923192528.52330-1-rosenp@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix reg value
 .../devicetree/bindings/mtd/ibm,ndfc.txt      | 39 --------
 .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 39 deletions(-)
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
index 000000000000..51ba0bd1d329
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
@@ -0,0 +1,89 @@
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
+    description: NAND chip attached to the controller.
+
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 1
+
+    patternProperties:
+      "(^partition)?@[0-9a-f]+$":
+        $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
+        deprecated: true
+        unevaluatedProperties: false
+
+    additionalProperties: true
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
+...
-- 
2.55.0

