Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79443603DA
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607443; cv=none; b=he2Y/m355MTekQHvQAizkEweWJcON45qzyx1FaCwYYGUJxsAGb7qBY+JQXT1WNA0LA/R3mPk5sK/h7mTZQUabN8ybgfRgt5t2OE99pv05BO57Y8PhXSOB+4bsKoBM78vKn+B6V1ltcAzymRh/kloKsmeme1DlOA+KaZnCvyA0V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607443; c=relaxed/simple;
	bh=Vy/Robwp1yk51pYC5y/cR8BHhvqDs03bcQq/gsMu6fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oL2VXvBEISD1pNnyuZ1Pl73R9uevVeLdg+HLc1GyryDYXHiBCkQJgSZh16bZQrwCFXjdY2CaP5dDFEsgrPDbG1cMSgekgJpjAvs0Bu1xgTwYnXlkMx93uHgvn01WbHwPFOB4GxUVMQ1f6h7YSJ9wUdM6BSHf2UjG20PGKJiAxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBQTfQSy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBQTfQSy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc84e77e78so7120195ad.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783607441; x=1784212241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1y6DB0OS7718UOoTLlP+do+f8qh1SxQISdYuxypXlc=;
        b=aBQTfQSyyZeN51cnHX90noK7ZXHrQuJlur+Pi/goOWC5tqSAH8lG/SEI8VaJs7SsSs
         7cd9aawDnadYtceGNGSSrhfvaafcSx17DO06AztOo69SvSemG/rLWdjGD1SSW59FRcso
         SROZtRkN9SQDOZE2y16ke+F+0rICgNXQCHYWTT3484YD8oDGp6Wt0DT3kGgnQ+ODT2Zm
         j5rcS4pjywIa5V+42An6SSol3lQRX5ZmnccWvS4YgNeOw8gY7BZa+0ES5F2DEkOhby4y
         +CNDMVZs7AaZwOkkw/irxVjuKv4bPdFPco+xxgrfDKoIIjjk++yLg0eeM+LX9YKwfxe7
         2YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607441; x=1784212241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1y6DB0OS7718UOoTLlP+do+f8qh1SxQISdYuxypXlc=;
        b=lsbWKDwCI0Rb6QIag40OUA9vW6LkUhwhd4IqzobWfCcD6ga02iT2IX4IgkyItQg21a
         Ew8jKetNjwpsnfCR6RsoXk44wwFa2kPXhjPPs70kZnbYqOMwfJsA16De9KhirF1Msyu2
         bdX545jAqWahiv2xoAzvLSrnKMt32HjImdRe1mn12WKIhqXxvRCKUOKvcRuhjRlFS/DE
         doBhmRt0POaTS0n9BFAo2nOKEZRqLsmnnPSVZvkETpYDh35GYdlvpCtHed+fzMHeVzTE
         nFAtfEd01tmUWAEWGpG+W0SUotCu9bZ9tRe5FwCxue2RrObQfYVZBAq6e0xzbOOJYF3a
         xuww==
X-Forwarded-Encrypted: i=1; AHgh+RqirXJesTg+GAhVo5g1MxqOjbFGqp02KD3g5gN8zGiG4WWQO1GdbjCtmyVykIB8KcbNnL1h3X0IkUm8@vger.kernel.org
X-Gm-Message-State: AOJu0YwgBLUFfZumEJl1VKAtD9Dm57Gk1qFJxm62H1sSM/sn1jwZtJ6b
	sK5wrF6J/JXiHuyaM/hM6n1ps+lLv3sFA8zpFVIBBCYpdFO6n0OJQJog
X-Gm-Gg: AfdE7cldn9oVicZekCjUFmPen9amjW7JquZ6SNFbQ/JzkJtjXy0OzsoO1eESHJcLDfb
	3d7PeeTLKNP3qBV6lOOPr+VaXB9HJvdvl1IhYiXPUGOQBSqq7kcrSq6L62abf6cafuCYHZOIc55
	3bVAMW0d9UjIbsValoJSxR7UTBmz/D6zcjk6yl22Fc4k0iNlgcrMX/4ICK/T2wxMp/dfTiM9M0L
	ENisW9Mb1A1xHJrxHZwcWX8dYH1DKIsu4D2GFSqBreZPodqzxdvqbSX2sFc8c3p+p5l8AuDUT8o
	EyJJE3UuW/+vP03EMbg58vpPWGJ13iXH6y5Q7L4E3XC24lyQkU0Gd922eTuvDLoZWh2+QoTkq6s
	tm2p0cEZpOx+HH61iVK3fosm5tY2U8UBPPODoZdgQ7kVxBG8tCfgYv3Q2TDSWpl7vOaowiA2nWd
	cwW38GIuwRWJzkaHYhy4kD9Wsm2GCxm7YLmD9uWjXVjdH+upjQCw==
X-Received: by 2002:a05:6a20:12cf:b0:3bf:d0c8:2aa4 with SMTP id adf61e73a8af0-3c0bcbe7876mr8699043637.8.1783607441044;
        Thu, 09 Jul 2026 07:30:41 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm2009666a12.6.2026.07.09.07.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:30:40 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Novatek NT36536
Date: Thu,  9 Jul 2026 22:28:45 +0800
Message-ID: <20260709142846.12463-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709142846.12463-1-mitltlatltl@gmail.com>
References: <20260709142846.12463-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NT36536 is a driver IC used to drive MIPI-DSI panels. It is found in
LENOVO Legion Y700 Gen4 with a dual-link 10-bit CSOT panel.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v3:
No changes.
v2:
- Collect tags
- Mention the CSOT PP8807HB1-1 is a dual-link panel (Krzysztof)
---
 .../display/panel/novatek,nt36536.yaml        | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml
new file mode 100644
index 000000000000..0862998cc6ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36536.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36536 based DSI display Panels
+
+maintainers:
+  - Pengyu Luo <mitltlatltl@gmail.com>
+
+description:
+  The Novatek NT36536 is a generic DSI Panel IC used to drive dsi
+  panels. Support video mode panels from China Star Optoelectronics
+  Technology (CSOT), such as PP8807HB1-1 which is a dual-link 10-bit
+  panel.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - csot,pp8807hb1-1
+      - const: novatek,nt36536
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O source voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  backlight: true
+  ports: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - reset-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "csot,pp8807hb1-1", "novatek,nt36536";
+            reg = <0>;
+
+            vddio-supply = <&vreg_iovdd_1p8>;
+            reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1{
+                    reg = <1>;
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0

