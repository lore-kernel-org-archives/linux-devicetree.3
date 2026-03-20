Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021096.outbound.protection.outlook.com [52.101.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDC73C343D;
	Fri, 20 Mar 2026 21:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041864; cv=fail; b=OON1fZUGxbIDlNSheyejfCo14iwWoGLpifsrCZjiY5vAo8mnAgslTZQh8eG3FtHKSCub2lVc5LzhPFjSCcJ+RnbxpwZuIInYxeWJGqhOUOm5oqYgre/Ga5XkOdH9ujb5aAguR+XrxVtLLeQh6aXEY+LVmo+plAxWF0EQl4ZCYbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041864; c=relaxed/simple;
	bh=ppLrR9PHWrztHi3Z23wsIDWRyqoAzkHth55vLra5ymQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qrx8vLmQ2o806YSNJ9/8aLrF1/M2+pR8ZYFoZtvLrLOi/UBS8K8yjlio7yUBpCpZg7QSIqQf0vdFdXtJNe/fIzFSgb4z+9XmtQ2XDxfLit7BSb0MTrg9mG6ftZrgWNYuBw+TSkr7B06wJm3yQDHa9Xruzo5jleZ7vlbl23sCptY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=ZVVVr9YB; arc=fail smtp.client-ip=52.101.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="ZVVVr9YB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvzMvlzfY5iSe7J9yjVzy1MuQ1Z4sDFlMMVTWqn2clySceu8YsVcq2M02qwSujaBbPT9H6nIaNSDybxZzua5fmv1D7ryaiOfS4M75aqvvgKHqs+tSucNU1ztlx4DhNlWu5rxBnyuUe5X8pFSupxhkdBRrqKu3XxxL7QUfLSlSDLp1g+7PS9nuAiUDl1GjnSa+3bVvkiKfK7QaGjBV88FcPJoGnEloJ1u1V8HGOlQPp3Y7N9Z9T8kPSAfO41+UxqwUdAVfBmfHwNGJguME2X+Qr57z3J2H0h9YVSaqpNrf+7xL21rzs9rVnrhQ6gEAX5zv41xu8cTrZqFtciYSrm3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7rCkahZMQr4avF0pZaslNPjysPyDGg1KpHEPVRlo9k=;
 b=IYJyiabd3kpgv+JRFY/3u3IM7vpTdc5EAwlVrIPdfPHSIbmTCwqTlHp8F4Se89YwAMGZt3B0NZvUKXseR8MIA76RstOfXSQK4lUf964uu6vwa9Nn/l2OvkWtbt68MQkbSUbumYxpNeKnN1cWFIub/E67dOXTDg5/ipRl0uBbbQ5QYcPTl5ju72oMZebm40i/LVgWURLcobdzFq1YqSZ85UF0KEscEaak4E9LQJs/aUGicaQLGR3SPsWAfYiV2HWzzWaQIpklcujPk5rbZtAZ+Fxa5IeiVpdLwGezS3fIui5A4K9JGPl8eEkxdpTK4AeQ92zbXQ34tumdnjNEkqU9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7rCkahZMQr4avF0pZaslNPjysPyDGg1KpHEPVRlo9k=;
 b=ZVVVr9YB9I8in96SGn0qru5+aPf7wBmRsUrcXp98Au+NOxHe2bkeT5UNY+eWIDr3oKcC1bYsmelNQWFh7OUcx5gGaaxODZZXQgl3ff1Ic9y5cAgn8Z6/UITszrFStlcfotrdRk25NWTTO0fyuAbl2VAeIDOtq6YuwlgiAWqgMZMQ+Po1WhRH39fEtiZZ4j8zy9H/ARhvnQGVID+PIdDUSLT2XRBTMMDa06hS/cymVP4R+yvRFGAdOUiQKUccw704S58H5zlvkfMjs/FMHGa/e8lLXOBTiSt8S2X+OHM9r29RAnvv6bzWXBLI92I49oy0BANSRx5PIDpOh1/S7MlZYA==
Received: from AM5PR1001CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::29)
 by VI0P195MB3207.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Fri, 20 Mar
 2026 21:24:13 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:206:2:cafe::c1) by AM5PR1001CA0016.outlook.office365.com
 (2603:10a6:206:2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 21:24:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 21:24:08 +0000
Received: from lws-haller-privat.attlocal.net (172.25.39.212) by
 Postix.phytec.de (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 20 Mar
 2026 22:24:06 +0100
From: Dominik Haller <d.haller@phytec.de>
To:
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v4 0/5] k3-am68-phyboard-izar dsi support
Date: Fri, 20 Mar 2026 14:23:41 -0700
Message-ID: <20260320212349.420951-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|VI0P195MB3207:EE_
X-MS-Office365-Filtering-Correlation-Id: 991783db-1ca9-4eb6-42b7-08de86c70592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xFiBGxOhGk9Ie6D1m5A7VUTqdQEP/Bk0wgH7Feo1LcP7YGoOQmLztIX1ZL1WHdSleXpDlF14wVUnR6zS46Y10eg22+fBkz5OuTIB9aSbUUxqm0hlUMBQ5ByTK+NspEexteqc148hRCdaBJSdy6IWY345Ga7QX/jipQTMJdDJE62R/0nu2deM5Atl29eGAIQVD4ifWIBZyqhRS0Rd4xq9FLECxyUHHL4BuWPZHnP9sJBqA+RG6+m8TnxiiSsvSoqivCaIww8jjQ4QvZo/q3qms+Fim3Kf8jUOC38jjUt9xrxYCw9rK7D6JW9lhoeLmm/2SNzyq4Er8E+aOwHWULpuWJF0eaWi9WLCl3j8NaWddBmpw6/h/nOBW/cC9YMthuRhTmbjgZjHp3Zfe2GW44AqB38ufWXZsFGKxnaNKdZM0NIaejmNDEc/f19+Pvy+dHnDEhZ7Mn+sLH6sRNnkDa92XBWCe4nept0wdjO6HUZZmtWapNk7Va25RvF7XalPXHLyBcArx1qOjTxc5cD/EGJ/q76ru4lo5zsZpjZu9kFqJyqU72aGNGhu7fyl2KnrrUwOnZ9D/+H7c+qNgG+b/ejad7ujKuklYupgB/3qwWUPOkq6U39hUnnhmGw3qSUgsQhyo7elC53AHYj0h93SCpSq9dRQd3SA5AQ1RPgbjYsaMYiKA5gFidouv5E7d/edaeWNyDqmtsGh4NumR0evR4odJ97/0NAPI6gg1reNpaPQtywcjzpAS0s0FwUEGTZna3pB4j1Y07eSTAHOv2XR7xlI2w==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q5NDZ9kHszBb1cELQh5N7A4YwAM1zfoNCaVrT4myRwZn+KvePFqJQSJJVpuNFZLcntLFM3HOQQtBrKoJf3eiZDE0jNJDdjyWjnmnIEYhDCDGbkOgOLBF+NnGPPYsyVilZxje5mLJicf1rQcEBj7ljr6accIv9WrA07zST/SR+2kbDk2Bs79AzqOHMPDU1z/MDcUe4LYnn3x7oVvHvg45EfQEQc3uSDFRzzAA//R2Ep4gKBmDsuhJ66Qe+IETRoQoJq95V9dHhJOO6HTZTa6zMpaRc42DQyy7M5YCfXxdM2RQlrZDJ7gBagkECyo3S2rhuePe5eCPlUSw717AhnziOjXATU9Tww4KozwmapqYsQFE10Ccz1EhkrMwjH7xKEE6j7fFnrsi3rY8X9cYO8NyhNrta4KMCUjnPZPaQFxqFbEEn0fYzZPnLvVt1c2Urb6A
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 21:24:08.2836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 991783db-1ca9-4eb6-42b7-08de86c70592
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB3207

This series adds support for the two dsi based display interfaces of the
phyboard-izar with the phycore-am68x/tda4x som.

dsi0 gets converted to lvds on the som using a SN65DSI83 bridge in the
default configuration. The phyboard-izar kit comes with a 10.1" lvds
display with usb touch as addon.

dsi1 is routed to the carrier board onto a connector. To use that Phytec
has developed a small extension board "PEB-AV-15" with a Lontium LT8912B
dsi->hdmi bridge.

Changes for v2:
- Drop the following patch as it got merged in the last window:
  dt-bindings: display: bridge: lt8912b: Drop reset gpio requirement

- In arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
  Reduce pwm frequency to ~23kHz for the backlight. This is supported by
  the backlight and works better with most fans. Since the fan connector
  is using PWM0_A and the backlight PWM0_B they need to use the same
  frequency.

- In arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
  Fix license in boilerplate: s/GPL-2.0-or-only or MIT/GPL-2.0-only OR MIT

Link to v1:
https://lore.kernel.org/linux-devicetree/20260130205820.83189-1-d.haller@phytec.de/

Changes for v3:
- In arm64: dts: ti: k3-j721s2-main: Add DSI1
  Pick up Beleswar's Reviewed-by from v1

- In arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
  Fix the remaining style issues pointed out by Vignesh in v2

Link to v2:
https://lore.kernel.org/linux-devicetree/20260306033151.276202-1-d.haller@phytec.de/

Changes for v4:
- In arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
  In arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
  Fix whitespaces

Link to v3:
https://lore.kernel.org/linux-devicetree/20260311234844.56443-1-d.haller@phytec.de/

Dominik Haller (5):
  arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
  arm64: dts: ti: k3-am68-phycore-som: Add DSI->LVDS bridge
  arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
  arm64: dts: ti: k3-j721s2-main: Add DSI1
  arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay

 arch/arm64/boot/dts/ti/Makefile               |   8 +
 ...-am68-phyboard-izar-lvds-ph128800t006.dtso | 125 ++++++++++++
 .../ti/k3-am68-phyboard-izar-peb-av-15.dtso   | 191 ++++++++++++++++++
 .../boot/dts/ti/k3-am68-phyboard-izar.dts     |  17 ++
 .../boot/dts/ti/k3-am68-phycore-som.dtsi      |  17 ++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  39 ++++
 6 files changed, 397 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso

-- 
2.43.0

