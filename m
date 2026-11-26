Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679460;
	b=y562U7DMcbo22FwrNMZBlIIqMAlXMg++JMP+WVT/XS3pRzZnCuB9dZzWlsBiSzNM9+5D
	 2yjKdCKIJrn0M8htEKh4GrVzQYlRMW77ft8zKQVc7urj5jRCJEJQB3f33gK47UmQB5sDX
	 CdJ3u/QMYleQRAZkhf22DcxR/l86/oUgfPIT4C1HljTlSmsxkP46i/ejy9myxdTFDEbNt
	 toJZmXolc2fOu/uWuupj1EDzWSkbaaJT60pymdlgO4ClFnLmJaBHzzxssNnpLdt7N9LTE
	 sxBvMkRXKMkIrCvdxkD++yKWTpoE3L21B5fmik4mXmRHRHX27/ALX6MsZRKT9yqFyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q4uHA4hFfJSKN09rCisHS9gjk9e21ZleFeBfEKPLpaU=;
	b=0ror6psbDWinXJ95XLxWM2sd9+hzxOE6AmIo/N+BJD/gbaYveq5x6A1dxcq4uYM7d2Pi
	 zDFXLbz28oZQ+ucJcF2Wf5/oBzo0lKM46vWWHH+gYHBmfjpSxbzek9LRKdOTj6iDiPl4x
	 VXo3YKpRmgc1zhAPNsYs+bvAlRREX8WnQr7Hfh3ff2mFoAOadkNF+hTXgKV2bX4RlB3mo
	 jFtW32v0D5NAcT6h5b9KGaKveF74Zx+dOK6lsEU3O+d5F5YHs6Kn+fcbZMHdy0FZBfRo1
	 TYlMjFurt6nHaDEUOaJu2Gnf+NLg/BmnChMLc8jQBr0XWiscMDFqx+FVYAbYXrAHYNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EfHHRrRm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5427A606A337;
	Thu, 26 Nov 2026 07:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5427A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EfHHRrRm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4Fc2886570;
	Thu, 26 Nov 2026 07:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4uHA4hFfJSKN09rCisHS9gjk9e21ZleFeBfEKPLpaU=; b=EfHHRrRmOYnINs/i
	Id7zhDc2/fDMH8KmY7ot+difFdj0Vvqkcb70XwKqfxPc32vzLMcJSq4Z93heARFU
	hBvEx3Fwg6NcT2zpY2xCCFRFdYfj069A5RZh/RT6ptWZjMIpiY7KxFG24lIPU5Wc
	1OMdG/4341ry7g/KCjQfBDIUN6iTFAp7W+fcU65W4Ux5JT4pEjXKjPYcD317qSQu
	cqyvvcJjxz2JkLt6JWL5WP0XekB8LEEbwDpzA2np47AaJGpUP7E5IYP4zo3YL8Hy
	oGkL3mpRD5yf2YygyzMiGhngpGUwWCxcAwwQLtQLPXW4gF47yaxwbwYEmn6MKQfE
	Ua8/kA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgbjp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:46 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7nBlR3790633;
	Thu, 26 Nov 2026 07:50:44 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AQ7oiHw3793298
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:44 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id D85A1A78; Thu, 26 Nov 2026 13:20:41 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 26 Nov 2026 13:20:38 +0530
Subject: [PATCH v2 5/7] arm64: dts: qcom: lemans-draco-evk: Add AUO
 G133HAN01 LVDS panel overlay
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-draco-evk-display-v2-5-95395c5ee387@oss.qualcomm.com>
References: <20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com>
In-Reply-To: <20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795679441; l=5573;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=aOt9w3Oab2h8P9b37FDRJs9fh2kX/ZguE3KTjfyUnGA=;
 b=lntHXJa1XuWI8WGHr2335vYamvWYXZjLZbeFWQTk6u/yt4Pnu3FcFb4Us0x2/71ENl5YejGtC
 dW/Q76nFwYdDLmp11sMpcNiTxPmtNw+PlvYizJty+O3otfzgnMQ7JYt
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX8ysOyrlVMI46
 XmgUzJoJEu5wV1ucoxmT+WkOt3YEPDqZVrNSAJVlBCmUbU+BaVl2qmg3DXK5L2yL8g2OHeZhU0h
 mHeV+7Bm5XWXMcB5XfcEpGJMCQw74rRgVWUHD/wO/oGi9geCUHpuE98ht6kq3AAMbQOleBfnG30
 BxNv18utw5voWu+dQJmZEiGhNl0WR5Gmn8p3zZP6S435Um9WI78GrAKkghHAWW68qPWbMJItGvJ
 hjl6ED7EpPBKAm8THTCrutv5MHlzElpQSrE2MxHAw1dsoIRw2RfcRJsKYqY+Hgxrr5CEXmnq/34
 0AOovE/P7zt3GQdUkmi2GxC4wEYQ+EgS/g258bJcSFHll781niBLFyU8rPaIfhomB1THnDxwK87
 kWujdUfeU61rRioa9SnALTO+Ez8QZdwVgd2q7a3JtxtLqVctFoQe6ip76rxsWnuojXlvRRWux2F
 5BY0UvhwDQqaVTNxyCA==
X-Proofpoint-GUID: QyWVjUMMIXjYfU2wFW8xoKVr3Kp1i5bK
X-Proofpoint-ORIG-GUID: QyWVjUMMIXjYfU2wFW8xoKVr3Kp1i5bK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX3gY9agqxlzH7
 NW4XhSnXr/7Adx0/fPKaOkU/MWhB3En/+JfyMrIoF8BkwS8q6DcvXtFq1iep8VPMl7tVUdKJgo+
 h7RAIy4wwZeTOz3ul/atdRx6X02nkLE=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07e4d6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yFK77E__IYD6oYScarQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260030

From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

Add a DT overlay for Lemans Draco EVK, to enable LVDS interface when
LVDS daughter card is connected to DSI0_B2B on carrier card.

There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C mux channel 1 on i2c1, with reset and interrupt
connected to GPIO39 and GPIO97. Backlight is driven by a PCA9685 PWM
controller on i2c4.

Disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../qcom/lemans-draco-evk-lvds-auo,g133han01.dtso  | 133 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts      |   1 +
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi     |   5 +
 4 files changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a95e14b26804..b1c52bf66e9f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -67,6 +67,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtbo
 lemans-draco-evk-dlc0697-dsi-dtbs := lemans-draco-evk.dtb lemans-draco-evk-dlc0697-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtbo
+
+lemans-draco-evk-lvds-auo,g133han01-dtbs := lemans-draco-evk.dtb lemans-draco-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..82bc466fc0fe
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lvds: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pca9685 2 1000000>;
+		power-supply = <&vreg_bridge_3p3>;
+		enable-gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_bridge_3p3>;
+		backlight = <&backlight_lvds>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A - odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B - even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_bridge {
+        status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c1 {
+	i2c-mux@70 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge@2c {
+				compatible = "ti,sn65dsi84";
+				reg = <0x2c>;
+
+				enable-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
+				interrupts-extended = <&tlmm 97 IRQ_TYPE_EDGE_FALLING>;
+
+				vcc-supply = <&vreg_bridge_3p3>;
+
+				pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+				pinctrl-names = "default";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sn65dsi84_in: endpoint {
+							data-lanes = <1 2 3 4>;
+							remote-endpoint = <&mdss0_dsi0_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						sn65dsi84_out_a: endpoint {
+							data-lanes = <1 2 3 4>;
+							remote-endpoint = <&lvds_panel_out_a>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						sn65dsi84_out_b: endpoint {
+							data-lanes = <1 2 3 4>;
+							remote-endpoint = <&lvds_panel_out_b>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	pca9685: pwm@42 {
+		compatible = "nxp,pca9685-pwm";
+		reg = <0x42>;
+		#pwm-cells = <2>;
+	};
+};
+
+&mdss0_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
index b0b733169aa1..9fcd91767bda 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
@@ -17,6 +17,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		ethernet1 = &ethernet1;
 		i2c1 = &i2c1;
+		i2c4 = &i2c4;
 		serial1 = &uart17;
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
index 1001b6b81c31..fbb3f224688a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
@@ -287,6 +287,11 @@ &pmm8654au_0_pon_resin {
 	status = "okay";
 };
 
+&qup_i2c4_default {
+	drive-strength = <6>;
+	bias-pull-up;
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/sa8775p/qupv3fw.elf";
 

-- 
2.34.1

