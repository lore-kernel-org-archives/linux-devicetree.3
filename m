Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43547326D51
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590552; cv=none; b=LsK9k8Ad4zUAiRoazu/Cyg46c4Y2PgadZz+txUKJ9j602x1c1T3AzgLm1hDxaGNfLRXsoGpmLKQ4kSuw0mX/NItuy9XhVgRP2KibIJgnJg5okxteAiH9DlcbajGIqdy0/rpSNusdTAe7+JzdZT9TYSXJ3BkLSUtPfEhrCjrpT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590552; c=relaxed/simple;
	bh=BjQy2w8UgFsLUjww8QvJ7ljJMmBMyTaJyKGYcBMnacc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iEOGzkupqvYD4oM+qmrt0T3hpfYOIkW0FZRz51hvgTW0R6DS3mUxSN0DW6RrgpTg4ynMEDtVDynDyF5SD+BCbBPCoohETHUZQjOMWRhdcTd9Ybw7ui07eb9f786IDQaUd8eXD8We4ElNl7DN3CFwSeSferdyk+7cleXU2f01DJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9HAfxGe; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9HAfxGe"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b9033d230so552758a91.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780590548; x=1781195348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=;
        b=X9HAfxGex6ByT2jAkzHHQ4Mqc6MFLjnLlphZn+emgX5hm8lIdo8+PRu8gIWWcA/tA+
         MBmr1/Y743NpeDcd6clSURnu/g6AOpJrUvxj2VNwPmWoKk3NFsWqWPvVWklkzF68WLFr
         LOxCmyUl8rpJ/hztKDJfv2Mf989tzuuGiFIy4hnHKpDwRkYk+Zm2rDDRk5VE5rSlydLz
         WBBcwl8cD5QTFB4pElan5/IzwIcoulJZ8SpimM5U6wQS0xY3pdhik4VnsunpqsxDl2xO
         Nkn8QB5e82tkD6AKgudQ2hsvZIZ6Rg+4xeUkZl6mzPUUQRk4cxM3/s/Zyn/Pdj56o8bJ
         yCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590548; x=1781195348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=;
        b=B6L3DqA9tdgglSZ1RQ8ODEDP6YKYwjXqZNJ9DkZzYm5I6wwArkL713M4Z+5h1/ROMK
         y3K/eMOyzbapQzGf4eKB2wN8WCjM1oya6v9qvjPosRrFJ4A00EYHCswktr3vC8Ey5pyk
         PG0MzasC5BT1zE7ADINqtjreHZpZrY/JwhAhXRbU+01DY8kfMuBuNQy/xbWg2Ts4U6ep
         NSUdMpLXQ4kbBK3+NorfhYWnqXvhUqi0ApXT1PXcTXwlUTnah1DhgFtTLovXyHwdnZgf
         h3rSYIsILK/x5B8OKLbS+D0NGVssI9wEW9qnLPTtss4/2pnTLB5zLZeK0cnoGjnofM7H
         POLA==
X-Gm-Message-State: AOJu0YwrqM5xMb+AUtoz+uRM0cnhY0sX+pzoz7R8UXsEXM5ANUGK7u0C
	gTpIYtiyk6mBs+83v8u0Pfo0pZkZChxrFsyLt2pchbpzIMjmSGs4upolgyVUB6HGylQ=
X-Gm-Gg: Acq92OFhVb8A1SulVOkj8BuhBsXAXyT1vzi8Vl78BqPnq2PIJ0dPMWd6boPeogxG1Kg
	dPRT3D1OcpTkyipExPngAI97KvMNddPrrKNPu6lM8EvYpbEqRLHKNNO5LL2ytNg14Z80j8FdcKC
	DSNPkSnYYHzD1q62Stgdh35UYIqv+TmNWlk9xLbFSCloITMHX4Q5NQrYJ6Ximb1INJNiZfYB/bx
	9pLTS/kIG/GIue4upbiIfLGM62r4CkO0dL58P0yoVhA5xRBx4lxFBKhYgrPSSo0G1vl8GI+pmXW
	hZf962A6zlUmn8MkZqnGfHA5fj6ukY5q7csKaf/n15+n/Vi8ABcKJahoP8if/sdvvzYjyDNSEhq
	K1TbgSTway0QeED1wC7/5NaLnd5pnqJftoPtlSlSfiBItpygPHLdd7ePJbFxn9S/Mupo6ohRveL
	737407L9dwYGiZVxXi67ViDVXUFOrNfLECsT6h1Xfun6VIqJzJtHZh5oJkCVa17Hgq2zyd+I6/I
	jxlMEOIx37jdPhu/TQYdMYejVY9
X-Received: by 2002:a17:90b:2b4b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-36f781bded1mr3553423a91.15.1780590548307;
        Thu, 04 Jun 2026 09:29:08 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f712de91asm3670255a91.16.2026.06.04.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:29:07 -0700 (PDT)
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
Subject: [PATCH v2] regulator: dt-bindings: mt6311: Convert to DT schema
Date: Thu,  4 Jun 2026 21:56:24 +0530
Message-ID: <20260604162624.644241-1-ninadnaik07@gmail.com>
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
Changes in v2:
- Correct "MediaTek" in the title.
- Drop "|" in the top-level description.
- Remove unnecessary regulator node description.
- Remove unused labels from example.

 .../regulator/mediatek,mt6311-regulator.yaml  | 70 +++++++++++++++++++
 .../bindings/regulator/mt6311-regulator.txt   | 35 ----------
 2 files changed, 70 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
new file mode 100644
index 000000000000..f65ee2c90298
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6311-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6311 Regulator
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
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
+      pmic@6b {
+        compatible = "mediatek,mt6311-regulator";
+        reg = <0x6b>;
+
+        regulators {
+          VDVFS {
+            regulator-name = "VDVFS";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <10000>;
+          };
+
+          VBIASN {
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

