Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7953933F5B3
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787728810; cv=none; b=g7D96I9FgZumtM4GAeuYIUHXK5rCPNEqqQYjnLzWeEEYN/Zuhdj0kRf3+Zuv5Xb2KsLGM28gZmO2TV2AU8rul6EsiEfP0/wWwgeMV9e9eevAVzHD7ak6eQBG3mVqt6eAzGuZJ1N2EFx0TzhNkluZyE/PLzrsP2dnzUmTqgNsmDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787728810; c=relaxed/simple;
	bh=jEy3yL5RUfAsDcn/zNbn505GnHPHKqrXy/5TKsxDzZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyNni0txg1DgD8/qTGAAOvMyc6lsLJaj/UR+D1hABwIjU+JrR4aQBme412adnNe/Dk544vtUTqdamxB9u5GrTqlv6eKeSoL4P8SZYer09CJSg7kE+A3uBcFRQkkQaPXBk+bGhsxTHpd02sima/4fX09Q4LqXQzrNzTimoeVlxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ8LteRv; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ8LteRv"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso1028270a12.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787728807; x=1788333607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myrpAtIJyMGLn7pcJThOKxb65pIvWEB4lz0gBXx62Hs=;
        b=nQ8LteRvEHnE++ZAu4t+mR73Rnp0OJTWE1ZJhAgNuD95Yq64+uENjQbUT4POhbUkx9
         e3B9sQ8zllV5cK34G5NOil+jYYqNkU90gm6dO9RVnE2R1iwQ6bkqUPJ3D6HLz6xjczQD
         t4sn2hzwnnPTS8NE0bgLiCi9rJiueNa6RqDTWg6dxUz7+FFNy4NFIY0A4lCVhXyXAbFM
         +tR/4z5Id/qvwW2BRQkHMqlqxPqyZRNGgHkfXbhu57YhqqFd/42JG/CJIDpLr69yBYGI
         MsOvOF1sDKi0E498Rtfel/lpF9YTVCHvI2ru0kepGqi55oMf6k6PpWLM8RHUPgM3WJnk
         uUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787728807; x=1788333607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=myrpAtIJyMGLn7pcJThOKxb65pIvWEB4lz0gBXx62Hs=;
        b=GENGj0FZYKnjOrLO10yMCVYri6L1qufbXNuUbvCL3bkLeLxcitbrHNzNYbUy70WqGg
         76w8FFJswD4yV7IcroEuF3LqAYN8FJSNAc8jwrW9Ix3PbQeBI3w1AVWM5RDDMzEr+anL
         d4aJIknmAGIEsdPKiOt2FDf+dMXLiVLRr69y1fQz2uP4Ih+RQU71IX6sBceJPnYB+8QR
         eJ6ins480rIfUP0ktYf1IChlWQkxUSQcm1CyDzpALjB1NSpqcnI0G7vNJyvPC77QhLns
         4MtqabuqzQ/PCdDJFc3RPeP829tHOb0K8PLMTp21TK1Ci4ZiABwB5JGZyzQi28vaa/aY
         eTpw==
X-Forwarded-Encrypted: i=1; AHgh+Rqw5K4bnl5aBzWg816oOIBPluOZ0jJGkNh6yzk4Sp5bLOcKqvhrr++ZCOVq65ztHxgRqMMqIzZVold+@vger.kernel.org
X-Gm-Message-State: AFuF++mhYoU80SDdT3cuw+gVgMhkJKnWB70BdqMSDA39+y4nu9qoH2Zy
	E7Kc7ucB9HY/4vAgin0Jj/jobPWmwwel6cNCSvk2JwHTgZUh+EkL5P77
X-Gm-Gg: AR+sD109Mp108mklWxhDalztCkQihhXlcqpoyPhGiuFhtVUDQ/5mcHkcgJjnFlDF/hy
	UPRSZ+CprxHhxvfJ3pJ97pL15+XkURcbt6t4p5tyVw4fdTfM20QnRMZ0+koH8F9e+9IixZSQPjq
	xgmTlGbTZN6jPBe3HJwwypIw5VPYaSmcVDn4mOvyI3UG5DMm3YUPXljSCQKp3gv+EGI/48mIysw
	ZpwpIn5vdP69+BBO138cpZ8Oo6lvO2rpjia23Y5ww0gKvw+VQVbcZ6MDdZ7x572UDUQOPPbvKnB
	zjDNuYWq1z3fYnvVh7N5rn2P48HCHc+FMs19b9aODhipjH1UgcajfFSJotTKExmxqq1rzQKm+1X
	u/Fl/CfEAl5rPP+JRKtHYaD3xtSQfAon9fs9zjQE4yTliNu3ro/OWpN/cq4vVGHaHDJW1pZ7f5o
	OxvjkMhrk0NdaOxsmZ2MqYutXhlZ2vzv+l5Edvd/6CSXBYw/UYup7CHNyT+EDXAjzrzsgyQIqJy
	hiDPPU8NiRwWgfmzoX3ZiAAI3HYVN5l/XL8ZsH2wWO0vaB/M4f+l00P1YoefNcrWAeikMEclxcs
	m2dsVR6XAR1Qhek=
X-Received: by 2002:a17:907:3ea8:b0:c24:6445:d19 with SMTP id a640c23a62f3a-c250c32b5e2mr549036966b.17.1787728806694;
        Wed, 26 Aug 2026 00:20:06 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab59sm298340066b.41.2026.08.26.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:20:06 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Wed, 26 Aug 2026 09:20:00 +0200
Message-ID: <20260826072002.14357-2-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826072002.14357-1-robertbozik@gmail.com>
References: <20260826072002.14357-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the OmniVision OV32C4, a 32 megapixel RGBC CMOS image
sensor with on-chip 4-cell fusion, a 4-lane MIPI CSI-2 D-PHY transmitter
and the standard SCCB command interface.

The sensor ships in laptops as an under-display camera, where it is
described by ACPI; the binding follows ovti,ov08x40.yaml, which covers
the closest relative already in tree.

Signed-off-by: Robert Bozik <robertbozik@gmail.com>
Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
---
 .../bindings/media/i2c/ovti,ov32c4.yaml       | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
new file mode 100644
index 000000000..be6067c75
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov32c4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV32C4 Image Sensor
+
+maintainers:
+  - Robert Bozik <robertbozik@gmail.com>
+
+description:
+  The OmniVision OV32C4 is a 32 megapixel RGBC (red, green, blue and clear)
+  CMOS image sensor in a 4-cell arrangement, with on-chip 4-cell fusion and
+  binning. It has a 6528x4896 active pixel array, a 4-lane MIPI CSI-2 D-PHY
+  transmitter and the standard SCCB command interface. The driver supports
+  3264x1840 at 30 fps, 10-bit Bayer, at a link frequency of 400 MHz.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov32c4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Input clock (XVCLK), 19.2 MHz.
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital core voltage supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad of the sensor.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@36 {
+            compatible = "ovti,ov32c4";
+            reg = <0x36>;
+
+            clocks = <&ov32c4_clk>;
+            assigned-clocks = <&ov32c4_clk>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_2p8>;
+            dovdd-supply = <&vreg_1p8>;
+            dvdd-supply = <&vreg_1p1>;
+
+            reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
+
+            port {
+                ov32c4_ep: endpoint {
+                    remote-endpoint = <&csiphy0_ep>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

