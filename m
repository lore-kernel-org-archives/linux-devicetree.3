Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5051E8826
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 01:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956000; cv=none; b=ElYBtQ5oqdunfa9et6KRXReM+xBZsM2jqLiJYhGaKKBo2TTzVAsnVIH4vAnP0FSeYhFcruvQiEoy4At4Ib/a+bWfbB7pRsYOD66pCDzS+kSIkOTFtdnfqYbgU3ZprRYFeKCIIruus1CI/ZSbbvoIt7/NegRH1TFdoAejtX7NMIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956000; c=relaxed/simple;
	bh=GBwoj0wKX6WvpSwyWFpUryr+T2rxfPCqj4p2MWOY66w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DlEiANeNKBOAP+izihWucBzaaX8Z/nkvhwETOHu9+yAFfqha3tTiVTF291IeDAAY4Eb5+Yp569asvqTmWNpJ13EAlTpdAjypuQnkyX0CQGjIg1hkbT8deVo/HU23wFbc+uksEMlR2yr3k7FrnmFif0V3xsPvZ331dANSnE5kT/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiLxg2gx; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiLxg2gx"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37e11438c66so662820a91.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 18:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782955998; x=1783560798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgMnN8cRWB289smPDCgRPSXeBysJiuiJpvGhUnEqS8I=;
        b=oiLxg2gxMmTXwfw4rRMaE+x/5W9TbWmDuqwtGHtmXunXT4yEfglssUcEse9IBeqv19
         VYRrLX0ZXuA8gYk7XgR8kTomvWHsUdac1r4ywosvGqDSzYiCBbkKIyVHr8F8yItxd3gA
         Ar/3XT22EqZS2rxmk0ZszY29Sw/h8w+xwRHT4AzxBJEKOFxIsqSLND7p3ZvhBPLE6FXE
         hINZ//WBF0f61Df5CKxZE6Z28ls6UBkcPol//excvRXqy0krA7a5jHyUucEhX0DqOLW7
         WoPnQROl6Yn16eiv7d8pIkWPSGO4mIR/Lb6L3drEUB+sP4jI7A2k8efjyP7JPR5J54R2
         57pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782955998; x=1783560798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XgMnN8cRWB289smPDCgRPSXeBysJiuiJpvGhUnEqS8I=;
        b=pMN8OXBZ3aZxiCyplFx7jzN68x1KglovNT52xtMo5kFJ0AjaAQIE9QGcjUtzyjmd4H
         rvHvz6oxx9iWNBdqzWlZfGx88yWyCGwLjKOstAyoFgtBtzMQ//PqdFNzrSr9npwspxUS
         9bjVPy1gOGOa1t3gOnorzneIb5c0SX/sMZlxrzUtUxv6wepzPO+MyVAvYPetOuTmIWrK
         ZKYPRMBTquNx7mAaRqT0Xrm0+lTTN9ix1PMrD/pTIDqxVb8kZLr3Fc2O4CsBvcGJGhVW
         tH60pBCoJhhj0G4QUsWFysgJtq6DNs8MSuWMa+KgYOuqASNRk7Dj2GGPSwxeT7RQkq3o
         xeWw==
X-Forwarded-Encrypted: i=1; AHgh+RqsSh/tM1RXgf8IQ0KjYW/F6O/hyTItXA789Aanfy9yzh5fprV92mtbF/2EdEirOEfDqcnzazXctUpx@vger.kernel.org
X-Gm-Message-State: AOJu0YxOBgIswO0jEH9pcG+6t4AxzhW/CLxc9nv7MBBHqj5OIYvuUHxK
	KHmFjTp6Pv5I7uXAjUAtfoYUzfdRtVPRhDazQ6snxDOX5TOd4RBdkKRW
X-Gm-Gg: AfdE7clwGRCVnghSxvDKPWw30Qj9SJqzFlpFPbZgE4bCSVeBPn4GFlZ92s4sJf46CRs
	vWzNKIJTJZZ+lcy6xCS278BkoB2wPHVMkfie8GK8aw3JzpWSVfsaRcBSEbfBkGFJsZrln2E7YG9
	I7yPb6W4fMFyZ2BYnmhCbuBEil7LS1musN0yf81sRN0FgEr/HVgTNlG3tjUgPEDDH6XIbGfak0g
	Y9C2bi/JCX7a19tilAEv92bmTpgY5U3BtOXoTBwuOVMngyYBeq6VfqWFDd/hG+nNGo8ggzDCgC9
	dCkqklnqmc0WwxqiHi9cQCKBQMZ/aivA5pPZ2Flm9mra0muuN9yYhS4dx7kFs/9R8X/cHz+LIIS
	wBtbbJRG7SAchm2AUNGxCJLUwE73FMjp/qjvmVlpd/PoR8+jmglSWEMm0mAr363ZDB+tFHAivH+
	js/lPRzM5SSI4H+ccRpg==
X-Received: by 2002:a17:90a:e706:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-380aa0f53e2mr3912923a91.10.1782955998109;
        Wed, 01 Jul 2026 18:33:18 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:3379:8697:e33b:cbe6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm540377eec.11.2026.07.01.18.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 18:33:17 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 02 Jul 2026 07:02:37 +0530
Subject: [PATCH v2 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-hm1092-driver-v2-1-4f9f369d6a48@gmail.com>
References: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
In-Reply-To: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3320; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=GBwoj0wKX6WvpSwyWFpUryr+T2rxfPCqj4p2MWOY66w=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqRb/SqdP5XbnOtvrTmNT6XnGPxPbuinh3Tfqqa
 e2ON8i4y9CJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCakW/0gAKCRAVlYpeERwF
 3lACD/9QI+sLmt9JZk9we6koMfTcYg2WSXhifAO3dpKIULbgQdT1FteQA7ziGLu/D8sxET3QeTb
 h7K2MdotmUKCD4xKhf5KDNDhmSCYzumJlyvFE4JX0wK4Gwpd06WVxSaUM47IvCTdiUoYiH6tky8
 JCjj/dbRJRcszcgLmdS9L2k9PMMHHaYGxcTWmPNhv8xuJFE4BIRoyGO6zBKhzoJBfhCGHm8tmdQ
 htGxrWkFi+N+j3D1N4RYJFRbvudEzuDZhzNMEkr7BrmMq14mYGo5XMMx7dv09CEmR1oJ6FwoLwG
 6mrUk6hgoVLcekFWbnYQFWoPYKTLpgqi1UKgrkDAblBKvaQqOHUBQQtUD6PnJcgVXFWg7wjt4F8
 3HSQBR6icKG6/RiwXHgKqEMeHYcTEBg05DElkp8r9XHd6ZCbuoSU49snLzwWvoQwYlU7epDDVH0
 fl2K7bbwonVcOyXFwpsRAk0R3HrjteK/aTfsyCv+JkPtRte+gl2rYXTy9vafJi3UK1xQm7BDBPp
 vl4/KIeY/K7gh/SUZAJnCqUZCt5/iMcyGjJngcrdUtHXDFZTXEpHUv1nwDfl47K2Td6Mtidrnvb
 SXsP2Lq1k5eHeic284G7x0JIwmjGfvNJqGLO/Q32/fAcPEZ3HDxeuT/cnB35qEHIx2C7ZHPnxeE
 +ugYU+EPAt79eeA==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

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

