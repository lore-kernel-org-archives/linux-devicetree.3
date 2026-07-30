Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322542587A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412943; cv=none; b=IOUdSZ16eUqYSkaz+zFFJUWFdRQkOeto8m4SqBbvfNlzzDxD3ThyLF+wl+e82t6FWL7ZOC3Hboo3aKzUrnoSBQJRGk9IPgiDn9N0Sr7yt+1gUeaeyzkgolEliek6uJqbv0wge4FE4++7PlYtuIpQfPFcQtRe7hLmPpqKMGH1648=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412943; c=relaxed/simple;
	bh=owpNCfOHotF2UbyHHowVjmWzdDG8ObXidVDg5wAHinw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lnq5o1G7HmG8fDil7vcOZpFoL0pWfYddbkzG7XhTYo7nYxFQ1bbHAtOc1cFS+hKxm7BzTn1ommuxDmFnMAbDcmpN459Mvi93BD3xueIDlslk98xt9BCQDGO4AdTQ4u/u5A6AQc7QtYxrfvFg7ebOXu6hVw9I7GIuK7PE/qtS60M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XJ+W6P4L; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XJ+W6P4L"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so832297f8f.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785412940; x=1786017740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/sOP9dGVjFtHCfWYiUUuXm+dTM0GZTKvuSBtSotTjU=;
        b=XJ+W6P4LHJ8v9kDUapsT2hdR1szNfC0jRmJbIBGWRciyE2P+iIyjH1KuuNPmkb+KVH
         7AnI8CWxi/3+XUzkJDQ7C9py7jlZ4lfN+nLxiFqLsdNmLbZlMdvndUNi6IRqzVcPlOTj
         cLiHsMDVfYHxw+KhbIIydnLYCB6KgGDpLdj+fjCcL3gNd+7NqodFIH7vE5LxU+2+oU/1
         Ke+JnSIl12sjLP9OUqV86tb8knIGarMqW6JBygPmkFVovXQEKLzAqmgsowFTK5aVKsWY
         nc3o1f9FZ06zTRNvVA6vqillkIaYiwkAB58exrL69lthJf9vK87qA7sWeiF9T7e4CsUG
         U7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412940; x=1786017740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/sOP9dGVjFtHCfWYiUUuXm+dTM0GZTKvuSBtSotTjU=;
        b=MzN21h7T6L2DxglJbNTarr8WLaWgxSW2nRAzGPxd5X4E709YyJX4c9ONTC/vZEeUP0
         7svOPHA116CdND8xf29/rCndrgREnzzy8DeXQzf6GTOhm65GYIr9IFD4qzr6zkGsQ35a
         VHDW31Bz/JrU/l29mdoDQU+JaZZn+xGJ+Hg4WPguUd57OGp13zQELZ8dKlzWkaeNI0if
         +mQyvSX6CnrnLs3nNlfI5Se2Y0B6bZGu/FKR+gm0R5ws3GvPFLkaKHelZkdm6WsY6FC1
         RAdbBk6FoKA62AkHHyBhVxYW8GuOJqvcU1YuYdWS870b4lBshMqzryqKOpoLMWMzN/BM
         WR9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoR4WnoWr83Cuv4StSlIFcbAZd0ZlrhvvidGYxOZq1Cf5KtwEhOk5cwY/fEa+X4nZe/H0sbG2MHpvNy@vger.kernel.org
X-Gm-Message-State: AOJu0YzFI7OAmKdsURRqoaeIxDQ4UwuVHAyV0Ie/NakBo5HzP5KwMB3C
	qYG6p0WpS8QsP85AwzPj9f0nJcjiHo00lAPtgP9c4dxRaNdYwD5Q4rlPx/VI5/naGJo=
X-Gm-Gg: AR+sD101Jn6yFx3vp30V2WG+a+Td6Vwrjvp7oSGHqMxvAaoRm0vLm02trqlI6zn+2rq
	glQjvS1wDWR4TSgxyzsjNwfPXZMLUbqeN09RniXGgYnvzb0rCAPUhNN5EnyOEB4W9IbGgkXsEHb
	WS88CshQPCLg+b7bC5RPjrrZMpzWFgSD5WhXDOdVbkXPmwJjhBXUx62K28cy9LxjmgcE7lM64ZR
	0zcp86rUy+h/aCy9GgNH1V9kLFO0w5/yjlzSUcDqFaD/VdPOdvuO/kj0/Q7D9VFS4UstgzHQKW7
	EPnfEjfjeH7IYTC3uz9ZJiRoP7sJKVkilXqkpXsE88Ii8FTSW7D0nJ6CsNbEMrV7o3aWjgaIuCz
	bF860uT5lLiUz7AlC1r3DihrEB+EkkVyocY/yFjfIQWu5NEJg682e+fvHvJ4d8LceiiOSfqXHhH
	9j1/e1X7vQPyjlqQ5HlxXk3dT2RJUcxbK9ENi1BzDwZ5HPJQBYaYpePhmDvI06rN5iYAhCkTM=
X-Received: by 2002:a05:6000:4022:b0:47f:773f:2d68 with SMTP id ffacd0b85a97d-47fc81c5c1bmr3356079f8f.16.1785412938700;
        Thu, 30 Jul 2026 05:02:18 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.38.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc89342f7sm5992175f8f.26.2026.07.30.05.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:02:17 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 30 Jul 2026 13:02:09 +0100
Subject: [PATCH v15 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-x1e-csi2-phy-v15-1-f284131de1fa@linaro.org>
References: <20260730-x1e-csi2-phy-v15-0-f284131de1fa@linaro.org>
In-Reply-To: <20260730-x1e-csi2-phy-v15-0-f284131de1fa@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6752;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=owpNCfOHotF2UbyHHowVjmWzdDG8ObXidVDg5wAHinw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqaz1DhCAC4gEWeqB2EnxsaTOzDHZ1MlLtL/ITN
 tbDJ2LR5BiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCams9QwAKCRAicTuzoY3I
 Opx5D/9vZfgdeNbWv6VAiW3OeTRDfXDSOQ3YBUyx89fWuCQSWbCd9OeuBQPl02C5Uka/Trcz1yu
 T98DFtfWWvDE1G0F7N15PsHSJ4e6KOw7kXQCWoHQRN4YBMAuJdZ4ReaPxPWkF0DjaqMH9LhTp+8
 s4a/7Esrpotg5k/Tj560+PBN2z/Lll5KzSqJHEJSH3WKtJ08sHmJ0ydh3JoQye1ghwQNyCwCpDY
 cDcoTmoScMx/GyNTFtMKBA/kjB4TVI69zK/ec4BeSQSe7uRh7C4MfMIqmjHT1n7WqxGMH8FVcbp
 ad9eROIcLtoPRaoSgU/nuFv3PVugaQy6X2tRVOF4w9/I+awFVM/o2JpJeHk8c2OPs4S7YkRH1ty
 +mnnLnjc8S7CSHPNYb9QndIa1gYsoLJvNAGESrMuTPePePnDo1htK0jbasWJUJq2uaOJaP9n1Ap
 ZuWyKy1IkatVSxMuBBPfm3YhXgn7uPPrDEnWiNxx/us4JCGzKKZvarHgFjm31g3svqH1FHEvJQV
 EsRksbSGUeK7n8CBiKg/U5OJXzw5dXPLS5GqCSUKzrtcZXmnVngv0zGbG3ETDcM/6F+V+gmjtnN
 5vKo0CPsTPr3N42fT2VGRPtWtvwkZgKlqxHnePbuXBQ0XNEotPJ9KGju2wJ+KWaRcgrXNhyKI+k
 zwXh8lDeh7T7Nfw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
supports both DPHY and CPHY operation. A special mode of DPHY operation -
called variously split-mode or combo-mode also allows for two sensors to be
connected to one PHY.

The submitted binding here describes the DPHY modes of operation only. CPHY
is left to future work.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 202 +++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..8aa6ad2723988
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,202 @@
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
+          by two endpoints; endpoint@0 with one or two data-lanes and
+          endpoint@1 with exactly one data-lane.
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@[01])?$":
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
+                  An array of physical data lane indexes, 0-3, following the
+                  CSIPHY hardware's own lane numbering. data-lane N corresponds
+                  to bit 2N of the D-PHY lane enable mask. The indexes do not
+                  denote package pad or ball positions. The dedicated clock lane
+                  is not described.
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
+                      minItems: 1
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
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
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

