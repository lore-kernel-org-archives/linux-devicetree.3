Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA10303C8A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781549921; cv=none; b=PDMud376Jp2XhrCmUe6y+VxO9xH2DfoEQSvyne5BJ4YBzbI5W99v0J06qcmlPU7Q5SfKz5jn4ZPr38geNDr0dO0m/rRH5ilVYHJ2v7X8XJ8sbLGISldo5+QFE90POokF9NcfQJLXebe36QEybJUtqUpBAD1Rd6D1iD/ABw6YvyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781549921; c=relaxed/simple;
	bh=EaEtrAuuWPfEzmI/2UshlVTym4jvWovUmV87OOxEDek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GgxjD0rZf3F6hcYKlm7AmS5OS15ABMPtlgDLU7qCtl5eqdtjUiFRjLgR5DgmSQIzi9l6Ql+e6L3VgYgAFyaNff2ZvP3x9qHNfVevrWsiFUUgIXJ0cBe1LrTrrJkr8oxmPfBMjn9F47/yTO3iHbk/CIeX+OmjLcrtAON/4Zs7dAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgIKydkB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgIKydkB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2127717f8f.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781549917; x=1782154717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CefDNXp0t/3lemxoY4i19YgqNhdG6IWYc6pzOXdnlDY=;
        b=HgIKydkBb7IC171ueyrecOr1g7WSf+GOKh0Do2NyeSIV5ir4/xMixS/k2qMiw/evnc
         MOZdZXETYqLFAMHFLTToaOCgMQuUMTC9bHb6poLS2a74pHGk2AbTo3KpD+5QUNxkXGi3
         g3IKDjLkppvg5p00oiLqRtn/zzBSlwL30ww7VKmMhuc9vEdeeI1aUNlqycqwiJRRau//
         gdEpu9HJ2hvis/RlWYu9mCFm2cdPoFzO2HVxFuZIyBkOp/UTV1T7ijh2iN5xFT9jubKY
         OsN0mufrG0n683mPOanL8tTZQTl9e6qvpX8lNGC5IsPdXQEoK3B2+rKg2+9wig6791+R
         3GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781549917; x=1782154717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CefDNXp0t/3lemxoY4i19YgqNhdG6IWYc6pzOXdnlDY=;
        b=X2HFojBN6kT+i5tQNeJStNRdVlGTHt/2Qak7uzQFSMwrBjv0f9dGGLY0vkVlQJHQKa
         qyI9sTwZObF27J9lKsByF+DPNG2O3J/JWxSkaa2qobD7W1dwictVaOHgpnogA9uBJTP2
         Z4lYrB/eeDc7/UJUZfS4H3/G24Sm68qb7Kg10fOZKYHbWU5iBW9Joa/Uv7W4RQnYHQqi
         kyd/+1rmi5QYPk/SvD79y2BdjalPm4L48GtTQMfX4w0cnUA7fqI6vysYwK30crCGYJFI
         6w8ZI3AlMte7sPlg1AD2yixNL/ulTYva7AoGC0eeM5NLiCFeGpyuHJ4GGquSbjthQoxX
         /ZOg==
X-Forwarded-Encrypted: i=1; AFNElJ+g/gWNOBB4TW3TCQc8zRDuiMjs7BWgj5IMtGXvBYoqlV0wu2RMM3+VPCmPnIyU7ooNeOGQJuXqKuj+@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQHXcMZt7jLP23rIFolItcPUqSYk5ndrWRdag7efXqCPWvgG5
	9OT6v6a3hYliJUkIBoUsZE4DIjcag8nwWYMyquibakDAL3QsqjyU2nxEiB3vMy5x
X-Gm-Gg: Acq92OESEgNMz8J9gqHmuY17dgqZwimCUQL6a2VqwM5Ro0zcJW5v1reEzS9Ku2V2fIb
	04WNZXs/+Ac2t1BNN0/y+o+0ekc4L51+2kGeGdURwsakr6W4fQUrvya3UmkGMxsutK6CMrW1TAM
	Ys0rwWWWWe/fUf816lnzpcfibNuDdykwpHN5z63dD1tUbC9GBWEMS6Si+djfnGPCiDYW0JqKzT1
	LMYMlzn+S1IFc+aOxefUdn5AbBSq6Lc8H2jEkQC4t2nSvh974P+jE4ONo96Ev7SHavuBZVufvl/
	sWLBS60kDDewPr7f35GEghmlZy12OOEe9kQuKhgFnXpXhX7iZ73MltWddvHxU1S89+3yMy9pBeA
	jDC/fysSwQFSrQGOiEpiRVYTEJdzgKia7k1OS3MD3MrLl5iIY4QLqoMd1dpZTVhSrMyld8vleBa
	BG8jZvdbOqHvzP4mED
X-Received: by 2002:a05:6000:2384:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-46077f2db06mr17081462f8f.35.1781549916699;
        Mon, 15 Jun 2026 11:58:36 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm38040538f8f.20.2026.06.15.11.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 11:58:36 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4] ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT Schema
Date: Mon, 15 Jun 2026 20:57:50 +0200
Message-ID: <20260615185810.11804-1-l.scorcia@gmail.com>
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
Changes in v4:
- Removed minItems, maxItems properties from reg node
- Removed the reg-names property
- Adjusted the example

Changes in v3 [3]:
Sorry about the spam. A second round of dt_binding_check + dtbs_check
led me to additional improvements:
- Use reg-names in place of a non-informative description property
- Simplify the reg property in the example

Changes in v2 [2]:
- Fixed issues from make dt_binding_check
- Set myself as maintainer for the binding

Initial version [1].

[1] https://lore.kernel.org/20260420204514.1640995-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/20260421154619.227039-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260421193858.347258-1-l.scorcia@gmail.com/

 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 59 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 --------
 2 files changed, 59 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..1b7451655476
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC
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
+      - description: PKV region
+      - description: SRAM_BANK2 region
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

