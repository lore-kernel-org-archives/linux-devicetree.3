Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010012.outbound.protection.outlook.com [52.101.84.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA8D3FB7F2;
	Tue,  4 Aug 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854409; cv=fail; b=tf6rsB4x5sW/CztE0DJ6QdqAakgBPxO052GARY8nVqSgUV3vQSR25fPe3ukcMgMTJ4k9Duc66cVxSyzjhOWVSPjz2uMfojXFOlcMiLZ2FH8PIeTLBJjfxxbFtPj/tfAmn0QkAyEQogsCqTIxG7L1gBlQ5gLLAzRHQeeclzuJR+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854409; c=relaxed/simple;
	bh=BF/ltXU4l/dy+aJfT9M22rDdS26G/CtsCUAXL4Edj2A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dwwLa2rT9HTbbW12r2CMKRl+VuJrEhbCASj21HlZdYi4lbQpGj3DkXC5M99aAOZIio1E5PDkgfAn9hw2ddHRlXUBC9L779RJD6rlVIeK07nbLbgAi+CqFsV/CVwvQpw0Hz7IjJKsQ+QogqoJ5mhSsolYga5bGEOuJ8no7kfEWpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JFQ1LSz8; arc=fail smtp.client-ip=52.101.84.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JFQ1LSz8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNkQ0MueYZdX4zgkKUVPRa6F9K2tgRi+T/gePjO9t1TdimZl40bR/tJhm5WQvpyKNROWmST1vqVVcY9Q4Gu+6vKYL5TM5LTx6IvExi3kWQlKEo3Q9c4QDy9ZOZaV4otLpJHgx0EE0XxdLpmm6/2/3E3zlUyXeUhnDASJ/3BjQuxM0LjsVSUyUkqbZBkZrO5M/sUCDALJbmOPfOcXtmzmDRI3kd0p8+9L7STvoAuOUuJqE4P/D3PNmNp2dfUAsEXUdn6zZ7XK8vJhy3MlK5TSWjfX3kTUYuCum75OgmQLk1x9PKD98r2ojCNEFIL1xGRpKaq9SQJh4tSWF36KwuiLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqIABZC0akK0F+JdupJtcIrjvMa2Hsx8xEyksnndSVk=;
 b=LzZ2XPSQjmeLuN20IAUBF3giQp97gK8PsgFkDuMPG5zBAabP4Hj1vjw7kgzT9C9OGrKWEq8SXFrb1rcnzxEq+GukJor1fg4LfqsiMXIo38vP8iiwDPuEonf/IGwyvFk0jRUo6YOgcHf8F2vIalKSrez74mHYp4v98UZIeuLKS5qlNEsHUEumenpxszKUbXDypf4leV0nqMkSI47SfPOrjh56FbdadgD2cnLHMnZFe+sB0tgEdbG2mPMmW9Qy2WK6R633eQMxi+C4ifyxEZyE6LH5ahumOP6pWj8RR70fmkb1/5LZY6Pia4ewZ3wa+B8u0YwPReZxj2RFMv/nmEv0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqIABZC0akK0F+JdupJtcIrjvMa2Hsx8xEyksnndSVk=;
 b=JFQ1LSz8UjCgNn1Ehm9lgGJWux+XYzGqJzwRWxiZ+Vsz/T5v4Tc4YB+9tHMSaw1Xtg0+toRZUA4BGkO/kjfCmqssVtW1ij085Ge3F5xRedIwZFVj2wvPkexJENwi5o5i2eiCJ25DDGbZRkVT50ELjHWC6yfsnSOXOaFMSjYLFhFcmz+Gom4/NTPo6yjpjjAXl73YiSd+ILy3DPRdekYtfJFeBQ+llCXYoqhxHuXPQRNTtaNi0VeZ8rdBtmSsQQ2vb9khnFnAFR4Jo740BlhxWUmWaVmttP/CFDpmQSmn/34dGuIf49mnvBmKVJ7sjcn5Nb6fvQj8/AsnVwnRFuxl3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB8021.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 14:40:02 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:40:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:37:53 +0800
Subject: [PATCH 2/2] dt-bindings: regulator: act8x: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-regulator-syspower-v1-2-b05af2081184@nxp.com>
References: <20260804-regulator-syspower-v1-0-b05af2081184@nxp.com>
In-Reply-To: <20260804-regulator-syspower-v1-0-b05af2081184@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jerome Neanne <jerome.neanne@baylibre.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ea305a-66d3-4fe2-d01b-08def2364474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|3023799007|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cpLR0jEjdwF6hLHTQNp234Lpw0d3oGeGkNilfiAHn7tZivJUMXwmuYm+/N3e28FotXmpBC9F6FRU9NAIgtMGI2AkpMV6Tap0/9WSIeqNQX9P6tvNDlEx4Uk52CTNU0fKxPd78tyvm6QnjTx5lY9nunoZXmbgc4Atwh97CqwBcyMTmdLjcAY0EDSQsykdoBaBv3aHFrpIXK5vPYi7tY5/0u13s2dRV9WONAqk9pZNhgoIY38iY5ImsCzczCF+ARHk40psHJzmIBq3/X3bu4r5aKKnoWI9z/Gvwkd1+TN5UqEXhUyeXgdC+Fr3ksYnlSbk8z1RuOnmhyiuZZuCINd7d4L3G4NiPzWRWZwdNQqjhz8vay9jNBnCihA7TtVjJoBK5+OW1Fy1kfVqNUmIrR9VcT/zPNR2HhhJpukHFuzUpnI7QEx2nSG8aL1cSL5OSa8FuLPJo+Cs95i4q5OK8er7T33tuBrdD133OJTA6UfJkbh02JlqP11po13rglBozZ7Ryi3ryKmY5Y7Adwwn/VyFqpd35EQBREz2D9udgYfxpGODut0+R7V6ciuP2MXgYMmFUiuElB05fUm1ZsHRwF9YpONCS/sJX1f8+c0hJhkj2sb4zTih+uGpNBHY871JWLKw8RRB67B+G0KP2Syin1mrq/WPH7YlTeUlsxV7mnqN6sc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(3023799007)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHNMN2Q3SWxOM0JBZXNzZDN2WlIwVmRyb0duSEtENFB1cm5pMDJxWHlldmRu?=
 =?utf-8?B?dndRdDhYS2lMMi9oRGN3SDdUeUZ1eHhWaFZKWEx0dDdMaHpmQWdON3FtV09Y?=
 =?utf-8?B?Mm81NkRMMC8xSm9GdnhZeHZQNnM1YmZyM251eURaMnZPOU9xRXVCNTBwVXBH?=
 =?utf-8?B?S291dVAwdEQ0ZThSMHlyVkNXdVpCMFBsTEtnbndrREtPeEJQZ2lZdDFMM3F6?=
 =?utf-8?B?UkF5ZzdNa1VPOW1wWHpGVUdQMFNTaG9zeXA5RmVHSkZvTExRVlVldzlEWWxS?=
 =?utf-8?B?NEd6cWtWQTkwU3BvUnZjcTlUYTgzVUNqWk5DTWNaOVRCbndxVFRxWEIwU3lz?=
 =?utf-8?B?VW55NjRBaDNsNzY1WkpOeHpzSHQvQmsySXpUWkhLelB3Mms5d2ZFa3F3N0dG?=
 =?utf-8?B?eThWVVV4VTVabVZ4NkRQczg3VFczblFiZ3NRSEZrQzFLWm9hbHhyMlVZcWw1?=
 =?utf-8?B?Z1BCbm94NTdNTkF0QjgzMEhTbWROZk1CbS9zclZjUXRZRHFmRi9idm5RaTY2?=
 =?utf-8?B?aDdVMERtR1FkUVNtSzhXSU1NLzV1STNxQWVzQjJlS2NFMm9kd09EUW90OGNw?=
 =?utf-8?B?em5yN0JIYUttNmk3RnZ5U2lpY2lCM1ZqRVJWVmtNVFI0YXZod21Xa0pkbXUv?=
 =?utf-8?B?MGVhQUVjTng2bFl6dDJ5bTI2WGJKTklEUG5BT0ZJY21IUVZHTEZGazJyeWxn?=
 =?utf-8?B?MVNBdEZOYzc4NVBHMm80NHYyclZKanJzak9neVZhWXR5RWI4OWpkTVhjS0kx?=
 =?utf-8?B?OVMzamFFK3dMS2tQQVJOSXZIMENaNEtLWDJhMmtnbUJmclN5YWphemlnaHV2?=
 =?utf-8?B?YmVIRWlRZWdySVRHQXJITzVwSTRjQmx5aGNNSkpyVG5GbDVrSjA3V3Vvdisr?=
 =?utf-8?B?UHFRQXo2WXlDZlA3dGFoSlhjM2EwcHV4MWd2SDE3NDMrTE5XdGJ6Uy90YkVv?=
 =?utf-8?B?cjg4eGlOTXpUbms1Q1lIYmVoMVAydExZVmlFTFlDSzhMUkZlOFlFV2NmUHU2?=
 =?utf-8?B?Q0FHNVEyb2c2SVJ3Z2F4U2MvMXBrbjAvV3VTUml1ZjZTT2crZmphYTNNaXFM?=
 =?utf-8?B?d2JRQXU4YVNMcThMckltOGFrZTJBdzQxTWQwTERlZDdCd0kvOC9CZnpQOEtn?=
 =?utf-8?B?eC9tSEFxWk14b1hMV2JzZVVlb2tzL0xJa2hBYlRoSk9xb3RmMDQxR0FSTGtX?=
 =?utf-8?B?Z1dUeng2c1BTODdCNmxHbU9ZbmxiakVCd0hrck9xdFpscm1hWkJOUmRxeWZq?=
 =?utf-8?B?NVZEeUhjNTNsWUJHRmVVNHB5TEU5Ynh0MC9jVmo1d0wwTE84S3ZTamlBbWI5?=
 =?utf-8?B?UEhMcStiN1NZS3ZCNXE2aUhGcTdzakluN1FRNlpVSEoxSGNTL3A1TkNCV1NH?=
 =?utf-8?B?SE41THlrRVJRcG5NalV6eEMxUjRrN1NyakdTb1VKQUVYR1FmL0tTamlJZHcr?=
 =?utf-8?B?ajhYdXdhU3IxWjFYWUVvS3ZYcHMyNjBRcUs5V0lmV2VWUFBXQ1hxMHVOTll3?=
 =?utf-8?B?ekI0S1YraHFhRG9RaWRLVXlJMUZMZzhOUnJydFEya3BxVStrcmtXTWdDamZL?=
 =?utf-8?B?Z3dBbncxN1VvOU1oM3FybkRCT3BieTVXbE4xOHpabjFtT3BYbXZlNG01RHE3?=
 =?utf-8?B?SUVLUEpvaVd1azJNcE84dGRaRHEyYlNIU25MT2xhVGh6SXRWa2lOTEJJYlll?=
 =?utf-8?B?cHdZbjdEQjJvVGg4cVdFSVVNbk1zMXZuT2FHU2pCQnFaMVFZczRjQ1FiOXhv?=
 =?utf-8?B?bE1LbENMMEpnZndwYTZIOXBQeFlpV1o5Ym9oK3FHampXbjdjRWJoNXo2aHhh?=
 =?utf-8?B?Qkt6TjRCcXVFWDZmWlRyUDlUVFBYajk5V1MrSG80VVhjcFRPblZHZmEreHA4?=
 =?utf-8?B?R1gzYUdXVnhyNXV2VmtVOThDMHcyZFljUDQrdEJScTBqTHdvQkNjNUdqU1pn?=
 =?utf-8?B?M2NuVVBkQnlJMlRPYk1lNDg5eExRUlB6ZmI1TDlGU05QdERPdzZQNnhwV0RN?=
 =?utf-8?B?STZJSndHUmUydVlQMlpQVTd5bk1EcElWRVpZVkkwbzUyb01SNFpxeldyRXNk?=
 =?utf-8?B?bk55OHhHenNnMmNaNm5VNnkzcW1mN1pVYzh2azQxek5KQXpTeGZZeWtrY1ZB?=
 =?utf-8?B?Zi9ucU1KYUNGSGtWVGVkUHVWTjI5NFh4UVcva09wNHVJRHJhU1YyL0tKczIz?=
 =?utf-8?B?aHNzaFA0UjdsT09TU2h5SXBvR3ZEOUYzaDdkSGI0b2IrZ29UMEZydVA4czZR?=
 =?utf-8?B?bzlJRUdib0ZvQzhhd3lwWmRPL2RxbENVVmkwZy9pYUZNYitCSDRoOERhZVdZ?=
 =?utf-8?B?cWVMR0t2T0JQNzFoZzZ2SHNqazNUNE5SdXNObm1MZzdTMUhxcnUyUWx2ZGo2?=
 =?utf-8?Q?eQfOHbMPOeziGmcEcNTHXfOqG0QGUcU6GQwvJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ea305a-66d3-4fe2-d01b-08def2364474
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:40:02.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBZAoIJoln7yGKtlWlM82fgg1AuQwceZk2LGYEOwsVIJB/UwVM/0tx7WcfyGdMCbsq1uOBQKeSRcvpPQKnFneMLoTV1FyZdOkq+74oibhDtMCJt5wrU3Ob0wQA0MWMqG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8021

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/regulator/active-semi,act8600.yaml    | 11 ++++-------
 .../devicetree/bindings/regulator/active-semi,act8846.yaml    | 11 ++++-------
 .../devicetree/bindings/regulator/active-semi,act8865.yaml    | 11 ++++-------
 .../devicetree/bindings/regulator/active-semi,act8945a.yaml   | 11 ++++-------
 4 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml b/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml
index b8ca967bc83d..49f74a9b1eaa 100644
--- a/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml
+++ b/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml
@@ -9,6 +9,9 @@ title: Active-semi ACT8600 regulator
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: active-semi,act8600
@@ -16,12 +19,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    description:
-      Indicates that the ACT8600 is responsible for powering OFF
-      the system.
-    type: boolean
-
   active-semi,vsel-high:
     description:
       Indicates the VSEL pin is high. If this property is missing,
@@ -75,7 +72,7 @@ properties:
           inl-supply:
             description: Handle to the INL input supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml b/Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml
index 02f45b5834d0..29ec8ab1b642 100644
--- a/Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml
+++ b/Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml
@@ -9,6 +9,9 @@ title: Active-semi ACT8846 regulator
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: active-semi,act8846
@@ -16,12 +19,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    description:
-      Indicates that the ACT8846 is responsible for powering OFF
-      the system.
-    type: boolean
-
   active-semi,vsel-high:
     description:
       Indicates the VSEL pin is high. If this property is missing,
@@ -59,7 +56,7 @@ properties:
         $ref: /schemas/regulator/regulator.yaml#
         unevaluatedProperties: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/regulator/active-semi,act8865.yaml b/Documentation/devicetree/bindings/regulator/active-semi,act8865.yaml
index afe1abc2d727..2423d9b65192 100644
--- a/Documentation/devicetree/bindings/regulator/active-semi,act8865.yaml
+++ b/Documentation/devicetree/bindings/regulator/active-semi,act8865.yaml
@@ -9,6 +9,9 @@ title: Active-semi ACT8865 regulator
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: active-semi,act8865
@@ -16,12 +19,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    description:
-      Indicates that the ACT8865 is responsible for powering OFF
-      the system.
-    type: boolean
-
   active-semi,vsel-high:
     description:
       Indicates the VSEL pin is high. If this property is missing,
@@ -79,7 +76,7 @@ properties:
           inl67-supply:
             description: Handle to the INL67 input supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/regulator/active-semi,act8945a.yaml b/Documentation/devicetree/bindings/regulator/active-semi,act8945a.yaml
index a8d579844dc7..f19d3f0e0784 100644
--- a/Documentation/devicetree/bindings/regulator/active-semi,act8945a.yaml
+++ b/Documentation/devicetree/bindings/regulator/active-semi,act8945a.yaml
@@ -9,6 +9,9 @@ title: Active-semi ACT8945a regulator
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: active-semi,act8945a
@@ -16,12 +19,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    description:
-      Indicates that the ACT8945a is responsible for powering OFF
-      the system.
-    type: boolean
-
   active-semi,vsel-high:
     description:
       Indicates the VSEL pin is high. If this property is missing,
@@ -127,7 +124,7 @@ properties:
       - active-semi,chglev-gpios
       - active-semi,lbo-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - reg

-- 
2.51.0

