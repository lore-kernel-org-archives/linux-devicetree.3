Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681962;
	b=tUqIEjifca79o/aQsvmUncGzL9A7IumPQb1qhBkGCrrvDmrYbLr8lq3zLXTFnXLehovS
	 L+VKn8iIskyiIXt6D+Q6eD/8qpJVTHr/3TlhXCO/u8/JJ7ZAQQy2pTsJwzcISK+3j3DQI
	 VCkfmZITSOISSt39277soLeQ/id9up03Mujq5JhXOB5/tcT8aDsxm8pms81/3xCD3oAo5
	 rfbXD7/MvaxyivKtCkl44PhePA4gW4Iohja++Irr/Eegd4anj2ZSghcLU62JKsll6GG0S
	 t7ieqqiEFUqvI8aTWgVFlYgxDtxdpQv5YhvN7Q7LBUM+ysfRY4mfZFOo562DQA8HbRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/oFI4yeCEY61SAqilQ0jw7phfFVYCNEyusIUkRFXnCk=;
	b=c/9Tysr3PZ+yyJWb73TD7wyv3tkpvrEfP26hi5VZRey1V1d5YHHAv6mrsrM8EU51E/q3
	 y4UQh7PmwHnvPIHdmcvqcFXZH7XNlCQ0FQ+qh2WM6Oiu5PaPxLUQ0+8Z/dOYPSl1X/uTC
	 zfdjNKIY/aa46OftSXvYC4RXL8Ba+r8NYnYAxKDhyYihRC7xVXgCbwg59ftxCZVdxBKdh
	 V6TJpUF8xmIho3XR0kKwiY470DLqzVFWQviJ1YDJCSnmrQRKilStRyusjtA4AzFeNCs7O
	 uZ4TFQv0+55sYBe1KDhoQl+rqwiYn1v5AY/y2r/plcn1nwiZe8P7ouDldgCjieha2Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jc7fEmSC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A79A606A31C;
	Thu, 26 Nov 2026 08:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A79A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jc7fEmSC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B54E3548359;
	Thu, 26 Nov 2026 08:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/oFI4yeCEY61SAqilQ0jw7phfFVYCNEyusIUkRFXnCk=; b=jc7fEmSCIvBkw5bj
	nVW69U9xsxXxAwSegQd/1xRwuHKsH3Z0bM/mE0B3/egU2AsvDyKOwiy+Lcg8wOqc
	QOqOKT/sZxenVUz2hHHVHpYUwJEaq/wgwYt0EsbQGXZOpeREL3i5OI23l6Brx/S5
	yCjy0iUhV6PcLcWevMETyO3YajlhqDryyhALqnaFWZgzmrjfYopSDJ5l18p3s0fn
	P13+eyOkaKUgN+rpiXW/6bpBFzzPdF/VebG6BIWZgeK6Bi7bSFQFtGQE9pilhBua
	RZ8sP/ixWBrwDybKFvzpEEwZc2pHY288WdDX6sN1nvg52WZC0rKRr2NCn/2/vIax
	WEbCOg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vau1hw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8WOfi2110217;
	Thu, 26 Nov 2026 08:32:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AQ8WPPk2110236
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:25 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id 24E0AA79; Thu, 26 Nov 2026 14:02:23 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 26 Nov 2026 14:02:21 +0530
Subject: [PATCH v3 6/7] arm64: dts: qcom: lemans-draco-evk: Add RPi 7-inch
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
Message-Id: <20261126-draco-evk-display-v3-6-6864d09e916f@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681943; l=4074;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=u41TnHiALIwNCzwpLR6U0gxmy+WGoqxxiY1FcJuFa4A=;
 b=HKCwi/pDQClHUPd4ALK2X/q1jTkw0NVqAAQnSHS+jZnpueRX7SGviDrc1Yp+3+ZCqQSitiKsd
 937gskKuUOSBEDExHpZhZzc0caV5lHBP7OiN8Jo5e2Jt1SkWY82HGrT
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfXyqDhsOI6NGlW
 y4XSfp4RyVFWkgq5FJ/qKjYQOQpPFW3glrRwyEWtUjx/jANF+mSYKOlUeoKflzTfRue9cUiWy1m
 Y/QUC/mylA0Vl2uy5ALvd8wTajhqXsQ=
X-Proofpoint-ORIG-GUID: bb-UZlQf9gmv8l3TftXPVglLIEoZDHSy
X-Proofpoint-GUID: bb-UZlQf9gmv8l3TftXPVglLIEoZDHSy
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07ee9c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=j3tafkAdywyu2wedFDsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX77qEEvNh2TN3
 Rl5idxEO4brqE80/76Nge1rDYdfukgI8vH9vFcRC/AxSmyI8H3Bjak1SDgItj/HT9OM0+cNDOax
 poe5JHHLgEFhD2l9pmIxBP6H1ev9JxLdWwfOtkv5akzWEA/bNYz/QtiJA0xhCfq7Lo2kxGLhYC2
 2chT6dtJu3r3/8DhzvA8UNwcWewNXoOPfEuJC8QXOm4fIBhOASTrNZUyLjLNzQe7m2jGoB8a9Hh
 sY2AmEhrgflswNwdNSNwhJs30w22aLdzwWujcOp4R5DAKBiIeUB8qzAs6ah6cQYs/botgVmTvYU
 OWyZC2RV0xvu705FM8t54qyIA8SAhK6rYziwBz1EV13Uw1R7U9gomqt1Lf86ie/jOyw9LCgth+U
 ieGCtOCUtBHEAo2PTEmp+p46YpIBnDZOIwrrSLlQhQEwAHhZqI1pYlUPCbFIt+yeSNBEkJ8Z//4
 tocZE9vGVFd+OU8FonA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

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

