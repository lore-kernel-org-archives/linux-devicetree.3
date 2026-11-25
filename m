Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629932;
	b=t3rEpIvEunBWp3QYBXplMNj/RgGvn9xeGyRcDSXZ8wPZA5nC2i3CX6AP6FSFhO5f8n+b
	 xxATQ4mzbHGBmRt/f/btnUxX9tgkbfIIIPbJ09p7k29rgV+R2JiL6wTUkZegES0edzWS2
	 e+eVmcw9mI7RjSY884eFbPDJh9+Gp1kybsbgglXcjjOWpxDCdf2xD547jE31T+J8ZqS2T
	 r2cHmRcQc/XvcYBuqoXpvbDM5rLiq3U+KiG4dgbpTNE2WZcoM+fLw5V86uz6WWxPqc5a6
	 5j50MbY2BcJHRgKS0GzYcqN1GUJKmonmMVfPUKKghKhdI2kk7LGnD9KinazmXrYMBpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629932;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RnCmbIvyhXLsSj66IiI2fqNNlGnfZPjVJ+2ZbH58I8w=;
	b=xShUbOxSTcWrEKys6hcWQJnyqGYSi3xnrDGdmy0nicNBFY14wZ6WIzEptQwtOjL4UvhO
	 YL5QgGNyuAOSUYZ6UsHCgeAcfYuXzpEEZSQHGT+xJfcfWn5aziDAu1aCnhDb1AJr/b6ur
	 TwhXF/KynSH4pScPn0QlNTTVGxRgcA5aV1mP2eKxOMzqaPwYHsge1l/55CSh1QvOqUUz9
	 UFA4x/5uHdWivhcz+TINkP647hRQOvO3diO106OMg3eIq0oj7mEh88uIJ7w7aD9LC6Mju
	 m6eQuB4ziuQpR6TbA89Ew9kuOmlgMyhqjbPyM6qSGtSY0dgduiZw2Q7MOrVG+5IoBOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mz4O+lJV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.34
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B7606A338;
	Wed, 25 Nov 2026 18:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1B7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mz4O+lJV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8zNcDFYJoYXUMGWMJ/iBBGfEaGOMNYaZCk8csae6mnJ9xSW+Mg04RnyO1WSZNph4U/LTJMY4cL7TRWtaE1WQBRWEqgKkGjG2jzb6fx5a0p2Fb6cpuJxteD4wupfmJ4aYcorywdYiswymTbTzG9V7lR3n5Z5TUZE9A/J4zm0wZyYlj3SaX+Jr+ZSTofzt2HVn2cBjf+U5fK/L9HXNY0cdP3CzkVkl2X+PuhSxqjf8URAnnZswHQYuhv2pGqQP0Kx8AF9yzrvc+E14wuGCEN9uLMLB/eZw22PP2Fu5He7NxyDUmTrpzS4gPzdQ48L52zO10FVGIbpDu3NYxRY5IJoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnCmbIvyhXLsSj66IiI2fqNNlGnfZPjVJ+2ZbH58I8w=;
 b=NRcnnsg9LXMYn2olkR/QxMhf0UmZ5Iyc44BXyzvbNRCtEyQY340HDZhzAuWgl6udGq+m5vVLdQ0ae/X0AwmLOhAO1SOX2el9y5PjjqW9AGMWc3dPvTmIrkYxgvUufewry1vMmBdsVnLcRQt4uj2OrK11AuK9hZDHOhqwhgWvAZ9W96a5Apg47spGGTC0ZR52S6X3F5vx6Gej66tv190NiZIbU7Bi5dhEL5aZRv7dmApMnZ45s+3WYaFg/Oak8crCGoie8bSCl0ALts3fDIElcc4B/asg7S2hWkPk5avb7ynF10lFB75DN3FoziB9yaiisvawZUK9GX7Ze97/4sR4fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnCmbIvyhXLsSj66IiI2fqNNlGnfZPjVJ+2ZbH58I8w=;
 b=mz4O+lJVBNixoN1EbkcFcrZ6RQfAFNOX3U9ctDk+H4awm57fv6ZmeTHTD9X7ol9daGZtLK50mlPLBeGJ1T7AB4vQAj29a9a6u6X223I/E6az7L923chXgFeyhA8nNCgU8y26pEdL3cWvefVU9lswBJEmMxmCAyuglPt2gbPsb+l2Op49IHd+E5NWrUgoeWV4ZFFCd9CwQIbLbB5arOahaUFZHaxmYBVFIFiiSIwiTN8BMM3I3co8Rgys0HZE14PRAh3F+QDyCyJBl/PIpYKpe3Ph2ZhDh5E/o1VJPmPOJFJ6ZIwRTI/MfaUc6R1/7XxG4hbojC29DraY0xRC1lEgLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BESPR04MB626074.eurprd04.prod.outlook.com (2603:10a6:b10:12c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 18:05:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:05:28 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx95-var: Add Cortex-M7 support
Date: Wed, 25 Nov 2026 13:05:22 -0500
Message-ID: <179562991843.3149625.11362946576694746843.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123124946.13887-1-stefano.r@variscite.com>
References: <20261123124946.13887-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPBP307CA0021.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BESPR04MB626074:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a847d7-0a16-41d9-9a43-08df4b1eaff0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|7416014|376014|10067099003|261022075727099003|261102123227099003|261021121427099003|261009223027099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 h12jl7mJzJyZuTkcWy9+m+5vuFjzsPwRN0II+BaKIAUG9X1D/RAF4X40GWrgei6ivDVFsatjvC0ezkhog+Z65ewMuFcCYrT7XiWs2dfdaAzjJ/gGKhv9/ZqXguSobwL50XXChgxA1gU4DUUHYrDXH4qInZZY/4KVRYqvTxdYyFGl9LYcIcAcZxw+hDXpD7kklFRzVag3xlgk9PN4qmppCswerbHA2CX3jws4gefXrK68Z1gbhYucS1Muh9KhU0FxYrmoB0A4aRLW0eb/9Rw9Yd/NebP4IjQkOhIh/DQdH8wO7HFUb0ggNm4/hcnIBfxfxH6rkimkHJgwim/aNmr7sdYeuK0b3RNgai5F4OQsnlSwVTfRiOesTv9GmfX/kvPWW9VOnVfVHZaBzX1X4bQM9L24sSSSZQiS2RhhdW5Z8nmmJs4flDPxKRFzpb+hz0fBWqq/Sqam1ZNjp8MJYB6Vu5PSffSm15TL6wP9I81HigHAG839FqO7hVJAzRZ7Qa4pX451VZI4NWrFYsgNdvIM/0lo/stwyReo6EWKDIxQLnJfrC9cWflQMZtIQp7hCeYDdquanrwCt2QWtdQ8OzguVYQNRMnJGDJNY16B7JZ7XL7297YhPDc3vNHLA6ekbsGtOiEDSlyq8gidB3cRC8dJXTRQh003Hrq7kLP8Lw9PFE0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Qy9pc2ZVTVZja3E1cTY4Vm55WmJFekFINHZkR0VOelJBZ1MvK1VtdFpTejll?=
 =?utf-8?B?dFlhcDMvNEltNUR4Q0tKcVltejJ1UmxZaDlSaVdUbW9NY1c0bllFUXVnbVov?=
 =?utf-8?B?T0QwZGhEN0xGY2dNUTdsRnBDTjUwUFQ2Q2JBNlpoVWg4RnUwY3IvQXExQ0Mz?=
 =?utf-8?B?eXJ1K1BxSXhFOVJNZVlrMi9GNWZia2VQbXhOb2kyaHdUTkhmMC9XVXBOcUVS?=
 =?utf-8?B?Z01wZEJ6Vy8xK0RLSTZ1T21QR1JQbkw1TWpnZDhZSndHdGRzd1FTL2pDSHNW?=
 =?utf-8?B?Q1FGb0xIYXlxWEVia3dGZFUwbEJTZStFcFAwV2hmQ0RIMDNCSmN6NllGQndm?=
 =?utf-8?B?WjBYZGdBUkhIN1o3UFdLSU9acm1CMzNUNzFpdThMc0d3Smg5Qzkwa29walMv?=
 =?utf-8?B?RitJV1hHT3VwaGo5c2ZNQmx0Sk1ncXFsM1g2alcyZEc5Q0xQcXo1U3FPb1Zn?=
 =?utf-8?B?OHRTN0w2dUxSa3lNQUZtQUZXRmdxUEdkSFZNdlNzVlRYZWVWM2F3Z3cvVDhI?=
 =?utf-8?B?REtEdEliM3ZGMW9QdGVtNmlTSkNBaVJrQ3VkMUNtWE82V1pQVVNPaXFQWU5o?=
 =?utf-8?B?MkRRQWV2REw2d0xZNDhMU1VYTXhxTmFZSlFlbUNYcWlCNHhIRHVWSk1WTjdk?=
 =?utf-8?B?bmoyY1dGUXdobUlTUG9zTlM2MGtXRHBZczhJTHVLZE9DOVRyeVV6N1RuVTFo?=
 =?utf-8?B?QThRVlVXMy9pUHI1NlJYV3ZTSEYyeHBZTjBMMzRRQWFRbVBxNW5KdjN1VVd0?=
 =?utf-8?B?WWFJc1ZkMEpUNVdhQkJ3dWd1Nm1MZEcrRlU4SENmaWlBZzlJMTExckFqNG5v?=
 =?utf-8?B?Q1lEZ1dOSmN0ZWo5Vlo3aUhGMEVKRzcybWFnYlU1VU8wS2F5TEJyTkphMms5?=
 =?utf-8?B?U0duTHFqQkdsalJ2a2J6b2pYY0dZei9oeHl4Ykoya3NiNkZyQkhBN3ZQaWZv?=
 =?utf-8?B?d3R1Tld1QXVtaEl5M2VsNVhQQ3JyTnRteWl3OWhZU05USEFtdklWSlpVODZp?=
 =?utf-8?B?ekZHOWtSVWs1OFl2UzNWbjE2NE1kYk5xTWg5ekRZaFQ5cHhCNGN0eWVKQnRk?=
 =?utf-8?B?U1VTbDd0Q1gvcGlRUW9BMm55OVp0VDMwaXZ6SUxmVlR4cDQ3dlFCcE9pVWJa?=
 =?utf-8?B?RENJR3ZJQXFBY2ZGWHUxeHVBbnRYZThkeStSeUY4UmlPaEZrbHlZeFRNWlp3?=
 =?utf-8?B?T3piYUJqd2Z1QVpCVnkrUXA5MEtoUERvcHVTK3lSUUVTTy9xZkhlNi9CYnNy?=
 =?utf-8?B?dEltZzl6SkYxakdFdGVGYjFZMnAwbUhuOXVBdS9BcGxKdGZuSlJXYko1cDlL?=
 =?utf-8?B?dGloUlVTUlc5SGRNM1NScjhEdUNoQVpLcnBsUTdJZTMwSkhVOGlJRVNnTHYv?=
 =?utf-8?B?czJ0TTU2QXRKbERIdE03b2QzMkh1TnI0YzAvOVlYemtpaVFWME9uVnVncWVX?=
 =?utf-8?B?b2FwMEZ5VHl5ZjJMVmg5RXF5TDU3SVlLQ3dZKzRaVkxPRVQ4ajVLR0JsMTAz?=
 =?utf-8?B?cVBJaGt2eDU2cFd2U3JpdUhBU3NMelQ5KzB3a1N1RTk3enFvN29GRVB2dlgy?=
 =?utf-8?B?TEdVVG43NHphUlZYSGRIc2dOQU9rVzZYUWx2c2NwT01BcDNzdVRuUnJzQlBx?=
 =?utf-8?B?TXFEUkZXU2JaRmRmczQwS3pLaWVaWDU2NUxDdU03bE5KckxYaUo5Q0ZsbXR1?=
 =?utf-8?B?a25HNVpZRXk2TFgzcW9TcFAyVEpPdlZzdStNNzkyZ1ppejk0ek4rekd5YlIx?=
 =?utf-8?B?U2RUcHBXQXB1bGVMSjQ3NnpXYmVCOG9Ed1JEVmYxQTJ2d3VYK1Q5VFJlUEcx?=
 =?utf-8?B?YTVVb0NPSDdsYnQ0TzZMZXAxaFZRUnRYQXlzd211UE43S3l4Zkx3M3Vtak8w?=
 =?utf-8?B?dExqdUp1RFFDc015RU1vcFdVejVFeDRSdWRBT3hxRGw5dEszU2tKaGFNTjgr?=
 =?utf-8?B?OGYybTBrckVwa2RnZ012anF6NFpHMkUwN2YrVGJ4bzRTN0NCSVVrbXlMcFQ3?=
 =?utf-8?B?UmxKNmZyR0x4dWJaR2tJTWJ3ditTS2QydWxXRXBNWWo5MmUzSStFSkZMQStY?=
 =?utf-8?B?ODVxWFB1SlV0eWQ1WDVMbGc5NVJMQmVFRy9Xb3ZodXNVeUNJaUNuU2xkT3FT?=
 =?utf-8?B?RFpzdkxlR0x4R0hUSDU1RkxpcjBpTXR2V3A5UXNLQjI0aWFjcC93Q3Q0SEYy?=
 =?utf-8?B?T0JINEd5Zm5LK1BydHdCSGdkbHYvelN3dURMQUlJZzJmSDJYcUgwZ0pXcEVw?=
 =?utf-8?B?eXZlTUZkQU9MMkpibTRCYmRFa2pmcGhsZkMzcnVnTHVYb0FEV0ZyM3UrYjMx?=
 =?utf-8?B?c0tML2RVcnppS04va0xvWmlibUZieXg2cC9PYnFmNEdQNlpuMDhhejVQcVVR?=
 =?utf-8?Q?BhhuULN7swqp+YBIldnkh+K3T1yzNpILUTyv8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a847d7-0a16-41d9-9a43-08df4b1eaff0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:05:28.3737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkEOIuFYoFt+8mn/0SJQpJzgwnNARp8badRz93nP5R8FXRZ3QPIKzYBvH5q2lCq5o5oUu9lutNvZsaCdYX5CeLsHpEPNTVr9KCY8JOX5gOUucdCQjfLKQpnqD9Ycw9pr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB626074

From: Frank Li <Frank.Li@nxp.com>


On Mon, 23 Nov 2026 13:49:46 +0100, Stefano Radaelli wrote:
> Add a Cortex-M7 configuration for DART-MX95 on Sonata.
> 
> Place the reserved memory, remoteproc and MU7 configuration in a common
> include so other carrier boards using Variscite i.MX95 modules can add
> M7 variants by reusing this configuration and providing their own
> peripheral assignments in a board overlay.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx95-var: Add Cortex-M7 support
      commit: ce3fb16c792be10ac3b5f29a6d8a6460e4f396c9

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
