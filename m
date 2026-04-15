Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCCE37DE9D
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252589; cv=none; b=WI2IpzksO7T75G66byeyeuMWFlBTWzRMo85WfZp2jQd4QIOak3ieJlO5VLDoasYPAkRGAFVyOJtoCaeenAxoYSa4VA7Hi5V8SMfw0EFRNbIM5xKTkDfSvmM6jF05TJubfzgqXeSTJta1AvkfB8VteOOfSoEh8pZOm/ZBJlEC7as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252589; c=relaxed/simple;
	bh=Kw7qLT5MhFXRMxGuny+FowYlCESO4Y+NTzQw2T7ofD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+n9AVnSZh06BQ/CavHBK0snrqUyoouzxn9IapPoM9RkiOnpuP2JmYNiYQqIKvrk37RkYlCJtAy5fmQRt0p5bNnfbqrRayrGZ+vUIYrTer4IXJpvJJT0nCKv9wEM6rVMK6Y3MaYP/TlYVnMUFhF2qU92RmF04DabTe2OLTQgGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8R2VLDS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgZHSVd/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8R2VLDS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgZHSVd/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9eg5B731459
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGbMTA0vTAbpSe432K7wxx+b2nfGZSxHUs6IcUD3ETk=; b=B8R2VLDS5hMPvKNN
	9JlMW2gHy8eokyof1el8lE4S3nCuaoaz64XZ1atuudmgEIwO/mmjFf9kTjIXgRaH
	2f4N4Q9Ts/uw6oqCqr2v4LLHREifDWlGLChnbAEHcDDqaVD5TVPis7b609r94wzC
	wmnpBAVlx5dUetjuAK1AyYgrqWJ5kIyJfON1n/IPURSHkDnoAXRjHQatUchPCCXU
	cg/5VC2VDpT77hk+GTsb/Gq12KSOpJat9j1IhRMPwYPgYRAoQZFHziJttsed86/g
	pWdvjxhD75YmYJZT5fsDQao5rNNw8XDN6r8EC1hd+7EqkLJZZU12z5rbmSyOkoEI
	WLfEnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruubg8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:29:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6097ca315bso10480201a12.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 04:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252586; x=1776857386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGbMTA0vTAbpSe432K7wxx+b2nfGZSxHUs6IcUD3ETk=;
        b=XgZHSVd/VCV28zAAsptHvBLVTStvy3bu4M/bf1rzByRl+nOGD4fj9pSjccJtl6QPXV
         82RpZvO6HkeT+VAhibCG5GZAFqZAc4meV9DMOJGKzNim0Zg0JBVKOFDj8hkZeNrdaIOO
         sXtgsBp7xCpFsyR19HFsNMcXcfNpGoTF08H8KlW2WgsZMfn29lYBR/Dmqq+ujJeGCNIK
         iUFGpSeU3amjfNTs8zMg7mnJqMTDO7Ua9w332wolnd9Pjl1qaSzHjXmPmLAOsSFO20Kt
         vSpKAfncIrpdNzA2M76NA5pjfs76BczBZdUsMfGUbQ7nr8FslNYQi1F8nkBKGRkxU/mK
         82Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252586; x=1776857386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dGbMTA0vTAbpSe432K7wxx+b2nfGZSxHUs6IcUD3ETk=;
        b=m8RhA/aqlwIBZ/ZHmWyd/ugpHerQXvuQLMZ9xtyamVUanjwwLg79xkF7aOl8wHSWrX
         CnsP8ljFJtUz9+qb1ge9AsBFs7BoEAxfhlZlmXtJvcb/Hzyygry8tRuDULQ8vE/zcbAg
         cEq/FhCdr8iaAh6fzgHwmZv5lDqO/2O3jNbsgF699kK9auiImxJ/JQh53e+cPf2KkKHk
         PWuDYVILEF7wqTzP/J/QKHdAM1LwI3sMxaAAtD8l2+jGvTW+CzriZPvcaUj3hlbpPcDO
         ZXOLROk2lxV3sR4Or9Wgyu+ivqUeWi3d3x1/2EgWoRMA26ftzSz3XPT6KRXlTadIVKn/
         IheA==
X-Forwarded-Encrypted: i=1; AFNElJ+DSQEvdz8AND0yLdKiPkQei5S2y1ro/WXzsn4Kp+VmzDxd1fsIzRNWAjpNSdDrDk6u0O9XoeVRFUEs@vger.kernel.org
X-Gm-Message-State: AOJu0YxYhQhpsQzTSyEkWGQUAN/jnZ/fi/yqMrL4YuF0SF8GZ5SarS+6
	oDVIC+crLKMRfmlrkAWcmhy23cn0WNysgalrNBF9+AdzjoG17vMT3ksuhZ4W/OOkmx+92licHf0
	MaUZXZACDdfPEo/11K4RAd3SQUUrS1jG0A+zq1tJwbFKpVKTx4IeAHdH/SZgI1K6YUqudGMT7
X-Gm-Gg: AeBDietsiJZg+86kpxvEKbp6TDp1MKLPcEkcVMnLHOfRMxerg2f0x9Z0RXCL+dRix7a
	l18sw7vNmmfP7cAV9/JzIYtNqMaamqmcGAMFHl6FjB2SG9eD8+X0hQ1JBS0qgre/P3XyW5l6GEg
	DbiBAJq1uWW9vTfqppgtOQMKgTDTY/oI7taO6iPxrjIyXyGDgBJ92lIYgSFSa28ePO/7EP7qg0B
	EOwn7hcUYvjFKMdt/zbqlCjeIQb6Ys1g1GUCqWu2MZBAbw7VOwia+/EjyX78C79aHGYI0Rys2GI
	8STFpRIHGbbphlgqeQXoGGKNFCSbrP5qrJ5/DqtQ9pgH7+OFfXcKpKUx9f3ZTkif3tFppsok8Rs
	gTyTNizTQGPXliPEs7nZxTpI5z1y1U4zVw6J7EgetalPJARlK4rKTppIHumFkw0GgBrM5SXnYvS
	8sN9TcpQGyXmXIFpbYPMU4nhlmo8O15YllWo1SSu5554PH1W7NUSrE20S5
X-Received: by 2002:a05:6300:6a02:b0:39f:3dbf:b0d5 with SMTP id adf61e73a8af0-39fe3f5b42dmr17221254637.36.1776252586034;
        Wed, 15 Apr 2026 04:29:46 -0700 (PDT)
X-Received: by 2002:a05:6300:6a02:b0:39f:3dbf:b0d5 with SMTP id adf61e73a8af0-39fe3f5b42dmr17221234637.36.1776252585535;
        Wed, 15 Apr 2026 04:29:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1417183a12.1.2026.04.15.04.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:29:44 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 16:59:24 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: add IPQ9650 pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_tlmm-v1-1-bd16ccb06332@oss.qualcomm.com>
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776252577; l=4547;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Kw7qLT5MhFXRMxGuny+FowYlCESO4Y+NTzQw2T7ofD0=;
 b=1rRUE+fuFkcnI51aMj/2eYvRE8Uo0OjJ0Ci/HAGR4XE2U8RtvvHKzKv0pA37hwQDOguw6fB5x
 WFgUG2IfYj6BeNcGi8JHCHBEAxgNe1xR/y0OfbwkjK2OTWS0+Iz8upx
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: jX1ibrLu-6nwwWlOhCsAPAv1il6C-Ha1
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df76ab cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=N690yQSzLXC5e7GKbG4A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX/Qwu4OvS0WfD
 fLv0vq37DSH42D9H5/wEAO37D8Oo6buM9Hz1ilk5i3DBFQIddqeVjp3Yxirq7CtmrcfFHL4l/BC
 Gv5WoG5vBDpDIGAmft4G5hDq56ZTBl4v2idDH3c0TyKh+iYktg8bp7jdctTA5PIYka0HbZ4gvYv
 HVF3a6xWDugmXladkUNmT4YEP76yGVtPqExs2NGwdAzrDQ7d+CTC1f1sSSY5jlO8zPYGyOYNzyU
 dS08/4eLRPFFBypsa6ZuWuVlZwyC9suyTFFk5GDlTVqrbmPy/9nizh25td5tq+pWzy4NvSOHqrQ
 IGvvMGdIOoIqc0SO/64XncKrBsvjmae5dHILmCcuqTZQgA/YOpGYTC/1io13+zgqP7BmdiWmJuO
 3I52+bZu1n0ShLLlpZjdnUfsRfavurD+O07GzGE8oDvACydvUdOe5YI7KZdcc1HT9X6bwBI8nRF
 9MPlZG3fqBfDiHTMl6A==
X-Proofpoint-GUID: jX1ibrLu-6nwwWlOhCsAPAv1il6C-Ha1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150105

Add device tree bindings for IPQ9650 TLMM block.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,ipq9650-tlmm.yaml        | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml
new file mode 100644
index 000000000000..549eaa6aa11b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq9650-tlmm.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,ipq9650-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ9650 TLMM pin controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm IPQ9650 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,ipq9650-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 27
+
+  gpio-line-names:
+    maxItems: 54
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-ipq9650-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq9650-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq9650-tlmm-state:
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
+          pattern: "^gpio([0-9]|[1-4][0-9]|5[0-3])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ atest_char_start, atest_char_status0, atest_char_status1,
+                atest_char_status2, atest_char_status3, atest_tic_en,
+                audio_pri_mclk_in0, audio_pri_mclk_out0, audio_pri_mclk_in1,
+                audio_pri_mclk_out1, audio_pri, audio_sec, audio_sec_mclk_in0,
+                audio_sec_mclk_out0, audio_sec_mclk_in1, audio_sec_mclk_out1,
+                core_voltage_0, core_voltage_1, core_voltage_2, core_voltage_3,
+                core_voltage_4, cri_rng0, cri_rng1, cri_rng2, dbg_out_clk,
+                gcc_plltest_bypassnl, gcc_plltest_resetn, gcc_tlmm, gpio,
+                mdc_mst, mdc_slv0, mdc_slv1, mdio_mst, mdio_slv, mdio_slv0,
+                mdio_slv1, pcie0_clk_req_n, pcie0_wake, pcie1_clk_req_n,
+                pcie1_wake, pcie2_clk_req_n, pcie2_wake, pcie3_clk_req_n,
+                pcie3_wake, pcie4_clk_req_n, pcie4_wake, pll_bist_sync,
+                pll_test, pwm, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
+                qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
+                qdss_cti_trig_out_a1, qdss_cti_trig_out_b0, qdss_cti_trig_out_b1,
+                qdss_traceclk_a, qdss_tracectl_a, qdss_tracedata_a, qspi_data,
+                qspi_clk, qspi_cs_n, qup_se0, qup_se1, qup_se2, qup_se3,
+                qup_se4, qup_se5, qup_se6, qup_se7, resout, rx_los0, rx_los1,
+                rx_los2, sdc_clk, sdc_cmd, sdc_data, tsens_max, tsn ]
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
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,ipq9650-tlmm";
+        reg = <0x01000000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 54>;
+        interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart1-default-state {
+            pins = "gpio43", "gpio44";
+            function = "qup_se6";
+            drive-strength = <8>;
+            bias-pull-down;
+        };
+    };

-- 
2.34.1

