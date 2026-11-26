Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681964;
	b=5pe5krlJGeHXQGtA5+hcbvmtHdnwsNYPI+khky6G3ylqGcP0AW7WKvgmn7s3FHVc3q/v
	 wlYxY29in+5MnH4f9vWq/kNpAntBUaLkVWOdc8LVUXZfsL7dyu/3g5V6mGI6DhJ5xDbis
	 WwnPEf69VuX1F8SvKeVKd/3jh0vxBvijUWmmO1BUPICsKm3eVe+24to6FC/ikgsirfAWV
	 mB4ssT5/zQvZGFTGpP7PU9WAdXPDogvCm/XwfQCy15eLvOr7inDkgOgxzeg2iGlxzjzJC
	 +pVK1/iVd1c2k+0SVryhrksFdTSjcOJGkwowPfoLW9xkQ2phUDLRfRx/VRAfHQXsg9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QUn+sqmd/ogkkPKPkwPiT8rUdwu3ZmWloj8+AVWkxD0=;
	b=x1FZGRW6DTPwlyM+HmFhHquvfQeaY+aU3phrXap07hTrRsAgm8FxXsa7b0M0mNZXedid
	 YWaLeC316gei85pEDQ4w0V3iX3iQH40PatXbc5+0lEbAf6bNnV4TGKwpe4GSn6ueR8ayI
	 KA6dPYQ1T3iMQ5/vS4Iyui0Hd1jU2S+30pGVfn+XzvTihBSpEY/XloAJLYj0feM+/gCfo
	 tjWQl2lJAi4H00T8imeGwD4sRZopTEYjH/ReswtXV9/7Qiit4Cm7nf+iUQHwZ9WYDJLH0
	 xC03fiL1gkV0YBFPdXlMos4alxyvfY/DeCxtIoiy9datM2A0inA1ToOOr8UMbrZZ0Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2WQgUot;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6A8606A69B;
	Thu, 26 Nov 2026 08:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6A8606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2WQgUot
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8W6g3236082;
	Thu, 26 Nov 2026 08:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUn+sqmd/ogkkPKPkwPiT8rUdwu3ZmWloj8+AVWkxD0=; b=l2WQgUotDLC5o+xn
	fgEuaB2qyEYjNvjoDfoNeTPtPj+6RDEqr1u4skBOOTYnf7aFgh62dNECF5MXlFto
	f1yA2UiiFOITahlaGze6faPK7Soy0UA4EI0oBN6iP8NIvgyfeFQQfGmaeJMt7nTP
	ddvLrXJs7Om6SYP2UAe+K69rNdJHOxBmYss759zbZQ86PI2IyG4eqzAmGzGG7RFA
	dIYFzmQNM517FyM4pcZuGVYfNUzeBrZj0SALqUoPRuS7ZAke+5XoALWkWvxd6Wl1
	aaxVYV8/NB8Feq+n4SnFshKgQhmn4q7BRQoY4lABuQyKWoneCGFrwLYiN7OXtgHi
	0y+CEQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne05ma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:28 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8WPlj2110255;
	Thu, 26 Nov 2026 08:32:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AQ8WP4H2110234
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:25 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id 228A2A78; Thu, 26 Nov 2026 14:02:23 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 26 Nov 2026 14:02:20 +0530
Subject: [PATCH v3 5/7] arm64: dts: qcom: lemans-draco-evk: Add AUO
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
Message-Id: <20261126-draco-evk-display-v3-5-6864d09e916f@oss.qualcomm.com>
References: <20261126-draco-evk-display-v3-0-6864d09e916f@oss.qualcomm.com>
In-Reply-To: <20261126-draco-evk-display-v3-0-6864d09e916f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681943; l=5573;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ISx22r0roNFQhD9J4wVvmku+R/sqAqyvxSeX7uVuozo=;
 b=uar4jzIcoTzzKahBqP59LTd18jRgePShdWz2EQjXsoDRvTrymNJLyKCupPGjXJ0y5QEBKfpZn
 4KCT2Ql97oGAxZLXj6Xq/uq0zDrcsjXT/Rp49Vkl5oNmygRe5aedLVQ
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b07ee9d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yFK77E__IYD6oYScarQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX+UYhYo2DwlT4
 cD8liVc08EU1s/F8dYdISazRfA0wR0B8d6XJ6ZtbsXUdZyAySpyLOooq1qOyIsrrC1VocIlYFfz
 4/+/ca5dveAiMXWl/h+1cx9pEegnWxU3DfUjnLfjGSZdWHbW3yoMm/0vdItIlclp1EsGjVQCTzr
 puUw4Bd2H6DaheBpEEepBU7MiFQJd0TmfJApWCPS0fpDr1yuo94DrrhgWw7jRBkoPVOqvxE8QeZ
 dvucxXrpTqz73NzkoMx26MaS7OrvnfpaedFu0tZbkgdaaguteWNuYoiylhmOh+EZmOpVaH8uPxU
 isCvj4BaLSryBtZDhw1f/TCahS2EIX5L6WM5lwjM/fQuvx9RUUNkY/ZrT1M2cAH1gyBjQC2n6Jm
 Be+HKr0/H73MVM4IasqDqfonS1hBgrUQQSAEf/3K2vrK6dkRwc1gwon9tBtH3lTKfjqOM25CiEN
 NkWfoLzfMZ6VC6rObMw==
X-Proofpoint-GUID: EHZvkmJO_gbfHuX6-eZU1egbpHVassib
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX4c8pNTH/+Ctf
 q/fZATES3lik3qMpP91WrxPkzVjth6hVM3htf3Yr/WXFXOARlOnofWxjIwXk6qO7L/qX6LbObdE
 8+lJIObtODNK4dScMoPfFciX1JUpBU8=
X-Proofpoint-ORIG-GUID: EHZvkmJO_gbfHuX6-eZU1egbpHVassib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

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
index e478e16dede9..afeed92563c0 100644
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

