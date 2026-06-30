Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7301409E16
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822359; cv=none; b=A6xo9847OOTwG3/nxBI4XhCPfcL/sF3hnvQ0LjuYq83M91ZNiGGHO00UNPJPh5McN0SRLkBhSaZfK9Zf7mMRX4DrFy+wQTpOmwzY5vk5bMsQ8Fzx1XgqySPfcEUER+TjeCy3RkQ8xsthrdwI1eexmyMdby8zjAsExJzRkiuqfFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822359; c=relaxed/simple;
	bh=MNkEHF1K+iSiSHsu+j1fMDOj0kaqSS1YWFTmTLk7bYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WHflp2Byw0iy/5AbZO/Yryuf0KKDiDYuwQYkTgCR5PEJ4BuzKbsZ/kBpHiePm34RbfkNjnfkA2tZApdtBRuyIDLJEgEuqCeBqy5rI69oRuhGh0l40KCsp/ihVE5GWEUZ8tW95BwfJKoCFLedpnTmqamZoUxNUOYkYR0212GSO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szyj6qQA; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szyj6qQA"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30cac93dfd7so488871eec.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782822356; x=1783427156; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HoueKVt/m40/D2H33OtCJWHdjBpF+s3HAkwMmHaIX8Q=;
        b=szyj6qQAkpFhOJ6BojCRukpJgUTamor8HrpkrJfw9asdHWEAkpKvJ1R1hZqYjUsCBK
         E3XNwBJTVOZvtGMcS6d9AJkOcE5CdwOL3AHTelA2jLE0VMeDjcnSthOfrhiQnZEwjCt6
         ioi3pgLSgEIZjvAgS1uRsEsq2Ki5RvO8sQTf3Z1KMER41SGisoe5R9iKZaAZjMTkqMdk
         dsI27P99aQ2wcHgI+QwdedIehidipvZ/hxCm1pZQFL7YN6cYCgQPXeInUGV/YXguihKP
         yPBKi0Qt4YyJ3Qw1qK/7RALZdRYh12FLt/CKkBJZxnLzakOezGvBfzKtJM4EtyF9ggwv
         xN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822356; x=1783427156;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoueKVt/m40/D2H33OtCJWHdjBpF+s3HAkwMmHaIX8Q=;
        b=kBqbS3HPrthkI15I+zg3oV1qs+rCmGJJHS14WYe4xliE3L1YLCraiW6SJW6soGDrdQ
         BsF+No3JnD1Pu8oDlTU2e/TzsT37zQwxaebMdswyVIee1GQ8Vp0RSg4IePD6lqMr1TZ6
         bddbNsFJAsqaCCYbARaC2exkv3ymePsWnUmxCWKOYeFNjLjB1k4/gc0RSlur5aAXIcOL
         OS/onQXy0EifLHafQ/YbudYtPxHt3KbDLWvhAO6rtmqdCWlLxZ1wfuJmszIjAYuniFBr
         RUvh0vbQ6WPF/qXTv6TIB5ap5Q/jfDRXatngNgK09defOMywgK1gCUAQi/FL1CPWJkZO
         vBxg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/LBmpIKpNiMeQCkpq8BsDV1qvzW+F/GL0MWO8bjGJxobhm4jQZ7QA/YS31UUk4erchRC/WA2suQN6@vger.kernel.org
X-Gm-Message-State: AOJu0YxdKESTf7q+OOuc7TAirj9mey/gWa9YT3nJNRI0q8tZX8UL8TxM
	eGX+hJn/Ob35UnOL9i9pz3esGHUr8/gN1V1aqV8RiY3LVDcYglKlGMww
X-Gm-Gg: AfdE7clc8xHAMAGfR3EX1ABgXL/ddG5rs3Df6/mAvk8JtLCb9DbraxroH14aEF38xeV
	cwWy+DNGq/LNgBsIZf10f/hQERWR7sHiZaxGvKPphKJduMgvGhFXXMOUx+NffxgtI8nS4+x7kEK
	vGUZE6nwOa3J/KnXLtY2AspH+jyOPQwO1+OVNBGq4xQ2K9yJOxylFcueGHd+9h5Tuk7aiVshSrx
	t4a0/ehC1Mx8FkIFWeWXLuTEPpWzDCq1UBBCrZoTCiOEwUypxc60OWcmSOWuMsexfYCx2PkICY2
	nk9DV35Undf4GVje/QjkvlJAIzTCul7IU9XkBc+JBINqdVxIHudbdOZu9buugGEk4qU5zRznPWo
	3fX//ooPryjjsThhmmu3xFBCivyKe8ZdgUMGkc5uL9vXRAXA2xqK2E8TXIN6KnHgGXO577ci6c/
	sxxrdESRqq2vpFBaDxOvkVGtEcLMWuie1IRVI=
X-Received: by 2002:a05:7300:c88:b0:30c:ab96:7305 with SMTP id 5a478bee46e88-30eea0bbfa2mr1240210eec.21.1782822355886;
        Tue, 30 Jun 2026 05:25:55 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.62.174])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-30ee2ffdbfesm8042375eec.11.2026.06.30.05.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:25:55 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 30 Jun 2026 12:25:49 +0000
Subject: [PATCH] ASoC: dt-bindings: ti,omap4-dmic: Convert TI OMAP4+ DMIC
 binding to YAML
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-ti-dmic-v1-1-9e4400230266@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMy1Q2oC/yXMQQqAIBCF4avErBO0oLKrRIu0sSbIQi0C6e5ZL
 T/434vg0RF6aLMIDk/ytNkEkWeg58FOyGhMhoIXFa9KzgKxcSXNuEQjRG1kUytI9e7Q0PU9df1
 vf6gFdXjncN8PTdKsDGsAAAA=
X-Change-ID: 20260630-ti-dmic-09ef117f987b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Convert the ti,omap4-dmic text binding to DT schema format for
validation with dt_binding_check and dtbs_check.
Changes during conversion:
- dtbs_check flagged reg-names, dmas, and dma-names as undocumented
  on all four in-tree omap5 boards using this compatible (cm-t54,
  igep0050, sbc-t54, uevm)
- Add these as required properties to reflect actual hardware usage,
  since the original text binding was incomplete
- Drop ti,hwmods from required, as it is a legacy property tied to
  the OMAP hwmod framework and is not mandatory for DT schema
  validation going forward
- Update the example to exercise all newly documented properties so
  the schema validates cleanly against real board DTS files

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/sound/omap-dmic.txt        | 20 -------
 .../devicetree/bindings/sound/ti,omap4-dmic.yaml   | 68 ++++++++++++++++++++++
 2 files changed, 68 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/omap-dmic.txt b/Documentation/devicetree/bindings/sound/omap-dmic.txt
deleted file mode 100644
index 418e30e72e89..000000000000
--- a/Documentation/devicetree/bindings/sound/omap-dmic.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Texas Instruments OMAP4+ Digital Microphone Module
-
-Required properties:
-- compatible: "ti,omap4-dmic"
-- reg: Register location and size as an array:
-       <MPU access base address, size>,
-       <L3 interconnect address, size>;
-- interrupts: Interrupt number for DMIC
-- ti,hwmods: Name of the hwmod associated with OMAP dmic IP
-
-Example:
-
-dmic: dmic@4012e000 {
-	compatible = "ti,omap4-dmic";
-	reg = <0x4012e000 0x7f>, /* MPU private access */
-	      <0x4902e000 0x7f>; /* L3 Interconnect */
-	interrupts = <0 114 0x4>;
-	interrupt-parent = <&gic>;
-	ti,hwmods = "dmic";
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,omap4-dmic.yaml b/Documentation/devicetree/bindings/sound/ti,omap4-dmic.yaml
new file mode 100644
index 000000000000..4719ac48238e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap4-dmic.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,omap4-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP4+ Digital Microphone Module
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+description:
+  The OMAP4+ Digital Microphone (DMIC) controller captures audio from
+  up to three stereo digital microphone pairs over an I2S-like
+  interface and transfers the resulting PCM data to memory via DMA.
+  The controller exposes two register regions, one for MPU-private
+  control and status access and one for the L3 interconnect side
+  used for data transfer, and is found on OMAP4, OMAP5 and DRA7xx
+  family SoCs.
+
+properties:
+  compatible:
+    const: ti,omap4-dmic
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: mpu
+      - const: dma
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Name of the hwmod associated with OMAP DMIC IP.
+    const: dmic
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: up_link
+
+required:
+  - reg
+  - compatible
+  - reg-names
+  - interrupts
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dmic@4012e000 {
+        compatible = "ti,omap4-dmic";
+        reg = <0x4012e000 0x7f>, /* MPU private access */
+              <0x4902e000 0x7f>; /* L3 Interconnect */
+        reg-names = "mpu", "dma";
+        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&sdma 67>;
+        dma-names = "up_link";
+        ti,hwmods = "dmic";
+    };

---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260630-ti-dmic-09ef117f987b

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>

