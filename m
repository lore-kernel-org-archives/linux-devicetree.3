Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF973C73FB;
	Tue, 26 May 2026 23:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779839684; cv=fail; b=mZXN/dJA8LEPpGuL0faSaQZCV5WGS0dBzCj0LPK6pp2KR0Zu1XrLHQ5xo9tAJssAdQL1bXsgpt6Cs7VmiO/nQR9hgz0DikslzVau6kyHt3WjlB0ggZAI3Dan64kJ+D1DvDqWRT4S+VE8l38/4bjU2YcB+w3RCB7p0Ks89utyJu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779839684; c=relaxed/simple;
	bh=7p2VzqVJH/6HWZzme8wxPzMpJf1QzuwK69U5j8DzNgE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tnEvZ5jAwgdAUGSFXlgDIm8GOfcRyTlPTheSWKoA3hoPzbVaTGjwRHgyAA6CRYjrzg1ulAFtfiv688NDg5muEdF0xDro7T2aijY1LPaJQgWZrBfHJDeSwxWfzbPvDwGQ1hbRd4Gbj8mUqXJL7plgdt3+yGr6HD93kShTthFJeHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Sb8drrcY; arc=fail smtp.client-ip=52.101.43.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Sb8drrcY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wz8OJ7Q3NzSS8vavXtn+B86kyeA+qOU0zkupwctOzrTExjKnhHX9cyhhiAppfV1k4RTAvbJABJgWyZ7hW5q+Pc46SdjI+HqNig+geBwnPjHyzB6e+CoXXs3xALJtcgv6tcgY1iIvW35Dex+/yMQ81YWhNeFyM5H0IJR8r5TpIti0qpLQuZcs/lAWxXNLSKOAR1dYOg1Rsa2JY3Md9oLtwr9MGO2ezuDww5xD8B3WyKkKTmuelz07u82Qh+/ibtEEBAnH7UiUHSMIbPIFeXvL5bPiLNK065q09oq+zUM7kcQjJKZM/VCQvmY1mjkCjruJTmGzlQyhX4Lr8gtQ9r72bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y0J2DLA0WKmWHOg84fGN549NExw4TSDDlEyhre6mo8=;
 b=o6P0AUJSQ43MJb8023kJ41E/EIjVh6Kem/7PFmnIPijHj8MR7XwKx63OruE3/fQPgQZDrmBjG4BZGYRro6OByH4D7iaFUzOE0Ic2Q+sl81T4ZSrpAExG0WJagrqzDfpAMn17ljL8UHjvvHDYz0X2ioiWjNqxC9JTc3OErhUZaBMwrfGpi8qVlG7MtRpFxXeGdDP5KUl9c4/t9EVZCr1YTZRmkiJcyvbsnAlWytd1gTJ9mWH7T8wvl16pfyh/7qcykkBucmTnpxzL41Eh6qegKCljbYXJ5Wrzh63XtLSFn35dF6eDZqldZKVlNDLDoRUo3GE3WIiYVU2WDaataQTnWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y0J2DLA0WKmWHOg84fGN549NExw4TSDDlEyhre6mo8=;
 b=Sb8drrcYn1Ya1rGN3BTrgyBzvq3KRTITR7DeeX58YC0uCj0nZZg5WzoEdMYcqzwwAgxSFDvWwx2Jv3LPDAKXiW3KBiMFxLMsuneJMbqYwL+wdbKr/cbHI1/GWtzKMkzEEneV+mTgJiKuHhHgMxBNxZGK7pFrMaAy0mqsDEK0JYQ=
Received: from CY5PR15CA0128.namprd15.prod.outlook.com (2603:10b6:930:68::18)
 by DM3PPF424CCE606.namprd10.prod.outlook.com (2603:10b6:f:fc00::c23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 23:54:21 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:930:68:cafe::48) by CY5PR15CA0128.outlook.office365.com
 (2603:10b6:930:68::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 23:54:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 23:54:20 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 18:54:18 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 18:54:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 18:54:17 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QNsHIS1896232;
	Tue, 26 May 2026 18:54:17 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 3/3] arm64: defconfig: Enable drivers for BeagleBadge
Date: Tue, 26 May 2026 18:54:17 -0500
Message-ID: <20260526235417.1326187-4-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526235417.1326187-1-jm@ti.com>
References: <20260526235417.1326187-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|DM3PPF424CCE606:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a4c875-5a13-44f3-6fde-08debb821ab8
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|6133799003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	I7RoqcmoWlAJ/7gZGG9JWENco4R7ynCAf5rP476myS6K9t7mq4gTdhOPOVgZp6qxVLaJkp3+r8NZVmczROU9TYHKeiQja45h7LqKUnoR9J1IjAc5luwd1LpfrvnMU64xuly36pUeGUWiJnNYRRm7H8S2dG6VYqpVFgKDW8jZ622/ViwD23FHkCa1J4tPpDgCQN6nhf3sK1kzgIwUUUrO1ghFsJvc7R2h8vn3S+YqO+IaLH4iQVXHOnNM/80VeqCOUyCoEYIinIxFi4BqZUy7FiEpXZXaEec7g75peYv9yiKjXrWaL7I5tS5v2qfFgGiAabh3JWfWTN5tL9QS/5A3/w6FnVodhOIRbzL/yURU3an3sC1BLbYmAY07Pxx76vPzkDop5CQQncG6xLGqo35PaVMJ/DGoBcF6gishfAmYOMSdxBlhmWpC3Q4/qJipg2TcIhqjakzkm6EOguViwPIgGzl7peoWJe7xLO1yMAKmXKusp7PrRy0LQXovBJYNYo4uBXT/hIMv7FTB2oofIssNjUmN+zV05glUEEQy3fbT73+IW8vJMquUMQcGb8/x2VElu6cQVv0wtpw2hBQmM2iPw+1Kg1mmHlnYLPpcd8Mp6zjB73pi0JUvHeAyKRLJV6i2yKoxDud4hL+g6Tzo1p/Lm7EfygI0ZZdC8ir6UKFvmua+EZAmyqSuaPgs+xLv2/Yv
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(6133799003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AK9gpaNx8jRV8W7960Rt298tdJdkqn3KUWJ/gKIJb1WL30R2Pu3ofpDvIIvNFpa92l8Tyt6JJmq2uio9KU+8lm8J8P+QhqTjPGWc+xGAGr1SMoWeFOgDjO5miuZVORdi2kikjpukbG+8mBgrNP/S9YLqS54mYB4CDzvRM6LbhVFryc4+0UWCnPiFRX6f47aV7ltV4m/m97aAVG7TkNyHaH7xNJzn1KSP6aDUyllb79S0ZRPvTr6SCfefdc7rEElnEwnvmSgHoWLZHi59OW0RNTp+u1nI81cBn0734Fxqd5oGazHomNrR41pu8s2P9NcY+iUX96IamYqjWAFMuWPwb4C40c0ize9RHRNXp9dOvhbKVPEckKZ1dKPbuskVlVnhCGUNE6JVA9eByionpXD8F2ddTWOvZ5cwLTBwC710I8MbzAsSEHUXKhL1t0/jdRFp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:54:20.0649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a4c875-5a13-44f3-6fde-08debb821ab8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF424CCE606

Enable drivers used on BeagleBadge[1]:
- LED PWM Multicolor driver as a module
- MCP SPI IO Expander driver as a module
- Seven Segment display GPIO driver as module
- Temperature Sensor driver as a module

[1] https://www.beagleboard.org/boards/beaglebadge

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changelog since v4:
- Canonical URL fixed
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f939..5cfb7f6f2ae78 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -634,6 +634,7 @@ CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_BCM2712=y
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
+CONFIG_PINCTRL_MCP23S08=m
 CONFIG_PINCTRL_RK805=m
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_SX150X=m
@@ -766,6 +767,7 @@ CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
+CONFIG_SENSORS_SHT4x=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
@@ -955,6 +957,8 @@ CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
+CONFIG_AUXDISPLAY=y
+CONFIG_SEG_LED_GPIO=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_HDLCD=m
@@ -1332,6 +1336,7 @@ CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_QCOM_FLASH=m
+CONFIG_LEDS_PWM_MULTICOLOR=m
 CONFIG_LEDS_QCOM_LPG=m
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_DISK=y
-- 
2.54.0

