Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA343BFE5C;
	Sat,  9 May 2026 20:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778357955; cv=none; b=OT9g+ZOdzUprw1EEONP/rtaz+7mvqDDXxCFBaD41t3gYSPdzprJOpGzeLRitGbE2gtYiRgXhDJHkYlDyA18i/VslMfeTeD4sHX/f4XS7xvzcUUvzZ6VWpUerEUd5FUC96LxOkgC6sYabAc2br5hUNEzYANb5Rs0Qzdkc7i87ZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778357955; c=relaxed/simple;
	bh=sKobk+YDd1KDXHb/w+YQFE4z2kSaytJsYIScKTJIRLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+N3etEjCu3VR3AfygyClClh4o7zwOlHXjdOD1XCXtzbq3Kl9+Pvc3fsMQXL/+fY96mCVWI6dtziFRzT4x//FJ/XRpa7eBCDRFYBxbFMJZLurSsCTpWqCPhzLc+IgZhSJznlPeuDhbiuvIDVeDBqx/K7/JFryBxu7fBK/6UEL8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWfQQIo7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWfQQIo7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D142C2BCC9;
	Sat,  9 May 2026 20:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778357954;
	bh=sKobk+YDd1KDXHb/w+YQFE4z2kSaytJsYIScKTJIRLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UWfQQIo7N7BIFAHfwaSh9cVO/IfpuidmeWQ77vTLnGdSbgE/+k1D2DUqjavkeLVDp
	 5XF94OLgIwoo8pETBPfMXNxSQKvbM5RIVgIdUw/pvMP+TRHALvd7XV2oGlB5YW+FO+
	 pomBBy0IuI3lwOYLqtHYXRaxBcnAqAinf4zJ+JikHuYpfU0KO3d5ZublSp9FwPVqIE
	 m4K1n+ji74ez+erJC1Cpr4vbzHYI1dEStnaLZtd/GzGPqg5XFxGulsF6n+KFnBs/I2
	 ceerGR4/ckaVMzzfYsvB7lOsVYJ/bEFCIYcefQbSPxfjEM8TGC7v2BbmLiwOygA1aY
	 980+XlqefE5jA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F56ACD342F;
	Sat,  9 May 2026 20:19:14 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 09 May 2026 15:18:57 -0500
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Chipone ICNA 35xx
 OLED driver bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-icna35xx-v1-1-688d3d4e10f9@gmail.com>
References: <20260509-icna35xx-v1-0-688d3d4e10f9@gmail.com>
In-Reply-To: <20260509-icna35xx-v1-0-688d3d4e10f9@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778357952; l=2511;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=OoHb7X7TZvRfCQ5uqL7afSM0e2bjFFLjyQXyOiI00xA=;
 b=6uSNnSYmltzddc/2xXICoPnuSAxj8kHy+BduRcIiwJUtDRsx1fsu9VR9C40I6+EpNuFShQDrM
 waiAsJmX+gdCwfXaOi4846s8iVeqEYP5V6psVRWJrIshu46R3nRsS1i
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Chipone ICNA35xx series of DDICs are high refresh, low power
MIPI-DSI drivers for OLED panels. The icna3512 is used by the Ayn Odin 2
Portal and the icna3520 is used by the Ayn Thor top panel and the Ayn
Odin 3.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../bindings/display/panel/chipone,icna35xx.yaml   | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/chipone,icna35xx.yaml b/Documentation/devicetree/bindings/display/panel/chipone,icna35xx.yaml
new file mode 100644
index 00000000000000..3c497a40101732
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/chipone,icna35xx.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/chipone,icna35xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipone ICNA35xx display drivers
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The Chipone ICNA35xx are a series of DDICs connected
+  using a MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: ayntec,odin2portal-panel
+          - const: chipone,icna3512
+
+      - items:
+          - enum:
+            - ayntec,odin3-panel
+            - ayntec,thor-panel-top
+          - const: chipone,icna3520
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vdd-supply: true
+  vddio-supply: true
+  vci-supply: true
+  disp-supply: true
+  blvdd-supply: true
+
+  port: true
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+  - vci-supply
+  - disp-supply
+  - blvdd-supply
+  - reset-gpios
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
+        panel@0 {
+            compatible = "ayntec,odin2portal-panel", "chipone,icna3512";
+            reg = <0>;
+            vdd-supply = <&vreg_l11b_1p2>;
+            vddio-supply = <&vreg_l12b_1p8>;
+            vci-supply = <&vreg_l13b_3p0>;
+            disp-supply = <&vdd_disp_2v8>;
+            blvdd-supply = <&vdd_bl_5v0>;
+            reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+        };
+    };
+
+...

-- 
2.53.0


