Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C17426299
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956084; cv=none; b=pm8VjCl2mvZnmejt2wqOUJiVkOQs71YgJHPDIvyijRzUnoSdA/wstPE2cNi+Pten6lY/tf2UjlSkF0x4ZjMCs2I9tTYf44tt+oUHLssWrDZiaqi44xLzGNMFNEJgtX77aBjvxV90ph8Zw1bgMbnOU1BMOMgyRynOwUqE3k2lowM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956084; c=relaxed/simple;
	bh=yNWq543Aiagc6RVnpWivC9SHy2Deccat9Kz6CH7b1lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cf4oQMbTPTkp1i44k2PFYUH6tyCCRoG/3n5oPjpSrbCyNoASZLi8xUw21aJW6GOzOiOxudfiiQ4NIMNbciY7dNxpHOsmmtHhdL7UflaKKLz6eM1Ejv9vc06S2ZYzJiUxf8MTt9SU5W+sbgXSaQWSpAXiXWCOZHx0TVvI3QqfcxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cj0lIlX3; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cj0lIlX3"
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-451bde4ab1cso367275fac.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 22:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956082; x=1785560882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6a/x50Eo6kNHLlYGVZSsuYw6cqPBcO8EXP5O0WJGjSk=;
        b=cj0lIlX3ro6TKBCRnhdbhFLDW/P/3z6Aa7qlUwMcZQQgZNWn3faS+DxWyL2bLewUtV
         I9lCfBS7T7WzeWSDD+fy+DqioBkmWXOtHAlerIpwFfmixbm4yJ/WiUs20Jek+6F35VqR
         /vagqwBxsRd2GHhLRM6QNrWi49Wb8FReIK2twBan9mtA9j2SXpflm1yJ9u9F2dOJVYcx
         wh9QOzt46xnczbAiILNftfko89xJ0I0aAYJYpw5wUJkwSCwuTMJZRtgdYs+8/JHpDfV1
         C/He8e8PQLCOYEGiCrzG3iDS5d5yPEo+cmoYtJwn1ut+ucdFOPb5XA5X22S52mbZWHHg
         J2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956082; x=1785560882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6a/x50Eo6kNHLlYGVZSsuYw6cqPBcO8EXP5O0WJGjSk=;
        b=dHD61S5m/bXmxSIcNn8fLXii6aYX7jWJOSrNN6K22ba5bWZYj97JXuDLqvKNYxjNcD
         kQ9EgM4SFNfrpqUPnbBF6CM8DI9IGkroKkbf7nj7xB+ap1q14oG8xpashqTFohXNlSIz
         b7aP10B3EWfCPlulbvoFvUAjOcoM3ZIFqvM/lSBRD29EONzt9h/kWG2GyB4wl0BptsS2
         xdeQj9cCPfuU6ppbIUDsGZrgnmefFrHnKIOruDdx+yfzpnf0viOjsJx9Li2r5m1if/s0
         G/NcLblie29Jt2GJE7CeGHp4QaKTAp3Fji8n3hxs6eOkb8pOAxgC3gXrLp5RJopyIcdk
         UruA==
X-Forwarded-Encrypted: i=1; AHgh+RobH6i5WBehGezXRxNrEDEVHzrVdGQ9uNJdDGbNNeudiAtuf8ALPTdaMdge0vu1OJuDsvK7pILGDikS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz/UxcsU34i7jaUbUSIh8Fsv94WDwtSp261riieYsLZEiqP1eE
	bRAKya4dvBezaTGlEeHw3qlnrBWE2K0HOkepyeeOOAEAtvUThgjCPUSgmbgx3FP3ZejEdw==
X-Gm-Gg: AR+sD10xu7g2eGjDnE8Pf2qNL9x/L9TNa0IlQtky/4OjQ+9e/3q+HiVKV8seevWm/Vw
	4l88flMrHmOf03dhNZmPDqceuhhIwcjRHfOZJ1Q6f0EucRdyfLwkQ3JGS+hbTAei7uwNn3YpZrM
	QWQyH/mNlik0EH1YpgjTumBwDKPK9HkyGeBioQw23eSkDeoC++L65EUYMdGff5lzET/xNp21FrV
	vVGQoHRG3Ri09s3u3NGKPWkOy6afKMSw/MlRTEG6uKeiiOBPDgcADX2WonmuErmeqBJDMUzR8yn
	WFyKpJnkJ2pXu+yCNk9VuBwNeCA501nzM1AT0jRHonOtAjLGuiiiniRfGUjoUNcL1gvb7EVf7FM
	xLa2YiURtrnafysWkMUOJhGIeqHzP+BcKv1nmdajytvi7xg7OobUPSuU=
X-Received: by 2002:a05:6a00:a21a:b0:848:727f:2c8b with SMTP id d2e1a72fcca58-84e5959f3c3mr660746b3a.68.1784949456147;
        Fri, 24 Jul 2026 20:17:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:34 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:35 -0400
Subject: [PATCH 03/17] dt-bindings: display: spacemit: add K3 Innosilicon
 DP/eDP controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-3-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Both K3 instances are the same IP and share one compatible; which one
behaves as eDP is decided by what its downstream port is wired to, not by
which register window it sits in, so the binding does not distinguish them.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../display/spacemit/spacemit,k3-inno-dp.yaml      | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
new file mode 100644
index 000000000000..865ea310daaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Innosilicon DisplayPort / embedded DisplayPort Controller
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  Innosilicon DisplayPort transmit controller integrated in the SpacemiT K3
+  SoC. The K3 has two instances of the same block sharing one compatible;
+  each acts as embedded or external DisplayPort depending on whether its
+  output port drives a panel or a connector.
+
+properties:
+  compatible:
+    const: spacemit,k3-inno-dp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: Link and hot-plug events.
+
+  clocks:
+    items:
+      - description: Pixel clock for the controller.
+      - description:
+          Pixel clock generated by the DP PHY PLL; the pixel clock above is
+          parented onto it in use.
+
+  clock-names:
+    items:
+      - const: pxclk
+      - const: pll
+
+  resets:
+    maxItems: 1
+    description: Controller-wide reset signal.
+
+  phys:
+    maxItems: 1
+    description: Phandle to the K3 Innosilicon DP PHY.
+
+  phy-names:
+    items:
+      - const: dp
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video input from the DPU.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the panel or to the DisplayPort connector.
+
+    required:
+      - port@0
+
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+    description:
+      The DisplayPort AUX bus. Present when the output drives an embedded
+      panel, which is described as a child of this node and identifies itself
+      over AUX. Absent when the output is a connector.
+
+  phy:
+    $ref: /schemas/phy/spacemit,k3-inno-dp-phy.yaml#
+    description:
+      The DisplayPort PHY. Its registers live inside this controller's
+      register window, so it is described here as a child node.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        edp@cac84000 {
+            compatible = "spacemit,k3-inno-dp";
+            reg = <0x0 0xcac84000 0x0 0x4000>;
+            interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon_apmu CLK_APMU_EDP0_PXCLK>, <&edp0_phy>;
+            clock-names = "pxclk", "pll";
+            resets = <&syscon_apmu RESET_APMU_EDP0>;
+            phys = <&edp0_phy>;
+            phy-names = "dp";
+
+            edp0_phy: phy {
+                compatible = "spacemit,k3-inno-dp-phy";
+                #phy-cells = <0>;
+                #clock-cells = <0>;
+                clock-output-names = "edp0_pll_pxclk";
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&dpu0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0

