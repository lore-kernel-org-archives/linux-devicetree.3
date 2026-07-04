Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C2613AD1C
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153462; cv=none; b=ZpKnyF46F+Zgpo+S1z1D/+xzStcXW5vx8g6jZHz6xepyzD6ol/jWvNedmpvT1AtuIkFiXF+Z+scuOdtTufbqRBOKw+G2+z3E91aE4VKtmhDPijRuc6yXuWJ/tKySKm5QwiMi4gylfp0mQSVW3lKo/j1tYW1i/xThzV8QqXDh4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153462; c=relaxed/simple;
	bh=xEBZBLdoj+RTk8/EwbpzShkW2dvZJr0PYDc+v9cQgfQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+FXYu91aRg4cD6Q6UQ7hY/ndWm6SDsGrO7xyY+9073iZHPxscggSXNXjafTfRmsPMve72WtIyEYMgRm/7nc9tdWkcR7v/Lh3khRmg8drr+jtAoWTn63XeU3VS1KtY/HPPGa+L//KvRqD8AKpMYPR3BkIb2tkllXOWXtjR/LpQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ldi8Gv+S; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ldi8Gv+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783153458; x=1783412658;
	bh=ytG043VqWg1g9s9zOv9Zz7b8W9uOTH5nOy4snxHx7IY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ldi8Gv+S1C8WYI+qhGVU1ET0L8dVq6lxXcymcsJAFnNYit3Wtw6F8QlSxlga2fx9W
	 wTtdzTMdey154xHfPJ+rVcNW1RO+kNUJrGmYkd7GixzgbW+Sjz+K26zindwndfhJSQ
	 PjrhzG/QiuqmGf1/5pBmTXuML/zfdewq/9TPv7Mtt3B3o0v80yFbicqNTCV9nwunqs
	 MYW1AkUBo4coSfG6dqsiMXyPreobcr6IV7yYqrro0p+y8s/lTL80x4CCnhi30Ax3QB
	 Sv0+gb869qIoj2eWbquW8p3QLGw9fkTPSPhQ6t9qUdimfSXyeQ2VhlsZQSDyHh16hB
	 DIFPd8/W1OTjQ==
Date: Sat, 04 Jul 2026 08:24:12 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Document Raydium RM69220 DDIC
Message-ID: <20260704-asteroids-panel-support-v3-1-38dc92570579@pm.me>
In-Reply-To: <20260704-asteroids-panel-support-v3-0-38dc92570579@pm.me>
References: <20260704-asteroids-panel-support-v3-0-38dc92570579@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 4915b5ad2d06cbedb6535365fac1ff47d5121be6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the Raydium RM69220 DDIC and the BOE BF068MWM-TD0 6.77"
1080x2392 AMOLED display panel used in the Nothing Phone (3a).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../bindings/display/panel/raydium,rm69220.yaml    | 74 ++++++++++++++++++=
++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm6922=
0.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.ya=
ml
new file mode 100644
index 000000000000..3c94db88f797
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm69220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM69220 based MIPI-DSI panels
+
+maintainers:
+  - Alexander Koskovich <akoskovich@pm.me>
+
+description:
+  The Raydium RM69220 is a generic DSI Panel IC used to control
+  AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - boe,bf068mwm-td0
+      - const: raydium,rm69220
+
+  reg:
+    maxItems: 1
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+  vddio-supply:
+    description: I/O voltage rail
+
+required:
+  - compatible
+  - reg
+  - dvdd-supply
+  - vci-supply
+  - vddio-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        panel@0 {
+            compatible =3D "boe,bf068mwm-td0", "raydium,rm69220";
+            reg =3D <0>;
+
+            reset-gpios =3D <&tlmm 12 GPIO_ACTIVE_LOW>;
+            dvdd-supply =3D <&vreg_oled_dvdd_1p8>;
+            vci-supply =3D <&vreg_l19b>;
+            vddio-supply =3D <&vreg_l9b>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint =3D <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index db3d8c441e4c..eb70658e081e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8374,6 +8374,11 @@ S:=09Maintained
 F:=09Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 F:=09drivers/gpu/drm/panel/panel-raydium-rm67191.c
=20
+DRM DRIVER FOR RAYDIUM RM69220 PANELS
+M:=09Alexander Koskovich <akoskovich@pm.me>
+S:=09Maintained
+F:=09Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
+
 DRM DRIVER FOR SAMSUNG DB7430 PANELS
 M:=09Linus Walleij <linusw@kernel.org>
 S:=09Maintained

--=20
2.53.0


