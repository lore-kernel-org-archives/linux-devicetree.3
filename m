Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F14391855;
	Fri, 12 Jun 2026 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268982; cv=fail; b=anhS5Syl93OzLPFzV6AcoPANVo0V8qWJbo9HwdSM0SZlYHCSECjPO5OoNQRlpGjD2I9jSeGnJ+MFR1/NFq4Z9WADn2qGR8ng0zrhCrNwCxgaQPFyP0paZgp1mcKfNEOFKU3hEQv3Sq5rVgHJdEqcjz6UbF75UYvDBAgGCpRaa9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268982; c=relaxed/simple;
	bh=mZSvvBho9ZUnYfbVs0lQuQtvi1v7GVnXs/9eBO6JEDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Oz88PcrdathQf9FrQTslVC4/sLAw0yFIY0pXzApY9jAh97wakS3+fA0S20zj7POIAGd6F8+EQPNFwzOw0cxYbkSVFkm7hf+EPMHSmRV40GlmR80cA0b6hkyygNht/NQ7/ZLlLop/Wuk6xQBNNhdmWlhuHSFbQRjAwDioCmKc0j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fpmJTlyL; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fpmJTlyL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhrHHIug05Tv3Y3F2X5Ru+sIHjQN+eJipQ4DCcmFiFYF25EPUNurAeJ7LBfgRUC6/VSoQe06oqFtvccWnfc4Nw2X3wW20Bn5Bxc6f9WNW2nzXvlzhd5VaIjj8H48iXpTSXpb1+HSnzDXlef8Mi8l77wuo6nU9s1gVRah8uOXWWlzVpj/2DRfCj9cWfsAlK4f5Yepeps00HCC7HT7630olEPpFYrsAN5S8PItjtPeyWLCyQ8spstzzSLM/umspJzIDzHxkYZhdt9xvs30kiGDv5Kl2+eWXQ0VBPbzaTF/VL8lL6GR9sqpjqZJeWpB9GXlezTmrhd+xMZW3D6L3DDDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=X19xc3xJumCTstes4gxr3XcXLtSpPFoR6Ofb4/RuJGWIKQ1d086YcwY+jANbYhtsHJUsEZRtaM2JD2ofeI+0c8oHBKs60YxjvySYl9T0LNTQNg357KqDb41O7W7cwxBFWjQ/RxvTvV6j5d4uAxseLF4iWaJ7OvgTdyaPAP5SghWv/sm5SJ5PhbavqEbec9dgaaI5pKZXEOjHH/lQUWW4yMIZYn7herwcsC/M+6q+d72L6QfHcfqkrlJ17xNFZQ7Y3rvalzEzMX+NejkJ0APNfyYwnGaPZEl6Q6ef3ZQrwKBpDuU/77RVu5gvTSASgiwL2shEZOI8ur4u+T9bMJuyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=fpmJTlyLgm0tKePZQpIg5aiNPm131SXN0slSwTC4GWSCVMvad5ikanZ2gbabKjVv72ONMRudJUKVShQIpH1KfX+uMk0sPOAhDWKbk6s1aboLEhvqAhPxADsUEkTLkEdJO5CUG7v76TwtGq2Jj0kK4+0TKK1kzMTCZXL+wDY8u9f+AhLRrSoZl/ho5713AA/n9avdqAX/My+hPJydbXf+S69jzo3MPKX/gzFvygKRLJkeYOsktQngt12WTpuSCm29qQzeqpIaBBFeLin0w7pSCA/H3BxCNBp+2ensSy/J/Gym8IZFIJV+YxcLZ0JVvz61h2QcLBID+qPnSU4a5Lf2wg==
Received: from DU2PR04CA0279.eurprd04.prod.outlook.com (2603:10a6:10:28c::14)
 by VI1PR10MB3744.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:56:16 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::24) by DU2PR04CA0279.outlook.office365.com
 (2603:10a6:10:28c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Fri,
 12 Jun 2026 12:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:30 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:15 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:05 +0200
Subject: [PATCH v2 4/5] ARM: dts: stm32: reorder cs_cti_trace node in
 stm32mp157c-ev1.dts
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260612-node_reordering-v2-4-f68032ca3088@foss.st.com>
References: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
In-Reply-To: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|VI1PR10MB3744:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff3f890-017b-4ef3-4bbb-08dec881fd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0BbMJeUxFRpsZjBvbbOt2KgRkdJ1m2sUavuKzEeoy8Crt6oAR/V6txU9+yZPGoFMXtU3PCqGwFt/tZaUezv1qOr80fKsSaXWFqN+/jtFfKv0sYHWhzfhyChyjX3sciaGmZpwez4m7aHtaNYq/0RmdZjLJKQ0EWEn39reudfQK1vBAkIbMBO5EYyNxfAxMeG57CbtE0Ouu+8DlflAEwczc4/732uoHrkYFO4sXgH8pnMn8nmlgA8ocD8uZiZljhMPw9ck4rBW13TFD+ssJyYSAcTsaCQBLCPjyI7krQfvZdcH/36/4P39yvnLdaY0NeXkjsZ24UG6SfMVijJDN9T0YGcuYkzWyZ3e0qWyR3eT/SoqFiANvjwhcPBAp+0AGzoXjD0hUJ8QbqOLFRrNcmy+zkfEjwVtGNwVD1xnZdSU5Anvonx+gjxoGwhT1EYTEJsBZT9UbcBwmGemHPeyL25erMLRc+IgUYDRSZJ3rWJkZYZIEWDiUHsWPM2qguojoJXnfehiBsEUzvmiN2fwZ3c3pKvJISWl9oV8U1n4VY+eqH1KxS3ZKcEL0itNDH6GhF5qi70DRxDHJoYCSICUrQ+5rsRHqeZEeGTe+IR2e8CIFnu+PFW8vjVFhLouNSPJpjls5w9NMSus9p5c5ERi4HH8B8YvOH6kBJ7gSJEUeWpABOVyYgN8g5+QkgNuBIIdekSikLR4AcpmOA4XPLWL+hY+57JY09lpTrZswYWLvU/X/Ww=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lbri+Jr/Zaa1eTak2YrxxTnXHtu4lOWr3wbglCq5/WTjzVXy1Fb67xI9qGL3TFsvn+ptq5VoW8VLMJSw+Hp5G52F7GUQPH9IUZ28W3ZIp6Fyb7+INzqA1O+Fl9Aq3qWBrpDntBmo/LpRLVPKyRRpw9rGK2L+9m9J61PoSbj7PFurzfz1Lood+pyHXLkHsBF/KDuaumOSGDDOis2guzxxaHWqwq/R52SiYl828myqgUZ/jJGJKxOumndtFZrpFZt3TSXTXpmapeMGaUKeWJVmyfMaTSSj9g4GzF9Hibl7yy3j+rR5yOmC8y1Fk9j4vRnr2EAntNZpZJMOe6Z5U8wPmiO+3tdZAPxX6OnNNfflpE0FAE8dA3mRRxeBVEYji68iygjjTFyjOqPMmAdX0gp44QrDq1VE4NslcH7Pi5XAi26S75myMXpOCPejw7czQIxJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:15.8927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff3f890-017b-4ef3-4bbb-08dec881fd5a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3744

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when Coresight support was added.

Move cs_cti_trace to the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 0e65a1862eb5..eaab09e1755f 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,15 +81,15 @@ &cec {
 	status = "okay";
 };
 
-&cs_cti_trace {
+&cs_cti_cpu0 {
 	status = "okay";
 };
 
-&cs_cti_cpu0 {
+&cs_cti_cpu1 {
 	status = "okay";
 };
 
-&cs_cti_cpu1 {
+&cs_cti_trace {
 	status = "okay";
 };
 

-- 
2.43.0

