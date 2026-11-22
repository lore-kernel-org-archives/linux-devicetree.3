Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335555;
	b=FmLH2Nbe/qbJj3XDySsyTanGt2vMp+++OL0iVJFjsZ13ikqjTvvLNhL/6Ov+ML+mUhLQ
	 QXoeelgFqEo+XVqHtw7X0iw1w3ajGFP/cDAM/iwO5dKhHxNLlPT8AHcw6/tgkP10kVB+Q
	 SFF3qr5TwC4ewrr3NXwHcAR535hJJSulNkY8rhxhZOvHWqIfg8zzhcOsmpPMTaqNo9TE/
	 dZ2Upm8oeMlNcmaQrYWKviHDSWa/CjucpRAv+9KqHKU/CO9Z5W4kv4SLmEmilHg1Dv8BR
	 fwXYlzhwGYG2QIVXTopKZGQaP5MxiH9W2rhHPD42YgZTXyJ84Yu3kfqdDaNhyDjHlJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
	b=UbPwS0625/UGh23XynIDr/L9GeMPA3I8gymU9RX+jRsp+NOPH9ZrwOxF9mjj3zBLMo5I
	 h83tngNYYyIwse5sZPNPS2pqc5awzCtSuwMfjwoCJCIEukA4zL/z8I1wRjJ7+B1mmmq/A
	 leu7qA3duZ5tAdsvd98POiLO7tpURF1EQr9Lrl5zEiOHQzLWJDTGV1Imf+bwzwBdKn/eW
	 Ygn0MJztCgzpzRsNj5Bj5hGLvOL4XEad8AtXWUkTT91vMsMqBHsKeUrPnZU2rViGjdWSJ
	 MQJ1oqWA9jbocys00NEpiQt6VZWj71vL0sBgayMfgMK4nt4fegbZKCKlyIP9amQdGog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6I0jWd4;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60A606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F60A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6I0jWd4
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d28f75d62so385893766b.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335554; x=1795940354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=S6I0jWd46JjblZGAlLs4RFsDKuFGeS94c9BZRRtzar8dwKM+p//r8lstUq4/YNmlwr
         9lPnMQcLJO0UKcvMGbq8uv2TtdnPjflX2QXaq5BgdORQTlv0qzyY0T9l3ND/nIcMJKZy
         qGYQ1m/qdGRKlMrAgCIm/zPTzsW2wxUwWJIDjnY/M6TOtpwgeiwoDoxx7NU8CfEvYKT0
         WU9KY7Qd9u7Sb4q66kCmmkIAPXtjdKBGl0MObZYSTMZZeCBKHhXL5lQMq2wivfdYkvKZ
         7Woaev+4t5Zo2IMK4uf4/dUonjt5ZdB9S77OY1/XEau2iuABQVddDxCTqxDAKG5zz609
         63nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335554; x=1795940354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=aryiJNx7RzhYFM5iaq9Osm5qXqPRQMQ8LXhMN91SxN/h6zUYjeMvRx9J3z/8XRqr39
         JA0sm1cAFY7w4nrUMV6197RuuaUbbhWBQ6AVEVxyvRS/BILiinwg1LMfjwD/+LfxB4X7
         dNuVVBxoN1pRi1iM2BDwbWEivJOs9+QaXaGt8YIc8oKf1CTX5JmbQ21+7/bJbfO3Bgl0
         5gDR6ywLG59uenLjDqvYAq3zU3i9xRZoi9NicgiK+DLtiA/I3AWU6j4wQtlNseRdI2/X
         4ChdzUPHWJtGurWEdt1QcYz5Dc2DYWadBcJCJ0i2/QBQnkKF5T0nPpnpemlouA2Ql20S
         r2pg==
X-Forwarded-Encrypted: i=1; AL+hErEwfycUYm+iT9+fyxiksXqczc4x63jEOL6ncDfP4r8A0fsq8M3uVh+Zzj3fiVLrvCFRoyNi0pZbatUx@vger.kernel.org
X-Gm-Message-State: APuU4Z8L5RQkmY+b2QCCOEjd2JwOuXLS9vdCmSDzmbjx/wBDyhwVKLj/
	DHiir5zXPwCHRk0PsxdkczsNnHngkO1KUoJ4TqSYKy8/qSYu6l9p3No5
X-Gm-Gg: AZFdTZeRgMkgfPOq6YoKELZMMDBh8v8eztOXo2NU9FC/7i607U0ni2rqbrWizXVhwrr
	euXHgCywY4BOHTOBQtmmcOdhj7wNQThWxNeyqTvx3DCHK/iV3VwUrX11PdandjoW/ld/VnSpbht
	VrkNqEHY0m2V39cRcwnw/wHqp/HhhPbUg17+lEcqaUbHzuuOaCa1uID7DjoU2OIkj9PzLtQeIza
	Fzb14sjbW5G1Vr0Kp/Qzyp9JqYv80DJTwE9C0X1ytl88XhU1E6YxeD5TyMDqSUil031lSl2xPeJ
	2vDlHIL/iEuy1O3JcI72U7GxazyoI1MzHCSXs/BBLpwjei6U9CzGEH3GWZ8fpfDXVWUMnTMI0FC
	ZvIR5Xdnsy0fWTHVmkY10SKYQUi0m+rHGqjmTQ/9FOdctqi80HiVIjDILWvJndGup6G/yp+TjLs
	Zu1Fn+qaq2b9wgBTFxd9Y6K+F5JdX69QFZmwFum3tCgRTSCYKyjVQI4x3NuucEjooeIs0mXEQKK
	X6S9FEitCb+YcUzRYHKw6Hf8CgTxJ7M3DvDrT5vPmVYqQM2NnH6KayVXv33+RugbaKjLjMTjYAk
	nOZdoOaLqQjRlfORwlnSq4Cg6Hq7+Soc1ZPMEWsa5tFks2kLYzgyv5j2BhOnYW7VQNmsWk9jZ8o
	XkkAyFOt2aCg=
X-Received: by 2002:a05:6402:13cb:b0:6ba:4bf3:4a2 with SMTP id 4fb4d7f45d1cf-6ba4bf305c0mr4401281a12.17.1795335553806;
        Sun, 22 Nov 2026 00:19:13 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:19:12 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 11/12] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Sun, 22 Nov 2026 10:18:19 +0200
Message-ID: <20261122081820.53199-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document 8-bit CPU parallel MIPI DBI Type B interface provided by
Tegra20/30 SoCs display controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 108 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +++
 2 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
new file mode 100644
index 0000000000000..6a34202f80765
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra Display Controller based MIPI DBI Type B interface
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: The display controller in Tegra20/30 SoCs features an
+  8-bit SPI interface that closely resembles the MIPI DBI Type B
+  protocol and is referred to as '8-bit CPU'. Each display controller
+  provides two such interfaces, which can be used to send MIPI DCS
+  commands to initialize and control the panel while image data is
+  transmitted via 16/18/24-line RGB.
+
+properties:
+  nvidia,interface:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of DBI interface used, 0 - primary, 1 - secondary. If
+      property is not set, primary will be used.
+    enum: [ 0, 1 ]
+
+  panel:
+    type: object
+    description: Node of supported panel driven by the bridge.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for RGB input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [ 16, 18, 24 ]
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DBI output (panel or connector).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - panel
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dbi {
+        nvidia,interface = <0>;
+
+        panel {
+            compatible = "hit,tx10d07vm0baa";
+
+            reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+            avci-supply = <&vcc_2v8_lcd>;
+            iovcc-supply = <&iovcc_1v8_lcd>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&bridge_output>;
+                };
+            };
+        };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                bridge_input: endpoint {
+                    remote-endpoint = <&dpi_output>;
+                    bus-width = <24>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                bridge_output: endpoint {
+                    remote-endpoint = <&panel_input>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd5627..a014bf0dd508d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -76,6 +76,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: A list of phandles of outputs that this display controller can drive.
 
+  dbi:
+    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+
   rgb:
     type: object
 
@@ -155,6 +158,18 @@ allOf:
             - const: wind
             - const: wint
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-dc
+              - nvidia,tegra124-dc
+              - nvidia,tegra210-dc
+    then:
+      properties:
+        dbi: false
+
 additionalProperties: false
 
 required:
-- 
2.53.0

