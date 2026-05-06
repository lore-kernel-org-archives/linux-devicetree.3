Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010018.outbound.protection.outlook.com [52.101.56.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38C733B6FC;
	Wed,  6 May 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049935; cv=fail; b=CQ5BqQ+CNBuaWp6adfj1nSIGPOgj4NvEJYRPC0/yqnggcd27hrHd05KSiyEkzSljcXYjMToKx4pRiTgWXV46GGxmOjU5BG3q0k34aNdChQqarjGHw+yq8Euz22ceHdh7DBYT8cuYxnTgO+KJii7dU9aVdx5B166Jq94m9zoMFwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049935; c=relaxed/simple;
	bh=S2CC6E2duBsApwlG3SsbyTYk9QVJmvH74QpqEwFHkGY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eGMl2pvXqs5jzvf9e/VQvkBZY1xOvdRCxBRytGOkKhjc0GPBVOG8HCvMWwrkpPWfIrU9krKE4uPl7vZTPVteZwTPSyYE9ig2gUjo4nO1kTsibuoASbGGs6na50hKESovMCnUjNSwXzRIC3I+OFeXM2F07369qGqRT16IloSdHTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Jovznhxj; arc=fail smtp.client-ip=52.101.56.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Jovznhxj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZPQZ7mP/Wfsd7l+1dcgODtXIrFYIEocf2gQLotewW6xvxLS2IHn3whfusHvMgeryhh17BfKDEVUosNTbdd0h5UR5XgKUHSHstimfoSlC5Jh8qGiWxOcO+vvBDnSiQI2uCLfz+Ri40rlkvu3vtbITNKINN5cD6BbJ2W5oYje8AedfPwSz0Rkq+RF2/ioMwh+RwRkz0reMnUg/hGironrojsIkvPrFNxM2ucAXTxnRD4PQo7o8trTSgripXxAEWN6Q/9v/PGjwyUlHPWd86+IIzpZx3tfJRdpuVdPS/k5onLLV2Pje7UvxnUNDOzd2h4MPALW6/D2TPFtRFxuwbwTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aioHHEU0aHTvLVGQMOb/yVCoua3sc0C3Z3i9I70i+ok=;
 b=RnBAfJQczMIKMv6f1+i7kx3CJr5b6drs45qunmFdclUxSLzenU9SCyqXT7/lSNnO7nbfbRVbnfwioakOcLm9Zm3QzJqhpXPj5m2j8ilRO6s/snbwI0YkPDbcs3vZw4Q4saolA6xqNx42pz+8J75TWQmk/nGzo8ZzGAib1mnI7Tk4Jr1VwBabhgCn8wdCkuZAjasEuDNdy3uHZsrHrT6ibTYpTWKh2It0/B0kZcT28U8lZuWPiuekWkSMomj5hfzDTVhM0n9eA7yCBRCvQCzrn2ZYrHzju9kxWVQsVnoYevb0X0G0y6oujpVWOcIQ/Tnd4SDydop7Pzk7LoZBzZryqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aioHHEU0aHTvLVGQMOb/yVCoua3sc0C3Z3i9I70i+ok=;
 b=JovznhxjjadAIAXiHxElaP6Wetzjylq75KAzREjrwm0p+T9ggagXS+S6cSlGwEjMiQppatcW09EH31EOWSwGj87c75Z4vzY6uJv/oGExK4MqPOGnfAjEBCdNYWE4VsblhUWIyM66qFTCZf2wS9EeCTqCdhFzUheIhrcHJ86CGEtNhgGDUEtJyX4USDX0DcLbw9hChfvgzLpNm4OKkl/0CxdqPFQDOfDpAnAO4as6pNdLczWQKlGZHqDikCAmrrQ3UMaPTcnITIklO9bTx50O33NqteYRtvw7FQK9xvX/73V/x2PbPn7i9y5rKnUwDkpsOpOtsv7HhtmoWfyI++vgDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN9PR03MB6140.namprd03.prod.outlook.com (2603:10b6:408:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 06:45:29 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 06:45:29 +0000
Message-ID: <cede77c0-6aa4-415b-9911-d984dcb18da4@altera.com>
Date: Wed, 6 May 2026 14:45:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: intel: set alias for i3c controllers
 for agilex5 variants and derivatives
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1777957556.git.adrian.ho.yin.ng@altera.com>
 <432ad0ea-83f3-489d-a97c-21a0473dd341@kernel.org>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <432ad0ea-83f3-489d-a97c-21a0473dd341@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN9PR03MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 368b8617-d18c-4724-7796-08deab3b100b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|55112099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9tmMtpNGnO+yFdLaugmpZ3Ntzr6yZ0Yv6SQsAz+nctl4nAIdgUi/kXpfrKFqF6d0ely+fqlMeAtzBsveHCNZPjzplXtyzjFjJMM+oYpMblR99v8FYdfp/oiTdtqTicp8aH2HUfBKCgtmCGuxA+2ftVKL8zpRQv0JZYDLpmhhl5zaNay0CmKOoNuB+UKfeuqUp5pedY38XFHPAzt4E4SwBp3rVuxq5NkM+lQHZWfKfYN8MRTun4ndXKi1mz0ScDi75HxR5a5p/UWJBN1z5tVcTuyMogy/7AxK8SpaYAudW3hhMBTltfnwNoVGCZ9OG7D68dnGnWovVd1DD9nwkwIMM2cd6abKv/9XsM9BiRVdJXvWNUAUohNuSDiXBWAB+4jcMaNbdxwElTfKH29URKI8Wt672MbtEK8ExOvlUghxm9ui3ahqBnWv9iRWuW8MiXQIljIbcUXd7eYajMLv7gXxGT5SuS2IbCWoAO9qs7Crh7bCHpde7po+2ZIBKnQYIfVfgA7JzcsnK2tmxP/X2wTP4DErF41hl0QF1HVLoXLNQ2MKtusbNp/o4q40qmaSn1rGG0+6B0h3Nk+jLjiVCflt5rgmqI9ntQlLIRFzK82mLJj82/DzBVk2GNGIFsw8PV9YkxUr09QzEzCYVy2wMjuNm3MekqOLlGHy939bMK5cK0fqSqcDFotwuCtN5/OPeB14
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(55112099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THpTdElDenQvVTh3MVVJaDZNOUVEbjlObVUvSGZhd29kT1dGaEw3SEVZenpq?=
 =?utf-8?B?bXBHT0hWc0JQa1JJUTZWeitrYTV5Y3pHS0g5UW1KT3VldkNLRWtmVHAwaEVm?=
 =?utf-8?B?UnV2aGIyVmsvM0ZRc3dNTDdFNGE5UDBWMU91SkViNDlvQmx0UmhSNGU4bkpX?=
 =?utf-8?B?bzg1SFZ4bUlSaFkwVWZPZnRrNWk4d0d6WWR2cisrczY2aDBZMkhuelZZRDZw?=
 =?utf-8?B?dFVFU3IxZHAxekZLNElFSmJHTlBnbE9TTG9PUXd4b2p6VUZVZ05IL29SQWNv?=
 =?utf-8?B?aVdPdGQyWHhKaHU2TlBpUFpqQWdXYVV5eWV4WGZjcTlwUW9xSEJ4VUREVC9K?=
 =?utf-8?B?cUdlTW1wUi9iRkdDY21veFRaWVlpZE5Kdm9pQ2p5SThnK2xIa0Zzby9pc1Ja?=
 =?utf-8?B?Z1NUbGtxUm9oZGtVR3I0aUp2YXBoUGJkeGlYeHpUeTh0a0VPTmcwU0k2QWJ5?=
 =?utf-8?B?WnN1clBSSDdTQTNzeVo0MTFPeENldGxTc1U0YmpIR3BpMEU0NmRWR0N5M2x2?=
 =?utf-8?B?aENSNlpMTnYvS0hhVXJ4T3h0cEQ3RFJ3THRiUGQ0dnlyQjZoTGN3WEc1TGVW?=
 =?utf-8?B?ZDgvMmV6Mlp2TDY4amhaUk9udndOU3ZJWk5HSHh1RDRYQzJsbjBrNWNkaGRj?=
 =?utf-8?B?TjF4ek5hOXJYNlU3T1NNd3VVY1Uybmk4am5yRm52NERoUGFHRm9ZaUpIZ0Ri?=
 =?utf-8?B?MVRxd204c05heVJvc0ZFckV3Y0c1RkEwTU0zNkswRDJzT0UyWmZkaFZkbnpL?=
 =?utf-8?B?b05ZODNUN0RFUEpJbWhqL1l2aWRkUjlWS1pvVjBjUG96V0l4S051WDdxSW1N?=
 =?utf-8?B?L2NkR0NIQW12NDJSN29LNVNqQ1dEQ0FuYzkrQmFxamdsdks2NE55RkR3L2JW?=
 =?utf-8?B?Y2JQV1p6VEcxSmNKV1cwRkxvYkFTOGsyMTd4N3ZsZHl5N0ZDT1VsdVRjTnMy?=
 =?utf-8?B?NFVaTE8vdHpGZll4WGhlTGtsL1NOQWNhdkx1YktlUGI4Uk4yNjFyd0VuVTZ3?=
 =?utf-8?B?VG4rMFpVbFl6NFRwRDRzMWJFSDJMNEgyTlU5SlJraHlhN2tJSVpMblIxT29i?=
 =?utf-8?B?Mit6NWNOT24wSU5GSU8rTlhPZTh4SUxlY0lMN1RreUh0NDVYMUJmRW93Z2Jx?=
 =?utf-8?B?UmlaWjc1cHNZKytNR3M4T1U1TE1GdDkyYWhBVXBLbWt4SlJIc05FVElwUmZo?=
 =?utf-8?B?bnpNWGlsdzQveitDa3FzaFJvWGowMDg0ejkyUEdtUmVhRjl0MDQvSkU1Ty95?=
 =?utf-8?B?cHdaV1FYNVNseENwUU5VQlhUc2R1N1laL3o0bVFnMXQxeGpqaXU4RWVtMElJ?=
 =?utf-8?B?N1pnRSsrampYNzBXQjhXSlZ0cmVGQVhYcU1mK3VIVFhnQkI1aHRscDl5QUZE?=
 =?utf-8?B?TnkyYWkzaXZtNXYwOVlGYVNTS1RWcFN3TE4yb0RlZmIzNnNvRUY3WUZoYWNh?=
 =?utf-8?B?L2ZJR1J0b082cHRGaGNlWlF5NE1BME9aUm91Y1l3OUl2R3l1UU9Vc21BbXE3?=
 =?utf-8?B?eW1tUUJSYWQyNTlXNm9vL3o2YlBTQWprVnFzeTVxTTVjNzY1T0F6R3p2Wkdv?=
 =?utf-8?B?dDl2UURKdXRDb0FUUFZKZGgxV2w0bmZRUDd5VFR2c3hDaWhHSG05bDE4UVA5?=
 =?utf-8?B?NVdOMlMxZUJRV0ZJNmpGRmU4YWpVY1Niai9WOUViZTRpWkd6Tnp2cU45VGEy?=
 =?utf-8?B?MUVzUWxsd21jeWE0cUgwclNLdG96NHpLWGZhbWNSZlVhbFRKVWhwT1JEVUJ1?=
 =?utf-8?B?cjBlUTJwOGZ1c0x1bFZKdEJzYmFoMHU1QTB5TWtBeXVTYkF3ZzRWM1R4Zk0w?=
 =?utf-8?B?amlsbDhHdERkY0VxRkJiTFJBZ01DV1VFT1FyRTRocnlxYW9VT1lacDdLTUU4?=
 =?utf-8?B?RTBBbVd4ZmhDcU92d2Iza0JxejFHN2pGV0Vzd3MxTW9tMm1VM3RrSDlSRzUv?=
 =?utf-8?B?akVzaEZvbGZCS0tETkRCeWg3YXdqZW1MalRIZkJIZ2prTDNoUmc0R3FuUG5p?=
 =?utf-8?B?ckw0YVhJdDVWUnQzOXIwc1BjaTczNVdYMTRTaEhnOVcvOVNzOU9zQkRML0tw?=
 =?utf-8?B?WG1MNU9paXBNOFhBdE1iak1tdmJweFpISHFnY1hsUkZtWFdlSDA0Y1h3WjVn?=
 =?utf-8?B?eXdSSllQam8raGhpaVIvTlcvR2o3TStBNTdzaWFYZlE3VEM0bGlKU0FXN1J0?=
 =?utf-8?B?WmJPekFiQkNjWVVuWHRZRVhGbXh5SUh0bU1sRHFINDJQeGRDQjlSMWdjNVc2?=
 =?utf-8?B?a3hqR3RpMnBDT0hzMFNtbEdhelIwNCtJRk1MYXU0RDMvaE13ZXVRcHp2Rk04?=
 =?utf-8?B?a042NCtiRDJIMlYvU3A3blZtSEFYam1UT0xpdGwvczlFYjdtUnNwNEI1OW9p?=
 =?utf-8?Q?ED7EVWZZNEg5Cvto=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368b8617-d18c-4724-7796-08deab3b100b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 06:45:29.6723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dlyj1vO4esFPHB6QnkrXf6Di3dGCkMUO0eFnOjWvZ7CCdmCxOxvXGKz6GuBU723qwEuU4GvC4mtzWTOU22pckh1C2d1A/ho+fx6iA7/Xx+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6140

On 5/6/2026 12:09 AM, Dinh Nguyen wrote:
> Hi Adrian,
> 
> On 5/5/26 00:15, Adrian Ng Ho Yin wrote:
>> Agilex5 SoCFPGA variants and derivatives have 2 i3c controllers, a main
>> master and a secondary master. Setting the alias for both i3c controllers
>> to prevent bus id contention when both controllers are enabled which
>> results in driver probe failures.
>>
>> ---
>> changelog
>> v1->v2
>> * Simplify commit titles
>>
>> v2->v3
>> * Update commit titles for clarity
>> ---
>>
>> Adrian Ng Ho Yin (2):
>>    arm64: dts: socfpga: agilex5: set alias for i3c controllers
>>    arm64: dts: socfpga: agilex3: set alias for i3c controller
>>
> 
> I've applied both patches.
> 
> Nit: I'm getting this checkpatch warning:
> 
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Adrian Ng 
> Ho Yin <adrianhoyin.ng@altera.com>' != 'Signed-off-by: Adrian Ng Ho Yin 
> <adrian.ho.yin.ng@altera.com>'
> 
> Please try to fix this up for future submissions.
> 
> Thanks,
> Dinh
Hi Dinh,

Thanks for the feedback. Will fix in the future submissions.

Thank You
Adrian
