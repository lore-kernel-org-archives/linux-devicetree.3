Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023139.outbound.protection.outlook.com [52.101.72.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F436073E;
	Fri, 19 Jun 2026 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781860439; cv=fail; b=AvR5rpkok4YD7nkf+7BoEa6vrr6Zu+EfnwlidIuZtoAVPo2/1cTlPDpC3kzCkGIIXF71xSp+d3bgnIZaHVyisY+hZ5sgISGagKSrYVTF48b3jAPt5VYHWZdvFaS4NKqbsGE8hta445WjJsZ5FkQGjf29aykAecygRlcTJDy+UGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781860439; c=relaxed/simple;
	bh=lcP7luCwayU8CGZISZ6aKen/QI94Pu6AY1qZbKrjC1M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L8UYK1/4h5mz+KvsoC12RzvnidD4fYeEc+BXOAAVmBhqsAOHqVjDWiJn9iuKDtT49S1ag2ChmTeFT8KSd1RGlkh24icZX4K6uZt7wa/W0GGaK65GGJb42NLAQFBEl6wckE/7JflPFp70CwcWTifrviBvl3D5ySuaZTCahh0FMS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=X2ParqWj; arc=fail smtp.client-ip=52.101.72.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="X2ParqWj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PigLi6kH8IFn6TNsnd8nl2Cq2+uUZ700PVL546ONyjn+chN2P7+BlF4puU+FmKPi9Fes5gffR3LjMuPKIKvzs0NKjZYuPEaUO8eJxKUySQchNXRsb9H01F3A+8gQRyoDU8OCC1UysA6bKG9JHs40euK1cMXBNFQVv15pcMYNJvr6jjtb3+DtlfMhcl74jzaYNzZD7ZfQ1tMAa+vEOIfB7dk1TmI26729OqWjJU6yEUSGaCuj5awboyH1wueka/sWnCVa0W5PMA+ob0xtMVZDFioKHb46WRofLuLHsRxsZtpZvrpyUd880oZtksRMUfyo9lEj0cab84lfN/h2GizL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhEzWR9s1IiHJwKfVTjkz4E6vzsV4JUjbBcYm/k6HhY=;
 b=Gse4Y03/08wI0eX1vIZ9hJJ3DL3sQa9KD2Da14UG146cqtwrqEyUAi2ZwF1qKSgEwKVXx3+0tpRPBTW3HofiNDcKnWSzSTq8SzhIGQy2Xv13/tv/5aKMPm/hwIHLPgAOCXb285ARB3XYrYkTM4SIDAaXm1LHIah84RbMliIgbYS88iYO3l4eOc0YJ2liOPcG5W+FCAzlwvA28L7FgiHbGSJNizHHNfLXzD/JWWbzc+m0YRVHMtcAxyxA29SjCIjAqzEBZ0tVovGKOWrNcz4E4m9i/WAvt/YEXKGYDh98XvGqO2djBoF8zhO7mEKKwBYlQtkidFuPKPiwiSLyCuoaTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhEzWR9s1IiHJwKfVTjkz4E6vzsV4JUjbBcYm/k6HhY=;
 b=X2ParqWjhzeJVer/hO6vkeumer5xUxQ8xPZSh2gnDzsp+RwSxSWdtnyV2TVGocv2GnLA0PkfjMrkiP0euQltoWeQahlikDZculsQ5Pp2j1Y0rk2FP98Dda21ei32MExuVk8lF5FKpWtLEoGtWsvBjvjPxMbjRPuElGyqwX0zLV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by DB3PR08MB9010.eurprd08.prod.outlook.com
 (2603:10a6:10:42b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 09:13:52 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 09:13:52 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Fri, 19 Jun 2026 11:13:40 +0200
Subject: [PATCH v2 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260619-feature-mipi-csi-dphy-4k60-v2-2-323356c2cc2e@wolfvision.net>
References: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
In-Reply-To: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781860427; l=1221;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=lcP7luCwayU8CGZISZ6aKen/QI94Pu6AY1qZbKrjC1M=;
 b=tdLi2BoiGecDJPEdxr0STkRi/++uDVp9VCYH4EQp5hBlLl4wt49cWpRG+zvW7RUmPuf832zcX
 6nWBPffJlcUAbBhumfyddj5N5X/aIgO4gdcV3M+gdAx45gOxzwF4Pua
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|DB3PR08MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: c54394ea-f41c-407f-c571-08decde31377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|52116014|366016|1800799024|56012099006|11063799006|22082099003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info:
	oCO0Dh9pxMjoQp9LBacwAsfVfWHCu2LZQuubVos73CLGP1AX0Ct+IiECGULE+tXr+zrLYMfCwoYr64lVzK3QtoBB6pl2kL4/ojbxAQ+KOJz8RhoBBzZCGdJIZsmdl8Jgm7CY6YVOhZx0Jh/6Aq4Ju+tTRRhj4DJdw62fSc6nIP7aPVaIb3A3J572qTdsFR1P4FktS4wTwSTK5IKnDhUBSr/tKnlJ9MdQQ7X/nG0HXZYm/0sC+Nb+/Ndolpu0qFh3+o5Tr8BiOfHudnhaLxk19C5HAWYyBsZnqmmpfT7r8/mcrQeRGey/Gepqa4EBVrriJ8C5OZSbzkR/lc9xDez5L/CvzCqmLU7Qfr7AGKgwcabTt9UvZoY6mljIHxjkewGHXB0B/SZ9bm2woE0sC7vFxmF1qewCRgdR3jb7BNoXATKWYTq1Lw6RxaV7dpJqdrgFCcBn8CYLup40by5FkkEKL7XkcAjlMmlJjv/V+r3MxbI7/2OIXCkQe60uDq0mv8VO+RZBEJk/Jw7BzJXG/dbGzTRaB9jYZiN900ELq01anC662Y06pk4mTH4ZeZbeFLAfwELn/AGB+jNT+oqPx3i6qSxVRQEPoN6t7I35a812vQIeVIb8vgINQuZUw913KlDtbQQeR0X5nPM4Qfp7iUTViayLHFjnfUnN2E6Gvmz62v24uCkEqkP2kuiF3uutkUWKvVjWvNVFEPo5gwJDiVb1btkUHaHwkysxVPhmI/12q+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(52116014)(366016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXk1Ulc2UGlIM2lMVXFkK2x3a2dwNE9KZHZHbHdQYSt5WTN1cGFSTm1IMkRL?=
 =?utf-8?B?OWE4THRsbXdhTm10UUlwemhkTkhMbTNCSGt1U1htMFNMSy9hb2daTzloNEEw?=
 =?utf-8?B?a1F5K3VXRFZteGFCSkd1d0RHcjNYYml1dVZYOXkwVmM5YmhJSno5WDlqNm5D?=
 =?utf-8?B?OTJIL1NtWG5CZkZNYlVsdkpnbnlBR0U4YVJ5NWJic3dCeWU5eGF2SmxPRE9H?=
 =?utf-8?B?RGNpa1FiNUllYWlVNzFRQktGNWNMV08rbU5uVFJTaFV3b29BYndyWWlMc05n?=
 =?utf-8?B?ZVpvekVhRlhBaXR5U0dVVVlPUWNzeFo5NTFaUGhCaUtSY3IzclVtSVR3b2g2?=
 =?utf-8?B?M0EybitkekYzNHFlWmJ1U2hMeW1LVzIwemJYbnBydjRaSUtVaHdOTnRsWGFL?=
 =?utf-8?B?S0dIazJXUFpwdit1cmpvb2RZVHV2UEVVcXZpUloxQTArQis5UjNMTDU5WkhN?=
 =?utf-8?B?L2Z1WDFDRmR2T3EzaDVaajN1NUMycDM1b0cwWkNxQy94SnZkNU1kSVpvbGJp?=
 =?utf-8?B?ZVBkS09PMVZIbGN2MjV5VjRlZlgxTEJWeFVuemlhVzRBb0c3U25Uc09SM2Ux?=
 =?utf-8?B?RFBEMDlsdTJiOU9sT1cveG16RTdnd1VUbXJkTXZENk9KVi9lVTg3bW5uZ1pt?=
 =?utf-8?B?enlweExrK1JJTWNFWkVyaDIwUzYvSnVFamFBTDRtdkdpM3BwRnh5MHpNRHVt?=
 =?utf-8?B?N2E0Zjl4VmxyelpyOGxRYlFFaDZGdSt3WEZ5YWtxVHEvSlVmcC92eml1d1Rn?=
 =?utf-8?B?NlNOa2Y0dERGSDZlQ25od3J3TFp2WkxaVVNkaTRvaW1KMWFKdklmbWpsaS9o?=
 =?utf-8?B?S0JXRXJHWklOS0dheXhkTE9FUjVDNFlDaS9aWXpOTm9tMDh0UmxtY2FnbFFs?=
 =?utf-8?B?RTZCVXZkamRXdGhsWm5nc205bXRxZFhrdjlYczduL2RmWksxeGd1TGdUUStv?=
 =?utf-8?B?d2loSUFCLy8rSTN2L1dGQSt2UWVpL0ZEK1IzemNHdmx1SjRJeEhOc1V6TTEr?=
 =?utf-8?B?WWc4TEpKTGt3WTVHT1NoVndSdDdqYVpOYXB0aHUveUk4SDVDa0I3K2FqdDFH?=
 =?utf-8?B?YldGZkRNS0ttS3kwQ1dldmtVUm1EU2ozWUppZTV1Rmc2MDc4RzJtaUpGbzVB?=
 =?utf-8?B?UTl6SkZUK1pMWVJZTGlMVHR4VXVDaktoQ3BlVWxMdTRVV2pFZm95VnlEUDZI?=
 =?utf-8?B?TllNeXNUTWNHLys3WmJwMlg1S1h3R0dUTmxpVHNROE4yVE9wSVhBSC9qRjM3?=
 =?utf-8?B?S0hadlhRRnczQjRxamx2dmgveEdEZllLWjREeXU3cjgvSXY2Sk1GbG1Uejd2?=
 =?utf-8?B?cTM1dnczaHREK2YrTmFGM1FSMlVIbm4wT3BCMVpHOGVvc1JwTjlML3Rvbi9Q?=
 =?utf-8?B?R2prY2srajhGbUg0aDFUdFNDVEpMRzBXWTB3ZTBRc0NMbVJhTFJQOFRyeUxk?=
 =?utf-8?B?a3VycU03cDZsZ1BHTU5nd0o1RGphVjZ1N1YxVEViMFlGREpsalVWZ1R4b1BH?=
 =?utf-8?B?Ui82dU5lc3lSTXBKZnRCVVhVRFlkT0VDRVIvSkxEa0ZKM1VabDk0ZFl5NGlF?=
 =?utf-8?B?YUhmL1kwaThuci9TMEh4UGJkdnBuL25RMFlrUjZCaGNGV0ROelU4K0pzbXVS?=
 =?utf-8?B?YW5LdWlwdVBEanp3dDhhclZvcm1aRnpFRVFIc0VwdCtpSUs3YXBlWTZadGhV?=
 =?utf-8?B?KzFjNDlQTEcva0tndnF5TW83VW5oajBDeTR0eUQrQzVGbUxoS1pDRnh1Mnlk?=
 =?utf-8?B?dHNla2RROUJjYlR1cXR2NnRJTEtXY0l0MzVCbGlGMkU4TW1XdjFmRFFUczcx?=
 =?utf-8?B?bElQLzUyYVVxbFlSL2J6WmI1ZjYxbW9Ga012L0ViYzN4YmRBQUd6VlgyVGxl?=
 =?utf-8?B?QXhZUVh2ZVN3N1NMbXp5R2RSSkRHd1VQY2gyVFhBSERiQWt0eEMxanBqRG8r?=
 =?utf-8?B?ZFN4T3c2N2pGLzZ6MFIzd0RMdVlwU3F2L1JtbW5NbkxWOWM5cmFOd3RyZHJh?=
 =?utf-8?B?Nk9pcVVYZkxUaGkybytvQ2JKcWp0L1VHUHRWbjg1KzVvN0RFMlNHZ1RCbnJO?=
 =?utf-8?B?djlNMmg1ck85QjdEcU1wN3VjSzl5SS9TR1Nnc29RWCtvQnhuQnhYK3dhb2hZ?=
 =?utf-8?B?NHozQ2tZY2JBbkViZ3RvKzhiN2hYS25FMldMWnBXS3FMeStENnNoWmpWZ29w?=
 =?utf-8?B?clNWR1cyd0Y1NkJLellWQW1mbG5lNHl6U3FsMjVNdFRFNm8wSVhpSytMR2lC?=
 =?utf-8?B?N21yV1MrSzZTTUgrWUlDYzZZdHFtcjMxYk9GVU5sdkk4VFBlcWZZT1lWZis1?=
 =?utf-8?B?NlRaTGNuU2tCckZ2UmJoY0dTQzhlRkZBK2RQbjI5K3BEc1hpMmIzck9KUnFl?=
 =?utf-8?Q?EwfTwGDA/+HwZYNI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c54394ea-f41c-407f-c571-08decde31377
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:13:50.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yN3POvSIuZ+I1DS0BnYok9V79eFrx72hZCc/QxOyAXPJ/KOgcQLtjwsbi5mHXTQ4E5eJ89YHstXJ1SiStVU/r22emtEHk1aUaD5J/rinuz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9010

Add support for the optional rockchip,clk-lane-phase device tree property
to allow board-specific tuning of the clock lane sampling phase for
improved signal integrity across supported data rates.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 03950b3cad08c..010950a8a8856 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -56,6 +56,15 @@ properties:
     description:
       Some additional phy settings are access through GRF regs.
 
+  rockchip,clk-lane-phase:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    description:
+      Clock lane sampling phase selection (hardware tap index 0–7). Each step
+      corresponds to an approximately 40 ps delay as described in the hardware
+      specification.
+
 required:
   - compatible
   - reg

-- 
2.34.1

