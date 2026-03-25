Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB438C409
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 23:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479990; cv=none; b=EEMc7lkLJWjylkqeeE4khN4bVTZUJz2Xtom7jAXJVz8KhZnHpjGHOzRmPulptX81nGTnuMBA5q9jv85gEX0lkLh5ja4E6LU5SeRmnUdlQd8ZqlCW4Rwp7nHZmMsZknLKn6k5lPfD0GyWXRitk8L5rA5mJXsO6x/UCHftd1EPzr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479990; c=relaxed/simple;
	bh=P8eJNKjxyO4SVAzXo6XNccIikLD+xI3iT00av9Yog1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNSSRJ251bxWOZEWwlkOsz0u1wwYuxBtuwV2DAs3JGLSpkyvir/BSmlA5JLunkAWITZoPQniw1rynKojBk12j/j/VVypgsg43D8/swVYXIrOAbQibEhaCKTy06M5VjCq7Swu+HUxPWWPuZSKPX7ZMCioCq0XlJI6LTchI6j2lR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxm8mUbg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxm8mUbg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad4d639db3so1654255ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774479988; x=1775084788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8gyjWEMKeQzotP2hKQqpYN9gqNdwM1BT/NGfL3X+MM=;
        b=hxm8mUbgJpHfz/UtxRy/Wk1nFPN1g81O8Dngva/kHRYwc9d6rtfOaSkA+cnY7fq99/
         qjq9tM0F0Zph6vI+hTSYkkDHYKGoCT58yXE6bwVURhbuG6OkPrDHeK9W4xj53xSFiyyv
         plHG9pNIdtsnYiYi0VG3UyuUsIcs2m9TYAMXOtJUYqlNFfa5eDBBHFcwxkXwaMy4KROC
         d5riHZY4BPnRnNwi/lsIMtz8Nj9klkmfwjj6mZxHA4xp3YxVMpDjdswENfzIx/qhch6W
         /3JHeaPr5pGNoCX8LPwFMz7UMKzFEguDU2TT9DTQAPlIQj1b7H0rD3C1CUkzIloARIWX
         v8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774479988; x=1775084788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8gyjWEMKeQzotP2hKQqpYN9gqNdwM1BT/NGfL3X+MM=;
        b=YuMnpZ7w0LWh0Otme6A9NNI3ueceRKX77xVx8zsWgOe06XUkFAuGeD4/mrpOS3BnSU
         iSadxZfiA1XOYwTKsBNh3F+q+y69Hy4UfqSix/1Rz9DV8VIiBKYbCe6IWDzdGBzyvJ3f
         FCxpG2GrnELQfr1/Bee/Y+tIFgrmyGZ5EUhKeSlhQLZ+/n8k/MW4Z1qqqEMuE302wjFC
         IA4nQ6SPuLwe6GnNfUQWgBOaQOxMCYSWBog8+YIqgHc2XpdOiwJTwbCj4klWRb5XyySl
         2SgCxIN0INDzSfUGyt3yzosPnKkrMg10g+NIY9+WKp2fpKehliEDYpMdYo4J75ZeJzof
         +J3g==
X-Gm-Message-State: AOJu0YzU+NoaCa4rM0iXyn6O2QN39AdellV33Po3GV41fqNRavGg1J0m
	vlHd+UZ7WaWAFJYaIWaeD2qDteUVVmL5mcosjXA/MlFiLqLHgEVwGpWa6+p6GQ==
X-Gm-Gg: ATEYQzwUMXR1ffqaV16MKMMoRzT2n08gheydrt6Q76gvcRjv3ZelWa3M0Q4i78LjG4H
	N8RQS1zg52bbGhG50xO5lVRzbLUxP6jylK0+40UhXJxRctgrRYWxUOQHT2XGOLwxyxyKhZ/Nxo6
	Li3e03m2mZwfXOfv57Ss83HAG+M0+d8cT4x6kGQMSZ7wueqIlHZUd+pGtcf3Do+i3k8ScY0uB50
	e/aOozZDLJEiV1XxcqRydW4aLqbigQLdsXBODEGt+Zr/lPDHxd50mK897ar7wji6Xd2x+pZmTuJ
	jBslfC53c/3vjcGkG42zK65rFgmKyciuMmrISxBoVdcJyhMxnYvEUOD4z5YpH5UHGxCzmkbfiRu
	B9ArqFBiBQKIp8eH/gCxSZbrTSQVOJ+4bM7xeP2pN0wwPPYqrpmJyxSaD3eikUr2PBzmsGiR6GV
	uyFAE8EStZ3NzlgCgcXe+LSj/va96ZCMJOYl4=
X-Received: by 2002:a17:903:1b0e:b0:2ae:450c:951e with SMTP id d9443c01a7336-2b0b09da49amr59769705ad.17.1774479988270;
        Wed, 25 Mar 2026 16:06:28 -0700 (PDT)
Received: from arch ([2409:40c2:5018:3ab3:ebcf:9aee:dece:80da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc79f7dbsm9951675ad.25.2026.03.25.16.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:06:27 -0700 (PDT)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	reichl@t-online.de,
	sravanhome@gmail.com,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	rougueprince47@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] regulator: dt-bindings: mps,mp8859: convert to DT schema
Date: Thu, 26 Mar 2026 04:35:59 +0530
Message-ID: <20260325230559.73527-1-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Monolithic Power Systems MP8859 voltage regulator binding
from legacy text format to DT schema. This patch does not change any
functionality, the bindings remain the same.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
---
Changes in v2:
-changed markus email in maintainer as requested by him
-changed subject line to match standard style

Note:  this patch is part of the process for applying to GSoC device
tree bindings conversion project #
https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../devicetree/bindings/regulator/mp8859.txt  | 22 --------
 .../bindings/regulator/mps,mp8859.yaml        | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/mp8859.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/mps,mp8859.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mp8859.txt b/Documentation/devicetree/bindings/regulator/mp8859.txt
deleted file mode 100644
index 74ad69730989..000000000000
--- a/Documentation/devicetree/bindings/regulator/mp8859.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Monolithic Power Systems MP8859 voltage regulator
-
-Required properties:
-- compatible: "mps,mp8859";
-- reg: I2C slave address.
-
-Optional subnode for regulator: "mp8859_dcdc", using common regulator
-bindings given in <Documentation/devicetree/bindings/regulator/regulator.txt>.
-
-Example:
-
-	mp8859: regulator@66 {
-		compatible = "mps,mp8859";
-		reg = <0x66>;
-		dc_12v: mp8859_dcdc {
-			regulator-name = "dc_12v";
-			regulator-min-microvolt = <12000000>;
-			regulator-max-microvolt = <12000000>;
-			regulator-boot-on;
-			regulator-always-on;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/mps,mp8859.yaml b/Documentation/devicetree/bindings/regulator/mps,mp8859.yaml
new file mode 100644
index 000000000000..523498adf003
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mps,mp8859.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mps,mp8859.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power Systems MP8859 Voltage Regulator
+
+maintainers:
+  - Markus Reichl <reichl@t-online.de>
+
+description:
+  The MP8859 is a synchronous, 4-switch, integrated buck-boost converter
+  capable of regulating the output voltage from 2.8V to 22V wide input voltage
+  range with high efficiency.
+
+properties:
+  compatible:
+    const: mps,mp8859
+
+  reg:
+    maxItems: 1
+
+  mp8859_dcdc:
+    $ref: /schemas/regulator/regulator.yaml#
+    type: object
+    description: DCDC regulator subnode
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@66 {
+            compatible = "mps,mp8859";
+            reg = <0x66>;
+
+            mp8859_dcdc {
+                regulator-name = "dc_12v";
+                regulator-min-microvolt = <12000000>;
+                regulator-max-microvolt = <12000000>;
+                regulator-boot-on;
+                regulator-always-on;
+            };
+        };
+    };
-- 
2.53.0

