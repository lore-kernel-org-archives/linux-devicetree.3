Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08444224B04;
	Mon, 27 Apr 2026 04:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777264784; cv=none; b=Vhta5IMMa2zPjdR1IgWL3Z38EWxLP5m4T0MN3l2i4RKDX/3oKTAKXXNx5NbNlsJeSNEFvpDzEw6uYSHANDI0hl8pd30XGfxBAYZ3K0Sj7iH+qx+6MucP1h1dEmELCCrAJSX+ztx1ETkHeKCwOyWrn5YH3bLhauLQEKE3jJ5iRHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777264784; c=relaxed/simple;
	bh=yF5vtNI4rT6BiL2Y7UF7MFh6FNbB7HXVaTHOlFHns4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtat+Cm2IcsEo2IDoXVgjJ9aDfFglEmcMBSdp2Qpcg9u61irt89FyDvvigBoW04mcPvUuXwKdQK3VGAiaxrSxZ2jBk9G/GyVKJikxN1qJJ3oCZjsfFRafBjawnndzmURnshLJyJyLXOoXcBqaYgaK9nEMnNQRgqKSkue5BtT1cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2U6VUt+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2U6VUt+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6CEAC2BCB7;
	Mon, 27 Apr 2026 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777264783;
	bh=yF5vtNI4rT6BiL2Y7UF7MFh6FNbB7HXVaTHOlFHns4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b2U6VUt+Mi5EVilY8teSjjGZfZCXijRg8dSkg/ZzD0z3vdrC30Tz7WmVVEDrgUusq
	 MIDSAr/LWMpBspirCJMMyjc5YIXfhm9XFxgTiAFX9ljn3ul5y3dUxzgC0u5h3FqcO4
	 sPdQEbQPYsMy60KcvgUglIA0fv/nJo5J8RZAEOB1dOBAlv33t6NXtK+17Q0o2XUxE7
	 EW/u9MI/cjVCNqnPx6ZKRu0qLEM/9OKBufaPm/Z5ZlCLwYQ/I/pAYPuFQ9tvMyvuy6
	 yMEgG26iqRDx58V+c6cJsSUqu4+I5tTRwJWyjn5O9p59hABRF/sbbYm7wQfVk6u5KT
	 oAuuG5VksfCSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9601CFF8860;
	Mon, 27 Apr 2026 04:39:43 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 26 Apr 2026 23:39:37 -0500
Subject: [PATCH v7 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-ch13726a-v7-1-554247c569e5@gmail.com>
References: <20260426-ch13726a-v7-0-554247c569e5@gmail.com>
In-Reply-To: <20260426-ch13726a-v7-0-554247c569e5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777264782; l=2305;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=PeipF7stSlnB3KSvVvobRqzG1vhA7mb7CLIfwJcYi7Y=;
 b=qs2vGJ62Lm1BfftqJE/hz3XTMEasceBhoTHQ0Cc4OH/H2qY1sse8A59yDwML3us56A+nPkRTZ
 z8rvEezSfhjDSACbFvIuzjFHpQMTLdCdfFUGfmnCy72nfBuYCJ+rp0y
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


