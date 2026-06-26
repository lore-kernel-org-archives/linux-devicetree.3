Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD23B6363
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472404; cv=none; b=ePH/PEssSvdnKMO+hrimijS46aXmnGQW6KwbG9x4pQLJil1k5hzKA2/p/70eDeaV6/i92EIYqExj1eQ5JjGdp7zoZt+7Dv4mEme6XoLlDFz/ecAwdA/9ap/byFG25zXLhh4Y+6XlVM2FCUzOATj/MSNRNllExN5dMFCSUr8bI2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472404; c=relaxed/simple;
	bh=YyBbfm4NN4P/Uc6BtaiBUOSxTE6FOz78eJ0/p3UDnTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P6anfjT+khhcUM3oogS9l4lfL21aDToi5tuNNUZc+N45w2aLYf2nE5pQc+5cgihCoHxBasMWEWhe0b51nZiWokXwrcCemjysspggpN71tkrCCdUV6d9b7JiBJoRfKr1IdL8jlMTIHCKfReZGHRQ94UiXGjAX7f8mVnE7NAzpx98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VyTALKUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCQPWyO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VyTALKUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCQPWyO3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcVZ11052461
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e15cbQN62EviYEBVGnhKo/ymV0Du0/SDUMc6+7co5g8=; b=VyTALKUwbRAVQQHt
	rhrkdijsBeqOrAykwUpAwh1AWPDOJh33dfF+H3l+irjRAkx/e+pXR1Dy/ySr3zde
	0DJuf/Im/tGoGCu4fE0Pwd7BUyEJ3OSayTXnzdLNKcBxKA+NSenGbZoyQAEf9X1z
	gWIqbPBAy515XpQuj0D/BM7o1tnswl/npuLhMKCKNGxs4Eu9lXMEOyyBXLzm9fgp
	7RG4j2BjIgMhHxCyAP6yhQPr0VzGYkqwTGVdjKu10TWaMFBhtYdzoTCtrokmA1Xd
	3WqUVTGBGHxiIeZdO60CkZFUYjc611Em9+RK9sygqh+f3UmwwuY8xtjBBXDCYxOc
	Ozpi1w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ngggmf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84533f2f5a7so207341b3a.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472397; x=1783077197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e15cbQN62EviYEBVGnhKo/ymV0Du0/SDUMc6+7co5g8=;
        b=KCQPWyO3zkzaUBk6l+bKqlmKCdGtEn3YQgP14b9w1OJkbwf8T8/SlYEo6qyq5tGs9Q
         cR9Ku+n5yCKUwKNStSJDtmD9tZt9QI+5YCdu5EckZ/bkPFpyNPSULNPclUuRd65VVFjN
         mJO1Ie/AzpE0VRonsEnvVbBsy3wcVSxvqY2mDyVfb6GRSBOocQPNogpWVAcdUmo8N6rW
         /cpCbAvi75wi4cC+xbY/9/QRCGL2s1PvrmastUcAQOhfDZd5RToUGaH4+pUz8DXiQsvc
         6iszN1ql4Yp0D/9aR9xRTgalCUtoE32+CfT0Z/kSFwy2qeCRgOCQW9Vr37jNXBkw05Fl
         fhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472397; x=1783077197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e15cbQN62EviYEBVGnhKo/ymV0Du0/SDUMc6+7co5g8=;
        b=aLVa2y2pZB/1Sa9+TB5x9zLx9Wa9nffccwLzIFy2203jDa1i33Em+Dc/3lB9NsxNxS
         s5RZ1ay/4ifodnBFpQpekxKHmq0wLK3JjCEl9mgv7dmLMc38mOYDn9C4je5CjecpFyyM
         6hsBrmThGfKhNVTdUAGSoZ7Tb3PcS2TzUPSz1/0LPBgxpixbCnqz5eKSaliTlQT7Yep5
         3Pl+V7DIGCoNzSVPlcI7veDd7TV0zDHSGij6Yk4YDhrw10wttGBIRUeVYoWgUz5Yp5v5
         Qt4hG6HtUag2IHsoR2/ET2/4RE6UJu7zUrJTQVH9x/P949RO9FankLfaKvZnDnrxRHqh
         bJlw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8MvarUPIln2B+dDfsdaCeq/sbAVAiZRYp9HredP6XespUEBgRoSxiuEutWNUGakshbjeBoQr3kKwo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2jCuckILXulKlOQlBdiaqiTghaAqKgGK0KBqiyQMP9V4F+qfV
	2qgkZARNML3aVAHpe5nZwfN8o5lVvWljbCnQWXjtYe8USViRqdT+70NRB2Bvg9ABcUH8dOAfpb1
	Pfe3XJNeslXYFmWOnh3CP40hWJ30+5tS+SLTUJWZGecP0hYj51m4h6szDzqwQeAkv
X-Gm-Gg: AfdE7cno6z5YVfTw1rUBJZBtrjdSyf1GvLBq+kSM5HLj+xH7Jy5ybtqa95UMh9SiLH5
	xzumxfoT6vlw9kr/2kc/olUulZLWpgmLCVFfTrB2CHXQk604qUn3QVaDhcnoTt/7VDaLnJntxhG
	qEzr7t3qKGY44L6zsLm+6q6Zr+B4GQrj1VjsILSe+SabpUjab95y/dPAI5Je+iIceMOrn/Bkjic
	Kiq2Nl1kP8ZL82GsSJK0LWsqMEjCFnppp6N8DyFzFKlYyZbUcuZ22QF+gKrQwXvPyQLbEFlg1co
	mdZCJCVsg0zrXThreu9H+4TzXJ0nXobO4z1zIdd6q6h8WrBY4OfkHFtB6XYdxnHUmWgMtRRTTCi
	wDs8fSG/Ehn2pJXK6xFNAMKbt1x4I3D4pGT8scsa5Mw==
X-Received: by 2002:a05:6a00:805:b0:845:c6c1:2e3a with SMTP id d2e1a72fcca58-845c6c13958mr1403970b3a.3.1782472396593;
        Fri, 26 Jun 2026 04:13:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:805:b0:845:c6c1:2e3a with SMTP id d2e1a72fcca58-845c6c13958mr1403944b3a.3.1782472395930;
        Fri, 26 Jun 2026 04:13:15 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c7c935f6sm1097384b3a.19.2026.06.26.04.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:13:15 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v5 2/3] arm64: dts: qcom: monaco: Add monaco-ac EVK board
Date: Fri, 26 Jun 2026 16:43:00 +0530
Message-Id: <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MSBTYWx0ZWRfX1AYiQ8cWD5Oc
 v7OJY3RQSqLh5IdThXIhEtpF1zPhh06JGGTFHvcHhZc81vzvQiRuomJApiEUqzLZ3vKYE+3AQYT
 YDYN8pjC+W5kyvMQDJQEuL6VXybBgnkIMhVVKL6JbPUz7wc0cByCz0MBSQLETnfcIoJQ80lJCGB
 aSloyJnYwDPmdE+ERNCvmZNBYnJ7lWzhi8AhINFaDFdOIybE2hwqDprmuvV0ZqLx8nZXJqZVTkP
 L5FP3djmGyjsMscCo3w/Oum1ROVSR3HHD60v2XvWiBHqo2BC4SLh5FgnHPnQi6RLuUoQ+DppDds
 X85L/hvoRYLN0WZfqQBstImHYBNRzeC3cXM75o5HJ/AmpxnMQ4nciftKt1UaQfn09mZWuv/b1R/
 3qGYvE13kmWHwa1cDj6vi0X3SCE9MWGLAkjzW9jrYXlzjyHWsv2tiuC72CTMD15IC2cNQcazgNH
 eVUp9q6vsqx7uIqaOcQ==
X-Authority-Analysis: v=2.4 cv=KNlqylFo c=1 sm=1 tr=0 ts=6a3e5ecd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8G3zAfW-SvmH6gs6IgIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MSBTYWx0ZWRfX+jQMPy7UoGIw
 FTSzXagErLnMqT0Z3Bi+zc8hBoUWN2slZwqi6B2b2DD4FpWFHKBcjl8RokE9yiSGJhbDY7rhAk9
 HJRSWkUC/f8xTSpXayrBMnHB8PInzRI=
X-Proofpoint-ORIG-GUID: LRhmlNfOB2o7SY0JkmFCU42vLUb-OA8Q
X-Proofpoint-GUID: LRhmlNfOB2o7SY0JkmFCU42vLUb-OA8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260091

Add initial device tree support for monaco-ac EVK board,
based on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.

monaco-ac EVK is single board supporting these peripherals :
  - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
    and eMMC.
  - Audio/Video, Camera & Display ports.
  - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD.
  - PCIe ports.
  - USB & UART ports.

Compared to "monaco-evk" variant, which utilizes higher tier QCS8300-AA
SKU (supporting 40 TOPS of NPU) and a 4-PMIC (2x PM8650AU + Maxim MAX20018
+ TI TPS6594) power delivery network (PDN) to support higher power
requirement. This board utilizes lower tier QCS8300-AC SKU
(Supporting 20 TOPS of NPU) and a simplified 2 PMIC(2x PM8650AU) PDN.

Add support for the following components :
  - GPI (Generic Peripheral Interface) and QUPv3-0/1
    controllers to facilitate DMA and peripheral communication.
  - TCA9534 I/O expander via I2C to provide 8 additional GPIO
    lines for extended I/O functionality.
  - USB1 controller routed to a TypeC connector in device mode to
    support USB peripheral operations.
  - Remoteproc subsystems for supported DSPs such as Audio DSP,
    Compute DSP and Generic DSP, along with their corresponding
    firmware.
  - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
    and other consumers.
  - QCA8081 2.5G Ethernet PHY on port-0 and expose the
    Ethernet MAC address via nvmem for network configuration.
    It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
  - Support for the Iris video decoder, including the required
    firmware, to enable video decoding capabilities.
  - PCIe0 and PCIe1 controller and phy-nodes.
  - Sound card and max98357a based I2S speaker amplifier.

Written with inputs from:
    Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com> - GPIO
    Expander.
    Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com> - GPI/QUP.
    Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
    Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
    Swati Agarwal <swati.agarwal@oss.qualcomm.com> - USB.
    Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com> - PCIe.
    Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com> - Audio.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |   1 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 938 +++++++++++++++++++++
 2 files changed, 939 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..90da4a3d4e33 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -59,6 +59,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb

 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
new file mode 100644
index 000000000000..6f3c3ffefe34
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -0,0 +1,938 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "monaco.dtsi"
+#include "monaco-pmics.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Monaco-ac EVK";
+	compatible = "qcom,monaco-evk", "qcom,qcs8300";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		i2c1 = &i2c1;
+		serial0 = &uart7;
+		serial2 = &uart6;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector-2 {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+
+		id-gpios = <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&expander6 7 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb2_vbus>;
+
+		pinctrl-0 = <&usb2_id>;
+		pinctrl-names = "default";
+
+		port {
+			usb2_con_hs_ep: endpoint {
+				remote-endpoint = <&usb_2_dwc3_hs>;
+			};
+		};
+	};
+
+	dmic: audio-codec-0 {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	max98357a: audio-codec-1 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
+	dp-connector-0 {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "mini";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp0_out>;
+			};
+		};
+	};
+
+	dp-connector-1 {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "mini";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp1_out>;
+			};
+		};
+	};
+
+	usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		gpio = <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
+	sound {
+		compatible = "qcom,qcs8275-sndcard";
+		model = "MONACO-EVK";
+
+		pinctrl-0 = <&hs0_mi2s_active>, <&mi2s1_active>;
+		pinctrl-names = "default";
+
+		hs0-mi2s-playback-dai-link {
+			link-name = "HS0 MI2S Playback";
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		sec-mi2s-capture-dai-link {
+			link-name = "Secondary MI2S Capture";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vreg_cam0_2p8: vreg-cam0-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam0_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam1_2p8: vreg-cam1-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam2_2p8: vreg-cam2-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam2_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	/* This comes from a PMIC handled within the SAIL domain */
+	vreg_s2s: vreg-s2s {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s2s";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s5c: smps5 {
+			regulator-name = "vreg_s5c";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <512000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&ethernet0 {
+	phy-mode = "2500base-x";
+	phy-handle = <&hsgmii_phy0>;
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	nvmem-cells = <&mac_addr0>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs8300/a623_zap.mbn";
+};
+
+&i2c0 {
+	status = "okay";
+
+	bridge@4f {
+		compatible = "lontium,lt8713sx";
+		reg = <0x4f>;
+		reset-gpios = <&expander5 6 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt8713sx_dp_in: endpoint {
+					remote-endpoint = <&mdss_dp0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt8713sx_dp0_out: endpoint {
+					remote-endpoint = <&dp0_connector_in>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt8713sx_dp1_out: endpoint {
+					remote-endpoint = <&dp1_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&qup_i2c1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	fan_controller: fan@18 {
+		compatible = "ti,amc6821";
+		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+
+	eeprom0: eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_addr0: mac-addr@0 {
+				reg = <0x0 0x6>;
+			};
+		};
+	};
+};
+
+&i2c15 {
+	pinctrl-0 = <&qup_i2c15_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	expander0: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 56 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander0_int>;
+		pinctrl-names = "default";
+	};
+
+	expander1: gpio@39 {
+		compatible = "ti,tca9538";
+		reg = <0x39>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 16 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander1_int>;
+		pinctrl-names = "default";
+	};
+
+	expander2: gpio@3a {
+		compatible = "ti,tca9538";
+		reg = <0x3a>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 95 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander2_int>;
+		pinctrl-names = "default";
+	};
+
+	expander3: gpio@3b {
+		compatible = "ti,tca9538";
+		reg = <0x3b>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander3_int>;
+		pinctrl-names = "default";
+	};
+
+	expander4: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 96 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander4_int>;
+		pinctrl-names = "default";
+	};
+
+	expander5: gpio@3d {
+		compatible = "ti,tca9538";
+		reg = <0x3d>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander5_int>;
+		pinctrl-names = "default";
+	};
+
+	expander6: gpio@3e {
+		compatible = "ti,tca9538";
+		reg = <0x3e>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 52 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander6_int>;
+		pinctrl-names = "default";
+	};
+};
+
+&iris {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&lt8713sx_dp_in>;
+};
+
+&mdss_dp0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+};
+
+&pcieport1 {
+	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+};
+
+&pmm8620au_0_gpios {
+	usb2_id: usb2-id-state {
+		pins = "gpio9";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&qup_i2c0_data_clk {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs8300/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs8300/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp {
+	firmware-name = "qcom/qcs8300/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	no-sd;
+	no-sdio;
+	non-removable;
+
+	status = "okay";
+};
+
+&serdes0 {
+	phy-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&spi10 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tlmm {
+	pcie0_default_state: pcie0-default-state {
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio5";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio6";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	expander5_int: expander5-int-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander1_int: expander1-int-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	qup_i2c1_default: qup-i2c1-state {
+		pins = "gpio19", "gpio20";
+		function = "qup0_se1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		wake-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio22";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio23";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	expander3_int: expander3-int-state {
+		pins = "gpio24";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander6_int:  expander6-int-state {
+		pins = "gpio52";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander0_int: expander0-int-state {
+		pins = "gpio56";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
+		pins = "gpio73";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
+		pins = "gpio74";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_i2c15_default: qup-i2c15-state {
+		pins = "gpio91", "gpio92";
+		function = "qup1_se7";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	expander2_int: expander2-int-state {
+		pins = "gpio95";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander4_int: expander4-int-state {
+		pins = "gpio96";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart6 {
+	status = "okay";
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l7a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&usb2_con_hs_ep>;
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
--
2.34.1

