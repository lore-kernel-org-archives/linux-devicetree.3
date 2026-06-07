Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9093F2F8E88;
	Sun,  7 Jun 2026 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863115; cv=none; b=VB/2s/nePFqu1fduOPa44QFCapgxh4hHZhmRPNSL/spv0bTxS5Mwrg1sI7d2rQSCCyMajiqQqQ7MykAmIGrNgcku/DOxF/dL4i3uSbJssXLpe7vp2p3ykAeXfpVdQELGkWItHtUak3n2mLn7tDSFY1LRkxCKLV/CKUJhIwnWW9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863115; c=relaxed/simple;
	bh=GEK6Yv1WXN2PdYBGoGbHClFD8tJefLhjEBc2nwNTChQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcH3te4QdQ5dVm6Bq6oy5/SRGlocYYP1aeRrcerxHWIdHynQHu1LmBnvzCdPegpDZoNe7n/+xh0YAv0/+xr3zliRMj9eSVOtBpYsZe3tRyy1GSjtNKcCLQKkPR5K56NEYu6ShuyKBM06pHUaxyXHbmuEIaJwhM0HPAeVvHXi/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTrbQUha; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTrbQUha"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FEA7C4AF0E;
	Sun,  7 Jun 2026 20:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780863115;
	bh=GEK6Yv1WXN2PdYBGoGbHClFD8tJefLhjEBc2nwNTChQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CTrbQUha3Ltc1NWUcrWlkvni39gdf3/kStCD1r3kN0UsQPXNL0C4kW1ljb30ZMpkl
	 OzbzA0FUMdC5FNaONArot7yIAUq+EioVtGQocGI6Dff5oCPgILnySzBxfbAADuJamY
	 ut9N7+PH0vYJwG8eOdFLvlB4Lji7X8OsoQjqKpytRzEpDqbRmGnvKYlTZ063ZkyfTr
	 3xd6CR9zjT8ywlsnfeJXmTyja1Yw88zo7zicpMQqzv/sMk3wwTg91IHEfsweNvqeEF
	 pl+LdA6nQEC7BD2lqEdKcLIQ4jwZ+tQo2SjSWBT6SIT+tB022LH+D0xxC9hrbSmLdU
	 Dfs6Rjpf3u+sQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D27CCD8C8C;
	Sun,  7 Jun 2026 20:11:55 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 07 Jun 2026 15:11:44 -0500
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add Chipone ICNA3512
 OLED driver bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-icna35xx-v4-1-64de514add34@gmail.com>
References: <20260607-icna35xx-v4-0-64de514add34@gmail.com>
In-Reply-To: <20260607-icna35xx-v4-0-64de514add34@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780863114; l=2840;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=FSAKmH/ed0fes0PJf6ePyzav9aFp/zkOg0ypEQAktV8=;
 b=ZOrlkjg4p/fm25qaViP44nzS2neDG3CY/TuNHnDms2qGKyMnpGHUXg0kbKMnEGSZq/medgTKQ
 lDcrpEPIfWPA1S3Qe4tP32nSS/k9/qdQF87ent77nL7WxbzHsMiGDBI
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


