Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F49C285CAA
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003298; cv=none; b=PZuqX7sFOjisBqjAKnUCgLhBy2B8X1ZpCWF09a6bo3aGKOQzfcUZ2s+iQXMsUMQKt2myWsZ20QPIPbmLFLnfWyGLpylqfmqX2QlzygXkc47awdT0ovJrBK9o37UmfMu1JVTt+Q+CMwP5DAD/lB/zNJ8XIjFtAHy8w0fr35D1XBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003298; c=relaxed/simple;
	bh=wwhZXC4XvmCwfuoKNU4F234NGLefy7XsbMAZo3F+Y58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+AcKSLyBCwvkB/km0DMSOb2HpRAzR0MIIC95VnUMzPOe0XmA3w/JSAy+wqQzXWF0hprECcBbFIToFkgb8FzMkMDELN74iaKyMZ3y/f0tB5VYmYbSUaIY05SdTtGTa9ktFCCHvo14Ri1RO3ukAiPdXZwzOZNB5hI3Cg969PCOPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTWpUwYW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTWpUwYW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf49dc28ccso6969565ad.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003296; x=1787608096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeyEkATwcVyf32pCUIMjXQkpsiUUb6eEEqeEp58watw=;
        b=eTWpUwYWmqTkNoae47pgoIWnFHxC40auytJZzp9lRS9mtM+0gfZklYbLJsXOOadYwj
         XcZ1j+VqbtDmpUHQElc1l97s/Ss8yIxVTykDw3cb4VFt/KxcG57I4ILltWGBpGNbkThH
         7mhetOYteiHN2VejOGW+fWgSg4NqEYtnt69+70hw+5E9oIN+Y5vMDwywZQPJNOVShvUF
         y1VaA3SPM24OyfAhVdkcz9YQdVOTkFGPIXp6gp2AlAYyfHZSH7PQBCksb4In7jfUHMDm
         cVGpvS3mzfV3171c0kMB3wnQM4kMK5s1QYMm5vVSTAFYYZOZ9OQ1Apx/pCe39tDinvcq
         EHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003296; x=1787608096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeyEkATwcVyf32pCUIMjXQkpsiUUb6eEEqeEp58watw=;
        b=coClFRcwvdL7oEe21OSpuEny8FCdc+i48Dmsnzau7UnskjdcZXVQmpEPevHNVIDPE8
         rOt8P7xbqkv/bCWsTZqXS4q9fgmiHdHseLfss8OlFFqnFsiiflceGmJAGLXdSpju889l
         PQSgseYGYJ/kaUGDLXTg2uPnXMgtEOnvVErXU0IWgjj6TnVA0ugCf8uiWZTKjBPjJWjo
         dj8zbsulbZIOMk7WmnE9Zlo8iM2h/L9d1vPcvSEeV+EdwMpstPh9C0i0UJDrAdR3JLgu
         6HivDkl4537a9qgkb3rnOn2FKL9q0kJuA7u0rykmocp0f546zsMx8xv7j3Dlcqy/RSuD
         mqRw==
X-Forwarded-Encrypted: i=1; AHgh+RqsH8u46zVV/XK0WdFvgsmOEwU4aUChYlhr1eVNxvt0KRstYQdlTLD5+BWqmp+xAVwC1WFuPbsUIb2V@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XBNpln0qz70Yof4kQ+7X0QQtSBEezEYtAowQzhrnk8BkR8Sc
	9I/nnEfFCnqL3Ua0ipGP9dtnVifCXT6PhCvmU34i88Dhgdkmj0MVarvQ
X-Gm-Gg: AR+sD11ZFBoZcpF6gcRf/jgeiuON2uOHnYX/I6PS1xLx0eFkH8aqqc133rPj/tkTSwb
	JrMGKbYGRa5EwLN+hNKZwCFFFMqArA2y7w8PZoW+ofbdH8IZpzsfDYlqiPQqc5GWxYIai0j/8Yo
	g0lRNZqDJWSl9f1JKPth4QddcpH7KjUkX1+GamgtilMiEEJ5V/JovkBRy85gVg2ggu8hBOIkDz/
	Z53Sym5Yxc99wxC1DRFplUsMebNR5tFaGOy/EmnxpXtS3S15pCVHoksbfraD6/wacfkDTROsiYJ
	LhKkZNBuTaVhMx504u885HbNDh+SEZG+Ge3n1V74FbG5szBc5sayIcwVgXEjuzP2PrrzDmp+T9h
	0yLoqGEIi49baSZ2cBXJUJDLXJ1+p2mlijCnVEgXL0tnPjY45CioUAF74Qoq47P8qr49Xdyepbn
	kLhBExwqChHc/CF8VByY2JHEBMviTj2MSjO9LqOvxj/MQTkic4WK9TzVYN3x74wBhrqnt5y10M7
	w==
X-Received: by 2002:a17:903:2451:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2d3b0d7af99mr212300065ad.2.1787003296157;
        Mon, 17 Aug 2026 14:48:16 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:5053:3384:1c8f:aa2d:e07e:6d3d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c388e3csm10153024eec.21.2026.08.17.14.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:48:15 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 03:16:34 +0530
Subject: [PATCH 4/7] dt-bindings: usb: ti,musb-am33xx: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v1-4-69ac5f92df45@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787003201; l=5118;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=wwhZXC4XvmCwfuoKNU4F234NGLefy7XsbMAZo3F+Y58=;
 b=wSxbXMnuj+n3r6SFK6Mb7mHAgmpQMactsrA6ZkBtDCMNHn7nZBAIoqnbWz+wVfdnHNa9+Z1ZH
 ZZlYZYd4Ys9BXbo4py9RnSJoeS+StpUoru2SbW9QPlzN9dZOy8or5MO
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM33xx MUSB text bindings to DT schema.
Changes during conversion:
- Allow an optional vbus interrupt used in am335x-bone-common.
- Add the interface-type and phy-names properties natively used by the
  dm816x hardware.
- Allow 0 or 1 for mentor,multipoint. While the text binding mandated 1,
  the Mentor USB IP natively supports both single and multipoint
  configurations as used in existing DTS.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         |  25 -----
 .../devicetree/bindings/usb/ti,musb-am33xx.yaml    | 111 +++++++++++++++++++++
 2 files changed, 111 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 8832843c7d7c..5973f88bcc65 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -17,31 +17,6 @@ Reset module
 - reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
   the USB wake up control register.
 
-USB
-~~~
-- compatible: ti,musb-am33xx
-- reg: offset and length of "USB Controller Registers", and offset and
-  length of "USB Core" register space.
-- reg-names: control for the ""USB Controller Registers" and "mc" for
-  "USB Core" register space
-- interrupts: USB interrupt number
-- interrupt-names: mc
-- dr_mode: Should be one of "host", "peripheral" or "otg".
-- mentor,multipoint: Should be "1" indicating the musb controller supports
-  multipoint. This is a MUSB configuration-specific setting.
-- mentor,num-eps: Specifies the number of endpoints. This is also a
-  MUSB configuration-specific setting. Should be set to "16"
-- mentor,ram-bits: Specifies the ram address size. Should be set to "12"
-- mentor,power: Should be "500". This signifies the controller can supply up to
-  500mA when operating in host mode.
-- phys: reference to the USB phy
-- dmas: specifies the dma channels
-- dma-names: specifies the names of the channels. Use "rxN" for receive
-  and "txN" for transmit endpoints. N specifies the endpoint number.
-
-The controller should have an "usb" alias numbered properly in the alias
-node.
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
new file mode 100644
index 000000000000..05909d5ca3d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,musb-am33xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM33xx/DM816 MUSB
+
+maintainers:
+  - Ravi B <ravibabu@ti.com>
+  - Ajay Kumar Gupta <ajay.gupta@ti.com>
+
+allOf:
+  - $ref: /schemas/usb/usb-drd.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,musb-am33xx
+      - ti,musb-dm816
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: mc
+      - const: control
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: mc
+      - const: vbus
+
+  mentor,multipoint:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Indicates the musb controller supports multipoint.
+    enum: [0, 1]
+
+  mentor,num-eps:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specifies the number of endpoints.
+    const: 16
+
+  mentor,ram-bits:
+    description: Specifies the ram address size.
+    const: 12
+
+  mentor,power:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Controller supply capacity (in mA) when operating in host mode.
+    const: 500
+
+  phys:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 30
+
+  dma-names:
+    minItems: 1
+    maxItems: 30
+
+  phy-names:
+    const: usb2-phy
+
+  interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Describes the type of interface between the controller and the PHY.
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - dr_mode
+  - mentor,multipoint
+  - mentor,num-eps
+  - mentor,ram-bits
+  - mentor,power
+  - phys
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@47401000 {
+        compatible = "ti,musb-am33xx";
+        reg = <0x47401400 0x400>,
+              <0x47401000 0x200>;
+        reg-names = "mc", "control";
+        interrupts = <18>;
+        interrupt-names = "mc";
+        dr_mode = "otg";
+        mentor,multipoint = <1>;
+        mentor,num-eps = <16>;
+        mentor,ram-bits = <12>;
+        mentor,power = <500>;
+        phys = <&usb0_phy>;
+        dmas = <&cppi41dma 0 0 &cppi41dma 1 0>;
+        dma-names = "rx1", "tx1";
+    };
+

-- 
2.55.0

