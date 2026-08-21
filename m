Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013023.outbound.protection.outlook.com [52.101.72.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EFE352C51;
	Fri, 21 Aug 2026 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324270; cv=fail; b=Cy3q5JWBpVg+ev/CZj7GhBZu9C+syjl8Yq8GKZl54Ru2x8sm+LWS6ZZ9H8adMdqTS7qXQgIBj9fuP9cKbRT7liAkiRASyy4Ho4/AUqrl8kh3jIsTbfVWgxQy2c0Qph7OT9SEDEeYyd+Fi2FULt1NAFLHsgdzK2DDfQYYDFJW0ME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324270; c=relaxed/simple;
	bh=Tp7v4PPqcYIzq/YJxtGFis0eEkcpGGjZDuG4UV1ZYM0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=gL6j5aADZ6eG5aXWd4xlayjeY14NbksCf8dqK6oKIt06xEMrwMryQPqdLoOIB3H2l50DIpuZaszP2Ky5X6dFp+zgZz5lsd4TT62oo+5HUotEBb9455uEqfDv544wlx1u8UFAPSY2v8Bft5LTvBxpUxdGYyQ819xAgFYnNs4TmNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TgOwhN1t; arc=fail smtp.client-ip=52.101.72.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TgOwhN1t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xK/jyS3BDOveoHjefYY0+CAvXMQS3kv0BQVK8YKMj9paYWVWJyc32Il3VPUtok9zM96a4eKyAhTSGTEArOEIHIHh187deNdJOkAbbsH1QF60fyT96NP9IdkW8q5I0/IWsYyBGAoRjnBHwfIStHNIKbJJelPUWmkRFH9FYtTdMXGL6jqWhMZo5Dr/kByZmjvZ3dCulCpm3+Pcu2emQ7R+Xoo/CyaFqZskjiCjKa+LsSLcl0tHunEytBYtXEWjrJjoKlxGh84IQkgSq2RU4x0WoVsfFYH8a+QB8KNYBqQnn8kehDz0XPnx4Vcee4pFRNhcbJJ/DD+iHq+n+1XJhkeZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rEnRxwBE190V90aesskVGPMv/fjmGDA7i6Ttvibg94=;
 b=LpTjOW6VbkSpGxxXoMz59e54FeG7omZEt6LTjfehGpTPPuXoy+BcTPtp35HSOMXKrik7h+oFj7ug0YD+JpN6+h1J441+MpqYj0lZGFhs22kt+RFMZtkWfZElbi8HrvmiuvxszhewGkErROiVOTgG0VDHuRlKQd/YPTLPYgFq+vwfyED5i/fD9hRvnYLta/T+HjvW9iHfgkI5a42AAmItY5syOdM+kkM9+cvQTiTuu/yyOabl6eUP+Xwq3zemCPfveOPTiL5aKBmTzly9zyZBFwOlK3wpvGlBJj74Z1QX8bCZ3jMG89A6gWfEOUinPSNH422RmsGD7JPeb+XjhfrKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rEnRxwBE190V90aesskVGPMv/fjmGDA7i6Ttvibg94=;
 b=TgOwhN1tFR0s1CE90aDIux75pnvA6vckx3jVR1gL1YIJDBQaDWCCt8s/QCfBof6ZlIAHUVyqXBvjqr/u7wDlB+pTSRiWnmX0ZZuxXwBBY0TXdKeuXEkRfYFEcEzWqfGc+yRlrJNMJR9FNsntlLMpvHXtRB28LFwxUjInMSv0PpCZq091KaYZhOCRe/KvC7f2G9/B41iApEGP95yh3+B3P22OSMs/VNqw96jgqn3BA/6sriHSNFAois+xqj3CXQMBMeIJg+AigB8pMpnewob+gzonaKxuHVQmuP+ADilI4WLGcpEwrTGhvCSEIhapfzv4gy9mHbsnxYumx+UBaxLBBA==
Received: from AS9PR06CA0456.eurprd06.prod.outlook.com (2603:10a6:20b:49a::11)
 by DB8PR10MB3193.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:114::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:57:42 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:49a:cafe::2a) by AS9PR06CA0456.outlook.office365.com
 (2603:10a6:20b:49a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 14:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:57:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 17:03:17 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:57:41 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [PATCH v2 0/3] ARM: dts: stm32: Fix STM32MP1 ev and dk USB onboard
 HUB supplies
Date: Fri, 21 Aug 2026 16:57:37 +0200
Message-ID: <20260821-usb_fixes_vdda-v1-v2-0-23cc919b59fb@foss.st.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGFniGoC/32NywqDMBBFf0Vm3UgyRftY9T+KSIxjTaFGMhpaJ
 P/exO67PHDuuRsweUsM12IDT8GydVMCPBRgRj09SNg+MaDEWp5RiZW7drBv4jb0vRZBCUkVkT5
 dZIca0m72tAtpdm9+zGv3JLPkUDZGy4vzn/00qOz96+cLIQ2qo6xR1dVwGxxzyUtp3AuaGOMXX
 VTo58YAAAA=
X-Change-ID: 20260821-usb_fixes_vdda-v1-0e5eea790b2a
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6C:EE_|DB8PR10MB3193:EE_
X-MS-Office365-Filtering-Correlation-Id: 2299d41b-3215-4540-e37f-08deff948d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|23010399003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	oCb765l4t424xOY5sWNp1uYJC2cClZjtPq6HyH49/W64nMv9IUJuulaj71SbYVs0V1hv9IgO5O+sdspQB0nUmEZ+qYPEW2Ie0rxpjNaFgYWHOEgZ1q73kiMtJOJ3YfpeUCPZW2bcDpky/kCGC1gfDoBX2YGDuPNWV4tIK2V8I3lvnA5Difbyvn3luskPAe64MKi2KITsQ4HS44TYsHaMFiHSs3CzUyf3LO2L9DQzqjdeXXixO+3KslyEc3whwwxuuUIfRPzCFtprUIiZIhqG7mLeffsakMdLxYBjmayQH4l1aqT3GumsRWOx6uv83202E2AFVtPEyrOL8nXK3rzVQsRUZs6Y1nOj6hnUCkdQJryqQhYCzTSplgpG/TM2bM8BFGv0GEst+nPK5OWxkZKerzw78TT05RkPdCc6yXGW1UB8vy3P0YFNk1REKWnJCVGt9H49q98Xx4zO1dfcle2WM30rp5yOa3xpdhm9Yxy7CwafZ4MUBBLQJTkXMREDfj2BAMTbfeJttmELXg3beJvAN3m6aupwiAprDIvDRu55jwxEOGuCKDipOscabCfWXDoRiFzSyUqXq8nRxsgwBUck+b2DSrV18GeL6AqHnSBec+UB9VpKo3hH3qbcm3knIXygbDvpJ78mjX1LX6BufWiN+9zcG8UTovDirWgpDZG8mZo=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(23010399003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nULKT6NcXDW2TM1RFmgZe5nlPgiHz2EVq2WDboiuQgtnEXcP+ntgZKTGO+Vq5FonEkLQ+aJwlFSJUTZzoVxbjRTFcuJ5naSfeHqcw/WEMXwidnvNB6lTcfRYcZgWVYh1k4zbhKvxrOoYqOhkjtEzJGvaN8Uqd1mSmHMGKJodKYLiEsTuynWiZZJQnOmtt9l7ZuTJ+SPM6feLay8FyIBE04DDIxv2i3hp2xDO2M7io+2HhmvNKr+8OEV0cFpjFZUkoGg8rsk/C1eM5T3AmEp+1I9mvuMhPu7/N2yAfyfQkXXISqmH6NF6Wv3HCDNLNEXYdDsE7pISSB1xwM54Ts7iuuOJQYP7l7Sq7Jh6b2raE9VPzWicjRphvtjm5VR90Urzs7Prrl6l9G1VnQWt5dPeKxVH7bQHqMreKpxbX4fUJlvreUSZH3CLFQ0hw+eVAic+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:57:42.2113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2299d41b-3215-4540-e37f-08deff948d3c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3193

Some STM32 boards use Microchip USB2514 HUB. Since vdda supply has been
added, the regulator framework wrongly associates the 'vdda' supply
dedicated to ADC, so the wrong regulator is referenced.
Only the 3v3 regulator is used to supply both the digital and the analog
part of the HUB.

Before this series:
cat /sys/kernel/debug/regulator/regulator_summary
...
    v3v3                         10    9      0  normal  3300mV     0mA  3300mV  3300mV
...
       5800d000.usb:hub@1-vdd     1                                 0mA     0mV     0mV
...
    vdda                          1    1      0 unknown  2900mV     0mA  2900mV  2900mV
       5800d000.usb:hub@1-vdda    1                                 0mA     0mV     0mV

After:
    v3v3                         11   10      0  normal  3300mV     0mA  3300mV  3300mV
...
       5800d000.usb:hub@1-vdda    1                                 0mA     0mV     0mV
       5800d000.usb:hub@1-vdd     1                                 0mA     0mV     0mV
...
    vdda                          0    0      0 unknown  2900mV     0mA  2900mV  2900mV

---
Changes in v2:
- Overwrite vdda-supply in stm32mp157f-dk2-scmi as pointed by Sashiko
- Link to v1: https://patch.msgid.link/20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Fabrice Gasnier (3):
      ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp15 DK boards
      ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp157c-ev1
      ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp135f-dk

 arch/arm/boot/dts/st/stm32mp135f-dk.dts        | 1 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts       | 1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi | 1 +
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi      | 1 +
 4 files changed, 4 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260821-usb_fixes_vdda-v1-0e5eea790b2a

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>

