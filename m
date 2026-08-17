Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328863AAF67
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003243; cv=none; b=ROCXLytt5k3dRD8LtBqvW4huyV+q68N1Z5nfr4Beae9skERubNqomYnwonBcRfJiuzZM9dWb/HH8p00DWmHOQzLNNKjZBEgVNCNsa7ovQeOmnL7ZEJQstJyI27uK+VOg5i9tID8zzbLdds8FcpwC0Ig1sCgJhdZ2RnpnLiaKwvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003243; c=relaxed/simple;
	bh=F21VF5WZIFeBDrvSp00yu7wITz+jK3eO7gUtavE26gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opPCReDgTFhMpKzDdMtOJ4UGFJ6w+Nc5sczXVCs4j72m29u9/qt72oGFtVctX97YFVQjIsM3kbp17FUSd75sgPdOMDmJ3x4TXdBe2nZqIpfSWo9f//tOdx9Wzv4IkrO9bfMDjyDw3HFgWi4tBbo36tbYGOv/kH7V36GUe2Av92s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpszVG3v; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpszVG3v"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d590f4c291so2640035ad.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003241; x=1787608041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOOkvXfOzPtXa3REAJ+vIHNnVAQOzE4LMS85Pw6e9+0=;
        b=NpszVG3vKdF96MZFsvwBlbN4zwj1eAzR1BYqK750p0AX3VjZIJ35b4wmh5Uq6eemdj
         RLkk1DM4VBoFxPBGHf0P/zhXmQcrV8C36rCnnZGIuOozxwztnwOQAhq3mZjqyxJl4VMS
         By36HZhBWidNVdXtYKukyHRtNZ3aSu3ljkuFDzdX0UG6nbrKdXFCyEEP7BJrc9ZoDyjp
         YQ325EV7Rf/Hv/EODxkaUfRZt0ad0ViwVwIbCnKj6zmyKxSdp6BS80Z/wE0to2mOKD+w
         jER4Z2EfrqnS2ehAzCHNhw2HQROL/RRk+5XLxR3gma4kPti19Hin307/bT/HKg6hCnL5
         xVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003241; x=1787608041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOOkvXfOzPtXa3REAJ+vIHNnVAQOzE4LMS85Pw6e9+0=;
        b=eJvoP/lH2fVjikO3XLa+0duL7Ej/aKS2vV1GpCf5yl2sDl+aQc+C+EQbnDGAsl3wT1
         i1sMhGfb2IlfpXH9vCVxSRBZEABm7VeQ8fl2vRiZ9UQXm8kd9XW6VZlDSeTjKSpKbWWD
         t9p9YzD0Z8dGxrc+Zl/gay0HpZMsZAxxrjVsJoXRuE9Kt7mJczOPVTG4jfvJ10eULDZm
         V/f4YLUfaH/6Irz5+R8uAcAF9q/sNhQRPAZ8HgxmJcbcOuSc5RhMmkQCWpxnUnfzAWw6
         OziaBzmzxK7zpVj5vXvJ/7w2b6KS5yUq+xgV3rZFdqUI4u/SrrHENy7dBVZWrmGRrvtI
         wpBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+5z45gCXk6peCRf6/zNzRI8tfKJzxA4yJS9BFU1Nngaq33E/C8f8wevvxCmb+6AVesVlq6a5EMBU4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/g5EGIuaFKhX8QAg8PEdH9uAJc6K6o0fWIBoC63/1j/6yDxKN
	ttRPTYTTbCapbz5FE8fG49hsx8i6+cPl1i51nL4pc+rer7RU9LOaRjTO
X-Gm-Gg: AR+sD12Z4RBc3Mw5Re8wmLh1MWITVy3qINZgH1OA11sV1lgw4nQ9gfQrCutTrgXSreR
	JtwqO1mBbxCq+iTh/76UGj0S2gJJiPMbl1y8xzviXi2wwW2w0Tf2ZILNoJ2zxZjiSOq1UK7qsIA
	tDfFwSZ6Vt839m50Sqc1cIBE4jurLLn7VYxVTmIR6CsmWKZBPtyjDQ5dI5YrJ5OwcqhGHfIcn2F
	AhMKjxgswEg4jUXg4TObrq6VeAl5ZeuB/orSGVxoJTHGKT1foYtsdoBFJ+B44571rWBE/HwLuiO
	MxhVtKmqGBoQoxigi4V8GKADX7y8BqC+ekB0CWQh/o80Sd+dKmFJR/Kr2VUrEDNVGptWPhEAz22
	B120XjZ0gfZKEM0erZsmgzLMae2RAgasA+cNMPmmP1dH4xb+sLXz4twOfE3cqzZIwcIpXT9MBQE
	nUAoSsyFxcOR6X5I1SzXY9h0wQSfo6qg0D7kN9iXQmgp+byoQR5+jeoX4UZY0jemGWSyFP9XvVn
	w==
X-Received: by 2002:a17:902:f785:b0:2c9:8287:fd0d with SMTP id d9443c01a7336-2d3b0c9fa62mr234832805ad.3.1787003241426;
        Mon, 17 Aug 2026 14:47:21 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:5053:3384:1c8f:aa2d:e07e:6d3d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c388e3csm10153024eec.21.2026.08.17.14.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:47:20 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 03:16:31 +0530
Subject: [PATCH 1/7] dt-bindings: dma: ti,cppi41: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-ti-am33-usb-v1-1-69ac5f92df45@gmail.com>
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787003201; l=5423;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=F21VF5WZIFeBDrvSp00yu7wITz+jK3eO7gUtavE26gU=;
 b=HvBPE2YFgPKs1xpfA4//8wMC2+0JImWTrf+vPM4dpDHJnioYai6vZ+YntmxTM5KSe7QMI5+Cy
 KB4isr3/y85CaLXnWXDnMqbKCE4jJcMoQeu46l6lnifgbNCKHhV7fuY
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI CPPI 4.1 DMA controller text bindings to DT schema. Add
ti,am3359-cppi41 and ti,da830-cppi41 into single schema since they share
the same hardware IP block and driver. Add undocumented #dma-requests
and power-domains properties to match existing DTS usage.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/dma/ti/ti,cppi41.yaml      | 108 +++++++++++++++++++++
 .../devicetree/bindings/usb/am33xx-usb.txt         |  14 ---
 .../devicetree/bindings/usb/da8xx-usb.txt          |  12 ---
 3 files changed, 108 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
new file mode 100644
index 000000000000..110cf62c66d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,cppi41.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI CPPI41 DMA Controller
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    enum:
+      - ti,am3359-cppi41
+      - ti,da830-cppi41
+
+  reg:
+    minItems: 3
+    maxItems: 4
+
+  reg-names:
+    minItems: 3
+    maxItems: 4
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: glue
+
+  "#dma-cells":
+    const: 2
+
+  dma-channels:
+    description: Number of DMA channels supported.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  dma-requests:
+    description: Number of DMA requests supported.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  power-domains:
+    maxItems: 1
+
+  "#dma-channels":
+    description: Deprecated, use dma-channels instead.
+    deprecated: true
+
+  "#dma-requests":
+    description: Deprecated, use dma-requests instead.
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+  - dma-channels
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am3359-cppi41
+    then:
+      properties:
+        reg:
+          minItems: 4
+        reg-names:
+          items:
+            - const: glue
+            - const: controller
+            - const: scheduler
+            - const: queuemgr
+        power-domains: false
+      required:
+        - interrupt-names
+        - dma-requests
+    else:
+      properties:
+        reg:
+          maxItems: 3
+        reg-names:
+          items:
+            - const: controller
+            - const: scheduler
+            - const: queuemgr
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dma-controller@7402000 {
+        compatible = "ti,am3359-cppi41";
+        reg = <0x47400000 0x1000>,
+              <0x47402000 0x1000>,
+              <0x47403000 0x1000>,
+              <0x47404000 0x4000>;
+        reg-names = "glue", "controller", "scheduler", "queuemgr";
+        interrupts = <17>;
+        interrupt-names = "glue";
+        #dma-cells = <2>;
+        dma-channels = <30>;
+        dma-requests = <256>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 654ffc62d013..8431de346129 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -51,20 +51,6 @@ USB
 The controller should have an "usb" alias numbered properly in the alias
 node.
 
-DMA
-~~~
-- compatible: ti,am3359-cppi41
-- reg: offset and length of the following register spaces: USBSS, USB
-  CPPI DMA Controller, USB CPPI DMA Scheduler, USB Queue Manager
-- reg-names: glue, controller, scheduler, queuemgr
-- #dma-cells: should be set to 2. The first number represents the
-  endpoint number (0 … 14 for endpoints 1 … 15 on instance 0 and 15 … 29
-  for endpoints 1 … 15 on instance 1). The second number is 0 for RX and
-  1 for TX transfers.
-- dma-channels: should be set to 30 representing the 15 endpoints for
-  each USB instance.
-- #dma-channels: deprecated
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
index fb2027a7d80d..00320d92d3bb 100644
--- a/Documentation/devicetree/bindings/usb/da8xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -27,18 +27,6 @@ Optional properties:
 ~~~~~~~~~~~~~~~~~~~~
  - vbus-supply: Phandle to a regulator providing the USB bus power.
 
-DMA
-~~~
-- compatible: ti,da830-cppi41
-- reg: offset and length of the following register spaces: CPPI DMA Controller,
-  CPPI DMA Scheduler, Queue Manager
-- reg-names: "controller", "scheduler", "queuemgr"
-- #dma-cells: should be set to 2. The first number represents the
-  channel number (0 … 3 for endpoints 1 … 4).
-  The second number is 0 for RX and 1 for TX transfers.
-- dma-channels: should be set to 4 representing the 4 endpoints.
-- #dma-channels: deprecated
-
 Example:
 	usb_phy: usb-phy {
 		compatible = "ti,da830-usb-phy";

-- 
2.55.0

