Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5569389105
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788004720; cv=none; b=un7ibXEhiCSX2D2skcR3uIeXV1tkSzFdmOK1D7QNmecrecQ6SEOh5V2MhjZdIePflzO0jmyVvoY4kDOFHSS/L0Oynp3e7MeFwhilbZCY7EAk91WkzSLek2YjPjuau/mHRger7RXbJgOyumJw0EesfasBAiP0Ynpoj9rLXBg3/FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788004720; c=relaxed/simple;
	bh=1cnwRuhKTToZ9ufUWqiSd5MU8c6IVjjWd5ft2Wt+dOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLpOwwVoPhB3mic68nCK70tvQLEp0BaGEeC4boK0YPoULPXNe/zcZiIKJEo3oIWXHKnxGqTi2j0f9JetsCr37w6VctpRuwVESi+VaeoY+JqJj2INg+Ivs6gwMHjyaDOthQPKz6gTGvYDbq5nVcKZlfzkCqmo+zr9CUAdxZnNfwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwNIJqur; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwNIJqur"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b9320423cso17548905e9.0
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788004717; x=1788609517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/d2agzYVHTgJehWwUbDB0I9JGrQnxrsr9OrqjlElBg=;
        b=jwNIJqurUL8lU9JJrudVrHXCRFIWJOVc7NvC5U9C9AOrYnF7Mr7011hOQkM+2kGfBp
         50lcSI53mNzqxByY2WBI2nYfCGAoO41xHNNvgC3KqjuusXKjF8NIIBDimb9fMwyn8usm
         bVPPqA9Nbk68erTa4+qEsIbWgu/9K6Nza9RQcGmYiBwdkjLxhcK0m+Zw+9MDymOGY1x5
         LkZ+dA6g0FsWyG2/fFwfms6jP67bzoZTh5R+JVnKXK/Im/L8ATK+/bGMZxsWbWSXo+fv
         1lYpzmE7GPGcgPnkCyK8gMf1EI2z597DcdkMtKos7VWQgifW/4A7j+MVY5PscuRFIYa4
         k7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788004717; x=1788609517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/d2agzYVHTgJehWwUbDB0I9JGrQnxrsr9OrqjlElBg=;
        b=krWiIHVxNOXGJqoc9LvGvu6LR3HTZbSCOM+YRq9TJ2cvWBr5o+Bc8hKe5BJ9YIz09L
         CgBm7ZFTg8xg+nBJilXn6ZpmVrH41D50NZ2WSBlZ7HoOQrYHQPEJY3xYyJBp3WejVFU3
         hkrTQto2Uw0afCzJ9GM344Kxe43XmmrRp8jqQAtHhMvZmH1gyZUaxB9OQPuXNGo9YeDp
         mXjrFtbzbJ5Q84Z/FBPxPGjCnv8EBDa30h03XRLWCY1fQaCLNwT4z6+whZcV7XTz0di+
         QjvIOQwJTXMfJ60qlXC9Nz960hIICHFRCieSS/jSaX/6ZzRA5hyTgWCWpbY03huKxkqL
         Ctkg==
X-Forwarded-Encrypted: i=1; AHgh+RrijB0BlxcI52ZAF7ZuOVL58j92QgKPRCnK1OnzP/86ZIhV486K/GUlCUyHuwFMW6jHFtMD0IA/uh8E@vger.kernel.org
X-Gm-Message-State: AFuF++nrrrt1Fu0k2/rQQ3+mJ5ziAHGvtVl7kkkBCwOeMXjj1tmKjGXG
	K4EFzyYkGYdoF8DBMh/2sRWJJGSa2b5S9CjEgBP29YqaopWGRishnB1/
X-Gm-Gg: AR+sD12ov86c2E2foRGV63EFK/KQQR2T229c+ONCT6AQPNn8BnhRwoqjM5b3ji6h1Ae
	uxXOUxsnD4/KtjlnExugde4VcYnX8bqjBu9uQu/MC1lGsOprCM3PGm2MO4MLq/kmqOhfPyREHQB
	I8iRRW0QpQI0Lvhx24ElGWfqi5DHVHJagV8vksNfwmer9UKLvxL7TVmMWxcledOiad6EmUD3ENZ
	A16Dp4+eIx4UNBxc3QP9n6/DuKTGkK0vJOGpDTinwyT11zqaCqMoVfAJZo7W8l3fjGY2YMPvtd5
	MvToOI8XhNO2Y7wuvXkUgvMFuQlQDX46qjGuqvXlbdHAwzGAQHxkDRYmb3k7iWJ399s3CN0TVEG
	9dKEZ2wqe9ci2TpJCqO9pUSWVvCCEBZ3Rw/92Qao0RUz/gHy9/qpLHWzBAhapMyzQFGxezaL2+c
	1EbkNDcy4N2Wz57soglo9feVHWKJ/GJozaruZ2yfeanQ8P4e+r/wEvSQyyANH3P3xg1lz8ZESNB
	zaQlyGCNagSu3Ls6DtD9P8oRGUPjABo/qRy/6RF/o7GXl+GtwZvfmV05pf2V7swaXkPCCmzRWfS
	Di7FJpGcW/+9ZNe8
X-Received: by 2002:a05:600d:13:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49b920547fcmr185064185e9.15.1788004716653;
        Sat, 29 Aug 2026 04:58:36 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm111107945e9.0.2026.08.29.04.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:58:35 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Sat, 29 Aug 2026 13:58:30 +0200
Message-ID: <20260829115832.8749-2-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829115832.8749-1-robertbozik@gmail.com>
References: <20260829115832.8749-1-robertbozik@gmail.com>
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

Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v3:
- No changes to the binding itself; picked up Conor Dooley's Acked-by.

 .../bindings/media/i2c/ovti,ov32c4.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
new file mode 100644
index 000000000..804307cd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
@@ -0,0 +1,105 @@
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
+  transmitter and the standard SCCB command interface.
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
+    description: Input clock (XVCLK).
+
+  avdd-supply: true
+
+  dovdd-supply: true
+
+  dvdd-supply: true
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

