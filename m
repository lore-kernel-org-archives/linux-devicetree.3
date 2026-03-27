Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012C9348862
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627959; cv=none; b=DvoeIriGaa11uKRrOYpSSOlqRtByrHhQns9oKHDC0lbGxvG27FfZrrj5Us6Ik4vdp8GjxkeyrH0C2qRQam4Oj5IA1rgv9V3mWjbBvHPqFt28XU3FafwfmyIZZKXer+Xwc9tgbawkn2n1qG01zyHnTBgo24/PuQ3kLSfE8FZyHX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627959; c=relaxed/simple;
	bh=KtUn5G2UTlEzF/yc8/MAeH8lYJexJkFm284OdZOtjsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBNfWO+LVB/2oM96Gh9Me3nwgTY0bK4I+wpdM6GqNbcs/5k40YGYUS+iqYOyTaGFxH4N6vZTTRz1ao6VJ/oFIw0mCl4soGEpRQry7cKzxSY9+lbhOcPkzxcuN8qoVbJW+9BqSAHQQ/61MpH2W6oWH+qVbnvO8Y9OZlaWUJ06jg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VrD/aJIW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VrD/aJIW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9358dd7f79so414363866b.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627955; x=1775232755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq7FZmaEKFcQHlwC/6geG17+uu+aaA5ZxCfFTQLxT+c=;
        b=VrD/aJIWqP9BmTi/wYTjfLhIFf1S60MDFEICeTv2ULEjxV5/nS4a8Q/oSCZ79nZLwc
         8IM81A3W5nEXbHejsUVQ13ECYwNO364GcH8tjuCqz81NwWV+vt+jYBQyFaVwtWDMoqqj
         73eHv3gJIePgjfHPGilDZ/mSNvcRo5sLG7QzrhxYk0UIi5Rgvs7wOiQai8RKfZp+LCgl
         bLAW5rDsQyca3swEMt8zVP1i8y78uYBJZx4YyDrgFoz/lgVur3jBE4ZLTR1R6CwamzUn
         NZt+GdVyWnxZAjv/BPhnYC9p3skfdvIb0DCCtJfOD4TiO98lTJPk6IFI/VAdMVEUa3g8
         +PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627955; x=1775232755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dq7FZmaEKFcQHlwC/6geG17+uu+aaA5ZxCfFTQLxT+c=;
        b=kRMn7l624KiRHlpxeXErdP1FJ80tdSLMMFrsrQTHdMbsPlONrBimQkriTN7P/MrChL
         45fHzuAYJUXID/VPJSVC/ly+hun+3dvCVRBLHTgES61GtBY9hVYMIIq4MjHysibAaa9r
         Bl8J916U0iIkcBH/mau6iC2bgBp/6upUQMej86ZQhahyqZnlmXde6R9I0rpTYCznHuXD
         dK1hu5d/lgr0xlJIsg4sbdZCfJOf2PTm8RuTENAbNUml/iwldJbVStlmMMQ8ayBrWDqz
         8KYHg5W+VXFhj5oVIaYf7m1t3IlrjZB+OZuBMsB29Mt3VNNXOceMpv/zQGYOG6imCpKV
         sYPw==
X-Forwarded-Encrypted: i=1; AJvYcCW7Q9II3rSSZCHpCho8Fo2VgT85pudjHhg29i7FlEEn7feHwdefABSBhsZ2hYPnO74LEjRqh6SSDBfC@vger.kernel.org
X-Gm-Message-State: AOJu0YyHifd7mrZJtK+zIOiYMIuIHDS5Yxnd6EGE5RcWRNKuBmQSxC1p
	PA3vUadcNBanCkfQydWIlmnhYH7PfhbOGLayHeX0NAin50m01e0NKzQQYPKDJPQYhTs=
X-Gm-Gg: ATEYQzxiihmqUFw9MUNM09vB9+yvRmkdo9O1P+LbtWOXeHNc4FG9LMCxPZx1pfzymEm
	HgfN3EHnijouLLgmxKs74dY9HU3yKc8hP/5If+1i6dc7EtAIRm96avVp0ol6a5EA2AvsqB3gwMB
	5+aodozlzdya8sfePWSwZw1qYfr/+UW3HeklUy/pLTC5o2Vgu/EpZgULIGajcZG/4MHOaBqO81y
	OuKw9g4MZmIf2+CiqN8ORC3AAX1s8P7a6DVfeLFt5ZJKt9o4g5uBk+hZryJZY2y8t+dYB/Z75TD
	6+KadBl5t7Wc0Atkn7YI9zh7Nw/d8GCIztC3IA0sOL43mYYfY4c4zHWmXvGAtMjM2br17RdGWTG
	EaYQ/6gFmehwzVxGutwvFt/gqWzMvCzh/yy1QPfHEuAf1FsNAfpl38h5ExK6CwLwvIAb0RGlox7
	W/lry+3KtwIuzvyRRxFaEUpLVHQ59gdYk3DxhA73k19OT4MTye41K0tOxHCAvDrzJbutV3hw9N7
	LC9KA==
X-Received: by 2002:a17:907:94c2:b0:b97:bc6b:7f21 with SMTP id a640c23a62f3a-b9b4fa1aee7mr205959666b.0.1774627955130;
        Fri, 27 Mar 2026 09:12:35 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:23 +0100
Subject: [PATCH v2 4/9] dt-bindings: display: msm: document the Milos
 Mobile Display Subsystem
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-4-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=9238;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KtUn5G2UTlEzF/yc8/MAeH8lYJexJkFm284OdZOtjsA=;
 b=XRBDJr+T4inivP4pCestBgyjauRIBd5h9gxsYU7Sc+onWf6YvnD0LQUjqAApSV7jl/whtAR4E
 eTvFPG0+Te6Co++eRkdMlIQz0g81A6TkBr87kCD7dNRLZzUBawgg1LF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Mobile Display Subsystem (MDSS) on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/msm/qcom,milos-mdss.yaml      | 283 +++++++++++++++++++++
 1 file changed, 283 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
new file mode 100644
index 000000000000..0fb66b4b2742
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
@@ -0,0 +1,283 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,milos-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Milos Display MDSS
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Milos MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,milos-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,milos-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,milos-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        items:
+          - const: qcom,milos-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,milos-dsi-phy-4nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,milos-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+        interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &cnoc_main SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem",
+                             "cpu-cfg";
+
+        power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+        iommus = <&apps_smmu 0x1c00 0x2>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,milos-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x3000>;
+            reg-names = "mdp",
+                        "vbif";
+
+            interrupts-extended = <&mdss 0>;
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_CX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-200000000 {
+                    opp-hz = /bits/ 64 <200000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-342000000 {
+                    opp-hz = /bits/ 64 <342000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-402000000 {
+                    opp-hz = /bits/ 64 <402000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-535000000 {
+                    opp-hz = /bits/ 64 <535000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-600000000 {
+                    opp-hz = /bits/ 64 <600000000>;
+                    required-opps = <&rpmhpd_opp_nom_l1>;
+                };
+
+                opp-630000000 {
+                    opp-hz = /bits/ 64 <630000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,milos-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x1000>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 4>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+                                     <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_CX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
+                    };
+                };
+            };
+
+            mdss_dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae95000 {
+            compatible = "qcom,milos-dsi-phy-4nm";
+            reg = <0x0ae95000 0x200>,
+                  <0x0ae95200 0x300>,
+                  <0x0ae95500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+        };
+    };
+...

-- 
2.53.0

