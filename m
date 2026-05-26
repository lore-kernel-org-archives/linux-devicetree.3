Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC543C5535;
	Tue, 26 May 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787612; cv=fail; b=ivqrLuWPxP/fj1qBsrgUriDGjnwv4dK/78CsYseEz13AvltRKGaTXytvJ3peFQBMjIadnh9n0rc6yxVzt+u7nk1PE7Vv/ZujpGd77hD9tuDA5c0++xT0CBI4KMXJMUFRSdiccrQavtz/ALfLSekC5j4I1Ed2b3T7U06hAh+XVuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787612; c=relaxed/simple;
	bh=0tEhb9sAKsYtXeJ8TRfq6QzAJMJ8MEqWIl4aHeMo9Ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AjQ4D7vqy7tXQkj0xtCb+PTVSUWA4R3FF83oswuhln2xmkFefPJmqkLBDouXJb4b2vSVJYBXG5Jjh/KIXlHEG+pskaA3Pr9UWdt88looyKmjqop94q6mcHLPqlZrZGhkSQCrCslOEM7TlpLAADVDmIZMVxJxHVp0Qn8NPu4+Msk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=C0xyaVoq; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="C0xyaVoq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efNfmH6uy9Fb5s9zPeWrjaLqwseh+nZGWt6R7xtIOEQa7JYyaVOGS42aPQx3Ga2oT8giiHhy9EesbLrxNAnhvl5Lc5tPsqvKQSkx/e0Ft4Xgmya9Cb0RxmEmLAAoStXEBLbK4iBpAS9eLtZA1XZiiogbfdqv0cHOHXPChxyZjG80NVypxlyqqaXNbxVqX4g8YdjjCT4lLPY7wOEPM7rGoeU/OTTsWwnOWuqVhvhSuwYUrB8ruRMreD+DoqPd3NjDgTngGpnUJ6W5Vu+x38R4hvLTuvoyyu/Q5mPKfsZ3lfwj6ju8sPSwq4RaB5ThjZgreu7DhvAP3Q7YiaUxUvTO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhxjvqrwmjt0J2NunMRr0NMEhIpL8VncCZ4W562DVTM=;
 b=GfZ6YNsoQPnlItyWD92JcsGE6j69Od7WTbC0pqjxQAVACHk+kYZ34KOXPZAX9Kd+Y5CHfpjNsZN0Vq5KSradNwrtb6FJidH24lNMScpK2aYOfIwkT2wP6kwZLQEvdsYGyrsaYSk4DNgggwYbQyCoVchV3lPrmy/IjI8FMZkExIEFXUSFMIN8QpaWchHFGw8y65joPCItlsHtZLi3G48nQ69uOVvtRWfn6AKy1qPfvhu1aWS0+nm7e3UbERxODK0eSNtP+nrp9NZbymA9sTgIAsX/W/luI16iGKEkTCcHDIrdRInJA97gDx6NfHpcn1bOjAJ9BWtGktaCLZ8v/mj7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhxjvqrwmjt0J2NunMRr0NMEhIpL8VncCZ4W562DVTM=;
 b=C0xyaVoqc90YlGgwQlO5zzM14T+qI09wpXlxUOGnCm/Y5WMReNUEUsYSCJvNP7PJlcjjNkwUeOOOw0o3h2PLMntbtWn2NgGnuwSNQS7lqVkn2gb1OtZlXFPERDpQLm8c+U71xqo6+L88OQUBxvDAKAEGmXGl7SVPqNp7OmM2341D0oHLamUUXBTefzgllCzMEqgozPEWmqSYAA0CRhLMeA87Rlpqg1EfPzZ1aX+/ujtN/bC8yE6IlyyQqC9KAo7hNI40xBjOKgRzY/z9/3ZgHh9E12c//nozxA2n1Uujp/IqDweqQQpevFD3c83xJQYUDo7WWOsTZsxxACFDDrCqOQ==
Received: from CWLP123CA0058.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:59::22)
 by AM0PR10MB3186.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 09:26:46 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:401:59:cafe::b7) by CWLP123CA0058.outlook.office365.com
 (2603:10a6:401:59::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 09:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:26:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:30:26 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:26:44 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 26 May 2026 11:26:42 +0200
Subject: [PATCH v7 2/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f7 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260526-upstream_uboot_properties-v7-2-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
In-Reply-To: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000091:EE_|AM0PR10MB3186:EE_
X-MS-Office365-Filtering-Correlation-Id: a3506d06-e7bb-4420-09c0-08debb08e7e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|22082099003|56012099003|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	WNEudJdSHNHBTe599iWv/Elq24fTj7y4lq9DV5Td6L7zbdGOyBHECK/bqO0OgK/VwSGnPD3LNdracoLUGbl7iLtLWJ/GlJqVWsa8McJnGlKIlZPAGkJ6fm1WCrm3czeXXe/nSBAZvVWPKv9cBMQSIQVZyotLLmWzK6y5NZ8WSUBHwIHXMdfXVzPVzSC6jmr++yttucgENj5uFsZDewsolk/zrswIky0WR1ju2rUOO0nzcjlVBoMLFWUD27M6euJK3H3Eh70X3YaHGIjpGij+Giss5nlkXu3Wuj8QOHq8aZhlzGjnFC8DvirpxQtpqzsq2AXOJcPxDul6FG/FBm7J5O030d7sqYyvvDoEKLtZT9KM3P5x+wL29GEVzfdRMDTCG9MXvtPU0Ob1taRWzKLnycZL0ySiruoh0tla7vIg0EVQKRiGZNCO8YDac5x30KWvyqxv3o3Xu85uoJ98HbnetZvLBTrSSepUASY2YG4CjV1EH8sC62+DbRfVBTzO8rwL1Nx08HnE8FNDzSZJkjJPbmIcmnFloMyxQ2w0DDVxlaSW/OrKn6d4SjYDEdpg0PDpREO13MZI0VbXKbNusRoycFPWY/LvF9gvU2KpkqQEo2I1qhgQxU4OjOCzW2ns+6oCOL7V3GtXZJaywwPIa2IC63dUEjdx0qrculathkN00rOF5Vygd0AcXxPOVITZw461IuVtPrJl2M4ENxhlNt9EQRmJMq9vGp+xhKx06h+uzIQ=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(22082099003)(56012099003)(18002099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OaRbRasEgX/xxQbNW50G8m6HnUOL3moyfSrkitrdnr3SE6nZCTWPz6bwEVn81Fxz+xGevk8ZT115M6b4koUf1LmweHB1/57ODKpiVsEqgY74UG+UYT5zEWY2+stOAs6GTjrTyUJ0fTe+aXDWCRIzkC9xLn7lQ3s00nbAhBRhvm53U1o7AUljou06M6TNVBFxZtBcBNDs5fklbsYWjxlzqPY3lVNB9F0+ksYo+t+ihMYafhwmPTMQX3E/lUp94vOOw8DqFdt1kvYac0bZx5cmRurf9bB8TW7bzy/SD5RaR9Yx78DTKqvqjaburLsG2LvLf0QMtRScIRTfnLrSJueafq5FAt7JuMxufgkPIz2w/xEZ0GcwP5vxi6MixMXLmcGYyYb3ClgEvPhWRC73kBhOZmb2LP5s+Z/Ulj/T7qAcuOti3wjlmS1pDKaiIWnLer5X
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:26:45.7279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3506d06-e7bb-4420-09c0-08debb08e7e8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3186

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32746g-eval.dts  | 10 +++++
 arch/arm/boot/dts/st/stm32f746-disco.dts | 75 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi      |  2 +-
 arch/arm/boot/dts/st/stm32f769-disco.dts | 76 ++++++++++++++++++++++++++++++--
 4 files changed, 158 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32746g-eval.dts b/arch/arm/boot/dts/st/stm32746g-eval.dts
index 6772c1f9d03e..d66b670de6f2 100644
--- a/arch/arm/boot/dts/st/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/st/stm32746g-eval.dts
@@ -226,6 +226,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index 61ca41ea523e..5db37bbe6c2a 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -150,6 +150,51 @@ panel_in_rgb: endpoint {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
 };
 
 &i2c1 {
@@ -179,6 +224,7 @@ touchscreen@38 {
 &ltdc {
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -188,6 +234,22 @@ ltdc_out_rgb: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&soc {
+	bootph-all;
+};
+
 &sdio1 {
 	status = "okay";
 	vmmc-supply = <&vcc_3v3>;
@@ -203,6 +265,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -214,9 +277,21 @@ &timers5 {
 &usart1 {
 	pinctrl-0 = <&usart1_pins_b>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
+
+&usart1_pins_b {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..1fede5bdc347 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -75,7 +75,7 @@ clk_i2s_ckin: clk-i2s-ckin {
 		};
 	};
 
-	soc {
+	soc: soc {
 		timers2: timers@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index e5854fa1071b..7338e78847b6 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -128,10 +128,6 @@ vcc_3v3: vcc-3v3 {
 	};
 };
 
-&rcc {
-	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
-};
-
 &cec {
 	pinctrl-0 = <&cec_pins_a>;
 	pinctrl-names = "default";
@@ -140,11 +136,13 @@ &cec {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
 };
 
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	ports {
@@ -181,6 +179,50 @@ dsi_panel_in: endpoint {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins_b>;
 	pinctrl-names = "default";
@@ -190,6 +232,7 @@ &i2c1 {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -199,6 +242,19 @@ ltdc_out_dsi: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
@@ -219,6 +275,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -230,9 +287,20 @@ &timers5 {
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
+&usart1_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;

-- 
2.43.0

