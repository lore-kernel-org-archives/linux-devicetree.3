Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010070.outbound.protection.outlook.com [52.101.84.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B83BB128;
	Thu, 11 Jun 2026 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168306; cv=fail; b=mrCkT43IUcwjbdjh8RGnRB8n+x1+Qiqyqc/kipZ4HvwuqaltxWzCiy7pz/iyfIIsQLFNQXGg5ZKl/b1WK6OzxITWbfbC43P2JbgPa/xM5xUOMG3/KUnlx/zlc4ScEfdLyCKWpJ4J0+fxkUrFlpVy2F825UUMNluRjEGM+PfpLqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168306; c=relaxed/simple;
	bh=wg1ZXzZ2Z+qeYMbGwrBvOsbqsY6gmZ05BF45lQyK4ME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=R/IId8etAXYTF4Vljnw244PesiM8otWtbZCODAVphPc9yAuey0bvcy6rqrCcaN+9/ehMlP31HGiuE8DAynPc+A5t34UDcmvJRWldUX71k4/zKFC39MmVUHrEfmT6msdTnoB+fvX6yR2CgbD4t3cJxzmh1nzJC/OUF4QDDE29kyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gibtKXlO; arc=fail smtp.client-ip=52.101.84.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gibtKXlO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+a5nFnSiUpnbwN7Eg+I9wLHreIt205vV17+phnVpqdCy3nA2lAAmr7eBjLBeOaepqdP5hjhW0mUMx77iB5qIFw2LqVXnkAgL+wa1YMZ4MRpdE28VnAASGUbTxXlxPxgkybyPgwytuYLrbUrd/X8iSfvbuxF788Y732+MQdGBNrkSr7jbyHYCMumEFl/zust4rhy1PxahjGO1RsAI1dtYZv+RPo1do6I8+YSKSgq+YRqnCY4gXOjF4q/hcuKqwyci3hYsPwusYyEVrugvMrADduBpnEOKRY/plPPJ++rX1jKx17azW7RY0mxraCIG0knfbH1JoLY7hfj+27Oeb1pXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8AIGBBD/cubOyS+IX0zvNZrh1ykNtlwrQERuYNfoXc=;
 b=vRIb3SRWTtjWwk3DEcDCH4F9MJhqcPwfhuLz8tufBhHKdbMcy9/0yX3lMtKtu/0rJaQiIqrroqJf0NnocDJtpDsaQCGwwCN+TMqfq+kR0VEFwY1/++KsF5gsD4BIA2dGPVCwIy3lokL0vTg2D7HYP0xa3k92U5n0mUD45DijBqwZI0iYmnj7b9Ns9QJJJboWx9kihVOYVTQfbz2MiscI1Ldd636vZv6OP4BxBKLyWc+qNxpEp5IwSakpcAVMWsabUoXArPazNkgX8Vz5tGrYVjQMTyAc211DKBbAEA6QU2uSabqFtB87o8Vu2wa8GSTLzjVpEWdqjDE0VTc6t1YQZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8AIGBBD/cubOyS+IX0zvNZrh1ykNtlwrQERuYNfoXc=;
 b=gibtKXlOGcWkM4zZmnUcqEe2lJzOYZXoGok0c24V4hj5tUZ2pTtwBggTpjeDjW3JwhW32YnMMasKNdHpuRaAhiclK13jrislMpQToikDnNUXcrpPMvntgYuCbTquiJHjYy0L3pbjNjzFYyiQPCqNZ9BulJ18LD/Mzt5y9D4RFl1lP2jGjCRtDC+CwcIRj0URz8UizglYqen0TOM356lJ42kbtPwZvszlfMz8Zbm7//5JsgXjsjwJiudlusMGpSrJQKqXblUUH1DBdN00KFCOD50CKS+iddVvm5PqJIS0N+Da1nyERBQsNkJkuGq4b479wDwa8mAVzFgk0voR/sgf2A==
Received: from DU7P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::6) by
 FRWPR10MB9289.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:177::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.13; Thu, 11 Jun 2026 08:58:20 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::51) by DU7P250CA0022.outlook.office365.com
 (2603:10a6:10:54f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 08:58:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:58:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 11:02:33 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 10:58:19 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 11 Jun 2026 10:58:16 +0200
Subject: [PATCH 2/5] ARM: dts: stm32: reorder cs_cti_trace node in
 stm32mp135f-dk.dts
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260611-node_reordering-v1-2-7e519f2cb456@foss.st.com>
References: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
In-Reply-To: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|FRWPR10MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2536b0-136e-49b6-7b3d-08dec79795c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	H+3NfCwkRlEnFGo2ErAFuDGsrrdAuKajde28sTIN4hGURneXjshTlGI9zlZ7d4WsKa0XiJjCXPjd6e5hxyDH0o0neVYYk9QaH4VP7iK73aptYXAZYE742mDzqqDAaMY9SOQwCTy/Ms37Y2LuoKJJV8k10b1AEr7wySwiZbI850guKLTFdupwLJLPaUvVWxMU3lTjtaUhIwn6Pxjerg438gR/fwPiRZ3wro1gfzd1GvAzOE9FTEcrC4k1c1tWSiosZM4ann2f+lAF1GRj1do9NzMKBrIAn/yHmle/cew7VFIP9VsQmr/ZcMxA+iHBfdrJ/8UKVd6m0GIH/1DJdLyPrXeANbYvNCo14boxLIwFxgAWebZVNZSZi/k8eupM3S3PGp4wmZJFSuSsPjuI4TStHuPyCIEYeoNA/VrcH0D4oBZEzPecsZQiACwOBtAjqn2WmopIHdtaYfiUWHel1W+fU9tAv7bU8dzVHi5Ek/2GUet1ZUKOwejXPyhovMALdzBjIjQ5kN1RFoUr2Qr7Agk0ptb17QcTrg+3EbD9s3OnKPDZmTomdRit9pa9sfQa7t6kH/wmvL2R6Vh6WlTD8QbN8TW1y5e07YQpCYLs35wxqBUv4LlXiRRFZBkqItcgMD2cC8DeU/RVjzm9vMhdK0mqY5f/9yoip5EwUjNBnkK3ZGVoOT4YfVOvcLKMyO32RBOmcTh2jLFAyjNDRA0hikhcjvUyQSg/hP/nigbAmNHqm/U=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YMxixd6ETSvDgmVj8T+m3Nk7Wc9yg2GfCjxAqOkbDTLQ2TMAI4xIN23tJuu5ayHE0Fqs/yLo7w2iadzuC2JbBRhs4YbCYUuoOVacaFE6Kc9SisEQhL59uEEzasJGEeikVnESfjyzfKi+w7H+LlD7ZvoHmjOInJifeU5EJpiWh/KPhVvSP/YB7CrJJLEHDFH8X8Yq9Jvxizzo7m3OJd0YRUD8IfGWi5Oc6Vh5RGWs/D5v+FoBuGjJ6OAYKTefI57gk2YFXhZjR2RRouFNKXwOO31P7blAIe/3wSSf9wbP1/rFuAlM8m/Oiim7vjTDxVx1CKt+qfXN3+hwT2ETykHN5BXLpTMcJFV0LyrtA90p6Hr7ZtQGW3Py6oArfCTDgJJk0FgWEE/mBtB+FwFHb0DNn16a/9k8Uxnf734Av6YUcZUsV+7xlDdNPHOhwPlgXlQR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:58:19.8831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2536b0-136e-49b6-7b3d-08dec79795c7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9289

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when Coresight support was added.

Move cs_cti_trace to the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..bc3050a9bec5 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -190,11 +190,11 @@ &cryp {
 	status = "okay";
 };
 
-&cs_cti_trace {
+&cs_cti_cpu0 {
 	status = "okay";
 };
 
-&cs_cti_cpu0 {
+&cs_cti_trace {
 	status = "okay";
 };
 

-- 
2.43.0

