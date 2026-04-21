Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37F38735D
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 19:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776800355; cv=none; b=ibG3Itn6akI4SYqIe53p6IHPFbla23P5/9Z/PpNO3dkkZgHw/OUhIBmbNn0LFwJiVoey+v3DAB+CfqDTjGroZtNLalUR83jJ8dWAOjS2jdXKuOZc6pkI+ivyyaowDLqVCLo6hIFOupb5u/wC47PEzBb7Ciq96dbIYLDe8BcMs6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776800355; c=relaxed/simple;
	bh=WpJnEZbM5fbm2WH8XebpoE8svrsnm4NGnZFTjSLTefQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqa5QoGLs1YjIl6i1q0V3bSCTSYM3rzRuOVdgS7ioX75zYO4njRTnSKJ4ujQMquknx0c+nHzqEWjs6R1RAnB/cTvBNoJCRWuJMgcUqMnBRQWzE3oIesYmSMTGWkMhCt5mMJkOs7AXSm2RM1o0jJcDEYwVEAhn9yv5VECXmNIBus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6W3DyVq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6W3DyVq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d03db7f87so3160002f8f.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776800352; x=1777405152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5JuMO3gPYBlWwt5KKJVpxhIif6wlAgLOW24UJuKGpw=;
        b=T6W3DyVq4/RPInT/9vtVkYVqbeCkHOLI4S5/lJ0x31q//zhsiH6LFF9vx83M8XGYr4
         /7cgTKzxhP2TyhsnIACm6w/1j/TBivRXe5gal1bqm9SNsS8xiG6OQ8FF/sxlsShGewiU
         oOIMUaU4GCKEJd6hh4/e1jFpZPdPYcjWCE6nqyn2bYweAt3g9KkcrKt+ewDzLjfkxki3
         ukcSWu+1tvbj2Yosz1LlSUHTJN6Iuor3/DZrR8fUsm0KYuTSBO2Ku4GWWyDOaota8R82
         YH7jtUyTz9Pgq3lOI2rb1+hnZyP50sqPHx38I34+BOsiY/xGhLGqg07zujFuIzUy5LHX
         TNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776800352; x=1777405152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5JuMO3gPYBlWwt5KKJVpxhIif6wlAgLOW24UJuKGpw=;
        b=AbbsK6pBYMQx+GR9Qk7XTovEB+PQ3JsoXm9ggexclGcrfdgnRMTyEIeIitikb7QaCd
         bszX56yv6sc4i6FeEDAtZ+O3e1LUjNUv8DiQUXHNaPcgasOyPgSfecHjXHLSSC6G3x6s
         LAzBqhem2jOMWqYqQvApt7gorfggAj0Z1h8B2vMaUIvuNW/1T1l18s/r2z3lqaIhFCIN
         b1Uq1pegnFHZ4iGYCYEZJD1tJNMtt5fDyh7fODFayXUlUdgQ7y6IeL9JqwZNqlOIHx+Z
         LnAve3AJvw856AVNJtAZ7dvCvUPWwyzjmbw+q24LhAGFQV4Ltew9kEv/AF6KVmgiFNqG
         F3xw==
X-Forwarded-Encrypted: i=1; AFNElJ9BoiXuaJvBVs6jCfTgDhda3kyfnihuBLE2Ta8BgY2s5zV3x1OkgsPM/jlRsjN5RqpB1EZBB2cKdkgZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2/Wu6bMSA0w5J8fzybZsPxPz9m08VMQiXKe/yIlp13vP7KNP
	aN8WfMJBRVyDR5dvnFr49C0M/Hh7Qe5Bmero1Id1z4PkLKwj2IOfi6LE
X-Gm-Gg: AeBDieuTdBUuji8/ueG7vWOA/ZkjsrnVBJ7NNZHKWhczUrw5Stml0CMgmUvkwojFP8W
	WLrBnnQIPmqW5oUaVVEMeWmOpayLSEfBqFyH9oWpDcA1FDlaDdKuUIkIj8yFBCZqiGUhpc7j8Pw
	8mDWcMMkv/S3k6yH/APg7k94UNda/+swyqHEpcKRMKintT6cP7FT/kUI62b1VfmAS82eNfEwrJU
	j6+zJdPqtPZJsEmfMrqd5ZhVYlyH6pTthTHr/RUNoPca8u8fn/biUERHoWiFSkb9SNSJE6O7xu+
	rhih9y04N0AvoxHjL18hEQfhy+HRc9LYLg8GO0IwWOLBKBMAaAJ4Y/GKjJ02CkL7nYFc66utU7w
	0j6saVxp8/7/tkQSBacBXuHjuU3l++O3nQRoajuewxCYc6kGxL325A8H9wtszamOhnSWOTVRmMl
	UgzyyuHRDLJ0GnhUUVZDbg3uAiheH0kXiqiCl5u+xC
X-Received: by 2002:a05:6000:2dc8:b0:43d:6fce:3ef with SMTP id ffacd0b85a97d-43fe3dd2b9cmr29894868f8f.21.1776800352013;
        Tue, 21 Apr 2026 12:39:12 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4411c9f4f03sm10443782f8f.1.2026.04.21.12.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 12:39:11 -0700 (PDT)
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
Subject: [PATCH v3] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to DT Schema
Date: Tue, 21 Apr 2026 20:38:35 +0100
Message-ID: <20260421193858.347258-1-l.scorcia@gmail.com>
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
Changes in v3:
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

 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 66 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 -------
 2 files changed, 66 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..22ba7d0bdac6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,66 @@
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
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pkv
+      - const: sram-bank2
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
+  - reg-names
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
+      reg-names = "pkv", "sram-bank2";
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

