Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217C2EB0F;
	Sat,  8 Aug 2026 19:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786215683; cv=none; b=nHvCt4ABR/0f7zAV8sA6tW6y6Gc5S24JXKa0EZerWVTYp1cOhdAk7H99tPfDjXaTqzFG9e92Zm3BIr3uagJPkA9f4YKzgf0PeIcccoMBkrg/TV8YYOtAqeP2j0WYVAnPZ7DjY4MZXmNPO2nzU6aSv5QIBLz/J+SAixz0F33D518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786215683; c=relaxed/simple;
	bh=h8oObjPSPRKmXWHQJ1RCAI200sPAzhCvzypZEQgZfnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hiIihFt0VShIomStUxRKejUCy+wS+97RSqU9KAvz1fTg/1EPyRJo6iAJVnpmTT91kRA0XSHLYFaIbdyGG7GxRIzqEJ+vCiuhm25QieklALh66MYy3W6elE2u7ZN4OvgfmehiQVDGrQCVrR+nxz+nt7U7je8VP09zK4OINyGGV8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXdSWAZi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXdSWAZi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC57EC2BCF7;
	Sat,  8 Aug 2026 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786215682;
	bh=h8oObjPSPRKmXWHQJ1RCAI200sPAzhCvzypZEQgZfnc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YXdSWAZiizroi7uH+/S3jwGrubNroZWRXzTDBl/gYcFuVMKUFqkD/GDSdzxzj3XpD
	 ivHuF0q+hYYhpoR7NIhhixr6M43XBJDtr/UxsqLJek4mwTmz/oxSI+TGPjOYW+YOCE
	 2vxZB3u+JSJXCCrVbFx+oJe+tZnw0IWm93vQDwHqBdG7Uo+vD7bQXxzKkHRI5xUB8R
	 JWn0f9slXbBgPYeLPLwyzfnWg12KSy3i5ATXDrkP6utoqKb4ghfGzwz16U3G1jLf4K
	 mHGJscIHtAZDHnHiUW9YRmnAptxUIzksP+UmqBLZBWJDHgYo7dTmCW4IyYkbwHjUEj
	 Eo/zHWNdUXb2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9EEC5AD44;
	Sat,  8 Aug 2026 19:01:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 08 Aug 2026 14:01:14 -0500
Subject: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7836A OLED
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-ili7836a-v1-1-07a7becc5636@gmail.com>
References: <20260808-ili7836a-v1-0-07a7becc5636@gmail.com>
In-Reply-To: <20260808-ili7836a-v1-0-07a7becc5636@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786215681; l=1884;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=KJ4KPDrXqqClHxahfT1s53mfTzh06Z1F2OlsPAlwqI4=;
 b=uy4MioV3b9R6fNaLlDeTL/o2zz722SgCtBLMsG61+8a/d3AaL7zR5E+sVWtOi/I0sZM/L1Bn9
 AQNadw9FXqlDtAeqQ8efIVH37hgCexJESW9gHxurHfr6KPiO7wnCI5Q
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Ilitek ILI7836A OLED driver is a single chip solution for MIPI-DSI.
This is used for the Retroid Pocket Nova panel.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../bindings/display/panel/ilitek,ili7836a.yaml    | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7836a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7836a.yaml
new file mode 100644
index 0000000000000..962cf257ed8d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7836a.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili7836a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI7836A-based OLED panels
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: retroidpocket,nova-panel
+      - const: ilitek,ili7836a
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vddio-supply: true
+  avdd-supply: true
+
+  backlight: true
+  port: true
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - avdd-supply
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
+            compatible = "retroidpocket,nova-panel", "ilitek,ili7836a";
+            reg = <0>;
+            vddio-supply = <&vdd_disp_1v8>;
+            avdd-supply = <&vdd_disp2_2v8>;
+            reset-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+...

-- 
2.54.0


