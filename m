Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795110155;
	b=PurpBX6XANfYnK+BtHss7GmhUmB+0z4KRMM/Z4UK1OFbfQUvdH6tm2bpp68LFOAt3n4K
	 7qDyOBnf5qiFTTL0RmthQKhpOm4uLeXH/cDmPUWjcSQb4yBceaJUcIQ3J0E0r1JqjJ38x
	 dk9j5St3Gpi3qB/uTZ0HXDwxyCRlS9bTROWmkLaGnlGwhkc6PytDtxjTuK0JNxXrJZ88w
	 L4olLMKnHYc6y8ZZ/0sPyTu/yL507r6CR+B2B3YmR6YV4s4gStXOJb1r2n2icca/FFw0c
	 eIseKLHyqsrm0lNzSGzgpZocj1Bmmihk8/nqkkNf/QlogpkGuTPDBDjkeHJN7pcM1jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110155;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7yKV4G281KMmHjowjvBVi18VjulmZtNhU3fwRVe3rbw=;
	b=0Yonw1hHKbpv9k4zI0L79A5sZrt1jfzmiZBzyoTB0sWo5cY1GzT8b4CERl3ArCI4WZCj
	 vIm/p0GU7ESsd9cGJMRdh/m7lAokRd2L1hL/BQxeOEbkmVZVaCXWmMzap1KamcUlH86Bc
	 Ih3gMJhCqPQQY5jlGjdRRYOxs+JQqZmhAn4Hhr+1nxMNAprinmFzvFutIswrJyGonF7Fh
	 gjIAYHW/EW0kbC+lLSFcSKXFRBhsLhJQD/6VEMKOvOKVdoRN3l48hFQy+t4KYTyacZAoT
	 kZyA0xAdyau90Y6lemHB0gQWpfppdjjKjJKqmbNTEhuODpIOx/WTOD17S0D7iaQecdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LMqoti7w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.16
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC74E606A332;
	Thu, 19 Nov 2026 17:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC74E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=LMqoti7w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kquW2MpQiHZKbI1MOuTW/C96mvrA9URp32JK34VKluMlZXfVMcYaDetQ0jLJBlu6vnsD8NNDQrX8unDjVdabDjj+BSEFKRaFtl2fWw0/8jR1ApOPY2gLm2mdF4EMXe8rBkAtkAyHM1pldLXjyR2UrOirMjaGXpjVnKnoCLlBco5Kh9VgnWknuf/vbJJ7kl4owvyLokz8WdkLiiniijoADDWWmnUOM5vfAUErBHeKzK2/kA4LJBx1PDDDA0CJ3nnIwQ57cf6Vy7aUe1avSJxpksuyQoIfvVvp4cVFjyLNrnMyWcrjaV6+FOryQmFVfYlxMP0KusiGjAa4CkzDTGjBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yKV4G281KMmHjowjvBVi18VjulmZtNhU3fwRVe3rbw=;
 b=nebRuWNvVTm8zVk5/0iULOrdZ4AAQfpldXAXWMNq+3QPOXq8FVT1mPj1ubTSA5EqBBylZDRbwCYN6O1Q2iFqQvZQ7lwfW9TvgkNXBa553KbL1LuzkM3hIhJbladlkelM7rFbJkfFA0RASvwK7SKkxtpfO181LEdiSyHnXjfyVvpzsOWIcTdy1ZlRXyP3p8KryRf+W5xZIEvA/VUW+wpkPCVHh2wVPBiCRmQmM2cvSGtLrtU5lAjwR6jV2xvlzCrjjEz8W8QMwTv7lqTcvcMRcFTEePrzguf8qL5osW4J/eBgu5+ZyNyfj8nu0ctBrEdmkcaqZXKGkvyhk2gQjAcavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yKV4G281KMmHjowjvBVi18VjulmZtNhU3fwRVe3rbw=;
 b=LMqoti7wQ2JuAtYgbBKARGzSjp8C0dJxmlTG/IeclVCtsduEEt3Cj4eVRck4lwL7DlyB2WkVTgweXHpymOiwjUFfbd/y+/6voKZBG7o7cayjMpSbd6TmGzUJoeM93FcuqQQj/xDl592FeWAjcrkVZ0rQk9V1AnyjZBWoQPoDCFAMcM4AjqxG6Q8bqDHoHWRvgCh19XPBIW9DK1YHWgO9gEKPu3Zx4RQu+1gx2TORXs8tDJ9on9lgo1R6oP/cfZUbKWeRix7foRCt94FRkRu9lAWSSuAFPHObt8lUQtGmV5e0GgqIA/P2rNNnYQsvpzQB6w/k/0yyOCQATxJNRHMxZw==
Received: from AS9PR06CA0473.eurprd06.prod.outlook.com (2603:10a6:20b:49a::25)
 by AS8PR10MB7523.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Thu, 19 Nov
 2026 17:42:30 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:49a:cafe::9c) by AS9PR06CA0473.outlook.office365.com
 (2603:10a6:20b:49a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.18 via Frontend Transport; Thu,
 19 Nov 2026 17:42:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 17:42:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 19 Nov
 2026 18:43:14 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 19 Nov
 2026 18:42:28 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
Date: Thu, 19 Nov 2026 18:42:11 +0100
Message-ID: <20261119184209.v2.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000093:EE_|AS8PR10MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c6f74e-cc26-47c9-aeaa-08df46647c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|10067099003|261021121427099003|11063799006|56012099006|261021123027099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|13003099007|44046007;
X-Microsoft-Antispam-Message-Info:
	uxOl+DDxXSP28xUDMt5DrUVL+7xS0eoJJS1SFbImfbjhV5RCo5z0WqkGq/r2S/W310UOreHjWUzTcw8A7dMBeD9DPfjMjxRuiL43gSlQwqm5RwtxLk4jJ+QIDd2o9XH5NWCTSQbYjjo7osE+YCL1VIis8P/l5XiDL4eFlny1G69C/lgubre5LKCHwuH+Z35pgwbMFaXpj2BaLfdMzyetFUQ4DCdEWYxAxJmqSfd6MmtX3HdL5Mo+T2MC+jLmrzRF2OjA3JkeiGqgfK39ro6mzA35i/SWrHZ3IBgadLMLeYgRChQIve7+Ac4miaoZMB3gCi6CR0FKABE7BJUZPu7D6HU7Y76TYmsNCMW+oV3Pw+jI6GhV1RL6UzLd/Z5KFnsUdCsbijWS5QTnMYJ7NtHj+EJGXwGp545wPjeGPh/kZGiJYQYOnMVxmi4GHt17/hZVBvf2zKQdMkOkC6yvCFaC79I8Q+qERk2SESBAp9dLl998b6FXM9xBqZMj49JTDVCWue8yAlarkOiaURQ36wJLqRQNH2t1Dx9WwHeU5k2J+A7ze0LVhUJ1cZZfOxBrlajUK3/QBnHdiQNmu+7EZA5NbVgqDeMB2MAgn5y3aOYU5YM+1rsXIUKELyGUgpL3g8tidXLpqBft7kIBhL/70/FIDZzo4VxX7gNdiIkNXmSwyCB4ZkLsz+3N+d20XmeUSR/wVOkowl2Up/JW3glEnmUgGQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(10067099003)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(13003099007)(44046007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X1kHLPpdEqmXNDue0TlaIaKYW80kUyH6T8FZF2lBwzYWzYOWJ7FFgWvdMQVgRlrheVMf5NdqcKC98fVmu25nsAoy0pZkTiSz7bDyJorBXW63THGj63PnMd88QrednAyDFfmqwXFSlPRTKtevmqhzlhC3DRBNuUKG92xhotqauKlDdnrHIa8UjsJ6bEfPbKTjfo9ZjA2ssbbtASwKp22pubGPMVWRmR7IZGmiCwLhggxn4Nu1N6xSghf1I+M1z8HOe6es/m2QlizF6RY3454qu0jhsH643qeVE3bam8QbYLsOVkrruVZRucRBGk1fUBiX5JYDraqg3O8P4urXVjqliAtT2e9z1rvTFEZ4QdDXw9AZpAiqGSGFaSo51onZ8QOOPROURNi224BXeGLsTtpUG+QzIw/nwgkhohJhJOwodg0M4mF9BiTGmkQhQQZqDtp0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:42:30.1348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c6f74e-cc26-47c9-aeaa-08df46647c13
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7523

Define a PSCI CPU suspend state and reference it from both STM32MP23
CPU power domains.

In OSI mode, PSCI power domains are initialized as off. The idle-state
allows the CPU power-domain governor to manage them, avoiding probe
stalls for devices that depend on the cluster power domain, including
SDMMC1.

Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
Link: https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Hi,

It is v2 of previous patch [1], with only update of commit message.

I add a link on previous patch [2] which changes the timer node with
compatible arm,armv8-timer, see Sashiko issue [3] for details.

[1] [PATCH] arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/
https://lore.kernel.org/all/20261104133023.1.If2b6b99285c1e60ca11b6e7fccf7d9b130ca20dd@changeid/

[2] [PATCH] arm64: dts: st: mark STM32MP23 timer as stopping in suspend
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/
https://lore.kernel.org/all/20261030102907.1.I0ef2a7ac525ef18fa683368382d93e98cc36ee25@changeid/

[3] [High] arm64: dts: st: stm32mp231 cpu-sleep local-timer-stop conflicts with always-on
https://lore.kernel.org/all/sashiko-outbox-197300@kernel.org/

Patrick


Changes in v2:
- Add "Fixes", requested by Amelie Delaunay
- Add "Link" to arm generic timer patch

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp233.dtsi |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..27231e140fbb 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -24,6 +24,19 @@ cpu0: cpu@0 {
 			power-domains = <&cpu0_pd>;
 			power-domain-names = "psci";
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00000002>;
+				local-timer-stop;
+				entry-latency-us = <150>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
+		};
 	};
 
 	arm-pmu {
@@ -123,6 +136,7 @@ psci {
 
 		cpu0_pd: power-domain-cpu0 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&cluster_pd>;
 		};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp233.dtsi b/arch/arm64/boot/dts/st/stm32mp233.dtsi
index 78f4059fca5d..cebefd99906f 100644
--- a/arch/arm64/boot/dts/st/stm32mp233.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp233.dtsi
@@ -26,6 +26,7 @@ arm-pmu {
 	psci {
 		cpu1_pd: power-domain-cpu1 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&cluster_pd>;
 		};
 	};
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
branch: master

-- 
2.43.0

