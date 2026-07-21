Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A963368A2;
	Tue, 21 Jul 2026 17:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653263; cv=fail; b=BZrp198zUdeJfIX+ITn00Zb7gG3ROe9gbLHkqZCRokqy+nL7n8paf5G+ve86Z4eoWaC+nOIDjsetpM4RnXsMrEwcIT0hvIN56fFXB2XbflmmqVVpJiIqiNVzWan4jxDRR4Jz+j2YmXcAWEbAKHJFoxbrfAy1Y9WBrZZbtRHQlik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653263; c=relaxed/simple;
	bh=H6BPNm1hnKKrjKJn4qYKevej78p8WlSjZrO/3BWpcKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=JcC7T0S53X67SjOoD/mq/cMqoxJV/4cnOtkH/F6J9OJoq/YJFqtZ2zkLJOBFuXDOfyEogTrLCEZTce9zFrmdU6Q1q9ih5O5Rif5Jww7sdFdrgP5k3azKv6bt+Nkbnns5XoLLccQwnTunZiThunB8ZyyRVdT+7G4SOOvPlqL365A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Op4qmTPm; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Op4qmTPm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhaLoJkm9VZTPwrl4PGp8mlQDRcCOhDT5V38l/9xzOh5EOplthtcwtua94v8f7xk9jNN9lmVmoxX7MBmorp/J4Pp9P7jTXaHUL47PzFO/2It7bKXzXUfoPhbSj7HW1k42qJwn6n2HoSPl1VTsNZKDqg9bEKk6wR6MlG+634NMaQQ7UfHRMnXSwL763LqjYVOcPOy2Tv9qMv2rhbmxbo84tONVv49NmUMVy3CZmyjvj5KwDIql7mFQXWjMfnxo5EtHbkb4aXQ7fz+IqKmNqLDkzCsUMD1alYQpcci7Yj69j0A9GRbAYdelPha5IUDMQTW9+gBbMyOl7ZDtPat/7bQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xm7oEjLTeAnKMjPILSDktBHWaEnAOxlk1K0XS0rF9c=;
 b=Xlx5GrUuelUFgMcmtAPG5PnFs9dO4pHtTvonZhaM1HmR3p4+zf325yrinnlt8cU2FuwRSVgUWd3ayLpWCjkdxO4FNyMGM7IM/cGf+j0rlSDjR7ocXFRVyWCdwMvS5Jy7RWCQsm/ALtbZtKdhEAYvVq13sv/7rgyPTEcRrgGxBTtwH7PuJ8/UHP8fgvi4tBSkL4o8fbq/CLmz+1L6cp1nCb6klGKCvGoCXI0wljYm1bQzD8ubz6/k5IMKrayeKUU3UqsJJa+aUneSn9wp7biItGSepigX2Txx494zrGCTI3qidz2K6KMQzzU0tK5CsLOaABsvZ6r6lEippNj/0+KVNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xm7oEjLTeAnKMjPILSDktBHWaEnAOxlk1K0XS0rF9c=;
 b=Op4qmTPmiYZWr4jO4RrV1DNm5wvuqBkBddx7cdH0E11TmMEEHIOjg2dRl2/xt3XhfPwAN0prwc16e/SK/hJ1Mtu6wDp9QO9e2+GZE6TpP73/M9VqF6M1OA1AcvdIMKBr4K4T8lCe2BHzjtEEw7d/0vbzhtAQTK9JkXcJZbOR8rYDAAJeBzXHB8unOyckReYgEsuUfXPRuSno5UekNTi4Iz9wVABKz8+1TiQ+Wz9ziRrIrrAphN/+CC1YgpwO2JUhCt3Zc8FAX/52Zq/MbU1z6htOeFN+vGUyW3IhdCQWqr6Mn9uMLEZh8jf7+qmmaUzYUYEZEYD7i7jCGHNWN08Siw==
Received: from AS8PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:20b:127::18)
 by GV1PR10MB6292.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:90::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 17:00:56 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:127:cafe::75) by AS8PR04CA0133.outlook.office365.com
 (2603:10a6:20b:127::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 17:00:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 17:00:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 19:05:33 +0200
Received: from localhost (10.252.29.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 19:00:55 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 21 Jul 2026 19:00:27 +0200
Subject: [PATCH] ARM: dts: stm32: add LTDC / DCMIPP access controller for
 STM32MP135
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260721-etzpc-mp13-ltdc-dcmipp-fix-v1-1-a969f2ab8da1@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAKqlX2oC/yXMMQ7CMAxA0atUnmupSSBAr1IxNI4BI1qsJCBE1
 bsTYHx/+AtkTsIZ+maBxE/Jcp8rTNsAXcb5zCixGmxnfbezBrm8lXBS4/BWImGkSVTxJC/0Lvp
 wGMN+szVQB5q45t98OP6dH+HKVL5HWNcPUw1in34AAAA=
X-Change-ID: 20260721-etzpc-mp13-ltdc-dcmipp-fix-63d6b9ab8451
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|GV1PR10MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: e130a260-e5bf-4bf6-b75a-08dee749a1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JotKiU+9M0VCfqgwD6bUwQ7AT3RJlTfO3OWzD+3yJDpBEA2q3KoM3iiz0BGnQPyB1HMlByszIN8+qdYfThaHUd0T59jreufHEvctM+2pryilerD74DEV1ftIkRXEEPQCTbuI1jQeQkZzt9AfI4UCmsGyfdexCIqx65UkYgtM8a3g5jWwC2f3YyFzblfk0uLvPnt/G3RsCPZSoNrEbTiVC8Sikmnnv4iFB6rQZIpiPXciU9LOQNaUtLsPP1ReSDYGg3rJ5xEHe3BQeVmEq+IsV4fcgoDD237hxeXB59pvmMPtcS75B+HHn0/rS46gg0bMvmE5TfMWN0vW+ahHUFUM6WF9CW02pb+n9/bVpibT4FhrmxlKD782E4bFSEh3WaJVLTW/h1YiPK72jtThfun3+dGMUKFvWIK6mMdCZZTij534lQuB2aAABy5wxJladdkXvmfCDFuhZJUQ3WSe0gIDbiB5UAFZitHr4HDylK1SiaafGS6wG1qeA3V0rWE1PcnPXgtPM8r+AzVByzXwtdRoQQfsWcl+yVVxmxLaeeCU6Ki55eu2kXozSZn6MuV/uLOEMjI0fW0NBbDO1Y5SGpTiOTUcRx6Zwwh9Cfaw1+j/5LyS4FY6ML2B/hylZ7tD/otXb7jgFchV6jvfPhGL4cB2FLe6W32HXfnVuOqh/G1PRqbX8nDyZQGF+gIawczaQ2dnQPgOtv16H1rImAEDScYUzg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MsdyZYOpYL9+c7wlKp19EGEHtJqAgbUWbYl447l4+f4n2tkQyptggI09rJ3rmr+2OncAi/o5kP2j7Q86iwoPcAeM9T6Z8WiAxKPbW1yEwVYmERk44KHJtXN7QgFNiV5AlYCq8wCx7I8aM4jMOdkShTo7hd70hdb2HDO8sywtqsr11t2qg8vKs/HYEWyywMW0lXJ28NbTIqh82fqK89AmZPINUk4QfhmZnSmfwKorVk+BOnLMU6CZnnrCb7Q1gthhs3bPZ0CyOmTjnHhQA0YzMsEFti/1egmqY7QDCeWDdh9dBlBAE1WBsMQM4r7YU65Q4YS5d5QxKpD+7vsIzI4ZaeCYLmtWHnffZKt6yQiX3yvDNwXASwpk/iBIccfH2+S+tITC7QtTIqndQZihNTR2vlcxYnziMUPiYd+K5LEdQZKWTNfIODZJnf6vplrpco29
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 17:00:56.6184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e130a260-e5bf-4bf6-b75a-08dee749a1d6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6292

Add ETZPC as an access controller for the LTDC and DCMIPP found
on the stm32mp135.

Fixes: a06b9560eb6c ("ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135.dtsi | 42 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135.dtsi b/arch/arm/boot/dts/st/stm32mp135.dtsi
index 834a4d545fe44..f573335edf6b4 100644
--- a/arch/arm/boot/dts/st/stm32mp135.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp135.dtsi
@@ -6,29 +6,29 @@
 
 #include "stm32mp133.dtsi"
 
-/ {
-	soc {
-		dcmipp: dcmipp@5a000000 {
-			compatible = "st,stm32mp13-dcmipp";
-			reg = <0x5a000000 0x400>;
-			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rcc DCMIPP_R>;
-			clocks = <&rcc DCMIPP_K>;
-			status = "disabled";
+&etzpc {
+	dcmipp: dcmipp@5a000000 {
+		compatible = "st,stm32mp13-dcmipp";
+		reg = <0x5a000000 0x400>;
+		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+		resets = <&rcc DCMIPP_R>;
+		clocks = <&rcc DCMIPP_K>;
+		access-controllers = <&etzpc 4>;
+		status = "disabled";
 
-			port {
-			};
+		port {
 		};
+	};
 
-		ltdc: display-controller@5a001000 {
-			compatible = "st,stm32-ltdc";
-			reg = <0x5a001000 0x400>;
-			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc LTDC_PX>;
-			clock-names = "lcd";
-			resets = <&scmi_reset RST_SCMI_LTDC>;
-			status = "disabled";
-		};
+	ltdc: display-controller@5a001000 {
+		compatible = "st,stm32-ltdc";
+		reg = <0x5a001000 0x400>;
+		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rcc LTDC_PX>;
+		clock-names = "lcd";
+		resets = <&scmi_reset RST_SCMI_LTDC>;
+		access-controllers = <&etzpc 3>;
+		status = "disabled";
 	};
 };

---
base-commit: fba4a31a7f3b6b29b01c83180f83e7ed4c398738
change-id: 20260721-etzpc-mp13-ltdc-dcmipp-fix-63d6b9ab8451

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>

