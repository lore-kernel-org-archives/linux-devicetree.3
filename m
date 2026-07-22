Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5D62D1913;
	Wed, 22 Jul 2026 09:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711800; cv=fail; b=LixxJ2pJDdXvYvF/F7nIDBmivuB7qQOLk7ciDXK8ixwy9HZu0zfWjUXmc01JTasAHDMkzstibvHVeK7c00fkgnHLotOLKbXedm1bHHN+GBU+gYhvrMvWt6Xik0Z8PTMQOWhWMsnzP4FG0n8J8CSun23dn89LBwzu0lS/tpbF9Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711800; c=relaxed/simple;
	bh=WrQRJK5GvD2IJO3OOGXja1oSG4DTHy8hPu6tYxaTNyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=W4/BhIRG0gl6NST7sHCi8y4efwIe6J0gSN+Sf6udhesRgbhF+JHx8SFN/+dETs0dIAhOq0tJVnMrxnp1yOucvEW1z5vDUj8QDe5OgpTDGNxlEzZ/Wu5BhOk9uyaJVPLL4l6fDBmRyZ1x7kx405XgPMnrcHg6pjqoIl+F2tUKybw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=A4NBjjpV; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="A4NBjjpV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stMlhhEO+jkNzEzZAquz8TEyEsTESkt0qEtW6KLcjAAzeVmHHbsbBmTLR6kTi4CDyzt76lpnHI0MTnIJIy0Rjz/rK/8g32OJMOCDcHghTbXFaG0jhz2icRYX6ga6zp/N0zsizgMPqtz9y77ZSiCeM6DZfqPfJWU6KHgFrTmE0m+PBa/JtqRzoMDLlwkwBhJuO3NLpuM1YgicLeqKWpl82Rh5gr0NpUtZC6H4Jd8C1JklgxhSG8kSe5QtELqQQEpZFyKxT70tslraatQ/DLkcn2RSem6cQvCn4rFQC23vYot05LA0BYmhFVnXjxSu93aPrqpR/e7apsRAv4QdPLX38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2rvoAhSPr4dOKkrmKXd5JtIgwVquaidIxigxyrrPkM=;
 b=BCBHQQoF0seSD3ijsGTAjMW92N0+dJ7ef6VO6lj3Wl3WIsQvJm72/yvuT/NM9kqNE1iX9ml4ivv84dWmY/asjxOf3PcvAZjd2ME55lXC1Z8tJ1O379lQTvYCsdpXyJCyJ13YL5GuMrvZSzn4GxaQSUUQ8ZZ4LUhVEOrKRG/2TYtdK5vUIorVQ/8GBEw7hIPd+yKMQ7tHS0Kk/0QEaPfqKJrwrrzl8NARTw46mCgLkcOgcR1eSTdFc1n4FDd3QFbIWqv4+45bqaFXkEg2p1jGME52zVXT0u2YXl5uqiWKZtxWYymfXylQ7c9IK3gesYopUfqZSkagj7T+yHpVK9Abxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2rvoAhSPr4dOKkrmKXd5JtIgwVquaidIxigxyrrPkM=;
 b=A4NBjjpVquYShBxU952SHO0Squv/+G5bK2o9jYGZfc0GPML+q4l9MTUkDwZhlxSns5GhTcq6/KIknhXOqc4JFf1sMKjts2SYNBZ3pHG7NoLhP00wxHN1sUqCPiyvYIWeQWfBYl7FklhGrILUt52s98qqCVJZJehewnivKwgf7meDz0V4QvsWAdsrp2fX4JlteQMUJ81q8ynhP5u+6svz26wvoi+aI5hvjSlxcFZLsswI1Z10AOQNzD7l0BW4E1oI5lQqBbnZi+XM7FwQdgLeHwwBCBgVimft5XfOw0ydV/Ab7ExLqogEwFVmwcC2a5G9R3PucfXsLKOZYfI+3n2u9g==
Received: from DU7PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::11) by VI0PR10MB9606.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:310::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:16:32 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::7d) by DU7PR01CA0016.outlook.office365.com
 (2603:10a6:10:50f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:16:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 09:16:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:21:08 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:16:30 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 22 Jul 2026 11:16:16 +0200
Subject: [PATCH 6/6] ARM: dts: stm32: add sram pool to spi5 for DMA-MDMA
 chaining on MP13 DK
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260722-spi_arm_stm32_dt-v1-6-6ef611523232@foss.st.com>
References: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
In-Reply-To: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<clegoffic@baylibre.com>, Alain Volmat <alain.volmat@foss.st.com>,
	=?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|VI0PR10MB9606:EE_
X-MS-Office365-Filtering-Correlation-Id: ff87855a-ec2f-443f-f1f4-08dee7d1ebe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	haeakRo51UyPxDjMt4hNCG9WmqkI5yoWg/dpwTyPXl2ZkAzEzLumI6Y/iPPFSc6N63qz+LLpGQnxtU2WIeEB1s0KMZo13fnyo+sajL46p1M4Hj+6VnCv3LmpuQM2+qKdp01mUNPj4KQoSitu5g7UdKVoHX/IFPVQwLoXmUg2zdgHUdUeuUJFdZNvbX33mB2XXUB10ttLsxubJe/ALxNzOU/uKU2Tj8E8bqZtUNp4320ZQVrqxin2Y+MLiWfeXtR7imByVTXMbfDGDjPf5qk4E5giVe/TjKYML5a7Jde0i5Orxu59Z/qRAfYGDKnhQT5Ix0B51+MdOak0UpszXT5UT6FajnjYHtyN3KVIbKNaiN7qUH4bwzbQz1qIW6GCy1G2hgWzyyUq/nRS+1wDzxFxJT2jqkTHgSMEfSEUJ0jj/XJqFnOHk3w7gvZrxURnG/prlRjvUAdjs/5WDmhOIjIlLTTpOGCuujbn7R+7Mz/dIP9vtZ6SXqinruyFhbaPqOkJ0cs8ZKBN5w5poDtSWS2z4TzrYRhbPOxO52gGxIc+VWd74QPSATMl7nYLOwy85Bkh/+RDztb1E1OOBDaTGCoSsZWDZZoO3iYb+IQ0ee+PlD7fNAXAv1BqUr2eAGXmgBFNZP43GSRBxGL14rGM08PIkNwdA8xUoDWK1QAX/pErQDIveTrpHjRFPSXgYWA8D1+HTkG0dXFbfslUKV6St+b3XA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M7xl7kGg2JQXwjkPSLqGAOgcxUiGYgj2q5+pFhEIVhDzGQcYFHChK4psMs65YwE3b4uaIxU5sXAT3QB/KLl4K+hiZBk1plluCjP3Q0nCseiqXKghVLfN6aR49J6vGi+UQ/er9HTK3PUPQF9zS+GICh00VcRSQu9v7IcWj0SN93D+q52tJNqt6C/fwK0oxl3SaC/BJllX8Y1GiGu7Zbam4YRZPf943rodt3GoXnFaxiToTKO63w5s67v7zv1iGVEwn8DsoHM6yFujDDJZYK9AtblMIzN1GeY/RwPzUfRQ0y4CVjsPYTnxr8BU8BTF2kY8Ge+fjljpSw6Kjlysi5HZYYGyFZ3KAmY1R1V3s+rEblUXdtsbQ/G6kHjsosBzvMnKle468Mukl+zE/nYtMdrupbXTVms+nkcJLGH7h+1/K5NkvwWHclC85X3Y7J/pYBTi
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:16:32.3724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff87855a-ec2f-443f-f1f4-08dee7d1ebe9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9606

From: Clément Le Goffic <clement.legoffic@foss.st.com>

The sram pool is used as a buffer area during a spi transfer using
DMA-MDMA chaining.
The pool size depends on the SPI framework that creates sg up to
4096 bytes.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58afd..35509b5c3872a 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -479,9 +479,21 @@ &spi5 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi5_pins_a>;
 	pinctrl-1 = <&spi5_sleep_pins_a>;
+	dmas = <&dmamux1 85 0x400 0x01>,
+	       <&dmamux1 86 0x400 0x01>,
+	       <&mdma 0 0x3 0x1200000a 0 0>;
+	dma-names = "rx", "tx", "rxm2m";
+	sram = <&spi5_dma_pool>;
 	status = "disabled";
 };
 
+&sram2 {
+	spi5_dma_pool: dma-sram@1000 {
+		reg = <0x1000 0x1000>;
+		pool;
+	};
+};
+
 &timers3 {
 	/delete-property/dmas;
 	/delete-property/dma-names;

-- 
2.34.1

