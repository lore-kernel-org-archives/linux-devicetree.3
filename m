Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E332E1EE5
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774487066; cv=none; b=LTZKzRYXWW0sZKCo6ui33gLGYg3j3ATAk+SptbLw2x8d0z5WTXT06dsoEXcPDpBN3HTlvvtogwC5LlmmmlI/y+0nezc3JwLovJgt9QR7IjqFbyqAQRn7Qoe8V2XpjkAD9n4ElVsQ6qhzixFA3Dn4q6dfc5kZpWFHnGSnpNEJbq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774487066; c=relaxed/simple;
	bh=qGmgHk355RdMVEd5Dw2LrYt4qWgKg67NpTd8E0fFkWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIsYVlb7Ffc35R+RhZa1EJYeAHUVuXh0CY+LY0iTMXa0797dVNIXah2ANV3jEmtPlFPgyVQgPM/AzFkNx+hpDqhvZCNwgj/ERmZF8ggOzdIHCNWs6e7grV1SVTN+QfLKeS/V8rrsF1nXznq+6wqCjWmqfB7EXs7//nr9eyETze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L0/Xn3bd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L0/Xn3bd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so4725475e9.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774487063; x=1775091863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26uXUdPFSZi5gxCtVHWZmoe+sZRz0mTOQs6SpMuS8Do=;
        b=L0/Xn3bdJ4MgL4A+NdNiZiZmBBBWtea+FeLwDl2LocNelfGnYC6EvI+E7UjZsA5MW4
         Rt8CBCr9oW16akIFo8VH+Y5LyuYgDITsj0SkcRjTXIVAylaplRgPWrccoY4b0as5MHH+
         WqAkKl0LlN0LRCtA1x2i0RopdnO3ETD/+Itc29J5NIS7kbTYfsW2YmNDnLPNk1/JQVii
         YkygeuYfw82DVcmt+AjqYRBsStfTUDJM8nnveOYfsf3JdZ7+wYpjSonhcPYtUm6L4c67
         rbULI7adWfhnubiptEAlKnDFgRqbRhbedQfJmhEQxrdv6SmsqfLUJnRgURe74r2oVkoZ
         p4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774487063; x=1775091863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=26uXUdPFSZi5gxCtVHWZmoe+sZRz0mTOQs6SpMuS8Do=;
        b=awAjfsa6grHGT/ZdwpJCexM2PFNZ4OGvjDKkNc+80O2W/SfegMaNULa2dXOhivLy0W
         cjM8LowVK5r09aH4AW/ce50ce+O7iRvfxSDYU6MSyYjceS3xevdYKL5GqV6mHnzapeXB
         dWMV5c5U3QN6vlH+Pq9nmXOvs88vCpMx1XSMY5J5twDfwnIuJodtgxcNRXuYcu2BkYAD
         d/x4utSFt3H5DLUn2awyI9scIxUdft6He5XnspzvmTpn34bpq4LhBUs7p+0qxqDpq/NQ
         dvt1AN+OOxd3iCxuviz23/QjfE6ABbdBelw19ZILpFM0NOCeYGJhFgOcbyPZBsfAHWHb
         0/AA==
X-Forwarded-Encrypted: i=1; AJvYcCVWh4HWA99A+L1F+CHEZtecFEWkQgKScAppiMT0TMS9StJL2iOQeZ1Rl6xl/qa6Q2zy0hWA2HFb/h6l@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr7aNNAYMUO8oHMet7E+WOPvs3iQlMAhLb8luC48IZTRKkHxvv
	Bun08qpv78QMQDaQ/0yns3bEJA9Ot+ldIl/swQUJnlI/spYIeB+26skNk7/Ktq3e5UJ0f4HAq9G
	Khodr
X-Gm-Gg: ATEYQzz5qpsshl78e6VAp24vHy1lx2aSAHbgWs29xORCiS4xaVemZf+IrXK4JlpqWOY
	bdAOMmMe9bfmkfYGH/Q9ZGJpPJnfVqcYzLJ1Prf7HTTZZiQ4HsQxZZu4JCHOxObRNU6kQFV45ml
	Jamar6/BcKBBl6ghvtO4ZYsoPX4yRCLnZ3xZXG+uwZZs0TuSNe7eo0COPFFI3wY4ckOUCyVGMEr
	FiAO83M2KLXxawqF62f0jRbKj64i4y7ue4WXWxuWESJ8OSh4inv61m6Mi/y0a0V69YnMM5Bhvr6
	Sy2mbLzw/7PUmppBLq/YOVz5ysPRm53otG3UTTcfP97dTLz+/sdcItbd1mK4lpqjzmEf1osg069
	d3ahy7pIzdpMGcXxeS34VYfDFB5FD8TSVUMCQ6XBNJQQWa97SESRP1BOFEKnzlMvpJBBj+qIZsf
	KCrml+a8PbjRxIB54xDakn3rsofG9V+RIjet0=
X-Received: by 2002:a05:600c:1913:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48716061795mr79375885e9.24.1774487063444;
        Wed, 25 Mar 2026 18:04:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711701804sm168552605e9.4.2026.03.25.18.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:04:23 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:04:43 +0000
Subject: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
In-Reply-To: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5552;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=qGmgHk355RdMVEd5Dw2LrYt4qWgKg67NpTd8E0fFkWo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIY0MZlUEWyTdMRZlCTbN3IGMZ1OmF0GctovG
 PPJu0g0ymaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSGNAAKCRAicTuzoY3I
 OunUD/9TscQxTa6h7cse7W5SIw1NapN227nZz5NYSjlP/BYNTHIhE/Qq1KWhIng4lD7LqpiSk+K
 CSmPTdCHNMjwLN2qfLvJJ2rLKmp/MVhyS3HnCguGTtbPo5Zr3llI6i7lx1xH5GRUrv4IqR8dnJu
 RJK6xLNimF6KUkcaeOuKI0wgESN/uwZHHiDz6YDRGzoUsXDMmWh6ukngta/9pNW+y/om25KYmYJ
 m/v7J6B79MZb6p4zl+tgYCTQfDGTl8mBdbPKmrEGifYb8wThhkDOvV0qbgLSrMyj2gXAYCf1YCJ
 NzKiPl/IjRoTSLBjZnYRRoguKHtDC1FvZY9T7R8uHpTQkqOGPGM0aUDP/bbMXT9AnHAd74yRC+S
 rIf/7Hj6HPoGbM8Z+FhNORcQQ8Fe0jimSpHLqYBgs8SP6rbonTMPyBI6pBi8qLQPzhDqAekVsyU
 hCdNaYpj8JGAvpj7B3abTHc5Bs+4NH+9YfutPaDSKljnudyiiEeHLs3agAQ0q8v18vE1x/ciQin
 bMyV/emVaO0hldzh2wkO1xHHwZPGWNRVTkNXGyF/V6xczZV5n7wG4LHsz8W/ZGAgexxSKRwtvlh
 VX3wvTa7lG1G3fran7TU+VhB6fkPui+uT0GOLmt1hWt56YlqSX0Gw8kwZutAm0oZHJK+JnZ9dJA
 A0I4Ty72Xqvci6g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
PHY devices.

The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
capture those modes as:

- PHY_QCOM_CSI2_MODE_DPHY
- PHY_QCOM_CSI2_MODE_CPHY
- PHY_QCOM_CSI2_MODE_SPLIT_DPHY

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
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 +++++++++++++++++++++
 include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +++
 2 files changed, 145 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..63114151104b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,130 @@
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
+      See include/dt-bindings/phy/phy-qcom-mipi-csi2.h for valid values.
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
+      - description: MXC or MXA voltage rail
+      - description: MMCX voltage rail
+
+  power-domain-names:
+    items:
+      - const: mx
+      - const: mmcx
+
+  vdda-0p9-supply:
+    description: Phandle to a 0.9V regulator supply to a PHY.
+
+  vdda-1p2-supply:
+    description: Phandle to 1.2V regulator supply to a PHY.
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
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
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
+        power-domains = <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "mx",
+                             "mmcx";
+
+        vdda-0p9-supply = <&vreg_l2c_0p8>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
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
+                            <&rpmhpd_opp_low_svs>;
+        };
+
+        opp-480000000 {
+            opp-hz = /bits/ 64 <480000000>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs>;
+        };
+    };
+
+    isp@acb7000 {
+        phys = <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
+    };
diff --git a/include/dt-bindings/phy/phy-qcom-mipi-csi2.h b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
new file mode 100644
index 0000000000000..fa48fd75c58d8
--- /dev/null
+++ b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Qualcomm MIPI CSI2 PHY constants
+ *
+ * Copyright (C) 2026 Linaro Limited
+ */
+
+#ifndef __DT_BINDINGS_PHY_MIPI_CSI2__
+#define __DT_BINDINGS_PHY_MIPI_CSI2__
+
+#define PHY_QCOM_CSI2_MODE_DPHY		0
+#define PHY_QCOM_CSI2_MODE_CPHY		1
+#define PHY_QCOM_CSI2_MODE_SPLIT_DPHY	2
+
+#endif /* __DT_BINDINGS_PHY_MIPI_CSI2__ */

-- 
2.52.0

