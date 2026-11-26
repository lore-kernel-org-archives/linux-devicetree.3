Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681963;
	b=voVrcnvkDccgFfZ8v+o9/e7D0/GdEF2GbcG8aHeI9KL+d5zI/zmaLs9StzuvuyMw3JgU
	 XrG2rFENVWKhzhf7UtU8X/e0dnqMLGud6/9vFavj9Mxdt+HsEWIv5Yt7eZY+cQpOGHwXJ
	 RsyNmoZQ9g9pRn7qV+1SsltTudTQzaUgayrdBOUiDfEIbZuljlldpacVtcBe7Xzl+8GB7
	 OOBkldJkJR84k62HTtq/RXeN1dZl30UznqMIIO1tgej2lKjSZVRkgvInqsaAbkxzopDhw
	 UEEO57Z+c05wpcqYbCaxn7/XcsAYPBzESlSVc00JfweciMFKJfK7F8IUiI0Nu3fXxpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gT1L25J6GLalX/fFkvbStga+dcZTwKzwJIB43V6oOxU=;
	b=vXdTjcMVhpG8GuYNIj6f7/y0d889idEu3NuFen7+2voLDo2C7b8NfJP7JzHCP4pPBnmx
	 gCQGZmBWR8V7gsocuIIR+qFdMh2g4+WjVQoAiFV4L4gtDFJTpriE/cy0v/ZqIvmV3xWFN
	 YsOLhuunfTS3LsxdK4UWSqlgJZO6YUDD7u/gxHk1bJicoEYzsTEe5RTYHWzVuviimbbHo
	 1/xSra/BwOvV50yw86l7LlEeR9RuDGWo1yFsDJW2KvPXoTZIjGfzcvs35lBwqeKsMwIqO
	 /qAad3N6rtxWo3NVQ1gFraAd+haGuak72ECARJPmMK15PlvPVB672hJJVeBhGLbpZzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G40vzwGg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BCC606A323;
	Thu, 26 Nov 2026 08:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7BCC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G40vzwGg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B7CD919515;
	Thu, 26 Nov 2026 08:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gT1L25J6GLalX/fFkvbStga+dcZTwKzwJIB43V6oOxU=; b=G40vzwGgVf2iC+83
	TZ3N8NrpCdKbTHqpdj5l96hz5jjAY3z5pnpSY2/etTdupzQY7pZvotH+Y+EhalZ+
	0/EW7d6FD1J5nEG/3xhNetraST1Y7wCGJ58758lb5LX/S7dTkf4THavzePFhrdxV
	RrZXA8KoT1/TEyNbhhX+LdrgVkPlK8IsW8gJ/TiCrCCXaT2Du1tVXPHxKV0HIqe7
	4JOJPJ82poS1yZDOSRC2PuTalZLDgM/fCmcJnac3rl8aDPqD3UAIBOxYPAAYEmNT
	/LxytMsSvmJYnqUkuPn2q7rDVoinQ9o3dI+UjVvyetZqEOuPpthWmTvS7Gmvabpf
	nch9Ig==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y265n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:28 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8WOFU3850903;
	Thu, 26 Nov 2026 08:32:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AQ8WP483850918
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:25 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id 2781FA7A; Thu, 26 Nov 2026 14:02:23 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 26 Nov 2026 14:02:22 +0530
Subject: [PATCH v3 7/7] arm64: dts: qcom: lemans-draco-evk: Add Waveshare
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
Message-Id: <20261126-draco-evk-display-v3-7-6864d09e916f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681943; l=3981;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=Q9aDfO8BcQHw8fDnM/kbAoNjMI0uoGbsvDb7HgcH0+w=;
 b=QRTkD+BXp6qjhvJy+VOgZT+sbWwvngqwvM97+eFuNLL7ubWBuOWOwHoVp8XvmdpD+BFbnS1ch
 ikryyfKn4kqDAoXM//2ohgettN9EdfQXgiuU2hj/13AgIoFVdo8aaxA
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX6A7SPbjMkcGl
 xOoXTJf5GY52R6PM/DzTJL+gQtZQ7GVpDcZtpNGzyATt+IQiT8lQZkmVljYmqrhbzOmaJ3VPq/5
 QU7spyFDFL5tsDg5Q1JzHYAm+NCScDI3CYF+5INOetYLZBtcK2beCygbIHEFvJnsxvoGo4zWOTg
 Q+kHPXdNqU54ShoEyUhkKAVhDO2PyiTiFQrVcFOxUdOxe2Nu29l3Z9cLSiZjjfCRgF8Imo34xEh
 QZUgQtIPAHe4F7xJfWi7OnI8/aLutDwtJ9byw4SS4kfWv97LdO3Wsku3mfD01umJA3OM+fnOxyZ
 B7wds7gF5Pe9XSIy4FlzGdoyxX/qmfC5qpC9aZhKyLy2sfOEYKhyiRSZn93OTx4/8ozVL3ocQqb
 Selp2j6D1I+uiffwIgQBgkZ1FEwg/wc3i/jdnZuyRfERdHNiDyXWpczqQ4ZZhiT1rQ7faPAOuvU
 b+TaoxcN2+CfxhCds3w==
X-Proofpoint-GUID: vJ6u2nYHaisC2xU8Y9JbhGsa-OrE5nyX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX8xHfrjexjHWP
 akDOjdS0OtaXDpiJmeSJx1niX7G3hLmS1LIoF6/cQ62+HxsETIBmxLqIkrRQFhPFfhIOmlXlW4o
 roB9LBXUTwJuKqmCBNhMWbBvoHUpCSc=
X-Proofpoint-ORIG-GUID: vJ6u2nYHaisC2xU8Y9JbhGsa-OrE5nyX
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07ee9d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=LHCJLpAu2B1udcNI4aUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

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

