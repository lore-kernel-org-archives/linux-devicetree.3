Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D640209F43
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509906; cv=none; b=T60rJ2hCfDqLWCBHY5WamhvltnKyl6iBsgv3Ep0T7kTXAPXdFuHkajHKFC7WGzPDG4/oV3ZsFuig2+ewp2mK9RPDUOyXbGIqpMNZdFuiY2zA2GolEvSYhXWNSRxzx/oEXcMJQ5IHXSYy6pyxFDCMDKekrLL8P97gDKdAYdIXIyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509906; c=relaxed/simple;
	bh=AC1MUPJeho28pBdVYrHItIRHxia1fJXAF7Xy5HQMoms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0Ihf81IT/efwTIQMjel/p0q1SR2+N10P+6xuF2UDcY+yaT0oKJ6Cufp/ubxehCGL/W/w/88HcRSY5NQy79WBQU7S5+E7UiITcstcvxrjrS1DDLjUU1YY59CAX11zqcNnTFKlrtQMaVD7M3JisBHjuKDoP4nI65ISupbZkSqSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F13eEpkx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F13eEpkx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso9439395e9.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784509903; x=1785114703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XnV+FykkybVqG+qJ/ggN1ABFG87UERnEoUc/FfnJBw=;
        b=F13eEpkxYvuXwbmV1VqqluPdWEOeFSfos1NyfhrSVeoDJE+jsy6QUWEow7vtij1s+9
         gJaAQ+1HZZTuwJDem/z5YcxBa6Mlq4US1wpUDcFgdCK3MXxIFG3LPLIArogqqA7AgSUd
         AXucykzBhyEki8bQpJAGW6kbuAe8wI4VT4Es20c+aPKYRH4QnLWtbWz2z/VdVMhUOOKE
         pZm7cMn/mqGEYbu3tr4dr4TYIfZj5pHfFGcKfwUYlXFEtJH7H9hGUYd7HWgQGtwsAhrl
         2kVHLfKirc78fcbaGZ46i0zJelhre+lS6WNH0BoA2aWNwh9aKkiW3lbmcqWgonAcntmC
         f5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784509903; x=1785114703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4XnV+FykkybVqG+qJ/ggN1ABFG87UERnEoUc/FfnJBw=;
        b=b62wVnyzJp2y+d7txONElE641MbR7IFg/tZrJljK3JiVvizASVqJIk7ItwHWc6Bk/T
         XQOfEtJ+ecUxnuCyGh/BbW06NskyrTS8iEVRffvPQ/jhukIgIDQzZDs5Euu7jHrVDLSh
         vL4OSZ0Zb1sJc6WnvuGrrsId1QQCXJLogshSh/IQ6BYZWFVk/6IS/ekwHPzifz5KSWnJ
         sjMnNqohmtA44+BGOOxq326wrYT2xi7s5nY0AsnUUIg7WuswIJ4+XhEW/MOWEr00grKa
         DtRLrKISid6UnS73BrjYdDy05t1HBgGKqxqfP3FeFigM3wSJpVwxm0WRuSNDkGaneD0q
         efUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZ7ez9vEOae8jtJZViXxAk8qomqoTj3FNSnMtrPKUZbk6Rtx6s965a4EjmLWgbp7T8tnCOD2l2u5a5@vger.kernel.org
X-Gm-Message-State: AOJu0YyljaHd3ub5VWgtBNW19x8WvigWDmxEk3kZTJjYRsGFYOI4pR6x
	bbs7Jvivmv12DmY7yHHm9pOrKZxtvyIswryCMZaXlu5w63HHlS+w5f9K331zilgQ/5U=
X-Gm-Gg: AfdE7cknL2kIOgMXXl/pPVtchtXSR7IaDUxChBaIa0c7YQDZREtCQfL4cP/YX3p6eTB
	Z2PYkFmpXgdzVSKpOw8oFxW2HklgLnBH/AFle85MQx+z0Qshq4tfW8AOU2+7o7o5ojWM8KNj8CI
	ffREYRq6V7CGu0/IzBJMvyGAfw4eFNSnmFJyxIYXToY3Oo6kx8Rzc3vmcrXLYaK9+wrEOOoyIqF
	nvJ2/xwpgPGwycFYNQyLi/jZtPpH4e+lzXoouhnYcNLEt8RetJuINwNk+53zTLjbEVWjq4xx+V9
	RA1R44Ry2WXDSpVcV8MJFtfJRMLRRklqHuhyjES+kiM8lr6dAYBXjIlX4hyhl1ODifTAXYB8EHM
	XfaeTGJqANtv0tzrE8MILPSCWjifGUCMq7H/AYX42yUAoZBKUXAYuBtI4xfTlK6B+4VAlmx+vT7
	Ut7SmiUL+6x6GK
X-Received: by 2002:a05:600c:c490:b0:495:4730:15b2 with SMTP id 5b1f17b1804b1-4954a40d1c9mr125802115e9.31.1784509902427;
        Sun, 19 Jul 2026 18:11:42 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.79.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954d384146sm180847285e9.14.2026.07.19.18.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:11:41 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 20 Jul 2026 02:11:34 +0100
Subject: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
In-Reply-To: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6235;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=AC1MUPJeho28pBdVYrHItIRHxia1fJXAF7Xy5HQMoms=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqXXXKvBp3dUE1KtESZ7+ZHlIp/cv9XUuMb2l0g
 16nZ0I4ltuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCal11ygAKCRAicTuzoY3I
 Oo9LEACTzkusJ7PUs4YxRQWdEU58xvKYuA3I6VtctNKxxL4llpjHHfU+PoReyDg0vAgy2vxWbsZ
 VIc3KMgb+z72wXoxiW/uMO/qTkSMzIFOP239wLExgXPvrkSQWosIdhiGvPY/67sqRTphlDADLIM
 +aaA3oPOSkBKxoEpTh6AANvqmUejhM/t68xVDqsoWFRygiyGTjVTU3jdXBNdcNqkfcIfnE9013z
 dm29kgfJT8ZQtuPKMQZIBCAgl1sfQkoRV4OX3dDzsdkpD4WMPSICC7kLaCD90yRskCbGqB6s0LS
 u/qR1d1ostvTx/p3a+jVA7JfBDFMP/TZxlK7kGQndT/IcCRMqgacMAadhXrGuZcSBHDwuBAx+u1
 a+e6TM7MdJcttBdtDbLs7XiVGcKe/DuPPgGwQkN+8CUGfSdTWjLfpiz1zsyqjGQe5X/rzc81uPo
 loADr6tFPA1pNbWkLGJOfSgm27cRbMSbt3dIFPFMl5sc5RF1rC+uaicBUCRQN6N1+OrGzj2Jjxa
 hKtCBQgoc2RLDZTVHVz7WX44N90qwRS7Ox2AVBahZ1zXvb7Mctns6ook+KNkJcu3bdOhbeFNxNV
 YvOeCi3u/yiy3z2oE7A6XOMfETKaIPCcJ8IyU9/XfEwXYMdRL4NKYuFyVI1Tv9wIeEtPWhcvB+L
 rItQkwSaj3yZaQA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
supports both DPHY and CPHY operation. A special mode of DPHY operation -
called variously split-mode or combo-mode also allows for two sensors to be
connected to one PHY.

The submitted binding here describes the DPHY modes of operation only. CPHY
is left to future work.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

