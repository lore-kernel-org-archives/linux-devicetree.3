Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5821C22579E
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469713; cv=none; b=mYAjMPdaYqFnNzEnGJtJguBYUHr3ouClT3byPL7giF/zttTKQNP9wbUehAjj/FaOglhDr4n6zwi/2vP0xR2Ym/7itp2o/DomMQMxUpAXlmTuc/445M3hcquxufmNndLCNViCeNZg2dLWrpu34G6uBC4l0R/gldWNuKtP25uSC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469713; c=relaxed/simple;
	bh=AvLin6EDY6264ybOlhKWfxnfgaO9Sorakm1LZ4HBTD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zq43EfnUr2EDevoB5MKgX6Zw2jBf1bb+g7LONhhQAQJ8hKjunemsJsKa2bZhevkFS6PxieLBauOUbTCHyToc0y1l/hLuqPK5SXBoQrtZrQkd+ZEwa3Mazsb+nlzRuztsWFXaMqJXhWxup/oUFH1hwD506rWBR5wGDv01seLXRkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fl/2JaTn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fl/2JaTn"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso6124169f8f.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784469710; x=1785074510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zxf1Fi8GIcPdFPVfUhThJUmBpCeIaz9jG77yqiqq2HI=;
        b=Fl/2JaTnsZU0tVwKPFdr5hQziVDSGRhYMESekf8AmrPLyq4FookF/NjV7mCPCjVhz2
         i2Cwy8g7Y6d+lSc/BZtyRtaCyPER1P2qHOy8QSn4fd4asoU0EWlri+q4tOjJbfRjIE/P
         MK/3s9fioA4/Snwv3lGxJ97xQk6FReHwNy4VIP106NsAWqxiK7dPm+R3j9j/6Om0v9wT
         5twKnY81MMQu7Lpx4OejhPOOBihWyi+boYlQLuhR1KEoTzxRmBmHRoUsYU3TLJEaqblE
         JveKBfmbh0She1YegLjnAe/F9EtZSadN7Qjgbz+Q34wynqGKfW9A15hgMR7JxM15dv0d
         wknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784469710; x=1785074510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zxf1Fi8GIcPdFPVfUhThJUmBpCeIaz9jG77yqiqq2HI=;
        b=l4hhDX38p5WQl0/LdduY03XVICnavu+dg6BVxLG2U0Vdb2hp4EQgwZPvoGYck69EZj
         7CzNksbo99+DByy65p050KbqAEuXPua+9CPREWZFAvXfZqzRsSXaddNlsPPI4ujTMr4V
         K4AWj1NFNaeESmGc1ugaMlBYIJy2Lwv44gT7yCs79/wNJKY9OEeB8fPFftrR9fZm3fA5
         oB83PFz/GOZdXjBo/z5jH6j8Z24H65MUYEVjmbLLckQeSVR6MNXNUufEKBTruuB+vmoV
         JHnM2jM/D9ftFjlB44sK+KuTPbWuxD3AWreR+Vv/zeYwz0H12i1jqWvJt+Y8aJ3/KVrT
         vHWw==
X-Forwarded-Encrypted: i=1; AHgh+RqXcwoHL3qD2EJFXfZUgg/IeVQKD1qYdASygKwER3YEgUee+XepopuZsrItvPTQd2V1ZV6m5TQ63EBV@vger.kernel.org
X-Gm-Message-State: AOJu0YyhOS7yzqvlFr3ZPQ7q3PQ9Rx9Bpp5cI8X2MFbwW6CibUZxvjYj
	gw2sD0bIu9pqi9plNapkq2SJloBhz4rxIyvAy+HE39k8RCqpgJQS9oI/
X-Gm-Gg: AfdE7ckVrPtRMryDc8UmycvVguwFhhCht/4gWJOwba/2Lb6kgDRmIbtFa/SzVWNFVuN
	leOrmW9o4D2SEYpecnXq00MdrcPgoZMcG+lNgVx2pN16jM6TwU90EaSvZ05tuOeRVDi67Ziyyvy
	w2sg/6Yk+S9YyHWGutZhVsssLI1uRbsT6xdtARvNMq8TPmkLGbaNBlw1l8/A7ajNrCPFTwQTTFR
	zQnAl3zY/AeHT5hhYG3R16Qg3fAd0q4GBq7BX3jymT8xmBzmGAAVlsj31DCQN8ifagIPwroKOfL
	8S+ruS2JiRz0IQajXTYqV0yXLc3/mm8mCEDsDnHsT8GX3qwBtwKs2bAN6xPlIsbxQ8qnUncAEHM
	5mY/63cS0NQj7f544u9kjwR/65FPzvCBvrBMahYYbTSU/W3vepVKo2fL+pWGQ6LLxe7arjOwOOo
	uAZ6RGuzNeHWSTBD3BtyyYNJqHLvcxttYSdW+4VqRaKym/
X-Received: by 2002:adf:f604:0:b0:475:f0f0:9ef6 with SMTP id ffacd0b85a97d-47f6233f338mr9270742f8f.59.1784469710353;
        Sun, 19 Jul 2026 07:01:50 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63e49ce4sm21657818f8f.8.2026.07.19.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:01:49 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Vincent Mailhol <mailhol@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: net: can: Convert TI HECC to DT schema
Date: Sun, 19 Jul 2026 14:01:27 +0000
Message-ID: <20260719140127.3558941-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments High End CAN Controller (HECC) bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../bindings/net/can/ti,am3517-hecc.yaml      | 64 +++++++++++++++++++
 .../devicetree/bindings/net/can/ti_hecc.txt   | 32 ----------
 2 files changed, 64 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/can/ti,am3517-hecc.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/can/ti_hecc.txt

diff --git a/Documentation/devicetree/bindings/net/can/ti,am3517-hecc.yaml b/Documentation/devicetree/bindings/net/can/ti,am3517-hecc.yaml
new file mode 100644
index 000000000000..7874e9e49224
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/can/ti,am3517-hecc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/can/ti,am3517-hecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments High End CAN Controller (HECC)
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+allOf:
+  - $ref: can-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am3517-hecc
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: hecc
+      - const: hecc-ram
+      - const: mbx
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  ti,use-hecc1int:
+    type: boolean
+    description:
+      If provided, configures HECC to produce all interrupts on the
+      HECC1INT interrupt line. By default, the HECC0INT interrupt line
+      will be used.
+    default: false
+
+  xceiver-supply:
+    description: Regulator that powers the CAN transceiver.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    can@5c050000 {
+        compatible = "ti,am3517-hecc";
+        reg = <0x5c050000 0x80>,
+              <0x5c053000 0x180>,
+              <0x5c052000 0x200>;
+        reg-names = "hecc", "hecc-ram", "mbx";
+        interrupts = <24>;
+        clocks = <&hecc_ck>;
+    };
diff --git a/Documentation/devicetree/bindings/net/can/ti_hecc.txt b/Documentation/devicetree/bindings/net/can/ti_hecc.txt
deleted file mode 100644
index e0f0a7cfe329..000000000000
--- a/Documentation/devicetree/bindings/net/can/ti_hecc.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Texas Instruments High End CAN Controller (HECC)
-================================================
-
-This file provides information, what the device node
-for the hecc interface contains.
-
-Required properties:
-- compatible: "ti,am3517-hecc"
-- reg: addresses and lengths of the register spaces for 'hecc', 'hecc-ram'
-       and 'mbx'
-- reg-names :"hecc", "hecc-ram", "mbx"
-- interrupts: interrupt mapping for the hecc interrupts sources
-- clocks: clock phandles (see clock bindings for details)
-
-Optional properties:
-- ti,use-hecc1int: if provided configures HECC to produce all interrupts
-		   on HECC1INT interrupt line. By default HECC0INT interrupt
-		   line will be used.
-- xceiver-supply: regulator that powers the CAN transceiver
-
-Example:
-
-For am3517evm board:
-	hecc: can@5c050000 {
-		compatible = "ti,am3517-hecc";
-		reg = <0x5c050000 0x80>,
-		      <0x5c053000 0x180>,
-		      <0x5c052000 0x200>;
-		reg-names = "hecc", "hecc-ram", "mbx";
-		interrupts = <24>;
-		clocks = <&hecc_ck>;
-	};
-- 
2.43.0

