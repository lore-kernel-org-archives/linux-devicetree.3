Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D67F426431
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439935; cv=none; b=sx4uS4QxjACFy0wQoQM4x7VAV4/sNVOgkdrmOFznV5aR5Wxv6OTh6Rsf5Xxw3f0Vg2jUdcTR4nDn4fMoeX1p5cOjyT+1tBL28jssDKi82h+7/n4CgzWMvSK+QxNx/djqLsJowUlgc/reEKc3xnKE6YuI5Pn+v6KqtZmjjdKquFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439935; c=relaxed/simple;
	bh=nEhQ7QxH5UDhqZ7VkjZHRphh7gHdmPGv/DpCTon9ESY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=big+YJQ9/4ruAdjkh48gELSsLfW+WbbvBpbOQMd9DbdpWw1yGHk4zf3F4WmtrPU+L4rd18INzIMhHkM3RgDSSDT1vfgdq///9YHCWTEpaLPXXIhFLIX2ArRP46xXAWnp8SrRA511MSM/alofO/dq8HZnLjcG3iPxE5azUuW8G5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW30cGn/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW30cGn/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47fd4531020so1740023f8f.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439932; x=1787044732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ip7f7YpyHQBOih/urKg6C+Vi1R9PhPg2zCXHgntShvU=;
        b=XW30cGn/Va1+IyB6XKXcp0UpEH9D0exa3ratMPmp5ZeTR+uABmtumWgEFylopA8X9S
         YyfKr97wnLRWbbHyYaIufV4cI8V37pyVTna2g66QAlFkvgcfh4QJ2Qm5jfwzzfksRqCa
         JazC+QdH46jxvvWbw7ma2kFhV7DYf5alM+sxW5nWzj9wwvmzb9zFunSJuIfd69g4nbak
         cg1J9q0LjFVwQ+j1O1C3xLBNCA1ol4nj3IaLmpysMY/WE/ejMOtz1zQ+OpqkZo86rp22
         zRwVZRkg8o/YamvCUtqw2p3aapykLrCRj3NWz16OTTeSNbmn+18lKyfe0SFWdg2FqLAH
         5a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439932; x=1787044732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ip7f7YpyHQBOih/urKg6C+Vi1R9PhPg2zCXHgntShvU=;
        b=fL+XEa3uZJsEvAOpLI/Q64HfWIIehxl3CwZvlFZhae1gNLY391WjrAak1lpe+yMiA1
         fbXKsuafehcg3Gp2t97yTAJelwxWVzgwnVYr0P6HEpCtSWi6YQCELZ4xRdP/70l1Y+VL
         RLqhOwtII+uXhhfWavG+oA58F3e1jQObFgEFJFNBQUUscfRydE0XwOlOBxw7MrhUcI37
         o9KnN6fatzCQXXCx5AdDR5LaNWJkMyM8i27W10hNygtkBOIMzAeOG9iiTxi4LV8BeYI6
         0ygqiXnUB1KzbUaFMa7ZLORNjQW/VKJKVDw9Hj3FwJglHOFNMQcY6RhZhVcp0W6ZvI1n
         XlYA==
X-Forwarded-Encrypted: i=1; AHgh+RrX4zIRQA7tWLM8+fUHMOeA3tb58d6l4oGSZ60fnhS9VKWYNolz0pPki8qqXT4valGj6x+45pckJgnc@vger.kernel.org
X-Gm-Message-State: AOJu0YxCjVV6jvHpPMg0oF1S6PCgqwjApcZLOZNC23fus34vsC8sv6UZ
	S5gmh4f4pH8DVBgQfP4Gy7eMNpt1BYR6/L6Ay7boeLAlGQNM0J58/8tL
X-Gm-Gg: AR+sD10rk9Vc7uZpWkVIXhvJBJphSvpHMKiQwPt2/txs/AMAE3/dmxEhQXfjJQ1bmWP
	b4tmWWW/Hx0ApwaO/Q/1wp71Whz380zT+XQ0QGLQjjHxkKEQVxRWZn+8DJPEezEHVSDMh0BFCP7
	O4phEAURWMyBNmCueMcTcQR+qF7XE+h18HStKK71dDRMVBKg3BUIfq/kp+b5ivt2h7NaEb+tjWe
	asNa09ved7FVy1DXV7VVIbRq34zNXx437K9XI7cUpiV7z6D1ZkwWNEZpCqyu8y9aNCRDvA2engU
	hiKdNENOeEYk1D7wOVsmWB3EbFtnCbIPyT6sXMYProRD/oNilBmHUFxBAr43A1mfekW6nvDlgpl
	MqvNsqKCQtKuzvVyM8z9B4B387o3svHpTkgjNKrBwrqJIXxPyAzlB2atudhe1nAk4TspnQDfNRr
	F3C5sTbQkrS9TDrIHNHSqBYM1lxE54mUCyHOy3c9mmHkOJ7wLWBcSpPdhV337WlxpPTwqp9hDsL
	AidhvyWUB9tPu+U3+stkBCnU7b/sA==
X-Received: by 2002:a5d:5847:0:b0:480:c5:d635 with SMTP id ffacd0b85a97d-4814ad2d100mr3220337f8f.0.1786439932432;
        Tue, 11 Aug 2026 02:18:52 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4814a7171afsm2849418f8f.32.2026.08.11.02.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:18:51 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: mailbox: Convert TI Message Manager to DT schema
Date: Tue, 11 Aug 2026 09:18:47 +0000
Message-ID: <20260811091847.686229-1-egbostina@gmail.com>
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
 .../bindings/mailbox/ti,message-manager.txt   | 50 --------------
 .../bindings/mailbox/ti,message-manager.yaml  | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/ti,message-manager.yaml

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
diff --git a/Documentation/devicetree/bindings/mailbox/ti,message-manager.yaml b/Documentation/devicetree/bindings/mailbox/ti,message-manager.yaml
new file mode 100644
index 000000000000..01d62fc5a7c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/ti,message-manager.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/ti,message-manager.yaml#
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
+    minItems: 2
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
+    minItems: 2
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
-- 
2.43.0

