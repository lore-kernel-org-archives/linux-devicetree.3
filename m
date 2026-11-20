Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172721;
	b=gwnyPDOOIaYCk2HrTwRGh7zgkrPohZmU7LicYR8BULjVk50f1lf8pRxQS/kz9Q5jx9xy
	 MpWSi9+4QImPVWyaMQ9XTiq+XXatEsC4bpA6RQspLxC0DGDV8b46M/+BIdWqDCZExZKNt
	 H8V5gx95vAWYGk+CSxldH7V5UzmhFM4ODaNCCcuA1SvoqTj3rjLHwiRnQ0B6MVatAUm+r
	 B5ef7/mLx8gr/fHZ4qKoc3gG3ShVLJ7372K0XlBBKOLwHCpHV2aZAe4SEjhnA0QZ1s2ll
	 ZMnX32rMxpdepibP/40gqDURxrpqq/QMcJiQBxwSGchxLceGl9oJA7jo2jzBUg3uZhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172721;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=+y2ZOPVxTVyq8Z+lWbiWXkvKB09vBHKzcQrBQa0bf08=;
	b=M0tVHv5GM1LVwULZCI3TaxxjlE3ntE5pscWnJesItNawxYLf/Ao8AHoNJuSGCCexoDVn
	 JVWVIebiXq/BNs+zwzc+AMjfxG2IJ7zmJ2vjiaHDmMByYI0ELMXJfb8U9ekuXJ3mTgshr
	 oE96RIL/pggcCdKasiUM4BD0vn7o6tfKDMFYAmpCf2Wwd6YSHT8kJN8UF0p9n6c+Prq4W
	 /XINeO+S7SoGx0Na54vuGvXiEgDKnUMqFSkDBV2DooA042gPPKU/p08dVpE3Fv+ioygSV
	 KK5PD7fCcnE81kSsbwRTILAPfN7udUb65S6CGiqX9EIhb90Ro4XXdz9zrMOQtOQYnEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VTU9C9Cp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.7
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013007.outbound.protection.outlook.com [52.101.72.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E60606A320;
	Fri, 20 Nov 2026 11:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E60606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VTU9C9Cp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUBwWeipoPSpHHovoAO29iU0uhG5lAtez75cfxGQAmHHnbuIfGFwNMA6dPkxEZ23cInMJtf7/U5r8t6++U1ORfMAADo2vY+HXhEkP5Q7CyspHzu07lr34oma6kylxq7Qlcao7AXtTPz/4GPmiRZSk/ChUxnbKRfZc5sRt9Prp0ZdYrMtH7zO8wDPeB+0SWzVzT9oZflcieDUXZXH87lfzP/RWUlKzQcMLIPv3zvPDEq4+f4I6acp7G2GIzZ5gyGXh+ZhV/L1/tQOWi4/il7ptL2aQDpi4F6EVO+fsL8YM2ThX6oqQdZuDcn9NADOlvNfwNZbA4r7z22m1puua1B0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+y2ZOPVxTVyq8Z+lWbiWXkvKB09vBHKzcQrBQa0bf08=;
 b=Ckh4O/3QYSKTWqqwJQQS/cwzwvbCET43vUUCODcNgg6dVfF+RxHXfZ8oObdvT0NNf6v7eTCpGFprfsFopkAUeNpE41a4g4n2G/fK5RUb02EeBwn9HvGOfpY1rlbFN3bNL/JQKi6R6ttkerjaLht++cgnF210PR28Nxmks2dVzS/12RbBi3A3vQtC5u75/0Yfub65e6piPjnoGPAN2/TWxcRQbkfpdMTJSYX4ndXGtG4qJRDR36JAvMJfuiF/xHnKzDTz17xm5+JDEoUOS/eVLsPonjNtt0DgpG8zI+nb0xfcLN/vIiVYTVaAvpdUEm/pMwJ1QFkoHFQdQQ5PNqyP6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+y2ZOPVxTVyq8Z+lWbiWXkvKB09vBHKzcQrBQa0bf08=;
 b=VTU9C9CpxKqRpAOHL+eLYkL1g8gX1rAqHpVPa5UgeU9QNHFbovFSjN7+VJOzgWt4l/mcNRrXOnRl0lPeZer0hKjmqWzfhclRuF26yU7gIsuMxMo+8QFXRz/2sMaaWOZAduTZVjpKi1k22L4K7t20DxD6OoqKy23oMV5S+3/8opamaUlmjEHaVYrCMzE+92C5MKChRVJpLpMtd9yqJbqpWWGUbAVP0j/gEKRd8Y3ZzcnEnE1WGrY3U5AlVQML4JF99Sha5rtveA11eWlg6Sv6u7WQ+cZPC2DNPXZJGg/MnnUoIO03wEp8hCzGfh9Yb4LIqwp20Eitv4bQGgY5NVmaZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by MI9PR04MB482355.eurprd04.prod.outlook.com (2603:10a6:290:c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 11:05:18 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:05:18 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Subject: [PATCH v2 0/3] arm64: dts: freescale: add i.MX937 FRDM board
 support
Date: Fri, 20 Nov 2026 19:09:47 +0800
Message-Id: <20261120-b4-imx937-frdm-v2-0-5e27ceec02df@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHsqAGsC/3WNQQ6CMBBFr2Jm7RBaKlhX3sOwgHaQMYGSDhIM4
 e4Crl2+5P33FxCKTAK30wKRJhYO/Qb6fALXVv2TkP3GoFOdq1RZrA1yN9uswCb6Dq+mosybutB
 OwTYaIjU8H8FH+WN51y9y417ZjZZlDPFzPE5q9/7GJ4UpFrm3xla5shdzDyJJPw+JCx2U67p+A
 U3liXfAAAAA
X-Change-ID: 20261019-b4-imx937-frdm-84ae3d4b72c1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|MI9PR04MB482355:EE_
X-MS-Office365-Filtering-Correlation-Id: fc056143-6454-4e93-ccfd-08df46f62998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|366016|1800799024|18002099003|921020|11063799006|56012099006|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7o9xS1wjwb+fGw1axBOxvjGf/5m4ZkCk9HuQr6z7dnFGwNdAa8iWCa+453hnBgmuS1lfQ5i5k6p8jV1BgQTJCMKLroAG5WvQHfiipc1bRlQQt1iw4EAzL82EllTNUkndGgPd9ejoPC8JO8n1SzIoasG51vEDpcE/ig+oizRAt6NvhJhd0nFyOdxuqE5uHLWwHpUr+PVh4Klyn67KXjyU+D08QMYrjJiQMmqoh5XVIRMMm8jqJVUCRkYBKcZaFxSrvlYVhSM22f+2nibelYJlrKC8qiaLwluQZ5s3I4uQluyIxhXpaIBzaG6p7ycuds7FHyYsxfrmPt2obpadgMtZJhHfyQ2lwe0dW3aY81lpXP/luR0ZeaSX+oJuYCRkDQiqzfVuS7lA8Gn3ehFWK3ueXy5ULmeuI32h0pfLJ30+YGlSEAXsxDeeWDvMcvKxTvg2MoovTS2SfIDwYkZSgaLwZrydKvlMAcHt/5QnmDGeXnZ5R0SjbRa8XydZ/Lw00BSnVPILd9pEDQ/UHAYiLr8WHEEBc9OIIiQTMTFEEuh+YICzK9B02j3k0Lc7mvRsGOo3jUFCRLFcNseGOhJbsEzDoyr12LDxvgAuEuBWcaFp/iXGLzJbQtNtJC8DjTNM3h618TCaKoDhSHAsElT4IE/1dw2eDo+ioeWrWm7nqdfazfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(921020)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zzlwd2cvMDBqaGZ5RDJua1NtcC9HV2tMZmVEKzd4bnJqeFRkTGdzMmdaK1la?=
 =?utf-8?B?b29jZHZZV2pUNU84RjdoaHFST1VRVXd0T245UnBkNWFtZ0Fid0Z2VjhROXJw?=
 =?utf-8?B?NzBsd3NxK0VMOWQ1WXZaSW9hazZ3Sm1CNW1XeDVBZzZuRUlMK29wWjNUQWpF?=
 =?utf-8?B?UTNhd3F1RDBtMUhFWU1HZ29uejhSWkpkU0R3ZCtjUzByWDQrTUpKTkhVNXVr?=
 =?utf-8?B?MDRYbkxHeEFrRTVIajBiYnhXd2ZhZVZWcG4xa2tMdmpJSVovWVViOERSSU9Y?=
 =?utf-8?B?MDdZN05WTEkvTmRzeWIzSHJOQ2Z0dzJWR0RCenl5OUlMcytUemJLUEJIc3BK?=
 =?utf-8?B?RjlnNnEwazFkRmJSVXV6NWEzc3MrMDlEc004SFo4ejhpZ2lSZjNFUFRvRW90?=
 =?utf-8?B?Yk9jODlqN0g0STlnTEx6cm1rOExJcHNYVytYQlFPUVo1clJPSTA5VHB2akhs?=
 =?utf-8?B?WlNNdnAwNDhwRC9ZdHZvcFZZUUJyaXIvU0tFZTVyYkRoaTMvMjRKREJGUjFz?=
 =?utf-8?B?M2xSWHpVc25zY1J2Z2pXeEc1bk1VaWVVeitXRHdRQ3E4KytxK1BybEZrNG4v?=
 =?utf-8?B?Y1FWcXkyL1JDWUcwRm4xU3ZTODhyS2ttd2NzYi9zNnFheHNzd3RkYXExd3hV?=
 =?utf-8?B?NmxtR0JNYks5NmpvUjY1UlFRVGhRZ055ZmpvRERDZEZoK0tmQmNIVG53WTdT?=
 =?utf-8?B?clhkbmhBRHd3ZzV6L0ZaUHpjaWNNcmtZcDlPRUpONHdYYWJwNmFxU0dnNXVC?=
 =?utf-8?B?Z254aFd3WlhaVWJLeVNHNXp0YlJIUmkwTFI1a0dYbmZKamRHUjdqZDY4a2NY?=
 =?utf-8?B?RUZUMUIxVE5JY2hNK2xjRkJIRlVGRk1zcUhycHhabjQwcnNFM2JNL3N4SHhN?=
 =?utf-8?B?TUtncmlNMnVaTk15dWpwMmYyWjR4RUY0NHNvNVZjaUorQThvVUlMQ1VQZEdC?=
 =?utf-8?B?ZkxtRm02OHpURzVDbVJUUEF4QkxyM1ZMVkdLSUVVbWJPZlNreGp3MmMrTXpu?=
 =?utf-8?B?cTI4QTduQ09YSFVXR3o5NllFcHdjc1VvRjNYZWpmMzNSMUxSdmZXaGpuNGh2?=
 =?utf-8?B?TVRHSjg0T0F4TTlxMFZFVW1Edk1rQ21hbU43ZE5UR0N3MlZFMnhiUTVycWNx?=
 =?utf-8?B?UldoMkJaRUZ2Z2cvYm5HVmoveUVDYlRVNFF2U0w0WDRXR3ZiUlJPMmkyWnlT?=
 =?utf-8?B?ZjBQNmYvdzlIcEpja09jTzIrWFFVZ2pvMkUyUEpqeWJYb2kwQXllNVFIRmt1?=
 =?utf-8?B?Vy9WK3M4QnAxN0I5c2hpcElGc2FabDA2blExOUV3d0kvckhZakZ2K0lycnEy?=
 =?utf-8?B?RDFSZDdhbTAzYTRrc2hnZk50L3VhM0hoVC9NNVBvUFphdzQ2QXoyQTZxdEZ5?=
 =?utf-8?B?dCtFMnNsZlVVK0ZsWUpBTXp4RjRyVStnNi9rcG1YMit5aU80bURxTnp0ZTYz?=
 =?utf-8?B?YUdFRHdqT3d1SGxQTEg1SEF4S0RJNkRIbWhZTVAybTgyRS9yUWx5SzFBRjNn?=
 =?utf-8?B?dEJDTUpjV05Pc2xvaGZseGVKazNOYUFOaEl0TzNmU2VYQWNQNVhKYkNIbkkw?=
 =?utf-8?B?c1ViYzdNU2svMnFFbm8rYzVwSXRsYTl2eDluQ3V1am1FT01tWGtZV3ZmLzEv?=
 =?utf-8?B?cHh5aG9tRmtmeHpPZnEyOStVR3h3NVBKQW5oNXp2alI3dVp2aTQ4c2xWekFL?=
 =?utf-8?B?ejdyRHV6VDkvQVRvWGM3YmRRVzlFYlJqUlpKeTVTZTVnUzh6eGNUQ2xBNFJi?=
 =?utf-8?B?VEJ4ZGhMWnIzVU4rV01UcmhCcFN2VGgvZlM3R2ZqQ0s5UFNTMVJIc2FhZmJS?=
 =?utf-8?B?cmUxYUxvamUralVmS1l0Z05JMHJLWktaS3k0c05JSWlQQzRQZlo4eHF2WGp1?=
 =?utf-8?B?M0NqNHZOOEg0YVUzbEM1ZUhOSGgvYkRlVjJHQUlJSm55Nm0ybGtLclVEWDc0?=
 =?utf-8?B?RS9VNW9IbWtDYXgwRkI2YkFDNWFQLzBZeVMxemJkb09vOVZCbmwxaTYxZWtJ?=
 =?utf-8?B?aC9ac3VEUWl1cTIxQTd2Q2FtVnd3K29ua1p5M1Z0UklzcTNSMDNsYWEvbnVQ?=
 =?utf-8?B?eVgvNktBTWY0aXd6NUV1SHlONVdkSDAxVm9DcGVDL284azhkUDZkN3FxZjdm?=
 =?utf-8?B?M0JBOW5OdEtrNzQ0TWo5OHBzK05PVmtkdmVnRlJrRkxNeTBlT1hNc245T1Q1?=
 =?utf-8?B?RGdkOEdzSE4vTEdPUGp1ZXRxbzZ3Wm44NWswT2ZpbWdLbGY1RFhTWTY1RFAz?=
 =?utf-8?B?ZWZnR2NTbnpudTVKNUZnMWhaUWJFUUlQUFFJVTJTRUQ2OHY0TFRsbFlLUVRt?=
 =?utf-8?B?clFYQzRNeXFiUllOVklxeExGRnNhVTkzOVdCT0cwRC9oNHVIMWk4SkhtR2ph?=
 =?utf-8?Q?QLSoncFqkMpZPzaw3W9Ia+5YieYjk8gwSxK7x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc056143-6454-4e93-ccfd-08df46f62998
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:05:18.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pul2N1Lw+baEMBouYcAKIEJLLSXXAtd4Ifo+Sf7qICCvV+a49XM3o3ARAjAAWUFu/oy8Bx74bIoi/5ESE648Yw97VwRNVykQaREJE5m3PnALt41VlyjvPp98Lb7YssiU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB482355

The i.MX937 is similar to i.MX952 in terms of hardware design, so it
reuses the i.MX952 device tree as its base to avoid duplicated dts nodes.

This series adds the DT binding compatible string for the NXP i.MX937
FRDM board and the device tree support for the board.

Compared to the i.MX952, the i.MX937 drops the local dimming and ISP
blocks and runs its Cortex-A55 cores at a lower maximum frequency. The
PCAL6416 GPIO expander is at I2C address 0x21 on i.MX937 FRDM, unlike
0x20 on i.MX952 FRDM.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in v2:
- add description explaining why the i.MX952 compatible string is included
  for patch #1.
- add a new patch to replace gpio-hog with gpio-mux in preparation for
  i.MX937 code reuse for patch #2.
- replaced gpio-hog with gpio-mux in imx952-frdm.dtsi patch, so removed
  the duplicate gpio-hog change for patch #3.
- overwrite mux-gpios property due to different expander address for patch #2.
- modify commit message for patch #3.
- Link to v1: https://patch.msgid.link/20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com

---
Joy Zou (3):
      dt-bindings: arm: fsl: add i.MX937 FRDM board
      arm64: dts: imx952-frdm: model CAN/GPIO selector as gpio-mux
      arm64: dts: freescale: add i.MX937 FRDM board support

 Documentation/devicetree/bindings/arm/fsl.yaml |  7 +++
 arch/arm64/boot/dts/freescale/Makefile         |  1 +
 arch/arm64/boot/dts/freescale/imx937-frdm.dts  | 87 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx937.dtsi      | 12 ++++
 arch/arm64/boot/dts/freescale/imx952-frdm.dtsi | 28 ++++++---
 5 files changed, 127 insertions(+), 8 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261019-b4-imx937-frdm-84ae3d4b72c1

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

