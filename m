Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795110981;
	b=q3ckbsvQ87wHH1R8lwjqIlzF4TgMHcT5tOOOo3wKIrKmsg7bFYctNxk3WUEy6MZsGB5G
	 lPVYCose81um7IAfKQnaeo4/PoI9EJOTRuSctLt1mdDRiLDI/r8QMoNII/AjPGAjNghnL
	 HboVxAgGoLGGtUa4C73mpUW3en2A0M2Uybc0lBGhOBopCIVa3xnyIKdGUou2jbfTZCSQY
	 8OcvmwXPDev0RfmILWYkZiNx+NG/wYKIg7g2yPxtCO3JtjUDUP/bElmcV4PmScRjTLaRZ
	 NTJgixUTEz3otPtdkoG2y4ROLKdPNEyIUwfgf2Q+I/StllqnUIQO+VZkFEXP07mheMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110981;
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
	bh=1YnFqwNmuavVlaq1ogaeCpMC+sdLh9Lt8cwroBHviBA=;
	b=HnmZc4FVfJl/Uu9E5xcTPePiigG1p+ZaxpQwhFtgaeZTLrBKCyto8v3uFBgWjLsUSzIU
	 8OeMLRiBGWP5O6GJqogJS8QfEhph/n7DYnk/Q5fgb1KM5P9D/CymEbWgob3uM/epoBkoy
	 PONF3PtRR9iT0kgMoS7ptlPqyB2ZDnJafXRYswOZtIR2CowRgmu7bPhejbL1/XLrlLnff
	 okacX/xVd9rUjnVN6RKf/vXJpkLaDoaBJtppXf6WegT0E4dvSTwbPxsxFhxztg9CYX1hl
	 cNPus6uwX9WFbQZ5AiWJZGEHTfzOnyEupKveGGrHzDb25UxR2A9OlX0f17XtKwxJlkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Eky266Kb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.13
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01A606A324;
	Thu, 19 Nov 2026 17:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE01A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Eky266Kb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGRBFS+XUx7EmaPGO2K7AvEdzhDZFeXOk2p+DSWOZY4pW5OiZx4kub+AmnuUdb4CPSi9tVQKkA/laMFB+Ms3V/MrauWTJxjzz0hz5ALV1xfXUdRsR/S0ZQ9PXH8MA0Ewaf63zO/e1zZObB8m2JBVymsRN3cP1keBCPM7LOrUrlgP0fS+cIycMMtNVC7Ci7oBrAnrVF7Hb1httDl1JzWL2QWCtWLuqeVQna5w8Suwr9DKfkmNbLuM3nL4y0U9ciNXGPzcSJ55pTK2uKSV/pb8js2Wzj6Z+y2c3aE8osRikwrzhAxr2agwrhEEvNunookLWUzVCCPf1oxLK6GK4mPUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YnFqwNmuavVlaq1ogaeCpMC+sdLh9Lt8cwroBHviBA=;
 b=DP1eaKMZ2ka29Wye5rnZgUD0Kr6c7huaKJDien6gPW4+0UEVFzHUcg+SRLlpAHUuUWJJqFcOWOV0oYc319l39IqFSO5Fh3+GtrqCTTIdZIbfhm6mxL5zJs1YDfmiRXhL9QV/CDx8uMN/UVZH8aW1948+AHfBpY6XN9nFNw4jZZUfGlI+AeMCNVUzG/tyQBjo84Aob53qUf7RgFlRMeh+NFC0ZWy7gdDYdEUWwlVrYMsEH+1D64lrGVeHytUXRgcIDMggEVeNiTdaf0UFBWAZxeHW3GFQMA10rygmtj5/WC7PRKuxCKc6bZZKLBFRys3uq0YIN62QpHLqm+h/TP1PUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YnFqwNmuavVlaq1ogaeCpMC+sdLh9Lt8cwroBHviBA=;
 b=Eky266KbYV/E2rjEa7i+aYVcppSmEXNECpGv/aCSmLqpWJk8lcgDk8Us7/54Yt4jsAVD1eiqi8N6bFHBFnUT7R2hlgw0e3A5gKVjImkYqBXqifoh9ulmxXasznOevkzkoEohMb3t8lFkaZapGULkH3N6SoHd1YHLz3cf2JKyO3wmCHRkBH1KOCXhyBm6HFRpJl/OUPAuWd+s/uQPuIOozYwNYWVievWuw+6mzlyDVOIKta6cMNO23r5yzrJuzfBEHa7nJ24assOYOUuYges43x2RKKgIugkCvYDt3rcHG4gtdb1avvPwizsYmzuUzdz7vwiKu3EWCd1W64pashhgGw==
Received: from DUZP191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::13)
 by DU4PR10MB9432.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Thu, 19 Nov
 2026 17:56:14 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::a0) by DUZP191CA0059.outlook.office365.com
 (2603:10a6:10:4fa::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.11 via Frontend Transport; Thu,
 19 Nov 2026 17:56:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 17:56:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 19 Nov
 2026 18:56:59 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 19 Nov
 2026 18:56:13 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: st: add PSCI idle state to STM32MP25 CPU domains
Date: Thu, 19 Nov 2026 18:55:45 +0100
Message-ID: <20261119185544.v2.1.Ia5e0774883d237f5825b7090962b454294922558@changeid>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DU4PR10MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5290a7-c295-4344-7c33-08df46666721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|261009223027099003|13003099007|11063799006|56012099006|261021121427099003|261028144727099003|261021123027099003|261102123227099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|44046007;
X-Microsoft-Antispam-Message-Info:
	QqxnKQrukIR2f/O87PwZl+FmRzfmq6/JXXNyX8dQ2W4srMYDQZT5SjQPNVxyhiEVKr+wk2hOfbnyep/Mqn3SVaThQLjNTr75kb0tojDefUKZy09CAqmWfd3XNGGGhW2hWTXj0TVkVHWEcLKWVT/mTJGQM7xU4mCJsLiZ2GTqn7J18tELzDf13TWphYx4BOKBUHJI3PniAsPJm0b13a11p3FtVLmnDc1e64OnWGgXklmyrM5yZMsil3J9xn52BZT+tqA4opjpkwuAk8h1Z4JQwhpftbLNUhBN6GKFzC+2lmiAbEyfBQla+vgffW43ywyOmMPXMWGh1KnUwji3QOZ4md6rGRpTgNGzw4XaqqHLB2oXbko19cap5Y6kCHgTMGy7o9Ml1z9UEIo1Z6eZFXtgiKIYu6eWhvmUrpfePNfuQ/6Kc+Yp721ZEbmlLjTxHvMlp/rYW1L4WJRwbfDjDcjmlOqz+6/6QNB11s9kwn0aMSrtlWeyNktvHDma1T/z/iua3D1NCsI6qWYIGzunwsThBnRKUTP++ODd077vRwjFQezTBsBRUwuc8cLB/2nYIXLbb2gzaKJ4P/fucnk05PprPzstbMxrCZz0yuYuqW+VYyxmVqA09jv6xb7PRtpQovDA7OftYBpMzpx0g6hfDdDgjB7BvLYzajbe4uo9cdeJLuPRVpmOUYAdPpgMpzCFAKykRWwDa6dAjVugS4CkDJdNZA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(261009223027099003)(13003099007)(11063799006)(56012099006)(261021121427099003)(261028144727099003)(261021123027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(44046007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4AqUMoenRv0YYOL+o3rcOeZdHf9br/BsetxZ4Fu8hUEGqdE+lZwImlLeyIwrDs2HrP29dvKfVZCtm3z6Ibsf0/mTQZ3LUgfdDdnc9cwsOrmlRo6CwYUUnizkmF8GqLDv7WP0r1OaGDiIp8G8KqZ92gVdJaclQ7r/qYJ7+th3HBb/TPUQOeRj+9pfA1WHP/Eu+wjydTVfrMHEbV10UrUfcbLAPlZxHBR3U5Gwt0g43t8qV/nLofe2MY3aRjoHg5iKxYcinOL5Wzudl27k6Y4tTLNQM+Yn4uQjB8cHNvWUbIu40bGHKdh+JsBjBIKv1ukAgpxiHL4OzAEnTVUhYQpVEV5otuHGRwil+Fj38t46uiRjXAHFC13JPPhnf9EDJU6CHWq9tixzz/O3WBORcra1dyWGwoP6xJXk5DFwIRcjdpD+bpnoYNTNHDEQsWbluLOk
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:56:13.9672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5290a7-c295-4344-7c33-08df46666721
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9432

Define a PSCI CPU suspend state and reference it from both STM32MP25
CPU power domains.

In OSI mode, PSCI power domains are initialized as off. The idle-state
allows the CPU power-domain governor to manage them, avoiding probe
stalls for devices that depend on the cluster power domain, including
SDMMC1.

Fixes: 9c8d852dabbd ("arm64: dts: st: add power domain on stm32mp25")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Hi,

On kernel v7.4-rc1 and with TF-A BL31 compiled with the PSCI OSI support
the boot of STM32MP25 boards failed because
1/ the domain are OFF by default since commit 6d3080bfe007 ("cpuidle:
   psci: Initialize the PM domains in powered off state for OSI")
2/ the SDMMC1 uses the PSCI domain cluster since commit 4f454e51290d0
   ("arm64: dts: st: add power-domains to sdmmc1 on stm32mp251").

In the trace we have:

[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.5
[    0.000000] psci: OSI mode supported.
[    0.000000] Zone ranges:
.....
[    0.242188] CPUidle PSCI: Initialized CPU PM domain topology using OSI mode
.....
[    1.604962] PM: genpd: Disabling unused power domains
...
[   11.833535] platform 40130000.i2c: deferred probe pending: (reason unknown)
[   11.834888] amba 48220000.mmc: deferred probe pending: (reason unknown)
[   11.841607] genpd_provider power-domain-cluster: sync_state() pending due to 40500000.ommanager

When I remove the power-domain in SDMMC node, I can check the
genpd state and all the PSCI are OFF:

# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children        performance
   /device                         runtime status                  managed by
------------------------------------------------------------------------------
power-domain-cpu1               off-0                           0
power-domain-retention          off-0                           0
                                               power-domain-cluster
power-domain-cluster            off-0                           0
                                               power-domain-cpu0, power-domain-cpu1
power-domain-cpu0               off-0                           0


I can confirm that without the PSCI power domain commit 6d3080bfe007
("cpuidle: psci: Initialize the PM domains in powered off state for
OSI"), I come back to previous behavior:

cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children        performance
    /device                         runtime status                  managed by
------------------------------------------------------------------------------
power-domain-cpu1               off-0                           0
power-domain-retention          on                              0
                                                power-domain-cluster
power-domain-cluster            on                              0
                                                power-domain-cpu0, power-domain-cpu1
    40130000.i2c                    suspended                   0           SW
    48030000.dcmipp                 suspended                   0           SW
power-domain-cpu0               off-0

The proposed patch is the simplest solution to allow boot of STM32MP25
with kernel v7.4-rc1 and before upstream of D1 power-domain and full
PSCI OSI support.

V2 of patch [1]

[1] [PATCH] arm64: dts: st: add PSCI idle state to STM32MP25 CPU domains
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261104102837.1.Ia5e0774883d237f5825b7090962b454294922558@changeid/
https://lore.kernel.org/all/20261104102837.1.Ia5e0774883d237f5825b7090962b454294922558@changeid/

Regards

Patrick

Changes in v2:
- Add "Fixes", requested by Amelie Delaunay

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp253.dtsi |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..bf1542818be2 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -25,6 +25,19 @@ cpu0: cpu@0 {
 			power-domains = <&CPU_PD0>;
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
@@ -145,6 +158,7 @@ psci {
 
 		CPU_PD0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&CLUSTER_PD>;
 		};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index 7e82f01fdc10..19b3e55a4414 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -26,6 +26,7 @@ arm-pmu {
 	psci {
 		CPU_PD1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&CLUSTER_PD>;
 		};
 	};
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
branch: master

-- 
2.43.0

