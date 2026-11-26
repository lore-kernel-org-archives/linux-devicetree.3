Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679460;
	b=WTxlTQhnOJF8xo+nqUMaMD7gCFCKO8P4JR6BMNSs7fkt+OpJDiPTTqOAYh2ol+mEgQzT
	 2y5xye0xa0IGMVmNYM6F6/Tc5LaXfjSxs+tozItrMAnD8+NU3qd7O4wyknxQFaBtfnNc4
	 QS9ZEegJVwWuwjnZTzznaiFJBE3tMN7opEhEYiii7vEV8EWyJzS52gqhpMYD7iBsOkQbC
	 XRVG60InB+haXIfk+6XF5xtDq40FSVc7Oe+Twm4IOfpJlyOXJtZw2x/I/Qq/RrNPggsdv
	 q1qI/DIgj4qXcl7BMaFfwC4Umsg/Ry4GNxF5bYMXtN1C/8sJbsjwgL7mwN81WB+NWNw==
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
	bh=/oFI4yeCEY61SAqilQ0jw7phfFVYCNEyusIUkRFXnCk=;
	b=OyP4dgYalfBiQNcqWcv+CE1Vou7XPHE7MkWXEAUeHolJLmiuKoM2YKJ7IJYUAPso/RJJ
	 utB2FolmgbTSmpXMh4uPcQ1fRE3xgld/ThdNXrsOjmVR+Cu3HeBNKHkGFdzgq/4/EpVev
	 kP8N7g3NHFQ/vTKLAnWNlW822uWmcX33mUPZtE1NF+bNv7uS2eiaCMvxNBGG0yk7YGdxu
	 +wkzCnaZtBekYNkKEqvswVgikGrNHlAD6Hf3fnglu7/INjFrYwOPRqR4r+n0rm2Tw2nau
	 /BM1R+o1TtbWIgc0tqMWBd51KrIZw9AwS4UxLe+OP3nBHCWPoKRUu8KejmT3/kD3zoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=doy8oVKn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C0F606A334;
	Thu, 26 Nov 2026 07:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C0F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=doy8oVKn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4Wo1682521;
	Thu, 26 Nov 2026 07:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/oFI4yeCEY61SAqilQ0jw7phfFVYCNEyusIUkRFXnCk=; b=doy8oVKnHJJa5xLQ
	EDK7gmfVsyhEt8sFOiAd/429yuuzoqzlFjlSdhLvdYA5SR1wR9sgw5d1jz2QDSBy
	aRRX1J+kz2ln2WqoZO+XwcMCgFPWyjQEL6ufV5opuAqQKfpegLPHE1a2ALnK9BwD
	IDO7cM1lYukfo0vwDdAGfDrf3k1rxyvkriw1+nBuc7A7QqJxBzxfV7q27MiUKad0
	tFHzTXNtm0799kYiF7LxiyV4gnzu0PQ2oA7e0298DKd4x9RDWfpOpQnReH32cgSF
	yEYF9BEXk7ySa/8NRQPyaoip6xEzB7No3P83E3YLKx8B8ivvrAYyF+hQQqdIHVKr
	PGxFeA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aek1x7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:46 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7oiWd2051651;
	Thu, 26 Nov 2026 07:50:44 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AQ7oijF2051639
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:44 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id DAD80A79; Thu, 26 Nov 2026 13:20:41 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 26 Nov 2026 13:20:39 +0530
Subject: [PATCH v2 6/7] arm64: dts: qcom: lemans-draco-evk: Add RPi 7-inch
 DSI panel overlay
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
Message-Id: <20261126-draco-evk-display-v2-6-95395c5ee387@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795679441; l=4074;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=u41TnHiALIwNCzwpLR6U0gxmy+WGoqxxiY1FcJuFa4A=;
 b=EbGfbSevurizdnvGZTJRCSRpJbi/VGLJc3lpPI9ZpsbvE0FiNmWTaR57JXi+lkPNGIE/4EGQT
 tE8m+5vVdIoBZOsHKCwIXLzqU2U9E019Ql4cn8JdAMTqpF+iauKwl6u
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfXxLB/BIHHk5D1
 j/NS80HjuHVJU7l3yCornqcedVmW1yI1SN9D7Fr5vHRL5u1SbKbkYAnYlWsLStynolhhwVlW7P+
 MxdPQJdSx35atwNzRAidbbencU8m0b6AiF8wgnM6cMuCG3YEuCp9epSnp7YRRnrXGanJ0Bnus9F
 i5I3xUsCq7mdFQgoWQtUJ2DXVUCl8BAGTi+I68M9QTHh6moiMKBAvAnDXpm5I8VZeEix3BGHBaD
 6YePfK00ogEnhLx8s15A+70FN45C+MLCu4m8QEXc2oAy7pUJAqvfh8eCh/010QLtWjnlv7WF9zD
 YNoCpJN5x8jkRMMvbWEJR9FgKujRLVrNhowcPmEeqzZ31MFZm7cI5Ik2vx9yOf17eJFSkxEpQVz
 4T3grHpmMdaLMEbTJVBfQV+mlPdjFXmA27hyO44WrcrVg0w6kToZ/VvYIVyBKCTNozhZGWPcyxI
 J0u36fSUDnqpUdGJDBQ==
X-Proofpoint-GUID: rJs8Sqp6ae3spBqpIwujuWtw0YkrYB4b
X-Proofpoint-ORIG-GUID: rJs8Sqp6ae3spBqpIwujuWtw0YkrYB4b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX/Q9Wjv7EMknU
 Z7TSofRML820Id6bvLeI/jvsR8sA2iq15WKNN7Gi/IjOl8gcnNdvV7jWLqzjxzfUM474K6uplvo
 YzBfRQKz9uDOh/8ej2sQETQ3Kdc2hEU=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07e4d7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=j3tafkAdywyu2wedFDsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260030

From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
to JDSIP1 22pin connector on the carrier card.

DSI0 from SoC is routed through MUX which can be selected by DIP
switch for enabling this 22pin connector. Add the regulator and
backlight controller at I2C1 mux channel 0 address 0x45, panel power
and reset control, and a 2-lane DSI connection. DIP Switch SW2.4 need
to be OFF for this to work.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 +
 .../lemans-draco-evk-raspberrypi-dsi-7inch.dtso    | 98 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b1c52bf66e9f..3faa50f9e63d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -71,6 +71,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtbo
 lemans-draco-evk-lvds-auo,g133han01-dtbs := lemans-draco-evk.dtb lemans-draco-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtbo
+
+lemans-draco-evk-raspberrypi-dsi-7inch-dtbs := lemans-draco-evk.dtb lemans-draco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..ec172be7ce5f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,98 @@
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
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_dsi_panel>;
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-dsi-panel";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+
+&i2c1 {
+	i2c-mux@70 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mcu: gpio@45 {
+				compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+				reg = <0x45>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				#pwm-cells = <3>;
+			};
+
+			touchscreen@5d {
+				compatible = "goodix,gt911";
+				reg = <0x5d>;
+				AVDD28-supply = <&reg_dsi_touch>;
+				touchscreen-size-x = <720>;
+				touchscreen-size-y = <1280>;
+			};
+		};
+	};
+};
+
+&mdss0_dsi0 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_dsi_panel>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss0_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss0_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1>;
+};

-- 
2.34.1

