Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841857;
	b=nhk0lb3dhucndy33CO69gX41dkP5uh3QFVTvq6dCuWLZgAbVCaCkKx+IrUJBt5v/DcBZ
	 58OYy+2Cb3bZ8xtrmXqbcMEPbCWB+dnJtcY4xeQ0Aq7XDDxJH8dsCYOaKttHvpu877Sc4
	 F5UNa7ZRoSp39MaIG8Ff7hZalrtd65/AoadlmquDIQXHYxc5XU792y94rY53Fxoea9Njl
	 g9dvQtzwZg1xZ+WedvTeXLGn4zqJ9BiQ2oFbhja8D+yS2BoZjeAmmu+GbNAKwuWt0mkak
	 C0sV8uI6GllpYHsCAOzpzGtfMz6ZcwgNMulEpTZTBnCk0dEQ5ojIRm/LuevwMg5d8yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
	b=OYAzq8LsHlEjWpep0zBq5Jm2bzHKBVv4x+6nOnWN4DxXlokVE9uATL0P8LWmuN/xDq/I
	 ja6vA0E0gHJa5EZyt7mTuVrvcDlZIZhVJ4Dwmgs7LRpKUw+7MTed7BuYBBiED1PQMmHfd
	 eiDLDibUSaKlQLy6Z7ZOZ1THZfKP5sDTSOfsNfk7lkjoiOMyQ3NN+pAHTwezlXLlq+Sh2
	 T/tLGtO504Eo3McIP5b3y/YlejkqKII76ps9bR9vbGgGQP3GKoMpbqp6xAcAVxPpInJCp
	 SdqdEYf2/QsCOPmJnrRlXTkutgYC/ALpDJKEVQmFprMN5hSAdNRGBcj6QAutvdM1uyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwkv+RtD;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF73606A334
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF73606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwkv+RtD
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so337051366b.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841855; x=1795446655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=mwkv+RtDSuotE+NF47KVp3efHuF3DBRZQPS6kPQjSTVJbutdaYNFOo8NgD5HzA4hiy
         5+AFm3LX0856KhyzdO45jVxPhwN7dbxMkQh3QyH6+8QYRC+FWIW3Y3g1yLJ5kkEy14sP
         eN+a2v5E/SRrYIHrRZbkRSGf0TRiqnjm+KkJPheXy6czfoBoXlLtFnzxae+OmgprZ6ZA
         7xRoQiQIUIPCPmiOUv5jmDJcKgGezKiFZWVoJfbmLhUCjGuhRoCDfnnaRIcAvwAbHDOu
         Hgk9oXEPT0WJPE2VusOJr9b0ElrpcPAeUSBB1/46HOyKL59oGtuoo9tRg3azXvbj2Cju
         LUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841855; x=1795446655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1z7RmYK1NjDMEO9+xJDI+w73bgLEkLKZ4jmIOyAvUDw=;
        b=iQTJaH8TInPHJyT0PJGabLOeD4cZdPggCGnMq1tUfsEwwk34cKMoCwUtNijxe8Htta
         dCpROkrL3Ps61k8eo+8UrdbifwXhKxd9RxUdx3slk+ppt+VYQ8z2cVrCUWoPpsE5BO82
         0eXgPXjc+LjVb851d122mRbrF8gwMGLT2Dy1QQR5iIwqoCrlPiRnsy7PXPf96upHDyVd
         cFPYq9yghBoMaKOoEivD2p2nQiQsJzcbooD3o5GowjTN9EoJtUgKz3BE1WZB0rxvUWLY
         PdiSmQTElpjG2wbnKI0NOD6MaNXefXjTsSSrwzptPphtJkmwsFL/H5SAtq3m62dlwmP0
         vaAw==
X-Forwarded-Encrypted: i=1; AL+hErHwt5TwSrH3j2G14mxtcFtU4pVaTxvk12DXIgDAYI4TBITz1RoIdKZsJhwk3GpL5VlHIxlyr6iTuTDK@vger.kernel.org
X-Gm-Message-State: APuU4Z+7WB4NvUd+V1HAYkArclU5aB4irKZrWEqjnnu+yBDPxmAIwu4e
	FPNqw5fjogCDNSSzFZm1AOFp0CRZ7kNlmQXsCYx7CNE3EzeOGU+JkFun
X-Gm-Gg: AYBFou0ZS5IZDOcllwxo7lsH6in7OEp7nS8SUUE7lRGXFHJjpcqp1kHsjOudkWQwlt5
	xFdWJfzEJR2R1frlixl+Cn4zLoDTDn7pvWm2tXYW6drESAc6+Jo06wKKULwK1Ax4i5Omt82O6Cg
	BhqqY+7Mmw7DAlZr+pZIWECW6J0adiQXCkry7rf9WB488eGnR2/ZLtne9ULz2y4tJIfIhRncw2u
	Bczv6mIx5QAWYZrN8Az4bAOodW+JCfZ1ljoNM6i9md1mcDmSIjUzQvZpjeXCatx0u6wawUjPVlB
	yV1X0iXEqVGmCQ8tkkyReKqmA/npKav9vSYyvIB9IM/NO+1fu6qiFOmNJxRYc5NjsCHG8Y8rLbs
	BhcaAJptuCm0h69PrAJOSHEjVVg+I6EiYBvgaRWTQA8D6yrHO+u6bhPvRDOkfEP781abJWTm8q9
	jxGKyWQ4QmeNTLXk4jKw4297bIn/Br514iywjSeFhQ7L+NGLXVIGSrW5sY2iwgrONwkv0K/aH7o
	HXDi5KQ4sW7LZzIWY7V4OFSHErUTO9qR7VM2ZBbKZxOBAfroVSKi+ylPkW0UgopbBFJJksFhpom
	aHYqbVwKVXnMMJr6CoUCdR57hmT0duucaMzlF/NNP/XoGNIxqe6a9QOb8Rs/QGKRKTFtedWweS/
	kr7k4ug7Thg==
X-Received: by 2002:a17:907:9612:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c50963fe3dcmr895394166b.36.1794841855283;
        Mon, 16 Nov 2026 07:10:55 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:53 -0800 (PST)
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
Subject: [PATCH v7 11/12] dt-bindings: display: tegra: Document 8-bit CPU parallel interface
Date: Mon, 16 Nov 2026 17:10:16 +0200
Message-ID: <20261116151017.274764-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

