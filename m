Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E49B2DEA98
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 02:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779504540; cv=none; b=K5WbuTUAP5OaZD4ZP87UZkmkR6CGs9xtQmILBzpnp47krEVXS9rzwSpng8DKDLcnzNvSc7VZD986XgBBjr/pIAkGy3Q5Rn3kuNX9PypbJjy3EbBpxVwhzgVTSjyC7gtPUe9FvqwvI8GLRjSSy8SE+vRZMHxB/amJyPwW5bl5Il0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779504540; c=relaxed/simple;
	bh=ksE9IzGsVOiPiMz3PetPeTc3/hG40XGcqECVS4HfclM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g68qJnyxCThZO0oGJdVBcxFPkOwz7El4cPpIi4zXW2B4dTldtj7yUOhdCd9DOsua4TBCI/c0pvwXJCVUYMxcL4mkpo56/pD1LmIKMFWfGoP1vHxvWUX1o96QWzwAeeX5vmgrizt2kn1C1ZqZnNHPUQnxCDmXv4symY0j32uI41g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v757jC0A; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v757jC0A"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49048e043e5so6888865e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779504535; x=1780109335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpqokVh1FuDolR3bjOrXVJUhBU/P6kIDy2rIFcxqce8=;
        b=v757jC0AU/bDjs/JZ5pd6q/IoACAKx4ozTZYMvOcz6AAOk2vBZyjN+CqGit/vjhyK2
         Q+q12epBLcMCQ3ils6fRiivz+1Kht65yyjwr1SouDHX4pGI0jSf+ek6d4LpJze5gRHWZ
         CrQDpZYTmiGQlf+q0xdrpbHZzy3ZuHHUnKYPJFScebpd58teqT/2HMh3iRKkYhij6QpE
         22hbx3vTKnTiFLbjnE+ppdrFBfKoqA7Cq/Q5QSES/gqPH3AmEKiY0IsmD1wlJmeLmlO2
         Da10HEaKqSVHmsvtBFdB3HMAeV6kuozf1Eh6MbXgLgh9C6qNR5tdNUKG+dyU9xEPwUwQ
         M3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779504535; x=1780109335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZpqokVh1FuDolR3bjOrXVJUhBU/P6kIDy2rIFcxqce8=;
        b=b/SqQdBoYwL0BAh4biQXqc+SJI1npyhldYarewCDPGOghbMpzCqDLlssD0dtM6HdIE
         N28DtoPKpvr3/Lq4jeARkZ8/PNcHPYbfDesOeH62EnBEJGOX6mwQFr1ktYoYVc44dS0B
         xth7PhLWxzNKnNn1lHz3TMl5HEd0tY9mtM8cc19okPUNoI6Vzqp9EvLlA7nN49utabZN
         HfiIQBJZKdNf+lWytNDit1YXaQrVFV8AYlSYqvn807kU3xRo/E4GGfWaC1Ifqo9cn5e8
         rFn//IB2YBk881iXpiwZj91CKYGYwpluNesV/mDxpCLMcrYshLu52HVX9cYv/gtzSdLm
         BQzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vPFMSBzpO8lexBjeWR2Wu7YI+E8ijzDJpzsp0N4iQcoLpS/Gbwk/gTjSm/ab0YOFZEVRQvDITgSUQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzlPtW3KbLVSDe8cn3kGipYod9agS8mZ9T6MBlOLF2bwXxv5ERh
	jJu2OoReyVNO6BBJzptE1q6oVJLT5foo+rj38aI9hoCbytcj+2hx/fM7cqv2uzQG3fU=
X-Gm-Gg: Acq92OFf0oQTmqqyWLwz1GJ9IhTPKK47u9rH4/ZCZF6/d9KHj1muAGBnIW3s4UCdETk
	nuuwbjxqgc5rDqe0QCmtnmUDnmpzJtQP4gxMPh0FAB2Z65fyp/eC0kJRHLDsUu/y6z0KktcpfHC
	krTQaem+nvQm3KqTmC3kKddh7Qv8k8W7vV0uUnDwploufMcwnMnuig71ezkkwGMCiehafTtgrBw
	tzletz7NPKCIxldhYBvQenCQgcTtJAdoVJdkwBbloICXJivbH6NcPde23Gz4LV16TyWYbJnh6CN
	/aVYlQLvCI8lrMun9Z0y28vL/qBg7AAysjJZnjxnLMMm+MWGrBoC8GNI+2Rz0Js5tpj82itwTP/
	cP4gTAQAg85VP4kjpusRxbcuS4UjBMN+bjq6syhKBJJGVRV7cduYto/Tn1V31CcauKGMd4Cg8Z3
	a9TrXShJDcMXhf4qdqFojrpMRq7QIhLRsRPQ==
X-Received: by 2002:a05:600c:8217:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-49051e9e233mr7104605e9.27.1779504534976;
        Fri, 22 May 2026 19:48:54 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.145.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca50sm77938765e9.2.2026.05.22.19.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 19:48:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 23 May 2026 03:48:47 +0100
Subject: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
In-Reply-To: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7217;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ksE9IzGsVOiPiMz3PetPeTc3/hG40XGcqECVS4HfclM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqERWSME4EpK2d/5JPuYSQIQCI4mTc8FjYMEryO
 I9h1w8mgdCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahEVkgAKCRAicTuzoY3I
 OoFoD/9rMWDg4FRxEc7CpWP3FkkNIhLhPloMolmD2ZizRvmmtxOMiic4MznI9AdWEDMdCi9yAZn
 hRqwrtpkHeg3pQLRmWU5TTryFgz5WTMLyaXAcY4HqoG2Gyw08FuJwbtwvwH2aH44v1HoZvp0O4/
 M6OYL2qQm6J65cizP0iy3yKA1mQ6B9RWlsvqeLAfQ4Lk9Xd8gHTvIUwa7W8YAEzyiXgX/B+hC6A
 nZCOFEjwUDsKQg6/1YM6QkkDE9k99lt9Qc/goJtVoiOIG1qJb0cB4tNlfCbD2p2LkZM1p/dOVAL
 XlponAKgOUZ775V+4mVmqBfgfHU1GlXaAjhmNAwQW8kFUT0zwXwnrqFgbPoOj3DX6Xouvn5IR56
 dDoJhlQp0ztOAXMDy0tgzt6gxp6ywBeo/rfhBo76C2yY23xsMr1QDI6aeijjiLNlE0cGsrZ/mA6
 bRvXttP4q/3BLEREEAFctAHr+6y04Y0LiUDHHcVB1c/aMYaMIXiP/mwJ2ZrHzkdgsqIYN/wMtY2
 8SJ3fbTsc6hFvpT7VRZHzQrl9E87wKernw2OEdja7gT1gj3p6Shfvj1c07nK/rAzibYLWdhJCk3
 6FDa6jmQZbTDvI2nSO2BbPYJ+Fb8QMnG2a7a0k8ZWUPlgBzXxSx9Aoxy7ITYUo2yTE4Nncbhimm
 BBn7IN6anHmnHHA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
PHY devices.

The hardware can support both CPHY, DPHY and a special split-mode DPHY.

The schema here defines three ports:

port@0:
    The first input port where a sensor is always required.

port@1:
    A second optional input port which if present implies DPHY split-mode.

port@2:
    A third always required output port which connects to the controller.

The CSIPHY devices have their own pinouts on the SoC as well as their own
individual voltage rails.

The need to model voltage rails on a per-PHY basis leads us to define
CSIPHY devices as individual nodes.

Two nice outcomes in terms of schema and DT arise from this change.

1. The ability to define on a per-PHY basis voltage rails.
2. The ability to require those voltage.

We have had a complete bodge upstream for this where a single set of
voltage rail for all CSIPHYs has been buried inside of CAMSS.

Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
CAMSS parlance, the CSIPHY devices should be individually modelled.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 +++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..270375f949880
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,209 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CSI2 PHY
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
+  "#phy-cells":
+    const: 1
+    description:
+      The single cell specifies the PHY operating mode.
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: MMCX voltage rail
+      - description: MXC or MXA voltage rail
+
+  power-domain-names:
+    items:
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
+        description: Sensor input. Always present.
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+              clock-lanes:
+                maxItems: 1
+              remote-endpoint: true
+            required:
+              - data-lanes
+              - remote-endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Second sensor input. When present, indicates DPHY split mode.
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                maxItems: 1
+              clock-lanes:
+                maxItems: 1
+              remote-endpoint: true
+            required:
+              - data-lanes
+              - clock-lanes
+              - remote-endpoint
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Output to CAMSS controller.
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            properties:
+              remote-endpoint: true
+            required:
+              - remote-endpoint
+
+    required:
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
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
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    csiphy4: csiphy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+        #phy-cells = <1>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "core",
+                      "timer";
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "mmcx",
+                             "mx";
+
+        vdda-0p9-supply = <&vreg_l2c_0p8>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in_ep: endpoint {
+                    data-lanes = <0 1>;
+                    clock-lanes = <2>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                csiphy0_out_ep: endpoint {
+                    remote-endpoint = <&controller_in>;
+                };
+            };
+        };
+    };
+
+    csiphy_opp_table: opp-table {
+        compatible = "operating-points-v2";
+
+        opp-300000000 {
+            opp-hz = /bits/ 64 <300000000>;
+            required-opps = <&rpmhpd_opp_low_svs_d1>,
+                            <&rpmhpd_opp_low_svs_d1>;
+        };
+
+        opp-400000000 {
+            opp-hz = /bits/ 64 <400000000>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs_d1>;
+        };
+
+        opp-480000000 {
+            opp-hz = /bits/ 64 <480000000>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs_d1>;
+        };
+    };

-- 
2.54.0

