Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDD041A50A
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528367; cv=none; b=aAUMsu2EHeqH/jJlyu484Dx9oDZA5PmSSipC6LJZyAGGo67x++tCicBmsY0CoeT7F55b+EN2NKqJFmjh2n2UJxyhrYDzRLPCrqW7IKsjjQnPq3tjzXo4K5UAxwXWrYzcfv/2Xwl0YaAidqDfSoaa2RXq5SDPUaltmqXsrc5jrxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528367; c=relaxed/simple;
	bh=sgxN7UN+XUXyG7qk6IaOqJaMDugGidnZy3yAMe0HKzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hj9Hb9xM9VLawJE2DfY7qrgFu8P6e8fyfa4NFyhkX3o3PbRtxIJ52WSIV0v3nr8/PiXNM16JT0Tp7HyPU9K1NK+yRWmLchIIUTsJwxMH/iEb43UVCziXXdnGq9843d5Qr4Qny86AuMLL3skbBRNLGdJfbEVUvDRgt5G9XSV5I6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Enlo5Bf8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Enlo5Bf8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fd4531020so402849f8f.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 02:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786528364; x=1787133164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0MRQKrbEb/o4MfNY9Bod1jXPM/NVFyMqqnVyQWvJpY=;
        b=Enlo5Bf81EAmPY++/q5+D4yMN/tv4c0Wl6nOwhrzet5GBU8zDXEQRZPdORpCbCGx6D
         oYAkd+3DMxP/rLPo3DfBZEZLV1+jIB+UjkbVos+Y+mVvXkz/IJ9Z4C7Q9Z6fwLwmQ5np
         rytO72BE/CrjGQXoP/zwA1C8uufs4u4ZrFjMEpCQ/WKPjizAffNZITiqdMCciAZAEFvv
         nooktkwVj0zuQqftgFdbeX847kzeSjtcSFC+viqZH7KRdT0rh3k+OQHZVSw8q5KfFAeO
         rS58yxQbyME3Fu/uvG6yEn9MPrx8f8tgUiKZBbmLHDbqAB3djicUmoRqxCmf5/JN9aOk
         WAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528364; x=1787133164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0MRQKrbEb/o4MfNY9Bod1jXPM/NVFyMqqnVyQWvJpY=;
        b=dro6RKAOC7rHf45AjWSrfirePsRQ6xKG3YGBm/sXPHWXSNEu+smB/xXBi4s4TlUIo+
         44WiTGFpXxPhhRP8oX9kOwihNQw8kLlDLH9gTyGnhDiinD1kydJJbvA/v1uvS6roiL5H
         kztkKo4BC4v4FPkWbkNeSnxQ40EDy/miG61gL5PZa0kKrak0tyDWdz72rJuVIFwo2Lnh
         6M+w6p4eYAyNO8tPpbgBXyREIizMrpC0A2OlHpMe6C5BasdN5ZUX5z+w9bIcWtTjPU5J
         aWai4BD73/K7S9oDf8svkfmngNt/Pceef77DazIMtE1Z0c4VVaXm5J/FUS2LHbdvnxQh
         9Ofw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+vJW1zvWcCzISkY9dImhZep2MmJWcPjLu2eazb/T/eBZ11nRcUb8a5NkMgyCxtUxJjMN1E8KOKwU2@vger.kernel.org
X-Gm-Message-State: AOJu0YzuD1gZApV33zLDa5sN+4/9wgk7iqjzlSew58V0dfvMuDCRozGH
	OyeON0mSf78hSTak3lmm9J9k4Sf+PKcM0ZJ8z06ReMgnmEJNwvWZi7ZC
X-Gm-Gg: AR+sD12ee9pGti6SZyUq+kHIcOd5xU5YreiQ+Mzpn5R48YTC4gG5U4hsbBdlMABANy3
	4d+Y6FdouJF/9DhQlh3KpGs+CFfHxFAcOpTHABS+nJKahxutv8+hPJvbvSI7ZHGHn/Mf10Dn+J+
	pOTa25i2plncgcqRnx1xhdjG1G00LbE1vgJ+YxlM2ihKArOCHm1ELQ4u7+Zl/evD8pQUxgXL7Q2
	N90GsdBzkAnrMEEWzA7uGhpd1DbQbU/Zf3DbZAswBLALhl+mhs8b4DcRBu1e+amsQIxugK8XoU6
	5HNWarlP1x+CC1o/OLpbgUM6PrwZGnVBfRFlzdA94sKnZyoMs+djAZdw1Pi+WZavE2NxdwG3vfq
	d4wpMDxXjqLCkNyPtUcihMK/b4q5hVhGDImkwYl5YJIOOWNh2SitlIb8i+JEEaP521NLrI/VCoW
	6tdwbXqXGayG1YX+9NjbdX+1PCN990akkURxYDIfJ4huVPoFEJ/KX523PZ18ZvbvbO3Xmp2ILIa
	+D0yc4NeLZV8x0CgZudOEWVrtI2eQ==
X-Received: by 2002:a05:6000:2407:b0:481:3db1:a62f with SMTP id ffacd0b85a97d-48152913c85mr4421061f8f.17.1786528364012;
        Wed, 12 Aug 2026 02:52:44 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48150d4e29bsm5765877f8f.24.2026.08.12.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 02:52:43 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2] dt-bindings: mailbox: Convert TI Message Manager to DT schema
Date: Wed, 12 Aug 2026 09:51:53 +0000
Message-ID: <20260812095153.1060237-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments Message Manager binding
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v2:
- Renamed the file to ti,k2g-message-manager.yaml to match the
  compatible.
- Dropped the 'minItems' from 'reg' and 'interrupts'.

Link to v1: https://lore.kernel.org/all/20260811091847.686229-1-egbostina@gmail.com/

 .../mailbox/ti,k2g-message-manager.yaml       | 67 +++++++++++++++++++
 .../bindings/mailbox/ti,message-manager.txt   | 50 --------------
 2 files changed, 67 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/ti,k2g-message-manager.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/ti,message-manager.txt

diff --git a/Documentation/devicetree/bindings/mailbox/ti,k2g-message-manager.yaml b/Documentation/devicetree/bindings/mailbox/ti,k2g-message-manager.yaml
new file mode 100644
index 000000000000..481b7c8c0e96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/ti,k2g-message-manager.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/ti,k2g-message-manager.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Message Manager
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  The Texas Instruments Message Manager is a mailbox controller that has
+  configurable queues selectable at SoC (System on Chip) integration. The
+  Message manager is broken up into queues in different address regions
+  that are called "proxies" - each instance is unidirectional and is
+  instantiated at SoC integration level to indicate receive or transmit path.
+
+properties:
+  compatible:
+    const: ti,k2g-message-manager
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: queue_proxy_region
+      - const: queue_state_debug_region
+
+  "#mbox-cells":
+    const: 2
+    description:
+      Contains the queue ID and proxy ID in that order referring to the
+      transfer path.
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: rx_005
+      - const: rx_057
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#mbox-cells"
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    msgmgr@2a00000 {
+        compatible = "ti,k2g-message-manager";
+        #mbox-cells = <2>;
+        reg-names = "queue_proxy_region", "queue_state_debug_region";
+        reg = <0x02a00000 0x400000>, <0x028c3400 0x400>;
+        interrupt-names = "rx_005", "rx_057";
+        interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt b/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
deleted file mode 100644
index ebf0e3710cee..000000000000
--- a/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Texas Instruments' Message Manager Driver
-========================================
-
-The Texas Instruments' Message Manager is a mailbox controller that has
-configurable queues selectable at SoC(System on Chip) integration. The Message
-manager is broken up into queues in different address regions that are called
-"proxies" - each instance is unidirectional and is instantiated at SoC
-integration level to indicate receive or transmit path.
-
-Message Manager Device Node:
-===========================
-Required properties:
---------------------
-- compatible:		Shall be: "ti,k2g-message-manager"
-- reg-names 		queue_proxy_region - Map the queue proxy region.
-			queue_state_debug_region - Map the queue state debug
-			region.
-- reg:			Contains the register map per reg-names.
-- #mbox-cells		Shall be 2. Contains the queue ID and proxy ID in that
-		        order referring to the transfer path.
-- interrupt-names:	Contains interrupt names matching the rx transfer path
-			for a given SoC. Receive interrupts shall be of the
-			format: "rx_<QID>".
-			For ti,k2g-message-manager, this shall contain:
-				"rx_005", "rx_057"
-- interrupts:		Contains the interrupt information corresponding to
-			interrupt-names property.
-
-Example(K2G):
-------------
-
-	msgmgr: msgmgr@2a00000 {
-		compatible = "ti,k2g-message-manager";
-		#mbox-cells = <2>;
-		reg-names = "queue_proxy_region", "queue_state_debug_region";
-		reg = <0x02a00000 0x400000>, <0x028c3400 0x400>;
-		interrupt-names = "rx_005", "rx_057";
-		interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	pmmc: pmmc {
-		[...]
-		mbox-names = "rx", "tx";
-		# RX queue ID is 5, proxy ID is 2
-		# TX queue ID is 0, proxy ID is 0
-		mboxes= <&msgmgr 5 2>,
-			<&msgmgr 0 0>;
-		[...]
-	};
-- 
2.43.0

