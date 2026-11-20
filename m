Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167765;
	b=yNHeVrt6gksOC+C+m8TqPJLuUWBvNZF3v5FMI3obusp3yVMNMAaGTwIJKnnRiiZdUIl2
	 kILbSmxHch78yZyDIRlpH2PPZq0QY5C9cZGzHoglmdro3n012tISsaiASe24s16YPhFVl
	 JIbIC69QtOfAI+Jt0oBfE0jazWPrwSUUtwVBzw3RAwcum2jS+gXCu1MdHOINhGh/xORPM
	 AxJVEMXOjtF+aBOXMH0KcBGlDIzp3y/nP1+gMW4jKi6PWMajnm8FXKP3JqLhI03/OOP93
	 j57obH2tUsMDjS15ryh8djMgJXtZ6UquKP09PYbHvnCT+EhP24hcM6D3QWhhzyeFRvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167765;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=X5MBfvXPnNQILE1xpGSrMoTj3Kqq7Z3luvrzwX3INYY=;
	b=xn3B45cf6EkY+jz6AVoHWOWdiuObRwBDt3pjAXZ/M/HDasS4XU+JWd8AmRfA15Kn1cgt
	 nl3GIbBglnbf8rmeSA4lzdX2Hj3Pj3tgVHHymDC6WM6aZhzAzzcCHmnaoBx/JURys6YKY
	 0QSuphBA4JI3XIhlS7mBCOf1BvViAilF/T9/gi60L7wWJUBZNR3QGKYxnJpujfinSGAbG
	 nKmWfazKtaNhh1lOaNWg4/P2ED+8oHkz30hXieJHrq4nl5jVAfLLaqvJN7D7oxqexto4S
	 fRhS7/G2KUOpNeJbBe9amLbL+Bt+1lWtQJfP/GFa4v8cL44r5AA7jzwwYANMRUdQ/2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KD3JSBXF;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A94C606A330;
	Fri, 20 Nov 2026 09:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A94C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KD3JSBXF
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F2AA10CD17;
	Fri, 20 Nov 2026 10:42:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795167759; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=X5MBfvXPnNQILE1xpGSrMoTj3Kqq7Z3luvrzwX3INYY=;
	b=KD3JSBXFoHMU3+wDPnawlm6WWIM2kGd77ACZYs1+yPNDWRIeV0+a9uGjlRP3yhIbzM0oDi
	V1xYr62UHnJVroGrahi0zrEchqi5uoyq+nlqbF5L2orLGzU5r7XQEnBYLcjYu8IKe9hNQB
	znTgBUkf4W9IHJa/zHxwEemVbUWOgMUF0Ob8FrNKVSakvvbItIJ9ssDGOBtFHMVafobAf9
	4XevIQhpBRM0sTHJW9zyyKnsXLRxY+3RyosNUBftV+Fy5KN2S800xBovJZa9LEbpe0TYBd
	Nuf/AvcXbUb/JzUEFUd29jgy4qWcg6Lg02r+3izX33iNbXApcTMXPnMECQXWew==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v4 2/3] dt-bindings: hwmon: Add National/TI LM77 temperature sensor
Date: Fri, 20 Nov 2026 10:42:10 +0100
Message-ID: <20261120094211.1742416-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120094211.1742416-1-lukma@nabladev.com>
References: <20261120094211.1742416-1-lukma@nabladev.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add binding description for National/TI LM77 temperature sensor.
When compared to LM75 - it has two output pins one for interrupt
and another one to signal the critical temperature alarm.

It also has only two I2C address pins (A0 and A1) - possible I2C
addresses are: 0x4[89ab].

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes for v3:
- New patch, as this IC description is added to Documentation/hwmon
  as a separate entry and not to trivial devices

Changes for v4:
- Add Reviewed-by tag
---
 .../bindings/hwmon/national,lm77.yaml         | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm77.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm77.yaml b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
new file mode 100644
index 000000000000..fbb6e711342c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/national,lm77.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: National Semiconductor / TI LM77 Temperature Sensor
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The LM77 is a 9-bit plus sign digital temperature sensor and thermal window
+  comparator with a 2-wire (I2C) interface.
+
+  Unlike the LM75, which has a single alert output, the LM77 features two
+  separate open-drain outputs: an Interrupt (INT) output and a Critical
+  Temperature Alarm (T_CRIT_A) output.
+
+properties:
+  compatible:
+    const: national,lm77
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the device. Depending on the A0 and A1 pins, this
+      can be 0x48, 0x49, 0x4a, or 0x4b.
+
+  vs-supply:
+    description: +VS power supply regulator.
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description: |
+      The LM77 has two open-drain interrupt outputs.
+      - The first interrupt should be the INT pin (window comparator).
+      - The second (optional) interrupt is the T_CRIT_A pin (critical
+        over-temp limit).
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@49 {
+            compatible = "national,lm77";
+            reg = <0x49>;
+            vs-supply = <&vcc_3v3_reg>;
+            interrupt-parent = <&gpio1>;
+
+            /* INT routed to GPIO1_12, T_CRIT_A routed to GPIO1_13 */
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>,
+                         <13 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
-- 
2.39.5

