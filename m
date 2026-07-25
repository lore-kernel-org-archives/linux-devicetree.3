Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4428541A
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956568; cv=none; b=BkH632h+Qo2CvdpvOpTUziT8TbmyCLpHeC0gpWdpUQQJyCVCuKYJJg1GyN4KJB48gVndBwwNyfEQef/WLeWA/jbosWVbKgOEYljD7N5dUFKejQhbl5SCEC43AtTnpuaJuwSs9dpCC1cfLiCD/9jwQlUIqLoDkEYFVirFxr7//7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956568; c=relaxed/simple;
	bh=e2HtZIpFAeEzBhd8fEr6izzVbI4e6Mu4fEJXjQ+ijhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BALvxgPOH1uOz2XKUzC+seUHVRQryrZiqy+JubTqWrqSLEwcXl4ngzpiBnhGfR3EU94RUO4t9iIKalRytiPNk2itIQouY0DhRvzEhjd5vOsT1Nxd5Jyw2MsRTM/IfD4w6tEoKJFYpPrcYeU1NjBesXvGyJWaN/RvgY1EZxV0a1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcJ1lxOn; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcJ1lxOn"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso886127a91.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 22:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956567; x=1785561367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ycy+Qjco0x+8uNmV749kGmpBtIQZVaDIzcG2OSIxUnc=;
        b=FcJ1lxOnOW0tF4sRyqGT7wOs4buLt8XKk5MFBFl7CX5nKuToA6nZESYmw1jkrcdAaT
         ds60mLjPy5XG0bFu1+qB+ncyTTOH2ljT2ybmA0cEL+W5XKbsyKv6+tWz+6bvXNxgi53y
         pCyxeTyI0GewEqeS3w4RT+4aOhLLd7dTZ+1Rn7pPd0zFvYZv+48QcEV9lrTQOCLV+5c+
         O2v+p/Aqxk12i+kqrO1QSEjnXjkW/9QuM2e3nO5lbVYvHC55WX/alNEZy0n5eGIMZZlM
         ewejxAd2g79rcNt0EKiOC+Ran7j6jlJ6Fue9sOX1YN8DMa9+A7jBCg4ti02PunpHIfwn
         bYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956567; x=1785561367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ycy+Qjco0x+8uNmV749kGmpBtIQZVaDIzcG2OSIxUnc=;
        b=qzVH/IBXD41lZ34CTSYrA24jLOLdB6RlZVSIJfo/NnVM5yOvcZV3JLAJf6xXV+Cw2f
         xRs0K9MM9amXtPPfHJZ178Y8HlezjsmT228LPDbwQ4kD/U1TBzVQveCXT6VvkQVRoJa7
         owVr3WKEYumcjDUvpxQup0K4SR6TXRcV0v9vWMkkIoJHxoufcdeZNqtXA5cZ+8h/YvrO
         z8CybF9YHQvj3+0JhhmqgMRTX037ZFE5UBOtyDri93w6r5EAjbQ+mPr6loo8QbcDkU5v
         7XUy0z/AktE22l19PWky5nAGviu6Z96cETtj2p7YeumBqceHP969iYRA9bGIYQja58lx
         tKQw==
X-Forwarded-Encrypted: i=1; AHgh+RqSUEsAcrwyvnsvUkNKYpvz2idEWEqnV7cuu55M1hM3Zi3/8cZb4epYNcyUu5f1Vg7GeXbc8Ve1yXwg@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPCKv0Rm0vLqGbJ/ShtwvLzY5xZ3v3CaN+ma0wZNeBeBz0qEw
	NOVwMBF+w+sp9quYu1TKCh9GZEs1LBnR4nKDPESIwpAOUzrXwqeLs8klhDilZmHcva4PSw==
X-Gm-Gg: AR+sD12x5GViy0M5FADLpyV7C99kjTs7B1L+qCK6/MsEKvyM+E7qZE3gAveT3r8S6sr
	VfSencrSYcHdCsXtm4m61q4DJY1cL4ZIcL/EbukpUdtNb4Nya0ox+LjIBY7r+jIOcU2qtX278Mt
	6OwCJndu1He87wLuPQL5rVN2E8KwomC/bqQ1FogW08yRNVsKHnotbOtDE5y9e+iwlvYLYWsXx5Y
	Q8fk2lgUWGgqrzg/8X50LU8aiqpAn25vcrL9u1ptYQzlr/jr4m5oM+NS+BbsdRpTBZmWSgnnu0O
	yN7gZX/uI3N/eiDiUk0/0viy6xV39Oo4pxruquN3CuH3jn1d3LrKbr1goWP/Hx0OQ2MacGMlApK
	OaGaCHrdEiKf452Do5BFPmiJrNcbEmSU0PZVzk2YdGmMObOs+xfBtJ+4=
X-Received: by 2002:a05:6a00:2d9b:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e593ff0ccmr644911b3a.13.1784949438724;
        Fri, 24 Jul 2026 20:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:18 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:33 -0400
Subject: [PATCH 01/17] dt-bindings: display: spacemit: add K3 Saturn DPU
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-1-f22a10a52867@gmail.com>
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

Document the Saturn display processing unit found on the SpacemiT K3 SoC.
The K3 instantiates two of them, one per display path. They share a
compatible: an instance differs only in which register window, interrupt,
clock and reset lines it takes.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../display/spacemit/spacemit,k3-saturn-dpu.yaml   | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml
new file mode 100644
index 000000000000..97ea9da4b68e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-saturn-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Saturn Display Processing Unit
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  The Saturn DPU is the display processing unit of the SpacemiT K3 SoC. It
+  composes the display planes and drives the timing for one display path. Its
+  output goes to a DisplayPort or embedded DisplayPort controller. The K3 has
+  two instances.
+
+properties:
+  compatible:
+    const: spacemit,k3-saturn-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Online (live display) compose path.
+      - description: Offline (writeback) compose path.
+
+  interrupt-names:
+    items:
+      - const: online
+      - const: offline
+
+  clocks:
+    items:
+      - description: Pixel clock.
+      - description: Memory clock for the compose pipeline.
+      - description: AXI bus clock.
+      - description: DSI escape clock.
+      - description: DSC clock.
+
+  clock-names:
+    items:
+      - const: pxclk
+      - const: mclk
+      - const: aclk
+      - const: escclk
+      - const: dscclk
+
+  resets:
+    items:
+      - description: Memory clock domain.
+      - description: LCD domain, shared with the downstream controller.
+      - description: DSI escape clock domain.
+      - description: AXI clock domain.
+      - description: DSC domain.
+
+  reset-names:
+    items:
+      - const: mclk
+      - const: lcd
+      - const: esc
+      - const: aclk
+      - const: dsc
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video output to the DisplayPort or eDP controller.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
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
+        dpu@c0340000 {
+            compatible = "spacemit,k3-saturn-dpu";
+            reg = <0x0 0xc0340000 0x0 0x54000>;
+            interrupts = <90 IRQ_TYPE_LEVEL_HIGH>,
+                         <89 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "online", "offline";
+            clocks = <&syscon_apmu CLK_APMU_LCD_PXCLK>,
+                     <&syscon_apmu CLK_APMU_LCD_MCLK>,
+                     <&syscon_apmu CLK_APMU_DPU_ACLK>,
+                     <&syscon_apmu CLK_APMU_DSI_ESC>,
+                     <&syscon_apmu CLK_APMU_LCD_DSC>;
+            clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+            resets = <&syscon_apmu RESET_APMU_LCD_MCLK>,
+                     <&syscon_apmu RESET_APMU_LCD>,
+                     <&syscon_apmu RESET_APMU_DSI_ESC>,
+                     <&syscon_apmu RESET_APMU_DPU_ACLK>,
+                     <&syscon_apmu RESET_APMU_LCD_DSCCLK>;
+            reset-names = "mclk", "lcd", "esc", "aclk", "dsc";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&edp0_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0

