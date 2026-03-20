Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020136.outbound.protection.outlook.com [52.101.84.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F213B19DA;
	Fri, 20 Mar 2026 21:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041873; cv=fail; b=TColmMa6nNzFLxEyUr42qtwL1W/BvEy5Z0qaX60egqJXOT9flwWSa6NXRyNS3i6RN7L16ekUvynRsFIPyg6mMPOgL4Q8x6WHHXeXNkSAaAkme6AwauEzw0aQphGiLAVcO/GNTQjTDdMFvyM1wjSSSfYs31Bdn2sPLyfbEP1Il0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041873; c=relaxed/simple;
	bh=OUV1Kdqb2mKugzxWzkQnxqGW7Ed1T8m8cvIw99PHiWw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzxN5cmK+2ihYbP5umxh9BghU4tc22CZJzFGj1VAGzsqjc7QCQ4BlD5nqENprQ5h0J8MFLrQhrH8dYvjXmIrAv54Rdr3GOJfHG6gqezl8h/32CEo2vywPo7RQfCOQXlvOZdlJXv/7hcFFZqUr7hMe5InoC31HITfpYtiQ9TcBns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=n6f5DuCd; arc=fail smtp.client-ip=52.101.84.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="n6f5DuCd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FL3l+cKpGFTuI23CSj3Q71E1F7a1XdD4eOAdcLw3Dytc3Q/D3Dp2l2ORlcDm6kqJsN6Ld+Ck2GBogFPKhoR20ii9BgvcoWexQZRycC46H0Y6i7eHfu5qQrBfLXOlYjkoVRVb+B8zDsicFXTQaXclKnrCnBn6l8nAXZ4wY05MFqgLtxdCooMIFA6pYBQJO4yb+3ookwmKPQNMYgd7XxWG0AzcfLFMbhWI4LejhHyELY9CvlNQKroRIr92rsAqGID1dO9eXrTYqgwth9obemdwczmlJlgGvkRJ9UDhdeBK//l6Roley+q0GoD2qDn2ltp87Gl3GwBnG5jVHe5K4ZANuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RV2HoIl2Dbd56PnXrVWjJjNm+o9XrWmQJLfzQh3mH4=;
 b=K4BDpaRKuekF/Eukl9Nz/u7aG4RfC424eLQT5e2qCRBfHlsi6I5tvWkRpfj5yHCJcDenl0w+bSQioOM7kb90AwAix+cEd1+YZRTpseie8FdBHl8VGOSjA30bFaqGsH/HrjsUA1EFv6Czu4rqvMrKLVovpkGMmukS9gzOPm9IEa96K3sq50wnlWHFAMFlSSHjSS8isOlUhVuVlj/eNOqE0R5eDBhcAX9mD6PuaUIt/bENUvrB/VaaBFi8UEoCJppwxZlEko4wY+roDT28ti4l7EYOunP1rwLMl4sK4XGj5/oP3F+R9mePrvtVtnZmQGQbifi+VpMb4oZJdbXaRoBlxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RV2HoIl2Dbd56PnXrVWjJjNm+o9XrWmQJLfzQh3mH4=;
 b=n6f5DuCdtHSjArs+aM5Zs3JvEeul0psB2zhahOl/A6Ps8xLeHam1vcs40EHZDb5+W81+XtQkpLi4VCMm5ripzffN5WP+KqOxbLlTLedEbVPNS9wx+gCgHVnEqtEFBz+GT06rvbgxTw5kt4pClDWjTNge0dC+ZqZn/KYZZBteIam6rd6d8CwsgFtz3Ka4ABiEZsm3tvXkUzgyNoeIKB6lMLvuCZ1o1gSqs8KrtYyqsiv/X9LBpt2+vGq7AJu0ilEc+oOQ6P9TiQM239CoYJrlirELzU0n356MfmO1u0btDX4BdIblKq1hSaQL/L63NAHOQPbdYdF+6Vx8ajO+TOUSkw==
Received: from AM5PR1001CA0007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::20)
 by GV2PPF66DDA38E3.EURP195.PROD.OUTLOOK.COM (2603:10a6:158:401::8d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Fri, 20 Mar
 2026 21:24:18 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:206:2:cafe::7d) by AM5PR1001CA0007.outlook.office365.com
 (2603:10a6:206:2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 21:24:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 21:24:18 +0000
Received: from lws-haller-privat.attlocal.net (172.25.39.212) by
 Postix.phytec.de (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 20 Mar
 2026 22:24:14 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v4 3/5] arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
Date: Fri, 20 Mar 2026 14:23:44 -0700
Message-ID: <20260320212349.420951-4-d.haller@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|GV2PPF66DDA38E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f11c19d-a9e2-4a14-a8a1-08de86c70ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	my1x4JquHtUOJdbFha4eeOWur5fb+OSzYMMetU0bLOj4S3NEgxTXzxtAmQ0+SErii6AP59ZpwUb06XtxAnJ9B//jkBT6V0SFsH5lVx2ss8y1trYzQqhd1gRBlmVvDae19z1K22gxM8Lo2WPAaaXwi8j+x+GnHr6jMQx1Ozr0KjnLKiiQfS8N5YfE8pzdqRDSyk8FQ99VUrFdkRAtAX6PVGoJIfne2eaZYuKenzHsqDlu1xtekWcfPH8eloEaz15jlClcBOAnignq8BcC4Q0qW0jpQoCQPPXQoJUBgdy8IQWDb+gBN6NvNtmXANO9+3fLMe7ng9871fT9nWkX539c5vGmkwMgqQk7X1SahVcIMOWSk9VrcBRZ3AVmqRSm2Wsw6ylxsvW+Gf2xZaA7NY9dYyhSgSg8LSzglGaFnZTaSz4b0SzVk7u6SxxXBZ+wfneUz+Af/G0cO5lZONCrEIubcy+FOoz3W+UJCouw6MFc/BzBUwHDRzbMxiGk5g9mTKD2eijlLvSZ3h6RgAoh+CWShWOLrqoyjdT1JN2r82JKLtqt+IpZXCUMkCG56d9FTnSXstxBqlROeEbYOl4eogpFZzah3AHlV6tlhhLXk07QBJQm3d0n5z0BJD4fDB360SuyZxkwEt4zjXk3wjRVnqrBELYrO5mLxDVsq8QzCX/HFrr0AEIxwq8bYLUXGEJ3pFYmkJE4xtQDfr3mnwvM1CSTlikqWKecPV0zioogdLz5s5xRmOYvxO1CwCiX1a4htKZWbT5M54Qr21sWiyUbTB1XvQ==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m6kgt9MARjIVzUVC7wLmN2pJgzTPiN0N8nQIABBegJIFy2O2uLYIfJwNTpkMLxPIgKcDK1H3jhG/qnUZP4vyT4A9pKMIui9/rk6nEOUs9GopW85DLKHvUZcPBGlBRu6YsooFIlvd8xW4EnTThoeToY5auPpEB3TArKLwyM/xVsmXMSXcCgQQSdqDPC+x6JoHwoeJ37RNSpFiAeJ2eRAEkUSH06za80UTBj8xuUF2wGC0KNnGH4CxJrO9675igNZydrR5J24ZOc0Pu6Ax4W6uB3r3FBJbYaGXPB+ZS6XRyeL+cjKj/VyI5+iMNQ2Cy/YSUAnho29YrMJLP5EFxeT9Zx+CfE88nYV/x1JPOhjpSVSvdbL0qVq8dIWRvisPFZC3LUuwtz3YTxb4XVnrlR9VXzr7exDw6o+d5p2y1VrTKNpMBHW1C8H26SzhQe6VV6hf
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 21:24:18.4788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f11c19d-a9e2-4a14-a8a1-08de86c70ba5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PPF66DDA38E3

Add an overlay to use a powertip,ph128800t006-zhc01 10.1" LVDS display.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 ...-am68-phyboard-izar-lvds-ph128800t006.dtso | 125 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ba01a929e06f..a188e62e32b4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -132,6 +132,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
 
 # Boards with J721s2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-lvds-ph128800t006.dtb
+k3-am68-phyboard-izar-lvds-ph128800t006-dtbs := k3-am68-phyboard-izar.dtb \
+	k3-am68-phyboard-izar-lvds-ph128800t006.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
@@ -319,6 +322,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am67a-kontron-sa67-base-gpios.dtb \
+	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
new file mode 100644
index 000000000000..9eb28aa9e8ef
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
@@ -0,0 +1,125 @@
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
+#include <dt-bindings/pwm/pwm.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight_lvds: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 32 64 96 128 160 192 224 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&exp2 12 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins_default>;
+		power-supply = <&bl_12v>;
+		pwms = <&main_ehrpwm0 1 44000 0>;
+	};
+
+	bl_12v: regulator-backlight {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&exp2 13 GPIO_ACTIVE_HIGH>;
+		regulator-name = "BL_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	panel-lvds {
+		compatible = "powertip,ph128800t006-zhc01";
+		backlight = <&backlight_lvds>;
+		power-supply = <&vcc_5v0>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&panel_bridge_out>;
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	backlight_pins_default: backlight-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x064, PIN_OUTPUT, 9) /* (W28) MCAN0_TX.EHRPWM0_B */
+		>;
+	};
+};
+
+&dphy_tx0 {
+	status = "okay";
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
+	port@2 {
+		reg = <2>;
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
+};
+
+&dsi0 {
+	status = "okay";
+};
+
+&dsi0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+		dsi0_out: endpoint {
+			remote-endpoint = <&panel_bridge_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&main_ehrpwm0 {
+	status = "okay";
+};
+
+&sn65dsi83 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			panel_bridge_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+			panel_bridge_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
2.43.0

