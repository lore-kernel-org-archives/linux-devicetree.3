Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF92EEE88;
	Thu, 13 Aug 2026 10:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616623; cv=fail; b=Vvgl52WNEdpQNTrsR1teVhV8hVRunyjvdEnLyJrWwibr3QQILrAwFYkoXGdQ8ym050al4Cl/jGA8vyvCwvK3dVVzEp/+x4k63JtuoLx8CiDEApIuhDrrMt7G6Vu9OIBgY8yc0mbKxMlkzI2oeFxlWgEETZRX3OnH0LyiI9bR/ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616623; c=relaxed/simple;
	bh=Egx295cva7Zmd6wvngjlTEaB1tN+xl0CU1NRTmSJlq0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lntEDjnUTDYMZrgDc2Jij6et9zqhoZYly/hOdHDCfsVTvAwljeSHRN+UkLsoxU/+ioXYM4MxF0bY07XCHwwvlWzJNLbiY68ZLOMtC0GlpeOIBth/hQeu7jyUnozBKoZ9899VfNXYn3jo6/U/uOH4chflbwU+m/8DO/5dqGnRhGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JqiKP+7S; arc=fail smtp.client-ip=40.93.196.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JqiKP+7S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7tlT+n4R7NGL1HMC0fMt8QoFTjBPIlkzcf8g1dOb99hXUldOziJkXoVnVkKA0qnO0sw2ZfQDPgYZc87n264gQj1lZnY4c0fKyRHnPyabttV5e+ZmrB1GqJJqj+JgrVAeb5nCh5U6ydnYRRlKKVVLY1N2g3DsykjADMhuvC0zOfMTlGFhb7AfwjwPi5JVGTKoEwTcbxU9kLUe/ciHhoQRVFdLDTx7OAROtjfRm26zfJLzMAVSGOYBO4apa4+U6zM3VXnnOtd6NdiBdgwM/y25Z6YrongHVMKANdGU9P5VVuuifEwXjb8M5O9/7uIGuWblJkceWGnssOhWg7uAz8Jqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04cXYLRJ4kD0BXV+N19EfarZadNTZMNe2eQxiQ5cnkE=;
 b=V0w4Aechgqo2mrRDOnt9NvvvsA2JKft5u2sjI1IuIp3iuDkGP1ilSrI1rH1BX4qS5bntZO0Utvd7tmMp5SJlZDE0o92Y6oa9NX6R1YSfgUlVnZV5bNHK4DHFYjdkTHzcTi6nVunzCefyqIc3O+WtMjSoiuP2kPr/RJPtXYvTy5wmlmnFIY5UjzDSTHyDV2l159eRyoZ7+KOL8j86vQIy+9AeLUeTK6MXh+3TuVJxFbv33MrCRKoSNANSF2bQ2e0IIqWmnDhKon+miGNkLmW1PRTFIa91abveQG+JYgJ+7UqufZ/mJ5aSjFkWH5hL5WU+2EkT4l54ykn4ppw4A0hJTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04cXYLRJ4kD0BXV+N19EfarZadNTZMNe2eQxiQ5cnkE=;
 b=JqiKP+7SvRsVlE33s45yD+JaMIx8ScelOkwr+OrQCymiKiUotWr/qHk6jE+SP0R1QaFPhSXkLKoHJFW5QpePwbZjCnDkLwAfaKisD0YClbyZkwkQqodjgaDzmrZB0iYuslv8ZGqtWVBEX5SxOaQDd/MERxZPoyoNS7DeX7hoYVfWM9UEMtWIE4DG1H1cogbwdreRC1/hYYsDhWanduRbEeSymczQ0U9BfWyjMhEc8lH2QC10zjgzZxzGgOjSVNG8xbM2GfnzGym5oU8U+nPIy2iO6D+0e5jlwiYaCcPwj67YO8eVmcgKb/S26uAKLIrItE/mnDVr6fBo1j9ozIjlyA==
Received: from CH0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::18)
 by DS4PR12MB9636.namprd12.prod.outlook.com (2603:10b6:8:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 10:23:29 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::7b) by CH0P220CA0012.outlook.office365.com
 (2603:10b6:610:ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 10:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 10:23:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 13 Aug
 2026 03:23:11 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Aug
 2026 03:23:08 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Jacky Huang
	<jackyhuang@nvidia.com>
Subject: [PATCH 3/8] ARM: dts: aspeed: nvidia: Declare SPI NOR flashes on boards
Date: Thu, 13 Aug 2026 19:22:28 +0900
Message-ID: <20260813102233.3088939-4-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813102233.3088939-1-jackyhuang@nvidia.com>
References: <20260813102233.3088939-1-jackyhuang@nvidia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|DS4PR12MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dc69c8-5082-43ae-6af9-08def924eaac
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
 e+PhBof/eutx2yiMMavwrv1qCXwLWh7ndCYp0/+Y32MG1/6x5OZRV3aBki4cKs5I6pM8N4LKYklr5PieoNZSj8Qo+XBhq9dpw3DkeaDJJEFkplvhcm6k5gavLoH89uRw5BCt88AcERQeEYzkiq7TDm29DkQyeHsbF2XcJ5ZHfI5+ms9t5bAp1M0f0EZ2mGyeoONLvcQFDJw9YUQpA4tIczjgen7rgzN9WI0m8PHpHnB2w9LQbFdfFKQk7uln3gR6IKAcml69PVt05t7EQmmlLRQLzXzBBjHhn7EVCSdPTNcqT2MlgppzprhDfW37BL5lXu6HrZ4GybwYaJRzlN8oX8GRHtniFfA+H6wLcoilSOki/ZMu5Gwe6XQYSAenkoQju7wL4Rzh0RwkvzYnTR40TYlTJcG1n7ZcV0WDXMnb87UU6m7CBlKCqvFFZPuhmYrDSZbMHJk+aeGfT3yb9UFPLER1dBXxPS8FEf+apVrqWyExjeEe5b+hdJY+hVQtlzj8houMjrm8a4yeLwEhS3EHEmIgiBWlQf3UpgK/PqI1HzlWTpgNHr0Pd/zmW380yuhFUtMML3VOm1NYx7ZcwX+WsK7XpGukqNlGbW+5o+bI4YBJFn0M7tsKL6Wa5IkzOWqnUQSgtcefdfJCBUeeddSeDJqJmPOg7j9gK8EK0RARWuGEuqC1QuEtygPHY2pc0fEO5TJxHYHnAT2T7xfwWqmuTw==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 5jr0TR2zo2vCmBE2T4dsBQVZ/udVcLUDoYAQPubLybmVPy2jd6HxZVS2bPVJXAjyAmeoD277l2PV0/LnbjqIZZnmKxTcw0iY9zDyodldQjppLVTD+AE35ezRnjFRQOf8RvfDiV4MeLwz0lAkSZ9qITf42EcEgXXjacx/gxOXx5rsxRN5q/HIA2lqnF3gsvnOWzxqqdYwmvdqTUXz2+nfADXK9kxxZ/yhGtiBK3deXi5lW1bAUTDyu95LibY+1EX7A4ggKcBcrpi7AH5hqtscnPxQtVlg2E4nf/sK34Iz1ejaiRFzJ0hrjSJXWLOSykMik8IsVZy4z/3GrExBzCxMZtm+tMykIEmp1QbxotH3ulmk7l5SgZObIgbGi+wPDlWodGu44YURa7/oAm9Fl+lLa8ZD6FIXoKnD/COde9b3aw1UzF5i1szvsoBtqL0Yz9Gj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:23:28.3237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dc69c8-5082-43ae-6af9-08def924eaac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9636

Declare jedec,spi-nor flash nodes with the properties previously
inherited from aspeed-g6.dtsi stubs. Keep status = "okay" so these
boards stay enabled while the SoC stubs still exist.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 5 +++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts     | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
index 4de38613b0ea..c8788c67ddec 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -145,8 +145,10 @@ &fmc {
 	flash@0 {
 		status = "okay";
 		compatible = "jedec,spi-nor";
+		reg = <0>;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 		partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
@@ -180,9 +182,12 @@ &spi2 {
 
 	// Data SPI is 64MB in size
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		label = "config";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 		partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
index 29f56176e2ca..0228764721bf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
@@ -56,17 +56,22 @@ &fmc {
 
 	flash@0 {
 		compatible = "jedec,spi-nor";
+		reg = <0>;
 		label = "bmc";
 		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 		#include "openbmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
 		compatible = "jedec,spi-nor";
+		reg = <1>;
 		label = "alt-bmc";
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <1>;
 		status = "okay";
+		spi-max-frequency = <50000000>;
 		#include "openbmc-flash-layout-128-alt.dtsi"
 	};
 };
-- 
2.43.0

