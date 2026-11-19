Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102902;
	b=A9yr6NG/a0SPY9IlrLU0HUmMZiV48IQv8QJRPCePG6uAFZeXso4i+tux/n9gqGCGlqu5
	 57P5VBO0wXOMMz6unACr8eoQxMXB02o6cxMyycZV7dGZGS7qmYrXGFzzA8hn5wQaYAL4o
	 BWQGQzkFsjXiDCAwB/9+85z+UQWemP/jSlQ+33ycKHGk6DQmKfndQHdP2K2TV8tL1cLhQ
	 ML9S8KUjFAclFo7jAcvRexNbdxLO+jV29CHk4t4OurB1Ww7HI6clNhQQ8WyIXj3x9EM23
	 h4JVM7sGfgRoVs28PYjPJ9r+VjEyYB1MKJvcaeJ0hskriPLowvBScJqSvWcruisH8aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102902;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=iwGTGkReUMcRMubF2aOd/RFYieTifDe+tIbx45Z2Xd0=;
	b=yScXc8VhyWPI/2ehKi4YFc2xq+4NUVUMD2fE+Ejsnwxkke+xs7+itsf4QKXP1wthjzVP
	 /yJF0tqNL/mcqCw6WFbJ+4+MwchbG1IuRt11R6ROGCYwZ0COyCUMBlkDReZ/66yqJMMu1
	 XFY5E1xB8PwM2AwtQH5slVnMJGg6cCoAZB2LoT3oaKozE+TFGHr3V7fsVMs4Xh+n1smfM
	 Zj1O884kGK2GCuZL5WIDGQH6qUt27TIggOBpkqjZr8r9eTY8mzI2jhR71GFq3tLdSp7qo
	 VsPrHTWoSXOMh1PhwVZhTlEFz2g/yyhK95Vv51paN6YiigaGG4nXQw2ArvaoKzY7LLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Bi8K0azO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.35
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013035.outbound.protection.outlook.com [40.93.196.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF41606A326;
	Thu, 19 Nov 2026 15:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF41606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Bi8K0azO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=va3bdVTU3rqlrvyoPxn7blxJWMruhapnP71mwnEgpR/qsIGA84+ipqtDaJYqDYl78InOpurrC9Cy54qYaJaH6WWh9nkJGqru4/9kKBeqNUZ6mk8dZuK3w/go95991AS9cJ10PVp1fZ6UOStJO4Dois+Ir2NpnitV3At60Gi4rzCH8L7EWfhT0uCr24tjQOwIP911eak3YvEtMr3QOWF8l7xh79NWiaSCJkhyDKGFXtj1KAQP1wkbtV2J6uPxdopLnzBNwJxZyrc5TEctlWb2dc0BpQDvSGPf6w+eFtpHplYvH35PIyjv83zh4UuTsba26RbsAOhhmy8RudxTS8a8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwGTGkReUMcRMubF2aOd/RFYieTifDe+tIbx45Z2Xd0=;
 b=pduna8TpP6JeAXKGc7wqr2A2KJJvDCrmnOm/eorJwRuL9AwJzIZsuvSZXxgu/J43HkAdVxN1rLO3HwMaNXUaKOEvTQjgUvyrlgQ19AzNabSvLCAUCNOJcdMb3v0VNhKcSw+wck95jzBA29oqA6hIiHLSylK2AS35nWw5LfqyC3J38CjMMrqJgARElc83DCSo7SFhMtXf/y9SDcfONc5gWDmbn/UzUszFW1Q8Q+5KPDr8i/CPv5kUqVbx1i2ujrg/uOUAxkS5zPU2efZSNtc0MfVQKonYmTgD45MlsNaggIt1Xob+x4qX6X5bsP3WovY5yqCT3Qv4CpCCVDhccpDeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwGTGkReUMcRMubF2aOd/RFYieTifDe+tIbx45Z2Xd0=;
 b=Bi8K0azOxBo71ZnYMYDM/1cYjttbKJe3jdTX0a+Suhq2V57r3rBhbJcXJI7Dpp7qK9XghRv3BJN3IUIrpSMqYQHE752vRTg7fmvNbd+DC7rBa4wLGlCajGSYYZAFVcIhIKG3C83vJUVNuqjfOhPKF0KEoUm1KZe9MJN+e6OWqQ4=
Received: from SJ0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:33a::23)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 15:41:32 +0000
Received: from BN2PEPF0000A892.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::26) by SJ0PR03CA0018.outlook.office365.com
 (2603:10b6:a03:33a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Thu,
 19 Nov 2026 15:41:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A892.mail.protection.outlook.com (10.167.248.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 15:41:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 09:41:12 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 09:41:11 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Shaikh Mohammed Suhan <suhan.sm@amd.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/3] arm64: zynqmp: dts: Add USB hub supply regulators to SOMs
Date: Thu, 19 Nov 2026 16:40:44 +0100
Message-ID: <a807fea2b2af7c1b068ba375842efda44c0f0dac.1795102838.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795102838.git.michal.simek@amd.com>
References: <cover.1795102838.git.michal.simek@amd.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7273; i=michal.simek@amd.com; h=from:subject:message-id; bh=/cF2v9oIEO9kzQEwu3oqZObc/+LapdcPLsBLFLbFbyk=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9l2j7tNe+ymFlvu9J7ZnFzxSb+9nzjjgXHuDjqrTyv f3L996FjlIWBjEOBlkxRZbpTDoOa75dWyq2PDIfZg4rE8gQBi5OAZhIpw4jwzKt7izpngszW2z8 lP5vXD65b92sgwW3t7z8ezy39471hxuMDLvTuuvSF2x4lygg31gQtW7jE7/1IWcNN6Xt4U+9+WJ CLw8A
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A892:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: aa42b67a-f418-441b-bd54-08df465395bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|261021123027099003|261102123227099003|56012099006|11063799006|261026140227099003|261022105027099003|261021121427099003|261028144727099003|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IzcY3D1yeq/uAd7bl1cFpBEJsDRibDD5MpmqmXwfd6XC/lKOqnY8GkMFCXRSjYQjHOiow2B+vwxF1b/otgLrunq8n93m0sChTayVR523tfrb+IvPFtQQeqVy3tODC7/UG0SZbJARvMscJSEydx+TPhqC1xbBgWw/9WuHiyHMnyC5WloifyTIduH5ZdnlCqs+8IaUXwcPo5+LxXHe3HdgESZSqH/DiDnA8H8LKffAybJ72aTj8afMLf+MlRHG89Oy+w0DJ5kjjJ1kxYWFfS0VvpLNL2x66jnb1y7itdXd5beuoj2ppGAZaqZ/zQTqnwZQHNdHT+s8PrOshKNqpVVz2Zm9WP0ds3koosNkGWaj7qyVNrX0E4WOEk73dTZS/eYJvoXYLqgEaWeyBGNUiQnAdCaC/M6yKBaNq+kNvdU9XmEpOj/JUaIDwn67dUoIIUIpegh7wcGV5og8l4RT7+FgBGGu6jughE114hdk3EL/9YmhdfTiKA25zCovwLWXyi86GoXpxKE35RIKUBncxeS0QZvrV5kIRBaJurXmsC+k2T8GoABnoXhlDzeouncs2CMaHwEZGUt5PcXqHGIoofkfzrhDsCeoLIOQ1L9BkwS5G6M1it4QfRJO7/VPckAGj3giUNtAipUcP6CZJSkBM+PQQ2Wjx32jMp36kevIRgLCJKztJiuATqvI9l1oLGx4I4e90VWqwItqUD6Ngfh9jWB0bw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(261021123027099003)(261102123227099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261021121427099003)(261028144727099003)(10067099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TANF0V9frnJG5ytE00wdKeZ/Tg6y+bEX87DWHjt+1LjKXGrcmgJubrRY2/2aq3UrZ8+I8VJy8Gs+VgwSgA/WVNLsuUQtMNePWTzXxhEbGO0NRqXmYj5qtt9dSiSnl5E5h125+Hjs0r0Ui0LNM4FiFI6Hf6XXQfsLkrXl6OGDmtf75X7m26KFNmb/+bw5Uz93staMtuRb1FmgqWqZh6wPfCkxkInqac2hyCegvf/un+wBB2EyzwYo/iaVHQ+euWTsanXilrlIOqFxQ7/KQHQhRHvvReZ7TGwrAczsNsSHtYmVdpPMH0EvJXrCXI9jh/QESRSdM50CI342iU2vrOIFdaNF0qQc92ntWPmR17VhLE0VDrHNf6NEeQjDkRVPk5p9tA4oCqVBpP2CQlyB7L6Dc8EjPG9FqEuT72L1N1o7HNRV271uZUtQOV4YrFOvEUJv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:41:31.7934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa42b67a-f418-441b-bd54-08df465395bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A892.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017

From: Shaikh Mohammed Suhan <suhan.sm@amd.com>

Add fixed supply regulators for the onboard USB hub (USB5744).

The USB hub requires two always-on power rails:
- vdd:  3.3V main supply
- vdd2: auxiliary supply

Model these rails as fixed regulators and reference them from the hub
node to accurately describe the hardware.

Signed-off-by: Shaikh Mohammed Suhan <suhan.sm@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 .../boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 20 +++++++++++++++++
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 22 +++++++++++++++++++
 .../boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 22 +++++++++++++++++++
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 20 +++++++++++++++++
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 20 +++++++++++++++++
 5 files changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
index d20b6ea2ad0b..ba5d761805a7 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
@@ -50,6 +50,24 @@ slg_delay: enable-delay {
 		gpio-controller;
 		gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>;
 	};
+
+	vdd_usb_hub: regulator-vdd-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_usb_hub";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd2_usb_hub: regulator-vdd2-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd2_usb_hub";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &can0 {
@@ -123,6 +141,8 @@ hub_2_0: hub@1 {
 		peer-hub = <&hub_3_0>;
 		i2c-bus = <&hub>;
 		reset-gpios = <&slg_delay 0 10000 10000>;
+		vdd-supply = <&vdd_usb_hub>;
+		vdd2-supply = <&vdd2_usb_hub>;
 	};
 
 	/* 3.0 hub on port 2 */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
index b3084f44a4ca..791ae9954173 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
@@ -86,6 +86,24 @@ slg_delay: enable-delay {
 		gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>,
 			<&slg7xl45106 4 GPIO_ACTIVE_LOW>;
 	};
+
+	vdd_usb_hub: regulator-vdd-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_usb_hub";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd2_usb_hub: regulator-vdd2-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd2_usb_hub";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
@@ -194,6 +212,8 @@ hub_2_0: hub@1 {
 		peer-hub = <&hub_3_0>;
 		i2c-bus = <&hub_1>;
 		reset-gpios = <&slg_delay 0 10000 10000>;
+		vdd-supply = <&vdd_usb_hub>;
+		vdd2-supply = <&vdd2_usb_hub>;
 	};
 
 	/* 3.0 hub on port 2 */
@@ -232,6 +252,8 @@ hub1_2_0: hub@1 {
 		peer-hub = <&hub1_3_0>;
 		i2c-bus = <&hub_2>;
 		reset-gpios = <&slg_delay 1 10000 10000>;
+		vdd-supply = <&vdd_usb_hub>;
+		vdd2-supply = <&vdd2_usb_hub>;
 	};
 
 	/* 3.0 hub on port 2 */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
index fdb6eae87eb9..b9ae01cddcae 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
@@ -87,6 +87,24 @@ slg_delay: enable-delay {
 		gpios = <&slg7xl45106 3 GPIO_ACTIVE_LOW>,
 			<&slg7xl45106 4 GPIO_ACTIVE_LOW>;
 	};
+
+	vdd_usb_hub: regulator-vdd-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_usb_hub";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd2_usb_hub: regulator-vdd2-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd2_usb_hub";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
@@ -195,6 +213,8 @@ hub_2_0: hub@1 {
 		peer-hub = <&hub_3_0>;
 		i2c-bus = <&hub_1>;
 		reset-gpios = <&slg_delay 0 10000 10000>;
+		vdd-supply = <&vdd_usb_hub>;
+		vdd2-supply = <&vdd2_usb_hub>;
 	};
 
 	/* 3.0 hub on port 2 */
@@ -233,6 +253,8 @@ hub1_2_0: hub@1 {
 		peer-hub = <&hub1_3_0>;
 		i2c-bus = <&hub_2>;
 		reset-gpios = <&slg_delay 1 10000 10000>;
+		vdd-supply = <&vdd_usb_hub>;
+		vdd2-supply = <&vdd2_usb_hub>;
 	};
 
 	/* 3.0 hub on port 2 */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 09ed585cf91d..9b37cff42e26 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -85,6 +85,24 @@ slg_delay: enable-delay {
 		gpio-controller;
 		gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
 	};
+
+	vdd_usb_hub: regulator-vdd-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_usb_hub";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd2_usb_hub: regulator-vdd2-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd2_usb_hub";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &i2c1 { /* I2C_SCK C23/C24 - MIO from SOM */
@@ -167,6 +185,8 @@ hub_2_0: hub@1 {
 		reg = <1>;
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&slg_delay 0 10000 10000>;
+		vdd-supply = <&vdd_usb_hub>;
+		vdd2-supply = <&vdd2_usb_hub>;
 	};
 
 	/* 3.0 hub on port 2 */
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index 50f451bcc7aa..657aa73f741c 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -81,6 +81,24 @@ slg_delay: enable-delay {
 		gpio-controller;
 		gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
 	};
+
+	vdd_usb_hub: regulator-vdd-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_usb_hub";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd2_usb_hub: regulator-vdd2-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd2_usb_hub";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &i2c1 { /* I2C_SCK C23/C24 - MIO from SOM */
@@ -154,6 +172,8 @@ hub_2_0: hub@1 {
 		peer-hub = <&hub_3_0>;
 		i2c-bus = <&hub>;
 		reset-gpios = <&slg_delay 0 10000 10000>;
+		vdd-supply = <&vdd_usb_hub>;
+		vdd2-supply = <&vdd2_usb_hub>;
 	};
 
 	/* 3.0 hub on port 2 */
-- 
2.43.0

