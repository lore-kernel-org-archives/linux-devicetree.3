Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A943CF049
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366018; cv=none; b=kQJhhV8sisGCoKQw+4G9eGbxudyQv7hBoyldatuWjw/9CTIBVVY5iE6gh6arewAE4w1nwu6sLRuUkjYcImiUkmuowbnBZkVmiW4vQGbxjp/jHiXS5d5CvKf96pwPL+39Jiz3WxUmfuX5Lk7y+B1RH7HNf8n+XVZHyIeIicNW4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366018; c=relaxed/simple;
	bh=6JZZJIb3jqCfGevSt00nfaH0Kx6CuW3Rx2PHOEjx2HU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KxARVQOvOnCBGiCulF4LUfSzjDziEqM20+09h+qymJHDGVtxoG1YH4sYxs9qIbVMl1NphCR2H1YdueYNC6RUrN2AHdcff8aRPsXdQLOhRvCyzWjT3cS0Q7PMPQVN5dvRgMR9t9L/ORQ8FBSXz54eieNY9RnAwnm5o0fRph9ljSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O7FNrEq7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O7FNrEq7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so39632645e9.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779366015; x=1779970815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZXlcTGXFNsTfHxCUPPOhV4q7Vp+Jy7gwY1+EjxWw5A=;
        b=O7FNrEq7NB2yQlu/nZRut3cM+TPtgCou0KMQlTbE7TqYilhynjL1om650swW42R9yi
         NzTsGXgLROJyhvsespRBijBuU6cBZ3TlyqJglS6ImKmrenRG9VVUPHppeZR9ofiBF7N6
         jMJjtNQbvYeuaY4K+wCHuIqYxOlKVd0dLdgQpLTPCHQw0pnTxBvKrQx4Q+9+zaqlCMWy
         rwVEPv38PANSMxf3QbwQCNTkJ6z5592mlLLyeR8mo2ZFAA4vLjxLFqZ3DX132f6DyRf8
         aOk7kjp8bCHf2jb50EudKOfEs0sPFgQFlJsQY7oBhb1sgGBvXzKnLCMXJFXC2DfG1BSf
         FixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366015; x=1779970815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JZXlcTGXFNsTfHxCUPPOhV4q7Vp+Jy7gwY1+EjxWw5A=;
        b=rvkp0QUMs6w/hJWDJiWfm5v1TDujaF2+X4gyK5bXiGZSHzN0WWyva3enyXCK2XWEXR
         63Ht4+IlhhWHY/8Y228G+10KUsGKtaEMtPUrer78ufTrFEqAjkgoWJAhTcFutvC1+koK
         Kbamc3fu7GkOmyPuloqWIIwVMuKq9M3+ncgee36XF7Aze2BeRHJjN4FN6qqYS0Flk6q4
         LYiQRhT3waob0PXEPPYX1fw8lwJjG+k4rgkgjQFBW7MS5QDPmq22uGlbI1kuT3BQzuvA
         v+Il4yHT9c7wBr+kXy1yP80f0MyeW+LsXTB2+FL6Eke52jU9+UCOilRWarb1z2ZzipsP
         5ypQ==
X-Forwarded-Encrypted: i=1; AFNElJ+C9HQNWzKs6By+9Mr/WD2v9XIpRf9j52aBiT0xjinYeyEPDfbhBTTfAbEfedOGpLzCwHNa5FQfr3Cq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdu0A8ytqkyt4kDPPC2jH0cs/Th5k4dc7HJ39pahcVlvOR70OT
	a6mS+97GgI6Wwck/k3PAxmbtZlgij7ahgfjCs6XtKof03ZMQArmeK9U8H53PhxG2PoA=
X-Gm-Gg: Acq92OHU+mrfYflHPifO17NV4M/0ZHPZF55wtrHEoCTH1J/y0sSQU0nCOSRpER9bi0d
	cvZAvkRDxny/df8IN17z6SnYyOI5a95ga6NApzOE1u25YLeYtSTlnXAQOnbAEYo+MWNfs9T2mq1
	L6lXcqlM8ygztFIBuuhWIq2LmRAMli5/aKu+m0hvmsEAV6hUoDYBTpvrMy4uU7h+mnJM0T8Itnq
	8+cXuodlSUV9rPabAbuiBWFF7vSQwfkzN0vuUMCjPw20zAbaleuFgQXZCfY3YhJRtS6j2ZViGMm
	RDQsniv5T1TBTel5K4rpujzZQyso0lKWOIjG+4hTnyxLGyGiBgPaVc+InDAX/sNQXCzTHpfnQxk
	DJDhE5l9TAWZhyA0JYwOlbFykYzW+v27hEVGjwVyfUStHACoyBkpbrZJ+MkuoniKLIfSJ29ecnk
	7x+HAPCNROdmh5xeViKgQZahxdL01/JtlWEQ==
X-Received: by 2002:a05:600c:49a2:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-4903608937bmr23532865e9.20.1779366014612;
        Thu, 21 May 2026 05:20:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caf0967sm21981685e9.15.2026.05.21.05.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:20:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 21 May 2026 13:20:08 +0100
Subject: [PATCH v6 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-x1e-csi2-phy-v6-1-9d73d9bd7d20@linaro.org>
References: <20260521-x1e-csi2-phy-v6-0-9d73d9bd7d20@linaro.org>
In-Reply-To: <20260521-x1e-csi2-phy-v6-0-9d73d9bd7d20@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7047;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=6JZZJIb3jqCfGevSt00nfaH0Kx6CuW3Rx2PHOEjx2HU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqDvh7fJ41ROvU72ZtXZysBNB6KvceJ5NAInwwt
 CNwvl6mvUCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCag74ewAKCRAicTuzoY3I
 OqjFD/95fqEvI1YszjhlusNuXQ/lsteD4O7SUsuzb+tgIGFCQZ9TU0nKD5Nv3jIwdmgx5Dn77VF
 HfD9VEg9x8Fv425ZZuTkUusihJaxGfKNcM+wh7OeMl5EQKfdjBaSrrZS7uk46pFAXO9lAtKiLS6
 U1lSeIoLNlkoa5DYJPxMred02hvMlGk4Quxpm5zrVqVH6Nb2vYMg6Wji7aikHWWvCAOoT7NPvL8
 EzlX4XHBNNemLtcmLPts2+dy1H8PJmMZA2ulLxF2JFO42PASJjjTp/NgKS8m6N3Sp8mdErFLsO0
 wUbqP/JkSnX/AjA1t8E5zQ0U12ERpOAT3EFzQ/eTO5WAyjoyah7DiGr/tY+fA2B4X7SgursLKq8
 lu0Lbbd7NyFD2K/CQNP++nQk/eo8rK/gN1ZUjdhZzDiQ5qk2zHkO4gpEYllWqYZwct4R4YoFMIY
 K62OMZ2E0j0MwA/oit6HeW2ASiK8NY+ayC7J8R1x28q+/5c+DsviJ4oX3X5SyXa1jR1ZSpZ6vE3
 ftcCAzkQnLXKlLkIBBtAH9U0ovL9heNzQsgO195nANnhD/ooIxkXyxkb5hjWSy0eWR/ytDLPh0N
 e3Pbl+nDlMbq1te62+PO4EXBiTY86wJtOmmeaCdk0be6tIlGNPQD5yfgmqUq3Ro+3BJquyh6Ss9
 b9z6e/KIY3MTDJg==
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
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 205 +++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..c9116246c1e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,205 @@
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
+              - clock-lanes
+              - remote-endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Second sensor input. When present, indicates DPHY split mode.
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

