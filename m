Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE7F3CEB85;
	Fri, 20 Mar 2026 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041871; cv=fail; b=Yo8kYg3LnEEeyfeeVmy9MUZATjsshqlLQ/CftQHLKgWm937Vyn4cKYxMFzqsq6djF0nyHSqk/UDgDoV4TLcA5TtaDe3ltmYKMDNHxInLp6V5WZXjrvuegRLdJxSTZHs6IkBwNMPVEl+FOLqL05g4MlpshwSTYXYvoDH6cwkTJC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041871; c=relaxed/simple;
	bh=1J96vP2FXpOJYrhuXb+XRoR3Yf8qGYKJe7NBpVbP5gc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tp1GF3gIavbMB16mH7FgDa/GXcAlCJ643EyLO/0LMc6WXip2sOOqgAIE3VNJ8CQe3C+b8d7v+JjRHQI1lPmIwIyFL2pdlg7ySniK44uDGmj5x8X19nn4nNj+JXuHTaSBtcfDnXeS5Y3kP+MY73PkrFg+75bq+dJdAAEpONYiVWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=fJrT269l; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="fJrT269l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/vuOFIsHcPwLXmS1NGuJAlM5zMjyDRdS3Wd/9XkbaKX3jZDBSHGMemNmH3CIpdf7ihx4b+wJHXQb3nGB5ks2K2NYslT73UYlLawA558HBnm6YbF93y+PR+cFh3gqIG3lqLkFnKyropS5Pb7Tpya37sUPZSbJFk2hAM3AvGAkAmOybr3dSR7xco1Cs5oglJvNruFkUziAdz+tQWFqtzyFCcWU6wB5IoFtgx3gWzMEJHBljBEj44ucRvBuimAp503poomhytNehVz4X/r65Sqg+70ser3n+HNX4GBxd5i6eY24qM03WVGZKI1q5gv0l/o/BomsfmPdm4FF+7qXUaaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfHSUF4wl+C6LBp3abm/D5GtZrb/+lTNNlXqgPh4ZIg=;
 b=ixgi6iFnu4Mnp6SNdKAb/pvRucu/R4Vz53tcRgA9NTtwv4NklxGX9gEjMa2Cvr9v3QJObzTGu7Et3mg086a4FXpRKL9cjgrRAInlBLpFDh0Y6zXlq+xgkZlX1uKpzQHJFCG1ZnlDJM+LOLAkFMwIP6pMFQ6hea3RTrVr+8IU0FmdFhFImWgbeCvCAK9aL6epQW2Embh98DrbERh3C7sglO278ulgSvVUJstvha4AsoADZYRtqUsfYtERKJ3vGFQ/zNRAkQQOKc6PZ270yeNzkVqxb89JxfeNPoKQqsmDOvskXMaYyL1ZyBkBnooy6QIyGZq8J1Y7yjuH7ByQ2Sh5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfHSUF4wl+C6LBp3abm/D5GtZrb/+lTNNlXqgPh4ZIg=;
 b=fJrT269lxe+XwHseqxtRMuI7h0ryhFuwM2Om6MOLiW/upuvcSmePT5jZ5wcGonNHU2Hf/J58zCyR143vF8J6T3hJH+26YOwow87lUAh8LaFtiDXxWKbEefgcMq3yrmy4J21nWUgjq1jh6IWVwJzbujBt1ALpPdI2Lep693F2lFrlF/6QkShLSYAQFGuWDi+egBvwxgHHl+NF8jDxwcKaHnHvsksD3kSZGEFyKErUltFgg+igKQHIR6zjmAjIr28KyIRvilA8OdUqcFGu4guXH9loG+gvkMp2DoYUGUCE9Jf/UgU4CjLk8gOgTHM1pl9TGHt0KE1VMT7F5vNN1vPs5w==
Received: from AM0P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::12)
 by DU0P195MB2276.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:424::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 21:24:21 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::90) by AM0P190CA0002.outlook.office365.com
 (2603:10a6:208:190::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 21:24:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 21:24:20 +0000
Received: from lws-haller-privat.attlocal.net (172.25.39.212) by
 Postix.phytec.de (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 20 Mar
 2026 22:24:17 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>, Beleswar Padhi <b-padhi@ti.com>
Subject: [PATCH v4 4/5] arm64: dts: ti: k3-j721s2-main: Add DSI1
Date: Fri, 20 Mar 2026 14:23:45 -0700
Message-ID: <20260320212349.420951-5-d.haller@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000192:EE_|DU0P195MB2276:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df9247c-e3d6-4a22-d1d2-08de86c70d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	R0DBk/540PHV+poX+XxfW0UV+3b8UXNb8NxY2tc2EkIFnOR7GWeX9SNe0fMf3omtowAW3iLoVwsrK25qPOZvXi2XkazfQRhJnYnlpUsQOMgAxFBooz6xXnAzZfno51pu41kCTfKNQyRnM7fDBldUYvDnO5WcGOpepZkqbHVF9ciG0JjuEUc17b4m5ndZ5j5WLB2SonuH/Zpo8EWnUD83o7R4PpuFXW57yWRn8sB/HQW9NX+1/JQqklpZSqF6h9eP+zHA5Uz9VsvQAuHdZK1oGNXmZXNaQuxa9Z9Qy/NcbC6C0GHJjayJVe7OEb+z7LoIIm8GHxxQkWlROF2paqeThyaUlkBEY0+bKmB6sAuxZLx5gsy38JrXQmHiwFd9R3mJQkSgOVFw24my/JGW/60PYHr8f543MBNX0mjBICD2J6QnP6DooNoTAp1oUdZJ7ecAGb7YIaDHSCbhFlM9YEW5byVaCJxoXKq6CXdh1aMN2+3hsGJ6HSlLjkTPkV3NnQj2s16Fm+koow8kVFHyIjoOtdbHh26/y0igm5rDmw6l+VgB+bVh78G6maKd+oqfGvJrSHQnxm3ZZP7T+r/PZrfx135r0DKXDLjKmVkKbrYqa52GOfO6mb9lU4mPkUPflpA3YND2uZ7cy4jCZgKfextP/U5NbcvzGYyCDorusQpD/2LDZ2qoPTqBJSz0G75vvwA4vqMbUAmxFyqpYf9xYOCgrJyK0rnsNt4D204hiE+Z8dWl2V5+MrJ0iPVqr9tm7IDCS2q5CJBffNjQZRazIg5ceA==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jxl0RNcRzqjGq8r65Itf6TsgagTVJlIf+WELaRLJOkW96DK7FkYjv21I+NbY6Y40Yp9z5o97XDI8F3T0BZnO4P8nGty//V6KGPjVL5VqTcW3DhYn5ECm5d8C6M58MNrHNSLfCy82zR5r0XQheEabtGyO/xe/wmXkCTTqWNqbuPDsFAvjftllgzn2LKQt6mv4/ZPW+vGIH+fAR5b9ICxwd01oVzloMDFY9YGKSrgveGQKNjMkoQ4aa1SgmBBrFcXT5gKqon6LF/GFi1e3vzwgHNrQo970VGUiGZyfYQ/0t0XP50EFxGLU45wsK8bJHgYOKwhZPZWOM9w3N46madrTYIUEuzW+k2dXw285HVYW64nHFd4Ufn1Sbf3v5jAEqUy4k3wH/C3+px6MIM35r3XJzIU/QBxBCqYsxo6LBhjbNGrZITwmSzi/SHEyy5CW6iBS
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 21:24:20.8700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df9247c-e3d6-4a22-d1d2-08de86c70d12
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2276

Add the second DSI instance and its corresponding phy to the main domain
include file.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 80c51b11ac9f..80a32c451d1b 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1815,6 +1815,19 @@ dphy_tx0: phy@4480000 {
 		status = "disabled";
 	};
 
+	dphy_tx1: phy@4481000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x04481000 0x00 0x00001000>;
+		clocks = <&k3_clks 364 8>, <&k3_clks 364 14>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 364 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 364 14>;
+		assigned-clock-parents = <&k3_clks 364 15>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
 	dsi0: dsi@4800000 {
 		compatible = "ti,j721e-dsi";
 		reg = <0x00 0x04800000 0x00 0x00100000>,
@@ -1841,6 +1854,32 @@ port@1 {
 		};
 	};
 
+	dsi1: dsi@4900000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x04900000 0x00 0x00100000>,
+		      <0x00 0x04720000 0x00 0x00000100>;
+		clocks = <&k3_clks 155 4>, <&k3_clks 155 1>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 155 TI_SCI_PD_EXCLUSIVE>;
+		interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx1>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	dss: dss@4a00000 {
 		compatible = "ti,j721e-dss";
 		reg = <0x00 0x04a00000 0x00 0x10000>, /* common_m */
-- 
2.43.0

