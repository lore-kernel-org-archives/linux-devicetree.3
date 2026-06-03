Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEED834D90C;
	Wed,  3 Jun 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491801; cv=none; b=XpENrPkP05ceSKr6zxh+8MgdtvRflI+C+yj9YmmGlI0f5jMv5PExwc6/Y06l4vNnbSXcKVz8pY96R1YHaSMfCMDyL+37RMLzB0gyELWeTTGbkoxVPU8rotCs8Pm9M2qOM2AHm056s0pSUhvb0NhEy04+9hoXf7cKsXMDmlOvV9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491801; c=relaxed/simple;
	bh=ooYqb4J3l5d4HSCMRdNqd7gPaqi08D3zACIgNEk9QlY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pLJ852g/g6O12SULpeb4lUxWWnRVqPXHHIUyDKK94Tghh8vAqO+r9McwGSW5lhm+cv7G3VSOayfnHUelZWIIlokQnCxjgPfS5pjlL8w1++GmcRBk7SDVCuALzOOkywYRGdeRj+WD+Z9xuzJ3TkFADkriZqHBeWkmAPh+ElUcKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=I14eYEXp; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="I14eYEXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780491797; x=1780750997;
	bh=84hOhCwOr6CZp7OHVWmJONnUUJ7lvZP68eI7P+7cmi8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I14eYEXpcuHy6ERxq7xJ1A6DhscBaSKIRksP0rLbFGNpDQxweuCPqFDbfYiXAwkCs
	 VrsJ+fKjW9W4B1cJ5MeqdYvIUtg+r6AwmhmrXEm0+kmXprIaODSrpSAhhDs5Xh4+8o
	 JSBHBl7FlnNjAQK7mabwkSQOqtfxNK2n596zxabSJYZfFnsH6e9f+eb7SnJB9tWBGT
	 huZfQcyR8HBgV8s8d3jEBjEl1rkyUpZApdJldoUJFMxJ/J0QhMGQgtuh8koQWOyLS+
	 wHqd6783nD91MpDi2Xf7MnMhppQMCWgl95IJy67f+5CRN2c234Q2oU1GSlSjQ3Fd4U
	 Jtos4unqZC5bA==
Date: Wed, 03 Jun 2026 13:03:12 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] dt-bindings: display: panel: Document BOE BF068MWM-TD0
Message-ID: <20260603-asteroids-panel-support-v1-1-109c6ac81c8f@pm.me>
In-Reply-To: <20260603-asteroids-panel-support-v1-0-109c6ac81c8f@pm.me>
References: <20260603-asteroids-panel-support-v1-0-109c6ac81c8f@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 8e671c51da754ca6e3ac00f4fb63e6c295ed3ca5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the BOE BF068MWM-TD0 6.77" 1080x2392 AMOLED display panel used
in the Nothing Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../bindings/display/panel/boe,bf068mwm-td0.yaml   | 77 ++++++++++++++++++=
++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,bf068mwm-t=
d0.yaml b/Documentation/devicetree/bindings/display/panel/boe,bf068mwm-td0.=
yaml
new file mode 100644
index 000000000000..840ddff709ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,bf068mwm-td0.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,bf068mwm-td0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE BF068MWM-TD0 6.77" 1080x2392 AMOLED Panel
+
+maintainers:
+  - Alexander Koskovich <akoskovich@pm.me>
+
+description:
+  This is a 6.77" AMOLED video mode display panel on a MIPI-DSI 4-lane
+  interface.
+
+  The panel also requires ELVDD/ELVSS/ELAVDD rails but these are
+  internally managed by the panel via EL_ON1 (ELAVDD) and EL_ON2
+  (ELVDD/ELVSS) control signals, they are not managed by the platform.
+
+  The driver IC for this panel assembly is an RM69220.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,bf068mwm-td0
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
+  - reset-gpios
+  - dvdd-supply
+  - vci-supply
+  - vddio-supply
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
+            compatible =3D "boe,bf068mwm-td0";
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
index c9f2780b2d31..63d0224bba3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8000,6 +8000,11 @@ S:=09Maintained
 T:=09git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:=09drivers/gpu/drm/tiny/bochs.c
=20
+DRM DRIVER FOR BOE BF068MWM-TD0 PANELS
+M:=09Alexander Koskovich <akoskovich@pm.me>
+S:=09Maintained
+F:=09Documentation/devicetree/bindings/display/panel/boe,bf068mwm-td0.yaml
+
 DRM DRIVER FOR BOE HIMAX8279D PANELS
 M:=09Jerry Han <hanxu5@huaqin.corp-partner.google.com>
 S:=09Maintained

--=20
2.53.0


