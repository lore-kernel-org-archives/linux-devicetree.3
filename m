Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCD481ABA;
	Wed,  3 Jun 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492883; cv=fail; b=WE57LZXGwwm7DqgZb9ZvpiP5C8fGB5nhySkc5ukfpgH6rveLAedd8nUO93JfQjeK3N38mRobNhvfzlGlX9SIUeUW+YUT0vfNQ2/zSc+fdP/762cd4HjzE9i9cuOk2ZgATfDFd9JqvrOkSC4bOqmXoCsJJfbUMQNqv3EMguOBsUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492883; c=relaxed/simple;
	bh=osrn2SfWdo0WPJK2EHqr6f5nxw7oO35CFwmXvJVyl4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WM0F+DImwNWqNeNlza52EnSSL3wrlRMHwPMeoz2xdH+1Eq6ygpoN0Y4kCCONC4zzUPMFp0mMQmUpMni9g1XwTjGOzP8g77Y20VJHy0sAFAt/S7Vz/QL2km3tjxtO7kCa3Jpo35tjsI5ln1OxNcSKTZRfkEh/3ZBUm3dvCzUEWJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AT+ZwHrT; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AT+ZwHrT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rk94j7DmmRDfeaUNclsKdtope2606oxc/A6cDVbbo48+xarW/zDXsehf1dpHpYcFsDahfsmTeH1/wsv5I0epIbnboIn9QZZrGlb4v39DqVBXiSnlyxj63M1wmqRqVSbmaTTZjemOLJgkaUHCviB5hyOwSmCCXYjbh6X4dCCThghYQNIZzcq8hWoyS9mvn+1c7MsweAYlaLXSCP5dM1HL6wQ+bbgLnTL+tIzVET1g09mODl30x0jP9q0rDXqlHnChKvECiKNrK3ps0IkVN2Zv5FJzPQ5fc6UOQvyg77a16ZVIJ0Ootkvf67nWA3wArjMaZDh/C8bZuJEcDKlw52NEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtMUxOBA8bo8MMhAWcZamzRfkLeYn68z3R+ekRaVeUY=;
 b=x6scrKO8wLFkt3leSgQ58gRsJTrXXASpUP4pNDz/rymxy2HDTL+IWWpyjQF7oBWFK/4Sy24tbTsieyliGrtLpJa9rdC5pcUZWJS2ioF8qpB6OgP5xeIlBdbZhdW4GE9t1OouYJTA1+dSHhy+eQ1U2dA5/HsEBUqSSaZQEpSJ7b45URW3XPirCUhJlbzlqLY1jKXpIHLrOkbS9OoN887S1uYQhlSnZf/BnzeEDtvALCfESZZku8wSawgw1lboqejTnQZOIIAOaO444bcmV/lIHuhoJmWvPc0Xcch4T1XBTYjPF5UZ8mav28RNZdIYyzwNExx1nBmZvjvgAI14qge6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtMUxOBA8bo8MMhAWcZamzRfkLeYn68z3R+ekRaVeUY=;
 b=AT+ZwHrTbvQ3Yv/uOKKouhrE2gVFHbVte/24ZlM9hkZZ+S4G+uIbB1eLjL1PcITevhH1Xe1ZvzONsL2Qm0DjM2PrOAuWQGUNirehQsKjSPsfxfC8MAsiSMwpTYZQxHQuCm/x5621r2I5XM+Hiw638Re6gGWgE/pt6bPxAaNuBQT3BG+pWnJuDzxcmYoSLmxRvxaq7WpMMq9pzgg9m3sbVxfmA3rRKo+mjhCfnioGup++yWJREk/kSlqcpa9Z1L7kxsWAOzVEhE0IgCFrC0iLeofa4aoNB65EAb/vbLTP7x2o9PcBfWZ26lwcp+KR8uy+hLWK5yhADrfo4Y+YLlpRNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AS8PR04MB8658.eurprd04.prod.outlook.com (2603:10a6:20b:429::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 13:21:19 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 13:21:19 +0000
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
Subject: [PATCH v3 phy-next 16/16] MAINTAINERS: expand Lynx 28G entry to cover Lynx 10G SerDes
Date: Wed,  3 Jun 2026 16:21:16 +0300
Message-Id: <20260603132116.503622-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603131914.503053-1-vladimir.oltean@nxp.com>
References: <20260603131914.503053-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0007.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::12) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AS8PR04MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 637d28b6-b6a9-46e6-5b15-08dec172ff5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tVBdU8iR3RdmyQsE5qC3MHP8jPyHy1nPEzUMFaTz8FG31foxM3ZjxWayPbPNdm2RAmAPxqhS7gB6Rsuazy6jO706a8YcLSSfqP4zL7FUsjcvDzvJNtH1CgLL03X2qPuolf2gQnsgcKy8uKL9HThf/n0UG5f5uQ+LCvM0IB/+4nsd4DXT9+Fm0rbnbrapvC53A0/+YhReA5EjCzneQ2LqOi+CkZnfi1Fkg98PJ6etnJjQjIa5yny/D3JErHfZGNbFzLQJnWMNG8sEd/hKRJR8sbts+kxmMcERj+80kIfEUYqzLMK6UoDPRoJBPZtSPlEpzr6Da5JC5NkKf+WQXmz62u65kWZ9ma2eA2IBApYE9TlZBTtL84JfasEtahCPmVjkhswxV6lAMKrlw7e1fQ9jFPTFXn72qPtzxmQKWs/HjMT3oE60mjF7c8CS1/qBEYBYhqe1GpUPmtaTlLqGZl7hyQelDV5Yks3aaCNFKCOX9BSPWMoLtBq1IJbVHGibDwnEU6/vo1pCdWi0WPcgz+UKWzLXLbA7AnYyPsp2qptAEzgdAnpA9PZxOWyc97BDe+8YBTEdWBMrKk41pONodVP4L5XHhQeVWagM37S00N73HZfMZ0jJ1z3qpT1W+yQl9IfUfw1XJ2a+JnNOhP4Kg14zTTIZaMC5mYno/QRv1CFlQqIGVKLHcLVKGq1kXpjSbPbs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nKV/YY7C+DpjrUFOzTmkP7RDm+Q5KxiutLr8wY9GpdfdZtyHXsWHx0A29juC?=
 =?us-ascii?Q?2osMtwCFNbixFUcMnB3BCXgXnnGthX7CgnLIA7bN4B9SJX4qUiMAbyXe+UY/?=
 =?us-ascii?Q?FqgZ2oZairRnMs4Gm/gQn6smi8L642fj6f6d5n8TOhnLk5/kpMbZ0ReMjv0k?=
 =?us-ascii?Q?wHsQjYEJdZlpXQSpE+7+I2zPlZkAR1/f8rLPNZtRAMvuCadGVgQF1f1eKHMX?=
 =?us-ascii?Q?VrEQviz36p7NMytD9tPM/q0JeDDmEDYYALTQSzK+itoIUm4TsKd4W/5Xgo+L?=
 =?us-ascii?Q?rDDJwICLqvcqICKcR8pGb4II2nRmXMGs8VQLH8cSRwuxM0Ev+9ezKjX04+03?=
 =?us-ascii?Q?/iPoOmrPB3qXMuR+7Vzpvq0zwDF5HOxMrx8qXU09fkWPmJx761xBGS6vkyu9?=
 =?us-ascii?Q?Ncb8JXp0WUS42wWli0kvkVUqTCE2HDDR02vs54NXMwrcgzmUqFhqJqJ2Qz7n?=
 =?us-ascii?Q?sm+FGcKVi555l7Z+Ug36Am5fHDdR4MS6OR5M/nNBPVOlGuzetAPZzUuQOgLw?=
 =?us-ascii?Q?k0TTE7xEmDAdwa4OA+wBWtSefiwhfWksg/Xq4xUfUB0cNTNkIOY0iuMiCavp?=
 =?us-ascii?Q?b8L0S8RKSVr3xwCfNBsp6ARHZZtUi0y5TSHbMEbYnVJfhoRVCOFZ/gly0csp?=
 =?us-ascii?Q?xUX1TfNEHrbqK1LkB+h4ry74Xks5dtztBHus7IB+3/g7vkoHsEtOaKNvJKe5?=
 =?us-ascii?Q?wlUOF6WWP2ueIGH9uMFBGuqc3M86rItQrLCmA+hZ1YTnpenILvN7c6360Mhl?=
 =?us-ascii?Q?J6jnDOfZjOC6Se2x8adPOsJ7qxwrgWUQ92MMATcf8xCSaFtFMEUe8QyWalik?=
 =?us-ascii?Q?hcAcjqS1ep4WLbwsZAUoUJAlNzDfSF/ris2cuqgGcD2GiYDjjofnmUyyZURl?=
 =?us-ascii?Q?C0sBC50d3+JswL51Lc7+w6WbnZomGq204IVcViGeEp2oGga0uEvSgCIpXcFW?=
 =?us-ascii?Q?LGCuu8FW6+BwjWdvpLa0nJcjpaoT7BmKFZ/5Me9WTGARHDGt7Lwngdobblxe?=
 =?us-ascii?Q?U0b0lPjT8qySZAJoWqivcOdwPIMmk+oL77QUVSFNc5g/3W7qAFnix9JGCeWf?=
 =?us-ascii?Q?3jZlUQJafm0KxqLLDt1VH9SjSwU9JxxZ6tOb7PCbDAUObJ7CU9TXGDEjdtx/?=
 =?us-ascii?Q?ouOlJYRZ7i9hritfXI1UyXVPg2RGSCO/znlkN/nQZZSH8LxoP7gnsi7jtluo?=
 =?us-ascii?Q?N61CAHRH3mATn70tPFPJZXM0odp2LJdlGo21CvMS1OhcIEmrzWvP6qociKRT?=
 =?us-ascii?Q?k6YPClX4lOgADSZG+GZD4RhV9aXPmQ8ZbBRlMc4z3W+IV3Tz+DAfNXzd5+H/?=
 =?us-ascii?Q?/ktt1tChqsQP9zxOFQ8fOJBe95qMJYjN4VfTzudTIaZ5MiPN3rgSQ/QQqaHv?=
 =?us-ascii?Q?2FkQ7n8GHTIMpp5sOl5XrgfplpDfpGHa5w6nUj+3dT376nrThSarivDyJpaX?=
 =?us-ascii?Q?J1s3JKnBObioKd62WwNw/ZQm2+Pg/ufJn3LJGKKEtVTCscB4PJbpqGzIt0V4?=
 =?us-ascii?Q?5I9MxAHJKJosN4Gkj3qbr/2Mm9xKMeg1zfoG95r6sIjuyJseAFhPbdfQ8PLN?=
 =?us-ascii?Q?G4JbEb3njrWZxzOZwsob8t+lW/j0sAJ90SIfgWWqRHJLUDYsBzJeoIDKjI12?=
 =?us-ascii?Q?DXG8auIkh92EIDqY6jPokNY5t/F8dV80fzkM+4blkl807m3S5hcbkUVcX5wI?=
 =?us-ascii?Q?+zlF43Ydf7LzeqVZyjrCKAN71UIs8ZtNpY32fxywdvfCM/1I5bdYfputGvhN?=
 =?us-ascii?Q?918JXH23fQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637d28b6-b6a9-46e6-5b15-08dec172ff5f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:21:18.9591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyV47NSXwbjMHgiJJCnBuSb29dpy24C9J+QeoQh4sHCjSd609NqvCryOcIK68rlmyTrlVW57Vxk7qr56KlYbcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8658

The lynx-28g and lynx-10g drivers share code and hardware architecture,
so let them be covered by a single MAINTAINERS entry.

Add myself as a second maintainer alongside Ioana Ciornei.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>

v1->v3: none
---
 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ae45fed10fb..4725acf28ecb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15390,12 +15390,18 @@ S:	Maintained
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

