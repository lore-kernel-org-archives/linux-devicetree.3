Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A7E283CB5;
	Wed, 22 Jul 2026 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711798; cv=fail; b=Hh1j72TTmtsPpKuvHXqeZLr6suqu1JNT26pNDCYOcq7LipUQYzMcfPjLp1GJr089uzR6jxDKqvWxydb5CMKB232n0qiM7ShACHv18qelfhOOx85ZAHI2IGfPxClT9RaohEecKvnaLzEL9N4JCqqgGVhAAtDFuIIgi4aK81uXRx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711798; c=relaxed/simple;
	bh=hjgwrnfyOPXVHVCHbaEUjdKm2HP+SuOJZBBYIAPTo1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Vsi61j8BVoxtYWlSwi6mO8oYmgwyC76mGveNqrhOwWz5vRcz1s1XYWQo+jXu3LXV/a6uB1dQjuk5o13wrQsbTbmrzLRTDU/RZ3ONGeMF9CIi+E5p82U8zzLYpbbUysmsBaMHLnSOVoKeOrqmY86IYu1MYoxfxEj2faWrnQEg32A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QoOTx2OE; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QoOTx2OE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nq5um5h4OrK+CtqOgBq/sq8zgZT08PKBkXmW4wMPSXnrPjsf4UO5+mB6EeMus9VubB2Q8byuNB9BGYhCHnmtMxJZM+Xfwy7/S/QXzc5H6ZCcr6dRo67RtQoS1V5aFQr1TndGPb5JPS5cpq17PrVulsBBeCNHpob2HJEszWdV0TDYvvKIxatbEd1G9Lf5v2GQ/HX6P9AlyicdPGpqU9c7i2v0VNTOQsIKp41wYbX2fFMnonjQ25AgrvYRqKpGQJvKKNsnJ7ewaQ6nFnUjJwvhHauSMMwk4C+BnjMr+mWPhEbzUb6V5vyVu6PC6HkkB6mHlGH7fZaZq4hMZ3mtWVYGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6BRF3O0JY64f2eIQZZ8mRO7KqFqr6sSwd4v2rmAp1s=;
 b=plrsEhHMW8t/9hWTmIUC3bU5+3uJTLJ4oRcueOkEGx8yYAumgcy6kdq2beXkFHNeWpyTh13Qxn3CfHl+D6JcpI4QpIskpgQo01kYB6cw8H8n/RzHz7Om2bblDE1yELEJ1DQ1nN0C3kZcs6DTk76PIq4kFRvmmb9RXcKK0xqmoN2Q5hUgc7/7yOOWiWi8mjeTrXW5c2Xf3ph/W5kQJMYYA8LVxoWRxfVMZJ04Id8uADOe5qib5B4bbzgu87yM8Akr5X9+Avc+b0aFg6ti4gpbqTsCF0Zd7tmmrbCYh5SzEzoVOr8jbCHv6TmM+Pt8vloH+lYo7Y9Fh7V7TuTMG/74eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6BRF3O0JY64f2eIQZZ8mRO7KqFqr6sSwd4v2rmAp1s=;
 b=QoOTx2OErsRhf5bjP+tanswiHFiFOphqPrNZ0O0NnMS/9PrHhJdqzaspEVj5BmuUWMusERsYJrZ9ljbtv/wrsKpN89lyolMJkrvCJqRDSEYHxPkhcrQLXyvRMh/kJoE1rlXNWn44mKXLMcWepmMUjE4U25CKgGY81AC5fhrpfaS3lSNeEP+gUMnd3tiGSZRkCwWCaL1DIVwwfcEwYc7h5UKR9M6kSRV1wC+LhiLV+8y6ClFtBeFh4A/NsU1YrVphfkZRcr+SaSyLM0LuyUQ4FZGBa1Ybjt7qjHZ//JinJkpU0a2RZsAPpsuoAguvfHmrxCIU50jzwEoAQ0m3HhuzzA==
Received: from DU7PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::11) by DB8PR10MB3497.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:134::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:16:29 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::4d) by DU7PR01CA0016.outlook.office365.com
 (2603:10a6:10:50f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 09:16:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:21:06 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:16:28 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 22 Jul 2026 11:16:14 +0200
Subject: [PATCH 4/6] ARM: dts: stm32: Add disabled spi4 and spi5 in
 stm32mp15xx-dkx
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260722-spi_arm_stm32_dt-v1-4-6ef611523232@foss.st.com>
References: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
In-Reply-To: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<clegoffic@baylibre.com>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|DB8PR10MB3497:EE_
X-MS-Office365-Filtering-Correlation-Id: eca9df31-b39b-4269-bfc4-08dee7d1ea55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	WJURh3WCT9p2jv3zkGxsgvVtePJ/JYyB6pJMM1EUZepbSbg3Czaf8TIEEpVCi+faPpQ1wtrUp3+CHZfC1083Pnvm+hZ/rxqhx3r6c45Jry6AcA4VfajWkDjSly324FI85J8AMk4o57nr5wi8ca04q+oRXsl8l44L6zEyPiC9mPyukWnnVlEmAZ06dkS83JyHtLXNxPrv1ag+wbH6iKDcDNFwrjtv8hrg8HHXBaLvqN53dLswv7pTC4R6SyMO+eb/RtaeVf3F9BYWkHfdagqzxZLlpCIwY4g6Tc1PDtoFOqd290jE6j4tw/Q7OrwjnHxBcAlC47ztJwWwhjltio+zSvH6GP00hQ7NqDSVM+6A3lKEqZ/ltHcBPyyAseeaN5iirvGaCymMHXgBKH1t7uHSqXBajj/aAdsieo5CAWJwXPhwyroHyXGDbDQRvM+WyCizNon7rWkHf7Fht47htF0pWbS3Wt4jLIyhqwSG02D7LE4ZWZNE8X0UwWV6m3UdshzXW/E0tINY6JWMe/nY4Z/S6/rE8rgpO4CWvFRUcIVh/JNP0ZTES5VYFW6tx7rCb1G3PCFrDr2riubNPk46xWQYR0kN1/1oz0ksK5eEQ/THOex+3LfWHsgKpnTiPx7VQZJy3rhC2NFg3B+jtTlyNZiXLiRbOTrPUy1NtW2jNP31vQ/HXOdhJgMJHYiA2Lfx5s0NlxWKgRUwM9K6eGFKtvWOJw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xMk7FokZudIY0WT1oxIoIFuXciVoKXxoZr8Px7VH48gXs978j13XS0dasQqZXY+j8GKtFhR8/h6//SHyioIMDm9gs8kqsfPKW9OAHCL2q1NplWaz8IV4rHml7MNlhKogDUFIOk4WZnci0Zfpd2AFje5647ZqdVk/knkZ8lohe+cx1zZIWTtUhhVItPuOf+HFCh4KLuqPAuSrE8QixZDSDH/jECbvmLayQ3AGI7TXqpPeCdSM2ovO6MFempW6euRpZsYYVZM0K4GdUBkKit41RqyJrF8v9ARoe5AaB0o9Dh9QflAua4Ksp4smLly1cnl3o4ny0DQ567sMFtM+ineb+2EkmK25XBznMeo5jpq/Q0BrQbLYsT2sUHxdpcm/5pLxUX3e5z5J27CSAix7+VcQqoCodHUXFJigIya7/p63g1RBfV7V/X13tCvVUAV2Hbgf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:16:29.7688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eca9df31-b39b-4269-bfc4-08dee7d1ea55
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3497

Add disabled spi4 and spi5 nodes within stm32mp15xx-dkx.

SPI4 can be accessed via the Arduino connectors
SPI5 can be accessed via the GPIO expansion connectors.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 599ea07bdb19c..681e9b1106025 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -623,6 +623,20 @@ &sdmmc3 {
 	status = "disabled";
 };
 
+&spi4 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi4_pins_b>;
+	pinctrl-1 = <&spi4_sleep_pins_b>;
+	status = "disabled";
+};
+
+&spi5 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi5_pins_a>;
+	pinctrl-1 = <&spi5_sleep_pins_a>;
+	status = "disabled";
+};
+
 &timers1 {
 	/* spare dmas for other usage */
 	/delete-property/dmas;

-- 
2.34.1

