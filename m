Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945475;
	b=vEJBsMbDXldAQsdAKZjM1jHe86zFsnJFFBneqOwOJ/Dg0cUdXegCPvIWYt9dFJmBhTVf
	 64lAs1vNGSRzaisuAXxENYkVP5V+IMlMSWjkJ6KwkNjjJrrhbA0iFKu2l/ebdi8HBlJCo
	 kpqArYT/pdEpZnaBrOU8fOJbg6PX8t9BUg/EJSL0XjtZQqmcF+ALh+f+sfXzqOxw707fW
	 Zsu+lkcWAC95Db8u/g1572hpH0ojSrJ8ILrFY3NF4VYmWhVAWhkRAXQQ3+ifTUSftULWT
	 ee/ev4lft5WRjEfQ6p8e44CoKms2q093SNNnTaA5czEWX+ozn+25dbGPWFVj6Rby38g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
	b=Z4A9JmjCMUNfQfJgOOs8Udb4GLXyJUbcsQVloyVXOGMW2kuP5UYqU21O/Mwifrc6Qnzs
	 a1iBxNlA2AM8Hdz9GA6e79IJr/UGmhM8gMjNCN+TUIgfA4cuJvJ9XbqJZxbcNKbViMm+m
	 HdIw6IczmLd8wGK6WFSAfcvkhEMMJ4vrkdsn6gJUVIZ12c9Q9djRBfghdIta67JClN6Jh
	 oklbiEXx7DhMkwMVtPRL50hsPXOQYjx96vluHmDAjrmpbqmFVmYRv2V7Pn/SFAHQxO40a
	 GjOfZ+Vgdv5Wug2Vwihz3AvcpbqJR0u/1JnDSmaOCeW3fpb+ccdBTVTb098Nt0K4H3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="piVOs/i2";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17194606A31F
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 16:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17194606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=piVOs/i2
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35f036b17easo5933230eec.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792945473; x=1793550273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=piVOs/i2wwqKrNJRRQcsFBxOhSsD/oA+DtBDJ0eO7uFgeIUWiV3/S77TOvOs4Mg2w8
         UCoal+Q4KZT6XJj2dsyQsVQOfT6Z75lpCAvV8Nvaz6oL34rsbcmgiWpoW8dIj9beC3cs
         SXPr2o1QwqUa/4cOWzMOkQhDpYKXQyivL+WDWx3Mj7UCmdSnzP+s6KK+bJ99kv/ju2eC
         ynzOuNmgPlISAPkew4JA/oW12eG2K2X9PVpWNmE+c3fCweuPkaSnBP3Tl4pL/xFG7UTZ
         0Q7p6i7eqNEmIO+LYUYJpBlmxCcKUOywDI9CfNA3KxQ9WXCgrh7ZEpmfSLkGETp+ALZ8
         UvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792945473; x=1793550273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=UKxI7o0VxHfTYmTd6erOHInF/qQo2nyulth8nzRXiqCt2/NTSax0NqWfZQ5lw8JDzs
         7FxtUR35v2QCwXReDGYW2tTZMGWcy+rD1LOsNakEDUZ3326u9cK0M6mkyY3Aj2QULbuM
         1k+LxAJoxslWS4M8K5IC/hQjPUs5qBxir3T6AKXuUuSh3HUhzgAGma5SOhHeqtK5C14m
         AH9FT05QDxFlgxw/bHuWLFkNGbs1TTAi3BCfsB3sYdfKU/STVCE3SRhGeqyqVDgipnaP
         eDcGWoxbV1QHIr9CBjnxcAw3iZGLiCa66EaKtIGZzq7w5YX8QzVGUdbMdfTux9ZfQXlY
         xGZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKyYoWvie38A3ytiJBGL+5BdU3x/Z6OoSz0W6EWSABOG46jwea61TNQ8MmEc9CaC4jOZmd/m28a0uH@vger.kernel.org
X-Gm-Message-State: AFq9FYISZCRaPvUwknHA9JA3Kux4D+t9xKgw7iVsv+nAhlpEJlNMJj0L
	9gRMGGle6jl1hK/dMXU9W6183OWNN3Lv6w7A25APcPl7Wc7At86t2Jt7
X-Gm-Gg: AYBFou2ZA4Xw+Px/jvDBtTYa8yvIcqlWE1OsPWvEpO218azJVRDMf7d6Vq95NrtNUE9
	xHFmB/EHVDANjQSuRlNIM39i+VJnoJVmZ/7sKPyXb6PIHa+F3GAfBhJxTIJgMfpP26kYfNKF70K
	zRO/uzVDasyhxVc4oRHrpttGsRDahrfsYhh2QaeKvXa720hSYeicmnxRwC6pNGfxJZWJ4om+DNP
	aHLnvSpBqDGJQvcmUQ/T8ee2oF3go13ym2Nuy0f0ipS59rJa6yeMHLqQbew+rSqHX2tANLXhwX0
	XVJHdgPar3W36Bb4LdiHpKOy6laZ9hGwfxAT5Hvo33W38+DnhbcshqtyybJwChIgm8wAswpqrbt
	J6uMKTnLRFyv+KJJWCmoGl9AcupjyQT2o5DrpRz47qTOTNnBRIAyBBBz83R/kM0vkVGkHPXGb4h
	4v5ItWTdimxLHp83c2llgfoTxqzsG4DgxFNxGr8oZo9hnNrXcnRev5Q0OiCx5NK+ujXSxT/4dN+
	V42WZGsIO+excitveP7EYaNXFIvNxKjE+Yf5jKaHH7P4d6IbeqY6IpdzKeuks7uBim3HqHNcfPQ
	d4QcddlFdLtJrr/mMpnHX0dy/fL5K+9AAfEkdQ==
X-Received: by 2002:a05:701b:4213:10b0:19a:a2d0:f41e with SMTP id a92af1059eb24-19aa2d0f58cmr6269251c88.13.1792945472995;
        Sun, 25 Oct 2026 09:24:32 -0700 (PDT)
Received: from [127.0.0.2] ([2401:4900:7b93:fac6:22d5:5a09:b572:da26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm16385722c88.12.2026.10.25.09.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:24:32 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Sun, 25 Oct 2026 21:54:17 +0530
Subject: [PATCH v8 1/3] media: dt-bindings: Add Himax HM1092 NIR sensor
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-hm1092-driver-v8-1-9cd575c366cf@gmail.com>
References: <20261025-hm1092-driver-v8-0-9cd575c366cf@gmail.com>
In-Reply-To: <20261025-hm1092-driver-v8-0-9cd575c366cf@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Eduard Kulyk <kulikeduard89@gmail.com>, Ray Strode <halfline@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=1596ZXtdhvZVs+Tdnu6Ajw7/QmvSTVTcByw56Brktwc=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBq3i0z67mYS9Bva1TiFN0E4tjZI/X24V4+ziTJe
 y5pUHcvLhKJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCat4tMwAKCRAVlYpeERwF
 3l9YD/0RRR5cz2oYBvIAYphlv5y2TIn4TiaivLC/2N6Hc7GGnP/8hNO/yjqEFbJX0jQwVWWqQW6
 j6YYV7kTyt8Bcc7WtDcHxBYUPEJxluvAOlKxBxiTme6sabfofIDRK8GypKvFG4oYiyuRg/WOKRj
 +3TIdYAsGNGc5jHA8hTjFijQmLsMpF08tv8aU3c5bvVfcrRI67eBS1ZXmAEv+hvqAYuBBoyHVrp
 wRD08R6wCGGwMJne1o1m2LF+zIcXLfOi6U9N63/bMgJgK9d0Yi2bsPiNnw9p0tG5uHWTwxtGdAh
 q6m/+aGIQYYXLHctB9cfhhCGwG8roG5QSapC5s1XFaNPnv4un2f6zXWc1zMVHOW+OM0WPfpxxAd
 o4MXKXPkgAeXcUUxkGyEiGBbYhR70WYz3oyRzGKAXTSPiJh0iSdNs7Bg2Ac2jc2f6FcbWsJzaIL
 kwXiWl07voM5pDwOIzR+3pevYC/XThyTJ2ieON4JBbefD0wIg37uH7AmEuPUBr2vmnkmlhYKJ65
 8kHj0JEzbYf0H+UrIRjuOdiBxS2pLQPeGLkndh9F8ZQtLElUOQdyl2zqnVuMFQmOaMjKI8uprBT
 Za3oXWm5+nsca8SateWzWCFshMaEbFjb+7XWKsR54WBSrrcg8tl2y8IExnnTJocyPGIp/9pdd/l
 0AYJ2GUW0qcU0sA==
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
2.55.0

