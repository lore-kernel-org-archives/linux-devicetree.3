Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F6F439F67;
	Tue,  4 Aug 2026 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854401; cv=fail; b=kEaYSejwE9St+UGxHA1I4rmYhwHeKeGo40xprk4iSGwuWRUy6KTiBfw+miVLqWE2dft6EJCo2U5QoBGv4W+stel6/YalE42QovGbtM8/x71GMLuwJvJ2sucquDFwvUD0lJl9VWUTOQoGfolYRwYJAXCz5zTo4GXX4sTERXKCylo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854401; c=relaxed/simple;
	bh=+gmimBtLt28gRvQB0PXyLwyTezZCN0vssoxF+2dqVck=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A05R7X30ZFcCuDps8JODT1uFm2on26M4lxO9m/y7WY1k3VWrX/1h5lgo2MDdaqsvtfCrgSwAa2iZ6fevkamRSx6Apl4yAuhAMpP45Cof6dvMFXavhnCrVIXbFGhYyepgw2/mTxsbAKSnD/H9zNz58SRInE1aReeYHxyiCvPimW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wDIbxN4G; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wDIbxN4G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWWl9L3OuXzyhle4FqGVsegDnAbY/fvKFXMvf4pN3b2RQwxBf30tHzi3AzSk8u867Vb6PwunctQXk5tGVvx4SIF5oDN1JSxSxGPd5Sa22psI6XBYyi2DmDuaK3ErOdtwOq9N8OU5ryA/atg6bgThFWaihBh54IqgZ5kQN+zvt+eGOFsWYkBgyJydNMGE1P4HzTBgThDyUCJqJiSG38ZYz85Om7+uaZNRdAhILhmoIpfIfHGhwXWy/ulCe76LOCQ2PhifF1yoTSrmy4+F4mtW7VHmnQ045gJiLC81M+gV8mhMVC0CUkdKZG9hOo7MbAuV54KWq1YyIH48Ta5SmBFGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCI7SiEJxkez1YR3Pf8Jhe1D/gvYlzTjjEFqyAyYFsE=;
 b=Y84d2lh3x7b95YxQSZxYZ6rmtIA+NTjW2+FNg/dh9B3IZ8xMWcw1w7JTtJp4voIQuOLWnFDXZlZYWj015Zpv58p1bZGs7cNBjKbr36sbmM/cJJjNKFV5gLjnHCYuqoHDp2ZQ0lX+YXE/juyx5yMJjrlOT3cI3ynJOMJJ7mW9T7CahvcnRwiFZCt5wQt4OQGrO2f0MgpzWJaagb7FaXiYDdR33/6+HrV+LVBYnWibT1DMgtZ+vgC9oZa6Phrv76IiDDDLoKMg7JC0TsR5LRazOEJKA3ToXg0fCPWlAMjrl4AfYvgu08NhbRjovhb90KpFaOc+TZrQRDNmZ3oFu1TlKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCI7SiEJxkez1YR3Pf8Jhe1D/gvYlzTjjEFqyAyYFsE=;
 b=wDIbxN4Gex10cMAQ1RNLD7uFcs9T5JZXn1msstZCoAXwIkosASiP6LnM+CL2du3WA4kG+0SNpABwQnpc1002xjhcMxMc0Ygl4C8Fkt+eY5hDQaJJa1uCLzloaq1Ksn7Yb2ooOvSQ4YbUIGt/APcr3lLADJqgyE5O9qcj8WTBXub/dlRHEgdah9PJos81nVPsg6JmcLrUzOMhM7nmkxnmeXTJ2fG86kxvWQZ6b7uMWbtaqcrN5JvodI3NleD0AZkoqQ2gffyh3DZdymi1UPmlV6cslJGw87cl1gj5FVHBJVMbtWQNTGpw+uF6e79MKMMeRWFJ0/oKVzO8NdvpTNzelg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB8021.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 14:39:56 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:39:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:37:52 +0800
Subject: [PATCH 1/2] dt-bindings: regulator: ti,tps65219: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-regulator-syspower-v1-1-b05af2081184@nxp.com>
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
X-ClientProxiedBy: SI3PR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:4:297::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f0af97-fc96-4efa-65c4-08def23640e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|3023799007|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oylFI3p91cGlmxUlj9aglwq1ypiNV7Sbkjt5L4RnBlJBz2jZg2bTYdEncGQOgKs2s88TODn1jsF7CJEDnwc/Fq3VtpmPsijRc7bIUxnoqeC38JSI6HhVf7LUVRkcVBZm63v23YsEXrY+EmKQ0INoP7p4moARUEDACTeqmU+wfGx1GAyj1+gJo7G13cDHT5t+ZUtggxEZij4+zQd++3UZ0ddBgwwRAMxAnf8Lf+dq7dxRd6UIL4++MDYUayOKD4ah8fGB0gUSlZUpHKkC98I/+KtOQzlY33TQ6hjeQbfof66D8DNKowGGvBkKhSMgrFxm/3nuZ61bg5mR/C1ssidAuGPBuKE2731VeFB3jsrka2QQNniDXhgmemAOR3dnpPncvfDA2hSf6+SQpOCiFqyqMeexjUCub4Rpy+ITnZ46eIsWHRBzb5XlaEO00/rGiSdHyy5KfhCTT5VP2KaG3zQPcBIVJQfb3VYjCmNSyOeqnysU5Ro518x7GbS/gIXx+mdM4PxX6UULa5mX1sOLZl1bOJ6wmwPjmNR2Fu4EC85LqokupsVmHK2h3ZMuhjzA8+RJAUChfZRcTK3m0TsCobFDk1tr+t4iBklxz9EI4HAJLKOiRimf84x4VQ9RDE/uZL4tTjixT38b+BkH3HyCcLpYAkqeJ+Bk+r+bJAM99jRG4Kk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(3023799007)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emdYNjdOVW92NG5teHBQcUdncHkwbVJlZDZnY2pNcHhzYkx1VmhpWVY5Y0hq?=
 =?utf-8?B?TFprSG5rc3B2Y2U1LzhWMEo4WkhkeElZM3Q1OGpWR28wa240OVI2WnEveEdz?=
 =?utf-8?B?bjNBSDNtWm1IT3JLWjY1eU9wcHNTcGRGL2lFMjFaVHhnWHg5dUUwbDNhMC91?=
 =?utf-8?B?VDV3QlpKeGZ4N09mR3ZXNG5uaEFUbXlHZTNNSnREazE5eEsyd2pGN2duQzFl?=
 =?utf-8?B?aHV6YWlRNGwyZk5xdVAwVC9uYUE1RnBicTFuTVQ0WUpaTmFFcXlFaU5JVFcx?=
 =?utf-8?B?V1hoZVJkTXJzYVN6Z2x0QVlpNkE5TzhNZ29uYjhBTWRTVS9qb0pNeloyNHpU?=
 =?utf-8?B?enFjZHZQc3I5Z2JicVlSSFFsbWJ2WmdKVm9vOGhNZlpWMk8rZ0tORGM3UjRy?=
 =?utf-8?B?VVNTUjFxUjVKTmNRYXEzNW9XQklDUXNnOUwvS2Z1SEEwcHFLYXlMTXViazlE?=
 =?utf-8?B?ckJIcGVUcUlFZ2pmR1BKYys0MzdrNkRsVklacmFiQWlBMFpMZ1FBdFZIVDNV?=
 =?utf-8?B?cm15YWtVbHk1Q1paVDhLbTk3RXJlTVJZQnczb1k3US8zZVY4d1pKd2pMTTJO?=
 =?utf-8?B?a0gvak1KRU9xaEJwTXROR245T3ZncWd1bHMvVVlBM1dQcmtrYUFpU1R5dXQw?=
 =?utf-8?B?eGZLSm1BWEVpLzVHRVZ2RElSUkFrbUZhWERDZ2J1TXV2Y2JJRXQ3ZitGMFU5?=
 =?utf-8?B?UzZHdlk0OHBkelpBVnI4SE5lWmg3T2JBUVhZbXVzdGo3MXlhZ3JGWVRqbHpY?=
 =?utf-8?B?Rm44YzFDeEFJN2RPbHhjY29ISFRuOXZnUUk5R28rcHh5TWxhR1V2SHlkLzZp?=
 =?utf-8?B?Yk42ellndy9mUjZmbUd4aUpoM1lmcUNNUXBTd3A2VWhsMk5XcHhSYUpGSGto?=
 =?utf-8?B?ZUFGdnNqeC9zRTcvNE9KdDVwMk1MU2o2T2QrQzdwdGhTZVdyZmtzbXlxWHBp?=
 =?utf-8?B?L2t6ZXUrNXk5MGdsQ0xFL3c2dVozMmNScHB6My8rVC9KbXNQclRhbGhjOVhB?=
 =?utf-8?B?Unc5dmJQOUNWWi9DOHZpZUY2cWVWbmVLRGJrOG5MS3VvQkF6Yy90Rm9Ma2I1?=
 =?utf-8?B?NlYzZ0N1VVdZOEpzYVlncGFTS0g2U2REK1AwemZjbGhXUThyRWdkSC9kaEpE?=
 =?utf-8?B?TUxMSmh1cUxWc2lvczhERzExajUxVG9hWjZaWlArUUxrbzVjQlBnODB5Zk9R?=
 =?utf-8?B?ZnBHWGt6M3Q3eDdaS1lzSzRRQi9GTEM1ZkVvbXdKZmVxSlRuNWVUamNIQmNq?=
 =?utf-8?B?YmZPRExGWVBib2VYV0U0LzVUdEN3aFZaV0tqSzhTU2tuT1Z1RDVsMm5CQlhr?=
 =?utf-8?B?Z3F5bW9EdnBRbngvMlVxUFAyYkJ0c2lDK1loWkpocFNyNFdGVWNKYy9VNmdm?=
 =?utf-8?B?dEtWTjJBTnN4cEZMdThSbXM2dkFwY0g4MVNvTHAyaUF5Z0VXL3lhTm1vdmxi?=
 =?utf-8?B?TCtIVzF1bGFlRGpZU0F1R01KREhZWkJQd1JxSTIzWFRxR3U1YXFhN0d6elIy?=
 =?utf-8?B?WGxzTUpjekc5eE1wZVhoQmtzZC9yRjRhY3YxQ0MwYVZqdTY4ekpBeGVNaVhq?=
 =?utf-8?B?QTAvMTF4Y3hHWGRyMHkvSDVIQmcrUjNmMUtwWUlCVDhKQWZiUGR0R3VhQUd6?=
 =?utf-8?B?aEl0TXZqR1FrblZiNlhjNTI2MzBvWE1SVkJTQ0kzSTFKTDJlMS9VbU9UWTRO?=
 =?utf-8?B?bjFadCtiS2I0YmEwUFZORHFFZUU4MWVVREhqTTdMWUhvV3FKRWV0Uy9RNFRP?=
 =?utf-8?B?NlJGcm1VQ3ZVU1ZBQkozZTBIZTUwZFNPaUxpVjdNZ2cwV1JBUGFsMnlOTy9Q?=
 =?utf-8?B?U2Z6RUR6NjRuVnRXNG9mNFY5L3ArUVNQdkc1aU8vTmJaUVIxaFgwb0g4TGkv?=
 =?utf-8?B?d0NKMXJ4dDJsYmhTL2ljdDA2V2xPZHdzZm84Y2hYUVk5VlEzV2phUndRV3Za?=
 =?utf-8?B?dk1oSFczZjJnQ09UNXlsQTEwSkoveXpYTjlBRGFqVUlja0dtMkJ5Q0EweE5a?=
 =?utf-8?B?QjBldit4NGxZTmVUeWNYNE51ZEJQZGMzOXhTWkJnVGZNNWF5NVRjOE0yVGdZ?=
 =?utf-8?B?L3l5TXk2eSsrTGxNeWNFbXY4aTJ1OVVyRHZxZTBTTk82V0s0b2ExZUZoOWp0?=
 =?utf-8?B?SkNYd3YyaVlybnJNUXRWMktWcU9iNndXS3pUdUdUb1RZMjNSRDRubmsrQW5l?=
 =?utf-8?B?bnphVmNzMC8raU5sa0ZmeTJSaDF6R1lmenJzQkh3SXhhTHJ6eU9zUVpld2U4?=
 =?utf-8?B?eG1yNDM1ZUc0eUpDNFVEa2tzaUVJc29FUldwb3I3czR6N3lDZS9McW1HOGhs?=
 =?utf-8?B?MHprWlVVV3BlNHR2M0hqRStpQXYvYWN0TFBhNVpkZVhmRzcybU1CZWxUNjFw?=
 =?utf-8?Q?DfwJIwczq07qkW319cy3xyweQNRVP/atgpjNv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f0af97-fc96-4efa-65c4-08def23640e8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:39:56.6931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsUcadWd00kIcI0eXF00l1WBfff3La0rz1DiwgZP7Jst9NvCoaylkAGE7nRWKuf6W2wzQ/Zgm2ao9IE3UXXI9nEmRduwWKa0nLj7upXSbd3po4Qc4HTa2qsgcMYYXXuY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8021

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/regulator/ti,tps65219.yaml | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
index 7c64e588a8b5..d3a82aa7319f 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
@@ -31,11 +31,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    type: boolean
-    description: Optional property that indicates that this device is
-      controlling system power.
-
   interrupts:
     description: Short-circuit, over-current, under-voltage for regulators, PB interrupts.
     maxItems: 1
@@ -99,9 +94,10 @@ required:
   - interrupts
   - regulators
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:

-- 
2.51.0

