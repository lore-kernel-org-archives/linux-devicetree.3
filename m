Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613762;
	b=xm8WR8Gy0AdQ4cDzlH3Lb4orw3tR4T02vd9p5E2tXk7il8a4CeBECiIQZBd7HyIYHzt7
	 N45KLeYCvBqhB8gj5Bqf7AeZme49YhIcD/Zj9/MillktQmhk37+4sznh6LWpkhLxi7bdI
	 so/2uIazds52AL6BE9fWnI7wplgCzhPbVMnmeWQWmc2AW5C4jVjq7XRyWEZ9rkDA1pDHJ
	 olQLZ9GK5PbjD+l1UZ5YLQaQJT2gdfFjgfHyrcwIGuKqfVc4ePE1HECGmOIQ+cY9K7VgN
	 U6aId7I7z2x/Tl2/CpteCpmxWUzzppVj0syuaIn+b7w8fmrDNdPuIY5e4hf79fpTcdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613762;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=tkXMrh+3/0juGizoK3u0Sy9va9vXJlDFqLxcscAqwto=;
	b=p6+QPJdOu//J+n3iv9AmpBVRCcrtqf3pt/8nrQfZP1noScWfnkHFqXYA8bIMADHjMnf2
	 prkUW/93dxybbQszP1FdWko4O5v7kRcl4tQR/fy5Nd2nibaGNNLHfAPTspVgyb07HYfYF
	 Z/X7M9jY0TnO7AEsr86a1zNb1T+NFp9wLyVeB4TDrYwHx3LsKhsUt2cmiMzlWIrIVuDRo
	 HjO/GNNmAFbZ8Y7FuluKFPcrQTvqQSrdQiZfmEHBIXElE/h80eGKtl72igoeTvWdXrAlD
	 xugHB6H8O+UgeKvuIsqaqxtuRBIIYU2H4aQHvUNCVUc3GgAoH8C/DHu1hNhvKfcWayA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z7w8KoH4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.54
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B258D606A31E;
	Wed, 25 Nov 2026 13:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B258D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z7w8KoH4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSx95mw69YMWq3oPAPLkfjiXJKAMwv/f+AeTJUA5MDDCJfQPB7wxH9HJXReCQKNdEt8L5DRCWhr3qkpGe6VL3PtF+JGKUBnzKab7KTSm+mfZsk4xC49/Mf0NIb3bGF4IPBMT9629h4Eo7/W83xCKcAZShCYnWTibZ3bGMbVDy0Dw1bUpsABEca/w3DhPnbP8jue84uobX4JNw/6VBjXrGuRFX9rDiBX2f1Gaog1TXVar1drDR7y7CP1qfq1aiYfqYS6E+PAyM4LVhDWujjxPe25PKxgTEdN4yZn3sBMpohBG2VzqqA2Aa4dDlU0P/9Ibbqua2fs8qV0q7TOvn+kXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkXMrh+3/0juGizoK3u0Sy9va9vXJlDFqLxcscAqwto=;
 b=FkUExzn+OryGTs3fhSBSJRAs6LsN5O8R3VZYHn/Ej6G1Awovp6YPCEMDvVdXwySWXk76VqO6jePBaPos4wFLtNzK3R2ZygHkIn8OGrMmElI1HV4eCGPnCCeC67iwFrtAT+ECkzImZSM+CIcD3wxNEgE+VZngLyfuBA33bH9ckf6hw4vT/OJMfZ4u2nyvmZSWvWHev7t3/PdjWdAiYxQYgCkc0tdeTg1ozw+exXkoJRS25wZSuD0kWbZKYJ2P2TGxhvvXscBQwa6UeI3K74z8A8RboOFNOxCNVaLWYb0BQgO3gYkOizQJAmaNI/ULaeT7EitWom1vCdPm7qtVj8gydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkXMrh+3/0juGizoK3u0Sy9va9vXJlDFqLxcscAqwto=;
 b=z7w8KoH49HJX6osDahbxyrjGiF8Pbpfh15FPJ5obf62Doj5afmArL0bwFVr9RjK/3Ah6Yw1qbtMQ7AQnbQkNZQ7W2m0PG/7eX0Txfu/+jcZw0Br88EJJmIknL5eMl+1gbKBn2SPC2ZlyRCxXkXvQJylIBWkE9p6i44WBhdA138A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PR12MB052986.namprd12.prod.outlook.com (2603:10b6:8:47e::11)
 by CY3PR12MB9553.namprd12.prod.outlook.com (2603:10b6:930:109::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 13:35:51 +0000
Received: from DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48]) by DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48%3]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 13:35:50 +0000
Message-ID: <03024aa7-520b-46c9-a522-7c6e42a362f9@amd.com>
Date: Wed, 25 Nov 2026 14:35:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: versal-net: Add SysMon and thermal zone
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com, amitrkcian2002@gmail.com
References: <20261119054418.3740755-1-amit.kumar-mahapatra@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261119054418.3740755-1-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To DS5PR12MB052986.namprd12.prod.outlook.com
 (2603:10b6:8:47e::11)
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
X-MS-TrafficTypeDiagnostic: DS5PR12MB052986:EE_|CY3PR12MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fcdb88-5021-488e-c5bb-08df4af9054b
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|10067099003|261026140227099003|261022105027099003|261022075727099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	hXqxRlSC88avDqmdiF+BKbji4pOG2R/trRTGyGoZJy5S1SozQUdzXDWBQiKW+6WL65dk8PqvaT98j8gp21QUfdZA/U4ZftUIi7dg2MMAF49sqRv3n+f+5cBKpTFbCTgeqEDuwqUvTQvS/H2gG0j9ksvSuh04jo4hEhJ/FoL90Tvp6bBSc3xIT0hyLOd4a4FVHWIAL8Yi3HDnXKi8h+Wj0av0vLOuWPHoUNFVJfiyYMBWvYnfi/te5NzAVSo/NvYjbzPXLhnAoUe5d90m1trY2sewKK2djLzqJxuPESSgR/TNM/AM5GRW6/QnJqhmac1+shCbusWjfg1iY9DqXzSFkYhYLKwH0+vhwtX+63hHLO9aHRxfaT+G095r3BiJmaiyWGLzJnnePPImGMZYmwIE4tfcp08ptNWm7lvgtUtEkWJ3ZANtZ98q0CzWZx2ymn2HbT06PjqQdjnhP6tA/Dt1QJ4UoEXowMnkAXJHjAb/yUmk34vLOLxZap6rV3kHE/xCMRMw5YdYKkse7l/VbqpYzmKcAEG9Zuyd0FjuDtcXjXAZGM+X5uKzsUsMzeSvr0jcrlmypg9zeqxBJaKLgtoFZbR7MJNm5lVMHxMEtznXW14nCvUs1GyD8zjdSIKwyW6t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PR12MB052986.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(10067099003)(261026140227099003)(261022105027099003)(261022075727099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEEwUHhJdEpaRi9pNTVZb2NyVm43VExzbysrMEkvODVqQktMcWI3RjZybEZv?=
 =?utf-8?B?UG1qMmkyRmZmUkVzMzFaU0ZiZnV4dGc2dDRMVG9KeFJHUFRhVG84cGZZUERh?=
 =?utf-8?B?SHZTRlM4R245OTJnMjlsa09xd1BIWlhVS0FPakRMUVUvaWRTT0FBOG5XenRQ?=
 =?utf-8?B?cU4xaTMySi9sRlo1akJMRk5BV1Bsbk9WdC9vbE1SQXJzbkk0dHNzY1gyblEw?=
 =?utf-8?B?cEdvM29IMU5teGJWZGZMNjcvMGYxaExSUHZ4ZUUzOUdHT1pFeWpjSVU1WDBh?=
 =?utf-8?B?emRPK3ZvTytCcUdLQXNBWWg0Ky9LdkhhUzM4N3c2RFR3WTBCeWVnWFI3NVEw?=
 =?utf-8?B?NWVVTmFxaFRYdWk3TXFKM0J2dzl4SFZIT3hOcTVYTVBjd0pGbk1jTVJ6a0x4?=
 =?utf-8?B?aCtjU0xzN2pXRkZEYUVwelZqdWJQdTdRb3Vic2tqMUgrRkVKVko4UmFHc1J4?=
 =?utf-8?B?UTNzeDljcVVKYnNRaENQYUhMMytZV3A2WHVwZVczaytna0Jnc0p3NXZNSkZa?=
 =?utf-8?B?M2FrQkNKQk8yUG5jTitiK0lQVmJFUnA4RmpaRklCSko0ZkxmOVVHUnFzRlZ1?=
 =?utf-8?B?ODE4UXdURjY4dTVEUXhsLzFEMlBYdjJSTENpby9TWTVQSVBkVmlTM0lNbjNO?=
 =?utf-8?B?aVNWSDdoVFlhU0R1MlgzenM5Si9ncEd1SUtob2xrZmhxVjJZaVhaUnlNNlgw?=
 =?utf-8?B?QzdWTW1YNmVFNDBqNGdLMHVNbTFHRjRZVGErUjZZYTh4UENackhvdjVNMytJ?=
 =?utf-8?B?MDVScS9XbVlGSHV3cXFJc0V1bHJPVWg5TVJ2RU92UXhmUm15ZEE0NFYyUWR6?=
 =?utf-8?B?NzhtblFpN0pLa2xkeExaWXA0UmZGelJuOTRCd3h2eEZoN3I4Y3FPMW54T0ZL?=
 =?utf-8?B?RGhpMzFTUWo2SXlpYk4ydWxqQkhiOWFEMmpFSC9sRlYvRXFtL2hDdnFraWk2?=
 =?utf-8?B?VVlCaGtSeENoZlhvcXpLYk8xL2xiU1pnUWthVE40SzVOZzJOVS9iY1diZ2I4?=
 =?utf-8?B?Y3EyOWoyV1laQjZpNG9JS01SMjh4dUloL09ZenNuVmsxci9qbkFxSGNKUitY?=
 =?utf-8?B?YkNMZWlhVmg5clZEcVNScGlIamVDUVRJZlovc281WHFvZUFVT25pMFZXeURU?=
 =?utf-8?B?L1N1bk5oU0poVDQxSVh1R1BhRkpQQnpidlZIQTBTY2UwL2RzSnRCcmk0R2tE?=
 =?utf-8?B?WDdndUdNTWdaKytVZW1aMmNKZjlmQkp6VHMzeFlLVGZMblg3TkpYRDdEd255?=
 =?utf-8?B?cWNUTnlLeGZYcXAzU1lCSW9WYU5QRFV4bzNKb2RRV29ld2ZTN1dRZng1eWxT?=
 =?utf-8?B?NzF5bVlVZVFuTWg5dE1qeUJHZmNXNUF6SDlCeXRHemdMR3F4UkhUMTZUR0pj?=
 =?utf-8?B?MzlVemRTS296YzZLaUFmZDJBL0kxS3ZPTUF3QldOSEJvMVI4N3NjRklCUU90?=
 =?utf-8?B?UllPblBwL0N4SFVocERpM1ZqeWsrTzNoUDZLL3QvR282c3pNeVk5cmRib29F?=
 =?utf-8?B?SzNkeTBDd0p5WDdTZUlJU3lzUzNMbldUcXVSOVRYaVl4dy9BMXJqeUQrWU9j?=
 =?utf-8?B?WlhSaFBNQTkrQnlKTEJwaCttTWVyank3L0s0QmJDYUkveXAvd3dYbFZLZGRH?=
 =?utf-8?B?OGpzNFp0WFhXQ2ovaU9KNStjdk0vK3JSY1J5OVI2amJldjFKWHdaYWtDb3Nk?=
 =?utf-8?B?ak5HbzhFY2xqeHJFM3BRT3k5QjMyNXFaMVBTRkcySnBoQ3U4cTgxQ0JldkRZ?=
 =?utf-8?B?YzBQcWppeWV0aVpFQnl1YVF6MnBHQzYvU0V4SExpM2ZyMG9ub2pGeUgxeitu?=
 =?utf-8?B?RXM3TG9NbzhNRFJvSTFGR0RkOS9tYkxKcDduaVFYWVQ5V05GYzFIR1VUY2ta?=
 =?utf-8?B?KzQzOWZwMkthUTVUYU90Vi9yM0NWeEZBR2tkTkdUb21FQUlDMnJ1bEpyUXRU?=
 =?utf-8?B?MEFBWUh1STFrTWp4cEZrWEMxanBFWmgvbi9lNzNhckJJbS9KSGlOWno4WlBR?=
 =?utf-8?B?YmcrT2Rpd2o2K1N5bUpxV093VXVybkN5U044TmllaUV3TXR4WHgyaXEvUy85?=
 =?utf-8?B?OGlnT2pJbjZtbFV4MDlXRXB4OXVIRUVSSjdTeXloWFExL0dJcE9tczdGMml2?=
 =?utf-8?B?Q2VIK0VMMnZUOXdzRTE5ZUFDTmRKdjlDQi9WUkprSDdRQmEvaVd3d3lMbVg0?=
 =?utf-8?B?TUxQSGRIY2xZK0lYb2F5bUtDVGFOakZ1QUNVeEp2cUJVdER3a3Y5N1pySk5y?=
 =?utf-8?B?MG5KVmVaeUVQQlZuWWhEZHdBemRMb1JPSzNEUkRIeXNPZkRKejBSWFBlQUNn?=
 =?utf-8?B?cEdsY2V2eXV1Wk9IVkcxNk9OUjRZbk9Kd2piT3BBUUhuN0J4eSswZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fcdb88-5021-488e-c5bb-08df4af9054b
X-MS-Exchange-CrossTenant-AuthSource: DS5PR12MB052986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:35:50.7380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlPGef0HAts64GVGaGZT1Y24o49cmT8dYijYm64MbJMK9RH7t+CkWdwSus3EwgtA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9553



On 11/19/26 06:44, Amit Kumar Mahapatra wrote:
> Describe the System Monitor (SysMon) block in the PMC, which provides
> on-chip voltage and temperature monitoring, and use its device
> temperature channel as the sensor for a thermal zone.
> 
> SysMon channel 0 is the current maximum temperature across all active
> satellites.
> 
> The thermal zone has a critical trip at 125C. Passive trips and cooling
> maps, voltage channels and per-satellite temperature channels depend on
> the design and are left to board files.
> 
> SysMon availability depends on the design configuration, and it may not
> be accessible over MMIO, so the SysMon node is disabled by default.
> Boards that use it enable it.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
> Changes in v2:
> - Split out of the versal-sysmon series and sent separately, as there
>    is no dependency on it (Michal).
> - Add status = "disabled" to the sysmon0 node (Michal).
> 
> v1: https://lore.kernel.org/all/20261102122112.1723130-6-amit.kumar-mahapatra@amd.com/
> 
>   arch/arm64/boot/dts/xilinx/versal-net.dtsi | 30 ++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> index 9b74e59fd64a..fd976a577b18 100644
> --- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> @@ -706,6 +706,28 @@ versal_fpga: versal-fpga {
>   		compatible = "xlnx,versal-fpga";
>   	};
>   
> +	sysmon_temp: thermal-sensor {
> +		compatible = "generic-adc-thermal";
> +		#thermal-sensor-cells = <0>;
> +		io-channels = <&sysmon0 0>;
> +		io-channel-names = "sensor-channel";
> +	};
> +
> +	thermal-zones {
> +		versal_thermal: versal-thermal {
> +			polling-delay = <1000>; /* milliseconds */
> +			thermal-sensors = <&sysmon_temp>;
> +
> +			trips {
> +				ot_crit: ot-crit {
> +					temperature = <125000>; /* millicelsius */
> +					hysteresis = <0>; /* millicelsius */
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +
>   	amba: axi {
>   		compatible = "simple-bus";
>   		bootph-all;
> @@ -1004,6 +1026,14 @@ spi1: spi@f1970000 {
>   			clock-names = "ref_clk", "pclk";
>   		};
>   
> +		sysmon0: sysmon@f1270000 {
> +			compatible = "xlnx,versal-sysmon";
> +			status = "disabled";
> +			reg = <0 0xf1270000 0 0x4000>;
> +			interrupts = <0 202 4>;
> +			#io-channel-cells = <1>;
> +		};
> +
>   		ttc0: timer@f1dc0000 {
>   			compatible = "cdns,ttc";
>   			status = "disabled";

Applied.
M
