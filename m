Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132043932D9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977692; cv=none; b=fLvqhFIe4bZUHG7fHwN2mbrqllYUsUE5LnD2xES0prSysHI+JEbEVklYB8wMxg5DJHya7Bc1dbUys8xXo/p+87PV0QtCdKpCue2fESDwIOzSakSmiBtfN27f8hlBCLNI1lyWYg8p9gNv48OPGNfYFtpbwq3BJjzNOGX5aXVY6UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977692; c=relaxed/simple;
	bh=cv9nHvHq94cyshMFED23S0p/8n2aHyuezbgSJ8p2hTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UT9hPOn0hVI2fFf0p8Wgv8fPP34TIgjR13T3bN1VUb4oBmmv58EyWZ65QYUsy7KJXagXLNlruKh1YPE2awv4gg013HZSac2LI8Pv288u5SEFVm4DJzRY8UHsusAMIHa8nP2DEy+XwWITBIRpmJUdeSJYbjkZzCHVRf9/89ItqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeTpNOKT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeTpNOKT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so17117385ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977690; x=1783582490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUB+0in7NeYsVonwfzqEHaDpNUcQJFtKaqdplo8pdwM=;
        b=OeTpNOKTae7qQ6WylJnAxyCZFrtGbpi3z6oDqkXaUa1FODb74pZbXjjm302Ok5ADZ4
         uSv8iqfYfFxyy5B/y0aAD25FDHykzdQyorHbB+1/q0OIYZ16V8qZjRGrkcHhdwM1oZBR
         Vag6kVrzlvk6yrnxKhS+XyfI2gaaCgLbZIxLC5j4jGPhIKrBQfR6MwAvys9zAVyIa4hQ
         ZCLWUIwflGZTZ2oTqv8UMhGk+L0O0iGz/SPOz7C4IwUXgjx8xEbwIqDoeNPdYihH6WPn
         GAgGrYCDtvYB4+wlpLxdXwby8daMUkJjkx6/jD8xs2bwiH4GZT7s5tf3QSDwP1W5hfvw
         waTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977690; x=1783582490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UUB+0in7NeYsVonwfzqEHaDpNUcQJFtKaqdplo8pdwM=;
        b=aaphC9V+p6Qbwax5j3poCuxLMGVGimtrJTqDvzbKO/UO55bMdaaDvu6ZAjeukiEaXn
         vbH6oqsKjYrTWCPPat9mJsM5Wr6KkTiTc7SQcGM5isgDv81gQIp8Er2UGZLCXnTBgeg2
         xaKTX/qzwa20W/IGjUmCyDOi4BVFHnlDZRVzJyySPV2Z+TnxHxWahgOBx7b0Vxc3UVC3
         gVuzhy766WN/e8MfbDJrWrf/K5cJ0DHM3RT9+MLgnFwOUkHH3soKbY2/ph7uQq8ES72V
         wiz1xqnOtT+c5xzXO7Eanq1GP6TJqFdJpkcKdy0vMKduefBun3qnmIjCTQbx4OT3Pj81
         S+6g==
X-Forwarded-Encrypted: i=1; AFNElJ8WvpaseCrl9Hn+DNsN7woddbOlWpaHmmJaARE+roLdHbdn+oont5yDuQAXhtEJPj3/G1jerhZtv9At@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3aQcwuHQOsRJaXhx/+JkHn0sYPfGPWBJkv1WWzxadIaBfi5oL
	U6UHZ8OFhMqbSFz3k3eSrnXg27SxlqBplI/4LTvr5R8IbChd5lGE47Sw
X-Gm-Gg: AfdE7cmm2ch5ksBmuOcVFTrWXbNXPdkfwRE42hnIK8Af6iHzsRLlG3SNEn6FZHACb9g
	b0YtLQDdK5oPreaskLwdkPPUu81w8fWPMYKmRXjKgtoG/ioqvwIYbgphCgXZQvHYAnUaqPX+AzJ
	xEecoleVyDUc+F/DfOUHvciGrVUCGTZSnj8eqY/2xzTwCwR99ZeZdDbELVBgXI00ngVGrDiZQu2
	yDu6UjnTXQvobaL2PrbD9i09NX/0NvrAmer+OBIebvTl/NCrqfFjtB6GCXrGx+op1+xa6yLu4Dj
	qWZwdnIxbKMmcIzMTQlb/nBmEyWGpJttr73TV3/VZRBjpR2/00zxOP5VWkDsuV2pGSe1abWypBN
	37Bs1tPfUKIy0aB323tjkMQepojzhTS7JG0SbiCXT57bcG2jIX0fzGH7BWkFy5KBRoBtbuYJjNE
	XKBk4pNpO+GoHqm1j7Mw==
X-Received: by 2002:a05:6a21:3987:b0:3bf:ae43:4d26 with SMTP id adf61e73a8af0-3bfed0e1385mr5829279637.5.1782977690185;
        Thu, 02 Jul 2026 00:34:50 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:b5f0:4094:eeda:86b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84405sm8461440eec.17.2026.07.02.00.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:34:49 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 02 Jul 2026 13:04:25 +0530
Subject: [PATCH v3 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-hm1092-driver-v3-1-85faa7ff4fec@gmail.com>
References: <20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com>
In-Reply-To: <20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3376; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=cv9nHvHq94cyshMFED23S0p/8n2aHyuezbgSJ8p2hTw=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqRhSOvrhFFntHdwL1IfH/M2DJ/suFQtVp1GNzN
 tXJbZ/fct+JAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCakYUjgAKCRAVlYpeERwF
 3vJnD/9u2KhvXVZQZPSkBj7pGF1AhbbU4d1PYu3MYS3oVrLvj+y7VSSQ3wEgqXdgEwY3lYi7o2W
 +wB6M1TW321w/dtIbP6xmuinc8xacAYIitZe3uGmdIojdlBOzocQyd6iG8mcvjDfNiElP+pROJe
 SO51L4wcO3eQHbUf2rVMRVM2daON5gsWDV+5bbXQCfmPPZ0I7kIZRdVl1s/5C/E/8Bp08hzTVlf
 qlMMO5yX09pZ5uaj/Nyssh5uAnbGkXMOa34eOM1b7XR8SiFuPRmFyT0zxb3pv7+ONH94Bg+IVcf
 Exib6H7n5p01v214xZBsxLCg29S1n64/tb1Wy6Jc9l/GXfpJ3NNwgMo2aiSFrBgfCSDpvsmqFrX
 pt4nP4blLcpVvFn0L8pozjtWwNHCc9LJdlf9YDErI3wcx9zi5/EKdE64LxfOU/gEkAkQG/SFf5T
 w2ohi7rZmSfV9tJ73yB8xNaRYX28x4cElnkEYmPR9JVZUnq+PfXfksateYlb39pHfu0yV2MxmoU
 sJmPudaBoB2MovvnYn+wbsbYiMT1tTpo1fKrsjrsf6ZnESHN7cqlWRLq+Ms7MluJN2O7LlaQhKu
 gSbDmH8+lzp1YlvjHNyYJDp1gwk8L7wOezkdFOBn8sU4Dp9v4rmBMm//PtbY0kAuP7Rz5bX14FK
 HvWTQrtohoXOL6g==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..d324569836af
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/himax,hm1092.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HM1092 Monochrome NIR Sensor
+
+maintainers:
+  - Ramshouriesh R <rshouriesh@gmail.com>
+
+description:
+  The Himax HM1092 is a 1 megapixel monochrome near-infrared CMOS image
+  sensor with a MIPI CSI-2 interface, commonly used as the IR camera for
+  face authentication on laptops. It outputs 10-bit RAW over a single
+  MIPI CSI-2 data lane.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: himax,hm1092
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            maxItems: 1
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
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
+        camera@24 {
+            compatible = "himax,hm1092";
+            reg = <0x24>;
+
+            reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_ir_default>;
+
+            clocks = <&camcc 1>;
+            assigned-clocks = <&camcc 1>;
+            assigned-clock-rates = <24000000>;
+
+            orientation = <0>;
+
+            avdd-supply = <&vreg_l7m_2p9>;
+            dvdd-supply = <&vreg_l7m_2p9>;
+            dovdd-supply = <&vreg_l4m_1p8>;
+
+            port {
+                hm1092_ep: endpoint {
+                    data-lanes = <1>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                    remote-endpoint = <&camss_csiphy0_inep>;
+                };
+            };
+        };
+    };
+...

-- 
2.53.0

