Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3A314B95
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881734; cv=none; b=FfcvV1WN0MNNZj2bopXovj/l3EpTX28aQOba186Lk5zVcokAzou8uBN0To4QWudE0VYgPDqiRibgB2SpdR/XakeEipf+Ae6sv8ebn8dLuLDGyVk1vW64eYD6YPRv7rKfQlrtImkLR3W7eSFDYlLRgIFLLJkCG2rvz571dGumrFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881734; c=relaxed/simple;
	bh=74ON2gxJ2EbMlsMpx0629ZNhdQsnwZKCfK4Lcaq26K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBDNBaqFP19ShBCnQ/Xf/s2SV69pCYsR9V2VbYVA4mE6BjrHqGDXRSkbxuOXZ6xZ7Tz+FWEzMml/05g5Jz9vdkG/l55DXKdlqW89wH10xj64SOMznNeiwQy5KIR+ChhRHHQf9yTpwakcQF30Nl3gfOUz6kvMvXuYWRirk2Zqy+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkZFlQuM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkZFlQuM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ba840146so31804125e9.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777881731; x=1778486531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty3MbPaO2vFwqPZjz6jT7S+J98csHl+q0+lwLd9Yl/k=;
        b=LkZFlQuMQR5yYEVV6FdiYFsraFIDl/N62+hmTd6hS2UbW+LK9YENUtOqhnEHmNzIp6
         yg0sQwDFRJJJFDsPSxELpllMxl9bbxm5A8FdFYQKsH0sNC6K9KSrlIjPUl78Z3HDmNXA
         VuO9WIYY/Wp+2g8ZycNE/T93RzMAAK80HUZCE91RTDln2qKJxxdv+6/YLnpMKQd/4UgM
         FjaZz2cz/oB9mGdsXJXT8juAZexQHUlCz+swonu4zqVlBHkh7kfNTkQ3CTSiHclNLOkW
         oIGkjQFmWU7GobhVaz2FHuICWTkoXucBJPTLpbuU8478MauhMOlLwz8CuSgRtY6MDq+i
         PwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881731; x=1778486531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ty3MbPaO2vFwqPZjz6jT7S+J98csHl+q0+lwLd9Yl/k=;
        b=L0JeU0YY7wgP/e9ajG2SVeyKfAPa9U0oPkguTn+LUferJ+5duRYYafhCczluwp1vVK
         gKEqvv9xnNEwhmIp/xMk0YKLiMQ6Aip4+hf69b6BD7WNtuRymnXQm3xoctEPJFmVIlyO
         nJNHN2bJy2jm0wsS05ehAWli05g6wGdM4zXP9ZGH3q3iQNpcxPNt7JMgv3YkB+BRLKwN
         supj/NPUlaTVertUCG2xKwMwAdRW7C88y+T5dDdzuSJfkWMd683A24Z1sWTy3gH8G7/g
         1oLH+5OAxQ8byWVoBToAWw8ySp/S4bl4uS9rgVGOe6x2SZhGudcnJTOzLKbdXXnjdnTq
         /LcA==
X-Forwarded-Encrypted: i=1; AFNElJ/ES+bbXi34RFi20eWY34O8bpwWi9xhMWvxvVQ+O+HxHz8TML+rSzxQw/vT6VqRPsXt9GmZ/bAARSIK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KySv6SnLRzO9KjfzXTNvyFn9bXQJtmA5ClYK7nwv2SrLwT9M
	NgQA3bSEhzNmnmdKakfobcS3XWPkJbh+9+XLbTe1LfYoMO12dt4E6y4zjtzFKxF5vfw=
X-Gm-Gg: AeBDievGViakRzNmSInwBHvCi6RJJoLbuFDlUpNxbZDCVSw0SqBdTi0nJntfo6E6pnI
	f+7MvD27tYIHKYNxeVsvICxCBe0cM5JM5btKN9EA6quviNugbKlB799B4aiIGEpvL7CD5+hGzeo
	BjGMBo5EM/Ej60lG9R7g49sTpG/eZ/8+se2eqv60KE7sHy2rdiiMEW/Fk1YJrENz7wD+77XZxW5
	Ls6i4O24eGapSszn0V66HT6vlYl+IztrHSiADOE4/+7NZjICvI51u10VCkD/9I8lLVxczftGOqJ
	axF/9/szWt52MRS3KumBWahF2IDdr3hSypVpCU3xFSOTgD25sikXyY717oT+WK5Ale+32dPewDw
	px/MP0mHIYUQwrOUno9MlkuEDLYc2kSl0lMdJnO7SZyc8lmXhxAGWoqAqfxkAIqSkp5POXBKpnD
	OttrJ1PkpHbU0L0HOrF76uGslGGvLYhiO4kykWU0u0QBc8AoKvc3HRNVI=
X-Received: by 2002:a05:600c:c058:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48a9866a998mr109269135e9.21.1777881731004;
        Mon, 04 May 2026 01:02:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defb3sm32255216f8f.20.2026.05.04.01.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:02:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 10:02:05 +0200
Subject: [PATCH v3 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-1-9f61cf24aebf@linaro.org>
References: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org>
In-Reply-To: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2860;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=74ON2gxJ2EbMlsMpx0629ZNhdQsnwZKCfK4Lcaq26K4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+FKAAoSVmjc09UHBFWojXT53v4Wtjy9ZpMZCZPMZ
 czCRDFeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafhSgAAKCRB33NvayMhJ0VbwD/
 9vZSbesQ3rGFgA55pV4KHq7cDalHuTSxYIF2sknWBGKqZ5CAR6o2gNybDs6d6pcA9/4RBBi+USXznD
 NSEVMoxYTrBxwsBFA0Ys9qpjI0l2OBS3L05zW2d+UAKpunTHnKo9C096RI4os1ovkSc579xTqHKz0Q
 6pqySgbfz8u4QfVBKpMleglnda86hhMQGyxYOmvpir/R8qBv5NMB+LrQPjunE48eA0Z6hqHTMNkc4Q
 db5omBweQ9iP6K22lhGUtjXQxfwk314R3EY+cS3uBNEm6irtf9wKGOAUWal9ptfKD5rkh4LnGzMwV8
 KMR/fmaucvwgqa03WbxUi4Kg3JsKrNjct5GydGMPm7UDqgg1MJpR9MP5uT5NZvYZKe/tJXUGJzKvmR
 Pz+/5YomVkzPJfLBfT7rs5j1a32akdOCIZR4CtSUCaTtNe/ImjXveKFcWITj2OaG3r/jNIXAsL2Mmf
 IfgfxSPWpBS2ypa5P/xwTKr9HlMpk3YhbQ88/yc1kmpfo0CWhhTeJpT5+q/+gUNOuBwMsJn0G5dzL+
 nLoxDacqiBS/sxCq5KiZ/hmA7WjgDbavCbedlRO53v96tp82oMrJWBUxvLm41yoQTbnpnuvZFxIg4C
 B2ws1HuxKNOhktqYOk2qe+jzlBdN8MNyslUsJW/MYQZueQuD5MGjbZQElxpw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Renesas R63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/renesas,r63419.yaml     | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
new file mode 100644
index 000000000000..e4db01f88302
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r63419.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R63419 based dual-DSI video mode Display Panel
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ayaneo,wt0600-2k
+          - ayaneo,wt0630-2k
+      - const: renesas,r63419
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vddio-supply: true
+  vsp-supply: true
+  vsn-supply: true
+  vci-supply: true
+
+  backlight: true
+  reset-gpios: true
+  rotation: true
+  ports: true
+
+required:
+  - compatible
+  - vdd-supply
+  - vddio-supply
+  - vsp-supply
+  - vsn-supply
+  - vci-supply
+  - backlight
+  - reset-gpios
+  - ports
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
+
+        panel@0 {
+            compatible = "ayaneo,wt0600-2k", "renesas,r63419";
+            reg = <0>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_3v0_lcd>;
+            vddio-supply = <&vdd_1v8_io>;
+            vsn-supply = <&vdd_5v0_pos>;
+            vsp-supply = <&vdd_5v0_neg>;
+            vci-supply = <&vdd_3v0_vci>;
+
+            backlight = <&backlight>;
+
+            rotation = <90>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1

