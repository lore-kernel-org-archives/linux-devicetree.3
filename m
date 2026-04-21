Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF02D2E3AF1;
	Tue, 21 Apr 2026 17:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776793121; cv=none; b=ftyOv5JEwTeTkZIm19xDvXYYYskp84fSdBhMC0iaXWmRHSrKANnAAgLGqD/0BIx/ORMZJtO3RwCHAW/gvF/OESBEQFh7FdL8qeXfJHrAHiOemkNUPiKRTlpwQlGx2pjgJkqb1kn3WfbHJanoOfiar611L4u59MHSmVnLoYPPWeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776793121; c=relaxed/simple;
	bh=oAVLn0Pf8rZYdqjOGJ0372UjEDnO37tJPkJuki+zbTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIcUZ+VX6MKqp1QMZaVNmWxfbBXpkkyLm0109ntATVswKhWfjZdpA8C4YPR9MINJ8Q8jyuOVkhrIjtprw9K3PplzKRLtyszAqWuHqnMTlmZCEQyK+scxh21GGkRfRkvf0KiFjpbnFZknyv4fQ1Ug5YyPgepCXdBsbaR600DU5L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qo69LB0R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qo69LB0R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B90CDC2BCB5;
	Tue, 21 Apr 2026 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776793120;
	bh=oAVLn0Pf8rZYdqjOGJ0372UjEDnO37tJPkJuki+zbTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qo69LB0R3uYYnm0psLLp3HoROMnfpMz1qZb6AmFj7i6xQwAan5zm3g5KooUspCvkz
	 l68xHZQFLXFnQNM9ZhRrYQQ/xzJXPXfza2/Nfw3MMmcQDvwZXoRDnRKS5zCSy4Xpzv
	 yd1f3DVdVNKOY05qbq0HgOZQtpLzBfVwhKAsB222tfFk1cFK4ScJBoZM+iVMZhQW++
	 OSSGkbr7TZJVf77C+W3x1yP8H3YRm8F4zGMtPGa4WNvAv/3AJOcfO3wjUiLREQSEHx
	 e1R8hFWnAn8zTgP/4oFXbHJP7W4CctfhzVq9HCfdM1u2PufRJ1XmccmrgBh8xMIwur
	 WeEUv0NE92Jcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D4AF327D9;
	Tue, 21 Apr 2026 17:38:40 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Apr 2026 12:38:37 -0500
Subject: [PATCH v5 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-ch13726a-v5-1-f7f6f4f30e05@gmail.com>
References: <20260421-ch13726a-v5-0-f7f6f4f30e05@gmail.com>
In-Reply-To: <20260421-ch13726a-v5-0-f7f6f4f30e05@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776793120; l=2232;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=9mFynGjtbhyIlNz+8QqjnthJKrW1n6N71zYlWYxXU8Y=;
 b=t/6NZe7KGkazfs2i7oNOeSYtuJWNCvxVsHVzfxdCPGOsCUT5NY6Oj4J5Nyk6jO6SA8MFvbdKD
 yPWOfuKa13XDkyQO9Oft1tdBfNhTGO/whcJei+nBpTxsLtalUgtsghX
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Chip Wealth Technology CH13726A AMOLED driver is a single chip
solution for MIPI-DSI. This is used for the AYN Thor bottom panel.

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


