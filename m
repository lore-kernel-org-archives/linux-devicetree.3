Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E826A08F
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786404; cv=none; b=lIWWzyzc1qD/edRedJNYdZwO3DyPsYA0LmywGpvX80Bdzn7ARtMTTMqvsykjH7Qa3QhPXldRk5huKdmVw3oLDTCVr2aAWst4Zx8n7Ph8SM1eueeRrLUMsNBx/2YKsFflTyXn3i99bI55ZGL5CgYErYz8Qbg0XgZ0ucYfRhmx2yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786404; c=relaxed/simple;
	bh=KePFdqtxhzIfGgpRbgVIP0PIcNTO7D89nGU8iW1dSUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BXyBe35aYSHJX9NphgsKLoPccIs7ojccj0RihSo86dGcTHsyIGpnxaELPLCVXEk21gBnjkgnMAmjKlF76HhwMcFuZ18flKUYu+DZ0gRidoTVCi2A13LPZEO5sL7QqJ6wgzMzbV3TkuLvmybV86RkMAimjQQHg434faTcLfmmpZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIpUZy0I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIpUZy0I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so56569975e9.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776786398; x=1777391198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=;
        b=HIpUZy0IYUP5lCQy7pxb1J0+f0HavkN8rIbhPtyxSRxmH51G6eY2uFwRUquZtGG8ad
         wy3sHcNvFMdfgblKKb4GfUnvMk9UoP1oXglPvu6PqLF1duOeYwf4/2IEOd8z8M36M+t9
         E7M/Sbyhvnvc5U+AHgQbAZBE/csgyDFUl43giKg6izGvmKJg7OvX9K9OU2Mu/GltX/v6
         rsBQZ3Ctq3TgQSx710mgw+rQ9ifI9dYK9w4WLKSp6VL0KGJFom1hT+i1QBEjrihMPhKf
         GJeUGHWQAQB/Rou9RdbIeqAAKW9S3S10IOU8/JR+/+0eSM9hOWWbqKl9Fv8qfWrs/d9y
         H5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786398; x=1777391198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=;
        b=NafLEIzw7G9RwlwgvI2cU9K99WnkGGputLKpdOJRGWKovAD0ZpQS1UOvdKoPYfC/Bz
         5BTZCbXChyW5JQwjsmq7Wi4RTzpNSRp1fJyiq48FnkqApDxnOjxF5WJpsTseX92IWMoJ
         xblJpIjNSBiBg+6xGlwZFUPd4RZUIGPRDc0nfHRDpKL/62m9Tc3wFfvCUsxa9wEfMJWg
         7ZVFXckthtQO7bs1/G2Sm89EPN0eo3yVAkIQiKtJtiVtGqP2LG0xXm6xjt7uGnsGP37o
         x8egeVcKwQog2KMhOiZ883sDiVq7b869uaJI7Shfni0BowNdh6/42i19kcr49ba0+TtH
         CuZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2+E7TIquYqVmKkBAXr9Lrd48gP9W1Uu9CYk9vY3GqGyZ6pAWhG2ftvX5wrTWMdJ0D4e7l3msAb6UG@vger.kernel.org
X-Gm-Message-State: AOJu0YzvfWudyfhxl9gJuUR5C1ADE72VCqrXxBE+S6w5FDrka4MOnrgr
	LElrC5d4ABKkk26lH8Scq7TvoZH4L8cqC2dOBOBnhSs9KuC/+MDEZhar
X-Gm-Gg: AeBDiesjLsgKyHJILvl7vdVY+Vh7h2DTKRrJleHkFvwJZySDzdwFJPKaLylULKyNqtV
	m7rGEwEYdKHm+Zmg3vmSXYuFrMSeMo7YoqvrZ6oAag1r1Yygz9YaYF0PZVcLXssVWNyI0iBY4RS
	Eatom7owhlrHBfq4QfJ/0mCEzsn/o/b9YiZF6UBE5REFwqkBLgZtRMPFqZ2JcKWRQYh0CnGxNPB
	/IeUtznoSwtqfYEe+hsUo9dvfR9MT7ikoz6QUr0jB9MEtxzPYwFFxwJVRHkpwJf1YMnr3EwEOTk
	q9uNDbK0Touef1MW/qazJoVKIT0HeD2agNeqWOrr70rbyl8TeITg+rszZF4/sasFc/hC+YMTfBI
	adDuFKXV7ABGz171tbazS4o3k/LYO4tGKKLxu+ovS3qgPhTg25h1PqmrZmHUiCQUCDKTGNmYdL7
	9V0xFJrqnFKrfvtFRBu31FkUEOTYPUsQ==
X-Received: by 2002:a05:600c:4ec6:b0:489:1f98:71e3 with SMTP id 5b1f17b1804b1-4891f987487mr114165495e9.28.1776786397946;
        Tue, 21 Apr 2026 08:46:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c318636sm174759655e9.7.2026.04.21.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:46:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to DT Schema
Date: Tue, 21 Apr 2026 16:46:07 +0100
Message-ID: <20260421154619.227039-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the mtk-btcvsd-snd.txt DT binding to DT Schema format.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Changes in v2:
- Fixed issues from make dt_binding_check
- Set myself as maintainer for the binding

 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 60 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 --------
 2 files changed, 60 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..1ec50c7611df
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC Driver
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+properties:
+  compatible:
+    const: mediatek,mtk-btcvsd-snd
+
+  reg:
+    items:
+      - description: Register location and size of PKV
+      - description: Register location and size of SRAM_BANK2
+
+  interrupts:
+    items:
+      - description: BT-SCO interrupt
+
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the infracfg controller
+
+  mediatek,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Array of register offsets and masks
+    items:
+      - description: infra_misc_offset
+      - description: infra_conn_bt_cvsd_mask
+      - description: cvsd_mcu_read_offset
+      - description: cvsd_mcu_write_offset
+      - description: cvsd_packet_indicator_offset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mediatek,infracfg
+  - mediatek,offset
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mtk-btcvsd-snd@18000000 {
+      compatible = "mediatek,mtk-btcvsd-snd";
+      reg = <0x18000000 0x1000>,
+            <0x18080000 0x8000>;
+      interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
+      mediatek,infracfg = <&infrasys>;
+      mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt b/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
deleted file mode 100644
index 679e44839b48..000000000000
--- a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Mediatek ALSA BT SCO CVSD/MSBC Driver
-
-Required properties:
-- compatible = "mediatek,mtk-btcvsd-snd";
-- reg: register location and size of PKV and SRAM_BANK2
-- interrupts: should contain BTSCO interrupt
-- mediatek,infracfg: the phandles of INFRASYS
-- mediatek,offset: Array contains of register offset and mask
-    infra_misc_offset,
-    infra_conn_bt_cvsd_mask,
-    cvsd_mcu_read_offset,
-    cvsd_mcu_write_offset,
-    cvsd_packet_indicator_offset
-
-Example:
-
-	mtk-btcvsd-snd@18000000 {
-		compatible = "mediatek,mtk-btcvsd-snd";
-		reg=<0 0x18000000 0 0x1000>,
-		    <0 0x18080000 0 0x8000>;
-		interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
-		mediatek,infracfg = <&infrasys>;
-		mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
-	};
-- 
2.43.0

