Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B0240F8C1
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044341; cv=none; b=mb97lbqcWcWozDouCdilZR6CUPKA9etbe8bdCzyzrY7a3uPj58o16Rmr6MEUdJlF2JnFz1Z454H2ueLdxdYT16OWb+bZA+A67SxURHKPqU2xda7Afx1uXd/JhaoElUi1oPIdEoQx2NNfL9UCzIptyVLldFBJ1TBVkRJyjJim4DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044341; c=relaxed/simple;
	bh=DN2hdJkQfwOmkV73g25P6amt7YJJMBYy4ixSvMZeed0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPBPM8PruP+ujf6zP8f+OObX7hdhkS6nRJpnEN9Sew/plHsFADcGhFjf3bOt/UlNUcZpsyxIl7vyjEt7OpcgS2KY+2d44K6ke77nwwh/qj0bhs48PFZ4kDkSc9Mzi5/5cr0nMAzQjQ2qWR4MiWakZPS0f+0pUx4NQ0KGBlW0ONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DArvxcAD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0Y+hhre; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DArvxcAD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0Y+hhre"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171b7e1285870
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B1qj1pjFBSlaz4iTK542UNdUPrp5cuuyZd0VJJVSPDU=; b=DArvxcADu8+8+nZ0
	OQznhjZsM0ojhErJDfpf2hngq9yP0uHbMiuFL/Io3X8dzzPat90CYKpZqfHdFk/q
	ymeU3YP+KfJ33x2So4d2kvYht2TXh8BLW19wkxeoWRITu0ePcfcHmSLeA61yO38D
	1LYyoTQ9ib0J3W3uJ9For3UA+CYt0rX1Q6zl/PHlj+EsfRPMHaTspwAHybzWGN2y
	8/DiE5v0l9c5GTTOA7xIDvS47OJGmCxkQ1jYgN+r4+g0obKvPfeu8N6/EqeyWLlv
	AE9nWIUbQQHUJOyvlNS3zkRnt+GVZgaT8/vLRIWxaaMVJlOSZy5+BrahHuWkD4da
	8PePyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3s2ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:52:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c89d4ce16so4490997b3a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775044337; x=1775649137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1qj1pjFBSlaz4iTK542UNdUPrp5cuuyZd0VJJVSPDU=;
        b=j0Y+hhref5kJG5rwROoDPYgZeL4TAdCFykuxCF21Xu71y+u5tjmS2nqS3dz7vVFuC4
         Nvn/bCEC/lzUhscs4QAD+sSRX0LnXStbku7he0ylWbhdBAxA7ppihTozyeeoeJDnGUh6
         85xpNMd/l4iSoy4qJ8f91XcKp4m6yaGGJv7XNz+qEctbdg1Ybc+BnkB5czL/It99RvO7
         /J7KmsTAN/UKqrXiJQ/rvVMHIvnkHu3FKLQJFzYV+kJ2cpVbsKcdGhJ18u9obEhmzcac
         8/bdoZ4wMkE6HRa9+uDptFU3hWhf9P3PxpM0aP4PiG5xFKdWbEXN0ApIvrRS2STrOyCS
         WwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775044337; x=1775649137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B1qj1pjFBSlaz4iTK542UNdUPrp5cuuyZd0VJJVSPDU=;
        b=pqqVT6xkxFwm9K6nwtai6weVQUmdFix06DJlmwQso00Hi9pvl89+8Qe+ou29zBMSPL
         D2r/EW75yQNO248o5VHRAgWP/Q/druaySG4GpjrvT+HPET+Io1WK28sRDjMX3E7tKQgo
         SbAXjRxOLFLGYuJ1A9dPWkBEkBF8aeIw72dR0ZuHQZrVmSPhl/n/6ueru2ckWB+4rd6w
         wcohbnso3Pm5YELoBM1NxtcGbxqY9WKEJa9F90mLqIiPP/k2TiV6UX2zWqqOoTgj4Y1b
         w9/MYnKhI2i+9v81yCsWUbeZf7qebTpb9LE2lKOFzZvp9NnjhtypqpcUEz+Vq73qFcr5
         aLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgaKpZ122RnN8JQ8EtqaFquzgkjk4ILsCoAtP/t7OEOaHKO+K5OxyQoaZELt1BhLRjHQ05bFvApiRB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7tcH6Bur6Qdz70n3CuP07PaX+kEOZmFLTirRUW/ornFFuk1LB
	AdsJpRFN6lZoGiY7XaLQZG3c6gCl2Uq2m2+CKd8+yu4YT33V5HUrcxlS2jIWUyOBsv28Tko7nBL
	fBflWVnmBub28zYAYq7U76pB2VD0RJ7ss3Cg1dBZKJ868FcaGT4eoxPDhO5JSKP2m
X-Gm-Gg: ATEYQzxi+hCfHHC+FGgr557niZufXmLziCwaL7NyEQG0HIwgzdH606ODCwAbGvtF2aV
	JLnBJZvBE+qzxB8hfX0ddlhFJ5wnVV+yFTc9ENNKhgZI4zfTKq/zOCThhVS5DoLq8YDs2W2Efvc
	xisVbxxRHbI/rCV3uHM9YN8HXv0btXOQCX4Ls0Jx9otmFFgwMF2yfzr8gp/sJcy8wUZBhPcHSg3
	YIaOs3W4F18KhG1taNJROy1YaW9h1UVYdbjomZZPWJHH5qrzjwoDpBE9bSzFM3azKjZewKqG4x6
	qmm4D93N5JdyucUqwMUVFm5qVrEAk7e66P9L1V/5uNiNVk25a/ZG54wVD/YoENREgcPQYjpOMQ2
	kTPpXOkm57mq4D03PBPpuwBqwc8YICJvr97P9Ds9KLCYKdFrk
X-Received: by 2002:a05:6a00:2d98:b0:82c:2480:4e3d with SMTP id d2e1a72fcca58-82ce894352emr3330641b3a.9.1775044337264;
        Wed, 01 Apr 2026 04:52:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d98:b0:82c:2480:4e3d with SMTP id d2e1a72fcca58-82ce894352emr3330607b3a.9.1775044336641;
        Wed, 01 Apr 2026 04:52:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8465785sm18128456b3a.18.2026.04.01.04.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:52:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 17:22:07 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: describe Hawi TLMM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-hawi-pinctrl-v1-1-4718da24e531@oss.qualcomm.com>
References: <20260401-hawi-pinctrl-v1-0-4718da24e531@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-pinctrl-v1-0-4718da24e531@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775044329; l=5116;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=DN2hdJkQfwOmkV73g25P6amt7YJJMBYy4ixSvMZeed0=;
 b=MvkLZJ7m5M1Y3895YsXu0qHuOgRR2PXaJKLD88QyTe5f3T16BTLu7qzFXL05VkVQkqaBFDUyu
 CFWZZrXOct3D7IzjwGoRnrWtKAAuSGO/1HX9ELKXzDVE+J38i1T/CZg
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cd06f2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: AXMB5JP8VKjEyed4pPkApgECrYZgdciu
X-Proofpoint-GUID: AXMB5JP8VKjEyed4pPkApgECrYZgdciu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwOCBTYWx0ZWRfX9cmBjJe+7+Mu
 LkpGE4DBqv3195ocQgOD7KkbcgcdRhIEqCivs2CInXTwKd+Jx4MB4Cu6x7hRpv/fp0xqWfUI42O
 0IczdQwgAZ89yshxKEd2rn8qtMTKrxp6OaH0aFK/srhzfsavb100lPF8Kbp42hSjAvr1Y9qO46u
 gF42+0X8/DmFkTbRo4+WGuaW9avZU+aYT4Qk39xQWgqoDscjnGwhxDNG6eLT6EPP1b6Le9Tj+WQ
 AWxw9AfNGEG/PLEoiYqd9xjZzQW/oJZ8cAq9p8crbwAjKOhRyiCFM+EEfiJQvWGa4CgXyndyzEf
 qpfD8jkJLBBgnUqgHko1PnIFQ5Fg2o/HC4uT7ymSi4qnQtffkF77hMmhMOJbKFUNWfeGH1ExY4C
 cQ5nSKetVwO5hoyjOlfxZKQm26d514aRAa72N4FaYfu5RxQDBx9MIL3gd2g1KueximFTw1Z0q1P
 LxM1+O55Yg4HuqDsA+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010108

The Top Level Mode Multiplexer (TLMM) in the Hawi SoC provide GPIO and
pinctrl functionality for UFS, SDC and 226 GPIO pins.

Add a DeviceTree binding to describe the Hawi TLMM block.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,hawi-tlmm.yaml           | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
new file mode 100644
index 000000000000..303bd7262aac
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,hawi-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Hawi TLMM block
+
+maintainers:
+  - Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Hawi SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,hawi-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 113
+
+  gpio-line-names:
+    maxItems: 226
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-hawi-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-hawi-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-hawi-tlmm-state:
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
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-9]|22[0-5])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl, cci_i2c_sda,
+                cci_timer, coex_espmi_sclk, coex_espmi_sdata, coex_uart1_rx,
+                coex_uart1_tx, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot,
+                egpio, gcc_gp, gnss_adc, host_rst, i2chub0_se0, i2chub0_se1,
+                i2chub0_se2, i2chub0_se3, i2chub0_se4, i2s0_data, i2s0_sck,
+                i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
+                mdp_esync0, mdp_esync1, mdp_esync2, mdp_vsync, mdp_vsync_e,
+                mdp_vsync_p, mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out,
+                mdp_vsync3_out, mdp_vsync5_out, modem_pps_in, modem_pps_out,
+                nav_gpio0, nav_gpio1, nav_gpio2, nav_gpio3, nav_gpio4, nav_gpio5,
+                nav_rffe, pcie0_clk_req_n, pcie0_rst_n, pcie1_clk_req_n,
+                phase_flag, pll_bist_sync, pll_clk_aux, qdss_cti, qlink_enable,
+                qlink_request, qlink_wmss, qspi, qspi_clk, qspi_cs, qup1_se0,
+                qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5, qup1_se6,
+                qup1_se7, qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4_l0,
+                qup2_se4_l1, qup2_se4_l2, qup2_se4_l3, qup3_se0_l0, qup3_se0_l1,
+                qup3_se0_l2, qup3_se0_l3, qup3_se1, qup3_se2, qup3_se3, qup3_se4,
+                qup3_se5, qup4_se0, qup4_se1, qup4_se2, qup4_se3_l0, qup4_se3_l1,
+                qup4_se3_l2, qup4_se3_l3, qup4_se4_l0, qup4_se4_l1, qup4_se4_l2,
+                qup4_se4_l3, rng_rosc, sd_write_protect, sdc4_clk,
+                sdc4_cmd, sdc4_data, sys_throttle, tb_trig_sdc, tmess_rng,
+                tsense_clm, tsense_pwm, uim0_clk, uim0_data, uim0_present,
+                uim0_reset, uim1_clk, uim1_data, uim1_present, uim1_reset,
+                usb0_hs, usb_phy, vfr, vsense_trigger_mirnat, wcn_sw_ctrl ]
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
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,hawi-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_ESPI 272 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 227>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart7-state {
+          pins = "gpio62", "gpio63";
+          function = "qup1_se7";
+        };
+    };
+...

-- 
2.53.0

