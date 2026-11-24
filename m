Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538908;
	b=CQBYsbDBL8lH3IToV+OotOn+IaicAM/5vhbG2x1YGgaSd2Xe2ug16Q9tuFLcVf/d3G9z
	 qydPh1SlXs6JLMPfHJ0kBBvVC6wT13260znFqr17BDJ/WB2uNdbXyLnNUmpnyYiv102Ag
	 iTAXAY4y/KabEGpvSrMEh3Cg+eYYa70GMyOI+BcEydKkz1eXQEIRrVmldxIBrleOrcodA
	 Me9dVPd62rNFahqQ3jfVKI4f0EjPtGklUpAdBb6uLP2GOZPhzd+AxYm3kXs8bFyBCqpLS
	 hwJTqkS05pbL8Rr2DjNuQoZwyf11+7vg+V/nYfJaShs5fVnw+TI2jBtwnT2RwBzh5KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538908;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=FR0QvdtaC9dmgh3wIUU5cAMRTBkJfDCReJjI8Jmg8KE=;
	b=JAehJ49qXU6CZhVIITXmQgvvsu3yUNReWGaj6dje6IhZjBmkZDrITufm70AqLK76YyaW
	 IOAXe5L6reD896YXn36S12UYTQ3GZwQl2QD4L2vPpYYUGJ0rOkEJbAtTlcDiukUNU9vFe
	 sO4DX88djjG7TVl6KXdQ/lzK15j3AU+bzlbJJA/9PSIfvkYQEFRcGcSk6X+hmLv6HRkZZ
	 ux/waB1AKQcvsTAvL1E4qI4AWzBcMSEKGoj1AtUsB9dNxww6oQCLeWuPN1bfBVMp2aHu5
	 Hu1QT0LiaEtliCpdPIQrCcRCIGTMa2iNxtjsMfJnb2BMGk1HgZiG/0koFqAcu4u0uqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bS1EoJm3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.64
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081EB606A68E;
	Tue, 24 Nov 2026 16:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081EB606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bS1EoJm3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDnO5wezNsR/gkpKDRmBeI52MtskLbNtoitKanVrgDfZU9x+mzlDT0/8YRlIhQyCoTaeLx2KTy1rBRCQhwV2uJT1niwgl+vI6zi3A2Q7Zgs0roXvgQNSlyRAhIWql5mMd68i6SbSN5NqyfWAq1WnDw0x68Z24uYVXaeyYgE4q+XUbs5hSxu7OzuiFC6Jcelm3E/Sa+MPkXgbHfZsxBggTD+GT2CVYtj9nSIjO1Nwx5r4kWuV22uEcBwSidZi7NPrXJPB858aRVukXPfVczvB6xtH3NMrJRctJQf6fBDFvlvUYaD76zrnc6t97cP+LtYMT0ZgdjorwyLQ8NSVCo+B/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR0QvdtaC9dmgh3wIUU5cAMRTBkJfDCReJjI8Jmg8KE=;
 b=rYry45OkMi+GdY3t/02Eqz/ukoG+pm4J3fO+fme+FsMkcva8fRscf/lq35S2FxxsM3H5UyIBqizDsXWKIyiVzkj6Gkwx2J4oKQ/qmOMgel9OyKpCF5r+d2dldGZ7xfpKxp/BoWSAQiUEqnXvY+xOmexwCnNiE313Gcf1OJ3e/HKz6+apUGSSC91eALVdhMjti50CXTutb9LqMrW0mL/k6RLrsvyvj2H+NGdIux3Ww3mCOkPeYaeFFiv5rcE+qI/5MoEFT1uaBFQZxjFwGqvQHtfN3StSMsyaQtSwU+mqZEdM2/gLmBP25UDcyuGdfHcRF1F9wRLaiNWzz/hANL6hXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR0QvdtaC9dmgh3wIUU5cAMRTBkJfDCReJjI8Jmg8KE=;
 b=bS1EoJm36btF1m2VWeCup8LvFq/CdSh88kcTpzJevnIwmMrsjuq+NPkirJ9LHaHwTHs9GI06yapJpDD4/i/zctmjHqbrEgk7uCtrnp19CW3/EB7cJZcTZ1gG/XCON9X3WFyZ9R6bWTyawMxrXcWFvvAbZ4ncgsvM3to12+qq82Uj4N99Ed2QRrqyndXCQI0YqHc70gz9vAnEhA3e5007XhoHzNP3LteeAIrwltWn31/EequzELWPfRGhR0DNmC4ojAYutNidnZty6+F8rGAR8mFyv7g/D4weWr2cmhKxIQ4EJZhk7up9919q132lilBpyRytFKkf5evHHX8aC7v0pQ==
Received: from DU2P250CA0009.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::14)
 by GVXPR10MB8082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:114::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:48:16 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::5d) by DU2P250CA0009.outlook.office365.com
 (2603:10a6:10:231::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.15 via Frontend Transport; Tue,
 24 Nov 2026 16:48:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:44 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:43 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:40 +0100
Subject: [PATCH v6 07/10] arm64: dts: st: add TAMP backup register in
 stm32mp231.dtsi
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
Message-ID: <20261124-upstream_nvram_reworked-v6-7-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
In-Reply-To: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|GVXPR10MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe19158-a908-4874-d330-08df4a4abca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|7416014|376014|36860700016|18002099003|22082099003|56012099006|11063799006|261021121427099003|261102123227099003|261009223027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	KVLt/eOooi3memLQZmnyqdH8kSacXjWb705D58uH+wpzgmKblonh0MFUrubMYK2/UlME4IAKg6FkOiw4RZ28piYNx6jG3Xj/6CsM0xPCtEgu/GCjU2qd0hXSaH5xhp5M0EB5XyvCZegTC+lYWk5W7yjlTHOi+XrW6V2uQWXcUNIpDMNZo/VaL/SaQyIKPXoW6krY6J4QcJzRGt7SMjXtrxO89zUsT2MogcLos0Ohs2CAkPb74tpyIr6jOeE4k/7mnOVOXCxlwEPmrM97ykorR5Qcu0CSHLJq56DZgIzTso9JvX+zP2/pRjxSdyBa/GWpbAv+B7BcCBlMf1bxWYWZ8e8Z4zEhQi/bq7vlZfEa1T9l3PDeK2BpjOM/vL4b5fpMUT5DMRkHB9cN9ts785MKjKWFQbEWdh9avNvhXTpAk89b3uoTZmt7wVHmHDGXzODsTsxBaDXjqsgmCF/oRrq458idLT9OU4O3YOQMpCF7x8lTBAyq7EM3rKjt7A20zN4VxZbjc17XXC5SjC2HN9sEnQjkrhnslq7keU80rwrNs/OGALX2acb/kOBFacYHK56D1p4wy8z3L7RmKKwX6ROXkHoYOnCEaD1BZjeDMt5fibD0JQvbFdQapJGDzKUFU2RACqStj3+d9HUHiTCQdb2tKYsXhYfkuqriqbUSQMgIY3toFvKPmaxV2Ucumh2FBK81E6lPQwB5WK1y++E6vl29tw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(7416014)(376014)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MKJPsIiLRrWORHti+a3ThaakPNBG+lo/CPwp4v5pOnpAHKSv6QC/g4OPc2TnpaxYNIzhHUuRA0IDiE1lX6f+eofHdXmAZTx3ykoOxoMX6LhzfMDY3H/2hCuLvsy7ahFPKoSoLjQQleRkdnD0rIMFOms6X1j1xUVEHGEIK9+n7BuHYS95fx3Hm/MCGZFteVzWycVDpX+C0M8yBog8iKMKtTnkNwm5qw+D1+2CEQj8zdAu8lkJeYufshYmrpOMgfUfoWkAS13rQAGiM4uEvQ3ZA1jtdcqnh9u9AJqk+RdkyLKYUU1D9kFi1Me3M2BUY+P2XQn4seNQckNbGuwJ5kt+3kRpRexTF9nbbUPTnbLAaj1eo1IWnDjaxg38uWjroLd213zgWnlkUR89J4L7NDHRe04JXbCpu/sKdUJizwJKR4VPSNQer1Q0bTPqTxUE/nqP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:16.1364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe19158-a908-4874-d330-08df4a4abca7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8082

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..a1392aa9cab6 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1265,6 +1265,37 @@ rtc: rtc@46000000 {
 			status = "disabled";
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x46010000 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x200>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+
+					rsc_tbl_addr: tamp-bkp@184 {
+						reg = <0x184 0x4>;
+					};
+
+					rsc_tbl_size: tamp-bkp@188 {
+						reg = <0x188 0x4>;
+					};
+				};
+			};
+		};
+
 		pinctrl_z: pinctrl@46200000 {
 			compatible = "st,stm32mp257-z-pinctrl";
 			ranges = <0 0x46200000 0x400>;

-- 
2.43.0

