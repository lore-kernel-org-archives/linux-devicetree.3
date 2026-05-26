Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575243D2FF0;
	Tue, 26 May 2026 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786365; cv=fail; b=AHDu97d0jsD8v+q10NLlu17KAo33RtU7EpE+CFgr7I9ynFrWBgDYhskUu0hf+3lIESur4ALBWADmvfjvt+2jVpQOAMgHhec7GmfI0SB0seUgDMi1KsvDXElqRcv/XDAPYSTUWEwTz7x6wum3WfQjmWKkT2xsVh4yoROwY9JCPtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786365; c=relaxed/simple;
	bh=Ny0tu71CugoEa00pSeeJRAjIhSD3KnM18AR369gLtiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oYEpICPGmfC+W0fVkMZls91GjfzUEiQD5byOsS72TeNhOsHEP8psA+LQs8MWPr4X/03wVMYYVjJ+e+nYE4BlF1OTwqcAobcpsbcQ/xM7UjKsTTWVnvczxpIcRCBNACVXW6ptNfVIdn4hdWC3dosYmkzgFr0XutlL+FLOZndAcxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=taJe//46; arc=fail smtp.client-ip=52.101.62.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="taJe//46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET2uFSJriXJq7eNaquNsTNNbRqci1/lkvwwcpd1wlfsmEZa50wik5ZUfDS0fIdGzO8oIBaUeBuDD+1pYRWD5chs4QFYGosyS94L2EnyQPK3oVuyDaKNerDx2QQSYk9oVtdIbVhL4imxIM+bC7+GCLoI2jaPizmpvF5rGIECevrxMIVnZTBbScWYpvtHC3WA4yh0wxb8+xVL1be4vjK1ony3rL/t1zDcFU3mohtYwfVW98OfNt2/+tIXUu+0aTmP7kLv4jB8mqNdxR4gIiGCEkxYDf+E8U3Hm8xZXpdpNReyF5Xu4Zkuk/ELE9Se4HGvLZFgol914D/A/BRLMq2yNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxOcV8AHeLcos9kbaluayXn2xxvNeTnXv9Vd5dRJYUI=;
 b=lXqnqge/Qfg6t2F1n2ryc1eCN+tdv/NzgHQe70z7HOUSju1lN4tRtE6vt2bnrp2/W5ZwqaDVfyw1kDfW86Ku6fAbsOjyLMBRcrWD2dyzHu7f4z+mh0/Of7BUSIuWRgKYGoI+UKBnZ4RpljeTSG9S/VudveGMjuQYrT7qcxuaA/oiPNFxh3oGRyM/5HEm7IvlMePqKplTLSxdTVMntc2Kqg5M2kGDu8bzKvLxmhiRPfj3CHHL7XMsGJrBR3sD7ZET/uCQ0//CxemCw8GtB4pw099oYhwvLxO3Oy5lgQ3rlCvozhtP1TDh59eQKl0ya6q5OmdenyZM5cRGZmPRrz1+Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxOcV8AHeLcos9kbaluayXn2xxvNeTnXv9Vd5dRJYUI=;
 b=taJe//46OX87tfOFmZBNUdC8d8130uWi2+LlNze/QZHsoPzckjFSpGDe6hmfqJhCpyRPWMb8jZEay1vDasMURCqeR+ybCBKrRlf8+aLKQtQgfbBjuQwyqloZ913xaKrQJwyJv4lU9EiAaXfflv80Hf9Qx/0YOz4H9MqXDmxE7zJl45mUhGAs3UqNS3WdWn8w367SwZryIekQjjXHI1DsIKWFef2kiBkkqZ6Vfvdou0Cj3amWV18Xcp6+8DpcN7gWDwHPGuxOOSYWIvnOUQBGfXSEQbSteU/qiLMWPd2y2/4wQKnqps1c8CqAAqHGoTObLIKa+ixUDqVi43yXF5m3mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH4PR03MB7602.namprd03.prod.outlook.com (2603:10b6:610:236::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Tue, 26 May 2026 09:06:02 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 09:06:02 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH 2/2] arm64: dts: socfpga: agilex: replace clocks reference with clock-frequency for dw-apb-timer
Date: Tue, 26 May 2026 17:00:52 +0800
Message-ID: <8e26d1e4457b8bc1d77a5de9aa6162675fa443a8.1779785788.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1779785788.git.adrian.ho.yin.ng@altera.com>
References: <cover.1779785788.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH4PR03MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b717a8a-ac40-4943-699a-08debb06029d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OfjKshEaNEGVtanttZT96HKrFq4sBWawlb6e0WtLEEDxZIuVuX1bO3plQcJ1hWuEwDwND8vRWtqr3ngrFOTAPSSbZnLYAtm1YU5KjIz8kBz/jCqL7W6jv9cFRaVIBzpSbny/ou5w2GjfkmwTpFyhzYPoDlpHSV8QVsC7YHUiqvHgWcc0xdc3wnONSuV7LG5ZPG3gG5J/AQJGKO/fiLb10eoIKS+7hnu2WMWMEaQC2fkx7gWsEZshJE+EY0ATNN+4cr9DadING+7Y4DvTtcG6hZSILF6lrILf9Ia0VOw/yL1fi5xQxTr69TXRn9Lpx1b2NrZizXC6HvXAGQXAVLksBnpg1AWCb4TV++raIXlN4U/CDOtMcjNAuBncKtCkrT4CMwam3LppkMDezT34erwl3iTy9X+jXjjrSU4jg8XrXMhk/8LMpUxIbbealtmOUuiAvhuonHtbV4KWr/Tg3ASE/XJtYWZ7DNnrMDfcsrolYmPmYXl8flG+PrMfVoYTE63PxcPyEUrJsJkso+T3JJ4lHszL5QpghitX+psTaLQaGDrk5efZlRQnueBZqpvL8DIc+wcI9lI3GvkEuBHYOUl48eCbHEKIKDvV+jg8Agv/epgtNTC44i1gUjVFLM+kyfDSuLY7Uv88eV9kgWVOLxJpjwK/djFIYWbXSB6HKrTGXaaqieYX2fmWghi2DZBFVjR1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4S5NeeIfj7OvskEz5JkkjzGrCXFC4cfsenqfUNzFHBDcJpPuazGcIY22c1VX?=
 =?us-ascii?Q?eHkx/2cbuCLoPblGgLTBoxPtIZGiXsmByAfTSJQxcIig8+RqqgUYuMk7QOYN?=
 =?us-ascii?Q?5zV5U5Wa+5XlFoRH8Z3dmS+G0D+r0dzQrYcSaSJDkFWe7BvqUQPU2E3NjHzN?=
 =?us-ascii?Q?Ydu6Hh/JC3sniOFu1+FQypJqbkRqBI7U6Zxb/TOiRZlbXyME1JiUIMLiPEjL?=
 =?us-ascii?Q?KL8ql/tNQaTvdmTpPHYafz33hTRy1q7hWadGv0tHQiAXI+aeH8SSkwW33ZI1?=
 =?us-ascii?Q?97jzdzcR7CYbifVWvXD8unSu+MGa6uBaZOQQuqRz89CUFVwzpHR7zzes3/dc?=
 =?us-ascii?Q?rpy9AGbemOjGE5izdL8MMMbHw4FtStNmZ+IE1Y5ioCWKcO9PC9yx9Z5F7gY5?=
 =?us-ascii?Q?twKkcXvIUWRysPYAhpy1aU3MtTu0EH+rxO6UDdJMVQpvfWlI//C407GJn2J5?=
 =?us-ascii?Q?RYbXHzGjlh6j67S0Wd3Ux7suzsGK+tUw1X4SXfvZ81MPNLt4qcf2vWwqY+sh?=
 =?us-ascii?Q?mXbTDjIqIn4gYv3MeYWa9cOiWx0nY659n4rVuXiBx+Xus+7D7pxg54+8D/R2?=
 =?us-ascii?Q?k0BJmxtSTSea90uKsfC4X9opbMI/0LVz1Kfs/YmoTt8Ce+hVFOinMuqxYr5V?=
 =?us-ascii?Q?4fHnOSHGM6spwKMNaw0cWMEdeZYFlPHjIi2RWqeaSyI9AuEOPPLv/+3AKAMS?=
 =?us-ascii?Q?DMVSV8PZ6ZahBDU1oH4ECNNAB5w9+IzHbLpBBjo4fMfZ25GBCA39pnCbSSye?=
 =?us-ascii?Q?Rv9WyDVPAxBhL3sMp4JEEy3IcvkagcHryGVpnQoH6NuzpMvxbttJG72ONrM/?=
 =?us-ascii?Q?oLyuKmhjLP4kiBQEXpdDOmmYGRXJoZT+Qo9UAmOumEttQt+uE40Jed2CO0nJ?=
 =?us-ascii?Q?FZqNTMrk2MkhEkeb3uhj6GDDulugaip0mmANPhm0ewyyxVTZ1Gqm7QaENbff?=
 =?us-ascii?Q?Oykmbo/f9rDMAY43Bzc6bKf4fH+DL3i9ifL3r9Bx8l0IVXr7SUeGFQveaY7D?=
 =?us-ascii?Q?v2bjQg8dp4cAlEaVYfMABcnltcJpG+HT6cTrg9VFRQmtlXBQsADV9T9TrBB5?=
 =?us-ascii?Q?VdwOD9sia3LTQUjCMuux5wWTahpKwz3IlrR8akfSyFM0OrayrkeKleRQzmvc?=
 =?us-ascii?Q?EAfSDMrUrF+amKcaIg+Jli1cLjBWaN22vboS5sPHI5d17KgYzwOS5vDgIOdI?=
 =?us-ascii?Q?kszUU53YMqO8X3oiiKbTY+ITSmISyJ/QHqxP+onEl+w1Z6onIOhxLIf73G8I?=
 =?us-ascii?Q?x2tnJTk2rVJcTm0DObrMx14DtgXPAeT2F1VaSTfNDzusUzorFSHuGJ9W8G4B?=
 =?us-ascii?Q?LjNEJQnAVPg7DnjZ+pnKgfD2tgkIcAMpBs5IoGhSpJ+cZpckf9NM6tb6+W8O?=
 =?us-ascii?Q?qer4a9DTBtTk34woE4r4+VqQmtBREXLJdDYqkkz3vFMqSfPrf23+ddf+TPkR?=
 =?us-ascii?Q?3gUFmlJUGRSk5QOgb5ZxKQU4c0ZVEbfXx/sLnJ04j2vOPsg5xt5DO9714wQB?=
 =?us-ascii?Q?UexoQ34AEUW48LgVcwxN0V/wln7Qjr6ZuDkY8GTiQf9s1O8SC31cezJTKlAG?=
 =?us-ascii?Q?LnDIo+NTk1Y0Z17ZgGj2fkTeItCKLW70x/j94ijoZ5Pv8d7tH4tm4i5P+paP?=
 =?us-ascii?Q?vMoOvC2MmPjNNpnpffdt3wKLsKX9kBzsL6Y7Et1RTjyOLQL4+PSl5o18VE+R?=
 =?us-ascii?Q?ftgbQ3W3xlmBmp1AP18SYDkYoaoh81ZJUW+lr26JFyJexj9iPyNqR9bcrRMR?=
 =?us-ascii?Q?LrtVnV1XF7nSTfjeTU2rxTOtaWhfIis=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b717a8a-ac40-4943-699a-08debb06029d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:06:02.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIH5F4cyW/TZufWzcYY1TZJC39uB05o9M6PjmnjKoXTx4IN5Iq4Fowy3Wya7Zd0OwyQuIKAmPol8PdJjlTMcvwQqw9l7E+G9QR6ka0/0IRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7602

The Agilex clock manager is a platform driver initialised at
core_initcall, after time_init() where TIMER_OF_DECLARE callbacks run.
The timer cannot defer its probe, so clk_get() fails and the timer is
never brought up.

With clock-frequency, the tick rate is read directly from the DT node
without involving the clock framework, allowing the timer to initialise
regardless of when the clock manager is ready.

Replace clocks/clock-names with a static clock-frequency of 100 MHz,
which is the L4_SP clock rate configured by the bootloader.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 0dfbafde8822..4ed762c6e07f 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -491,32 +491,28 @@ timer0: timer0@ffc03000 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0xffc03000 0x100>;
-			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
-			clock-names = "timer";
+			clock-frequency = <100000000>;
 		};
 
 		timer1: timer1@ffc03100 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0xffc03100 0x100>;
-			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
-			clock-names = "timer";
+			clock-frequency = <100000000>;
 		};
 
 		timer2: timer2@ffd00000 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0xffd00000 0x100>;
-			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
-			clock-names = "timer";
+			clock-frequency = <100000000>;
 		};
 
 		timer3: timer3@ffd00100 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0xffd00100 0x100>;
-			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
-			clock-names = "timer";
+			clock-frequency = <100000000>;
 		};
 
 		uart0: serial@ffc02000 {
-- 
2.49.GIT

