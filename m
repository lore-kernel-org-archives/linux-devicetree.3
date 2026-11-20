Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795156248;
	b=yBdLHOSfqq+ub1+RuKyGTDs/Wuqzk6fQ16DUOE595W7iwFvmYxDdfvXazwjTBVEsKdM7
	 jVeZmR7kqFeUDFlZshLlLj+yi6nfm5q3kM7c8j89gwWlH7rqYrzA3el8Bqle4nS/GGQ1B
	 4MuO9Ulroq/lVo2S5TNvDcTTyQ34xXn3LwO4ZvGoH9Zxu04IvJpRhcYqO8ALfjQCz7RP2
	 UbM4PetWE41A+iRbR8Ix9iG0fhoruBe4nar3xuZckA/KDfrSEiiGeBRTRf1li2Kl3dq+j
	 RKpkqJu1wwqneiExQZoYEF8FJ0HJE4vfleCZTCCYlLBAJqurjCMzIt7+zIkmA/2zcPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=+zjLI76BF21MJJ1RNWp34GakTCEYmT2wES9xM4RLqK4=;
	b=JtOpic0W3wfbhhXSTRj3ClLQOOnNJfBUfW18MhBURuRJgfKPjx4caYYfYKqSaSZlzfGp
	 MDS4T37AmoYg/3kSCy+TGByW6l7o518YUuRU1TPUQfIFxvR30szg/gEU4RA8Uy7peyK5/
	 Dwi5533T2f7+NH4mO+UxPEBLo8YtDaeYw5Zl9al+uYsB+pt7loMKm+Dlq/rmro8Llxcu+
	 gVg2PG9he6lh+lRCXxyTAP2A8z6Yy+0VPIgqHx77TdfBxQfJcfrMLIGqmz96MjbjLAQq4
	 Bl5roamfe2t82CL5JibZzrS1Z1Z7OgEVVYIVv4CrQyJ3iTdX9t7oBFF19/XY/3EgepA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vaisala.com;
	spf=pass smtp.mailfrom=vaisala.com;
	dkim=pass header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=c7AmfaFE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.136
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023136.outbound.protection.outlook.com [40.107.162.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B5606A331;
	Fri, 20 Nov 2026 06:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72B5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=c7AmfaFE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXvs0ZdYJJzMvrQX4BxQ5GTMwgi7tdk8EcHRZewE1y10fSvI+bn0BUOnGluB8ApOOClA4CM0Cq2UxGVHGmzeGQdjzUwNl1Ur6rl+oO4IX9bWLSZ8h9UkdSc6HLT+vFrz5+E88pCde/uUe7Ynm9jL6Bm4G2fvRw1bky5BATF9fQWPPJswVPHSE6JPxWbMev4PUg8xy75+ROA07+lHsC9X+PSycGHDiL8cblzDeqbeoeHr3k8APjZZFRFRQO3QETQlwfSKy5/8QU2pw5+6Ajom+TBy1NWrnGQGRb6Xi00u8VmVlQHf0BGos+Z3YwVVKWcPS2yMcIc9R9DE9i8MB8Aznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zjLI76BF21MJJ1RNWp34GakTCEYmT2wES9xM4RLqK4=;
 b=e0fb3BQhI4tL+/jfwn44Hh6wv+0q7S8D5fv9nqfqZu/y8D+nK4uqYSGTOCVR3i4fVzO6oD0dmDguL9jc+RFCoCxhaPFg/w7agXNFUYbcHMExEq4E7ONW+4xB0f0TxltiHM+MpZop9uZwmUj2N5BCqayHsn1db+wGMfAKAMyBvABa/3b77i/+TPRKmaHeUy8rWS+xW0NMOYVfg0t1hAjfFY78j4oRJhWk9X7gFT/ip3nYe9mQKJJir7i9rf+DIyUFDlyMef6nzjvnEXq2WCKjZ4MrrFcbe96knWqkdWis4aTcj868Be5a66SzHWW5UeQySXH5vTs/mkA9rya6/84Yew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zjLI76BF21MJJ1RNWp34GakTCEYmT2wES9xM4RLqK4=;
 b=c7AmfaFEmwwlWu9fveNOoVekeC3POaMKEh+o927jjiQebP7iwjqE8nWWtWEEWiZTJI79rHCX+xRvbvysxZ64fJwiLpFRM7Z9xSZfxzeU//pMOVt4m5Y5chiOveF+XCvHojUA63ta+cLGrTmbdKEGBL/afT/HNBDIcR61DUnPxvtWY4dyZ8cFx6k05UHIylnOg7id/1OuN0lV737CVs0qmA12JciCrvgTbxq+iyumN9jnSa5XRpcZAVgrBWTZZbxVtUwDjM4epPVNf0mxU4FQQLs41O6RRjv83lcZSvibBItIfixKGlEcHSO1duFaMGZkJBrOzostbFubJXtmwgpF1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com (2603:10a6:102:407::17)
 by PAXPR06MB8207.eurprd06.prod.outlook.com (2603:10a6:102:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 06:30:38 +0000
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc]) by PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc%7]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 06:30:37 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Fri, 20 Nov 2026 06:30:29 +0000
Subject: [PATCH RESEND v5 1/2] dt-bindings: mux: gpio-mux: Add enable-gpios
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-add-external-mux-enable-gpio-v5-1-0b622c1a76f7@vaisala.com>
References: <20261120-add-external-mux-enable-gpio-v5-0-0b622c1a76f7@vaisala.com>
In-Reply-To: <20261120-add-external-mux-enable-gpio-v5-0-0b622c1a76f7@vaisala.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795156236; l=2633;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=Tznz5Pomzhn8sPHJXFMjUS9LAdPGbEwSuaMKaWEiYuo=;
 b=TJaMJ1dKjnajYRUFbFQrpsk8ziJuI73BgXPUG3OUGdc+LUyCapnE/t47dVfcvPtyS7kD3w8cc
 AvzEhw/sDbOBsYgvc1nsJyKGRfRnM7lQpTErJuBrim8U6udp0dTKL/q
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV2PEPF000480F1.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::42f) To PA2PR06MB9176.eurprd06.prod.outlook.com
 (2603:10a6:102:407::17)
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
X-MS-TrafficTypeDiagnostic: PA2PR06MB9176:EE_|PAXPR06MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: a9dddd38-4250-40b7-1267-08df46cfca6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|23010399003|38350700014|10067099003|11063799006|56012099006|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EPD2CxGDuxYDAi2MulokayDhX9SZ0klY/Vt6y6gkTX2ybg+xsqrEjAaWtqxroUqTsT8wVsBMM7uLOcxU+WPVQ14bCJQFrsEwI++nh4p8oZBjbxZwRAi/As1I8ItEVUNHnjapl3Mmx7eIuZ/jl/yejRGYpUO0f4mpn7KHDmkxRU/oWrYvOaAOYewr0P/r6mw/DwoMQsYuunMQaCEZsYQB/rxOvFLiE4RXYdkNLVFJwItH2DzpBVQKvyI8+cGiBeDrvjO0AKhQ1iSC0wW0CoZO92TpQnTVPPzOLSPPnxXtMz/tfMfMG7RMqetELtkB4wUFGyOtbzGhevm1n8yU2fgMoSBzrjJlK976bP+//dMtmLGixZfbIJuJOGFO9h3vAVksev/w8YNB1Et2SWVXs52wOwzbgrRJFKBYyoFzR3r8DMCXtdDy8+CAnT4zV0tZOaAy8OU3XwAvJ+sxOlc+7fX0QBimlHJtZHvoh3WsPKkQey1HhgRQY5PQqpIlgVMAk3XJ5sHgVZlac6suIIikRU3UPWC74URLRYZzYwkyFzSvXAjgvyNPBWEF1VDoRLYOM9BD+nCJDhM8hUunhho0+hA5D9PB3gOW/MlZ7zhU8/Gt1oQgmryQQCmV04R+9OQ4C2QvxJHeLeUQC2MSyEiXPS+rtu+gHc2dj/GAKzmsSAcu7e5CdY6L/0c5hT2DgbjS3U6LhCqiZQgwSd0HzLqIuzxfkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA2PR06MB9176.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(23010399003)(38350700014)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1JRK21nSUI2aGJpbWpTK3MyZWFOcTlEc2owODYwNUdLUk5Ydms1TzNyWnlV?=
 =?utf-8?B?T1EraW5Wa0xTb24wVmF4eVIxcE54YUp0NndzU3N1ZG9FZEpNKzVTQlpzdHc0?=
 =?utf-8?B?bmFKT0dicHUra3pHYWs5NTJLeVFBV3lmQ2ZqQnlwbjFNLytMU2ZLRytIRzQ1?=
 =?utf-8?B?dW15Rk5FNGdabmtraG1Tai9WRjZWVi9rejhMZHI4U1Z3YklkYys2QUhvMlkw?=
 =?utf-8?B?akQ1Ri90WWdGakl1aTVIKzFycElGRFg1RG9TV1NNSnpjeDYrRUxvWkFZOVA3?=
 =?utf-8?B?TjFKcnMwNlkyQWx5RE5SdnJXVXFKeUNjUEhYUWFFQjV1Zi91Z09ucUt6dHFO?=
 =?utf-8?B?bXFtOEJ2dnA5MHpUeGRRQVRVOUozdUtMOCtIcXV1azM0d3ZnTkZGcGxiRmE4?=
 =?utf-8?B?Y3gweTMwcEVtQWsvd3U2U2FHZkdNdkJDck1PNlRDM3BJVkw1ZkpuMWwvdG1m?=
 =?utf-8?B?OVlHcDRaQUN2bnRhcFZaRVM1L0JybXdtK2tnOXdwRWVMdGxQL1g0Y1Z3d2Vq?=
 =?utf-8?B?TXJabXRreURpbkxWNU1PNlc2TXk1blVMdllHcnc5dE1ZOHJVbkpMaU0xNGRN?=
 =?utf-8?B?cHlvQVkwb05PRmk2VHpGYTJmOWhhN0RJMDBRelZRZk1ab2ZTNGJzN21HYWJE?=
 =?utf-8?B?TWg4NEZPRFpSbC9yaVhURGtYenVveXFBSUwrdFg5aktXWVcrUlhGeEJyRzBk?=
 =?utf-8?B?YlU2VlRJclpOczdqNjhzVTVUSmhDcko1K3hNT0hORExRUlRQdFZBWnFsZDN0?=
 =?utf-8?B?aHRjRHBBcm1SYlZPUWxNeGJ5Tk04YkU4QVEwRUlGcWdFbHk1OSt0N1lqVWlH?=
 =?utf-8?B?QSt3S1A5OEcvT3dVRXE5YXRHVFB5KzFOeGpMOVRPYm01ZGhEOGhnc0Z6SkJX?=
 =?utf-8?B?TWRaMHJDempoOHpnSzdWTGI3Y3E0VzlOSitEdTNwaC81d3B0dTBDM2JCU3Fq?=
 =?utf-8?B?bVo2RDFzV3p2VER0dnB6L2htdWh6R05ENnRlcm1PbmpBSVhPSUdsRXdZNk1H?=
 =?utf-8?B?bDRLYU9zNkhsOS9ROEVUcmRib2VMRlZ2cnlwdmtla0JaV0Nlb3RVanRjZTh1?=
 =?utf-8?B?Vnh1NS9lNHBnenR2UExTYXd1ckNJNC9YMTc0L2pDbjdFOWRMdFNtbzZ4Zm9N?=
 =?utf-8?B?WjRQTjFPazM5bFFnL1l5a0FzQ1ZXcDQ4NXBJaFMwTytXd1hmZmN4UXdvc0tP?=
 =?utf-8?B?cG9XTFFCMWg4N0dlQ3Z2UXdYQVhWMHZlZ0VjV0FsMi9nQmxxUlkwOUQ2YjRP?=
 =?utf-8?B?ajdDb3NzaGorRU9iU3JqUWJDMDNEdmxqRTd3YW9SNUJ5WlQ2RXFGMUVJdFZv?=
 =?utf-8?B?b252S3piaXgxeTQrYS94OGtXR0w2cFJNSmRkdnZPU0dkWkJJZkVXTWNBekRG?=
 =?utf-8?B?SzB5NnNLaDh0TVUzVVpjY1d6WW1XV2diNWJpMy91VnY1Y1VsSWNTSkVKZHJG?=
 =?utf-8?B?SEptMHoxNkFpNEQvdk8vVlV2SDl4ME1Jd3JIY2kyRXQ0WGwzbkUyd3c0TmEy?=
 =?utf-8?B?NUpiYjk4VWc3OXlQbndUZmVMTkVKSjZodHJPQTgxaGQ5Zm44empWdnBhVDNX?=
 =?utf-8?B?ZDF5czBTR3hDV3doREdWWWtMQnlrMlFqbm16L2NrYjRUbEU5ZmNLa1BBUm1N?=
 =?utf-8?B?VkQ5K2YwcnFZcXVMK3RXNEUwSXRlbUw5VVhXSldLeURQTWY5d1g2YS9PL09R?=
 =?utf-8?B?UnI0RlpYZ3NjV3RWUTFaamxBOWtySk5DRkZOaUdXMUE1cVB6b0EvVGcrb3Q4?=
 =?utf-8?B?MVErY0g4cUVyaTYzM2NLb0ZPYWVEekJKaFRKZ0YyTkRzcGhZQnJ2a2hSRmph?=
 =?utf-8?B?T3FLWXk5TDNwK3hYQjEybS9OaHhXYkMyMzhUZnFuNEFQMm5wWEp3OGl4UVRX?=
 =?utf-8?B?SHdUNlJDaDRaK0lZWW1wMmZ1YTFXdGJIQnIxczdFc1JvaHFTdHdXd2FZNlYy?=
 =?utf-8?B?UlFaYTBHNGY0c2pQN2JqRDVKZiswRGd4b3lsQmVZUmNFNmpxdllHOGpuUXpR?=
 =?utf-8?B?eXdhREI1dUVtL2ZqSTluMERoMGJLaUZ4TGxMZ1Z5WEJGSEh6M3hENUlObmRx?=
 =?utf-8?B?WUx4U29IZi9yQVNIbWlzTTljNmk0amJPemJnQWV6UWlwamp0S0tlNDFoV3FI?=
 =?utf-8?B?RWVWQUxia0pkZzZVakxLbEEvT0dnVmc2SVhqcS9SdVRsUmZPczJCb3Raa0Nr?=
 =?utf-8?B?L3I3WE80NEROd0g1NlVYVnhTeEVEYW56TThZbEpqK2FXS0M2OEFpd2tybmJZ?=
 =?utf-8?B?QUs2K0lGOVoxSGMxZWFxTnBXRldVcE80ZnVSSVNPSzMxRXdQVENMejJsaWp4?=
 =?utf-8?B?OTVpbWRKenRyeXpWYkl2UkE4ZWFVVmVnbzVROSswcGUrRkZPSTdEVXNOQklF?=
 =?utf-8?Q?akNsXcYYSggTJN5A=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dddd38-4250-40b7-1267-08df46cfca6e
X-MS-Exchange-CrossTenant-AuthSource: PA2PR06MB9176.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 06:30:37.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kS8g2SNrC8JFqovPFptVWYsfcZxKi2Oxy3TbzLnqi3rK/7CpEVX+6o8kvHBoBAt/sjECuh7eiZevDTSoQss4RmW4gvgavoboVUyGoto1r0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8207

Analog multiplexers have an enable input besides the address inputs. On a
74HC4051 it is the E input: with E high, all eight switches are in the
high-impedance off state, independent of S0 to S2. A 74HC4067 works the
same way with four address inputs.

Two things need that input. The mux-controller binding describes an idle
state of disconnect, which a gpio-mux cannot reach today because the
address inputs always select a channel. And the address inputs are plain
gpios that may live on different gpio controllers, so they are not
updated in one go and the mux passes through the intermediate addresses
on every channel change unless it is disabled meanwhile.

Add enable-gpios to describe the enable input, and require it for an idle
state of disconnect.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 .../devicetree/bindings/mux/gpio-mux.yaml          | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index ef7e33ec85d479ce57c5fe4a780f81a08a6ab6ba..2dd94704fd7bde238af4e84af87c2ad8e955eb14 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -29,6 +29,14 @@ properties:
     description:
       Regulator to power on the multiplexer.
 
+  enable-gpios:
+    maxItems: 1
+    description:
+      Enable input of the multiplexer, which disconnects all channels when
+      deasserted, independent of mux-gpios. Deasserted while the mux-gpios
+      are updated and for an idle state of disconnect, which cannot be
+      reached with the mux-gpios alone and thus requires this gpio.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
@@ -47,11 +55,23 @@ anyOf:
   - required:
       - "#mux-state-cells"
 
+allOf:
+  - if:
+      properties:
+        idle-state:
+          const: -2
+      required:
+        - idle-state
+    then:
+      required:
+        - enable-gpios
+
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/mux/mux.h>
 
     mux: mux-controller {
         compatible = "gpio-mux";
@@ -59,6 +79,8 @@ examples:
 
         mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
               <&pioA 1 GPIO_ACTIVE_HIGH>;
+        enable-gpios = <&pioA 2 GPIO_ACTIVE_LOW>;
+        idle-state = <MUX_IDLE_DISCONNECT>;
     };
 
     adc-mux {

-- 
2.47.3

