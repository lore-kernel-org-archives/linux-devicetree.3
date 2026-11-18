Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794997858;
	b=lIaIdicOCVJdSXXUDzsCGNnuG0mvXo9BdNyW8BbnyvTiv8QiIAt9IHwLlD22KmUKATYs
	 mHRqaXWRebi0M2qyY03erNTT4WO0heWJQObBGuYnYWg/dtop1hCXbGOiTDRInCcbfI8cB
	 ZKIAMsgUghACaLFKDh9LVOg18ylQQ3b6XT8/V7VCkGlsfF3v8GehhkQmBkhv3U6cCA0IB
	 GqvvN3MrSwG9l5hSlqktFXpdW0QexJYYG+3o6ophkY/dxX+B3BrITk+MsEGK31GXzcsbF
	 1Cw9xHCyCm6a4mc+CtDnMN+YDvwqukCZGeOE46y5dpB9+oqb4M6sKgiYKgPly+ChWAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997858;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VZhk0xYM64wZzmigRfc6+fqsodbghheVW7QvCupgAHE=;
	b=IjsZzCK/dSRWi0K2Z44sYzSUMHdrBG+L0p7/I6WidIG2y0iosbCdQ5/K71gmdzEGS/OE
	 88f9mNFzqL2F2FvdMn4DT07qb65f3AK/o8Pc41mpIS3MFpqh0o8gL3LIJ1Tf4dQ0lMBVH
	 rsriwwz4Nya5IoINL2w3yj5v9LUN3DLmLYR8LrLyKFeHf9CwE4XGomoRoj3oorXY37G1O
	 HbX6w8C+uu4lyns2W4t6JjZPNA30w4f+qCMT40KNAAKBNYm6H4BwSUvtIpyjJ4Z3D6V9+
	 dAj92dGJpiEWojI/lZVYbHWZTKAK0yOdLBm9X0c0+xF+nkpq7VCaKWKL0MsIgEJxS2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=Sl0YDSfK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.41
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013041.outbound.protection.outlook.com [52.101.83.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0249606A320;
	Wed, 18 Nov 2026 10:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0249606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=Sl0YDSfK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIlKGR3Oe855QrpQCuNISn7KLhUETvwZKyFS/iPNv42t6dIIxE9AT98KFme9XZ/Tfwojo5iKpAqfwA2PaDRc0jm7b+F929RqG6PT6tcfp2B4Ng6dpP2+VZ9lKui5a6Ixs22kiIp1rpaoHsbT/BeUek0zFqty+VTY0ZaathnpaYDd1j5uwy2woQmKwkVCmeiKxKMS//JR4IUW4Pw6d6N9bxBZLq+hR9w0vfdcAqKlx2aC+28wSGG4dE1JNAaJGpz4+5n1v5KK/87Q9p1A0e6wIdqjlFJfwA7fqFbM2EHGylvK6Rglwo05wAlwCyBNUqRhcAavWTuQLaSkc6ez52paSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZhk0xYM64wZzmigRfc6+fqsodbghheVW7QvCupgAHE=;
 b=K/DwKuz0Xc8T67WpVeT6kj5YiyTYsIljusOx8zuQoMGT7FT+17xVLUKtE/gF0HNq2lgjAFXGekllI2oK6GfO1/mLzNZkaCzifQwngmXRX5/hBz+ruTj4Z6vJ+/K4nloFYif7/Y/78LEiA26HYEtlwiytlhjjGmaQXJUXxvYzautcLxuxTb9TJngW+OiA5j2Mi9MzdouaF7GkOI+Pt1mGuxDRZEHskOAAIc1HYP/0nerOLkojWDdLO/bNS16fcc9Vvmkr60VxceJr8N3WvNH4fcOfb2B+0kx26zq586bZLnhNQBXhW6N8+bPKvHbX+bSIBj7M2uoV9jgwyjb5gxj83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZhk0xYM64wZzmigRfc6+fqsodbghheVW7QvCupgAHE=;
 b=Sl0YDSfK+dgpcIEoC1pc38R8iJBhrmTDM9Uex/sVlix93XCgnB1Ucypi1eM0u/gQw8VwkK8bPqPMlXDsxvbFNdVU/YdWQcJzA5lxmYwktbLIr3IhgtY3tUQaxb55n9M9IH3m5HDSuUberZadqWrRohP+q8DmYMGj6DzpzDn2Uf4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AM0PR04MB6818.eurprd04.prod.outlook.com (2603:10a6:208:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:30:50 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 10:30:48 +0000
Message-ID: <b7a242af-cde4-43e8-a835-0143f925d519@cherry.de>
Date: Wed, 18 Nov 2026 11:30:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
To: Krzysztof Kozlowski <krzk@kernel.org>, Jason Yang <jason98166@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
 <20261118-dcphy-rx-v1-v7-2-8de1adac3a74@gmail.com>
 <3a9e999f-5ff5-422c-aa65-b8560dca84bc@kernel.org>
 <fe324e43-50c4-4f0e-9bb0-57ea7172530b@cherry.de>
 <fceee6fa-2bfb-4676-b5ac-80e1bae8d4f4@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <fceee6fa-2bfb-4676-b5ac-80e1bae8d4f4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIUP296CA0166.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35d::10) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AM0PR04MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0dce5c-369b-49a2-74cc-08df455f0270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|10070799003|376014|366016|23010399003|921020|56012099006|261022105027099003|261022113327099003|261021121427099003|4143699003|5023799004|11063799006|10067099003|261026140227099003|261026121527099003|261026130827099003|261022075727099003|261021133027099003|261026135527099003|261021135927099003|261021130227099003|261028144727099003|261022115727099003|261102123227099003|261021123027099003|261009223027099003|18002099003|6133799003|22082099003|4133799003;
X-Microsoft-Antispam-Message-Info:
	qw2pTTLEm3MzXBEFbMjOlX06YpO/bTB7mNHjVlfr2a1dwvfAOZ6puCDAhfrIJcyPR6SjAj5G8jAdbe1gcuRLWGQ449+A7XMZRFasuwnUB7llmeGgdWcv49WHsVxszCbXh8HYNnPTaMl4KlM0nlULsKSMkR0qqsSh1x4yDbvYIDPkikuyI2C/PYT5bSy07ZMkozi1vS04IXMWUCL+YC6JTOGuBQlDRSmRU+i9PrxRTwl0zXMQLxVHs/B490WP2eyfrV68T5cfQ8fdfOO3cmZaKI0NyqtVS1Tzwxf1ZJvm82jt0lUDNz+nEAnPMohpNbqdyQts+Q/gNUnaHUcCN8+qmVqpmu98Kf1eAgSGnhw/nUgA+vTjHyyj20S7ywJwRidsH9aCZVx0jLd3WsHqUuMezCnVNY+RpxIeXdnKQpe0Qw0+g24+ZMT6L7SCjMBxXZiUGhDpw0hCbhW/shXvqbigt787E5XWBiCiugUHplc41H1yFKUCmyPqwqvEWyKTsYgvfDUnZSM7QvpqxBHdHiaRaMmZkakHJeNFXayIjrDQTKsj2rzSbIbgOvmb9PUqoU8x0zPzHppt+H0M603ecPDZsCmwCwdFcI7nqPUq950YzUkSTrHyPXG3MAxuzShI1X9j1jQXo7eOQOa4KXOz03uzykmpQCnqllD6QXF9rQyUPfs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(10070799003)(376014)(366016)(23010399003)(921020)(56012099006)(261022105027099003)(261022113327099003)(261021121427099003)(4143699003)(5023799004)(11063799006)(10067099003)(261026140227099003)(261026121527099003)(261026130827099003)(261022075727099003)(261021133027099003)(261026135527099003)(261021135927099003)(261021130227099003)(261028144727099003)(261022115727099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(6133799003)(22082099003)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tjl1bjhHQzhYaDNvZStZME1IS0doRytYN2JtbUF3aDJ1WEFKQ1lqVmRxakMx?=
 =?utf-8?B?R2tHREtpaGFLVzcrVWZFTnQ0SzBBYkpFVldBcWlJL01aUWl3RjI0L3QrOW9a?=
 =?utf-8?B?NTdtZklBTERlcjZHUFBpZ2lGRERQV2pPVlVSbENtcVJrZDZhU3hUNUZCQzJn?=
 =?utf-8?B?UDg5bnBxckhJYnRGdk1FQW5xZGpKTDR3QWVzY0F6ajU3RlpkTGVvWUxzUWp5?=
 =?utf-8?B?WnlFSHIrODdhbitxV1pWeU1DNi9LTWRLYnBUYmlXYkw3MlhldEZjTlJDSWFX?=
 =?utf-8?B?WFFKRzZ6RnU1Z3JrK2lGNU9UYWgwY2ZLRkRnRzI3NXRIbmN2WitNVWVOa1B6?=
 =?utf-8?B?V1dRR0k1bk56UldsamZjZVMvYXdRVGZmRkVvcWViYVBMbmF3U05WRW82Mnhu?=
 =?utf-8?B?SEZtYkVWdnpCaFVlZlhaeEZ2SGRBRmEvMVdSMWNVS1B5eTEzSGo0bE04Q2ZO?=
 =?utf-8?B?K0lrNEE3QWN0L0xuR2lzL3RDY21uS0JrNXh6SjZZbnNHNkM1VGd0T3pPOGgy?=
 =?utf-8?B?VjlSeFAwSEhDbU5DOGVsTHA4NCtIckM3b2ZiNGFkU3lmQUgvMHFaSmpZc3Ny?=
 =?utf-8?B?TlA4dmdOc0FGU0lGU0R2WVRnSE1BODBxMzVtbjZKSXVHU0pMZjBZUG5rbVFC?=
 =?utf-8?B?MFE1QWpCSzl3MGdjaU5aVFZYam0yNW90M3FXZmtJOFdLUWdMUGYxL3dYeVk4?=
 =?utf-8?B?NGY2dlRRZ0JvWnVsTzkyVHRaaHdZNzFiS2VwRVRINkdwVE9BWXZhZ0lYTWcx?=
 =?utf-8?B?TDN3bnlabjNKVG9XdlUvQTJYZXJ2Rlg4Zm04WGdXZEJyUzJzWEdtdVNuS0ZG?=
 =?utf-8?B?RXlySjY2Q3FsZlptQWUrODMyS0xvTXZURXE5RElqRy9pRTk4clRTRUMwWGxm?=
 =?utf-8?B?UldEcTQ0b1M3MXQzOHIrUzFYRnN2TVRibzIzT291R05TMXdWbHZoV3oyNEtM?=
 =?utf-8?B?OGdTZkhHdG44ekRTN3JnSjJDS3dQT3JWbWI5bFhJWFFxUGxnNVF5ZnpzMTRv?=
 =?utf-8?B?RlFyYlVFSW5xYklZZU8vbEo0ZHdWVWFqMGJ2OGYwS3p0SVE4eHJKMDM3eWxW?=
 =?utf-8?B?UGJpb1VnOXdOaUFYREFHOHFCdEZkb0R4TW1yYmFnRW1SSUlSNmFRN3VnNkpN?=
 =?utf-8?B?cytpOC90bEpqVjZRSElsa0dvd3FpNlRncldSK2p1Q2YyaGVTeW12Y1lYYXBx?=
 =?utf-8?B?TFZyd01LR3J0U0x2NjYvU1UxWW80NmZDVk13MjNoMk0rN04xN0s2ZkhJSjZK?=
 =?utf-8?B?alVQNURqRm5SZ1NDRStMNm1NcTA5OVVYMGlBYXhYQUFEYnQ4OVRRSFErc011?=
 =?utf-8?B?b3NMVngzcVhaR2IzL2NobitrMDdXRkRMU3RxcUVRakR6aWg2bkFQZ3RWYWRj?=
 =?utf-8?B?Rit6ODZReE9odFRiTFd4amhMMXFsZlZlZkFRdDV2TGxNMDI0QTRmZkdGamRo?=
 =?utf-8?B?R3hNYTNLMFNDcm10bDc0amlXb251U3krc0xRSXAxNUVkOW5hWkQ1eGRtb2xQ?=
 =?utf-8?B?Z0ErbFlGcXZvbGlwK2g0MEFvTDY3WW1EanpvY3ZQcUx6M1lNcDRXRHU3bXhE?=
 =?utf-8?B?azRWNEExSnMyOEFqK0s1anViZXlnOUZqRkd3WHYrL2ZSdUR2MUdvSXZab0Zu?=
 =?utf-8?B?NUs5bmZTbVRVbnFvSnBhZjBzdU5oa0NjRTY5NHpZNWh4SWN1SU9RMURyeDRr?=
 =?utf-8?B?QVdWUjI3U1U3OWRhcWdoQjF0TUhKUHZyeElIbnBTWHlVMlIyeGQ3aFZQYzZI?=
 =?utf-8?B?UFB5WlQ0Vy9vZ1AvcUZKaXI3a09hZWQ4MDZZaE9RM1Q0MEFxbVB4d3dpQkdH?=
 =?utf-8?B?WkJLZ3AyM0xHT0dSRmJlbVcyVGZKbnhyTzVvczloYmU4V3RIOTBYL2R2TVJy?=
 =?utf-8?B?UE1EcUphVVlLTzJTbFo4Z2JCVGVmUkp6K2dEZ01hOG45aHYrc2hMRGp6UEJr?=
 =?utf-8?B?dFNwWTFGdTVHUTRhZGlHcXl4OU53S05uK2tWT21CVGJxTENvalFwRTZ3UFdr?=
 =?utf-8?B?WjREaDcxeklEWjMzMUVLMGJaT0M1Uk5yaEp0cDZaRFhNQ0E2Y25TTnlIYkVz?=
 =?utf-8?B?bndnNStpM2xLSlp4c2tGQUdtUTU4czFTNGxwUTdZS2o3SENLYlA4bUNlVDRW?=
 =?utf-8?B?YytYWEk0dW5FckZDNExDWmJhMHkwTklSa1N3aWxWbkgyeGEwWmJyYkNjRkZC?=
 =?utf-8?B?M25KNzdYcWNSUzJPTmxVZ0NwNmQwMkRRdTJTK3ZhYnlOMUYvL0p6U1FZMkhj?=
 =?utf-8?B?NkFyU3h6VE8rNm9mdUlQK1BZRi9zMXRqeDNzTkJ1QTIxK1Qyblh3QTR6TXc0?=
 =?utf-8?B?bGpSdDZlN1lpWml0Mk1hZ1U1bklQSmdNdDh2dmcrMmE2RS8vSDNDdHFoNVI4?=
 =?utf-8?Q?CKPfTNfrydfL+Brb1+qCXCHJMFkIOlnztsKKnouYFDwxB?=
X-MS-Exchange-AntiSpam-MessageData-1: E38viJ9NaQpyTSHVTj29qOwS7BD/f/otp8M=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0dce5c-369b-49a2-74cc-08df455f0270
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:30:47.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5WCF3+xEsmFdF9JOMxGBBm7AnxDPtCMuCeJRZp1QzfAcugzvn0nZErznnYE+gSkr1BKqikdbIGELbn6gwgeZvx89bYZYQfVw3ueztXR35E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6818



On 11/18/26 11:08 AM, Krzysztof Kozlowski wrote:
> On 18/11/2026 10:28, Quentin Schulz wrote:
>> Hi Krzysztof,
>>
>> On 11/18/26 9:16 AM, Krzysztof Kozlowski wrote:
>>> On 18/11/2026 06:55, Jason Yang wrote:
>>>> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
>>>> for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
>>>> can use the transmitter and the receiver at the same time. The single
>>>> cell of this binding selects the mode and refers to the transmitter, so
>>>> the receiver cannot be described.
>>>>
>>>> Change the cell to select the transmitter or the receiver. The
>>>> transmitter and the receiver cannot operate in different modes [1], so
>>>> the optional phy-type property of the PHY node sets the mode for the
>>>> whole block, D-PHY by default:
>>>>
>>>> 	/* the MIPI DSI host, driving the transmitter */
>>>> 	phys = <&mipidcphy0 PHY_DIRECTION_TX>;
>>>>
>>>> 	/* the MIPI CSI-2 host, driving the receiver */
>>>> 	phys = <&mipidcphy0 PHY_DIRECTION_RX>;
>>>>
>>>> For C-PHY the consumers stay the same and the PHY node gets:
>>>>
>>>> 	phy-type = <PHY_TYPE_CPHY>;
>>>>
>>>> Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
>>>> valid as deprecated values. They select the transmitter and imply
>>>> phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
>>>> changes for them.
>>>>
>>>> New DTs on an older kernel: an ABI break. The older kernel ignores
>>>> phy-type and takes any cell value as the mode of the block. A DSI node
>>>> with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
>>>> PHY_DIRECTION_RX gets no camera.
>>>>
>>>> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>>>>       operate in the same PHY mode."
>>>>
>>>> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
>>>> Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
>>>> Signed-off-by: Jason Yang <jason98166@gmail.com>
>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
>>>> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
>>>
>>> Please drop the tag, this did not happen. In the future, please add only
>>> applicable tags. Otherwise share how this code was executed and tested
>>> on the actual hardware (make process, like building code, is obviously
>>> not testing).
>>>
>>
>> What did not happen? I tested the v6, on the reported hardware, on the
>> reported two DCPHYs, see
>> https://lore.kernel.org/all/840285d6-a8a6-4777-8d38-6758ccbc7723@cherry.de/
> 
> 
> I comment in a specific place in a specific patch. The testing of this
> patch did not happen, which I explained why.
> 
> 
>>
>> If you're complaining about the Tested-by being given to a dt-binding
>> patch, it was provided as an answer to the cover-letter, and the
> 
> I know. Tag was applied blindly and that I ask to correct.
> 
>> contributor is clearly using b4 considering the last few lines from the
>> cover letter (base-commit/change-id lines). b4 trailers -u applies the
>> tags given to the cover letter to all patches in the series, so if
>> there's someone to blame here, it's me for adding it as an answer to the
>> cover letter. So now the question is, do you want me to add a Tested-by:
>> to each individual patches of long series when I technically built and
> 
> The comment was not to you. I responded to the contributor and I expect
> the contributor to act, not you.
> 

Still, b4 exists to make contribution easier and it can always be 
improved, same for processes. If there's something I can do to make this 
process easier at low cost for me, such that maintainers and 
contributors alike don't have to go through unnecessary hoops and 
revisions, then I'd like to know if and how I can help.

>> tested only based on the last patch of the series, which is only a DTS
>> patch adding the nodes to the RK3588 DTSI? In that case, I cannot
>> provide Tested-by for patches before the last, as it can simply not work
>> at all until the last (actually all of them, except the bindings) patch
>> is applied.
>>
> 
Would the suggested "Tested-by trailer added to each relevant patch in a 
series instead of as a whole" be something you'd like to see happening?

Cheers,
Quentin
