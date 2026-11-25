Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634821;
	b=0VM8IT4l38UOwOa8JcCAl2sEKDNAC+XWvYCEJNlDXjO6OO/y5MfI8Hv/BIrQ4zW+o0yi
	 amWRBaWf0jq46kjw+kunbh/geSqcC7HWsS3Ywsmvc1bTrDnlcLL3aSs7w2FA86AszMpxJ
	 L7wSU5XmSpwEYaR94WIzMuolnp1CADxlk/IXnluQWMAObZeot5nN64aB2nks9GxzAkxv0
	 gqBUcTTCapR98XgA0r4utFacQ9zUxF8DEzJjOtNUIDzIMhre/orf63KHA64wafXCa4PKP
	 PaAyywpynRpdSlLVjZxQ5VtWSlI7JVkJoOJhL7V8itvH7eiGOi4G7386UH6eckXhPQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634821;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=W/aOIARZPzdbGp6KZPDgTmzTk/09FSEZpOYQRP9ZNs4=;
	b=mJ4I2IyHQrzwKgL4rPvyI5VhakmfCnodKOGFh7gDTBSo3QCi3T+hjGBSnmF1N3uvK5RQ
	 68pyoa4fxyObkTmAHeL5HyIbP9sBEAHs2iFzKvRDLAiLWYelnvvBxeiwoYCM/TMVEbxT9
	 aCvpNwrBAZ0cTjkTFBR72PDN/W6efp4JYwNyT0nLptiZi/wsYbXiJHEArla7GxOLo7+Sf
	 nHg/WUYFvJGVSObzJhXXOW6ng8ieL3AFnwLmGbLTAdif4jp5WTbwOHP/hkHjVmqXH93Xt
	 SfV9NJ0DIzC6w9K01BmfjymaG7f64vcs3oisXsEEEBemhFBicNhVp8U+c/++WRW2nnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=R0S42zNK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.21
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F54606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F54606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=R0S42zNK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP0Owjo0f2moYzR8NZbSVdgB6wO5bJ0iZc2aHR8b+pgFy7YB3C9mjqP3hi4HsNE3ukc/jp5M5A3mtOjTrYmIeQlSC30RRodTP6L1o0xuUzP3IxKeCn2565IhZQBCYasyXY0Zhow855/sYEhAm3p/vjdHvmRxs8fT+14jwFrFmRjlltbSf/O3suax/JwF2C6zeeXm1o78EmmGA16Tt74l1wU51OerMWOoIOiFnYDqc0EoUEAWyICW1eYVSncUggSTrSUqgRHqNO7uMoWQHi23Jrl2amG3ICNEUxjCcMs2jAowr427pVOTC56f3qDcQQT1iqQ6YQLVs2kh97HEwQVuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/aOIARZPzdbGp6KZPDgTmzTk/09FSEZpOYQRP9ZNs4=;
 b=WONRg4dBFnO8IKIZHDF2xGQecl//cjoP1/z5nxhM9LxfaOYG0OcJrb4N2mtZSFwOOhoo/yWQ1UJ6wV057NiXHnGbxThHqv+0xj/9LILEkUXiTA2d71+9KM7MHRL7CIKA0/p7LyyGZ1LlRlHdCFour/HircdNckocH6RLDrd+t3V3yKd7J7sFBY1v0QHNdLnxdPZBA6NhxaZiS7N9i2+iMTLqPGonqzln8+5cvPQrq47qm+wAAom25v5JLEF4MZvt+zAsTzyfpx6h2mRebh8t51R2lPlOZLg+KbTscsO21GsUY9AunViPA20eMMc7NrU0/FP7EFLfg5i90DNynSOcGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/aOIARZPzdbGp6KZPDgTmzTk/09FSEZpOYQRP9ZNs4=;
 b=R0S42zNK8g+0zu7LTC+0+wFbPuUshFk7gjNOGxyv5fx75sAo8UXGpZHzi2Ar37vqa+lo2ZnrbRz9pBTgp4RckxFy5YE4zQTy0B8rK10cCQKkr9n2UQBP4Vk55K3N+g4uMEoOEysp8FGk1/nKV3mlZroSCv+lCGvz9PDn405mQsJgLOuz2pqRIQs2acxMv/IKHrgbFqb5l8dbyBfinDXBbyjXiMkYNetE08aNN08SWV6odUUaVvC846m9hAgN84aXfmAS7oFCI18APvVQyocjS+RlhsjBSaXdFHUSjq6ipfI9jrlO4oPSyraEcX4oyQzqnuyPUWFz3kgHLouw5Z5BeQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:26:57 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:26:57 +0000
From: Frank.Li@oss.nxp.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Date: Wed, 25 Nov 2026 14:26:47 -0500
Message-ID: <179563479877.3280595.10601366292160952700.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120152146.1774885-1-dario.binacchi@amarulasolutions.com>
References: <20261120152146.1774885-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VE1PR04MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4bd44f-b7d1-4e96-6a88-08df4b2a122d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|7416014|376014|10067099003|11063799006|56012099006|261022075727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2JDtV9Lef/lvN/tKc0Cxl9zeZ1BW/iL/PVNl5BbNddEEZHygvNVpsFfP6kseMVE668LMlGVQB7IdLkcAscAbhEQrNAfSXhs2JPxHdIQW2TBS/seRkbZdXq8/USlk7QgcqXiYOCVcbiwGyHhS+0YT8/Mw/g6kC6RO5+vpoMl6jR7e3LzlHfx+krwhDFANF5LOdF0ZKD1wLO2jknRuk7wgzxRNzIXlloQOVpRhxoQyE85jMXjc0IAR5Sg81eghEHTk8MqzE7z9IgZWx+n/m0KjGNIHV2rv+Ortwss5Aw9tEhqftqBq+V3anV5vDm8HnpiHWVCsPHEieghZsyu+pmablDIpb3k8l55NGFW6+S4+Ey4gaie7IuWX5ns4BL1n++/H/OYrLjt1KO/jSbDI51gYGVL9W+923EHy2q+5jOfPnNHz/Ja67wl1Ukh3oMfYrScEQy2zFpGGAw87EYDPaPLEeF+Nw7KYclD4p0sCz8fczl/+5TwLwgFHd6fdQblJvM78OkmuDRQGKFRPiowSlENNBPb+QyNEZMWRoSDWPUVEZ7uvnEfpJ6Gji/VhJKprpbvrGu3ew8epWxbfkJypsP/Twl+dzS1t+pctd9kM1NgiZCZ3G41UnlOIboly9Ard19IjFyGxZ54Um0t4crT5PTDDwfFs7+G5k4QeN+mHGeUfQwA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(7416014)(376014)(10067099003)(11063799006)(56012099006)(261022075727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUtPQlhQYUhHNzQ0bVZxZTlIMVlaNGNvWmFmMmlwdTZER01lN3o2MWhSSi90?=
 =?utf-8?B?NytlRlhGbm9lbWU1Y1ZSYU13UC9uQi9jSkF4b04yWTZTdVd1c3hZd2tocFdI?=
 =?utf-8?B?YWNpd1RhN29CVUhMbnFyOE1mYzlZUEZEUFB6Y0QwWkh1cUl0VVZ5OFZtMFJI?=
 =?utf-8?B?Smp5dHBWTk11RU1BNmY3Q1lmOHlpRDZiVyt6MjI2N2tjNFc0bnEzVS8ySkZa?=
 =?utf-8?B?QWV6NGxzb0dEQkJLdS8zeGYvWUFIMkNDa01XL0dXWGRPOTUyaDE1MnpKemZP?=
 =?utf-8?B?WWZVQUEwWWdiN05rR21QdlZZT2J4V0pXZyszQ0VCdjJFZDBFZHAvd3NGbG5y?=
 =?utf-8?B?ekJJaEJxUGg5akxRUGl6QVloMXpGbVEraWl3b1NERHVwSTE2bXJTTC8xSHY5?=
 =?utf-8?B?NkppekFOTFlxK0UveGd0Tm5tS3FGVjNEbkNURkZwQ2MzYnhoZlpRTURhZFVt?=
 =?utf-8?B?TE9rTXZ4YWxmS3NWdytTeWdzOEZMelVtMXNSVjAwNWV3bzdDYTVlWmdqTmJC?=
 =?utf-8?B?SVBOTTI1aC84WFdlMktsOVk2a0V6M2JLemovZHB1OWpvRURwNFZMaEs0SEN5?=
 =?utf-8?B?Q0h1bnE2OHhsNzZBWGNvVElFQ1ZtanRKRm9ab3Z6S3h1UE9ZV0dkUkk3aG1F?=
 =?utf-8?B?WEU3aXRacDFWUDJUQWFUT3dnU1dHNmErazNBOHJwZ29XdmsvTzd0dHNCeFho?=
 =?utf-8?B?dWNibnJDM2RocHgxaDZ3ZkpBQmRmdnNUS0pFa0hXaGJyQVp4REpMRzc1dDFj?=
 =?utf-8?B?SjV1U3lQL3BydURIVWlMQldQQmFNbmJpZlUwaVdQcTREdGVEd3h2bFhRMjlz?=
 =?utf-8?B?ZnBYTTdrTEpMRUQ2d285VHZ6YXBoTXBBWFlWQjZXT0RSbWhJa1F1RC9qcGls?=
 =?utf-8?B?STNyMUtxM21ObnlCbWRjUHpocCtQRE1qOUdHVE5wQmdtOG5vcXcwdEEwa1Ew?=
 =?utf-8?B?WnZTbURkbDE3T29jeFdpQUV1T2lpVGlTR28wc0g5QlRBM3l6anYwYytFU0ZF?=
 =?utf-8?B?RmRpR3BFTXkzYU5iZTRzeTdoQlNpdUIwSGVrWkZHVHc5WmdLcm1FNmZvRlBO?=
 =?utf-8?B?NElHcG11N1gwaHVnNzQ3TzF4MGJYcmpLTkErdHdYOEJSWGh6Q2taVVYyWm5F?=
 =?utf-8?B?d09wdlQyS251TE9qaDFaMXdnbng0T01mbkhVK2RrRG9uUENFM1gzaTQzdkw0?=
 =?utf-8?B?bG9WTU82ZnlZWTduSURjcmkyUTVtV3VCZUhmUHRiWVpRR0Q4OWs2dkZLNmRJ?=
 =?utf-8?B?VWhwMExxbnZ6b1Z1MWRwcHVDcEJKcElzbTBCVkdkdFhVb1h3RkVZV0xFbzV2?=
 =?utf-8?B?M0JycFhiVjJJcDdZTTRGU0pTZDExSGpmYzcyK3ppRVMvODlYNVIyZWRTZVpX?=
 =?utf-8?B?VS94b0JZNnFPRi9xampjdEJleVJOdnQ5cXZyNjlHRGtDK01xKy90dXVWbElG?=
 =?utf-8?B?WTh6Z2hHYU1UOUhtdE9oWUNNTFVFNnRueGZoUFFZTmp6VE9Xa3VLTDY3M3hD?=
 =?utf-8?B?ZXV4NzJHQXJ2TGFSSTd4T3dnT0VxNlBJTDdBcHgwa016UVpqRi9mNE53d3ZF?=
 =?utf-8?B?cm5JdHM1ZDl1NjFCM0NZdzVOTk94cGpoY2tjaGoxcTQzVm5yZzYxZjBLREMw?=
 =?utf-8?B?eUZjQ3dYamVEUlRTM0E0VGcxeWxzWmxRSFJaUVFWN1kvK3JvMUhGd2ZUZlE1?=
 =?utf-8?B?VlFYZnBUZkxPWFAvdzlJUUcvV3JRWXR5ZUdOMWVNME1rbHRQMUMrZk5xQ2Iy?=
 =?utf-8?B?a2ZZbVVFWFJpQWE2Yy8zbWFXT3BUODdhYVBTei9DenRxUkw5bXZjdVZiTkFV?=
 =?utf-8?B?cVBraFlMVWZZV3VyRFlSM2pDZm50d3k3R2hNL2pZaXdCTGZxNkduaDdUNmhr?=
 =?utf-8?B?ZXJSaWVrRVFYQlVxS1ltRVUxbjVLS1BtRmdCWG13MElXQWdTL0hiaW14bWU2?=
 =?utf-8?B?S2V1MUFvdkRnN211ODIwd0srWWt0LytHWmpUVkdmcEV1cVBVMnRqeE05dGJC?=
 =?utf-8?B?UCtMc1pRcTVpUytrODNQS3FHc3VOc2NuOXRxdkM2WkJaK3ZQaTcvNU1jNkxK?=
 =?utf-8?B?ZDE2Y0hER3FjSTNMa0paVktIaEJROWwxMXVUbzJMRVJDT1J0aDZyUStPZE1a?=
 =?utf-8?B?WkxEeUVMOWw0ZUJqcUdZWXZrenlCUTM4SVNxTk9hOVNzQkprdGxpZDc2OHJ5?=
 =?utf-8?B?cGRmOFJzdGwvUy9wVUYrNnViQlpxK3kzQWY0T0N5S3B0NUx2MWJ1Q2EvMmxJ?=
 =?utf-8?B?U2pnTERXWFhPdmVmTFU5R1lEeFRwZEdDMnFtdEhGSlNKNmpFY0hiYWpyM1Ev?=
 =?utf-8?B?Y1l4M290NmNEbmJsTFBGcExndk5WalFsZlhmTUxhSmxhZ0hyMzdWTEdQWXQy?=
 =?utf-8?Q?FEq8dwJHkzNCX+bfR0O0cZmzJtVOp4yk0IyDf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4bd44f-b7d1-4e96-6a88-08df4b2a122d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:26:57.6316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4aQ1zN+Gj9zEifqW/oST1Z3iRz2dJuHC4gGSzJpBLUErp62QOr67wkmhE4hcp7S62+IqLG5gOrzFy1HGbbUNjHOHObyQp9BNw4fAmJBygyMw8MvvfGw1iP1H0Gk45Lt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390

From: Frank Li <Frank.Li@nxp.com>


On Fri, 20 Nov 2026 16:21:36 +0100, Dario Binacchi wrote:
> Add boot phase properties to the resources needed during the boot
> process.
> 
> The BSH SMM M2 needs UART and NAND access.

Applied, thanks!

[1/1] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
      commit: 23ee270cda346946a155ec0cd6874781e9aa379b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
