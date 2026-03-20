Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D037B006;
	Fri, 20 Mar 2026 21:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041876; cv=fail; b=Dlu5L6CjAIcEjgxRGURzoW57sMXP9+jAhKXGJgN3H6c0o//BivaMYpU7MfYy6L7i1yArhdJcJDqI14JREU2B7lAxWSMvfTWQMLkCJ3xqZyueA/Fx1LLvXgsNsEKEkBy+Uau0qB/wsay0n+w7m2v3J6NlbErSk5PEaPKfzQhk6ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041876; c=relaxed/simple;
	bh=ha0JSIfIJuQdfOZZFz4fWpn3+TPHQeMXH1qG1p/1NN4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DhgFJz473eMJxQGjqjFfpNoNDs+btdH04dXT9NDV2sM1BNPelQR05pVR+Npd6Nkt0ZkflzJOvd27cZIO96HSFRZHTC30CpGMLQV4khNeWBMWIPHlQO2IRLynd0CyDRVXjHYGrcF3aKoNLivKtKKZ2FJKWjLp1USP1MggRmfhOaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Ac8EPgHQ; arc=fail smtp.client-ip=40.107.130.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Ac8EPgHQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5HBbvgd8dKKLabRJEvoMdeJptT/PIup1mugiJ7Qoy4D24BlZudufCkpcu/4taAO/YdP7qKplL/qJBvc+rYejtTumdwtbs5wKwAqH4/ej98TIDKPOG0mCbhC6QW1QubsCUiXwt32qbaoeDVEMKOkVUdq5gWcHAVdUEvk+J4GiZNRaSu29mE7dLwKETci9dAmNdHvi0y5ci0IaBJ3o+64WM6N2SbRxeNEm/xD4fljWiEK93Zoi2JelP/5rb+T+L8l+f6e9EzK2k3PiZTF4TyqfTvXuKkrTBipsdiWLBiA+SCCP3fqRo1gRJdHNH7Pe+/7/a9KDLMY+U0gnQXYIgixRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd0ezTWZbgsJJkOY2aoyS1jTDq4ZlVMpL+sneRi2glU=;
 b=j/8oliaYKuxBLJA6tBk1kNJCeD8Q6A7tUHVV3D14qd9b5Y0arHfObajfEFFS84y2mgjKGn5IkHEOm5+jsBqptzALKppf9A0YI6tf9qBdjXMreSxYSvJfgKD3Bq+cd7accTny+TdrrgMa977ttKYsJ3e+m+8aSIJhO2HUNSfdLmMRJGgoSD10sLKOfz/9ZhoCfcXAXmxwsO+JaUkuAxI0P9r1p3dxngDwiq+XKpx6TmqtPNiDwRSgFgxaEDShQUN/VacYLTp4fDeMJ/q1RzgnXV0uB1a0eUC4ST5feqs2tG236k7JDkou+5QG3s51GhCfIf4q4derp/YOUs5ri3ZZWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd0ezTWZbgsJJkOY2aoyS1jTDq4ZlVMpL+sneRi2glU=;
 b=Ac8EPgHQKHTIdlUKhHHyJ0UPONcWXxA5OOOH02XFGItDic+pxNbcruqps/VIUVZpePS1ipZVxWnN4l9Gl0NIXDFUCRV5kVCdRvL6/hNuGb6A0xgtqqQaaoyoGGu4UpOGMXwBl5LhHr3YcYbXG89huaLjsCoF2zG2QEeAtYLuqpiHef366oqtG66oK4DJWVT6uayrNRX9V2F146c+92jfJUkaVlxQb2nP24EcWF0gEh7Hx7iLyuPV4NiNRkYVt9orGu+cet+FdWEt/9kgtKTwI6Szi9laHb5R7Baudj2ESNXvhNEdzNqxVaxPa/pEJWgP5R/mlEuiTCnGwqUAZXeJQw==
Received: from AM0P190CA0004.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::14)
 by BESP195MB2778.EURP195.PROD.OUTLOOK.COM (2603:10a6:b10:ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 21:24:24 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::4e) by AM0P190CA0004.outlook.office365.com
 (2603:10a6:208:190::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 21:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 21:24:23 +0000
Received: from lws-haller-privat.attlocal.net (172.25.39.212) by
 Postix.phytec.de (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 20 Mar
 2026 22:24:20 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v4 5/5] arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
Date: Fri, 20 Mar 2026 14:23:46 -0700
Message-ID: <20260320212349.420951-6-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320212349.420951-1-d.haller@phytec.de>
References: <20260320212349.420951-1-d.haller@phytec.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|BESP195MB2778:EE_
X-MS-Office365-Filtering-Correlation-Id: 780e38a4-6247-4382-d917-08de86c70edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4Da4YFoeT5fw0qv7cgQVzrMAFiE3bo+dYLNnuGkSH6DJQYPRVxLku65YHK78H8ciieGW9jv5DGdULd307zakxQiCmWote16PY+i9ZVZ66BLW+vySaWs29qXtOV7y14lggQ+CNQMfQETaxOtAkR6dujb7NyEyqrsXQ6qVIy6mX/Tnq074atmztoskO044GBW/1nvLkisBK1WXPhlUOF5/BedP8e/d0O/q9kVCvheXwc/oyMx2qdL7hefXZlFAdkAqWa/VbqZ+Z9NJaxkbZDJSghVHzewSYgDwH3xLTVvzmYNtFzoO0cBD8bFRN1cIWfAKjX3ajAnLqrZUspIwFpPQldGRXbR88iXBVJxFGrmPDOvvK6XKTjLUtbVqLxiZaS64yYtDoIafpqPn6bZxytfDjtRu00uU71WYblBVuh2Z1u+hjOvfuZf5Tw22x2bkYRUPrMihIEKrpBMs9zcQfO4q76w7WpyYyNoHZxtQe//3WT0TwzFqjrQxSNPkpkA5U5czfOOCABQtQV7Vv9ctvIVYJwIXEvOVUvT790xbMr/ZKuxMks4nS2m3lvFoY2mU8ajNDgY8r//clqT2/dulbgoYm414SAEJn6KDSRtuQHEoXkZCsRz/M4wGGMGhw9c08H0ki72N+f85Z6uWy4IQKOE+slXZo3HYM8NXEHZ7mAUcaqYNQ3O1x3cOdu6SrSlYvEr9G5BF03Zvgjc/jGw0p2r5uhvld5z1d7zlUVM8J7X6BavDi7GgzDa5omMYvny578sMACbcLJegZ37D5LbnhpwXPg==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aCcUwW/h5x7CzlhW58ReezrdnlFbcJxxVnuIn7HQ1VeUbFKJKl8ZhQVK5Z+hcKGOTI1nTUwStxS//TbhkPUfrAImrYNB6khhgIfFMUQEb4cXeYiNRmBKqfhimKc7mrqNRnhNdnRQ5bqvSPZMXN4yfhD92op5ylQXA3OT/gsRJbzAws0Tor+DHTU9yhkYOdnJI75nsarZ4DHrg8c5ezoXiNh2k5W7rqssmdT4Wm+WMTjiafI1OAxB+ZOVp7rxf+W6/A6qwZM/J7H631ilDE8v4SOlHTTQj6alnVg4Nk++se0MLOnlduyS2jD4yUAKedUlXMU0dkjK9ADvh9MA7hHJbw/+Jy2mGLp9feHL2/72GN9MGcAqgWq3wvXvqpQk2jJHukOLm+lcRjTW72/PPh/qT1BkDpQ8EjR0EDF00efQTKQ4WsXEIPGNe5uz3rp4tJzh
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 21:24:23.8718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780e38a4-6247-4382-d917-08de86c70edc
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP195MB2778

Add an overlay to use the PEB-AV-15 AV-Adapter. It's a small expansion board
using a Lontium LT8912B DSI->HDMI bridge and a TLV320AIC3007 audio codec.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-am68-phyboard-izar-peb-av-15.dtso   | 191 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a188e62e32b4..ae5994818ad2 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -135,6 +135,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-lvds-ph128800t006.dtb
 k3-am68-phyboard-izar-lvds-ph128800t006-dtbs := k3-am68-phyboard-izar.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-peb-av-15.dtb
+k3-am68-phyboard-izar-peb-av-15-dtbs := k3-am68-phyboard-izar.dtb \
+        k3-am68-phyboard-izar-peb-av-15.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
@@ -323,6 +326,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am67a-kontron-sa67-base-gpios.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
+	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
new file mode 100644
index 000000000000..92007bfd5d53
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ * Author: Dominik Haller <d.haller@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	audio_refclk1: audio-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <19200000>;
+	};
+
+	hdmi: hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		ddc-i2c-bus = <&main_i2c2>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&lt8912b_out>;
+			};
+		};
+	};
+
+	reg_audio_3v3: regulator-audio-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3_AUDIO";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_audio_1v8: regulator-audio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC1V8_AUDIO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "PEB-AV-15";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Microphone", "Mic Jack";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPLOUT",
+			"Headphone Jack", "HPROUT",
+			"MIC3R", "Mic Jack",
+			"Mic Jack", "Mic Bias";
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,bitclock-master = <&link0_codec>;
+		simple-audio-card,frame-master = <&link0_codec>;
+
+		link0_cpu: simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+		};
+
+		link0_codec: simple-audio-card,codec {
+			sound-dai = <&audio_codec>;
+			clocks = <&audio_refclk1>;
+		};
+	};
+
+};
+
+&dphy_tx1 {
+	status = "okay";
+};
+
+&dsi1 {
+	status = "okay";
+};
+
+&dsi1_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	port@0 {
+		reg = <0>;
+		dsi1_out: endpoint {
+			remote-endpoint = <&lt8912b_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi1_in: endpoint {
+			remote-endpoint = <&dpi3_out>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@3 {
+		reg = <3>;
+		dpi3_out: endpoint {
+			remote-endpoint = <&dsi1_in>;
+		};
+	};
+};
+
+&mcasp0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp0_pins>;
+
+	#sound-dai-cells = <0>;
+
+	op-mode = <0>;	/* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+
+	/* 4 serializers */
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+		2 0 0 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+	status = "okay";
+};
+
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	audio_codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3007";
+		reg = <0x18>;
+		#sound-dai-cells = <0>;
+		ai3x-micbias-vg = <2>;
+		AVDD-supply = <&reg_audio_3v3>;
+		IOVDD-supply = <&reg_audio_3v3>;
+		DRVDD-supply = <&reg_audio_3v3>;
+		DVDD-supply = <&reg_audio_1v8>;
+	};
+
+	bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt8912b_in: endpoint {
+					data-lanes = <0 1 2 3>;
+					remote-endpoint = <&dsi1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lt8912b_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	mcasp0_pins: mcasp0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x03c, PIN_INPUT, 1) /* (U27) WCLK, MCASP0_AFSX.MCASP0_AFSX */
+			J721S2_IOPAD(0x038, PIN_INPUT, 1) /* (AB28) BCLK, MCASP0_ACLKX.MCASP0_ACLKX */
+			J721S2_IOPAD(0x040, PIN_OUTPUT, 1) /* (AC28) DOUT, MCASP0_AXR0.MCASP0_AXR0 */
+			J721S2_IOPAD(0x07c, PIN_INPUT, 1) /* (T27) DIN, MCASP0_AXR3.MCASP0_AXR3 */
+		>;
+	};
+};
-- 
2.43.0

