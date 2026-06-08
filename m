Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F9C3B3886;
	Mon,  8 Jun 2026 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780957090; cv=fail; b=qWS25eriUsY7yd7SQ1sPB7hXeh+hbsqP/m/0jzxjlsGk8n9FjrOrQKd1fFRCOq8yfhlrq+pJfI8YyuhW6PwkBW5iDas7q1pQysgLSDrcnan0RYVlf9O69+o1EDF1HViK+/sFSu80ZJiRkk+QknyfjSEDZocaXXiYx8aR1ps0zGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780957090; c=relaxed/simple;
	bh=jOlI5fmXs/vVXAoGc+v7yNwNbhk+SggdIQ60vsSp2tA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=shqdEfn5pzoDx2df0FyowvWE1ZxcDmkqwPKT2Jt7DXhPdkg9hVGfFc3QfDtQE7pRSYo+23YkgBn59GeabqUOTlTJxX5nB2SoTkFGnpBoqRY8ba6PMyxkZEX3Ck1Oaj7NcYBDxkimr9wEmmyx6tb2MOXtpaQkATz3UnP9F0WQQR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WDGYQhjk; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WDGYQhjk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOAfLs9dQIXQxmP8QqQ51LBVukaJ662PeGLpj1loebTF7YAcFLIJX25Ra/9oNRCY6eDIvX5BykdTjcrS2W4uXlSauD+2Sd8/FZifzrjrjrf8Lz9A6QBatH9clLfsQoZ5+wRSQl2rvdETZk6DJmv6t6Wwlm/wfVw0QyFFWLKH7iGomXNu89qCCKJk36V92tIlPrr9rwf3kN7FgAcZtI0Tz0a6eG40UJJR1c59yI5jPZW07yxteVKsSs865q+2ro8u4/Sf3OfZpC7nSTGKiPe8vuy2Shsno/yZwyQV0gcTI0mKyPIOJKCx+Aao6w7SplCQW77+gnBOI1eLGu6fhNoA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW0CyvcmL+ZcHo/UO2FNb7EPvwOxaCUJg97GhpIfqJU=;
 b=UDJ4paRqTrV9ochHFP8FJC8WSK6qp9HEDCGy89mo0dVTgEKBH1pAXNJ84zQgPQoTjoiKV52bOcp//S7T7mzvFsrwIRhaN05KDGxOAg5gKdADyv60RyMIbyWLg2PA4CbN+KfH05qVmmCIvloVvrJY5s84JfxyIpcYWfrldeGrc+3g8WZ9kz4v3aNCvD4t0DymapsrfaIJGo/c05nhWXM3BcFzjQeN4eRfYhQf4q5jP8ZQPlgIWbj8B/Z2srphZwG7LRcvmAyGQY5CYR6glmeb+NRRoboz++7IJwEoRJIjxqAFMuis6oJcvEXyPwZpAw3LEbYzjDo1veU2FnjBqIXtzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW0CyvcmL+ZcHo/UO2FNb7EPvwOxaCUJg97GhpIfqJU=;
 b=WDGYQhjkny4rTmuG4j2SI5u/HVH8vzFjVZlbpUrwh59KfBOXQTyXA8acq8zTkzTE7fazWrth1NHmgK6m+Xe/7BceinO+sW6knAoUQ4RW/KjJBMII+p3OVyCMZBc646MjQqC/Z427n98Yx/aKSNnreOIgqqO79uSt3XBJO1z1RD/jlogRYJbooCrFtaTSDGe+g5K658MYuUjlzZgJaQQps0Hm0JJvgZYVD6fUJGq6yTrMHPF5nJvjcXk7R2HWWcZ73SvZgJo9bwHkh/NjgOPGvfMFpz6cvpRMl+z46GGbfa3bQ29CoSrZmIBqW7Lpk/dULgCfBlWGfjvKTzbX8CY+JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by MRWPR04MB12070.eurprd04.prod.outlook.com (2603:10a6:501:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 22:17:58 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 22:17:58 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 phy-next 16/16] MAINTAINERS: expand Lynx 28G entry to cover Lynx 10G SerDes
Date: Tue,  9 Jun 2026 01:17:10 +0300
Message-Id: <20260608221710.1572971-17-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608221710.1572971-1-vladimir.oltean@nxp.com>
References: <20260608221710.1572971-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0210.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::31) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|MRWPR04MB12070:EE_
X-MS-Office365-Filtering-Correlation-Id: 468ee9c8-96bb-48b2-95d3-08dec5abcbab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|10070799003|366016|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	UgsJKQLROo3M2FeQCvDb6vNEJQe7/NV01YTOfmhIgu8/R5nv3yVMjkLFL5ZG4tlEKpULl2gQ8WGS2/VxlkUA/FxorygiEKghRWcRC3DXs8npHeZ9d3Q7RMdFIu93Qk50sMShTdoRKK/BtA9oR1CZ0o60Tz2VFsTr5LB3TI3QCBIzkz96aas7Yq8TNKSO/+2wOxqUNNSJeRNu19SkebMRGYKvhcMa3kiI3J1h7KI9wN1aAgIDroDxyzCWk3D8nRVJSEe4aB1Q/vSPs/s4hVKa1cknqmymfk08mXTRxF91f2swa1keaezkRTxRZchHZIHhC1pGnw2jVfyE81dqqH293p4PgZuaLnW68MVCw7FkI9AdoFVCo04lIzSqqiZxyJeMKdozJQuKwyYEly0AW3i4srATPWg1B83+w+aCypR4tPzlOqM6eU2daj4BQYal+tE6/ftPTjn9Pz+s5PKra+bu5PAtTN1BZDYzoaThcShUKiSZ7cUo9+phYxBBAaFBgaLRnRjXVQVdVlXcao7GRY/6nVE/qfbMkrAqgbfn1w7G/Q1X6M7bJwvIl38BTrAvGciSjizlgy9H/Y8EQpiUdlZKdTsOIYlOgd2aWzaV2Ib+kEMesw01wU4/1XCjJgaN8Syd/LKbanky5gZCwSWv2OCivPqlg6C9EkaDgl66FDHZBGvCN64N3Sef9rCMaU9i99dX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(10070799003)(366016)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6p3JZwR2F59vBOmzD2f+2XYx/NQevgsasuCgmVhQkNw0NXJzTFyh4ZChnP/4?=
 =?us-ascii?Q?6r5FgyX/T9/ZDYVCuR6oyrIUkcsyANywf8g2BzYVSeAftLJWDLFCv9l9llQ8?=
 =?us-ascii?Q?lo35ZueQ85l0rZlr5z2tCcwoP+fciIGINhJIrRkp9B6rmoywnnR9zHtgoT6E?=
 =?us-ascii?Q?gaXcdMI9MhPiOE9jxUNy+kBFTwXsHyreUALivdmfvuM35f38mnV22ZC6Jlz0?=
 =?us-ascii?Q?UgGr43NIAe/bCUNaoPycbD+O+BlCJtD0tCw/X7CoQXD104tG+FzLSY5FYx8k?=
 =?us-ascii?Q?yKLZS9VXBTirUBm6U3rTb3J+jUqUFAlbS90HXNQFAuUQybPKhd9nH3Nvrb/T?=
 =?us-ascii?Q?ZrWOY8kWW/S/EZwwfIpBU0j58+jMY32CxQRvCEHYMED7T7nYwFEQC3v5Qd52?=
 =?us-ascii?Q?Ti1HLKCbNc7ajIF35tG2GEZd/Sn7T4rgZDEDy4HUc1C1HHn8usrkB/Ep4wLR?=
 =?us-ascii?Q?vVJpr6ZfX3hMtS7ggQWSjHdOeGTVNiYnf9xfB+zFe6+eCWPeJkvU097raLiG?=
 =?us-ascii?Q?NvGbFiUSbifv4xLIy273jevUYhf+wBVZb8tGodvTyApTfYgqDj7eKWEBb/8E?=
 =?us-ascii?Q?8+206GY8VUGM9dNHhIP98AVNrT8l6Y1JiFWEoFDbXsjZA8NGkPgBcExEjyJ2?=
 =?us-ascii?Q?DuMnjzbRsPGU9rmogU5rPGN3xZem/FSQvED9lJvQKT576CY385t+Wm8H2vJ0?=
 =?us-ascii?Q?S3vcr6Nhxs9K5g9mW0d7Q0z5xemjwOa51SdoeAMd8FAtfAYODht4QOiFRN7D?=
 =?us-ascii?Q?jb2e4rkpUJIArw4uOmvxIeeh3JiCl+AIvREAMttuJ599Zkqnk38LPkeeL0sb?=
 =?us-ascii?Q?VV/+QhWZtZXOfDAh9S1QG/wTWLDwBhIVwwqZmfAUFkP84mB48SQ9jF5ZZZMt?=
 =?us-ascii?Q?efoqhw8wrz3iC2JuoNk0t0gw7P8f4vRGcZvsy60Ua9hSb9zBeKv9wZ86iOXq?=
 =?us-ascii?Q?eoMIs1wmAhU36ZlnXfGdi9T9deWg+IeQjstPgX0Z51OtzBFkUek0v0rX2+eV?=
 =?us-ascii?Q?hxlHGdnf8YQfJhxnXzdUCJ9qIt9IIG4crSXMEKWD+4BvzcOYc5DAxN2QCeup?=
 =?us-ascii?Q?ktSlbbVg1XpmEaJJGIv/MYHVzpWuDRt3cDn9oycQ/YFJBp7ru/qXgRTkVQy4?=
 =?us-ascii?Q?62IfMA9aaMUNNJDeCGGP0KfErVE0X73VMEzbVruX4LwoGHksNUYRSfFTTzrP?=
 =?us-ascii?Q?WeXdknKcVfme9jBp9XY6v2+G/3S45l3y3L/hnSOjAG96NACQ4dh3pntVHHz3?=
 =?us-ascii?Q?5Cgo+EFvgivlyvnkWG+x0YspBaMgrkL85oK9I7eMmrGiERfRe1CyjNzrz9n2?=
 =?us-ascii?Q?P0lZaaUi0qv10Z8Ew72xrQgw8gPonH2lD+D3y0k76f+DHGJY6hp2dMaFRyZI?=
 =?us-ascii?Q?g3kvaTcN/XdEozddEXL1UHsyx1bDhHt8rUthqcaNcLdEtKjMk6KBfUclEt2Q?=
 =?us-ascii?Q?R7P0U2Ia07HqAueL55dGMHPi4LG1nc7/uFQcw4Vvlrh7YCFzEDJCSwrNYQqo?=
 =?us-ascii?Q?WNMKgYQYmKST7GlV/g9xqrbqZyDYSx4ToXbTcJTyVudiwBD2gWgLFklpcquR?=
 =?us-ascii?Q?a/VkjVUZHnLMdvSr5BQftwD/gfmY26C4aaT2tsrrdHII93Uv5iqeKb0kCafp?=
 =?us-ascii?Q?vsEdAFmhno2OkoD/6tcVudsNz5SvhS6jCGLeqEaF4F7NCdbeEDB/Zj5vGlM5?=
 =?us-ascii?Q?gwtjMSos6/jkjf4NgbTO4GzR9ArFC6wOIMXWCJPOZhD5mraouXGOkkVzvuLj?=
 =?us-ascii?Q?UX5vk5K7Ko7Z+daPhH9BZWcTxGQaTKNf1q4h3l/W5JxV50kJLmfw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468ee9c8-96bb-48b2-95d3-08dec5abcbab
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:17:58.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIF7GGPPpNiUtjID2lfT0CiUKWr5GBXWKe6ZvhwJMJgL8IMG4Ysoz6UJcDj7z5KLXk2wTKji40QdxmWhlT3NUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12070

The lynx-28g and lynx-10g drivers share code and hardware architecture,
so let them be covered by a single MAINTAINERS entry.

Add myself as a second maintainer alongside Ioana Ciornei.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>

v1->v4: none
---
 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20bd55913b2d..c9c3229c9119 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15404,12 +15404,18 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
 F:	drivers/iio/light/ltr390.c
 
-LYNX 28G SERDES PHY DRIVER
+LYNX SERDES PHY DRIVERS
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
+M:	Vladimir Oltean <vladimir.oltean@nxp.com>
 L:	netdev@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
 F:	Documentation/devicetree/bindings/phy/fsl,lynx-28g.yaml
+F:	drivers/phy/freescale/phy-fsl-lynx-10g.c
 F:	drivers/phy/freescale/phy-fsl-lynx-28g.c
+F:	drivers/phy/freescale/phy-fsl-lynx-core.c
+F:	drivers/phy/freescale/phy-fsl-lynx-core.h
+F:	include/soc/fsl/phy-fsl-lynx.h
 
 LYNX PCS MODULE
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
-- 
2.34.1

