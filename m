Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547911;
	b=Ldqx9ylhl7b/RtIwsmCDCxv+H/oL8TsRC4GrWeo1oGRH/gDUzgwUKjiWxsSIBGZqd8uH
	 ToliyXMRv2AFKygPkGw0MTAbGcpTE9FH4zrFIWBFHgfsxMomtyQA2UzWFkRUU0UIxm7X/
	 AGiTQl13SEMm/Ocfp/7YMlTGWMZzfMUCJOqHLggYfbfmCvT6jwBBtcQp08P5uQf3No0v4
	 9nK06ToDPFxFudcM054z9af6ioPiU7T4rNfjYyKsbjd24FdOFmWsD6kdHSdFgaSmOezwY
	 xF8bQcQ+YenBBA9Dz3cGpvH9+zQjjpY7atJJa6zIL+FCEbuBng0JywEr9T8j/kgjCJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5SuSwraB3A2rJ+eef524bz9/G9zBRh88zfM0uLgHn3k=;
	b=msrp9YOH/+JxL47/Fk3YGiw85XTluhb4YWn1qMzSaUMTBfCHzR8ArHcX320hYPgcjDNV
	 iCcR7egxgCK3pqb0lYB1JT1sVNSZff1S0qlOlOj69fehds+GGrHszITu+Sc9n+BQ7Y2TN
	 nBx4kpA+OqmXGLk/bENLBQHey95y72zDjv29iRDDnIe3MSWpCLigG+mBsa1uR/CuAs3QI
	 JIlufMio/235IpwPVoOPt25f02QpAPjA8GHVt7wsdNWCT3a4wmvN22O/V4gSlTBaHN/W3
	 Z9UCyAZrLGu4SSerJGxzoA/0qKLNVhn9KfaeHDWbVs07lcrTgEQ/xio4H/NnM96owvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I2HQqWAf;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53454606A330
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53454606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I2HQqWAf
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso47404635e9.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547910; x=1796152710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SuSwraB3A2rJ+eef524bz9/G9zBRh88zfM0uLgHn3k=;
        b=I2HQqWAfx7S9GTpnCcxlu/WUilsFiXklQpKhZJZmJvaQZuty4xFWI8aLxuVUu75O6d
         BWkcZv2O/4vlTpEKy36Pnufnp0v41bUTvmYXZ3mkgnNiBuQZ7tLa/lbVpeu6oBO0qfEU
         iMc6rMXzy9+3mRX3oxu9di7hIrdjIDDVlFxPXClxIDMZ/fmfh0/o26RT6R0CjgpVRT5x
         +Tf+fk1Py53TsQs1GhbIp85PwXzYQ28ntA8iEELbzXNF3n7YbjowP7yuhl8dxPHWzDD6
         sSCbvuO6SBpnngmIkyB3f4NfBOgyY4rhlB0bZwdlMQzbaXx3ruOGmwodUdZUZ34gHqCK
         UBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547910; x=1796152710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SuSwraB3A2rJ+eef524bz9/G9zBRh88zfM0uLgHn3k=;
        b=qw7wqNo9zKMtvfZw58qtdMX7m6tDl5jNZkGINE1VEOPM7/6HvQFmhF3YDAtUyMIod3
         Ot2QlY4aTkQm46nN0ksvI5FyNas3mqGgG6JOq3VGf3xzyKRNFM5S9DrGRPp8wihQdcW+
         dL4riaAfGIlzezymGeKL9sqPEdq1JN5E12udc50GL+WQdAa9TasHJhErD82+kQTQXlac
         8o3sm+21emwi1y04UXNBtT/92JC/8ghx4q1Kkjj06LU/IPvdQU8KMJAtXR5O9hmOta8q
         BKRtA/28M1Kt1LAMOoMZbLDha+RNpCqWobhL+2Xbw1oR4+oLiKjp4Zr/rU1oCWXLztln
         q0hQ==
X-Forwarded-Encrypted: i=1; AL+hErHVJZ+30THhuAulJJKES9e2ARNX1i9xktzeezmzHbw0b3O+Tg0RV2DoDns1RHOe9eJnN1qgFZ4kToU9@vger.kernel.org
X-Gm-Message-State: APuU4Z/O3q6HKpI0BsXBzwpithk4WFsDzYduu2HB2yo4oygfDjoB/6XI
	DkJ/D6GFlTbRCcBD4n4IuG8nu+CHBPIGw/41zMKniFf90K0LzyOpfng=
X-Gm-Gg: AZFdTZcgUTeuTCtIETbd/uWWOoDE6JWfZ31xNaHEnBFt278JJ+eDUIodzDD/rRfpHyg
	iTnmzvwvnAJ4U3eowTzIC64ZAHDA5fQBbPnxO5DogQVTFkCMCoz3A4fWemrQ5gVXQZ5SOfNtayn
	JkT6MCJ1ZCnV2zPTRbQc4BgUqjkEdatRDEoQwNqFT2KTa6PU2m9v/1AhjP/qVL0ZjeqTm6TPzrz
	fEKL6AFKR7DBykakZkGrSU2a0arECbeqOILCNlVnJy03MJl3pjuwMC4N5RK8TrqWEyO4qrcA1Hg
	RASzzqxQSVfX3AxgViM0SeKSHciraXNES1bwSGzP4HfXjfI77hK+yjLLVXA3bRCZ0ioNGYPorFh
	nCxwaH8FhmXIqwprs+qXmDiuZeKPrxdVo0BVz+SHzy9VTLk59RSuyddFdYrmv3/GXrdxpQr4tP+
	AcH6I0mMPjAuCxlUMgQxQ/glBxcw0ndpFuJ0QhF/Gqc5jnCsRA64fmvTU6WkHPOQX8pZQZQrfSC
	WIsm9dUcFs8lf6L9Tmvq17N0DFsPnbMzJX/qyk3rTqgZ/9TW/sIH24CEeiLdCtaNu5J6lPgYazA
	xwOwIt93ara2D7MpBL8jVIcy4eLNWn4Lt8XtcCPNVZ9YINtRGevkn9LLCeZJUdLSjbQdiOQzlRo
	=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6fd3:5ac0 with SMTP id 5b1f17b1804b1-4bb88816c7emr344773725e9.28.1795547909651;
        Tue, 24 Nov 2026 11:18:29 -0800 (PST)
Received: from localhost.localdomain ([93.145.31.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm463320985e9.15.2026.11.24.11.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:18:29 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: bridge: Add Lontium LT9721 HDMI to eDP bridge
Date: Tue, 24 Nov 2026 20:18:02 +0100
Message-Id: <20261124191803.283266-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261124191803.283266-1-gianfranco.mariotti94@gmail.com>
References: <20261124191803.283266-1-gianfranco.mariotti94@gmail.com>
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

Document the Lontium LT9721 HDMI 1.4 to 1/2/4-lane eDP 1.4 bridge
device tree binding, including power supplies, reset GPIO, OF graph
input/output endpoints with lane/polarity remapping, and the DP AUX bus.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 .../display/bridge/lontium,lt9721.yaml        | 169 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml
new file mode 100644
index 0000000000000..88c5c75c0d49c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt9721.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT9721 HDMI 1.4 to eDP 1.4 Bridge
+
+maintainers:
+  - Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
+
+description:
+  The Lontium LT9721 is a bridge device that converts an HDMI 1.4 input
+  (up to 3.4 Gbps/lane) to a 1-, 2-, or 4-lane eDP 1.4 output (1.62 Gbps
+  RBR or 2.7 Gbps HBR per lane), controlled over I2C.
+
+properties:
+  compatible:
+    const: lontium,lt9721
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low GPIO connected to the RST_N pin.
+
+  vcc-supply:
+    description: Regulator for 3.3V analog and I/O power (VCC33_RX, VCC33_TX).
+
+  vdd-supply:
+    description: Regulator for 1.8V analog and core power (VCC18_RX, VCC18_TX, VDD).
+
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: HDMI 1.4 input port.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              lane-polarities:
+                minItems: 4
+                maxItems: 4
+                items:
+                  enum: [0, 1]
+                description:
+                  TMDS pair P/N polarity inversion for clock and data lanes.
+                  The LT9721 applies P/N inversion globally across all four
+                  TMDS pairs, so all entries must match.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: eDP 1.4 output port.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                oneOf:
+                  - minItems: 1
+                    maxItems: 1
+                    items:
+                      enum: [0, 1, 2, 3]
+                  - minItems: 2
+                    maxItems: 2
+                    uniqueItems: true
+                    items:
+                      enum: [0, 1, 2, 3]
+                  - minItems: 4
+                    maxItems: 4
+                    uniqueItems: true
+                    items:
+                      enum: [0, 1, 2, 3]
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 4
+                items:
+                  enum: [0, 1]
+
+            dependencies:
+              lane-polarities: [data-lanes]
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+  - vdd-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@33 {
+            compatible = "lontium,lt9721";
+            reg = <0x33>;
+            reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+            vcc-supply = <&reg_3v3>;
+            vdd-supply = <&reg_1v8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    lt9721_in: endpoint {
+                        remote-endpoint = <&hdmi_out>;
+                        lane-polarities = <1 1 1 1>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    lt9721_out: endpoint {
+                        remote-endpoint = <&edp_panel_in>;
+                        data-lanes = <0 1>;
+                    };
+                };
+            };
+
+            aux-bus {
+                panel {
+                    compatible = "edp-panel";
+                    power-supply = <&reg_panel_3v3>;
+                    backlight = <&backlight>;
+                    no-hpd;
+
+                    port {
+                        edp_panel_in: endpoint {
+                            remote-endpoint = <&lt9721_out>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c00d3612c9acf..707cd862d4fc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15790,6 +15790,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
 F:	drivers/gpu/drm/bridge/lontium-lt8912b.c
 
+LONTIUM LT9721 HDMI TO EDP BRIDGE
+M:	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/lontium,lt9721.yaml
+
 LOONGARCH
 M:	Huacai Chen <chenhuacai@kernel.org>
 R:	WANG Xuerui <kernel@xen0n.name>
-- 
2.25.1

