Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBCB4C042B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403854; cv=none; b=kIzDW+mvsknYEILLqNPFtJQcmAASfuZ2/0HZArbFpSUBBesjlX2fx+u4+fBqgXV5kX/gRf0XPT8Dc+u24qLO6pQ03MnqY3ihl/LBrzL5owAZPejdxNFZBddrrMOT5hQ0+SIyU21XrM14c7nDuvbbMZBq2fqUPC5U+Xx8SZjGRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403854; c=relaxed/simple;
	bh=DoVzbYZhKg/nfi+sdH5pzhfcQzW780wRFKK6MhQOPZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQ9dAaBurDeFQcw5JxJGNm2tHeGKzNonsmQ144uZ6hUI645DncESFmpbBzuuxrokvd0RyF7XyKDxEj1kQe0mhC49VZrvpfkVfwuf02c8+UdKcwB8UrrxKk1VnzuXAy6bgMDhOqVeB+sRPi6wqdP+M9O/4kcuhNeQ9ZEwPVxwiqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnpRyPUI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnpRyPUI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1375250f8f.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403850; x=1793008650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBTLKDknRyoiYDKLKvNdQPQPMYptAQUNMVhu1Fol0ak=;
        b=DnpRyPUIcWJr/ly+ATJVLsqXmZJdI2/ci6KiGeF9gduvMTgmIpAF3f7aypnWFrLMVw
         HPaZLaT3Hg2Tlx4nqHkfDQlV3b5W2Ljsu43yZGUYvDq+piQqO4MW8L8DeVB8frFXu36y
         E9XwbJy9xpvCLPYqa0mFle2jzFeGmfex8pJsSyYgw3fDPKzdGK22VOw6KBHwz/4q4ZMF
         VqY/tbjI/bNIf8Pveo2U3MoJWEVCbNzkNjanVtgIA8vGiA5tlfjWrwu4CfB+RoM9bbvB
         ygjSeDmRbDmuvOjv8h8nTgGkIBrSYmW6Y3+UfqEKUf11w4kTdBT/kqCpZp0isxyklOPs
         FPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403850; x=1793008650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBTLKDknRyoiYDKLKvNdQPQPMYptAQUNMVhu1Fol0ak=;
        b=hqvRBO3wNUdRxaZiHihXT1Hsdc/F7hPPws5CksaMnuu75WU61fgS7LJSu7Al4xSO0l
         33oCF9xJsXJAEcfvivsnhs456nKk+SKAyq9ivPhoeO3tW5KkPqtssnkLRjRdeWDH9jgE
         zqm4TilDu0WxFvQd5kebyag2awM0v3UOr68nOgAwVUe4lGpR6+A08KbbFRaN+HbmvTd1
         nyrBXZs0kTjHaLiioHOPWOOZjNX9m7a6eKFSayqhoJjlFk7F4FAvpqxKPzoJOQkXB7ex
         l33mALQN1Ffi0jogCWz9PP2tlW6f58DjuTOX43EVIRtGKwsTDUvJxCADZFdK4Nwsxt9k
         4/UA==
X-Forwarded-Encrypted: i=1; AKwUvBytD4s8Cj0J+a0XP6j/aJotuR5XmQzzzyqwGykdDPdn0kTciQQBlUFfoom7SfFcRlmacM6zJxkyTJsu@vger.kernel.org
X-Gm-Message-State: AFq9FYJxVxOKTWfrwUmMh3K6/fxEZnCg8mlLAsBp4GP2GehCcUsyb4PZ
	22NJGqTqNQyCV18tEag8xLLzvmCJskK3noAyWFpucRANPLqO+C/AfpjD
X-Gm-Gg: AYBFou18cCtXWN38Rar83jgXv1lgYo8rAg/yaL3KI3GL4OoEhSwoGFbDb2ecxrTFhYP
	i+rOqrJ+Mdf+ntg7jMM+5j9oFYa3FBQblHh2ean7wL6hP3sYLdXwFYUwIdM7Ym7l6o3+EkGiwtH
	G3qKoOA3oCr+cSwhk2SvUCG2CBApGrkcGmvfQecM7psqIvhriApnLWc3P4FdikiPTkWgmwlRwq8
	A3+kU2P7VZLihHmEhtC48DmTl9f7NLHafTnmc30NpWLgIudLTBRrNo/ovQZYAlgAaG8Oz+WSJn7
	0jKltLlH8H0yKJNpSdNTXys+PeYqqvT7/wGs0yTM/CtaAAhj5n/QxsFs0y03NRCsy/JrdjDRf1B
	jmjk2LHecyiIENmZbFfQg7vVNTerB1J+Y35D+zJp3i+7/3bWvzKY7l8XypDgd9dfb0yFaoOJFt/
	AAsU+OdoYNkq7+ZXoGG47+8HgGt16epvTbQgRHj3JO5w6hnsT/qhNCkOECKdZ3Q7iIFJ7y0l9Sj
	1Red2u4u51QLc1gacc=
X-Received: by 2002:a05:6000:468d:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-48e07bab949mr9616378f8f.8.1792403850324;
        Mon, 19 Oct 2026 02:57:30 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:28 -0700 (PDT)
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
Subject: [PATCH v3 3/7] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Mon, 19 Oct 2026 12:57:01 +0300
Message-ID: <20261019095705.91062-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019095705.91062-1-clamor95@gmail.com>
References: <20261019095705.91062-1-clamor95@gmail.com>
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
 .../display/tegra/nvidia,tegra-dbi.yaml       | 138 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 ++
 2 files changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
new file mode 100644
index 0000000000000..ada7b35778933
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-dbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra DC based MIPI DBI Type B interface
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
+    description:
+      Device specific set of values used in DC DISP_SPI_INIT_SEQ registers.
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
+  - dc-gpios
+  - rw-gpios
+  - cs-gpios
+  - data-gpios
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
index 69be95afd5627..a2b7279a17930 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -76,6 +76,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: A list of phandles of outputs that this display controller can drive.
 
+  dbi:
+    $ref: /schemas/display/tegra/nvidia,tegra-dbi.yaml#
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

