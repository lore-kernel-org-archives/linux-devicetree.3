Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC2136212F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187589; cv=none; b=rXQbURGNp2w9d3AWKXb5PVj8LRbyGs4Wx6PRG4BBss7nfvqtbURWEpR7SQ1MA6SvuRZk6ugqDWQ7c8pOL4iS3mMBQxgZTCJ1++iPqGXfgjPfXPZ4vSmecdnpuTRaSpTXC5L5xwzu/j2DWvW+TuW8UO0t/z18k/7WyLl7W9s04dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187589; c=relaxed/simple;
	bh=3wtKqciQeOHcSakXZnMHLLISP+Cf8Obt+lYhptG6Gfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVQVcKL6ybTamkT0x63+mS+NfoF4S7z6yyOrhupFpzKQW7D+jWS4YPQxXBcGtJP93PS/FYdQAAGewwkUcs93A5aN9A7dIq8n8OJfZHYwSJZ6Z56mH7/MBSVupgg0XRaFWSLI95XF0ZmBh517Kysr6san5NnG0LSc4efP9IC5ev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTznZESZ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTznZESZ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8612812170so388519a12.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187588; x=1788792388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8fnpAA71PpA4geiQW/S84jidbVYovY7D0FubXhURV0=;
        b=RTznZESZT1DSaDYu9tl3nktThzFkVvm92JC3cA2sfwtnLnfjhIyde9xa51xg3zkGnW
         udwfYlTq1frD4yyrXD5htY9dNsBiMk2iyxosXiUvfoGoDJr3fiYJR6sPpOce0BdGdOkP
         8zs1tBgxSU5G78/hMIfp78SMchqRJgxT3yhVUktupl12T2N4cWa9/TOf+2gUwaFG3Hl5
         9qTMdousTfDxsxvf1PBxVcRGuSrwRGUEl5FA9e7Oit051OjFj6Arnz43rINfsn8xZuSV
         rj1mfVVbPHKMJ6UvJSn53dDKI5sTcl2Q2TSMqmCKrjrov+APjNPhZ1XLAVrjrPIqCSWV
         /EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187588; x=1788792388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8fnpAA71PpA4geiQW/S84jidbVYovY7D0FubXhURV0=;
        b=BLl3Dg25NTmDMIs26N78MdX52JTHCIs9n3ngGqg0TdjGP8bF7X1UA65TzXERs62xH0
         wgPUKpHIE+HOJsg0YDvgeJRlz/v4WLMYfiBMLnhcGK00jBzEo1fem9Yo2VLjCwK2LPpo
         xlL5nUxqwyyhNTWJMd2TQ3bHM2wRYYJCkf03unSixaGeRejPtAkvbtIpqXRwNXRhEr5W
         Zq0qrg3uIE5PKmWkkhQYIAvFPiJxZzaWDsKGCjQiR2Vkv+Bp5Ero904rv94Z/oCpy0k2
         25lzbuOysJM8ejLVhm0Sk6Kb1X1w3bgYkQUIaAsQHrRfjRvcCluln72/6fBdWQTo7y4m
         ipyw==
X-Forwarded-Encrypted: i=1; AKwUvByU0XCgZUQWZwV6tb5RMlQC+//ZPWD2qV+BeWTFHT1yCW194AXcZjJezEe50qYjqWFZbtIBA+imU0HT@vger.kernel.org
X-Gm-Message-State: AFuF++n+CtKpYhNKaZBdo/ObmdUVorN1aC6fscLDdU8a3wESnu9jfv5V
	F29UIk8/42PCwvoGUnS//tXUvVk5iRiyCwan0OkkX3m7aD2QUO+3QkG/
X-Gm-Gg: AYBFou12tEv3oggWFzkLrH1bBe8IVgwST7labFNru55+jN99cf9BANgXvJ29+aDpbth
	S2w4cc/pKWwIlbCWrJ0JyJL8AERe/Olg7riCivPjOgSO5jCW8k6u0QInuxWS6qMiy5pRkMGxX0T
	cTCSNqn2xywsOAE4pGvjo6aFb6HUk+4Q5yJWY/JUkXuhibtV1HeOoI+JP2ZhxcGIMfHx2vWWW4/
	bJMfNNXCicr/loESlK9tyfr6O9uPkHj7WpUuPbPLd7r+VtA3Zc3PIhZB7Yrt8f84UcbZBZeXeAu
	P8QyDKNgodIrMw9WPSFMF4Tg/BImvGsWnkpM280zgSK23fhZhv8VUN6o16xA3+J1yiwua1NIhRj
	XVM0PwARR8oDM9z3mknWuwWe4D8nodZBtG5UKrKuHoHVSopBfUp4BYllbKizDvwb6UAVz95ouv5
	guM7cdcBSkFNTOY+4Fkpi8DJGwGOnPHbUUXZgAzCI2pLHqo0Z2UmUQNaeNN+LS1503g1wv6uo=
X-Received: by 2002:a17:90a:ec85:b0:398:bad2:c0f with SMTP id 98e67ed59e1d1-398bad20e7bmr12372505a91.5.1788187587501;
        Mon, 31 Aug 2026 07:46:27 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5009:b339:5edc:6eb2:1ff7:f053])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm43217279c88.0.2026.08.31.07.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:46:26 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 31 Aug 2026 20:15:35 +0530
Subject: [PATCH v3 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>
References: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
In-Reply-To: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788187552; l=4030;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=3wtKqciQeOHcSakXZnMHLLISP+Cf8Obt+lYhptG6Gfw=;
 b=v4RdH5dbhuk9pP0rKYU9cicQ5Fllo/lac5Te5KW3tVVt/p0onHxeydqFkXSfhebx8aILFsc/Y
 ZB4HqXMtPa3AkHP7BDPKIX467EW/bn1Q+iBNPz1UA3+Sl7VtCWLo2+q
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema.

During the conversion, the following updates were made:
- Add "simple-mfd" to compatibles matching existing dts usage.
- Add required bus properties #address-cells, #size-cells, and ranges
  which were missing in text binding.
- Document child nodes gpio, interrupt-controller, and reset-controller.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 2 files changed, 84 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..dd73b62357ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Keystone Device State Control
+
+maintainers:
+  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
+
+description:
+  The Keystone II devices have a set of registers that are used to control the
+  status of its peripherals. This node is intended to allow access to this
+  functionality.
+
+properties:
+  compatible:
+    items:
+      - const: ti,keystone-devctrl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP GPIO controller
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP to ARM interrupt controller
+
+  "^reset-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone reset controller
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    device-state-control@2620000 {
+        compatible = "ti,keystone-devctrl", "syscon", "simple-mfd";
+        reg = <0x02620000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x02620000 0x1000>;
+
+        interrupt-controller@2a0 {
+            compatible = "ti,keystone-irq";
+            reg = <0x2a0 0x4>;
+            interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            ti,syscon-dev = <&devctrl 0x2a0>;
+        };
+
+        reset-controller@328 {
+            compatible = "ti,keystone-reset";
+            reg = <0x328 0x10>;
+            ti,syscon-pll = <&pllctrl 0xe4>;
+            ti,syscon-dev = <&devctrl 0x328>;
+            ti,wdt-list = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
deleted file mode 100644
index 71a1f5963936..000000000000
--- a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Device tree bindings for Texas Instruments keystone device state control
-
-The Keystone II devices have a set of registers that are used to control
-the status of its peripherals. This node is intended to allow access to
-this functionality.
-
-Required properties:
-
-- compatible:		"ti,keystone-devctrl", "syscon"
-
-- reg:			contains offset/length value for device state control
-			registers space.
-
-Example:
-
-devctrl: device-state-control@02620000 {
-	compatible = "ti,keystone-devctrl", "syscon";
-	reg = <0x02620000 0x1000>;
-};

-- 
2.55.0

