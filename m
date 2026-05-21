Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B773A4F2C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351268; cv=none; b=a+2oPHNFDahmVIBiNG9qVD+DEd2+Lul/pFRl8MnYJnV0MAq19DwwHeCupZnWpm1Lb4R5jsNIM+evrXhR4BoDouqwM7OqZDVHS6nzNIPH3n5nwv5hWlCUznVvzMF/jco+SFsfqs02JGMFzJa7lAo7mfk7HI4/d5cU5QCwGmBxuhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351268; c=relaxed/simple;
	bh=vFhP3FNbtu2wk3JAQk77ufguhpweIJKES0bOXeSkpV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avYRGWCjN+eYSE1Ln5VMNiwhXEyaepeNPu4hquZ02PU4Uc8yPZidsCKsYpVI1GQTWsFK26yGqg2tgGlqeMUnRg8QXzWXlbHpssFcWbY9KkWdVpgN6/u7snnxNG5l8tugdrDHsCuU/oa6e4kdaAsyAbY9UZKYQKf/V9u0HK/MmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oE74IVUP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oE74IVUP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48909558b3aso59370825e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779351263; x=1779956063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xfn8fwroLe9/zD161wrcPghnqU9tQEqX2zqdv84MfM0=;
        b=oE74IVUP2r0hYW+W3u3jLmr25DHyZ9xDNHTOJLRbcU/xRegoDi2wO9rmMNNVXFY9W1
         0ItxEFkKJMbSAxVv+WTCzjNzmuorTjTUyF2L3kPXdlWmXjN8wD5ymxIxR+DIXJXHcKTq
         cmPtUwekvRmh0PDQ1W4Cr9r9eLh5XIPsLF84Ust75CHcwVzjU9gZ21d7hz6u7LDbHg8u
         cCzm2RLnhI6ic0YZqbIwdbIuugqWTIzoeqwvOBS9UyUvWVJ3rfSBPE3F1CtYOb9TBE7j
         3r/3ZAU8danz24YEPH0OBHC3l4Fbhy4OY2W3ADcWuVX9ymcAZG0+QkZsPgUf59BxpsuH
         WGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351263; x=1779956063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xfn8fwroLe9/zD161wrcPghnqU9tQEqX2zqdv84MfM0=;
        b=DRq67ZS5j7372pp6XyBDzWRHiew58nlZr1Nyavu31hqiXLti+FsVe0exSju2pT8HfK
         nz9czBnFfL5D65sRHt/uG6L0fPRBmDUWD2sIDCLKJYPFGyYBCSi8qBCcA9Gqci2GQ3MG
         ol5bQevgP/ECVJ1FjvXp9l7qWTjZa+CtD52bLXMmPNgZ6NQLUlGsBHHhw/ZXwMCp7E75
         rPFN0OeGXuaD7AR7PCHrBaH204tD68Q/XxqVyWmJ6B0yOgotOmX7xI53GnhqwGWtWynB
         2HohpPl9/cnj0ielMOvOA35jRv4hX9Ky3ujb3SPJ+UFaAt0NzOhQ5OXfg5Ilu6qxwj4S
         ytog==
X-Forwarded-Encrypted: i=1; AFNElJ9F+1fLC9vuu4kgb4JITQWxKEr4gZlRHUjG4A0LxGAt0tPbYCvBYYsE7gXRSDjaNhTItdjbyaF+locu@vger.kernel.org
X-Gm-Message-State: AOJu0YxSTIYpG9wtEPexgwy4jdJOx8ZTCpCYWjgI+mdqThIyskn46pbL
	LjGEtp0kv5a6cDxKkkRQw1/UsgYZ1oPMvDJugk0wugfy1mFDDJSDyG2SBzJPoWZzC+E=
X-Gm-Gg: Acq92OEi1burAki9TjkJSr82x2NcSPId8i8GIgpRB3wfrsZ5khwpHy5oR4zvpkMgaww
	kbg8+Qr1sjmMcyWdBOrT5Z2tRmpjz1/lvzwmq49SGPzm05RiF786EVe1A04fw3owwOBdwbyTkOK
	/VOPmfTfwKNnABGJSuG0oTYpmf3Nw+PTHz3k+l1H9FAmvcyZl5jbLliPUhRyT9ZL0x5q7wAArjo
	lOGEF8FO3H7Z4RvHHIjYB0zub7L57qWcDZ35d6C3GxfrQh+1Y6GMDjCwI3MCmOa44AFX6AcEfCr
	8vucedQH8LYWTUrGCPB9GqobEqknF/ownKXhD/ZvuXI44a9/PrljhUB1X/LIbL/njRXeywZl+uM
	5NJ9qYzNLByNALV3goPSnxTddDAmldDCED4X25krRe5gSvtTuqAgBXK++htTra0ggwq8ZSApJc5
	cX8njf68r2eOTmn9ds7x4oknQZJEprLlUZs/LoUs6STy2D
X-Received: by 2002:a05:600c:1f89:b0:48a:5501:7995 with SMTP id 5b1f17b1804b1-4903606b594mr21078725e9.18.1779351263093;
        Thu, 21 May 2026 01:14:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dab28sm1056384f8f.12.2026.05.21.01.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:14:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 10:14:19 +0200
Subject: [PATCH v5 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-1-dd5700299390@linaro.org>
References: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-0-dd5700299390@linaro.org>
In-Reply-To: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-0-dd5700299390@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2875;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vFhP3FNbtu2wk3JAQk77ufguhpweIJKES0bOXeSkpV0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDr7cxr1fRhPMxGRAc7BowL2W/SIwenTGbKS75sYb
 a8XBmMiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag6+3AAKCRB33NvayMhJ0ctoD/
 9cEh6BQJAMyFBbTUgaPFbzSw2ucaMOPuNgLinSPz9d+441wqtqlF4qXc35jaWlBrPx5f1ie6quYPZ6
 YKCIIQfWFzak8SIKcw37kjMJ2dK5Q90KnlrYJ49m2Jlhbh/ZLuS7hjjNzA0k+vB1wT6vsvV0tfq7w4
 g2E+X/ESqRB9QI2bjH6WQHMUrGe6Mr5CV4YGAiRCwvM/U6OgpzeAlGx7R3C9bN6VTOV7YWz88IUEpq
 RiEFpHxVaJzLQX2irLBKPq4aJ/jO0WIDfHKp1A6aiTFSiv8TEb647cCORkdZe+3opUZr4QeGxUDfvA
 9nXv/S6SVgJMaqUN8JLLi1oVMRbBQ1Md7ko5ZLl9Q7fbPQKLJgWgTAZJfjNp/lHpFyByunZpc8dsYg
 ge0ALs95TFF2mGA56XdHcQz0gDFogVhYPEW6+Fk0mo7wG/EUm7n6p1G4RE+6SOk4CCoAgSAsLvEMqE
 2axBoh3cnFP50WsxH0M8HazYB4J3JhEz5m1m7wZ3PA0mpPjY4UreXVPSvOujnQrXseWH2l/er0gu5G
 lfqzEr5ShL/snCXfcMT0F8OPP1wzMww4Zon71jO4yzBO4ttfJyJ3cbqgaVhluvGoKIIYcXkDBF7VdJ
 0E+ZhHKUUg7Zfkm6wXrZu/aTw1Ksj/EvA/mI18SA0Yn9iXOpsfvfOcCcVEVQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Renesas R63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

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

