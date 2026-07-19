Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C5E3B6354
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484323; cv=none; b=er9IFjYtZikjPaw3bxP5wt+aTMNQaJ0HuUDfjOmaPJoDbBm0gnOtHmcrYqS9CMA2GrB8DcEw7Opx3KPo15eMqcqK8nxV2GL2E6d6ugWr7Caz717r2qqzlxH66saD/QlYKIHmW+tUafsrhPI/XUHd0MSmZRieujsmp8uTLz7tZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484323; c=relaxed/simple;
	bh=3B3mUF41+QtzNQXxOpdoE2xwQFCLTsYKS6hM6iFjfFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fM84bRNp8o/ZXm6WBDSuR4YyXxcj7f9tmYnaL6SFcWnTFraM6kqs2QKf2QFAsOBRoG5dmHAdDMEi6asYp8/POrkJZAY078gmzm9aU3QctqeBtJOmM6tonWuFI7Vg8YNoDQM3XGZEIV7DQhLrEwm5oGvOWGPXG8357ThBDlHfIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwpRAi3U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUFxBKXN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwpRAi3U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUFxBKXN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JHHY6f096087
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j257oqrOMCjEFIiX3a+qdYuTQpMqY8gcd4+WblhRtwU=; b=VwpRAi3UQMhheJ40
	OriUD4UZm+kyfr1XtHJefMncLiE8o4yvGcCuGcn1tCMdvBNpydijtMZr4AjUeLrW
	DT/rYPEyIjv9PwnUncvkbYqLWnUHJAAG+bRY05+xSuyZbD3T0OOi3KAnPMrAe7Rm
	zZa36SDQgJFOgZ9n/CBMLWXh8v5WXulcs02Yh+t7pnCmDxcw+lv5xFgXRD7/I79K
	dtusCAqcpOzVcLD7LGRpu72bPVc9tvKfIUjgSMdDhh29kJYHIOSvWi0rfgI7l0hJ
	htSQeF6jfWIKpsZMF9BSFLaz2A5CtZjecYKBh3nRxuY+vuS4LU+Kv2OUQAHkRfme
	t9hqHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af3752-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:05:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7ea29141so43275695ad.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 11:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784484317; x=1785089117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j257oqrOMCjEFIiX3a+qdYuTQpMqY8gcd4+WblhRtwU=;
        b=VUFxBKXNBmHqCaM93PU5MiO+n5ou3H78YQ0yFignaMsomDppzm4EEYdM7vJ3JxC7w/
         DtKvfb18DGR8g0WYQnMWkiiYod0Jp59ncmYZvSf2Z5oLVppwX27Ry/DSS0Kr/PC9OQdB
         gjS8EDenSfpr/74JcxnMBaqeUSE/y42RAkGNs9o+Y02kGIMjQEfoVF/pz8snW4QkaiZu
         T2933lrygvB4EeEIWCuSFH1uOlii3b7VCIqTk1csJ2w4FlCn+bi9/Fosmraq8nHVOXO/
         xQ2waNygDyEr7Zj5otT4t1EnTLElfZueHTIdn5ubsSmBCIhCrB0MYbixSIK+9YX+j9qm
         6ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484317; x=1785089117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j257oqrOMCjEFIiX3a+qdYuTQpMqY8gcd4+WblhRtwU=;
        b=l5QQDWwaEfcJ3jKAny/GGLNkk73YiMaJNzLA2g1yLKH7c3hywzG8WVEAcfWOILcczO
         5x+ZSYgcXbNOAsCpwbw2LldjrQkJ8w8OIoEtjJ5i1oKxzC4UUoVBDRJ6hlwpiDSVFcgR
         Cp2JvxBK3GIJLEKBtGTMyAGtSYV8Z3Omg0iAsNS+nj26ZFIjRFWabW6pzwNKeUk4tL+g
         gwtgHLK4qQHNr9DLHCOQj3cnk99BJZSSyMupBjDymi3ShD0rK0btL01qpX0BN9bNkf3Z
         awWz4ul/AIw6hsbhngJy72c7BfzTvMjLg9M8QofsRpZEQGd4NQH5CG5IYKEbVb3+b9Jf
         +Z5g==
X-Forwarded-Encrypted: i=1; AHgh+RqI8PXWVsjFqOzuTmrQA/UP/D7Qq5ylQcCry8sNkKskvcprkUiHqaiz/BpTWRMEpXf/fo+fozbREA1Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyR2QEw8eTTmWxChaRE6UtRoUjsBGv6hxtxcNNX9xDdVtp1oXHB
	7Dzqhd+3oFADc6O9z79J7xzVwwCIiYWrfUa++s6Uq8/3FQl/35Ooco/8TCpQOYlpTVddY0cNfjG
	0RKOT7bVCEQteYR3VNsrk047DsJFUnajeCbaT1wrdhcDVaDFBF9awXpN8N/0B2oL7
X-Gm-Gg: AfdE7cmQ6JFHzof/LwBapiLjlRmawPe/IcBpUhhENGTtjBQ6JywEGJGzbMQgJpS5oP3
	ibTWhNtGcBfvBCKGykBcDngIThOJ31CC3TSGkpbypcv843hdfiH7kVMBtnNTHzcLPJ5+v3wHCTh
	q+OBsXoNpl4kyLhExY+KJxHPt9Hn2OzkGjOt4469OKbvv8it2RF7+IGi8E05RL/5qIN+kuBwFD+
	EjAhwqH/73KSAy6xP4JFFYgIpvg6xiERlKNnV6BAQ5AtZd61arx0ZKLTuDglIUPCo7KkRx/iG4O
	fEzeaHlOaEkaJZ5imxAe2grdznZ6rB/VVhre+dwm2QAjvp7a5vXiKzsZM2y9tRhFRIMpaGoyrMc
	d5G9tv8hvDn9QjQbx0aOVGrfIk2sPNZ38if6x8E2ANuvhntRg0ZcjiTPG7I/E1vdwjWgqUUF2sZ
	a3zgzqVzggKeN27cvelyp3
X-Received: by 2002:a17:90b:2fc3:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38e4b3d5042mr8987894a91.2.1784484317455;
        Sun, 19 Jul 2026 11:05:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2fc3:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38e4b3d5042mr8987870a91.2.1784484316978;
        Sun, 19 Jul 2026 11:05:16 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm28037681eec.26.2026.07.19.11.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:05:16 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 19 Jul 2026 23:35:06 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-lvds-support-v1-1-1f1aca3213ba@oss.qualcomm.com>
References: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
In-Reply-To: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784484309; l=4620;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=3B3mUF41+QtzNQXxOpdoE2xwQFCLTsYKS6hM6iFjfFE=;
 b=IJ+eH+BC2UQRK1d3SHf5auzaN0VjetnLsxPZEBIaQ2yGfgT2t3MLt3jvdi3FJCt6xCYDVCu4P
 xeRPQDT7SVTCjnBtzyFIJVjmzpg62N6/lLqCywjNN7t36HrC8ZSmowT
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDIwMSBTYWx0ZWRfX5nBOsgQprE3k
 u9W0slrUljxmzs9K7ox5L1Y9Xuy8wCtwM48vdFyMDU7Bhe/ZzoCxmS/fTOmpI2Mf2tw8YNyWUBt
 IvmZ+dIUz5+yJds1VyhxEnhQSQyQGBU=
X-Proofpoint-GUID: nPUWPcWbOjkokiesrLV47jZOvTcVND_O
X-Proofpoint-ORIG-GUID: nPUWPcWbOjkokiesrLV47jZOvTcVND_O
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5d11de cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XDEuxvGYp64Eb9E-atsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDIwMSBTYWx0ZWRfX1IB4Vb0ELNal
 PjuHwgtM+DGvLmKkMJ+99fgX0fZ17E/+bRReL/df6GSSLugpXsNlLeLgfnRLFDcq77AR3uQplog
 BFQLhaiLnOl+W75GRj/A2e3X8B/NZrUyCnLX7mYNAOHHz8Rcpmx2Jc4Gq5WNXoyggSsm2QXA9LN
 lyO8BIrYWzkXRLfj7qIpQsdrjCxYnDRZ1tl4VSXsj6Pv+kGpz0+nz3idmX2W8L7EZjXvdRFshy3
 l/wCdJfYNNgGLbKRxGIStz9yTnLzmTbhNvZtE+MXe/acDHdWV/aU/G9ZuTa6FsxyoO2NHEGh2kV
 psdaNrKSYj/Z+5JzHb7iqiOK34ZDXDMToBN9cutQdj3uFNqu7xhck9vklZN7y2X6U0oy7Xtc4lm
 ii4R43V+l6R0bFASuVzshjvrkbSFIH2QpMhY5KN4zpvIvQisS41bh9RDVJegvqOYlGm0eUwGLYn
 AgpDuu4eybG3EhZVRPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190201

The Lemans EVK IFP mezzanine supports LVDS display output using the
Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
VESA-24 mapping.

Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
a panel-lvds node describing the 476x268mm 1080p panel timing, and
an LCD display bias regulator supplied through the GPIO expander.
DSI power is provided by vreg_s4a.

The overlay is built as a composite DTB combining the base
lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 127 +++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5a1c56cf98f6..2c4e7a891717 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -55,6 +55,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+
+lemans-evk-lvds-boe,dv215fhm-r01-dtbs := lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo lemans-evk-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..17c20e86e950
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Lemans-evk Mezzanine Lvds";
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01", "panel-lvds";
+		data-mapping = "vesa-24";
+		width-mm = <476>;
+		height-mm = <268>;
+		power-supply = <&lcd_disp_bias>;
+		status = "okay";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			hsync-len = <44>;
+			vfront-porch = <4>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+			de-active = <1>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+			};
+		};
+	};
+
+	lcd_disp_bias: regulator-lcd-disp-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_disp_bias";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		gpio = <&expander3 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&qup_i2c1_default>;
+	status = "okay";
+
+	lt9211c_codec: lvds-bridge@2d {
+		compatible = "lontium,lt9211c";
+		reg = <0x2d>;
+		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_s4a>;
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt9211c_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss0_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+};
+
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+	status = "okay";
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&lt9211c_in>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+	status = "okay";
+};

-- 
2.34.1

