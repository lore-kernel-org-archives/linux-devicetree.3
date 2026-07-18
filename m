Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596C7274FDC
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 02:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784342307; cv=none; b=Jri9jAcOsmqyOYr2virYu4RufKKq1wgzoWbWB2k8Yo3ZseFc9rSv6DmbwfoPn+NMfAUG5y9tnDBqUyk0CFnkxkBGDwHseTOccpM4GUvBH8QYDZCetKRQWJsoLwNiFobi6TeSPWFBekywB/ZHxBFyf3xVYvogvGjxFoghKakXvLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784342307; c=relaxed/simple;
	bh=4CejNBxwYr6qK2LLBsKy77yO7TG9DBAT6iXNJvDrqBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l9xbnX79O9g1B3V537M3bUDeo/2ho45QECidlsx29pUtjiuVgS0Fbh6OUfijA0AmqnD3xfHN3pmwY5pFA3w8QyXKQPg/DqF4NORTSVcLOcWHwukDFlyZLsrOWAgUPbjKvVRt+s4kp0Y+dC4s1Obb2MbZZT2oKlJu4JGUlGRH1ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D8824Rqt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D8824Rqt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954c9f380bso6650965e9.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784342303; x=1784947103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1zdgJ/E2ohNwZS2QQgpks1mLElw1NRwGvhu99duCc8=;
        b=D8824Rqt1mONTKhSKRjUOQdc3aHs0J+EI7eklMc4WAUC03yK9LQ9bZQtmTCgswsq0x
         myAaPqtBd/vPFhvsikTACWkTvjIAEX93hfKmvph4nnElbgEW9AQoiFfBRgdEslqMpz6J
         acyCXMFTEcpT4DVMdfBmfAGy8KyKI9jz6mox26maET5zqCmFy1pmSoQtlx0OtG2adJ3S
         VpcHnrr+kCzfDkrFUfCaD+PSJDxd7l1lKpiUuZT3UsR5AAXC4TVvxcNSzNuNMBhgKUDt
         AhN089Sz6dLv3VwwHmtsleiQaY+Myy209lpsUe93Y/ubGzudmysl7De9oBSty35T2iu0
         I2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784342303; x=1784947103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1zdgJ/E2ohNwZS2QQgpks1mLElw1NRwGvhu99duCc8=;
        b=FhACBh/6LxZmE5TSBjLrY0n7Yd3XL/B2oHuDDt2hmyDafCUbGsWwOsOdtd04GE0yI+
         nGX1cZ18kKN8JvH3W+YwtU/7GdDoGqZtCmf/Hr1jEar1NHQhFLB2JP9PHwNHVGidQCnH
         nUa1c65GQidQQVSJpRYd+Ufd1OLwZSYM7pPMZ5z+gw/Q4r6S1io/Cr7i6U+2z5Me8KLU
         2xebh3GBcVigfEzdO+JuJaNtLYyODqRaMgyyB3MZHwGAl4HAFFxxmf6VMNpp7v2KvrBo
         FTl9m3TT+G4LRxEWnApzx7dG2T3PJnCB68Y2HKUh3sk4Y5arM+UZrjZPTCQLzjoacxUJ
         imbw==
X-Forwarded-Encrypted: i=1; AHgh+RrRZTBJm5EkwSfxzbxgt1eeMaAKGYcyD5LJvBl83dSxJm44tdZzDnc2MkToi6OaLV/vHY5rS28KzCgG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2XsBLcNKDTHLycoBD4VaGUHirDkQ+6trLJADMIIe2s5avdV/s
	xIOhYXosTZltnW/xu3Uh17KG72TuXYoG82wPsV3jqVoMitcEFEeDt7tZ3g+ln5goLa4=
X-Gm-Gg: AfdE7ckeWlU/cD5Tu0G4XAytgc2Rg+20acRHaChc8WXABrJkNPhGfy6aAKns7ezARuh
	UiJKHxQ0SmU13vLsQs4+DZQxPNHAlTDUYRo+HDgH+Jwg6aoZYzAMbD6cJrC+1KjcvPrsbStv6Nu
	cGUEbLu5ToTYKRCchL5mU4OLNTuWmzEsTYu6hE9/fM6FDsSwjzfmoD26jgXvE37VhzOFRRVa1kQ
	ZEEMAx1BwhbvAjlb2g2fkELzdyJdPPge++kwBhxNMtycehm4LvKa2ijon87taqJZdUsmnmBM/sM
	vfMhngBNk53n3NFWtjLJxauLL5JEahu4R/Zb8N7B2rBIJ+BNEggwflx5+VzhAKwKXlxGxZeX25I
	p7VGqMntxolA5W9j+C01dyTPUQaoP9sWMRNdF9Ye44PF8TVYdc+JHxeqfUvqjjZA+s1RBiQipeF
	J6c3HhnUKFac1a
X-Received: by 2002:a05:600c:4585:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4954a3eeb63mr57220575e9.5.1784342303493;
        Fri, 17 Jul 2026 19:38:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.30.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e14e1bsm67524235e9.2.2026.07.17.19.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 19:38:22 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 18 Jul 2026 03:38:17 +0100
Subject: [PATCH v10 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-x1e-csi2-phy-v10-1-5720a7888953@linaro.org>
References: <20260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org>
In-Reply-To: <20260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6162;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=4CejNBxwYr6qK2LLBsKy77yO7TG9DBAT6iXNJvDrqBI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqWuccR4/99Ti/mSZWTs9hwp+xMB6opOoBdZDY1
 BkyiC+f8g6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCalrnHAAKCRAicTuzoY3I
 OqdrD/9IGCUSzAzY3e+PzlnyOyJDkZmAI0VPNiJV5bmz9O2udJuaYDUBVTlDitGO4agnKlaP9iy
 FGKA+56SBdoNldIw3Eonob4beh678TAK/DdHkjhVqnmU9TMb6KiCP87/mg+MQZC6UnwvpAM7mou
 /dujngstFjE81sctbqs8BAkLRJWGv/UIeyim2UKVLdwQbVyhzjejCECa+r+V6GlOD7fpo4nYOvh
 3BL/CrSXaU865RktVcQYzwd0VbCabMJsgjfl+1s0iSnj728bALSS/MufTTxUG6IbI/EvN9DYZ/y
 nHi/f0dxDeMin8c3IaHxxgeupnajcmFJ+YqQsxRdRO2qqNeWWi4EGOQvJ+ecvzKVz5v2+AOmewp
 kUHzniHd8UxhDEZCbH1LJXnS0qNZH8vLWHBD2j+kY595wMB99OGWoVkV1EnJBncli0wM+q88/j8
 YLk7183Zox8GTy+KKyRGiG33PA9jV9O+AIpQ+6Ln+ckdx4aweRIq0TifDIdJ8cS6Ktc8iraEvRa
 LxhqqdGYjK3hGHhNd3Bpz4T+WEStAx/KzMaNvZaKHLX27f7/lfkED2YTuLSJoFmwgaiR0ojAcXW
 aOOaTOegULeT+Azv56loxZfhHyRp7+ryzSoC83iuxMjqrrBbjnwMrO2eByM1lQ5oeWEF8dOM2U4
 h8Hvnf3+CeMWl1w==
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
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..880fe602945cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,195 @@
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
+  "#phy-cells":
+    const: 1
+    description:
+      The single cell specifies the PHY operating mode.
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
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
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
+    phy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+        #phy-cells = <1>;
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

