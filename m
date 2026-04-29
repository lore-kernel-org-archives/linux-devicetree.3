Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023077.outbound.protection.outlook.com [52.101.127.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530C33BBC5;
	Wed, 29 Apr 2026 06:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444678; cv=fail; b=h3S0RKIz751DW//EkpQemy43fV7lBRLh3M0xkFzAlv2DHHj4ehpP0Zf0RLR9pQd12HiiL+n29tL5CVfPg23w28f7hMbLmj9JHwxUhy4YMmDOFJC3RMXYgaCzIelbBnf7lXheK2oy+9tuQ50F52v5Khmc3xKfMkQmTH5UkaObMKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444678; c=relaxed/simple;
	bh=U8k5WKhO/rSRZnltZdrRn4AOjZBIjX/45YqO6s+fFlI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eh0h3io83mXErgAe8Nq52vqIQi6tM5EwuQL969jD08v3Qpq7xqUC2iZJm+nTBo5pYiktJJ0ImPMd7OWEwiqAi+UhzflcqWLZKD5ij8KNxzJ+9EViPHHC19lT3ZUo67j0D35ADmC6f9QRnUxrWFN4npX3Sfp7AfX8r6mrB2yZbCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=52.101.127.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqXYu+1cmK+gS39i28hL9KfofXUFcQp32/YH5F8/mrJlJ0ABjJVkoBs2sevobfn3QuVX88M5vpxvFCSkY/qEISyYzfA7q97GrdxI3ev8z+rd7GE3uI0ARg3Sn9AKk4ilC0bmZRCPn3RUFg7DgoH4/o5GspJyL+C+fsacFtBCOo2gNy/cbDBM0Xx7U9u8MJVDLgJK7/XHQzu7JdpU1Xk+XtZTEOgcyVUu0HtnULuzIemvH0OchI8SXNAHZdFkpXA+X+9hyMyFS28m0FDYbTbbaqBXqW1Rp0zoZQqBhCzhF5as7+NwLARJIwkKVI7qUTWkvg+MfbNfA/2T5X0J4bA5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2mS3DSowEkLmiMlGu4NXRMS83sI0X0ouYw1sL/eX2U=;
 b=BCG78ai4Xd45O6cw01IiLEF2mx52fPKMe0AVmOB6GVdSSmgcjvuoTu8mf6EMUMxRmWACjVX3LFR2uaKxIN5XOtaEGOBpX/lggbYpue8oKJxOv1TffgGF8Dp29xz+b0NYXnFAKpZ2NYhVPyDaspKC0Y7LpTRv+Tu8dPGjjZGzgCCLZzC+DAYIFsoGKrlnfSbVsGmrTOLkWVwoWt5dZ294CcP/qyBnekfvqhAJK0e2mGjih/IE0b1+ihPS20Hvx2HyYz2ZRYKb3Qozc6IoHh7nFN7leZB1rPUHmf7mZHFP6oG4AFRNb6t/oZ23ec8i7Dl3mj0HYtOdNlaBBPrI4EHhcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEYPR03MB9401.apcprd03.prod.outlook.com (2603:1096:101:2dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:37:53 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:37:52 +0000
From: Gray Huang <gray.huang@wesion.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH v2 0/7] arm64: dts: rockchip: Add peripheral support for Khadas Edge 2L
Date: Wed, 29 Apr 2026 14:37:05 +0800
Message-Id: <20260429063712.2150938-1-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEYPR03MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfcb738-96f6-4263-f01e-08dea5b9d6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fSmOgYNS2oOsRs2Y71A2EAikrqLhn5Y2+gUeuO5e1tKYFdfG2Wvr9ips75jEbXgGm/NulFZ9WuYJKigdbX2M4Hnlvl4TqaiSpURUu0O2oUPV8P4XqkleYQ9lyc3i40I6CNnDbKq+jxW2+5jv5J6yEjtGZ1zc1zxwf5rzcuzAhLm7OZgppuhL7bUkvyU9DZ/zH8WLXh7le1wCSHl0qp12/bgBvBPa2eaQ1W4WQyOv5B0IghYkBRU/tEXpQr3qQ2N6zfWWeZYqQkzX16DAdWwn0tfBT0q2TMnDcB+AWSm/ae/MLqtEd3s7lxl1/0D4uYdrv8PGevO7sS+jauBC3aBJqUXodVn6AVzhCRBvgA0VU3VvEpE4iVqDonabm1GytAPbQ73VTY9hroVucxKOT9Ie3aVDOljiDX+os+JZ8m+40lPGTfXLkw64qfKKtr3PWaud4AHbzDRAKF0ER1dxUIpFO2Bl2xjxcaBQB3ZoBh37njES7eE51Cp3q9Wgg/+e8zBi0+i8bUrCHUqXJLc32Ora1QYwXB7QfMWqWk0jZmXX0MEgDLDKtdpvQWLMekSg2xQn6CcukTK35seZTemJHIPNgZIC3n4k8XYwuRjtNgc6k+HtByRJsRtw2QPDDuboLH2nwJA2AEQCM4NA8E+ycer4PXcf1HhXuQHvCPZ+e6wLsHjNkmZajoguuUtt3rU0e/j9SXFqLkc3NmYKWOE1QiH73QzoetNAlgF7w4K0G3btamxPz8blGZdzZw3jnPs35YcQu6uL2h+PulWGwMB6k+aC4KX3hJMhbSA5umUZeTeguzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x6MaIWFws88cUGdjaSpAKb5Wj/fyOHX97B77C4IKi5d4xixLJqJyYt9iKjtY?=
 =?us-ascii?Q?CLvENG8tGFx0doeVQp+015MtGkvoUzGpHX8dAtQv0aD/+K+RWnd3AG9SMCIX?=
 =?us-ascii?Q?/ZN15DqPCsznrJElAa+vS5QZLtqK/+cUr8rvlRzO7PWAOJOpDsk/CHZHulpZ?=
 =?us-ascii?Q?rY4QaDloVpaNLtK83KcGq/ahxJzUUbU9mYHRV2lkr3mE2LMGYYLhfyCeqveO?=
 =?us-ascii?Q?+Bfk9qX97z2QCNckqPGOM5XVlesZR9PEVi205or+0UyjlDyDwOAnnweJgbpT?=
 =?us-ascii?Q?YJ/rli+duARIJ1cpaV5QxmO0UQL8O8XsfS8Gz3iamc/LHDCENwCJgEnlkf/0?=
 =?us-ascii?Q?ZNHyYlDNlkHqgMVu83Jk6V9LFN8zovzf+jX5AObQCzJwsQ0GohxnuRpTM/cy?=
 =?us-ascii?Q?rkWpSuPFvGCdguTHxHpnl8nQIinGziZ+OFHOeVsMj0HVwenU3W5PwTvg+MaO?=
 =?us-ascii?Q?ZkvTxfMaq+L9la4OUYoyj2xWhz5L/mtO1/R5aZ6sLJutLYipwbusuUPmioh6?=
 =?us-ascii?Q?APz21nXSSLctJ2a9pQM3EUCGW+fCxuFhKVA4ff++UaoleIWWvD0cLT6peaTX?=
 =?us-ascii?Q?Djmy+ZX+ivETeZCtc1EmXN+8akFgvfMahzZuDTH/fmfodqWGIeHTGUuAP/qN?=
 =?us-ascii?Q?nAraMztQJzDdBwCMfEW3jkz7kIAh6n/XwZDMMx1k0fUnkc3Vvsu4sYdClS2s?=
 =?us-ascii?Q?/j6K0skn4h0uYfIKrHDZ/EgZ5U8Ip/urjImgIfW3LdQbIGu5Je5giAR/1uyL?=
 =?us-ascii?Q?2LX2x3dG1zcH6aOBqWp+h4F+qOmp3SngNcbBs1QdqpD4pN5UYWVdbbbijCWO?=
 =?us-ascii?Q?B0MtvNDj04N59WO0FzbK7zND1/J2Vg+KVVaXG3QXcGHxbKSCicgz4VBJb7mL?=
 =?us-ascii?Q?JRZOzBUfoo5OGSaCYKMxzssYFBs62zj82dtRFVHiPbCxJyQAgRk8cDLAAxHy?=
 =?us-ascii?Q?NTv98csZYjXjjYFh9J/mk03xWRSGHWZkK2aoOM4IMloMinrFsA6SPopaPm08?=
 =?us-ascii?Q?EmbBKz3epb78uAkEy5vRBaTkIqfbk1It/4Qw5bVBVac1vadiDvFtnZiPqMyR?=
 =?us-ascii?Q?lipvcryL8CAgDZJkXU74ufeHpQWkfb3LIRHnu0Obi3P1uLCcwudj+xVmIa4y?=
 =?us-ascii?Q?n1PWKD+FYy1gBqWu6R+VKHokcOf84+5EBuY+gw6IsoqXOLghPqMbH9/2x1O9?=
 =?us-ascii?Q?aOxJkYpH8GqS7T4r7646HjdhDmZQ4pe6arLtSMGrsu7SoorI+oIHh4+9jdas?=
 =?us-ascii?Q?uKU5ROov+wH695SPDXkWAS7ioKu0ZPGcs+nUKPP+UdeRfkxY64cvDMIaYchK?=
 =?us-ascii?Q?E2FJX/y+1mGCmAo9tCjCAcb10LoZ7BC9WwQPZrdqVGHcEKKDx5f0A6+SykX/?=
 =?us-ascii?Q?k8D+L+mvbm0dlZe2X/AhG4t1bp8PqT5H76XAMKUiYKPEpoqTu7zJ5Y+TSDQc?=
 =?us-ascii?Q?53Yqw+SEOdiwnLpNs9FFKGl2u6EXCCk4BeAaD3nZH24fS9lejDHcf/LcU783?=
 =?us-ascii?Q?Loaavjoq/7shRpyKcYsRnNjLindIdh6snmODSrMWgwJo3kD1WrqmrZ72Hn6d?=
 =?us-ascii?Q?AnCkdE/cO0O77aG6qjh2+vrmE0+y3crNEHOVg6uIzmPgCGx2JQOpfPKgQ/EA?=
 =?us-ascii?Q?JKZN2HtzGkqrag9RRSHAIB2TqwCrbweRkg9qChgdsVVYcOVpbnDWngV3JfTT?=
 =?us-ascii?Q?Th4Kmqe/aSavhwDmSp8diBi2jWpBkfXpfptrve5Yo0+Pl4mN8zEehC6C3CL9?=
 =?us-ascii?Q?lreOr2knuQ=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfcb738-96f6-4263-f01e-08dea5b9d6cb
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:37:52.7448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kPOOaKBUVaPXAVlQazuzVrov0LNf/Gkf8ZT/Hpcpju7vcKdp4QNkOPB87ojQaJonb2q0R2BVVGtw15BSoCNSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9401

This patch series adds support for several key peripherals to the
Khadas Edge 2L board, which is based on the Rockchip RK3576 SoC.

These patches build upon the basic board support that was previously
applied to the rockchip tree. This series enables essential
functionalities including power management, RTC, wireless connectivity,
graphics, display output, and USB support.

Summary of changes:
- Enable PMIC (RK806) and configure CPU regulators.
- Enable HYM8563 RTC as the AP6275P Wi-Fi LPO clock source.
- Enable PCIe-based Wi-Fi (AP6275P).
- Enable Mali GPU with proper power supply.
- Enable VOP2 and HDMI display output.
- Enable USB 3.0 Host and USB 2.0 (via internal hub).
- Enable Bluetooth (UART5) for the Ampak module.

Changes in v2:
- Split the former AP6275P wireless patch into separate HYM8563 RTC and
  AP6275P Wi-Fi patches.
- Reorder DTS override nodes to follow the requested placement and
  alphabetical grouping.

Gray Huang (7):
  arm64: dts: rockchip: Add PMIC support for Khadas Edge 2L
  arm64: dts: rockchip: Add HYM8563 RTC for Khadas Edge 2L
  arm64: dts: rockchip: Add AP6275P wireless support for Khadas Edge 2L
  arm64: dts: rockchip: Enable GPU for Khadas Edge 2L
  arm64: dts: rockchip: Add HDMI and VOP support for Khadas Edge 2L
  arm64: dts: rockchip: Enable USB for Khadas Edge 2L
  arm64: dts: rockchip: Add Bluetooth support for Khadas Edge 2L

 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 620 ++++++++++++++++++
 1 file changed, 620 insertions(+)

-- 
2.34.1
