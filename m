Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.99
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794865285;
	b=f9L9AYkwhZkFUV4A9E2WGXLL6EikSgYcTlezY771+5XKZsEN8MEhcWeNDebhZFBovwJc
	 NFK9dV6B02lklBLe/OqhyMwDgP/n+zxcrisU3rewokvNzoDn2KdNToRzrq9jvL4Wjtc8k
	 MlVaLM2/Ws91TgtDhRYkyo3DzQ/UKC2CA//oPW6ud33E8ygLPjrJ0crabMMsOF4H5P9Hg
	 BXPNc00nVWFyKsBo/rjXhOOCgXioLDrgj5SPxM2fX53lQ83COEMby0GMzV+FCITCYawwm
	 Z9h0os3+dQXv2cPsnlRNfLCuQaOqcsiz5sR1W+EzdVGGYfu+tLUr9lFiAb+UIqGSmRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865285;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
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
	bh=4BGP9FiDK2o3CLxzHZ/o5Td/ntUGZkgqnokg4At2AbM=;
	b=qyYZG9QT9ZV8SMoNF+mDeXtonLmMHmISpU8K6O/hHnGqY03pTJnyIEYQxhAt5geRUiCg
	 ochQtwD7zwOaQq6IqSK3GO8jyeaKu8DWqRZU/NlAA+pHppWWk2R2psniMwbVAO3Qv4Q5H
	 IP9AFSDdp+xB/oUv+OBfsP3ZVBIBwT+3qLdUafWvWPw0Peddwp1eTZZ+bRIORe3yef+4K
	 h8U8i3r5ufZ9l5imqVPPtRFHnS9MT21+ZbmDZfq5yrO3JO80YPA6zY8oj844ZFlKQX+C9
	 jfN6oneZhL+5MLZ/IA+SiuhegHJBX71V5M/ZTXSsjfZDvkCBNGl9Dvey80qHYwyuJyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.com;
	spf=pass smtp.mailfrom=phytec.com;
	dkim=pass header.d=phytec.com header.i=@phytec.com header.a=rsa-sha256 header.s=selector1 header.b=md+8MrXH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.99
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021099.outbound.protection.outlook.com [40.107.130.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81B606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D81B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.com header.i=@phytec.com header.a=rsa-sha256 header.s=selector1 header.b=md+8MrXH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWetSSZn7pv/Q12YqCKDv/EXc2+qgNfRwoAF91TBz3JCX152BvPXbuIRZQoYGpQ8eD/8ypUT1J2ZdzMrGuMCmme0SYH4Yn8/S2i8M59cVrwMdOJv+51l46MxLeI01YL8yFfd3od6pFx9Vakey+4MBDioAv6LgtNGyY9yssK/QnzjUGxg3VjCmAIcDpWsSQ19pzTP7B34TQ+wh4d9VdIoYe7rz+DvnF7bWWoq4lRXLFthNT66/BFJxqnsKAx/2aG6e0yRJzsBfGxnM9RP/Y386ZnprHYbfJTU/db67IP19S+iP5lE1f6vOkwpJbZl8kOQJG5iY9EWpLYU9aOSVCqUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BGP9FiDK2o3CLxzHZ/o5Td/ntUGZkgqnokg4At2AbM=;
 b=AuKvMOfiVb0qMmXw3kZWCSeZZDMc1o/pBhR2Cmv48h5ZHpxGKxM4sZR+qaHy00ODnd/Jqj/nLFftlhu6qB3zucZXkXmDnTUdrJ4TNEdJ3vhDW4D85PLExyOLaPN2028BwfFaOfIFDP/RJxYCLJLo066ZQuo2H1nLZO/Y8lVWHjMynG7H0Uhaebqfl8rfOR4Fuhiz1Ugq1YgMad+e9o8qywk0F5RFt3QXYa10YFPJaXv3OHTyEpGaObi3KIU5kVqcXoAp6CY+IVFb0MccnwBw2T38MiLbpG7Zvyh/l+UNvWbNQ/uj85lJkSO9y3hg6JcDaMlcBAKQt1S2WJZ/n1wgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BGP9FiDK2o3CLxzHZ/o5Td/ntUGZkgqnokg4At2AbM=;
 b=md+8MrXHIPB8idxycIFRX0euxUElrWLhuJkz4wbbREZHEO9mWxLWwtm/TuTY3uzAYw7/sB332oD8hr/79FP5c3F/FUN32YNYxG4MZPIhvmJbGGZoe1NGXB/8lyL1yUpNe7jI5OtMdw0JMvLNn51BFgzQIpDen0w+5pXdEWodR5JUpg4D+o1yPFRZR06tt7sxqXvBNZMGd3EFnRsnCG7Wa5tCe1OnK7wTuYMbIhQQAR+vzPbFMG0dBQ+KDX1kwEex8qzSwicV61VY1XRevYObkQai29tnX0nC6roexZSnlFB1HLssURhp/BN4vvhSFifun3GvrFbigrrx3vNocXyySQ==
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by PA2P195MB2584.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:425::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 21:41:19 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::14) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 21:41:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 21:41:18 +0000
Received: from phytec.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 16 Nov
 2026 22:41:16 +0100
From: Garrett Giordano <ggiordano@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH] arm64: dts: ti: k3-am642-phyboard-electra: Add gpio-poweroff
Date: Mon, 16 Nov 2026 13:41:06 -0800
Message-ID: <20261116214106.185918-1-ggiordano@phytec.com>
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
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F1:EE_|PA2P195MB2584:EE_
X-MS-Office365-Filtering-Correlation-Id: 521bb281-bc44-40b1-5dd3-08df442a5931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|18002099003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|10067099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	DA1HwrxAiO332j0s4elNG5X43t6e+d80aAaInRBnaAAN9HDsNaVPHhq459ufWEMJeNu+96qVloR4c3bFSGkUoRD3AvvDz8491kBlNoJVQk5n5ystxD+Krf0ro4i17ww8GnZr4X+E7GV4jhywtXJdhbFOWks89ultirkeQlwnqgY0TMJ4harRCSSzKpH0d4+inksCoxcYAdUE44eNWn5K+qEnINe9cQzkK2RkfgucKGq4yJ8x7gVwzH/T5OZ5Qbng/V2YSV/MbPug7jVj5BCDvTYDOAid7PSTO+iVocAfvr7g2y1Za0SsTUCmqGHHoTSZ4jGHtfWZSPxSbiQXjDwwUWyT+DM6V7jyfOPFm4Znh7xp5bvjC1uwZycU0DkybKL1g2rysWu/Us6ybJstQDHtee3+PhOky4eeZyXARZ9t9Cls1F76XRN37pSoA44MtD3ZOIqXLaM3FuwSDOSffBJe7AW9qRKs+43JXNiVDuNWwKowhBZvAb+GVVyHi5duwAQ4vnKPNuc9Nd+HR9wN/CAMAzX7iSttDpG3hl8oOJVqd1zx+KP5l9+CQkIdBQhDlLIfJ2N7Z1hm1961nbgPCLUsnOfhh4W+19xu2Rj27UXke8tMPp2fjljSuwNvWkG+gQQBIOar7mWytCD+ocQ9jU0vRFzW3IkuJekxA86VHQ24yR9BQT/Iy7XfnMi1aKOxo0vYmJjXYTH/Nz8pmCuD4dBDyg==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(10067099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TFpcpGE5CXJlpmRdsFAAxHYqVDzXtgijNXf06AYPwpmQNf3UjiQDnrdLV/KfqDkQlSUOijepR7TByaj6RKpu+LyJ3rNFua8giTuBoxJB3warjOADVKYk/YXH8VnBIjXB34Lnvq3XqyJpwI0r015yhfMfIKiamoeJ2OnvLPCxUbml/VIK19E3S9I32QgwG6vVm6dPKCS+weDQ6QtPx2tQGWhZ+Y1rkr74srX7QXkEeyQQ9a8x+etnbYasxNTx8B2FZMxEB0y9d6/GU6rM6HhA6O1KeLWEKIamR4VUjWo/INV9D4+HQjT72iF4pBerSbXEM5FGkfuEiSRbSe8a1SQz9wv4bb6lib/fZsedUNu4Mmc+MMnjuIThIvBOqBv6jQ/rJFajDVP2y9ybKwmlWbM0k/1TLDxHUDwlSgypbLI+artCA/cIi681Y30Bz+caDm9u
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 21:41:18.4949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 521bb281-bc44-40b1-5dd3-08df442a5931
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2584

"poweroff" currently only halts the board, and the RTI watchdog resets
it about a minute later.

Use GPIO0_41 (GPMC0_CSn0) to drive PBC_nKILL low, turning off
VCC_5V0_MAIN.

Pushing S9 brings the board back up.

Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
---
 .../boot/dts/ti/k3-am642-phyboard-electra-rdk.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
index e4afa8c0a8ca..4663dfdec036 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
@@ -164,6 +164,14 @@ led-2 {
 		};
 	};
 
+	poweroff {
+		compatible = "gpio-poweroff";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pbc_kill_pins_default>;
+		/* PBC_nKILL: driving it low turns off VCC_5V0_MAIN */
+		gpios = <&main_gpio0 41 GPIO_ACTIVE_LOW>;
+	};
+
 	vcc_3v3_mmc: regulator-sd {
 		/* TPS22963C */
 		compatible = "regulator-fixed";
@@ -312,6 +320,12 @@ AM64X_IOPAD(0x02a8, PIN_OUTPUT, 0)	/* (E19) USB0_DRVVBUS */
 		>;
 	};
 
+	pbc_kill_pins_default: pbc-kill-default-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x00a8, PIN_OUTPUT, 7)	/* (R19) GPMC0_CSn0.GPIO0_41 */
+		>;
+	};
+
 	user_leds_pins_default: user-leds-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x003c, PIN_OUTPUT, 7)	/* (T20) GPMC0_AD0.GPIO0_15 */
-- 
2.47.3

