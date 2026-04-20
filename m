Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15AF34A79E
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776717937; cv=none; b=qTL2ZXJcmdZlnZc5GlQOTkYvxCy/L2uQfXv3ArsdR2KLx0/+pb1kDV7S/G74NNlzuGu79X4Bp3Objg7FXL0vkG3hho/lHPKqVhms4XcXV6D4ptZjkuxFzB6xs4xT4vPx4a5eISQG8pq0UoqOvQtxCZueCdLfpph0PdAGQ+lJyLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776717937; c=relaxed/simple;
	bh=vZOvZ46pt7uJy3xGvIw66QB7EkGKjD412n9UrrKxX3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBOUd4ZIBom8wPvCaaGWDqHvoMdAVH3NqvezVanA730HrqpotXUkGQal/93B5+qtjo4BzRUGW+r2pyft0BLZJYdMDr/yxeyLM4c/rakoemVrHvhL8U1kCHedqIUV8uFYOKWgtcN1I0SMdMyhzpJRJ8qSWKx4Y+rbR8hQxeMnmOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huJUy+T3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huJUy+T3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ba840146so33334895e9.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776717934; x=1777322734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFxnKBIb4rP9HCGv24zgq2DmExS0pP68iWUHvrzRj3k=;
        b=huJUy+T3EpARDIkHJo9jKcVq2vxtP+fLKqLc81ziGkvcB71yz1VrvhHlGid8R2KKk0
         8eNqFiJLh6MllzNBFx09Frnqzs4zpIsHimpvFxumxvqf1dsqt42HArTs2AmRZ0LG2Ge5
         RNdv+2zMFEqfvmYdJVr28bctDA8/F7NgryJWKuCoQxQrWObN5rnw6gml8+xR9p3/Vzd/
         WPYNEbjh1te+Gk0GESsUtMMd7JLwUyveXXHBC/tidxFnFt2SUFCZabzjSRttkGcIcQaA
         t5AR4f2+xxx/RvmPauksLNyqcCYXk9hUH4CRY3ZfLTtLkYuN/1lrid4aXOEYMswnba93
         93uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717934; x=1777322734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFxnKBIb4rP9HCGv24zgq2DmExS0pP68iWUHvrzRj3k=;
        b=pJl2Uj5e8H6KOBNjtkHxo9KArgwoptwvSpuzf+cvu81tG6K4/GDLN5aYQ7V584d67j
         Grm/1Fe97hGSsoaFMe4QKtOJcQY8sxE0agbAtnpKlmRYxLzz985kyQE71P0kcmlqrE1r
         w7SsfdBSQXHToCvSdyMCdyakF3dSIICfLLIzT7Q1Rl3otQHg6Q7yHrqqdUkpJ0MzamHG
         yUtOwDrycKzjZLfmPH65S+nWe2tIGFUdjUn61HM++dS3M9YZ2z0itnuXXhMYDULjpdu3
         m+gEjPBnIvlQfCMnysHXnA7orVYqRDFkPh9tUs1JiX1Y1Lmp0qHDQQsWjIsKHiVfjQsD
         eDFA==
X-Forwarded-Encrypted: i=1; AFNElJ+Y5kxENxytGe4fKzn8MiDmwGadOYTnKCb6MS0UlfDHf7l97MynfYbpvHA5R8IC2508oepUlbWdHbak@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt36LLKmnf2zV3jBYe5ddSc5CYGSdN4nlC5u/wVBqs/dVYEtV/
	BNfmwEdA459qlgLXWeQG9kBmbbP3TjoFbFcgBUmz+rBpzNPxnolK1GYD
X-Gm-Gg: AeBDietbn9fihUwLRqiFRKRlgoSnCI6qfoBMcmkzr/Pizma6iFnotiBMKQhmaxlBTOb
	nslgidk0SUWYS+aPmLVrdugAFBJe5fZmweLGxBQHB7nB6pKsEg2shPoY96a6phCzemZjFECgdJa
	308wvY3jylXEZT6xL0ah5h7XzVVd8aqapWtlFn+53oGpihzDJZEgqN3Rn5LPPDbe/foFBQsYR3g
	2cw4K9rU0gXcj0OxqFsPK/a5N5ME7gGF1nFW981O/6baLAOfQ6ytN15YL6crAHKzXYI+8s5TL6Z
	Tf3uYSLklvHcmAXTD5dDPZwGnINekAq6dqqyHclvadEuQeVW9QvCZwUGeEHxaNRUO8+Ch4R7us0
	CNC4JFlE6PWbD0R62Kp70reF/w3BevDw+gFM1/Xr1AAd+GZj25DTr56Dgz4OAcXjMJiwbqYaiF+
	TnokhQs8Nay6fAgZOXP8KMzlyuG8wV0w==
X-Received: by 2002:a05:600c:8115:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-488fb77d7d3mr176918155e9.21.1776717933714;
        Mon, 20 Apr 2026 13:45:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c320084sm170344535e9.2.2026.04.20.13.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:45:33 -0700 (PDT)
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
Subject: [PATCH] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to DT Schema
Date: Mon, 20 Apr 2026 21:44:30 +0100
Message-ID: <20260420204514.1640995-1-l.scorcia@gmail.com>
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
 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 54 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 ---------
 2 files changed, 54 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..f423e3a02997
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC Driver
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
+    description: Array of register offsets and masks
+    $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    mtk-btcvsd-snd@18000000 {
+      compatible = "mediatek,mtk-btcvsd-snd";
+      reg = <0 0x18000000 0 0x1000>,
+            <0 0x18080000 0 0x8000>;
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

