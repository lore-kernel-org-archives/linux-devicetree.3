Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA0401A00
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403392; cv=none; b=VVVBr4WfyYcoJ73SYJMunwKx0yhWAVApTsQOHvI+9TcYZVj7Eavy3XEIDiK2VLrA0cIaAtoiBY5Gz1g9E09elfBhGSbiU/oEblzLsYYpqhDXmxM1w0sepV7XbCV0wIVQ0bgoHvGiLms5nT+hb6DjdnoCaOQFSLg4USQ5H4NveAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403392; c=relaxed/simple;
	bh=zGMk33ptHlq4xCsWE/m/Shh7bJRW3ysBOv42NGnt1mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xlk7tUjvlkCbcBZJqImU3srGm1/CMLGgrrYqnN0CzbTRBVXb0FsFg7pR69ttuwgrEEn9KRmzsepN7Da+6l3HtRa//z5+2Esz1IQP8pe9I9mf4i+RJHxZSZRuEkBLNN7U+ANjoGdriS5Z5LP/z5pjlJ2uLt2Z6NnFrYHT19h14N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXYM1MdG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXYM1MdG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49558ce01afso12640905e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785403389; x=1786008189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51WDwBX8UuHOu3YfsGA9ozMS4JtSAKzLcDeFZmmn9U8=;
        b=gXYM1MdGHGKB8su/sKrTuV1a46AJkb4Yk5TLkmTGg63xpWGRT+8rByYmaYcqxCCTNa
         nuzhC0+ygeKoGNvc9LksCatwInjrdFtHf7rLTPGBoJEvaJEbdJCyRLTV/LxODZJObtu5
         gQVdijSVyH1MaXKI6mWo91jmTpMeefY4m3QvWgxnEcWhuv40UmA3YPRrdis15hQbDKF5
         yA702JW/6713l3HPO9KWApVm92aJVBk2nTF/3fo2QqXnkK7eSb269LGD6wOzwKxgI2ry
         5dYg2DaBAqxS/luv0CUxusgjski+y++4y38Pe0TAv8UIFX8Xdu4NNlgbptTcLMN6w4vy
         xL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403389; x=1786008189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=51WDwBX8UuHOu3YfsGA9ozMS4JtSAKzLcDeFZmmn9U8=;
        b=VZ1U67n1x40EVTq5dOsWzcFJD6G4VC8rnvSDKvYcue5lL5KkMy2PBfBUrrurw4p1bf
         rjUVPlCiGHoU1O6R9y5RrGOO1IM9P8I49mQO5kMirc4zk5s+N+hoLWdpGoL39lcL6AyH
         iviblchepdAJovSsMdVPeqcpeAw0NYYEdj+TLbr8p9eamYwm3vEbr0D4JD+MPukorBj8
         rAC+XgqHYoOFopvcIFaeFFMuOarvLLt1x0OT46bziFXCq0D1aHEhkIpwE4G4r/T+vjcu
         9Q2NOrkEF2AU7VHPmXSQSCY4VhUAyvzYqmW8GqQxchcMur8YtgykSQGWqsqIPwRor9yv
         YgTg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5pyMA2xYXtXS5qpvFNhTbsW4GcQXj27D6/lnbkhlpswTUnV2iKAcFDgjDNiS7BtwmbNiYzMJLB/Kz@vger.kernel.org
X-Gm-Message-State: AOJu0YwfSKF4e0MAEbgaZ1P7CrdDLy7doUFsMnDQ3o+ECnKG22LVs59C
	9r9UHqXj0ikTN71q1rfAMDKGHa+kW2+jcVdvV0uEnXx9g0KtTz8YW/kE
X-Gm-Gg: AR+sD13Sl9bumJSUAGO5dgQg7dq3NVJWwVxInJVcbT9KWBTShgUfmRqDAeHa33Hl45k
	Spm6yUtwOgirzGHptRRcHMcbaejDU276EwJDi4WRBwSG5OuHegMsXiogIRcRLq5AbHBHUEg/xXy
	OMeqvcasqYpDb1ZZOG13BhW4Bwoo9DnNxQ0k1Mhgxtku0g08JeO1rpRO0u+UQHrgDrJBPHGQzNw
	9n6JAZmrhvy9OAKRgjNsniiEl+rXTK4NSsBz3s5Z+QloAfpLZu5IChsl0P9A2HW6MQrEqT0mNAT
	tuq8kO0vkQeknx4R6ogu7WBKAcuAGvYAj8tvRDjd9Kvyaoc6/k2Zir8KBNGcICHK4xt83uhl3Xt
	be8DIaoN4t67vG7WrfCclGn9a8dXzXb25gJSl5+mboEhtXdxmnRaDg4WYglTImvTLowtUK5AwCr
	Wcl8o7uBJ4KklRf8+YOA1qI2TLS5O1/E1sBkni7efMujtaIWcW6ToJlGrnbIGqIRuBXpTcmB+gA
	ZpBSP5APapYPyGsbBk5y7XFYJcqYT3tuA==
X-Received: by 2002:a05:600c:8b66:b0:495:7379:17b1 with SMTP id 5b1f17b1804b1-49800ebb8a2mr21092445e9.30.1785403388303;
        Thu, 30 Jul 2026 02:23:08 -0700 (PDT)
Received: from fedora.tail6d6c39.ts.net ([82.77.79.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fc88e64d5sm4308425f8f.15.2026.07.30.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:23:07 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH 1/2] dt-bindings: display: ti: Convert ti,tpd12s015 to DT schema
Date: Thu, 30 Jul 2026 12:22:44 +0300
Message-ID: <20260730092245.52034-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260730092245.52034-1-egbostina@gmail.com>
References: <20260730092245.52034-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TPD12S015 HDMI level shifter and
ESD protection chip bindings to DT schema.

During the conversion, the following updates were made:
- Added the 'ti,tpd12s016' compatible string, which is used in
  am57xx device trees.
- The 'gpios' property now allows up to 5 items, as the
  omap5-igep0050 device tree routes additional control pins
  beyond the standard 3 documented in the old text file.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../bindings/display/ti/ti,tpd12s015.txt      | 44 -----------
 .../bindings/display/ti/ti,tpd12s015.yaml     | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ti/ti,tpd12s015.txt
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.txt b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.txt
deleted file mode 100644
index 26e6d32e3..000000000
--- a/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-TPD12S015 HDMI level shifter and ESD protection chip
-====================================================
-
-Required properties:
-- compatible: "ti,tpd12s015"
-
-Optional properties:
-- gpios: CT CP HPD, LS OE and HPD gpios
-
-Required nodes:
-- Video port 0 for HDMI input
-- Video port 1 for HDMI output
-
-Example
--------
-
-tpd12s015: encoder@1 {
-	compatible = "ti,tpd12s015";
-
-	gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,	/* 60, CT CP HPD */
-		<&gpio2 9 GPIO_ACTIVE_HIGH>,	/* 41, LS OE */
-		<&gpio2 31 GPIO_ACTIVE_HIGH>;	/* 63, HPD */
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			tpd12s015_in: endpoint@0 {
-				remote-endpoint = <&hdmi_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			tpd12s015_out: endpoint@0 {
-				remote-endpoint = <&hdmi_connector_in>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
new file mode 100644
index 000000000..bda4bbab7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ti/ti,tpd12s015.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPD12S015 HDMI level shifter and ESD protection
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: ti,tpd12s015
+      - items:
+          - const: ti,tpd12s016
+          - const: ti,tpd12s015
+
+  gpios:
+    minItems: 3
+    maxItems: 5
+    description: CT CP HPD, LS OE, HPD, and optional supplementary control gpios
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for HDMI input
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for HDMI output
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
+    encoder {
+        compatible = "ti,tpd12s015";
+
+        gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>, /* 60, CT CP HPD */
+                <&gpio2 9 GPIO_ACTIVE_HIGH>,  /* 41, LS OE */
+                <&gpio2 31 GPIO_ACTIVE_HIGH>; /* 63, HPD */
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                tpd12s015_in: endpoint {
+                    remote-endpoint = <&hdmi_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                tpd12s015_out: endpoint {
+                    remote-endpoint = <&hdmi_connector_in>;
+                };
+            };
+        };
+    };
-- 
2.54.0

