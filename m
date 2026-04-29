Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022141.outbound.protection.outlook.com [40.107.75.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33AD33F5A8;
	Wed, 29 Apr 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444690; cv=fail; b=TKMBobXm56UvBIly1l31tntR+XO9dsWhruzrOFZBBTclJAey1crHhon/RY46DXdUcSSz2e3L2OiSatd/zU3a6bHOgrZZGRsMJ43MivRhMJnQmHuubZe9yv1yn0xdtaHWimZfaWdzFJsCf/nlB1sj1KsZYsHPgZ0j5vP1mAiJOqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444690; c=relaxed/simple;
	bh=0zJFY2ESeEXm6ghBPAmyudT0HUpLLbO973EH58McHQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H3YZZ357oSvKjeGuxSXavVEvAsuwEp9cieYduxFvc7JMEhnOIlrFLe8a5am4Lge/2c2RjVV6T4lCcPgpfZtnDz8IsYxYaD+0fQhbHNYqN02j4tE+5ycU449/pIDCxOlCy7IT+2Kn5q3RodfnhYwPioyeqK6Vv3JWeV6yC3yoHxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=40.107.75.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpUdgNGF3Z4U593WaiGpW7JJfWT2O5gk+X28PqaMN/LLue2XkQAHWf2ZwU/tIIYtM7sXnWP0t80VZnGXAxlR2w9K8DLMRtuGwVmRKigcorXmdG0YUA7TNysfckRjDnYw1p0BjIqS+xsByo0eAZ5UnkswRDuFU00ixaGR7knkN76aeT7Vz5QE7Kpf2yit81eo/BYVUqhvXHQ6djoqS8lMaQ4Tg/mTbl2tJ/xT0xvHX8Qlgnp5+t/GBJNF0ialfRDN0Ae4D5OGqIE/izzZ8Ja+vMY0ynD1oANROnHjt5LJym7o7mfueZ4mPn2lO2pX/LmRfA1++qHeiY4GIl4oss5XiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGXfCZwUwNYKPpy0bIunYTRpWGAzzYjXHGsNnMmq3zw=;
 b=c71M1M8vbIHgPXmFrPbgJqRfK/vPKMHibPZtn1CwhEddtSVoUXo6GUzWj3wiZQxWHICAa/6pYCHPJ54GlQL6Ez4E5yLJBYWPwTW70m+to2MXX1r9jbV7tirvX+wE1BnGd3scmh4fVk21LCgU4v8nXUzKx1ZJ1h4cZwhBPJ5l/ZFEy8l+090+hrnXYUK4z979hhbZP+TAxLZgUfcfv0CXTsk5959+OGrUb7ghXGwvyg7KNjXvr8YJiqVviwDu8mM6jUdsZ9B4myquUlvCD4epV92NZ0sEVcCNtWQbKAGiHKiGHO5vw/zSx7Jc3Rjbz+cwb28XaxtnKWB5hX0uzBq+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:38:06 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:38:06 +0000
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
Subject: [PATCH v2 2/7] arm64: dts: rockchip: Add HYM8563 RTC for Khadas Edge 2L
Date: Wed, 29 Apr 2026 14:37:07 +0800
Message-Id: <20260429063712.2150938-3-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429063712.2150938-1-gray.huang@wesion.com>
References: <20260429063712.2150938-1-gray.huang@wesion.com>
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
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEZPR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 033e16c0-3764-4fbb-80ae-08dea5b9dee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	icZRMbYaH8ruCXiGrf0JbzDNEOr1Gbk5z6Lll6SShuY2siNTaBp5/y40bvEPg30O3f1EoHTKOcH1i/AE9nbHqEQEg6IUhL3A3rd6AdtixIuONbCapGSh9VG8JO943ueh/b88XB/0pdrAKOB1Ywca+VZtrylJyNRL4wXircmyqUiXRBDSIDHlr58iODRnj1vzLs0SdKjNvD62dc+L0iT2wiNPapzXfjexQovEqqo88cGnDNI3RH/nCMfR3G3hHN6Hr/qQatcwyXCrJR/KanhVOl827KKwaDE1I+oG6g7VBJDCYHJCw4A/OZAkO0BPlxhsD/Y5k4N7NudTEFaIOgxQ8XdWxlG30+RHqLbI3aia5Hhe/iBE8Wwr6hiXQ+Gyp56pVfiV0LNjzOFQRkbqIASliPAye0DgfqdvTtSnywDBTfLINpZ0xqy9jfKb7kEYAedZiWm0EmNWfE46+9fA06LdOYXJ8vxlxavTIZXGdnpvIlOdsgqTw/IECIh9PEJy2j7P0i3cIFLf6uw9wwwJEYK6aK/4tjjU3G/puX5Rw+QtHFUHthNiOKQupPV6QSh9FtOGSjbzJW2XVS7Roy7jtleHszT5q+eSoXSYkEnsDPO+FW7m35W2RazFs1Kdav45RBWJkBrgmCJqjyqWIhTasMZECZsu/Ptw3xgU8G3f4dyAWTiF+Eta1sDEjqL8E6eJTrDdg5kIRdj8tYG2XORaZHj0bKz9LBzeDwfKZbvzlwDbS9ZiAJyasqym/Jtmr/M+snUwVaxhZgGhmP8vBWUPb0ojAdGqMnPBmTVfiNEKZPZ+UKc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cJEplS3cdFK7dnLWvVnvJ3h/an/dod85XnQTyOKNf9Hx85A25Vvs7cBhPr4L?=
 =?us-ascii?Q?2CqmMC2hyxj/hmh9PoeWNhn6WbpRQzinxK1LhoHG4HoArNFc/me5vj0hpBW9?=
 =?us-ascii?Q?vaFQocbDErDJE+4Ht3XMmTak5jop+QQaBYJ5dN+7vcIaKT52ZCAH/5OMarOH?=
 =?us-ascii?Q?ym2YQz54ExwLv6+A5Yi7KV9sXRXIuCxuzTm2rz6aSYviUX/dAiYwAZ8YPZDh?=
 =?us-ascii?Q?W5RT5O5MQok8CyAgRvsZkF7SYfdd7vcpgXQSL+c05Jp2oHRomMaBGIw/BNV8?=
 =?us-ascii?Q?QFjwEMvH15GMjYIP1ZMhH2wJ5Iv/KHDOSW0VIIcFyKt8650sqBYUwzGcs2qk?=
 =?us-ascii?Q?hPjlc0J7e+gkq4rgAFyH2fgJ2QlUjRAFdij8O4RguP7+pU77/Zl0ZT3xAMBs?=
 =?us-ascii?Q?BC9eqw4n/fvZZmjPX8TKkwSkUpqqSMuKKdDTXAG302GtHQFebmxKv0vXDHhQ?=
 =?us-ascii?Q?iRdsuH9l8dOuumb82/CtkFzxgr+vEfrZoPWBcBzXjvrpjmHdd41uZT2yq1q9?=
 =?us-ascii?Q?LJBU4TUTmaFN7OOqIt2xWPX15G4Yv1VDvD7ZSRnxfLcWNcaJNlu20QbPhFW+?=
 =?us-ascii?Q?om1NQcRdTfh03xr6zGyy9VrkDOwbZUjvPXpfufVblOqOnpcwt2RfFn4C1qab?=
 =?us-ascii?Q?4D8OnjkoryJR4AtlpxE7gMWxySWR7RBoiM31RVRTzk/hPSYMHd/4j24NL/Nm?=
 =?us-ascii?Q?tbxBS9FHxch/cAbKjC6uGm1XPHKnGcrOhpvCgLz3mUFFbYRySUhZlNC9PKU4?=
 =?us-ascii?Q?dwLCdRexNMO8tTJe7tjEGe0naiobx7NyIzl6HMKFUXXi1RsUWX2xoz15HfWZ?=
 =?us-ascii?Q?I9UNequWUlL5pkWzsCaGC7DE/INW4601GzI1WGZBrj1of+LsWVNRbt5kTEPJ?=
 =?us-ascii?Q?VlPnxPkXnIJ91+PCssq8/8jNRKn1mQeW3BBoh5lYPcP6pCL5EqYruVYjUr2O?=
 =?us-ascii?Q?2Td+P2osiIcYh1RSyYTPp8WqF5W2CdUxMSSPOPULwJxTtstssjIhO91dqYPP?=
 =?us-ascii?Q?pon1cETuqJbqOwqPAdRPgzGqh8SadyQlg5K2dWm2GwHXM1BtSTTv6H8SfN0u?=
 =?us-ascii?Q?qk8sXDOYNW7a5nAKfyZVQNM8a8c4WJ9FtjP/7IROz0EiJA4QnntFHOvqBk9r?=
 =?us-ascii?Q?amocuQ9pk406p4mBdSwbmmiaA8AMazkmQTVHbJp5vTLKJzZeBNgMe4K7Ocj1?=
 =?us-ascii?Q?tQtdcdqUVwYcIk4LNWmbvJSVbkLhqufWQyNRFTnfcDB9cP3pSyuOuIAh0DFD?=
 =?us-ascii?Q?h3ZsOyExi0jH1BQ9s3iDyoECoiLMPwUfB99OnetBDlQrmYPhsmAQGbdlEy4w?=
 =?us-ascii?Q?efywymkJdpYCYFOhC7I9MV+FBd6X5CRcH9foCSRCZ4ztKm9pKP71YVfF7TqJ?=
 =?us-ascii?Q?qydqheB0blgnea6D/RAhIunoVzP5/npJ8YYEZ2ybZU62x02xt1A9dMwzbDth?=
 =?us-ascii?Q?GNu9Nk7X8FVtW+Y6r8gdx2wnIFOjCe8CzyEFNfbvSFpiASdvvsVpEhw8CoIq?=
 =?us-ascii?Q?7TQTBZ80bRrtLZsvNz54KUGnOOO7+QlXGH/Yin0qAfvIjRyXZyFXrcLd1f53?=
 =?us-ascii?Q?pbwS2dhxG0UaYGDHWiVMUC0Ev4w49WYhMTnUpgD+ch4yoMGFm0dkvf6YJU8j?=
 =?us-ascii?Q?gTOw42aRtoOkIFb908bJsc1LZv+3BVV7S2D1AZt0MYmKa6elD4FPmFap9tXz?=
 =?us-ascii?Q?eZ+8WofaKcCreJ9fOn8621cEcTD+LM2KPxZaeOYDqQ/eZYqrOAe6rSpn8jqk?=
 =?us-ascii?Q?r238mQm0mQ=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033e16c0-3764-4fbb-80ae-08dea5b9dee3
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:38:06.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmgdBYwRaTPXvpeywWLIS+UoytmdPzsKQk5e8EaeNw/9kxsEadjsITd/9ayBnoYwf0MVNq4q8BmjXA7XgUxiwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468

The Khadas Edge 2L uses an on-board HYM8563 RTC connected to
I2C2. Enable it and expose its 32.768kHz clock output so later
board-level patches can reference it as the LPO clock source for
the AP6275P wireless module.

Mark the RTC as a wakeup source as well.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../boot/dts/rockchip/rk3576-khadas-edge-2l.dts     | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index 5781deae00d9..c85b219fe409 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -46,8 +46,6 @@ vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
 		regulator-max-microvolt = <2000000>;
 		vin-supply = <&vcc_sys>;
 	};
-
-
 };
 
 &cpu_l0 {
@@ -431,6 +429,17 @@ regulator-state-mem {
 	};
 };
 
+&i2c2 {
+	status = "okay";
+
+	hym8563: hym8563@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		wakeup-source;
+	};
+};
 
 &sdhci {
 	bus-width = <8>;
-- 
2.34.1

