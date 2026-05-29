Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE251380FF2;
	Fri, 29 May 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074949; cv=fail; b=lTVQvt6s2VTjjDhRoWdMl4vHG5TPbqYm7gbL/esNETlDixRX5qit+tAqWCfcP8FlULZTPyOQoLvWR+VTYiVgjS5ZkKjgFbUZn2cOViJoTB61eXHOhIBGjIGX9CxEwH0PsXJeGpUxO4QTx0Jsh2le/Y/59SNWC314HMokitVjDOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074949; c=relaxed/simple;
	bh=lF1oPvzhnscuzY64u0uDXGtUdu7R79dcmeE8qDvsPzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WecJYc+apQTzTZrz0wsKxPLWCK1Fh4+5zfGJ/mA8817odrl9kDUwMpj9wNGXoXVL1VeyBIDLEFY7WcKkIPuX+4whzm27RjRRT5dJV0gLSHvo2xTYeC+PmEpoKZUq9gzNPZjynWZo8RBWloXtBuueepfM+iYt7cPnVaEiBJkQiEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fgFQr+xJ; arc=fail smtp.client-ip=52.101.70.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fgFQr+xJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTmlRgZtCERTxUxhkWdO+noIWSibBYSsWgFflfl0jod1V13vCWvZfJZPe6m/DKQlqmtkLgLTJt5PglwEtQiWhUb/G+kkL/0QXDI2wgP/nMzpHRUVyOtMsjsz31tHzPRpF3cdVQCgmycOG7gcme+SNnMRzYq25q5JM5C4lpp7oadZtUnGFoV35WhkVq5thIF8sPPUFhoPixVZNQ02RSGlzscbOmGly7q9fOYQP/JGVmS0O7UMXcC6XDB0bohuYi3qH8MfgsVmGSXPBO0DH1STjSle4edfMuuXn9astfWbbRXXBVNqU3N1/84NV3qXetNV11pClxSpINlk8zKmNTQBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8l34yQz2iuiYgJrihGwa5VrJY9BVgLITOOBbkS1O+w=;
 b=E94KzFMEfcg/RJYPgJ/P/LcFvpESKTtt1I3A02Ga40siHuUSqV13BoTFdZexzZIcqgQiZkFsBCtVYcdleueYrrGMW07IeaNam5HJ1NfZGmuM/bXeLsJWUlEngOPVbwzuDGZiCRXkMpfsE/LVMkCVTY78tCskJHWoFPavDHDCCgI3z23SAA2rXC/rOasouVf515VxqlDoZMZ22oSLKHAZj69NEBOIAN7/0s8PPr60tDcWs3xNZRXCgOW8+2vUjwSlavRn0VPjKLOgdzvfdIvhXQ4GAUGyQ9RxwLYcStAaEgzpt8VWKW3ke36UOT5QfYzeubZG374s6Akjux+RU3YAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8l34yQz2iuiYgJrihGwa5VrJY9BVgLITOOBbkS1O+w=;
 b=fgFQr+xJGYJX9DhzkHf1+YtEAw5hgUZ8XBzrGhpqp6VKHcOrUJ5Qbuy+BHtAuu0mZi4PJV/ObyQ7thAzCZepVgiuQk1VMn54fM6YsREr8zhR+cIFwUmrpRrkZK/XduHgFGXab3IH4SbCyY6w/DLtnQR3/nOBJU8ZLCYrZix8q6/GKMJ1nKkszShZkQmRmMzaCTbhBwtrhSKYsjLC3ztR6P86BUIkJngetv5I4cnEbxGlQPjQNMxXkIpqRUnzRdEQ+3sOY9+sqWfNk+LSa83WEgel7glf/VyqtzctrSg/0LITLZan7W/BElUWuCkHUM/CXPSrBbA4FZSKtay4Vt+L5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PAXPR04MB8960.eurprd04.prod.outlook.com (2603:10a6:102:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 29 May
 2026 17:15:39 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 17:15:39 +0000
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
Subject: [PATCH v2 phy-next 15/15] MAINTAINERS: expand Lynx 28G entry to cover Lynx 10G SerDes
Date: Fri, 29 May 2026 20:15:09 +0300
Message-Id: <20260529171509.1163787-16-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529171509.1163787-1-vladimir.oltean@nxp.com>
References: <20260529171509.1163787-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0124.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::21) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PAXPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: ab83f91b-b045-42eb-7c0c-08debda5e7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|19092799006|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	LtiDXRlE6z0dq+kHM1m2J8hLMMBT0UYxQlQUYRqWwnntSTfUlTWc6s3sCuULRclnOjy+blB3zRUklstD25NlvX5qUyNTGI5YXGPOJPu0yFAQSSL4Jwdfjy8ql9GjAxekPMdFZl6r31RCeyuLu0wz11LUejcg6Gy9/F4uXolc+73nDKMhevBgwJyO4gxLW8mp4FvnlHF32G46+TA0AaW+otime44jlOAl93eg6tIxCiLeCkRJ/IRAMiFofQ7Ybf1aCvocrtLqGUJxugl/xx88qaNH118PPX/in9SousyygnL1Zrdy07Do1RrYtABKzqFQ50loEATtnIU/CDxTSAidR5wOqH/BLMsrk3xeBYyTBuBKJlwSjcPyWfKXpw/eHdD0rQT3ZUi/r3ahxohKLBcq1691jAS3PAP90zd5dwnIyAblW+IJ2U73vrQmG9FO/COlfnCx943Upbm+CRPsG8nu26f89Ay/ttRlcscztD4NjCWMuP9jaUnJ96JnSISKhY8v8u6clsCQhvsZ0AlljxyMcar70fhDG9tL/yRaks+QFbbbTjjY6N4H4eEbzBliDVKPQg56DCDB0CcJl2H8vUsEYGQsJcqmN38qeocTLtA8yLnQae/A1LR476XZKeleSPmQkErdXfhEh9k6sGwCtlR2NxV4Dv6YiKJMj49wdDowLuJMEwiJyBAwKGzfor+hWThI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(19092799006)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bfFQ4xxkluJMhxTFCIg0w9y+QjSEbuD4ORxOsp2YNy9ABo3NcaWfq+4GseYp?=
 =?us-ascii?Q?NUGVMFBtiNBTohJMeQx70nzSh7bLkQXFbfHiEKAbrh9SNqWXqUqaPpdb8Idl?=
 =?us-ascii?Q?T6NVIan2WVzkC+KXKSODnMm97PYmFG6WO/BMLf9627SjFvTULQg09sCQ+ygz?=
 =?us-ascii?Q?E0eNbBuzwN5N0HzmpCVxtzzJRxa8q0T/tF5X3XM5YMc1wOuo39aErvu0JUaF?=
 =?us-ascii?Q?cM9dU9MX/P+7mwpO/CUB2I1/IFU5gG3gFYDfHTZUFrVpURRFqThwHvxhA0A6?=
 =?us-ascii?Q?r1Fx0Yqcw5zJyESd31IO5ruF6+XTQL9ta/2pD0lrqoizq8zI7d2zS7abWHIt?=
 =?us-ascii?Q?Y8EMfoqFKVuDwLf4bKdT1ZPjltSV10O11VBHz+0Y8rG/LFM5amRujg8nBsyt?=
 =?us-ascii?Q?az2FBNgE9fDBsyrUG6o/7JS27ekKc2xn3gasN7qR35gZ2iFBBimV7tA+/QVn?=
 =?us-ascii?Q?66bAIZdEDJL8G0K8KODmWzixkgUfAfsolII5CMxWR45GP1SYCtAR/ONy6q3z?=
 =?us-ascii?Q?nnUmRtaZju2yRYdp9WHEncE2pNcPcKPupb+5PX8iGPyuFYesYt1D82ggJcK2?=
 =?us-ascii?Q?UZVPpKMA/RWnzWAxqkaGR1b/BLgwEsTPVffKU+czipkB9aT8+fxR8jN0g46j?=
 =?us-ascii?Q?VosjNAYBSIgcsGfjv/UzdLK/jOkFc7hN81FOjdE+na6PUETjUNFFxLdYndDC?=
 =?us-ascii?Q?0qbvK/xCCeWLi8pB24k/VSvMIcfTZ4OWZMUFqqijjxlmMnLrUEBA/HIEaWb3?=
 =?us-ascii?Q?Y7M3QTVrnCuTF0zXnoowZKdu2rCWwtxigbwhzXrhzfxiMM2QdjUzAt8FfDnh?=
 =?us-ascii?Q?KwxMlD3bHKIUu5kD/+yaK6YaGRYOb9i0pHhtlB0nuK0YWT+yWul61o3A9IB/?=
 =?us-ascii?Q?Earayj7QtCYr5eBUDq9vOA0/DvEdy0xC3WBVbiKD2MLUXFtkZwn7sYVjH+QM?=
 =?us-ascii?Q?xMHDFCtuG/GSbFjmyyRymVexArriHlhkkgWi6nuyUFMSGYthpXN42JhW3dXO?=
 =?us-ascii?Q?hdY4IeUMUB5eq4KaHsM2G1GefeMR+C+k9PZmvF/zqXJfNQxBJk5D+e8uTxz1?=
 =?us-ascii?Q?cgcRSlQbipkZoPLQ2DEGfP0fQglMd1k+DOSPjNXfw73yig/ujm27QQYULEey?=
 =?us-ascii?Q?FwU5fpCL12vAYLc3pSUQab7+n3Jcl8gn36xHIHecj4ul2dGf2VTAOwcFvp0U?=
 =?us-ascii?Q?1Fb/dLytFGCJOWC9BySe5ScmJ5lMLGjeUN3MPdohkJBsQj0HsDSf0ttb3Prb?=
 =?us-ascii?Q?Yo3NQdv478HupiwhaZ+u4JpsKBJy2YW0QyVHC6lChO+zzMkk/GPxH+v+oUCR?=
 =?us-ascii?Q?iqbX+RLcJ36S6Usb5OFe9zDHoaMyOB8S1ke4MUElTc047yb7qC/GMycI+L41?=
 =?us-ascii?Q?X2YfyvBnixiTMREU7Tr5YWTF3/5YYZbVUnzFPWQR3/RlVWqlqsgQr3TfJg79?=
 =?us-ascii?Q?X1KsK5rVdC277PirywOqdz0vR6pdmxYQvrt3OZ8orIhn7vK1QkOTrAW/S0+3?=
 =?us-ascii?Q?vnIbDCVdYppl+mS9H97/D+DJM+wIvqKYZoEGKdd9rx5Khu9etNoRHHVJge/P?=
 =?us-ascii?Q?aAEFNVHx6br+7/tLjJWO/8b8gXZz/96ocKRfchvbmFTXIE8PVwyjCyQo+wja?=
 =?us-ascii?Q?Arz4OPRXoKVyGDnkJ794iWjwFyinYxmKCyv64PyfZw4XD2p7kgB7UpEZg/uD?=
 =?us-ascii?Q?Tegl6jO5j/Rf2qk7A1J/ULApfx0pgQfT8KzY11vwe65vdJspqcxdpGEdf7jp?=
 =?us-ascii?Q?3h8s3NFpF09yla2WV2Do16uWhmo3fvGg30O7mrDBJfXwiVIndfdy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab83f91b-b045-42eb-7c0c-08debda5e7c3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 17:15:38.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/KfufjzcKClmmSs8j82AkAvMXDpe9JAeuCmHh8cVwucArlT7yjLHsxMuFOXo4WBwM7GgJvriB2XycVof4VB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8960

The lynx-28g and lynx-10g drivers share code and hardware architecture,
so let them be covered by a single MAINTAINERS entry.

Add myself as a second maintainer alongside Ioana Ciornei.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>

v1->v2: none
---
 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..bdae5acf8d50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15405,12 +15405,18 @@ S:	Maintained
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

