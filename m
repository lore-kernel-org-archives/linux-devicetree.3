Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681964;
	b=SCVBmJAAciuJsiMUpFFOcdppkGPichoUNxvhGtshLwO9PX7GxSGB1p5hWu4RInag8KIM
	 n8MkOweyzeFLSfhY7EATsHp/zHCmekrp4GrKBI21OSFt47VffBi1/LgCYyZlm7Y7IjYdD
	 9tov9lWO9MwnY5ETV4DyqOYofHenYtVzVzHtdiFA+5GsdQGNxZ2Sf8xCPHuih8ZRE1eeD
	 pTWPbVcL0GJfLOZgXTqWkFw10BOFyFuUCg6laCnydsWRoop/iULNNPtlJvWxVf+ITzPCr
	 KrgoBYwBLxDXuBJb978eiQw7OdWGHMhG2T6m8PbBdMa945H4K9WjfixzOtdB3HZq/Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=21sNOnte7JmNEOHXoGYreSUrLlrgu4B56E43wGOxWTs=;
	b=ULQ4pIzz4nFnjAMSWg3Hzjv4K7hQpwc0yU+3LzjLn5LK5mIAKI6iQGWt56CeDz0jLe+G
	 LrnUF/ufllVQfypYudYQ/zWXUoAtT4Guld/Mcc5pKVoVun6x4eZ+Qp5vaGh2n3/UluFTi
	 Auvvt/5Yny78zYGE/DSlAOOo13WcB03SyKRBkO5HbVLOIaBPrDma8O0jWSWVTAH2IZeE5
	 LLc03k8mopHq0UAT0Pjqa8pukSS/ALv7bf55QyaGfxXLRVRqDtpXoBH9GYHgH9ky2ksYA
	 WSkc51o7CTfmu9pvG1+f9Wg+sLB0hir/EUkjsl4tSo6RQMzbXxRA2PhKJ7vcLQig+iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ZUclzgG/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BB5606A691;
	Thu, 26 Nov 2026 08:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4BB5606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUclzgG/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7ArL12885453;
	Thu, 26 Nov 2026 08:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21sNOnte7JmNEOHXoGYreSUrLlrgu4B56E43wGOxWTs=; b=ZUclzgG/VMuXMpr4
	UAfRQNsxlp0+VyMf+q83YXjt5fvzje04ojw3wVdCoVT6TSAcFBkno1epfnW4oq3A
	BXyzuvhkqx7voUWVothtVjPIoqr1sCIaXIc0IZD3U42Ji98QoCXPqfo7m1sYMarg
	pWFay2KCW66kpiB2Ol4vNjYy4jFZn9l1Jr+smbbfMLpDN42ViCDo8CU35xnxQf6a
	XzJyX2g4iHKHKtaAgWXXdt6qt09tsE6gHFhow40yBao5/q47f2dEDNasm/YhxVw3
	XJRK/1bQEp2LZxrT6VEn49KK1qH11ssMHmamEWDAMzspjHqFSkj50WxsOQbvz7QW
	Q/WoBg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rggx3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8WOfh2110217;
	Thu, 26 Nov 2026 08:32:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AQ8WOpK2110201
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id 1DA91A75; Thu, 26 Nov 2026 14:02:23 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 26 Nov 2026 14:02:18 +0530
Subject: [PATCH v3 3/7] arm64: dts: qcom: lemans-draco-evk: Add DLC DLC0697
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
Message-Id: <20261126-draco-evk-display-v3-3-6864d09e916f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681943; l=4037;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ADUdFlusfI80g1kdh5RJ+KoQoK2b83CPZOo5Mue9x1A=;
 b=/e0Z7FDy00UPf+VPCnT8xrhz6WN4+QFrFSNyKJRXCCEmZYPcbZIs3NatgYZbJC/y+gnurVVY0
 kx7IqeMSRl3BrLDbzKPij++wou4rxPfEt208qe8z2m/yLQaji0wcKeC
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfXznxZ+czcAH9U
 f77/CRcheVzm2cFb0/4w5neJXOFP0KqkJHsP7F29VvckW1Jm/0Eeqp9fdw9CLjnCwS5pTJP+a8Z
 Ko/neEPbPmi8IGGcjSu+D+40FK9apE1/ve/S6j/GquTHhDwUX+gkY8Fart76UGqBLj8mAyN1bpN
 zLDywvzWKWK4n+sqvDWUkdpt/mxIw8TLUIClMhbK4Jz58+4bLtWCgW+3lfqr3OFaz1cVWcf0pfU
 5GMaO7bbXw93evRLacmjGPA0hNqB4ADqsLQr6Pjqol/igBwA/r1AZQtjDI7IyQHcI8XBj1byNEf
 GemHznjr5AvGM9iuXjOzGbpPKXFT4oTde0q3bVFapUiJafVYG258Z/vizcPQC1+gmjfjsZDEZzO
 1juZJbk90gMgsDZYxKNQ4t+iLg7QeqtCrnCq7ojzeS+kKzxopV25DYhE0WZm2VteiFIXT77rBlB
 9D4nR8Z2UXLqiMcIvbA==
X-Proofpoint-GUID: vUl2eHpUBOUDvo8VB8seSI7ns0VLDzA1
X-Proofpoint-ORIG-GUID: vUl2eHpUBOUDvo8VB8seSI7ns0VLDzA1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfXyOkeuNYb6EAF
 yAkxmjJsgBd68STu8XxMDNuqpHPBA7ASR7zZHK41K/EK0HQ6t3JHiHbv9DZgn8uT9KoBLeS4OjK
 So9f6aaRTRkxb9rwASbyUVbqKB0FvfA=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07ee9b cx=c_pps
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
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

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

