Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675425;
	b=qk7VSigw9a11h9h648zBPqwLFwK518wwHSSfNs5lf1YBRpb1eLWQOpSHlEKXda8YgIvT
	 zpxGplTmdbmcA9LIioTLBVveBYJHVpa7MnDdTZSC5uKKtEKokJUnLtLgqDgzl/UAprqoP
	 hpk7CsP62HwjC6nTsy7rf6XONb/MxtqBXywoJ4OsDNo9rmWYictAMQJEEbMoyggCuw8Yd
	 sZcoxeQDv1o48byhwTWafYuM8oEMAZ+JEYqB9mImlt0QivInjMhePQtmaDaKPzUouYywb
	 JHxix0bxJHCFETaULGa2xRgKAG8TK/zLHJ17l7O9ZH9WRQaQQwoWpMyaCEo0pD8hjEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6BEc3XMlABHl329Fy0hgFM4B7kKL6YNMCLfGD4LbgGM=;
	b=sYsQCSTR0F2sNe6EGVid2NM+A4uxsd3yVjf/tBC1dXunlNTw3nU4Z1WaX03zAVQMiAyg
	 rwWnHzIuPVBzfwp9jS9shm+i8oeNTZ9kHSCLpQb4/tvqbyazbBorS12E8M/NUEKJODnLS
	 sqOpeLV4cnNqqV/2YrxESqiW12rL6SRXJgw6fSAjpGTXGSTJ529W5q3tkCQUBXRzbzXlF
	 i90Lf0LHlN8u0Va6lRqmbT8nZ1f9ehOFQMrRXhWTpw3BwbyhHCjHKt4B4F7VSaZKIghyU
	 iLxPdncVwB89IKENU7m8FtpqQ3cvD9RalPSZi3n7/0GBy+8UGW60gdAM30EcJ7LQkUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UhGW89rS;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023DF606A33A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 023DF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UhGW89rS
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so2162532a12.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675423; x=1793280223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BEc3XMlABHl329Fy0hgFM4B7kKL6YNMCLfGD4LbgGM=;
        b=UhGW89rSt5wB1qy9LY1qNJaX001O7Flm+dSLt2mRohKtX8C7JjBNbkn9pRkhf+5bNU
         e31de51IONzV/T+WkUU9Rxoys965oazEcqspyNuLxwMXMNEAS64N3GgD6msZYiOEYpKn
         enc58RgyPuoBrDHu/7rREvjiVjmGiLXUI7DOSLMjVr7RUD9Air5l6TNwM4/vkzhh4G2c
         jcaiUkTSuOg3GiaszyXdoyOZX1Lk+gv/vl71IL/rYv1f4e3+sR8185OCwgkD4ftu3dW8
         olhwYsWUL/nHIxTIrAyMKQZZSo9F01igSsM0Wvq4ZbFChErBSvtcaOIl/NW13fTCpG05
         k+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675423; x=1793280223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6BEc3XMlABHl329Fy0hgFM4B7kKL6YNMCLfGD4LbgGM=;
        b=a8PK1QPuSn7GZn58WzeXdkaCf5qE1/pxQLgRu3d21I8UwOG2cCFITPkTzrbM/R2Vnl
         Y3RVNeOtQRstwroZGoKlaQnlY18ALbwpRQ9QO2bcuJDrHMZG5PME/962Y2lLJIpiP2sa
         I930NJibC6RlQCOlq6kRVQYy0hs9AEfPsXeGyg8TVagFlD8jJ5+FZHz/+QfnS+Iy9YIE
         AcUxwew0EKBtnEQqjvcWdA50Zd0xHEkSsFQRxtbLU7bGI5lmqkmeQCCQXHDXZyRSjryG
         Zt4XVTV8iw4tHO6qnSJQHNfsRbHdo1aZl0FvrrBFY6roFUaC9kWh1BzpW7Jaj0U7I0ZN
         /q1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQ+fnskFCbxH3uWj9pqklQ+9yJMGY+z7/brqtrwRwIBOHeTsQ3OBmnPlFfy4CVhAYl9YYUZEud1U9S@vger.kernel.org
X-Gm-Message-State: AFq9FYLxZndbypffcXpXR7oysZl4BhiqQ0wilgc9LzLBnPW/L7b72qHw
	tz/MrjmmPe9mfG4u9p1Fkl7TKMWp3Vn4yFXOPp/emna97xJ6ea37lGJH
X-Gm-Gg: AYBFou1xSwWx1qpimUP4qEguLXLBTj59/iJk44weae5RGrPUK1BgPbojebRdz/6Rv3A
	HmD9vIpyNG8zmlBGw1Kzd5bglfSELy2HQz+JKa6tWxYVa1213QUB+0UIdfRMvJgskzjwm8UbXlX
	MJlMxtFnlCxVN5zW1S2ERxOP9u6Z3Uh7jbdBMQ5er5olR4hqLR31fj/261gdk560iHeibbAN+xG
	6iwdXtl1RqfEshYTrB5L1lXIpdhle/p9+Cn2NNr9jjK28gsryy9LGz0CpRxBL/zKpF+1WrWN2OS
	SU+yVcTtVWICI9EH/4RJh0gEbMJOlTldHX/LIU/uiWClpVR91KFsx6GN0KmM5w8tli+sc1l4p+Y
	L/LNkaq5C/zmz1nd4J8yffnrmckkSyByyD2eBqImvh6iG9ldeESdS5APvDIH+CkxvdnNZkFW+oj
	UZFFZjm9pTtFpOqMf1SuT4hmUSLk6o3/JGJ15bpW4H+OBrU28yNoVL93HNfI/iAzEVkAOcs3/JP
	nTCIpkMXOBlZ8aG7tzSDxxK1pxB/K5VFY49CyQxa3t50sbf3oE3j5GpcPs7XMyHU9QQt8YoJlEi
	NAowAriE8zp8QkFk2mFdIQ==
X-Received: by 2002:a05:6402:2b88:b0:6ac:b013:8648 with SMTP id 4fb4d7f45d1cf-6b408ee9375mr5181594a12.35.1792675423238;
        Thu, 22 Oct 2026 06:23:43 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:42 -0700 (PDT)
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
Subject: [PATCH v4 6/7] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Thu, 22 Oct 2026 16:22:58 +0300
Message-ID: <20261022132259.240717-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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
index 0000000000000..6b4fd20c5817c
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
+  nvidia,index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of DBI interface used 0 - primary, 1 - secondary. If
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
+        nvidia,index = <0>;
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

