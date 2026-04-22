Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ECB3491D0;
	Wed, 22 Apr 2026 07:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843821; cv=none; b=kjCAT4IDkM3607k5YbsSXsF4tqmwyAKFkbGBIJSkn6fwc2LfJaJ/ACNcYNVOm2VCZ5fvFMJozErc6tVrCEg0p/rd2Gd1Jq3qMWZpj/zTbKT9HvteTQ/npNqXIytvWbQKd1S/o3oapqceb91A1Z5ZXBo55LaHIsJbcsLczrrhrlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843821; c=relaxed/simple;
	bh=yF5vtNI4rT6BiL2Y7UF7MFh6FNbB7HXVaTHOlFHns4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=our2mMNBCm86VWN/OQt4gYR7xA2IJEbcDVCvW55zEvwTqVC22nw8P3p7HyJcHXJAkId3n8rh7j8hM4MBotJ0+U3IqDQU71bxEpyrdNwDUFkp/1Uy+JifllSz0Dj5VJLclsWqNeOzFGs0p/cu/+6SRMBqWpYD++cZZChWjkZtVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o69cDy8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o69cDy8t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B8EBC2BCB4;
	Wed, 22 Apr 2026 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776843821;
	bh=yF5vtNI4rT6BiL2Y7UF7MFh6FNbB7HXVaTHOlFHns4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o69cDy8tbQ/rFk2g7ooDbwdUZlK9kaYqr7t0KOEyl67f9BTunm98an7/ahUgblUDC
	 Fw5r/gkMQR6+j1ycjxUF3M2d9mosgb95bLGlMvKF4H2BrjiQUtIw8ZZGoWT2Tto+ii
	 FZAn4XGIq0mDpLTT614MNM2z8ZIZEan1LiJMaV04J9bU+EjUuMskeytQ3y43u7RDLi
	 39MYXyh/Ko1gD2OcxkfX8MjsuYQBl+5/QllvdpxmRycqk2g434DkdQF93mWZqMYPgE
	 GvwuQi3Np+wPKLmFYK8uneoZxYW1J1zs5hW+cEkyuqh+R39Jl5S1Mri6JG4VT4lnA1
	 8MtST4jY6JmLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE0CF94CD8;
	Wed, 22 Apr 2026 07:43:41 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 22 Apr 2026 02:43:24 -0500
Subject: [PATCH v6 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-ch13726a-v6-1-03680d6673ff@gmail.com>
References: <20260422-ch13726a-v6-0-03680d6673ff@gmail.com>
In-Reply-To: <20260422-ch13726a-v6-0-03680d6673ff@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776843820; l=2305;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=PeipF7stSlnB3KSvVvobRqzG1vhA7mb7CLIfwJcYi7Y=;
 b=YPGy5wjPhjJBDLIYh9AnykNVDs7Ik0t7MYZR0gVn1BuQBmmFqgQyIock7Ug313egE9eNrwkuM
 fYlMJSJLS8pDhcB2FshZd71C7zikw5yx6cB1CshC+ThfGhTqkuSH9X6
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Chip Wealth Technology CH13726A AMOLED driver is a single chip
solution for MIPI-DSI. This is used for the AYN Thor bottom panel.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../display/panel/chipwealth,ch13726a.yaml         | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml
new file mode 100644
index 00000000000000..c8d7b61037e622
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/chipwealth,ch13726a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chip Wealth Technology CH13726A AMOLED driver
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  Chip Wealth Technology CH13726A is a single-chip solution
+  for AMOLED connected using a MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: ayntec,thor-panel-bottom
+      - const: chipwealth,ch13726a
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vdd-supply: true
+  vddio-supply: true
+  vdd1v2-supply: true
+  avdd-supply: true
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
+  - vdd1v2-supply
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
+            compatible = "ayntec,thor-panel-bottom", "chipwealth,ch13726a";
+            reg = <0>;
+            vdd1v2-supply = <&vreg_l11b_1p2>;
+            vddio-supply = <&vdd_disp_1v8>;
+            vdd-supply = <&vreg_l13b_3p0>;
+            avdd-supply = <&vdd_disp2_2v8>;
+            reset-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+...

-- 
2.53.0


