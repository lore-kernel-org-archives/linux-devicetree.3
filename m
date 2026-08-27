Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBAD48EBE8
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848776; cv=none; b=DcHuD7a/u/sMka4qyZo3Bo7Oa+auJybM+l3znfuAFecAfjvCr/E9KePhXOsS6zGT2XCrmYigUdlRGeqPps//kzx4drC6FSrHvdtmIf4fa0Fw1FTjH7vK9r+6T8GbbarTVZiLPFNyzTPteLc1WkEAxy7od+xQXfcx/pmYUnrOlv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848776; c=relaxed/simple;
	bh=9Fecwe0sAktGee+deC69QVwT+mIH7oP8T6NEsor/Km4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVolK4Xmvl2D2nrNwuoMgrv6nCHfPd8GsOl3vrch+HGIp9gRJQScJ2nwcSP9ma9hy/HMyCr9F6jGxakmiH53NxfE/VgHDJTN5m+41pzjAn99dR1FWyb5OaeSjCw+t9KwZtM9qnMTI5q/3RPfn1e0l/tW4HLVS1zNqVLx4YKhjKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRaTDKn2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knUGf4rO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRaTDKn2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knUGf4rO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbnSf058917
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=; b=lRaTDKn2ImD9Y6EM
	c+HsLUu1yqskFKM6MvArwolSn092MkzomwwJWJzWqcfc6irggHPgvoJVXEPGeSsm
	Fr0NM2WEgKWpMicjignIZ3MRUe2oP9ydVJq5tvi0BE+e4mFJgUZt4CLDNjQlQPNs
	JFNyEvuH/dNSHLQjcHXrPARPnGuLBZ4s+AUp7wGCrqPFgddZ2dxuuGAPFLYJhbC8
	bz6D3VoXcRdCA3qvlbwjl5oQH9nS0dsSFG34TDPUxs92ny307LBeXnXsDaYX8USP
	6AukRjz68MJaIPeSVaq646iPhU5j1DkcmCg/Vp4FbQScfmuJbXcxG+TCFUbndIa0
	pXwBIg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak561f11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:39:32 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-448bb8bcf38so355158fac.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848772; x=1788453572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=knUGf4rOCDxuwvUa5d4b1TlJzE5+/4hCxHzLmtJHf/gW7I7+Y53C86v9djaqAAy5AZ
         /3RePjapu4ad8ZPJbRv1zXW81Z8mLiLCOhKIH3CCgIuWatiRJnm/tP6ZKii225m7LOoe
         dMD1iYlPfMU/9xx/rYJrIPsTiANAUMM1OAykY8wMsWP6Vqmt7UtALeq3BvEdkL1FlzyR
         76r/VAiZAoLNWvm+Sbyi5TxYAeWCTHbOTBj55O7K9SCOpGpmu55Uh5b+ygCrQbc7bZEp
         o7jI5fFXEBtRvAJ9HzSj1GVZbQIeUF1+UnuIX8qBXUyag6zOeMqz04/J8nUhp3c2nN2U
         AkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848772; x=1788453572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=EKM+zRC3ZZVsBw+/7kcEOj43JfzljJC+eZ9Apbj6kb9gtSz86Vda9oV2LCozjtKhLg
         pSfWgsCPx9wSGl5uApSzU9pVuAzlEl20pkkVpn9dxn8Byv71EE5qD63q0wLJhE3Tjnd2
         yPoDixARX3Gps8hZD056Qx7HwK62T+3nxXKklPI7Klv7ehSbQiJeQSRLO9SDLxylM2fA
         aR2dcROV6EQxIHtGszzsJuxFVekjjdALlNub3Wm+5u7tY035qg6b7R+OOD2ZYFr5UEcw
         6pFdAfJ8P6K9rBVPXwy0UrZH66aPNl6Jy8lAB2M9y0OgVtM3yaoD/k9RvnI+dyKrQNHj
         h3ag==
X-Forwarded-Encrypted: i=1; AHgh+RqzXP6rfOdIG1vFE19jYiie5yUuMmSVrWpohI9S5g4cF2/QWzPXu4wWq3nFXwMl40MwA3EZOT8eJdMi@vger.kernel.org
X-Gm-Message-State: AFuF++nkBukdbpTPqqsq5WeGDPbO/+nv99wByVjvi3OK0rnYmrlbE0s2
	WxL9PlqUbt/JYf6Vw7Lvwmz1MfofXWu3RjuQCJoXHZ5KWWeS3oUGQ/xIrQZZ4Zg587ufSj7IVUA
	rzqkxUGXCTKAXNhZ8Mj6uG/ML2YV/3XojK5Bk8+EOlg1bGOCa4BEC+KCt6uaQ3xK2
X-Gm-Gg: AR+sD119yKtORL+m6biHGxfGcjZyu5Zaw/kwyldSRp/sHLTKXv8G1UVOGbIRBLwscYb
	fZUzWaDrQ8dq89uig6l/nfRZ46BifLR7C5xP0ASWOgvB5yAli/kFOCMVuDJL2ToYJOEHelSKSVZ
	Lp5BrnA29yRV5QRMmr3A7+YWPtksVTbi+QZI/2Es/AyZ1DexEK7Csdj0vilHI9gfklAtiXHnLs7
	Z4C0UGyt7K6FQIHoGErsGbl49vin0RU6vDZ0g95chmXomeUF47WIVV+/pmIO7r8XSLl45p+thu2
	Z9xXabNkWgfJSbPDgNnS4S56RS0yu6HSaPwBXajmtEi62QqGnlLL8Ui2O6ii9zDMZ+A7MuJuUgE
	uPgUs80asMvypgDTE/4kdho3qPj8ZFDhrR64nDIUz5XL+h3hRuYpuRVFpv8xxUauKDpLyweZyxS
	VrtdNFzJGrxHcFh/GBR4CIHWY=
X-Received: by 2002:a05:6820:c2c2:20b0:6b1:404f:6eb4 with SMTP id 006d021491bc7-6b1a0424049mr12747565eaf.9.1787848772172;
        Thu, 27 Aug 2026 09:39:32 -0700 (PDT)
X-Received: by 2002:a05:6820:c2c2:20b0:6b1:404f:6eb4 with SMTP id 006d021491bc7-6b1a0424049mr12747483eaf.9.1787848771608;
        Thu, 27 Aug 2026 09:39:31 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:39:31 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:09 +0530
Subject: [PATCH v4 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-8-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=3999;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9Fecwe0sAktGee+deC69QVwT+mIH7oP8T6NEsor/Km4=;
 b=fwLGC9BZJIM5/cbpxIquX/TnSdBSPeRCEgbOicDICXCkapdsB4ssHBS5BUut2kAvBatwP8yAA
 assKcfeMqvABvnEGMHmDn+jlO5WBEyhGQF3ncvO0mJgMRD5KdDrNKxg
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX2oI2VzprTP0p
 l/SerGHezoOIzlCxEM1t8dvQHDy3/F27MfRStRcPul6ijrEZKmaNGlSadxA0kPKsQsY87ZMumK7
 s1G6RrKligc7w6lhoiRh5u/vDTYtEVw=
X-Proofpoint-ORIG-GUID: RLBw48mX7ES8QJ42BxkjRwBbIPaRmc6Q
X-Proofpoint-GUID: RLBw48mX7ES8QJ42BxkjRwBbIPaRmc6Q
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a906844 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXzWanjgbd49lt
 50YgMEhwlrpphehULtc9A1rro0zWmZ5NW8VK57c4AUEgzHns64jzGbJI2h6wbkVhQE7F5bZGkzB
 4NloBQkGJUo+oPk1oWtU9PifnY0Rs2L6ZcfG9D4I+pTtcd3Y4uRjGMQzSqTjAwvxkNhu1MuKw3l
 4RIb7nB79U8zohMou5L9rcpjZJJD26vpfYxiJYONBGEWbrB+qCU1of6BREOGnGOmsr8HqRGlXGn
 kMlfff382l9lGjFL7aAqCSptZJtuPHuO/gp8BW00QDXwC+OCG6vgCCUK5yJH6IcvI7Fagi/903a
 atQlFiq5v0iAl4emqPpazw6Wd0btG23QEOzLuS5hqdsbU+ssLSd1olNL0caFteqx0xKuCHR5BPO
 sX6yO1S6bN1ArTuL+5WXBjJ7kx+R0yPpv8wHztGVj0WwA971cZNFSSK0RSA711ZP5QpfNy048P9
 NzmGY1PbG6aS610Hn7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Add device tree bindings for the Top Level Mode Multiplexer (TLMM) pin
controller block found on the Qualcomm Kuno platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
new file mode 100644
index 000000000000..2250526dfae2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,kuno-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Kuno TLMM block
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Kuno SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kuno-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 55
+
+  gpio-line-names:
+    maxItems: 110
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-kuno-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-kuno-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-kuno-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, audio_ref_clk, coex_uart, ebi2_lcd_a,
+                ebi2_lcd_cs, ebi2_lcd_reset, ebi2_lcd_te, emac_mdc, emac_mdio,
+                emac_pps_in, emac_ptp_aux, emac_ptp_pps, gcc_gp1_clk,
+                gcc_gp2_clk, gcc_gp3_clk, mi2s0_data0, mi2s0_data1, mi2s0_sck,
+                mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
+                mi2s_mclk, nav_gpio, pci_e_rst,
+                pcie_clkreq_n, pll_bist_sync, pll_clk_aux, qdss_cti_trig0,
+                qdss_cti_trig1, qdss_cti_trig1_mire, qdss_gpio_traceclk,
+                qdss_gpio_tracectl,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3_mira, qup0_se3_mirb,
+                qup0_se4, sdc4_clk, sdc4_cmd,
+                sdc4_data, sdc4_tb_trig, sgmii_phy_intr, spmi_coex_clk,
+                spmi_coex_data, spmi_vgi_hwevent, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb2phy_ac_en ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f000000 {
+        compatible = "qcom,kuno-tlmm";
+        reg = <0x0f000000 0x400000>;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 110>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        spmi-state {
+            pins = "gpio78", "gpio79";
+            function = "spmi_vgi_hwevent";
+        };
+    };
+...

-- 
2.43.0

