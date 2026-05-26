Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E285E336ED2;
	Tue, 26 May 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787611; cv=fail; b=LcRDlKhhYn5+nIFgHFrhk9csZYPbx50UN8J+Dw06Q+ZoQiynMIMQa1HCdQNa7YIZmdi5/SneeF3p/sg6aQM/T+N1xUZQKMj9m9euIMQZCP/HPLhQmUoLku6M1QA/fUhv3Sreb7LJmb0WZj+RIDD8lAWGSt7P4JrhUbxP0THa99Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787611; c=relaxed/simple;
	bh=ZcHKbwZIB/ojGEY2R8ueIqKg9VvVSo4TbhnrRdw17E8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tWbZN424huuCT6R4klFN3VqkhMSoXAjTd8PJ7WXgFfTCrOtp2QW1+5NSGBaCoSTD1CSgQNBWWDwz02eYHKrQnoCABb5EXeUi87Giy53B3D3yP/m1Guj+DCYPjnaWOMntvoe/P7iMoFGNz2UoH5PC2EIENIlkHp66NqIB1MlFJms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TBp/IpYD; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TBp/IpYD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rku9kMyUuAACqoYIxxv3qX0xelEHKZi3gJkbuEh05OY1LVNaRxW83KAKJ/X8tqTNdMGMus4XFH/lKZQ0E+CPunwVBPMdFmK8cEdOyZWc+o/ubCqL3upLdFI4OSkrMHv+yeeCSsy84bajbkV2evifpsNaEXJBRO4wE83O06ebriMRXoms8Ae1eUUG9xXnth7LVv/qHllFel8D5rKXqAlz28JGZ1IoMqZqu+oZPcs4egAi+pSAmu+5AhhTQzZtfw6yFhKlIQ/O17x4WSaqs2gXCwqrV16yJjL4YM6U9FItrtqkJ4r5xg7HPzjNclXk7j5GYEdNP/w8GMRkNSLTPhKAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1D/oMKv83uWp2xgVIjHCdrKI4FhoqP9Qx/6rSVhYwE=;
 b=gEp5ZZbhb4P2qG7TKQ1azrnEokNMKw1WSu4bMY/Zqx4pu1w53suS7faSpIjQ4aMI9LFdXzVgpBatq36bRQekzVZokYqa3enKDHW7lnB1X2+fHj87Y2Mkrkkmn5vrkNCEvXa9oMH9o/abNAGVuetaSWR7TAvz+jFapLREI1oeEqPI0wPmSCVE+uLnC2rwmEzGq1GRXQuov0LjkZ4jLXXHmfG5DgVHNwhcvl7HMQkS6OML/H29xUN/TrZH2RzRld5aSOl5jw6hkVjD/bAb66r7NkHLjHIuk1zOZ4CmvzIT8UzV0JumcaZMQGahisHhGd4a288+IbjblVhjOS4kQ4j45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1D/oMKv83uWp2xgVIjHCdrKI4FhoqP9Qx/6rSVhYwE=;
 b=TBp/IpYD6Oc/xo7RrDAB8uS0I4aCfDw8YAU1OIzng/+hcrofPR1BtCGngAUqhceJ7q21D+CWZGcU5cEdRuzCGAdbONSndXQSKmSPY8FqWzC9zJWlC3AxyNmJECv1Hf1pq45LQm3mDamzgBZC2kd//T8+7AkaRx2fWVCJhp0Slv3QkUQQxD3A7DqkV4GZdXeiuak0XR8V1Bi1nDZvxQDOBCkSYEh5vyUSSmWPSwmVdy8tGVzFP8jphSk2OUD+mICd52BaWsdC30FTR6iynSUhyWEgJzYuEjDd1c4/7C4p0VASoEIVJpXpz0mFhLQPeeTv4ClEy/vpnC5gTJLVc/doHw==
Received: from AS4P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::6)
 by DB9PR10MB7242.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:454::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 09:26:47 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::80) by AS4P189CA0022.outlook.office365.com
 (2603:10a6:20b:5db::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 09:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:26:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:30:51 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:26:45 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 26 May 2026 11:26:43 +0200
Subject: [PATCH v7 3/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics h7 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260526-upstream_uboot_properties-v7-3-e17cd424d5db@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C713:EE_|DB9PR10MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 2790a599-9853-40cb-ddc8-08debb08e870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|36860700016|3023799007|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lqxpl+Mfu2kryFHf6iCUwm6MmdN+1p4zFfIwO8Qq42uwB//8AEu+1FrRppAuVkgRPpdRLVoklJrhrScDcwDOKIXA9fRwd6Sw1f6VS8EKc5XGXhvjq8xNgWODVkeO3wBQDh3HGFaUo+6JgT0zF+OlKrxGvsF2HG3Pbc2sKOZB69g4KKTMDG8ZynpJCdaIZ5Tj/vkMyYBlcKyruUilpqnO2RxNGy8zrSnel5K0Nh8qiHgFlVnSUtrZKXY2xiOo1ovXy4/oZLzkyCH02XhiNYcKiRRNkJKmpqEqzJKypuVqT88dOvX/38qtu5MOiobM6J9m/F1AijvVWvBAjnRRZeR2izsvd1l7gj3Q7iTVQjwSJA8VcgVm3deXEeSRdna3RsYHxNyjZ9HIuYNXvKfCSODaqYL5uMNh08H0Kkbxv++O1fGa+I/x13ugm937bSNtHg0HPRueM0Zk5ACSeGoXsa3alJkM6lzEfEd2xIHhCLyB+6wg3K6xVgogc9vxXGBtE7YDuKed/6P7/72lNAI/XweV8Hsom9sO40lSYYScUMtjevkjU034stTjna+W8yNa9rVyYk2lPP8aUsmMMhWbRneZdgQCcZqYTaXTdIDSAEZjtzFFf6olw/4gJgOCxCuIZesPCcVk8xSTVZPhnjhzjS3dtZeqRYpx4/QPu0nl7j1JC1NBK5DhJk+Ig/9toxlw7iJyvXPIynxOT30gUW18foZhoVhkhY+ONHSv1/z/hh9loxI=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700016)(3023799007)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8BKZPpfB5V/hfqpblAVrlZAEb5GQSYqq2xCWbjNZxvj+v4xsCgOjYsuhVvGbGyQpY3ncC89dL5PMSbsOK/JtgHotLK/3aWYxN/Ykdfp+8+SZ/TRWydMhmi7YihZoeS2rBD0jKVX+iLVQ+BCwMN2qtyiUWXaqFtmcKMeEL0xOPQ33fme4XJpo5XPfAbJcEj2NuLXqbtlS2PthFMNhh/uD6TbUML5GuDYiVnsDwShzBWOPmyU/P5uO70+3G1enfyE5Dn3toDCs2XHH1h+N1tJjn4l8xdolrE//AcHYPQPrwgfc4En8PmPG0FV5Dd5mTBYp616hHFR1QdAt45HbRaaEt7l+TwsA8CtNe8oDUyCJsFMtyhlCKFwTcY3rrFL7owT8IuKTRCXbRHdGE6QX0ZJwtGollLLc+KfP20FWx26NqdLsgbOFvKuh04o88zqltM6o
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:26:46.6249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2790a599-9853-40cb-ddc8-08debb08e870
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7242

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32h743i-disco.dts  | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h743i-eval.dts   | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h747i-disco.dts  | 69 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts | 69 ++++++++++++++++++++++++++++++
 4 files changed, 276 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743i-disco.dts b/arch/arm/boot/dts/st/stm32h743i-disco.dts
index 78d55b77db7c..1b4b9bc5c72d 100644
--- a/arch/arm/boot/dts/st/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-disco.dts
@@ -107,6 +107,59 @@ u-boot {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
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
 
 &mac {
@@ -126,6 +179,18 @@ phy0: ethernet-phy@0 {
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
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -138,6 +203,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
index e5e10b0758ee..55674fe05431 100644
--- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
@@ -124,6 +124,59 @@ adc1: adc@0 {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
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
@@ -155,6 +208,18 @@ phy0: ethernet-phy@0 {
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
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
@@ -169,6 +234,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h747i-disco.dts b/arch/arm/boot/dts/st/stm32h747i-disco.dts
index c9dcc680e26d..ef36454808d5 100644
--- a/arch/arm/boot/dts/st/stm32h747i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h747i-disco.dts
@@ -104,6 +104,59 @@ u-boot {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
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
 
 &mac {
@@ -123,6 +176,18 @@ phy0: ethernet-phy@0 {
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
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -136,6 +201,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins_b>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 56c53e262da7..8dddc70c37a1 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -114,6 +114,15 @@ wlan_pwr: regulator-wlan {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s {
+	bootph-all;
 };
 
 &dma1 {
@@ -124,6 +133,50 @@ &dma2 {
 	status = "okay";
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
 &mac {
 	status = "disabled";
 	pinctrl-0 = <&ethernet_rmii>;
@@ -141,6 +194,18 @@ phy0: ethernet-phy@0 {
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
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -196,6 +261,10 @@ partition@0 {
 	};
 };
 
+&timer5 {
+		bootph-all;
+};
+
 &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";

-- 
2.43.0

