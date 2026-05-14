Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EE8344DA0;
	Thu, 14 May 2026 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779495; cv=none; b=dAt/R6iYSjOEQwNTdfJiut0S5he9ml8xuIslvvSX1Q4P8Hk/QD31QlCl9d6R3PejHYIiG+eS2hbGvO5AQd0kDormbALPIabQcmJ8ktDr52eeGaPFT1ZScMj9GLQxzSHMEUycmUSPZis72HTFOpdfhRDdswbIbHkvd0iO9hLNXUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779495; c=relaxed/simple;
	bh=bAMBBHIU5JpHs5WIj7GRPOsNIX+w2cKhwu46K4nUuyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttniVKLO3uwbB0306lWptG3Ute94dZNCoBrYj2TRpV2CWc9AyAqsp7AeYc6E/i1IyNgMhizRVY4Rd0I9qNaKSxmhShtL4SaXh0d68F20JpqA7TyekQUi/dCMESqoP0X6iGiL/afifI9kWAEgYnmvHfWk7HtISy1FPYsEHsZpLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQw6V4ci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQw6V4ci"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 548E5C2BCB7;
	Thu, 14 May 2026 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778779495;
	bh=bAMBBHIU5JpHs5WIj7GRPOsNIX+w2cKhwu46K4nUuyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YQw6V4cijzYe7SKFrySUuUYPvPQ1QJVwbLabWwMEWbQs0k5Dnz9cB2RZusB/mZySg
	 5aTcEea7FYRgMY+lsH4nb26SR/qpuw/Ha5SzmCKd9s6CXvsjPOs6yJiD88e2JOexeo
	 QzoL6LRz+Qt7AazjhFFpYRprAHD4kG53gaIS7X6dn7vuxdgt4X96j4hrt8D3zoULxa
	 qr+gz4FqvbAJQhpk5TEZEPxgfuIhUcZ3qWDwzj9C57ZwXV+MCTUz8fnwzyBDuZROhm
	 uenxzt45NoEfAbc0ijNMvurjmgRImL1+m36D4KGB58G3+FGFnWY7p81jGDUMow/3K6
	 I48/5BUt7/H3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CBECD4F25;
	Thu, 14 May 2026 17:24:55 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 14 May 2026 12:24:49 -0500
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Chipone ICNA 35xx
 OLED driver bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-icna35xx-v2-1-45acd1dfa566@gmail.com>
References: <20260514-icna35xx-v2-0-45acd1dfa566@gmail.com>
In-Reply-To: <20260514-icna35xx-v2-0-45acd1dfa566@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778779494; l=2576;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=u+xNtbXC2ipkpodEb8alKozIa29lnpYUjbXquoCzHmQ=;
 b=D5QyChQvw1PtY6pF+5ePWpatZFHu7kX5ejKoZy3hJZ8E7SLTrlwJiZY8rC+puhkqYIRnHrm/K
 tDCmJXjYu+aAPzh52yHs6NhRzt/rbOYyxdl5Hfp+UPPcw1+wKRKG+Xw
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
 .../bindings/display/panel/chipone,icna35xx.yaml   | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/chipone,icna35xx.yaml b/Documentation/devicetree/bindings/display/panel/chipone,icna35xx.yaml
new file mode 100644
index 00000000000000..6464d8d0cf86d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/chipone,icna35xx.yaml
@@ -0,0 +1,79 @@
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


