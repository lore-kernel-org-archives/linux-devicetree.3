Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E22238C36;
	Tue,  4 Aug 2026 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854395; cv=fail; b=Lhpn2kjN3yVGGqDL9q0VZ490KbzDWh+R8IU6JeZVv2J+I/LvG7bvtuUaq/CET7S5A0kuJWCvF0euSoQDh8aSU+XAFNcctcgdDMpkV8/MfkH+SV+D3t6Ctn0p7itzdEXCZGNpNyo3fNKCFv47HQ81QHOY0RRw1SB3Vq59Zosan/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854395; c=relaxed/simple;
	bh=cPB2RPgKbQbfjH5PY5PxtR0uaPOeHM4dWQBVIMVucUw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=c7jNN/XKrRKy9ECtq774YEhWFCm3JayxN+97VRmsAihEfdprdKO8RSnNcD1pCTAfG9+1sUfG89NtoJnnVQkxwHIY03qtpSrjCisohMhM+15cCe3RhWXHaPeOFVKpZwiNS4vgtuSbj//jteKMwC8D+TKOhzJXuFnGE1ObKn3eV/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rlmn5Gz8; arc=fail smtp.client-ip=52.101.72.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rlmn5Gz8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtLHs5Bh3JmoP03SSd7a0+vAKmZ/zNORIWoyZ1ckVQdRqsJrJR//ygPOwPoYMtVquVstD2bhAMiFLm6demqZDorQ2mHWOtnZUDvKbZJxLx6EmTp6kCFIUq5mLnDes8Srz49qDx74SDGKr0EW9BlI30vpaevfYtBcw8xDBUcU2/W97lJST49a1mINe9XAVfF7bt/bML+ZQLDjvHaee5FOthbIFoItKbu1No+lm7soJqgAugiYNA3IEqFLVIRIOJqoCZ7PX+2orLMZLRmDZj5m2SuDVdnx8MGfXkIrMrff0imvV1pzmZTqxlTBuaGiPa1KQBxIC7lMy15X+sJfY4q0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v33wG7UMF2tmBKbBHg2o586BJt2C5Hv67M8RiAcJv2I=;
 b=NziR4d9sUOLL/mnNVkjopKOCoZ51Z/1jVDKwnAFCXgiCIYnsQwFfZ6aaEwzYqGVmtrW9wsB2pjyutM3J5zYSakigCKnMr6i7vRyyZouxHFecZ1AXy6XYSv8F27FITRDLt4AMHqY8lDJJTlpRye1XMkT69V2drSkFcvAedwUqzlMV0SXcOdn5kIb4beHDmsyyS+HVR18rVpi5ZnYahU0hLYTKg+iXfxeAkYsxLd5cE2Zi2+9ZZu43t67iuGkbKDnHtQtfMbxVrS6a9+aoOdeqCK3mRjGFlf7qvnrVqDnVv3vk06B2yyu4RwMNBp4EECzcfkym6JM8tToxMsPbagex+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v33wG7UMF2tmBKbBHg2o586BJt2C5Hv67M8RiAcJv2I=;
 b=Rlmn5Gz8tvWbt6ApwlT+A/s4E+WBxuvX/wcoCC2IPt7XP1GycHqHeMSNmmlGk5Paa5C1mMVuJ75EN7v5guTJ1uZGQfWrsQz9ECDX1Vn5oZM8JOek7UAgDveQj+wICAjlQeoKXbWaHpTQ5Y/44fw/sOiyClHBJ6NO21MJS7GFAK1HZzs7ROp7+wbL7U+NmvjXbmbAXb3mkiZwvsLHmnjI8nLeQpqyUcqzdJtdl4oFN/RgDn5SFQZB3lBs/vFfVVpdn2YSg+Pi3SAC3qVbhZC7JYK+ixDFdVwvPkoyJG7xrBg9yXTde/R/F4KKmw5XUNWT3xdLk/mUJV+15YYMyrhCXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB8021.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 14:39:50 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:39:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] dt-bindings: regulator: Use generic power-controller
 schema
Date: Tue, 04 Aug 2026 22:37:51 +0800
Message-Id: <20260804-regulator-syspower-v1-0-b05af2081184@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/5cWoC/yXMQQ6CMBBG4auQWdukBULEqxgXtf3BIYaSGUAN4
 e5WWX6L9zZSCEPpUmwkWFk5jRnuVFB4+LGH4ZhNpS0be7a1EfTL089JjH50Si+IqYJvEOsqts5
 RDidBx+//9Ho7rMt9QJh/J9r3L1ruYJl2AAAA
X-Change-ID: 20260804-regulator-syspower-3ca6ed43d911
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jerome Neanne <jerome.neanne@baylibre.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d4f31d-250a-4e80-1947-08def2363d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|3023799007|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wgsitrk3ewd0yMIcoI2I7/2NqjRg/5JPx7zN6jj77FeMTke08rI/b+IEQ/GQvpdZHgojiLYy0dchqD+a1WP4nnnNp54G7FFSIUeahXk8cRq6k+38byCnpqlwqwhf9fAN8bw2GG1bUw4bh0hjUQNh2r3CB27VxX0Rz1aTXcQsDjC7pF0fcxjZuWTveYi3QRH4vMDbfSFY54tkjCtaI1mL5Sh6QHCjahIfN3/cSec1rxHfugP84tdG/6F8Dw7WipE2E5WcotQz9DcuQgJsT94JDVpggLV+Virlo+tIYIYy5Qy1e27e3h+OLoPQH29PNX2otuyHvWKPRZYUYopjcfu8IdZJFpj+0nQEGOJLhaLB1DMt23x2NHD0nCESaf/jTETVrPUae9GjUCIF2w8Q8GS9btPjMf/UNZwxdY+Ru9WWJy3V7wxV8JycnQfGoAlugTl4Kv8o3rqvQhl1K+Uf69P/182gK3CBwstYPmNc6csMYHQ72yH0x0iyApJ6hI95Jb+tXOCcjfayxH81Xfs+NwbY8rj+1Y7dODyLj/7/ps0ZRY+EnydsYDO1i2UqyqA+6mZxhnR8zKYPC5lQ3KXiSCb2yDPiOwS3DAbvkYrarPkpXe0kJ/bc6PgmlbSW884+5MQWytofLVxft9Bvatr1yoUf+l2XPb6dGysqYB2hU/9NsjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(3023799007)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akp6NksrQll6clRPVk00VjVKUTNLbUdkVW5CaG41R1VLK0lRa2dpM1BteU1q?=
 =?utf-8?B?ZXVUMjNsZXZLVHVXZ1hWVlplSFdCSUtQckE4TE5wZmFXVi9ONW1DTlcwODhL?=
 =?utf-8?B?bHZtOHZCT1N6a0hQNUpGN1N4KzFtQlIvMzIrV3ZBMDBCRWQzVGs4QXVMOElJ?=
 =?utf-8?B?eDRJd09wejJMM0JUUUJpTWF2VGkySUZNdzIzRlI3a0pNQVpzaGtQRnRJS1lV?=
 =?utf-8?B?SHBkR29jTXRXZldVb2Z1L0xCZEZYVFJtYVFOYnpsUVdNdThTWjYrcTlneVQ5?=
 =?utf-8?B?NU8vT1BuRDFKWkszWld6bDVOT09XaDJlVVlCeUNBQ25mQnlPNzF4UEw3NUJs?=
 =?utf-8?B?aGJRVFZnaThFUHloUWpRMEtHemhPczNZbFBuRHQxdmtWM1VUZVROcE45dVFS?=
 =?utf-8?B?UEg2R0g1dnFUS2t1eU1td2N0bVVLUkFWanVUYUZaQ3VEZys4STlndDZMK2Qw?=
 =?utf-8?B?UHdxdGcrTmdpeUdSL25pbTNYQUo3bWEreUxHU1A2c0JSaFk1ZHVCMHBXU3U5?=
 =?utf-8?B?MEh1YWdLOEpsMWN2d1VkN2tvcncrdnMra2xXZmJZeGRSMDNaL3dIRWhudmU4?=
 =?utf-8?B?aHhJNXBBeTFOeCtxOWVVQzdkaGc5NU45ZGpKS2Iwaml6M0w1OUJEVEdKM3k5?=
 =?utf-8?B?R2IxdGo0RFQ1V1lLUFNZaDdoaVlBbnpBMTNLTUhWaUt0OHJadWhld1Ixdk4x?=
 =?utf-8?B?ZnBHekFsejFMblBhekhNS1REM1gva1l3Mi9GRXlNRjBlWS9HQWVhNHpWOEVS?=
 =?utf-8?B?c3kvbDVkK1VEdjBNODc3dldOL0huK2oxWjZwdjFBWXV2NXFSN28zbERwRUNq?=
 =?utf-8?B?cEVQM1M5M3FvYlVYUXZwdWYrWDgrT0xTVEZ2Z0ZlaDlqVTR2RGl5T2dsNDNu?=
 =?utf-8?B?R1dxZWtxdkVnNDA4bTJYaDJqWWt1M0w2emJIM1A2M2kzT3Q4R2pBSVVVVVlv?=
 =?utf-8?B?Y2o1UEJVVG9rWFJxUjRObjlMYjVVZWNiM00wQWtDU0xkcVYrUU4yZ2tmZk5H?=
 =?utf-8?B?Mjc0aFdUNmd1NjBkN0JBTGJ1elp5UWc3dFBjY0lSZHB2Q1paZVBLSG9FaHFr?=
 =?utf-8?B?b2tjNGYwMXBqVW15dFVkeCtPVDJRR2svaXZGSVBJSk1zUmFEdzVTSXVkTVJU?=
 =?utf-8?B?MkUxUEJTanZrU1hLNnljOTloTC81UjlrcnN5YVc1MkIxei9TSHYzMFcwMDJj?=
 =?utf-8?B?Mmh6Y1c5Y2tEN1A3TVJGdk9xa3ZTckdObGhvVkVMV3lUQ2pMOG1ydXgvSmxn?=
 =?utf-8?B?aFJhcWpyS1Y5b3htVFhqWXJFZ3YxUTFQb0tESzgzVU4wZXJWcnA3UjJqd09y?=
 =?utf-8?B?emtnT0RmcXFOQXNXQTQ1eVVTcmtpSTJnUEptcll3Z0g3WDh0VWRwWTZHRlNK?=
 =?utf-8?B?WVNSZy96Mmp2RTBRQzVoZGpVbDJDVE02QzBWaTFCb3Q3YWZEcTl3S0RuYTBi?=
 =?utf-8?B?aDYvbEhJYUd6TjYrUWhabDd4RkI2Q1lFb1V6a3J6UnlxNmJzZGtWcUlZSStB?=
 =?utf-8?B?N1hxcEk4ZzV5WUVMM1pxTll2SFBGZVZ3bWpNdHBNall3emFwallQQ1ZqREUv?=
 =?utf-8?B?VXBtTjRUY21jM3J4UnVRSXFuWGcyM1pRNDZNQ3JiMmtGRUlESi9ETTdvYjJV?=
 =?utf-8?B?WnJ4NzI4SlNmQmNuYmZZckF2anY0V1AzcGVDT1RIMlQ2QzJaWnE4Q0ZwNlNT?=
 =?utf-8?B?NmFqZTg1UjgrYjhqalB3Qm0rRzNDN1FVckV2N2p0NCs2QXdQS2lYMWpjUVBt?=
 =?utf-8?B?R1VRTVYxRkxLTkRGQ2IvaHNWN3d0cTByb1FWYko3ZXVrWDhPM2MxbG80dXJo?=
 =?utf-8?B?L3V5T0xnSGQvTHliU2k2eVN1YldOTklkOVNpSHdFQU01d3lQUjN0OE9LOWkr?=
 =?utf-8?B?MWcrYmI3RGg4eHRFMHBNalh6U2NvU3AzVUt6eGxIcHk5MmJuNzJLNFNIOWFE?=
 =?utf-8?B?YVJWUHpYSEJCN2VjREhuYmZ6bnVrUTljaUo2MEVaeEp2WHVPQ2pvYmMwZDJl?=
 =?utf-8?B?MktONnpicHlsV0ZRTEYrTzdXamQzL3FweHpCeml6Z09tVnV5TE51UzJYdUhh?=
 =?utf-8?B?Q1lwSnNHMnpJY0MvUWVTMTJqQ3Qvd2laL29LY1d1dDY2WDFaRWlsdkRTdjQz?=
 =?utf-8?B?SC8vV1p0Tk14ZjF3eEU1MDRRdHV5eHY2Wldib0hSdEp4dHorQ2RyTWVCMGRx?=
 =?utf-8?B?MlovRnROR3pmWUFxZi9TSjZzRk1GZHJHSzlMUmliVWxPSTg4RlZ3R3hEMnF6?=
 =?utf-8?B?cW51UDhjRUpPMzRuRmMxV25pdXdyanJmVVdvdHA5Z0wvU2JkNUkwTmdzNWRk?=
 =?utf-8?B?VFRTQ2IzWkJiOXJJVWJxSkszby9ReDdZck05SnE2eE04bEMzY29vMjNCZHE1?=
 =?utf-8?Q?bvj1KyUWdwgwSysFMQdUgT9qQvNDHXkQRnJ94?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d4f31d-250a-4e80-1947-08def2363d83
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:39:50.8265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAFqJt07schU2EHJcp2fWbe+bKvuSAFEwIAoXAutlO+GJ2DeVhYOAwWaz9xkc6lm6z3Fz5JmzxBMnS+inEmEzfQyK/wEPs6TQ4Kd2w009KYmYWsKbrT9Y1f+ZKd1YmVv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8021

The generic power-controller.yaml schema has been added to dt-schema,
providing a common definition for the `system-power-controller` boolean
property. Convert regulator bindings that locally define this property
to instead reference the shared schema.

The common change across all patches is:
 - Add a $ref to /schemas/power/power-controller.yaml#
 - Remove the local `system-power-controller` property definition
 - Switch from additionalProperties to unevaluatedProperties

This is a pick of the regulator patches from [1], rebased to
linux-next/master, no changes. A-b tags are kept, because they
are cleanly applied using "b4 shazam".

[1] https://lore.kernel.org/all/177523251875.1559844.9690289848283345069.b4-ty@b4/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      dt-bindings: regulator: ti,tps65219: Use generic power-controller schema
      dt-bindings: regulator: act8x: Use generic power-controller schema

 .../devicetree/bindings/regulator/active-semi,act8600.yaml    | 11 ++++-------
 .../devicetree/bindings/regulator/active-semi,act8846.yaml    | 11 ++++-------
 .../devicetree/bindings/regulator/active-semi,act8865.yaml    | 11 ++++-------
 .../devicetree/bindings/regulator/active-semi,act8945a.yaml   | 11 ++++-------
 Documentation/devicetree/bindings/regulator/ti,tps65219.yaml  |  8 ++------
 5 files changed, 18 insertions(+), 34 deletions(-)
---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260804-regulator-syspower-3ca6ed43d911

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

