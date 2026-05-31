Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9610F391E59
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246831; cv=none; b=iWQmYZv22hkT1vCDRJ+9RPmDMCL24BrtBzTAcGfFJB9FS5EYhLskW8Uxigmtjwhzxyc4TRw/Qnw7v4AafjTwR1zLv+7avkkCJg9s4usvrqEtgdqzS2NCGj7vfdA+torstQTGFGvGkp10KayjI8vyCi90neexfmB23gFK+t+pbe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246831; c=relaxed/simple;
	bh=EOBpOIKoSoMieWyB4Iyyf+2+E8XFT3MTeLulNuhmax8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c5oKoqKL/lc0XoMY/JZJsMeE6ss2VFKdR+gjTp4+QU/SwxFQacemFHyws5kyx3y9yC1Zp5cgAJ6AA9TcUvbfj8AkbPw1df176pxWvntDsRv66J16fd8WXY0A9aJycsDIaCXu8LSo7bXLEtn/LSKzvJkx7nu13UN8hEIYcIvKrZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3+IGS6r; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3+IGS6r"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf1cda2b17so18058585ad.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246830; x=1780851630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=;
        b=D3+IGS6rWjf5dNU0YlKi1E4F03YDFyTqEqp5r3/AapOXJ13pnGI7VJkxRlgCzBxcIX
         G4+KquawQtZ12NgKFSAdAsz0eCTWL3vOOTjHAAgts4m0vC82PIGX1DQtPiY6I24n2Vkr
         zhLO0KvrVagxKJauEMuTD8h9MWZ6iZtzzzzLohe2/Hrl/qfmowrzgkc+nT4sz9NuvJ9W
         RpnrAQdMnv0EbQnJKip5v3ZBB9RFChIpuCAFjD0qXTH9GlSy2UU3qMgiQiXz9HqlpaOE
         uCE1kXlhvro3iaBMNfmC57rh8jVNQ47ma+hOyNAu+zO73SnejZ7QMNoza/nsLHWRraqa
         WD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246830; x=1780851630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=;
        b=GjthOJol4qxcuYyqXNGU5XMyiF5WgkNvOTknhhWUAurV5EoaC6uZPi4TH7vZS8VyID
         42/LTwOJHVUEA9VPtcVyH12FqbkUhKnGXxmHfmP0u3cdfbnQdYlnnqKBzOWYysk83RVQ
         3I4kPaTwOPuagZ29UZ5g3J4XR8Bgpd+My3GWzq+hLPy1TJ+QYebFEJTNzZ1rIUK6fvGr
         deZIXWfEx2XaNP4YDVNtNdeSmbu0WoQnzgpZjQ7sgOzkR30R6pzpFvWqKO+eocGLtU7b
         bGI+8KXG6vUlIANs5ygGSjnciAdqTjjJo2zlQMXlSitQLAICIM4em5KnEifqUhp1PelL
         oZzQ==
X-Gm-Message-State: AOJu0YzXO8ow9kRq9GQdO+Ttky0QIvAT4/X6QUq/JBNjTDTpu6qfKv7b
	wsC0ma3zdsSMeW4HfHVtR9DF3vPVtnQ9enyGllGlEb+ATr/OtXibI5+e
X-Gm-Gg: Acq92OG5R7/PNvNXXkAMZdlJbp+sTteDiy962xCa96wAn+I5mgTBPNsoOIqNkoKDdAl
	MyiU0Tz1a/UfywEb1t6kdyErCDM05x1kXZJIOXefIjIbprEZdV2b4/FaSnJoF85n2KBbRqB3FR3
	3wBebyqGrEU4EPJIlqt5JiOTc9BGGQiDl1wZQ0HgMGWycuprYhFKbCNtLL507zh2br2ddA/sXdm
	KvAJhKGrsCn9PpiotUhbZCEIfoA0wkQyOctqbgIU8BZt73Z+0ZLPT4Xo4j8YtWnvZaR7hqJUGQZ
	uwTaxNsQATs1xwRXigE5uc6qAu85ZrjFIHspjwBTckrIbbviecdQBFS1uExs9QLBrokuIq2w039
	dv2WyEkgLNfA578+HnxAspWLt4uBW///SEx5JTapx9e98FFg4LU4uOsUNpAC17HuMjHffsWp8lt
	wI6bhOIIYiJ+9tVyl5ixnbxAyWN+zmbCQGreI8njk0sgUzu3Px/3QfZ5Vf6v79zgqYcq3dqk8Gt
	throKIngXI8HM2u7pc=
X-Received: by 2002:a17:902:cf0d:b0:2c0:c8a8:dbb8 with SMTP id d9443c01a7336-2c0c8a8dff7mr27171725ad.29.1780246826053;
        Sun, 31 May 2026 10:00:26 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm99331075ad.20.2026.05.31.10.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:00:25 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] regulator: dt-bindings: mt6311: Convert to DT schema
Date: Sun, 31 May 2026 22:27:12 +0530
Message-ID: <20260531165712.729635-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert mediatek,mt6311 to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 .../regulator/mediatek,mt6311-regulator.yaml  | 72 +++++++++++++++++++
 .../bindings/regulator/mt6311-regulator.txt   | 35 ---------
 2 files changed, 72 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
new file mode 100644
index 000000000000..a51db46b0f41
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6311-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6311 Regulator
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  The MediaTek MT6311 is an I2C power management IC that provides one step-down
+  converter and one low-dropout regulator. The regulators are named VDVFS and
+  VBIASN, respectively.
+
+properties:
+  compatible:
+    const: mediatek,mt6311-regulator
+
+  reg:
+    description: I2C slave address.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description: List of regulators provided by this controller.
+
+    patternProperties:
+      "^(VDVFS|VBIASN)$":
+        type: object
+        $ref: regulator.yaml#
+        description: |
+          Regulator nodes.
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mt6311: pmic@6b {
+        compatible = "mediatek,mt6311-regulator";
+        reg = <0x6b>;
+
+        regulators {
+          mt6311_vcpu_reg: VDVFS {
+            regulator-name = "VDVFS";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <10000>;
+          };
+
+          mt6311_ldo_reg: VBIASN {
+            regulator-name = "VBIASN";
+            regulator-min-microvolt = <200000>;
+            regulator-max-microvolt = <800000>;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
deleted file mode 100644
index 84d544d8c1b1..000000000000
--- a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Mediatek MT6311 Regulator
-
-Required properties:
-- compatible: "mediatek,mt6311-regulator"
-- reg: I2C slave address, usually 0x6b.
-- regulators: List of regulators provided by this controller. It is named
-  to VDVFS and VBIASN.
-  The definition for each of these nodes is defined using the standard binding
-  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
-
-The valid names for regulators are:
-BUCK:
-  VDVFS
-LDO:
-  VBIASN
-
-Example:
-	mt6311: pmic@6b {
-		compatible = "mediatek,mt6311-regulator";
-		reg = <0x6b>;
-
-		regulators {
-			mt6311_vcpu_reg: VDVFS {
-				regulator-name = "VDVFS";
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-ramp-delay = <10000>;
-			};
-			mt6311_ldo_reg: VBIASN {
-				regulator-name = "VBIASN";
-				regulator-min-microvolt = <200000>;
-				regulator-max-microvolt = <800000>;
-			};
-		};
-	};
-- 
2.54.0

