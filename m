Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A75373BE7
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379755; cv=none; b=ik+HN6vDEetc6K2wcCGBQS1AhoMGz2cYxrzRw5b7e4k95CiNwNAy70uAANknb/t3zkD0hQkl7Z9PFlhd21JkPgbUHb6Hj+QhPla8sTWpQzouB+5eMXYywaOCV3mjCh7sMySoAxcFMxq0LENIxUr7iXiaJJlVSZlOq5YKwsOp4ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379755; c=relaxed/simple;
	bh=Zq5948yoVNWLdfl4Pn1AIZbbP3FPXFuxs6toZA6iUAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OLJUMOb6X3GwbXa6IBchWRr6tjqA1PSrU569T3gV/aBCPUSI5VRFVkiJe7+5BtninIoHffFts+jX7FiqiU6r3DVKzXTkpGx2gQlf/23wXW6i8JvE6YgueKNY1XnQwZcAFVX7J69ireWw1Cy4baGn4yJK5dszSd0xohLR6I3Khn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVxOgXTt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVxOgXTt"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46dcb6e55c6so418322f8f.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782379752; x=1782984552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvOvrszp2Uvv8rX7bLK7ODaTkPYIPo5Pf15awE1QSpg=;
        b=hVxOgXTtXhd12xIaYg4oFrgunB8h2L6zn4wTLVmqDgl12jFZGG8GAAwOI9TfJmP4fY
         QiZGQccsxqp2JBO2lsgx8g7qdxWpG7tYbzguIBLT9f4owGIHESdg47y8qLVDoMexV7UP
         a99Y05x1lLWYFGn+b8qLrTUElR9aSSvprNoRK+H/2cYj8tlhxTB7bjfqJVOCHq7CJvxB
         Nmi0R3e/V+0RJXr8gqgMnP5bDw1vdNToxgVT1Z3cesDfeI8iWoBPawHIxYs/b+9Dkv3K
         dXBK2CLHAN36CcNyoPNxyE8JNj3fyPFI3b7j7M/KhJEWFX4DhEHx8QoeMbm5Czc4U9FT
         ftKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379752; x=1782984552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hvOvrszp2Uvv8rX7bLK7ODaTkPYIPo5Pf15awE1QSpg=;
        b=ajAUKGaM+sQEX5Y0Al1crxZkShOZANV8imqIqJDjO+7zRX0sXVIRoohnoRWUt3sZ7L
         q4QBRVHoyqd2cLzfl8Dy1oyfECb3IM6CUZ2Gxx6Qa8G/RouVW1wNhKS9KFfVv5kS+jav
         mqEcQOFIsKF1Qq9/HtpZ7QNXSIdLVA0Cefeqe39ATlO31F8XKAMgQcTasefCotnApU6B
         7qPoZzx5iU90N8dwbFYSV3bR/gYHslK5fOaM2eQZK6VzuUbISnhIlkMpbNbDk6iow93g
         9aRxpTD/WLZnmjQv9vwZ59w/EAoUbvgcus6cjdzWNOinMOC9u1NEV99752OQQwZv5mRZ
         zGuA==
X-Forwarded-Encrypted: i=1; AFNElJ9RYV6ZEsYQwJujs7MLE+KBvOR3OY1BVDQmWYCchXWRAeoa4RMfhBa8Cxe/cIt/cxBEoPrtixJ7Tm6r@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ1f0k4Dz5Wcf+KtAnr/DHLlAL3O+y/yrHkHMofrxhbDUScgo5
	RaM0hBq8//75DPZc1NRK3cMJvHlOyBlGgHfeRRbi3y6bG8MmP1kYArJOZJAAZVqWsuk=
X-Gm-Gg: AfdE7ck7uIMGymXjEoHSeMafbDXHwa+BWBg6EPdnr6YEcMQJJdWFc8qr7MwjwxsudBB
	DRcA76bWZMWxCLFEWq62w1tU3oHQaE4lLLFALvonGGBaDXGoT6/FAV73iVovRft8v06JYzzkVy+
	KQP8W54030fXtku1QZKk/wmTBiqmGLYEYLv0iRGTp/GTyPsChZETd7W3Jwb/TDGI03P2T0cvjGe
	1nm60boREqXrgHoiZiATHMpCjvxVgA48yO/vYYXc1H6ek8dPYNslIfTEjjAsm3PBzRD0NN647md
	NgDasfpGO11mirL3IuqcGBKIQbnjSpgWY0bhGVMkOkZKiPk6PAdCqc8oO0vj3i063Oa8f7AK+lP
	REVWsO3auZb9df42NF5lebBVIJEv3h0g1ZC39Zu/DZ98K2X7ZR4ijI/lqy1o1e81BDMLu7FAidy
	l1nQPrF+eDAXQCEiw3T3tA3LuFsAIfLhvEA8xrwDyuv5g0
X-Received: by 2002:a05:600c:3e19:b0:492:4c5d:4db3 with SMTP id 5b1f17b1804b1-492668322camr22201945e9.5.1782379752224;
        Thu, 25 Jun 2026 02:29:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926544dfaesm33846195e9.2.2026.06.25.02.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:29:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 25 Jun 2026 11:29:07 +0200
Subject: [PATCH v8 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-1-8570e692143e@linaro.org>
References: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
In-Reply-To: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2928;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Zq5948yoVNWLdfl4Pn1AIZbbP3FPXFuxs6toZA6iUAM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqPPTkTeZqdgZmxqYH3uVuo1O4jxHMWl2Fsf2K52mL
 XcPjZkCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajz05AAKCRB33NvayMhJ0QZfEA
 DFwB+HpIp6G4Bo8rIlaXtFhEUrw2RIvmGm1WEliAXEYdOR6GgqRM/qhUGTUv91gUYufnqxOY+rV7TH
 VyiF0WTPqIAmZtkif6FpcWibzJpPNXDgTfkzONXv7L+qGrieHM3b/6tCDdVftMGj7Tn+VK1spfoPu5
 3dEGHeCQYoS0vss1uqyAAEVWGjKO4gpZXk/YFLmDguZD1aTIFPfcikuGpSmYPpp2a8bQv4FcjeCp1R
 i9zgixfJn4DJ0OEzA/gQZCSPhpWyFr5V3/SDdzfQJQvcz4rpAHlNJ69/7X3eL85WtuUXHuXF6uT1Y2
 1yKKC9X7v8ayyYkAOVpomABJ3ppZ55wbVlt/ExODC/n2gFLiKLuI8CXXU8K5LVurIqSCnmW7946IS0
 FwwinWnDJE2h4Q9Rq/FQF+Lw9egomlnrCGsUHGsO4icQTaJsAIn/XM27c06MK4xp/wT5FrkowV4ahu
 3TXlGQNHqo77Gsow+a0od3GfwYtyQeujXv4cEi3AgBeokDEV8WE3P+uODPLgUy/ULNxhu1TMdYXivP
 oQ5/e4bmv3ljFwB0HJw8p4XaSBRFo6Ce8plzbBMWL4WYMIdYmRyPqvbfdNPurJRQ/joLd7ygkXwqmQ
 kYDgNbQ+c3+Rg01Dv2oMlJiLh+tKlNQLzKCmE3NQ02cyXatj2vAkSNp5sTrw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Renesas R63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/renesas,r63419.yaml     | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
new file mode 100644
index 000000000000..adfdd2c300a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
@@ -0,0 +1,98 @@
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
+  - $ref: panel-common-dual.yaml#
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
+  - reg
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
+            vsn-supply = <&vdd_5v0_neg>;
+            vsp-supply = <&vdd_5v0_pos>;
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

