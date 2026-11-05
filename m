Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887574;
	b=1VyUIDAkrF12G+gtNMqETIVyBVvh4Hkmj1jd5vGGgrVcaWE86GQvj+PHboWSJYGmxwGg
	 Cx+BTHM07BdfmgbgvpseOt3sCXvTjGCG50Id8L2YH15V3CwthW3W7E6GAl8R+InYa98JW
	 mzoUOtZ7Pbr5gLSSdlWETRLySH+l84JM6cbMOPKlQRCGjBjBeRUDFsR+VkMp3ynl8TJ5e
	 cR7N1W1oE2RYyWCbiLNGkYcQMFe1A1LgTLI2+wey2ij+0nHDi/Z/Bc/XiBHki3ZLX4B4+
	 iPROzinw4YTaEYySjYNBiRgvhpw6yrNyxnsxXdbUEH4v/eFTdapWc5Sx5WKTA3Uprzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
	b=k+MSN+BLL62rgzwigX5owwrfGO9AmaAzIzMRp9X1RwPsKFeWm7CTfpI8JrWHz2lcwtBp
	 tnnSWCDRCLBg+Wk+r59AeHVT/LOcn8zxTYeKFek4+iuvpN0AExX02TTULeBymnOXOPFob
	 2ii+1BFgwSElIqHF7wda7JTp5BcadwGwMrky53Yg4+7HKZsi4gDYDZvWYaijpgQO4UzI9
	 1/E/keHNWhoIsghI9otCBC2K77OCKvW6RQSU+DNt6HzEYi2U4Y41cIB6E8YQ/CR5KyoNG
	 2j4+y0tMBtYn9TAFQ7bVCMy6951SnmeatvpI/KZe8PC0faLgKm3hnaEIIaZDVZgWXoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BF7EnJZW;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0274F606D83A
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0274F606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BF7EnJZW
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490d59c3edaso507904f8f.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887572; x=1794492372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=BF7EnJZWrDDMVMnvLvvW9/COpFbIB5VTaQZysOkiaudeopmGXy+tvSljlUNx5lDBHT
         +pqBPFzc7BqsAjj/CPhZZh7mRx7thAe4DiAAVJWReMuCIXgyrplxT3N4q6kCUuN6isgN
         XPmxG3PAUfpJ/IHTbWH6+5WNonERMZ12AVbRVYBby9PEho4Jvr6fuJ/UWdMIxiyJ6lHT
         p+aRHaIpJzR/d5/0ucQTQLYGAvlg8nkQCHM7rsbZEZFxoqbjKLQLMfNlK3RF7+99hjDo
         u6iga+s5+r00nCi6LQBiVy7fhbgpmP5K/OvNkZQlO8XB210pckUK+VP3r68Tz9vxHseh
         8OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887572; x=1794492372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3S01xD4JAgzzx2hQLx/xQm0YodbZuGxyyLtCeJj7JK4=;
        b=R8vBicy7LXH2d3CHoKvBUDW6avaEBC3xj2MhSrx1cJNS2XMygCRJBOwVigJaqo/zkx
         ULFU7oueGG/cAT356BuWf/163rRYY03xd4MrceJjG6zE0HG1AMHgQ55nAJyH7/s5wlVU
         ruhKHgToSmYenu5RjuE6fqrfwjnydRb+mAAN3OPU+A/9lo+qFlsZcCs3afnTnYQMb1Ex
         r0V57K7UCmeDX4OkUb9aZQ9TkI6kMrZkGnC5juSz/7khhWgi3QblwUICjg39q504DveZ
         ql71Ai2/mbn4aoTBgyjZAI5pIgwl1nVyUPbGayHq9WW5edtJIlFWH8hCGYDoLclBbAfn
         FejA==
X-Forwarded-Encrypted: i=1; AKwUvBwhAnkvCpAwqzhMhkIX1i4AAG8wZeGKz+BGO1opi5hVdLAFh+sQu3Wl3jeeC2vW6xdit2rxpXgNSjGH@vger.kernel.org
X-Gm-Message-State: APuU4Z9vvuMiz5PO+XZRNbCAKk3V98x8llQolZZID+9uLgJ2bKopJGV2
	L5SnMlKWwqkBCxGPWe+UlBXEQykiZ0scMbJKJ6BBXe93wJNBdBnOdP9I
X-Gm-Gg: AYBFou0DQsHHmKX9bgiBPkjPTw5xwb3/h09mg1NKAXg7/dgb6mQpNrpbR/pMYRX7/B3
	mL9eO/jkqMhm13Q7tmQu1VMu56GlS6lpssIkjfMpQm1Pwd33iJrrv5CDxy5aoRfL13gTJLiHuEw
	ndXS3xaOhSFkL/Avv8fX0TNBnqOkd7gf9Gpe/5Sarp0GFWg5nH54WfU5m96PR7dn0NqzUUo6yqK
	poS++bQLVDpBkPlJjKeN9BtuNg6AI85LRkWvnBeAgqDYoJC11LRs9ZOBpRH9CQ15EeZKKGO6Sjr
	QmvkHgeNng5M7zqgdZ5MomK4PG1ggowrviZzqhtmc8C1NZ+jQgtdClsdzKVCY1U4N4MglGm0MmW
	iZsFNgroeiKXvbSTW2UYZmA5hIKJeYXGSzYKXT05fOokpWEWqOSDh0eAqoyklTuuCMiIb3xyjaQ
	I/jQPfiffEhXtci2NIyQoDoOmIjhl+keGLUeW4sWgTSMJEVwifRWblwMYJ2PGtkvZot/69iR98t
	xsCVHSn1fOJgFwRTTrGGgQdYlkMTYnyENtNxj0U/BKcxX8zOfZQCTWtptVoi7uEN5XZ175wJg+g
	2UZ54mBpozlZGJ7uI6HgMKGAiaRXoBgHeneu150EMv/VoAYtXXjO6BXpLse4qb+6JMiJgsw=
X-Received: by 2002:a05:6000:3c7:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-4911906d185mr4750001f8f.6.1793887572221;
        Thu, 05 Nov 2026 06:06:12 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:10 -0800 (PST)
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
Subject: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Thu,  5 Nov 2026 16:05:09 +0200
Message-ID: <20261105140510.165165-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
new file mode 100644
index 0000000000000..cd568d19c363a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
@@ -0,0 +1,113 @@
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
+  reg:
+    maximum: 1
+    description: DBI interface used 0 - primary, 1 - secondary.
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
+  - reg
+  - panel
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dc@54200000 {
+        reg = <0x54200000 0x00040000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dbi@0 {
+            reg = <0>;
+
+            panel {
+                compatible = "hit,tx10d07vm0baa";
+
+                reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+                avci-supply = <&vcc_2v8_lcd>;
+                iovcc-supply = <&iovcc_1v8_lcd>;
+
+                backlight = <&backlight>;
+
+                port {
+                    panel_input: endpoint {
+                        remote-endpoint = <&bridge_output>;
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_input: endpoint {
+                        remote-endpoint = <&dpi_output>;
+                        bus-width = <24>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_output: endpoint {
+                        remote-endpoint = <&panel_input>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd5627..ffeb124905dbf 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -79,6 +79,16 @@ properties:
   rgb:
     type: object
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^dbi@[0-1]$":
+    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
+
 allOf:
   - if:
       properties:
@@ -155,6 +165,18 @@ allOf:
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
+      patternProperties:
+        "^dbi@[0-1]$": false
+
 additionalProperties: false
 
 required:
-- 
2.53.0

