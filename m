Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897C36655C
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 17:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774978293; cv=none; b=tJilQ8VlOoORqzm/t0xKYf16BJOYyIN+0tyGe7jLFxDkrlbY9lotZmCHWrN5OTiybLgSDPDtAP+R3T+8pOxjb2EIRw3CnH3fDlsPj7sg0COtIvAdmkF8QYMJzDSaRTXNmkakTJZKxRdcKmUQpi1E5kvWr7/7ad+XuDWuNVFpKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774978293; c=relaxed/simple;
	bh=QtI8q7MchfqQEtGHXWlJ7hjF3p3yWi14nrUrOgHyqiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2oaY6+8H9Scj0i+uHlxAtVDpdBOeVuZgGZfGqu/0XoIbVcuP/2dMiNN3Hqs1cZ3yf/v2XTvv8ufOtu/YM7HpIiW0ogifhTeF+F2KB6/SbQ8hDa1bJilRcLc9pMKLh1qaZsUpBgggjj00Spe+epLtTcKHpXa7zgYA+Dcyoie51k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huIcm+RD; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huIcm+RD"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so2811991a91.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774978292; x=1775583092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmLnySGgpX5qdaI09bcdNyFr/X6vDkvqTADZpSFZpVI=;
        b=huIcm+RDM1NB6av6CaPvyKQSm5SBEtIc1b0uRgh0DxMoTNSlJAjmo6HbiKQn10VkgN
         uauECSQQ9UP2UXhzvlPnMaNALv7gzvCV/g8nLMC8X/8t837m0XuFXv2j93C6Rhl8LJ7a
         SISPWe9yB4abWwxOP4LkXC+LA6HtIWCWSk9ZmH1feoNeCMvzJkzddEsmhKIYpQAtsghC
         zr9Ul3qcO3W22OebrMS8OdGkq2+yHP8MBjOof56u9JXetftd5XxNP8TwrGQN92N81w3o
         AAlf3f+U0Cy5RReRu/Z4NGvOiyqf3ppFCNRJhsBZdAPHW2z3pvdwypQi9yDYEwdf+k3Q
         KTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774978292; x=1775583092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmLnySGgpX5qdaI09bcdNyFr/X6vDkvqTADZpSFZpVI=;
        b=L0Hpss8359N2gUdqUy6J3YjchLN9JwUadLbHtZqqYD8p8vKK3aUPV5LaN+lfSlcntI
         e+59edNr+0d64TmtDIhF+R0RxxbJ/nnq7OB+91TtxKfccpB1ig4H+AcXw4EJA9O4aKaA
         TRXpuWP8yyBlGjwIOVmiBQNTwg9GSvzODXcvUlQgYpyXSRI5y198hXJDoSr9ztPiOeCw
         Z/UZcC5RMek8UsIvSmLMcj5puqRLcLL36xU8+yDiMgoGNtUSzolT0k6nCuj6wgSTTUBR
         y3b5Lerzqot+pNVQthEvTp9riZIhvVJ8BLStVCiT0MnajmDChwjjRoT0Dk2spsVEaXCg
         pcxA==
X-Gm-Message-State: AOJu0YzZCWsaikVkgYOFczXArgougl4ajK4eE9KWI8p7WECE2BV+iCBe
	21FpbMlz8ZJhTuSfTlQNneBjzTCswburCwpGpERq99YvG85eM1efapfY
X-Gm-Gg: ATEYQzwlWml7p2kLZ0Fiwi5zDyenxGFObJxyZW6iae9et3cz/n20MqF3eZ/ys5sEJpA
	YoooqT6C5AMrOLFdJFoE7O0wE4Fp+eEwIdcrxC9lk5RpP7VN2OO5gKSeZ6by+rIb2/4X7DNDRxm
	oYp9oI68cBOGvKbacqDQ2wNbcTz6pPntV7cq01IHVA+H8TWkEJtpTqnnfrkn1HATxK2jQWw7eZE
	1+0TMYWHDto43nZ6SHfSfDgnONpowCe8lpGY8V+nx0tx+kmpI+YJF7FWGINs1F8NddeuslnabMq
	RpOZ5EG05bjOdPZziYR8FVqeCnWngFqc2ojkTSGBL9aiGkC2lO5rcuZWmCcWnj38wf9NlmkGvhH
	VH1Xy/KK9GBmM90smiD9L6ZIczznfll8nBmuXhg4wwlnoGv2q0sfxpolBG+Mc+UXJQALDudr7Mb
	XsdOePeeSW86P38amgiGbJpALmgRP09g==
X-Received: by 2002:a17:902:e78c:b0:2b0:665b:c7de with SMTP id d9443c01a7336-2b269cbe40emr468325ad.40.1774978291526;
        Tue, 31 Mar 2026 10:31:31 -0700 (PDT)
Received: from snowman ([2401:4900:646d:8c67:2583:bc87:aa68:3bee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aa9fsm114499935ad.20.2026.03.31.10.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:31:30 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	liviu.dudau@arm.com,
	sudeep.holla@kernel.org,
	lpieralisi@kernel.org,
	pawel.moll@arm.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH] dt-bindings: arm: arm,vexpress-scc: convert to DT schema
Date: Tue, 31 Mar 2026 22:59:59 +0530
Message-ID: <20260331172959.35745-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ARM Versatile Express Serial Configuration Controller
bindings to DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../bindings/arm/arm,vexpress-scc.yaml        | 51 +++++++++++++++++++
 .../devicetree/bindings/arm/vexpress-scc.txt  | 33 ------------
 2 files changed, 51 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
new file mode 100644
index 000000000000..7870410211a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,vexpress-scc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile Express Serial Configuration Controller
+
+maintainers:
+  - Pawel Moll <pawel.moll@arm.com>
+
+description: |
+  Test chips for ARM Versatile Express platform implement SCC (Serial
+  Configuration Controller) interface, used to set initial conditions
+  for the test chip.
+
+  In some cases its registers are also mapped in normal address space
+  and can be used to obtain runtime information about the chip internals
+  (like silicon temperature sensors) and as interface to other subsystems
+  like platform configuration control and power management.
+
+properties:
+  compatible:
+    items:
+      - pattern: "^arm,vexpress-scc,[a-z0-9_-]+$"
+      - const: arm,vexpress-scc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        scc@7fff0000 {
+            compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
+            reg = <0 0x7fff0000 0 0x1000>;
+            interrupts = <0 95 4>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/vexpress-scc.txt b/Documentation/devicetree/bindings/arm/vexpress-scc.txt
deleted file mode 100644
index ae5043e42e5d..000000000000
--- a/Documentation/devicetree/bindings/arm/vexpress-scc.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-ARM Versatile Express Serial Configuration Controller
------------------------------------------------------
-
-Test chips for ARM Versatile Express platform implement SCC (Serial
-Configuration Controller) interface, used to set initial conditions
-for the test chip.
-
-In some cases its registers are also mapped in normal address space
-and can be used to obtain runtime information about the chip internals
-(like silicon temperature sensors) and as interface to other subsystems
-like platform configuration control and power management.
-
-Required properties:
-
-- compatible value: "arm,vexpress-scc,<model>", "arm,vexpress-scc";
-		    where <model> is the full tile model name (as used
-		    in the tile's Technical Reference Manual),
-		    eg. for Coretile Express A15x2 A7x3 (V2P-CA15_A7):
-	compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
-
-Optional properties:
-
-- reg: when the SCC is memory mapped, physical address and size of the
-       registers window
-- interrupts: when the SCC can generate a system-level interrupt
-
-Example:
-
-	scc@7fff0000 {
-		compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
-		reg = <0 0x7fff0000 0 0x1000>;
-		interrupts = <0 95 4>;
-	};
-- 
2.53.0

