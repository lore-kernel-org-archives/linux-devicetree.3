Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793938298;
	b=ssHuCkGKAHgN8iO83YH7R7xZOuxc82hniyQPyba+VonZA84nwPpSqXvmkLBdZR12PLzx
	 2jrSpBc5m/CHeDpV4PPTDhuD3n0EOoA8J9JqKxmvsFJAkVskmA1m+I+VtYmVbvb/ONRIz
	 wN2YbLKfXRl6/bdyLfSoZr+DCKTWH/Gz6TUBKUtb4RZQSMDq1WMeD0KDSaUppbA9B6HPl
	 bw/fzF0HKIxhyVuIE5XHvRqQ/z7geIrUD2vQxNCAP/Ga7Skc5SdkKRFHjP9tH7ZPvUWoO
	 3GIympD9M8r9iva4i+Zvih63i+ivrfjw4J8f9vlZ6U7/LvD6gulS/t8eWlbxkTpXV7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793938298;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GvAAlTLvWYdn82+xYnetxv3GZ0aX8KZTftD5yLFt2cE=;
	b=4eP0yg7RZduGWUQGHDlKP2Be36Y9+/pT9lFuqA/wTaqCsxssaNxeW3xFsCK2LZ7QC0MU
	 LBGYt75hwTCV7Zx1mtsucwF29a1UBBl1fvPLfH1Do6+atLSu+TMqtd0RLwF/dF4NovsFQ
	 4FG4PQ8GYHtQRN5mqTlOFfkL1WwEUMhI+0S2nKk+U3ojIl6JT/bFV3Kvjr9xsaB6FJhQI
	 xNQeXnEmm9oiay6VaS+mdiNPDSM3d6sFBVs46PiDPxl+BN6Ek9lPCyw3zmXocnyGmcuud
	 1Pco1fV6ox5pu/pR/7oNvRtFT0iRzidedwqAd9Cun+XSXzy4SBbu8fpHvpBpkkR+XzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=U9lsFxN5;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE5606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 04:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BE5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=U9lsFxN5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793938294; x=1794197494;
	bh=GvAAlTLvWYdn82+xYnetxv3GZ0aX8KZTftD5yLFt2cE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=U9lsFxN5KuYLmNhXxcGSmm27EFRBoNKY/imhgwI09ZdgWq4mAdc/+JPe9NUgoPyxh
	 wlY3fgP2RFZrmBv/7dB7wGvgciK53UoaziVKDTkRXxxKARnJ8Xd4OA2c68JxY5y2Y7
	 tXK5gMRcG40/AijdI5DaZARPWegRGPsioT+yrx8W3Ww2EID05FbNXA5Sf9WbCkOmOY
	 Tue1Icuv30ja/aJub2vqMvXyBArIww8Ym9j1bfqPPJyTjLLgtt2r2mNdGCGf5+tMdf
	 BlpTtcbsYm8qKZvbLu3yxm1e+4tmnCIJ4l5QjzlwOoQNltm2WLthJJRDgElporcvoc
	 s9A3gvdrTeT/Q==
Date: Fri, 06 Nov 2026 04:11:32 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, George Neacsu <geocausa@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/3] dt-bindings: media: Add Sony IMX681
Message-ID: <20261106041116.78937-2-lsa.uz@pm.me>
In-Reply-To: <20261106041116.78937-1-lsa.uz@pm.me>
References: <20261106041116.78937-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: df4410af20d676c97ce1cc8d6684f1159b430ca6
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Sony IMX681 is a CMOS image sensor used as the user-facing camera on
several Microsoft Surface devices. It operates from analog 2.8 V, digital
1.05 V and interface 1.8 V supplies, is programmable over I2C, and outputs
10-bit Bayer data over a two-lane MIPI CSI-2 D-PHY interface.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Andre Gilerson <andre.gilerson@gmail.com>
---
 .../bindings/media/i2c/sony,imx681.yaml       | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b=
/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
new file mode 100644
index 00000000000..24c55760547
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx681.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX681 CMOS Image Sensor
+
+maintainers:
+  - Andre Gilerson <andre.gilerson@gmail.com>
+  - Sergey Lebedev <lsa.uz@pm.me>
+
+description:
+  The Sony IMX681 is a CMOS active pixel image sensor with a square pixel
+  array, used as the user-facing camera on several Microsoft Surface devic=
es.
+  It operates from analog 2.8 V, digital 1.05 V and interface 1.8 V suppli=
es,
+  is programmable over I2C, and outputs 10-bit Bayer data over a two-lane
+  MIPI CSI-2 D-PHY interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx681
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock (19.2 MHz)
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8 V)
+
+  dvdd-supply:
+    description: Digital power supply (1.05 V)
+
+  dovdd-supply:
+    description: Interface power supply (1.8 V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO, active low
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        camera-sensor@10 {
+            compatible =3D "sony,imx681";
+            reg =3D <0x10>;
+            clocks =3D <&clock_cam>;
+            avdd-supply =3D <&vcc2v8_cam>;
+            dvdd-supply =3D <&vcc1v05_cam>;
+            dovdd-supply =3D <&vcc1v8_cam>;
+            reset-gpios =3D <&gpio 4 GPIO_ACTIVE_LOW>;
+            orientation =3D <0>;
+            rotation =3D <0>;
+
+            port {
+                imx681_ep: endpoint {
+                    data-lanes =3D <1 2>;
+                    link-frequencies =3D /bits/ 64 <969600000>;
+                    remote-endpoint =3D <&csi_in>;
+                };
+            };
+        };
+    };
+...
--=20
2.54.0


