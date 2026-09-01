Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F049387341
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293741; cv=none; b=Qz7tEgl4j/Yg5eJ9jxnycCOFEOaxx45J3jvR44Rw0Dgb3RIlADFUNEWFVu0uxXU7eANBnZKRzjv4m0DSGa4uaG6Efp494afjLgEwQgMBIw4EocRPZp3vPPz8k1R9r59euIVYy4oVyzIUm1gL+xx1PKb3rvlZPPmuFkRh2O/Bs+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293741; c=relaxed/simple;
	bh=f5FtGtGO+ENQx81CmNtjaZyTiv2Q/DOGPEtD8cXJQFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqnyLD0vsCISfuNQKCLqyaudWv3gmwA+GPngVJAtHs9Sbj2H4M54BTXxFbhZLu8ngEo+igo6DULhClz84WeASfsYgWqqaux1ZRu37+uF/S/jDXy5FeL3HcU8rT0hK7lUxapD6vIqfJRMjr2BKhSeexkPCUvV7eW8EZnMQ9nljcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3yzeg1g; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3yzeg1g"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so2328395e9.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788293736; x=1788898536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DfCv07TuYAcDHU/m3IYLwtGwLnyflgAyzox3zgKtP4=;
        b=E3yzeg1gXEUYwqV6F4FgIqkkKzTt2YVP3gz796RUlHQiz8Ks4p5MyAbhmcj+T56Y63
         LJXrToGjSckF65igXVFja73YZWCxcXiuTVyq3Yi3C4qcWvv8MIJcedJp7tnx2rv1e0fv
         fWwExBpC5L+K+CicejitgysFs6fqXzEwZdywSpPIqtIShB6kXIgVeYAk5G4csZkiWzOB
         KXu2ORA+ZpkW4eQ7ICVPny+JgLzs44z+RZAXHqqvXqhxE/Fk3mgKdkMSsGI6umeHCobl
         zvTbwbdzWL6JyEBZ8qrs1lgOrKvw13mSJGCDo0Lg99S2241YKDwh2vl+zilGSEfZ6Gpd
         18qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788293736; x=1788898536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DfCv07TuYAcDHU/m3IYLwtGwLnyflgAyzox3zgKtP4=;
        b=Rloha2IuTnGYoLBS/HCN5sV8ywn2yVbjayy7Prs7jd3kejQhF5L6NrRdBYpouCH+F9
         X3Uy1UhnfMmsZcg6EYt5wpOZQXNjMH6F2PqLFv/Ix9oxaroKMQbFu1KokEwM/6lL9xG/
         ghMgbsdEpfLX63KLJ3O2KTYF6yEXA+6rtT0Pv2NI9toGLioqa9YN2p7nu3BTt7DUJDe+
         IOIkB/X3NR6ytlotNutmhgvI19gbuShm3YTilzAQb6DnPCcrL38Et/HBmO0GYP8yWvTQ
         o77dHj9AMxY1VsuwmmSVmt1JqFKZqX6fJi/hg85e+mmKFPQPJnN9NTz/xN3xa/Cjc/LE
         ibVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXwtk2KhaIEITkVXbANwUI5tUZJkNjiiXdRBqlmItKstMsuWK8w01a2JaBBzuDqxkrsrHDcL850NYX@vger.kernel.org
X-Gm-Message-State: AFuF++n4RLH5pcxzFb21GjDEuv20t5lB1pxaCIKo7AteOJYOm4wxRJiK
	0mt9kXDsh1oRJ29ZTaapnv/PqJ61AMCTAg0u7fYCiqCYrk6YQ0ZEhzsiStj27n1Bwl8=
X-Gm-Gg: AR+sD10eT5h2utSBOZQmyX11LzbOd+lvH9Ikqd250jExSfjd7P0kReKCAi0AslCmKfq
	wmVHyD/wvH746PFnc/Tdqnr0ArqNcm79IztqXdxdRzdk+Zok/8oJAux9uRQGOHcO0RKa5BaMSCC
	0Oz/eekGRE0MUIYfBUrbW+Qre41n8vsWPYTlQaNsYpuJjKvL8ubbZcYMuAsTaRSkiQTAYDFGjy3
	TTqw5osnIbbpIpdw6Eig1Zz0hPsMFA+qeAFMqXK76AfKcoUBNfaaoweIj3TZZ6GWULkN1CapV7T
	HG5yeIeE9jYKUOkJhZPpxhgJVEFmj3j9b0ACa7fODxhYirJHCYUgSaj78DwnkGY2Wxuo6AewBhA
	K8VrXRpkk79QNnR0Gno/bbS1EMpRrJ78/WmjWyT/icK8JDMHSbP3j04mlO1gUuYQf4sHCmnu6/a
	opQ7ZA2+H80gprdIKF0KaPRiOU53Rx9LM9ITzdzjGrz/o5j64+/vBU9l/KZ+BU2dbrkX69/A==
X-Received: by 2002:a05:600c:3b1b:b0:499:db27:7b1 with SMTP id 5b1f17b1804b1-49ce5823d39mr1851615e9.15.1788293735483;
        Tue, 01 Sep 2026 13:15:35 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.35.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce478daf6sm19909445e9.15.2026.09.01.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:15:35 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 01 Sep 2026 21:15:22 +0100
Subject: [PATCH v16 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-x1e-csi2-phy-v16-1-dd863b929080@linaro.org>
References: <20260901-x1e-csi2-phy-v16-0-dd863b929080@linaro.org>
In-Reply-To: <20260901-x1e-csi2-phy-v16-0-dd863b929080@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7269;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=f5FtGtGO+ENQx81CmNtjaZyTiv2Q/DOGPEtD8cXJQFY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqlzJi0P+3pQNzVlqYjozs9s8CIp9SYDGl+3ITk
 d9AyT7iiuCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapcyYgAKCRAicTuzoY3I
 OjtXD/9fG4sA1qwE6pyHb25d9OIr91F9eePmcXskZNf/DsDbKUEMGioojWA1kIWJwmfHoatysj9
 c1D7udNq+Uw6OJGLYxweQL2Iiy/TwAjQIMQsLysWYa4uATD0H07DF047NJ3pxcp+hI6OanRAW1a
 2pX5rKkwdSOET6so3dTx1yEM9/zQmy24RNO7zMlgWpsxNpFDlehzoqhmhoqc6uhLFs2yssIA5Cv
 iZp6T0bjqlvk02u9Mro7LEYNQq0Fk2xYj+r8OVSGp0TkuDIVk6Vp+Y/AuHlxnQ6bMnOOgTOr0Kb
 OiEDCvj9kZwAigNe4mBff52odLWo+fzayxmppuJqgS5nSyvYL+GtS0l1Sydw9eCrJ+lsSmP610k
 uBRwQSujpXrccc+GdklNWYPJHXItzQr1E0KSoCZWyX1w6tIp8Zz/tSlxbFK6siDd+9s1wXZnKD+
 HZs0txVAoA81Z4AJqBmHczWUNOqOHMhyG/9TS1OvAnUYhPLFLvb4h2OXMk7vpXtZxrXfWst/Hdf
 /rIfraSKNA4ziv04yRMUB7ikDsMuY9VOGHtuLe6sqq9AEhh4TK6fquBmcZyZOq6nz4Km4Ci6R3c
 YjR9xb0wIkOMIj63jZe1I+MpPP/JX04Gdcms1OiqxnSQz0xINYnQHDZk2trkRd27RGqVGDJEY8e
 SVO0w7vO13+gYfQ==
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
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 222 +++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..17de0701eb103
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,222 @@
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
+          single endpoint with the clock lane at position 0 and one to four
+          data lanes.
+
+          DPHY split mode, where two independent sensors share the same PHY,
+          is described by two endpoints, each with its own clock lane position;
+          endpoint@0 with clock-lanes = <0> and one or two data-lanes and
+          endpoint@1 with clock-lanes = <3> and one data lane.
+
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
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  minimum: 1
+                  maximum: 4
+                description:
+                  Data lane positions following this endpoint's clock
+                  lane. Positions are a per-port logical numbering, not
+                  package pad or ball positions.
+
+            required:
+              - bus-type
+              - data-lanes
+              - clock-lanes
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
+                    clock-lanes:
+                      const: 0
+                    data-lanes:
+                      maxItems: 2
+                endpoint@1:
+                  properties:
+                    clock-lanes:
+                      const: 3
+                    data-lanes:
+                      items:
+                        - const: 4
+              required:
+                - endpoint@0
+            else:
+              patternProperties:
+                "^endpoint(@0)?$":
+                  properties:
+                    clock-lanes:
+                      const: 0
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
+                    clock-lanes = <0>;
+                    data-lanes = <1 2 3 4>;
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
2.55.0

