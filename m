Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794984386;
	b=mtU5PmDuFaTRlanXeAE4AjhUgAPSpxdarAyldXq0CIYwmIuTXXCN5zZ9YQPr9VkHWty4
	 XysofgzLzAl5xk7KQt0F+sW+F5GQ+sOkO7bhgNB2oeAiqddOLn/kpZnPvMBkYWuIpwEIW
	 mK8ivPRbil/Eig5pTdgTqlfn4paXaVNBpcOhaThORVQrpkCie+XICCLDlbDX9Z/cMSlmf
	 xJOE1xDtzr5yd91kGHhQTeDHptOQUF99Y26SKELcgicpcWlRvbLEVi2vjb7b0KCcX45Ss
	 yaGYWYNsu4ylhDtB+9PLqfBRkupfmdeB6nr6fQAmTGJYMOdQFc2QkMHO6NUFGNPhxVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984386;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:X-B4-Tracking:X-Change-ID:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
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
	bh=muuCZ7DSXV/IjjPENJPY4XyOou4pzmPVRIX4kU7BALE=;
	b=SMAYPNRSCz9rOZsUT8/cvphZQOzbsVEID+ckqI720QiM6mIwUEaJZOu2+6X9FAhhux2P
	 NRzDD5AXN3JputFoYdd5Q+CQGERAL7rw4qzIa6DOM1FnYBxFEkfa/bH0q4jYQ/1/47588
	 4WImkkrWGdWr5Y7m6WLe6zHXTwyqG/4QLxgS4dQ66STqx+DAq031jEu6BgpfsNQpSo2kg
	 B3qhmFUDPT476xmlcO39aJaX1ePeewDnXqBRd9+7Klbl6ufV9lx2+sJZElE/2t/Ewhpr6
	 e8lkVcDSVW15yt+oNTcIFMFB0ZWpTrXLXCyxdDCKnU5oKIIvB39/BXtDWVOHby66sPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yPF+AAU7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.64
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6EA606A32C;
	Wed, 18 Nov 2026 06:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE6EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yPF+AAU7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYTzNEWWGBaUaTihbuNiqmRer2huNMIn90+hTBgy/pYum9yfV7qnQLbSiADwG2R1w20jNp+TXfkr4CQpNnUFXSW3GdGlcStBw3OJk5RPlJCIUhySZRPTcyCMVRbH/0ZLa6G89skzy/C6KvE2o37FG6R9rFg1WAbI5igCTCpwIcbqumQjyHBSBa1afE5l6g/TkEW3Jg04SZiTqexHrsUmuYgPcrbtj2ngUzKO12+rOeG9zm15Ct8cW4Lj2CqDplfQBnUuAx7rm2dvK6SAIi83c4AJjc2MtPcCE51bUSn9a6VEncfqbyNSAlVnH55LtsLWbL/W1eOxwY2sDvgOBtCAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muuCZ7DSXV/IjjPENJPY4XyOou4pzmPVRIX4kU7BALE=;
 b=ty1Y6aOePGLooxdyazn5QEZIk/V7IFomKMfa75vvRDWuEB/Fvah4vZ4RFKqj/VcWT+03nNMMRRxkwdPT9bbdN6+Cq2J3IA17BUd0Xo++ZLumvqMqd/Q1PZIOXRNL6RkIccT1xdrTjMkQs10QgN/wVdA4wlDIYo8EHvfr1/7S11QmYl8XEstrd4GVQkFWHLAzUryCD9uUYVEGy8NHTiMjaVCWnaeXq9EYH5UuvFg9nbZ+s5UesCMqjkzaGZftZkJCIKZkdku4SSCYzUcnR0nm6eYcR+z6UDt3eU6/bFUsEr3TdSJPYDMJ62H7j3DXsASclhtUfgYLBQEJptq7CMAlCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muuCZ7DSXV/IjjPENJPY4XyOou4pzmPVRIX4kU7BALE=;
 b=yPF+AAU7fq0HSo0iV0RNQ0RIfkPiMaiU9hOSmhnJpEcaJtajKpg/zjrLkS3+kFFLoH+z5PYNcW8xAj0ESYB9raf1QW3UE5r3pXyhggnKgpovPb497jmyPthVKnt19RIk3rOLEDe5Mt0glYOAoFqa0Rceaohe6W24Cd0b+62/QaI=
Received: from SJ0PR03CA0091.namprd03.prod.outlook.com (2603:10b6:a03:333::6)
 by DM4PR12MB8524.namprd12.prod.outlook.com (2603:10b6:8:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 06:46:14 +0000
Received: from MW1PEPF00018892.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::6c) by SJ0PR03CA0091.outlook.office365.com
 (2603:10b6:a03:333::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 18
 Nov 2026 06:46:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00018892.mail.protection.outlook.com (10.167.249.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 06:46:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:46:12 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:46:12 -0600
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 00:46:09 -0600
From: Carl Lee <carl.lee@amd.com>
Date: Wed, 18 Nov 2026 14:47:53 +0800
Subject: [PATCH v2] ARM: dts: aspeed: anacapa: remove unused EEPROM
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261118-arm-dts-aspeed-anacapa-remove-unused-eeprom-v2-1-ba49ad6e1e25@amd.com>
X-B4-Tracking: v=1; b=H4sIABhK/WoC/52NOQ6DMBAAv4JcZyOWS0qq/COiWOwluPAhL1iJE
 H+PwxNSzhQzuxJOlkXdq10lzlZs8AWaS6X0Qv7FYE1h1dTNgIg1UHJgVgGSyGyAPGmKBIldyAy
 b36RY5piCgw57TZ0x/TBPqhRj4tm+z9tzLLxYWUP6nPOMP/vfJyMgcDv15qY1Ut0+yJmrDk6Nx
 3F8AbIlTxfkAAAA
X-Change-ID: 20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-415ca4dd56fb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<carl.lee@amd.com>, <colin.huang2@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794984479; l=1307;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=dYSV9mKdQnC6h/+aQ6o0Kf71PKiug6RanpwYKVEWGIQ=;
 b=RS602ad96fGFzFypb50GXWM8tkXgbye/a1OOeUrDUaHFtvgLKD7tz6/uulMz14PKfKI23La5e
 dgU6fSXnHwYC1h2xSw3CMbld6NxHauvUPcRQtnliqbupZ8tzY8FfOCt
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018892:EE_|DM4PR12MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 128020f8-c36d-414c-0ed1-08df453fa38e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|18002099003|261009223027099003|13003099007|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|11063799006|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	Y5cgdrAbBuj/D9XX97gWgz1SwnD4C8fTNGm8tzwV+6YTDykDJNI6hJnbQkXIvehUkfg8eYgwDHkida/fhZyyfxbYXNpuoPKsCO9H6q+RE52OF+QdIZLQ+vKUKsVdmGdraDMj1d6x81fAz71kseTDRiYpxIfgkE8mN7/zQInVC8Y+UMhi4kGx3hboRPzsb05T8QHlInf1dSo4Y64gBKGJFq7gHpSbNkicxWlZQrRg14RImYPh2D66mF6krn2xUPHU/1y7frjIxnSJVAA27x88y4eOkGvq1+tX5wXcf4ywQMVgfW7mik2Fo5eSU8FT155g7jMydIx03r8xTPgif8wXDKE+pYMZTgH73s9HjqwhtRCv0I+lFGIeFL+feopMLMDv4UAneTZMt871yxy1IbZN06K1cqFuNVl20YrsU2lZWrNDPqfs+bkUrhFQSSR35LxzXGE0+HLCNW5ZS+6Z/a0nhenmIx+9Gvu5Ec+J6Zr7Yed4zoBCoX9OcTBmALKMlsMk+9uWWhH2A7zd6PrW6eG5ZEHf7hXz/KcPCCaGhhiI2bVE86JXHMGcDGAwHJkn+CSf3KOsU0sCNbs7ruS9Zq4PZlhZLahPXee83yn2LiVdMuv0gHuC/xYIEGFW/raWJcBGnx3nRIBUKQmSUOK0kQeotTfnUOaPEBR7+FQ7ZSLHj74=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(18002099003)(261009223027099003)(13003099007)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(11063799006)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wZnYyHrc7zRp55Yw+AYX0x9PcfW37cIkkRTOZVl78ZH+OF+UovC1bnS0BSacXM/ho12M8HwP3B9BpwxXMiddrid1abLowOy3S60F7iroziEs9ki5gIE+w9KdNxTfqhcKuYNRlYbqLsHqhDkO6+Lm4Cca+nxb3v5H1e7wT/VzBAcf2yySyhz3+v7JYpJ+JdOUNusBjs7yrtF5n/UpV9rOrVvgmc1VT9SiYJ6NPA3rflA+Vx/W0BblKXdb94DMKtr8vofF6osD1GF021tY7uSECOqavubuFKvm0oFxWcQXKZuD2nS5KFGlLdP1rbo94cGzxLguruB9Up2o7JHN4nztqE1N0YwVeRmf3I+j9HV/oIKMPzurwHFJH+o33dLJhjOCCSEkd3y5WAtTEwWikVUHbuuWicVGbGaCNi3LDPOUEOKgf7k6Lfwy8p2KV606pO+D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:46:13.7805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 128020f8-c36d-414c-0ed1-08df453fa38e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00018892.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8524

The HPM board ID FRU EEPROM is shared between the BMC and host, but
is not used by the BMC. Remove it from the BMC device tree to avoid
unnecessary BMC access to the EEPROM.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
Changes in v2:
- Update commit message to explain why the EEPROM is not needed by the BMC.
- Link to v1: https://lore.kernel.org/r/20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-v1-1-e3b5d9cc1a03@amd.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 1fddf3a5d138..1b05b006b3ac 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -805,12 +805,6 @@ i2c13mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-
-			// HPM BRD ID FRU
-			eeprom@51 {
-				compatible = "atmel,24c256";
-				reg = <0x51>;
-			};
 		};
 		i2c13mux0ch5: i2c@5 {
 			reg = <5>;

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-415ca4dd56fb

Best regards,
-- 
Carl Lee <carl.lee@amd.com>

