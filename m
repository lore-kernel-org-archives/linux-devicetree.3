Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686979;
	b=EtPW/Y58nq6ESNWNcyiMeTm5HJ+jrzUXK1WhpoE2sbwHO75z5WEmu4aeoSezwHIN8RYA
	 9YR+9/TiAAwmi4dEY7uKq3k/fjDFhCpMK7CBcCFJG1zKOYERFQ3ogqymaEWrFdKTN/Qur
	 fQoOkMOpvpDQr4k/Y1j8JaqiyMi8bmOw28TTzYdfepGf37KIEk9jsnbIVFV+39c12vkX7
	 dGI7+aem/7/raRsK5m6oWhr3grtjjS68sRlGwJBdvbBB9cBJf0dZZ68AMi7OPRDQ88v5h
	 FQm1AtxXvhCRwwfApUIhrwWrNfrdv5jSz/fpyGXecadteShi1laLsZw1e8+DqySvOmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686979;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=UTxBBDRdhc56uqY7dTLggSPsTJlq0p+BQ17MfausoEQ=;
	b=UWDxPXKFGbhgg06E0t7nAgbxeUBPZ8albFWtbj50sn25FmwqEXAHr4nc3aZq9PCo0Tfa
	 DQgFXqy9lDbY8S5TpESAf6B0JWeZPIF/eH2hhayYWID3OVCyv4h4lYM2b0LjioE8RO76b
	 FmX7SPcQlkqekp6DIF5G0KaViqNfU4VqrIxqQFiNHrIXw/dQWET6OlQgobHBlrcxhIcBZ
	 TYQKSJkTCC1zUIXU9sydSoze+ncTTq7MkrGK8WnNiBWztr+deLiRS+NwYfj2YvzwTpqsv
	 jpxGMtEmAaxhrjPgXV0nRvAyw7uUR5ymFS/g0+RayDjzbhPWgp70jiXJ5ME5gHpE0CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=bYSuU8bY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.52
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA83606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA83606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=bYSuU8bY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP3fhHypnFG8/tYIt3asMOt+JFW/2j5occyNVPjzvsq6kd57WO0311FaxyIcX3LpcDhyTL8kQGCoZSomjOsPzyF4QU0VXFlFyrN7A2EFjRdTBVNWqms3T7TJcU+bP8g2thKd/WdyE7Th+HWDmTN8hZ8QRPuYLTgUy3Rng3P7aX/NSP0NjGiGw50OW5+xbgfUJLqTGsAR9q/yeODVw8xAiSFv3BAyuh4bcuB1L+hbZFjTVKBqUM+gMxqKih+VKk+6liq0EkZz0YJjGGG6RQS1tl7KGzcrF96cjBXemACeGKZXl+xz1TPEhUxvndfsSQE/haDNsEqRSNMEwFKnlD2WYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTxBBDRdhc56uqY7dTLggSPsTJlq0p+BQ17MfausoEQ=;
 b=YZWiwGrpGyOWJiFjIcwjDBcJUrRzX3eLBjJkmtEiB/aYfg00lX4VUa/LM0KtQ1ELMJKVDdbZfYkVvOPtj60YzzWa6dgRI9W6HjFI8odPuJmVFQzhieGWEkgyXpdWGIq5Wzd9L6Vm6xr7O2uAKAq2Z0dKHYAcCjI/erDLwfVqBoJx1VNaP3hYM8uqUtUcPDNG28bIsoGtDQV59D/mLVG7ixlXl9xYF2sethM+Gldz+nyuKiAfz/hCSHcErDMjoXvuRoVsoGFd4K1oABiFJn8q5GLyoa7jPEzKKGIOl/3hFqeX2V9n6dva8QFsykyL6RFwB1dH4m8Adjgb4mKN/ubkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTxBBDRdhc56uqY7dTLggSPsTJlq0p+BQ17MfausoEQ=;
 b=bYSuU8bYW2KWD6c1JpadaFOdGTRXx8MEKILpEMBi33AycPPZ9bf2A+MgZPnugQEq24eW5m7mSjTY+HC/c/tQgmC2bAcuj90J2KKcryomKFTP4bK+VbUmqiok+jyvo193fyz9vVnAhz/d44FytRGNClhtWCx88WlqUHGHPtFREMw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by BR0PR04MB614562.eurprd04.prod.outlook.com (2603:10a6:2c8:4c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 09:56:13 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:56:13 +0000
Message-ID: <c6930807-24de-49c2-adcb-5dbbc3da0c45@cherry.de>
Date: Thu, 26 Nov 2026 10:56:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Add CD GPIO to Orange Pi 5/5B/5Pro
To: Dang Huynh <dang.huynh@mainlining.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20261121-orange-pi-5-sdcard-v1-1-e431e7c46ba0@mainlining.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261121-orange-pi-5-sdcard-v1-1-e431e7c46ba0@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0100.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::10) To PA3PR04MB11153.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|BR0PR04MB614562:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ba5659-a324-4c82-9ee7-08df4ba38142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|4133799003|261028144727099003|56012099006|11063799006|261102123227099003|261026140227099003|261022105027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	FfVtQwS4yAcptXCUo9f3YFjAwQkVG5naiaJ3oojSdwucXtLVkyJiq33QOR2Issj5IVC9yyLwE4i5U08VPJ5Q6Ez2tmb5LkeiapTkrL2G8z7kaBOEgcMQZP8VImrXJabzcRjGCXjN5ZsyHtzB21BAIpAAKbKP4hGN1cDn0IiVOhUtLpoIWzIZ8Ur+jLUu/tZkYpMtHtCtc8Ipoc8dLDBWsEh0Noe3dPr6Xhbr5x6bsSXe52Sz6bnpdvtUE6UnjWQmESKCLIu5/UJjp51heWDB2dknaA7d5q512UFAdOzEjcwranEPIYpccgGJWY9PUf3sJST1cyXxKgZyi1S4v6BqLIPTNKqn/+CbB3HXlQ40u8S954rVU/Wq0Tqus7SNx+ZxxRgxW/3DslyBNn7N0FTLjdE6b17O193/H4f73CN55IZXiMx4l366OzxpVX6Bm4qfqJRrLgX+tlArzm5tc5fDjG2WRAFqJNHi7WU2i6nizAwVCQYThx8oztWga2HF+JQ85YeThnkFA2HdMerYod7/WZ/tYNmWTOyQbQXwsOz3N7Wd+UujAHbst/1j/B53GHLh2mRYw9UE9/c6AIBcJK7F9STUWnRhVab8y318RkphcQA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4133799003)(261028144727099003)(56012099006)(11063799006)(261102123227099003)(261026140227099003)(261022105027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STVmNStLWDVDbkR0NWc0L1Y3WW9IWGVqMzh0TVlwazZ0Y1FMUmlYRU9JMGRL?=
 =?utf-8?B?NHJJWVMveDFaRkJubE5HK3hqTEFpdjRFWlNDZVRod1N6TjJsdmFzLzQ3SzNZ?=
 =?utf-8?B?S0Nkb2tJR0loVTA3V2xVMTE1REVpRFlvVmpKSXZFc2ZtUktyRFJjbjdiVGp5?=
 =?utf-8?B?dzAvSDh2bnhmSTJMRE1YbUZ5WVdSMDNzZHZ1MjBTazJpbFY3T2FkRlA3SThW?=
 =?utf-8?B?eDRxQ1ZyWjBmN24rQmk4OG5aZnQ4S0lpUWZwUDZGdFpua0xnTG0xc21RdEh0?=
 =?utf-8?B?VVlQNnk1cTVod3hsR1NKTThHeTVGS0I2ZHlkSEdEOXAvYURnYklvSS92NjZt?=
 =?utf-8?B?RG9lcFRwK25oVzAvMERQam5iM0V3L1ZoY0JOZ1Q0clRzRG1vMlFJZnN4R1Vn?=
 =?utf-8?B?WHBrZmNiSWRKYlBwVkhqTnVUTlloQjA1dmpJYTdrZGFVUWVwNlhoanIrVzA4?=
 =?utf-8?B?ZW9lYmVpUXVQYVBHZUlsbFJ6R3pjbzA4NElXVGJWZE1TeEt5UFZMQXJqN1pk?=
 =?utf-8?B?SWkxemhOZmlDUU9Tc1NLUTFqV1ROTzJBSmJabFNQY1NRbVJ2ZUc2VFBMUSsx?=
 =?utf-8?B?QXdMQXZUL1NjbnI4RzBtNXU3M2ZMOGNocFZxNlhFdlE1ZkphZE5TNWdCMVhZ?=
 =?utf-8?B?RzJ3d1lFNW1jU05tWVhvcWV5bVpCeENaRk1rbk1zTmwzZzFKVXFTYjZBQnZw?=
 =?utf-8?B?czRZMDZ1bjlNM280dE5XVjlocTFSOHd1ZUhDUWJmQVR6U3FYUnYyNE1tSGJM?=
 =?utf-8?B?aHhPTEhqdXBQTlFBNE53YzBibGh4ZUw1RFF3MlI5eFROd2VpbzVTcFhmeUdx?=
 =?utf-8?B?NThBelJiWTBhNk1zZThYWFBnazY2VWNCRXg5Skd5QndOU3BvN014dmVvTER6?=
 =?utf-8?B?ZDNHZnl2VzI2cXc4N1lHY0x4K3hhL0RhZmtBM1U1L0lLNDRreW9vWmNhNU5E?=
 =?utf-8?B?bjZZbTAvRmw3eGk5MHczYU1RVG5UTnpuYVp1WGFOOFk5enozNFUxUmp6VDVl?=
 =?utf-8?B?ZktRb2o2RVgxNXA4cjh6cjl0WEEyNkxKb1Ivb2xpcUpvUlg4R1hZc2hyajkv?=
 =?utf-8?B?VkwwOGJiY0JyN2VzeFhOcGR2T1I1dlN2bWZ1REJodklxWk14dFN4UzBFcTMz?=
 =?utf-8?B?U2tWcE9Odk1Gc0EyYW9HRnBsUzc3ckxVa0MxNUg4NWREWkZBb2x2TGJRU1hr?=
 =?utf-8?B?TXVpQUo5VnUyVllVaHF2K2pQL0ZCMmZOWStPbE0vMjZNVi9LU2FJeWdVbkpC?=
 =?utf-8?B?N0tFQlQ0VmVUeEpWeVFKZmFWMnhKU3BocXNsck85cVB3akZHTXYzVE1oSURQ?=
 =?utf-8?B?VG5URkwvZmNJYnh4TmQxOXJmdHpYd0xjTUdGUmdKZXBHaVVqYTg5bjBxVlEy?=
 =?utf-8?B?M0V6SlV4WDVpY1FMcFBQNzEvQ1M1M3B0Mld5eENQYlhTQUhOdE9BQ2JxbGYx?=
 =?utf-8?B?UndQbjRjUTA2d0VGZUdlMTFRWkdDUXhCeUlxVlZUSXJzZlVxZ0dsMGgza0V1?=
 =?utf-8?B?VUJOeG81cW4vTTkwTUdxdUd4ZFJjeVBnc08xMXE2aTZoVEFwV2xQUnRZMGd6?=
 =?utf-8?B?WEI5bnNSNW9pTFFhelVmc3hWdHNWRzQ3Z3prbnkxU05qa24zZmh2RnUvbVpS?=
 =?utf-8?B?T000SG9mMzM2aEZNblVsRGxqTHBqdEZLUFB4RmxSQjNPcjBzT2gxaDRmN3Fo?=
 =?utf-8?B?UlZheVZWMG8rMngwTGRsZmp6SU9UTGcveDJiMzJEMVQ4L0JpQnBGcVZqUUdr?=
 =?utf-8?B?ZmJzQ1pTbWRpb0E4NG1MY3JqT0cvN2lnWllUK1M5Wmhjb0E5S29UYWlTOGhD?=
 =?utf-8?B?QXhZeGJyQk5vTTY1Z0lTTEplZEs0MVVUQ2p2aDlqbFI4NUtxRnhKVGM0YUgx?=
 =?utf-8?B?RlFQSEhJZXBSMnlvM0Juc0ppMlowR215Rnh1eVBHK2JTQVllcjJMcGw0ZFMv?=
 =?utf-8?B?ZDZwUTZnVUdQNUxrbkIyNnhsTm9pMVowZjVTYW5QUkN1ODVwWlpVZjBtWnc2?=
 =?utf-8?B?MG01WGptb0QxSE5ORjZweUgxVVNKQkNwSTFmc3pDdEVsV3RkRjZISy9velZZ?=
 =?utf-8?B?eWlMaHhveENkSStuMnhWY0NiMVQ1aTZPa1VOZGh2NVl1R3U5SXlnc3c1UjBo?=
 =?utf-8?B?SXIzZ0p5Zk53MkkzTCtlRjJBZWdBQmpCNjI1MkRFQitCMUJZT3pZTXNOeXRM?=
 =?utf-8?B?b28rMFJXMkkrd3RFZkNNUXZkMyttdm1ORDZvQW95VmdHa2tDK2FqNHRiczdL?=
 =?utf-8?B?cVRWbUs0cWZLQXRwWXVvRktSQjhZbThXVmN2NVBsdDIwNEpEK1BqU28wTXJP?=
 =?utf-8?B?RExOVnQ4WmRZd2RNVm80WWQrVFZwekZoVENQdnVYa3NmYU5Bc0ZoQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ba5659-a324-4c82-9ee7-08df4ba38142
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:56:13.1920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIcLtpMgcz1W53v43XxUtNSUte8gor4ndLSXF8sCV0CARdm3l3hgtYOQRaiuU4ccfhHCuQcNC6G0SLU4j19BdMKb2Mj/kFjL+P6BDJCwdpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB614562

Hi Dang,

On 11/21/26 8:03 AM, Dang Huynh wrote:
> CD GPIO is currently not defined in Orange Pi 5, this breaks
> SD card hotplugging.

That's not the issue. The issue is that the card detect signal is muxed 
in the SDMMC_DET function (c.f. sdmmc_det in rk3588-base.dtsi) and that 
relies on the SDMMC controller being powered on to detect such an event. 
This cannot work when the controller is in runtime suspend, so we have a 
chicken and the egg problem. The card detect should resume the 
controller, but it can only work when the controller is running. Hence 
why we now go for the gpio function (via cd-gpios) instead. See
c7a9549ce46e ("arm64: dts: rockchip: Switch microSD card detect to gpio 
on Radxa ROCK 5 ITX/5C") for an example.> > The SDMMC_DET_L pin is 
connected to GPIO0_A4 on both OPi 5[0],
> OPi 5B[1] and OPi 5 Pro[2].
> 
> [0]: https://drive.google.com/file/d/1Wsp-Q7IyG0Ky_W-z1n5oXcFG4oqIbtOb/view?usp=sharing
> [1]: https://drive.google.com/file/d/19iPdpAXhA1vFkVOgG5Sz7L6cV8BB6004/view?usp=sharing
> [2]: https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/view?usp=sharing
> 
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> index 2db6ee95e504..8fbb0ba19b74 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> @@ -282,6 +282,7 @@ &sdhci {
>   &sdmmc {
>   	bus-width = <4>;
>   	cap-sd-highspeed;
> +	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;

issue: missing pinmuxing

You need to configure the pinmux and pinconf for this pin (via pinctrl-0 
and we require repeating pinctrl-names wherever pinctrl-0 is modified).

Cheers,
Quentin
