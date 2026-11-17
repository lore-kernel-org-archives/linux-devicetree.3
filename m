Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940317;
	b=nCyypLaaEAxv53P43G984eWdXyGV0RwFSq7fbHSHzTtvHEZ0j+SYMNCpk1/sMpRy/27j
	 0RBatDrvKD1/+1SwebXTUQDOBx8yVOOaSWJxvpFEmqQJIrQcr6vn8tkzgSu3gUNcQQRW1
	 1bFy17HumpKmhiTDj8r5xPsXVtsh8Cnp1LZvdlV1TAkj7a2HdEF3kTvdPzCfk55WpgNtj
	 +YOqniNaeBSRu3PguQJ+/OeJq40L9RaeN+NIyGU0TUJuzMoLaVviR2J5YC6JU5n/q7tih
	 sMCpmTEMu+v02OO1if+Ir59BNRphesj1VflxZOZN4O91DCwjDvGkvj8orExoTJDR7pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940317;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=8GcMvxjU7qDJE4xqlO/DI29b4UfW+btTJUDtVbb8+4M=;
	b=FPVBn2iwm7pdMDet5tG4M7GveryEu0Z7YxLXWfp7H0p5U8D6OiplWm7eLrChNI1uCCjG
	 nZtS+NJRootfLnBMKWFTqzS5h4bpWtbWH3IiTd154DXWNb32yTDhX0a6lUzUoeGCS4oUO
	 qZr3M9uHnG7ejalVdKZoBaUsSY/Bowaht+EHSmdb/C1acQTnmQYs44nLi/xnvXTka9+Is
	 7v6J1lN5LvgSPbhvBFBsnlXO1dAr+D2iwpVWmHbBXRl2snqhvwEc0uZLcwUFFIMcFtnAK
	 QQNvbPvd8Wf8OPDP8LUiCVr47k3IbnKpFw+DF3gzvSW7H1eBfSRXbJFa5Tc8ul4srIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="D/4hEkSA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.34
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F7C606A32C;
	Tue, 17 Nov 2026 18:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F7C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=D/4hEkSA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEEyWMbAnFFK0jRnS/E72R3LjT+1Pw16jx81w5iDX6jcMVV2s/TLPfwj/SjLc2hNLmK95q7qAU8aHOwJZitlncCX03XgVcpTZeZZSjhK3nHACTSeQOcgCjIpzGNS2wWDOtbVCXwqyBjoZCLXU/aUR/lFv4b73kac8Xv9bfb87z00WTwp8//v5j8VLN4/UHwGcRJ9VvBFmm5MKfAeVkcENuu1P6aGUwhqrEXyLMqTSNemktypDQuqjUECdH+73ZYaoR+g1FLYFbtdKjAx2z/dAzDScf4DRcb6xmCNIryvOm721ys6BEpEkgEZ+HtXhwoxzjGWI64Bj6kFPlSyN4HKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GcMvxjU7qDJE4xqlO/DI29b4UfW+btTJUDtVbb8+4M=;
 b=PgryRVehj+g/4Rn8t1+jXSSzeB6YovFMlvsgo7Uh7z43HL2ymxNopgzkPpbTtIu8bT6Z6GZbV58IuMd/cqsA42+PojMhxit2yG431trHRwpVnrNGEkwnawuf2FhYjdy02qoLEC+xHaFZx8eQDyRIjxVUxewkvp0oOrTsScKxmA8RbDG6P819zaC3Vkv8DlEjFNX6jxG2tPqiclJYrQLjFOViXk131q4WuoVOy+TUDYSVig/VroSSVsUFuakmbgDbu3h/WlHGWKlvcs1KZxdDQVa/bUq15Ju+JdPB41YR5S96SVnnMSLyPWS4FgnuwHjxNRTO31kl6+CFi+Mju3dV1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GcMvxjU7qDJE4xqlO/DI29b4UfW+btTJUDtVbb8+4M=;
 b=D/4hEkSA5UNQ1E4wwl+9xUbm22ipOLDwy5XNyTOyYpF4OwCfGgqtmTA4dqDYCGpWnO6ilJdPzi2Ey6DkNunsfQVTnvQbFRnSSxrpoI9DfF1O+FhmlxUEujWdL62aiDIRATcp2srNeYWejazamJDJl8eRaq2nBuFfZWKvqmRDhpGDnbkyI4BG/QgMwtu14zqDeRYbZJFC5napHfUDjYyQH9o0va8M0e9T+BfSWKJdNUpcKk5JGwfd91AkvUuZsTrB/f+VJCL+wui+YeRKnHk+iMqiJdWIUgCS7jXzZFnvqdFdM+eDIimKC/q5XTjt11UItYhDwDmtZtNSTuGgzKkj2Q==
Received: from DUZP191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::16)
 by DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 18:31:53 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:10:4f9:cafe::a2) by DUZP191CA0006.outlook.office365.com
 (2603:10a6:10:4f9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 18:31:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 18:31:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 19:32:52 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 17 Nov
 2026 19:31:51 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 1/2] arm64: dts: st: add SCMI voltage domain regulators for STM32MP211
Date: Tue, 17 Nov 2026 19:28:45 +0100
Message-ID: <20261117192843.v2.1.I7bc9202635a4961733bf6f80fb06d89703bce1fc@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117183121.654286-1-patrick.delaunay@foss.st.com>
References: <20261117183121.654286-1-patrick.delaunay@foss.st.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|DB9PR10MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: e6262059-dc48-436f-955d-08df44d90ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|22082099003|18002099003|6133799003|261009223027099003|3023799007|261021123027099003|56012099006|11063799006|261028144727099003|261102123227099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|261021135927099003|10067099003|44046007;
X-Microsoft-Antispam-Message-Info:
	SRHZAjpUN2aI+Al7fM9zUVR5dkLaXYXv3OiBaj31yAHMJobCTuVYkmSm63wpf/zNlpCFazBISkRIURNYdS6scSs8rkqOaYnysbp56aS8bdz14UYUy9bHibVxRKTr7YOWGKz1Tu00BYfWkZOtDQZfM/7vIQzG39151b+ruBO2akEJQXQBMAHhPBTn3D/44iq85ptd7FRAoLvCUltCDIXMSZLOmPz2ZP3eqEWQ9W9gLlzcJRvrhFsdMUuYWVQkmrqiLux2+9pSaZ6lp9UvbZ8t6Cia76Up3pHNLUtrpbsVvsqg5CLmG1ap2mbV+BsCdJF8rE72EtWzTJafR87H6lYQL8csKlbWDV2uzNSEMlVy8Y/KgUCI1EmaNZObE1bm8oFVmOC3nIwqb54JyTWfk+RCO9Vux5UyWBPo7HGHBkC2KY3r8fFIFpN2wRggh5uO2PNvwyKnVl1qCbNQWiWNAgTj/PsvYXG6LrbF3n+0xpD37uIlASxdNK65cnY9ckOtAjj4N4LP4AHXOqDwtfBTuBaIhWBICY+pnbHSvZsbZbet8kYoJQbYzuQ+ts6dOttUeSEqfnOF8dcK8LF9WQbvwt2EdlChp1/z5PC3OtgFTgRQcyxtKsChKkQPJaej/dtEGAWG2GDopal58SPGpY542Aeyz+Cpb8VbNa9cMopuZQ+1tiiC6J3tLNxdqJd+KRzen8n6QbKVSA055FzuCuimv6kcApEb9uxuZyBf3E+cZgeD0wt5vud5UUNo9A8j3UJ6UgCM
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(261021123027099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(261021135927099003)(10067099003)(44046007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IcrkL6jGxI0+y3rNs/X1tj9HYZFM+N89TLmuZ/HAvOFmOA8fEdUb62+pghiQKUvHWL9SdEI5J89Kv56k45Q0p7ZqbFZA58963B88TI4Kr/wJoK2qv6NpuA2fKW+3E8xQyRFI+V8zcw3U3jGcDfavgWeuWBVVO1XBu1N9YptabI8SrjtRviF1H4BwnD4zXvcDLG2GSWaCnxlMYpI7oYR9B2x0dKbHMGlMEO2tqQVmZiaUYNZnNWkb+ONB1sF7cxMyuhG5TEPo/xCejBJp6LtvDe+6sCUVD7iXNhZQm7teuHXBGl5mDcEa/LBAQdDk8denJ5QQCF7dO4HIzgv2d0bhW8j831aCkEtVf4GxfVanN5HL5jdNTlODDKnlWf935Z4I/jojVqDbtOF/MuBRUGRxtR6HD0z4ggG8ORMOueYoyhAcIavrK5tvnOra2h64PtCx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:31:52.3520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6262059-dc48-436f-955d-08df44d90ce2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8248

Add SCMI-based regulator descriptions in the STM32MP211 SoC DTS,
covering VDDIO1, VDDIO2, VDDIO3 and VDDA18ADC voltage domains.

These regulators are exposed through the SCMI voltage protocol
and will be referenced by board-level DTS files.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
-  Move the SCMI ID definitions in stm32mp21-regulator.h
   to the DTS directory; it is not a part of DT bindings

 arch/arm64/boot/dts/st/stm32mp21-regulator.h | 48 ++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi       | 27 +++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp21-regulator.h

diff --git a/arch/arm64/boot/dts/st/stm32mp21-regulator.h b/arch/arm64/boot/dts/st/stm32mp21-regulator.h
new file mode 100644
index 000000000000..bf26b7efd2ec
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp21-regulator.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef __DTS_STM32MP21_REGULATOR_H
+#define __DTS_STM32MP21_REGULATOR_H
+
+/* SCMI voltage domains identifiers */
+
+/* SOC Internal regulators */
+#define VOLTD_SCMI_VDDIO1		0
+#define VOLTD_SCMI_VDDIO2		1
+#define VOLTD_SCMI_VDDIO3		2
+#define VOLTD_SCMI_ADC			3
+#define VOLTD_SCMI_VREFBUF		4
+
+/* STPMIC regulators (STPMIC25/STM32MP2L/STPMIC1L) */
+#define VOLTD_SCMI_STPMIC_BUCK1		5
+#define VOLTD_SCMI_STPMIC_BUCK2		6
+#define VOLTD_SCMI_STPMIC_BUCK3		7
+#define VOLTD_SCMI_STPMIC_BUCK4		8
+#define VOLTD_SCMI_STPMIC_BUCK5		9
+#define VOLTD_SCMI_STPMIC_BUCK6		10
+#define VOLTD_SCMI_STPMIC_BUCK7		11
+#define VOLTD_SCMI_STPMIC_LDO1		12
+#define VOLTD_SCMI_STPMIC_LDO2		13
+#define VOLTD_SCMI_STPMIC_LDO3		14
+#define VOLTD_SCMI_STPMIC_LDO4		15
+#define VOLTD_SCMI_STPMIC_LDO5		16
+#define VOLTD_SCMI_STPMIC_LDO6		17
+#define VOLTD_SCMI_STPMIC_LDO7		18
+#define VOLTD_SCMI_STPMIC_LDO8		19
+#define VOLTD_SCMI_STPMIC_REFDDR	20
+#define VOLTD_SCMI_STPMIC_GPO1		21
+#define VOLTD_SCMI_STPMIC_GPO2		22
+#define VOLTD_SCMI_STPMIC_GPO3		23
+#define VOLTD_SCMI_STPMIC_GPO4		24
+#define VOLTD_SCMI_STPMIC_GPO5		25
+
+/* External regulators */
+#define VOLTD_SCMI_REGU0		26
+#define VOLTD_SCMI_REGU1		27
+#define VOLTD_SCMI_REGU2		28
+#define VOLTD_SCMI_REGU3		29
+#define VOLTD_SCMI_REGU4		30
+
+#endif /* __DTS_STM32MP21_REGULATOR_H */
diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..84a2b51d705f 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -4,6 +4,7 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "stm32mp21-regulator.h"
 
 / {
 	#address-cells = <2>;
@@ -67,6 +68,32 @@ scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
 			};
+
+			scmi_voltd: protocol@17 {
+				reg = <0x17>;
+
+				scmi_regu: regulators {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					scmi_vddio1: regulator@0 {
+						reg = <VOLTD_SCMI_VDDIO1>;
+						regulator-name = "vddio1";
+					};
+					scmi_vddio2: regulator@1 {
+						reg = <VOLTD_SCMI_VDDIO2>;
+						regulator-name = "vddio2";
+					};
+					scmi_vddio3: regulator@2 {
+						reg = <VOLTD_SCMI_VDDIO3>;
+						regulator-name = "vddio3";
+					};
+					scmi_vdda18adc: regulator@3 {
+						reg = <VOLTD_SCMI_ADC>;
+						regulator-name = "vdda18adc";
+					};
+				};
+			};
 		};
 	};
 
-- 
2.43.0

