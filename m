Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A83043E9C6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513993; cv=none; b=QXnrEH2XleCrikODABWh/eo0zeOXU2DhtutIUtJrRBnVTJ2YwXuHz+MAEyVBQolMifhfB5DfQnYHEwtn1T1omo4BBf1q30rWTHE2CJX18Kes25yxNVEjNTYkx3UfkLhlEWU1SxNVw/XoVY4An6zVCbt0/dC3YBldNOPqh5Uf2V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513993; c=relaxed/simple;
	bh=2oGlbR/ePfRPXyUuYsFiOYlFR+Xuug8vPqkWH0Rc6c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L7+P3qdgOP+GO1C8pkDD3wS+hgu7SIfXwKC3s0sYCnSegdOdOITcWISrNWuqUHGRoCLZN/bJ8LEKYv4IX25mCUaj0sK+TCbUOayuI6bGnWVEZ2ALxy7WxTJe0uL9SSxJanp/3zgQpqGVcO5AKEjeQ/OTdjYaSIxGIIphtkcF/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F84Qlb02; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F84Qlb02"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-474560436c3so589042f8f.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513990; x=1784118790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTzvUarEneb7RwUsC4qOgnLXxjiOIrX01gmmvtNWvDY=;
        b=F84Qlb027xhRQsD6zjmbwQz/YyDmT9eHm8rXunjzHFnrrNyM4StqCFBMQCMb6SvNw2
         o0WxZOyjyFyB0H9T2wPauuz50LNVWsbDH6xbD/5lViZMUSx5vEsvdOUGFKJJ6OztS6lc
         koHQPu/ikloo1sJzicLdZDRQzHXfrzM8k1X1y/Z5ZBjUh6V9uPHH3eZdtolTnmIaQAdG
         o3XfUt1K60CEdWW1OWOPN5eDoaF8MqXH36cL8kfyqNN22srSFkQIqKqKqhsVruNAVS1l
         eOnRBMrNqZuXxAPynNRrmmrr8SiFeMyU2wvCFZV0RQaLvwDSW/CMpKZhJoGobKYH4V8T
         dSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513990; x=1784118790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTzvUarEneb7RwUsC4qOgnLXxjiOIrX01gmmvtNWvDY=;
        b=esi0ix09bVOvmcb4Hsw2rAhs50BxruK03NreueVMf/gaFeXy4WO4hLr/wcHgTR7fEh
         yrTbrxTzx0yvYfNtN86/NBbIKOmDxfyojsCOTeR5Y/8g4nd8rj4RUrWEsi2dWNyONpnB
         PZk9yOvJJX9wnNjPFJIYeza73NSMxblfTRBEVIrQdEWQPxvhAP6CNDtqpNx/uSVzNWeY
         jU3oDEzEkqHXWEmXtOPIK5qcJtghBCyzcun1O9zV3NOHBjHAz+eaXWU87meM6yrpgYga
         Q8lFSLznBurV/2UepqjCHzk6nrkrHMcu6oILrVopqbaiwrRg5lVBsrASazMwDIFgJ+Ni
         Ammw==
X-Forwarded-Encrypted: i=1; AHgh+Roe7jX9IDM0sfkNbujbbOUhtDLuxlZj51135gssIRfFPqkiIp/g6X4zVIu8XNu8+G8YMr0Igtqt4+j1@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEN7RbwQohFGL45Xfqve71XSCJ3VcgiN2iHFAjjQ7XOTjuU+I
	fWcTZTZ1oHk5KjRIrrXLv1jGVLyThYV/RoXSKctkk1IQVBq3Jq/LCzpJ
X-Gm-Gg: AfdE7ckP8SzFANRhnqzkRbJvq3hFBa2VKypsS/qt7fHQSwW1wNxLlT66Y9yLxneX6N4
	Wmxwg1PwA9JCkHbL9hPbsA99372yhN0EwK7ftYFqATp0/6oJRTF+aCuMznr9H0FnxFUww+97fZS
	Qw3aX6D1wpckcGzMPVf3rz/OM7l66BNsXepLnbyT7p5hj/x49Ltfi1e6NzM5Lpw2HSfpTORUFkS
	vd6H34gPTav5h3iSYV4xbGiB0OhEcvQRCc1fVcOznpVuVCiQgecRuIxN0P9HJeLpa4GA3Uxvv1r
	22tLL7fNe47y7S/oAHq+lK6d9xZ/1YuKo6nMkhqHqECDGAM1dub3Expe4rYxQioAmLmWJXnttKv
	chxtB5Qou9DFlEdnmR/MJ7Coyy5gV2IJwae95IB28Y1GRnEbTOSFUVTyiMyX392RbMrDoYoPlW/
	wlRx+NY/m+UdSh3q5V66L8vJ6fTGutkrEiGWgsvDc0Z3TqMfeAE3rMSOo=
X-Received: by 2002:a05:6000:2586:b0:47d:e022:944c with SMTP id ffacd0b85a97d-47df073b1ccmr2514287f8f.4.1783513990104;
        Wed, 08 Jul 2026 05:33:10 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm44282481f8f.9.2026.07.08.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:33:09 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: input: Convert TI Keypad Controller to DT schema
Date: Wed,  8 Jul 2026 12:32:52 +0000
Message-ID: <20260708123252.1768355-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments Keypad Controller bindings
to DT schema.

During the conversion, the following updates were made:
- Corrected the documented property 'linux,keypad-no-autorepeat'
  to 'linux,input-no-autorepeat'. The old text binding documented
  the property incorrectly. The standard input subsystem property is
  'linux,input-no-autorepeat', which is actively used in device
  trees and parsed by the kernel.
- Added the 'reg-names' property ("mpu"), which was omitted from
  the original text binding but is actively used in devide trees.
- Omitted 'keypad,num-rows' and 'keypad,num-columns' from the
  required list. The original text binding stated these were
  required but enforcing them causes validation failures.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/input/omap-keypad.txt | 28 ---------
 .../bindings/input/ti,omap4-keypad.yaml       | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/omap-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,omap4-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/omap-keypad.txt b/Documentation/devicetree/bindings/input/omap-keypad.txt
deleted file mode 100644
index 34ed1c60ff95..000000000000
--- a/Documentation/devicetree/bindings/input/omap-keypad.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* TI's Keypad Controller device tree bindings
-
-TI's Keypad controller is used to interface a SoC with a matrix-type
-keypad device. The keypad controller supports multiple row and column lines.
-A key can be placed at each intersection of a unique row and a unique column.
-The keypad controller can sense a key-press and key-release and report the
-event using a interrupt to the cpu.
-
-This binding is based on the matrix-keymap binding with the following
-changes:
-
-keypad,num-rows and keypad,num-columns are required.
-
-Required SoC Specific Properties:
-- compatible: should be one of the following
-   - "ti,omap4-keypad": For controllers compatible with omap4 keypad
-      controller.
-
-Optional Properties specific to linux:
-- linux,keypad-no-autorepeat: do no enable autorepeat feature.
-
-Example:
-	keypad@4ae1c000{
-		compatible = "ti,omap4-keypad";
-		keypad,num-rows = <2>;
-		keypad,num-columns = <8>;
-		linux,keypad-no-autorepeat;
-	};
diff --git a/Documentation/devicetree/bindings/input/ti,omap4-keypad.yaml b/Documentation/devicetree/bindings/input/ti,omap4-keypad.yaml
new file mode 100644
index 000000000000..5647b4a24228
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,omap4-keypad.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ti,omap4-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Keypad Controller
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description: |
+  TI's Keypad controller is used to interface a SoC with a matrix-type
+  keypad device. The keypad controller supports multiple row and column lines.
+  A key can be placed at each intersection of a unique row and a unique column.
+  The keypad controller can sense a key-press and key-release and report the
+  event using a interrupt to the cpu.
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: ti,omap4-keypad
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: mpu
+
+  interrupts:
+    maxItems: 1
+
+  linux,input-no-autorepeat:
+    type: boolean
+    description: Do not enable autorepeat feature.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    keypad@4ae1c000 {
+        compatible = "ti,omap4-keypad";
+        reg = <0x4ae1c000 0x400>;
+        reg-names = "mpu";
+        interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+        keypad,num-rows = <2>;
+        keypad,num-columns = <8>;
+        linux,input-no-autorepeat;
+    };
-- 
2.43.0

