Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A2471CF8
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862118; cv=none; b=P9HfywCfAspkguVeg0ieqtCjFqD9lDb9Iugzv34kW6+pD8Nkd1uzaqYmqKlq8ev8Xq+6p5NJsXsjug9VoteqnFKs/SgnqcsIYgZi5FnlQAmJnkQEF8gf6XsEKmV0ig8DsV1qY4k1UR0CTeM4sXczOkIfmSYsVG+eepCpWdlzrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862118; c=relaxed/simple;
	bh=1596ZXtdhvZVs+Tdnu6Ajw7/QmvSTVTcByw56Brktwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmiA09vXpHeNYN9/J45DhKrdBdK0Nh0rCepL9G/5QUWcMpXAzwQlyvDoUtSjNX0tieREnJhj0WmNz3mTwoNKuoIxRFfuD8IQ/2TmnFBDrEwK7QaHNcJZMyfJlVreYlg1vu+JAlUxbxLZ3Qs29R3dzxsUTHL7zBP8OGSBgnsDQTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W91FFlHc; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W91FFlHc"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535a54bed9so3469121eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 20:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862116; x=1792466916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=W91FFlHcUkJSt2HrR9od60ZMxoiq4czabMLAHTBvIZKvZXtJ2k87DyVzvWa52Thp+N
         yEIdIFeiR7iGGqj+dyoFxQu7P2SHxSfg9cAvr8i5vEFx/XeXr8CmmHy9keFdUzEVOlH5
         ZmFRsml7GRBmCobiUiOW6wCVv9/0+xCjrWXPsfDvoq5HAgjkb/Z4Gyhsbn2QODvuBY8k
         7yNHYPCtKLtC5SuibL0GpECx3nrn+Ny9IIPI1gKhzxxybM6aHlTcyoyJbfyUrcwIdLJ+
         Z8lf6sEglefQO7jumuItchredFVLyOrbkQ43ZsxCNN3qySIUtojrgM1m6kSj2Vl7UaWW
         rgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862116; x=1792466916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=JDKwwlp8uCL1Lt4kpB6WOrK6cKOADMao+2T/GkjR82uzp7pA1FcihsuTqV0aHaz5Ey
         pB8C1tVQmRHVakcTGrAPMxsb/BxZxMcb8j86FF3it0PkWfCHP3yJQqp3QaMjmMHDDp9o
         zDubwJAgnCF7hziDoMPSIvkBJSOs7PaZDkLTDGl+Fz2VEvkdfE4fY5Ho3JrSkZZFkNSw
         WoqOxI/jr0jU9pZ+NCuirz30laa0kZ+Pb0kP4AAqq3Zy9ZEjsvRwI2Kkf5caHUD8zjOl
         /w4O+t8jN43T7S+YSdOHV2caWx5scH9HRZOoamEg1nWYsVLP963bG7FXzV2EsmORQUyp
         nwWw==
X-Forwarded-Encrypted: i=1; AKwUvBzEiVhK6WWfiMuSn6qVMA41SU60vN8fV5v3ySbYKcSC5iWgsPmSEzy1M/0k6Xt2mCgyKIwa6Axy5vdH@vger.kernel.org
X-Gm-Message-State: AFq9FYJD0IKM0iYvxQJ2kdaK09xfKRGsEQ61N8VP7Wpxa2Tl6/K3roHK
	Ndk/9kfXzETDxNuSJE4pS/tp4+/5cuxd8VZVw8eUfbzO1fOIO+Y1/AHm
X-Gm-Gg: AYBFou1YAG7Ya7xonLyoJMQusIzWHThooNa5kikDS45md4O50QcuH/ST1CTBIxc40jj
	fQiShFxtltN2BILQdrrEaIGYej6dEcSisN/lSvkaNusr87Yi0IvRyj2qD8pr3BTQCxu1z57zj1j
	PTliSNiD5PPSI8RIAG/n4Yu2iFMNbBivykh1bk9mavuc73sVMZuOLYTeVfrJuuM2Ai82aOSBIxG
	latalCoaYCctgno5Qoznf6HwBQWyBsyZCglhqFGjrYlOIZu6ZgEKRbMaCvpATQpLlBYzCqhN7ys
	u8HmXnSotlspf7okR3Ey2NqAC0cZYPMSx8ECfRSOnzUb2pzwKGN/QRStr8vj4NsOSyXI3jqJbLt
	ieE4mX6IIa/2KUlxO3225PqszwTxAd+0J/LmZMgGH4kx3ha7LfKi4ZcEJFzsdW3HzU1ZjHB9GK3
	yX7/3V0DzIyUaCigIJxYOzZTqX9GXiVbUwDfymVxx01zRwdtAKVloAA53+4qqM7FfgsUA5BlzKS
	fmMlKEY/aoUcr9SOM+GGHv2NBgc/UwYByy3Hn5ChuCXvA==
X-Received: by 2002:a05:7300:d205:b0:35a:22a4:133 with SMTP id 5a478bee46e88-35a22a421b2mr7256994eec.20.1791862115599;
        Mon, 12 Oct 2026 20:28:35 -0700 (PDT)
Received: from [127.0.0.2] ([2401:4900:8900:441a:ba51:e5f4:3ca4:4b87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm43617106eec.18.2026.10.12.20.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:28:35 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Tue, 13 Oct 2026 08:58:23 +0530
Subject: [PATCH v7 1/3] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hm1092-driver-v7-1-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
In-Reply-To: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Eduard Kulyk <kulikeduard89@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

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

