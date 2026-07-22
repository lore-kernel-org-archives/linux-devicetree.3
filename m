Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7132546F4B9;
	Wed, 22 Jul 2026 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711800; cv=fail; b=hTfI8vG/GVyEgjq/tMYzWy2B3MP0q1WwSCiiXYgpw9kF6U/UF8HECL1WeU8RSck4PaDtSM8tOZVYRVi4GyIx0vTbn+QHrS0z+BlHC20pmmK9JEaTH9dIuby7Mm14jt7v97NCPhuhTV5vdbqlPX8IkHAlutsqVjsWnbqJhYJQgTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711800; c=relaxed/simple;
	bh=7iVn78T9qu0MnlZUgLG0eA1nph0Mmd1JtLgSr6xwqSg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=NwfP1oOKUtuOZLhzZdCWO40u9NeMqHnx/IsyhhOjXC+OkzO8+AN4PCnAW8i7uq2H6TKRk9ay02dhOZFHM7zcmIxLqUaU8D2FYhpy8tjJ4/jSVqns02OxLnkjWo9RqZaIg8GESI7eq9Bmn9cubalwfNCUczbZv8x1SxFYUFXb3uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=J58orIdF; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="J58orIdF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Km1iSlINTJrGJ6TSNQx8VbqzFhaGwnfpyLVKPyRV6idbXPOUjH+mlmgu2yaVPQ4gvz1KBS9C2NbwhaaVCqoWgOnSQBL4kjYTrf5CFEJRrptS+8sCB/TW4Mv+tUTYSlvPDCviEsjdpYUc5X/CeEeOfOp0CnDJslczxl528D/1oqxCVZ8EvkbZ7dDteH2Hk/GJpa1c7h475cOB+l5x9Gq/VS14UsDuMifIsBVPiWlvTVBQeTE6KQomPESniwzcihG7S9H2jZs99Bp/qv+XCQeBFa7ooIVsuWFDAv35VnpiHEl3kBZoA7B+A0neA2b8N+ZnYUjh+MkHtCSSLdTGGggfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8E+3NYRD/NQ2XPsHmLF1es05Sp8YwLzYc2tUT0iNwY=;
 b=HWpMXuewrZFd3PXi/5oTQ0EhS15dKRn/fMj0Y2TdJ6lzLFtFfkV/BGkw6kaJMz4vsgVnLPXsm+n8DlaSRu2qAFfnFdP8YPaSmzgt7ZG/mj6qnterF1cCbCYqG+o4ufuZLgFCSlRtcGMbN0HoZRdsN6G1ArzXPrbY/ikpRMVJxuHB8D2B1X7FUsUq7P51P17w6jAmHAmHS1qvKkcNgPrQFH4OcWGfvNmuGW0MI9Ua/V27kG4ZgKarWtuij50H6mjz85Cs1fquKfDcMGAlKBnuvApTStWJ+K62lP6z2m/WWzlwr6ZPzzjWEPE7jveYkazP98mTurd+OYVf5vHma8uuWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8E+3NYRD/NQ2XPsHmLF1es05Sp8YwLzYc2tUT0iNwY=;
 b=J58orIdFoIjQiH4uo7WYb62c7iqpW0lma7mv160tnvuS2kgQ6APZCcx5CUDRehf9vrn2ykdeQJZYSNjt5yhLEh87cYMbIc0sSoOcQqHzakmlLJrwUk96uqyOyqcHeDn1y7NPytJzWpNw5ymMVatnIaXj1cK7fAzGjNj+Iqk6ZkDrwXTlqa2BxXfYVr/pct67PlXVOMJpCZCfLtnUgQkT8/uWRY2Nct4QXeGsEurAmmmkPwf4rOtdElkQ6lkCoeAR2rD954zWXvwN6fqDWJa52mnqyx9T5KvodOJi+W6WUYC89LWATlOAyYo0AnIF0B1WGZp3h787s3D+sQEq28Uz+w==
Received: from DUZPR01CA0274.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::13) by PAXPR10MB5326.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:28a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:16:28 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::64) by DUZPR01CA0274.outlook.office365.com
 (2603:10a6:10:4b9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:16:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 09:16:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:21:03 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:16:25 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/6] ARM: dts: stm32: enabling of SPI DMA/MDMA chaining on
 stm32mp13/mp15
Date: Wed, 22 Jul 2026 11:16:10 +0200
Message-ID: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFqKYGoC/yXMTQqDMBBA4avIrBuIo8biVYqEmEzbEfwhkxZBv
 LupXX6L93YQikwCXbFDpC8LL3NGeSvAv938IsUhG1Cj0S2WSla2Lk5W0lShDUl50+hwd1WoDUL
 O1khP3q7lo/9bPsNIPv0+cBwn4EQRq3QAAAA=
X-Change-ID: 20260721-spi_arm_stm32_dt-c650d8a3d462
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<clegoffic@baylibre.com>, Alain Volmat <alain.volmat@foss.st.com>,
	=?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, "Valentin
 Caron" <valentin.caron@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|PAXPR10MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3a67d9-02cf-4907-f260-08dee7d1e94c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BWdlNscxqtrAeGX6WMF40OWmNhaxkIUz9cZYl3PhBWHEzICalzKlnqVuAv+x/Uf6JUub7++ARaAX151mu/A489cmV2ZYVkB7bTXYCmiSRyEKsPZP9uxmOMPcdToJmDDRUo2HIOgY7H7p3ci0hYl4OnVBmjMm45FP7Na2Fs5Wf5dLfDSrFzoM4p3OnVJufahObZ8fPa4Oz8zwJKSkd+ysF8c/xbNqrvMnC3w7UghKxQ9Moy3lKxLCwU5MYXMrof5yR5ypNhboO+Ca3NL07SDgXhlWFLIxjUlRR+Tb8+jzhhpsFsV6pPQjqj8zebcPAsPgPeiVWZq07UZt7xc20pAP4IAJfNFYhbhLhiZMarMSubZlg3Iv1AzimmUrbtZmMwfCY/MAUTSMyFL7HKgnn9Z0tPaxvo1YFimF4HImPc7V377/IB9JM0oJZO8SR54oSrasFMfiUVJ3bb6vIWm7oQgdLTr8mPiOsFiPIeBR5l8Cg0sO1YWr48sNLELs3h3uBtx3mQ7WZHC3sQhuGJC9N3aPVNsc2dNXd1pmpACqV+wI/DImDtwP/K3QIUJINFPzmUGpxr/f4QoF2upHc3ZmXW2eH5IaPVgOsf0CPgY4jaMr5ElQ4ZL9Hu8PQlu9sM1+k+oYJ1VJ55IlkY5s2jKU9y3fBeB1W75dFdy5ZGMk+BJILRzG1/pKDPLrAeOSWZpbLxxMo5cD+cfuNhQAm60B/VzQWQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7QjR3KU9vHDsXxhY7eYwlb065K5NuQQV3j8vdqE14tRciejyI+iOf805Hg6HHHONIiyi9wTvqBUp9cUBdXTOdefY69k4EtiPHS9dUWCZRJD+f4+Aa9oP6HlvGw7OPWnMxeH1Zgt54BKM7Aitf6xUkMx9CCeQBUuQ+W27RJ7JoUFIuwouo+KkvdWP9+tEf2Bywmwcte3zMf/29Z4zVMVfzjr/ohEnERgCSXvI6aWTvTXcvs+ajpwI+ZzbgMOJ0M/L984LWgL+4pnUFbK6vjGyUBnmKZHxp7jS69G4J3fdp5K7gxecsz5WHio2ZKEb0HEpVOLMVFx+qH7GvxG4XtQWtXEIoneGAS1tm1AnxfMHt/Dsap8KiIpnsZhtOucIU9QYDQYkFWAbef/VaufW/424tBO2B4xQ340UoGtTjLaeNg0la45onA/Mr2d/xX+AJXdB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:16:28.0342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3a67d9-02cf-4907-f260-08dee7d1e94c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5326

This series provides updates in the stm32mp15xx and stm32mp13xx
device-tree nodes in order to enable the STM32 SPI DMA/MDMA chaining.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (2):
      ARM: dts: stm32: Use DMA FIFO mode for all spi in stm32mp151
      ARM: dts: stm32: Add disabled spi4 and spi5 in stm32mp15xx-dkx

Clément Le Goffic (3):
      ARM: dts: stm32: add sram[123] nodes on stm32mp131
      ARM: dts: stm32: add sram pool to spi4 for DMA-MDMA chaining on MP15 DK
      ARM: dts: stm32: add sram pool to spi5 for DMA-MDMA chaining on MP13 DK

Valentin Caron (1):
      ARM: dts: stm32: add pins for spi4 and spi5 in stm32mp15-pinctrl

 arch/arm/boot/dts/st/stm32mp131.dtsi        | 24 ++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts     | 12 ++++++++++
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 34 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi        | 20 ++++++++---------
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi   | 26 ++++++++++++++++++++++
 5 files changed, 106 insertions(+), 10 deletions(-)
---
base-commit: fba4a31a7f3b6b29b01c83180f83e7ed4c398738
change-id: 20260721-spi_arm_stm32_dt-c650d8a3d462

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>

