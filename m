Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B90357D1A;
	Thu, 14 May 2026 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794181; cv=none; b=OedyfU0v1kkt3a+HwBmLva3bKhiXhX2WcToJOnOCtPmi1jh8G/CncOjzT+RJqzghtBVrrwe9hZrUSf4TnmlEeP20dPQpKZE5zJxI52Y06g0QZVSelFcjpuuJD1GdCf0pXN58zW9yYqYr70h0rknf4HNRY5+9Boye+BsigPX5hnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794181; c=relaxed/simple;
	bh=TOd4g1kArrVBssU9X9NQsYGPgQQlLFG/Azt0iGKbDTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TA8My9qtNCzdHdcwJQ0VflomRxHsi5KICyu9FD7tVbYeT2g61GdgayNPfTDr1TzKrSvVyDguiQS/fBRrkXGnbT9yRdSDDbKcRdbp+WmS1nSc2CwoptgruprOZ+/MOYptw7NE0XBBM/i6rMhRT0F5jVEc8Xq6OGEbZkb8iPncyVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYfzJ8Aw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYfzJ8Aw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DB12C2BCC7;
	Thu, 14 May 2026 21:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778794181;
	bh=TOd4g1kArrVBssU9X9NQsYGPgQQlLFG/Azt0iGKbDTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cYfzJ8AwlcaCjfp60jmpAor7sn631XYwo1AYnaaMP6DHfhKKfXl/QzO2aduvtlnQT
	 BA1GEIEAl5oKSe40Gu0FA22zGLJfn9jxPvWPqRbn8Hjevuq4ObbEwtoMvs9uAPjcjP
	 YpmzS+o5Wqqsnzx/JrRgQi2s6tflnXJ2T7Hdf4n4sXyHrAAmXlHIlKSax8QW6bVcKu
	 b/eRvPIkQZWXWSMDR2psuFXi0XoeFuDUIPSX1l19+8v0IebcPZ/OYY9pu7BJWYqh8+
	 P8wOAO4U0/D/YjcH4BZtqVwO6Ome03uc+/YXmOvDimGf4uPTUWfAv5gGcWZ/uo+0aU
	 dWuRvccbzgjWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599ABCD4F39;
	Thu, 14 May 2026 21:29:41 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 14 May 2026 16:29:16 -0500
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Chipone ICNA3512
 OLED driver bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-icna35xx-v3-1-c304f04c32c4@gmail.com>
References: <20260514-icna35xx-v3-0-c304f04c32c4@gmail.com>
In-Reply-To: <20260514-icna35xx-v3-0-c304f04c32c4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778794180; l=2767;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=uXlXkwegKgV3qNGrNC6g+UVa4Tf9QiIsRwWcXXJ26os=;
 b=3gRn5+UA1owjYxDH0L2VB9lTCq8jsxb1VgdlQPPmNWaDZSb6EUWHv15IMw68otnowpfkKvv3A
 JCLDMhThPkGD7xv32ujb/4k8FRZs61ZxvZIW8g/3VaPvxnD6CyfWLse
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Chipone ICNA3512 and ICNA3520 DDICs are high refresh, low power
MIPI-DSI drivers for OLED panels. The icna3512 is used by the Ayn Odin 2
Portal and the Ayaneo Pocket DS top panel while the icna3520 is used by
the Ayn Thor top panel and the Ayn Odin 3.

These ddic's are generally compatible, but some MIPI vendor commands
differ between them, so they are not fully fallback compatible.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../bindings/display/panel/chipone,icna3512.yaml   | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/chipone,icna3512.yaml b/Documentation/devicetree/bindings/display/panel/chipone,icna3512.yaml
new file mode 100644
index 00000000000000..90e69f30cd91ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/chipone,icna3512.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/chipone,icna3512.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipone ICNA3512 and ICNA3520 display drivers
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The Chipone ICNA3512 and ICNA3520 are DDICs connected
+  using a MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ayaneo,pocketds-panel-top
+              - ayntec,odin2portal-panel
+          - const: chipone,icna3512
+
+      - items:
+          - enum:
+              - ayntec,odin3-panel
+              - ayntec,thor-panel-top
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


