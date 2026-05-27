Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C11A5B9E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862989; cv=none; b=Ug7GuwvxgFAhjs4oZcB4azdBPAnu8TL1WC3zHTZ0pVkdvmnWWGTN4VrQ1ghecBNuwHqyI+esAXQ6W2oRcAUa4uLqlGmVUO+8iFNcuTEXy3H442V4YdNMY5nqTgPXUu+YNdR9+RLz40y/A3XdsO6Vr8Qa0skEEMlKtjvfKBsuSfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862989; c=relaxed/simple;
	bh=Uki1z/e2Idx2kaPqlCmEKaUf/e3g8xreQEcq7ICqznM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipRJtLNJxLtY+SAvq/cBB0oj1Yd0+tR2YvnaUnc0Ox56oxQ3dKXIAn34FZIvv8Q2FaEkls+UZSsf05a782lv9iriI4aZNbGu4HMLsm5lolu2O4tRMTMgFQzPTYTgZCzbOQNFyq2JqOLYKCROr7CqT8+b39uRfYwnyHxavymZdag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=fBd9tM5V; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="fBd9tM5V"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so118312655ad.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 23:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1779862987; x=1780467787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJASFrwjoeNGT0XkAG+AYLQ0wHyxti3wxbxL3mwKs0I=;
        b=fBd9tM5VNi6YstO8KiBmYhk4uhCopGgUqWEITY0qpI8mq2ebeZEm2TR/yT5V0HkZTq
         a6W0hplsepdh716NakvnW9ol+TfRjHRAs9Kwj1v4fATsLMv7XwFG3HAY7gK8UnB0M8wP
         9agmbrcOnDvR3/o57TmHKrQN0KPjw2qNXDeobwLUro+IKYWXAs/f/aYsDBCBQRhaE8/7
         mzp9Z5LOa5RcaTMFJ9PIscZtCri8aVi4Kjqfw4Nij/qoUlkcqOsnHN8X/T+mzHi0OcPD
         lgCr65tlIqT9NdVy6f/mUwCXoCZGIVgIoV1s2b/UYjsL0UDU+jJR4Cvr40VmIf7vjmDG
         kJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779862987; x=1780467787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJASFrwjoeNGT0XkAG+AYLQ0wHyxti3wxbxL3mwKs0I=;
        b=iFEAud3hcshD47GeGPHVJoddIAyb31bQ1IlIVhKQpZ6jXOdv8V5DhkdoVqOeE2yY9p
         Z9iSd8faDVOrlmjz6Bfxta+k4t229XmmMVTWsh4mEaY8NFcaOz3FvGgvnMDvpYpOGRM3
         6AGbDwL21ZSjViX94bGyN6PnR3xwVodNTUkoXxvJ3TDALolCJ/nBOIE85PG81TK6+cpO
         IM+C2mv1w2VQGh6rRTSMwRoVncjK39u6trtnRy/dI5XuAVoW7yE6haTXn2t1gPxUSmnO
         z1TMWc7Q+X0jJPrM39/LmulYCL0LY2/yxrPqEBqdCif3/hJHGw6IlKWwMHtayDngCdgZ
         hBHg==
X-Forwarded-Encrypted: i=1; AFNElJ9k/JcDAGOMzMb57IFDGpC3RmFIReCpA9P5QxQm3MwZyPYF5R/C3m4rgMOQQu7y8o7oc0r4WNhAwRnR@vger.kernel.org
X-Gm-Message-State: AOJu0YxdaJ9ltpEV9FLwTubIXMeQ/stknbOkxn0yZuuxX3Eseiza6+IT
	2Aejhl2lvPc/EED2SIGlUIPFjptoCaSPJwGexgzArooL1oS5mWkgLqqWoWcQZRJF8dM=
X-Gm-Gg: Acq92OF+5h0rESrsDGcD7Ko8v7bH7W1mswtGftAPBms6f3WJAknkV3uOmHt3g8rsyaO
	1wo6jTxXi85RLLYZDloAPyTDBlcqdczIQvY9GU7ovhABCG0+IM3jEJVbrtU2XZ8wV4/vyCZP9+s
	XY2VIFe31DKv9uZOuu/Y63MUhhmHjT2DB1gNy5HvMqJvDx2LVT63sTc0GT+anBq/HOAHpAVWkZG
	QtxyIwhvvl9GbI7F9Oy90ggkojaEWucnOdOw2FgN6R0AAX5hVARsTkBm3T7O5h1OZ9SLrQ2e6XJ
	y8gVZlrz+HeAtOBFp6N/iivDaGcsBXFPofi/9fXjmztUc0s1+q9cFnLIVhdWy3LMdCby7P1C1zE
	GThYK55YGuNgkHiDVdxLriP8ABAOUwv5M71xm1CMZFa7+tLTtly/C5z3OZBUcy9CwpUospACnsz
	N/KNi4JVVxCIsLOZHuMIEDWofFcg==
X-Received: by 2002:a17:902:f64e:b0:2b2:50bd:83b3 with SMTP id d9443c01a7336-2beb035c826mr231476725ad.10.1779862986733;
        Tue, 26 May 2026 23:23:06 -0700 (PDT)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm182387205ad.6.2026.05.26.23.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 23:23:06 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add Ilitek ILI9488 panel controller
Date: Tue, 26 May 2026 23:22:59 -0700
Message-ID: <20260527062300.88928-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527062300.88928-1-igor@reznichenko.net>
References: <20260527062300.88928-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Ilitek ILI9488 panel controller which is found on
the FocusLCDs E35GH-I-MW800-CB MIPI DSI panel. Add "focuslcds" to
vendor-prefixes.yaml as it's a brandname and a website
(https://focuslcds.com/) for Focus Display Solutions, Inc.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../display/panel/ilitek,ili9488.yaml         | 63 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
new file mode 100644
index 000000000000..ea7449273022
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9488.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9488 based MIPI-DSI panels
+
+maintainers:
+  - Igor Reznichenko <igor@reznichenko.net>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - focuslcds,e35gh-i-mw800cb
+      - const: ilitek,ili9488
+
+  reg:
+    maxItems: 1
+
+  vci-supply: true
+  iovcc-supply: true
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - iovcc-supply
+  - reset-gpios
+  - backlight
+  - port
+
+unevaluatedProperties: false
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
+            compatible = "focuslcds,e35gh-i-mw800cb", "ilitek,ili9488";
+            reg = <0>;
+            vci-supply = <&reg_vci_panel>;
+            iovcc-supply = <&reg_iovcc_panel>;
+            reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+            backlight = <&pwm_bl>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..5ab758570248 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -600,6 +600,8 @@ patternProperties:
     description: Flipkart Inc.
   "^focaltech,.*":
     description: FocalTech Systems Co.,Ltd
+  "^focuslcds,.*":
+    description: Focus Display Solutions, Inc.
   "^forlinx,.*":
     description: Baoding Forlinx Embedded Technology Co., Ltd.
   "^foursemi,.*":
-- 
2.43.0

