Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC833D75A4;
	Tue, 26 May 2026 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787615; cv=fail; b=VjwvU8vUPrXnK67ICdjuWKdiqZ9oMveSt19ZbdV9k1o2Us2BbE7JxqIANW0AaXFpJ1KEfa7DQ6J/zsiBhQi+yXxaBpPoKeZ6I0Ppruz7uvqF65zkpBJb6e8iwbo1ccnKqJ8CW2iapjx4jYtzCmZnu2VzQ4Th0MblDAjzVXn3QPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787615; c=relaxed/simple;
	bh=HTWCjm1CUN5rHgpmsW3efHpSPI6CTsh+7Pl7bf1pohE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HhZKbbnOK1JSXZOloWEmtMQBbcUAnmJorFqG4lGvD3dzwUGi6azyVr3sX9VqjHyYhPrcwQGynW5Psy/Jc6jrnMJzX1TeLH+XuN14yVdRKEeix1WOry+Qe7wp+evR9U05B31vMdO8/8MuGCp7AZY2IhLNNyS7OvqLg6ZJZMHK0ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=A2cTLzyw; arc=fail smtp.client-ip=52.101.65.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="A2cTLzyw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeCM7nT7ZL7gEUCV7ELgkgH4DclyFngJmdDPTUNBptFpwXecTczYahNDdvGaiooadgWqUGZPakoHpQLDjmf2zWpnRNZuUIIrGtfekgFbkDLdEj+hp7py7qfa8n3dEmAM9nDR2dmZ+dDev7BWMmSFP+t91i4i8KvfVwns3Rbm+TS+FwgbI8EAVFQnWno6iRTlTMGKmdRzMnSsd+x1egkWdpJi8jiN1/8W5gxZ7SP+h92k3ViMhmmZg0rnW9+kx60ZdAQze00m/O3JYPYphNmU9AuJVjVL5PJE2jMN7xDAVN7YfjWMBvY+k6cLlJQymP9v6yb2Hzg3RCfYqNNXikjBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgoxLmC9h0jyjW+y5XafpKIl7ZRs6jXrfEOlk4IZ3go=;
 b=N+4NQu3DqJGBGaKlNPdiTNGqgAJ7dpBNi1GVrRR8kTj87CwGYUn32RV4tp3lDebuwSC9SJYoQEp+Zizf6PgGPJDAOJrgBpbN5V4gXwGWtiFZ+/K79QRFYb9ErXYR77UoZ6TpDsEiVUzxPEVmaB8DEhsUEMNupVoyXIhI5AG3Ibe/+q7t3BO448KS2i0cQdOtL6Yn8P6RvEJLUTCTmZIONVm+TthVP0VtHS87NHHEjQKuEVm9jWe+wXQeZ7pkwHIYkIBoF+IGvzbluvF47mm6cbIJ+HVMxiQPicoGiNqnhJnnVJ6tE4VH5XZU76ejhUUH8YyjCCnQF7nXE813jVp3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgoxLmC9h0jyjW+y5XafpKIl7ZRs6jXrfEOlk4IZ3go=;
 b=A2cTLzywts2XJjnY8eQ6fFCByvAzc5iPflKsvGnBQbqGa0K+meb3W54fWrzUWlmCF4wg3lMDJ5TEgoTuLa6W2KTBTSiA7ZPdAlJHAyEkzGPe+Qkm8GV9+3Kg0K+CZpSHKMGcZ/g85uHKGEBBVym7Our/BvXFW5bHPQTPlHlbAy4OngwuCmT6ejbQWJlK5jBo1PAMjLtggKFkAHnCKxgu8rDlijbXmJQiQ5scnxLl0wswRrfQ0MLJUAx5qJzJcq3ouzhpa9QJXX35iPEncLyd2Pnau/eLjVdVBmFg/znRmZS6hNQxcgfGPjxUsbxNmDjQbudqs+8kk4ghQhx/4lzJ7Q==
Received: from AS9PR05CA0318.eurprd05.prod.outlook.com (2603:10a6:20b:491::25)
 by PA3PR10MB9310.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:26:49 +0000
Received: from AMS1EPF0000008E.eurprd05.prod.outlook.com
 (2603:10a6:20b:491:cafe::1b) by AS9PR05CA0318.outlook.office365.com
 (2603:10a6:20b:491::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 09:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008E.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:26:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:30:28 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:26:46 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 26 May 2026 11:26:44 +0200
Subject: [PATCH v7 4/7] ARM: dts: stm32: Sort uart nodes by alphabetical
 order in stm32mp13xx-dhcor-som.dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260526-upstream_uboot_properties-v7-4-e17cd424d5db@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008E:EE_|PA3PR10MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b5a182-44e3-4637-f75b-08debb08e9d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1pRay7Org31RlwVSMKOXXfZepZ29P4zss2GnOF2Ta/y4ncQy2kpRiO/0/HbAQC7/ay0/q3iq2e/odMj2IAn4FJba457j8CDJKyMwAHf3F+6wUu+Ey2Aw0B5uOl0B53PpRoULtUb4EFHLc0RvsvY2tWrwz1qjUa+Xz1qeC6rD+Imz8jFE27v5DcQiYntMw2NAPSaXq7ikOESvoFsJuKs8/hGUTZ04N2zmx2tBjSyBDzojWkB+thiWUCWY8rA/uL6ZNWJmSyrEAEIuYpEe1ZysXzhpAvpgmiX9iuJ7bX/CaIyl9p5HRXbIMQxaDMt87ITRCpvpVcPJEm3Ld9v9KgMPhqj9scSY4CIxLO5+kz2CiwaCrv6gwdKmaawYUQ5RXPXS4ei/4DR3UXOj+qBz9aNLftRRzSiA0/hc7QTH/ao1ES6CaXlORB8jh+9HWMUwxYg8pvgNIQOtMnDwJwcxGKA84pnoGpn7FLRHrrxeGbu0zfGdyQ4g9oqUiFTdHtQcThFRzN3+rPBAtP/vhG0+WH8EBkf6Vzndn32dhSyw46uP+pGC5V8wZbmrUL5RaMyN5JWRjSCbcPche9ihRSM8rIwTDpv9bJtkPohlERUW7s1Wbbsx9OjF+InCEq+dfRz3HY9tFhrmDL6HiKQDnV10zPwEaCKTonlUoC/xlHSKlnT60QeJWamBbzQgCYPHSkoeE09bq2YMQAQLISyKwLxJOlFyqWYCGaqfzeVgePx0BehRBtM=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6u2RUP3AeivT+ZjunM3gXHIG9bpCDmWsrOW9hKm5czGTIqlTviZUJH1uP9W9WsmbsiW8X3pcViwQE2hly5YkIFnORd9fKarbBVK6ARe+kaQ0OUZsi1YeqpEKaKUc8bdEEoe1nC48TsqMq1x+2OHYbvpSJFntj5VRb1ZEL9kTDb56bJjLwgj8YUpF5VfXvIcDS869jfWrgjzNH2JpRiitsdX2bXwxmtyAywjCtaN+gMVjyz58wzS7FX/yT4BHf3+sgeh8cyWtgOeawoGWymsGiB/SL6YA/b/Z8vY8Y/YuMnujSLEvRow+W6TvQnJa1l48CE5mXWkOT1eNvN95/7nzr9C+vVakgkcThaAcKQNzz1bmC4Oz0rtoeuF8fBhbHpgexJrOiDdfA2eo54/4bQHFYQERfIJX57zNbNs7CTWLdEFUdqBH4POJvRJz9+TCDpxA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:26:48.9421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b5a182-44e3-4637-f75b-08debb08e9d2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9310

Sort uart4 and uart7 nodes by alphabetical order.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 56 ++++++++++++-------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index c18156807027..54ece71085c1 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -241,34 +241,6 @@ flash0: flash@0 {
 	};
 };
 
-/* Console UART */
-&uart4 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart4_pins_b>;
-	pinctrl-1 = <&uart4_sleep_pins_b>;
-	pinctrl-2 = <&uart4_idle_pins_b>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-/* Bluetooth */
-&uart7 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart7_pins_a>;
-	pinctrl-1 = <&uart7_sleep_pins_a>;
-	pinctrl-2 = <&uart7_idle_pins_a>;
-	uart-has-rtscts;
-	status = "okay";
-
-	bluetooth {
-		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
-		max-speed = <3000000>;
-		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
-		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
-	};
-};
-
 /* SDIO WiFi */
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -312,3 +284,31 @@ &sdmmc2 {
 	vqmmc-supply = <&vdd>;
 	status = "okay";
 };
+
+/* Console UART */
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_b>;
+	pinctrl-1 = <&uart4_sleep_pins_b>;
+	pinctrl-2 = <&uart4_idle_pins_b>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+/* Bluetooth */
+&uart7 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart7_pins_a>;
+	pinctrl-1 = <&uart7_sleep_pins_a>;
+	pinctrl-2 = <&uart7_idle_pins_a>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
+		max-speed = <3000000>;
+		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
+	};
+};

-- 
2.43.0

