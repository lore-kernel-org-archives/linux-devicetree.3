Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9844E2F3614
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785589004; cv=none; b=a0LGXhQge4VmD4HpIOzxY5xfKnNFlhF4PnYqVoBzex6/g9ds63I/7x0LUG+GaOQ53um8xQbOcRLycSwi4lm6Z6jhL/Fa4yeeFFKfu6E68JH0zRqXVgTvWD0HMtCNdZ3U86xPbNrY2Kmatfuk3WqNwca4irQvWDxjOgFmhs0TKvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785589004; c=relaxed/simple;
	bh=fmT69wAnGs+r3xe2rYUk0Wcom+29m8vf1A7cN/9f/lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vm+WlASP39UynvSWnvEiV3mpNGl+Lg+hetBdXmX2qhcy/Ebo5zaaQ7hE5f5Z1pj3mAsLr72XEJi0t5vFaSoFv3wISp8B0Mt2GMKcEdrZYkhZvEIgdaIvwj3A6TtSGMskioF/of8srwUVEOd0aVAmkGbaMaXCcnbEDv9th+dWpP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHTLkvSX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHTLkvSX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cace91f112so20907605ad.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 05:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589003; x=1786193803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apPFLdmcuJIMp7tB0PuBrQXpz6c5AhClsc+c+No/s0A=;
        b=mHTLkvSXHAWrkMfwvhFFFwBkOLKBqrxf6F0SfUnU3l62JGiq0Vr/ZU96O/Ce16F6mf
         KlWNg6ZuLxL/Ccf6c/G73bd78GpULJShxO+OesbP0EdxTMYIAoHF8kTxo3F4Ae2SR/6z
         QzIUlnYPeZ4LexiN20gYWjyIG2xh2dxl71zdTQDzBD9/AmqyXPnmZJGb1r7B08jKsJNv
         5tMWf0/MLhPBaqFG0wJqE5xw/vm2+Rnlg0gBHzDBpgo2py92pkfQhNHc/8feGwUS5vV4
         JIx6Fq2BgE+9FlxkCB69BkPAyY4zU6AOn+FEnBUnf4jbsveMEGbRFZZBAK4fMU0XQl4+
         59zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589003; x=1786193803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apPFLdmcuJIMp7tB0PuBrQXpz6c5AhClsc+c+No/s0A=;
        b=srkot/RzuJOldp0IuXy/cJfSe+SFbF6+rMA0JBktEnoAGK8Rvf5Gg9lBkGD1fkP4Yk
         c//wq3zScWGfeSia0Tt/MMlpms3tCsKJI7WBnZBuKut5m99FMXrPluC1xG4epjCi39LN
         KDZcfH6ANE7W0EBUYEkGxsVFB9LTWaE3OTYMni4g//MJ9rl/PH8EDeKj0ee1rgFGcdIm
         RbQZc73/L0bqXwbJe/S3R07u1zJ/LZM4Y0kRpJ2Q0uoL0+dpFXMMkSDO5F//CB5T6WOn
         ypEDvdx8rnIZXkUHq5EOZvfTn72791Nvr63f/RTAsXVnBUXSu4ldNw/6wQN9OfGcr3g7
         BqZg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7LFGsy3G9oIf5wOCFLIl+K4jXLQ8GetURE2dEZL8aijktyUMoSyKwLFSJI+u1ooyG881ZVwt71BYz@vger.kernel.org
X-Gm-Message-State: AOJu0YweDDt1RHI0lqm7jJnukwm18lB8opTnJFFxeXNfnYHJEjhntyRg
	bvGu0efAaJvSE9TnQVS1WX1nTZq7Z7k4kLxApJsTzkeVp2spCd1BH7tH
X-Gm-Gg: AR+sD12qxrfGC0I1BGUuM34cLvSNqHq/qlm5HGONDeFTzRnQpNARw+BLO9ZU8hdzdsf
	BuWlsBN0UlztTw9PWJIcHxaxSDz8P/nVftsy9Bjr1idiP4/+6he6YS/OJs26BjnM8jCw2R3SYaQ
	L2X7xZDBtkaX3w6B0jv6YDl8eB0fofCPLbmCSVz8kKV/9GvbVZZ/ujyyeVo+pSnBmjQTa7daP95
	P4aKot8zREPP35LccfK0bvjOlsnKhoUZ/tKnH6BYt8uj6nQrFWk9f1342uD6LAYZH4P6jKBhm43
	8FtXqGNMMA0C8VivLQMP4ckKPV/HpfqvpWU3Uu4oyssVsvPlWMu8N93pp/8RCfkp50ssy+FQbIO
	JeJhvpTAbG6P64j0LerGoSVQx0V2c54IQOZ6u096Ry1WAJO+l1khXJxTwEHrsEeRy2vjlqS8uo5
	1ug+dLO9pEMvY0d6Gs5IRPAxLMx8qFrFRxNOvHmDU3eZ56T2zSIYlkwxMOIEPD0e1jclR9rw9m2
	TU=
X-Received: by 2002:a05:6a20:9f09:b0:3bf:8de9:c647 with SMTP id adf61e73a8af0-3c92a2a9efemr3353502637.0.1785589002911;
        Sat, 01 Aug 2026 05:56:42 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8900:d10c:80ab:6bbb:b91:2804])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm16131724eec.20.2026.08.01.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:56:42 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Sat, 01 Aug 2026 18:24:42 +0530
Subject: [PATCH v6 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-hm1092-driver-v6-1-5979f223748a@gmail.com>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
In-Reply-To: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=fmT69wAnGs+r3xe2rYUk0Wcom+29m8vf1A7cN/9f/lQ=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqbez/RBMyeg4BEA1P75iNgi4QHdi8nZX8S0dqB
 fU8DDLp8sGJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCam3s/wAKCRAVlYpeERwF
 3lT1EACH+hEa05qdvee9CioT8jHsPUaT8j71LFRFpVsVgkq/oUuyPlW7oTuvEnt2OxO9USNO+k7
 8evX8lNkvgvgvRHKsG+Wz5IUeM01SjI2EQp/y+ZBWnScRScyQE+jkkY5vBhvMgUz1lRdpT5t/fm
 7UxioA93GKHp+n7/++3LWaklxmzAu9MePt//8ks2zYJWQB8U3Uwbbo5Gp+QItceGleX4ulEbXpJ
 uWzEhS5OW4w8RWhPoEG/uyUyM48g6dTh6dLVeRslkF40oF5jemU/uEJYQqPt22KaAEajcm5fwgp
 kpbtF6NS3wRtgDwRGAbNhF7aknfbS5AEcTYjjUOIO4zIP1SAiXr390s/qpaik1RTmSUhxkNBmQH
 6v7cAOoW4xUCQI4+c1CHiSAMNhp2nGaf6Ev2HYMwCeTaPOgs8OreTOnd1Ow5vukp9vYsrHWz6Zn
 O7yeRtGGZ/3k50M7n6PezQHEKSrM/F1KO9qT4ips2KHauA9OuABCdTV5PAZwYCfUsrK1tP01a0E
 8YmD9+aPzTVGU1/p9Hotz/jg+EiEIhSDf3pORIZQlkC0MO+oAIO/Xyrv1LmPx4y3LcDPmhUxecB
 hzn4sTO3RdibVH88g82SoApN/iisMW3hjdP/YNhsoKnrPIv+GwgonbYuZ/j1vG3fx/tfY1/xHcX
 Yehz9iMYTQc7yQQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..e0a8bee62afc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,101 @@
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
+        required:
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
+                    link-frequencies = /bits/ 64 <180000000>;
+                    remote-endpoint = <&camss_csiphy0_inep>;
+                };
+            };
+        };
+    };
+...

-- 
2.53.0

