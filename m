Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794994106;
	b=IiTk91Rm5q9Yvj0BlJj0hLxD5mbwVqueFb78ilOZYjjjnC4TOTNvHnA+nULyxxjbmrYF
	 /3Ceu6L30h9rDx1beXdk01OPPtQ06oBWHdq0tBaZbCZxFB9DWAMjVa08qMkBC0+tFcZMp
	 l/Doh/huPuF0i7qqe5CfPCIX8J0age0wzrrprlf5CmMM4Q2VTmjOYlqtFGxS5X7ucOKhl
	 BmhasrunAQbFrmdElwJqNu9pbsIy8MIjfzzgWfpKyJ4o7PW06UqEy2RzqNGLxkB7bZ0bv
	 9zTwBxhFmTvi+T5n93iQkYWHVlo79b8vriczapH+tR2T4pWYXmA/IiAGtCoDPkq3GhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994106;
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
	bh=3j4jqu6qpwCjOYNgzyNa7FKYtVY3lzEeW4eukRCRCbY=;
	b=PPd09DgFuozrbd+0F0fkwa1K2Gj3/qm4NmBxxQxEYiOF/K7vPqF4s6YfaJfVPDxyjNAU
	 BUwNXYZe84AV2sEaG3HBXWlUPvmqN2qrUkQgbQNzJPVXnuYR0/NNCVgGgI4f7GQtMpDtn
	 vUxfBruq5njfK1KWZZfhasKZY8y452dY390AC8xVPB9v0egRlvO6OovMp5QkisdWDXK9j
	 x1/rj1/vRHGwht7WHlLDXht/ZPEiuuDLfFOxJsS9ipZ9PylZMHauaTPHdjLzZm/EF95UM
	 3LJQ/5PdmcL82UJFfysQHX7iiYoTQHmmhtu1es9gTFKvzX0dBUoJweJsjYyubdvA8xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=kIy8hHF9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.21
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C46606A31C;
	Wed, 18 Nov 2026 09:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C46606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=kIy8hHF9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIhfUyvpMj+jaGVKI0pNQODv/zBq8AoULZOpnU6BLZacNPNls5sA2JT2DjxP8GzBE8Zgcp+MJaBrtxBHfo6nCj6zO00FuPUpQIsSjyTxmi0sLJEB8FPyfMXO4s82bilLO86/jtalRKqdMyXsMY+CeAhPpUkbknOt34DY52E98F6BsaKZEAW4PrE53WUSMJMa9csB2mauh38JdoIokKZhnzZZZven8unfSs1R3FX02gwc+gnfiu27yKntJTDuoctGcotZVjvqVOMKr5imG9slnbwYJHur1I5212i732efI91QbekoVLICrv82kYhD5sx3fEDQ2vdkSS7k+mGJQjdV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3j4jqu6qpwCjOYNgzyNa7FKYtVY3lzEeW4eukRCRCbY=;
 b=ONqtjsCZt8wpezu/4GqlV5lDO4QKR95XN5O8fLk25pTc1oFHTxRhoo+dsDwp4c4OWt4H9haEP9m4Thaqll1EfPBvXaOHkPZHy4HG7uHWQwsd98fgBPy+RkE/J3b4b7x4RRAMAr9imcgyDLI4+m8KErf3mWuRKl4wkpu/P95mS9y14DgeVhdIb6tj3GL1oLFV+h54eaBXb4sPpR4ePW4f+RjGuLdIi3I88Ebvyr8wy3SGVETtEqbrSVV9eA6QHtv3+wTyai32EKj+48FOoIZdJhwMvJgL39KvmZWRam6fZjhRmvGQk3uW8ldkixPvwSYMbgWfQCcPW9jJtfaxWMVZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3j4jqu6qpwCjOYNgzyNa7FKYtVY3lzEeW4eukRCRCbY=;
 b=kIy8hHF934o5Vnadtu9j1yKrY/ZaSYqjo1pAHB2276KN/S4VVgTjpeK4kAjV9dp7oKftqYhVQfTO7xVAGr+yUZjOALJsPBjj3oYjk64iBQl9sZa1jk95X/LMkAU7H1e4x8Fkgnxu8wimaia4BnQCUbWY2H4ir7/bKF9WoNCuHNo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by GV1PR04MB10775.eurprd04.prod.outlook.com (2603:10a6:150:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 09:28:15 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 09:28:15 +0000
Message-ID: <fe324e43-50c4-4f0e-9bb0-57ea7172530b@cherry.de>
Date: Wed, 18 Nov 2026 10:28:13 +0100
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
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3a9e999f-5ff5-422c-aa65-b8560dca84bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI4PEPF000001D0.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::852) To PA3PR04MB11153.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|GV1PR04MB10775:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ca8c8a-23d3-4be5-0455-08df455645de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|10070799003|23010399003|6133799003|22082099003|18002099003|261009223027099003|4133799003|261022113327099003|261021135927099003|261022075727099003|261022105027099003|261022115727099003|261021123027099003|261021121427099003|921020|261026121527099003|261026130827099003|261026140227099003|261026135527099003|261102123227099003|261028144727099003|5023799004|56012099006|11063799006|261021130227099003|261021133027099003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	dtCxoK5+m0lLkMz4DJJYBetXeorWedS4YVagSWYvuYjY1fheaXbAc6sl94EiWcghqESLtRrEw6adUqQanRCINcEC6wU43jqapMfxZeZzK+hyHv7gE682GNYbowc2w5DSa+F62UGQTzF1Hz/hVlBud0zVoemrHpQehp9MkLmwftEzEw/Pj7QU9Zv2p5TRSIMuApL74/Incx9umwyrHIwxknqsclFjtX7pSlbDKprIcsuIqhrHcofOLearfaX7k1gAKB5CxyRhItFk0wDjA8uxQMARYGUrBGhunbk5UPcvfvhGEVdgt5YRVErlFF3ehzWxcy46r+hQY3UjyFYNTT+FpFhuah0FiOXJhShT4/+s00sHdjGUYGi3z6kS0/UUfaefAzSKhPluNKzJ4NOd7rVkw87YphplTJXNeyNClT0vej4pv5gMQ4+7OXO/J7TXJvqGZt0PvxhvlRrfXp8UA5hTW/Sg4eGcXNHJ/FCq/v1kbBhaqL1RdIokB+nzP0kTOFyQxRi1E3Vs87il4NDmebV6ATyhVUNm3fnO56PuqCcrHYiWFoLmqTC6FF0bmJE8o8MRw7WttBeFcEEh81i6AWxHcz+UkvUBSQGdXJjZgRDFLYD7Ek1IVZWaBHBf5bFHlDATh0UNgdvgOsVYli3QwRYNCLWJItZUPEzQpL649QOvASw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(4133799003)(261022113327099003)(261021135927099003)(261022075727099003)(261022105027099003)(261022115727099003)(261021123027099003)(261021121427099003)(921020)(261026121527099003)(261026130827099003)(261026140227099003)(261026135527099003)(261102123227099003)(261028144727099003)(5023799004)(56012099006)(11063799006)(261021130227099003)(261021133027099003)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE1ucGxDdS8xZzdwYlRVMUF0RVFpOGtQQUVtYThTQ2p0ZkVMa0tJZ1ZBeUg1?=
 =?utf-8?B?ek93ZHdxWENTbllnc2xSM1o1UFBpbW5vVzd4RnlhKzF1dTd0VUE0cFZNOWM4?=
 =?utf-8?B?a1RuRFJnWHNaS292dE9vRjIrVy92L24velh4N3JveUJWbllXekRkc3dyUHN4?=
 =?utf-8?B?K2xjV2pkYThSZ0NuWU9oQnQvLzVmQzNLZTlyRG1kd1p0dHhLZ09LUTZPcFlU?=
 =?utf-8?B?RHNtNURuN2xUdUhxZHBIbndxSHBmQTRQbk92RzRmL0ptSEJ5dXBhMmVBVnky?=
 =?utf-8?B?YlFrVFlXTVNObW1QdHNNVDRvT1Y1NXIyTjBJMHM0WGhTT1FRQUlxejdaZkFX?=
 =?utf-8?B?RzFISmMwLzJwMFZ3MDF6L3k3Z1lKcTBWK2RaNlFsYVVXSEdKSW5Yd1FTbDFm?=
 =?utf-8?B?MndzV3lUSERtMFhuWEVpOGdBK0pnYnptZ0tPM3UyRHg1ZitKSDJ3bmVUYWpU?=
 =?utf-8?B?VjdqR3N0WDRUdzB0L1JaVHRyUHRmdEQ4UDlGbnVWakFhWWNoVE1pbWhwSzVh?=
 =?utf-8?B?UVNsMExqYko0ZUlOQVVQN3NRdWwvQ00yTDhGZDdwTCtsUDVNNENFS2lVTmlk?=
 =?utf-8?B?dEQ4RUNLbGxHbTRFSE9PM0x1R3p5VzdXSHAxdkE3SnM2UUpZek8xZE9ENW02?=
 =?utf-8?B?c0VhczE2UUl5MUVYMlBjM1FRaFh5RlRvc0lKbk5QdExGbVMrN2J4YmxnTTly?=
 =?utf-8?B?QXdLdFBsaGt6aFVqYUxJZlZlcGZZK0gwRDRTR0J4MHRFSGZYYlJXWmo0NDFE?=
 =?utf-8?B?enpOWEI2Q0hxK0cyS1A1U040NDMxTDFkeG11Z3J5TFI3a3l3S1ZXb2hndkts?=
 =?utf-8?B?UkF5Q0lvYzRad0NqNWQ0c1ZSSFd0VGxzSHdmeFlqOU9RWTdYcU5HczU4bGl2?=
 =?utf-8?B?OVl5bmZYMlExMGVMMnI3QmtmUEpvVkNLNTNCTk5jNjJ1dU1JWTZWaFpSMnJP?=
 =?utf-8?B?a0VkdEczRU9xcW9WTW10aDVHK05BcXIvaHJJUTVWZktpK0pJQ29oV3gwSGNP?=
 =?utf-8?B?MFpVZkFqR1l1RDJiZG5SVjJ0blhESVQwR2JwOExLL2g3VUlLZ2F4TnVPY3Vj?=
 =?utf-8?B?MmowMWlVeDJ6cHlaK1JMQTdYeW1pS1dwL3kyNGhwRXJlWTVoQzcrZXFyTm9S?=
 =?utf-8?B?ZXRSTmFqUGtXUlVnTzBTUVBQUnBLQ2QyWHRpVU8yQUtQY0xVUWs0MVI3aVh4?=
 =?utf-8?B?ZENqQUlhSEtjdk1hR2ZWYmpuQ1Bqd3hYWVJtc2ErZnNCNUxMNFkyNzdNQ1FZ?=
 =?utf-8?B?ZEF6SjFWc3NtT0Jqa1M5T0RUbDFSYnpJSWhIeUFvUDgwSVZINlVlNjMzcVQr?=
 =?utf-8?B?NkpSSVNRazY5c3REbGJWK1J0OTFnUHBOYXRWamU4TFNSUm9OZThudVdpSC8v?=
 =?utf-8?B?YTNZb0Z1QjZtY3JxZmVnYXVmUXFlL2RGV2pROHhpOERiazg4TUc1NTAxVUtL?=
 =?utf-8?B?RnNXK1pqTXNtdmZtUXgvK3JFc3dpTEVPZEtvelllamNHUER3ZXNVeVViSmk0?=
 =?utf-8?B?aG9DbDhsRnU3Y2pKaUVuQStJdnc4MFY1SlBHQXFPKzdnNmdiMzAwSmI3NExs?=
 =?utf-8?B?Ni9zcUxhTzMyVktZQWlmS0NVVGZCZjdxZ2RtNGV4R2lCK1NSMG4zZlBMdkZR?=
 =?utf-8?B?VnZzT3hKTVRqajV6cXRJOEZsWVFQRU9NUXR5c1BPb2JHRzVQQTZlc0s3c1Jn?=
 =?utf-8?B?Sm5LZS90djZxVnJUaENKMVliTHg5bDczOFM1OTNtNWpGa0RwSUdmbTJVY09J?=
 =?utf-8?B?Tmxza2x6dnF0NWYvK25rdE1DUWl1aFlKZTJ2bVNaTHhiVFBCUVB2aFRTbk9I?=
 =?utf-8?B?aXFEUS9DZkQ0SlFmVTNIV0FqOTMwV1JuRHFVb0VJNC9xTnRDQUhqUjVNNDNW?=
 =?utf-8?B?OUliQVU4dy9SSEpNMlRJQVRhekpyTUZwdnJhUXlPdUx6RjhNMnRUdm1ZbVpK?=
 =?utf-8?B?ZVc5SHh4OTV4bnFCVU16dUJYVFNzejNTNlp3RjFnTnBsZ21DMXJpaS82RXl6?=
 =?utf-8?B?cmtyM0dORU5GdlFtMlo5WjMyL0IxU0h6b2lmc051cG9sUkJVbmVRVldyWEov?=
 =?utf-8?B?MWlNR0doY0VpOXJoeEZsdklXRjFlS21SWlVuc0xONFVCbm83QjlXSDVvMTJa?=
 =?utf-8?B?bHd4ODI2TkVFK21VZU9SaVRQUFVNV3hIOGR3NXFZekYzOUFCT3RmRWhPdHRS?=
 =?utf-8?B?QXhMRnBMU1JFRU13bWl0UDVaVjl5YWs4ZjIzVERUOTZET1RkNXJqUHZmeFNh?=
 =?utf-8?B?T2dXaXhJblZkYmo5UTJJNXFiUVIvaVU3dTFEVDlpVlI2SzVzMmN5dEtGRHJr?=
 =?utf-8?B?RmlhNUo1bi8yTUlGRkZxVHYydjM3OW90c3R4aG1FMHdoUWJEbDhXNWQ4WXV2?=
 =?utf-8?Q?MkAsQoh8JemvQ5qRR8eByr/TMgTVi16gl0GYZRp0e2seb?=
X-MS-Exchange-AntiSpam-MessageData-1: 3zou1bon8g+sjcpJA4wUsCzhbUf/Qyg2xEc=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ca8c8a-23d3-4be5-0455-08df455645de
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:28:15.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMKPwrx4QXfoFtvyReibaq7mCZtvLOw+/yPy5DV69KldQKMLiSHc9sQKI/q+5dkMoKDEE4ULxXtqHkc4r6TujeX4BhrmwVBCNI107hW0piU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10775

Hi Krzysztof,

On 11/18/26 9:16 AM, Krzysztof Kozlowski wrote:
> On 18/11/2026 06:55, Jason Yang wrote:
>> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
>> for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
>> can use the transmitter and the receiver at the same time. The single
>> cell of this binding selects the mode and refers to the transmitter, so
>> the receiver cannot be described.
>>
>> Change the cell to select the transmitter or the receiver. The
>> transmitter and the receiver cannot operate in different modes [1], so
>> the optional phy-type property of the PHY node sets the mode for the
>> whole block, D-PHY by default:
>>
>> 	/* the MIPI DSI host, driving the transmitter */
>> 	phys = <&mipidcphy0 PHY_DIRECTION_TX>;
>>
>> 	/* the MIPI CSI-2 host, driving the receiver */
>> 	phys = <&mipidcphy0 PHY_DIRECTION_RX>;
>>
>> For C-PHY the consumers stay the same and the PHY node gets:
>>
>> 	phy-type = <PHY_TYPE_CPHY>;
>>
>> Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
>> valid as deprecated values. They select the transmitter and imply
>> phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
>> changes for them.
>>
>> New DTs on an older kernel: an ABI break. The older kernel ignores
>> phy-type and takes any cell value as the mode of the block. A DSI node
>> with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
>> PHY_DIRECTION_RX gets no camera.
>>
>> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>>      operate in the same PHY mode."
>>
>> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
>> Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
>> Signed-off-by: Jason Yang <jason98166@gmail.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
>> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
> 
> Please drop the tag, this did not happen. In the future, please add only
> applicable tags. Otherwise share how this code was executed and tested
> on the actual hardware (make process, like building code, is obviously
> not testing).
> 

What did not happen? I tested the v6, on the reported hardware, on the 
reported two DCPHYs, see 
https://lore.kernel.org/all/840285d6-a8a6-4777-8d38-6758ccbc7723@cherry.de/

If you're complaining about the Tested-by being given to a dt-binding 
patch, it was provided as an answer to the cover-letter, and the 
contributor is clearly using b4 considering the last few lines from the 
cover letter (base-commit/change-id lines). b4 trailers -u applies the 
tags given to the cover letter to all patches in the series, so if 
there's someone to blame here, it's me for adding it as an answer to the 
cover letter. So now the question is, do you want me to add a Tested-by: 
to each individual patches of long series when I technically built and 
tested only based on the last patch of the series, which is only a DTS 
patch adding the nodes to the RK3588 DTSI? In that case, I cannot 
provide Tested-by for patches before the last, as it can simply not work 
at all until the last (actually all of them, except the bindings) patch 
is applied.

Cheers,
Quentin
