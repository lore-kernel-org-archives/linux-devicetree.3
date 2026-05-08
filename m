Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2F33DA7E0
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240513; cv=none; b=uBWZYSjO6dQa6wQHPGqdZFhdFpgDA0zY6sqScXMGxLJZ+xR6lO2ol61MUlcJeg4WbDgp0rTLrgII/dvrRiMv3tGuynB5fr8FEU6bzRF+z0SmrVCIp1WWe+b4mr0OuLTEFWZ2Egn7d7gvG+YMNeQRbAp0x/JzwAcI61rpqGMaUcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240513; c=relaxed/simple;
	bh=C+fdaZxLrumZmrqKOPIPxKcscjjl4PkjK9Fk9tnFUzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QkFughdGg5cXZkD8kqP4DBUyFg1BXCr36Mp2ZNQLdPDEq8I5hYutQKpGETWv3kq80RwNUmbp78G3wcCSY20sm+7cs7XQhq+IBMFKDDo4iGFqPZb2bNVlx8tr+4YlKTu1mYbGrWyFErQhKb02sfU1lPS5ciCenFdm8abCES2rSqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfXUIhTl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx3n0CRZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfXUIhTl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx3n0CRZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648ADxdQ2531299
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 11:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=; b=DfXUIhTlvOjxe8Y+
	5kJ8S1H4F38EI19gMMZTsfOEYWOHxuMGyzCK4u7S4lVytDG4K7UFzjs2sToNZTAH
	4tzc9XCP7g3uv19LpgL8NH7CYihGJaWeeALzVHkTZbR2f25wGnCW38PLgKX5Hh6o
	tDhkqZjEjZOjqR9gmBcmfI53WSf4WdquyJreFxk+KfILQZJIyztluPkuWcZQ1Qin
	v1hbnTAT/nZIBD4Zzkjf6ol/9ObMxRJ+uwTu7dIq5HB2XBw7zDtPneeNIOeHiUF2
	So8T/hnfKBLrztGdl7jI/lWiGyhAjhgYMgt8AOE3vqdDvNIM0FluhinPPdzFK+gn
	p46ZkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9u6x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 11:41:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8e8950b3ee1so138300985a.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240510; x=1778845310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=;
        b=hx3n0CRZ8M8GhUVZKfZ/vS0g4/LhtGNi/oSfBvHbpHiXRW3MF9vbD1CSoBWgSwNym8
         XkuW1S+9V7DHm0tDIMq2n1RHP+9VBpJY+9HgZVy3qM3FuakoSN3P7vmQgyLJDaZhSjPJ
         ymGxzPpy0SYzQKmAdEZlxYE1uJPD0XKACEj8Urc89tkRF9BqJE8ChpaKtbsul5U47PPF
         KmkgLz7607O+cFn/Hp80pIqa5xkKenEBiTDYkpIq40xn5tEgeMZ0cgXhmiNd/PwDITV6
         Wjvos7jOHpooBkB8aXJ0/NO8yci7BICXP3ggKyPdkxx+J/d/ivxZEXwDqFxFuKwVgYyY
         1IvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240510; x=1778845310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=;
        b=IwjSZT8YXep2c8FKOwRr9DGBqy0wCU738yz0MkRdGZbrOCtqqJN0AiowDFLPeh8Y5O
         2Nso0XJWwXv3WMAGXFmDqHhFNfij109zdJ6e6t0X0ZwiXATJ5/F+axHlnwUUIWuVgZzh
         VFLCoYuP12wafHCsGsJTGPdTYig0+qttR60M3XJOTh50gxhjFZOzmG/HtyUHilt7DTbQ
         3erG0dVmaLfoxByd3HhQZrB6nWp+Ka3QM5QgAhGHJ8GB0oNqnaLdBc3t5nKAPo2azOCY
         53Z/9BMTCdTS0V4miNL794vJ6eGBY6BB/l/uxvOTB+h6e3eAeI7tmzbXMREjYvipuIPk
         33Ag==
X-Forwarded-Encrypted: i=1; AFNElJ/mukQ7bveAwjZUpXFwsWJSJza7/oIT7AtjNPnn4JtE6yQOH7rWfr20dytfXSWCiJ71jN84kq3vxq38@vger.kernel.org
X-Gm-Message-State: AOJu0YwivT5EELHjww7Utzwj678NJJ3AcBYvMTrjckpBeB9KZnd3WP6j
	DIxLJUsCSuEe3fpef9UiGJgsAKmqmowqGA+/GHshZU/J8fOvObIRwmwIFocBxwCd57FPjQvgYxL
	/xEf+CIATVk9zRRbDmuHS3GOzD79PbHDCbrNr8/L+hGTq9sdU7rz8k3qPTs75sMkJ
X-Gm-Gg: AeBDietYzdZKzhyyS4Vd/QZ50aKGHbda3wrSxRKiHxzwWwPFRpMTV3rFy+hSX1/GZxP
	gTN+CjqjcaeU8TGibf1dBa8FGGucAW7heYc+IHMg1RSehGgDEwp+kLpQAmfoA3hx3r7Vj8tQn5U
	2ARF96XRh59SZ7shHxH1iekNH9vnWYVyroQqyI7yc6NS79gLbfxy5fpvoyZP2CCN+b9SZhxIdbt
	L9yY9zq5OJucIphk8acsuDJooUP2NBYnpq89NYuZbZ9ULuQxNoP6AcB3fVk4Gt62+fephZiex73
	tvEr32zaluTejEFXZqp+iaJ2eyURf9sQt4Dc3keOxW9mUxKILGu7WJxW/lDz9vEsVXOhjkPNrpZ
	3l401NoAu41eoYWxaHDYfHLxuNJig4qg4wfJFwJucVb3lj1dPAJ76EG6zEOKgymHnp3KzI4lNbN
	jtDKYzw4nOPcE9
X-Received: by 2002:a05:620a:1a0f:b0:8ee:e011:a77a with SMTP id af79cd13be357-904d43924eemr1787927785a.13.1778240510137;
        Fri, 08 May 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0f:b0:8ee:e011:a77a with SMTP id af79cd13be357-904d43924eemr1787923085a.13.1778240509717;
        Fri, 08 May 2026 04:41:49 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:49 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:03 +0800
Subject: [PATCH v2 7/7] arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add
 DT overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-7-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=3823;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=C+fdaZxLrumZmrqKOPIPxKcscjjl4PkjK9Fk9tnFUzI=;
 b=9XYbJL6WMlwsC7APPQEr/KM3rpDbA1ZBSBoisHSl12i+aDVSSutd/eLI4oZcb23vOxSu2GI5R
 nQvVmkw1noWAs+1OJ3bfyT6apViMjUM9kvQLXtDao8r4x6pUxoqAUuP
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: 1JLlo28eB-f8OADim0mQLQSbFf1uWZGT
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fdcbff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uiy82_YRydbR65prXQIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfXyQQ+vk8b3hBl
 E3mMicGGkb9y7DRZIu6gqhH5Q1B+fejjySM32XcTEJFnvfRVQLpPYngEHHhT7ZPkUNdCBnWkaug
 d9CA6ghcRJUzqbZWK6Fq3Yjri92UmyQYrtaZxrCWafHZDXsE3S9JEZHCf4cul8gbHEfGuOvI+hh
 T7YDlths2wJ7+1FZZnlI9kjLRsa4TZh0inxfnAL29NPyogGliLhCSHbJnmOqPvt4O95ccgXjuqz
 1f272XgYwnde+t7Gm7qtvA+QwjLWZAbxBGRIL0R0nu7xU/YV0xiYW7THko/L67nAqbDjqama+4H
 xUESlUR8Tprq2PdKoI3uUMRYR3Kj4GGUW3GiovJUs4DWSCoasMBAyDx1UL4/MRETpI1X4pt1Pm1
 YFDvvficuklahKIfdflKYJxlFtiES9Cj3yTtdUCYbZdoFZeItzH05BnfLsdHRSWQVmNTWMKpiDK
 iIM2RwDb4rs66UIlhxA==
X-Proofpoint-ORIG-GUID: 1JLlo28eB-f8OADim0mQLQSbFf1uWZGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121

Enable IMX577 via CCI on Hamoa EVK Core Kit.

The Hamoa EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 74 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  7 ++
 3 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e73064194926096b98b9556a3207e8f24d72..48536765058a4244a2b895bccc21567d186605bd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,6 +22,11 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtbo
+
+hamoa-iot-evk-camera-imx577-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-camera-imx577.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..4a20656f16799d7a9c8fd4ad63ac0989cdc37de4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vreg_cam1_1p8: regulator-cam1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1";
+		startup-delay-us = <1000>;
+		enable-active-high;
+		gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&camss {
+	vdd-csiphy-0p8-supply = <&vreg_l2c_0p8>;
+	vdd-csiphy-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 110 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dvdd-supply = <&vreg_cam1_1p8>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			imx577_ep: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f694c22ab2670d26753ee096ab3682..8cfcf48ee0099d4b505acc3e5662553e77704d5c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1320,6 +1320,13 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	cam1_reset_default: cam1-reset-defult-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

