Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660CC3CFF6A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179797; cv=none; b=vAiToZeiIeLWu0yNTnF1qno0TfM5TAi4ZcR+tKJSo0Gjx4Z+QxA7PB2nPdedkoz4g4qz9tBCiSIARxTH0RGUpPT7eytfgmUq3GcmDwqJGbykvxm9/xdsynKjdMd++Prm5dgmnGDJY9BJojnb9+C9pXAEh48WuaXie/7A9c+gzB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179797; c=relaxed/simple;
	bh=a79mpsBGOjBG04lPkNMqGEl+g+V/3IKRDyM8eJWkROU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mG8sMZ5p8+cXd5HdZQu7w+JHkaMDe3hWzGO3jx/saAwozRH7q/YrTeGVmLrGWypG7+wSk46Uz4SAzwpJZbAGXunyYk5ZRUUyCmhwP+8N8TzdG5rzpJCMfXuH5ojOt0lIAsMmzPNBwyxYaXfCPK8TJ9fS/xXfvd0m3X5AOfbOzWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjWFCGzx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjWFCGzx"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2677880f8f.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785179794; x=1785784594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUnEXYHfE21rZw1q9AJTuUDahJJZ6wDRNt2yCVGSXAY=;
        b=HjWFCGzxEWUi1ot0o7PPhm4ZzanA/Lgy3SJel1kqjDQYt0Tm95IlL0jiziC5gE9ECM
         CKvP53x1NSAM1yGIs/L86l/Cu+lNv3koCBcEryf6RmWdOQk8o0JK4ymEkJfHY2OERAtn
         gzJSJYugmQZ+dJJch08/7XUyf0rS4FuzEz2GUDai3CL37Ywo2pRU3KJCVzIjP4ly6tR9
         L+fiIjQmQz1r8o/YFaRTLlPFNlO79L/CbQ7lJIqO9PQLIxLeyhV6JdicQw5jR9s7gvJB
         yJP/lFDM825Ac3wiuaJhWxyPQRlGJWFI3mR/TzKUqBAVaQTyWyHZjJE0BUFuo9tmovH1
         UUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785179794; x=1785784594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUnEXYHfE21rZw1q9AJTuUDahJJZ6wDRNt2yCVGSXAY=;
        b=ay30VEC7ca8M3I80LCSU1IGxZi8yeepbYyhr3O7kiQIUNV6wfIcqw9T5kB72jBU//5
         i1+2kcz7S7ccVY666SAWxeuhYiHOIY+F5gdgTM+OszpvRayxLqD/9h5qPVgvCxGKHjrr
         ygM8YDSBtxR0gMLQ2BW8C/Jeu3VVgVvHwk+li29eRbqOkSFCLaC9ob0tCKOHJ/+vJwl7
         yYHJZibzcVFo8/RM3tZy0aBF/7A/wZFtvVwtlYPXhcRAgNC0lPYAMc/ICVTMJfoj+otF
         rqHWQQE/kYvYVhFO08cm1cZW8Zufy5ZDlPAwvPE9AGaYRSwY1bapHkN4BokXw2umTAL3
         37bQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhfOtcDDyreE2OSZLyyHkcn62mdAF4tNzx1OAIb62RXZjx5RqNJGCRr+lAT8Gyiljt0oOTFPkhvruR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ZUfdO8FDdvXbRJYeYDO4lv43WS2ihPI6z/wQ3dbtYvsjhBOF
	MWICGiHa5AhyT5uWdD9uQxGHWJ6llVfGWIGXo/VdwBNE3HUHOaxvOGFFx1zPCowO4XA=
X-Gm-Gg: AR+sD121rNJtU+PEcAxB6Dd0gIAbw8HLrjofeRYdIuWi1hL+pjvwoa6hc1/ePCx86ML
	ohzAcwFmC3lLvdRjSDNZCEAjeWsFwfXJ/6ECx1MwOQg61annnxaB9PcCTdrBdb+zfMzXS6r94Y1
	vQ5ZSBuO0bLbnCrznRscvSXHTRPWA/ESa2i8QjxWmd2IqIQr8/ZKi7uINLictXnz/rvGI8mxr/S
	pAkjv+9aZr5F/xip19E81Z7jzwExTx/3AvXUFFMB5672xEt25SQTzVbq3CElOkhD/kEsaKxwx81
	eCXA42lQn4Tw8n3mZCWg+aDGQRISYJdgoYSh+U12qnahnqiiKs7ZF6T/SoaUv+DTeYZPEAvIm8P
	Qzxe8Pz9qggd/K+D69ZvmPVqMGKCjAdHb/vHbYRJZpu7tDiQ1xv92VHcU6QtQ5PJQWg2JRdRQGI
	qQucW/YpW8TCcgS65zHeoeVua0sLbJRulddCk=
X-Received: by 2002:a05:6000:603:b0:47f:8f8f:e494 with SMTP id ffacd0b85a97d-47f9fc8c3f2mr12091014f8f.2.1785179793590;
        Mon, 27 Jul 2026 12:16:33 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.105.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a6d7sm50749607f8f.2.2026.07.27.12.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:16:32 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 27 Jul 2026 20:16:23 +0100
Subject: [PATCH v14 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-x1e-csi2-phy-v14-1-27d1bf477593@linaro.org>
References: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
In-Reply-To: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6404;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=a79mpsBGOjBG04lPkNMqGEl+g+V/3IKRDyM8eJWkROU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqZ66Jn5OlDyo6vhpgCBin+L7h0YqWxbGjstZVP
 C66uQ4oTc+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCameuiQAKCRAicTuzoY3I
 OjgLD/9B+NyWa4Vrj9hwA4hOIP4+MnDvWvT4lU0FeJStXf+PS5UL/DJDI9kn+zRvpVNH4UiFm5K
 nD3FfNcC4yGiMPheIeSS7C3lgRgGW9FRt04CTiSkkYQ1OooIFY7IObhF0Mny/t5JmPSCDdU/9cy
 XmW5csB1WjHEIfGLGGYZae+ubqazIjj83VD4e07U5nH6U/UIMZajAeE3C+FH2q4btUUOz/5Pty3
 9iE21Tzbnm+GfdP+kvgBRRzZWLtfSfRj6jmfXA/pWi/Ygb8S25/rtG0N1oivKts3hLqA8vVE/hv
 qgke0/e/lH5i096Mm0DfYHoAPLjrviJ3nh+ILOwdEFO5zd3w+qPVtGfZ45cl+10TKUAE8lrxONh
 fy290+FWYkjv0oY5cTcgs8z4gSDENtX+cwZQjai/7HzCs7W/DkTEkAeOPXeekpjoBjXmJy9EmKG
 EmFKAo1Kpf870hWcbFtvCT4B8XSakoo3VArwVZTYnA0ERccDyPHhE5iIS4JVDpe1SepJWdiE/IB
 1G+J0EEC0T3w2aGfFi5LIObt9oRaEKaclxMf/h5r+OR4s8LTH+s+sTF2VTAaBoB4m4oFd4DbxTb
 Oab+Gi2Ry7gJ9qeiPe89bLwfEmtY/NLF8Wg6E6NIHItI/xjO2INo3soJ0ZONnJFtKae9n9J/Fyi
 ZgtEtc2KRY2obKg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
supports both DPHY and CPHY operation. A special mode of DPHY operation -
called variously split-mode or combo-mode also allows for two sensors to be
connected to one PHY.

The submitted binding here describes the DPHY modes of operation only. CPHY
is left to future work.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 198 +++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..7d0363812aa89
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 SoC CSI2 PHY
+
+maintainers:
+  - Bryan O'Donoghue <bod@kernel.org>
+
+description:
+  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
+  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
+  modes.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+      - const: ahb
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+      - description: MMCX voltage rail
+      - description: MXC or MXA voltage rail
+
+  power-domain-names:
+    items:
+      - const: top
+      - const: mmcx
+      - const: mx
+
+  vdda-0p9-supply:
+    description: Phandle to a 0.9V regulator supply to a PHY.
+
+  vdda-1p2-supply:
+    description: Phandle to 1.2V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. Always present. A single sensor is described by a
+          single endpoint with one to four data lanes. DPHY split mode,
+          where two independent sensors share the same PHY, is described
+          by two endpoints; endpoint@0 with exactly two data-lanes and
+          endpoint@1 with exactly one data-lane.
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@[0-9a-f]+)?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                description:
+                  Logical lane indices 0-3, not physical pad positions.
+
+            required:
+              - bus-type
+              - data-lanes
+              - remote-endpoint
+
+        allOf:
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 2
+                      maxItems: 2
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      maxItems: 1
+              required:
+                - endpoint@0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the CAMSS CSID controller.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - operating-points-v2
+  - power-domains
+  - power-domain-names
+  - vdda-0p9-supply
+  - vdda-1p2-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    phy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>;
+        clock-names = "core",
+                      "timer",
+                      "ahb";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "top",
+                             "mmcx",
+                             "mx";
+
+        vdda-0p9-supply = <&vreg_l2c_0p9>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    data-lanes = <0 1 2 3>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csiphy0_out: endpoint {
+                    remote-endpoint = <&csid_in>;
+                };
+            };
+        };
+
+        csiphy_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+        };
+    };

-- 
2.54.0

