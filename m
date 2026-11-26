Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679471;
	b=Cpmbmi+v9ZQlh5Z7JXTEVcj0evInHdVXIo7kVw9rrzPOKAwq+h8voDeq6+3H/IDu1/hm
	 uiFyClFmBpwkMzJvAtvVqnOYyOtc0vj8FVc+pBPZ2uthANWqK9qEkaSzHTvfL3beXsCvA
	 xXwDHPTxAmYZoGsacS+Us15kA64RpyDdutyZGBE8aI5lhDpCo+394L5drZfJ9cyhq6xIC
	 6m2FuXJp7iZn48esEvHLMSJRH7mChmf3reHO2F6P1wdq51/NolJUYgQ97rSVMh8B23eRw
	 k1PE6ySH+rO9D1GFQ0mhTBqtTeNBTuqQL3GtQtLj+73Nh6IfAXHhz1s2JuMwwfQSVKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gT1L25J6GLalX/fFkvbStga+dcZTwKzwJIB43V6oOxU=;
	b=1wnT74D7XafCz625QtoMm0TR3Z0859KU/+cdFNlj1mY56KHNAJZ+Zs64XVRggv3/Nm7p
	 ripn3mmJNCn3Le4CETLucOZ8tlQzCU5nCiuXhof9/bF6VSnCgW1Ph3JIoaQe2jpnRDIOK
	 m+SQnWTpcXtyIaJ39uemGCz5DFXQRHeFEEGs+Ko2/0IiHBUmTuBEN5NfeJqAANx6l5rCU
	 YIgBElrtYZKQdkKku0T4+u2pFKkkkk1h/t2HNIB4uMzFW0oZuGmDUMn0UE8QnWaQ31iHC
	 UitEykiHJ2QaQCf3GhfQISd7ey3ZRNsrBocW9xLko+8X52gMqauXuA1MlG4Yb8QpiPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5cRp0pY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B9606A32E;
	Thu, 26 Nov 2026 07:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C7B9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5cRp0pY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BAHq3548510;
	Thu, 26 Nov 2026 07:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gT1L25J6GLalX/fFkvbStga+dcZTwKzwJIB43V6oOxU=; b=D5cRp0pY8RzaJvt5
	OALnfh4SBVbQX005nPjdX00S6FjiwM1ctSu+p0Ilk1jefmCv/1zSFkBzNh/k0VjV
	Vas9vHfnBoeoh7kvIr3gZndQYslkFC4j1Mb4PLJRLGveZe/Bw1njRGGdG3rp1Vub
	z04klPGsFwOWTkS+2KktpHC+ujdlAZ+RA5kNUiWljD3TLOAKX66sksaO/g74Zn7P
	FVtzWvqlfAWFcx15M2N5InMUHJzoPnmsxj3fNwO9KlCE55BNRDoEZ1A4zljiLGhQ
	COPikn8xiHMbuRg4ootx27wcNpALdrHY7rbtN9DGaUWPlNMx97l3xMtziK0LV8sQ
	Ex41OA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatvh5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:59 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7oimO3793355;
	Thu, 26 Nov 2026 07:50:44 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AQ7oiob3793297
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:44 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id DD386A7A; Thu, 26 Nov 2026 13:20:41 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 26 Nov 2026 13:20:40 +0530
Subject: [PATCH v2 7/7] arm64: dts: qcom: lemans-draco-evk: Add Waveshare
 8-inch DSI panel overlay
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
Message-Id: <20261126-draco-evk-display-v2-7-95395c5ee387@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795679441; l=3981;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=Q9aDfO8BcQHw8fDnM/kbAoNjMI0uoGbsvDb7HgcH0+w=;
 b=TT5N+oRM5UVrvR5dVxdqznP9zh44svdpHRy0rvAu1ZIpHLkkaL9RnYmHa/sbYhqsIP7y0nmKW
 DmfNtN7q3TwB/IAp/9Ge6TMsNC0M3avtfgqeDFMfvkhfJm0JSI3fXKv
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX2sC8nLd6xy2P
 TgzbGAO0qRy24J1TR43KUB91DiaFRjZT3eTEbRxvEG1TK5n4fesViFFFhHeY8H4aPFvqeWHC5bj
 WAl9aeLoNkUtjMBwG+oUHoOoW+9CfVU=
X-Proofpoint-ORIG-GUID: 4s7slsoss5OQfwOXXyp64A4gTnAZFxjV
X-Proofpoint-GUID: 4s7slsoss5OQfwOXXyp64A4gTnAZFxjV
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07e4e3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LHCJLpAu2B1udcNI4aUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX2+L1/dLO78sH
 zGrENTRl/X9wmS5an7sOcZflssxXe5oymHlzHeYEcKeZ6WSPHdP9XwryLQ17El4EuspEoQIAu3b
 S0uK0G5t4yWTLCbLY8VLr7Vm1UptZGi3OV1iq2jmg6GW0VRpbKDcCLbFzY46S4M83+LFjMmQtah
 PwYikEHwUzKBQgoB0Bvq63fKmf9Ky/fC4vBl9xnsb5KsX+Eep3YvkUv5RF6jcJWIeZj45mdzFLE
 o2h0J1wO+/S/hdiYBSKrAYulrJ9PzLq1Qy0NKaHQq2p9YXgus92rWoe3Ou2fdomPSImB8ewQYU2
 9a41cIjt8uuwvlLhuQk5ZGRxhaTF621/p8KIpYPNwjvTqgg3wQTA/ERrw6n2cMFBCJuNrbq7b7b
 TfqvdSFNfdxPy5munmSRg/upeb+wmW1OGQkOuOOYiqlAP70tLVq2kInw7M06JB3KmeNsTVvjZuT
 72skx1XqofNHYffRF2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260030

From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
JDISP1 22pin connector on the carrier card.

DSI0 from SoC is routed through MUX which can be selected by DIP
switch for enabling this 22pin connector. Add the JD9365DA-H3 panel,
GPIO expander at I2C1 mux channel 0 address 0x45 for panel power,
reset and backlight, and the Goodix GT9271 touch controller. DIP Switch
SW2.4 need to be OFF for this to work.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 +
 .../qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso | 94 ++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 3faa50f9e63d..d6ffca89363d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -75,6 +75,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtbo
 lemans-draco-evk-raspberrypi-dsi-7inch-dtbs := lemans-draco-evk.dtb lemans-draco-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-raspberrypi-dsi-7inch.dtbo
+
+lemans-draco-evk-waveshare-dsi-8inch-dtbs := lemans-draco-evk.dtb lemans-draco-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-waveshare-dsi-8inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..31cd1a46c32b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,94 @@
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
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-avdd";
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-iovcc";
+		enable-active-high;
+	};
+
+	panel_vcc: regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-vcc";
+		enable-active-high;
+		regulator-always-on;
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
+&i2c1 {
+	i2c-mux@70 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			wsgpio: gpio@45 {
+				compatible = "waveshare,dsi-touch-gpio";
+				reg = <0x45>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			touch: goodix@5d {
+				compatible = "goodix,gt9271";
+				reg = <0x5d>;
+				reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
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
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		backlight = <&wsgpio>;
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
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
+	data-lanes = <0 1 2 3>;
+};

-- 
2.34.1

