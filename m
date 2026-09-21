Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AC9283142
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789955844; cv=none; b=FTV4kbyygru6f+Q7cE8w8BgyuJU2TBu+/8ngplI5RPC6I2IwgeLjglXCqx/Pae+fcB7si/YYc+IBbzSXqAeVP+kU7S3dM79O9WejVcksJT0D+dfFsy8VcHyED19lcganRo2PVEd6ILcc73PLp61nbVndD30uNKDFU7PauF2HoBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789955844; c=relaxed/simple;
	bh=xi0pxSfmqiNpR+z5WtVSMg8N6VZKsykMe1JR+wnmwoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdcbMKfbc2U5jEMAwMz+TAVT/2B4lkbjiADhiLYrZsx8GT6STZtqd7IEOhJw4rCWr7wCkGLuZhryzpL0IyUVIXs/ItpZrMmR36wRrrcyuHM7DRxnf8wkRQGefz1z612E+Khc5Oh7qGqlzk1NfFbQE7LfpBYC+tnFa5jLZDKU2Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOWeuOaW; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOWeuOaW"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2021493a91.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 18:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789955842; x=1790560642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqPPHQuisFYTUn7TmLcY7RMbMtgC/j1ZvNyK2Z7ksw0=;
        b=AOWeuOaWQwP1ELBlqV92elOQ/a5VASXCQIjg+zxdn97yDEf+zoQhoiKIWu9pWPwidi
         2LQdvCoigVFe8tbmnD3vgXjwsrfNi+Zr4RaJFl14wWpnpW10q+1IRc7Qg+MHrWTTK5Ld
         58qJGb0Anh1CC7Fcvfxhmm3dIMzm/E+zrfvBIQN5ihffYvMtrvib8QtLGugupmYIJYu0
         mMKtDNJCQQwoQTdIxWbgLH1KNEWepILNKg3h97MEHq6cVu172VdZRsXAG+MREKANmTGa
         OJBryUS7xThqGXjfXSajIDve4tknCyoqaa1fC/sw3vp1hZyLJXB68MCt4iy085QvoR8B
         jiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789955842; x=1790560642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqPPHQuisFYTUn7TmLcY7RMbMtgC/j1ZvNyK2Z7ksw0=;
        b=EYPcp3AQ/DUFavvnaarENAt0xq/MrOhT4/xRjdDvAkzw0s313qo+NHIM+LlclxzXvN
         f8KY2rWAW15RDVsAYdtlJQ8+KNxPPAS5//vFE02Wg8Yqr1Hvm0IKFE8Gc0AiGf8zqwjc
         JH59w+hxiUeyjhTnFWQ5szKvzizCiI7a8qs//WazFGVZuGHLTg1Kz/si6Q4c+lBesZXS
         kCUQk79zBwz4aLAO1VFggS5qxSqSXGZJWf9/Uq7Vmw9SJLOntKVcIiJHmEpJQJTR4wA8
         fiqfxGdw5Dqs4u76UlEIxPC1+WsDRZ8YhwjX0xD+yD+dPfvTB3XdQfWEFzc34tPogUED
         Es6g==
X-Gm-Message-State: AFuF++mjdhXmV0HtyPJ7BjyvbpB18n1+oV8h73C7gb1Wse7zeAIl4NRW
	AmuHKMbtahpKmuER52g2FKmphFpGjGFlBGMb5U/F74OpWZThFA5fKTQCBUzcMA==
X-Gm-Gg: AYBFou26y0aeMsux1LeOzX5tgzIp5BHjdCxlSCjMEc17t1U42WmBjeNNCTFCAfx7eRR
	OjiIPlwPMYsD78QEWUHWoiVHTOI36yltQfAMcOCZ5tW1w7hwUbmnF95lHxiOGIe64jtInhh/rJS
	GJ2meefIerl2CqHUiw1663j5SyQ9AOtJk5iPtuWwW1TsQEkOCnZ4/fIC2d/6YWWvZMS0mppAu2r
	QNzo44nbb42nTviMzjGmYV+7ZrqCYeLx3NUlUHWrOQAHTTC40v/npxPDrWN0osZzQvBkqbTxah9
	l75xM1zVyKlifDnjaURp3Y/TpL87mrMEtCzKhRYKemFPjzfWmiYMrceXGbRPnBJstG+yTjXL61l
	Ah1sKwM+AuheVW6gUJ6bAUKjAajHz+XJOnRcDQZ/XneSYEOvHnt/BBWzth+CHD8BKzz+aIZT8OR
	XeoDnMu91mENbyhDTmF+EmuY0w+kgUOys0dAtKKRSs4ASlVML10qQC0mM1v62K0lnXu8MeNjsZh
	wJ1Rjr1m4NX8RINCkAh0+X8WbZ3NfmpPObcgVugyL58V4ehATtgVyNSuw/+NX6KNdPPyB73k45e
	IIM5V+ymv7whh+8XeD+Q2Ls83kFu5ATpVEiLFG3gtJTgqtz4LWXx7twTiS4=
X-Received: by 2002:a17:90b:440e:b0:39e:6c69:7777 with SMTP id 98e67ed59e1d1-39e6c697978mr8690113a91.32.1789955841685;
        Sun, 20 Sep 2026 18:57:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a027ce61cfsm9765295a91.8.2026.09.20.18.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:57:21 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Sun, 20 Sep 2026 18:57:19 -0700
Message-ID: <20260921015719.1045365-1-rosenp@gmail.com>
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

eiger's ndfc node omits reg (supplied by U-Boot), so add a placeholder
there to satisfy the newly required property, matching the flash@0,0
node in the same file.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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
index 000000000000..96e25771a8fe
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
+                    reg = <0x00000000 0x03e00000>;
+                };
+            };
+        };
+    };
+...
-- 
2.55.0

