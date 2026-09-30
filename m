Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9743B4BC
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751968; cv=none; b=AVHLf3yS6BmULMTzmrAncnjDgdVPCJXzE/nVwCIqXvvhExOchEV5cRBXAAmBIklJr1BRAruNQnDRGHsPh+NeuW519OkPtuP+jEXRl03fP4qE1fXbHF/y6WWam5VFOwS+38Ao+lPIcSRAl9Vm1bxW5e6KGDwc5BPQDtS8eok2qe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751968; c=relaxed/simple;
	bh=Kq5+QK0x+TRkwFsiRnUO+bq2KChSkkVzbilWKGBwOeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4pzXeSkS/TgptcjcgZ5LzDf/0oQe+vrS3KvVryg/xMHSyt7a806mfYf890V6smg0vDkCg3AN4J8c+/4vjEhlbWpbOLaMfgM0DN6rf9E3Mw6/mHpnqtBzmR7Orssid3pHDVmYFuwrQ49aQAQktDfDikX5XYSVEEqHPWtw6e7oV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mi9xYmri; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mi9xYmri"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so7535845e9.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751960; x=1791356760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/1eVBfEidkNMnK70z191xNT/a5PNdQYyZi8hBu3u0k=;
        b=Mi9xYmrijNJQ/Bd+f2S8ga/otxkgvloppsCe0IzAOBPkt/gKtcJrXkMnHvx610pr/B
         eth4dS9VqGDwZJn5JQBWhFWLMi/zv9eSrAEZPyBRCQ/ezCC1Q58y6XnkvhjJ3AS5taeh
         sNQwRMw93NjcqXNJ7xzXu6MWAZkNT2LSmWZBNqkRst7mVwZN0YrjQAWlBX50c0s7RkKQ
         qI5ynhYl3kQqJGcg3CO6lQ7D0CWXG3mUqGfDkpVUKdv+nB+ovfxBo+ZRiuvCVsTnnGFD
         gPuaEnCHwxQTrTus/h7qc4+U7iV9THVGuqyUDpDibh+vXuhFwGA9/we4vZL1uVS456xM
         7RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751960; x=1791356760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/1eVBfEidkNMnK70z191xNT/a5PNdQYyZi8hBu3u0k=;
        b=JUcrY+Zq1AaJCMIF9HLdleQqnmpuMVY/Vk0/wB7hy5Va+PWg0hs7N5HUlw5mtCQmbO
         kIE6h7smyyLkw/xQGXOmRx2Ugq+/vijMYBsF97BZH+Q7pGAbhiDr3NLS2adQuNpI8gD/
         u5pgA0Clz7ZYWmMJ1Su0Nsa9AqGbPGrFn9Xd/Ooa/iMYwF7lBrQpO3T4QDFmyiIe+s5o
         ZKrVXDOwEU+QLQqaKhUCfchzXKN5wkvCjL/Ow68Y7obFS5lHOzNZmGgrSzrzYaG6GXlJ
         9vW7bqe5d2RXFONmkDEKfm13u6bXzoXSUSFqVOWXNKFYIQIDGaBlc7Sj54ABqnl8aXzx
         /Ewg==
X-Forwarded-Encrypted: i=1; AKwUvBzQuQW6OXktMF3xL/kfQekW5j19zRCj1fVucc3i/W6QQK75Ijx2cItCLPj+KrgUAVGEuA89jCf1v0OV@vger.kernel.org
X-Gm-Message-State: AFuF++kpWRMYvt0fDNO+gqaJlVp6cOfNVdCoMPQvOwoQNkFFsKr6JMCX
	4oPUmZSRw09zO4SfjawxTHX6PwNhaNjHomYMkU7qRj2W82+5TVdY2kOX
X-Gm-Gg: AYBFou1CReOzbGrCC0SMqc6M0srOmMx/Oc8J7OedSfAZn04PQeZzulbiANuiQ+g01dF
	bSW+7fVbbpstkaWE/x/fyv0MlWQr4qv3L2DcM77pfHLCyp0v99CK+nV4Z8gQZ4QnfXgDDg0zaY/
	QqHHAQO+0cmSQQBTb9WOMaSJysZj89q+ePjf6WtIyQzsTHBWWBbrsPMjqfgicqRUtaaPiRP1mi7
	PNB8PiJIa0gXWfdxbHtHJ6xCMYVirpDEpUkZm40jtVuu60R34NXuDeTfJmuWCcO6ubSGexmNrH0
	89Xs3itFGb1U6a9NOaBPUrpVjAooPqlHj7n9ftWoh8wEJ26waLhYahNlaDnBZsp2KEjfIhjTWyS
	6tgnS6egleULikf+Si5JetiRkMMgHw+GHj+MVoH5rlEb8oV8jxRYChzwVqdtlzw3O9swBNpBVP0
	HerqNC48rj066v6aKsADI/7M8pOf33uhtxu/tvuMWJoMZtCttNehKtyccNk4VQYQ3X0nR5Z5mYR
	hAtasP9cQpM2FdK8nLn+Kc3yDkctQ==
X-Received: by 2002:a05:600c:45c4:b0:4a0:25c:8ad2 with SMTP id 5b1f17b1804b1-4a01b1aedd0mr5255825e9.9.1790751960356;
        Wed, 30 Sep 2026 00:06:00 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:05:59 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Wed, 30 Sep 2026 10:05:32 +0300
Message-ID: <20260930070535.47130-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930070535.47130-1-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document 8-bit CPU parallel MIPI DBI Type B interface provided by
Tegra20/30 SoCs display controller.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-cpu.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-cpu.yaml
new file mode 100644
index 0000000000000..f0dab608b2936
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-cpu.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra DC based MIPI DBI Type B bridge
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
+  compatible:
+    const: nvidia,tegra-8bit-cpu
+
+  dc-gpios:
+    description: Data/command selection pin.
+    maxItems: 1
+
+  rw-gpios:
+    description: Read/write pin.
+    maxItems: 1
+
+  cs-gpios:
+    description: Chip select pin.
+    maxItems: 1
+
+  data-gpios:
+    description: Specifies a set of 8 gpio pins used to transfer data.
+    minItems: 8
+    maxItems: 8
+
+  nvidia,init-sequence:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Device specific set of values used in DC DISP_SPI_INIT_SEQ
+      registers.
+    minItems: 4
+    maxItems: 4
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
+  - compatible
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dbi-bridge {
+        compatible = "nvidia,tegra-8bit-cpu";
+
+        dc-gpios = <&gpio 110 GPIO_ACTIVE_HIGH>;
+        rw-gpios = <&gpio 11 GPIO_ACTIVE_HIGH>;
+        cs-gpios = <&gpio 108 GPIO_ACTIVE_HIGH>;
+
+        data-gpios = <&gpio 32 GPIO_ACTIVE_HIGH>, <&gpio 33 GPIO_ACTIVE_HIGH>,
+                     <&gpio 34 GPIO_ACTIVE_HIGH>, <&gpio 35 GPIO_ACTIVE_HIGH>,
+                     <&gpio 36 GPIO_ACTIVE_HIGH>, <&gpio 37 GPIO_ACTIVE_HIGH>,
+                     <&gpio 38 GPIO_ACTIVE_HIGH>, <&gpio 39 GPIO_ACTIVE_HIGH>;
+
+        nvidia,init-sequence = <0x0000002c 0x0 0x0 0x00005000>;
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
-- 
2.53.0

