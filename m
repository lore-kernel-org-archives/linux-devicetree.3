Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679459;
	b=R7xAE4PfBHwM8anBzCFwlKuD6r0Llxkb9jySX0mCRkBKy+gzGCW5cEZxSgvcER5lIcn8
	 3X7EcktvevjP+1FMkFupj8r9qv1kXycScjtoZYpLKyfscRhjJv0UxQapSsVF5Y5NJlGsg
	 ZstLzaktCZ98HTiHTgaFCK6RLFHssOVECoeVHhvPAA+Q8+Zbax1hu0JclvCRrPB5/5CQn
	 qhhaebO9h8SzNoBXLrifJbWfkILyMZ5T9443o/w5hVeor4zakT5xcGkAhdnlJd0gHL7uC
	 Cr+ZLECJHaR2K1C60ByAkl/x4dIOvoyZ8kXYSUGz1R55hAB7IUBCfcLQQ3+qliEUTTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=21sNOnte7JmNEOHXoGYreSUrLlrgu4B56E43wGOxWTs=;
	b=L8zsjAhtnw0HwL6+Ebdp0vHPwlZhOwnDLCnuqoZZZS/A4K/aY18UQtf7z4R48Yf8NbjI
	 b7+IhpiwhuEWEZG57IVMP9iv5DlgpK1ke1QF+p/8/I8+kGA2PjaF5X0Y8Lxj27bZvpNZh
	 EoZz2kHSdfO4RlqrMMWg7r3Gx4wY7L5jl5kwXSotKevD1S/oqIOoz/qmxCgNVgXdkFZG+
	 U1H0q+pm6NWH613kwBw2scb5NSXPuRypf9thIn422xcG1B8zT4JM4vgti0Edgcz29xeJh
	 LAADT7ypT8LRpGF1HF0wQ3R1igqqfcLbXnlcsC09Blhfr3THD/d/1W9eMYOVLjKMBwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p0YNjWTq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97791606A336;
	Thu, 26 Nov 2026 07:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97791606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p0YNjWTq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AslV2885476;
	Thu, 26 Nov 2026 07:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21sNOnte7JmNEOHXoGYreSUrLlrgu4B56E43wGOxWTs=; b=p0YNjWTqXsTFxYiO
	UFmExISz3ylU7eQS3cJtxsuQJfoE6sD9r+JiYPTZpWZ2UQ3ZghBn3/nXGNGUrbG0
	7UwLuVrbp4y85ZokhMf9ChqaP6zMtlGDG+C5GlujrI4rui7Ci9Fci42V1Id3VjNM
	g6YhWffenkWUNkCPVT9fbJxlwbrxZcNFHET89GGmLIxShXAEbHKT3uLoc264v9uv
	QbgvyjW6QLLOSr5SFP5Ji2hVNMv0CTlr8HxujaP2lWL/lHABP0C5PG/sRK3dpElK
	haRZvYV1fFUPF7w+eepZxV5FQKiCPd3EHQxcTZUb3Z24RGqHPTvXcWX+w8v3PoTD
	mlznlQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgbjj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:45 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7ohcv3793277;
	Thu, 26 Nov 2026 07:50:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AQ7ogla3793261
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:43 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id D38D7A75; Thu, 26 Nov 2026 13:20:41 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 26 Nov 2026 13:20:36 +0530
Subject: [PATCH v2 3/7] arm64: dts: qcom: lemans-draco-evk: Add DLC DLC0697
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
Message-Id: <20261126-draco-evk-display-v2-3-95395c5ee387@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795679441; l=4037;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ADUdFlusfI80g1kdh5RJ+KoQoK2b83CPZOo5Mue9x1A=;
 b=b6ddp8ycGhX7hBl00fkzPQflXfNZ9nUkikQzGUb1pBaVQ/djobMMtor87eMsgahjQD6+aoy3C
 Tn1ynoItIy+BKY3USq3mEiMhHnvSUDRFntn/xXxf10Y4v4NBOTWBTbw
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX/EPuKAOQANhB
 evxt8j0s/JITJBTN1Hd6yxv03Nq+kDps95VgAnVI+ih1NQwTnN3cx7rgVk3SS0trBC/vDJZCuU2
 3QtGq02K2iJTRRK7N3yFoWztAslfLzN+hVVchQkQ1eqNM15Pqoj/RtlJp09tPM0gfVZaqyk19W6
 b2FmZiZMS3+mpZyuLhizHjNZwXa462Eppf2W8/eVUG2cVn/iBr5ZttZtfFy3DWyDSnxWkw2l9yA
 a+xck14LouqB1k6nkOiZ1EjAX3wCb7k02TRw/POwCcTXtTljPzwAGVs2tyHn2iNP+wk56beRbCB
 DziArlxx8AfR2Fe5rYpaCeRowJXpETJtxKhDCkjSNkNnnC0dOnMyd9ykGCEYQrB2uDvhPt/rCdT
 sB0zvsZUyfqDMLyaFO5TFcmuitoh/RUGcRPWkpHNknyec3Ro9MzjGm7o8oQ6+Tkpui07CK03n4f
 3h80o3FdB3q/gwyvbKw==
X-Proofpoint-GUID: wsS9gndQ80DPcWXoIZe_1y-DG_1Il_Py
X-Proofpoint-ORIG-GUID: wsS9gndQ80DPcWXoIZe_1y-DG_1Il_Py
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX+mSaD+bhilyx
 E9jtj++JVcAbOx03f+UO0GOUqKdn2Sz8UFa79Ah6ot2xUh0jfBqnvKZevipCssuGoRsqLDUicPc
 r4EtPIc64gyeDDmssFV7ljBWN2sM2Ig=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07e4d6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qnp0FUfv8zdtcKmE-_UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260030

From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

Add a DT overlay to enable the DLC DLC0697 DSI panel when the DLC
daughter card is connected to DSI0_B2B on the carrier card.

The panel is driven over DSI0, with a 4-lane data path. Configure the
panel with:
  - Reset on PMIC GPIO4 of pmm8654au_1 (active-low), with dedicated
    default and sleep pinctrl states
  - Tearing effect signal on TLMM GPIO84 (mdp_vsync function)
  - AVDD/AVEE panel supplies from vreg_bridge_3p3 (3.3V fixed
    regulator provided by the LT9611UXD bridge circuitry)
  - VDDI supply from vreg_s4a
  - GPIO backlight on expander2 GPIO2 (default-on)

The card plugs into the display B2B connector shared with the LT9611UXD
HDMI bridge, so the bridge and HDMI connector are disabled when this
overlay is applied. DSI0 must be routed to the B2B connector with
DIPSW2.4 set to ON.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso     | 81 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 036fbd9f3f23..a95e14b26804 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -63,6 +63,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-el2.dtb
 lemans-draco-evk-hdmi-dual-dsi-dtbs := lemans-draco-evk.dtb lemans-draco-evk-hdmi-dual-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtbo
+
+lemans-draco-evk-dlc0697-dsi-dtbs := lemans-draco-evk.dtb lemans-draco-evk-dlc0697-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso
new file mode 100644
index 000000000000..00845b6207a4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+&{/} {
+	dlc_backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		default-on;
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
+&mdss0_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		avdd-supply = <&vreg_bridge_3p3>;
+		avee-supply = <&vreg_bridge_3p3>;
+		backlight = <&dlc_backlight>;
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+		reset-gpios = <&pmm8654au_1_gpios 4 GPIO_ACTIVE_LOW>;
+		vddi-supply = <&vreg_s4a>;
+
+		port {
+			dlc_panel_in: endpoint {
+				remote-endpoint = <&mdss0_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss0_dsi0_out {
+	remote-endpoint = <&dlc_panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&pmm8654au_1_gpios {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		bias-pull-down;
+	};
+};
+
+&tlmm {
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio84";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1

