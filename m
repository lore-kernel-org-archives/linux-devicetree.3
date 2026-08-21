Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016CA4B8DD8;
	Fri, 21 Aug 2026 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321198; cv=fail; b=LrkEInZTogW0OvDMSAIoBrSa7J43a9Aa8yo+EyVjn7snHHxGyaralYPeoHjqToHtnpoTrczNkv95Qjg78aozOiocPjDFUb1PL7q5ISqf8CSDzP8mEmNE90yBbUfl1ewm+ztNV1/FEzFhOxWpBYiBMPr6crtlkL1xRuY+HmwKm8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321198; c=relaxed/simple;
	bh=uKcD1bR8TAZFBLWLkqdHfcTm5m3UcRvaeCFskQnMN/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CaJA6VRRRA4xRcbKIgDIymOiHYd9OZl53C85tyWTlgW8i99kxJuvrfHQrCQmc1rOihR0VU4OSpx4hm9MSrnedgO6THPvolXMVpSJHGk7w9OP5WUUaP0kfDEgIPXdXUtD+GQ3Vz5sk1fgiLnK7Q/wx6eMk7XT4dFWdr2+xyRQf+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=m0fQ9Szc; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="m0fQ9Szc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1sfXrPjzNM3LjpExT/n4vc7GZn/fRMpUDhfgBGz+VR0PvomSpOYPf1LC/ep0JCnk30cNsISigPL0AxHCFwSU5uDwrdvrYufKE/kD0gPOrRY3zxoCtHbuWIDbYHP0WoonzQPbEER+9ruvu7MwIDNHF9eGy2AqIfVNGTI2UoO1nAgbb9cCFq3LJz9QmwUAMGjkz24Q6QI9veaYBhYe4MoKvd3Lc7fEVr0m9J1HN2jf98NZ37Dq4Lhfsx98HCcE6UW3oNVcUVAAZmzq8hzQoO9Q03ajIkm9DOOIjA9K+p1drok4p4EFsh0IU/mIFLx++jTASG6W3ZLq3qdBzZw40608w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeUieuDcnzCh6QGnflgI1ey712YajYKz0Q5pu+TC1mw=;
 b=atvdEwIJ/GYl5OdjIv8XA3ntvQjFpGj89yMvrYlmKMBUfXPpVrOw6bZJmVaSS8YLziFBqTI1smKeFErkS0J2VB6Sn9oJcjhTkUabwQE2AdMYTTBdb1TdUFotkJuPIwSKRyFrAYquSgsIfEBXU2UdKUHxPpPHy8yHc95e6+GbL9o4+Id+1QJ07/vs9rBeOzSUoy3y14nlovsfi6YBIJgZX7QL6itSmrVqke8L5NzNA6wE5xCYxzgTzBg4IOCJst2iloJvDR7JE9OOGsyCdzcjqkQYV183bUlQZWwTmt6zlGV8/VkbgJlXopYnjLQIZfyMr9pFlV8tgWl4fh+Ab2IT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeUieuDcnzCh6QGnflgI1ey712YajYKz0Q5pu+TC1mw=;
 b=m0fQ9Szc4NpIjqOXazY7+uP3B5Ymhm0NTIC+a494hN8gm6OY7bIXdGmBlrGrvB1JnsvuNnPr7OCc/vVPPOGQaR9E3b/uHAqtZiIqmj8O4mGH8lT9+KsaN939wGSz2tGyIoe8QKjLepuMPXNCNk1cNQMSIHjx5oMud7yXsuZSixDnS/Q4uSSRhT+uqWNNJ1WybbbcRqmaAy9Sn2P/lV6VlP3vJNTXFQFkyBs4/ErI2PS/qcwshWOEWPC/LW08A0oAprxGJzuobKzmfleLzjKx3yiSdgSwE1FYXfMBkB9A0RsnyaUt59GB869QvfHWdlEhOAYAJZe7JJwxJQvaALryOA==
Received: from AS9PR06CA0495.eurprd06.prod.outlook.com (2603:10a6:20b:49b::20)
 by PAWPR10MB7390.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:06:33 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:20b:49b:cafe::2) by AS9PR06CA0495.outlook.office365.com
 (2603:10a6:20b:49b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 14:06:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:06:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:11:23 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:06:23 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 16:06:10 +0200
Subject: [PATCH 2/3] ARM: dts: stm32: fix vdda supply for onboard hub on
 stm32mp157c-ev1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-usb_fixes_vdda-v1-v1-2-0c213062165f@foss.st.com>
References: <20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com>
In-Reply-To: <20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Popescu
	<catalin.popescu@leica-geosystems.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|PAWPR10MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b86fc6-435a-4ed1-c5ac-08deff8d67ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|1800799024|82310400026|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kNdB+TYMi1Fv0ZGMA0OGLilprT6UejIPOtusjMIyxS9q9sCyRq+bTlnwwnybuGb2xYpDOFdqMnzAVC7RDPBjNyGuJwOSt8VjS8JW4tYaBZXhMing5N3KQIovsAtXPxKuaHyZ9EROxcH6qj1kKabJIAPKRwZ5tHG5J4Dn9BCaADY3L4zKpuQDNRwa6MMjP5MJ0EtSr3dLNLEn5SZwt8lm9BtUQj7IaxD1oW7OGdLhF7g8vdsXX/hR4lad7OY7SUHHbwOIM5d4yLov5I6ePWoSUbBXgavH4oEIN/t7Vlr+ibmQ3jhJ3g0ckQCUWDjPnnttbnQJ0J8UJm+8dWAUYeQFMKp6X+dGkRTT3V5gv+pe94JH0TQ9+fT36inYhtc3u2sgMaN3gH5EAKdnXR7FT7OjLO8INWM5GHqGUOFfnYd7NI0vRZzqN1ctJV7FQ+cF0gJpfKDS3UxTL63xDn1whoBbEBJVRM3TnULSpVKw4dAbldJ2+GF4h9Ex1x45q8Wt2KimS885KxTOASxJo1e8KVXeya9ucRVdWTyypVEau+J9zyxuznObbV5yrhOnZU1+2nypBwgBBfV4AwbF1cxu6mbDuaYTJ9gkYyjlxsTPh61edXhnGyknjCm+LZkOpFl1dO4/9jNP8t5V/mu8q+pBi37QZkGJ61TmVqH63vYY2RrLPF/OujL5TTawWi0kVgFaHIgk8YtmT/UrR0JL372IhA+zxQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	14P4p17JNVMCG31fTwEErkpU+9KJqQMBMyyklRRdFakhlLTTWnxaOFKmbyckztKINM4ADgKwtBq0x0U0k/IgTbdQt1GvrLDTHZ95aTVyAuHPxr26OumMgwpWYU3hr4jxNoiL7iCfblMM4AeZxbPSWEyH1UmB0Qyq0MZvAlvSbcOkOFUXeE5X9KUwJbfVkCcCKQAx/3QJ/dzEin1qaJQYJCz+3QB/L1SlUlurUe8H7QcoxJuKFk924zACWWhbK9g74cy2Hr2oCWSbpno9bZI3G6Mz97lz0eejE9jC5xqFfbLKQBziZAjOCB6kI5KX3uLFyFk1YFVQJ2gQl8XQNd/fG8AFxJR8JnNS5g2wx/VYPIBIJxL4znP9ZE4+pSUCzCNlDPQTHPvtKKnUW2NoXIbAdR99E99JFN9aRjQIpF9N4qMnX4BGRZoWClkQJMTss3CZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:06:33.1181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b86fc6-435a-4ed1-c5ac-08deff8d67ef
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7390

stm32mp157c-ev1 uses Microchip USB2514 HUB. Since vdda supply has been
added, the regulator framework wrongly associates the 'vdda' supply
dedicated to ADC, so the wrong regulator is referenced.
Only the 3v3 regulator is used to supply both the digital and the analog
part of the HUB.

Fixes: 673655f7944f ("usb: misc: onboard_dev: add vdda support for Microchip USB2514")
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 0e65a1862eb5..ce014561a8ac 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -439,6 +439,7 @@ hub@1 {
 		compatible = "usb424,2514";
 		reg = <1>;
 		vdd-supply = <&v3v3>;
+		vdda-supply = <&v3v3>;
 	};
 };
 

-- 
2.43.0

